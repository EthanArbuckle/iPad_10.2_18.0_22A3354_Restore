@implementation ATXExecutableReferencePair

- (ATXExecutableReferencePair)initWithReference:(id)a3 executable:(id)a4
{
  id v7;
  id v8;
  ATXExecutableReferencePair *v9;
  ATXExecutableReferencePair *v10;
  ATXExecutableReferencePair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXExecutableReferencePair;
  v9 = -[ATXExecutableReferencePair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reference, a3);
    objc_storeStrong((id *)&v10->_executable, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXExecutableReferencePair executable](self, "executable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXExecutableReferencePair *v4;
  ATXExecutableReferencePair *v5;
  ATXExecutableIdentifier *executable;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  ATXExecutableIdentifier *v9;
  BOOL v10;
  char v11;
  ATXExecutableReference *v12;
  ATXExecutableReference *v13;

  v4 = (ATXExecutableReferencePair *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      executable = self->_executable;
      v7 = v5->_executable;
      if (executable == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = executable;
        v10 = -[ATXExecutableIdentifier isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_reference;
      v13 = v12;
      if (v12 == v5->_reference)
        v11 = 1;
      else
        v11 = -[ATXExecutableReference isEqual:](v12, "isEqual:");

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (ATXExecutableReference)reference
{
  return self->_reference;
}

- (ATXExecutableIdentifier)executable
{
  return self->_executable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executable, 0);
  objc_storeStrong((id *)&self->_reference, 0);
}

@end
