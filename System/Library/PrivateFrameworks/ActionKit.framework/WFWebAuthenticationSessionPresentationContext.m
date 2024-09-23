@implementation WFWebAuthenticationSessionPresentationContext

- (WFWebAuthenticationSessionPresentationContext)initWithPresentationAnchor:(id)a3
{
  id v5;
  WFWebAuthenticationSessionPresentationContext *v6;
  WFWebAuthenticationSessionPresentationContext *v7;
  WFWebAuthenticationSessionPresentationContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWebAuthenticationSessionPresentationContext;
  v6 = -[WFWebAuthenticationSessionPresentationContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationAnchor, a3);
    v8 = v7;
  }

  return v7;
}

- (UIWindow)presentationAnchor
{
  return self->_presentationAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAnchor, 0);
}

@end
