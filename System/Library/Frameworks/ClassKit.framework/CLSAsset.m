@implementation CLSAsset

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4055EF4;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB368 != -1)
    dispatch_once(&qword_1ED0FB368, block);
  return (id)qword_1ED0FB360;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSAsset;
  return -[CLSAbstractAsset _init](&v3, sel__init);
}

- (CLSAsset)initWithFileURL:(id)a3
{
  return (CLSAsset *)MEMORY[0x1E0DE7D20](self, sel_initWithURL_ownerPersonID_type_, a3);
}

- (CLSAsset)initWithFileURL:(id)a3 withOwnerPersonID:(id)a4
{
  return (CLSAsset *)MEMORY[0x1E0DE7D20](self, sel_initWithURL_ownerPersonID_type_, a3);
}

- (CLSAsset)initWithURL:(id)a3 ownerPersonID:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  CLSAsset *v36;
  NSObject *v37;
  const char *v38;
  objc_super v40;
  objc_super v41;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (!v8)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v37 = CLSLogAsset;
    if (!os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v38 = "CLSAsset requires a non-nil URL.";
    goto LABEL_20;
  }
  if (!objc_msgSend_length(v9, v10, v11))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v37 = CLSLogAsset;
    if (!os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v38 = "CLSAsset requires a non-empty ownerPersonID.";
LABEL_20:
    _os_log_error_impl(&dword_1D4054000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
LABEL_17:
    v36 = 0;
    goto LABEL_18;
  }
  v41.receiver = self;
  v41.super_class = (Class)CLSAsset;
  v13 = -[CLSAbstractAsset _init](&v41, sel__init);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setType_(v13, v14, a5);
    v18 = (void *)objc_msgSend_copy(v8, v16, v17);
    v40.receiver = v15;
    v40.super_class = (Class)CLSAsset;
    -[CLSAbstractAsset setURL:](&v40, sel_setURL_, v18);
    objc_msgSend_lastPathComponent(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalFilename_(v15, v22, (uint64_t)v21);

    objc_msgSend_setOwnerPersonID_(v15, v23, (uint64_t)v12);
    objc_msgSend_setOriginal_(v15, v24, 1);
    objc_msgSend_setSchoolworkSyncStatus_(v15, v25, 1);
    objc_msgSend_setFileSizeInBytesFromURL_(v15, v26, (uint64_t)v18);
    objc_msgSend_setFileUTTypeFromURL_(v15, v27, (uint64_t)v18);
    objc_msgSend_setDownloaded_(v15, v28, 1);
    objc_msgSend_setFractionDownloaded_(v15, v29, v30, 1.0);
    v31 = objc_opt_new();
    v32 = (void *)*((_QWORD *)v15 + 45);
    *((_QWORD *)v15 + 45) = v31;

    if (a5 == 2)
      *((_BYTE *)v15 + 328) = 1;
    if (objc_msgSend_devModeOn(v15, v33, v34))
      objc_msgSend_setDevModeURL_(v15, v35, (uint64_t)v18);

  }
  self = (CLSAsset *)v15;
  v36 = self;
LABEL_18:

  return v36;
}

