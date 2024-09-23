@implementation SGSelectiveTransformer

- (SGSelectiveTransformer)initWithTransformer:(id)a3 appliedToInputKey:(id)a4
{
  id v6;
  id v7;
  SGSelectiveTransformer *v8;
  SGSelectiveTransformer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SGSelectiveTransformer;
  v8 = -[SGSelectiveTransformer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SGSelectiveTransformer setTransformer:](v8, "setTransformer:", v6);
    -[SGSelectiveTransformer setInputKey:](v9, "setInputKey:", v7);
  }

  return v9;
}

- (id)transform:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[SGSelectiveTransformer inputKey](self, "inputKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSelectiveTransformer inputKey](self, "inputKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSelectiveTransformer.m"), 46, CFSTR("Unexpected input: %@. %@ requires dictionary with inputKey: %@."), v5, v10, v11);

  }
  v12 = (void *)objc_msgSend(v5, "mutableCopy");
  -[SGSelectiveTransformer inputKey](self, "inputKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSelectiveTransformer transformer](self, "transformer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transform:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSelectiveTransformer inputKey](self, "inputKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v17);

  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE79AE0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  v13[0] = CFSTR("TRANSFORMER");
  -[SGSelectiveTransformer transformer](self, "transformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToPlistWithObject:andChunks:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = CFSTR("INPUTKEY");
  v14[0] = v9;
  -[SGSelectiveTransformer inputKey](self, "inputKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SGSelectiveTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SGSelectiveTransformer *v17;

  v8 = (objc_class *)MEMORY[0x24BE79AE0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TRANSFORMER"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "readObjectWithPlist:chunks:context:", v14, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("INPUTKEY"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SGSelectiveTransformer initWithTransformer:appliedToInputKey:](self, "initWithTransformer:appliedToInputKey:", v15, v16);
  return v17;
}

- (BOOL)isEqualToSGSelectiveTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (v6)
  {
    -[SGSelectiveTransformer transformer](self, "transformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[SGSelectiveTransformer transformer](self, "transformer"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "transformer"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[SGSelectiveTransformer inputKey](self, "inputKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputKey");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v11)
      {

        v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        -[SGSelectiveTransformer inputKey](self, "inputKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "inputKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "isEqual:", v14);

      }
      if (v7 == v8)
        goto LABEL_11;
    }
    else
    {
      v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGSelectiveTransformer *v4;
  SGSelectiveTransformer *v5;
  BOOL v6;

  v4 = (SGSelectiveTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSelectiveTransformer isEqualToSGSelectiveTransformer:](self, "isEqualToSGSelectiveTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SGSelectiveTransformer transformer](self, "transformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[SGSelectiveTransformer inputKey](self, "inputKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (PMLTransformerProtocol)transformer
{
  return (PMLTransformerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransformer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)inputKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

+ (id)withTransformer:(id)a3 appliedToInputKey:(id)a4
{
  id v5;
  id v6;
  SGSelectiveTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SGSelectiveTransformer initWithTransformer:appliedToInputKey:]([SGSelectiveTransformer alloc], "initWithTransformer:appliedToInputKey:", v6, v5);

  return v7;
}

@end
