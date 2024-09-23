@implementation WFCoercionContext

- (WFCoercionContext)initWithRequestedType:(id)a3 options:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFCoercionContext *v11;
  WFCoercionContext *v12;
  WFCoercionContext *v13;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercionContext.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestedType"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercionContext.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoercionContext;
  v11 = -[WFCoercionContext init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestedType, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v13 = v12;
  }

  return v12;
}

- (WFType)requestedType
{
  return self->_requestedType;
}

- (WFCoercionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_requestedType, 0);
}

@end
