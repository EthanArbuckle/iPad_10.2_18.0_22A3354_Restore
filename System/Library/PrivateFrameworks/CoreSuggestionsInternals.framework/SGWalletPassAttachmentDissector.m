@implementation SGWalletPassAttachmentDissector

+ (BOOL)canAddPass:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getPKAddPassesViewControllerClass_softClass;
  v11 = getPKAddPassesViewControllerClass_softClass;
  if (!getPKAddPassesViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPKAddPassesViewControllerClass_block_invoke;
    v7[3] = &unk_1E7DB7220;
    v7[4] = &v8;
    __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  LOBYTE(v5) = objc_msgSend(v5, "canAddPasses");

  return (char)v5;
}

+ (BOOL)isPassAvailable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(getPKPassLibraryClass(), "isPassLibraryAvailable"))
  {
    objc_msgSend(getPKPassLibraryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsPass:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_filteredWalletPassAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

- (id)_enrichmentsForWalletPassDictionary:(id)a3 filePath:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SGPipelineEnrichment *v14;
  void *v15;
  SGPipelineEnrichment *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  id v32;
  SGPipelineEnrichment *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serial"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duplicateKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForWalletPassIdentifier:parentKey:](SGDuplicateKey, "duplicateKeyForWalletPassIdentifier:parentKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [SGPipelineEnrichment alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("description"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](v14, "initWithDuplicateKey:title:parent:", v13, v15, v10);

  v32 = 0;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, &v32);
  v18 = v32;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "walletPassData:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      -[SGEntity addTag:](v16, "addTag:", v19);
    }
    else
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v31;
        _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "%@: Entity tag is nil for wallet pass data. Skipping this order", buf, 0xCu);

      }
      v20 = 0;
    }
  }
  else
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v22;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v18;
      _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "%@: Could not load data for file path: %@. Error: %@", buf, 0x20u);

    }
  }

  objc_msgSend(MEMORY[0x1E0D197F0], "walletPassDictionary:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v29;
      _os_log_error_impl(&dword_1C3607000, v26, OS_LOG_TYPE_ERROR, "%@: Entity tag is nil for wallet pass dictionary. Skipping this order", buf, 0xCu);

    }
    if (v16)
      goto LABEL_11;
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  -[SGEntity addTag:](v16, "addTag:", v24);
  if (!v16)
    goto LABEL_15;
LABEL_11:
  v33 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v25;
}

- (id)_passDataForFilePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v5, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)v14;

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = &stru_1E7DB83A8;
      *(_DWORD *)buf = 138412802;
      v16 = v12;
      if (v7)
        v13 = v7;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to read data for wallet pass: %@ - Error: %@", buf, 0x20u);

    }
  }

  return v6;
}

- (id)_extractRelevantSemanticTagsFromPass:(id)a3
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  int v110;
  void *v111;
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[3];

  v117[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getPKPassSemanticStringKeyEventType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyEventType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

  getPKPassSemanticStringKeyEventName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyEventName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

  getPKPassSemanticDateKeyEventStartDate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticDateKeyEventStartDate();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);

  getPKPassSemanticDateKeyEventEndDate();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticDateKeyEventEndDate();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v21);

  getPKPassSemanticNumberKeySilenceRequested();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticNumberKeySilenceRequested();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);

  getPKPassSemanticStringKeyVenueName();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyVenueName();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v29);

  getPKPassSemanticStringKeyVenueRoom();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyVenueRoom();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, v33);

  getPKPassSemanticStringKeyVenueEntrance();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyVenueEntrance();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, v37);

  getPKPassSemanticStringKeyVenuePhoneNumber();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringValue");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyVenuePhoneNumber();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, v41);

  getPKPassSemanticLocationKeyVenueLocation();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "locationValue");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v116[0] = CFSTR("lat");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "coordinate");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = CFSTR("lon");
    v117[0] = v46;
    v47 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "coordinate");
    objc_msgSend(v47, "numberWithDouble:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    getPKPassSemanticLocationKeyVenueLocation();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, v51);

  }
  getPKPassSemanticDateKeyOriginalDepartureDate();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dateValue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticDateKeyOriginalDepartureDate();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, v55);

  getPKPassSemanticDateKeyOriginalArrivalDate();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "dateValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticDateKeyOriginalArrivalDate();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, v59);

  getPKPassSemanticStringKeyDepartureLocationDescription();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyDepartureLocationDescription();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, v63);

  getPKPassSemanticLocationKeyDepartureLocation();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "locationValue");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v114[0] = CFSTR("lat");
    v67 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v66, "coordinate");
    objc_msgSend(v67, "numberWithDouble:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = CFSTR("lon");
    v115[0] = v68;
    v69 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v66, "coordinate");
    objc_msgSend(v69, "numberWithDouble:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v71;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    getPKPassSemanticLocationKeyDepartureLocation();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, v73);

  }
  getPKPassSemanticLocationKeyDestinationLocation();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "locationValue");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v112[0] = CFSTR("lat");
    v77 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v76, "coordinate");
    objc_msgSend(v77, "numberWithDouble:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = CFSTR("lon");
    v113[0] = v78;
    v79 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v76, "coordinate");
    objc_msgSend(v79, "numberWithDouble:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    getPKPassSemanticLocationKeyDestinationLocation();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v82, v83);

  }
  getPKPassSemanticStringKeyDestinationLocationDescription();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "stringValue");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyDestinationLocationDescription();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v86, v87);

  getPKPassSemanticStringKeyFlightCode();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "stringValue");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyFlightCode();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v90, v91);

  getPKPassSemanticNumberKeyFlightNumber();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "numberValue");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticNumberKeyFlightNumber();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, v95);

  getPKPassSemanticStringKeyAirlineCode();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "stringValue");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyAirlineCode();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, v99);

  getPKPassSemanticStringKeyDepartureAirportCode();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "stringValue");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyDepartureAirportCode();
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v102, v103);

  getPKPassSemanticStringKeyDestinationAirportCode();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "stringValue");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  getPKPassSemanticStringKeyDestinationAirportCode();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v106, v107);

  sgLogHandle();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    v110 = 138477827;
    v111 = v4;
    _os_log_debug_impl(&dword_1C3607000, v108, OS_LOG_TYPE_DEBUG, "SGWalletPassAttachmentDissector: Extracted relevant semantic tags from pass: %{private}@", (uint8_t *)&v110, 0xCu);
  }

  return v4;
}

