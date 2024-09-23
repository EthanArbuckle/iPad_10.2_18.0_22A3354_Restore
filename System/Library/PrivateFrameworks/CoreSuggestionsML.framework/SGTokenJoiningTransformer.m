@implementation SGTokenJoiningTransformer

- (SGTokenJoiningTransformer)initWithSeparator:(id)a3
{
  id v5;
  SGTokenJoiningTransformer *v6;
  SGTokenJoiningTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGTokenJoiningTransformer;
  v6 = -[SGTokenJoiningTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_separator, a3);

  return v7;
}

- (id)transform:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;

  v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTokenJoiningTransformer.m"), 40, CFSTR("Unexpected input: %@. %@ requires an NSArray."), v5, v10);

  }
  objc_msgSend(v5, "_pas_componentsJoinedByString:", self->_separator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)toPlistWithChunks:(id)a3
{
  NSString *separator;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  separator = self->_separator;
  v5 = CFSTR("SEPARATOR");
  v6[0] = separator;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SGTokenJoiningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  void *v6;
  SGTokenJoiningTransformer *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SEPARATOR"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGTokenJoiningTransformer initWithSeparator:](self, "initWithSeparator:", v6);

  return v7;
}

- (BOOL)isEqualToSGTokenJoiningTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[SGTokenJoiningTransformer separator](self, "separator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "separator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[SGTokenJoiningTransformer separator](self, "separator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "separator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGTokenJoiningTransformer *v4;
  SGTokenJoiningTransformer *v5;
  BOOL v6;

  v4 = (SGTokenJoiningTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGTokenJoiningTransformer isEqualToSGTokenJoiningTransformer:](self, "isEqualToSGTokenJoiningTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_separator, "hash");
}

- (NSString)separator
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
}

+ (id)withSeparator:(id)a3
{
  id v3;
  SGTokenJoiningTransformer *v4;

  v3 = a3;
  v4 = -[SGTokenJoiningTransformer initWithSeparator:]([SGTokenJoiningTransformer alloc], "initWithSeparator:", v3);

  return v4;
}

@end
