@implementation BRZombie

- (void)dealloc
{
  objc_class *AssociatedObject;

  AssociatedObject = (objc_class *)objc_getAssociatedObject(self, "BRZombieFormerClass");
  objc_setAssociatedObject(self, "BRZombieDescription", 0, (void *)0x301);
  objc_setAssociatedObject(self, "BRZombieFormerClass", 0, 0);
  object_setClass(self, AssociatedObject);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id AssociatedObject;
  id v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  const char *ClassName;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  AssociatedObject = objc_getAssociatedObject(self, "BRZombieDescription");
  v6 = objc_getAssociatedObject(self, "BRZombieFormerClass");
  v7 = brc_bread_crumbs((uint64_t)"-[BRZombie methodSignatureForSelector:]", 46);
  v8 = brc_default_log(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v10 = 136315906;
    ClassName = object_getClassName(v6);
    v12 = 2080;
    v13 = -[NSString UTF8String](NSStringFromSelector(a3), "UTF8String");
    v14 = 2080;
    v15 = objc_msgSend(AssociatedObject, "UTF8String");
    v16 = 2112;
    v17 = v7;
    _os_log_fault_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: *** -[%s %s]: message sent to deallocated instance %s%@", (uint8_t *)&v10, 0x2Au);
  }
  return (id)objc_msgSend(v6, "instanceMethodSignatureForSelector:", a3);
}

+ (void)turnObjectIntoZombie:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  __CFString *v7;
  NSObject *v8;

  if (a3)
  {
    v4 = (void *)objc_opt_class();
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (old description: %@)>"), v4, a3, a3);
    objc_setAssociatedObject(a3, "BRZombieDescription", v5, (void *)0x301);
    objc_setAssociatedObject(a3, "BRZombieFormerClass", v4, 0);
    v6 = (objc_class *)objc_opt_class();
    object_setClass(a3, v6);
    v7 = brc_bread_crumbs((uint64_t)"+[BRZombie turnObjectIntoZombie:]", 72);
    v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[BRZombie turnObjectIntoZombie:].cold.1((uint64_t)v5, (uint64_t)v7, v8);
  }
}

+ (void)turnObjectIntoZombie:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Turned object into a zombie - %@\n%@", (uint8_t *)&v3, 0x16u);
}

@end
