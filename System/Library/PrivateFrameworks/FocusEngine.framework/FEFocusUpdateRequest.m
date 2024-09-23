@implementation FEFocusUpdateRequest

void __78___FEFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 != v9)
  {
    v8 = _FEFocusEnvironmentPrefersFocusContainment(v9);
    v7 = v9;
    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v7 = v9;
      *a3 = 1;
    }
  }

}

@end
