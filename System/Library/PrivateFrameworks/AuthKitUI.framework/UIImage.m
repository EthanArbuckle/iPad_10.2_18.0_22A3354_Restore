@implementation UIImage

uint64_t __42__UIImage_AuthKitUI__ak_copyScaledToSize___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = (void *)MEMORY[0x1E0CEA478];
  v6 = a2;
  objc_msgSend(v5, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  objc_msgSend(v6, "fillRect:", 0.0, 0.0, v3, v4);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v3, v4);
}

@end
