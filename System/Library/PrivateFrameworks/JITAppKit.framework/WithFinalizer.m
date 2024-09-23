@implementation WithFinalizer

void __WithFinalizer_block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "tkPage");
  objc_msgSend(v1, "dispose");

}

@end
