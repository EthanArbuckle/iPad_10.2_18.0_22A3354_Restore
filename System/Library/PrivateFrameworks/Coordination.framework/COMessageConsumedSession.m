@implementation COMessageConsumedSession

- (COMessageConsumedSession)initWithMember:(id)a3 consumer:(id)a4
{
  id v6;
  COMessageConsumedSession *v7;
  COMessageConsumedSession *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)COMessageConsumedSession;
  v7 = -[COMessageSession initWithMember:](&v10, sel_initWithMember_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_consumer, v6);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageConsumedSession consumer](self, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageSession member](self, "member");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, consumer = %@>, member = %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMessageConsumedSession;
  return -[COMessageSession hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COMessageConsumedSession;
  return -[COMessageSession isEqual:](&v4, sel_isEqual_, a3);
}

- (COMessageSessionConsumer)consumer
{
  return (COMessageSessionConsumer *)objc_loadWeakRetained((id *)&self->_consumer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consumer);
}

@end
