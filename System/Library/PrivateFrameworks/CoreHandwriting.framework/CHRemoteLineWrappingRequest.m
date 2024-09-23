@implementation CHRemoteLineWrappingRequest

- (CHRemoteLineWrappingRequest)initWithLineWrappableGroups:(id)a3 options:(id)a4
{
  id v6;
  CHRemoteLineWrappingRequest *v7;
  CHRemoteLineWrappingRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHRemoteLineWrappingRequest;
  v7 = -[CHRemoteLineWrappingRequest init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_lineWrappableGroups, a3);

  return v8;
}

- (CHRemoteLineWrappingRequest)initWithCoder:(id)a3
{
  id v4;
  CHRemoteLineWrappingRequest *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *lineWrappableGroups;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHRemoteLineWrappingRequest;
  v5 = -[CHRemoteLineWrappingRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("lineWrappableGroups"), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    lineWrappableGroups = v5->_lineWrappableGroups;
    v5->_lineWrappableGroups = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_lineWrappableGroups, (uint64_t)CFSTR("lineWrappableGroups"), v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqualToRemoteLineWrappingRequest:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHRemoteLineWrappingRequest *v9;
  int v10;
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
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
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
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char isEqualToDictionary;

  v9 = (CHRemoteLineWrappingRequest *)a3;
  if (self == v9)
    goto LABEL_9;
  v10 = objc_msgSend_enableCachingIfAvailable(self, v4, v5, v6, v7, v8);
  if (v10 != objc_msgSend_enableCachingIfAvailable(v9, v11, v12, v13, v14, v15))
    goto LABEL_4;
  objc_msgSend_lineWrappableGroups(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineWrappableGroups(v9, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 != v27)
    goto LABEL_4;
  objc_msgSend_options(self, v28, v29, v30, v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v9, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 == v40)
  {
LABEL_9:
    v33 = 1;
    goto LABEL_10;
  }
  objc_msgSend_options(self, v41, v42, v43, v44, v45);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend_options(v9, v46, v47, v48, v49, v50);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend_options(self, v52, v53, v54, v55, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v9, v59, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v58, v65, (uint64_t)v64, v66, v67, v68);

      if ((isEqualToDictionary & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
  }
LABEL_4:
  v33 = 0;
LABEL_10:

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteLineWrappingRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteLineWrappingRequest = objc_msgSend_isEqualToRemoteLineWrappingRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteLineWrappingRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
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
  uint64_t v26;
  uint64_t v27;
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
  unint64_t v38;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 17;
  objc_msgSend_lineWrappableGroups(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v42[3];
  v14 = objc_msgSend_enableCachingIfAvailable(self, v9, v10, v11, v12, v13);
  v15 = (uint64_t)v7 + 992 * v8 + 32 * v14 - v14 + -31 * v8;
  v42[3] = v15;
  objc_msgSend_options(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  v42[3] = v27 + 31 * v15;

  objc_msgSend_options(self, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = sub_1BE7B3410;
  v40[3] = &unk_1E77F5078;
  v40[4] = &v41;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v33, v34, (uint64_t)v40, v35, v36, v37);

  v38 = v42[3];
  _Block_object_dispose(&v41, 8);
  return v38;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (NSArray)lineWrappableGroups
{
  return self->_lineWrappableGroups;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lineWrappableGroups, 0);
}

@end
