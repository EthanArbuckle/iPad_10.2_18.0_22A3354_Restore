@implementation LACDTOKVStoreGlobalDefaultsDecorator

- (LACDTOKVStoreGlobalDefaultsDecorator)initWithKVStore:(id)a3
{
  id v5;
  LACDTOKVStoreGlobalDefaultsDecorator *v6;
  LACDTOKVStoreGlobalDefaultsDecorator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOKVStoreGlobalDefaultsDecorator;
  v6 = -[LACDTOKVStoreGlobalDefaultsDecorator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a4))
    -[LACDTOKVStoreGlobalDefaultsDecorator _setStrictModeValue:completion:](self, "_setStrictModeValue:completion:", v9, v8);
  else
    -[LACDTOKVStore setValue:forKey:completion:](self->_store, "setValue:forKey:completion:", v9, a4, v8);

}

- (void)setValue:(id)a3 forKey:(int64_t)a4 connection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a5;
  v10 = a6;
  v11 = a3;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a4))
    -[LACDTOKVStoreGlobalDefaultsDecorator _setStrictModeValue:completion:](self, "_setStrictModeValue:completion:", v11, v10);
  else
    -[LACDTOKVStore setValue:forKey:connection:completion:](self->_store, "setValue:forKey:connection:completion:", v11, a4, v12, v10);

}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a5;
  v10 = a6;
  v11 = a3;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a4))
    -[LACDTOKVStoreGlobalDefaultsDecorator _setStrictModeValue:completion:](self, "_setStrictModeValue:completion:", v11, v10);
  else
    -[LACDTOKVStore setValue:forKey:contextUUID:completion:](self->_store, "setValue:forKey:contextUUID:completion:", v11, a4, v12, v10);

}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a4))
    -[LACDTOKVStoreGlobalDefaultsDecorator _setStrictModeValue:completion:](self, "_setStrictModeValue:completion:", v14, v13);
  else
    -[LACDTOKVStore setValue:forKey:contextUUID:connection:completion:](self->_store, "setValue:forKey:contextUUID:connection:completion:", v14, a4, v15, v12, v13);

}

- (void)valueForKey:(int64_t)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a3))
    -[LACDTOKVStoreGlobalDefaultsDecorator _strictModeValueWithCompletion:](self, "_strictModeValueWithCompletion:", v6);
  else
    -[LACDTOKVStore valueForKey:completion:](self->_store, "valueForKey:completion:", a3, v6);

}

- (void)valueForKey:(int64_t)a3 connection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if (-[LACDTOKVStoreGlobalDefaultsDecorator _isStrictModeKey:](self, "_isStrictModeKey:", a3))
    -[LACDTOKVStoreGlobalDefaultsDecorator _strictModeValueWithCompletion:](self, "_strictModeValueWithCompletion:", v8);
  else
    -[LACDTOKVStore valueForKey:connection:completion:](self->_store, "valueForKey:connection:completion:", a3, v9, v8);

}

- (BOOL)_isStrictModeKey:(int64_t)a3
{
  return a3 == 4;
}

- (void)_setStrictModeValue:(id)a3 completion:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  +[LACGlobalDomain setIsDTOStrictModeEnabled:](LACGlobalDomain, "setIsDTOStrictModeEnabled:", objc_msgSend(v6, "BOOLValue"));
  LODWORD(self) = -[LACDTOKVStoreGlobalDefaultsDecorator _isStricModeEnabled](self, "_isStricModeEnabled");
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((_DWORD)self == v7)
  {
    v9[2](v9, 0);
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Could not store strict-mode value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v9)[2](v9, v8);

  }
}

- (void)_strictModeValueWithCompletion:(id)a3
{
  id v5;
  LACDTOKVStoreValue *v6;

  v5 = a3;
  v6 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", -[LACDTOKVStoreGlobalDefaultsDecorator _isStricModeEnabled](self, "_isStricModeEnabled"));
  (*((void (**)(id, LACDTOKVStoreValue *, _QWORD))a3 + 2))(v5, v6, 0);

}

- (BOOL)_isStricModeEnabled
{
  return +[LACGlobalDomain isDTOStrictModeEnabled](LACGlobalDomain, "isDTOStrictModeEnabled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
