@implementation WFCoercion

- (WFCoercion)initWithType:(id)a3 handler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFCoercion *v11;
  WFCoercion *v12;
  WFCoercion *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercion.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercion.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoercion;
  v11 = -[WFCoercion init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    objc_storeStrong((id *)&v12->_handler, a4);
    v13 = v12;
  }

  return v12;
}

- (BOOL)canProduceType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFCoercion type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToType:", v4);

  return v6;
}

- (BOOL)canProduceType:(id)a3 withConcurrencyMode:(int64_t)a4
{
  void *v6;
  BOOL v7;

  if (!-[WFCoercion canProduceType:](self, "canProduceType:", a3))
    return 0;
  -[WFCoercion handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "concurrencyMode") == a4;

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoercion type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFType)type
{
  return self->_type;
}

- (WFCoercionHandler)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)coercionToType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:handler:", v7, v6);

  return v8;
}

+ (id)coercionToClass:(Class)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithType:handler:", v8, v6);

  return v9;
}

@end
