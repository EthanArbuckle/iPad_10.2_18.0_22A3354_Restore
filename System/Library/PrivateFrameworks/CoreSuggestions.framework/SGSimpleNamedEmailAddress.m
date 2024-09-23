@implementation SGSimpleNamedEmailAddress

- (SGSimpleNamedEmailAddress)initWithName:(id)a3 emailAddress:(id)a4
{
  id v7;
  id v8;
  SGSimpleNamedEmailAddress *v9;
  SGSimpleNamedEmailAddress *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGSimpleNamedEmailAddress;
  v9 = -[SGSimpleNamedEmailAddress init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_emailAddress, a4);
  }

  return v10;
}

- (SGSimpleNamedEmailAddress)initWithNamedHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SGSimpleNamedEmailAddress *v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SGSimpleNamedEmailAddress initWithName:emailAddress:](self, "initWithName:emailAddress:", v5, v6);
  return v7;
}

- (SGSimpleNamedEmailAddress)initWithCoder:(id)a3
{
  id v5;
  SGSimpleNamedEmailAddress *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  void *v11;
  NSString *v12;
  void *emailAddress;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGSimpleNamedEmailAddress;
  v6 = -[SGSimpleNamedEmailAddress init](&v15, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("emailAddress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
      emailAddress = v6->_emailAddress;
      v6->_emailAddress = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      emailAddress = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(emailAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGSimpleNamedEmailAddress.m"), 67, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "emailAddress");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));

}

- (id)serialized
{
  NSString *v2;

  if (self->_name)
    v2 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ <%@>"), self->_name, self->_emailAddress);
  else
    v2 = self->_emailAddress;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  SGSimpleNamedEmailAddress *v4;
  SGSimpleNamedEmailAddress *v5;
  BOOL v6;

  v4 = (SGSimpleNamedEmailAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSimpleNamedEmailAddress isEqualToNamedEmailAddress:](self, "isEqualToNamedEmailAddress:", v5);

  return v6;
}

- (BOOL)isEqualToNamedEmailAddress:(id)a3
{
  id *v4;
  NSString *name;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  name = self->_name;
  v6 = (NSString *)v4[2];
  if (name == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = name;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_emailAddress;
  v12 = v11;
  if (v11 == v4[1])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_emailAddress, "hash");
}

- (id)asCSPerson
{
  id v3;
  NSString *name;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA6B10]);
  name = self->_name;
  v8[0] = self->_emailAddress;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDisplayName:handles:handleIdentifier:", name, v5, CFSTR("emailAddresses"));

  return v6;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)namedEmailAddressWithFieldValue:(id)a3
{
  __CFString *v3;
  const char *CStringPtr;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (__CFString *)a3;
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (!CStringPtr)
    CStringPtr = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2899;
  v13 = __Block_byref_object_dispose__2900;
  v14 = 0;
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SGSimpleNamedEmailAddress_namedEmailAddressWithFieldValue___block_invoke;
    v8[3] = &unk_1E4761878;
    v8[4] = &v9;
    SGParseNamedEmailAddress(CStringPtr, v8);
    v5 = (void *)v10[5];
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)namedEmailAddressWithCSPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "handleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("emailAddresses")))
  {
    objc_msgSend(v4, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v8 = objc_alloc((Class)a1);
    objc_msgSend(v4, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithName:emailAddress:", v5, v10);

  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

+ (id)namedEmailAddressesWithFieldValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[SGSimpleNamedEmailAddress namedEmailAddressWithFieldValue:](SGSimpleNamedEmailAddress, "namedEmailAddressWithFieldValue:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)namedEmailAddressesWithEmailToNameDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SGSimpleNamedEmailAddress_namedEmailAddressesWithEmailToNameDictionary___block_invoke;
  v8[3] = &unk_1E47618A0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)emailToNameDictionaryWithNamedEmailAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "emailAddress", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "name");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
            v14 = (const __CFString *)v12;
          else
            v14 = &stru_1E4762D08;
          objc_msgSend(v10, "emailAddress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)serializeAll:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "serialized", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

void __74__SGSimpleNamedEmailAddress_namedEmailAddressesWithEmailToNameDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  SGSimpleNamedEmailAddress *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = -[SGSimpleNamedEmailAddress initWithName:emailAddress:]([SGSimpleNamedEmailAddress alloc], "initWithName:emailAddress:", v5, v6);

  objc_msgSend(v4, "addObject:", v7);
}

void __61__SGSimpleNamedEmailAddress_namedEmailAddressWithFieldValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SGSimpleNamedEmailAddress *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!objc_msgSend(v9, "length") || objc_msgSend(v9, "isEqualToString:", v5))
  {

    v9 = 0;
  }
  v6 = -[SGSimpleNamedEmailAddress initWithName:emailAddress:]([SGSimpleNamedEmailAddress alloc], "initWithName:emailAddress:", v9, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
