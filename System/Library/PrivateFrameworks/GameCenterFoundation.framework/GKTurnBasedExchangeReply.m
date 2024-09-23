@implementation GKTurnBasedExchangeReply

- (GKTurnBasedExchangeReply)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4
{
  id v6;
  id v7;
  GKTurnBasedExchangeReply *v8;
  GKTurnBasedExchangeReply *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[GKInternalRepresentation internalRepresentation](GKTurnBasedExchangeReplyInternal, "internalRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTurnBasedExchangeReply;
  v8 = -[GKTurnBasedExchangeReply init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_daemonProxy, a4);
  }

  return v9;
}

- (GKTurnBasedExchangeReply)initWithDaemonProxy:(id)a3
{
  return -[GKTurnBasedExchangeReply initWithInternalRepresentation:daemonProxy:](self, "initWithInternalRepresentation:daemonProxy:", 0, a3);
}

- (NSString)message
{
  GKDaemonProxy *daemonProxy;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  daemonProxy = self->_daemonProxy;
  -[GKTurnBasedExchangeReplyInternal localizableMessage](self->_internal, "localizableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchangeReply match](self, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy localizedMessageFromDictionary:forBundleID:](daemonProxy, "localizedMessageFromDictionary:forBundleID:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKTurnBasedExchangeReply internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKTurnBasedExchangeReply internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchangeReply recipient](self, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[GKTurnBasedExchangeReply recipient](self, "recipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GKTurnBasedExchangeReply message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchangeReply data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p - recipient:%@ message:%@ data.length:%ld>"), v5, self, v9, v10, objc_msgSend(v11, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  return v12;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedExchangeReply;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedExchangeReply;
  -[GKTurnBasedExchangeReply methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKTurnBasedExchangeReply forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedExchangeReply;
  if (-[GKTurnBasedExchangeReply respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKTurnBasedExchangeReply forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  int v4;

  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v4 = GKApplicationLinkedOnOrAfter();
      if (v4)
        LOBYTE(v4) = +[GKTurnBasedExchangeReplyInternal instancesRespondToSelector:](GKTurnBasedExchangeReplyInternal, "instancesRespondToSelector:", a3);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKTurnBasedExchangeReply internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKTurnBasedExchangeReply internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKTurnBasedParticipant)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (GKTurnBasedExchangeReplyInternal)internal
{
  return (GKTurnBasedExchangeReplyInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end
