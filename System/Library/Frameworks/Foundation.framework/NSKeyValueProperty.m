@implementation NSKeyValueProperty

- (id)keyPath
{
  return self->_keyPath;
}

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  NSKeyValueProperty *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSKeyValueProperty;
  v8 = -[NSKeyValueProperty init](&v10, sel_init);
  if (v8)
  {
    v8->_containerClass = (NSKeyValueContainerClass *)a3;
    v8->_keyPath = (NSString *)objc_msgSend(a4, "copy");
    CFSetAddValue(a5, v8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  a7->var0 = 0;
  a7->var1 = 0;
  return 1;
}

- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3
{
  return 0;
}

- (id)restOfKeyPathIfContainedByValueForKeyPath:(id)a3
{
  NSString *keyPath;
  unint64_t v7;

  keyPath = self->_keyPath;
  if (keyPath == a3 || CFEqual(a3, keyPath))
    return &stru_1E0F56070;
  v7 = objc_msgSend(a3, "length");
  if (-[NSString hasPrefix:](self->_keyPath, "hasPrefix:", a3)
    && -[NSString length](self->_keyPath, "length") > v7
    && -[NSString characterAtIndex:](self->_keyPath, "characterAtIndex:", v7) == 46)
  {
    return -[NSString substringFromIndex:](self->_keyPath, "substringFromIndex:", v7 + 1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  return 0;
}

@end
