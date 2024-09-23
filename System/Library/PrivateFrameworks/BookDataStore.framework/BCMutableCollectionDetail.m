@implementation BCMutableCollectionDetail

- (BCMutableCollectionDetail)initWithCollectionID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5A43C();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableCollectionDetail;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableCollectionDetail *)*((_QWORD *)v9 + 10);
    *((_QWORD *)v9 + 10) = v10;
LABEL_7:

  }
  return (BCMutableCollectionDetail *)v9;
}

- (BCMutableCollectionDetail)initWithCloudData:(id)a3
{
  void *v3;
  id v5;
  BCMutableCollectionDetail *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *collectionID;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSString *collectionDescription;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v59;

  v5 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BCMutableCollectionDetail;
  v6 = -[BCMutableCloudData initWithCloudData:](&v59, sel_initWithCloudData_, v5);
  if (v6)
  {
    BUProtocolCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v7)
    {
      objc_msgSend_collectionID(v7, v8, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_copy(v13, v14, v15, v16, v17);
      collectionID = v6->_collectionID;
      v6->_collectionID = (NSString *)v18;

      objc_msgSend_name(v12, v20, v21, v22, v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend_name(v12, v24, v25, v26, v27);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (__CFString *)objc_msgSend_copy(v3, v29, v30, v31, v32);
      }
      else
      {
        v33 = &stru_24F091B90;
      }
      objc_storeStrong((id *)&v6->_name, v33);
      if (v28)
      {

      }
      objc_msgSend_collectionDescription(v12, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_copy(v39, v40, v41, v42, v43);
      collectionDescription = v6->_collectionDescription;
      v6->_collectionDescription = (NSString *)v44;

      v6->_hidden = objc_msgSend_hidden(v12, v46, v47, v48, v49);
      v6->_sortOrder = objc_msgSend_sortOrder(v12, v50, v51, v52, v53);
      v6->_sortMode = objc_msgSend_sortMode(v12, v54, v55, v56, v57);
    }
    else
    {
      BDSCloudKitLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_227E5A468();

      v6 = 0;
    }

  }
  return v6;
}

- (BCMutableCollectionDetail)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableCollectionDetail *v8;
  uint64_t v9;
  NSString *collectionID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *name;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *collectionDescription;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_227E5A494();
    v8 = 0;
    goto LABEL_7;
  }
  v45.receiver = self;
  v45.super_class = (Class)BCMutableCollectionDetail;
  v8 = -[BCMutableCloudData initWithRecord:](&v45, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    collectionID = v8->_collectionID;
    v8->_collectionID = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("name"), v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v14;

    objc_msgSend_objectForKey_(v4, v16, (uint64_t)CFSTR("collectionDescription"), v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    collectionDescription = v8->_collectionDescription;
    v8->_collectionDescription = (NSString *)v19;

    objc_msgSend_objectForKey_(v4, v21, (uint64_t)CFSTR("hidden"), v22, v23);
    self = (BCMutableCollectionDetail *)objc_claimAutoreleasedReturnValue();
    v8->_hidden = objc_msgSend_BOOLValue(self, v24, v25, v26, v27);
    objc_msgSend_objectForKey_(v4, v28, (uint64_t)CFSTR("sortOrder"), v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v8->_sortOrder = objc_msgSend_intValue(v31, v32, v33, v34, v35);
    objc_msgSend_objectForKey_(v4, v36, (uint64_t)CFSTR("sortMode"), v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sortMode = objc_msgSend_intValue(v39, v40, v41, v42, v43);

LABEL_7:
  }

  return v8;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_collectionID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionDescription(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hidden(self, v18, v19, v20, v21))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  v27 = objc_msgSend_sortOrder(self, v22, v23, v24, v25);
  v32 = objc_msgSend_sortMode(self, v28, v29, v30, v31);
  objc_msgSend_stringWithFormat_(v6, v33, (uint64_t)CFSTR("collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode:%d"), v34, v35, v7, v12, v17, v26, v27, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v36;
}

- (id)recordType
{
  return CFSTR("collectionDetail");
}

- (id)zoneName
{
  return CFSTR("CollectionZone");
}

- (id)configuredRecordFromAttributes
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)BCMutableCollectionDetail;
  -[BCMutableCloudData configuredRecordFromAttributes](&v64, sel_configuredRecordFromAttributes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_name(self, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v9, (uint64_t)v8, (uint64_t)CFSTR("name"), v10);

    objc_msgSend_collectionDescription(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v16, (uint64_t)v15, (uint64_t)CFSTR("collectionDescription"), v17);

    v18 = (void *)MEMORY[0x24BDD16E0];
    v23 = objc_msgSend_hidden(self, v19, v20, v21, v22);
    objc_msgSend_numberWithBool_(v18, v24, v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v28, (uint64_t)v27, (uint64_t)CFSTR("hidden"), v29);

    v30 = (void *)MEMORY[0x24BDD16E0];
    v35 = objc_msgSend_sortOrder(self, v31, v32, v33, v34);
    objc_msgSend_numberWithInt_(v30, v36, v35, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v40, (uint64_t)v39, (uint64_t)CFSTR("sortOrder"), v41);

    v42 = (void *)MEMORY[0x24BDD16E0];
    v47 = objc_msgSend_sortMode(self, v43, v44, v45, v46);
    objc_msgSend_numberWithInt_(v42, v48, v47, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v52, (uint64_t)v51, (uint64_t)CFSTR("sortMode"), v53);
LABEL_6:

    return v7;
  }
  objc_msgSend_privacyDelegate(self, v3, v4, v5, v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_establishedSalt(v54, v55, v56, v57, v58);

  if (v59)
  {
    BDSCloudKitLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_227E5A4C0(self, (const char *)v51, v60, v61, v62);
    goto LABEL_6;
  }
  return v7;
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
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)BCMutableCollectionDetail;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v40, sel_encodeWithCoder_, v4);
  objc_msgSend_name(self, v5, v6, v7, v8, v40.receiver, v40.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("name"), v11);

  objc_msgSend_collectionDescription(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("collectionDescription"), v18);

  v23 = objc_msgSend_hidden(self, v19, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v4, v24, v23, (uint64_t)CFSTR("hidden"), v25);
  v30 = objc_msgSend_sortOrder(self, v26, v27, v28, v29);
  objc_msgSend_encodeInt_forKey_(v4, v31, v30, (uint64_t)CFSTR("sortOrder"), v32);
  v37 = objc_msgSend_sortMode(self, v33, v34, v35, v36);
  objc_msgSend_encodeInt_forKey_(v4, v38, v37, (uint64_t)CFSTR("sortMode"), v39);

}

- (BCMutableCollectionDetail)initWithCoder:(id)a3
{
  id v4;
  BCMutableCollectionDetail *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCMutableCollectionDetail *v10;
  uint64_t v11;
  NSString *collectionID;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *collectionDescription;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BCMutableCollectionDetail;
  v5 = -[BCMutableCloudData initWithCoder:](&v33, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    collectionID = v10->_collectionID;
    v10->_collectionID = (NSString *)v11;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("name"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("collectionDescription"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    collectionDescription = v10->_collectionDescription;
    v10->_collectionDescription = (NSString *)v21;

    v10->_hidden = objc_msgSend_decodeBoolForKey_(v4, v23, (uint64_t)CFSTR("hidden"), v24, v25);
    v10->_sortOrder = objc_msgSend_decodeIntForKey_(v4, v26, (uint64_t)CFSTR("sortOrder"), v27, v28);
    v10->_sortMode = objc_msgSend_decodeIntForKey_(v4, v29, (uint64_t)CFSTR("sortMode"), v30, v31);
  }

  return v10;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (int)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(int)a3
{
  self->_sortMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end
