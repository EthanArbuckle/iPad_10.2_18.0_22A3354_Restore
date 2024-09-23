@implementation NSFileAccessNode

- (id)itemProvider
{
  NSFileProviderProxy *provider;

  if (!self)
    return 0;
  while (1)
  {
    provider = self->_provider;
    if (provider)
      break;
    self = self->_parent;
    if (!self)
      return 0;
  }
  return provider;
}

- (id)descendantForFileURL:(id)a3
{
  NSFileAccessNode *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  int v19;
  id v20;
  uint64_t v21;

  v4 = self;
  v21 = *MEMORY[0x1E0C80C00];
  if (!-[NSString isEqualToString:](self->_normalizedName, "isEqualToString:", CFSTR("/")))
  {
    NSLog((NSString *)CFSTR("[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way."));
    return 0;
  }
  if (!objc_msgSend(a3, "isFileURL"))
  {
    v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138477827;
      v20 = a3;
      v17 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_27:
      _os_log_impl(&dword_1817D9000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }
    return 0;
  }
  v5 = (void *)_canonicalStringRepresentation(objc_msgSend(a3, "path"));
  if (!v5)
  {
    v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138477827;
      v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }
    return 0;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "length");
  if (!v7 || (v8 = v7, objc_msgSend(v6, "characterAtIndex:", 0) != 47))
  {
    v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138477827;
      v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return relative or empty paths when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }
    return 0;
  }
  v9 = v8 - 1;
  if (v8 != 1)
  {
    v10 = 1;
    while (1)
    {
      if (v4->_symbolicLinkDestination)
        v4 = v4->_symbolicLinkDestination;
      v11 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("/"), 0, v10, v9);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v13 = v11;
      v14 = v12;
      if (v11 != v10)
        v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v11 - v10, v6);
      v10 = v13 + v14;
      v9 = v8 - (v13 + v14);
      if (v4)
        v15 = v8 == v13 + v14;
      else
        v15 = 1;
      if (v15)
      {
        if (v4)
          goto LABEL_31;
        return v4;
      }
    }
    v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v9, v6);
    if (!v4)
      return v4;
  }
LABEL_31:
  if (v4->_symbolicLinkIsFirmlink)
    return v4->_symbolicLinkDestination;
  return v4;
}

- (id)childForRange:(_NSRange)a3 ofPath:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *lastRequestedChildName;
  void *v9;
  id v10;
  NSFileAccessNode *v11;

  length = a3.length;
  location = a3.location;
  if (a3.length == 2)
  {
    if (objc_msgSend(a4, "characterAtIndex:", a3.location) == 46
      && objc_msgSend(a4, "characterAtIndex:", location + 1) == 46)
    {
      return self->_parent;
    }
  }
  else if (a3.length == 1 && objc_msgSend(a4, "characterAtIndex:", a3.location) == 46)
  {
    return self;
  }
  lastRequestedChildName = self->_lastRequestedChildName;
  if (lastRequestedChildName
    && !objc_msgSend(a4, "compare:options:range:", lastRequestedChildName, 2, location, length))
  {
    return self->_lastRequestedChild;
  }
  v9 = (void *)objc_msgSend(a4, "substringWithRange:", location, length);
  v10 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", v9);
  v11 = (NSFileAccessNode *)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", v10);
  if (!v11)
  {
    v11 = -[NSFileAccessNode initWithParent:name:normalizedName:]([NSFileAccessNode alloc], "initWithParent:name:normalizedName:", self, v9, v10);
    -[NSFileAccessNode setChild:forName:normalizedName:](self, "setChild:forName:normalizedName:", v11, v9, v11->_normalizedName);

  }
  self->_lastRequestedChildName = (NSString *)v9;

  self->_lastRequestedChild = v11;
  return v11;
}

- (id)normalizationOfChildName:(id)a3
{
  return a3;
}

