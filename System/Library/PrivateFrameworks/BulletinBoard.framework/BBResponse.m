@implementation BBResponse

- (void)send
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  if (!self->_sent)
  {
    -[BBResponse sendBlock](self, "sendBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      ((void (**)(_QWORD, BBResponse *))v3)[2](v3, self);
      v3 = (void (**)(_QWORD, _QWORD))v4;
      self->_sent = 1;
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBResponse)initWithCoder:(id)a3
{
  id v4;
  BBResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BBResponse;
  v5 = -[BBResponse init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setBulletinID:](v5, "setBulletinID:", v6);

    -[BBResponse setActionActivationMode:](v5, "setActionActivationMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionActivationMode")));
    -[BBResponse setActionBehavior:](v5, "setActionBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionBehavior")));
    -[BBResponse setActionType:](v5, "setActionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replyText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setReplyText:](v5, "setReplyText:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setButtonID:](v5, "setButtonID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setActionID:](v5, "setActionID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionLaunchURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setActionLaunchURL:](v5, "setActionLaunchURL:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setOriginID:](v5, "setOriginID:", v11);

    BBAllowedClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setContext:](v5, "setContext:", v13);

    -[BBResponse setActivated:](v5, "setActivated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activated")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBResponse setEndpoint:](v5, "setEndpoint:", v14);

    -[BBResponse setDidOpenApplication:](v5, "setDidOpenApplication:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didOpenApplication")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[BBResponse bulletinID](self, "bulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("bulletinID"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionActivationMode](self, "actionActivationMode"), CFSTR("actionActivationMode"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionBehavior](self, "actionBehavior"), CFSTR("actionBehavior"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionType](self, "actionType"), CFSTR("actionType"));
  -[BBResponse replyText](self, "replyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("replyText"));

  -[BBResponse buttonID](self, "buttonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("buttonID"));

  -[BBResponse actionID](self, "actionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("actionID"));

  -[BBResponse actionLaunchURL](self, "actionLaunchURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("actionLaunchURL"));

  -[BBResponse originID](self, "originID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("originID"));

  -[BBResponse context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("context"));

  objc_msgSend(v12, "encodeBool:forKey:", -[BBResponse activated](self, "activated"), CFSTR("activated"));
  -[BBResponse endpoint](self, "endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("endpoint"));

  objc_msgSend(v12, "encodeBool:forKey:", -[BBResponse didOpenApplication](self, "didOpenApplication"), CFSTR("didOpenApplication"));
}

- (NSArray)lifeAssertions
{
  return self->_lifeAssertions;
}

- (void)setLifeAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void)setSendBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)replyText
{
  return self->_replyText;
}

- (void)setReplyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)buttonID
{
  return self->_buttonID;
}

- (void)setButtonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)actionID
{
  return self->_actionID;
}

- (void)setActionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)actionLaunchURL
{
  return self->_actionLaunchURL;
}

- (void)setActionLaunchURL:(id)a3
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

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
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

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)didOpenApplication
{
  return self->_didOpenApplication;
}

- (void)setDidOpenApplication:(BOOL)a3
{
  self->_didOpenApplication = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_originID, 0);
  objc_storeStrong((id *)&self->_actionLaunchURL, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
  objc_storeStrong((id *)&self->_buttonID, 0);
  objc_storeStrong((id *)&self->_lifeAssertions, 0);
  objc_storeStrong((id *)&self->_replyText, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong(&self->_sendBlock, 0);
  objc_storeStrong((id *)&self->_lifeAssertion, 0);
}

@end
