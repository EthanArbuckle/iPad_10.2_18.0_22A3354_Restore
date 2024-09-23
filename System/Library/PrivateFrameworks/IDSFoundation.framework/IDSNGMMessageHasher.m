@implementation IDSNGMMessageHasher

+ (id)computeHashForMessage:(id)a3
{
  id v3;
  Class v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("NGMMessageHasher"));
  if (v4)
  {
    objc_msgSend_computeHashForMessage_(v4, v5, (uint64_t)v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_19BAF5B9C();

    v8 = 0;
  }

  return v8;
}

@end
