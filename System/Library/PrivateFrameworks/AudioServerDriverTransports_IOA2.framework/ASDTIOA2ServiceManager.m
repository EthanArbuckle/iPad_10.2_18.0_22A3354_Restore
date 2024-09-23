@implementation ASDTIOA2ServiceManager

+ (id)ioServiceClassName
{
  return CFSTR("IOAudio2Device");
}

+ (id)ioServiceIDProperty
{
  return CFSTR("device UID");
}

- (BOOL)ioServiceCanBeAdded:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("is private"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
