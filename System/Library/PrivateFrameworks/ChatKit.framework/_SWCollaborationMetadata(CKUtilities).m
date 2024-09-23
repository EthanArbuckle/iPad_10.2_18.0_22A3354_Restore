@implementation _SWCollaborationMetadata(CKUtilities)

+ (uint64_t)_contentTypeIsNotFileType:()CKUtilities
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC528])
    && objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4A0])
    && objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4B8]))
  {
    v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC5F8]) ^ 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)contentTypeFromCKShare:()CKUtilities
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[_SWCollaborationMetadata(CKUtilities) contentTypeFromCKShare:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && -[NSObject length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_SWCollaborationMetadata(CKUtilities) contentTypeFromCKShare:].cold.2();

    v6 = 0;
  }
  if (objc_msgSend(a1, "_contentTypeIsNotFileType:", v6))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&v10, 0xCu);
    }

LABEL_14:
    v6 = 0;
  }

  return v6;
}

- (id)updatedCollaborationMetadataContentTypeWithCKShare:()CKUtilities
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "contentTypeFromCKShare:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updatedCollaborationMetadataWithSharingURL:ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", 0, v4, 0, 0, 0, 0, 0, v5, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataContentTypeWithCKShare:].cold.1();

    v6 = 0;
  }

  return v6;
}

+ (id)appBundleIDsFromSharingURL:()CKUtilities
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D39B30]);
    objc_msgSend(v4, "bundleIDsForShareBearURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || !objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "bundleIDsForCollaborationURL:", v3);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_SWCollaborationMetadata(CKUtilities) appBundleIDsFromSharingURL:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)updatedCollaborationMetadataWithSharingURL:()CKUtilities ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:
{
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v56 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v58 = a8;
  v57 = a9;
  v24 = a1;
  v25 = a10;
  v26 = (uint64_t)v21;
  v27 = a11;
  v28 = a12;
  v29 = a13;
  v30 = a14;
  v52 = a15;
  if (v26)
  {
    if (v22)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v24, "localIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v22)
      goto LABEL_3;
  }
  objc_msgSend(v24, "collaborationIdentifier");
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v53 = (uint64_t)v29;
  v54 = v22;
  if (v23 && objc_msgSend(v23, "length")
    || (objc_msgSend(v24, "title"), v31 = objc_claimAutoreleasedReturnValue(), v23, (v23 = (id)v31) != 0))
  {
    v32 = objc_msgSend(v23, "length");
    if (v56 && !v32)
      goto LABEL_8;
  }
  else if (v56)
  {
LABEL_8:
    objc_msgSend(v56, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
    v33 = objc_claimAutoreleasedReturnValue();

    v23 = (id)v33;
  }
  if (!v58)
  {
    objc_msgSend(v24, "defaultShareOptions");
    v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v57)
  {
    objc_msgSend(v24, "creationDate");
    v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = (uint64_t)v30;
  if (v25)
  {
    v35 = v55 != 0;
  }
  else
  {
    objc_msgSend(v24, "contentType");
    v36 = objc_claimAutoreleasedReturnValue();
    v25 = (id)v36;
    v35 = v55 != 0;
    if (v55 && !v36)
    {
      objc_msgSend((id)objc_opt_class(), "contentTypeFromCKShare:", v56);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v35 = 1;
    }
  }
  if (v27 && objc_msgSend(v27, "count"))
  {
    v37 = v34;
  }
  else
  {
    objc_msgSend(v24, "ckAppBundleIDs");
    v38 = objc_claimAutoreleasedReturnValue();

    v39 = !v35;
    if (v38)
      v39 = 1;
    v27 = (id)v38;
    v37 = v34;
    if ((v39 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "appBundleIDsFromSharingURL:", v55);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!v28 || !objc_msgSend(v28, "length"))
  {
    objc_msgSend(v24, "initiatorHandle");
    v40 = objc_claimAutoreleasedReturnValue();

    v28 = (id)v40;
  }
  v41 = v53;
  if (v53)
  {
    if (v37)
      goto LABEL_32;
  }
  else
  {
    objc_msgSend(v24, "initiatorNameComponents");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v37)
      goto LABEL_32;
  }
  objc_msgSend(v24, "containerSetupInfo");
  v37 = objc_claimAutoreleasedReturnValue();
LABEL_32:
  v42 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(v24, "sourceProcessData");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v42;
  v50 = v37;
  v51 = v42;
  v44 = (void *)v37;
  v45 = (void *)v41;
  v46 = (void *)v26;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7400]), "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v26, v54, v23, v58, v57, v25, v27, v28, v41, v50, v51);
  IMLogHandleForCategory();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v55;
    _os_log_impl(&dword_18DFCD000, v48, OS_LOG_TYPE_INFO, "Updating collaboration metadata for sharing url %@:", buf, 0xCu);
  }

  objc_msgSend(v47, "_logSelf");
  return v47;
}

