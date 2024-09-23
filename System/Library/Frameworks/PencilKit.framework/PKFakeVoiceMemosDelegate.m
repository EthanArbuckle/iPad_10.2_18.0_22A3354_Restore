@implementation PKFakeVoiceMemosDelegate

- (PKFakeVoiceMemosDelegate)initWithView:(id)a3
{
  id v5;
  PKFakeVoiceMemosDelegate *v6;
  PKFakeVoiceMemosDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKFakeVoiceMemosDelegate;
  v6 = -[PKFakeVoiceMemosDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)result
{
  double v5;
  double v6;

  v5 = -200.0;
  v6 = -200.0;
  result.right = v6;
  result.left = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
