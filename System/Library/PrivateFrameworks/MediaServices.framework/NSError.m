@implementation NSError

id __43__NSError_MSVErrorAdditions__msv_signature__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v3, "msv_signature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__NSError_MSVErrorAdditions__msv_analyticSignature__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "msv_analyticSignature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("?"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));

}

id __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (*MEMORY[0x1E0CB3388] == a2 || *MEMORY[0x1E0CB2F70] == a2)
  {
    v7 = v4;
  }
  else
  {
    _MSVSanitizedPropertyListValue(v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

uint64_t __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "msv_errorByRemovingUnsafeUserInfo");
}

uint64_t __63__NSError_MSVErrorAdditions__msv_errorByRemovingUnsafeUserInfo__block_invoke()
{
  return _NSIsNSString();
}

@end
