@implementation ISDeviceInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_29);
  return (id)sharedInstance_sharedInstance_6;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (CGSize)homeScreenIconSize
{
  int v3;
  int v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  NSObject *v12;
  uint8_t v13[16];
  CGSize result;

  v3 = -[ISDeviceInfo deviceClass](self, "deviceClass");
  v4 = -[ISDeviceInfo screenClass](self, "screenClass");
  v5 = 128.0;
  v6 = 128.0;
  switch(v3)
  {
    case 1:
      if (v4 > 0x19 || ((1 << v4) & 0x20C0000) == 0)
        goto LABEL_5;
      v7 = 0x4050000000000000;
      goto LABEL_6;
    case 3:
      v8 = 60.0;
      if (v4 == 20)
        v8 = 68.0;
      if (v4 == 11)
        v5 = 68.0;
      else
        v5 = v8;
      if (v4 == 11)
        v6 = 68.0;
      else
        v6 = v8;
      goto LABEL_17;
    case 4:
      v6 = 400.0;
      v5 = 240.0;
      goto LABEL_17;
    case 6:
      if (v4 > 25)
      {
        switch(v4)
        {
          case 26:
            v5 = 51.0;
            goto LABEL_7;
          case 27:
            v7 = 0x4047000000000000;
            goto LABEL_6;
          case 29:
            v7 = 0x404B000000000000;
            goto LABEL_6;
        }
      }
      else
      {
        if ((v4 - 12) < 2)
        {
          v7 = 0x4044000000000000;
          goto LABEL_6;
        }
        if (v4 == 16)
        {
          v7 = 0x4046000000000000;
          goto LABEL_6;
        }
        if (v4 == 17)
        {
          v7 = 0x4049000000000000;
LABEL_6:
          v5 = *(double *)&v7;
LABEL_7:
          v6 = v5;
          goto LABEL_17;
        }
      }
      v11 = (double *)MEMORY[0x1E0C9D820];
      _ISDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1AA928000, v12, OS_LOG_TYPE_DEFAULT, "No known home screen icon size", v13, 2u);
      }
      v6 = *v11;
      v5 = v11[1];

LABEL_17:
      v9 = v6;
      v10 = v5;
      result.height = v10;
      result.width = v9;
      return result;
    case 11:
      goto LABEL_17;
    default:
LABEL_5:
      v7 = 0x404E000000000000;
      goto LABEL_6;
  }
}

- (unint64_t)ideom
{
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[ISDeviceInfo deviceClass](self, "deviceClass") - 1;
  if (v3 < 0xB && ((0x42Fu >> v3) & 1) != 0)
    return qword_1AA977178[v3];
  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[ISDeviceInfo deviceClass](self, "deviceClass");
    _os_log_impl(&dword_1AA928000, v4, OS_LOG_TYPE_DEFAULT, "Unknown device class: %d", (uint8_t *)v6, 8u);
  }

  return 2;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)screenClass
{
  return self->_screenClass;
}

void __30__ISDeviceInfo_sharedInstance__block_invoke()
{
  ISDeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(ISDeviceInfo);
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;

}

- (ISDeviceInfo)init
{
  ISDeviceInfo *v2;
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ISDeviceInfo;
  v2 = -[ISDeviceInfo init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v2->_deviceClass = objc_msgSend(v3, "intValue");
    MGGetFloat32Answer();
    v2->_screenScale = v4;
    v2->_screenClass = MGGetSInt32Answer();
    MGCopyAnswer();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("ArtworkDeviceSubType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_deviceSubtype = objc_msgSend(v6, "integerValue");

    }
    else
    {
      v2->_deviceSubtype = 0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("ArtworkDeviceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    if (v8)
      v8 = objc_msgSend(v7, "integerValue");
    v2->_rawDeviceIdiom = v8;

  }
  return v2;
}

- (CGSize)largeHomeScreenIconSize
{
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[ISDeviceInfo deviceClass](self, "deviceClass");
  v4 = -[ISDeviceInfo screenClass](self, "screenClass");
  if (v3 == 3)
  {
    v5 = 83.5;
    v6 = 76.0;
    if (v4 == 20)
      v6 = 83.5;
    if (v4 != 11)
      v5 = v6;
    v7 = v5;
  }
  else
  {
    -[ISDeviceInfo homeScreenIconSize](self, "homeScreenIconSize");
  }
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)messagesLauncherIconSize
{
  int v3;
  int v4;
  double v5;
  double v6;
  CGSize result;

  v3 = -[ISDeviceInfo deviceClass](self, "deviceClass");
  v4 = -[ISDeviceInfo screenClass](self, "screenClass");
  if (v3 == 3)
  {
    v5 = 55.0;
    v6 = 74.0;
    if (v4 != 11 && v4 != 20)
    {
      v5 = 50.0;
      v6 = 67.0;
    }
  }
  else
  {
    v5 = 45.0;
    v6 = 60.0;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (int64_t)rawDeviceIdiom
{
  return self->_rawDeviceIdiom;
}

- (unint64_t)deviceSubtype
{
  return self->_deviceSubtype;
}

@end
