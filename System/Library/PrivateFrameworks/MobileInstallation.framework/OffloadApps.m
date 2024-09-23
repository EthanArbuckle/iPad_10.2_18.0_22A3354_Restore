@implementation OffloadApps

uint64_t ___OffloadApps_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  MICandidateAppContainer *v10;
  id *v11;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = -[MICandidateContainer initWithContainerURL:identifier:metadata:]([MICandidateAppContainer alloc], "initWithContainerURL:identifier:metadata:", v9, v8, v7);

  if (-[MICandidateContainer isAppleApp](v10, "isAppleApp"))
  {
    v11 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v11, "addObject:", v10);
    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v11 = (id *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

uint64_t ___OffloadApps_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "estimatedSize");
  v6 = objc_msgSend(v4, "estimatedSize");

  v7 = -1;
  if (v5 <= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

@end
