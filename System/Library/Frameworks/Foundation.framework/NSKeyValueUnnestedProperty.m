@implementation NSKeyValueUnnestedProperty

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  id var1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  var1 = a7.var1;
  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(a7.var1, "countByEnumeratingWithState:objects:count:", &v16, v15, 16, a6, a7.var0);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(var1);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, 0, objc_msgSend(var1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14)), 0);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(var1, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v12);
  }
}

- (id)keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  id result;
  NSArray *affectingProperties;
  id v9;
  uint64_t v10;
  void *i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForKey:exactMatch:](self, "_keyPathIfAffectedByValueForKey:exactMatch:");
  if (!result)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    affectingProperties = self->_affectingProperties;
    result = (id)-[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(affectingProperties);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "_keyPathIfAffectedByValueForKey:exactMatch:", a3, 0))
          {
            result = self->super._keyPath;
            if (a4)
              *a4 = 0;
            return result;
          }
        }
        v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        result = 0;
        if (v9)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  NSString *keyPath;

  keyPath = self->super._keyPath;
  if (keyPath != a3 && !CFEqual(a3, keyPath))
    return 0;
  if (a4)
    *a4 = 1;
  return self->super._keyPath;
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  int v11;
  NSArray *affectingProperties;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v21;
  void *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (self->_affectingProperties)
    {
      v11 = _NSIsNSSet();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      affectingProperties = self->_affectingProperties;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v25;
        while (1)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(affectingProperties);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (v11)
            {
              if (!objc_msgSend(v18, "keyPathIfAffectedByValueForMemberOfKeys:", a5))
                continue;
            }
            else if (!objc_msgSend(v18, "keyPathIfAffectedByValueForKey:exactMatch:", a5, 0))
            {
              continue;
            }
            v21 = 0;
            v22 = 0;
            if (objc_msgSend(v18, "object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, 0, &v21))
            {
              if (v21)
              {
                if (v15)
                  objc_msgSend(v15, "setObject:forKey:");
                else
                  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:");
              }
              if (v22)
              {
                if (v15)
                  objc_msgSend(v15, "addEntriesFromDictionary:");
                else
                  v15 = v22;
              }
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          if (!v14)
            goto LABEL_25;
        }
      }
    }
  }
  v15 = 0;
LABEL_25:
  a7->var0 = 0;
  a7->var1 = v15;
  return 1;
}

- (Class)isaForAutonotifying
{
  NSArray *affectingProperties;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_class *v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedIsaForAutonotifyingIsValid)
  {
    self->_cachedIsaForAutonotifying = -[NSKeyValueUnnestedProperty _isaForAutonotifying](self, "_isaForAutonotifying");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    affectingProperties = self->_affectingProperties;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(affectingProperties);
          v8 = (objc_class *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_isaForAutonotifying");
          if (v8)
            self->_cachedIsaForAutonotifying = v8;
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v5);
    }
    self->_cachedIsaForAutonotifyingIsValid = 1;
  }
  return self->_cachedIsaForAutonotifying;
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  NSArray *affectingProperties;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(affectingProperties);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "object:didAddObservance:recurse:", a3, a4, 0);
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        }
        while (v9);
      }
    }
  }
}

- (Class)_isaForAutonotifying
{
  Class result;
  Class v4;

  if (!-[objc_class automaticallyNotifiesObserversForKey:](self->super._containerClass->_originalClass, "automaticallyNotifiesObserversForKey:", self->super._keyPath))return 0;
  result = (Class)_NSKeyValueContainerClassGetNotifyingInfo((uint64_t)self->super._containerClass);
  if (result)
  {
    v4 = result;
    _NSKVONotifyingEnableForInfoAndKey((uint64_t)result, self->super._keyPath);
    return (Class)*((_QWORD *)v4 + 1);
  }
  return result;
}

