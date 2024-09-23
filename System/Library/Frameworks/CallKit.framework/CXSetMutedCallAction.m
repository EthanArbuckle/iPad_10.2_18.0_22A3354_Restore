@implementation CXSetMutedCallAction

- (CXSetMutedCallAction)initWithCallUUID:(NSUUID *)callUUID muted:(BOOL)muted
{
  return -[CXSetMutedCallAction initWithCallUUID:muted:bottomUpMute:](self, "initWithCallUUID:muted:bottomUpMute:", callUUID, muted, 0);
}

- (CXSetMutedCallAction)initWithCallUUID:(id)a3 muted:(BOOL)a4 bottomUpMute:(BOOL)a5
{
  CXSetMutedCallAction *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXSetMutedCallAction;
  result = -[CXCallAction initWithCallUUID:](&v8, sel_initWithCallUUID_, a3);
  if (result)
  {
    result->_muted = a4;
    result->_bottomUpMute = a5;
  }
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetMutedCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" muted=%d"), -[CXSetMutedCallAction isMuted](self, "isMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" bottomUp=%d"), -[CXSetMutedCallAction isBottomUpMute](self, "isBottomUpMute"));
  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetMutedCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setMuted:", -[CXSetMutedCallAction isMuted](self, "isMuted", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetMutedCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXSetMutedCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = aDecoder;
  v8.receiver = self;
  v8.super_class = (Class)CXSetMutedCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isMuted);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_muted = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v6);

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
  v7.super_class = (Class)CXSetMutedCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetMutedCallAction isMuted](self, "isMuted", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isMuted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)muted
{
  self->_muted = muted;
}

- (BOOL)isBottomUpMute
{
  return self->_bottomUpMute;
}

- (void)setBottomUpMute:(BOOL)a3
{
  self->_bottomUpMute = a3;
}

@end
