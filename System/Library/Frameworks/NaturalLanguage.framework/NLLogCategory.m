@implementation NLLogCategory

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)categoryList;
  categoryList = v2;

  +[NLLogCategory _addCategory:inSubsystem:](NLLogCategory, "_addCategory:inSubsystem:", CFSTR("default"), CFSTR("com.apple.NaturalLanguageFramework"));
}

+ (id)defaultCategory
{
  return +[NLLogCategory _getCategory:](NLLogCategory, "_getCategory:", CFSTR("default"));
}

+ (id)categoryWithName:(id)a3
{
  return +[NLLogCategory categoryWithName:inSubsystem:](NLLogCategory, "categoryWithName:inSubsystem:", a3, CFSTR("com.apple.NaturalLanguageFramework"));
}

+ (id)categoryWithName:(id)a3 inSubsystem:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  +[NLLogCategory _getCategory:](NLLogCategory, "_getCategory:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[NLLogCategory _addCategory:inSubsystem:](NLLogCategory, "_addCategory:inSubsystem:", v5, v6);
    +[NLLogCategory _getCategory:](NLLogCategory, "_getCategory:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (void)_addCategory:(id)a3 inSubsystem:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NLLogCategory initCategory:inSubsystem:]([NLLogCategory alloc], "initCategory:inSubsystem:", v6, v5);

  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  objc_msgSend((id)categoryList, "setObject:forKey:", v7, v6);

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
}

+ (id)_getCategory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  objc_msgSend((id)categoryList, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v4;
}

- (id)initCategory:(id)a3 inSubsystem:(id)a4
{
  id v7;
  id v8;
  NLLogCategory *v9;
  NLLogCategory *v10;
  os_log_t v11;
  OS_os_log *internal;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLLogCategory;
  v9 = -[NLLogCategory init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingSubsystem, a4);
    objc_storeStrong((id *)&v10->_loggingCategory, a3);
    v11 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.NaturalLanguageFramework"), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    internal = v10->_internal;
    v10->_internal = (OS_os_log *)v11;

  }
  return v10;
}

- (OS_os_log)internal
{
  return self->_internal;
}

- (NSString)loggingCategory
{
  return self->_loggingCategory;
}

- (NSString)loggingSubsystem
{
  return self->_loggingSubsystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingSubsystem, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
