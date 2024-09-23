@implementation CXChannelJoinAction

- (CXChannelJoinAction)initWithChannelUUID:(id)a3 name:(id)a4
{
  id v6;
  CXChannelJoinAction *v7;
  CXChannelUpdate *v8;
  CXChannelUpdate *channelUpdate;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelJoinAction;
  v7 = -[CXChannelAction initWithChannelUUID:](&v11, sel_initWithChannelUUID_, a3);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelJoinAction initWithChannelUUID:name:]", CFSTR("name"));
    v8 = objc_alloc_init(CXChannelUpdate);
    channelUpdate = v7->_channelUpdate;
    v7->_channelUpdate = v8;

    -[CXChannelUpdate setName:](v7->_channelUpdate, "setName:", v6);
  }

  return v7;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;

  -[CXChannelJoinAction channelUpdate](self, "channelUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXChannelJoinAction channelUpdate](self, "channelUpdate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageURL:", v4);

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[CXChannelJoinAction channelUpdate](self, "channelUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelJoinAction;
  v6 = (id *)a3;
  -[CXChannelAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_storeStrong(v6 + 8, self->_channelUpdate);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelJoinAction)initWithCoder:(id)a3
{
  id v4;
  CXChannelJoinAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CXChannelUpdate *channelUpdate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelJoinAction;
  v5 = -[CXChannelAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_channelUpdate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    channelUpdate = v5->_channelUpdate;
    v5->_channelUpdate = (CXChannelUpdate *)v8;

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
  v7.super_class = (Class)CXChannelJoinAction;
  v4 = a3;
  -[CXChannelAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXChannelJoinAction channelUpdate](self, "channelUpdate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_channelUpdate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
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

- (CXChannelUpdate)channelUpdate
{
  return self->_channelUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelUpdate, 0);
}

@end
