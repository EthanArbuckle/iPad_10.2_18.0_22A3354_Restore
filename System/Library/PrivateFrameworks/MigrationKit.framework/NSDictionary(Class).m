@implementation NSDictionary(Class)

- (id)mk_stringForKey:()Class
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mk_numberForKey:()Class
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mk_dictionaryForKey:()Class
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mk_arrayForKey:()Class
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mk_objectForKey:()Class class:
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

@end
