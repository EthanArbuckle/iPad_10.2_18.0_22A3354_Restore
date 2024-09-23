@implementation CKDAssetHandle

- (id)dictionaryPropertyEncoding
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;

  v3 = (void *)objc_opt_new();
  objc_msgSend_UUID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("UUID"));

  objc_msgSend_itemID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_itemID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("itemID"));

  }
  objc_msgSend_path(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_path(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, CFSTR("path"));

  }
  objc_msgSend_volumeIndex(self, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_volumeIndex(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, CFSTR("volumeIndex"));

  }
  objc_msgSend_fileID(self, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_fileID(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, CFSTR("fileID"));

  }
  objc_msgSend_generationID(self, v26, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_generationID(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v34, (uint64_t)v33, CFSTR("generationID"));

  }
  objc_msgSend_lastUsedTime(self, v31, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend_lastUsedTime(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v39, (uint64_t)v38, CFSTR("lastUsedTime"));

  }
  objc_msgSend_fileSignature(self, v36, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend_fileSignature(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v43, CFSTR("fileSignature"));

  }
  objc_msgSend_status(self, v41, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_status(self, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v49, (uint64_t)v48, CFSTR("status"));

  }
  objc_msgSend_modTime(self, v46, v47);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend_modTime(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v54, (uint64_t)v53, CFSTR("modTime"));

  }
  objc_msgSend_fileSize(self, v51, v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend_fileSize(self, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, CFSTR("fileSize"));

  }
  objc_msgSend_chunkCount(self, v56, v57);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend_chunkCount(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v64, (uint64_t)v63, CFSTR("chunkCount"));

  }
  return v3;
}

