@implementation CXSetScreeningCallAction

- (CXSetScreeningCallAction)initWithCallUUID:(id)a3 screening:(BOOL)a4
{
  CXSetScreeningCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetScreeningCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_screening = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetScreeningCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" screening=%d"), -[CXSetScreeningCallAction isScreening](self, "isScreening"));
  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetScreeningCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setScreening:", -[CXSetScreeningCallAction isScreening](self, "isScreening", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetScreeningCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetScreeningCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetScreeningCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isScreening);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screening = objc_msgSend(v4, "decodeBoolForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetScreeningCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetScreeningCallAction isScreening](self, "isScreening", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isScreening);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

@end
