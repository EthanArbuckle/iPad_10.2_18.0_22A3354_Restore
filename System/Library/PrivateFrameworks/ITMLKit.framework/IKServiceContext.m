@implementation IKServiceContext

- (IKServiceContext)initWithContextDictionary:(id)a3 element:(id)a4
{
  id v6;
  id v7;
  IKServiceContext *v8;
  uint64_t v9;
  NSDictionary *contextDictionary;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKServiceContext;
  v8 = -[IKServiceContext init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    contextDictionary = v8->_contextDictionary;
    v8->_contextDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_element, a4);
  }

  return v8;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (IKViewElement)element
{
  return self->_element;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end
