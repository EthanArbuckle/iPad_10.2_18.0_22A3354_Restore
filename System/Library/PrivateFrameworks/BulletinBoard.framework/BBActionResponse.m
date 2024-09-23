@implementation BBActionResponse

+ (id)actionResponseForResponse:(id)a3 bulletinRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "actionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionID:", v9);

  objc_msgSend(v7, "actionLaunchURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionLaunchURL:", v10);

  objc_msgSend(v8, "setActionType:", objc_msgSend(v7, "actionType"));
  objc_msgSend(v8, "setActionActivationMode:", objc_msgSend(v7, "actionActivationMode"));
  objc_msgSend(v8, "setActionBehavior:", objc_msgSend(v7, "actionBehavior"));
  objc_msgSend(v8, "setDidOpenApplication:", objc_msgSend(v7, "didOpenApplication"));
  objc_msgSend(v6, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBulletinContext:", v11);

  objc_msgSend(v7, "buttonID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBulletinButtonID:", v12);

  objc_msgSend(v6, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBulletinRecordID:", v13);

  objc_msgSend(v6, "publisherBulletinID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBulletinPublisherID:", v14);
  objc_msgSend(v7, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContext:", v15);

  objc_msgSend(v7, "originID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOriginID:", v16);

  objc_msgSend(v7, "endpoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEndpoint:", v17);
  return v8;
}

- (id)description
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_opt_class();
  v15 = -[BBActionResponse actionType](self, "actionType");
  v14 = -[BBActionResponse actionActivationMode](self, "actionActivationMode");
  v3 = -[BBActionResponse actionBehavior](self, "actionBehavior");
  -[BBActionResponse actionID](self, "actionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBActionResponse actionLaunchURL](self, "actionLaunchURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BBActionResponse didOpenApplication](self, "didOpenApplication");
  -[BBActionResponse bulletinButtonID](self, "bulletinButtonID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBActionResponse originID](self, "originID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBActionResponse endpoint](self, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBActionResponse bulletinRecordID](self, "bulletinRecordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBActionResponse bulletinPublisherID](self, "bulletinPublisherID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p; type = %ld; activationMode = %ld behavior = %ld actionID = %@; actionLaunchURL = %@; activated: %ld buttonID = %@; originID = %@; endpoint = %@; recordID = %@; publisherID = %@>"),
    v16,
    self,
    v15,
    v14,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBActionResponse)initWithCoder:(id)a3
{
  id v4;
  BBActionResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BBActionResponse;
  v5 = -[BBActionResponse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setActionID:](v5, "setActionID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionLaunchURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setActionLaunchURL:](v5, "setActionLaunchURL:", v7);

    -[BBActionResponse setActionType:](v5, "setActionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType")));
    -[BBActionResponse setActionActivationMode:](v5, "setActionActivationMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionActiviationMode")));
    -[BBActionResponse setActionBehavior:](v5, "setActionBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionBehavior")));
    -[BBActionResponse setDidOpenApplication:](v5, "setDidOpenApplication:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didOpenApplication")));
    BBAllowedClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bulletinContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setBulletinContext:](v5, "setBulletinContext:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinButtonID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setBulletinButtonID:](v5, "setBulletinButtonID:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinRecordID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setBulletinRecordID:](v5, "setBulletinRecordID:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinPublisherID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setBulletinPublisherID:](v5, "setBulletinPublisherID:", v12);

    BBAllowedClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setContext:](v5, "setContext:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setOriginID:](v5, "setOriginID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionResponse setEndpoint:](v5, "setEndpoint:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[BBActionResponse actionID](self, "actionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionID"));

  -[BBActionResponse actionLaunchURL](self, "actionLaunchURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionLaunchURL"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionType](self, "actionType"), CFSTR("actionType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionActivationMode](self, "actionActivationMode"), CFSTR("actionActiviationMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionBehavior](self, "actionBehavior"), CFSTR("actionBehavior"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBActionResponse didOpenApplication](self, "didOpenApplication"), CFSTR("didOpenApplication"));
  -[BBActionResponse bulletinContext](self, "bulletinContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bulletinContext"));

  -[BBActionResponse bulletinButtonID](self, "bulletinButtonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bulletinButtonID"));

  -[BBActionResponse bulletinRecordID](self, "bulletinRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("bulletinRecordID"));

  -[BBActionResponse bulletinPublisherID](self, "bulletinPublisherID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("bulletinPublisherID"));

  -[BBActionResponse context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("context"));

  -[BBActionResponse originID](self, "originID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("originID"));

  -[BBActionResponse endpoint](self, "endpoint");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("endpoint"));

}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (unint64_t)actionActivationMode
{
  return self->_actionActivationMode;
}

- (void)setActionActivationMode:(unint64_t)a3
{
  self->_actionActivationMode = a3;
}

- (int64_t)actionBehavior
{
  return self->_actionBehavior;
}

- (void)setActionBehavior:(int64_t)a3
{
  self->_actionBehavior = a3;
}

- (BOOL)didOpenApplication
{
  return self->_didOpenApplication;
}

- (void)setDidOpenApplication:(BOOL)a3
{
  self->_didOpenApplication = a3;
}

- (NSString)actionID
{
  return self->_actionID;
}

- (void)setActionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)actionLaunchURL
{
  return self->_actionLaunchURL;
}

- (void)setActionLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bulletinRecordID
{
  return self->_bulletinRecordID;
}

- (void)setBulletinRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bulletinPublisherID
{
  return self->_bulletinPublisherID;
}

- (void)setBulletinPublisherID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)bulletinContext
{
  return self->_bulletinContext;
}

- (void)setBulletinContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bulletinButtonID
{
  return self->_bulletinButtonID;
}

- (void)setBulletinButtonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)originID
{
  return self->_originID;
}

- (void)setOriginID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_originID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bulletinButtonID, 0);
  objc_storeStrong((id *)&self->_bulletinContext, 0);
  objc_storeStrong((id *)&self->_bulletinPublisherID, 0);
  objc_storeStrong((id *)&self->_bulletinRecordID, 0);
  objc_storeStrong((id *)&self->_actionLaunchURL, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
}

@end
