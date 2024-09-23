@implementation NSCoder(HMDHH2Migrator)

- (uint64_t)hmd_isHH2MigrationInProgress
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("HMDHH2MigrationInProgressAssociationKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

@end
