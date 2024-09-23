@implementation FHFeaturesResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *aggregateFeatures;
  id v5;

  aggregateFeatures = self->_aggregateFeatures;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", aggregateFeatures, CFSTR("aggregateFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aggregateFeaturesWithProcessingWindow, CFSTR("aggregateFeaturesWithProcessingWindow"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compoundFeatures, CFSTR("compoundFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("identifier"));

}

- (FHFeaturesResponse)initWithCoder:(id)a3
{
  id v4;
  FHFeaturesResponse *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *aggregateFeatures;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *aggregateFeaturesWithProcessingWindow;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *compoundFeatures;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FHFeaturesResponse;
  v5 = -[FHFeaturesResponse init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("aggregateFeatures"));
    v11 = objc_claimAutoreleasedReturnValue();
    aggregateFeatures = v5->_aggregateFeatures;
    v5->_aggregateFeatures = (NSArray *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("aggregateFeaturesWithProcessingWindow"));
    v18 = objc_claimAutoreleasedReturnValue();
    aggregateFeaturesWithProcessingWindow = v5->_aggregateFeaturesWithProcessingWindow;
    v5->_aggregateFeaturesWithProcessingWindow = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("compoundFeatures"));
    v23 = objc_claimAutoreleasedReturnValue();
    compoundFeatures = v5->_compoundFeatures;
    v5->_compoundFeatures = (NSArray *)v23;

  }
  return v5;
}

- (FHFeaturesResponse)initWithSmartFeatures:(id)a3 aggregateFeatureswithProcessingWindow:(id)a4 compoundFeatures:(id)a5 transactionID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FHFeaturesResponse *v15;
  FHFeaturesResponse *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FHFeaturesResponse;
  v15 = -[FHFeaturesResponse init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_aggregateFeatures, a3);
    objc_storeStrong((id *)&v16->_aggregateFeaturesWithProcessingWindow, a4);
    objc_storeStrong((id *)&v16->_compoundFeatures, a5);
    objc_storeStrong((id *)&v16->_transactionIdentifier, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("aggregateFeatures"), self->_aggregateFeatures);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("aggregateFeaturesWithProcessingWindow"),
    self->_aggregateFeaturesWithProcessingWindow);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("compoundFeatures"), self->_compoundFeatures);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("identifier"), self->_transactionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[FHFeaturesResponse aggregateFeatures](self, "aggregateFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHFeaturesResponse aggregateFeaturesWithProcessingWindow](self, "aggregateFeaturesWithProcessingWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[FHFeaturesResponse compoundFeatures](self, "compoundFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[FHFeaturesResponse transactionIdentifier](self, "transactionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8 + 923521;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  FHFeaturesResponse *v4;
  FHFeaturesResponse *v5;
  NSArray *aggregateFeatures;
  void *v7;
  NSArray *aggregateFeaturesWithProcessingWindow;
  void *v9;
  NSArray *compoundFeatures;
  void *v11;
  NSString *transactionIdentifier;
  void *v13;
  char v14;

  v4 = (FHFeaturesResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    aggregateFeatures = self->_aggregateFeatures;
    -[FHFeaturesResponse aggregateFeatures](v5, "aggregateFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](aggregateFeatures, "isEqual:", v7))
    {
      aggregateFeaturesWithProcessingWindow = self->_aggregateFeaturesWithProcessingWindow;
      -[FHFeaturesResponse aggregateFeaturesWithProcessingWindow](v5, "aggregateFeaturesWithProcessingWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray isEqual:](aggregateFeaturesWithProcessingWindow, "isEqual:", v9))
      {
        compoundFeatures = self->_compoundFeatures;
        -[FHFeaturesResponse compoundFeatures](v5, "compoundFeatures");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSArray isEqual:](compoundFeatures, "isEqual:", v11))
        {
          transactionIdentifier = self->_transactionIdentifier;
          -[FHFeaturesResponse transactionIdentifier](v5, "transactionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[NSString isEqual:](transactionIdentifier, "isEqual:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)aggregateFeatures
{
  return self->_aggregateFeatures;
}

- (NSArray)compoundFeatures
{
  return self->_compoundFeatures;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSArray)aggregateFeaturesWithProcessingWindow
{
  return self->_aggregateFeaturesWithProcessingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateFeaturesWithProcessingWindow, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_compoundFeatures, 0);
  objc_storeStrong((id *)&self->_aggregateFeatures, 0);
}

@end
