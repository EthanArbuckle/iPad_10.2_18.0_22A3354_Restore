@implementation AXElementGroup

+ (AXElementGroup)groupWithElements:(id)a3
{
  return (AXElementGroup *)objc_msgSend(a1, "groupWithElements:label:", a3, 0);
}

+ (AXElementGroup)groupWithElements:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElements:label:", v6, v5);

  return (AXElementGroup *)v7;
}

+ (AXElementGroup)groupWithGenerator:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGenerator:", v3);

  return (AXElementGroup *)v4;
}

- (AXElementGroup)initWithElements:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  AXElementGroup *v8;
  AXElementGroup *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXElementGroup;
  v8 = -[AXElementGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[AXElementGroup _commonInitWithElements:label:generator:](v8, "_commonInitWithElements:label:generator:", v6, v7, 0);

  return v9;
}

- (AXElementGroup)initWithGenerator:(id)a3
{
  id v4;
  AXElementGroup *v5;
  AXElementGroup *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXElementGroup;
  v5 = -[AXElementGroup init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXElementGroup _commonInitWithElements:label:generator:](v5, "_commonInitWithElements:label:generator:", 0, 0, v4);

  return v6;
}

- (void)_commonInitWithElements:(id)a3 label:(id)a4 generator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *elementStore;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  NSString *label;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGroup setGroupObservers:](self, "setGroupObservers:", v11);

  if (v10)
  {
    -[AXElementGroup setGenerator:](self, "setGenerator:", v10);
  }
  else
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    elementStore = self->_elementStore;
    self->_elementStore = v12;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = self->_elementStore;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "setParentGroup:", self, (_QWORD)v21);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    v19 = (NSString *)objc_msgSend(v9, "copy");
    label = self->_label;
    self->_label = v19;

  }
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  AXElementGroup *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AXElementGroup unregisterAllGroupObservers](self, "unregisterAllGroupObservers");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_elementStore;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "parentGroup");
        v9 = (AXElementGroup *)objc_claimAutoreleasedReturnValue();

        if (v9 == self)
          objc_msgSend(v8, "setParentGroup:", 0);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXElementGroup;
  -[AXElementGroup dealloc](&v10, sel_dealloc);
}

