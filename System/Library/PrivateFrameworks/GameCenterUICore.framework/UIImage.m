@implementation UIImage

void __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _gkloadRemoteImageForURL_queue_withCompletionHandler__shouldAnnotateImageUsage = objc_msgSend(v0, "shouldAnnotateImageUsage");

}

void __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = v3;
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "_gkImageWithCheckedData:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        v6 = _gkloadRemoteImageForURL_queue_withCompletionHandler__shouldAnnotateImageUsage == 0;
      else
        v6 = 1;
      if (!v6)
        objc_setAssociatedObject(v4, CFSTR("GK_IMAGE_URL_ANNOTATION_KEY"), *(id *)(a1 + 32), (void *)0x301);
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v3 = v7;
  }

}

uint64_t __65__UIImage_GKTransferFunction___gkReadAtSize_ARGBHostEndianBytes___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGContext *v7;
  CGImage *v8;
  CGRect v10;
  CGRect v11;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = (CGContext *)objc_msgSend(a2, "CGContext");
  v10.origin.x = v3;
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  CGContextClearRect(v7, v10);
  v8 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
  v11.origin.x = v3;
  v11.origin.y = v4;
  v11.size.width = v5;
  v11.size.height = v6;
  CGContextDrawImage(v7, v11, v8);
  CGBitmapContextGetBytesPerRow(v7);
  CGBitmapContextGetData(v7);
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
