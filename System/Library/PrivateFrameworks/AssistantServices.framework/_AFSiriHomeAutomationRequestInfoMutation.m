@implementation _AFSiriHomeAutomationRequestInfoMutation

- (_AFSiriHomeAutomationRequestInfoMutation)init
{
  return -[_AFSiriHomeAutomationRequestInfoMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_AFSiriHomeAutomationRequestInfoMutation)initWithBaseModel:(id)a3
{
  id v5;
  _AFSiriHomeAutomationRequestInfoMutation *v6;
  _AFSiriHomeAutomationRequestInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriHomeAutomationRequestInfoMutation;
  v6 = -[_AFSiriHomeAutomationRequestInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)generate
{
  AFSiriHomeAutomationRequestInfo *baseModel;
  AFSiriHomeAutomationRequestInfo *v4;
  AFSiriHomeAutomationRequestInfo *v5;
  NSData *v6;
  NSData *v7;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[AFSiriHomeAutomationRequestInfo initWithContext:]([AFSiriHomeAutomationRequestInfo alloc], "initWithContext:", self->_context);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (AFSiriHomeAutomationRequestInfo *)-[AFSiriHomeAutomationRequestInfo copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_context;
  }
  else
  {
    -[AFSiriHomeAutomationRequestInfo context](baseModel, "context");
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v5 = -[AFSiriHomeAutomationRequestInfo initWithContext:]([AFSiriHomeAutomationRequestInfo alloc], "initWithContext:", v6);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
