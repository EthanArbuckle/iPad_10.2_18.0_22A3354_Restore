@implementation UIView

void __67__UIView__CRKCardViewVisibility___crk_otherSubviewsOccludeSubview___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  _BOOL4 v21;
  char v22;
  void *v23;
  CGRect v24;
  CGRect v25;

  v7 = a2;
  v8 = v7;
  if (*(_QWORD *)(a1 + 48) < a3)
  {
    v23 = v7;
    objc_msgSend(v7, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v25.origin.x = v17;
    v25.origin.y = v18;
    v25.size.width = v19;
    v25.size.height = v20;
    v24.origin.x = v10;
    v24.origin.y = v12;
    v24.size.width = v14;
    v24.size.height = v16;
    v21 = CGRectContainsRect(v24, v25);
    v8 = v23;
    if (v21)
    {
      v22 = objc_msgSend(v23, "isHidden");
      v8 = v23;
      if ((v22 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

@end
