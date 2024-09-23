@implementation IDSNGMProtocolVersion

+ (BOOL)isVersionSupported:(unsigned int)a3
{
  uint64_t v3;
  Class v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v9;

  v3 = *(_QWORD *)&a3;
  v4 = NSClassFromString(CFSTR("NGMProtocolVersion"));
  if (v4)
    return objc_msgSend_isVersionSupported_(v4, v5, v3, v7);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    sub_19BAF5A78();

  return 0;
}

+ (unsigned)supportedVersion
{
  Class v2;
  const char *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;

  v2 = NSClassFromString(CFSTR("NGMProtocolVersion"));
  if (v2)
    return MEMORY[0x1E0DE7D20](v2, sel_supportedVersion, v4, v5);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF5A78();

  return 0;
}

@end
