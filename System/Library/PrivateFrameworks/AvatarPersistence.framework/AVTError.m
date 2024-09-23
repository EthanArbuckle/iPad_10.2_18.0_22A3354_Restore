@implementation AVTError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AVTAvatarUIErrorDomain"), a3, a4);
}

@end
