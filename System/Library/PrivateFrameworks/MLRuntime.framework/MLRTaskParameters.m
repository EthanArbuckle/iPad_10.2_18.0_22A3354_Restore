@implementation MLRTaskParameters

- (MLRTaskParameters)initWithParametersDict:(id)a3
{
  id v4;
  MLRTaskParameters *v5;
  uint64_t v6;
  NSDictionary *recipeUserInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRTaskParameters;
  v5 = -[MLRTaskParameters init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    recipeUserInfo = v5->_recipeUserInfo;
    v5->_recipeUserInfo = (NSDictionary *)v6;

  }
  return v5;
}

- (MLRTaskParameters)initWithDESRecipe:(id)a3
{
  void *v4;
  MLRTaskParameters *v5;

  if (a3)
  {
    objc_msgSend(a3, "recipeUserInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MLRTaskParameters initWithParametersDict:](self, "initWithParametersDict:", v4);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MLRTaskParameters)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MLRTaskParameters *v10;
  id v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Nil fileURL"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v6, 8, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[MLRTaskParameters initWithParametersDict:](self, "initWithParametersDict:", v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v5, self->_recipeUserInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (float)floatValueForKey:(id)a3 defaultValue:(float)a4
{
  float result;

  -[NSDictionary mlr_floatValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_floatValueForKey:defaultValue:", a3);
  return result;
}

- (double)doubleValueForKey:(id)a3 defaultValue:(double)a4
{
  double result;

  -[NSDictionary mlr_doubleValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_doubleValueForKey:defaultValue:", a3, a4);
  return result;
}

- (BOOL)BOOLValueForKey:(id)a3 defaultValue:(BOOL)a4
{
  return -[NSDictionary mlr_BOOLValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_BOOLValueForKey:defaultValue:", a3, a4);
}

- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  return -[NSDictionary mlr_integerValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_integerValueForKey:defaultValue:", a3, a4);
}

- (unint64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(unint64_t)a4
{
  return -[NSDictionary mlr_unsignedIntegerValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_unsignedIntegerValueForKey:defaultValue:", a3, a4);
}

- (id)stringValueForKey:(id)a3 defaultValue:(id)a4
{
  return -[NSDictionary mlr_stringValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_stringValueForKey:defaultValue:", a3, a4);
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)(id)-[NSDictionary copy](self->_recipeUserInfo, "copy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recipeUserInfo, CFSTR("recipeUserInfo"));
}

- (MLRTaskParameters)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MLRTaskParameters *v12;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("recipeUserInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self = -[MLRTaskParameters initWithParametersDict:](self, "initWithParametersDict:", v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDictionary)recipeUserInfo
{
  return self->_recipeUserInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeUserInfo, 0);
}

@end