- (void)setChild:(id)a3 forName:(id)a4 normalizedName:(id)a5
{
  NSMutableDictionary *childrenByNormalizedName;
  _QWORD *v9;
  BOOL v10;

  childrenByNormalizedName = self->_childrenByNormalizedName;
  if (childrenByNormalizedName)
  {
    v9 = (_QWORD *)-[NSMutableDictionary objectForKey:](childrenByNormalizedName, "objectForKey:", a5, a4);
    if (v9)
      v10 = v9 == a3;
    else
      v10 = 1;
    if (!v10)
      v9[1] = 0;
  }
  else
  {
    self->_childrenByNormalizedName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  -[NSMutableDictionary setObject:forKey:](self->_childrenByNormalizedName, "setObject:forKey:", a3, a5);

  self->_lastRequestedChildName = 0;
  self->_lastRequestedChild = 0;
}

- (NSFileAccessNode)initWithParent:(id)a3 name:(id)a4 normalizedName:(id)a5
{
  NSFileAccessNode *v8;
  NSFileAccessNode *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSFileAccessNode;
  v8 = -[NSFileAccessNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_parent = (NSFileAccessNode *)a3;
    v8->_name = (NSString *)objc_msgSend(a4, "copy");
    v9->_normalizedName = (NSString *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)addAccessClaim:(id)a3
{
  id accessClaimOrClaims;

  if (self->_accessClaimOrClaims)
  {
    if (_NSIsNSSet())
    {
      objc_msgSend(self->_accessClaimOrClaims, "addObject:", a3);
    }
    else
    {
      accessClaimOrClaims = self->_accessClaimOrClaims;
      self->_accessClaimOrClaims = -[NSCountedSet initWithObjects:]([NSCountedSet alloc], "initWithObjects:", accessClaimOrClaims, a3, 0);

    }
  }
  else
  {
    self->_accessClaimOrClaims = a3;
  }
}

- (void)forEachPresenterOfItemPerformProcedure:(id)a3
{
  id presenterOrPresenters;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_NSIsNSSet())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    presenterOrPresenters = self->_presenterOrPresenters;
    v6 = objc_msgSend(presenterOrPresenters, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(presenterOrPresenters);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(presenterOrPresenters, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
  else if (self->_presenterOrPresenters)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)forEachRelevantAccessClaimForEvaluatingAgainstClaim:(id)a3 performProcedure:(id)a4
{
  -[NSFileAccessNode _forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:performProcedure:](self, "_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:performProcedure:", objc_msgSend(a3, "cameFromSuperarbiter"), a4);
}

- (void)removeSelfIfUseless
{
  if (!self->_symbolicLinkDestination
    && !self->_symbolicLinkReferenceCount
    && !-[NSMutableDictionary count](self->_childrenByNormalizedName, "count")
    && !self->_presenterOrPresenters
    && !self->_provider
    && !self->_accessClaimOrClaims
    && !self->_isArbitrationBoundary
    && !self->_progressPublisherOrPublishers
    && !self->_progressSubscriberOrSubscribers)
  {
    -[NSFileAccessNode removeChildForNormalizedName:](self->_parent, "removeChildForNormalizedName:", self->_normalizedName);
  }
}

- (void)removeChildForNormalizedName:(id)a3
{
  uint64_t v5;

  v5 = -[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:");
  if (v5)
  {
    if (*(NSFileAccessNode **)(v5 + 8) == self)
      *(_QWORD *)(v5 + 8) = 0;
    -[NSMutableDictionary removeObjectForKey:](self->_childrenByNormalizedName, "removeObjectForKey:", a3);
  }

  self->_lastRequestedChildName = 0;
  self->_lastRequestedChild = 0;
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessNode;
  -[NSFileAccessNode dealloc](&v3, sel_dealloc);
}

- (void)removeAccessClaim:(id)a3
{
  id accessClaimOrClaims;

  accessClaimOrClaims = a3;
  if (self->_accessClaimOrClaims == a3)
    goto LABEL_5;
  if (_NSIsNSSet())
  {
    objc_msgSend(self->_accessClaimOrClaims, "removeObject:", accessClaimOrClaims);
    if (!objc_msgSend(self->_accessClaimOrClaims, "count"))
    {
      accessClaimOrClaims = self->_accessClaimOrClaims;
LABEL_5:

      self->_accessClaimOrClaims = 0;
    }
  }
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)forEachRelevantAccessClaimPerformProcedure:(id)a3
{
  -[NSFileAccessNode _forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:performProcedure:](self, "_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:performProcedure:", 0, a3);
}

- (void)forEachPresenterOfContainedItemPerformProcedure:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke;
  v3[3] = &unk_1E0F54B80;
  v3[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v3);
}

- (void)_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:(BOOL)a3 performProcedure:(id)a4
{
  NSFileAccessNode *v6;
  NSFileAccessNode *v7;
  NSFileAccessNode *parent;
  uint64_t i;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;
  uint64_t v14;

  v6 = self;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = -[NSFileAccessNode biggestFilePackageLocation](self->_parent, "biggestFilePackageLocation");
  if (v7)
    v6 = v7;
  parent = v6->_parent;
  for (i = MEMORY[0x1E0C809B0]; parent; parent = parent->_parent)
  {
    v12[0] = i;
    v12[1] = 3221225472;
    v12[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke;
    v12[3] = &unk_1E0F54B30;
    v13 = a3;
    v12[4] = a4;
    -[NSFileAccessNode forEachAccessClaimOnItemPerformProcedure:](parent, "forEachAccessClaimOnItemPerformProcedure:", v12);
  }
  v10[0] = i;
  v10[1] = 3221225472;
  v10[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2;
  v10[3] = &unk_1E0F54B58;
  v11 = a3;
  v10[4] = a4;
  -[NSFileAccessNode forEachAccessClaimOnItemOrContainedItemPerformProcedure:](v6, "forEachAccessClaimOnItemOrContainedItemPerformProcedure:", v10);
}

- (void)forEachAccessClaimOnItemPerformProcedure:(id)a3
{
  id accessClaimOrClaims;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_NSIsNSSet())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    accessClaimOrClaims = self->_accessClaimOrClaims;
    v6 = objc_msgSend(accessClaimOrClaims, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(accessClaimOrClaims);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(accessClaimOrClaims, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
  else if (self->_accessClaimOrClaims)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)forEachAccessClaimOnItemOrContainedItemPerformProcedure:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke;
  v7[3] = &unk_1E0F54BD0;
  v7[4] = self;
  v7[5] = a3;
  -[NSFileAccessNode forEachAccessClaimOnItemPerformProcedure:](self, "forEachAccessClaimOnItemPerformProcedure:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2;
  v6[3] = &unk_1E0F54B80;
  v6[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v6);
}

- (void)forEachDescendantPerformProcedure:(id)a3
{
  NSMutableDictionary *childrenByNormalizedName;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(childrenByNormalizedName);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        objc_msgSend(v10, "forEachDescendantPerformProcedure:", a3);
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = objc_msgSend(a2, "cameFromSuperarbiter");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)forEachPresenterOfContainingFilePackagePerformProcedure:(id)a3
{
  NSFileAccessNode *parent;
  uint64_t v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  parent = self->_parent;
  if (parent)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      if (-[NSFileAccessNode itemIsFilePackage](parent, "itemIsFilePackage"))
      {
        v6[0] = v5;
        v6[1] = 3221225472;
        v6[2] = __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke;
        v6[3] = &unk_1E0F54BA8;
        v6[4] = parent;
        v6[5] = a3;
        -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](parent, "forEachPresenterOfItemPerformProcedure:", v6);
      }
      parent = parent->_parent;
    }
    while (parent);
  }
}

- (id)biggestFilePackageLocation
{
  NSFileAccessNode *v2;
  NSFileAccessNode *v3;

  if (!self)
    return 0;
  v2 = self;
  v3 = 0;
  do
  {
    if (-[NSFileAccessNode itemIsFilePackage](v2, "itemIsFilePackage"))
      v3 = v2;
    v2 = v2->_parent;
  }
  while (v2);
  return v3;
}

- (BOOL)itemIsFilePackage
{
  NSString *v3;
  NSFileAccessNode *parent;
  NSFileAccessNode *v5;
  uint64_t v6;
  const void *v7;

  if (!self->_isFilePackageIsFigured)
  {
    v3 = -[NSString pathExtension](self->_name, "pathExtension");
    if (-[NSString rangeOfString:options:](v3, "rangeOfString:options:", CFSTR("weakpkg"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_isFilePackage = 0;
      parent = self->_parent;
      if (!parent
        || !-[NSString isEqualToString:](parent->_normalizedName, "isEqualToString:", CFSTR("volumes"))
        || (v5 = self->_parent->_parent) == 0
        || !-[NSString isEqualToString:](v5->_normalizedName, "isEqualToString:", CFSTR("/")))
      {
        if (-[NSString length](v3, "length"))
        {
          if (qword_1ECD0A7E0 != -1)
            dispatch_once(&qword_1ECD0A7E0, &__block_literal_global_78);
          v6 = _MergedGlobals_149(qword_1ECD0A7D0, v3, 0);
          if (v6)
          {
            v7 = (const void *)v6;
            self->_isFilePackage = off_1ECD0A7C8(v6, qword_1ECD0A7D8) != 0;
            CFRelease(v7);
          }
        }
      }
    }
    else
    {
      self->_isFilePackage = 1;
    }
    self->_isFilePackageIsFigured = 1;
  }
  return self->_isFilePackage;
}

- (id)url
{
  NSString *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", -[NSFileAccessNode pathFromAncestor:](self, "pathFromAncestor:", 0));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  if (!v3)
  {
    v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode url] is returning nil.", v6, 2u);
    }
  }
  return v3;
}

- (id)pathFromAncestor:(id)a3
{
  NSFileAccessNode *parent;

  if (self == a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  parent = self->_parent;
  if (parent)
    return (id)objc_msgSend(-[NSFileAccessNode pathFromAncestor:](parent, "pathFromAncestor:"), "arrayByAddingObject:", self->_name);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_name);
}

- (void)addPresenter:(id)a3
{
  id presenterOrPresenters;

  if (self->_presenterOrPresenters)
  {
    if (_NSIsNSSet())
    {
      objc_msgSend(self->_presenterOrPresenters, "addObject:", a3);
    }
    else
    {
      presenterOrPresenters = self->_presenterOrPresenters;
      self->_presenterOrPresenters = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", presenterOrPresenters, a3, 0);

    }
  }
  else
  {
    self->_presenterOrPresenters = a3;
  }
}

- (id)parent
{
  return self->_parent;
}

- (void)forEachProgressPublisherOfItemPerformProcedure:(id)a3
{
  id progressPublisherOrPublishers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_NSIsNSSet())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
    v6 = objc_msgSend(progressPublisherOrPublishers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(progressPublisherOrPublishers);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(progressPublisherOrPublishers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
  else if (self->_progressPublisherOrPublishers)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeProgressSubscriber:(id)a3
{
  id progressSubscriberOrSubscribers;

  progressSubscriberOrSubscribers = a3;
  if (self->_progressSubscriberOrSubscribers == a3)
    goto LABEL_5;
  if (_NSIsNSSet())
  {
    objc_msgSend(self->_progressSubscriberOrSubscribers, "removeObject:", progressSubscriberOrSubscribers);
    if (!objc_msgSend(self->_progressSubscriberOrSubscribers, "count"))
    {
      progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
LABEL_5:

      self->_progressSubscriberOrSubscribers = 0;
    }
  }
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)forEachProgressSubscriberOfItemPerformProcedure:(id)a3
{
  void *v5;
  id progressSubscriberOrSubscribers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x186DA8F78](self, a2);
  if (_NSIsNSSet())
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
    v7 = objc_msgSend(progressSubscriberOrSubscribers, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(progressSubscriberOrSubscribers);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(progressSubscriberOrSubscribers, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      }
      while (v8);
    }
  }
  else if (self->_progressSubscriberOrSubscribers)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:(id)a3
{
  uint64_t v5;
  NSFileAccessNode *parent;
  _QWORD v7[5];
  _QWORD v8[6];

  v5 = MEMORY[0x1E0C809B0];
  v8[5] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke;
  v8[3] = &unk_1E0F54BF8;
  v8[4] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:](self, "forEachProgressSubscriberOfItemPerformProcedure:", v8);
  parent = self->_parent;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2;
  v7[3] = &unk_1E0F54BF8;
  v7[4] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:](parent, "forEachProgressSubscriberOfItemPerformProcedure:", v7);
}

- (void)forEachProgressPublisherOfItemOrContainedItemPerformProcedure:(id)a3
{
  NSMutableDictionary *childrenByNormalizedName;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSFileAccessNode forEachProgressPublisherOfItemPerformProcedure:](self, "forEachProgressPublisherOfItemPerformProcedure:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(childrenByNormalizedName);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)), "forEachProgressPublisherOfItemPerformProcedure:", a3);
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (void)addProgressSubscriber:(id)a3
{
  id progressSubscriberOrSubscribers;

  if (self->_progressSubscriberOrSubscribers)
  {
    if (_NSIsNSSet())
    {
      objc_msgSend(self->_progressSubscriberOrSubscribers, "addObject:", a3);
    }
    else
    {
      progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      self->_progressSubscriberOrSubscribers = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", progressSubscriberOrSubscribers, a3, 0);

    }
  }
  else
  {
    self->_progressSubscriberOrSubscribers = a3;
  }
}

- (void)_setLinkDestination:(id)a3
{
  NSFileAccessNode *symbolicLinkDestination;
  NSFileAccessNode *v5;
  NSFileAccessNode *v6;

  symbolicLinkDestination = self->_symbolicLinkDestination;
  if (symbolicLinkDestination != a3)
  {
    if (symbolicLinkDestination)
      --symbolicLinkDestination->_symbolicLinkReferenceCount;
    v6 = symbolicLinkDestination;
    if (a3)
    {
      v5 = (NSFileAccessNode *)a3;
      self->_symbolicLinkDestination = v5;
      ++v5->_symbolicLinkReferenceCount;
    }
    else
    {
      self->_symbolicLinkDestination = 0;
      -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
    }
    -[NSFileAccessNode removeSelfIfUseless](v6, "removeSelfIfUseless");

  }
}

- (void)setSymbolicLinkDestination:(id)a3
{
  -[NSFileAccessNode _setLinkDestination:](self, "_setLinkDestination:", a3);
  self->_symbolicLinkIsFirmlink = 0;
}

- (void)setFirmlinkDestination:(id)a3
{
  -[NSFileAccessNode setSymbolicLinkDestination:](self, "setSymbolicLinkDestination:");
  self->_symbolicLinkIsFirmlink = a3 != 0;
}

- (id)pathToDescendantForFileURL:(id)a3 componentRange:(_NSRange *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSString isEqualToString:](self->_normalizedName, "isEqualToString:", CFSTR("/")))
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way.", (uint8_t *)&v14, 2u);
    }
    return 0;
  }
  if (!objc_msgSend(a3, "isFileURL"))
  {
    v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138477827;
      v15 = a3;
      v12 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_15:
      _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents");
  if (!v6)
  {
    v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138477827;
      v15 = a3;
      v12 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_15;
    }
    return 0;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "count");
  if (!v8
    || (v9 = v8, !objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", CFSTR("/"))))
  {
    v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138477827;
      v15 = a3;
      v12 = "NSFileCoordinator does not handle NSURLs that return relative paths when sent -path, like this one:\n"
            "%{private}@";
      goto LABEL_15;
    }
    return 0;
  }
  a4->location = 1;
  a4->length = v9 - 1;
  return v7;
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 create:(BOOL)a5
{
  return -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self, "descendantAtPath:componentRange:forAddingLeafNode:create:", a3, a4.location, a4.length, 0, a5);
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 forAddingLeafNode:(id)a5 create:(BOOL)a6
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSFileAccessNode *v15;
  id v16;

  if (!a4.length)
    goto LABEL_13;
  v7 = a6;
  length = a4.length;
  location = a4.location;
  v12 = _canonicalStringRepresentation(objc_msgSend(a3, "objectAtIndex:", a4.location));
  v13 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", v12);
  v14 = -[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", v13);
  if (v14)
  {
    if (*(_QWORD *)(v14 + 32))
      v15 = *(NSFileAccessNode **)(v14 + 32);
    else
      v15 = (NSFileAccessNode *)v14;
    if (v15 != a5)
      goto LABEL_9;
    v16 = a5;
  }
  v15 = 0;
LABEL_9:
  if (!v15 && v7)
  {
    v15 = -[NSFileAccessNode initWithParent:name:normalizedName:]([NSFileAccessNode alloc], "initWithParent:name:normalizedName:", self, v12, v13);
    -[NSFileAccessNode setChild:forName:normalizedName:](self, "setChild:forName:normalizedName:", v15, v12, v15->_normalizedName);

  }
  self = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](v15, "descendantAtPath:componentRange:forAddingLeafNode:create:", a3, location + 1, length - 1, a5, v7);
LABEL_13:
  if (self && self->_symbolicLinkIsFirmlink)
    self = self->_symbolicLinkDestination;
  return self;
}

- (void)setParent:(id)a3 name:(id)a4
{
  id v7;
  NSString *name;

  v7 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", a4);
  objc_msgSend(a3, "setChild:forName:normalizedName:", self, a4, v7);
  -[NSFileAccessNode removeChildForNormalizedName:](self->_parent, "removeChildForNormalizedName:", self->_normalizedName);
  name = self->_name;
  if (name != a4)
  {

    self->_name = (NSString *)objc_msgSend(a4, "copy");
    self->_normalizedName = (NSString *)v7;
    self->_isFilePackageIsFigured = 0;
  }
  self->_parent = (NSFileAccessNode *)a3;
}

void __37__NSFileAccessNode_itemIsFilePackage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  BOOL v3;

  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_149 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v0, "UTTypeCreatePreferredIdentifierForTag");
    off_1ECD0A7C8 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "UTTypeConformsTo");
    qword_1ECD0A7D0 = *(_QWORD *)dlsym(v1, "kUTTagClassFilenameExtension");
    v2 = *(_QWORD *)dlsym(v1, "kUTTypePackage");
    qword_1ECD0A7D8 = v2;
    if (_MergedGlobals_149)
      v3 = off_1ECD0A7C8 == 0;
    else
      v3 = 1;
    if (v3 || qword_1ECD0A7D0 == 0 || v2 == 0)
      NSLog((NSString *)CFSTR("[NSFileAccessNode itemIsFilePackage] couldn't load a MobileCoreServices symbol."));
  }
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = objc_msgSend(a2, "cameFromSuperarbiter");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (void)forEachReactorToItemOrContainedItemPerformProcedure:(id)a3
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (self->_provider)
    (*((void (**)(id))a3 + 2))(a3);
  -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](self, "forEachPresenterOfItemPerformProcedure:", a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke;
  v5[3] = &unk_1E0F54B80;
  v5[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v5);
}

