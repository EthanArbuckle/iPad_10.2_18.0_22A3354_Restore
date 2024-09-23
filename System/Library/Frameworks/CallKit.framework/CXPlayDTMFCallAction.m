@implementation CXPlayDTMFCallAction

- (CXPlayDTMFCallAction)initWithCallUUID:(NSUUID *)callUUID digits:(NSString *)digits type:(CXPlayDTMFCallActionType)type
{
  NSString *v8;
  CXPlayDTMFCallAction *v9;
  uint64_t v10;
  NSString *v11;
  objc_super v13;

  v8 = digits;
  v13.receiver = self;
  v13.super_class = (Class)CXPlayDTMFCallAction;
  v9 = -[CXCallAction initWithCallUUID:](&v13, sel_initWithCallUUID_, callUUID);
  if (v9)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXPlayDTMFCallAction initWithCallUUID:digits:type:]", CFSTR("digits"));
    v10 = -[NSString copy](v8, "copy");
    v11 = v9->_digits;
    v9->_digits = (NSString *)v10;

    v9->_type = type;
  }

  return v9;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXPlayDTMFCallAction;
  -[CXCallAction customDescription](&v6, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXPlayDTMFCallAction digits](self, "digits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" digits=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%ld"), -[CXPlayDTMFCallAction type](self, "type"));
  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXPlayDTMFCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v8, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXPlayDTMFCallAction digits](self, "digits", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDigits:", v7);

  objc_msgSend(v6, "setType:", -[CXPlayDTMFCallAction type](self, "type"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXPlayDTMFCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXPlayDTMFCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *digits;
  void *v10;
  objc_super v12;

  v4 = aDecoder;
  v12.receiver = self;
  v12.super_class = (Class)CXPlayDTMFCallAction;
  v5 = -[CXCallAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_digits);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;

    NSStringFromSelector(sel_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CXPlayDTMFCallActionType v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXPlayDTMFCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CXPlayDTMFCallAction digits](self, "digits", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_digits);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXPlayDTMFCallAction type](self, "type");
  NSStringFromSelector(sel_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(NSString *)digits
{
  objc_setProperty_nonatomic_copy(self, a2, digits, 64);
}

- (CXPlayDTMFCallActionType)type
{
  return self->_type;
}

- (void)setType:(CXPlayDTMFCallActionType)type
{
  self->_type = type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
}

@end
