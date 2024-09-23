@implementation MKSearchFoundationResult

- (MKSearchFoundationResult)initWithMapsData:(id)a3 iconSize:(unint64_t)a4 bundleID:(id)a5
{
  id v9;
  id v10;
  MKSearchFoundationResult *v11;
  MKSearchFoundationResult *v12;
  uint64_t v13;
  MKMapItem *mapItem;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MKSearchFoundationResult;
  v11 = -[MKSearchFoundationResult init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapsData, a3);
    +[MKMapItem mapItemWithSerializedPlaceData:](MKMapItem, "mapItemWithSerializedPlaceData:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    mapItem = v12->_mapItem;
    v12->_mapItem = (MKMapItem *)v13;

    v12->_iconSize = a4;
    objc_storeStrong((id *)&v12->_bundleID, a5);
    -[MKSearchFoundationResult _commonInit](v12, "_commonInit");
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);

  -[MKLocationManager stopLocationUpdateWithObserver:](self->_locationManager, "stopLocationUpdateWithObserver:", self);
  if (self->_attributionObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_attributionObserver);

  }
  v5.receiver = self;
  v5.super_class = (Class)MKSearchFoundationResult;
  -[MKSearchFoundationResult dealloc](&v5, sel_dealloc);
}

- (void)_commonInit
{
  _BOOL4 v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  self->_optionSmallerScreen = -[MKSearchFoundationResult _isSmallerScreen](self, "_isSmallerScreen");
  v3 = -[MKMapItem _hasMUID](self->_mapItem, "_hasMUID");
  v4 = 1;
  if (!v3)
    v4 = 2;
  self->_mksfResultType = v4;
  v5 = (void *)objc_opt_new();
  v6 = -[MKSearchFoundationRichText initRichTextTitleWithMapItem:resultsType:]([MKSearchFoundationRichText alloc], "initRichTextTitleWithMapItem:resultsType:", self->_mapItem, self->_mksfResultType);
  objc_msgSend(v5, "setTitle:", v6);

  -[MKSearchFoundationResult _defaultRichTextItems](self, "_defaultRichTextItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptions:", v7);

  if (-[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand"))
    -[MKSearchFoundationResult _businessCategory](self, "_businessCategory");
  else
    -[MKSearchFoundationResult _businessReviewText](self, "_businessReviewText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_fourthLineDisplayedText, v8);

  objc_msgSend(v5, "setFootnote:", self->_fourthLineDisplayedText);
  v9 = -[MKSearchFoundationImage initIconWithSize:mapItem:]([MKSearchFoundationImage alloc], "initIconWithSize:mapItem:", self->_iconSize, self->_mapItem);
  objc_msgSend(v5, "setThumbnail:", v9);

  +[MKSearchFoundationActionItem defaultActionItemDestinationMapItemData:mapItem:](MKSearchFoundationActionItem, "defaultActionItemDestinationMapItemData:mapItem:", self->_mapsData, self->_mapItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAction:", v10);

  -[MKSearchFoundationResult _populateButtonItemsAndCommands](self, "_populateButtonItemsAndCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonItems:", v11);

  v12 = (void *)objc_opt_new();
  -[MKSearchFoundationResult setInlineCard:](self, "setInlineCard:", v12);

  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSearchFoundationResult inlineCard](self, "inlineCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCardSections:", v13);

}

- (id)_populateButtonItemsAndCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKMapItem phoneNumber](self->_mapItem, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D8C208]);
    -[MKMapItem phoneNumber](self->_mapItem, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneNumber:", v6);

    -[MKSearchFoundationResult _populateButtonItem:imageName:command:](self, "_populateButtonItem:imageName:command:", 0, 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (self->_mapsData && -[MKMapItem _canGetDirections](self->_mapItem, "_canGetDirections"))
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Go"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0D8C1C8]);
    objc_msgSend(v9, "setMapsData:", self->_mapsData);
    -[MKSearchFoundationResult _populateButtonItem:imageName:command:](self, "_populateButtonItem:imageName:command:", v8, CFSTR("arrow.triangle.turn.up.right.circle.fill"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[MKMapItem _messageURLString](self->_mapItem, "_messageURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Message"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0D8C580]);
    v14 = (void *)MEMORY[0x1E0D8C5E0];
    v15 = (void *)MEMORY[0x1E0C99E98];
    -[MKMapItem _messageURLString](self->_mapItem, "_messageURLString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "punchoutWithURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPunchout:", v18);

    -[MKSearchFoundationResult _populateButtonItem:imageName:command:](self, "_populateButtonItem:imageName:command:", v12, CFSTR("message.fill"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  -[MKMapItem _quickLinks](self->_mapItem, "_quickLinks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[MKMapItem _quickLinks](self->_mapItem, "_quickLinks");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSearchFoundationResult _populateAppClipData:](self, "_populateAppClipData:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v3, "addObject:", v23);

  }
  MKGetMKSearchFoundationResultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v26 = 134283521;
    v27 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_INFO, "Buttom items count: %{private}lu", (uint8_t *)&v26, 0xCu);
  }

  return v3;
}

- (id)_populateAppClipData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  MKSearchFoundationResult *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MKGetMKSearchFoundationResultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134283521;
    v36 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Link count : %{private}ld", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v29 = self;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == 2)
        {
          objc_msgSend(v11, "bundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0D8C610]);
            v19 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v11, "URLString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLWithString:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setUrl:", v21);

            objc_msgSend(v11, "bundleID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setApplicationBundleIdentifier:", v22);

            objc_msgSend(v11, "imageName");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            MKGetMKSearchFoundationResultLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = objc_msgSend(v11, "type");
              *(_DWORD *)buf = 134283521;
              v36 = v25;
              _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_INFO, "Returning Link type : %{private}ld", buf, 0xCu);
            }

            objc_msgSend(v11, "title");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              v27 = v23;
            else
              v27 = CFSTR("appclip");
            -[MKSearchFoundationResult _populateButtonItem:imageName:command:](v29, "_populateButtonItem:imageName:command:", v26, v27, v18);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
        }
        MKGetMKSearchFoundationResultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = objc_msgSend(v11, "type");
          *(_DWORD *)buf = 134283521;
          v36 = v14;
          _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "Link type : %{private}ld", buf, 0xCu);
        }

        MKGetMKSearchFoundationResultLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "URLString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v36 = (uint64_t)v16;
          _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "Link : %{private}@", buf, 0xCu);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_23:

  return v17;
}

