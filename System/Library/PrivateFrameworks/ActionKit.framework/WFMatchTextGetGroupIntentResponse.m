@implementation WFMatchTextGetGroupIntentResponse

- (WFMatchTextGetGroupIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  WFMatchTextGetGroupIntentResponse *v7;
  WFMatchTextGetGroupIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchTextGetGroupIntentResponse;
  v7 = -[WFMatchTextGetGroupIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[WFMatchTextGetGroupIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
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

+ (id)noMatchIntentResponseWithNoMatchIndex:(id)a3
{
  id v3;
  WFMatchTextGetGroupIntentResponse *v4;

  v3 = a3;
  v4 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
  -[WFMatchTextGetGroupIntentResponse setNoMatchIndex:](v4, "setNoMatchIndex:", v3);

  return v4;
}

+ (id)rangeErrorIntentResponseWithRangeErrorGroupNumber:(id)a3 rangeErrorGroupCount:(id)a4
{
  id v5;
  id v6;
  WFMatchTextGetGroupIntentResponse *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WFMatchTextGetGroupIntentResponse initWithCode:userActivity:]([WFMatchTextGetGroupIntentResponse alloc], "initWithCode:userActivity:", 101, 0);
  -[WFMatchTextGetGroupIntentResponse setRangeErrorGroupNumber:](v7, "setRangeErrorGroupNumber:", v6);

  -[WFMatchTextGetGroupIntentResponse setRangeErrorGroupCount:](v7, "setRangeErrorGroupCount:", v5);
  return v7;
}

@end
