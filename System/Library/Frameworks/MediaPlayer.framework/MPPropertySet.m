@implementation MPPropertySet

void __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertySetByCombiningWithPropertySet:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v7);
}

- (id)propertySetByCombiningWithPropertySet:(id)a3
{
  _QWORD *v4;
  void *v5;
  id v6;
  NSDictionary *relationships;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  MPPropertySet *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  MPPropertySet *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)-[NSSet mutableCopy](self->_properties, "mutableCopy");
    objc_msgSend(v5, "unionSet:", v4[1]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationships = self->_relationships;
    v8 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke;
    v23[3] = &unk_1E315F530;
    v9 = v4;
    v24 = v9;
    v10 = v6;
    v25 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](relationships, "enumerateKeysAndObjectsUsingBlock:", v23);
    v11 = (void *)v9[2];
    v17 = v8;
    v18 = 3221225472;
    v19 = __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke_2;
    v20 = &unk_1E315F530;
    v21 = self;
    v22 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v17);
    v13 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v5, "allObjects", v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MPPropertySet *)objc_msgSend(v13, "initWithProperties:relationships:", v14, v12);

  }
  else
  {
    v15 = self;
  }

  return v15;
}

- (MPPropertySet)initWithProperties:(id)a3 relationships:(id)a4
{
  id v6;
  id v7;
  MPPropertySet *v8;
  id v9;
  uint64_t v10;
  NSSet *properties;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPPropertySet;
  v8 = -[MPPropertySet init](&v16, sel_init);
  if (v8)
  {
    if (v6)
      v9 = v6;
    else
      v9 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v8->_properties;
    v8->_properties = (NSSet *)v10;

    v12 = objc_msgSend(v7, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v8->_relationships, v14);

  }
  return v8;
}

void __33__MPPropertySet_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) || *(_QWORD *)(a1 + 48) >= 2uLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n    "));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n    "));
  v7 = objc_msgSend(v14, "length");
  if (v7)
  {
    v8 = v7;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR(" "));
      --v8;
    }
    while (v8);
  }
  objc_msgSend(v6, "appendString:", CFSTR("  "));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v5, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v13 = CFSTR(",");
  else
    v13 = &stru_1E3163D10;
  objc_msgSend(v9, "appendFormat:", CFSTR("%@: %@%@"), v14, v11, v13);

}

- (NSString)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  unint64_t v8;
  const __CFString *v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const __CFString *v15;
  NSUInteger v16;
  NSUInteger v17;
  const __CFString *v18;
  const __CFString *v19;
  NSDictionary *relationships;
  id v21;
  const __CFString *v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  NSUInteger v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v7 = -[NSSet count](self->_properties, "count");
  v8 = v7;
  v9 = CFSTR("properties");
  if (v7 == 1)
    v9 = CFSTR("property");
  objc_msgSend(v6, "appendFormat:", CFSTR("; %lu %@"), v7, v9);
  objc_msgSend(v6, "appendString:", CFSTR(": ["));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_properties;
  v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v8 < 2)
        {
          if (*((_BYTE *)v33 + 24))
            v15 = CFSTR(",");
          else
            v15 = &stru_1E3163D10;
        }
        else
        {
          objc_msgSend(v6, "appendString:", CFSTR("\n    "));
          *((_BYTE *)v33 + 24) = 1;
          v15 = CFSTR(",");
        }
        objc_msgSend(v6, "appendFormat:", CFSTR("%@%@"), v14, v15);
      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v11);
  }

  if (*((_BYTE *)v33 + 24))
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  objc_msgSend(v6, "appendString:", CFSTR("]"));
  v16 = -[NSDictionary count](self->_relationships, "count");
  v17 = v16;
  if (v16)
  {
    if (*((_BYTE *)v33 + 24))
      v18 = CFSTR("\n");
    else
      v18 = CFSTR(" ");
    v19 = CFSTR("relationships");
    if (v16 == 1)
      v19 = CFSTR("relationship");
    objc_msgSend(v6, "appendFormat:", CFSTR(";%@%lu %@"), v18, v16, v19);
    objc_msgSend(v6, "appendString:", CFSTR(": {"));
    relationships = self->_relationships;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __33__MPPropertySet_debugDescription__block_invoke;
    v24[3] = &unk_1E315F4E0;
    v26 = &v32;
    v27 = v17;
    v21 = v6;
    v25 = v21;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](relationships, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (*((_BYTE *)v33 + 24))
      v22 = CFSTR("\n");
    else
      v22 = CFSTR(" ");
    objc_msgSend(v21, "appendFormat:", CFSTR("%@"), v22);
    objc_msgSend(v21, "appendString:", CFSTR("}"));

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  _Block_object_dispose(&v32, 8);
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

void __55__MPPropertySet_propertySetByCombiningWithPropertySet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v7);

}

- (NSDictionary)relationships
{
  return self->_relationships;
}

- (NSSet)properties
{
  return self->_properties;
}

