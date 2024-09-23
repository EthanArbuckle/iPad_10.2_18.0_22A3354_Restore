@implementation CKLocationAttachmentItem

+ (id)UTITypes
{
  __CFString *PreferredIdentifierForTag;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], CFSTR("loc.vcf"), (CFStringRef)*MEMORY[0x1E0CA5CB0]);
  v5[0] = PreferredIdentifierForTag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKLocationAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  id v16;
  CKLocationAttachmentItem *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  height = a4.height;
  width = a4.width;
  v29 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CKLocationAttachmentItem;
  v17 = -[CKAttachmentItem initWithFileURL:size:transferGUID:guid:createdDate:shareURL:](&v26, sel_initWithFileURL_size_transferGUID_guid_createdDate_shareURL_, v13, v14, v15, v16, 0, width, height);
  if (v17)
  {
    -[CKLocationAttachmentItem setCoordinate:](v17, "setCoordinate:", __IMWeakkCLLocationCoordinate2DInvalid());
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v18, &v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v25;
      if (v20)
      {
        objc_msgSend(v13, "absoluteString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
      }
      else
      {
        objc_msgSend(v19, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "givenName");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKLocationAttachmentItem setLocationTitle:](v17, "setLocationTitle:", v23);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v13;
          _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Initializing CKLocationAttachmentItem at URL %@ with nil data", buf, 0xCu);
        }

      }
      v18 = v17;
      v17 = 0;
    }

  }
  return v17;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CKLocationAttachmentItem *v20;
  id v21;
  _QWORD v22[7];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttachmentPreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapPreviewMaxWidth");
  v10 = v9;
  -[CKAttachmentItem size](self, "size");
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  v14 = v13;
  v16 = v15;

  if ((objc_msgSend(v5, "isGeneratingPreviewForKey:", v6) & 1) == 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v22[3] = &unk_1E274DD58;
    v22[4] = self;
    v22[5] = v14;
    v22[6] = v16;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_30;
    v17[3] = &unk_1E274CF80;
    v18 = v5;
    v19 = v6;
    v20 = self;
    v21 = v4;
    objc_msgSend(v18, "enqueueGenerationBlock:completion:withPriority:forKey:", v22, v17, 1, v19);

  }
}

id __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_30(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  v5[3] = &unk_1E274CF80;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_savePreview:", v2);
    v2 = v4;
  }
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    v2 = v4;
  }

}

- (id)_generateThumbnailFillToSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_class *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  void *v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  height = a3.height;
  width = a3.width;
  v47 = *MEMORY[0x1E0C80C00];
  if (_generateThumbnailFillToSize___pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&_generateThumbnailFillToSize___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_36);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__15;
  v40 = __Block_byref_object_dispose__15;
  v41 = 0;
  v6 = -[CKLocationAttachmentItem coordinate](self, "coordinate");
  v8 = v7;
  v10 = v9;
  if ((_generateThumbnailFillToSize___CLLocationCoordinate2DIsValid(v6) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = (const __CFString *)self;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    goto LABEL_48;
  }
  v11 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
  if (!v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v44 = CFSTR("MKMapSnapshotOptions");
        v45 = 2112;
        v46 = CFSTR("MapKit");
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }

    }
    goto LABEL_33;
  }
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setMapType:", 0);
  if (_generateThumbnailFillToSize___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1)
    dispatch_once(&_generateThumbnailFillToSize___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_42);
  _generateThumbnailFillToSize___MKCoordinateRegionMakeWithDistance(v8, v10, 500.0, 500.0);
  if (v14 >= -180.0
    && v14 <= 180.0
    && v13 >= -90.0
    && v13 <= 90.0
    && v15 >= 0.0
    && v15 <= 180.0
    && v16 >= 0.0
    && v16 <= 360.0)
  {
    objc_msgSend(v12, "setRegion:");
    objc_msgSend(v12, "setSize:", width, height);
    v17 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotFeatureAnnotation"), CFSTR("MapKit"));
    if (v17)
    {
      v18 = (void *)objc_msgSend([v17 alloc], "initWithCoordinate:title:representation:", 0, 2, v8, v10);
      v42 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setCustomFeatureAnnotations:", v19);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v44 = CFSTR("MKMapSnapshotFeatureAnnotation");
        v45 = 2112;
        v46 = CFSTR("MapKit");
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }

    }
    v25 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
    if (v25)
    {
      v26 = (void *)objc_msgSend([v25 alloc], "initWithOptions:", v12);
      v27 = dispatch_group_create();
      dispatch_group_enter(v27);
      +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_49;
      v33[3] = &unk_1E274A498;
      v35 = &v36;
      v29 = v27;
      v34 = v29;
      objc_msgSend(v26, "startWithQueue:completionHandler:", v28, v33);

      v30 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(v29, v30))
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = (const __CFString *)self;
            _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
          _CKLogExternal();
      }