- (id)_extractPassInformation:(id)a3 filePath:(id)a4 state:(int)a5
{
  id v8;
  id v9;
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
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *v40;
  objc_class *v41;
  void *v42;
  id v43;
  objc_class *v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v8, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("description"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E7DB83A8, CFSTR("description"));
  }

  objc_msgSend(v8, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v8, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("name"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E7DB83A8, CFSTR("name"));
  }

  objc_msgSend(v8, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v8, "serialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("serial"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E7DB83A8, CFSTR("serial"));
  }

  objc_msgSend(v8, "organizationName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v8, "organizationName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("organization"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E7DB83A8, CFSTR("organization"));
  }

  objc_msgSend(v8, "passURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(v8, "passURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("url"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E7DB83A8, CFSTR("url"));
  }

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("filepath"));
  walletPassStateDescription(a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("passState"));

  objc_msgSend(v8, "localizedName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("BoardingPass"));

  objc_msgSend(v8, "allSemantics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[SGWalletPassAttachmentDissector _extractRelevantSemanticTagsFromPass:](self, "_extractRelevantSemanticTagsFromPass:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValuesForKeysWithDictionary:", v28);

  }
  objc_msgSend(v8, "serialNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    sgLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138412290;
      v47 = v42;
      _os_log_error_impl(&dword_1C3607000, v31, OS_LOG_TYPE_ERROR, "%@: Missing serial number. Skipping wallet pass", (uint8_t *)&v46, 0xCu);

    }
    goto LABEL_29;
  }
  if (!v25)
    goto LABEL_31;
  getPKPassSemanticDateKeyOriginalDepartureDate();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v30);
  v31 = objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v31, "timeIntervalSinceDate:", v33);
    v35 = v34;

    if (v35 < 0.0 && (v32 & 1) == 0)
    {
      sgLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412547;
        v47 = v38;
        v48 = 2113;
        v49 = v39;
        v40 = "%@: Ignoring old pass: %{private}@";
LABEL_34:
        _os_log_debug_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEBUG, v40, (uint8_t *)&v46, 0x16u);

        goto LABEL_28;
      }
      goto LABEL_28;
    }

LABEL_31:
    v43 = v10;
    goto LABEL_32;
  }
  sgLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412547;
    v47 = v38;
    v48 = 2113;
    v49 = v39;
    v40 = "%@: Ignoring pass without departure date: %{private}@";
    goto LABEL_34;
  }
LABEL_28:

LABEL_29:
  v43 = 0;
