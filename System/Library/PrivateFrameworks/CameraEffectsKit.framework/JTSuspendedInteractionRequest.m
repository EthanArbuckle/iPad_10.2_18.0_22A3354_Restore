@implementation JTSuspendedInteractionRequest

+ (id)requestWithTag:(id)a3 excludedViewControllers:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTag:", v6);

  objc_msgSend(v7, "setExcludedChildViewControllers:", v5);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  JTSuspendedInteractionRequest *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (JTSuspendedInteractionRequest *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[JTSuspendedInteractionRequest tag](self, "tag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[JTSuspendedInteractionRequest tag](v4, "tag");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[JTSuspendedInteractionRequest tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (NSArray)excludedChildViewControllers
{
  return self->_excludedChildViewControllers;
}

- (void)setExcludedChildViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_excludedChildViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedChildViewControllers, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
