@implementation UIDocumentPickerContainerItem

void __52___UIDocumentPickerContainerItem__lruThumbnailArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_lruThumbnailArray_cacheArray;
  _lruThumbnailArray_cacheArray = v0;

}

void __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v4)
    {
      if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_createThumbnailWithSize:scale:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
        {
          v7[0] = MEMORY[0x24BDAC760];
          v7[1] = 3221225472;
          v7[2] = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_2;
          v7[3] = &unk_24E43AD78;
          v7[4] = *(_QWORD *)(a1 + 32);
          v8 = v5;
          v9 = *(id *)(a1 + 40);
          v10 = *(id *)(a1 + 48);
          dispatch_async(MEMORY[0x24BDAC9B8], v7);

        }
      }
    }
  }

}

void __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "refreshItem:thumbnailOnly:", *(_QWORD *)(a1 + 32), 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_3;
  block[3] = &unk_24E43A808;
  v3 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke_3(uint64_t a1)
{
  return +[_UIDocumentPickerContainerItem markThumbnailAsRecentlyUsed:](_UIDocumentPickerContainerItem, "markThumbnailAsRecentlyUsed:", *(_QWORD *)(a1 + 32));
}

void __65___UIDocumentPickerContainerItem__createThumbnailWithSize_scale___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGContext *v7;
  id v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v9 = a2;
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x24BDBEFB0], v4, v5, v6);
  if (*(_BYTE *)(a1 + 56))
  {
    v7 = (CGContext *)objc_msgSend(v9, "CGContext");
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v7, (CGColorRef)objc_msgSend(v8, "CGColor"));

    CGContextSetLineWidth(v7, 1.0);
    v10.origin.x = v3;
    v10.origin.y = v4;
    v10.size.width = v5;
    v10.size.height = v6;
    v11 = CGRectInset(v10, 0.5, 0.5);
    CGContextStrokeRect(v7, v11);
  }

}

id __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;
  double v16;

  +[_UIDocumentPickerURLContainerModel tagColorsByTag](_UIDocumentPickerURLContainerModel, "tagColorsByTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 40);
  v4 = v3 * 0.5;
  v5 = ceil(v3);
  v6 = v5 + (double)(unint64_t)(objc_msgSend(*(id *)(a1 + 32), "count") - 1) * (v3 * 0.5);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setScale:", *(double *)(a1 + 48));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v7, v6, v5);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke_2;
  v12[3] = &unk_24E43ADF0;
  v13 = *(id *)(a1 + 32);
  v14 = v2;
  v15 = v4;
  v16 = v5;
  v9 = v2;
  objc_msgSend(v8, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  uint64_t v4;
  CGFloat v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
  if (v4 >= 0)
  {
    do
    {
      v5 = *(double *)(a1 + 48) * (double)v4;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17.size.width = *(CGFloat *)(a1 + 56);
      v17.origin.y = 0.0;
      v17.origin.x = v5;
      v17.size.height = v17.size.width;
      v18 = CGRectInset(v17, 0.5, 0.5);
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      CGContextAddEllipseInRect(v3, v18);
      CGContextSetLineWidth(v3, 1.0);
      v12 = objc_retainAutorelease(v7);
      CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v12, "CGColor"));
      CGContextFillPath(v3);
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_colorBlendedWithColor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      CGContextAddEllipseInRect(v3, v19);
      v16 = objc_retainAutorelease(v15);
      CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v16, "CGColor"));
      CGContextStrokePath(v3);

      --v4;
    }
    while (v4 != -1);
  }
}

uint64_t __88___UIDocumentPickerContainerItem_Icons___blockingFolderIconForURL_container_size_scale___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(*(id *)(a1 + 32), "size");
  UIRectCenteredXInRect();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v3, v8 - *(double *)(a1 + 56) - *(double *)(a1 + 64), v5, v7);
}

@end