LABEL_32:

  return v43;
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id obj;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t v58[128];
  _BYTE buf[24];
  void *v60;
  uint64_t *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a4;
  objc_msgSend(v44, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGWalletPassAttachmentDissector _filteredWalletPassAttachmentsFrom:](self, "_filteredWalletPassAttachmentsFrom:", v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "attachments");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v38, "count");
    *(_WORD *)&buf[22] = 2048;
    v60 = (void *)objc_msgSend(v39, "count");
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "%@: Message with %tu attachments (%tu downloaded wallet pass attachments)", buf, 0x20u);

  }
  if (objc_msgSend(v39, "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v39;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v8)
      goto LABEL_41;
    v48 = *(_QWORD *)v51;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v48)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v10, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[SGWalletPassAttachmentDissector _passDataForFilePath:](self, "_passDataForFilePath:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v54 = 0;
            v55 = &v54;
            v56 = 0x2050000000;
            v14 = (void *)getPKPassClass_softClass;
            v57 = getPKPassClass_softClass;
            if (!getPKPassClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = 0x1C36F2000;
              v60 = &unk_1E7DB7220;
              v61 = &v54;
              __getPKPassClass_block_invoke((uint64_t)buf);
              v14 = (void *)v55[3];
            }
            v15 = objc_retainAutorelease(v14);
            _Block_object_dispose(&v54, 8);
            v16 = [v15 alloc];
            v49 = 0;
            v17 = (void *)objc_msgSend(v16, "initWithData:error:", v13, &v49);
            v18 = v49;
            v19 = v18;
            if (!v17 || v18)
            {
              sgLogHandle();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v27 = (objc_class *)objc_opt_class();
                NSStringFromClass(v27);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject localizedDescription](v19, "localizedDescription");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v28;
                _os_log_error_impl(&dword_1C3607000, v26, OS_LOG_TYPE_ERROR, "%@: Error encountered while initializing Wallet Pass from NSData: %@", buf, 0x16u);

              }
            }
            else
            {
              if (objc_msgSend((id)objc_opt_class(), "isPassAvailable:", v17))
              {
                sgLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  v30 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v30);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "serialNumber");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412547;
                  *(_QWORD *)&buf[4] = v41;
                  *(_WORD *)&buf[12] = 2113;
                  *(_QWORD *)&buf[14] = v31;
                  _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "%@, Wallet Pass with Serial No. %{private}@ exists, setting state duplicate", buf, 0x16u);

                }
                v21 = 3;
                goto LABEL_30;
              }
              if ((objc_msgSend((id)objc_opt_class(), "canAddPass:", v17) & 1) != 0)
              {
                v21 = 1;
              }
              else
              {
                sgLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  v34 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v34);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "serialNumber");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412547;
                  *(_QWORD *)&buf[4] = v43;
                  *(_WORD *)&buf[12] = 2113;
                  *(_QWORD *)&buf[14] = v35;
                  _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "%@, Cannot add wallet pass with Serial No. %{private}@ exists", buf, 0x16u);

                }
                v21 = 1;
LABEL_30:

              }
              -[SGWalletPassAttachmentDissector _extractPassInformation:filePath:state:](self, "_extractPassInformation:filePath:state:", v17, v12, v21);
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                -[SGWalletPassAttachmentDissector _enrichmentsForWalletPassDictionary:filePath:parentMessage:parentEntity:](self, "_enrichmentsForWalletPassDictionary:filePath:parentMessage:parentEntity:", v26, v12, v44, v45);
                v29 = objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v46, "count") <= 9)
                  objc_msgSend(v46, "addObjectsFromArray:", v29);
              }
              else
              {
                sgLogHandle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v32 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v32);
                  v33 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v33;
                  v42 = (void *)v33;
                  _os_log_error_impl(&dword_1C3607000, v29, OS_LOG_TYPE_ERROR, "%@: Pass dictionary is nil. Skipping further processing of this pass", buf, 0xCu);

                }
              }

            }
          }
          else
          {
            sgLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v25;
              _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "%@: Attachment is not of type Wallet Pass", buf, 0xCu);

            }
          }

          goto LABEL_39;
        }
        sgLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "%@: Path is nil for pass attachment. Skipping this pass", buf, 0xCu);

        }
LABEL_39:

        objc_autoreleasePoolPop(v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (!v8)
      {
LABEL_41:

        objc_msgSend(v45, "addEnrichments:", v46);
        break;
      }
    }
  }

}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGWalletPassAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGWalletPassAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

uint64_t __70__SGWalletPassAttachmentDissector__filteredWalletPassAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if ((objc_msgSend(v2, "isWalletPassMimeType") & 1) != 0)
  {
    v3 = objc_msgSend(v2, "isDownloadedLocally");
  }
  else
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("pkpass")))
    {
      v3 = objc_msgSend(v2, "isDownloadedLocally");
    }
    else
    {
      objc_msgSend(v2, "filename");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("pkpass")))
        v3 = objc_msgSend(v2, "isDownloadedLocally");
      else
        v3 = 0;

    }
  }

  return v3;
}

@end
