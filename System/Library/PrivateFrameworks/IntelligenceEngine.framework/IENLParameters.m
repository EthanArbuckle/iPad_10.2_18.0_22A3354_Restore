@implementation IENLParameters

- (BOOL)isEqual:(id)a3
{
  IENLParameters *v4;
  IENLParameters *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (IENLParameters *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      v11 = 1;
    }
    else
    {
      v5 = v4;
      -[IENLParameters name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IENLParameters name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) != 0)
      {
        -[IENLParameters parameters](self, "parameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[IENLParameters parameters](v5, "parameters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
