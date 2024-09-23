@implementation PHAmbientButtonPart

- (PHAmbientButtonPart)initWithView:(id)a3 type:(int64_t)a4
{
  objc_storeStrong((id *)&self->_view, a3);
  self->_type = a4;
  return self;
}

+ (id)partWithView:(id)a3 type:(int64_t)a4
{
  id v5;
  PHAmbientButtonPart *v6;

  v5 = a3;
  v6 = -[PHAmbientButtonPart initWithView:type:]([PHAmbientButtonPart alloc], "initWithView:type:", v5, a4);

  return v6;
}

- (UIView)view
{
  return self->_view;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
