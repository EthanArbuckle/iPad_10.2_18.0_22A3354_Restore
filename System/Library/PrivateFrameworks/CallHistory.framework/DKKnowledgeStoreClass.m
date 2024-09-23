@implementation DKKnowledgeStoreClass

CHProtectedAppProvider *__get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CHProtectedAppProvider *result;
  CHProtectedAppProvider *v3;
  SEL v4;

  CoreDuetLibrary();
  result = (CHProtectedAppProvider *)objc_getClass("_DKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKKnowledgeStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CHProtectedAppProvider *)__get_DKKnowledgeStoreClass_block_invoke_cold_1();
    return -[CHProtectedAppProvider init](v3, v4);
  }
  return result;
}

uint64_t __get_DKKnowledgeStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CallDBMetaInfo writeDatabaseVersion:isTemp:].cold.1(v0);
}

@end
