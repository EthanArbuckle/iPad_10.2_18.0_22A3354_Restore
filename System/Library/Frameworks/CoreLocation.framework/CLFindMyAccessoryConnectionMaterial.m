@implementation CLFindMyAccessoryConnectionMaterial

- (CLFindMyAccessoryConnectionMaterial)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);

  return 0;
}

- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4
{
  return (CLFindMyAccessoryConnectionMaterial *)MEMORY[0x1E0DE7D20](self, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_, a3, a4);
}

- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4 primaryIndex:(id)a5 secondaryIndex:(id)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CLFindMyAccessoryConnectionMaterial *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLFindMyAccessoryConnectionMaterial;
  v13 = -[CLFindMyAccessoryConnectionMaterial init](&v24, sel_init);
  if (v13)
  {
    v13->_address = (NSData *)objc_msgSend_copy(a3, v10, v11, v12);
    v13->_ltk = (NSData *)objc_msgSend_copy(a4, v14, v15, v16);
    v13->_primaryIndex = (NSNumber *)objc_msgSend_copy(a5, v17, v18, v19);
    v13->_secondaryIndex = (NSNumber *)objc_msgSend_copy(a6, v20, v21, v22);
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MEMORY[0x1E0DE7D20](self, sel_isEqualToMaterial_, a3, v5);
  else
    return 0;
}

