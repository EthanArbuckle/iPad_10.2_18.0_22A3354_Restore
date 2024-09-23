@implementation VSAppleSubscription

- (VSAppleSubscription)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The %@ initializer is not available."), v4);

  return 0;
}

- (VSAppleSubscription)initWithCustomerID:(id)a3 productCodes:(id)a4
{
  id v5;
  id v7;
  id v8;
  VSAppleSubscription *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  VSAppleSubscription *v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VSAppleSubscription;
  v9 = -[VSAppleSubscription init](&v32, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("customerID is required."));
    if (objc_msgSend(v8, "count"))
    {
      v24 = v9;
      v25 = v5;
      v26 = a4;
      v27 = v7;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        v17 = *MEMORY[0x1E0C99778];
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "length");

            if (!v22)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v17, CFSTR("Invalid product code was provided."));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v15);
      }

      a4 = v26;
      v7 = v27;
      v5 = v25;
      v9 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("At least one product code is required."));
    }
    objc_storeStrong((id *)&v9->_customerID, v5);
    objc_storeStrong((id *)&v9->_productCodes, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAppleSubscription)initWithCoder:(id)a3
{
  id v4;
  VSAppleSubscription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = -[VSAppleSubscription initWithCustomerID:productCodes:](self, "initWithCustomerID:productCodes:", CFSTR("sampleCID"), &unk_1E93CC738);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customerID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [coder decodeObjectOfClass:[NSString class] forKey:kVSAppleSubscriptionTypeCustomerIDKey] parameter must not be nil."));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAppleSubscription setCustomerID:](v5, "setCustomerID:", v7);

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("productCodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [coder decodeArrayOfObjectsOfClass:[NSString class] forKey:kVSAppleSubscriptionTypeProductCodesKey] parameter must not be nil."));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("productCodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAppleSubscription setProductCodes:](v5, "setProductCodes:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  -[VSAppleSubscription customerID](self, "customerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("customerID"));

  -[VSAppleSubscription productCodes](self, "productCodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productCodes"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[VSAppleSubscription componentsForPrinting:](self, "componentsForPrinting:", CFSTR(" = "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VSAppleSubscription;
  -[VSAppleSubscription description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[VSAppleSubscription customerID](self, "customerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VSAppleSubscription productCodes](self, "productCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  VSAppleSubscription *v4;
  VSAppleSubscription *v5;
  VSAppleSubscription *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSAppleSubscription *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (VSAppleSubscription *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSAppleSubscription."), v10);

      }
      v11 = v6;
      -[VSAppleSubscription customerID](self, "customerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAppleSubscription customerID](v11, "customerID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {
        -[VSAppleSubscription productCodes](self, "productCodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppleSubscription productCodes](v11, "productCodes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToArray:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSAppleSubscription *v4;
  void *v5;
  void *v6;
  VSAppleSubscription *v7;

  v4 = [VSAppleSubscription alloc];
  -[VSAppleSubscription customerID](self, "customerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppleSubscription productCodes](self, "productCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSAppleSubscription initWithCustomerID:productCodes:](v4, "initWithCustomerID:productCodes:", v5, v6);

  return v7;
}

- (id)componentsForPrinting:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSAppleSubscription customerID](self, "customerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("customerID"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[VSAppleSubscription productCodes](self, "productCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("productCodes"), v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v12);
  return v6;
}

- (id)prettyPrint
{
  void *v2;
  void *v3;

  -[VSAppleSubscription componentsForPrinting:](self, "componentsForPrinting:", CFSTR(": "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)customerID
{
  return self->_customerID;
}

- (void)setCustomerID:(id)a3
{
  objc_storeStrong((id *)&self->_customerID, a3);
}

- (NSArray)productCodes
{
  return self->_productCodes;
}

- (void)setProductCodes:(id)a3
{
  objc_storeStrong((id *)&self->_productCodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCodes, 0);
  objc_storeStrong((id *)&self->_customerID, 0);
}

@end
