@implementation LNCompoundPropertyQuery

- (LNCompoundPropertyQuery)initWithType:(unint64_t)a3 comparisons:(id)a4
{
  id v6;
  LNCompoundPropertyQuery *v7;
  LNCompoundPropertyQuery *v8;
  uint64_t v9;
  NSArray *comparisons;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNCompoundPropertyQuery;
  v7 = -[LNPropertyQuery _init](&v12, sel__init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    comparisons = v8->_comparisons;
    v8->_comparisons = (NSArray *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, unint64_t);
  void *v11;
  id v12;
  LNCompoundPropertyQuery *v13;

  v3 = (void *)objc_msgSend(CFSTR("<"), "mutableCopy");
  -[LNCompoundPropertyQuery comparisons](self, "comparisons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __38__LNCompoundPropertyQuery_description__block_invoke;
  v11 = &unk_1E39A0EF8;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNCompoundPropertyQuery *v4;
  LNCompoundPropertyQuery *v5;
  LNCompoundPropertyQuery *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (LNCompoundPropertyQuery *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[LNCompoundPropertyQuery comparisons](self, "comparisons");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");
        -[LNCompoundPropertyQuery comparisons](v6, "comparisons");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v8 != v10)
        {
          v13 = 0;
          goto LABEL_10;
        }
        -[LNCompoundPropertyQuery comparisons](self, "comparisons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNCompoundPropertyQuery comparisons](v6, "comparisons");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
        v11 = v6;
        v6 = 0;
      }
    }
    else
    {
      v11 = 0;
      v13 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[LNCompoundPropertyQuery comparisons](self, "comparisons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNCompoundPropertyQuery type](self, "type") ^ v4;

  return v5;
}

- (LNCompoundPropertyQuery)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNCompoundPropertyQuery *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("comparisons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[LNCompoundPropertyQuery initWithType:comparisons:](self, "initWithType:comparisons:", v5, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_comparisons, CFSTR("comparisons"));

}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)comparisons
{
  return self->_comparisons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisons, 0);
}

uint64_t __38__LNCompoundPropertyQuery_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@"), a2);
  objc_msgSend(*(id *)(a1 + 40), "comparisons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  v7 = *(void **)(a1 + 32);
  if (v6 <= a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(">"));
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = objc_msgSend(v8, "type");
    v10 = CFSTR("OR");
    if (!v9)
      v10 = CFSTR("AND");
  }
  else
  {
    v10 = 0;
  }
  return objc_msgSend(v7, "appendFormat:", CFSTR(" %@ "), v10);
}

+ (id)andComparisons:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:comparisons:", 0, v4);

  return v5;
}

+ (id)orComparisons:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:comparisons:", 1, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
