@implementation ML3ComparisonPredicate

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = &stru_1E5B66908;
  if (self->_transformFunction)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@("), self->_transformFunction);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_transformFunction)
      v8 = CFSTR(")");
    else
      v8 = &stru_1E5B66908;
  }
  else
  {
    v8 = &stru_1E5B66908;
    v7 = &stru_1E5B66908;
  }
  v9 = v8;
  if (self->_treatNullAsString)
    v10 = CFSTR("IFNULL(");
  else
    v10 = &stru_1E5B66908;
  v11 = v10;
  if (self->_treatNullAsString)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", '%@')"), self->_treatNullAsString);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[objc_class subselectStatementForProperty:](a4, "subselectStatementForProperty:", self->super._property);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (-[objc_class subselectPropertyForProperty:](a4, "subselectPropertyForProperty:", self->super._property),
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = v12;
    -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", self->super._property);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  v17 = objc_msgSend(v16, "length");
  objc_msgSend(v20, "appendString:", CFSTR("("));
  if (v17)
  {
    objc_msgSend(v20, "appendString:", v16);
    objc_msgSend(v20, "appendString:", CFSTR(" IN "));
    objc_msgSend(v20, "appendString:", CFSTR("("));
    v18 = v15;
  }
  else
  {
    objc_msgSend(v20, "appendString:", v11);
    objc_msgSend(v20, "appendString:", v15);
    v18 = v6;
  }
  objc_msgSend(v20, "appendString:", v18);
  objc_msgSend(v20, "appendString:", CFSTR(" "));
  -[ML3ComparisonPredicate operator](self, "operator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:", v19);

  objc_msgSend(v20, "appendString:", CFSTR(" "));
  objc_msgSend(v20, "appendString:", v7);
  objc_msgSend(v20, "appendString:", v11);
  objc_msgSend(v20, "appendString:", CFSTR("?"));
  objc_msgSend(v20, "appendString:", v6);
  objc_msgSend(v20, "appendString:", v9);
  objc_msgSend(v20, "appendString:", CFSTR(")"));
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v20, "appendString:", CFSTR(")"));

}

- (id)operator
{
  int v3;
  id result;
  void *v6;

  v3 = self->_comparison - 1;
  result = CFSTR("=");
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("!=");
      break;
    case 2:
      result = CFSTR(">");
      break;
    case 3:
      result = CFSTR(">=");
      break;
    case 4:
      result = CFSTR("<");
      break;
    case 5:
      result = CFSTR("<=");
      break;
    case 6:
    case 7:
    case 8:
      if (self->_caseInsensitive)
        result = CFSTR("LIKE");
      else
        result = CFSTR("GLOB");
      break;
    case 9:
      result = CFSTR("&");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Predicate.m"), 538, CFSTR("Unknown comparison: %d"), self->_comparison);

      result = 0;
      break;
  }
  return result;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparison:caseInsensitive:transformFunction:treatNullAsString:", v8, v7, v5, 0, 0, 0);

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparison:caseInsensitive:transformFunction:treatNullAsString:", v6, v5, 1, 0, 0, 0);

  return v7;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  id v10;
  void *v11;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparison:caseInsensitive:transformFunction:treatNullAsString:", v10, v9, v7, v6, 0, 0);

  return v11;
}

- (ML3ComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 transformFunction:(id)a7 treatNullAsString:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ML3ComparisonPredicate *v18;
  void *v20;
  void *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ML3ComparisonPredicate;
  v18 = -[ML3PropertyPredicate initWithProperty:](&v23, sel_initWithProperty_, v14);
  if (v18)
  {
    if (v15)
    {
      if (a5)
      {
LABEL_4:
        objc_storeStrong(&v18->_value, a4);
        v18->_comparison = a5;
        v18->_caseInsensitive = a6;
        objc_storeStrong((id *)&v18->_treatNullAsString, a8);
        objc_storeStrong((id *)&v18->_transformFunction, a7);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("ML3Predicate.m"), 429, CFSTR("invalid value (nil) for property %@."), v14);

      if (a5)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("ML3Predicate.m"), 430, &stru_1E5B66908);

    goto LABEL_4;
  }
LABEL_5:

  return v18;
}

- (id)databaseStatementParameters
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[ML3ComparisonPredicate valueToBindForOperation:](self, "valueToBindForOperation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueToBindForOperation:(int64_t)a3
{
  __CFString *v6;
  __CFString *v7;
  int comparison;
  __CFString *v9;
  __CFString *v10;
  id value;
  id v13;
  void *v14;
  uint64_t v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_caseInsensitive)
      v6 = CFSTR("%");
    else
      v6 = CFSTR("*");
    v7 = v6;
    comparison = self->_comparison;
    switch(comparison)
    {
      case 9:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, self->_value, v15);
        break;
      case 8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), self->_value, v7, v15);
        break;
      case 7:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v7, self->_value, v7);
        break;
      default:
        value = self->_value;
        if (a3 == 1)
        {
          if (value)
          {
            if (!objc_msgSend(value, "length"))
            {
              v9 = CFSTR("''");
              goto LABEL_17;
            }
            v13 = self->_value;
          }
          else
          {
            v13 = 0;
          }
          v10 = (__CFString *)v13;
        }
        else
        {
          v10 = (__CFString *)value;
        }
LABEL_16:
        v9 = v10;
