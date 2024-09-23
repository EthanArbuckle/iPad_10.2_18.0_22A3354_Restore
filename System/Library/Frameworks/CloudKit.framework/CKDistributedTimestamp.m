@implementation CKDistributedTimestamp

- (CKDistributedTimestamp)initWithSiteIdentifier:(id)a3 clockValue:(unint64_t)a4
{
  id v6;
  CKDistributedSiteIdentifier *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  CKDistributedTimestamp *v12;

  v6 = a3;
  v7 = [CKDistributedSiteIdentifier alloc];
  v10 = (void *)objc_msgSend_initWithIdentifier_(v7, v8, (uint64_t)v6, v9);
  v12 = (CKDistributedTimestamp *)objc_msgSend_initWithSiteIdentifierObject_clockValue_(self, v11, (uint64_t)v10, a4);

  return v12;
}

- (CKDistributedTimestamp)initWithSiteIdentifierObject:(id)a3 clockValue:(unint64_t)a4
{
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDistributedTimestamp *v11;
  uint64_t v12;
  CKDistributedSiteIdentifier *siteIdentifierObject;
  objc_super v15;

  v7 = a3;
  if (a4 == -1)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Clock value NSUIntegerMax is reserved"));
  v15.receiver = self;
  v15.super_class = (Class)CKDistributedTimestamp;
  v11 = -[CKDistributedTimestamp init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v7, v8, v9, v10);
    siteIdentifierObject = v11->_siteIdentifierObject;
    v11->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v12;

    v11->_clockValue = a4;
  }

  return v11;
}

- (NSData)siteIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (unsigned)modifier
{
  return 0;
}

- (BOOL)unordered
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestamp)initWithCoder:(id)a3
{
  id v4;
  CKDistributedTimestamp *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKDistributedSiteIdentifier *siteIdentifierObject;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  CKDistributedSiteIdentifier *v18;
  const char *v19;
  uint64_t v20;
  CKDistributedSiteIdentifier *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDistributedTimestamp;
  v5 = -[CKDistributedTimestamp init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_siteIdentifierObject);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    siteIdentifierObject = v5->_siteIdentifierObject;
    v5->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v9;

    NSStringFromSelector(sel_clockValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_clockValue = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)v11, v13);

    if (!v5->_siteIdentifierObject)
    {
      v14 = objc_opt_class();
      NSStringFromSelector(sel_siteIdentifier);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = [CKDistributedSiteIdentifier alloc];
      v20 = objc_msgSend_initWithIdentifier_modifier_(v18, v19, (uint64_t)v17, 0);
      v21 = v5->_siteIdentifierObject;
      v5->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v20;

    }
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
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  id v27;

  v27 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_siteIdentifierObject(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_siteIdentifierObject);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v27, v10, (uint64_t)v8, (uint64_t)v9);

  v14 = objc_msgSend_clockValue(self, v11, v12, v13);
  NSStringFromSelector(sel_clockValue);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v27, v16, v14, (uint64_t)v15);

  objc_msgSend_siteIdentifierObject(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_siteIdentifier);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v27, v26, (uint64_t)v24, (uint64_t)v25);

  objc_autoreleasePoolPop(v4);
}

- (int64_t)compareToTimestamp:(id)a3
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
  int isEqual;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  objc_msgSend_siteIdentifierObject(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_siteIdentifierObject(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if (isEqual)
  {
    v19 = objc_msgSend_clockValue(self, v16, v17, v18);
    if (v19 >= objc_msgSend_clockValue(v4, v20, v21, v22))
    {
      v27 = objc_msgSend_clockValue(self, v23, v24, v25);
      v26 = v27 > objc_msgSend_clockValue(v4, v28, v29, v30);
    }
    else
    {
      v26 = -1;
    }
  }
  else
  {
    v26 = 3;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  v19 = ((v4 != 0) & objc_opt_isKindOfClass()) != 0
     && (v8 = objc_msgSend_hash(self, v5, v6, v7), v8 == objc_msgSend_hash(v4, v9, v10, v11))
     && (v14 = objc_msgSend_compareToTimestamp_(self, v12, (uint64_t)v4, v13),
         v14 == objc_msgSend_compareToTimestamp_(v4, v15, (uint64_t)self, v16))
     && objc_msgSend_compareToTimestamp_(self, v17, (uint64_t)v4, v18) == 0;

  return v19;
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
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_clockValue(self, v11, v12, v13);
  objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v17, v18, v19, v20) ^ v9;

  return v21;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_msgSend_clockValue(self, v11, v12, v13);
  if (v17 == -1)
  {
    v22 = CFSTR("_");
    objc_msgSend_stringWithFormat_(v10, v14, (uint64_t)CFSTR("%@:%@"), v16, v9, CFSTR("_"));
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = objc_msgSend_clockValue(self, v14, v15, v16);
    objc_msgSend_numberWithUnsignedInteger_(v18, v20, v19, v21);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v23, (uint64_t)CFSTR("%@:%@"), v24, v9, v22);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 != -1)

  return v25;
}

- (id)descriptionWithStringSiteIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_msgSend_clockValue(self, v11, v12, v13);
  if (v17 == -1)
  {
    v22 = CFSTR("_");
    objc_msgSend_stringWithFormat_(v10, v14, (uint64_t)CFSTR("%@:%@"), v16, v9, CFSTR("_"));
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = objc_msgSend_clockValue(self, v14, v15, v16);
    objc_msgSend_numberWithUnsignedInteger_(v18, v20, v19, v21);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v23, (uint64_t)CFSTR("%@:%@"), v24, v9, v22);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 != -1)

  return v25;
}

- (CKDistributedSiteIdentifier)siteIdentifierObject
{
  return self->_siteIdentifierObject;
}

- (unint64_t)clockValue
{
  return self->_clockValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteIdentifierObject, 0);
}

@end
