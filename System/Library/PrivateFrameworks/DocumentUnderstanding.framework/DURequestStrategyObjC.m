@implementation DURequestStrategyObjC

- (DURequestStrategyObjC)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  DURequestStrategyObjC *v11;
  DURequestStrategyObjC *v12;
  _TtC21DocumentUnderstanding17DURequestStrategy *v13;
  void *v14;
  uint64_t v15;
  _TtC21DocumentUnderstanding17DURequestStrategy *underlyingStrategy;
  DURequestStrategyObjC *v17;
  objc_super v19;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DURequestStrategyObjC;
  v11 = -[DURequestStrategyObjC init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objCContentType, a3);
    v13 = [_TtC21DocumentUnderstanding17DURequestStrategy alloc];
    +[DUObjCCompatibilityUtils typeForObjCType:](DUObjCCompatibilityUtils, "typeForObjCType:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DURequestStrategy initWithContentType:preferredModelIdentifier:preprocess:](v13, "initWithContentType:preferredModelIdentifier:preprocess:", v14, v10, v5);
    underlyingStrategy = v12->_underlyingStrategy;
    v12->_underlyingStrategy = (_TtC21DocumentUnderstanding17DURequestStrategy *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)setContentType:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_objCContentType, a3);
  v5 = a3;
  +[DUObjCCompatibilityUtils typeForObjCType:](DUObjCCompatibilityUtils, "typeForObjCType:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DURequestStrategy setContentType:](self->_underlyingStrategy, "setContentType:", v6);

}

- (DURequestContentTypeObjC)contentType
{
  return self->_objCContentType;
}

- (void)setModelIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURequestStrategy setModelIdentifier:](self->_underlyingStrategy, "setModelIdentifier:", v4);

}

- (NSString)modelIdentifier
{
  return -[DURequestStrategy modelIdentifier](self->_underlyingStrategy, "modelIdentifier");
}

- (BOOL)preprocess
{
  return self->_preprocess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objCContentType, 0);
  objc_storeStrong((id *)&self->_underlyingStrategy, 0);
}

@end