+ (id)emptyPropertySet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MPPropertySet_emptyPropertySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyPropertySet_onceToken != -1)
    dispatch_once(&emptyPropertySet_onceToken, block);
  return (id)emptyPropertySet_emptyPropertySet;
}

+ (MPPropertySet)propertySetWithProperties:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperties:relationships:", v4, 0);

  return (MPPropertySet *)v5;
}

void __58__MPPropertySet_propertySetByIntersectingWithPropertySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

    goto LABEL_4;
  }
  objc_msgSend(v6, "relationships");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
LABEL_4:
    objc_msgSend(v5, "propertySetByIntersectingWithPropertySet:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {

    }
    else
    {
      objc_msgSend(v10, "relationships");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v14);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)propertySetByIntersectingWithPropertySet:(id)a3
{
  _QWORD *v4;
  void *v5;
  id v6;
  NSDictionary *relationships;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  _QWORD *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)-[NSSet mutableCopy](self->_properties, "mutableCopy");
    objc_msgSend(v5, "intersectSet:", v4[1]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationships = self->_relationships;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __58__MPPropertySet_propertySetByIntersectingWithPropertySet___block_invoke;
    v16 = &unk_1E315F530;
    v17 = v4;
    v18 = v6;
    v8 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](relationships, "enumerateKeysAndObjectsUsingBlock:", &v13);
    v9 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v5, "allObjects", v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithProperties:relationships:", v10, v8);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptyPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __37__MPPropertySet_containsPropertySet___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "containsPropertySet:", v9) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (BOOL)containsPropertySet:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = v4;
  v6 = 1;
  if (v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    objc_msgSend(v4, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "isSubsetOfSet:", self->_properties);
      *((_BYTE *)v15 + 24) = v9;
      if (v9)
      {
LABEL_4:
        objc_msgSend(v5, "relationships");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __37__MPPropertySet_containsPropertySet___block_invoke;
          v13[3] = &unk_1E315F508;
          v13[4] = self;
          v13[5] = &v14;
          objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);
        }

        v6 = *((_BYTE *)v15 + 24) != 0;
        goto LABEL_9;
      }
    }
    else if (*((_BYTE *)v15 + 24))
    {
      goto LABEL_4;
    }
    v6 = 0;
LABEL_9:

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

void __33__MPPropertySet_emptyPropertySet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithProperties:relationships:", 0, 0);
  v2 = (void *)emptyPropertySet_emptyPropertySet;
  emptyPropertySet_emptyPropertySet = v1;

}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  const __CFString *v8;
  NSUInteger v9;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = -[NSSet count](self->_properties, "count");
  if (v7)
  {
    v8 = CFSTR("properties");
    if (v7 == 1)
      v8 = CFSTR("property");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu %@"), v7, v8);
  }
  v9 = -[NSDictionary count](self->_relationships, "count");
  if (v9)
  {
    v10 = CFSTR("relationships");
    if (v9 == 1)
      v10 = CFSTR("relationship");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu %@"), v9, v10);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (MPPropertySet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MPPropertySet *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("MPPropertySetProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("MPPropertySetRelationships"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MPPropertySet initWithProperties:relationships:](self, "initWithProperties:relationships:", v8, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *properties;
  void *v5;
  id v6;

  properties = self->_properties;
  v6 = a3;
  -[NSSet allObjects](properties, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("MPPropertySetProperties"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_relationships, CFSTR("MPPropertySetRelationships"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MPMutablePropertySet *v4;
  void *v5;
  MPMutablePropertySet *v6;

  v4 = [MPMutablePropertySet alloc];
  -[NSSet allObjects](self->_properties, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMutablePropertySet initWithProperties:relationships:](v4, "initWithProperties:relationships:", v5, self->_relationships);

  return v6;
}

- (BOOL)isEmpty
{
  return !-[NSSet count](self->_properties, "count") && -[NSDictionary count](self->_relationships, "count") == 0;
}

- (id)_stateDumpObject
{
  MPPropertySet *v3;
  NSUInteger v4;
  NSSet *properties;
  _BOOL4 v6;
  _BOOL4 v8;
  __CFString *v9;
  NSDictionary *relationships;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v3 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    return CFSTR("<EMPTY>");
  v12[0] = CFSTR("properties");
  if (-[NSSet count](self->_properties, "count"))
  {
    v4 = -[NSSet count](self->_properties, "count");
    properties = self->_properties;
    v6 = v4 == 1;
    if (v4 == 1)
      -[NSSet anyObject](properties, "anyObject");
    else
      -[NSSet allObjects](properties, "allObjects");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v4 != 1;
  }
  else
  {
    v6 = 0;
    v8 = 0;
    v9 = CFSTR("<EMPTY>");
  }
  v12[1] = CFSTR("relationships");
  v13[0] = v9;
  if (-[NSDictionary count](self->_relationships, "count"))
    relationships = self->_relationships;
  else
    relationships = (NSDictionary *)CFSTR("<EMPTY>");
  v13[1] = relationships;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)

  if (v6)
  return v11;
}

+ (MPPropertySet)propertySetWithRelationships:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperties:relationships:", 0, v4);

  return (MPPropertySet *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
