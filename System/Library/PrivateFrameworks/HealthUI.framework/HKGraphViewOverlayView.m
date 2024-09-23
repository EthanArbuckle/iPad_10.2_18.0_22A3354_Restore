@implementation HKGraphViewOverlayView

uint64_t __49___HKGraphViewOverlayView_drawContentUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(v4, "CGContext");

  return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v9 + 16))(v9, v10, v6, v8);
}

@end
