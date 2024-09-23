@implementation CHSynthesisStyleInventory

+ (id)_groupContainerURL
{
  if (qword_1EF568048 != -1)
    dispatch_once(&qword_1EF568048, &unk_1E77F3808);
  return (id)qword_1EF568040;
}

+ (id)relativePath
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;

  if (!os_variant_has_internal_diagnostics())
    return CFSTR("synthesis/styleInventory.dat");
  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v7, v8, (uint64_t)CFSTR("com.apple.corehandwriting"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("CHCustomStyleInventoryPath"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v17, v18, v19, v20, v21, v22))
    v23 = v17;
  else
    v23 = CFSTR("synthesis/styleInventory.dat");

  return v23;
}

+ (id)_defaultInventoryStorageURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend__groupContainerURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relativePath(CHSynthesisStyleInventory, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v6, v13, (uint64_t)v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_formatVersion
{
  if (qword_1EF568058 != -1)
    dispatch_once(&qword_1EF568058, &unk_1E77EFC58);
  return (id)qword_1EF568050;
}

+ (BOOL)shouldBypassGating
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  if (!os_variant_has_internal_diagnostics())
    return 0;
  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v7, v8, (uint64_t)CFSTR("com.apple.corehandwriting"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("kCHInventoryBypassGating"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

  return v23;
}

+ (id)_mathCharacterSet
{
  if (qword_1EF568068 != -1)
    dispatch_once(&qword_1EF568068, &unk_1E77EF3A8);
  return (id)qword_1EF568060;
}

+ (int64_t)_maxInventorySize
{
  return 1000;
}

+ (int64_t)_minimumSampleCountByCharacter
{
  return 5;
}

+ (int64_t)_maxSamplesToStitch
{
  return 3;
}

+ (int64_t)_shortConfigLength
{
  return 8;
}

+ (int64_t)_longConfigLength
{
  return 48;
}

+ (int64_t)maxStyleSampleLengthForPrompt:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;

  v3 = a3;
  v9 = objc_msgSend_length(v3, v4, v5, v6, v7, v8);
  if (v9 >= objc_msgSend__shortConfigLength(CHSynthesisStyleInventory, v10, v11, v12, v13, v14))
    v20 = objc_msgSend__longConfigLength(CHSynthesisStyleInventory, v15, v16, v17, v18, v19);
  else
    v20 = objc_msgSend__shortConfigLength(CHSynthesisStyleInventory, v15, v16, v17, v18, v19);
  v21 = v20;

  return v21;
}

+ (BOOL)clear
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend__defaultInventoryStorageURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "Clearing synthesis style inventory at %@", buf, 0xCu);
  }

  if ((objc_msgSend_checkResourceIsReachableAndReturnError_(v6, v8, 0, v9, v10, v11) & 1) == 0)
  {
    v21 = 1;
    goto LABEL_13;
  }
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v21 = objc_msgSend_removeItemAtURL_error_(v17, v18, (uint64_t)v6, (uint64_t)&v31, v19, v20);
  v22 = v31;

  if ((v21 & 1) == 0)
  {
    if (qword_1EF568E88 == -1)
    {
      v23 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v23 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
    }
    objc_msgSend_absoluteString(v6, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v29;
    v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_ERROR, "Style inventory could not be deleted from URL: %@, error: %@", buf, 0x16u);

    goto LABEL_10;
  }
LABEL_11:

LABEL_13:
  return v21;
}

+ (id)remainingCharacterSetFromPromptCharacterSet:(id)a3 withSample:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a4;
  v11 = (void *)objc_msgSend_mutableCopy(a3, v6, v7, v8, v9, v10);
  objc_msgSend_characterCoverage(v5, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v11, v18, (uint64_t)v17, v19, v20, v21);

  return v11;
}

- (CHSynthesisStyleInventory)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHSynthesisStyleInventory *v12;

  objc_msgSend__defaultInventoryStorageURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CHSynthesisStyleInventory *)objc_msgSend_initWithURL_(self, v8, (uint64_t)v7, v9, v10, v11);

  return v12;
}

- (CHSynthesisStyleInventory)initWithURL:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  CHSynthesisStyleInventory *v24;
  CHSynthesisStyleInventory *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CHSynthesisStyleInventory *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableDictionary *styles;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSMutableDictionary *sampleCountByCharacter;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableDictionary *fastPathCharacterStyles;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSDate *lastSavedDate;
  NSObject *v79;
  dispatch_queue_t v80;
  OS_dispatch_queue *workQueue;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  CHSynthesisStyleInventory *v102;
  id v104;
  objc_super v105;
  id v106;
  id v107;
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v107 = 0;
  v10 = objc_msgSend_checkResourceIsReachableAndReturnError_(v5, v6, (uint64_t)&v107, v7, v8, v9);
  v11 = v107;
  v16 = v11;
  if (v10)
  {
    objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E0C99D50], v12, (uint64_t)v5, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3710];
    v19 = objc_opt_class();
    v106 = v16;
    objc_msgSend_unarchivedObjectOfClass_fromData_error_(v18, v20, v19, (uint64_t)v17, (uint64_t)&v106, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v106;

    if (v22)
    {
      v24 = v22;

      v25 = v24;
      goto LABEL_26;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v26 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_absoluteString(v5, v27, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v109 = (uint64_t)v32;
      v110 = 2112;
      v111 = v23;
      _os_log_impl(&dword_1BE607000, v26, OS_LOG_TYPE_ERROR, "Error loading Synthesis style inventory from URL %@, error: %@", buf, 0x16u);

    }
  }
  else
  {
    v23 = v11;
  }
  v105.receiver = self;
  v105.super_class = (Class)CHSynthesisStyleInventory;
  v33 = -[CHSynthesisStyleInventory init](&v105, sel_init);
  if (!v33)
  {
LABEL_20:
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v71 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v109 = (uint64_t)v23;
      _os_log_impl(&dword_1BE607000, v71, OS_LOG_TYPE_ERROR, "Synthesis style inventory was not initialized. error: %@", buf, 0xCu);
    }
    v25 = 0;
    v24 = 0;
    goto LABEL_36;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v34 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_DEBUG, "Initializing empty inventory", buf, 2u);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v35, v36, v37, v38, v39);
  v40 = objc_claimAutoreleasedReturnValue();
  styles = v33->_styles;
  v33->_styles = (NSMutableDictionary *)v40;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v42, v43, v44, v45, v46);
  v47 = objc_claimAutoreleasedReturnValue();
  sampleCountByCharacter = v33->_sampleCountByCharacter;
  v33->_sampleCountByCharacter = (NSMutableDictionary *)v47;

  v33->_characterStyleTimestamp = 0.0;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v49, v50, v51, v52, v53);
  v54 = objc_claimAutoreleasedReturnValue();
  fastPathCharacterStyles = v33->_fastPathCharacterStyles;
  v33->_fastPathCharacterStyles = (NSMutableDictionary *)v54;

  v33->_characterInventoryVersion = 1;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v56, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByDeletingLastPathComponent(v5, v62, v63, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v61, v68, (uint64_t)v67, 1, 0, (uint64_t)&v104);
  v69 = v104;

  if (v69)
  {
    if (qword_1EF568E88 == -1)
    {
      v70 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v70 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v109 = (uint64_t)v69;
    _os_log_impl(&dword_1BE607000, v70, OS_LOG_TYPE_ERROR, "Synthesis style inventory folder path could not be created. error: %@", buf, 0xCu);
    goto LABEL_19;
  }
  v24 = 0;
  v25 = v33;
LABEL_26:
  objc_storeStrong((id *)&v25->_inventoryStorageURL, a3);
  objc_msgSend_now(MEMORY[0x1E0C99D68], v72, v73, v74, v75, v76);
  v77 = objc_claimAutoreleasedReturnValue();
  lastSavedDate = v25->_lastSavedDate;
  v25->_lastSavedDate = (NSDate *)v77;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v79);
  workQueue = v25->__workQueue;
  v25->__workQueue = (OS_dispatch_queue *)v80;

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v82 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_absoluteString(v25->_inventoryStorageURL, v83, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v109 = (uint64_t)v88;
    _os_log_impl(&dword_1BE607000, v82, OS_LOG_TYPE_DEFAULT, "Synthesis style inventory URL %@", buf, 0xCu);

  }
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v89 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    goto LABEL_32;
  }
  v89 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
