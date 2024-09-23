@implementation ComponentMotionCoprocessor

- (BOOL)isPresent
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMotionCoprocessor motionCoprocessorServiceName](self, "motionCoprocessorServiceName"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aop")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMotionCoprocessor motionCoprocessorServiceName](self, "motionCoprocessorServiceName"));
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("SPUApp"));

  }
  return v4;
}

- (id)motionCoprocessorServiceName
{
  const __CFString *v2;
  void *v3;

  if (!qword_1000BA0B8)
  {
    v2 = CFSTR("aop");
    if (findDeviceWithName((unsigned __int8 *)objc_msgSend(CFSTR("aop"), "UTF8String"))
      || (v2 = CFSTR("SPUApp"), findDeviceWithName((unsigned __int8 *)objc_msgSend(CFSTR("SPUApp"), "UTF8String"))))
    {
      v3 = (void *)qword_1000BA0B8;
      qword_1000BA0B8 = (uint64_t)v2;

    }
  }
  return (id)qword_1000BA0B8;
}

@end