LABEL_48:
      v23 = (id)v37[5];
      goto LABEL_49;
    }
    if (!IMOSLoggingEnabled())
      goto LABEL_28;
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v44 = CFSTR("MKMapSnapshotter");
      v45 = 2112;
      v46 = CFSTR("MapKit");
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKLocationAttachmentItem - Map region is invalid, bailing!", buf, 2u);
    }
LABEL_27:

  }
LABEL_28:

LABEL_33:
  v23 = 0;
LABEL_49:
  _Block_object_dispose(&v36, 8);

  return v23;
}

void *__57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  _generateThumbnailFillToSize___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_41()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKCoordinateRegionMakeWithDistance", CFSTR("MapKit"));
  _generateThumbnailFillToSize___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationAttachmentItem for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D *p_coordinate;
  double v4;
  double v5;
  CLLocationDegrees v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double (*v21)(uint64_t, double, double);
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double (*v27)(uint64_t, double, double);
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  double latitude;
  double longitude;
  CLLocationCoordinate2D *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CLLocationCoordinate2D result;

  v45 = *MEMORY[0x1E0C80C00];
  if (coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_54_0);
  if (coordinate__pred_CLLocationCoordinate2DMakeCoreLocation != -1)
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_55_0);
  p_coordinate = &self->_coordinate;
  if ((coordinate__CLLocationCoordinate2DIsValid(self->_coordinate.latitude, self->_coordinate.longitude) & 1) != 0)
    goto LABEL_28;
  v4 = __IMWeakkCLLocationCoordinate2DInvalid();
  v6 = v5;
  -[CKLocationAttachmentItem vCardURLProperties](self, "vCardURLProperties");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v8)
    goto LABEL_27;
  v9 = v8;
  v37 = &self->_coordinate;
  v39 = *(_QWORD *)v41;
  v38 = v7;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v41 != v39)
        objc_enumerationMutation(v7);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("maps.apple.com")))
      {
        objc_msgSend(v11, "queryParameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("sll"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("ll"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count") == 2)
        {
          v21 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake;
          objc_msgSend(v18, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v23 = v22;
          objc_msgSend(v18, "objectAtIndex:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v20, "doubleValue");
          v4 = v21(v24, v23, v25);
          v6 = v26;
LABEL_26:

          p_coordinate = v37;
          v7 = v38;
          goto LABEL_27;
        }
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("maps.google.com")))
          goto LABEL_21;
        objc_msgSend(v11, "queryParameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("q"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(" "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v18, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(","));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count") == 2)
          {
            v27 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake;
            objc_msgSend(v20, "objectAtIndex:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v29;
            objc_msgSend(v20, "objectAtIndex:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "doubleValue");
            v4 = v27(v32, v30, v33);
            v6 = v34;

            goto LABEL_26;
          }

          v7 = v38;
        }
      }

LABEL_21:
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
      continue;
    break;
  }
  p_coordinate = v37;
LABEL_27:

  p_coordinate->latitude = v4;
  p_coordinate->longitude = v6;

LABEL_28:
  latitude = p_coordinate->latitude;
  longitude = p_coordinate->longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

void *__38__CKLocationAttachmentItem_coordinate__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  coordinate__CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__38__CKLocationAttachmentItem_coordinate__block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DMake", CFSTR("CoreLocation"));
  coordinate__CLLocationCoordinate2DMake = result;
  return result;
}

- (id)vCardURLProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  -[CKAttachmentItem fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

LABEL_9:
  return v6;
}

- (BOOL)isDroppedPin
{
  void *v2;
  void *v3;
  char v4;

  -[CKAttachmentItem fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Dropped Pin.loc.vcf"));

  return v4;
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (void)setLocationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTitle, 0);
}

@end
