@implementation SGModelFeatures

- (SGModelFeatures)initWithSource:(id)a3 vector:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SGModelFeatures *v11;
  SGModelFeatures *v12;
  void *v14;
  void *v15;
  objc_super v16;

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
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModelFeatures.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModelFeatures.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vector"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGModelFeatures;
  v11 = -[SGModelFeatures init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_source, a3);
    objc_storeStrong((id *)&v12->_vector, a4);
  }

  return v12;
}

- (id)vector
{
  return self->_vector;
}

- (id)source
{
  return self->_source;
}

- (id)sessionDescriptor
{
  return -[SGModelSource sessionDescriptor](self->_source, "sessionDescriptor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
