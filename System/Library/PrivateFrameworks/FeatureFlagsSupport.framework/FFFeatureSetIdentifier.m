@implementation FFFeatureSetIdentifier

- (FFFeatureSetIdentifier)initWithGroup:(id)a3 set:(id)a4
{
  id v7;
  id v8;
  FFFeatureSetIdentifier *v9;
  FFFeatureSetIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FFFeatureSetIdentifier;
  v9 = -[FFFeatureSetIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureGroupName, a3);
    objc_storeStrong((id *)&v10->_featureSetName, a4);
  }

  return v10;
}

+ (id)identifierFromString:(id)a3
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  FFFeatureSetIdentifier *v6;
  void *v7;
  _BOOL4 v8;
  FFFeatureSetIdentifier *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 2)
    goto LABEL_5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v4);

  v6 = 0;
  if (v5)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v7);

    if (v8)
    {
      v9 = [FFFeatureSetIdentifier alloc];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[FFFeatureSetIdentifier initWithGroup:set:](v9, "initWithGroup:set:", v10, v11);

      goto LABEL_6;
    }
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_featureGroupName, "hash");
  return -[NSString hash](self->_featureSetName, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSString *featureGroupName;
  void *v9;
  NSString *featureSetName;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    featureGroupName = self->_featureGroupName;
    objc_msgSend(v7, "featureGroupName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](featureGroupName, "isEqualToString:", v9))
    {
      featureSetName = self->_featureSetName;
      objc_msgSend(v7, "featureSetName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSString isEqualToString:](featureSetName, "isEqualToString:", v11);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FFFeatureSetIdentifier initWithGroup:set:](+[FFFeatureSetIdentifier allocWithZone:](FFFeatureSetIdentifier, "allocWithZone:", a3), "initWithGroup:set:", self->_featureGroupName, self->_featureSetName);
}

- (NSString)featureGroupName
{
  return self->_featureGroupName;
}

- (NSString)featureSetName
{
  return self->_featureSetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSetName, 0);
  objc_storeStrong((id *)&self->_featureGroupName, 0);
}

@end
