@implementation MRUOutputDeviceAsset

- (int64_t)type
{
  return self->_type;
}

- (MRUOutputDeviceAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5 type:(int64_t)a6 deviceCount:(unint64_t)a7
{
  MRUOutputDeviceAsset *v9;
  MRUOutputDeviceAsset *v10;
  uint64_t v11;
  NSString *localizedDisplayTitle;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MRUOutputDeviceAsset;
  v9 = -[MRUAsset initWithPackageAsset:symbolName:image:](&v14, sel_initWithPackageAsset_symbolName_image_, a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_type = a6;
    -[MRUOutputDeviceAsset localizedDisplayTitleForAssetType:deviceCount:](v9, "localizedDisplayTitleForAssetType:deviceCount:", a6, a7);
    v11 = objc_claimAutoreleasedReturnValue();
    localizedDisplayTitle = v10->_localizedDisplayTitle;
    v10->_localizedDisplayTitle = (NSString *)v11;

  }
  return v10;
}

- (MRUOutputDeviceAsset)initWithOutputDeviceRoute:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  MRUOutputDeviceAsset *v18;
  int64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MRUOutputDeviceAsset outputDeviceAssetTypeForOutputDeviceRoute:](self, "outputDeviceAssetTypeForOutputDeviceRoute:", v4);
  if (v5)
  {
    v20 = v5;
    v21 = v4;
    objc_msgSend(v4, "outputDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = objc_alloc(MEMORY[0x1E0CC22F8]);
          v26 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithOutputDevices:", v15);
          objc_msgSend(v7, "addObject:", v16);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0CC2318], "_symbolNameForRoutes:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MRUOutputDeviceAsset initWithPackageAsset:symbolName:image:type:deviceCount:](self, "initWithPackageAsset:symbolName:image:type:deviceCount:", 0, v17, 0, v20, objc_msgSend(v7, "count"));

    v18 = self;
    v4 = v21;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "speakerAsset");
    v18 = (MRUOutputDeviceAsset *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (MRUOutputDeviceAsset)speakerAsset
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  if (+[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled"))
    v5 = v4 == 1;
  else
    v5 = 0;
  if (v5)
  {
    v8 = CFSTR("VolumeSemiboldRTL");
  }
  else
  {
    v6 = +[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled");
    v7 = CFSTR("Volume");
    if (v4 == 1)
      v7 = CFSTR("VolumeRTL");
    if (v6)
      v8 = CFSTR("VolumeSemibold");
    else
      v8 = v7;
  }
  +[MRUCAPackageAsset packageNamed:](MRUCAPackageAsset, "packageNamed:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageAsset:symbolName:image:type:deviceCount:", v9, 0, 0, 0, 1);

  return (MRUOutputDeviceAsset *)v10;
}

+ (MRUOutputDeviceAsset)inCallAsset
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[MRUAssetsProvider phone](MRUAssetsProvider, "phone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPackageAsset:symbolName:image:type:deviceCount:", 0, 0, v3, 1, 1);

  return (MRUOutputDeviceAsset *)v4;
}

+ (MRUOutputDeviceAsset)sharingAsset
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[MRUAssetsProvider sharing](MRUAssetsProvider, "sharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPackageAsset:symbolName:image:type:deviceCount:", 0, 0, v3, 2, 1);

  return (MRUOutputDeviceAsset *)v4;
}

- (BOOL)isEqual:(id)a3
{
  MRUOutputDeviceAsset *v4;
  MRUOutputDeviceAsset *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  objc_super v13;

  v4 = (MRUOutputDeviceAsset *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)MRUOutputDeviceAsset;
      v6 = -[MRUAsset isEqual:](&v13, sel_isEqual_, v5);
      if (-[MRUOutputDeviceAsset type](v5, "type") == self->_type)
        v7 = v6;
      else
        v7 = 0;
      -[MRUOutputDeviceAsset localizedDisplayTitle](v5, "localizedDisplayTitle");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 == self->_localizedDisplayTitle)
        v10 = 1;
      else
        v10 = -[NSString isEqual:](v8, "isEqual:");
      v11 = v7 & v10;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (int64_t)kind
{
  void *v2;
  int64_t v3;

  -[MRUAsset packageAsset](self, "packageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (CCUICAPackageDescription)packageDescription
{
  void *v2;
  void *v3;

  -[MRUAsset packageAsset](self, "packageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "packageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CCUICAPackageDescription *)v3;
}

- (int64_t)outputDeviceAssetTypeForOutputDeviceRoute:(id)a3
{
  id v3;
  int64_t v4;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isAirpodsRoute") & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isBeatsSoloRoute") & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isB419Route") & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isBeatsStudioRoute") & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isBeatsXRoute") & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isB494Route") & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isB507Route") & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "isB607Route") & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isPowerbeatsRoute") & 1) != 0
         || (objc_msgSend(v3, "isB444Route") & 1) != 0
         || (objc_msgSend(v3, "isB364Route") & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isB372Route") & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isBeatsLegacyRoute") & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isCarplayRoute") & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isHearingDeviceRoute") & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    if ((objc_msgSend(v3, "isDeviceSpeakerRoute") & 1) == 0)
    {
      if ((objc_msgSend(v3, "isJ327Route") & 1) != 0)
      {
        v4 = 7;
        goto LABEL_22;
      }
      if ((objc_msgSend(v3, "isAirPlayRoute") & 1) != 0
        || (objc_msgSend(v3, "isClusterRoute") & 1) != 0
        || (objc_msgSend(v3, "isMacRoute") & 1) != 0)
      {
        v4 = 19;
        goto LABEL_22;
      }
      v6 = objc_msgSend(v3, "routeSubtype");
      if ((unint64_t)(v6 - 2) <= 0x13)
      {
        v4 = qword_1AAAD56D0[v6 - 2];
        goto LABEL_22;
      }
    }
    v4 = 0;
  }
