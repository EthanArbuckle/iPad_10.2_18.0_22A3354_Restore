@implementation WFEvernoteTag

- (WFEvernoteTag)initWithGUID:(id)a3 name:(id)a4 parentGuid:(id)a5 updateSequenceNum:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFEvernoteTag *v14;
  uint64_t v15;
  NSString *guid;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *parentGuid;
  uint64_t v21;
  NSNumber *updateSequenceNum;
  WFEvernoteTag *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFEvernoteTag;
  v14 = -[WFEvernoteTag init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    guid = v14->_guid;
    v14->_guid = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    parentGuid = v14->_parentGuid;
    v14->_parentGuid = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    updateSequenceNum = v14->_updateSequenceNum;
    v14->_updateSequenceNum = (NSNumber *)v21;

    v23 = v14;
  }

  return v14;
}

- (WFEvernoteTag)initWithTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFEvernoteTag *v9;

  v4 = a3;
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentGuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSequenceNum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFEvernoteTag initWithGUID:name:parentGuid:updateSequenceNum:](self, "initWithGUID:name:parentGuid:updateSequenceNum:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFEvernoteTag guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  -[WFEvernoteTag name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[WFEvernoteTag parentGuid](self, "parentGuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parentGuid"));

  -[WFEvernoteTag updateSequenceNum](self, "updateSequenceNum");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("updateSequenceNum"));

}

- (WFEvernoteTag)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFEvernoteTag *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentGuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateSequenceNum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFEvernoteTag initWithGUID:name:parentGuid:updateSequenceNum:](self, "initWithGUID:name:parentGuid:updateSequenceNum:", v5, v6, v7, v8);
  return v9;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)parentGuid
{
  return self->_parentGuid;
}

- (void)setParentGuid:(id)a3
{
  objc_storeStrong((id *)&self->_parentGuid, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_parentGuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

+ (void)initialize
{
  uint64_t v2;
  objc_class *v3;
  void *v4;
  id v5;

  if ((id)objc_opt_class() == a1)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_opt_class();
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClass:forCachedClassName:", v2, v4);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
