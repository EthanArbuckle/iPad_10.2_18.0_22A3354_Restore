@implementation CKLocationMediaObject

- (id)mapItem
{
  objc_class *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  v3 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKPlacemark"), CFSTR("MapKit"));
  v4 = MEMORY[0x193FF3C18](CFSTR("MKMapItem"), CFSTR("MapKit"));
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (objc_class *)v4;
    -[CKMediaObject data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v8, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v32 = v8;
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postalAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "objectAtIndex:", 0);
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(v10, "phoneNumbers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v10, "urlAddresses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      v12 = (void *)v31;
      v8 = v32;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    v17 = [v3 alloc];
    -[CKLocationMediaObject coordinate](self, "coordinate");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v12, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v17, "initWithCoordinate:postalAddress:", v22, v19, v21);

    v6 = (void *)objc_msgSend([v7 alloc], "initWithPlacemark:", v23);
    objc_msgSend(v13, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoneNumber:", v25);

    if (v14)
    {
      v26 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v14, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLWithString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUrl:", v28);

    }
    -[CKLocationMediaObject title](self, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v29);

  }
  return v6;
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (id)vcardDataFromCLLocation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "coordinate");
  objc_msgSend(MEMORY[0x1E0CB3940], "__ck_appleMapsURLStringForCoordinate:coordinateName:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C97200]);
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "urlAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", CFSTR("map url"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setUrlAddresses:", v8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationRelativeDateFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LOCATION_FOOTER_DETAILS_VIEW"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

    if (v18 == 1)
      v19 = CFSTR("\u200F");
    else
      v19 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setGivenName:", v20);
    objc_msgSend(v5, "setUrlAddresses:", v8);
    v21 = objc_msgSend(v5, "copy");

    v4 = (id)v21;
  }
  v22 = (void *)MEMORY[0x1E0C972A8];
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v22, "dataWithContacts:error:", v23, &v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)placeholderPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  CKLocationMediaObject *v6;
  void *v7;

  v4 = a4;
  v6 = objc_alloc_init(CKLocationMediaObject);
  -[CKLocationMediaObject previewForWidth:orientation:](v6, "previewForWidth:orientation:", v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)UTITypes
{
  __CFString *PreferredIdentifierForTag;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], CFSTR("loc.vcf"), (CFStringRef)*MEMORY[0x1E0CA5CB0]);
  v5[0] = PreferredIdentifierForTag;
  v5[1] = CFSTR("com.apple.messages.maputi");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386B8];
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("LOC");
}

- (id)attachmentSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("SUMMARY_LOCATION_TYPE");
  else
    v6 = CFSTR("SUMMARY_LOCATION_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKLocationMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  CKLocationMediaObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLocationMediaObject;
  v5 = -[CKMediaObject initWithTransfer:context:forceInlinePreview:](&v7, sel_initWithTransfer_context_forceInlinePreview_, a3, a4, a5);
  if (v5)
    -[CKLocationMediaObject setCoordinate:](v5, "setCoordinate:", __kCLLocationCoordinate2DInvalid());
  return v5;
}