LABEL_32:
    v95 = objc_msgSend_count(v25->_styles, v90, v91, v92, v93, v94);
    *(_DWORD *)buf = 134217984;
    v109 = v95;
    _os_log_impl(&dword_1BE607000, v89, OS_LOG_TYPE_DEFAULT, "Loading synthesis style inventory containing %lu samples", buf, 0xCu);
  }
LABEL_33:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v71 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      goto LABEL_36;
    goto LABEL_35;
  }
  v71 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
LABEL_35:
    v101 = objc_msgSend_count(v25->_fastPathCharacterStyles, v96, v97, v98, v99, v100);
    *(_DWORD *)buf = 134217984;
    v109 = v101;
    _os_log_impl(&dword_1BE607000, v71, OS_LOG_TYPE_DEBUG, "Loading synthesis fast path character style inventory containing %lu samples", buf, 0xCu);
  }
LABEL_36:

  v102 = v25;
  return v102;
}

- (CHSynthesisStyleInventory)initWithStyles:(id)a3 sampleCountByCharacter:(id)a4 storageURL:(id)a5 synthesisModelHash:(id)a6 currentSamplingTimestep:(int64_t)a7 characterStyleTimestamp:(double)a8 fastPathCharacterStyles:(id)a9 characterInventoryVersion:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CHSynthesisStyleInventory *v27;
  uint64_t v28;
  NSMutableDictionary *styles;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *sampleCountByCharacter;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSURL *inventoryStorageURL;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSString *synthesisModelHash;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSMutableDictionary *fastPathCharacterStyles;
  NSObject *v58;
  dispatch_queue_t v59;
  OS_dispatch_queue *workQueue;
  objc_super v62;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v62.receiver = self;
  v62.super_class = (Class)CHSynthesisStyleInventory;
  v27 = -[CHSynthesisStyleInventory init](&v62, sel_init);
  if (v27)
  {
    v28 = objc_msgSend_mutableCopy(v17, v22, v23, v24, v25, v26);
    styles = v27->_styles;
    v27->_styles = (NSMutableDictionary *)v28;

    v35 = objc_msgSend_mutableCopy(v18, v30, v31, v32, v33, v34);
    sampleCountByCharacter = v27->_sampleCountByCharacter;
    v27->_sampleCountByCharacter = (NSMutableDictionary *)v35;

    v42 = objc_msgSend_copy(v19, v37, v38, v39, v40, v41);
    inventoryStorageURL = v27->_inventoryStorageURL;
    v27->_inventoryStorageURL = (NSURL *)v42;

    v49 = objc_msgSend_copy(v20, v44, v45, v46, v47, v48);
    synthesisModelHash = v27->_synthesisModelHash;
    v27->_synthesisModelHash = (NSString *)v49;

    v27->_currentSamplingTimestep = a7;
    v27->_characterStyleTimestamp = a8;
    v56 = objc_msgSend_mutableCopy(v21, v51, v52, v53, v54, v55);
    fastPathCharacterStyles = v27->_fastPathCharacterStyles;
    v27->_fastPathCharacterStyles = (NSMutableDictionary *)v56;

    v27->_characterInventoryVersion = a10;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v58);
    workQueue = v27->__workQueue;
    v27->__workQueue = (OS_dispatch_queue *)v59;

  }
  return v27;
}

- (CHSynthesisStyleInventory)initWithCoder:(id)a3
{
  id v4;
  CHSynthesisStyleInventory *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isEqualToString;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *styles;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableDictionary *sampleCountByCharacter;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSURL *inventoryStorageURL;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString *synthesisModelHash;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableDictionary *fastPathCharacterStyles;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  int64_t characterInventoryVersion;
  NSObject *v74;
  int64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  dispatch_queue_t v82;
  OS_dispatch_queue *workQueue;
  CHSynthesisStyleInventory *v84;
  NSObject *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  objc_super v94;
  _QWORD v95[6];
  uint8_t buf[4];
  int64_t v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)CHSynthesisStyleInventory;
  v5 = -[CHSynthesisStyleInventory init](&v94, sel_init);
  if (!v5)
    goto LABEL_13;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("formatVersion"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend__formatVersion(v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v18, (uint64_t)v17, v19, v20, v21);

  if ((isEqualToString & 1) != 0)
  {
    v23 = (void *)MEMORY[0x1E0C99E60];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    v95[2] = objc_opt_class();
    v95[3] = objc_opt_class();
    v95[4] = objc_opt_class();
    v95[5] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v95, 6, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v23, v28, (uint64_t)v27, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("styleSamples"), v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    styles = v5->_styles;
    v5->_styles = (NSMutableDictionary *)v36;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v32, (uint64_t)CFSTR("sampleCountByCharacter"), v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    sampleCountByCharacter = v5->_sampleCountByCharacter;
    v5->_sampleCountByCharacter = (NSMutableDictionary *)v41;

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("inventoryStorageURL"), v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    inventoryStorageURL = v5->_inventoryStorageURL;
    v5->_inventoryStorageURL = (NSURL *)v47;

    v49 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, (uint64_t)CFSTR("synthesisModelHash"), v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    synthesisModelHash = v5->_synthesisModelHash;
    v5->_synthesisModelHash = (NSString *)v53;

    v5->_currentSamplingTimestep = objc_msgSend_decodeIntegerForKey_(v4, v55, (uint64_t)CFSTR("currentSamplingTimestep"), v56, v57, v58);
    v5->_characterStyleTimestamp = (double)objc_msgSend_decodeIntegerForKey_(v4, v59, (uint64_t)CFSTR("characterStyleTimestamp"), v60, v61, v62);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v32, (uint64_t)CFSTR("fastPathCharacterStyles"), v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    fastPathCharacterStyles = v5->_fastPathCharacterStyles;
    v5->_fastPathCharacterStyles = (NSMutableDictionary *)v66;

    v5->_characterInventoryVersion = objc_msgSend_decodeIntegerForKey_(v4, v68, (uint64_t)CFSTR("fastPathCharacterInventoryVersion"), v69, v70, v71);
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v72 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      characterInventoryVersion = v5->_characterInventoryVersion;
      *(_DWORD *)buf = 134217984;
      v97 = characterInventoryVersion;
      _os_log_impl(&dword_1BE607000, v72, OS_LOG_TYPE_DEBUG, "Fast path character inventory version=%li.", buf, 0xCu);
    }

    if (v5->_characterInventoryVersion > 0)
      goto LABEL_12;
    if (qword_1EF568E88 == -1)
    {
      v74 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        objc_msgSend_cleanupFastPathCharacters(v5, v76, v77, v78, v79, v80);
        v5->_characterInventoryVersion = 1;
LABEL_12:
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v81);
        workQueue = v5->__workQueue;
        v5->__workQueue = (OS_dispatch_queue *)v82;

LABEL_13:
        v84 = v5;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v74 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
    }
    v75 = v5->_characterInventoryVersion;
    *(_DWORD *)buf = 134218240;
    v97 = v75;
    v98 = 2048;
    v99 = 1;
    _os_log_impl(&dword_1BE607000, v74, OS_LOG_TYPE_DEFAULT, "Fast path character inventory is outdated (version=%li, required=%li). Dropping it.", buf, 0x16u);
    goto LABEL_11;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v85 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
  {
    v86 = (void *)objc_opt_class();
    objc_msgSend__formatVersion(v86, v87, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v97 = (int64_t)v10;
    v98 = 2112;
    v99 = (uint64_t)v92;
    _os_log_impl(&dword_1BE607000, v85, OS_LOG_TYPE_ERROR, "Archive version not supported: %@. current version: %@", buf, 0x16u);

  }
  v84 = 0;
LABEL_19:

  return v84;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v38 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__formatVersion(v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v38, v11, (uint64_t)v10, (uint64_t)CFSTR("formatVersion"), v12, v13);

  objc_msgSend_encodeObject_forKey_(v38, v14, (uint64_t)self->_styles, (uint64_t)CFSTR("styleSamples"), v15, v16);
  objc_msgSend_encodeObject_forKey_(v38, v17, (uint64_t)self->_sampleCountByCharacter, (uint64_t)CFSTR("sampleCountByCharacter"), v18, v19);
  objc_msgSend_encodeObject_forKey_(v38, v20, (uint64_t)self->_inventoryStorageURL, (uint64_t)CFSTR("inventoryStorageURL"), v21, v22);
  objc_msgSend_encodeObject_forKey_(v38, v23, (uint64_t)self->_synthesisModelHash, (uint64_t)CFSTR("synthesisModelHash"), v24, v25);
  objc_msgSend_encodeInteger_forKey_(v38, v26, self->_currentSamplingTimestep, (uint64_t)CFSTR("currentSamplingTimestep"), v27, v28);
  objc_msgSend_encodeInteger_forKey_(v38, v29, (uint64_t)self->_characterStyleTimestamp, (uint64_t)CFSTR("characterStyleTimestamp"), v30, v31);
  objc_msgSend_encodeObject_forKey_(v38, v32, (uint64_t)self->_fastPathCharacterStyles, (uint64_t)CFSTR("fastPathCharacterStyles"), v33, v34);
  objc_msgSend_encodeInteger_forKey_(v38, v35, self->_characterInventoryVersion, (uint64_t)CFSTR("fastPathCharacterInventoryVersion"), v36, v37);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)lastSavedDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE6D4B90;
  v12 = sub_1BE6D4BA0;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6D4BA8;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDate *)v5;
}

