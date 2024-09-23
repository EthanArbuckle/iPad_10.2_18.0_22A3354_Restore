@implementation HDIDSMessagePersistentContext

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_messageID, CFSTR("m"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("i"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("q"));
  if (self->_userInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_userInfo || [_userInfo isKindOfClass:[NSDictionary class]]"));

    }
  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_userInfo, CFSTR("u"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_date, CFSTR("d"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_fromRequest, CFSTR("r"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (HDIDSMessagePersistentContext)initWithCoder:(id)a3
{
  id v4;
  HDIDSMessagePersistentContext *v5;
  uint64_t v6;
  NSString *idsIdentifier;
  uint64_t v8;
  NSString *deviceIdentifier;
  id v10;
  uint64_t v11;
  NSDictionary *userInfo;
  uint64_t v13;
  NSDate *date;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDIDSMessagePersistentContext;
  v5 = -[HDIDSMessagePersistentContext init](&v16, sel_init);
  if (v5)
  {
    v5->_messageID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("m"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("q"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    if (_MergedGlobals_224 != -1)
      dispatch_once(&_MergedGlobals_224, &__block_literal_global_212);
    v10 = (id)qword_1ED552528;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("u"));
    v11 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v13 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v5->_fromRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("r"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p id:%hu ids:%@ device:%@ date:%@ fromRequest:%d userInfo:%@>"), objc_opt_class(), self, self->_messageID, self->_idsIdentifier, self->_deviceIdentifier, self->_date, self->_fromRequest, self->_userInfo);
}

@end
