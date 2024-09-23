@implementation EFContentProtectionDumpDiagnosticState

void __EFContentProtectionDumpDiagnosticState_block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;

  _DiagnosticStateDictionary();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __EFContentProtectionDumpDiagnosticState_block_invoke_2;
  v3[3] = &unk_1E62A5B68;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

uint64_t __EFContentProtectionDumpDiagnosticState_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@\n"), a2, a3);
}

@end