LABEL_22:

  return v4;
}

- (id)localizedDisplayTitleForAssetType:(int64_t)a3 deviceCount:(unint64_t)a4
{
  __CFString *v4;

  v4 = &stru_1E581FBA8;
  switch(a3)
  {
    case 0:
      +[MRUStringsProvider volumeSpeaker](MRUStringsProvider, "volumeSpeaker");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[MRUStringsProvider volumeSharing](MRUStringsProvider, "volumeSharing");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[MRUStringsProvider volumeCarplay](MRUStringsProvider, "volumeCarplay");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[MRUStringsProvider volumeHearingDevice](MRUStringsProvider, "volumeHearingDevice");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[MRUStringsProvider volumeHeadphones](MRUStringsProvider, "volumeHeadphones");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[MRUStringsProvider volumeBluetooth](MRUStringsProvider, "volumeBluetooth");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[MRUStringsProvider volumeAirPods](MRUStringsProvider, "volumeAirPods");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[MRUStringsProvider volumeBeats](MRUStringsProvider, "volumeBeats");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[MRUStringsProvider volumeBeatsSolo](MRUStringsProvider, "volumeBeatsSolo");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      +[MRUStringsProvider volumeBeatsSoloPro](MRUStringsProvider, "volumeBeatsSoloPro");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
    case 16:
    case 18:
      +[MRUStringsProvider volumeBeatsStudio](MRUStringsProvider, "volumeBeatsStudio");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      +[MRUStringsProvider volumeBeatsX](MRUStringsProvider, "volumeBeatsX");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      +[MRUStringsProvider volumePowerbeats](MRUStringsProvider, "volumePowerbeats");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      +[MRUStringsProvider volumeBeatsFlex](MRUStringsProvider, "volumeBeatsFlex");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      +[MRUStringsProvider volumeB494](MRUStringsProvider, "volumeB494");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      +[MRUStringsProvider volumeAirPlay](MRUStringsProvider, "volumeAirPlay");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      +[MRUStringsProvider volumeAppleTV](MRUStringsProvider, "volumeAppleTV");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      +[MRUStringsProvider volumeTVWithDeviceCount:](MRUStringsProvider, "volumeTVWithDeviceCount:", a4);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      +[MRUStringsProvider volumeHomePod](MRUStringsProvider, "volumeHomePod");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (NSString)localizedDisplayTitle
{
  return self->_localizedDisplayTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayTitle, 0);
}

@end
