@implementation CKPackageItem

- (CKPackageItem)initWithFileURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKPackageItem *v8;
  uint64_t v9;
  NSURL *fileURL;
  NSString *itemTypeHint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKPackageItem;
  v8 = -[CKPackageItem init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v9;

    v8->_itemID = -1;
    v8->_packageIndex = -1;
    itemTypeHint = v8->_itemTypeHint;
    v8->_itemTypeHint = 0;

  }
  return v8;
}

- (CKPackageItem)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  CKPackageItem *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *deviceID;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSNumber *fileID;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSNumber *generationID;
  NSString *itemTypeHint;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null deviceID"));
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null fileID"));
LABEL_3:
  v14 = objc_msgSend_intValue(v8, v10, v11, v12);
  v18 = objc_msgSend_unsignedLongLongValue(v9, v15, v16, v17);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("/.vol/%u/%llu"), v20, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v22, (uint64_t)v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (CKPackageItem *)objc_msgSend_initWithFileURL_(self, v24, (uint64_t)v23, v25);

  if (v26)
  {
    v30 = objc_msgSend_copy(v8, v27, v28, v29);
    deviceID = v26->_deviceID;
    v26->_deviceID = (NSNumber *)v30;

    v35 = objc_msgSend_copy(v9, v32, v33, v34);
    fileID = v26->_fileID;
    v26->_fileID = (NSNumber *)v35;

    v40 = objc_msgSend_copy(v13, v37, v38, v39);
    generationID = v26->_generationID;
    v26->_generationID = (NSNumber *)v40;

    itemTypeHint = v26->_itemTypeHint;
    v26->_itemTypeHint = 0;

  }
  return v26;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_fileURL(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_itemID(self, v15, v16, v17);
  v22 = objc_msgSend_sectionIndex(self, v19, v20, v21);
  objc_msgSend_generationID(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v27, (uint64_t)CFSTR("fileURL=%@, fileID=%@, deviceID=%@, itemID=%lld, sectionIndex=%d, generationID=%@"), v28, v6, v10, v14, v18, v22, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)description
{
  return (id)((uint64_t (*)(CKPackageItem *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (int64_t)packageIndex
{
  return self->_packageIndex;
}

- (void)setPackageIndex:(int64_t)a3
{
  self->_packageIndex = a3;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)paddedSize
{
  return self->_paddedSize;
}

- (void)setPaddedSize:(int64_t)a3
{
  self->_paddedSize = a3;
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int)a3
{
  self->_sectionIndex = a3;
}

- (NSNumber)deviceID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)fileID
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFileID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSNumber)generationID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setGenerationID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSData)wrappedAssetKey
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWrappedAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)itemTypeHint
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setItemTypeHint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTypeHint, 0);
  objc_storeStrong((id *)&self->_wrappedAssetKey, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
