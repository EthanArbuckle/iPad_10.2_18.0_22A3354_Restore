@implementation FlexSongMetadataReaderUtils

+ (id)addAnalysisMetadataToDictionary:(id)a3 pathToRoot:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  BOOL v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v74 = a3;
  v5 = a4;
  v72 = (void *)objc_opt_new();
  v73 = v5;
  objc_msgSend_stringByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("ANALYSIS"), v7, v8);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v71, v9, (uint64_t)CFSTR("ONSET"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtPath_error_(v17, v18, (uint64_t)v12, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v20;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v80, (uint64_t)v84, 16);
  if (v22)
  {
    v26 = v22;
    v27 = *(_QWORD *)v81;
    v76 = *(_QWORD *)v81;
    do
    {
      v28 = 0;
      v77 = v26;
      do
      {
        if (*(_QWORD *)v81 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v28);
        objc_msgSend_stringByAppendingPathComponent_(v12, v23, (uint64_t)v29, v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0;
        objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v31, (uint64_t)v30, 4, (uint64_t)&v79);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v79;
        if (!v36)
        {
          v37 = v12;
          objc_msgSend_componentsSeparatedByString_(v32, v33, (uint64_t)CFSTR("\n"), v34, v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend_mutableCopy(v38, v39, v40, v41, v42);

          objc_msgSend_indexesOfObjectsPassingTest_(v43, v44, (uint64_t)&unk_24C5EFB68, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsAtIndexes_(v43, v48, (uint64_t)v47, v49, v50);
          objc_msgSend_stringByDeletingPathExtension(v29, v51, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v55, v56, (uint64_t)CFSTR("_onset"), (uint64_t)&stru_24C5F0F80, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
            v61 = v58 == 0;
          else
            v61 = 1;
          if (!v61)
            objc_msgSend_setObject_forKey_(v75, v59, (uint64_t)v43, (uint64_t)v58, v60);

          v12 = v37;
          v27 = v76;
          v26 = v77;
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v80, (uint64_t)v84, 16);
    }
    while (v26);
  }

  objc_msgSend_setObject_forKey_(v72, v62, (uint64_t)v75, (uint64_t)CFSTR("onsets"), v63);
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v64, (uint64_t)v74, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v67, v68, (uint64_t)v72, (uint64_t)CFSTR("analysis"), v69);

  return v67;
}

@end