- (id)groupByPrependingGroupable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", self);
    v5 = (void *)objc_opt_class();
    -[AXElementGroup label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupWithElements:label:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXElementGroup _transferStateToGroup:](self, "_transferStateToGroup:", v7);
  }
  else
  {
    v8 = (void *)objc_opt_class();
    -[AXElementGroup label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupWithElements:label:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)groupByAppendingGroupable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)-[NSArray mutableCopy](self->_elementStore, "mutableCopy");
    objc_msgSend(v5, "addObject:", v4);
    v6 = (void *)objc_opt_class();
    -[AXElementGroup label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupWithElements:label:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXElementGroup _transferStateToGroup:](self, "_transferStateToGroup:", v8);
  }
  else
  {
    v9 = (void *)objc_opt_class();
    -[AXElementGroup label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupWithElements:label:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)groupByRemovingGroupable:(id)a3
{
  NSArray *elementStore;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  elementStore = self->_elementStore;
  v5 = a3;
  v6 = (void *)-[NSArray mutableCopy](elementStore, "mutableCopy");
  objc_msgSend(v6, "removeObject:", v5);

  v7 = (void *)objc_opt_class();
  -[AXElementGroup label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupWithElements:label:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementGroup _transferStateToGroup:](self, "_transferStateToGroup:", v9);
  return v9;
}

- (id)groupByReplacingGroupable:(id)a3 withGroupable:(id)a4
{
  id v6;
  NSArray *elementStore;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  elementStore = self->_elementStore;
  v8 = a3;
  v9 = (void *)-[NSArray mutableCopy](elementStore, "mutableCopy");
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v6);
  v11 = (void *)objc_opt_class();
  -[AXElementGroup label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "groupWithElements:label:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementGroup _transferStateToGroup:](self, "_transferStateToGroup:", v13);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *elementStore;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  elementStore = self->_elementStore;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = v5;
  if (elementStore)
  {
    v7 = (void *)objc_msgSend(v5, "initWithElements:label:", self->_elementStore, self->_label);
  }
  else
  {
    -[AXElementGroup generator](self, "generator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "initWithGenerator:", v8);

  }
  -[AXElementGroup _transferStateToGroup:](self, "_transferStateToGroup:", v7);
  return v7;
}

- (void)_transferStateToGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AXElementGroup _notifyGroupObserversWillTransferStateToGroup:](self, "_notifyGroupObserversWillTransferStateToGroup:", v6);
  objc_msgSend(v6, "setGroupTraits:", -[AXElementGroup groupTraits](self, "groupTraits"));
  objc_msgSend(v6, "setUserDefinedScanningBehaviorTraits:", -[AXElementGroup userDefinedScanningBehaviorTraits](self, "userDefinedScanningBehaviorTraits"));
  -[AXElementGroup elementCommunity](self, "elementCommunity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setElementCommunity:", v4);

  -[AXElementGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5);

  -[AXElementGroup _notifyGroupObserversDidTransferStateToGroup:](self, "_notifyGroupObserversDidTransferStateToGroup:", v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementGroup;
  if (-[AXElementGroup isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXElementGroup identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)count
{
  -[AXElementGroup _generateGroupsIfNeeded](self, "_generateGroupsIfNeeded");
  return -[NSArray count](self->_elementStore, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  -[AXElementGroup _generateGroupsIfNeeded](self, "_generateGroupsIfNeeded");
  return -[NSArray objectAtIndex:](self->_elementStore, "objectAtIndex:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AXNotApplicable"), CFSTR("Mutable copies of AXElementGroups are not supported"));
  return 0;
}

- (CGRect)frame
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  AXElementGroup *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v35 = *MEMORY[0x1E0C80C00];
  -[AXElementGroup elementCommunity](self, "elementCommunity");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AXElementGroup elementCommunity](self, "elementCommunity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isSpringBoard") & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    -[AXElementGroup elementCommunity](self, "elementCommunity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isAXUIServer") & 1) != 0)
    {

      goto LABEL_5;
    }
    v25 = -[AXElementGroup isKeyboardContainer](self, "isKeyboardContainer");

    if (!v25)
    {
      -[AXElementGroup elementCommunity](self, "elementCommunity");
      v12 = (AXElementGroup *)objc_claimAutoreleasedReturnValue();
      -[AXElementGroup frame](v12, "frame");
      x = v26;
      y = v27;
      width = v28;
      height = v29;
      goto LABEL_13;
    }
  }
LABEL_6:
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self;
  v13 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "frame", (_QWORD)v30);
        v39.origin.x = v17;
        v39.origin.y = v18;
        v39.size.width = v19;
        v39.size.height = v20;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v37 = CGRectUnion(v36, v39);
        x = v37.origin.x;
        y = v37.origin.y;
        width = v37.size.width;
        height = v37.size.height;
        ++v16;
      }
      while (v14 != v16);
      v14 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }
