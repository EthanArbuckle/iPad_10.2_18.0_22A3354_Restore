@implementation VOTImageExplorerDetailData

- (VOTImageExplorerDetailData)initWithKey:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  VOTImageExplorerDetailData *v8;
  VOTImageExplorerDetailData *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTImageExplorerDetailData;
  v8 = -[VOTImageExplorerDetailData init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[VOTImageExplorerDetailData setKey:](v8, "setKey:", v6);
    -[VOTImageExplorerDetailData setValues:](v9, "setValues:", v7);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VOTImageExplorerDetailData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5, v6, v7), CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VOTImageExplorerDetailData setKey:](self, "setKey:", v9);

  v13 = objc_opt_class(NSArray, v10, v11, v12);
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(NSString, v14, v15, v16), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("values")));

  -[VOTImageExplorerDetailData setValues:](self, "setValues:", v19);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerDetailData key](self, "key"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerDetailData values](self, "values"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("values"));

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