- (CKDAssetHandle)initWithPropertyDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  CKDAssetHandle *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;

  v4 = a3;
  v8 = (CKDAssetHandle *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)CFSTR("UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUUID_(v8, v10, (uint64_t)v9);

    objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("itemID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setItemID_(v8, v13, (uint64_t)v12);

    objc_msgSend_objectForKeyedSubscript_(v4, v14, (uint64_t)CFSTR("path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPath_(v8, v16, (uint64_t)v15);

    objc_msgSend_objectForKeyedSubscript_(v4, v17, (uint64_t)CFSTR("volumeIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVolumeIndex_(v8, v19, (uint64_t)v18);

    objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("fileID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileID_(v8, v22, (uint64_t)v21);

    objc_msgSend_objectForKeyedSubscript_(v4, v23, (uint64_t)CFSTR("generationID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGenerationID_(v8, v25, (uint64_t)v24);

    objc_msgSend_objectForKeyedSubscript_(v4, v26, (uint64_t)CFSTR("lastUsedTime"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastUsedTime_(v8, v28, (uint64_t)v27);

    objc_msgSend_objectForKeyedSubscript_(v4, v29, (uint64_t)CFSTR("fileSignature"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSignature_(v8, v31, (uint64_t)v30);

    objc_msgSend_objectForKeyedSubscript_(v4, v32, (uint64_t)CFSTR("status"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStatus_(v8, v34, (uint64_t)v33);

    objc_msgSend_objectForKeyedSubscript_(v4, v35, (uint64_t)CFSTR("modTime"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModTime_(v8, v37, (uint64_t)v36);

    objc_msgSend_objectForKeyedSubscript_(v4, v38, (uint64_t)CFSTR("fileSize"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSize_(v8, v40, (uint64_t)v39);

    objc_msgSend_objectForKeyedSubscript_(v4, v41, (uint64_t)CFSTR("chunkCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChunkCount_(v8, v43, (uint64_t)v42);

    objc_msgSend_UUID(v8, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUUID_(v8, v50, (uint64_t)v49);

    }
    objc_msgSend_status(v8, v47, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
      objc_msgSend_setStatus_(v8, v52, (uint64_t)&unk_1E78B0A00);
    objc_msgSend_lastUsedTime(v8, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastUsedTime_(v8, v58, (uint64_t)v57);

    }
  }

  return v8;
}

+ (id)descriptionWithStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return CFSTR("UnDefInEd");
  else
    return off_1E7838998[a3];
}

- (BOOL)mayBeEvicted
{
  uint64_t v2;
  NSNumber *status;
  unint64_t v4;
  _BOOL4 v5;

  status = self->_status;
  if (status && (v4 = objc_msgSend_integerValue(status, a2, v2), v4 <= 6))
    return (0x29u >> v4) & 1;
  else
    LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)shouldBeUnregisteredBeforeDeleted
{
  uint64_t v2;
  NSNumber *status;

  status = self->_status;
  return !status || objc_msgSend_integerValue(status, a2, v2) != 8;
}

- (BOOL)mayHaveAssetCacheManagedFile
{
  uint64_t v2;
  NSNumber *status;
  uint64_t v4;

  status = self->_status;
  if (status)
  {
    v4 = objc_msgSend_integerValue(status, a2, v2);
    LOBYTE(status) = v4 == 3 || v4 == 8;
  }
  return (char)status;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  const char *v118;
  void *v119;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_UUID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("UUID=%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  objc_msgSend_itemID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_itemID(self, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_unsignedLongLongValue(v20, v21, v22);
    objc_msgSend_stringWithFormat_(v19, v24, (uint64_t)CFSTR("itemID=%llu"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v26, (uint64_t)v25);

  }
  objc_msgSend_path(self, v17, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_path(self, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v30, v35, (uint64_t)CFSTR("path=\"%@\"), v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

  }
  objc_msgSend_volumeIndex(self, v28, v29);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_volumeIndex(self, v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v41, v43, (uint64_t)CFSTR("volumeIndex=%@"), v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v45, (uint64_t)v44);

  }
  objc_msgSend_fileID(self, v39, v40);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileID(self, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v49, v51, (uint64_t)CFSTR("fileID=%@"), v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v53, (uint64_t)v52);

  }
  objc_msgSend_generationID(self, v47, v48);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v57 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_generationID(self, v55, v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v57, v59, (uint64_t)CFSTR("generationID=%@"), v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v61, (uint64_t)v60);

  }
  objc_msgSend_lastUsedTime(self, v55, v56);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v65 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_lastUsedTime(self, v63, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v65, v67, (uint64_t)CFSTR("lastUsedTime=%@"), v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v69, (uint64_t)v68);

  }
  objc_msgSend_fileSignature(self, v63, v64);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v73 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileSignature(self, v71, v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKLowercaseHexStringWithoutSpaces(v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v73, v78, (uint64_t)CFSTR("fileSignature=%@"), v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v80, (uint64_t)v79);

  }
  objc_msgSend_status(self, v71, v72);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    v84 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_statusDescription(self, v82, v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v84, v86, (uint64_t)CFSTR("status=%@"), v85);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v88, (uint64_t)v87);

  }
  objc_msgSend_modTime(self, v82, v83);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    v92 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_modTime(self, v90, v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v92, v94, (uint64_t)CFSTR("modTime=%@"), v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v96, (uint64_t)v95);

  }
  objc_msgSend_fileSize(self, v90, v91);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    v100 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileSize(self, v98, v99);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_longLongValue(v101, v102, v103);
    objc_msgSend_stringWithFormat_(v100, v105, (uint64_t)CFSTR("fileSize=%lld"), v104);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v107, (uint64_t)v106);

  }
  objc_msgSend_chunkCount(self, v98, v99);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    v111 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_chunkCount(self, v109, v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_unsignedIntValue(v112, v113, v114);
    objc_msgSend_stringWithFormat_(v111, v116, (uint64_t)CFSTR("chunkCount=%u"), v115);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v118, (uint64_t)v117);

  }
  objc_msgSend_componentsJoinedByString_(v3, v109, (uint64_t)CFSTR(", "));
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  return v119;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetHandle *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)statusDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  v3 = (void *)objc_opt_class();
  objc_msgSend_status(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_integerValue(v6, v7, v8);
  objc_msgSend_descriptionWithStatus_(v3, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CKDAssetHandle)initWithItemID:(id)a3 UUID:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKDAssetHandle *v12;
  CKDAssetHandle *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSNumber *status;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSDate *lastUsedTime;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKDAssetHandle;
  v12 = -[CKDAssetHandle init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemID, a3);
    v16 = v10;
    if (!v10)
    {
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v13->_UUID, v16);
    if (!v10)

    objc_storeStrong((id *)&v13->_path, a5);
    status = v13->_status;
    v13->_status = (NSNumber *)&unk_1E78B0A00;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    lastUsedTime = v13->_lastUsedTime;
    v13->_lastUsedTime = (NSDate *)v20;

  }
  return v13;
}

- (NSNumber)usesMMCSVersion2
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  int isValidV2Signature;
  void *v11;
  id v12;

  objc_msgSend_fileSignature(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C95138];
    objc_msgSend_fileSignature(self, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isValidV2Signature = objc_msgSend_isValidV2Signature_(v7, v9, (uint64_t)v8);
    v11 = (void *)MEMORY[0x1E0C9AAA0];
    if (isValidV2Signature)
      v11 = (void *)MEMORY[0x1E0C9AAB0];
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return (NSNumber *)v12;
}

- (BOOL)isEqualToAssetHandle:(id)a3 keys:(id)a4 optionalKeys:(id)a5 differencesDescription:(id *)a6
{
  id v9;
  id v10;
  void (**v11)(void *, void *);
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  BOOL v25;
  char isEqual;
  const char *v27;
  void *v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  BOOL v41;
  const char *v42;
  void *v43;
  uint64_t *v44;
  BOOL v45;
  id v47;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD aBlock[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v47 = a5;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 1;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1BE9BB240;
  v63 = sub_1BE9BAEC8;
  v64 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEC74C44;
  aBlock[3] = &unk_1E7838978;
  aBlock[4] = &v59;
  aBlock[5] = &v65;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v10;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v54, v70, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend_valueForKey_(self, v13, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(v9, v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v22 = v20;
        v24 = (void *)v22;
        if (v21 | v22)
        {
          if (v21)
            v25 = v22 == 0;
          else
            v25 = 1;
          if (v25)
          {

LABEL_14:
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("%@: %@ != %@"), v17, v21, v24, v47);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v11[2](v11, v28);

            goto LABEL_15;
          }
          isEqual = objc_msgSend_isEqual_((void *)v21, v23, v22);

          if ((isEqual & 1) == 0)
            goto LABEL_14;
        }
LABEL_15:

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v54, v70, 16);
    }
    while (v14);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v29 = v47;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v50, v69, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(v29);
        v35 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend_valueForKey_(self, v31, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(v9, v37, v35);
        v38 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v38;
        if (v36)
          v41 = v38 == 0;
        else
          v41 = 1;
        if (!v41 && (objc_msgSend_isEqual_(v36, v39, v38) & 1) == 0)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v42, (uint64_t)CFSTR("%@: %@ != %@"), v35, v36, v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v11[2](v11, v43);

        }
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v50, v69, 16);
    }
    while (v32);
  }

  v44 = v66;
  if (a6)
  {
    if (*((_BYTE *)v66 + 24))
    {
      *a6 = 0;
    }
    else
    {
      *a6 = objc_retainAutorelease((id)v60[5]);
      v44 = v66;
    }
  }
  v45 = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v45;
}

- (BOOL)isEqualRevisionOfAssetHandle:(id)a3 differencesDescription:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_isEqualToAssetHandle_keys_optionalKeys_differencesDescription_, a3);
}

- (void)setBoundaryKeyHashUsingBoundaryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  CC_LONG v12;
  const char *v13;
  NSData *v14;
  NSData *boundaryKeyHash;
  unsigned __int8 md[32];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v9 = (const void *)objc_msgSend_bytes(v6, v7, v8);
    v12 = objc_msgSend_length(v6, v10, v11);
    CC_SHA256(v9, v12, md);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)md, 32);
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    boundaryKeyHash = self->_boundaryKeyHash;
    self->_boundaryKeyHash = v14;
  }
  else
  {
    boundaryKeyHash = self->_boundaryKeyHash;
    self->_boundaryKeyHash = 0;
  }

}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSNumber)volumeIndex
{
  return self->_volumeIndex;
}

- (void)setVolumeIndex:(id)a3
{
  objc_storeStrong((id *)&self->_volumeIndex, a3);
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_generationID, a3);
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedTime, a3);
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (void)setFileSignature:(id)a3
{
  objc_storeStrong((id *)&self->_fileSignature, a3);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSDate)modTime
{
  return self->_modTime;
}

- (void)setModTime:(id)a3
{
  objc_storeStrong((id *)&self->_modTime, a3);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_fileSize, a3);
}

- (NSNumber)chunkCount
{
  return self->_chunkCount;
}

- (void)setChunkCount:(id)a3
{
  objc_storeStrong((id *)&self->_chunkCount, a3);
}

- (NSNumber)isCloned
{
  return self->_isCloned;
}

- (void)setIsCloned:(id)a3
{
  objc_storeStrong((id *)&self->_isCloned, a3);
}

- (NSData)boundaryKeyHash
{
  return self->_boundaryKeyHash;
}

- (void)setBoundaryKeyHash:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryKeyHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKeyHash, 0);
  objc_storeStrong((id *)&self->_isCloned, 0);
  objc_storeStrong((id *)&self->_chunkCount, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_volumeIndex, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