uint64_t __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, _QWORD *a2)
{
  if (a2[8])
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(a2, "forEachPresenterOfItemPerformProcedure:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2;
  v3[3] = &unk_1E0F53360;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "forEachPresenterOfItemPerformProcedure:", v3);
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forEachPresenterOfItemOrContainedItemPerformProcedure:(id)a3
{
  -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](self, "forEachPresenterOfItemPerformProcedure:");
  -[NSFileAccessNode forEachPresenterOfContainedItemPerformProcedure:](self, "forEachPresenterOfContainedItemPerformProcedure:", a3);
}

- (void)forEachPresenterOfItemOrContainingItemPerformProcedure:(id)a3
{
  NSFileAccessNode *v4;
  uint64_t v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = self;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_1E0F54BA8;
      v6[4] = v4;
      v6[5] = a3;
      -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](v4, "forEachPresenterOfItemPerformProcedure:", v6);
      v4 = v4->_parent;
    }
    while (v4);
  }
}

uint64_t __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)forEachPresenterOfContainingItemPerformProcedure:(id)a3
{
  NSFileAccessNode *parent;
  uint64_t v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  parent = self->_parent;
  if (parent)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_1E0F53360;
      v6[4] = a3;
      -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](parent, "forEachPresenterOfItemPerformProcedure:", v6);
      parent = parent->_parent;
    }
    while (parent);
  }
}

