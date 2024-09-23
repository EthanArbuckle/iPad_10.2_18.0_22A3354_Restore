@implementation _INCodableAttributeCustomObjectAttributeRelationshipValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = v3;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    v12 = &stru_1E2295770;
    if (v11)
      v12 = v11;
    v8 = v12;

  }
  return v8;
}

@end