LABEL_13:

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)highestAncestorGroup
{
  AXElementGroup *v2;
  void *v3;
  AXElementGroup *v4;
  AXElementGroup *v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    v4 = v2;
    do
    {
      v5 = v3;

      -[AXElementGroup parentGroup](v5, "parentGroup");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }
    while (v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isGroup
{
  return 1;
}

- (void)_generateGroupsIfNeeded
{
  NSArray **p_elementStore;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_elementStore = &self->_elementStore;
  if (!self->_elementStore)
  {
    -[AXElementGroup generator](self, "generator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AXElementGroup generator](self, "generator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[AXElementGroup generator](self, "generator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "willGenerateElements:", self);

      }
      -[AXElementGroup generator](self, "generator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generateElementsForGroup:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)p_elementStore, v9);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *p_elementStore;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "setParentGroup:", self, (_QWORD)v18);
          }
          while (v12 != v14);
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      -[AXElementGroup generator](self, "generator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[AXElementGroup generator](self, "generator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "didGenerateElements:", self);

      }
    }
  }
}

- (id)firstChild
{
  return -[AXElementGroup objectAtIndex:](self, "objectAtIndex:", 0);
}

- (id)_siblingOfChild:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  _BOOL4 v6;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;

  v6 = a4;
  v8 = -[AXElementGroup indexOfObject:](self, "indexOfObject:", a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    v10 = 0;
    if (!a5)
      return v10;
    goto LABEL_16;
  }
  v11 = v8;
  v12 = -[AXElementGroup count](self, "count");
  v13 = v11 - 1;
  if (!v11)
    v13 = v12 - 1;
  if (v11 + 1 == v12)
    v14 = 0;
  else
    v14 = v11 + 1;
  v15 = !v6;
  if (v6)
    v9 = v11 + 1 == v12;
  else
    v9 = v11 == 0;
  if (v15)
    v16 = v13;
  else
    v16 = v14;
  -[AXElementGroup objectAtIndex:](self, "objectAtIndex:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
LABEL_16:
    *a5 = v9;
  return v10;
}

- (id)nextSiblingOfChild:(id)a3 didWrap:(BOOL *)a4
{
  return -[AXElementGroup _siblingOfChild:inDirection:didWrap:](self, "_siblingOfChild:inDirection:didWrap:", a3, 1, a4);
}

- (id)previousSiblingOfChild:(id)a3 didWrap:(BOOL *)a4
{
  return -[AXElementGroup _siblingOfChild:inDirection:didWrap:](self, "_siblingOfChild:inDirection:didWrap:", a3, 0, a4);
}

- (id)firstChildMatchingItem:(id)a3
{
  id v4;
  AXElementGroup *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self;
    v6 = (id)-[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10) & 1) != 0)
          {
            v6 = v4;
            goto LABEL_12;
          }
        }
        v6 = (id)-[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firstChildPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  AXElementGroup *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self;
    v6 = (id)-[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((v4[2](v4, v9) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)childrenPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  AXElementGroup *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self;
    v7 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v11))
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
        }
        v8 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v12 = v5;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)firstDescendantMatchingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    while (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);
      if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
        goto LABEL_10;
      if (objc_msgSend(v7, "isGroup"))
        objc_msgSend(v6, "addObjectsFromArray:", v7);

      v5 = v6;
    }
    v7 = 0;
LABEL_10:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)firstDescendantPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;

  v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    while (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);
      if ((v4[2](v4, v7) & 1) != 0)
        goto LABEL_10;
      if (objc_msgSend(v7, "isGroup"))
        objc_msgSend(v6, "addObjectsFromArray:", v7);

      v5 = v6;
    }
    v7 = 0;
LABEL_10:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)descendantsPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (unsigned int (**)(id, void *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    while (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);
      if (v4[2](v4, v8))
        objc_msgSend(v5, "addObject:", v8);
      if (objc_msgSend(v8, "isGroup"))
        objc_msgSend(v7, "addObjectsFromArray:", v8);

      v6 = v7;
    }
    if (objc_msgSend(v5, "count"))
      v9 = v5;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)ancestorPassingTest:(id)a3
{
  uint64_t (**v4)(id, AXElementGroup *);
  AXElementGroup *v5;
  uint64_t v6;

  v4 = (uint64_t (**)(id, AXElementGroup *))a3;
  if (v4)
  {
    v5 = self;
    if (v5)
    {
      do
      {
        if ((v4[2](v4, v5) & 1) != 0)
          break;
        -[AXElementGroup parentGroup](v5, "parentGroup");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (AXElementGroup *)v6;
      }
      while (v6);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)firstLeafDescendant
{
  return -[AXElementGroup firstDescendantPassingTest:](self, "firstDescendantPassingTest:", &__block_literal_global_14);
}

uint64_t __37__AXElementGroup_firstLeafDescendant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isGroup") ^ 1;
}

- (void)enumerateLeafDescendantsUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  AXElementGroup *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self;
  v6 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isGroup", (_QWORD)v11))
          objc_msgSend(v10, "enumerateLeafDescendantsUsingBlock:", v4);
        else
          v4[2](v4, v10);
      }
      v7 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)keyboardContainerRows
{
  void *v3;
  id v4;

  if (-[AXElementGroup isKeyboardContainer](self, "isKeyboardContainer"))
  {
    -[AXElementGroup childrenPassingTest:](self, "childrenPassingTest:", &__block_literal_global_15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __39__AXElementGroup_keyboardContainerRows__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isGroup"))
    v3 = objc_msgSend(v2, "isKeyboardRow");
  else
    v3 = 0;

  return v3;
}

- (id)keyboardRow
{
  return -[AXElementGroup ancestorPassingTest:](self, "ancestorPassingTest:", &__block_literal_global_17);
}

uint64_t __29__AXElementGroup_keyboardRow__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isKeyboardRow");
}

- (id)keyboardContainer
{
  return -[AXElementGroup ancestorPassingTest:](self, "ancestorPassingTest:", &__block_literal_global_18);
}

uint64_t __35__AXElementGroup_keyboardContainer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isKeyboardContainer");
}

