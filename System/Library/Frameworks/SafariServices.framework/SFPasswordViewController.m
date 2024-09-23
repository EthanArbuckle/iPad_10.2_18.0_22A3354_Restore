@implementation SFPasswordViewController

void __46___SFPasswordViewController__connectToService__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 968);
  *(_QWORD *)(v1 + 968) = 0;

}

void __59___SFPasswordViewController__dismissPasswordViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

@end
