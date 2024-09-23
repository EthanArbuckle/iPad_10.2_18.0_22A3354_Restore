@implementation BLTActionInfo

- (BLTActionInfo)initWithActionType:(int64_t)a3 publisherBulletinID:(id)a4 recordID:(id)a5 sectionID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BLTActionInfo *v16;
  BLTActionInfo *v17;
  uint64_t v18;
  NSString *publisherBulletinID;
  uint64_t v20;
  NSString *recordID;
  uint64_t v22;
  NSString *sectionID;
  objc_super v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)BLTActionInfo;
  v16 = -[BLTActionInfo init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_actionType = a3;
    v18 = objc_msgSend(v12, "copy");
    publisherBulletinID = v17->_publisherBulletinID;
    v17->_publisherBulletinID = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    recordID = v17->_recordID;
    v17->_recordID = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    sectionID = v17->_sectionID;
    v17->_sectionID = (NSString *)v22;

    objc_storeStrong((id *)&v17->_context, a7);
  }

  return v17;
}

- (NSString)description
{
  return (NSString *)-[BLTActionInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BLTActionInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BLTActionInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[BLTActionInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_actionType, CFSTR("actionType"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_publisherBulletinID, CFSTR("publisherBulletinID"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_recordID, CFSTR("recordID"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_sectionID, CFSTR("sectionID"));
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_context, CFSTR("context"));
  return v4;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end
