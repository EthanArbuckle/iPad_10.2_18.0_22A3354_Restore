@implementation ResetLaunchServicesDatabase

uint64_t ___ResetLaunchServicesDatabase_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  MICandidateContainer *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.lsd"));
  if (v10)
  {
    v11 = -[MICandidateContainer initWithContainerURL:identifier:metadata:]([MICandidateContainer alloc], "initWithContainerURL:identifier:metadata:", v7, v8, v9);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  }
  return v10 ^ 1u;
}

@end
