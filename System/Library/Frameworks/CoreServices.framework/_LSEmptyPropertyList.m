@implementation _LSEmptyPropertyList

+ (id)sharedInstance
{
  if (+[_LSEmptyPropertyList sharedInstance]::once != -1)
    dispatch_once(&+[_LSEmptyPropertyList sharedInstance]::once, &__block_literal_global_46);
  return (id)+[_LSEmptyPropertyList sharedInstance]::result;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  *a3 = 0;
  return 0;
}

- (BOOL)_getPropertyList:(id *)a3
{
  *a3 = (id)MEMORY[0x1E0C9AA70];
  return 1;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSEmptyPropertyList)initWithCoder:(id)a3
{
  _LSEmptyPropertyList *v4;

  +[_LSEmptyPropertyList sharedInstance](_LSEmptyPropertyList, "sharedInstance", a3);
  v4 = (_LSEmptyPropertyList *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
