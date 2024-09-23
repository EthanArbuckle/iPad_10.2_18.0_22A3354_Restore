@implementation GEOAppleMediaServicesResult

- (GEOAppleMediaServicesResult)initWithIdentifier:(id)a3 mediaType:(int64_t)a4 displayName:(id)a5 shortName:(id)a6 artistName:(id)a7 url:(id)a8 subtitle:(id)a9 editorialSubtitle:(id)a10 iOSBundleIdentifier:(id)a11 artworkURL:(id)a12 ratingsCount:(int)a13 ratingsValue:(float)a14 transitModes:(id)a15 classType:(id)a16 episodeNumber:(int)a17 duration:(double)a18
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  GEOAppleMediaServicesResult *v36;
  void *v37;
  GEOAppleMediaServicesResult *v38;
  GEOAppleMediaServicesResult *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *identifier;
  uint64_t v44;
  NSString *displayName;
  uint64_t v46;
  NSString *shortName;
  uint64_t v48;
  NSString *subtitle;
  uint64_t v50;
  NSString *editorialSubtitle;
  uint64_t v52;
  NSString *iOSBundleIdentifier;
  uint64_t v54;
  NSString *artistName;
  uint64_t v56;
  NSString *classType;
  id v58;
  void *v59;
  id obj;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  objc_super v69;

  v24 = a3;
  v25 = a5;
  v63 = a6;
  v64 = a7;
  obj = a8;
  v26 = a8;
  v27 = a9;
  v28 = a10;
  v67 = a11;
  v29 = a12;
  v30 = a15;
  v31 = a16;
  v32 = v24;
  v33 = objc_msgSend(v24, "length");
  v66 = v29;
  v34 = v30;
  if (v33)
  {
    v35 = objc_msgSend(v25, "length");
    v36 = 0;
    v65 = v25;
    if (v26)
    {
      v37 = v63;
      if (v35)
      {
        v69.receiver = self;
        v69.super_class = (Class)GEOAppleMediaServicesResult;
        v38 = -[GEOAppleMediaServicesResult init](&v69, sel_init);
        v39 = v38;
        v40 = v64;
        v41 = v28;
        if (v38)
        {
          v38->_mediaType = a4;
          v42 = objc_msgSend(v32, "copy");
          identifier = v39->_identifier;
          v39->_identifier = (NSString *)v42;

          v44 = objc_msgSend(v65, "copy");
          displayName = v39->_displayName;
          v39->_displayName = (NSString *)v44;

          v46 = objc_msgSend(v63, "copy");
          shortName = v39->_shortName;
          v39->_shortName = (NSString *)v46;

          objc_storeStrong((id *)&v39->_url, obj);
          v48 = objc_msgSend(v27, "copy");
          subtitle = v39->_subtitle;
          v39->_subtitle = (NSString *)v48;

          v50 = objc_msgSend(v28, "copy");
          editorialSubtitle = v39->_editorialSubtitle;
          v39->_editorialSubtitle = (NSString *)v50;

          v52 = objc_msgSend(v67, "copy");
          iOSBundleIdentifier = v39->_iOSBundleIdentifier;
          v39->_iOSBundleIdentifier = (NSString *)v52;

          objc_storeStrong((id *)&v39->_artworkURL, a12);
          v39->_ratingsCount = a13;
          v39->_ratingsValue = a14;
          objc_storeStrong((id *)&v39->_transitModes, a15);
          v54 = objc_msgSend(v64, "copy");
          artistName = v39->_artistName;
          v39->_artistName = (NSString *)v54;

          v56 = objc_msgSend(v31, "copy");
          classType = v39->_classType;
          v39->_classType = (NSString *)v56;

          v39->_episodeNumber = a17;
          v39->_duration = a18;
        }
        v36 = v39;
        self = v36;
        goto LABEL_10;
      }
    }
    else
    {
      v37 = v63;
    }
    v40 = v64;
    v41 = v28;
LABEL_10:
    v59 = v65;
    goto LABEL_11;
  }
  v36 = 0;
  v58 = v25;
  v37 = v63;
  v40 = v64;
  v41 = v28;
  v59 = v58;
LABEL_11:

  return v36;
}