- (void)resetCurrentSamplingTimestep
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE6D4C10;
  v5[3] = &unk_1E77F1F38;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (void)updateSamplingCountForSample:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6D4DF8;
  v10[3] = &unk_1E77F2428;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CHSynthesisStyleInventory *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  void *v55;

  v4 = [CHSynthesisStyleInventory alloc];
  objc_msgSend_styles(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sampleCountByCharacter(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inventoryStorageURL(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synthesisModelHash(self, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_currentSamplingTimestep(self, v29, v30, v31, v32, v33);
  objc_msgSend_characterStyleTimestamp(self, v35, v36, v37, v38, v39);
  v41 = v40;
  objc_msgSend_fastPathCharacterStyles(self, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_characterInventoryVersion(self, v48, v49, v50, v51, v52);
  v55 = (void *)objc_msgSend_initWithStyles_sampleCountByCharacter_storageURL_synthesisModelHash_currentSamplingTimestep_characterStyleTimestamp_fastPathCharacterStyles_characterInventoryVersion_(v4, v54, (uint64_t)v10, (uint64_t)v16, (uint64_t)v22, (uint64_t)v28, v34, v47, v41, v53);

  return v55;
}

- (BOOL)save
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  id v58;
  id v59;
  _QWORD v60[6];
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t v67[4];
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = os_signpost_id_generate(v3);

  if (qword_1EF568E88 == -1)
  {
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStyleInventorySave", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStyleInventorySave\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v62 = buf;
  v63 = 0x3032000000;
  v64 = sub_1BE6D4B90;
  v65 = sub_1BE6D4BA0;
  v66 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = sub_1BE6D57B0;
  v60[3] = &unk_1E77F23B0;
  v60[4] = self;
  v60[5] = buf;
  objc_msgSend__safelyRunBlock_(self, v8, (uint64_t)v60, v9, v10, v11);
  v12 = *((_QWORD *)v62 + 5);
  v59 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v13, v12, 1, (uint64_t)&v59, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v59;
  if (v15)
  {
    objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v16, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_writeToURL_atomically_(v15, v23, (uint64_t)v22, 1, v24, v25);

    if ((v26 & 1) == 0)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v32 = (id)qword_1EF568E60;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v33, v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v67 = 138412290;
        v68 = v38;
        _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_ERROR, "Could not write inventory to URL: %@", v67, 0xCu);

      }
    }
    objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v27, v28, v29, v30, v31);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v21;
    v44 = objc_msgSend_checkResourceIsReachableAndReturnError_(v39, v40, (uint64_t)&v58, v41, v42, v43);
    v45 = v58;

    if ((v44 & 1) == 0)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v46 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v47, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v67 = 138412546;
        v68 = v52;
        v69 = 2112;
        v70 = v45;
        _os_log_impl(&dword_1BE607000, v46, OS_LOG_TYPE_FAULT, "Error inventory file not reachable at url: %@, error %@", v67, 0x16u);

      }
    }
    if (qword_1EF568E88 == -1)
    {
      v53 = (id)qword_1EF568E50;
      if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_26;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v53 = (id)qword_1EF568E50;
      if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_26:
        if (os_signpost_enabled(v53))
        {
          *(_WORD *)v67 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v53, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventorySave", ", v67, 2u);
        }
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v54 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_1BE607000, v54, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventorySave\", v67, 2u);
    }
    v21 = v45;
    goto LABEL_46;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v55 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v67 = 138412290;
    v68 = v21;
    _os_log_impl(&dword_1BE607000, v55, OS_LOG_TYPE_ERROR, "Could not encode inventory. error: %@", v67, 0xCu);
  }

  if (qword_1EF568E88 == -1)
  {
    v56 = (id)qword_1EF568E50;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_39;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v56 = (id)qword_1EF568E50;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_39:
      if (os_signpost_enabled(v56))
      {
        *(_WORD *)v67 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE607000, v56, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventorySave", ", v67, 2u);
      }
    }
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v54 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v67 = 0;
    _os_log_impl(&dword_1BE607000, v54, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventorySave\", v67, 2u);
  }
  v26 = 0;
LABEL_46:

  _Block_object_dispose(buf, 8);
  return v26;
}

