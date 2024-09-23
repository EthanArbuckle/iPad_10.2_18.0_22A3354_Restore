@implementation CKDPCSData

- (CKDPCSData)initWithPCSData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDPCSData *v7;
  uint64_t v8;
  NSData *pcsData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCSData;
  v7 = -[CKDPCSData init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    pcsData = v7->_pcsData;
    v7->_pcsData = (NSData *)v8;

  }
  return v7;
}

- (void)dealloc
{
  _OpaquePCSShareProtection *pcs;
  objc_super v4;

  pcs = self->_pcs;
  if (pcs)
  {
    CFRelease(pcs);
    self->_pcs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSData;
  -[CKDPCSData dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldEncodePCSData
{
  return 1;
}

- (void)setPcs:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *pcs;
  CKDPCSData *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  CKDPCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  pcs = obj->_pcs;
  if (pcs != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      pcs = obj->_pcs;
    }
    else
    {
      v5 = obj;
    }
    v5->_pcs = a3;
    if (pcs)
    {
      CFRelease(pcs);
      a3 = obj->_pcs;
    }
    if (a3)
    {
      v6 = (void *)MEMORY[0x1C3B83E24]();
      v7 = (void *)PCSFPCreateUniqueID();
      objc_msgSend_CKBase64URLSafeString(v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcsKeyID_(obj, v11, (uint64_t)v10);

      objc_autoreleasePoolPop(v6);
    }
  }
  objc_sync_exit(obj);

}

- (_OpaquePCSShareProtection)pcs
{
  return self->_pcs;
}

- (NSSecureCoding)itemID
{
  return 0;
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_itemID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("itemID=%@, etag=%@"), v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_pcs(self, v13, v14))
  {
    v17 = objc_msgSend_pcs(self, v15, v16);
    objc_msgSend_appendFormat_(v12, v18, (uint64_t)CFSTR(", pcs=%@"), v17);
  }
  objc_msgSend_pcsData(self, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_pcsData(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v23, (uint64_t)CFSTR(", pcsData=%@"), v22);

  }
  objc_autoreleasePoolPop(v3);
  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPCSData *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const void *v28;
  const char *v29;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_pcsData(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setPcsData_(v4, v11, (uint64_t)v10);

  objc_msgSend_etag(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v14, v15, v16);
  objc_msgSend_setEtag_(v4, v18, (uint64_t)v17);

  objc_msgSend_pcsKeyID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v21, v22, v23);
  objc_msgSend_setPcsKeyID_(v4, v25, (uint64_t)v24);

  objc_msgSend_pcs(self, v26, v27);
  v28 = (const void *)PCSFPCopyObject();
  objc_msgSend_setPcs_(v4, v29, (uint64_t)v28);
  if (v28)
    CFRelease(v28);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x1C3B83E24]();
  if (objc_msgSend_shouldEncodePCSData(self, v5, v6))
  {
    objc_msgSend_pcsData(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v9, CFSTR("PCSData"));

    objc_msgSend_etag(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)v13, CFSTR("Etag"));

  }
  objc_msgSend_pcsKeyID(self, v7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v15, CFSTR("KeyID"));

  objc_autoreleasePoolPop(v4);
}

- (CKDPCSData)initWithCoder:(id)a3
{
  id v4;
  CKDPCSData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *pcsData;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *etag;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *pcsKeyID;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDPCSData;
  v5 = -[CKDPCSData init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("PCSData"));
    v9 = objc_claimAutoreleasedReturnValue();
    pcsData = v5->_pcsData;
    v5->_pcsData = (NSData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("Etag"));
    v13 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("KeyID"));
    v17 = objc_claimAutoreleasedReturnValue();
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSString *)v17;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void)setPcsKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_pcsKeyID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_pcsData, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
