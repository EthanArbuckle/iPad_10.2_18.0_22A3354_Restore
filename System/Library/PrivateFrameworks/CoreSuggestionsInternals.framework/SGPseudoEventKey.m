@implementation SGPseudoEventKey

- (SGPseudoEventKey)initWithSerialized:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SGPseudoEventKey *v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPseudoEventKey.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  SGDelimitedStringsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPseudoEventKey.m"), 35, CFSTR("Invalid serialization"));

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGPseudoEventKey initWithGloballyUniqueId:](self, "initWithGloballyUniqueId:", v7);

  return v8;
}

- (SGPseudoEventKey)initWithGloballyUniqueId:(id)a3
{
  id v6;
  SGPseudoEventKey *v7;
  SGPseudoEventKey *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPseudoEventKey.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGPseudoEventKey;
  v7 = -[SGPseudoEventKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_groupId, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SGPseudoEventKey *v4;
  SGPseudoEventKey *v5;
  BOOL v6;

  v4 = (SGPseudoEventKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPseudoEventKey isEqualToPseudoEventKey:](self, "isEqualToPseudoEventKey:", v5);

  return v6;
}

- (BOOL)isEqualToPseudoEventKey:(id)a3
{
  NSString *v4;
  NSString *v5;
  char v6;

  v4 = self->_groupId;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 3))
    v6 = 1;
  else
    v6 = -[NSString isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_groupId, "hash");
}

- (id)serialize
{
  return (id)SGDelimitedStringsSerialize();
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGPseudoEventKey groupId:%@"), self->_groupId);
}

- (BOOL)isDropoff
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  -[NSString componentsSeparatedByString:](self->_groupId, "componentsSeparatedByString:", CFSTR("|"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", CFSTR("{dropoff}"), (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (id)alternativeKeysForEventKitQuery
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  -[NSString componentsSeparatedByString:](self->_groupId, "componentsSeparatedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = -1;
    do
    {
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length")
        && objc_msgSend(v9, "characterAtIndex:", 0) == 123
        && objc_msgSend(v9, "characterAtIndex:", objc_msgSend(v9, "length") - 1) == 125)
      {
        objc_msgSend(v5, "subarrayWithRange:", 0, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subarrayWithRange:", v6 + 1, objc_msgSend(v5, "count") + v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR("|"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        SGDelimitedStringsSerialize();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14, 0);

      }
      objc_autoreleasePoolPop(v8);
      ++v6;
      --v7;
    }
    while (objc_msgSend(v5, "count") > v6);
  }

  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serialized, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGPseudoEventKey.m"), 107, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
