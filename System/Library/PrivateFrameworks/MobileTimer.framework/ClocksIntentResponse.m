@implementation ClocksIntentResponse

- (ClocksIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  ClocksIntentResponse *v7;
  ClocksIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ClocksIntentResponse;
  v7 = -[ClocksIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[ClocksIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
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

@end
