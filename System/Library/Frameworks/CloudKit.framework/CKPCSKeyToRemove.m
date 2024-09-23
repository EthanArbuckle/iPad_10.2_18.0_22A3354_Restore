@implementation CKPCSKeyToRemove

- (CKPCSKeyToRemove)initWithKeyID:(id)a3 keyType:(int64_t)a4
{
  id v7;
  CKPCSKeyToRemove *v8;
  CKPCSKeyToRemove *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPCSKeyToRemove;
  v8 = -[CKPCSKeyToRemove init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pcsKeyID, a3);
    v9->_keyType = a4;
  }

  return v9;
}

- (id)initInternal
{
  CKPCSKeyToRemove *v2;
  uint64_t v3;
  NSData *pcsKeyID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKPCSKeyToRemove;
  v2 = -[CKPCSKeyToRemove init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pcsKeyID = v2->_pcsKeyID;
    v2->_pcsKeyID = (NSData *)v3;

    v2->_keyType = 2;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int isEqual;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && (objc_msgSend_pcsKeyID(self, v8, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_pcsKeyID(v4, v12, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15, v17),
        v15,
        v11,
        isEqual))
  {
    v22 = objc_msgSend_keyType(self, v19, v20, v21);
    v26 = v22 == objc_msgSend_keyType(v4, v23, v24, v25);
  }
  else
  {
    v26 = 0;
  }

  return v26;
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
  unint64_t v13;

  objc_msgSend_pcsKeyID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_keyType(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKPCSKeyToRemove;
  -[CKPCSKeyToRemove description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsKeyID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_keyType(self, v12, v13, v14);
  if ((unint64_t)(v15 - 1) > 2)
    objc_msgSend_stringByAppendingFormat_(v3, v16, (uint64_t)CFSTR(": keyID:%@ keyType:%@"), v17, v11, CFSTR("INVALID"));
  else
    objc_msgSend_stringByAppendingFormat_(v3, v16, (uint64_t)CFSTR(": keyID:%@ keyType:%@"), v17, v11, off_1E1F657B0[v15 - 1]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
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
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_pcsKeyID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  v16 = objc_msgSend_keyType(self, v13, v14, v15);
  v18 = (void *)objc_msgSend_initWithKeyID_keyType_(v4, v17, (uint64_t)v12, v16);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v14 = a3;
  objc_msgSend_pcsKeyID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)v7, (uint64_t)CFSTR("PCSKeyID"));

  v12 = objc_msgSend_keyType(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v14, v13, v12, (uint64_t)CFSTR("KeyType"));

}

- (CKPCSKeyToRemove)initWithCoder:(id)a3
{
  id v4;
  CKPCSKeyToRemove *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSData *pcsKeyID;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKPCSKeyToRemove;
  v5 = -[CKPCSKeyToRemove init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("PCSKeyID"));
    v8 = objc_claimAutoreleasedReturnValue();
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v8;

    v5->_keyType = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("KeyType"), v11);
  }

  return v5;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSData)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
}

@end
