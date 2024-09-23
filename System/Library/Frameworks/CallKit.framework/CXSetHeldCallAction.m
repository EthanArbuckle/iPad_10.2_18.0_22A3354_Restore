@implementation CXSetHeldCallAction

- (CXSetHeldCallAction)initWithCallUUID:(NSUUID *)callUUID onHold:(BOOL)onHold
{
  CXSetHeldCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetHeldCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, callUUID);
  if (result)
    result->_onHold = onHold;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetHeldCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" isOnHold=%d"), -[CXSetHeldCallAction isOnHold](self, "isOnHold"));
  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetHeldCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setOnHold:", -[CXSetHeldCallAction isOnHold](self, "isOnHold", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetHeldCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXSetHeldCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = aDecoder;
  v8.receiver = self;
  v8.super_class = (Class)CXSetHeldCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isOnHold);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onHold = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v6);

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
  v7.super_class = (Class)CXSetHeldCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetHeldCallAction isOnHold](self, "isOnHold", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isOnHold);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isOnHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)onHold
{
  self->_onHold = onHold;
}

@end