- (GEOAppleMediaServicesResult)initWithResponseDictionary:(id)a3 mediaType:(int64_t)a4 artworkSize:(CGSize)a5 screenScale:(double)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id *v42;
  void *v43;
  GEOAppleMediaServicesResult *v44;
  id v45;
  _QWORD *v46;
  void *v47;
  GEOAppleMediaServicesResult *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  GEOAppleMediaServicesResult *v65;
  _Unwind_Exception *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v79 = v12;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("editorialNotes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("artistName"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("url"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("postUrl"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  v70 = v20;
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ios"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ios"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("shortName"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("editorialNotes"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("short"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ios"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("bundleId"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("episodeNumber"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v34, "intValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("durationInMilliseconds"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v38 = v37;

  v39 = 0;
  if (a6 > 0.0 && height > 0.0 && width > 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "_artworkDictionaryFromResponseDictionary:", v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 && AppleMediaServicesLibraryCore())
    {
      v41 = (void *)objc_msgSend(objc_alloc((Class)getAMSMediaArtworkClass()), "initWithDictionary:", v40);
      v82 = 0;
      v83 = &v82;
      v84 = 0x2020000000;
      v42 = (id *)_MergedGlobals_339;
      v85 = _MergedGlobals_339;
      if (!_MergedGlobals_339)
      {
        v43 = (void *)AppleMediaServicesLibrary();
        v42 = (id *)dlsym(v43, "AMSMediaArtworkCropStyleSquareCenterCrop");
        v83[3] = (uint64_t)v42;
        _MergedGlobals_339 = (uint64_t)v42;
      }
      v44 = self;
      _Block_object_dispose(&v82, 8);
      if (!v42)
        goto LABEL_27;
      v45 = *v42;
      v82 = 0;
      v83 = &v82;
      v84 = 0x2020000000;
      v46 = (_QWORD *)qword_1ECDBCC70;
      v85 = qword_1ECDBCC70;
      if (!qword_1ECDBCC70)
      {
        v47 = (void *)AppleMediaServicesLibrary();
        v46 = dlsym(v47, "AMSMediaArtworkFormatJPG");
        v83[3] = (uint64_t)v46;
        qword_1ECDBCC70 = (uint64_t)v46;
      }
      _Block_object_dispose(&v82, 8);
      if (!v46)
      {
LABEL_27:
        dlerror();
        v67 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v82, 8);
        _Unwind_Resume(v67);
      }
      objc_msgSend(v41, "URLWithSize:cropStyle:format:", v45, *v46, width * a6, height * a6);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      self = v44;
    }
    else
    {
      v39 = 0;
    }

  }
  v48 = self;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("userRating"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ratingCount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "intValue");

  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("value"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "floatValue");
  v55 = v54;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("transitModes"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  LOBYTE(v85) = 1;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __92__GEOAppleMediaServicesResult_initWithResponseDictionary_mediaType_artworkSize_screenScale___block_invoke;
  v81[3] = &unk_1E1C210A0;
  v81[4] = &v82;
  objc_msgSend(v57, "enumerateObjectsUsingBlock:", v81);
  if (!*((_BYTE *)v83 + 24))
  {

    v57 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("relationships"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("modalities"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("data"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "firstObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("attributes"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("name"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v69) = v71;
  LODWORD(v68) = v52;
  LODWORD(v64) = v55;
  v65 = -[GEOAppleMediaServicesResult initWithIdentifier:mediaType:displayName:shortName:artistName:url:subtitle:editorialSubtitle:iOSBundleIdentifier:artworkURL:ratingsCount:ratingsValue:transitModes:classType:episodeNumber:duration:](v48, "initWithIdentifier:mediaType:displayName:shortName:artistName:url:subtitle:editorialSubtitle:iOSBundleIdentifier:artworkURL:ratingsCount:ratingsValue:transitModes:classType:episodeNumber:duration:", v80, a4, v79, v76, v73, v78, v64, v38, v77, v75, v74, v39, v68, v57, v63, v69);

  _Block_object_dispose(&v82, 8);
  return v65;
}

void __92__GEOAppleMediaServicesResult_initWithResponseDictionary_mediaType_artworkSize_screenScale___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (GEOAppleMediaServicesResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  GEOAppleMediaServicesResult *v29;

  v3 = a3;
  v23 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mediaType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editorialSubtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iOSBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeIntForKey:", CFSTR("ratingsCount"));
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("ratingsValue"));
  v9 = v8;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeIntForKey:", CFSTR("episodeNumber"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("duration"));
  v13 = v12;
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("transitModes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = v11;
  LODWORD(v18) = v7;
  LODWORD(v16) = v9;
  v29 = -[GEOAppleMediaServicesResult initWithIdentifier:mediaType:displayName:shortName:artistName:url:subtitle:editorialSubtitle:iOSBundleIdentifier:artworkURL:ratingsCount:ratingsValue:transitModes:classType:episodeNumber:duration:](self, "initWithIdentifier:mediaType:displayName:shortName:artistName:url:subtitle:editorialSubtitle:iOSBundleIdentifier:artworkURL:ratingsCount:ratingsValue:transitModes:classType:episodeNumber:duration:", v27, v23, v22, v25, v15, v24, v16, v13, v4, v5, v6, v20, v18, v14, v10, v19);

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  id v17;

  v17 = a3;
  objc_msgSend(v17, "encodeInteger:forKey:", -[GEOAppleMediaServicesResult mediaType](self, "mediaType"), CFSTR("mediaType"));
  -[GEOAppleMediaServicesResult identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[GEOAppleMediaServicesResult displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[GEOAppleMediaServicesResult shortName](self, "shortName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("shortName"));

  -[GEOAppleMediaServicesResult url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("url"));

  -[GEOAppleMediaServicesResult subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("subtitle"));

  -[GEOAppleMediaServicesResult editorialSubtitle](self, "editorialSubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("editorialSubtitle"));

  -[GEOAppleMediaServicesResult iOSBundleIdentifier](self, "iOSBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("iOSBundleIdentifier"));

  -[GEOAppleMediaServicesResult artworkURL](self, "artworkURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("artworkURL"));

  objc_msgSend(v17, "encodeInt:forKey:", -[GEOAppleMediaServicesResult ratingsCount](self, "ratingsCount"), CFSTR("ratingsCount"));
  -[GEOAppleMediaServicesResult ratingsValue](self, "ratingsValue");
  objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("ratingsValue"));
  -[GEOAppleMediaServicesResult transitModes](self, "transitModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("transitModes"));

  -[GEOAppleMediaServicesResult artistName](self, "artistName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("artistName"));

  -[GEOAppleMediaServicesResult classType](self, "classType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("classType"));

  objc_msgSend(v17, "encodeInt:forKey:", -[GEOAppleMediaServicesResult episodeNumber](self, "episodeNumber"), CFSTR("episodeNumber"));
  -[GEOAppleMediaServicesResult duration](self, "duration");
  objc_msgSend(v17, "encodeDouble:forKey:", CFSTR("duration"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isAppInstalled
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[GEOAppleMediaServicesResult iOSBundleIdentifier](self, "iOSBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  objc_msgSend(v5, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInstalled");

  return v7;
}

+ (id)_artworkDictionaryFromResponseDictionary:(id)a3
{
  id v3;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ios"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artwork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artwork"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("artworks"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("editorialVideo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("storeFrontVideo4x3"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("previewFrame"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("relationships"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("books"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("data"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("attributes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("artwork"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v23 = v16;
  else
    v23 = v22;
  if (v12)
    v23 = v12;
  if (v9)
    v23 = v9;
  if (v7)
    v24 = v7;
  else
    v24 = v23;
  v25 = v24;

  return v25;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)iOSBundleIdentifier
{
  return self->_iOSBundleIdentifier;
}

- (void)setIOSBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (int)ratingsCount
{
  return self->_ratingsCount;
}

- (void)setRatingsCount:(int)a3
{
  self->_ratingsCount = a3;
}

- (float)ratingsValue
{
  return self->_ratingsValue;
}

- (void)setRatingsValue:(float)a3
{
  self->_ratingsValue = a3;
}

- (NSArray)transitModes
{
  return self->_transitModes;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)editorialSubtitle
{
  return self->_editorialSubtitle;
}

- (int)episodeNumber
{
  return self->_episodeNumber;
}

- (NSString)classType
{
  return self->_classType;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_classType, 0);
  objc_storeStrong((id *)&self->_editorialSubtitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_transitModes, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_iOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
