@implementation IMRequirementLogger

+ (void)__setSingleton__im:(id)a3
{
  objc_storeStrong((id *)&qword_1EE503E98, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E29B438;
  block[3] = &unk_1E3FB6278;
  block[4] = a1;
  if (qword_1ECFC70C8 != -1)
    dispatch_once(&qword_1ECFC70C8, block);
  return (id)qword_1EE503E98;
}

- (IMRequirementLogger)init
{
  IMRequirementLogger *v2;
  IMRequirementLogger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMRequirementLogger;
  v2 = -[IMRequirementLogger init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_loggingLevel = 2;
    -[IMRequirementLogger updateSettingsFromUserDefaults](v2, "updateSettingsFromUserDefaults");
  }
  return v3;
}

- (void)updateSettingsFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRequirementLogger setThrowFailures:](self, "setThrowFailures:", objc_msgSend(v3, "BOOLForKey:", CFSTR("throw-requirement-failures")));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("requirements-logging-level"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[IMRequirementLogger setLoggingLevel:](self, "setLoggingLevel:", IMLoggingLevelFromString((uint64_t)v6));
    v5 = v6;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)IMRequirementLogger;
  -[IMRequirementLogger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMRequirementLogger throwFailures](self, "throwFailures"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: throwFailures: %@, category override: %s"), v4, v5, -[IMRequirementLogger categoryOverride](self, "categoryOverride"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (const)categoryOverride
{
  IMRequirementLogger *v2;
  const char *categoryOverride;

  v2 = self;
  objc_sync_enter(v2);
  categoryOverride = v2->_categoryOverride;
  objc_sync_exit(v2);

  return categoryOverride;
}

- (void)setCategoryOverride:(const char *)a3
{
  IMRequirementLogger *v4;
  char *categoryOverride;
  size_t v6;
  char *v7;
  char *v8;
  IMRequirementLogger *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  categoryOverride = (char *)obj->_categoryOverride;
  if (categoryOverride)
  {
    free(categoryOverride);
    v4 = obj;
    obj->_categoryOverride = 0;
  }
  if (a3)
  {
    v6 = strnlen(a3, 0x100uLL);
    v7 = (char *)malloc_type_malloc(v6 + 1, 0x870126A9uLL);
    v8 = strncpy(v7, a3, 0x100uLL);
    v4 = obj;
    obj->_categoryOverride = v8;
  }
  objc_sync_exit(v4);

}

- (void)dealloc
{
  char *categoryOverride;
  objc_super v4;

  categoryOverride = (char *)self->_categoryOverride;
  if (categoryOverride)
  {
    free(categoryOverride);
    self->_categoryOverride = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMRequirementLogger;
  -[IMRequirementLogger dealloc](&v4, sel_dealloc);
}

- (IMRequirementFailed_t)requirementDidFail:(const char *)a3
{
  const char *v5;
  _BOOL4 v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  IMRequirementFailed_t result;

  v5 = -[IMRequirementLogger categoryOverride](self, "categoryOverride");
  if (v5)
    a3 = v5;
  v6 = -[IMRequirementLogger throwFailures](self, "throwFailures");
  v7 = -[IMRequirementLogger loggingLevel](self, "loggingLevel");
  v8 = 256;
  if (!v6)
    v8 = 0;
  v9 = v8 | ((unint64_t)v7 << 16) | 1;
  v10 = (char *)a3;
  result.var1 = v9;
  result.var2 = BYTE1(v9);
  result.var3 = BYTE2(v9);
  result.var0 = v10;
  return result;
}

- (unsigned)loggingLevel
{
  return self->_loggingLevel;
}

- (void)setLoggingLevel:(unsigned __int8)a3
{
  self->_loggingLevel = a3;
}

- (BOOL)throwFailures
{
  return self->_throwFailures;
}

- (void)setThrowFailures:(BOOL)a3
{
  self->_throwFailures = a3;
}

@end