- (int)mediaType
{
  return 5;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  objc_super v31;
  objc_super v32;

  if (-[CKContactMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
  {
    -[CKContactMediaObject contactMediaInfo](self, "contactMediaInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contactFormatterTitle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_30;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("organizationNameTitle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_30;
    }
    v32.receiver = self;
    v32.super_class = (Class)CKLocationMediaObject;
    -[CKContactMediaObject title](&v32, sel_title);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v4 || !objc_msgSend(v6, "isEqualToString:", CFSTR("Current Location")))
    {
LABEL_30:
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("Current Location")))
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "locationRelativeDateFormatter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKMediaObject time](self, "time");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      goto LABEL_27;
    }
LABEL_16:
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LOCATING"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_26:

    v5 = (void *)v15;
    goto LABEL_27;
  }
  -[CKContactMediaObject vCardSummary](self, "vCardSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v10 && objc_msgSend(v10, "contactCount"))
  {
    objc_msgSend(v4, "avatarContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v5 = (void *)v13;

      goto LABEL_17;
    }
    objc_msgSend(v12, "organizationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_17;
  }
  v31.receiver = self;
  v31.super_class = (Class)CKLocationMediaObject;
  -[CKContactMediaObject title](&v31, sel_title);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (!v4 && objc_msgSend(v14, "isEqualToString:", CFSTR("Current Location")))
    goto LABEL_16;
LABEL_17:
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Current Location")) & 1) != 0
    || (CKFrameworkBundle(),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Current Location"), &stru_1E276D870, CFSTR("ChatKit")), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v5, "isEqualToString:", v17), v17, v16, v18))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locationRelativeDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject time](self, "time");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v21)
    {
LABEL_22:
      v23 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("LOCATION_FOOTER_DETAILS_VIEW"), &stru_1E276D870, CFSTR("ChatKit"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "userInterfaceLayoutDirection");

      if (v28 == 1)
        v29 = CFSTR("\u200F");
      else
        v29 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v29, "stringByAppendingString:", v26);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v21;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v22 = (void *)v9;
    objc_msgSend(v8, "stringFromDate:", v9);
    v21 = objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
LABEL_27:

  return (NSString *)v5;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  CKOrientedPreviewCacheKey(self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%zd"), v5, objc_msgSend(v6, "userInterfaceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKLocationMediaObject;
  -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](&v12, sel_previewCachesFileURLWithOrientation_extension_generateIntermediaries_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "userInterfaceStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  IMAttachmentPreviewFileURLFromURLWithSuffix();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKLocationMediaObject *v24;
  objc_super v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CKLocationMediaObject *v29;
  char v30;
  _QWORD v31[6];
  char v32;
  objc_super v33;
  objc_super v34;
  __int128 buf;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    if (previewForWidth_orientation___pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
      dispatch_once(&previewForWidth_orientation___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_144);
    -[CKLocationMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transfer](self, "transfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
      || (objc_msgSend(v9, "isFileDataReady") & 1) == 0 && (objc_msgSend(v9, "isRestoring") & 1) == 0)
    {
      *(_QWORD *)&buf = v4;
      *(_DWORD *)((char *)&buf + 1) = -[CKLocationMediaObject isDroppedPin](self, "isDroppedPin");
      -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&buf + 1) = objc_msgSend(v10, "userInterfaceStyle");

      objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &buf, "{?=cBq}");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[CKLocationMediaObject generatePlaceholderThumbnailForWidth:orientation:](self, "generatePlaceholderThumbnailForWidth:orientation:", v4, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34.receiver = self;
        v34.super_class = (Class)CKLocationMediaObject;
        -[CKMediaObject generatePreviewFromThumbnail:width:orientation:](&v34, sel_generatePreviewFromThumbnail_width_orientation_, v14, v4, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (v11)
          {
            +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v13, v11);

          }
        }
      }
      v7 = v13;

      goto LABEL_16;
    }
    v33.receiver = self;
    v33.super_class = (Class)CKLocationMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v33, sel_previewForWidth_orientation_, v4, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (-[CKContactMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
      {
        -[CKMediaObject generateOOPPreviewForWidth:orientation:](self, "generateOOPPreviewForWidth:orientation:", v4, a3);
      }
      else if (((uint64_t (*)(uint64_t))previewForWidth_orientation___CLLocationCoordinate2DIsValid)(-[CKLocationMediaObject coordinate](self, "coordinate")))
      {
        -[CKContactMediaObject previewDispatchCache](self, "previewDispatchCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isGeneratingPreviewForKey:", v8))
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(2);
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = self;
              _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_DEBUG, "%@ is already generating preview. Abort.", (uint8_t *)&buf, 0xCu);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v24 = self;
            _CKLog();
          }
        }
        else
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_109;
          v31[3] = &unk_1E274FA40;
          v31[4] = self;
          *(double *)&v31[5] = a3;
          v32 = v4;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_120;
          v26[3] = &unk_1E2754888;
          v27 = v17;
          v28 = v8;
          v29 = self;
          v30 = v4;
          objc_msgSend(v27, "enqueueGenerationBlock:completion:withPriority:forKey:", v31, v26, -1, v28);

        }
        *(_QWORD *)&buf = v4;
        BYTE1(buf) = -[CKLocationMediaObject isDroppedPin](self, "isDroppedPin", v24);
        -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)&buf + 1) = objc_msgSend(v19, "userInterfaceStyle");

        objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &buf, "{?=cBq}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v20);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          -[CKLocationMediaObject generatePlaceholderThumbnailForWidth:orientation:](self, "generatePlaceholderThumbnailForWidth:orientation:", v4, a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25.receiver = self;
          v25.super_class = (Class)CKLocationMediaObject;
          -[CKMediaObject generatePreviewFromThumbnail:width:orientation:](&v25, sel_generatePreviewFromThumbnail_width_orientation_, v22, v4, a3);
          v7 = (id)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v7, v20);

          }
        }

        goto LABEL_16;
      }
      v7 = 0;
    }
