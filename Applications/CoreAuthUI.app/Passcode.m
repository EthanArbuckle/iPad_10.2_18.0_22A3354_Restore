@implementation Passcode

- (Passcode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)Passcode;
  return -[Passcode init](&v3, "init");
}

- (int64_t)type
{
  void *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t result;
  uint64_t v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
  v3 = (char *)objc_msgSend(v2, "passcodeType");

  result = (int64_t)(v3 - 1);
  if ((unint64_t)(v3 - 1) >= 4)
  {
    v7 = LALogForCategory(0, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000564BC((uint64_t)v3, v8);

    return 3;
  }
  return result;
}

- (int64_t)length
{
  return LACPasscodeTypeLength(-[Passcode type](self, "type"));
}

- (BOOL)isComplex
{
  return (-[Passcode type](self, "type") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)currentPasscode
{
  return objc_alloc_init(Passcode);
}

@end
