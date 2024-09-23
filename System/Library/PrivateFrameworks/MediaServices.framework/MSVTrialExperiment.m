@implementation MSVTrialExperiment

- (NSString)experimentID
{
  return 0;
}

- (MSVTrialExperiment)initWithProjectID:(int64_t)a3 namespaceName:(id)a4
{
  NSObject *v5;
  uint8_t v7[16];

  v5 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_FAULT, "MSVTrialExperiment is currently not supported on this platform.", v7, 2u);
  }

  return 0;
}

- (NSString)treatmentID
{
  return 0;
}

- (NSString)deploymentID
{
  return 0;
}

- (BOOL)BOOLForFactor:(id)a3
{
  return 0;
}

- (double)doubleForFactor:(id)a3
{
  return 0.0;
}

- (int64_t)longForFactor:(id)a3
{
  return 0;
}

- (id)stringForFactor:(id)a3
{
  return 0;
}

- (id)metadataForFactor:(id)a3
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p Not supported>"), objc_opt_class(), self);
}

@end
