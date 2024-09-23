@implementation LPApplePhotosMomentMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosMomentMetadata)initWithCoder:(id)a3
{
  id v4;
  LPApplePhotosMomentMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  LPImage *keyPhoto;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSDate *earliestAssetDate;
  uint64_t v14;
  NSDate *latestAssetDate;
  LPApplePhotosMomentMetadata *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPApplePhotosMomentMetadata;
  v5 = -[LPApplePhotosMomentMetadata init](&v18, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_photoCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoCount"));
    v5->_videoCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("videoCount"));
    v5->_otherItemCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("otherItemCount"));
    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("keyPhoto"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (LPImage *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestAssetDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    earliestAssetDate = v5->_earliestAssetDate;
    v5->_earliestAssetDate = (NSDate *)v12;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestAssetDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    latestAssetDate = v5->_latestAssetDate;
    v5->_latestAssetDate = (NSDate *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_photoCount, CFSTR("photoCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_videoCount, CFSTR("videoCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_otherItemCount, CFSTR("otherItemCount"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_keyPhoto, CFSTR("keyPhoto"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_earliestAssetDate, CFSTR("earliestAssetDate"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_latestAssetDate, CFSTR("latestAssetDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPApplePhotosMomentMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LPApplePhotosMomentMetadata *v10;

  v4 = +[LPApplePhotosMomentMetadata allocWithZone:](LPApplePhotosMomentMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPApplePhotosMomentMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosMomentMetadata setTitle:](v4, "setTitle:", v5);

    -[LPApplePhotosMomentMetadata setPhotoCount:](v4, "setPhotoCount:", -[LPApplePhotosMomentMetadata photoCount](self, "photoCount"));
    -[LPApplePhotosMomentMetadata setVideoCount:](v4, "setVideoCount:", -[LPApplePhotosMomentMetadata videoCount](self, "videoCount"));
    -[LPApplePhotosMomentMetadata setOtherItemCount:](v4, "setOtherItemCount:", -[LPApplePhotosMomentMetadata otherItemCount](self, "otherItemCount"));
    -[LPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosMomentMetadata setKeyPhoto:](v4, "setKeyPhoto:", v6);

    -[LPApplePhotosMomentMetadata expirationDate](self, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosMomentMetadata setExpirationDate:](v4, "setExpirationDate:", v7);

    -[LPApplePhotosMomentMetadata earliestAssetDate](self, "earliestAssetDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosMomentMetadata setEarliestAssetDate:](v4, "setEarliestAssetDate:", v8);

    -[LPApplePhotosMomentMetadata latestAssetDate](self, "latestAssetDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosMomentMetadata setLatestAssetDate:](v4, "setLatestAssetDate:", v9);

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPApplePhotosMomentMetadata;
  if (-[LPApplePhotosMomentMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0
        && v6[3] == (void *)self->_photoCount
        && v6[4] == (void *)self->_videoCount
        && v6[5] == (void *)self->_otherItemCount
        && objectsAreEqual_0(v6[6], self->_keyPhoto)
        && objectsAreEqual_0(v6[7], self->_expirationDate)
        && objectsAreEqual_0(v6[8], self->_earliestAssetDate))
      {
        v5 = objectsAreEqual_0(v6[9], self->_latestAssetDate);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("keyPhoto"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("photoCount"), CFSTR("videoCount"), CFSTR("otherItemCount"), CFSTR("keyPhoto"), CFSTR("expirationDate"), CFSTR("earliestAssetDate"), CFSTR("latestAssetDate"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_otherItemCount = a3;
}

- (LPImage)keyPhoto
{
  return self->_keyPhoto;
}

- (void)setKeyPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_keyPhoto, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)earliestAssetDate
{
  return self->_earliestAssetDate;
}

- (void)setEarliestAssetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)latestAssetDate
{
  return self->_latestAssetDate;
}

- (void)setLatestAssetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAssetDate, 0);
  objc_storeStrong((id *)&self->_earliestAssetDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void (*v16)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD);
  void *v17;
  id v18;
  void (*v19)(id);
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  LPCaptionBarPresentationProperties *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void (**v58)(void);
  id v59;
  id v60;
  _QWORD aBlock[4];
  id v62;
  LPApplePhotosMomentMetadata *v63;
  void *v64;
  void **v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  void *(*v69)(_QWORD *);
  void *v70;
  void **v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  -[LPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__LPApplePhotosMomentMetadata_Transformers__presentationPropertiesForTransformer___block_invoke;
  aBlock[3] = &unk_1E44A7D10;
  v9 = v5;
  v62 = v9;
  v63 = self;
  v58 = (void (**)(void))_Block_copy(aBlock);
  if (!TCCAccessPreflight()
    || +[LPTestingOverrides forceIgnoreAllTCCChecks](LPTestingOverrides, "forceIgnoreAllTCCChecks"))
  {
    v64 = 0;
    if (!PhotoLibraryLibraryCore_frameworkLibrary)
    {
      v68 = xmmword_1E44AA640;
      v69 = 0;
      PhotoLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (PhotoLibraryLibraryCore_frameworkLibrary)
    {
      if (v64)
        free(v64);
      -[LPApplePhotosMomentMetadata title](self, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPApplePhotosMomentMetadata earliestAssetDate](self, "earliestAssetDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPApplePhotosMomentMetadata latestAssetDate](self, "latestAssetDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      v60 = 0;
      LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(v10, v11, v12, (uint64_t)&v60, (uint64_t)&v59);
      v57 = v60;
      v56 = v59;

      v13 = -[LPApplePhotosMomentMetadata photoCount](self, "photoCount");
      v14 = -[LPApplePhotosMomentMetadata videoCount](self, "videoCount");
      v15 = -[LPApplePhotosMomentMetadata otherItemCount](self, "otherItemCount");
      v64 = 0;
      v65 = &v64;
      v66 = 0x2020000000;
      v16 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD))getPLLocalizedCountDescriptionSymbolLoc_ptr;
      v67 = getPLLocalizedCountDescriptionSymbolLoc_ptr;
      if (!getPLLocalizedCountDescriptionSymbolLoc_ptr)
      {
        *(_QWORD *)&v68 = v8;
        *((_QWORD *)&v68 + 1) = 3221225472;
        v69 = __getPLLocalizedCountDescriptionSymbolLoc_block_invoke;
        v70 = &unk_1E44A7DB0;
        v71 = &v64;
        __getPLLocalizedCountDescriptionSymbolLoc_block_invoke(&v68);
        v16 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD))v65[3];
      }
      _Block_object_dispose(&v64, 8);
      if (v16)
      {
        v16(v13, v14, v15, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPApplePhotosMomentMetadata expirationDate](self, "expirationDate");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        v65 = &v64;
        v66 = 0x2020000000;
        v19 = (void (*)(id))getPXCMMStringForExpiryDateSymbolLoc_ptr;
        v67 = getPXCMMStringForExpiryDateSymbolLoc_ptr;
        if (!getPXCMMStringForExpiryDateSymbolLoc_ptr)
        {
          *(_QWORD *)&v68 = v8;
          *((_QWORD *)&v68 + 1) = 3221225472;
          v69 = __getPXCMMStringForExpiryDateSymbolLoc_block_invoke;
          v70 = &unk_1E44A7DB0;
          v71 = &v64;
          __getPXCMMStringForExpiryDateSymbolLoc_block_invoke(&v68);
          v19 = (void (*)(id))v65[3];
        }
        _Block_object_dispose(&v64, 8);
        if (v19)
        {
          v19(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[LPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 && (v22 = sizeClassAllowsMedia(objc_msgSend(v4, "effectiveSizeClass")), v21, v22))
          {
            objc_msgSend(v9, "captionBar");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "top");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "leading");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setText:", v17);

            objc_msgSend(v9, "captionBar");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bottom");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "leading");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setText:", v20);

            objc_msgSend(v9, "captionBar");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setTrailingAccessoryType:", 1);

            v30 = objc_alloc_init(LPCaptionBarPresentationProperties);
            objc_msgSend(v9, "setMediaTopCaptionBar:", v30);

            objc_msgSend(v9, "mediaTopCaptionBar");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "top");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "leading");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setText:", v57);

            objc_msgSend(v9, "mediaTopCaptionBar");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "bottom");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "leading");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setText:", v56);
          }
          else
          {
            v37 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v9, "style"));
            if ((unint64_t)(v37 - 2) < 2)
            {
              objc_msgSend(v9, "captionBar");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "aboveTop");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "leading");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setText:", v57);

              objc_msgSend(v9, "captionBar");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "top");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "leading");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setText:", v17);

              objc_msgSend(v9, "captionBar");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "bottom");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "leading");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setText:", v20);
            }
            else if (v37 == 1)
            {
              objc_msgSend(v9, "captionBar");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "top");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "leading");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setText:", v57);

              objc_msgSend(v9, "captionBar");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "bottom");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "leading");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setText:", v56);
            }
            else
            {
              if (v37)
              {
LABEL_25:
                v48 = v9;

                goto LABEL_26;
              }
              objc_msgSend(v9, "captionBar");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "top");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "leading");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setText:", v57);
            }
          }

          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *LPPXCMMStringForExpiryDate(NSDate *__strong)");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("LPApplePhotosTransformers.m"), 40, CFSTR("%s"), dlerror());

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *LPPLLocalizedCountDescription(NSUInteger, NSUInteger, NSUInteger, BOOL, BOOL)");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("LPApplePhotosTransformers.m"), 30, CFSTR("%s"), dlerror());

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotoLibraryLibrary(void)");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("LPApplePhotosTransformers.m"), 37, CFSTR("%s"), v64);

    }
    __break(1u);
  }
  v58[2]();
  v38 = v9;
LABEL_26:

  return v9;
}

void __82__LPApplePhotosMomentMetadata_Transformers__presentationPropertiesForTransformer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 40), "title");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captionBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v8);

  LPLocalizedString(CFSTR("Photos"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leading");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Photos: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPApplePhotosMomentMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  -[LPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  -[LPApplePhotosMomentMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPApplePhotosMomentMetadata earliestAssetDate](self, "earliestAssetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPApplePhotosMomentMetadata latestAssetDate](self, "latestAssetDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(v5, v6, v7, (uint64_t)&v13, (uint64_t)&v12);
  v8 = v13;
  v9 = v12;

  if (v9)
  {
    joinedByEmDash(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v10);

  }
  else
  {
    objc_msgSend(v4, "setTitle:", v8);
  }
  -[LPApplePhotosMomentMetadata keyPhoto](self, "keyPhoto");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v11);

}

@end
