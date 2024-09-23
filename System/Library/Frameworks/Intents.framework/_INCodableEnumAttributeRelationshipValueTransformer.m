@implementation _INCodableEnumAttributeRelationshipValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_INCodableEnumAttributeRelationshipValueTransformer _transformedStringValue:](self, "_transformedStringValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = v4;
    goto LABEL_8;
  }

  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  -[_INCodableEnumAttributeRelationshipValueTransformer _transformedNumberValue:](self, "_transformedNumberValue:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

- (id)_transformedStringValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[_INCodableAttributeRelationshipValueTransformer codableAttribute](self, "codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "codableEnum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79___INCodableEnumAttributeRelationshipValueTransformer__transformedStringValue___block_invoke;
    v12[3] = &unk_1E22893E0;
    v13 = v4;
    objc_msgSend(v9, "if_firstObjectPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_transformedNumberValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[_INCodableAttributeRelationshipValueTransformer codableAttribute](self, "codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "codableEnum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79___INCodableEnumAttributeRelationshipValueTransformer__transformedNumberValue___block_invoke;
    v12[3] = &unk_1E22893E0;
    v13 = v4;
    objc_msgSend(v9, "if_firstObjectPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