LABEL_16:

    return v7;
  }
  v7 = 0;
  return v7;
}

void *__53__CKLocationMediaObject_previewForWidth_orientation___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  previewForWidth_orientation___CLLocationCoordinate2DIsValid = result;
  return result;
}

id __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "%@ generate preview.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v27 = *(_QWORD *)(a1 + 32);
    _CKLog();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapThumbnailFillSizeForWidth:", *(double *)(a1 + 40));
  v8 = v7;
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumbnailContentAlignmentInsetsForOrientation:", *(char *)(a1 + 48));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "generateThumbnailFillToSize:contentAlignmentInsets:", v8, v10, v13, v15, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v21, "startTimingForKey:", CFSTR("CKLocationMediaObject_PreviewGenerationTime"));
  objc_msgSend(*(id *)(a1 + 32), "generatePreviewFromThumbnail:width:orientation:", v20, *(char *)(a1 + 48), *(double *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stopTimingForKey:", CFSTR("CKLocationMediaObject_PreviewGenerationTime"));
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "UTIType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v24;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_DEBUG, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "UTIType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    _CKLog();

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance", v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trackEvent:", *MEMORY[0x1E0D387A8]);

  return v22;
}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_120(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_2;
  v4[3] = &unk_1E2754888;
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = *(_BYTE *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_3;
    v5[3] = &unk_1E274FA18;
    v5[4] = *(_QWORD *)(a1 + 48);
    v7 = *(_BYTE *)(a1 + 56);
    v6 = v2;
    objc_msgSend(v4, "enqueueSaveBlock:forMediaObject:withPriority:", v5, *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 48), "postPreviewDidChangeNotifications");

  }
}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "previewFilenameExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Saving local preview to %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(v3, "savePreview:toURL:forOrientation:", *(_QWORD *)(a1 + 40), v7, *(char *)(a1 + 48));

}

- (id)transcriptTraitCollection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLocationMediaObject;
  -[CKMediaObject transcriptTraitCollection](&v7, sel_transcriptTraitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height;
  double width;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_class *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  height = a3.height;
  width = a3.width;
  v44 = *MEMORY[0x1E0C80C00];
  if (generateThumbnailFillToSize_contentAlignmentInsets___pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&generateThumbnailFillToSize_contentAlignmentInsets___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_126_0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__44;
  v38 = __Block_byref_object_dispose__44;
  v39 = 0;
  v7 = -[CKLocationMediaObject coordinate](self, "coordinate");
  v9 = v8;
  v11 = v10;
  if ((generateThumbnailFillToSize_contentAlignmentInsets___CLLocationCoordinate2DIsValid(v7) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (const __CFString *)self;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    goto LABEL_32;
  }
  v12 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v41 = CFSTR("MKMapSnapshotOptions");
        v42 = 2112;
        v43 = CFSTR("MapKit");
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }

    }
    goto LABEL_42;
  }
  v13 = objc_alloc_init(v12);
  objc_msgSend(v13, "setMapType:", 0);
  -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTraitCollection:", v14);

  objc_msgSend(v13, "_setUseSnapshotService:", 1);
  if (generateThumbnailFillToSize_contentAlignmentInsets___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1)
    dispatch_once(&generateThumbnailFillToSize_contentAlignmentInsets___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_134);
  generateThumbnailFillToSize_contentAlignmentInsets___MKCoordinateRegionMakeWithDistance(v9, v11, 500.0, 500.0);
  if (v16 < -180.0 || v16 > 180.0 || v15 < -90.0 || v15 > 90.0 || v17 < 0.0 || v17 > 180.0 || v18 < 0.0 || v18 > 360.0)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_37:

LABEL_42:
      v27 = 0;
      goto LABEL_43;
    }
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "CKLocationMediaObject - Map region is invalid, bailing!", buf, 2u);
    }
LABEL_36:

    goto LABEL_37;
  }
  objc_msgSend(v13, "setRegion:");
  objc_msgSend(v13, "setSize:", width, height);
  v19 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
  if (!v19)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_37;
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v41 = CFSTR("MKMapSnapshotter");
      v42 = 2112;
      v43 = CFSTR("MapKit");
      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
    }
    goto LABEL_36;
  }
  v20 = (void *)objc_msgSend([v19 alloc], "initWithOptions:", v13);
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_139;
  v31[3] = &unk_1E274A498;
  v33 = &v34;
  v23 = v21;
  v32 = v23;
  objc_msgSend(v20, "startWithQueue:completionHandler:", v22, v31);

  v24 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v23, v24))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (const __CFString *)self;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
  }

