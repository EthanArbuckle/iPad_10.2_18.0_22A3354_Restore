@implementation ASDTIOPAudioCMServiceManager

+ (id)ioServiceClassName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOPAudioClientManagerDevice");
}

+ (id)ioServiceIDProperty
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "identifier");
}

- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  +[ASDTIOPAudioCMDevice forIOObject:andIDValue:](ASDTIOPAudioCMDevice, "forIOObject:andIDValue:", *(_QWORD *)&a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