- (CLSAsset)initWithCoder:(id)a3
{
  id v3;
  CLSAsset *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSURL *devModeURL;
  const char *v10;
  char v11;
  uint64_t v12;
  NSMutableSet *uploadObservers;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSAsset;
  v3 = a3;
  v4 = -[CLSAbstractAsset initWithCoder:](&v15, sel_initWithCoder_, v3);
  v4->_uploaded = objc_msgSend_decodeBoolForKey_(v3, v5, (uint64_t)CFSTR("uploaded"), v15.receiver, v15.super_class);
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v7, v6, CFSTR("devModeURL"));
  v8 = objc_claimAutoreleasedReturnValue();
  devModeURL = v4->_devModeURL;
  v4->_devModeURL = (NSURL *)v8;

  v11 = objc_msgSend_decodeBoolForKey_(v3, v10, (uint64_t)CFSTR("staged"));
  v4->_staged = v11;
  v12 = objc_opt_new();
  uploadObservers = v4->_uploadObservers;
  v4->_uploadObservers = (NSMutableSet *)v12;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSAsset;
  v4 = a3;
  -[CLSAbstractAsset encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeBool_forKey_(v4, v5, self->_uploaded, CFSTR("uploaded"), v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_devModeURL, CFSTR("devModeURL"));
  objc_msgSend_encodeBool_forKey_(v4, v7, self->_staged, CFSTR("staged"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t isUploaded;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t isStaged;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CLSAsset;
  v4 = -[CLSAbstractAsset copyWithZone:](&v32, sel_copyWithZone_, a3);
  isUploaded = objc_msgSend_isUploaded(self, v5, v6);
  objc_msgSend_setUploaded_(v4, v8, isUploaded);
  objc_msgSend_devModeURL(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_copy(v11, v12, v13);
  objc_msgSend_setDevModeURL_(v4, v15, (uint64_t)v14);

  isStaged = objc_msgSend_isStaged(self, v16, v17);
  objc_msgSend_setStaged_(v4, v19, isStaged);
  objc_msgSend_fractionUploaded(self, v20, v21);
  objc_msgSend_setFractionUploaded_(v4, v22, v23);
  objc_msgSend_uploadError(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend_copy(v26, v27, v28);
  objc_msgSend_setUploadError_(v4, v30, (uint64_t)v29);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  int isUploaded;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int isStaged;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  char isEqual;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  objc_super v71;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    isEqual = 0;
    goto LABEL_8;
  }
  v11 = v10;
  v71.receiver = self;
  v71.super_class = (Class)CLSAsset;
  if (-[CLSAbstractAsset isEqual:](&v71, sel_isEqual_, v11))
  {
    isUploaded = objc_msgSend_isUploaded(self, v12, v13);
    if (isUploaded == objc_msgSend_isUploaded(v11, v15, v16))
    {
      isStaged = objc_msgSend_isStaged(self, v17, v18);
      if (isStaged == objc_msgSend_isStaged(v11, v20, v21))
      {
        objc_msgSend_devModeURL(self, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28 || (objc_msgSend_devModeURL(v11, v26, v27), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_devModeURL(self, v26, v27);
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v4 = (void *)v29;
            objc_msgSend_devModeURL(v11, v30, v31);
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v5 = (void *)v32;
              objc_msgSend_devModeURL(self, v33, v34);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_absoluteString(v7, v35, v36);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_devModeURL(v11, v37, v38);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_absoluteString(v70, v39, v40);
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_caseInsensitiveCompare_(v6, v41, (uint64_t)v3))
              {
                isEqual = 0;
LABEL_15:

LABEL_18:
                if (!v28)

                goto LABEL_6;
              }
              v69 = 1;
LABEL_23:
              objc_msgSend_fractionUploaded(self, v26, v27);
              v43 = v42;
              objc_msgSend_fractionUploaded(v11, v44, v45);
              if (v43 != v48)
              {
                isEqual = 0;
                if (!v69)
                  goto LABEL_18;
                goto LABEL_15;
              }
              v68 = v6;
              objc_msgSend_uploadError(self, v46, v47);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v51)
              {
                objc_msgSend_uploadError(v11, v49, v50);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v66)
                {
                  v66 = 0;
                  isEqual = 1;
LABEL_37:

                  v6 = v68;
                  if ((v69 & 1) == 0)
                    goto LABEL_18;
                  goto LABEL_15;
                }
              }
              v67 = v7;
              objc_msgSend_uploadError(self, v49, v50);
              v52 = objc_claimAutoreleasedReturnValue();
              if (v52)
              {
                v55 = (void *)v52;
                objc_msgSend_uploadError(self, v53, v54);
                v56 = objc_claimAutoreleasedReturnValue();
                if (v56)
                {
                  v64 = (void *)v56;
                  objc_msgSend_uploadError(self, v57, v58);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_uploadError(v11, v59, v60);
                  v65 = v8;
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqual = objc_msgSend_isEqual_(v63, v62, (uint64_t)v61);

                  v8 = v65;
                  goto LABEL_33;
                }

              }
              isEqual = 0;
LABEL_33:
              v7 = v67;
              if (v51)
              {

                if ((v69 & 1) == 0)
                  goto LABEL_18;
                v6 = v68;
                goto LABEL_15;
              }
              goto LABEL_37;
            }

          }
          isEqual = 0;
          goto LABEL_18;
        }
        v69 = 0;
        goto LABEL_23;
      }
    }
  }
  isEqual = 0;
LABEL_6:

