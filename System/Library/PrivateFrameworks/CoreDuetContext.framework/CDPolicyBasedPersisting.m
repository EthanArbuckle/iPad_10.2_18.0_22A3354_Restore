@implementation CDPolicyBasedPersisting

uint64_t __47___CDPolicyBasedPersisting_deleteRegistration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteRegistration:", *(_QWORD *)(a1 + 40));
}

uint64_t __45___CDPolicyBasedPersisting_saveRegistration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveRegistration:", *(_QWORD *)(a1 + 40));
}

uint64_t __41___CDPolicyBasedPersisting_deleteAllData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteAllData");
}

uint64_t __52___CDPolicyBasedPersisting_deleteDataCreatedBefore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteDataCreatedBefore:", *(_QWORD *)(a1 + 40));
}

@end