- (void)saveIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE6D5838;
  v5[3] = &unk_1E77F1F38;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (BOOL)containsSampleWithTranscription:(id)a3 strokeIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE6D5AA8;
  v15[3] = &unk_1E77F3830;
  v15[4] = self;
  v16 = v7;
  v17 = v6;
  v18 = &v19;
  v8 = v6;
  v9 = v7;
  objc_msgSend__safelyRunBlock_(self, v10, (uint64_t)v15, v11, v12, v13);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

- (void)removeSamplesContainingStrokeIdentifiers:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BE6D5C18;
    v14[3] = &unk_1E77F2428;
    v14[4] = self;
    v15 = v4;
    objc_msgSend__safelyRunBlock_(self, v10, (uint64_t)v14, v11, v12, v13);

  }
}

- (void)reset
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Resetting the style inventory", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE6D5E44;
  v8[3] = &unk_1E77F1F38;
  v8[4] = self;
  objc_msgSend__safelyRunBlock_(self, v4, (uint64_t)v8, v5, v6, v7);
}

- (void)_unsafeAddSample:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  int v146;
  uint64_t v147;
  __int16 v148;
  void *v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_transcription(v4, v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 138739971;
    v147 = (uint64_t)v11;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Initiating style sample addition with string: %{sensitive}@", (uint8_t *)&v146, 0xCu);

  }
  if (!v4)
  {
    if (qword_1EF568E88 == -1)
    {
      v33 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v33 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
    }
    LOWORD(v146) = 0;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting nil sample", (uint8_t *)&v146, 2u);
    goto LABEL_20;
  }
  objc_msgSend_transcription(v4, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(v4, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_containsSampleWithTranscription_strokeIdentifiers_(self, v24, (uint64_t)v17, (uint64_t)v23, v25, v26);

  if (!v27)
  {
    objc_msgSend_strokeIdentifiers(v4, v28, v29, v30, v31, v32);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeSamplesContainingStrokeIdentifiers_(self, v47, (uint64_t)v46, v48, v49, v50);

    objc_msgSend_transcription(v4, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_drawing(v4, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiers(v4, v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v69, (uint64_t)v56, (uint64_t)v62, (uint64_t)v68, v70);
    v33 = objc_claimAutoreleasedReturnValue();

    v76 = objc_msgSend_currentSamplingTimestep(self, v71, v72, v73, v74, v75);
    objc_msgSend_setCreationTimestep_(v33, v77, v76, v78, v79, v80);
    objc_msgSend_styles(self, v81, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiers(v33, v87, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v86, v93, (uint64_t)v33, (uint64_t)v92, v94, v95);

    objc_msgSend__unsafeUpdateCharacterCoverageWithAddedSample_(self, v96, (uint64_t)v33, v97, v98, v99);
    objc_msgSend_setHasInventoryChanged_(self, v100, 1, v101, v102, v103);
    if (qword_1EF568E88 == -1)
    {
      v104 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v104 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        if (qword_1EF568E88 == -1)
        {
          v111 = (id)qword_1EF568E60;
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v111 = (id)qword_1EF568E60;
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
        }
        objc_msgSend_characterCoverage(self, v112, v113, v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_count(v117, v118, v119, v120, v121, v122);
        objc_msgSend_characterCoverage(self, v124, v125, v126, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v129, v130, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedArrayUsingSelector_(v135, v136, (uint64_t)sel_compare_, v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v140, v141, (uint64_t)CFSTR(","), v142, v143, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = 134218242;
        v147 = v123;
        v148 = 2112;
        v149 = v145;
        _os_log_impl(&dword_1BE607000, v111, OS_LOG_TYPE_DEFAULT, "Inventory Style character coverage (len %ld): %@", (uint8_t *)&v146, 0x16u);

        goto LABEL_19;
      }
    }
    objc_msgSend_transcription(v33, v105, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 138739971;
    v147 = (uint64_t)v110;
    _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Adding style sample with string: %{sensitive}@", (uint8_t *)&v146, 0xCu);

    goto LABEL_16;
  }
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v33 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    goto LABEL_9;
  }
  v33 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
LABEL_9:
    objc_msgSend_transcription(v4, v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiers(v4, v40, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 138740227;
    v147 = (uint64_t)v39;
    v148 = 2112;
    v149 = v45;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: preventing style sample from being added multiple times since it already exists (string: %{sensitive}@, stroke identifiers: %@)", (uint8_t *)&v146, 0x16u);

  }
LABEL_20:

}

- (void)addSample:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6D655C;
  v10[3] = &unk_1E77F2428;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (void)addSamplesWithArray:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CHSynthesisStyleInventory *v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6D65F8;
  v10[3] = &unk_1E77F2428;
  v11 = v4;
  v12 = self;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (void)removeSample:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6D6798;
  v10[3] = &unk_1E77F2428;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (void)_unsafeRemoveSample:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__unsafeUpdateCharacterCoverageWithRemovedSample_(self, v5, (uint64_t)v4, v6, v7, v8);
  objc_msgSend_styles(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(v4, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v14, v21, (uint64_t)v20, v22, v23, v24);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v25 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_transcription(v4, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138739971;
    v33 = v31;
    _os_log_impl(&dword_1BE607000, v25, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: removing style sample with string: %{sensitive}@", (uint8_t *)&v32, 0xCu);

  }
}

- (id)characterCoverage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE6D4B90;
  v12 = sub_1BE6D4BA0;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6D69FC;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_unsafeUpdateCharacterCoverageWithAddedSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend_characterCoverage(a3, a2, (uint64_t)a3, v3, v4, v5);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v68, (uint64_t)v72, 16, v8);
  if (v14)
  {
    v15 = *(_QWORD *)v69;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v16);
        objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v18, v19, v17, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (v24)
        {
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v25, 0, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sampleCountByCharacter(self, v31, v32, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v30, v17, v38, v39);

        }
        v40 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_sampleCountByCharacter(self, v25, v26, v27, v28, v29);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v41, v42, v17, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_integerValue(v46, v47, v48, v49, v50, v51);
        objc_msgSend_numberWithInteger_(v40, v53, v52 + 1, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sampleCountByCharacter(self, v58, v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v57, v17, v65, v66);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v68, (uint64_t)v72, 16, v13);
    }
    while (v14);
  }

}

- (void)_unsafeUpdateCharacterCoverageWithRemovedSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BOOL4 v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  id obj;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  objc_msgSend_characterCoverage(a3, a2, (uint64_t)a3, v3, v4, v5);
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v118, (uint64_t)v126, 16, v8);
  if (v14)
  {
    v16 = *(_QWORD *)v119;
    *(_QWORD *)&v15 = 138412546;
    v116 = v15;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v119 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13, v116);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v19, v20, v18, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24 == 0;

        if (v25)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v31 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_sampleCountByCharacter(self, v32, v33, v34, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v116;
            v123 = v18;
            v124 = 2112;
            v125 = v37;
            _os_log_impl(&dword_1BE607000, v31, OS_LOG_TYPE_FAULT, "Character %@ not is not present in the sampleCountByCharacter dictionary %@", buf, 0x16u);

          }
        }
        v38 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_sampleCountByCharacter(self, v26, v27, v28, v29, v30);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v39, v40, v18, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_integerValue(v44, v45, v46, v47, v48, v49);
        objc_msgSend_numberWithInteger_(v38, v51, v50 - 1, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sampleCountByCharacter(self, v56, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v62, (uint64_t)v55, v18, v63, v64);

        objc_msgSend_sampleCountByCharacter(self, v65, v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v70, v71, v18, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend_integerValue(v75, v76, v77, v78, v79, v80);

        if (v81 < 0)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v87 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_sampleCountByCharacter(self, v88, v89, v90, v91, v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v93, v94, v18, v95, v96, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v116;
            v123 = v18;
            v124 = 2112;
            v125 = v98;
            _os_log_impl(&dword_1BE607000, v87, OS_LOG_TYPE_FAULT, "Sample count for character %@ is negative %@", buf, 0x16u);

          }
        }
        objc_msgSend_sampleCountByCharacter(self, v82, v83, v84, v85, v86);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v99, v100, v18, v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend_integerValue(v104, v105, v106, v107, v108, v109) == 0;

        if (v110)
        {
          objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v111, v112, v18, v113, v114, v115);

        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v118, (uint64_t)v126, 16, v13);
    }
    while (v14);
  }

}

