@implementation AXUIIconImageWithBackgroundForImage

uint64_t __AXUIIconImageWithBackgroundForImage_block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "size");
  v5 = *(double *)(a1 + 48) + (v3 - v4) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "size");
  v9 = *(double *)(a1 + 56) + (v7 - v8) * 0.5;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "size");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v10, "drawInRect:", 0.0, 0.0, v12, v13);
  v14 = *(void **)(a1 + 40);
  objc_msgSend(v14, "size");
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 40), "size");
  return objc_msgSend(v14, "drawInRect:", v5, v9, v16, v17);
}

@end
