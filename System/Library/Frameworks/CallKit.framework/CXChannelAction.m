@implementation CXChannelAction

- (CXChannelAction)initWithChannelUUID:(id)a3
{
  id v5;
  CXChannelAction *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXChannelAction;
  v6 = -[CXAction init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelAction initWithChannelUUID:]", CFSTR("channelUUID"));
    objc_storeStrong((id *)&v6->_channelUUID, a3);
  }

  return v6;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelAction;
  -[CXAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_channelUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelAction channelUUID](self, "channelUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithChannelUUID:", self->_channelUUID);
  -[CXChannelAction updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelAction;
  v6 = (id *)a3;
  -[CXAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_storeStrong(v6 + 7, self->_channelUUID);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithChannelUUID:", self->_channelUUID);
  -[CXAction updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelAction)initWithCoder:(id)a3
{
  id v4;
  CXChannelAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *channelUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelAction;
  v5 = -[CXAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_channelUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    channelUUID = v5->_channelUUID;
    v5->_channelUUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelAction;
  v4 = a3;
  -[CXAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXChannelAction channelUUID](self, "channelUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_channelUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSUUID)channelUUID
{
  return self->_channelUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelUUID, 0);
}

+ (NSSet)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

@end
