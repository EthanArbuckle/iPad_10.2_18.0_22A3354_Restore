@implementation ASDTIOPAudioLPMicServiceManager

+ (id)ioServiceClassName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOPAudioLPMicDevice");
}

+ (id)ioServiceIDProperty
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "identifier");
}

@end
