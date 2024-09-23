@implementation NSError(IOGPUMetalErrors)

- (uint64_t)initWithIOGPUError:()IOGPUMetalErrors
{
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 > 0x12)
  {
    v5 = "Internal Error";
    v7 = 1;
    v6 = "Internal Error";
  }
  else
  {
    v5 = off_24CC3F8A0[a3];
    v6 = off_24CC3F938[a3];
    v7 = qword_21167AEA8[a3];
  }
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s (%08x:%s)"), v6, a3, v5);
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = *MEMORY[0x24BDD0FC8];
  v11 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOGPUCommandQueueErrorDomain"), a3, 0);
  v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v8, v10, v11, *MEMORY[0x24BDD1398], 0);
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD130], v7, v12);
}

@end