LABEL_17:

        return v9;
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Predicate.m"), 626, CFSTR("Unexpected value in predicate: %@"), self->_value);

    }
  }
  v9 = (__CFString *)self->_value;
  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToInt64:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateWithProperty:equalToValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ML3ComparisonPredicate *v4;
  id v5;
  id v6;
  int v7;
  _BOOL4 v8;
  id v9;
  id v10;
  int v11;
  int v12;
  id v13;
  id v14;
  int v15;
  _BOOL4 v16;
  objc_super v18;

  v4 = (ML3ComparisonPredicate *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)ML3ComparisonPredicate;
    if (-[ML3PropertyPredicate isEqual:](&v18, sel_isEqual_, v4))
    {
      -[ML3ComparisonPredicate value](self, "value");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3ComparisonPredicate value](v4, "value");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {

      }
      else
      {
        v7 = objc_msgSend(v5, "isEqual:", v6);

        if (!v7)
        {
          LOBYTE(v8) = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      -[ML3ComparisonPredicate transformFunction](self, "transformFunction");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3ComparisonPredicate transformFunction](v4, "transformFunction");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {

      }
      else
      {
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_17;
      }
      v12 = -[ML3ComparisonPredicate comparison](self, "comparison");
      if (v12 != -[ML3ComparisonPredicate comparison](v4, "comparison"))
      {
LABEL_17:
        LOBYTE(v8) = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[ML3ComparisonPredicate treatNullAsString](self, "treatNullAsString");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3ComparisonPredicate treatNullAsString](v4, "treatNullAsString");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {

      }
      else
      {
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (!v15)
        {
          LOBYTE(v8) = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v16 = -[ML3ComparisonPredicate caseInsensitive](self, "caseInsensitive");
      v8 = v16 ^ -[ML3ComparisonPredicate caseInsensitive](v4, "caseInsensitive") ^ 1;
      goto LABEL_20;
    }
    LOBYTE(v8) = 0;
  }
LABEL_23:

  return v8;
}

- (id)value
{
  return self->_value;
}

- (NSString)treatNullAsString
{
  return self->_treatNullAsString;
}

- (NSString)transformFunction
{
  return self->_transformFunction;
}

- (int)comparison
{
  return self->_comparison;
}

- (BOOL)caseInsensitive
{
  return self->_caseInsensitive;
}

+ (id)predicateWithProperty:(id)a3 equalToInteger:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateWithProperty:equalToValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformFunction, 0);
  objc_storeStrong((id *)&self->_treatNullAsString, 0);
  objc_storeStrong(&self->_value, 0);
}

- (ML3ComparisonPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3ComparisonPredicate *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id value;
  uint64_t v12;
  NSString *treatNullAsString;
  uint64_t v14;
  NSString *transformFunction;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3ComparisonPredicate;
  v5 = -[ML3PropertyPredicate initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("value"));
    v10 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v10;

    v5->_comparison = objc_msgSend(v4, "decodeIntForKey:", CFSTR("comparison"));
    v5->_caseInsensitive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("caseInsensitive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatNullAsString"));
    v12 = objc_claimAutoreleasedReturnValue();
    treatNullAsString = v5->_treatNullAsString;
    v5->_treatNullAsString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transformFunction"));
    v14 = objc_claimAutoreleasedReturnValue();
    transformFunction = v5->_transformFunction;
    v5->_transformFunction = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3ComparisonPredicate;
  v4 = a3;
  -[ML3PropertyPredicate encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[ML3ComparisonPredicate value](self, "value", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  objc_msgSend(v4, "encodeInt:forKey:", -[ML3ComparisonPredicate comparison](self, "comparison"), CFSTR("comparison"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ML3ComparisonPredicate caseInsensitive](self, "caseInsensitive"), CFSTR("caseInsensitive"));
  -[ML3ComparisonPredicate treatNullAsString](self, "treatNullAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("treatNullAsString"));

  -[ML3ComparisonPredicate transformFunction](self, "transformFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("transformFunction"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ML3PropertyPredicate property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ML3ComparisonPredicate value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (id)description
{
  NSString *transformFunction;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSString *property;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  transformFunction = self->_transformFunction;
  v4 = &stru_1E5B66908;
  if (transformFunction)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@("), transformFunction);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_transformFunction)
      v4 = CFSTR(")");
  }
  else
  {
    v5 = &stru_1E5B66908;
  }
  v6 = v4;
  if (-[NSString isEqualToString:](self->super._property, "isEqualToString:", CFSTR("media_type")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromMLMediaType(objc_msgSend(self->_value, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(" [%@]"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E5B66908;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)ML3ComparisonPredicate;
  -[ML3PropertyPredicate description](&v17, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  property = self->super._property;
  -[ML3ComparisonPredicate operator](self, "operator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ComparisonPredicate valueToBindForOperation:](self, "valueToBindForOperation:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@(%@ %@ %@%@%@)%@"), v11, property, v13, v5, v14, v6, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  -[ML3PropertyPredicate property](self, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

  if (v11)
  {
    -[ML3ComparisonPredicate value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "ml_matchesValue:usingComparison:", v12, v5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 treatNullAsString:(id)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;

  v7 = a6;
  v8 = *(_QWORD *)&a5;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparison:caseInsensitive:transformFunction:treatNullAsString:", v13, v12, v8, v7, 0, v11);

  return v14;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 transformFunction:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;

  v6 = *(_QWORD *)&a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparison:caseInsensitive:transformFunction:treatNullAsString:", v11, v10, v6, 0, v9, 0);

  return v12;
}

@end
