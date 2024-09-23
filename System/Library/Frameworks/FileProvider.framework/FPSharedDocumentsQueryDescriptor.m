@implementation FPSharedDocumentsQueryDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SHRD");
}

- (id)queryStringForMountPoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;

  -[FPSpotlightQueryDescriptor settings](self, "settings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedFileTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedFileTypes");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = (void *)v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;
  v29 = v11;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "excludedParentOIDs");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  v16 = v15;

  v17 = (void *)MEMORY[0x1E0CB3940];
  FPContentTypeQueryStringForFileTypes(v5, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  FPIsTrashedQueryStringFragment(0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allowedProviders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  FPFileProviderOriginatedItemsQueryStringFragment(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedCollaborationInvitationsQueryStringFragment();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "excludedParentOIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedOIDParentsQueryStringFragment(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("(kMDItemIsShared = \"1\") && (%@) && (%@) && (%@) && (FPIsTopLevelSharedItem = \"1\") && (%@) && (%@)"), v18, v19, v22, v23, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)supportsQueryingAllMountPoints
{
  return 0;
}

@end