LABEL_8:
  return isEqual;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSAsset;
  -[CLSAbstractAsset mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("uploaded");
  v22[1] = CFSTR("fractionUploaded");
  v22[2] = CFSTR("original");
  v22[3] = CFSTR("staged");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (id)URL
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  objc_msgSend_devModeURL(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_devModeURL(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CLSAsset;
    -[CLSAbstractAsset URL](&v9, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setDevModeURL:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_devModeURL, a3);
  if (objc_msgSend_type(self, v5, v6) == 1)
  {
    objc_msgSend_path(v11, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRelativePathWithinContainer_(self, v10, (uint64_t)v9);

  }
  self->_uploaded = 1;

}

- (BOOL)isUploaded
{
  uint64_t v2;
  BOOL uploaded;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  uploaded = self->_uploaded;
  objc_msgSend_unlock(self, v5, v6);
  return uploaded;
}

- (void)setUploaded:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_uploaded != v3)
  {
    self->_uploaded = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dateCreated(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateLastModified(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_compare_(v5, v9, (uint64_t)v8);

  if (v10 == 1)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v29 = v11;
      objc_msgSend_objectID(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateCreated(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateCreated(self, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v41, v42, v43);
      v45 = v44;
      objc_msgSend_dateLastModified(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(self, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v54, v55, v56);
      *(_DWORD *)buf = 138413314;
      v60 = v32;
      v61 = 2112;
      v62 = v38;
      v63 = 2048;
      v64 = v45;
      v65 = 2112;
      v66 = v51;
      v67 = 2048;
      v68 = v57;
      _os_log_error_impl(&dword_1D4054000, v29, OS_LOG_TYPE_ERROR, "Invalid dateLastModified date, objectID: %@, dateCreated: %@ (%f), dateLastModifed: %@ (%f)", buf, 0x34u);

    }
    objc_msgSend_dateCreated(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_copy(v14, v15, v16);
    objc_msgSend_setDateLastModified_(self, v18, (uint64_t)v17);

  }
  v58.receiver = self;
  v58.super_class = (Class)CLSAsset;
  v19 = -[CLSAbstractAsset validateObject:](&v58, sel_validateObject_, a3);
  objc_msgSend_devModeURL(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v25 = v19;
  else
    v25 = 0;
  if (!v22 && v19)
  {
    objc_msgSend_lock(self, v23, v24);
    if (self->_uploaded || (objc_msgSend_isDeleted(self, v26, v27) & 1) != 0 || objc_msgSend_type(self, v26, v27) == 2)
    {
      v25 = 1;
    }
    else
    {
      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v26, (uint64_t)a3, 3, self, CFSTR("trying to save an asset with a file that is not yet uploaded."));
      v25 = 0;
    }
    objc_msgSend_unlock(self, v26, v27);
  }
  return v25;
}

- (void)willSaveObject
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLSAsset;
  -[CLSAbstractAsset willSaveObject](&v2, sel_willSaveObject);
}

- (void)addUploadObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if ((objc_msgSend_containsObject_(self->_uploadObservers, v7, (uint64_t)v4) & 1) == 0)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_DEFAULT, "adding upload observer: %@", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend_addObject_(self->_uploadObservers, v11, (uint64_t)v4);
    objc_msgSend_devModeURL(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      self->_uploaded = 1;
LABEL_12:
      objc_msgSend_queued_notifyUploadCompletion(self, v8, v9);
      goto LABEL_13;
    }
    if (objc_msgSend_type(self, v8, v9) == 1)
    {
      objc_msgSend_URL(self, v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_uploaded = objc_msgSend_cls_isUploaded(v15, v16, v17);

    }
    if (self->_uploaded || (objc_msgSend_queued_uploadFileIfNeeded_(self, v8, 0) & 1) == 0)
      goto LABEL_12;
  }
LABEL_13:
  objc_msgSend_unlock(self, v8, v9);

}

- (void)removeUploadObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "removing upload observer: %@", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend_removeObject_(self->_uploadObservers, v8, (uint64_t)v4);
  objc_msgSend_unlock(self, v9, v10);

}

- (id)uploadObservers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_uploadObservers, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  return v6;
}

- (void)queued_notifyUploadProgress
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  objc_msgSend_uploadObservers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_initWeak(&location, self);
    sub_1D40C8318();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40C8358;
    block[3] = &unk_1E9749DC0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)queued_notifyUploadCompletion
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  objc_msgSend_uploadObservers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_initWeak(&location, self);
    sub_1D40C8318();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40C85D0;
    block[3] = &unk_1E9749DC0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)urlSuitableForOpeningWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  qos_class_t v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  CLSAsset *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_devModeURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_devModeURL(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v10;
      v25 = 2114;
      v26 = 0;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_DEFAULT, "done looking up url for asset: %@; url: %{mask.hash}@; error: %{public}@",
        buf,
        0x2Au);
    }
    v12 = qos_class_self();
    dispatch_get_global_queue(v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40C8948;
    block[3] = &unk_1E974A088;
    v17 = v10;
    v18 = v4;
    v14 = v10;
    dispatch_async(v13, block);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CLSAsset;
    -[CLSAbstractAsset urlSuitableForOpeningWithCompletion:](&v15, sel_urlSuitableForOpeningWithCompletion_, v4);
  }

}