- (BOOL)isKeyboardContainer
{
  return -[AXElementGroup groupTraits](self, "groupTraits") & 1;
}

- (BOOL)isKeyboardRow
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") >> 1) & 1;
}

- (BOOL)canBeGroupedWithOtherGroupables
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") & 0x43) == 0;
}

- (BOOL)canBeReplacedByChildren
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") & 0x113) == 0;
}

- (BOOL)allowsChangingExistingGroupingOfContents
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") & 0x22) == 0;
}

- (BOOL)shouldBeUngrouped
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") >> 7) & 1;
}

- (BOOL)allowsVisualGroupingOfChildren
{
  return (-[AXElementGroup groupTraits](self, "groupTraits") & 0x180) == 0;
}

- (unint64_t)numberOfElements
{
  AXElementGroup *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self;
  v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isGroup", (_QWORD)v11))
          v9 = objc_msgSend(v8, "numberOfElements");
        else
          v9 = 1;
        v5 += v9;
      }
      v4 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)descendantWithNativeFocus
{
  return -[AXElementGroup firstDescendantPassingTest:](self, "firstDescendantPassingTest:", &__block_literal_global_19);
}

uint64_t __43__AXElementGroup_descendantWithNativeFocus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isNativeFocused");
  else
    v3 = 0;

  return v3;
}

- (BOOL)containsNativeFocusElement
{
  void *v2;
  BOOL v3;

  -[AXElementGroup descendantWithNativeFocus](self, "descendantWithNativeFocus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_leafAXElementWithPosition:(int64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AXElementGroup__leafAXElementWithPosition___block_invoke;
  v5[3] = &unk_1E691A268;
  v5[4] = &v6;
  v5[5] = a3;
  -[AXElementGroup enumerateLeafDescendantsUsingBlock:](self, "enumerateLeafDescendantsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__AXElementGroup__leafAXElementWithPosition___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  id v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v12 = v4;
  if (v7)
  {
    switch(*(_QWORD *)(a1 + 40))
    {
      case 0:
        objc_msgSend(v4, "frame");
        MinY = CGRectGetMinY(v13);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "frame");
        MinX = CGRectGetMinY(v14);
        goto LABEL_6;
      case 1:
        objc_msgSend(v4, "frame");
        MaxY = CGRectGetMaxY(v15);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "frame");
        MaxX = CGRectGetMaxY(v16);
        goto LABEL_9;
      case 2:
        objc_msgSend(v4, "frame");
        MinY = CGRectGetMinX(v17);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "frame");
        MinX = CGRectGetMinX(v18);
LABEL_6:
        v4 = v12;
        if (MinY >= MinX)
          goto LABEL_12;
        goto LABEL_10;
      case 3:
        objc_msgSend(v4, "frame");
        MaxY = CGRectGetMaxX(v19);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "frame");
        MaxX = CGRectGetMaxX(v20);
LABEL_9:
        v4 = v12;
        if (MaxY <= MaxX)
          goto LABEL_12;
LABEL_10:
        v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        break;
      default:
        goto LABEL_12;
    }
  }
  objc_storeStrong(v6, a2);
  v4 = v12;
LABEL_12:

}

- (id)leftMostLeafAXElement
{
  return -[AXElementGroup _leafAXElementWithPosition:](self, "_leafAXElementWithPosition:", 2);
}

- (id)rightMostLeafAXElement
{
  return -[AXElementGroup _leafAXElementWithPosition:](self, "_leafAXElementWithPosition:", 3);
}

- (id)topMostLeafAXElement
{
  return -[AXElementGroup _leafAXElementWithPosition:](self, "_leafAXElementWithPosition:", 0);
}

- (id)bottomMostLeafAXElement
{
  return -[AXElementGroup _leafAXElementWithPosition:](self, "_leafAXElementWithPosition:", 1);
}