- (BOOL)_unsafeHasLowSampleCountForCharacters:(id)a3 minimumSampleCount:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  BOOL v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = a3;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v6);
        v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13, (_QWORD)v32);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_integerValue(v23, v24, v25, v26, v27, v28) > a4;

        if (!v29)
        {
          v30 = 1;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v13);
      if (v14)
        continue;
      break;
    }
  }
  v30 = 0;
LABEL_11:

  return v30;
}

- (BOOL)isTokenAcceptable:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  BOOL v63;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  int v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = objc_msgSend_properties(v4, v5, v6, v7, v8, v9);
  objc_msgSend_string(v4, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_isSimpleMathPattern_(self, v17, (uint64_t)v16, v18, v19, v20);

  if ((v10 >> 2) & 1 | self & 1)
  {
    objc_msgSend_string(v4, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_length(v26, v27, v28, v29, v30, v31);

    if (v32 > 2)
    {
      objc_msgSend_recognitionScore(v4, v33, v34, v35, v36, v37);
      if (v70 >= 0.850000024)
      {
        if ((objc_msgSend_isTopOriginal(v4, v65, v66, v67, v68, v69) & 1) != 0)
        {
          v63 = 1;
          goto LABEL_12;
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v38 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_string(v4, v84, v85, v86, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 138739971;
          v91 = (uint64_t)v89;
          _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token it has been post processed. token string: %{sensitive}@", (uint8_t *)&v90, 0xCu);

        }
      }
      else
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v38 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_recognitionScore(v4, v71, v72, v73, v74, v75);
          v77 = v76;
          objc_msgSend_string(v4, v78, v79, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 134218499;
          v91 = v77;
          v92 = 2048;
          v93 = 0x3FEB333340000000;
          v94 = 2117;
          v95 = v83;
          _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token due to recognition score (%2.2f) smaller than threshold %2.2f. token string: %{sensitive}@", (uint8_t *)&v90, 0x20u);

        }
      }
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v38 = (id)qword_1EF568E60;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_string(v4, v39, v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_length(v44, v45, v46, v47, v48, v49);
        objc_msgSend_string(v4, v51, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = 134218499;
        v91 = v50;
        v92 = 2048;
        v93 = 3;
        v94 = 2117;
        v95 = v56;
        _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token due to length (%ld) smaller than %ld. token string: %{sensitive}@", (uint8_t *)&v90, 0x20u);

      }
    }
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v38 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_string(v4, v57, v58, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 138739971;
      v91 = (uint64_t)v62;
      _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token as it is out of lexicon and not a accepted math pattern. token string: %{sensitive}@", (uint8_t *)&v90, 0xCu);

    }
  }

  v63 = 0;
LABEL_12:

  return v63;
}

- (void)addSamplesIfNeededWithTokenizedTextResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CHSynthesisStyleInventory *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BE6D7840;
  v18[3] = &unk_1E77F2518;
  v19 = v8;
  v20 = v10;
  v21 = self;
  v22 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);

}

- (BOOL)isSimpleMathPattern:(id)a3
{
  NSString *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSCharacterSet *v10;
  BOOL v11;

  v3 = (NSString *)a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__mathCharacterSet(v4, v5, v6, v7, v8, v9);
  v10 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v11 = isStringEntirelyFromSet(v3, v10);

  return v11;
}

- (void)addSamplesIfNeededWithTokenizedMathResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CHSynthesisStyleInventory *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BE6D7ED4;
  v18[3] = &unk_1E77F2518;
  v19 = v8;
  v20 = v10;
  v21 = self;
  v22 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);

}

- (void)updateStylePredictionsWithSamples:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CHSynthesisStyleInventory *v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6D83C0;
  v10[3] = &unk_1E77F2428;
  v11 = v4;
  v12 = self;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (id)samplesWithoutStylePrediction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BE6D86AC;
  v16[3] = &unk_1E77F2428;
  v16[4] = self;
  v8 = v7;
  v17 = v8;
  objc_msgSend__safelyRunBlock_(self, v9, (uint64_t)v16, v10, v11, v12);
  v13 = v17;
  v14 = v8;

  return v14;
}

- (id)_unsafeSamplesWithStylePrediction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend_styles(self, v8, v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v38, (uint64_t)v42, 16, v21);
  if (v27)
  {
    v28 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v19);
        v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend_hasEmbeddingVector(v30, v22, v23, v24, v25, v26))
          objc_msgSend_addObject_(v7, v22, (uint64_t)v30, v24, v25, v26);
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v38, (uint64_t)v42, 16, v26);
    }
    while (v27);
  }

  v36 = (void *)objc_msgSend_copy(v7, v31, v32, v33, v34, v35);
  return v36;
}

- (int64_t)minimumNumberOfSamplesWithStylePrediction
{
  return 100;
}

- (BOOL)needsStylePredictionUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6D8AF0;
  v7[3] = &unk_1E77F38A8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)stitchStyleSamples:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CHDrawing *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  id v132;
  id obj;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t v139[128];
  uint8_t buf[4];
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v132 = a3;
  if (!objc_msgSend_count(v132, v3, v4, v5, v6, v7))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_FAULT, "Style sampling: Stitching Style Samples: Empty array is passed!", buf, 2u);
    }

  }
  if (objc_msgSend_count(v132, v8, v9, v10, v11, v12))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v14 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend_count(v132, v15, v16, v17, v18, v19);
      *(_DWORD *)buf = 134217984;
      v141 = v20;
      _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "Style Sampling: stitching %lu samples", buf, 0xCu);
    }

    v21 = objc_alloc_init(CHDrawing);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E20], v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    obj = v132;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v135, (uint64_t)v139, 16, v34);
    if (v40)
    {
      v41 = *(_QWORD *)v136;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v136 != v41)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v42);
          objc_msgSend_drawing(v43, v35, v36, v37, v38, v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend_strokeCount(v44, v45, v46, v47, v48, v49) == 0;

          if (v50)
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v56 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v56, OS_LOG_TYPE_FAULT, "Style Sampling: Stitching style samples: Drawing must have > 0 strokes", buf, 2u);
            }

          }
          objc_msgSend_drawing(v43, v51, v52, v53, v54, v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcription(v43, v58, v59, v60, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_normalizeDrawing_transcription_(CHSynthesisStyleSample, v64, (uint64_t)v57, (uint64_t)v63, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_strokeCount(v21, v68, v69, v70, v71, v72))
          {
            objc_msgSend_bounds(v21, v73, v74, v75, v76, v77);
            v79 = v78;
            objc_msgSend_normalizationTextHeight(CHSynthesisStyleSample, v80, v81, v82, v83, v84);
            objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v67, v86, v87, v88, v89, v90, v79 + v85, 0.0, 1.0);
            v91 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v91 = v67;
          }
          v96 = v91;
          objc_msgSend_appendDrawing_(v21, v92, (uint64_t)v91, v93, v94, v95);
          objc_msgSend_transcription(v43, v97, v98, v99, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v134, v103, (uint64_t)v102, v104, v105, v106);

          objc_msgSend_strokeIdentifiers(v43, v107, v108, v109, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v32, v113, (uint64_t)v112, v114, v115, v116);

          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v135, (uint64_t)v139, 16, v39);
      }
      while (v40);
    }

    v117 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend_componentsJoinedByString_(v134, v118, (uint64_t)CFSTR(" "), v119, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithString_(v117, v123, (uint64_t)v122, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v128, (uint64_t)v127, (uint64_t)v21, (uint64_t)v32, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v130 = 0;
  }

  return v130;
}