- (id)_populateButtonItem:(id)a3 imageName:(id)a4 command:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D8C2A0]);
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setTitle:", v7);
  if (v8)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setSymbolName:", v8);
    objc_msgSend(v12, "setIsTemplate:", 1);
    objc_msgSend(v11, "setImage:", v12);

  }
  objc_msgSend(v11, "setCommand:", v9);
  MKGetMKSearchFoundationResultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v20 = 138477827;
    v21 = v7;
    _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "Title: %{private}@", (uint8_t *)&v20, 0xCu);
  }

  MKGetMKSearchFoundationResultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = 138477827;
    v21 = v8;
    _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_INFO, "Image name: %{private}@", (uint8_t *)&v20, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    MKGetMKSearchFoundationResultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138477827;
      v21 = v16;
      _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "Url: %{private}@", (uint8_t *)&v20, 0xCu);

    }
    MKGetMKSearchFoundationResultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "applicationBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138477827;
      v21 = v18;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_INFO, "Application bundle identifier: %{private}@", (uint8_t *)&v20, 0xCu);

    }
  }

  return v11;
}

- (id)_defaultRichTextItems
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  MKSearchFoundationBusinessHoursAndDistanceRichText *v7;
  MKSearchFoundationBusinessHoursAndDistanceRichText *thirdLineDisplayedText;
  MKSearchFoundationBusinessHoursAndDistanceRichText *v9;
  MKSearchFoundationBusinessHoursAndDistanceRichText *v10;
  void *v11;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand");
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[MKSearchFoundationResult _businessAddress](self, "_businessAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_secondLineDisplayedText, v5);
  if (!v4)

  if (self->_secondLineDisplayedText)
    objc_msgSend(v3, "addObject:");
  if (-[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand"))
  {
    -[MKMapItem url](self->_mapItem, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MKSearchFoundationResult _brandURL](self, "_brandURL");
      v7 = (MKSearchFoundationBusinessHoursAndDistanceRichText *)objc_claimAutoreleasedReturnValue();
      thirdLineDisplayedText = self->_thirdLineDisplayedText;
      self->_thirdLineDisplayedText = v7;

      objc_msgSend(v3, "addObject:", self->_thirdLineDisplayedText);
    }
  }
  else
  {
    -[MKSearchFoundationResult _businessHoursAndDistance](self, "_businessHoursAndDistance");
    v9 = (MKSearchFoundationBusinessHoursAndDistanceRichText *)objc_claimAutoreleasedReturnValue();
    v10 = self->_thirdLineDisplayedText;
    self->_thirdLineDisplayedText = v9;

    if (self->_thirdLineDisplayedText)
      objc_msgSend(v3, "addObject:");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__locationApprovalDidChange, MKLocationManagerApprovalDidChangeNotification, 0);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MKSearchFoundationResult__defaultRichTextItems__block_invoke;
    block[3] = &unk_1E20D7D98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return v3;
}

uint64_t __49__MKSearchFoundationResult__defaultRichTextItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 848);
  *(_QWORD *)(v3 + 848) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 848);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/CoreParsec.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectiveBundle:", v6);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "startLocationUpdateWithObserver:");
}

