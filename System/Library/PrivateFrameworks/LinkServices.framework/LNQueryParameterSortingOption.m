@implementation LNQueryParameterSortingOption

- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 sortParameterIndex:(id)a4
{
  id v8;
  LNQueryParameterSortingOption *v9;
  LNQueryParameterSortingOption *v10;
  LNQueryParameterSortingOption *v11;
  void *v13;
  objc_super v14;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryParameterSortingOption.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortParameterIndex"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNQueryParameterSortingOption;
  v9 = -[LNQueryParameterSortingOption init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_order = a3;
    objc_storeStrong((id *)&v9->_sortParameterIndex, a4);
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryParameterSortingOption order](self, "order"), CFSTR("order"));
  -[LNQueryParameterSortingOption sortParameterIndex](self, "sortParameterIndex");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sortParameterIndex"));

}

- (LNQueryParameterSortingOption)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  LNQueryParameterSortingOption *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("order"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortParameterIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[LNQueryParameterSortingOption initWithOrder:sortParameterIndex:](self, "initWithOrder:sortParameterIndex:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[LNQueryParameterSortingOption order](self, "order");
  -[LNQueryParameterSortingOption sortParameterIndex](self, "sortParameterIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryParameterSortingOption *v4;
  LNQueryParameterSortingOption *v5;
  LNQueryParameterSortingOption *v6;
  int64_t v7;
  void *v8;
  void *v9;
  LNQueryParameterSortingOption *v10;
  LNQueryParameterSortingOption *v11;
  LNQueryParameterSortingOption *v12;
  char v13;

  v4 = (LNQueryParameterSortingOption *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNQueryParameterSortingOption order](self, "order");
        if (v7 != -[LNQueryParameterSortingOption order](v6, "order"))
        {
          v13 = 0;
LABEL_16:

          goto LABEL_17;
        }
        -[LNQueryParameterSortingOption sortParameterIndex](self, "sortParameterIndex");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryParameterSortingOption sortParameterIndex](v6, "sortParameterIndex");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          v13 = 1;
        }
        else
        {
          v13 = 0;
          if (v10 && v11)
            v13 = -[LNQueryParameterSortingOption isEqual:](v10, "isEqual:", v11);
        }

      }
      else
      {
        v13 = 0;
        v10 = v6;
        v6 = 0;
      }
    }
    else
    {
      v10 = 0;
      v13 = 0;
    }

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (int64_t)order
{
  return self->_order;
}

- (NSNumber)sortParameterIndex
{
  return self->_sortParameterIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortParameterIndex, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 parameterIdentifier:(id)a4
{
  return -[LNQueryParameterSortingOption initWithOrder:sortParameterIndex:](self, "initWithOrder:sortParameterIndex:", a3, &unk_1E45FA5E0);
}

- (NSString)parameterIdentifier
{
  return (NSString *)&stru_1E45DFA60;
}

@end