uint64_t __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3;
  v4[3] = &unk_1E0F54BD0;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return objc_msgSend(a2, "forEachAccessClaimOnItemPerformProcedure:", v4);
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)setArbitrationBoundary
{
  self->_isArbitrationBoundary = 1;
}

- (BOOL)itemIsSubarbitrable
{
  BOOL isArbitrationBoundary;

  if (!self)
    return 0;
  do
  {
    isArbitrationBoundary = self->_isArbitrationBoundary;
    if (self->_isArbitrationBoundary)
      break;
    self = self->_parent;
  }
  while (self);
  return isArbitrationBoundary;
}

- (BOOL)itemIsItemAtLocation:(id)a3
{
  id v4;

  if (a3 == self)
    goto LABEL_5;
  v4 = -[NSFileAccessNode biggestFilePackageLocation](self, "biggestFilePackageLocation");
  if (v4)
  {
    if (v4 != a3)
    {
      LOBYTE(v4) = objc_msgSend(a3, "itemIsInItemAtLocation:", v4);
      return (char)v4;
    }
LABEL_5:
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

- (BOOL)itemIsInItemAtLocation:(id)a3
{
  do
    self = self->_parent;
  while (self != a3 && self != 0);
  return self != 0;
}

- (void)removePresenter:(id)a3
{
  id presenterOrPresenters;

  presenterOrPresenters = a3;
  if (self->_presenterOrPresenters == a3)
    goto LABEL_5;
  if (_NSIsNSSet())
  {
    objc_msgSend(self->_presenterOrPresenters, "removeObject:", presenterOrPresenters);
    if (!objc_msgSend(self->_presenterOrPresenters, "count"))
    {
      presenterOrPresenters = self->_presenterOrPresenters;
LABEL_5:

      self->_presenterOrPresenters = 0;
    }
  }
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (BOOL)setProvider:(id)a3
{
  NSFileProviderProxy *provider;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessNode.m"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inProvider != nil"));
    goto LABEL_14;
  }
  provider = self->_provider;
  if (provider == a3)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  if (!provider
    || (v6 = -[NSFileProviderProxy secureID](provider, "secureID"),
        v7 = (void *)objc_msgSend(a3, "secureID"),
        (objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
    || (!v6 ? (v9 = v7 == 0) : (v9 = 1), !v9 || _NSFCIP))
  {
    -[NSFileProviderProxy setItemLocation:](self->_provider, "setItemLocation:", 0);

    self->_provider = (NSFileProviderProxy *)a3;
    v8 = 1;
  }
  else
  {
    v10 = _NSFCProviderLog();
    v8 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(-[NSFileReactorProxy client](self->_provider, "client"), "processIdentifier");
      *(_DWORD *)buf = 67109376;
      v14 = v11;
      v15 = 1024;
      v16 = objc_msgSend((id)objc_msgSend(a3, "client"), "processIdentifier");
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode setProvider:] was invoked for a node that already has a provider (pid %d). Ignoring the new one (pid %d).", buf, 0xEu);
      goto LABEL_14;
    }
  }
LABEL_15:
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
  return v8;
}

