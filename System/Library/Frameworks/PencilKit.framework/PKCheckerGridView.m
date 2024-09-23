@implementation PKCheckerGridView

void __42___PKCheckerGridView__createGridTileImage__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "colorB");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  v8.size.width = *(CGFloat *)(a1 + 40);
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.height = v8.size.width;
  CGContextFillRect(v3, v8);
  objc_msgSend(*(id *)(a1 + 32), "colorA");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v5, "CGColor"));

  v9.origin.x = *(CGFloat *)(a1 + 40);
  v9.origin.y = 0.0;
  v9.size.width = v9.origin.x;
  v9.size.height = v9.origin.x;
  CGContextFillRect(v3, v9);
  objc_msgSend(*(id *)(a1 + 32), "colorB");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v6, "CGColor"));

  v10.origin.x = *(CGFloat *)(a1 + 40);
  v10.origin.y = v10.origin.x;
  v10.size.width = v10.origin.x;
  v10.size.height = v10.origin.x;
  CGContextFillRect(v3, v10);
  objc_msgSend(*(id *)(a1 + 32), "colorA");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v7, "CGColor"));

  v11.origin.y = *(CGFloat *)(a1 + 40);
  v11.origin.x = 0.0;
  v11.size.width = v11.origin.y;
  v11.size.height = v11.origin.y;
  CGContextFillRect(v3, v11);
}

@end
