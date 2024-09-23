@implementation IDSNGMKeyRollingTicket

- (id)identityData
{
  uint64_t v2;
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF5AA4();

  return 0;
}

- (id)prekeyData
{
  uint64_t v2;
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF5B20();

  return 0;
}

@end
