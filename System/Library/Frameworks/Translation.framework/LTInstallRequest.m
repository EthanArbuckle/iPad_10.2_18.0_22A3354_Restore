@implementation LTInstallRequest

void __56___LTInstallRequest__startInstallationWithService_done___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v2 = objc_msgSend(a1[5], "copy");
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v2;

    objc_storeStrong((id *)WeakRetained + 2, a1[4]);
    objc_msgSend(*((id *)WeakRetained + 2), "startInstallRequest:");
  }

}

@end
