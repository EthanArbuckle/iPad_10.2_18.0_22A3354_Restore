@implementation CXCallAction

- (CXCallAction)initWithCallUUID:(NSUUID *)callUUID
{
  NSUUID *v5;
  CXCallAction *v6;
  objc_super v8;

  v5 = callUUID;
  v8.receiver = self;
  v8.super_class = (Class)CXCallAction;
  v6 = -[CXAction init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXCallAction initWithCallUUID:]", CFSTR("callUUID"));
    objc_storeStrong((id *)&v6->_callUUID, callUUID);
  }

  return v6;
}

- (CXCallAction)init
{

  return 0;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXCallAction;
  -[CXAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallAction callUUID](self, "callUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callUUID=%@"), v5);

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXCallAction;
  v6 = a3;
  -[CXAction updateSanitizedCopy:withZone:](&v8, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXCallAction callUUID](self, "callUUID", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallUUID:", v7);

}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXCallAction callUUID](self, "callUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCallUUID:", v6);

  -[CXCallAction updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v7, a3);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXCallAction callUUID](self, "callUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCallUUID:", v6);

  -[CXAction updateCopy:withZone:](self, "updateCopy:withZone:", v7, a3);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *callUUID;
  objc_super v11;

  v4 = aDecoder;
  v11.receiver = self;
  v11.super_class = (Class)CXCallAction;
  v5 = -[CXAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_callUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v8;

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
  v7.super_class = (Class)CXCallAction;
  v4 = a3;
  -[CXAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXCallAction callUUID](self, "callUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUID, 0);
}

@end
