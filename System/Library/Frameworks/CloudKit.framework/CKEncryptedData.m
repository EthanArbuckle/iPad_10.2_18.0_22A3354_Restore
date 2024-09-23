@implementation CKEncryptedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (CKEncryptedData)initWithValue:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  CKEncryptedString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKEncryptedData *v12;
  id v13;
  CKEncryptedDouble *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CKEncryptedDate *v22;
  const char *v23;
  uint64_t v24;
  CKEncryptedReference *v25;
  const char *v26;
  uint64_t v27;
  CKEncryptedLongLong *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  CKEncryptedLocation *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  CKEncryptedStringArray *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  CKEncryptedEmptyArray *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  CKEncryptedDoubleArray *v58;
  const char *v59;
  uint64_t v60;
  CKEncryptedDateArray *v61;
  const char *v62;
  uint64_t v63;
  CKEncryptedLocationArray *v64;
  const char *v65;
  uint64_t v66;
  CKEncryptedLongLongArray *v67;
  const char *v68;
  uint64_t v69;
  CKException *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  id v81;
  CKException *v82;
  uint64_t v83;
  objc_class *v84;
  void *v85;
  const char *v86;
  id v87;
  CKException *v88;
  uint64_t v89;
  objc_class *v90;
  const char *v91;
  id v92;

  v4 = a3;
  v92 = 0;
  v5 = _CKCheckArgument((uint64_t)"value", v4, 0, 0, 1, &v92);
  v6 = v92;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v70 = [CKException alloc];
    v74 = objc_msgSend_code(v7, v71, v72, v73);
    objc_msgSend_localizedDescription(v7, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend_initWithCode_format_(v70, v79, v74, (uint64_t)CFSTR("%@"), v78);
    goto LABEL_35;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v4;
      if (CFNumberIsFloatType((CFNumberRef)v13))
      {
        v14 = [CKEncryptedDouble alloc];
        objc_msgSend_doubleValue(v13, v15, v16, v17);
        v21 = objc_msgSend_initWithDouble_(v14, v18, v19, v20);
      }
      else
      {
        v28 = [CKEncryptedLongLong alloc];
        v32 = objc_msgSend_longLongValue(v13, v29, v30, v31);
        v21 = objc_msgSend_initWithLongLong_(v28, v33, v32, v34);
      }
      v12 = (CKEncryptedData *)v21;

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = [CKEncryptedDate alloc];
      v11 = objc_msgSend_initWithDate_(v22, v23, (uint64_t)v4, v24);
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = [CKEncryptedReference alloc];
      v11 = objc_msgSend_initWithReference_(v25, v26, (uint64_t)v4, v27);
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = [CKEncryptedLocation alloc];
      v11 = objc_msgSend_initWithLocation_(v36, v37, (uint64_t)v4, v38);
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (CKEncryptedData *)objc_msgSend_initWithData_(self, v39, (uint64_t)v4, v40);
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v82 = [CKException alloc];
      v83 = *MEMORY[0x1E0C99778];
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = (id)objc_msgSend_initWithName_format_(v82, v86, v83, (uint64_t)CFSTR("Invalid class requested for encrypted object: %@"), v85);

      objc_exception_throw(v87);
    }
    v13 = v4;
    if (!objc_msgSend_count(v13, v41, v42, v43))
    {
      v52 = [CKEncryptedEmptyArray alloc];
      objc_msgSend_data(MEMORY[0x1E0C99D50], v53, v54, v55);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_initWithData_(v52, v56, (uint64_t)v47, v57);
      goto LABEL_33;
    }
    objc_msgSend_firstObject(v13, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = [CKEncryptedStringArray alloc];
      v51 = objc_msgSend_initWithStringArray_(v48, v49, (uint64_t)v13, v50);
LABEL_33:
      v12 = (CKEncryptedData *)v51;

LABEL_14:
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (CFNumberIsFloatType((CFNumberRef)v47))
      {
        v58 = [CKEncryptedDoubleArray alloc];
        v51 = objc_msgSend_initWithDoubleArray_(v58, v59, (uint64_t)v13, v60);
      }
      else
      {
        v67 = [CKEncryptedLongLongArray alloc];
        v51 = objc_msgSend_initWithLongLongArray_(v67, v68, (uint64_t)v13, v69);
      }
      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = [CKEncryptedDateArray alloc];
      v51 = objc_msgSend_initWithDateArray_(v61, v62, (uint64_t)v13, v63);
      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = [CKEncryptedLocationArray alloc];
      v51 = objc_msgSend_initWithLocationArray_(v64, v65, (uint64_t)v13, v66);
      goto LABEL_33;
    }
    v88 = [CKException alloc];
    v89 = *MEMORY[0x1E0C99778];
    v90 = (objc_class *)objc_opt_class();
    NSStringFromClass(v90);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend_initWithName_format_(v88, v91, v89, (uint64_t)CFSTR("Invalid class requested for encrypted object: %@"), v78);
