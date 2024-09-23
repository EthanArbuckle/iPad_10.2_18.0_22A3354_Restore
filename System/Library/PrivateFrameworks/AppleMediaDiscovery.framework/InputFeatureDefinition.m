@implementation InputFeatureDefinition

- (InputFeatureDefinition)initWithDictionary:(id)a3
{
  InputFeatureDefinition *v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  InputFeatureDefinition *v14;
  id v15;
  id v16;
  objc_super v17;
  id location[2];
  InputFeatureDefinition *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v19;
  v19 = 0;
  v17.receiver = v3;
  v17.super_class = (Class)InputFeatureDefinition;
  v19 = -[InputFeatureDefinition init](&v17, sel_init);
  objc_storeStrong((id *)&v19, v19);
  v5 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("feature_id"));
  -[InputFeatureDefinition setFeatureId:](v19, "setFeatureId:");

  v6 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("map_op"));
  -[InputFeatureDefinition setMapOp:](v19, "setMapOp:");

  v7 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("size"));
  -[InputFeatureDefinition setSize:](v19, "setSize:");

  v8 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("shape"));
  -[InputFeatureDefinition setShape:](v19, "setShape:");

  v9 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("remap_dictionary_id"));
  -[InputFeatureDefinition setRemapDictionaryId:](v19, "setRemapDictionaryId:");

  v10 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("value"));
  -[InputFeatureDefinition setFeatureValues:](v19, "setFeatureValues:");

  v11 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("feature_type"));
  -[InputFeatureDefinition setFeatureType:](v19, "setFeatureType:");

  v12 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("column"));
  -[InputFeatureDefinition setColumnName:](v19, "setColumnName:");

  v16 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("feature_domain"));
  v15 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("feature_source"));
  v13 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", v15, v16);
  -[InputFeatureDefinition setFeatureProvider:](v19, "setFeatureProvider:");

  v14 = v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v14;
}

- (BOOL)isValid
{
  BOOL v3;
  NSString *v4;
  BOOL v5;
  char v6;
  NSArray *v7;
  char v8;
  NSNumber *v9;

  v4 = -[InputFeatureDefinition featureId](self, "featureId");
  v8 = 0;
  v6 = 0;
  v5 = 0;
  if (v4)
  {
    v9 = -[InputFeatureDefinition size](self, "size");
    v8 = 1;
    v3 = 1;
    if (!v9)
    {
      v7 = -[InputFeatureDefinition shape](self, "shape");
      v6 = 1;
      v3 = v7 != 0;
    }
    v5 = v3;
  }
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  return v5;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (void)setColumnName:(id)a3
{
  objc_storeStrong((id *)&self->_columnName, a3);
}

- (NSArray)featureValues
{
  return self->_featureValues;
}

- (void)setFeatureValues:(id)a3
{
  objc_storeStrong((id *)&self->_featureValues, a3);
}

- (NSString)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(id)a3
{
  objc_storeStrong((id *)&self->_featureId, a3);
}

- (NSString)featureType
{
  return self->_featureType;
}

- (void)setFeatureType:(id)a3
{
  objc_storeStrong((id *)&self->_featureType, a3);
}

- (NSString)mapOp
{
  return self->_mapOp;
}

- (void)setMapOp:(id)a3
{
  objc_storeStrong((id *)&self->_mapOp, a3);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_storeStrong((id *)&self->_shape, a3);
}

- (NSString)remapDictionaryId
{
  return self->_remapDictionaryId;
}

- (void)setRemapDictionaryId:(id)a3
{
  objc_storeStrong((id *)&self->_remapDictionaryId, a3);
}

- (AMDFeatureProvider)featureProvider
{
  return self->_featureProvider;
}

- (void)setFeatureProvider:(id)a3
{
  objc_storeStrong((id *)&self->_featureProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_remapDictionaryId, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_mapOp, 0);
  objc_storeStrong((id *)&self->_featureType, 0);
  objc_storeStrong((id *)&self->_featureId, 0);
  objc_storeStrong((id *)&self->_featureValues, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end
