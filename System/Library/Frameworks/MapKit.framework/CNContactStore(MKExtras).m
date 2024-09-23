@implementation CNContactStore(MKExtras)

+ (BOOL)_mapkit_isAuthorized
{
  return (unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) < 2;
}

@end