- (id)nearestInventorySamplesToSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  int64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v15, (uint64_t)v9, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v20 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_transcription(v8, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcription(v8, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740227;
    v62 = (uint64_t)v26;
    v63 = 2048;
    v64 = objc_msgSend_length(v32, v33, v34, v35, v36, v37);
    _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_DEFAULT, "Style Sampling: Get nearest neighbors in style from the inventory for input style sample: %{sensitive}@ with length: %lu", buf, 0x16u);

  }
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1BE6D93EC;
  v56[3] = &unk_1E77F38D0;
  v56[4] = self;
  v38 = v8;
  v57 = v38;
  v39 = v19;
  v58 = v39;
  v60 = a5;
  v40 = v55;
  v59 = v40;
  objc_msgSend__safelyRunBlock_(self, v41, (uint64_t)v56, v42, v43, v44);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v45 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_7;
  }
  v45 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    v51 = objc_msgSend_count(v40, v46, v47, v48, v49, v50);
    *(_DWORD *)buf = 134217984;
    v62 = v51;
    _os_log_impl(&dword_1BE607000, v45, OS_LOG_TYPE_DEFAULT, "Style Sampling: Found %lu nearest neighbors in style from the inventory", buf, 0xCu);
  }
LABEL_8:

  v52 = v59;
  v53 = v40;

  return v53;
}

- (id)highestCharacterCoverageStyleSampleForPrompt:(id)a3 styles:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD v53[4];
  id v54;
  id v55;
  _BYTE *v56;
  uint8_t v57[4];
  uint64_t v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_length(v6, v9, v10, v11, v12, v13);
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_DEFAULT, "Style Sampling: get highest character coverage style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v14, (uint64_t)v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverage(self, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_intersectsSet_(v18, v25, (uint64_t)v24, v26, v27, v28);

  if ((v29 & 1) == 0)
  {
    v51 = 0;
    goto LABEL_11;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v60 = sub_1BE6D4B90;
  v61 = sub_1BE6D4BA0;
  v62 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = sub_1BE6DA16C;
  v53[3] = &unk_1E77F24F0;
  v54 = v7;
  v55 = v18;
  v56 = buf;
  objc_msgSend__safelyRunBlock_(self, v30, (uint64_t)v53, v31, v32, v33);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    goto LABEL_8;
  }
  v34 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
LABEL_8:
    objc_msgSend_transcription(*(void **)(*(_QWORD *)&buf[8] + 40), v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_length(v40, v41, v42, v43, v44, v45);
    *(_DWORD *)v57 = 134217984;
    v58 = v46;
    _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_DEFAULT, "Style Sampling: found highest character coverage style sample with length: %lu", v57, 0xCu);

  }
LABEL_9:

  objc_msgSend_normalizeStyleSample_(CHSynthesisStyleSample, v47, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
LABEL_11:

  return v51;
}

- (id)shortStringHeuristicStyleSampleForPrompt:(id)a3 styles:(id)a4 maxNumOfSamples:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v52;
  id v53;
  id v54;
  _BYTE *v55;
  unint64_t v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v10 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_length(v8, v11, v12, v13, v14, v15);
    _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_DEFAULT, "Style Sampling: get highest character coverage style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v16, (uint64_t)v8, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverage(self, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_intersectsSet_(v20, v27, (uint64_t)v26, v28, v29, v30);

  if ((v31 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = sub_1BE6D4B90;
    v59 = sub_1BE6D4BA0;
    v60 = 0;
    v49 = MEMORY[0x1E0C809B0];
    v50 = 3221225472;
    v51 = sub_1BE6DA5E8;
    v52 = &unk_1E77F38F8;
    v53 = v9;
    v55 = buf;
    v56 = a5;
    v54 = v20;
    objc_msgSend__safelyRunBlock_(self, v32, (uint64_t)&v49, v33, v34, v35);
    objc_msgSend_reverseObjectEnumerator(*(void **)(*(_QWORD *)&buf[8] + 40), v36, v37, v38, v39, v40, v49, v50, v51, v52);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)defaultStyleSample
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v29[6];
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t v36[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Style Sampling: Since no initial style is part of the request, get an initial style sample from the inventory", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = sub_1BE6D4B90;
  v34 = sub_1BE6D4BA0;
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE6DB1C0;
  v29[3] = &unk_1E77F38A8;
  v29[4] = self;
  v29[5] = buf;
  objc_msgSend__safelyRunBlock_(self, v4, (uint64_t)v29, v5, v6, v7);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    objc_msgSend_transcription(*((void **)v31 + 5), v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcription(*((void **)v31 + 5), v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_length(v20, v21, v22, v23, v24, v25);
    *(_DWORD *)v36 = 138740227;
    v37 = v14;
    v38 = 2048;
    v39 = v26;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_DEFAULT, "Style Sampling: picked up an initial style sample: %{sensitive}@ from the inventory of length: %lu", v36, 0x16u);

  }
LABEL_8:

  v27 = *((id *)v31 + 5);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (id)styleCharCoverageForInputSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[16];
  _QWORD v69[5];
  id v70;
  id v71;
  id v72;
  _BYTE *v73;
  int64_t v74;
  uint8_t v75[128];
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v10 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_length(v9, v11, v12, v13, v14, v15);
    _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using style + character coverage algorithm to find style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  v21 = v8;
  if (!v8)
  {
    objc_msgSend_defaultStyleSample(self, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v22, (uint64_t)v9, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v77 = sub_1BE6D4B90;
  v78 = sub_1BE6D4BA0;
  v27 = v26;
  v79 = v27;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = sub_1BE6DBE78;
  v69[3] = &unk_1E77F3920;
  v73 = buf;
  v69[4] = self;
  v28 = v21;
  v70 = v28;
  v29 = v9;
  v71 = v29;
  v74 = a5;
  v30 = v62;
  v72 = v30;
  objc_msgSend__safelyRunBlock_(self, v31, (uint64_t)v69, v32, v33, v34);
  if (v8)
  {
    if (qword_1EF568E88 == -1)
    {
      v40 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v41 = v30;
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v64, (uint64_t)v75, 16, v43);
        if (v48)
        {
          v49 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v65 != v49)
                objc_enumerationMutation(v41);
              objc_msgSend_updateSamplingCountForSample_(self, v44, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i), v45, v46, v47);
            }
            v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v64, (uint64_t)v75, 16, v47);
          }
          while (v48);
        }

        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = sub_1BE6DC1D8;
        v63[3] = &unk_1E77F1F38;
        v63[4] = self;
        objc_msgSend__safelyRunBlock_(self, v51, (uint64_t)v63, v52, v53, v54);
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v40 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    *(_WORD *)v68 = 0;
    _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_DEBUG, "Style Sampling: Since input sample was part of the request, updating the sampling count of samples that are used as style sample", v68, 2u);
    goto LABEL_11;
  }