- (void)_logSelf
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v3;
    _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "    localIdentifier: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "collaborationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v5;
    _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "    collaborationIdentifier: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v7;
    _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "    title: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "defaultShareOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v9;
    _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "    defaultShareOptions: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v11;
    _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "    creationDate: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v13;
    _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "    contentType: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "ckAppBundleIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v16;
    _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "    ckAppBundleIDs: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "initiatorHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v18;
    _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "    initiatorHandle: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "initiatorHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v20;
    _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "    initiatorNameComponents: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "containerSetupInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v22;
    _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "    containerSetupInfo: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "sourceProcessData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v24;
    _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "    sourceProcessData: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "userSelectedShareOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v26;
    _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "    userSelectedShareOptions: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "defaultOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v28;
    _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "    defaultOptions: %@", (uint8_t *)&v31, 0xCu);

  }
  IMLogHandleForCategory();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "defaultShareOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v30;
    _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "    defaultShareOptions: %@", (uint8_t *)&v31, 0xCu);

  }
}

- (id)updatedCollaborationMetadataWithUpdatedMetadata:()CKUtilities ckShare:sharingURL:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "localIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultShareOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ckAppBundleIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initiatorHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initiatorNameComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerSetupInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceProcessData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updatedCollaborationMetadataWithSharingURL:ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v10, v9, v25, v23, v22, v21, v20, v19, v18, v11, v12, v13, v14);
    v24 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v24;
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataWithUpdatedMetadata:ckShare:sharingURL:].cold.1();

    v15 = a1;
  }

  return v15;
}

- (id)updatedCollaborationMetadataAppBundleIDsWithSharingURL:()CKUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "appBundleIDsFromSharingURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(a1, "updatedCollaborationMetadataWithAppBundleIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataAppBundleIDsWithSharingURL:].cold.1((uint64_t)v4, v8);

    v7 = 0;
  }

  return v7;
}

- (void)updateInitiatorName:()CKUtilities email:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
    objc_msgSend(a1, "setInitiatorHandle:", v8);
  if (v6 && objc_msgSend(v6, "length"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v9, "personNameComponentsFromString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setInitiatorNameComponents:", v10);

  }
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "initiatorHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "initiatorNameComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Updated initiator name: %@, components: %@", (uint8_t *)&v14, 0x16u);

  }
}

- (uint64_t)updatedCollaborationMetadataWithAppBundleIDs:()CKUtilities
{
  return objc_msgSend(a1, "updatedCollaborationMetadataWithSharingURL:ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", 0, 0, 0, 0, 0, 0, 0, 0, a3, 0, 0, 0, 0);
}

- (uint64_t)updatedCollaborationMetadataWithTitle:()CKUtilities contentType:ckAppBundleIDs:
{
  return objc_msgSend(a1, "updatedCollaborationMetadataWithSharingURL:ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", 0, 0, 0, 0, a3, 0, 0, a4, a5, 0, 0, 0, 0);
}

- (uint64_t)checkSendReadiness
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v28[16];

  objc_msgSend(a1, "collaborationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  if (!v2)
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.8();

  }
  objc_msgSend(a1, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.7();

    v3 = 0;
  }
  objc_msgSend(a1, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        objc_msgSend(a1, "title"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        !v10))
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.6();

    v3 = 0;
  }
  objc_msgSend(a1, "defaultShareOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.5();

    v3 = 0;
  }
  objc_msgSend(a1, "ckAppBundleIDs");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        objc_msgSend(a1, "ckAppBundleIDs"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "count"),
        v16,
        v15,
        !v17))
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.4();

    v3 = 0;
  }
  objc_msgSend(a1, "initiatorHandle");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        objc_msgSend(a1, "initiatorHandle"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "length"),
        v21,
        v20,
        !v22))
  {
    IMLogHandleForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.3();

    v3 = 0;
  }
  objc_msgSend(a1, "initiatorNameComponents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v3)
    {
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "CollaborationMetadata is ready to send:", v28, 2u);
      }
      goto LABEL_37;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.2();

  }
  IMLogHandleForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.1();
LABEL_37:

  return objc_msgSend(a1, "_logSelf");
}

+ (void)contentTypeFromCKShare:()CKUtilities .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "contentTypeFromCKShare", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)contentTypeFromCKShare:()CKUtilities .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "typeIndentifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updatedCollaborationMetadataContentTypeWithCKShare:()CKUtilities .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "share cannot be nil in updatedCollaborationMetadataContentTypeWithCKShare", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appBundleIDsFromSharingURL:()CKUtilities .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "sharingURL cannot be nil in appBundleIDsFromSharingURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updatedCollaborationMetadataWithUpdatedMetadata:()CKUtilities ckShare:sharingURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Passed in nil updated CollaborationMetadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updatedCollaborationMetadataAppBundleIDsWithSharingURL:()CKUtilities .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "no bundle ids found for sharing URL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)checkSendReadiness
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "CollaborationMetadata is missing collaborationIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