- (void)urlSuitableForStreamingWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  qos_class_t v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  CLSAsset *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_devModeURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_devModeURL(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v10;
      v25 = 2114;
      v26 = 0;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_DEFAULT, "done getting streaming CloudKit asset url for asset: %@; url: %{mask.hash}@; error: %{public}@",
        buf,
        0x2Au);
    }
    v12 = qos_class_self();
    dispatch_get_global_queue(v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40C8B28;
    block[3] = &unk_1E974A088;
    v17 = v10;
    v18 = v4;
    v14 = v10;
    dispatch_async(v13, block);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CLSAsset;
    -[CLSAbstractAsset urlSuitableForStreamingWithCompletion:](&v15, sel_urlSuitableForStreamingWithCompletion_, v4);
  }

}

- (BOOL)queued_uploadFileIfNeeded:(id *)a3
{
  _QWORD block[5];

  if (qword_1EFE36000 != -1)
    dispatch_once(&qword_1EFE36000, &unk_1E974C4C0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40C8BF0;
  block[3] = &unk_1E974A658;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1EFE36008, block);
  if (a3)
    *a3 = objc_retainAutorelease(self->_uploadError);
  return self->_uploadRequested;
}

- (id)uploadFileIfNeeded:(id *)a3
{
  void *v5;
  const char *v6;
  CLSAssetUploadObserver *v7;
  const char *v8;
  void *v9;

  objc_msgSend_devModeURL(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_setUploaded_(self, v6, 1);
  }
  else if (!objc_msgSend_queued_uploadFileIfNeeded_(self, v6, (uint64_t)a3))
  {
    v9 = 0;
    return v9;
  }
  v7 = [CLSAssetUploadObserver alloc];
  v9 = (void *)objc_msgSend_initWithAsset_(v7, v8, (uint64_t)self);
  return v9;
}

- (void)createShareIfNeeded:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, uint64_t, _QWORD);
  id v19;
  id location;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend_devModeURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_2:
    v4[2](v4, 1, 0);
  }
  else
  {
    switch(objc_msgSend_type(self, v8, v9))
    {
      case 0:
      case 2:
        goto LABEL_2;
      case 1:
        objc_initWeak(&location, self);
        if (qword_1EFE36010 != -1)
          dispatch_once(&qword_1EFE36010, &unk_1E974C4E0);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = sub_1D40C8F58;
        v17[3] = &unk_1E974B6A0;
        v12 = (id)qword_1EFE36018;
        objc_copyWeak(&v19, &location);
        v17[4] = self;
        v18 = v4;
        dispatch_async(v12, v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        break;
      case 3:
        if (objc_msgSend_isUploaded(self, v10, v11))
        {
          objc_msgSend_brItemID(self, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_2;
        }
        objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v13, 316, CFSTR("Asset of type CLSAssetTypeCloudKit has not been uploaded."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v16);

        break;
      default:
        break;
    }
  }

}

- (void)createShareIfNeeded_Imp:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend_dataStore(self, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_shared(CLSDataStore, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_URL(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D40C94C8;
    v14[3] = &unk_1E974C438;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    v15 = v10;
    objc_msgSend_createShareIfNeededForURL_completion_(v9, v12, (uint64_t)v15, v14);

    objc_destroyWeak(&v17);
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v11, 2, CFSTR("Asset URL is nil when setting up CKShare"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

  }
  objc_destroyWeak(&location);

}

- (void)checkForCKShare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend_URL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D40C98A4;
  v10[3] = &unk_1E974C460;
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v11 = v8;
  objc_msgSend_cls_checkForCKShareWithCompletion_(v7, v9, (uint64_t)v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)deleteFileWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend_dataStore(self, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_shared(CLSDataStore, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_deleteBackingStoreForAsset_completion_(v8, v6, (uint64_t)self, v9);

}

- (BOOL)deleteFile:(id *)a3
{
  dispatch_block_t v5;
  id v6;
  const char *v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1D40C92E4;
  v22 = sub_1D40C92F4;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E974C480);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D40C9B70;
  v10[3] = &unk_1E974C410;
  v12 = &v14;
  v13 = &v18;
  v6 = v5;
  v11 = v6;
  objc_msgSend_deleteFileWithCompletion_(self, v7, (uint64_t)v10);
  dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (void)clientRemote_invalidate
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v2 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1D4054000, v2, OS_LOG_TYPE_DEBUG, "clientRemote_invalidate called", v3, 2u);
  }
}

- (void)clientRemote_uploadProgressFraction:(double)a3 error:(id)a4
{
  NSError *v6;
  NSObject *v7;
  NSError *uploadError;
  const char *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  double v13;
  __int16 v14;
  NSError *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (NSError *)a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218242;
    v13 = a3;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEBUG, "uploadProgressHandler called: progressFraction = %4.2f, error = %@", (uint8_t *)&v12, 0x16u);
  }
  self->_fractionUploaded = a3;
  uploadError = self->_uploadError;
  self->_uploadError = v6;

  objc_msgSend_setStaged_(self, v9, 1);
  objc_msgSend_queued_notifyUploadProgress(self, v10, v11);
}

