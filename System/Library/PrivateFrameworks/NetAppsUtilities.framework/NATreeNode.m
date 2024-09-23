@implementation NATreeNode

- (NATreeNode)initWithRepresentedObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NATreeNode *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NATreeNode initWithRepresentedObject:childNodes:](self, "initWithRepresentedObject:childNodes:", v5, v6);

  return v7;
}

- (NATreeNode)initWithRepresentedObject:(id)a3 childNodes:(id)a4
{
  id v7;
  id v8;
  NATreeNode *v9;
  NATreeNode *v10;
  uint64_t v11;
  NSMutableSet *internalChildNodes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NATreeNode;
  v9 = -[NATreeNode init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_representedObject, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    internalChildNodes = v10->_internalChildNodes;
    v10->_internalChildNodes = (NSMutableSet *)v11;

  }
  return v10;
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  +[NADescriptionBuilder builderWithObject:](NADescriptionBuilder, "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

  -[NATreeNode representedObject](self, "representedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("representedObject"));

  -[NATreeNode internalChildNodes](self, "internalChildNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v5, "activeMultilinePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_1E6227C70;
    v12[4] = self;
    v13 = v5;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("childNodes"), v10, v12);

  }
  return v5;
}

void __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalChildNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v4[3] = &unk_1E6227C48;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);

}

void __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "activeMultilinePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_descriptionBuilderWithMultilinePrefix:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "build");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v8, 0);
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[NATreeNode _descriptionBuilderWithMultilinePrefix:](self, "_descriptionBuilderWithMultilinePrefix:", &stru_1E6228C10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NATreeNode *v4;
  void *v5;
  void *v6;
  NATreeNode *v7;

  v4 = +[NATreeNode allocWithZone:](NATreeNode, "allocWithZone:", a3);
  -[NATreeNode representedObject](self, "representedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NATreeNode childNodes](self, "childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NATreeNode initWithRepresentedObject:childNodes:](v4, "initWithRepresentedObject:childNodes:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NAMutableTreeNode *v4;
  void *v5;
  void *v6;
  NAMutableTreeNode *v7;

  v4 = +[NAMutableTreeNode allocWithZone:](NAMutableTreeNode, "allocWithZone:", a3);
  -[NATreeNode representedObject](self, "representedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NATreeNode childNodes](self, "childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NATreeNode initWithRepresentedObject:childNodes:](v4, "initWithRepresentedObject:childNodes:", v5, v6);

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[NATreeNode deepNodeEnumerator](self, "deepNodeEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

+ (NAIdentity)na_identity
{
  if (na_identity_onceToken != -1)
    dispatch_once(&na_identity_onceToken, &__block_literal_global_0);
  return (NAIdentity *)(id)na_identity_identity;
}

void __25__NATreeNode_na_identity__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[NAIdentityBuilder builder](NAIdentityBuilder, "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_34);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_35);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)na_identity_identity;
  na_identity_identity = v2;

}

uint64_t __25__NATreeNode_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedObject");
}

uint64_t __25__NATreeNode_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internalChildNodes");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSSet)childNodes
{
  void *v2;
  void *v3;

  -[NATreeNode internalChildNodes](self, "internalChildNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSEnumerator)deepNodeEnumerator
{
  return (NSEnumerator *)-[NATreeNodeDeepNodeEnumerator initWithNode:]([NATreeNodeDeepNodeEnumerator alloc], "initWithNode:", self);
}

- (NSEnumerator)shallowNodeEnumerator
{
  void *v2;
  void *v3;

  -[NATreeNode childNodes](self, "childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEnumerator *)v3;
}

- (NSEnumerator)shallowRepresentedObjectEnumerator
{
  void *v2;
  void *v3;
  void *v4;

  -[NATreeNode childNodes](self, "childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("representedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEnumerator *)v4;
}

- (id)childrenSortedByComparator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NATreeNode childNodes](self, "childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)childAtIndexPath:(id)a3 withChildrenSortedByComparator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NATreeNode *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[NATreeNode childrenSortedByComparator:](self, "childrenSortedByComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "indexAtPosition:", 0);
    if ((unint64_t)objc_msgSend(v6, "length") > 1)
    {
      objc_msgSend(v6, "na_indexPathStartingAtPosition:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_opt_new();
    }
    v12 = (void *)v10;
    if (objc_msgSend(v8, "count") <= v9)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "childAtIndexPath:withChildrenSortedByComparator:", v12, v7);
      v11 = (NATreeNode *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong(&self->_representedObject, a3);
}

- (NSMutableSet)internalChildNodes
{
  return self->_internalChildNodes;
}

- (void)setInternalChildNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalChildNodes, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

@end
