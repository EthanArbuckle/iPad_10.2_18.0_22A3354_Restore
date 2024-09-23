@implementation _HKCachedSharedSummary

- (_HKCachedSharedSummary)initWithSummary:(id)a3
{
  id v5;
  _HKCachedSharedSummary *v6;
  _HKCachedSharedSummary *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCachedSharedSummary;
  v6 = -[_HKCachedSharedSummary init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_summary, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKSharedSummary package](self->_summary, "package");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSharedSummary name](self->_summary, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKSharedSummary UUID](self->_summary, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[HKSharedSummary name](self->_summary, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "summary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v11))
      {
        -[HKSharedSummary package](self->_summary, "package");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "summary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "package");
        v16 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "isEqualToString:", v14);

        v9 = v16;
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HKSharedSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