LABEL_35:
    v81 = v80;

    objc_exception_throw(v81);
  }
  v8 = [CKEncryptedString alloc];
  v11 = objc_msgSend_initWithString_(v8, v9, (uint64_t)v4, v10);
LABEL_4:
  v12 = (CKEncryptedData *)v11;

LABEL_15:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  objc_msgSend_data(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)objc_opt_class());
  v10 = v6;
  if (v5)
  {
    v11 = (_QWORD *)objc_msgSend_initWithData_(v6, v7, (uint64_t)v5, v9);
    objc_msgSend_encryptedData(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_copy(v15, v16, v17, v18);
    v20 = (void *)v11[2];
    v11[2] = v19;
  }
  else
  {
    objc_msgSend_encryptedData(self, v7, v8, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)objc_msgSend_initWithEncryptedData_(v10, v22, (uint64_t)v21, v23);

    objc_msgSend_data(self, v24, v25, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_copy(v15, v27, v28, v29);
    v20 = (void *)v11[1];
    v11[1] = v30;
  }

  return v11;
}

- (CKEncryptedData)initWithData:(id)a3
{
  id v4;
  char v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKEncryptedData *v10;
  uint64_t v11;
  NSData *data;
  void *v14;
  CKException *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  objc_super v26;
  id v27;

  v4 = a3;
  v27 = 0;
  v5 = _CKCheckArgument((uint64_t)"data", v4, 0, 0, 0, &v27);
  v6 = v27;
  if ((v5 & 1) == 0)
  {
    v14 = v6;
    v15 = [CKException alloc];
    v19 = objc_msgSend_code(v14, v16, v17, v18);
    objc_msgSend_localizedDescription(v14, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, (uint64_t)CFSTR("%@"), v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKEncryptedData;
  v10 = -[CKEncryptedData init](&v26, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v4, v7, v8, v9);
    data = v10->_data;
    v10->_data = (NSData *)v11;

  }
  return v10;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  _QWORD v61[4];
  _QWORD v62[5];

  v62[4] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return MEMORY[0x1E0C9AA70];
  if (a5)
  {
    v62[0] = CFSTR("encrypteddata");
    v61[0] = CFSTR("type");
    v61[1] = CFSTR("length");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_data(self, a2, a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_length(v7, v8, v9, v10);
    objc_msgSend_numberWithUnsignedInteger_(v6, v12, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v14;
    v61[2] = CFSTR("elength");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_encryptedData(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_length(v19, v20, v21, v22);
    objc_msgSend_numberWithUnsignedInteger_(v15, v24, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v26;
    v61[3] = CFSTR("data");
    objc_msgSend_data(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v30, v31, 32, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v33;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)v62, (uint64_t)v61, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_data(self, a2, a3, a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v59 = CFSTR("length");
      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_data(self, v38, v39, v40);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_length(v7, v42, v43, v44);
      objc_msgSend_numberWithUnsignedInteger_(v41, v46, v45, v47);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v14;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)&v60, (uint64_t)&v59, 1);
    }
    else
    {
      v57 = CFSTR("encryptedLength");
      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_encryptedData(self, v38, v39, v40);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_length(v7, v50, v51, v52);
      objc_msgSend_numberWithUnsignedInteger_(v49, v54, v53, v55);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v14;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)&v58, (uint64_t)&v57, 1);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (CKEncryptedData)init
{
  CKException *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, (uint64_t)CFSTR("You must call -[%@ initWithData:]"), v4);

  objc_exception_throw(v6);
}

- (CKEncryptedData)initWithEncryptedData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKEncryptedData *v8;
  uint64_t v9;
  NSData *encryptedData;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKEncryptedData;
  v8 = -[CKEncryptedData init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    encryptedData = v8->_encryptedData;
    v8->_encryptedData = (NSData *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqualToData;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_data(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_data(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("data=%@"), v8, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_encryptedData(self, v6, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v13, (uint64_t)CFSTR("encryptedData=%@"), v14, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKEncryptedData *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)needsEncryption
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend_data(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_encryptedData(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)needsDecryption
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend_encryptedData(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_data(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKEncryptedData)initWithCoder:(id)a3
{
  id v4;
  CKEncryptedData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *data;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSData *encryptedData;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEncryptedData;
  v5 = -[CKEncryptedData init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("EncryptedData"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v9;

    if (!byte_1EDF6A0E0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("ReallyEncryptedData"));
        v13 = objc_claimAutoreleasedReturnValue();
        encryptedData = v5->_encryptedData;
        v5->_encryptedData = (NSData *)v13;

      }
    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_data(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("EncryptedData"));

  if (!byte_1EDF6A0E0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_encryptedData(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, (uint64_t)CFSTR("ReallyEncryptedData"));

    }
  }
  objc_autoreleasePoolPop(v4);

}

- (void)setData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncryptedData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