- (id)_appleRatingsDescription
{
  MKMapItem *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = self->_mapItem;
  _MKLocalizedStringFromThisBundle(CFSTR("%lu Recommend [UGC]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("(number of people)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MKMapItem _geoMapItem](v2, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_overallAppleRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "percentage");
  objc_msgSend(v5, "localizedStringWithFormat:", v3, (unint64_t)(v8 * 100.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[MKMapItem _geoMapItem](v2, "_geoMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_overallAppleRating");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)objc_msgSend(v12, "numberOfRatingsUsedForScore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_businessReviewText
{
  MKSearchFoundationBusinessReviewRichText *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MKMapItem *mapItem;
  void *v22;
  id v23;
  void *v24;
  id attributionObserver;
  MKSearchFoundationBusinessReviewRichText *v26;
  _QWORD v28[4];
  MKSearchFoundationBusinessReviewRichText *v29;
  id v30;
  id v31;
  id v32;
  id location;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MKSearchFoundationRichText initWithString:]([MKSearchFoundationBusinessReviewRichText alloc], "initWithString:", &stru_1E20DFC00);
  if (-[MKMapItem _hasUserRatingScore](self->_mapItem, "_hasUserRatingScore")
    && (-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_hasAppleRatings"),
        v4,
        v5))
  {
    -[MKSearchFoundationResult _appleRatingsDescription](self, "_appleRatingsDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSearchFoundationRichText setText:](v3, "setText:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0D8C780]);
    objc_msgSend(v7, "setSymbolName:", CFSTR("hand.thumbsup.fill"));
    objc_msgSend(v7, "setIsTemplate:", 1);
    v34[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichText setIcons:](v3, "setIcons:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (-[MKMapItem _hasUserRatingScore](self->_mapItem, "_hasUserRatingScore"))
    {
      -[MKMapItem _normalizedUserRatingScore](self->_mapItem, "_normalizedUserRatingScore");
      -[SFRichText setStarRating:](v3, "setStarRating:", v9);
      -[MKMapItem _reviewsAttribution](self->_mapItem, "_reviewsAttribution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "providerName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      v13 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
      {
        _MKLocalizedStringFromThisBundle(CFSTR("Place_Reviews_On_Provider"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MKMapItem _sampleSizeForUserRatingScore](self->_mapItem, "_sampleSizeForUserRatingScore");
        -[MKMapItem _reviewsDisplayName](self->_mapItem, "_reviewsDisplayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
          objc_msgSend(v7, "insertObject:atIndex:", v17, 0);
        else
          objc_msgSend(v7, "addObject:", v17);
        -[MKSearchFoundationBusinessReviewRichText setReviewResolved:](v3, "setReviewResolved:", 1);

      }
      else
      {
        _MKLocalizedStringFromThisBundle(CFSTR("Place_Reviews_Number_Parsec"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v18, -[MKMapItem _sampleSizeForUserRatingScore](self->_mapItem, "_sampleSizeForUserRatingScore"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v19);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        mapItem = self->_mapItem;
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __47__MKSearchFoundationResult__businessReviewText__block_invoke;
        v28[3] = &unk_1E20DC850;
        objc_copyWeak(&v32, &location);
        v29 = v3;
        v30 = v7;
        v23 = v19;
        v31 = v23;
        objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", CFSTR("MKMapItemDidResolveAttribution"), mapItem, v22, v28);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        attributionObserver = self->_attributionObserver;
        self->_attributionObserver = v24;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

      }
    }
    if (objc_msgSend(v7, "count"))
    {
      +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSearchFoundationRichText setText:](v3, "setText:", v8);
    }
    else
    {
      v8 = v3;
      v3 = 0;
    }
  }

  v26 = v3;
  return v26;
}

void __47__MKSearchFoundationResult__businessReviewText__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", WeakRetained[109]);

    v5 = (void *)WeakRetained[109];
    WeakRetained[109] = 0;

    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_reviewsAttribution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "resolveReviewStringWithProviderNameByMapItem:lines:temporaryReviewString:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(v10, "setStarRating:", 0.0);
      objc_msgSend(*(id *)(a1 + 32), "resolveReviewStringWithProviderNameNotFoundByMapItem:lines:temporaryReviewString:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }

  }
}

- (id)_businessAddress
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  MKSearchFoundationRichText *v8;
  void *v9;
  MKSearchFoundationRichText *v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MKMapItem _shortAddress](self->_mapItem, "_shortAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _geoAddress](self->_mapItem, "_geoAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "singleLineAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MKGetMKSearchFoundationResultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v5;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "MapItem single line address: %{private}@", buf, 0xCu);
  }

  if (objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
  {
    v12 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v7, "count"))
  {
    v8 = [MKSearchFoundationRichText alloc];
    +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MKSearchFoundationRichText initWithString:](v8, "initWithString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_businessCategory
{
  void *v3;
  uint64_t v4;
  MKSearchFoundationRichText *v5;
  void *v6;
  void *v7;
  void *v8;
  MKSearchFoundationRichText *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  v5 = [MKSearchFoundationRichText alloc];
  -[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MKSearchFoundationRichText initWithString:](v5, "initWithString:", v8);

  return v9;
}

- (id)_brandURL
{
  void *v2;
  void *v3;
  MKSearchFoundationBusinessHoursAndDistanceRichText *v4;

  -[MKMapItem url](self->_mapItem, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = -[MKSearchFoundationRichText initWithString:]([MKSearchFoundationBusinessHoursAndDistanceRichText alloc], "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_businessHoursAndDistance
{
  MKSearchFoundationBusinessHoursAndDistanceRichText *v3;
  NSMutableArray *v4;
  NSMutableArray *thirdLineText;

  v3 = -[MKSearchFoundationRichText initWithString:]([MKSearchFoundationBusinessHoursAndDistanceRichText alloc], "initWithString:", &stru_1E20DFC00);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  thirdLineText = self->_thirdLineText;
  self->_thirdLineText = v4;

  -[MKSearchFoundationBusinessHoursAndDistanceRichText resolveBusinessHoursByMapItem:lines:](v3, "resolveBusinessHoursByMapItem:lines:", self->_mapItem, self->_thirdLineText);
  return v3;
}

+ (id)styledStringFromStringArray:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v3, "objectEnumerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "userInterfaceLayoutDirection") == 1)
        objc_msgSend(v3, "reverseObjectEnumerator");
      else
        objc_msgSend(v3, "objectEnumerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _MKLocalizedStringFromThisBundle(CFSTR("BULLET_STRING_COMPONENT_KEY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v5, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v6, "appendString:", v9);
    objc_msgSend(v5, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      do
      {
        -[__CFString appendString:](v6, "appendString:", v8);
        v11 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR("%@"));
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          -[__CFString replaceCharactersInRange:withString:](v6, "replaceCharactersInRange:withString:", v11, v12, v10);
        objc_msgSend(v5, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
      while (v13);
    }

  }
  else
  {
    v6 = &stru_1E20DFC00;
  }

  return v6;
}

- (BOOL)_isSmallerScreen
{
  void *v2;
  double v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 <= 375.0;

  return v4;
}

- (void)_locationApprovalDidChange
{
  _BOOL4 v3;
  MKLocationManager *locationManager;

  v3 = -[MKLocationManager isLocationServicesAvailable](self->_locationManager, "isLocationServicesAvailable");
  locationManager = self->_locationManager;
  if (v3)
    -[MKLocationManager startLocationUpdateWithObserver:](locationManager, "startLocationUpdateWithObserver:", self);
  else
    -[MKLocationManager stopLocationUpdateWithObserver:](locationManager, "stopLocationUpdateWithObserver:", self);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v11, "lastLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    v8 = v7;
    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    v9 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8);
    objc_msgSend(v5, "distanceFromLocation:", v9);
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, self->_optionSmallerScreen, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSearchFoundationBusinessHoursAndDistanceRichText resolveDistanceString:lines:](self->_thirdLineDisplayedText, "resolveDistanceString:lines:", v10, self->_thirdLineText);
    objc_msgSend(v11, "stopLocationUpdateWithObserver:", self);

  }
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  -[MKSearchFoundationBusinessHoursAndDistanceRichText resolveDistanceNotFound](self->_thirdLineDisplayedText, "resolveDistanceNotFound", a3, a4);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
  objc_storeStrong((id *)&self->_mapsData, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (MKSearchFoundationRichText)secondLineDisplayedText
{
  return self->_secondLineDisplayedText;
}

- (void)setSecondLineDisplayedText:(id)a3
{
  objc_storeStrong((id *)&self->_secondLineDisplayedText, a3);
}

- (id)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (MKSearchFoundationBusinessHoursAndDistanceRichText)thirdLineDisplayedText
{
  return self->_thirdLineDisplayedText;
}

- (void)setThirdLineDisplayedText:(id)a3
{
  objc_storeStrong((id *)&self->_thirdLineDisplayedText, a3);
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (unint64_t)mksfResultType
{
  return self->_mksfResultType;
}

- (void)setMksfResultType:(unint64_t)a3
{
  self->_mksfResultType = a3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (MKSearchFoundationRichText)fourthLineDisplayedText
{
  return self->_fourthLineDisplayedText;
}

- (void)setFourthLineDisplayedText:(id)a3
{
  objc_storeStrong((id *)&self->_fourthLineDisplayedText, a3);
}

- (NSMutableArray)thirdLineText
{
  return self->_thirdLineText;
}

- (void)setThirdLineText:(id)a3
{
  objc_storeStrong((id *)&self->_thirdLineText, a3);
}

- (BOOL)optionSmallerScreen
{
  return self->_optionSmallerScreen;
}

- (void)setOptionSmallerScreen:(BOOL)a3
{
  self->_optionSmallerScreen = a3;
}

- (id)attributionObserver
{
  return self->_attributionObserver;
}

- (void)setAttributionObserver:(id)a3
{
  objc_storeStrong(&self->_attributionObserver, a3);
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_attributionObserver, 0);
  objc_storeStrong((id *)&self->_thirdLineText, 0);
  objc_storeStrong((id *)&self->_fourthLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_thirdLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
}

@end