LABEL_32:
  v27 = (id)v35[5];
LABEL_43:
  _Block_object_dispose(&v34, 8);

  return v27;
}

void *__76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  generateThumbnailFillToSize_contentAlignmentInsets___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_133()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKCoordinateRegionMakeWithDistance", CFSTR("MapKit"));
  generateThumbnailFillToSize_contentAlignmentInsets___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_139(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CGSize)bbSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 270.0;
  v3 = 130.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed", a3.width, a3.height))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);

      }
    }
    return 0;
  }
  else
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewFileURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject savedPreviewFromURL:forOrientation:](self, "savedPreviewFromURL:forOrientation:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }

    }
    return v10;
  }
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_LOCATION_TYPE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D *p_coordinate;
  double latitude;
  double longitude;
  double v6;
  double v7;
  CLLocationDegrees v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double (*v23)(uint64_t, double, double);
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double (*v29)(uint64_t, double, double);
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  CLLocationCoordinate2D *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _BYTE v45[128];
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  CLLocationCoordinate2D result;

  v48 = *MEMORY[0x1E0C80C00];
  if (coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation_0 != -1)
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation_0, &__block_literal_global_144);
  if (coordinate__pred_CLLocationCoordinate2DMakeCoreLocation_0 != -1)
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DMakeCoreLocation_0, &__block_literal_global_145_0);
  v44 = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v46 = xmmword_1E27560F0;
    v47 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    -[CKLocationMediaObject coordinate].cold.1(&v44);
  p_coordinate = &self->_coordinate;
  if (coordinate__CLLocationCoordinate2DIsValid_0(self->_coordinate.latitude, self->_coordinate.longitude))
  {
    latitude = p_coordinate->latitude;
    if (p_coordinate->latitude != 0.0)
    {
      longitude = self->_coordinate.longitude;
      if (longitude != 0.0)
        goto LABEL_35;
    }
  }
  v6 = __kCLLocationCoordinate2DInvalid();
  v8 = v7;
  -[CKLocationMediaObject vCardURLProperties](self, "vCardURLProperties");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v10)
    goto LABEL_32;
  v11 = v10;
  v37 = &self->_coordinate;
  v39 = *(_QWORD *)v41;
  v38 = v9;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v41 != v39)
        objc_enumerationMutation(v9);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("maps.apple.com")))
      {
        objc_msgSend(v13, "queryParameters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("sll"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("ll"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;

        objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(","));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count") == 2)
        {
          v23 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake_0;
          objc_msgSend(v20, "objectAtIndex:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v25 = v24;
          objc_msgSend(v20, "objectAtIndex:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v22, "doubleValue");
          v6 = v23(v26, v25, v27);
          v8 = v28;
LABEL_31:

          p_coordinate = v37;
          v9 = v38;
          goto LABEL_32;
        }
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("maps.google.com")))
          goto LABEL_26;
        objc_msgSend(v13, "tuQueryParameters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("q"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(" "));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v20, "objectAtIndex:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(","));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count") == 2)
          {
            v29 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake_0;
            objc_msgSend(v22, "objectAtIndex:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "doubleValue");
            v32 = v31;
            objc_msgSend(v22, "objectAtIndex:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "doubleValue");
            v6 = v29(v34, v32, v35);
            v8 = v36;

            goto LABEL_31;
          }

          v9 = v38;
        }
      }

LABEL_26:
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
      continue;
    break;
  }
  p_coordinate = v37;
LABEL_32:

  p_coordinate->latitude = v6;
  p_coordinate->longitude = v8;

  latitude = p_coordinate->latitude;
  longitude = p_coordinate->longitude;
LABEL_35:
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

void *__35__CKLocationMediaObject_coordinate__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  coordinate__CLLocationCoordinate2DIsValid_0 = result;
  return result;
}

void *__35__CKLocationMediaObject_coordinate__block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DMake", CFSTR("CoreLocation"));
  coordinate__CLLocationCoordinate2DMake_0 = result;
  return result;
}

- (id)vCardURLProperties
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v2, &v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v20;
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "urlAddresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "value", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)placeholderPreviewCache
{
  if (placeholderPreviewCache_once_0 != -1)
    dispatch_once(&placeholderPreviewCache_once_0, &__block_literal_global_153_1);
  return (id)placeholderPreviewCache_sPlaceholderPreviews_0;
}

void __48__CKLocationMediaObject_placeholderPreviewCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  CKCreateNSCache(4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)placeholderPreviewCache_sPlaceholderPreviews_0;
  placeholderPreviewCache_sPlaceholderPreviews_0 = v0;

}