- (void)clientRemote_uploadCompleted:(BOOL)a3 url:(id)a4 thumbnailURL:(id)a5 relativePathWithinContainer:(id)a6 ubiquitousContainerName:(id)a7 brItemID:(id)a8 brOwnerName:(id)a9 brZoneName:(id)a10 brShareName:(id)a11 fractionUploaded:(double)a12 isTemporary:(BOOL)a13 isStaged:(BOOL)a14 error:(id)a15
{
  NSError *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  NSError *uploadError;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  _BOOL4 v61;
  uint8_t buf[4];
  _BOOL4 v63;
  __int16 v64;
  NSError *v65;
  uint64_t v66;

  v61 = a3;
  v66 = *MEMORY[0x1E0C80C00];
  v60 = a6;
  v59 = a7;
  v21 = (NSError *)a15;
  v22 = a11;
  v23 = a10;
  v24 = a9;
  v25 = a8;
  v26 = a5;
  v27 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  LODWORD(v57) = a14;
  HIDWORD(v57) = a13;
  v28 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    v63 = v61;
    v64 = 2112;
    v65 = v21;
    _os_log_debug_impl(&dword_1D4054000, v28, OS_LOG_TYPE_DEBUG, "uploadCompletionHandler called: completed = %d, error = %@", buf, 0x12u);
  }
  self->_uploadRequested = 0;
  objc_msgSend_url(v27, v29, v30, v57);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_url(v26, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUploaded_(self, v35, v61);
  uploadError = self->_uploadError;
  self->_uploadError = v21;

  objc_msgSend_setURL_(self, v37, (uint64_t)v31);
  objc_msgSend_setThumbnailURL_(self, v38, (uint64_t)v34);
  objc_msgSend_lastPathComponent(v31, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOriginalFilename_(self, v42, (uint64_t)v41);

  if (objc_msgSend_type(self, v43, v44) == 1)
    objc_msgSend_setRelativePathWithinContainer_(self, v45, (uint64_t)v60);
  objc_msgSend_setUbiquitousContainerName_(self, v45, (uint64_t)v59);
  objc_msgSend_setBrItemID_(self, v46, (uint64_t)v25);

  objc_msgSend_setBrOwnerName_(self, v47, (uint64_t)v24);
  objc_msgSend_setBrZoneName_(self, v48, (uint64_t)v23);

  objc_msgSend_setBrShareName_(self, v49, (uint64_t)v22);
  objc_msgSend_setStaged_(self, v50, v58);
  objc_msgSend_setTemporary_(self, v51, HIDWORD(v58));
  objc_msgSend_setModified_(self, v52, 1);
  objc_msgSend_setFractionUploaded_(self, v53, v54, a12);
  objc_msgSend_queued_notifyUploadCompletion(self, v55, v56);

}

- (double)fractionUploaded
{
  return self->_fractionUploaded;
}

- (void)setFractionUploaded:(double)a3
{
  self->_fractionUploaded = a3;
}

- (NSError)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSURL)devModeURL
{
  return self->_devModeURL;
}

- (BOOL)isStaged
{
  return self->_staged;
}

- (void)setStaged:(BOOL)a3
{
  self->_staged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devModeURL, 0);
  objc_storeStrong((id *)&self->_uploadObservers, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
}

@end
