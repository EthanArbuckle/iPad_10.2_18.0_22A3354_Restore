@implementation HDIDSMessageContext

- (HDIDSMessageContext)initWithMessageContext:(id)a3
{
  id v5;
  HDIDSMessageContext *v6;
  HDIDSMessageContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDIDSMessageContext;
  v6 = -[HDIDSMessageContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HDIDSMessageContext *v4;
  IDSMessageContext *context;
  IDSMessageContext *v6;
  char v7;

  v4 = (HDIDSMessageContext *)a3;
  if (v4 == self)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  context = self->_context;
  v6 = v4->_context;
  if (context == v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  v7 = -[IDSMessageContext isEqual:](context, "isEqual:");
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  return -[IDSMessageContext hash](self->_context, "hash");
}

- (NSString)originalGUID
{
  void *v2;
  void *v3;

  -[IDSMessageContext originalGUID](self->_context, "originalGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
