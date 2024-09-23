@implementation CLPlacemark

id __83__CLPlacemark_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_arrayWithObjectIfNonNil:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