- (void)removeProvider:(id)a3
{
  if (self->_provider == a3)
  {

    self->_provider = 0;
  }
}

- (id)pathExceptPrivate
{
  _BOOL4 v3;
  NSFileAccessNode *parent;
  BOOL v5;

  if (!self->_parent)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_name);
  v3 = -[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("private"));
  parent = self->_parent;
  v5 = !v3 || parent == 0;
  if (v5 || parent->_parent)
    return (id)objc_msgSend(-[NSFileAccessNode pathExceptPrivate](parent, "pathExceptPrivate"), "arrayByAddingObject:", self->_name);
  else
    return -[NSFileAccessNode pathExceptPrivate](parent, "pathExceptPrivate");
}

- (id)standardizedURL
{
  NSString *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", -[NSFileAccessNode pathExceptPrivate](self, "pathExceptPrivate"));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  if (!v3)
  {
    v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode standardizedURL] is returning nil.", v6, 2u);
    }
  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (id)urlOfSubitemAtPath:(id)a3 plusPath:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = -[NSFileAccessNode pathFromAncestor:](self, "pathFromAncestor:", 0);
  v7 = v6;
  if (a3)
    v7 = (void *)objc_msgSend(v6, "arrayByAddingObjectsFromArray:", a3);
  if (a4)
    v7 = (void *)objc_msgSend(v7, "arrayByAddingObjectsFromArray:", a4);
  v8 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", v7);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  if (!v9)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode urlOfSubitemAtPath:plusPath:] is returning nil.", v12, 2u);
    }
  }
  return v9;
}

