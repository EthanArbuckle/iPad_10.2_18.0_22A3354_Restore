@implementation FBSApplicationLibraryConfiguration

- (FBSApplicationLibraryConfiguration)init
{
  FBSApplicationLibraryConfiguration *v2;
  uint64_t v3;
  Class applicationInfoClass;
  uint64_t v5;
  Class applicationPlaceholderClass;
  id installedApplicationFilter;
  id placeholderFilter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBSApplicationLibraryConfiguration;
  v2 = -[FBSApplicationLibraryConfiguration init](&v10, sel_init);
  if (v2)
  {
    objc_opt_class();
    v3 = objc_claimAutoreleasedReturnValue();
    applicationInfoClass = v2->_applicationInfoClass;
    v2->_applicationInfoClass = (Class)v3;

    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
    applicationPlaceholderClass = v2->_applicationPlaceholderClass;
    v2->_applicationPlaceholderClass = (Class)v5;

    *(_WORD *)&v2->_personaAware = 0;
    installedApplicationFilter = v2->_installedApplicationFilter;
    v2->_installedApplicationFilter = 0;

    placeholderFilter = v2->_placeholderFilter;
    v2->_placeholderFilter = 0;

  }
  return v2;
}

- (void)setApplicationInfoClass:(Class)a3
{
  Class *p_applicationInfoClass;
  objc_class *applicationInfoClass;
  void *v8;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    applicationInfoClass = self->_applicationInfoClass;
    p_applicationInfoClass = &self->_applicationInfoClass;
    if (applicationInfoClass != a3)
      objc_storeStrong((id *)p_applicationInfoClass, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must specify a class that subclasses from FBSApplicationInfo : was passed %@"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibraryConfiguration setApplicationInfoClass:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setApplicationPlaceholderClass:(Class)a3
{
  Class *p_applicationPlaceholderClass;
  objc_class *applicationPlaceholderClass;
  void *v8;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    applicationPlaceholderClass = self->_applicationPlaceholderClass;
    p_applicationPlaceholderClass = &self->_applicationPlaceholderClass;
    if (applicationPlaceholderClass != a3)
      objc_storeStrong((id *)p_applicationPlaceholderClass, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must specify a class that subclasses from FBSApplicationPlaceholder : was passed %@"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibraryConfiguration setApplicationPlaceholderClass:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  FBSApplicationLibraryConfiguration *v4;

  v4 = objc_alloc_init(FBSApplicationLibraryConfiguration);
  -[FBSApplicationLibraryConfiguration setApplicationInfoClass:](v4, "setApplicationInfoClass:", self->_applicationInfoClass);
  -[FBSApplicationLibraryConfiguration setApplicationPlaceholderClass:](v4, "setApplicationPlaceholderClass:", self->_applicationPlaceholderClass);
  -[FBSApplicationLibraryConfiguration setAllowConcurrentLoading:](v4, "setAllowConcurrentLoading:", self->_allowConcurrentLoading);
  -[FBSApplicationLibraryConfiguration setInstalledApplicationFilter:](v4, "setInstalledApplicationFilter:", self->_installedApplicationFilter);
  -[FBSApplicationLibraryConfiguration setPlaceholderFilter:](v4, "setPlaceholderFilter:", self->_placeholderFilter);
  -[FBSApplicationLibraryConfiguration setApplicationIdentityFilter:](v4, "setApplicationIdentityFilter:", self->_applicationIdentityFilter);
  -[FBSApplicationLibraryConfiguration setPlaceholderIdentityFilter:](v4, "setPlaceholderIdentityFilter:", self->_placeholderIdentityFilter);
  -[FBSApplicationLibraryConfiguration setPersonaAware:](v4, "setPersonaAware:", self->_personaAware);
  return v4;
}

- (Class)applicationInfoClass
{
  return self->_applicationInfoClass;
}

- (Class)applicationPlaceholderClass
{
  return self->_applicationPlaceholderClass;
}

- (BOOL)isPersonaAware
{
  return self->_personaAware;
}

- (void)setPersonaAware:(BOOL)a3
{
  self->_personaAware = a3;
}

- (BOOL)allowConcurrentLoading
{
  return self->_allowConcurrentLoading;
}

- (void)setAllowConcurrentLoading:(BOOL)a3
{
  self->_allowConcurrentLoading = a3;
}

- (id)installedApplicationFilter
{
  return self->_installedApplicationFilter;
}

- (void)setInstalledApplicationFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)placeholderFilter
{
  return self->_placeholderFilter;
}

- (void)setPlaceholderFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)applicationIdentityFilter
{
  return self->_applicationIdentityFilter;
}

- (void)setApplicationIdentityFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)placeholderIdentityFilter
{
  return self->_placeholderIdentityFilter;
}

- (void)setPlaceholderIdentityFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholderIdentityFilter, 0);
  objc_storeStrong(&self->_applicationIdentityFilter, 0);
  objc_storeStrong(&self->_placeholderFilter, 0);
  objc_storeStrong(&self->_installedApplicationFilter, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholderClass, 0);
  objc_storeStrong((id *)&self->_applicationInfoClass, 0);
}

- (void)setApplicationInfoClass:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setApplicationPlaceholderClass:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