LABEL_19:
  if (objc_msgSend_count(v30, v35, v36, v37, v38, v39))
  {
    objc_msgSend_stitchStyleSamples_(CHSynthesisStyleInventory, v55, (uint64_t)v30, v56, v57, v58);
    v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = v28;
  }
  v60 = v59;

  _Block_object_dispose(buf, 8);
  return v60;
}

- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v14 = objc_msgSend_maxStyleSampleLengthForPrompt_(CHSynthesisStyleInventory, v10, (uint64_t)v9, v11, v12, v13);
  objc_msgSend_styleSampleForInputSample_prompt_samplingAlgorithm_maxStyleSampleLength_(self, v15, (uint64_t)v8, (uint64_t)v9, a5, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxStyleSampleLength:(int64_t)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint32_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t v90[24];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v12, (uint64_t)v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverage(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_intersectsSet_(v16, v23, (uint64_t)v22, v24, v25, v26);

  if ((v27 & 1) != 0)
  {
    switch(a5)
    {
      case 2uLL:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v46 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v90 = 0;
          _os_log_impl(&dword_1BE607000, v46, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest short string heuristic algorithm for style sampling", v90, 2u);
        }

        objc_msgSend_styles(self, v47, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v52, v53, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shortStringHeuristicStyleSampleForPrompt_styles_maxNumOfSamples_(self, v59, (uint64_t)v11, (uint64_t)v58, 1, v60);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_count(v34, v61, v62, v63, v64, v65))
        {
          objc_msgSend_firstObject(v34, v66, v67, v68, v69, v70);
          v44 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = 0;
        }
        goto LABEL_32;
      case 1uLL:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v71 = (id)qword_1EF568E60;
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        *(_WORD *)v90 = 0;
        v72 = "Style Sampling: Using style character coverage algorithm for style sampling";
        v73 = v71;
        v74 = OS_LOG_TYPE_DEFAULT;
        v75 = 2;
        break;
      case 0uLL:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v28 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v90 = 0;
          _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest character coverage algorithm for style sampling", v90, 2u);
        }

        objc_msgSend_styles(self, v29, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v34, v35, v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_highestCharacterCoverageStyleSampleForPrompt_styles_(self, v41, (uint64_t)v11, (uint64_t)v40, v42, v43);
        v44 = objc_claimAutoreleasedReturnValue();

LABEL_32:
        v83 = objc_msgSend_copy(v44, v84, v85, v86, v87, v88, *(_OWORD *)v90);
        goto LABEL_33;
      default:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v71 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
LABEL_30:

          objc_msgSend_styleCharCoverageForInputSample_prompt_maxStyleSampleLength_(self, v76, (uint64_t)v10, (uint64_t)v11, a6, v77);
          v44 = objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend_copy(v44, v78, v79, v80, v81, v82, *(_OWORD *)v90);
LABEL_33:
          v45 = (void *)v83;
          goto LABEL_34;
        }
        *(_DWORD *)v90 = 134217984;
        *(_QWORD *)&v90[4] = a5;
        v72 = "Style Sampling: algorithm: %lu is not a supported sampling algorithm";
        v73 = v71;
        v74 = OS_LOG_TYPE_FAULT;
        v75 = 12;
        break;
    }
    _os_log_impl(&dword_1BE607000, v73, v74, v72, v90, v75);
    goto LABEL_30;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v44 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v90 = 0;
    _os_log_impl(&dword_1BE607000, v44, OS_LOG_TYPE_DEFAULT, "Style Sampling: No intersection of text prompt with the inventory, returning no style sample", v90, 2u);
  }
  v45 = 0;
LABEL_34:

  return v45;
}

- (id)styleSamplesForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxNumOfSamples:(unint64_t)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint8_t v56[16];
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v12, (uint64_t)v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverage(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_intersectsSet_(v16, v23, (uint64_t)v22, v24, v25, v26);

  if ((v27 & 1) != 0)
  {
    if (a5 == 2)
    {
      objc_msgSend_styles(self, v28, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allValues(v33, v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shortStringHeuristicStyleSampleForPrompt_styles_maxNumOfSamples_(self, v40, (uint64_t)v11, (uint64_t)v39, a6, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = objc_alloc(MEMORY[0x1E0C99D20]);
      v47 = (void *)objc_msgSend_initWithArray_copyItems_(v43, v44, (uint64_t)v42, 1, v45, v46);

    }
    else
    {
      if (a6 != 1)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v49 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_1BE607000, v49, OS_LOG_TYPE_FAULT, "maxNumOfSamples > 1 supported for CHStyleSampleSamplingCharacterInventorySynthesisShortStringHeuristic only", v56, 2u);
        }

      }
      objc_msgSend_styleSampleForInputSample_prompt_samplingAlgorithm_(self, v28, (uint64_t)v10, (uint64_t)v11, a5, v32);
      v50 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)v50;
      if (v50)
      {
        v57[0] = v50;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v51, (uint64_t)v57, 1, v52, v53);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = 0;
      }

    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v48 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_1BE607000, v48, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest short string heuristic algorithm for style sampling", v56, 2u);
    }
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v48 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_1BE607000, v48, OS_LOG_TYPE_DEFAULT, "Style Sampling: No intersection of text prompt with the inventory, returning no style sample", v56, 2u);
    }
    v47 = 0;
  }

  return v47;
}

- (id)styleSampleOptionsForRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  CHSynthesisStyleInventory *v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend_options(v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v10, v11, v12, v13, v14, v15);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE6DCB74;
  v25[3] = &unk_1E77F3948;
  v17 = v4;
  v26 = v17;
  v18 = v16;
  v27 = v18;
  v28 = self;
  v29 = 1;
  objc_msgSend__safelyRunBlock_(self, v19, (uint64_t)v25, v20, v21, v22);
  v23 = v18;

  return v23;
}

- (unint64_t)countOfStyleSamples
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6DD2C8;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CHSynthesisStyleInventory *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[4];
  CHSynthesisStyleInventory *v12;
  CHSynthesisStyleInventory *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = (CHSynthesisStyleInventory *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1BE6DD41C;
      v11[3] = &unk_1E77F24F0;
      v12 = v4;
      v13 = self;
      v14 = &v15;
      objc_msgSend__safelyRunBlock_(self, v5, (uint64_t)v11, v6, v7, v8);
      v9 = *((_BYTE *)v16 + 24) != 0;

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)clearSamplesEmbeddingVector
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_styles(self, a2, v2, v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v12);
        objc_msgSend_clearEmbeddingVector(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v22++), v15, v16, v17, v18, v19);
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16, v19);
    }
    while (v20);
  }

}

- (void)updateSynthesisModelHash:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6DD850;
  v10[3] = &unk_1E77F2428;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (NSString)synthesisModelHash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE6D4B90;
  v12 = sub_1BE6D4BA0;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6DD988;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (double)getLastCharacterStyleTimestamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6DDA44;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)fastPathCharacterStylesWithVariations
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1BE6D4B90;
  v14 = sub_1BE6D4BA0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE6DDB38;
  v9[3] = &unk_1E77F38A8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend__safelyRunBlock_(self, v3, (uint64_t)v9, v4, v5, v6);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)cleanupFastPathCharacters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE6DDD38;
  v5[3] = &unk_1E77F1F38;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5
{
  objc_msgSend_addSampleOfSynthesizedCharacter_transcription_key_version_(self, a2, (uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, 0);
}

- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5 version:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;
  unsigned int v22;

  v10 = a3;
  v11 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BE6DDE50;
  v18[3] = &unk_1E77F3998;
  v22 = a5;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = a6;
  v12 = v10;
  v13 = v11;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);

}

