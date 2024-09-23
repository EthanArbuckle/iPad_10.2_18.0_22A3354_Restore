@implementation ATXDefaultWidgetStack

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_smallDefaultStack, "copyWithZone:", a3);
  objc_msgSend(v5, "setSmallDefaultStack:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_mediumDefaultStack, "copyWithZone:", a3);
  objc_msgSend(v5, "setMediumDefaultStack:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_largeDefaultStack, "copyWithZone:", a3);
  objc_msgSend(v5, "setLargeDefaultStack:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_extraLargeDefaultStack, "copyWithZone:", a3);
  objc_msgSend(v5, "setExtraLargeDefaultStack:", v9);

  objc_msgSend(v5, "setSuggestedSize:", self->_suggestedSize);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *smallDefaultStack;
  id v5;

  smallDefaultStack = self->_smallDefaultStack;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", smallDefaultStack, CFSTR("smallDefaultStack"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediumDefaultStack, CFSTR("mediumDefaultStack"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_largeDefaultStack, CFSTR("largeDefaultStack"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extraLargeDefaultStack, CFSTR("extraLargeDefaultStack"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedSize, CFSTR("suggestedSize"));

}

- (ATXDefaultWidgetStack)initWithCoder:(id)a3
{
  id v4;
  ATXDefaultWidgetStack *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *smallDefaultStack;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *mediumDefaultStack;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *largeDefaultStack;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *extraLargeDefaultStack;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultWidgetStack;
  v5 = -[ATXDefaultWidgetStack init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("smallDefaultStack"));
    v9 = objc_claimAutoreleasedReturnValue();
    smallDefaultStack = v5->_smallDefaultStack;
    v5->_smallDefaultStack = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("mediumDefaultStack"));
    v14 = objc_claimAutoreleasedReturnValue();
    mediumDefaultStack = v5->_mediumDefaultStack;
    v5->_mediumDefaultStack = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("largeDefaultStack"));
    v19 = objc_claimAutoreleasedReturnValue();
    largeDefaultStack = v5->_largeDefaultStack;
    v5->_largeDefaultStack = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("extraLargeDefaultStack"));
    v24 = objc_claimAutoreleasedReturnValue();
    extraLargeDefaultStack = v5->_extraLargeDefaultStack;
    v5->_extraLargeDefaultStack = (NSArray *)v24;

    v5->_suggestedSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestedSize"));
  }

  return v5;
}

- (id)_JSONCompatible:(id)a3
{
  return -[ATXDefaultWidgetStack _JSONCompatible:compact:](self, "_JSONCompatible:compact:", a3, 0);
}

- (id)_JSONCompatible:(id)a3 compact:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (v4)
          objc_msgSend(v12, "compactDescription");
        else
          objc_msgSend(v12, "dictionaryRepresentation", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13, (_QWORD)v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[ATXDefaultWidgetStack _JSONCompatible:](self, "_JSONCompatible:", self->_smallDefaultStack);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("smallDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:](self, "_JSONCompatible:", self->_mediumDefaultStack);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediumDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:](self, "_JSONCompatible:", self->_largeDefaultStack);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("largeDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:](self, "_JSONCompatible:", self->_extraLargeDefaultStack);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("extraLargeDefaultStack"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suggestedSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestedSize"));

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXDefaultWidgetStack dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)compactDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[ATXDefaultWidgetStack _JSONCompatible:compact:](self, "_JSONCompatible:compact:", self->_smallDefaultStack, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("smallDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:compact:](self, "_JSONCompatible:compact:", self->_mediumDefaultStack, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediumDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:compact:](self, "_JSONCompatible:compact:", self->_largeDefaultStack, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("largeDefaultStack"));

  -[ATXDefaultWidgetStack _JSONCompatible:compact:](self, "_JSONCompatible:compact:", self->_extraLargeDefaultStack, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("extraLargeDefaultStack"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suggestedSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestedSize"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_smallDefaultStack, "hash");
  v4 = -[NSArray hash](self->_mediumDefaultStack, "hash") - v3 + 32 * v3;
  v5 = -[NSArray hash](self->_largeDefaultStack, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_extraLargeDefaultStack, "hash");
  return self->_suggestedSize - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

- (BOOL)isEqual:(id)a3
{
  ATXDefaultWidgetStack *v4;
  id *v5;
  NSArray *smallDefaultStack;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  BOOL v11;
  NSArray *mediumDefaultStack;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  char v16;
  NSArray *largeDefaultStack;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  char v21;
  NSArray *extraLargeDefaultStack;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  char v26;
  unint64_t suggestedSize;

  v4 = (ATXDefaultWidgetStack *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      smallDefaultStack = self->_smallDefaultStack;
      v7 = (NSArray *)v5[1];
      if (smallDefaultStack == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = smallDefaultStack;
        v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_19;
      }
      mediumDefaultStack = self->_mediumDefaultStack;
      v13 = (NSArray *)v5[2];
      if (mediumDefaultStack == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = mediumDefaultStack;
        v16 = -[NSArray isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_19;
      }
      largeDefaultStack = self->_largeDefaultStack;
      v18 = (NSArray *)v5[3];
      if (largeDefaultStack == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = largeDefaultStack;
        v21 = -[NSArray isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_19;
      }
      extraLargeDefaultStack = self->_extraLargeDefaultStack;
      v23 = (NSArray *)v5[4];
      if (extraLargeDefaultStack == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = extraLargeDefaultStack;
        v26 = -[NSArray isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
        {
LABEL_19:
          v11 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      suggestedSize = self->_suggestedSize;
      v11 = suggestedSize == objc_msgSend(v5, "suggestedSize");
      goto LABEL_22;
    }
    v11 = 0;
  }
LABEL_23:

  return v11;
}

- (NSArray)smallDefaultStack
{
  return self->_smallDefaultStack;
}

- (void)setSmallDefaultStack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)mediumDefaultStack
{
  return self->_mediumDefaultStack;
}

- (void)setMediumDefaultStack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)largeDefaultStack
{
  return self->_largeDefaultStack;
}

- (void)setLargeDefaultStack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)extraLargeDefaultStack
{
  return self->_extraLargeDefaultStack;
}

- (void)setExtraLargeDefaultStack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)suggestedSize
{
  return self->_suggestedSize;
}

- (void)setSuggestedSize:(unint64_t)a3
{
  self->_suggestedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeDefaultStack, 0);
  objc_storeStrong((id *)&self->_largeDefaultStack, 0);
  objc_storeStrong((id *)&self->_mediumDefaultStack, 0);
  objc_storeStrong((id *)&self->_smallDefaultStack, 0);
}

@end
