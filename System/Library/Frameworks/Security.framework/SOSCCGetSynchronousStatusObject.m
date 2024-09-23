@implementation SOSCCGetSynchronousStatusObject

void __SOSCCGetSynchronousStatusObject_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  secLogObjForScope("ghostbust");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "An error occurred on the xpc connection to setup the background session: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __SOSCCGetSynchronousStatusObject_block_invoke()
{
  SecSOSStatus *v0;
  void *v1;

  v0 = objc_alloc_init(SecSOSStatus);
  v1 = (void *)SOSCCGetSynchronousStatusObject_control;
  SOSCCGetSynchronousStatusObject_control = (uint64_t)v0;

}

@end
