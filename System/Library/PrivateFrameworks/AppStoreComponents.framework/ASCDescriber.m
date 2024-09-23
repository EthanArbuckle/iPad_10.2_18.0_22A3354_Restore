@implementation ASCDescriber

+ (id)nilObject
{
  return CFSTR("(null)");
}

- (ASCDescriber)initWithObject:(id)a3
{
  id v5;
  ASCDescriber *v6;
  ASCDescriber *v7;
  NSMutableArray *v8;
  NSMutableArray *properties;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASCDescriber;
  v6 = -[ASCDescriber init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    properties = v7->_properties;
    v7->_properties = v8;

  }
  return v7;
}

- (void)addBool:(BOOL)a3 withName:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  NSStringFromBOOL();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v6, v5);

}

- (void)addInteger:(int64_t)a3 withName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v7);

}

- (void)addUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v7);

}

- (void)addInt64:(int64_t)a3 withName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v7);

}

- (void)addUInt64:(unint64_t)a3 withName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v7);

}

- (void)addDouble:(double)a3 withName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v7);

}

- (void)addSensitiveObject:(id)a3 withName:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  AMSHashIfNeeded();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v6, v5);

}

- (void)addObject:(id)a3 withName:(id)a4
{
  id v6;
  void *v7;
  ASCPair *v8;
  void *v9;
  ASCPair *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[ASCDescriber properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ASCPair alloc];
  v9 = v11;
  if (!v11)
  {
    +[ASCDescriber nilObject](ASCDescriber, "nilObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[ASCPair initWithFirst:second:](v8, "initWithFirst:second:", v6, v9);
  objc_msgSend(v7, "addObject:", v10);

  if (!v11)
}

- (id)describeObject
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ASCDescriber object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%p"), v6, v7);

  return v8;
}

- (id)describeProperties
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ASCDescriber properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return &stru_1E7562EE8;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ASCDescriber properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v5, "length"))
          objc_msgSend(v5, "appendString:", CFSTR("; "));
        objc_msgSend(v11, "first");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "second");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@"), v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)finalizeDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  -[ASCDescriber describeObject](self, "describeObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber describeProperties](self, "describeProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v5)
    v7 = objc_msgSend(v6, "initWithFormat:", CFSTR("<%@ %@>"), v3, v4);
  else
    v7 = objc_msgSend(v6, "initWithFormat:", CFSTR("<%@>"), v3, v10);
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCDescriber object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCDescriber properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
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

  if (v7)
  {
    -[ASCDescriber object](self, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "object");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCDescriber properties](self, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "properties");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
      else
        v14 = v11 == (void *)v12;

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber object](self, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber properties](self, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p object = <%@:%p>; properties = %@>"), v5, self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSObject)object
{
  return self->_object;
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end
