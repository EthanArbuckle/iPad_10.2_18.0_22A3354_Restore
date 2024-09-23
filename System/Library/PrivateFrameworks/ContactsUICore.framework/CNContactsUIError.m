@implementation CNContactsUIError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), a3, a4);
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

@end