- (void)addProgressPublisher:(id)a3
{
  id progressPublisherOrPublishers;

  if (self->_progressPublisherOrPublishers)
  {
    if (_NSIsNSSet())
    {
      objc_msgSend(self->_progressPublisherOrPublishers, "addObject:", a3);
    }
    else
    {
      progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      self->_progressPublisherOrPublishers = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", progressPublisherOrPublishers, a3, 0);

    }
  }
  else
  {
    self->_progressPublisherOrPublishers = a3;
  }
}

- (void)removeProgressPublisher:(id)a3
{
  id progressPublisherOrPublishers;

  progressPublisherOrPublishers = a3;
  if (self->_progressPublisherOrPublishers == a3)
    goto LABEL_5;
  if (_NSIsNSSet())
  {
    objc_msgSend(self->_progressPublisherOrPublishers, "removeObject:", progressPublisherOrPublishers);
    if (!objc_msgSend(self->_progressPublisherOrPublishers, "count"))
    {
      progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
LABEL_5:

      self->_progressPublisherOrPublishers = 0;
    }
  }
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forEachProgressThingOfItemOrContainedItemPerformProcedure:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke;
  v8[3] = &unk_1E0F54C20;
  v8[4] = self;
  v8[5] = a3;
  -[NSFileAccessNode forEachProgressPublisherOfItemPerformProcedure:](self, "forEachProgressPublisherOfItemPerformProcedure:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2;
  v7[3] = &unk_1E0F54C48;
  v7[4] = self;
  v7[5] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:](self, "forEachProgressSubscriberOfItemPerformProcedure:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3;
  v6[3] = &unk_1E0F54B80;
  v6[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v6);
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4;
  v9[3] = &unk_1E0F54C20;
  v5 = *(_QWORD *)(a1 + 32);
  v9[4] = a2;
  v9[5] = v5;
  objc_msgSend(a2, "forEachProgressPublisherOfItemPerformProcedure:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5;
  v8[3] = &unk_1E0F54C48;
  v6 = *(_QWORD *)(a1 + 32);
  v8[4] = a2;
  v8[5] = v6;
  return objc_msgSend(a2, "forEachProgressSubscriberOfItemPerformProcedure:", v8);
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)assertDead
{
  NSFileAccessNode *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v2 = self;
    v3 = 0;
    do
    {
      v3 |= -[NSString isEqualToString:](v2->_normalizedName, "isEqualToString:", CFSTR("/"));
      v2 = v2->_parent;
    }
    while (v2);
    if ((v3 & 1) != 0)
    {
      v4 = _NSFCLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode assertDead] found a surprisingly live node.", v5, 2u);
      }
    }
  }
}

