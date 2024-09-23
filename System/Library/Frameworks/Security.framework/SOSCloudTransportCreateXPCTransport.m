@implementation SOSCloudTransportCreateXPCTransport

uint64_t __SOSCloudTransportCreateXPCTransport_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a2;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Calling default itemsChangedBlock - fatal: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

@end
