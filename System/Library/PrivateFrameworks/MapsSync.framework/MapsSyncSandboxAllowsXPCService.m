@implementation MapsSyncSandboxAllowsXPCService

void __MapsSyncSandboxAllowsXPCService_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mach lookup not allowed. Add %@"), *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  MapsSyncSimulatedCrash(v1);

}

@end
