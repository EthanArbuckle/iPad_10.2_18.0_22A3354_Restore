@implementation GKInvite

- (GKInvite)init
{
  void *v3;
  GKInvite *v4;

  +[GKInternalRepresentation internalRepresentation](GKInviteInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKInvite initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);

  return v4;
}

- (GKInvite)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKInvite *v5;
  void *v6;
  void *v7;
  GKUnknownPlayerInternal *v8;
  GKUnknownPlayerInternal *v9;
  uint64_t v10;
  GKPlayer *sender;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKInvite;
  v5 = -[GKInvite init](&v13, sel_init);
  if (v5)
  {
    if (!v4)
    {
      +[GKInternalRepresentation internalRepresentation](GKInviteInternal, "internalRepresentation");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_internal, v4);
    objc_msgSend(v4, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(GKUnknownPlayerInternal);
    v9 = v8;

    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (GKPlayer *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKInvite inviteID](self, "inviteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKInvite inviteID](self, "inviteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)inviter
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self->_sender, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isHosted
{
  return -[GKInviteInternal matchType](self->_internal, "matchType") == 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKInvite inviteID](self, "inviteID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInvite sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conciseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInvite message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\t inviteID = %@\n\t inviter = %@\n\t message = %@\n\t hosted = %d\n\t playerGroup = %lu\n\t playerAttributes = %08X\n\t cancelled = %d\n}"), v4, v7, v8, -[GKInvite isHosted](self, "isHosted"), -[GKInvite playerGroup](self, "playerGroup"), -[GKInvite playerAttributes](self, "playerAttributes"), self->_cancelled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKInvite;
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
  v10.super_class = (Class)GKInvite;
  -[GKInvite methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKInvite forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKInvite;
  if (-[GKInvite respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKInvite forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKInviteInternal instancesRespondToSelector:](GKInviteInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKInvite internal](self, "internal");
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
  -[GKInvite internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKInviteInternal)internal
{
  return (GKInviteInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (GKPlayer)sender
{
  return self->_sender;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
