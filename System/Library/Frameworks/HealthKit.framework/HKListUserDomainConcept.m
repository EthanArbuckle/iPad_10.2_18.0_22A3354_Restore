@implementation HKListUserDomainConcept

- (HKListUserDomainConcept)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKListUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The -%@ method is not available on %@"), v8, objc_opt_class());

  return 0;
}

- (HKListUserDomainConcept)initWithListType:(unint64_t)a3 listName:(id)a4
{
  id v6;
  HKListUserDomainConcept *v7;
  HKListUserDomainConcept *v8;
  uint64_t v9;
  NSString *listName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKListUserDomainConcept;
  v7 = -[HKUserDomainConcept initWithCodingCollection:linkCollection:propertyCollection:](&v12, sel_initWithCodingCollection_linkCollection_propertyCollection_, 0, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_listType = a3;
    v9 = objc_msgSend(v6, "copy");
    listName = v8->_listName;
    v8->_listName = (NSString *)v9;

  }
  return v8;
}

- (HKListUserDomainConcept)initWithListType:(unint64_t)a3
{
  return -[HKListUserDomainConcept initWithListType:listName:](self, "initWithListType:listName:", a3, 0);
}

- (id)listByUpdatingName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListUserDomainConcept _setListName:](self, "_setListName:", v4);

  return v5;
}

- (id)_deepCopy
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKListUserDomainConcept;
  -[HKUserDomainConcept _deepCopy](&v6, sel__deepCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListUserDomainConcept listName](self, "listName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setListName:", v4);

  objc_msgSend(v3, "_setListType:", -[HKListUserDomainConcept listType](self, "listType"));
  return v3;
}

- (id)_dataDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKTableFormatter *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  HKStringFromListUserDomainType(self->_listType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_listName)
    objc_msgSend(v5, "appendFormat:", CFSTR(" \"%@\"), self->_listName);
  -[HKUserDomainConcept linkCollection](self, "linkCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 1)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" (empty list)"));
    return v5;
  }
  else
  {
    v8 = -[HKTableFormatter initWithColumnTitles:]([HKTableFormatter alloc], "initWithColumnTitles:", &unk_1E389DE88);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[HKUserDomainConcept linkCollection](self, "linkCollection");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v15;
          objc_msgSend(v14, "targetUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKTableFormatter appendHeterogenousRow:](v8, "appendHeterogenousRow:", v17);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v11 += i;
      }
      while (v10);
    }

    objc_msgSend(v5, "appendString:", CFSTR("\n"));
    -[HKTableFormatter formattedTable](v8, "formattedTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v18);

    return v5;
  }
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier listUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "listUserDomainConceptIdentifier");
}

- (id)semanticIdentifier
{
  return -[HKListUserDomainConceptSemanticIdentifier initWithListType:]([HKListUserDomainConceptSemanticIdentifier alloc], "initWithListType:", self->_listType);
}

- (BOOL)canRequestSyncUponInsertion
{
  return self->_listType == 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKListUserDomainConcept;
  v4 = a3;
  -[HKUserDomainConcept encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_listName, CFSTR("listName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_listType, CFSTR("listType"));

}

- (HKListUserDomainConcept)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKListUserDomainConcept *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("listType"));
  v9.receiver = self;
  v9.super_class = (Class)HKListUserDomainConcept;
  v7 = -[HKUserDomainConcept initWithCoder:](&v9, sel_initWithCoder_, v4);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_listName, v5);
    v7->_listType = v6;
  }

  return v7;
}

- (id)listByAddingUserDomainConcept:(id)a3
{
  id v4;
  void *v5;
  HKUserDomainConceptLink *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUserDomainConceptLink initWithUserConcept:type:]([HKUserDomainConceptLink alloc], "initWithUserConcept:type:", v4, 1);

  objc_msgSend(v5, "collectionByAppendingLink:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)listByAddingUserDomainConcepts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_129);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "collectionByAppendingLinks:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

HKUserDomainConceptLink *__58__HKListUserDomainConcept_listByAddingUserDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKUserDomainConceptLink *v3;

  v2 = a2;
  v3 = -[HKUserDomainConceptLink initWithUserConcept:type:]([HKUserDomainConceptLink alloc], "initWithUserConcept:type:", v2, 1);

  return v3;
}

- (id)listByInsertingUserDomainConcept:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  HKUserDomainConceptLink *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKUserDomainConceptLink initWithUserConcept:type:]([HKUserDomainConceptLink alloc], "initWithUserConcept:type:", v6, 1);

  objc_msgSend(v7, "collectionByInsertingLink:atIndex:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)listByMovingUserDomainConceptFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  HKListUserDomainConcept *v5;
  void *v8;
  void *v9;

  if (a3 == a4)
  {
    v5 = self;
  }
  else
  {
    -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionByMovingLinkFromIndex:toIndex:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v9);
    v5 = (HKListUserDomainConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)listByRemovingUserDomainConceptAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionByRemovingLinkAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)listByRemovingUserDomainConcept:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "collectionByRemovingLinksWithTargetUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)listByRemovingAllUserDomainConcepts
{
  void *v3;
  void *v4;
  void *v5;

  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionByRemovingAllLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)listByReplacingConceptAtIndex:(unint64_t)a3 withUserDomainConcept:(id)a4
{
  id v6;
  void *v7;
  HKUserDomainConceptLink *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKUserDomainConceptLink initWithUserConcept:type:]([HKUserDomainConceptLink alloc], "initWithUserConcept:type:", v6, 1);

  objc_msgSend(v7, "collectionByReplacingLinkAtIndex:withLink:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)listByExchangingConceptAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;

  -[HKListUserDomainConcept _currentLinkCollection](self, "_currentLinkCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionBySwappingLinksAtIndex:otherIndex:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept userDomainConceptByReplacingLinks:](self, "userDomainConceptByReplacingLinks:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setListName:(id)a3
{
  NSString *v4;
  NSString *listName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  listName = self->_listName;
  self->_listName = v4;

}

- (void)_setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (id)_currentLinkCollection
{
  void *v2;
  void *v3;
  id v4;
  HKUserDomainConceptLinkCollection *v5;
  void *v6;

  -[HKUserDomainConcept linkCollection](self, "linkCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = [HKUserDomainConceptLinkCollection alloc];
    v4 = -[HKUserDomainConceptLinkCollection _initWithLinks:](v5, "_initWithLinks:", MEMORY[0x1E0C9AA60]);
  }
  v6 = v4;

  return v6;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  return -[HKListUserDomainConcept unitTesting_isIdentical:ignoreModificationTimestamp:](self, "unitTesting_isIdentical:ignoreModificationTimestamp:", a3, 0);
}

- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD *v6;
  NSString *listName;
  NSString *v8;
  BOOL v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v9 = -[HKUserDomainConcept isEqual:](self, "isEqual:", v6)
    && (v11.receiver = self,
        v11.super_class = (Class)HKListUserDomainConcept,
        -[HKUserDomainConcept unitTesting_isIdentical:ignoreModificationTimestamp:](&v11, sel_unitTesting_isIdentical_ignoreModificationTimestamp_, v6, v4))&& ((listName = self->_listName, v8 = (NSString *)v6[15], listName == v8)|| v8 && -[NSString isEqual:](listName, "isEqual:"))&& self->_listType == v6[14];

  return v9;
}

- (unint64_t)listType
{
  return self->_listType;
}

- (NSString)listName
{
  return self->_listName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listName, 0);
}

@end
