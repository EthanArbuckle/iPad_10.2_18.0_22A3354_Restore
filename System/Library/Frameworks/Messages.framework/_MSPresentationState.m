@implementation _MSPresentationState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isRunningInCameraContext
{
  if (isRunningInCameraContext_onceToken != -1)
    dispatch_once(&isRunningInCameraContext_onceToken, &__block_literal_global_1);
  return isRunningInCameraContext_isRunningInCameraContext;
}

- (_MSPresentationState)init
{
  _MSPresentationState *v2;
  _MSPresentationState *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MSPresentationState;
  v2 = -[_MSPresentationState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_presentationStyle = 0;
    if (objc_msgSend((id)objc_opt_class(), "isRunningInCameraContext"))
    {
      v4 = 1;
    }
    else
    {
      if (!IMIsRunningIniMessageAppsViewService())
      {
        v3->_presentationContext = 0;
        return v3;
      }
      v4 = 2;
    }
    v3->_presentationContext = v4;
  }
  return v3;
}

- (_MSPresentationState)initWithCoder:(id)a3
{
  id v4;
  _MSPresentationState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MSPresentationState;
  v5 = -[_MSPresentationState init](&v7, sel_init);
  if (v5)
  {
    v5->_presentationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationStyle"));
    v5->_presentationContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pContext"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t presentationStyle;
  id v5;

  presentationStyle = self->_presentationStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", presentationStyle, CFSTR("presentationStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presentationContext, CFSTR("pContext"));

}

- (BOOL)isEqual:(id)a3
{
  _MSPresentationState *v4;
  _MSPresentationState *v5;
  unint64_t presentationStyle;
  unint64_t presentationContext;
  BOOL v8;
  objc_super v10;

  v4 = (_MSPresentationState *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_MSPresentationState;
    if (-[_MSPresentationState isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      presentationStyle = self->_presentationStyle;
      if (presentationStyle == -[_MSPresentationState presentationStyle](v5, "presentationStyle"))
      {
        presentationContext = self->_presentationContext;
        v8 = presentationContext == -[_MSPresentationState presentationContext](v5, "presentationContext");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_presentationContext + self->_presentationStyle;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (unint64_t)presentationContext
{
  return self->_presentationContext;
}

@end