- (void)registerGroupObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXElementGroup groupObservers](self, "groupObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterGroupObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXElementGroup groupObservers](self, "groupObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)unregisterAllGroupObservers
{
  id v2;

  -[AXElementGroup groupObservers](self, "groupObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_notifyGroupObserversWillTransferStateToGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXElementGroup groupObservers](self, "groupObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "group:willTransferStateToGroup:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyGroupObserversDidTransferStateToGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXElementGroup groupObservers](self, "groupObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "group:didTransferStateToGroup:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_debugDescriptionForScanningBehaviorTraits
{
  void *v3;
  char v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("ScanAttrs:["));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AXElementGroup userDefinedScanningBehaviorTraits](self, "userDefinedScanningBehaviorTraits") & 0x10) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" (delegated)"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_9;
  v4 = -[AXElementGroup scatScanningBehaviorTraits](self, "scatScanningBehaviorTraits");
  v5 = v4;
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" include-v-scroll-group"));
    if ((v5 & 1) == 0)
    {
LABEL_6:
      if ((v5 & 8) == 0)
        goto LABEL_7;
LABEL_12:
      objc_msgSend(v3, "appendString:", CFSTR(" include-v-scroll-top"));
      if ((v5 & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(v3, "appendString:", CFSTR(" include-h-scroll-group"));
  if ((v5 & 8) != 0)
    goto LABEL_12;
LABEL_7:
  if ((v5 & 4) != 0)
LABEL_8:
    objc_msgSend(v3, "appendString:", CFSTR(" include-h-scroll-top"));
LABEL_9:
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (id)_debugDescriptionForTraits
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 1) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Keyboard> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 2) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Keyboard Row> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 0x20) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Fixed Subgroups> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 0x40) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Resists Being Grouped> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 0x10) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Unsplittable> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 0x100) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Grouped> "));
  if ((-[AXElementGroup groupTraits](self, "groupTraits") & 0x80) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" <Ungrouped> "));
  return v3;
}

- (id)_debugBriefDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXElementGroup count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXElementGroup<%p>. %@ items. Identifier: %@."), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementGroup _debugDescriptionForTraits](self, "_debugDescriptionForTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  -[AXElementGroup _debugDescriptionForScanningBehaviorTraits](self, "_debugDescriptionForScanningBehaviorTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v8);

  return v6;
}

- (id)debugFullDescription
{
  return -[AXElementGroup _debugFullDescriptionWithIndent:](self, "_debugFullDescriptionWithIndent:", &stru_1E691BCF0);
}

- (id)_debugFullDescriptionWithIndent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AXElementGroup *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXElementGroup count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGroup label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGroup identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("AXElementGroup<%p>. %@ items. Label: %@. Identifier: %@."), self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AXElementGroup count](self, "count"))
  {
    -[AXElementGroup _debugDescriptionForTraits](self, "_debugDescriptionForTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    -[AXElementGroup _debugDescriptionForScanningBehaviorTraits](self, "_debugDescriptionForScanningBehaviorTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v11);

    objc_msgSend(v9, "appendFormat:", CFSTR(" Children:\n"));
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = self;
    v14 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "_debugFullDescriptionWithIndent:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendFormat:", CFSTR("%@%@\n"), v12, v19);

          }
          else
          {
            objc_msgSend(v9, "appendFormat:", CFSTR("%@%@\n"), v12, v18);
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = -[AXElementGroup countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
  else
  {
    v12 = v4;
  }

  return v9;
}

- (AXElementGroupGenerator)generator
{
  return (AXElementGroupGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (void)setGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_generator, a3);
}

- (unint64_t)groupTraits
{
  return self->_groupTraits;
}

- (void)setGroupTraits:(unint64_t)a3
{
  self->_groupTraits = a3;
}

- (unint64_t)userDefinedScanningBehaviorTraits
{
  return self->_userDefinedScanningBehaviorTraits;
}

- (void)setUserDefinedScanningBehaviorTraits:(unint64_t)a3
{
  self->_userDefinedScanningBehaviorTraits = a3;
}

- (BOOL)isRootGroup
{
  return self->_rootGroup;
}

- (void)setRootGroup:(BOOL)a3
{
  self->_rootGroup = a3;
}

- (NSHashTable)groupObservers
{
  return self->_groupObservers;
}

- (void)setGroupObservers:(id)a3
{
  objc_storeStrong((id *)&self->_groupObservers, a3);
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

- (AXElement)elementCommunity
{
  return self->_elementCommunity;
}

- (void)setElementCommunity:(id)a3
{
  objc_storeStrong((id *)&self->_elementCommunity, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_elementCommunity, 0);
  objc_storeStrong((id *)&self->_groupObservers, 0);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_elementStore, 0);
}

@end
