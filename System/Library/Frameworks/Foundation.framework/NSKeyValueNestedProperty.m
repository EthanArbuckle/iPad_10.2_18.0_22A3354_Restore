@implementation NSKeyValueNestedProperty

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  id result;

  if (a4)
    *a4 = 0;
  result = -[NSKeyValueUnnestedProperty keyPathIfAffectedByValueForKey:exactMatch:](self->_relationshipProperty, "keyPathIfAffectedByValueForKey:exactMatch:", a3, 0);
  if (result)
    return self->super._keyPath;
  return result;
}

- (Class)_isaForAutonotifying
{
  return -[NSKeyValueUnnestedProperty isaForAutonotifying](self->_relationshipProperty, "isaForAutonotifying");
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  _BOOL8 v8;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v8 = a6;
  v17 = *MEMORY[0x1E0C80C00];
  if (*(_OWORD *)NSKeyValueGetImplicitObservanceAdditionInfo() == __PAIR128__((unint64_t)a4, (unint64_t)a3))return 0;
  a7->var0 = 0;
  a7->var1 = 0;
  if (self->_isAllowedToResultInForwarding)
  {
    v13 = (void *)objc_msgSend(a3, "valueForKey:", self->_relationshipKey);
    a7->var0 = v13;
    if (!v13)
      a7->var0 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  }
  v15 = 0;
  v16 = 0;
  if (-[NSKeyValueUnnestedProperty object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:](self->_relationshipProperty, "object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, v8, &v15))
  {
    a7->var1 = v16;
  }
  return 1;
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
  -[NSKeyValueUnnestedProperty _givenPropertiesBeingInitialized:getAffectingProperties:](self->_relationshipProperty, "_givenPropertiesBeingInitialized:getAffectingProperties:", a3, a4);
}

- (void)_addDependentValueKey:(id)a3
{
  void *v4;
  id dependentValueKeyOrKeys;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_msgSend(a3, "copy");
  dependentValueKeyOrKeys = self->_dependentValueKeyOrKeys;
  v10 = v4;
  if (dependentValueKeyOrKeys)
  {
    if (!self->_dependentValueKeyOrKeysIsASet)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", self->_dependentValueKeyOrKeys, v4, 0);

      v8 = v10;
      self->_dependentValueKeyOrKeys = v9;
      self->_dependentValueKeyOrKeysIsASet = 1;
      goto LABEL_7;
    }
    v6 = (void *)objc_msgSend(dependentValueKeyOrKeys, "setByAddingObject:", v4);

    v7 = v6;
  }
  else
  {
    v7 = v4;
  }
  v8 = v10;
  self->_dependentValueKeyOrKeys = v7;
LABEL_7:

}

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 firstDotIndex:(unint64_t)a5 propertiesBeingInitialized:(__CFSet *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)NSKeyValueNestedProperty;
  v9 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:](&v19, sel__initWithContainerClass_keyPath_propertiesBeingInitialized_, a3, a4, a6);
  if (v9)
  {
    *((_QWORD *)v9 + 3) = objc_msgSend((id)objc_msgSend(a4, "substringToIndex:", a5), "copy");
    *((_QWORD *)v9 + 4) = objc_msgSend((id)objc_msgSend(a4, "substringFromIndex:", a5 + 1), "copy");
    *((_QWORD *)v9 + 5) = NSKeyValuePropertyForIsaAndKeyPathInner(*(objc_class **)(*((_QWORD *)v9 + 1) + 8), *((void **)v9 + 3), a6);
    v10 = objc_msgSend(a4, "rangeOfString:", CFSTR(".@"));
    if (v11)
    {
      v12 = v10;
      v13 = v11;
      v14 = (void *)objc_msgSend(a4, "substringToIndex:", v10);
      v15 = objc_msgSend(a4, "rangeOfString:options:range:", CFSTR("."), 0, v12 + v13, objc_msgSend(a4, "length") - (v12 + v13));
      if (v16)
        v14 = (void *)objc_msgSend(v14, "stringByAppendingString:", objc_msgSend(a4, "substringFromIndex:", v15));
      *((_QWORD *)v9 + 6) = v14;
    }
    v17 = objc_msgSend(*(id *)(*((_QWORD *)v9 + 1) + 8), "_shouldAddObservationForwardersForKey:", *((_QWORD *)v9 + 3));
    *((_BYTE *)v9 + 56) = v17;
    if (v17
      && objc_msgSend(*((id *)v9 + 4), "hasPrefix:", CFSTR("@"))
      && objc_msgSend(*((id *)v9 + 4), "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *((_BYTE *)v9 + 56) = 0;
    }
  }
  return v9;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  id result;

  result = -[NSKeyValueUnnestedProperty keyPathIfAffectedByValueForMemberOfKeys:](self->_relationshipProperty, "keyPathIfAffectedByValueForMemberOfKeys:", a3);
  if (result)
    return self->super._keyPath;
  return result;
}

- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3
{
  *a3 = self->_dependentValueKeyOrKeysIsASet;
  return self->_dependentValueKeyOrKeys;
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  void *v6;
  uint64_t ImplicitObservanceRemovalInfo;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSKeyValueNestedProperty *v15;
  _BOOL4 v16;

  v16 = a5;
  if (self->_isAllowedToResultInForwarding)
  {
    os_unfair_recursive_lock_unlock();
    v6 = (void *)objc_msgSend(a3, "valueForKey:", self->_relationshipKey);
    ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    v8 = ImplicitObservanceRemovalInfo;
    v9 = *(_QWORD *)ImplicitObservanceRemovalInfo;
    v10 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 8);
    v11 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 16);
    v12 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 24);
    v13 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 32);
    v14 = *(_BYTE *)(ImplicitObservanceRemovalInfo + 40);
    *(_QWORD *)ImplicitObservanceRemovalInfo = v6;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 24) = a3;
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
      v15 = 0;
    else
      v15 = self;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 32) = v15;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = 1;
    objc_msgSend(v6, "removeObserver:forKeyPath:");
    *(_QWORD *)v8 = v9;
    *(_QWORD *)(v8 + 8) = v10;
    *(_QWORD *)(v8 + 16) = v11;
    *(_QWORD *)(v8 + 24) = v12;
    *(_QWORD *)(v8 + 32) = v13;
    *(_BYTE *)(v8 + 40) = v14;
    os_unfair_recursive_lock_lock_with_options();
  }
  -[NSKeyValueUnnestedProperty object:didRemoveObservance:recurse:](self->_relationshipProperty, "object:didRemoveObservance:recurse:", a3, a4, v16);
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  NSKeyValueNestedProperty *v8;
  void *v9;
  uint64_t ImplicitObservanceRemovalInfo;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *ImplicitObservanceAdditionInfo;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _BOOL4 v22;
  id var1;
  id var0;

  var1 = a7.var1;
  var0 = a7.var0;
  v22 = a6;
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      v8 = 0;
      v17 = *((_BYTE *)a4 + 40) & 0xF | 0x100;
    }
    else
    {
      v17 = 264;
      v8 = self;
    }
    if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == a7.var0)
      v9 = 0;
    else
      v9 = var0;
    ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    v11 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 8);
    v12 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 24);
    v18 = *(_QWORD *)ImplicitObservanceRemovalInfo;
    v19 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 16);
    v13 = *(_QWORD *)(ImplicitObservanceRemovalInfo + 32);
    v20 = *(_BYTE *)(ImplicitObservanceRemovalInfo + 40);
    *(_QWORD *)ImplicitObservanceRemovalInfo = v9;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 24) = a3;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 32) = v8;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = 1;
    objc_msgSend(v9, "removeObserver:forKeyPath:", a4, self->_keyPathFromRelatedObject);
    *(_QWORD *)ImplicitObservanceRemovalInfo = v18;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 8) = v11;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 16) = v19;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 24) = v12;
    *(_QWORD *)(ImplicitObservanceRemovalInfo + 32) = v13;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = v20;
    ImplicitObservanceAdditionInfo = (uint64_t *)NSKeyValueGetImplicitObservanceAdditionInfo();
    v15 = *ImplicitObservanceAdditionInfo;
    v16 = ImplicitObservanceAdditionInfo[1];
    *ImplicitObservanceAdditionInfo = (uint64_t)a3;
    ImplicitObservanceAdditionInfo[1] = (uint64_t)a4;
    objc_msgSend((id)objc_msgSend(a3, "valueForKey:", self->_relationshipKey), "addObserver:forKeyPath:options:context:", a4, self->_keyPathFromRelatedObject, v17, v8);
    *ImplicitObservanceAdditionInfo = v15;
    ImplicitObservanceAdditionInfo[1] = v16;
  }
  if (var1)
    -[NSKeyValueUnnestedProperty object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:](self->_relationshipProperty, "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, v22, var0);
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  NSKeyValueNestedProperty *v10;
  uint64_t ImplicitObservanceAdditionInfo;
  id v12;
  __int128 v13;

  v5 = a5;
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions)
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_NSKeyValueObserverRegistrationLock);
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      v10 = 0;
      v9 = *((_BYTE *)a4 + 40) & 0xF | 0x100;
    }
    else
    {
      v9 = 264;
      v10 = self;
    }
    ImplicitObservanceAdditionInfo = NSKeyValueGetImplicitObservanceAdditionInfo();
    v13 = *(_OWORD *)ImplicitObservanceAdditionInfo;
    *(_QWORD *)ImplicitObservanceAdditionInfo = a3;
    *(_QWORD *)(ImplicitObservanceAdditionInfo + 8) = a4;
    os_unfair_recursive_lock_unlock();
    v12 = (id)objc_msgSend(a3, "valueForKey:", self->_relationshipKey);
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", a4, self->_keyPathFromRelatedObject, v9, v10);

    os_unfair_recursive_lock_lock_with_options();
    *(_OWORD *)ImplicitObservanceAdditionInfo = v13;
  }
  -[NSKeyValueUnnestedProperty object:didAddObservance:recurse:](self->_relationshipProperty, "object:didAddObservance:recurse:", a3, a4, v5, v13);
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions)
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_NSKeyValueObserverRegistrationLock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNestedProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Container class: %@, Relationship property: %@, Key path from related object: %@>"), objc_opt_class(), self->super._containerClass->_originalClass, self->_relationshipProperty, self->_keyPathFromRelatedObject);
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  NSString *keyPathWithoutOperatorComponents;

  keyPathWithoutOperatorComponents = self->_keyPathWithoutOperatorComponents;
  if (!keyPathWithoutOperatorComponents)
    keyPathWithoutOperatorComponents = self->super._keyPath;
  return keyPathWithoutOperatorComponents == a3 || CFEqual(a3, keyPathWithoutOperatorComponents) != 0;
}

@end
