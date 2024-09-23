@implementation PHASEMetaParameter

- (PHASEMetaParameter)init
{
  -[PHASEMetaParameter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMetaParameter)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PHASEMetaParameter *v9;
  PHASEMetaParameter *v10;
  PHASEMetaParameter *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHASEMetaParameter;
  v9 = -[PHASEMetaParameter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_registeredGlobally = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (void)setValue:(id)value
{
  PHASEMetaParameter *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = value;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v11 = v10;
    -[PHASEMetaParameter minimum](v6, "minimum");
    v13 = v12;
    -[PHASEMetaParameter maximum](v6, "maximum");
    v15 = PHASEGetPropertyBounded<double>(v8, v9, v11, v13, v14);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v6->_value;
    v6->_value = (id)v16;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    objc_msgSend(WeakRetained, "setMetaParameter:value:withTimeInterval:", v6->_identifier, v15, 0.0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v19 = (void *)MEMORY[0x24BDBCE88];
      v20 = objc_opt_class();
      objc_msgSend(v19, "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot set on object of type %@ to metaparameter of type %@"), v20, objc_opt_class());
      goto LABEL_9;
    }
    objc_storeStrong(&self->_value, value);
    v6 = (PHASEMetaParameter *)objc_loadWeakRetained((id *)&self->_delegate);
    -[PHASEMetaParameter setMetaParameter:value:](v6, "setMetaParameter:value:", self->_identifier, self->_value);
  }

LABEL_9:
}

- (void)setLocalValueOnly:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)value
{
  return self->_value;
}

- (BOOL)registeredGlobally
{
  return self->_registeredGlobally;
}

- (void)setRegisteredGlobally:(BOOL)a3
{
  self->_registeredGlobally = a3;
}

- (MetaParameterValueProtocol)delegate
{
  return (MetaParameterValueProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
