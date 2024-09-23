@implementation CADIdleChangeTrackingCleanupInfo

- (CADIdleChangeTrackingCleanupInfo)initWithLanguishPeriod:(double)a3 numberOfChanges:(int)a4
{
  uint64_t v4;
  CADIdleChangeTrackingCleanupInfo *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)CADIdleChangeTrackingCleanupInfo;
  v6 = -[CADIdleChangeTrackingCleanupInfo init](&v8, sel_init);
  if (v6)
  {
    CADLogInitIfNeeded();
    -[CADIdleChangeTrackingCleanupInfo setLanguishPeriod:](v6, "setLanguishPeriod:", a3);
    -[CADIdleChangeTrackingCleanupInfo setNumberOfChanges:](v6, "setNumberOfChanges:", v4);
  }
  return v6;
}

+ (id)serverIdleChangeTrackingCleanupInfo
{
  return -[CADIdleChangeTrackingCleanupInfo initWithLanguishPeriod:numberOfChanges:]([CADIdleChangeTrackingCleanupInfo alloc], "initWithLanguishPeriod:numberOfChanges:", 1000, 2592000.0);
}

- (BOOL)isEqualToInfo:(id)a3
{
  CADIdleChangeTrackingCleanupInfo *v4;
  CADIdleChangeTrackingCleanupInfo *v5;
  double v6;
  double v7;
  double v8;
  int v9;
  BOOL v10;

  v4 = (CADIdleChangeTrackingCleanupInfo *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_7;
  }
  -[CADIdleChangeTrackingCleanupInfo languishPeriod](self, "languishPeriod");
  v7 = v6;
  -[CADIdleChangeTrackingCleanupInfo languishPeriod](v5, "languishPeriod");
  if (vabdd_f64(v7, v8) < 2.22044605e-16)
  {
    v9 = -[CADIdleChangeTrackingCleanupInfo numberOfChanges](self, "numberOfChanges");
    v10 = v9 == -[CADIdleChangeTrackingCleanupInfo numberOfChanges](v5, "numberOfChanges");
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  CADIdleChangeTrackingCleanupInfo *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CADIdleChangeTrackingCleanupInfo isEqualToInfo:](self, "isEqualToInfo:", v4);
  }
  else
  {
    v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "WARNING: Comparing %@ to object whose class is not: [%@]. Object: %@.", (uint8_t *)&v11, 0x20u);

    }
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CADIdleChangeTrackingCleanupInfo languishPeriod](self, "languishPeriod");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CADIdleChangeTrackingCleanupInfo numberOfChanges](self, "numberOfChanges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {\n    Languish Period = %@\n    Number of Changes = %@\n}"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)languishPeriod
{
  return self->_languishPeriod;
}

- (void)setLanguishPeriod:(double)a3
{
  self->_languishPeriod = a3;
}

- (int)numberOfChanges
{
  return self->_numberOfChanges;
}

- (void)setNumberOfChanges:(int)a3
{
  self->_numberOfChanges = a3;
}

@end
