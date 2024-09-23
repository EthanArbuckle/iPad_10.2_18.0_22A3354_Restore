@implementation DKCanonicalVersion

+ (DKCanonicalVersion)canonicalVersionWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return (DKCanonicalVersion *)v5;
}

- (DKCanonicalVersion)initWithString:(id)a3
{
  id v5;
  DKCanonicalVersion *v6;
  DKCanonicalVersion *v7;
  uint64_t v8;
  NSArray *parts;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKCanonicalVersion;
  v6 = -[DKCanonicalVersion init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[DKCanonicalVersion _parseParts:](v6, "_parseParts:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    parts = v7->_parts;
    v7->_parts = (NSArray *)v8;

    objc_storeStrong((id *)&v7->_string, a3);
  }

  return v7;
}

- (BOOL)isNewerThan:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unint64_t v23;
  void *v24;
  BOOL v25;

  v4 = a3;
  -[DKCanonicalVersion parts](self, "parts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "parts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  if (v9)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      -[DKCanonicalVersion parts](self, "parts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "compare:", v15);

      if (v16 == 1)
      {
        v25 = 1;
        goto LABEL_12;
      }
      -[DKCanonicalVersion parts](self, "parts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqual:", v20);

      v11 &= v21;
      ++v10;
    }
    while (v9 != v10);
    if (v11)
      goto LABEL_9;
    v25 = 0;
  }
  else
  {
LABEL_9:
    -[DKCanonicalVersion parts](self, "parts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    objc_msgSend(v4, "parts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23 > objc_msgSend(v24, "count");

  }
LABEL_12:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKCanonicalVersion)initWithCoder:(id)a3
{
  id v4;
  DKCanonicalVersion *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *parts;
  uint64_t v11;
  NSString *string;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DKCanonicalVersion;
  v5 = -[DKCanonicalVersion init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parts"));
    v9 = objc_claimAutoreleasedReturnValue();
    parts = v5->_parts;
    v5->_parts = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v11 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DKCanonicalVersion parts](self, "parts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parts"));

  -[DKCanonicalVersion string](self, "string");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("string"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_parts, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_string, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DKCanonicalVersion parts](self, "parts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToCanonicalVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKCanonicalVersion parts](self, "parts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  DKCanonicalVersion *v4;
  BOOL v5;

  v4 = (DKCanonicalVersion *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[DKCanonicalVersion isEqualToCanonicalVersion:](self, "isEqualToCanonicalVersion:", v4);

  return v5;
}

- (id)_parseParts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)MEMORY[0x22E320B74]();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)parts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
