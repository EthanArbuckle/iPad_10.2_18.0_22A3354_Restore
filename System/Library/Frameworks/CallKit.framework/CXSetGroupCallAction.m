@implementation CXSetGroupCallAction

- (CXSetGroupCallAction)initWithCallUUID:(NSUUID *)callUUID callUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith
{
  NSUUID *v7;
  CXSetGroupCallAction *v8;
  CXSetGroupCallAction *v9;
  objc_super v11;

  v7 = callUUIDToGroupWith;
  v11.receiver = self;
  v11.super_class = (Class)CXSetGroupCallAction;
  v8 = -[CXCallAction initWithCallUUID:](&v11, sel_initWithCallUUID_, callUUID);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_callUUIDToGroupWith, callUUIDToGroupWith);

  return v9;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetGroupCallAction;
  -[CXCallAction customDescription](&v6, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSetGroupCallAction callUUIDToGroupWith](self, "callUUIDToGroupWith");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callUUIDToGroupWith=%@"), v4);

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXSetGroupCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v8, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXSetGroupCallAction callUUIDToGroupWith](self, "callUUIDToGroupWith", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallUUIDToGroupWith:", v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetGroupCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXSetGroupCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *callUUIDToGroupWith;
  objc_super v11;

  v4 = aDecoder;
  v11.receiver = self;
  v11.super_class = (Class)CXSetGroupCallAction;
  v5 = -[CXCallAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_callUUIDToGroupWith);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    callUUIDToGroupWith = v5->_callUUIDToGroupWith;
    v5->_callUUIDToGroupWith = (NSUUID *)v8;

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
  v7.super_class = (Class)CXSetGroupCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXSetGroupCallAction callUUIDToGroupWith](self, "callUUIDToGroupWith", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callUUIDToGroupWith);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSUUID)callUUIDToGroupWith
{
  return self->_callUUIDToGroupWith;
}

- (void)setCallUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith
{
  objc_setProperty_nonatomic_copy(self, a2, callUUIDToGroupWith, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUIDToGroupWith, 0);
}

@end