- (void)removeStyleSamplesIfNeeded
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = os_signpost_id_generate(v3);

  if (qword_1EF568E88 == -1)
  {
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStyleInventoryRemoveSamplesIfNeeded", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStyleInventoryRemoveSamplesIfNeeded\", v27, 2u);
  }

  v13 = objc_msgSend__maxInventorySize(CHSynthesisStyleInventory, v8, v9, v10, v11, v12);
  v19 = objc_msgSend__minimumSampleCountByCharacter(CHSynthesisStyleInventory, v14, v15, v16, v17, v18);
  objc_msgSend_removeStyleSamplesIfNeededWithMaximumSize_minimumSampleCountByCharacter_(self, v20, v13, v19, v21, v22);
  if (qword_1EF568E88 == -1)
  {
    v23 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_15;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v23 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_15;
  }
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v23, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventoryRemoveSamplesIfNeeded", ", v26, 2u);
  }
LABEL_15:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    goto LABEL_17;
  }
  v24 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventoryRemoveSamplesIfNeeded\", v25, 2u);
  }
LABEL_18:

}

- (void)removeStyleSamplesIfNeededWithMaximumSize:(int64_t)a3 minimumSampleCountByCharacter:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE6DE33C;
  v6[3] = &unk_1E77F2478;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v6, a4, v4, v5);
}

- (BOOL)hasAllDigits
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE6DEB94;
  v7[3] = &unk_1E77F23B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isPersonalizationAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if ((CHHasHandwritingGenerationAllowed((uint64_t)self, a2, v2, v3, v4, v5) & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1BE6DED68;
    v13[3] = &unk_1E77F38A8;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend__safelyRunBlock_(self, v7, (uint64_t)v13, v8, v9, v10);
    v11 = *((_BYTE *)v15 + 24) != 0;
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  return v11;
}

+ (BOOL)isPersonalizedSynthesisModelReady
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  if (!CHHasHandwritingGenerationAllowed((uint64_t)a1, a2, v2, v3, v4, v5))
    return 0;
  objc_msgSend_defaultURLOfModelInThisBundle(CHDiffusionModelE5ML, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  return v12;
}

+ (id)personalizedSynthesisModelVersion
{
  CHModelCatalog *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(CHModelCatalog);
  objc_msgSend_getModelVersion_(v2, v3, 0, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)statusWithInventory:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isPersonalizationAvailable;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isPersonalizedSynthesisModelReady;
  CHSynthesisStyleInventoryStatus *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion;
  CHSynthesisStyleInventoryStatus *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath;
  unsigned int hasAllDigits;
  void *v65;

  v3 = a3;
  isPersonalizationAvailable = objc_msgSend_isPersonalizationAvailable(v3, v4, v5, v6, v7, v8);
  isPersonalizedSynthesisModelReady = objc_msgSend_isPersonalizedSynthesisModelReady(CHSynthesisStyleInventory, v10, v11, v12, v13, v14);
  v16 = [CHSynthesisStyleInventoryStatus alloc];
  objc_msgSend_personalizedSynthesisModelVersion(CHSynthesisStyleInventory, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion = (void *)objc_msgSend_initWithIsPersonalizationAvailable_isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion_(v16, v23, isPersonalizationAvailable, isPersonalizedSynthesisModelReady, (uint64_t)v22, v24);

  if (os_variant_has_internal_diagnostics())
  {
    v26 = [CHSynthesisStyleInventoryStatus alloc];
    objc_msgSend_personalizedSynthesisModelVersion(CHSynthesisStyleInventory, v27, v28, v29, v30, v31);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    hasAllDigits = objc_msgSend_hasAllDigits(v3, v32, v33, v34, v35, v36);
    v42 = objc_msgSend_countOfStyleSamples(v3, v37, v38, v39, v40, v41);
    objc_msgSend_characterCoverage(v3, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inventoryStorageURL(v3, v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_relativePath(CHSynthesisStyleInventory, v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath = objc_msgSend_initWithIsPersonalizationAvailable_isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion_hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath_(v26, v61, isPersonalizationAvailable, isPersonalizedSynthesisModelReady, (uint64_t)v65, hasAllDigits, v42, -1, v48, v54, v60);

    isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion = (void *)hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath;
  }

  return isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion;
}

- (void)enumerateStyleSamplesUsingBlock:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6DF268;
  v10[3] = &unk_1E77F3AA0;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);

}

- (void)_safelyRunBlock:(id)a3
{
  const char *label;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void (**v17)(void);
  _QWORD block[4];
  void (**v19)(void);

  v17 = (void (**)(void))a3;
  label = dispatch_queue_get_label(0);
  if (!strcmp(label, "com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue")
    || (objc_msgSend__workQueue(self, v5, v6, v7, v8, v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    v17[2]();

  }
  else
  {
    objc_msgSend__workQueue(self, v11, v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE6DF408;
    block[3] = &unk_1E77F2400;
    v19 = v17;
    dispatch_sync(v16, block);

  }
}

- (void)setSynthesisModelHash:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisModelHash, a3);
}

- (void)setLastSavedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSavedDate, a3);
}

- (NSMutableDictionary)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
  objc_storeStrong((id *)&self->_styles, a3);
}

- (NSMutableDictionary)sampleCountByCharacter
{
  return self->_sampleCountByCharacter;
}

- (void)setSampleCountByCharacter:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCountByCharacter, a3);
}

- (NSURL)inventoryStorageURL
{
  return self->_inventoryStorageURL;
}

- (BOOL)hasInventoryChanged
{
  return self->_hasInventoryChanged;
}

- (void)setHasInventoryChanged:(BOOL)a3
{
  self->_hasInventoryChanged = a3;
}

- (NSMutableDictionary)fastPathCharacterStyles
{
  return self->_fastPathCharacterStyles;
}

- (void)setFastPathCharacterStyles:(id)a3
{
  objc_storeStrong((id *)&self->_fastPathCharacterStyles, a3);
}

- (int64_t)characterInventoryVersion
{
  return self->_characterInventoryVersion;
}

- (void)setCharacterInventoryVersion:(int64_t)a3
{
  self->_characterInventoryVersion = a3;
}

- (int64_t)currentSamplingTimestep
{
  return self->_currentSamplingTimestep;
}

- (void)setCurrentSamplingTimestep:(int64_t)a3
{
  self->_currentSamplingTimestep = a3;
}

- (double)characterStyleTimestamp
{
  return self->_characterStyleTimestamp;
}

- (OS_dispatch_queue)_workQueue
{
  return self->__workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__workQueue, 0);
  objc_storeStrong((id *)&self->_fastPathCharacterStyles, 0);
  objc_storeStrong((id *)&self->_inventoryStorageURL, 0);
  objc_storeStrong((id *)&self->_sampleCountByCharacter, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_lastSavedDate, 0);
  objc_storeStrong((id *)&self->_synthesisModelHash, 0);
}

@end
