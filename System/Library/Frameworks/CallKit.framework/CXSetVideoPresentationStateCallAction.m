@implementation CXSetVideoPresentationStateCallAction

- (CXSetVideoPresentationStateCallAction)initWithCallUUID:(id)a3 videoPresentationState:(int64_t)a4
{
  CXSetVideoPresentationStateCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetVideoPresentationStateCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_videoPresentationState = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetVideoPresentationStateCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" videoPresentationState=%ld"), -[CXSetVideoPresentationStateCallAction videoPresentationState](self, "videoPresentationState"));
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
  v7.super_class = (Class)CXSetVideoPresentationStateCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setVideoPresentationState:", -[CXSetVideoPresentationStateCallAction videoPresentationState](self, "videoPresentationState", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetVideoPresentationStateCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetVideoPresentationStateCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetVideoPresentationStateCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_videoPresentationState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_videoPresentationState = objc_msgSend(v4, "decodeIntegerForKey:", v6);

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
  v7.super_class = (Class)CXSetVideoPresentationStateCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetVideoPresentationStateCallAction videoPresentationState](self, "videoPresentationState", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_videoPresentationState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

}

- (int64_t)videoPresentationState
{
  return self->_videoPresentationState;
}

- (void)setVideoPresentationState:(int64_t)a3
{
  self->_videoPresentationState = a3;
}

@end
