@implementation UIView

void __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
  LODWORD(v2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v2);
  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_2;
  v4[3] = &unk_1E7778020;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setCompletionBlock:", v4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_3;
  block[3] = &unk_1E7778020;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

@end