- (id)_initWithContainerClass:(id)a3 key:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSKeyValueUnnestedProperty;
  v6 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:](&v14, sel__initWithContainerClass_keyPath_propertiesBeingInitialized_, a3, a4);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v6, "_givenPropertiesBeingInitialized:getAffectingProperties:", a5, v7);
    objc_msgSend(v7, "removeObject:", v6);
    v8 = objc_msgSend(v7, "count");
    if (v8)
      v8 = objc_msgSend((id)objc_msgSend(v7, "allObjects"), "copy");
    v6[3] = v8;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = (void *)v6[3];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "_addDependentValueKey:", v6[2]);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v10);
    }
  }
  return v6;
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSString *v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_affectingProperties)
  {
    objc_msgSend(a4, "addObjectsFromArray:");
    return;
  }
  v7 = (void *)-[objc_class keyPathsForValuesAffectingValueForKey:](self->super._containerClass->_originalClass, "keyPathsForValuesAffectingValueForKey:", self->super._keyPath);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", self->super._keyPath))
        {
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes the same key that was passed in, which is not valid.\nPassed-in key: %@\nReturned key path set: %@"), self->super._containerClass->_originalClass, self->super._keyPath, v7);
          goto LABEL_17;
        }
        if (objc_msgSend(v12, "hasPrefix:", -[NSString stringByAppendingString:](self->super._keyPath, "stringByAppendingString:", CFSTR("."))))
        {
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes a key path that starts with the same key that was passed in, which is not valid. The property identified by the key path already depends on the property identified by the key, never vice versa.\nPassed-in key: %@\nReturned key path set: %@"), self->super._containerClass->_originalClass, self->super._keyPath, v7);
LABEL_17:
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v14, 0));
        }
        v13 = NSKeyValuePropertyForIsaAndKeyPathInner(self->super._containerClass->_originalClass, v12, a3);
        if ((objc_msgSend(a4, "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(a4, "addObject:", v13);
          objc_msgSend(v13, "_givenPropertiesBeingInitialized:getAffectingProperties:", a3, a4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v9);
  }
}

- (id)keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  id result;
  NSArray *affectingProperties;
  id v7;
  uint64_t v8;
  void *i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForMemberOfKeys:](self, "_keyPathIfAffectedByValueForMemberOfKeys:");
  if (!result)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    affectingProperties = self->_affectingProperties;
    result = (id)-[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(affectingProperties);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "_keyPathIfAffectedByValueForMemberOfKeys:", a3))
          {
            return self->super._keyPath;
          }
        }
        v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        result = 0;
        if (v7)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  if (objc_msgSend(a3, "containsObject:", self->super._keyPath))
    return self->super._keyPath;
  else
    return 0;
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  NSArray *affectingProperties;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(affectingProperties);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "object:didRemoveObservance:recurse:", a3, a4, 0);
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](affectingProperties, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        }
        while (v9);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueUnnestedProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  __CFString *v3;
  uint64_t v4;
  NSString *keyPath;
  Class originalClass;
  Class cachedIsaForAutonotifying;
  uint64_t v8;
  const __CFString *v9;

  v3 = (__CFString *)objc_msgSend((id)objc_msgSend(-[NSArray valueForKey:](self->_affectingProperties, "valueForKey:", CFSTR("keyPath")), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_), "componentsJoinedByString:", CFSTR(", "));
  v4 = objc_opt_class();
  keyPath = self->super._keyPath;
  originalClass = self->super._containerClass->_originalClass;
  if (self->_cachedIsaForAutonotifyingIsValid)
    cachedIsaForAutonotifying = self->_cachedIsaForAutonotifying;
  else
    cachedIsaForAutonotifying = (Class)CFSTR("not cached yet");
  v8 = -[__CFString length](v3, "length");
  v9 = CFSTR("none");
  if (v8)
    v9 = v3;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Container class: %@, Key: %@, isa for autonotifying: %@, Key paths of directly and indirectly affecting properties: %@>"), v4, originalClass, keyPath, cachedIsaForAutonotifying, v9);
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  NSString *keyPath;

  keyPath = self->super._keyPath;
  return keyPath == a3 || CFEqual(a3, keyPath) != 0;
}

@end