- (BOOL)isEqualToMaterial:(id)a3
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int isEqualToData;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v53;
  const char *v54;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v53 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryConnectionMaterial.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherMaterial isKindOfClass:[CLFindMyAccessoryConnectionMaterial class]]"));
  }
  v9 = objc_msgSend_address(a3, v6, v7, v8);
  v13 = objc_msgSend_address(self, v10, v11, v12);
  v17 = (void *)v13;
  if (v9)
  {
    v18 = objc_msgSend_address(a3, v14, v15, v16);
    isEqualToData = objc_msgSend_isEqualToData_(v17, v19, v18, v20);
  }
  else
  {
    isEqualToData = v13 == 0;
  }
  if (objc_msgSend_ltk(a3, v14, v15, v16))
  {
    if (isEqualToData)
    {
      v25 = (void *)objc_msgSend_ltk(self, v22, v23, v24);
      v29 = objc_msgSend_ltk(a3, v26, v27, v28);
      isEqualToData = objc_msgSend_isEqualToData_(v25, v30, v29, v31);
    }
  }
  else if (isEqualToData)
  {
    isEqualToData = objc_msgSend_ltk(self, v22, v23, v24) == 0;
  }
  if (objc_msgSend_primaryIndex(a3, v22, v23, v24))
  {
    if (isEqualToData)
    {
      v35 = (void *)objc_msgSend_primaryIndex(self, v32, v33, v34);
      v39 = objc_msgSend_primaryIndex(a3, v36, v37, v38);
      isEqualToData = objc_msgSend_isEqualToNumber_(v35, v40, v39, v41);
    }
  }
  else if (isEqualToData)
  {
    isEqualToData = objc_msgSend_primaryIndex(self, v32, v33, v34) == 0;
  }
  if (objc_msgSend_secondaryIndex(a3, v32, v33, v34))
  {
    if (isEqualToData)
    {
      v45 = (void *)objc_msgSend_secondaryIndex(self, v42, v43, v44);
      v49 = objc_msgSend_secondaryIndex(a3, v46, v47, v48);
      return objc_msgSend_isEqualToNumber_(v45, v50, v49, v51);
    }
  }
  else if (isEqualToData)
  {
    return objc_msgSend_secondaryIndex(self, v42, v43, v44) == 0;
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = (void *)objc_msgSend_address(self, a2, v2, v3);
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_ltk(self, v10, v11, v12);
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  v21 = (void *)objc_msgSend_primaryIndex(self, v18, v19, v20);
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  v29 = (void *)objc_msgSend_secondaryIndex(self, v26, v27, v28);
  return v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_primaryIndex(self, a2, v2, v3);
  v10 = objc_msgSend_secondaryIndex(self, v7, v8, v9);
  v14 = objc_msgSend_address(self, v11, v12, v13);
  v18 = objc_msgSend_ltk(self, v15, v16, v17);
  return (id)objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("CLFindMyAccessoryConnectionMaterial <%p>, PrimaryIndex: %@, SecondaryIndex:%@, Address:%@, LTK:%@"), v20, self, v6, v10, v14, v18);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = objc_alloc((Class)objc_opt_class());
  v8 = (id)objc_msgSend_copy(self->_address, v5, v6, v7);
  v12 = (id)objc_msgSend_copy(self->_ltk, v9, v10, v11);
  v16 = (id)objc_msgSend_copy(self->_primaryIndex, v13, v14, v15);
  v20 = (id)objc_msgSend_copy(self->_secondaryIndex, v17, v18, v19);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_, v8, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryConnectionMaterial)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("address"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("ltk"));
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("primaryIndex"));
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("secondaryIndex"));
  return (CLFindMyAccessoryConnectionMaterial *)MEMORY[0x1E0DE7D20](self, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_address, (uint64_t)CFSTR("address"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_ltk, (uint64_t)CFSTR("ltk"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_primaryIndex, (uint64_t)CFSTR("primaryIndex"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_secondaryIndex, (uint64_t)CFSTR("secondaryIndex"));
}

- (id)dictionaryDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSData *address;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSData *ltk;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  const char *v27;
  NSNumber *primaryIndex;
  NSNumber *secondaryIndex;

  v5 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  address = self->_address;
  if (objc_msgSend_length(address, v7, v8, v9) == 6)
  {
    v13 = (unsigned __int8 *)objc_msgSend_bytes(address, v10, v11, v12);
    v16 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), v15, *v13, v13[1], v13[2], v13[3], v13[4], v13[5]);
    objc_msgSend_setObject_forKey_(v5, v17, v16, (uint64_t)CFSTR("address"));
  }
  else
  {
    objc_msgSend_setObject_forKey_(v5, v10, 0, (uint64_t)CFSTR("address"));
  }
  ltk = self->_ltk;
  if (ltk)
  {
    if ((unint64_t)objc_msgSend_length(self->_ltk, v18, v19, v20) >= 0x10)
    {
      v25 = (unsigned __int8 *)objc_msgSend_bytes(ltk, v22, v23, v24);
      v26 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], (const char *)v25[9], (uint64_t)CFSTR("%02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X"), v25[11], *v25, v25[1], v25[2], v25[3], v25[4], v25[5], v25[6], v25[7], v25[8], v25[9], v25[10], v25[11], v25[12], v25[13], v25[14],
              v25[15]);
      objc_msgSend_setObject_forKey_(v5, v27, v26, (uint64_t)CFSTR("ltk"));
    }
    else
    {
      objc_msgSend_setObject_forKey_(v5, v22, 0, (uint64_t)CFSTR("ltk"));
    }
  }
  primaryIndex = self->_primaryIndex;
  if (primaryIndex)
    objc_msgSend_setObject_forKey_(v5, v18, (uint64_t)primaryIndex, (uint64_t)CFSTR("primaryIndex"));
  secondaryIndex = self->_secondaryIndex;
  if (secondaryIndex)
    objc_msgSend_setObject_forKey_(v5, v18, (uint64_t)secondaryIndex, (uint64_t)CFSTR("secondaryIndex"));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryConnectionMaterial;
  -[CLFindMyAccessoryConnectionMaterial dealloc](&v3, sel_dealloc);
}

- (NSData)address
{
  return self->_address;
}

- (NSData)ltk
{
  return self->_ltk;
}

- (NSNumber)primaryIndex
{
  return self->_primaryIndex;
}

- (NSNumber)secondaryIndex
{
  return self->_secondaryIndex;
}

@end
