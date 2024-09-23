@implementation CXSetTTYTypeCallAction

- (CXSetTTYTypeCallAction)initWithCallUUID:(id)a3 ttyType:(int64_t)a4
{
  CXSetTTYTypeCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetTTYTypeCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_ttyType = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetTTYTypeCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" ttyType=%ld"), -[CXSetTTYTypeCallAction ttyType](self, "ttyType"));
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
  v7.super_class = (Class)CXSetTTYTypeCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setTtyType:", -[CXSetTTYTypeCallAction ttyType](self, "ttyType", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetTTYTypeCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetTTYTypeCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetTTYTypeCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_ttyType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ttyType = objc_msgSend(v4, "decodeIntegerForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetTTYTypeCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetTTYTypeCallAction ttyType](self, "ttyType", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_ttyType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

@end
