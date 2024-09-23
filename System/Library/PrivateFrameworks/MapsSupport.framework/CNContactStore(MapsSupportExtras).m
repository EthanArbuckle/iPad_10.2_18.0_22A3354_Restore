@implementation CNContactStore(MapsSupportExtras)

+ (BOOL)_maps_isAuthorized
{
  void *v0;
  _BOOL8 v1;

  v0 = (void *)tcc_identity_create();
  if (v0)
    v1 = (unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) < 2;
  else
    v1 = 0;

  return v1;
}

@end
