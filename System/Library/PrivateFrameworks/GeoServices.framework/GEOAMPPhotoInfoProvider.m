@implementation GEOAMPPhotoInfoProvider

- (GEOAMPPhotoInfoProvider)initWithPhotoContent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  GEOPDPhotoContent *v10;
  GEOPDPhotoContent *templatePhotoContent;
  void *v12;
  double v13;
  double v14;
  void *v15;
  GEOPDPhotoContent *v16;
  uint64_t width;
  void *v18;
  GEOPDPhotoContent *v19;
  uint64_t height;
  void *v21;
  void *v22;
  AMSMediaArtwork *v23;
  AMSMediaArtwork *artwork;
  GEOAMPPhotoInfoProvider *v25;
  objc_super v27;
  _QWORD v28[4];
  int v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AppleMediaServicesLibraryCore())
  {
    v5 = -[GEOAMPPhotoInfoProvider designatedURLType](self, "designatedURLType");
    v6 = (void *)MEMORY[0x1E0CB3880];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ___photoContentForURLType_block_invoke;
    v28[3] = &__block_descriptor_36_e44_B24__0__GEOPDPhotoContent_8__NSDictionary_16l;
    v29 = v5;
    v7 = v4;
    objc_msgSend(v6, "predicateWithBlock:", v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v27.receiver = self;
      v27.super_class = (Class)GEOAMPPhotoInfoProvider;
      self = -[GEOAMPPhotoInfoProvider init](&v27, sel_init);
      if (!self)
      {
LABEL_11:
        self = self;
        v25 = self;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v9, "firstObject");
      v10 = (GEOPDPhotoContent *)objc_claimAutoreleasedReturnValue();
      templatePhotoContent = self->_templatePhotoContent;
      self->_templatePhotoContent = v10;

      -[GEOPDPhotoContent url]((id *)&self->_templatePhotoContent->super.super.isa);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        -[GEOAMPPhotoInfoProvider sizeRatio](self, "sizeRatio");
        v14 = v13;

        if (v14 != 0.0)
        {
          v30[0] = CFSTR("url");
          -[GEOPDPhotoContent url]((id *)&self->_templatePhotoContent->super.super.isa);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v15;
          v30[1] = CFSTR("width");
          v16 = self->_templatePhotoContent;
          if (v16)
            width = v16->_width;
          else
            width = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", width);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31[1] = v18;
          v30[2] = CFSTR("height");
          v19 = self->_templatePhotoContent;
          if (v19)
            height = v19->_height;
          else
            height = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", height);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v31[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = (AMSMediaArtwork *)objc_msgSend(objc_alloc((Class)getAMSMediaArtworkClass()), "initWithDictionary:", v22);
          artwork = self->_artwork;
          self->_artwork = v23;

          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    v25 = 0;
    goto LABEL_15;
  }
  v25 = 0;
LABEL_16:

  return v25;
}

- (double)sizeRatio
{
  GEOPDPhotoContent *templatePhotoContent;
  double result;
  unsigned int height;

  templatePhotoContent = self->_templatePhotoContent;
  result = 0.0;
  if (templatePhotoContent)
  {
    height = templatePhotoContent->_height;
    if (height)
    {
      LODWORD(result) = templatePhotoContent->_width;
      return (double)*(unint64_t *)&result / (double)height;
    }
  }
  return result;
}

- (id)largestPhoto
{
  unint64_t v2;
  GEOPDPhotoContent *templatePhotoContent;
  double v5;
  double v6;
  void *v7;
  void *v8;

  templatePhotoContent = self->_templatePhotoContent;
  if (templatePhotoContent)
  {
    LODWORD(v2) = templatePhotoContent->_width;
    v5 = (double)v2;
    LODWORD(v2) = templatePhotoContent->_height;
    v6 = (double)v2;
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  +[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:](GEOMapItemPhotoOptions, "defaultPhotoOptionsWithAllowSmaller:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAMPPhotoInfoProvider bestPhotoForSize:options:](self, "bestPhotoForSize:options:", v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  uint64_t *v4;
  double height;
  double width;
  id v8;
  unint64_t v9;
  void *v10;
  GEOPDPhotoContent *templatePhotoContent;
  unsigned int v12;
  _GEOPlaceDataPhotoInfo *v13;
  id *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  GEOPDPhotoContent *v28;
  double v29;
  double v30;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v10 = v8;
  templatePhotoContent = self->_templatePhotoContent;
  if (templatePhotoContent)
  {
    LODWORD(v9) = templatePhotoContent->_width;
    if (width > (double)v9)
    {
      v12 = templatePhotoContent->_height;
LABEL_4:
      if ((objc_msgSend(v8, "allowSmaller") & 1) == 0 && height > (double)v12)
      {
        v13 = 0;
        goto LABEL_43;
      }
      goto LABEL_10;
    }
  }
  else if (width > 0.0)
  {
    v12 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v8, "allowSmaller");
LABEL_10:
  switch(objc_msgSend(v10, "preferredCropStyle"))
  {
    case 0:
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x2020000000;
      v14 = (id *)&_MergedGlobals_238;
      v15 = (id *)_MergedGlobals_329;
      v35 = _MergedGlobals_329;
      if (!_MergedGlobals_329)
      {
        v16 = (void *)AppleMediaServicesLibrary();
        v15 = (id *)dlsym(v16, "AMSMediaArtworkCropStyleBoundedBox");
        *((_QWORD *)v33 + 3) = v15;
        _MergedGlobals_329 = (uint64_t)v15;
      }
      goto LABEL_21;
    case 1:
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x2020000000;
      v14 = (id *)&_MergedGlobals_238;
      v15 = (id *)qword_1ECDBCB58;
      v35 = qword_1ECDBCB58;
      if (!qword_1ECDBCB58)
      {
        v20 = (void *)AppleMediaServicesLibrary();
        v15 = (id *)dlsym(v20, "AMSMediaArtworkCropStyleConstrainedHeight");
        *((_QWORD *)v33 + 3) = v15;
        qword_1ECDBCB58 = (uint64_t)v15;
      }
      goto LABEL_21;
    case 2:
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x2020000000;
      v14 = (id *)&_MergedGlobals_238;
      v15 = (id *)qword_1ECDBCB60;
      v35 = qword_1ECDBCB60;
      if (!qword_1ECDBCB60)
      {
        v17 = (void *)AppleMediaServicesLibrary();
        v15 = (id *)dlsym(v17, "AMSMediaArtworkCropStyleConstrainedWidth");
        *((_QWORD *)v33 + 3) = v15;
        qword_1ECDBCB60 = (uint64_t)v15;
      }
      goto LABEL_21;
    case 3:
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x2020000000;
      v14 = (id *)&_MergedGlobals_238;
      v15 = (id *)qword_1ECDBCB68;
      v35 = qword_1ECDBCB68;
      if (!qword_1ECDBCB68)
      {
        v18 = (void *)AppleMediaServicesLibrary();
        v15 = (id *)dlsym(v18, "AMSMediaArtworkCropStyleSquareCenterCrop");
        *((_QWORD *)v33 + 3) = v15;
        qword_1ECDBCB68 = (uint64_t)v15;
      }
      goto LABEL_21;
    case 4:
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x2020000000;
      v14 = (id *)&_MergedGlobals_238;
      v15 = (id *)qword_1ECDBCB70;
      v35 = qword_1ECDBCB70;
      if (!qword_1ECDBCB70)
      {
        v19 = (void *)AppleMediaServicesLibrary();
        v15 = (id *)dlsym(v19, "AMSMediaArtworkCropStyleSpecificRectangle");
        *((_QWORD *)v33 + 3) = v15;
        qword_1ECDBCB70 = (uint64_t)v15;
      }
LABEL_21:
      _Block_object_dispose(buf, 8);
      if (!v15)
        goto LABEL_48;
      v21 = (id *)*v15;
LABEL_23:
      v15 = v21;
      if (!v21)
      {
LABEL_44:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: ampCropStyle != ((void *)0)", buf, 2u);
        }
        getAMSMediaArtworkCropStyleSourceSize();
        v15 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v22 = objc_msgSend(v10, "preferredFormat");
      if (v22 == 2)
      {
        *(_QWORD *)buf = 0;
        v33 = buf;
        v34 = 0x2020000000;
        v4 = &_MergedGlobals_238;
        v14 = (id *)qword_1ECDBCB80;
        v35 = qword_1ECDBCB80;
        if (!qword_1ECDBCB80)
        {
          v24 = (void *)AppleMediaServicesLibrary();
          v14 = (id *)dlsym(v24, "AMSMediaArtworkFormatPNG");
          *((_QWORD *)v33 + 3) = v14;
          qword_1ECDBCB80 = (uint64_t)v14;
        }
        goto LABEL_32;
      }
      if (v22 == 1)
      {
        *(_QWORD *)buf = 0;
        v33 = buf;
        v34 = 0x2020000000;
        v4 = &_MergedGlobals_238;
        v14 = (id *)qword_1ECDBCB78;
        v35 = qword_1ECDBCB78;
        if (!qword_1ECDBCB78)
        {
          v25 = (void *)AppleMediaServicesLibrary();
          v14 = (id *)dlsym(v25, "AMSMediaArtworkFormatJPG");
          *((_QWORD *)v33 + 3) = v14;
          qword_1ECDBCB78 = (uint64_t)v14;
        }
LABEL_32:
        _Block_object_dispose(buf, 8);
        if (!v14)
        {
LABEL_48:
          dlerror();
          abort_report_np();
          goto LABEL_49;
        }
        v23 = (id *)*v14;
        goto LABEL_34;
      }
      if (v22)
        goto LABEL_35;
      getAMSMediaArtworkFormatHEIC();
      v23 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      v14 = v23;
      if (v23)
        goto LABEL_38;
LABEL_35:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: ampFormat != ((void *)0)", buf, 2u);
      }
      getAMSMediaArtworkFormatHEIC();
      v14 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_38:
      -[AMSMediaArtwork URLWithSize:cropStyle:format:](self->_artwork, "URLWithSize:cropStyle:format:", v15, v14, width, height);
      v4 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      v28 = self->_templatePhotoContent;
      if (v28)
      {
        LODWORD(v26) = v28->_width;
        v29 = (double)v26;
        LODWORD(v27) = v28->_height;
        v30 = (double)v27;
        goto LABEL_40;
      }
LABEL_49:
      v29 = 0.0;
      v30 = 0.0;
LABEL_40:
      if (width > v29 && height > v30)
      {
        width = v29;
        height = v30;
      }
      v13 = -[_GEOPlaceDataPhotoInfo initWithURL:width:height:]([_GEOPlaceDataPhotoInfo alloc], "initWithURL:width:height:", v4, width, height);

LABEL_43:
      return v13;
    case 5:
      getAMSMediaArtworkCropStyleSourceSize();
      v21 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    default:
      goto LABEL_44;
  }
}

- (int)designatedURLType
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templatePhotoContent, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