- (BOOL)isDroppedPin
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;

  v3 = CKIsRunningInMacCatalyst();
  -[CKMediaObject filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("CL.loc.vcf");
  else
    v6 = CFSTR("Dropped Pin.loc.vcf");
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapThumbnailFillSizeForWidth:", a3);
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailContentAlignmentInsetsForOrientation:", v4);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  return -[CKLocationMediaObject generatePlaceholderThumbnailFillToSize:contentAlignmentInsets:](self, "generatePlaceholderThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (id)generatePlaceholderThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  height = a3.height;
  width = a3.width;
  v42 = *MEMORY[0x1E0C80C00];
  -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocationSharePreviewPlaceHolderCacheFileURL(v7, (unint64_t)width, CFSTR("jpeg"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__44;
  v36 = __Block_byref_object_dispose__44;
  v37 = 0;
  -[CKMediaObject savedPreviewFromURL:forOrientation:](self, "savedPreviewFromURL:forOrientation:", v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v33[5];
  v33[5] = v9;

  if (v33[5])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Found cached thumnail on disk.", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    v12 = (id)v33[5];
  }
  else
  {
    v13 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
    if (v13)
    {
      v14 = objc_alloc_init(v13);
      objc_msgSend(v14, "setMapType:", 105);
      -[CKLocationMediaObject transcriptTraitCollection](self, "transcriptTraitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTraitCollection:", v15);

      objc_msgSend(v14, "setSize:", width, height);
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      objc_msgSend(v14, "setScale:");

      v17 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
      if (v17)
      {
        v18 = (void *)objc_msgSend([v17 alloc], "initWithOptions:", v14);
        v19 = dispatch_group_create();
        dispatch_group_enter(v19);
        dispatch_get_global_queue(0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __87__CKLocationMediaObject_generatePlaceholderThumbnailFillToSize_contentAlignmentInsets___block_invoke;
        v29[3] = &unk_1E274A498;
        v31 = &v32;
        v21 = v19;
        v30 = v21;
        objc_msgSend(v18, "startWithQueue:completionHandler:", v20, v29);

        v22 = dispatch_time(0, 5000000000);
        if (dispatch_group_wait(v21, v22))
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(2);
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v39 = (const __CFString *)self;
              _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
            _CKLogExternal();
        }
        v24 = v33[5];
        if (v24)
        {
          -[CKMediaObject savePreview:toURL:forOrientation:](self, "savePreview:toURL:forOrientation:", v24, v8, 0);
          v25 = (void *)v33[5];
        }
        else
        {
          v25 = 0;
        }
        v12 = v25;

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("MKMapSnapshotter");
            v40 = 2112;
            v41 = CFSTR("MapKit");
            _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
          }

        }
        v12 = 0;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v39 = CFSTR("MKMapSnapshotOptions");
          v40 = 2112;
          v41 = CFSTR("MapKit");
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
        }

      }
      v12 = 0;
    }
  }
  _Block_object_dispose(&v32, 8);

  return v12;
}

void __87__CKLocationMediaObject_generatePlaceholderThumbnailFillToSize_contentAlignmentInsets___block_invoke(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)pasteboardItemProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t v16[16];

  -[CKLocationMediaObject coordinate](self, "coordinate");
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0C99E98];
  -[CKMediaObject filename](self, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__ck_appleMapsURLForCoordinate:coordinateName:", v8, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB36C8];
  -[CKMediaObject fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__ck_itemProviderForAppleMapsCoordinateURL:vCardURL:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Unexpected ItemProvider in LocationMediaObject", v16, 2u);
    }

  }
  return v12;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  -[CKLocationMediaObject coordinate](self, "coordinate", a3, a4.location, a4.length);
  v6 = v5;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0C99E98];
  -[CKMediaObject filename](self, "filename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__ck_appleMapsURLForCoordinate:coordinateName:", v10, v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v11, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

  v15 = objc_msgSend(v14, "length");
  v23[0] = CFSTR("com.apple.messages.mapvcard.name");
  -[CKMediaObject filename](self, "filename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v23[1] = CFSTR("com.apple.messages.mapvcard");
  -[CKMediaObject fileURL](self, "fileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  v23[2] = CFSTR("com.apple.messages.maputi");
  -[CKMediaObject UTIType](self, "UTIType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAttribute:value:range:", CFSTR("com.apple.messages.mapattribute"), v19, 0, v15);
  v22 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void)coordinate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKLocationMediaObject.m"), 50, CFSTR("%s"), *a1);

  __break(1u);
}

@end
