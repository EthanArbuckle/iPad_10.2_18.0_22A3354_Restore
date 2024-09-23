@implementation WFContentPredicate

+ (id)truePredicate
{
  return (id)objc_opt_new();
}

+ (id)falsePredicate
{
  return (id)objc_opt_new();
}

+ (id)predicateWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

- (WFContentPredicate)initWithBlock:(id)a3
{
  id v4;
  WFContentPredicate *v5;
  void *v6;
  id block;
  WFContentPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPredicate;
  v5 = -[WFContentPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    block = v5->_block;
    v5->_block = v6;

    v8 = v5;
  }

  return v5;
}

- (void)evaluateWithObject:(id)a3 completionHandler:(id)a4
{
  -[WFContentPredicate evaluateWithObject:propertySubstitutor:completionHandler:](self, "evaluateWithObject:propertySubstitutor:completionHandler:", a3, 0, a4);
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t (**block)(id, id);
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (v9)
  {
    block = (uint64_t (**)(id, id))self->_block;
    if (block)
      v11 = block[2](block, v12);
    else
      v11 = 0;
    v9[2](v9, v11);
  }

}

- (NSSet)containedProperties
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
