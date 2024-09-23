@implementation INProcessGetInstanceUUID

void ___INProcessGetInstanceUUID_block_invoke()
{
  uint64_t v0;
  void *v1;
  uuid_t uu;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (xpc_get_instance())
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
    v1 = (void *)_INProcessGetInstanceUUID_instanceUUID;
    _INProcessGetInstanceUUID_instanceUUID = v0;

  }
}

@end
