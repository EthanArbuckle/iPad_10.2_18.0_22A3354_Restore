@implementation NSKeyValueComputedProperty

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSKeyValueComputedProperty;
  v7 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:](&v15, sel__initWithContainerClass_keyPath_propertiesBeingInitialized_, a3);
  if (v7)
  {
    v8 = objc_msgSend(a4, "rangeOfString:", CFSTR("."));
    if (v9)
    {
      v10 = v8;
      v7[3] = objc_msgSend((id)objc_msgSend(a4, "substringWithRange:", 1, v8 - 1), "copy");
      v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "substringFromIndex:", v10 + 1), "copy");
      v7[4] = v11;
      v12 = NSKeyValuePropertyForIsaAndKeyPathInner(*(objc_class **)(v7[1] + 8), v11, a5);
      v13 = &OBJC_IVAR___NSKeyValueComputedProperty__operationArgumentProperty;
    }
    else
    {
      v12 = (void *)objc_msgSend(a4, "copy");
      v13 = &OBJC_IVAR___NSKeyValueComputedProperty__operationName;
    }
    *(_QWORD *)((char *)v7 + *v13) = v12;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueComputedProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Container class: %@, Operation name: %@, Operation argument property: %@"), objc_opt_class(), self->super._containerClass->_originalClass, self->_operationName, self->_operationArgumentProperty);
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
  -[NSKeyValueProperty _givenPropertiesBeingInitialized:getAffectingProperties:](self->_operationArgumentProperty, "_givenPropertiesBeingInitialized:getAffectingProperties:", a3, a4);
}

- (void)_addDependentValueKey:(id)a3
{
  -[NSKeyValueProperty _addDependentValueKey:](self->_operationArgumentProperty, "_addDependentValueKey:", a3);
}

- (Class)_isaForAutonotifying
{
  return -[NSKeyValueProperty isaForAutonotifying](self->_operationArgumentProperty, "isaForAutonotifying");
}

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  id result;

  if (a4)
    *a4 = 0;
  result = -[NSKeyValueProperty keyPathIfAffectedByValueForKey:exactMatch:](self->_operationArgumentProperty, "keyPathIfAffectedByValueForKey:exactMatch:", a3, 0);
  if (result)
    return self->super._keyPath;
  return result;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  id result;

  result = -[NSKeyValueProperty keyPathIfAffectedByValueForMemberOfKeys:](self->_operationArgumentProperty, "keyPathIfAffectedByValueForMemberOfKeys:", a3);
  if (result)
    return self->super._keyPath;
  return result;
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  -[NSKeyValueProperty object:didAddObservance:recurse:](self->_operationArgumentProperty, "object:didAddObservance:recurse:", a3, a4, a5);
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  -[NSKeyValueProperty object:didRemoveObservance:recurse:](self->_operationArgumentProperty, "object:didRemoveObservance:recurse:", a3, a4, a5);
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  return -[NSKeyValueProperty object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:](self->_operationArgumentProperty, "object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, a6, a7);
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  -[NSKeyValueProperty object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:](self->_operationArgumentProperty, "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, a6, a7.var0, a7.var1);
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  NSString *operationArgumentKeyPath;

  operationArgumentKeyPath = self->_operationArgumentKeyPath;
  return operationArgumentKeyPath == a3 || CFEqual(a3, operationArgumentKeyPath) != 0;
}

@end