- (void)assertLive
{
  NSFileAccessNode *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self)
    goto LABEL_5;
  v2 = self;
  v3 = 0;
  do
  {
    v3 |= -[NSString isEqualToString:](v2->_normalizedName, "isEqualToString:", CFSTR("/"));
    v2 = v2->_parent;
  }
  while (v2);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "[NSFileAccessNode assertLive] found a surprisingly dead node.", v5, 2u);
    }
  }
}

- (void)assertDescendantsLive
{
  -[NSFileAccessNode assertLive](self->_lastRequestedChild, "assertLive");
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", &__block_literal_global_38_0);
}

uint64_t __41__NSFileAccessNode_assertDescendantsLive__block_invoke(uint64_t a1, id *a2)
{
  objc_msgSend(a2[12], "assertLive");
  return objc_msgSend(a2, "assertLive");
}

- (BOOL)_mayContainCriticalDebuggingInformationExcludingReactors:(BOOL)a3
{
  BOOL result;
  BOOL v6;

  if (self->_accessClaimOrClaims || self->_isArbitrationBoundary)
    return 1;
  v6 = -[NSFileAccessNode itemIsFilePackage](self, "itemIsFilePackage");
  result = !a3 || v6;
  if (!a3 && !v6)
  {
    if (!self->_presenterOrPresenters)
      return self->_provider != 0;
    return 1;
  }
  return result;
}

- (id)_childrenExcludingExcessNodes:(BOOL)a3 excludingReactors:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  NSMutableDictionary *childrenByNormalizedName;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(childrenByNormalizedName);
        v13 = (void *)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v14 = v13;
        if (v5 && !objc_msgSend(v13, "_mayContainCriticalDebuggingInformationExcludingReactors:", v4))
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v14, "_childrenExcludingExcessNodes:excludingReactors:", 1, v4));
        else
          objc_msgSend(v7, "addObject:", v14);
      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](childrenByNormalizedName, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v10);
  }
  return v7;
}

