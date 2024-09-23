@implementation _INCodableAttributeRelationshipValueTransformer

- (_INCodableAttributeRelationshipValueTransformer)initWithCodableAttribute:(id)a3
{
  id v4;
  _INCodableAttributeRelationshipValueTransformer *v5;
  _INCodableAttributeRelationshipValueTransformer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_INCodableAttributeRelationshipValueTransformer;
  v5 = -[_INCodableAttributeRelationshipValueTransformer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_codableAttribute, v4);

  return v6;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  INJSONDecoder *v15;

  v4 = a3;
  -[_INCodableAttributeRelationshipValueTransformer codableAttribute](self, "codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectClass");
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v4;
  v8 = v7;
  v9 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = 0;
        v10 = v8;
LABEL_13:

        goto LABEL_14;
      }

      v10 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        objc_msgSend(v11, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12
          && (objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, 0),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14 = v13;

          v10 = v14;
        }
        else
        {
          v14 = 0;
          v10 = v11;
        }

        v15 = objc_alloc_init(INJSONDecoder);
        -[INJSONDecoder decodeObjectOfClass:from:](v15, "decodeObjectOfClass:from:", objc_msgSend(v5, "objectClass"), v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      v10 = 0;
    }
    v9 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

- (INCodableAttribute)codableAttribute
{
  return (INCodableAttribute *)objc_loadWeakRetained((id *)&self->_codableAttribute);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codableAttribute);
}

@end
