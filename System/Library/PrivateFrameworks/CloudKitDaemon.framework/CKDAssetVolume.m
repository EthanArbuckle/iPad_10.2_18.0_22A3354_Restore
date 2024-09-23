@implementation CKDAssetVolume

+ (id)CKSQLiteClassName
{
  return CFSTR("CKAssetVolume");
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_volumeIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("volumeIndex=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  objc_msgSend_volumeUUID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_volumeUUID(self, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("volumeUUID=%@"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  }
  objc_msgSend_componentsJoinedByString_(v3, v14, (uint64_t)CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetVolume *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSNumber)volumeIndex
{
  return self->_volumeIndex;
}

- (void)setVolumeIndex:(id)a3
{
  objc_storeStrong((id *)&self->_volumeIndex, a3);
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (void)setVolumeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_volumeUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeIndex, 0);
}

@end
