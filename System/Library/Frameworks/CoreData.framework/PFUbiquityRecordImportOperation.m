@implementation PFUbiquityRecordImportOperation

PFUbiquityKnowledgeVector *__40___PFUbiquityRecordImportOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  PFUbiquityKnowledgeVector *result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 264);
  else
    v3 = 0;
  result = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithStoreKnowledgeVectorDictionary:", -[NSSQLCore fetchUbiquityKnowledgeVector](v3));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = result;
  return result;
}

void __40___PFUbiquityRecordImportOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSSaveChangesRequest *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 264);
  else
    v3 = 0;
  v9 = (id)objc_msgSend((id)objc_msgSend(v3, "metadata"), "mutableCopy");
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupCheckForFork"));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 264);
  else
    v5 = 0;
  objc_msgSend(v5, "setMetadata:", v9);
  v6 = objc_alloc_init(NSSaveChangesRequest);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 264);
  else
    v8 = 0;
  objc_msgSend(v8, "executeRequest:withContext:error:", v6, 0, 0);

}

void __40___PFUbiquityRecordImportOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSSaveChangesRequest *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 264);
  else
    v3 = 0;
  v9 = (id)objc_msgSend((id)objc_msgSend(v3, "metadata"), "mutableCopy");
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupCheckForFork"));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 264);
  else
    v5 = 0;
  objc_msgSend(v5, "setMetadata:", v9);
  v6 = objc_alloc_init(NSSaveChangesRequest);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 264);
  else
    v8 = 0;
  objc_msgSend(v8, "executeRequest:withContext:error:", v6, 0, 0);

}

uint64_t __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "transactionDate"), "compare:", objc_msgSend(a3, "transactionDate"));
}

uint64_t __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v3 = 0;
    if (!a2)
      return -[PFUbiquityKnowledgeVector conflictsWithKnowledgeVector:](v3, (id *)a2);
    goto LABEL_3;
  }
  v3 = *(_QWORD *)(v2 + 32);
  if (a2)
LABEL_3:
    a2 = *(_QWORD *)(a2 + 56);
  return -[PFUbiquityKnowledgeVector conflictsWithKnowledgeVector:](v3, (id *)a2);
}

@end
