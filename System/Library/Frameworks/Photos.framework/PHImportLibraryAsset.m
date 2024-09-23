@implementation PHImportLibraryAsset

+ (BOOL)isValidAsSidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PLIST")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___PHImportLibraryAsset;
    v7 = objc_msgSendSuper2(&v9, sel_isValidAsSidecar_, v4);
  }

  return v7;
}

- (PHImportLibraryAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7
{
  uint64_t v8;
  id v12;
  PHImportLibraryAsset *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFAllocator *v25;
  CFDictionaryRef v26;
  CFDictionaryRef v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  PHImportLibraryAsset *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  objc_super v62;
  CMTime time;
  CMTime v64;
  CMTime v65;
  unsigned __int16 v66;
  unsigned __int16 v67;
  unsigned __int16 v68;
  _WORD v69[5];

  v8 = a6;
  v12 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PHImportLibraryAsset;
  v13 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](&v62, sel_initWithSource_url_type_supportedMediaType_uuid_, a3, v12, a5, v8, a7);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:exists:includeUnknownAttributes:", v12, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73FA0]);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = 0;
    if (objc_msgSend(v14, "getUInt16:forKey:", v69, *MEMORY[0x1E0D73F48]))
      v16 = v69[0] == 0;
    else
      v16 = 1;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("importedBy"));

    }
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73F38]);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("importedByBundleIdentifier"));
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73F40]);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("importedByDisplayName"));
    v68 = 0;
    if (objc_msgSend(v14, "getUInt16:forKey:", &v68, *MEMORY[0x1E0D73F30]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v68);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("hidden"));

    }
    v67 = 0;
    if (objc_msgSend(v14, "getUInt16:forKey:", &v67, *MEMORY[0x1E0D73F28]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v67);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("favorite"));

    }
    v66 = 0;
    if (objc_msgSend(v14, "getUInt16:forKey:", &v66, *MEMORY[0x1E0D74000]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v66);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("trashedState"));

      LOWORD(v65.value) = 0;
      objc_msgSend(v14, "getUInt16:forKey:", &v65, *MEMORY[0x1E0D74008]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v65.value));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("trashedReason"));

    }
    objc_msgSend(v14, "dataForKey:", *MEMORY[0x1E0D73F20]);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v65 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      v64 = v65;
      objc_msgSend(MEMORY[0x1E0D71570], "fromExtraDurationData:getStillDisplayTime:videoDuration:", v24, &v65, &v64);
      v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      time = v64;
      v26 = CMTimeCopyAsDictionary(&time, v25);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("photoIrisVideoDuration"));

      time = v65;
      v27 = CMTimeCopyAsDictionary(&time, v25);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("photoIrisStillDisplayTime"));

    }
    LOWORD(v64.value) = 0;
    if (objc_msgSend(v14, "getUInt16:forKey:", &v64, *MEMORY[0x1E0D74018]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v64.value));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("videoCpVisibilityState"));

    }
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73FF8]);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, CFSTR("title"));
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73EA8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("accessibilityDescription"));
    v61 = v12;
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73F18]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("additionalAttributes.longDescription"));
    objc_msgSend(v14, "stringForKey:", *MEMORY[0x1E0D73FE8], v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("additionalAttributes.timeZoneName"));
    v59 = (void *)v18;
    LODWORD(v65.value) = 0;
    if (objc_msgSend(v14, "getInt32:forKey:", &v65, *MEMORY[0x1E0D73FF0]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v65.value));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("additionalAttributes.timeZoneOffset"));

    }
    v57 = v13;
    v58 = (void *)v19;
    objc_msgSend(v14, "dataForKey:", *MEMORY[0x1E0D73EE8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v34, 0, 0, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = (void *)v35;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, CFSTR("dateCreated"));

      }
    }
    v37 = (void *)v24;
    objc_msgSend(v14, "dataForKey:", *MEMORY[0x1E0D73FA8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v38, CFSTR("placeAnnotationData"));
    objc_msgSend(v14, "dataForKey:", *MEMORY[0x1E0D73EF0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, CFSTR("location"));
    if (objc_msgSend(v15, "count"))
      v40 = v15;
    else
      v40 = 0;
    v41 = v40;

    v42 = v60;
    v13 = v57;
    -[PHImportAsset setCustomAssetProperties:](v57, "setCustomAssetProperties:", v41);

    if (v42)
    {
      -[PHImportAsset setCreatedFileName:](v57, "setCreatedFileName:", v42);
    }
    else
    {
      -[PHImportAsset fileName](v57, "fileName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset setCreatedFileName:](v57, "setCreatedFileName:", v43);

    }
    v44 = objc_alloc(MEMORY[0x1E0D73278]);
    -[PHImportAsset uuid](v57, "uuid");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset contentType](v57, "contentType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v44, "initWithAssetUuid:bundleScope:uti:resourceVersion:recipeID:", v45, 0, v47, 1, 0);

    -[PHImportAsset source](v57, "source");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "pathManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "readOnlyUrlWithIdentifier:", v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHImportAsset url](v57, "url");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "lastPathComponent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lastPathComponent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57->_isPenultimate = objc_msgSend(v53, "isEqualToString:", v54);

    v12 = v61;
  }

  return v13;
}

- (id)makeImportIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D73278];
  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PHImportAsset url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidFromURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)configureSidecarTypeForExtension:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PLIST")))
  {
    -[PHImportAsset setResourceType:](self, "setResourceType:", 7);
    -[PHImportAsset setResourceSubType:](self, "setResourceSubType:", 0x10000);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportLibraryAsset;
    -[PHImportAsset configureSidecarTypeForExtension:](&v5, sel_configureSidecarTypeForExtension_, v4);
  }

}

- (BOOL)shouldPreserveUUID
{
  return 1;
}

- (BOOL)isBase
{
  return self->_isPenultimate;
}

- (BOOL)isSidecar
{
  objc_super v4;

  if ((-[PHImportAsset resourceSubType](self, "resourceSubType") & 0x10000) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PHImportLibraryAsset;
  return -[PHImportAsset isSidecar](&v4, sel_isSidecar);
}

- (BOOL)isRender
{
  return -[PHImportAsset resourceType](self, "resourceType") == 5
      || -[PHImportAsset resourceType](self, "resourceType") == 6;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)canDelete
{
  return 0;
}

- (id)nameKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PHImportAsset createdFileName](self, "createdFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportLibraryAsset;
    -[PHImportAsset nameKey](&v8, sel_nameKey);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