- (id)descriptionWithIndenting:(id)a3 excludingExcessNodes:(BOOL)a4 excludingReactors:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  NSString *v9;
  id presenterOrPresenters;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id accessClaimOrClaims;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id progressSubscriberOrSubscribers;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  id progressPublisherOrPublishers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  _BOOL4 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v5 = a5;
  v37 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "stringByAppendingString:", CFSTR("    "));
  v9 = +[NSString string](NSMutableString, "string");
  -[NSString appendFormat:](v9, "appendFormat:", CFSTR("%@<%@ %p> parent: %p, name: \"%@\"), a3, objc_opt_class(), self, self->_parent, self->_name);
  if (self->_symbolicLinkDestination)
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR(" (link target to node %p)"), self->_symbolicLinkDestination);
  if (self->_symbolicLinkReferenceCount)
    -[NSString appendString:](v9, "appendString:", CFSTR(" (a link destination)"));
  if (self->_isArbitrationBoundary)
    -[NSString appendString:](v9, "appendString:", CFSTR(" - an arbitration boundary"));
  if (self->_provider && !v5)
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@provider:"), a3);
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), -[NSFileReactorProxy descriptionWithIndenting:](self->_provider, "descriptionWithIndenting:", v8));
  }
  if (self->_presenterOrPresenters && !v5)
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@presenters:"), a3);
    if (_NSIsNSSet())
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      presenterOrPresenters = self->_presenterOrPresenters;
      v11 = objc_msgSend(presenterOrPresenters, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v60 != v13)
              objc_enumerationMutation(presenterOrPresenters);
            -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "descriptionWithIndenting:", v8));
          }
          v12 = objc_msgSend(presenterOrPresenters, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
        }
        while (v12);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(self->_presenterOrPresenters, "descriptionWithIndenting:", v8));
    }
  }
  if (self->_accessClaimOrClaims)
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@access claims:"), a3);
    if (_NSIsNSSet())
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      accessClaimOrClaims = self->_accessClaimOrClaims;
      v16 = objc_msgSend(accessClaimOrClaims, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(accessClaimOrClaims);
            -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "descriptionWithIndenting:", v8));
          }
          v17 = objc_msgSend(accessClaimOrClaims, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
        }
        while (v17);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(self->_accessClaimOrClaims, "descriptionWithIndenting:", v8));
    }
  }
  if (self->_progressSubscriberOrSubscribers)
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@progress subscribers:"), a3);
    if (_NSIsNSSet())
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      v21 = objc_msgSend(progressSubscriberOrSubscribers, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v50;
        do
        {
          for (k = 0; k != v22; ++k)
          {
            if (*(_QWORD *)v50 != v23)
              objc_enumerationMutation(progressSubscriberOrSubscribers);
            -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "descriptionWithIndenting:", v8));
          }
          v22 = objc_msgSend(progressSubscriberOrSubscribers, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
        }
        while (v22);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(self->_progressSubscriberOrSubscribers, "descriptionWithIndenting:", v8));
    }
  }
  if (self->_progressPublisherOrPublishers)
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@progress publishers:"), a3);
    if (_NSIsNSSet())
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      v26 = objc_msgSend(progressPublisherOrPublishers, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        do
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(progressPublisherOrPublishers);
            -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "descriptionWithIndenting:", v8));
          }
          v27 = objc_msgSend(progressPublisherOrPublishers, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
        }
        while (v27);
      }
    }
    else
    {
      -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@"), objc_msgSend(self->_progressPublisherOrPublishers, "descriptionWithIndenting:", v8));
    }
  }
  v30 = -[NSFileAccessNode _childrenExcludingExcessNodes:excludingReactors:](self, "_childrenExcludingExcessNodes:excludingReactors:", v37, v5);
  if (objc_msgSend(v30, "count"))
  {
    -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@children:"), a3);
    v31 = objc_msgSend(v8, "stringByAppendingString:", CFSTR("    "));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v40;
      do
      {
        for (n = 0; n != v33; ++n)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(v30);
          -[NSString appendFormat:](v9, "appendFormat:", CFSTR("\n%@%@\n%@"), v8, *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n) + 24), objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * n), "descriptionWithIndenting:excludingExcessNodes:excludingReactors:", v31, v37, v5));
        }
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v33);
    }
  }
  return v9;
}

- (id)sensitiveDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:](self, "descriptionWithIndenting:excludingExcessNodes:excludingReactors:", &stru_1E0F56070, 1, 0);
}

- (id)description
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:](self, "descriptionWithIndenting:excludingExcessNodes:excludingReactors:", &stru_1E0F56070, 0, 0);
}

- (id)sensitiveSubarbiterDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:](self, "descriptionWithIndenting:excludingExcessNodes:excludingReactors:", &stru_1E0F56070, 0, 1);
}

- (id)subarbiterDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:](self, "descriptionWithIndenting:excludingExcessNodes:excludingReactors:", &stru_1E0F56070, 1, 1);
}

@end
