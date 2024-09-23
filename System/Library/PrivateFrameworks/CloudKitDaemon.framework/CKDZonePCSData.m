@implementation CKDZonePCSData

- (CKDZonePCSData)initWithZone:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKDZonePCSData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKRecordZoneID *zoneID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSData *zoneishPCSData;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CKRecordID *shareID;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSDate *zonePCSModificationDate;
  objc_super v33;

  v4 = a3;
  objc_msgSend_protectionData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)CKDZonePCSData;
  v8 = -[CKDPCSData initWithPCSData:](&v33, sel_initWithPCSData_, v7);

  if (v8)
  {
    objc_msgSend_zoneID(v4, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v11;

    objc_msgSend_zoneishProtectionData(v4, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    zoneishPCSData = v8->_zoneishPCSData;
    v8->_zoneishPCSData = (NSData *)v15;

    objc_msgSend_protectionEtag(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v8, v20, (uint64_t)v19);

    objc_msgSend_share(v4, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    shareID = v8->_shareID;
    v8->_shareID = (CKRecordID *)v26;

    objc_msgSend_zonePCSModificationDate(v4, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    zonePCSModificationDate = v8->_zonePCSModificationDate;
    v8->_zonePCSModificationDate = (NSDate *)v30;

  }
  return v8;
}

+ (CKDZonePCSData)dataWithZone:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend_initWithZone_(v4, v5, (uint64_t)v3);

  return (CKDZonePCSData *)v6;
}

- (void)dealloc
{
  _OpaquePCSShareProtection *zoneishPCS;
  objc_super v4;

  zoneishPCS = self->_zoneishPCS;
  if (zoneishPCS)
  {
    CFRelease(zoneishPCS);
    self->_zoneishPCS = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDZonePCSData;
  -[CKDPCSData dealloc](&v4, sel_dealloc);
}

- (void)setZoneishPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *zoneishPCS;
  CKDZonePCSData *v5;
  void *v6;
  void *v7;
  const char *v8;
  CKDZonePCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  zoneishPCS = obj->_zoneishPCS;
  if (zoneishPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      zoneishPCS = obj->_zoneishPCS;
    }
    else
    {
      v5 = obj;
    }
    v5->_zoneishPCS = a3;
    if (zoneishPCS)
      CFRelease(zoneishPCS);
    v6 = (void *)MEMORY[0x1C3B83E24]();
    objc_msgSend_protectionIdentifierFromShareProtection_(CKDPCSManager, (const char *)obj, (uint64_t)obj->_zoneishPCS);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishPublicKeyID_(obj, v8, (uint64_t)v7);

    objc_autoreleasePoolPop(v6);
  }
  objc_sync_exit(obj);

}

- (_OpaquePCSShareProtection)zoneishPCS
{
  return self->_zoneishPCS;
}

- (void)setSharePCSData:(id)a3
{
  CKDSharePCSData *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CKDSharePCSData *sharePCSData;

  v4 = (CKDSharePCSData *)a3;
  objc_msgSend_shareID(self, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_shareID(v4, v7, v8);

  }
  objc_msgSend_shareID(v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareID_(self, v13, (uint64_t)v12);

  sharePCSData = self->_sharePCSData;
  self->_sharePCSData = v4;

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
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)CKDZonePCSData;
  v4 = -[CKDPCSData copyWithZone:](&v55, sel_copyWithZone_, a3);
  objc_msgSend_zoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setZoneID_(v4, v11, (uint64_t)v10);

  objc_msgSend_zoneishPCSData(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v14, v15, v16);
  objc_msgSend_setZoneishPCSData_(v4, v18, (uint64_t)v17);

  objc_msgSend_zoneishPublicKeyID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v21, v22, v23);
  objc_msgSend_setZoneishPublicKeyID_(v4, v25, (uint64_t)v24);

  objc_msgSend_sharePCSData(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_copy(v28, v29, v30);
  objc_msgSend_setSharePCSData_(v4, v32, (uint64_t)v31);

  objc_msgSend_shareID(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_copy(v35, v36, v37);
  objc_msgSend_setShareID_(v4, v39, (uint64_t)v38);

  if (objc_msgSend_zoneishPCS(self, v40, v41))
  {
    objc_msgSend_zoneishPCS(self, v42, v43);
    v44 = (const void *)PCSFPCopyObject();
    objc_msgSend_setZoneishPCS_(v4, v45, (uint64_t)v44);
    if (v44)
      CFRelease(v44);
  }
  objc_msgSend_zonePCSModificationDate(self, v42, v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend_zonePCSModificationDate(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend_copy(v49, v50, v51);
    objc_msgSend_setZonePCSModificationDate_(v4, v53, (uint64_t)v52);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CKDZonePCSData;
  v4 = a3;
  -[CKDPCSData encodeWithCoder:](&v25, sel_encodeWithCoder_, v4);
  objc_msgSend_zoneID(self, v5, v6, v25.receiver, v25.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("ZoneID"));

  objc_msgSend_zoneishPCSData(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("ZoneishPCSData"));

  objc_msgSend_zoneishPublicKeyID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, CFSTR("ZoneishPublicKeyID"));

  objc_msgSend_shareID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, CFSTR("RecordShareID"));

  objc_msgSend_zonePCSModificationDate(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, CFSTR("ZonePCSModificationDate"));

}

- (CKDZonePCSData)initWithCoder:(id)a3
{
  id v4;
  CKDZonePCSData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKRecordZoneID *zoneID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSData *zoneishPCSData;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSData *zoneishPublicKeyID;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  CKRecordID *shareID;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSDate *zonePCSModificationDate;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKDZonePCSData;
  v5 = -[CKDPCSData initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("ZoneID"));
    v8 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("ZoneishPCSData"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneishPCSData = v5->_zoneishPCSData;
    v5->_zoneishPCSData = (NSData *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("ZoneishPublicKeyID"));
    v16 = objc_claimAutoreleasedReturnValue();
    zoneishPublicKeyID = v5->_zoneishPublicKeyID;
    v5->_zoneishPublicKeyID = (NSData *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("RecordShareID"));
    v20 = objc_claimAutoreleasedReturnValue();
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("ZonePCSModificationDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    zonePCSModificationDate = v5->_zonePCSModificationDate;
    v5->_zonePCSModificationDate = (NSDate *)v24;

  }
  return v5;
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
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  v16.receiver = self;
  v16.super_class = (Class)CKDZonePCSData;
  -[CKDPCSData CKPropertiesDescription](&v16, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  objc_msgSend_shareID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_shareID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR(", shareID=%@"), v13);

  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (NSData)zoneishPCSData
{
  return self->_zoneishPCSData;
}

- (void)setZoneishPCSData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)zoneishPublicKeyID
{
  return self->_zoneishPublicKeyID;
}

- (void)setZoneishPublicKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneishPublicKeyID, a3);
}

- (CKDSharePCSData)sharePCSData
{
  return self->_sharePCSData;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (NSDate)zonePCSModificationDate
{
  return self->_zonePCSModificationDate;
}

- (void)setZonePCSModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_zonePCSModificationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonePCSModificationDate, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_sharePCSData, 0);
  objc_storeStrong((id *)&self->_zoneishPublicKeyID, 0);
  objc_storeStrong((id *)&self->_zoneishPCSData, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
