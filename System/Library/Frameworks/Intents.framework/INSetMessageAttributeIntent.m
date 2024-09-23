@implementation INSetMessageAttributeIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetMessageAttributeIntent)initWithIdentifiers:(NSArray *)identifiers attribute:(INMessageAttribute)attribute
{
  NSArray *v6;
  INSetMessageAttributeIntent *v7;
  INSetMessageAttributeIntent *v8;
  objc_super v10;

  v6 = identifiers;
  v10.receiver = self;
  v10.super_class = (Class)INSetMessageAttributeIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INSetMessageAttributeIntent setIdentifiers:](v7, "setIdentifiers:", v6);
    -[INSetMessageAttributeIntent setAttribute:](v8, "setAttribute:", attribute);
  }

  return v8;
}

- (NSArray)identifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];

  return (NSArray *)v4;
}

- (void)setIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearIdentifiers");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
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
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIdentifier:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (INMessageAttribute)attribute
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INMessageAttribute v7;
  INMessageAttribute v8;

  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAttribute");
  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "attribute") - 1;
  if (v6 <= 4)
    v7 = v6 + 1;
  else
    v7 = INMessageAttributeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INMessageAttributeUnknown;

  return v8;
}

- (void)setAttribute:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 4)
    objc_msgSend(v4, "setHasAttribute:", 0);
  else
    objc_msgSend(v4, "setAttribute:");

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INMessageAttribute v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("identifiers");
  -[INSetMessageAttributeIntent identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("attribute");
  v11[0] = v4;
  v5 = -[INSetMessageAttributeIntent attribute](self, "attribute");
  if ((unint64_t)(v5 - 1) > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E228C960[v5 - 1];
  v7 = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v8;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetMessageAttributeIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Messages");
}

- (id)verb
{
  return CFSTR("SetMessageAttribute");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
