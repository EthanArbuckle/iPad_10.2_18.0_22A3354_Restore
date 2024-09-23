@implementation WFMatchTextIntentResponse

- (WFMatchTextIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  WFMatchTextIntentResponse *v7;
  WFMatchTextIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchTextIntentResponse;
  v7 = -[WFMatchTextIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[WFMatchTextIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
  }

  return v8;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

+ (id)invalidRegularExpressionIntentResponseWithErrorDescription:(id)a3
{
  id v3;
  WFMatchTextIntentResponse *v4;

  v3 = a3;
  v4 = -[WFMatchTextIntentResponse initWithCode:userActivity:]([WFMatchTextIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
  -[WFMatchTextIntentResponse setErrorDescription:](v4, "setErrorDescription:", v3);

  return v4;
}

@end
