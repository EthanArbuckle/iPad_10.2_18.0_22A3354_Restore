@implementation PHAssistantServices

+ (CNContactStore)sharedContactStore
{
  if (qword_2558AE6B0 != -1)
    dispatch_once(&qword_2558AE6B0, &unk_24EF4A1A8);
  return (CNContactStore *)(id)qword_2558AE6A8;
}

@end
