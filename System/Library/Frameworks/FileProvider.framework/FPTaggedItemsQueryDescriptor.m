@implementation FPTaggedItemsQueryDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TGGD");
}

- (id)queryStringForMountPoint:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;

  v4 = a3;
  v5 = CFSTR("kMDItemUserTags");
  v46 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier")))
    v5 = CFSTR("_kMDItemUserTags");
  v6 = v5;
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tagIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  v45 = v6;
  if (v8)
  {
    -[FPSpotlightQueryDescriptor settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ == \"%@\"), v6, v11);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"*\"), v6);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allowedFileTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "excludedFileTypes");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = (void *)MEMORY[0x1E0C9AA60];
  if (v16)
    v19 = (void *)v16;
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "excludedParentOIDs");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = v18;
  v25 = v24;

  v26 = (void *)*MEMORY[0x1E0CEC4F0];
  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v14, "containsObject:", v27);

  v43 = v25;
  v44 = (void *)v12;
  if ((v28 & 1) == 0)
  {
    objc_msgSend(v26, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v30;
  }
  v31 = (void *)MEMORY[0x1E0CB3940];
  FPContentTypeQueryStringForFileTypes(v14, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  FPIsTrashedQueryStringFragment(0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allowedProviders");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  FPFileProviderOriginatedItemsQueryStringFragment(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "excludedParentOIDs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedOIDParentsQueryStringFragment(v38);
  v42 = v20;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("(%@) && (%@) && (%@) && (%@) && (%@)"), v32, v33, v36, v44, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

@end
