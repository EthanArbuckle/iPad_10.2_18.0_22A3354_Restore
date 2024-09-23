@implementation ASDTIOPAudioIOBufferServiceManager

+ (id)ioServiceClassName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOPAudioIOBufferDevice");
}

+ (id)ioServiceIDProperty
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "identifier");
}

- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  +[ASDTIOPAudioIOBufferDevice forIOObject:andIDValue:](ASDTIOPAudioIOBufferDevice, "forIOObject:andIDValue:", *(_QWORD *)&a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
