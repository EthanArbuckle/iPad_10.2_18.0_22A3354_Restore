@implementation UIView(CKActionMenuView)

- (uint64_t)pointMostlyInside:()CKActionMenuView threshold:velocity:
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  CGFloat MaxY;
  double v26;
  _BOOL4 v27;
  _BOOL4 v28;
  double v29;
  double v30;
  CGPoint v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  objc_msgSend(a1, "bounds");
  v13 = v12 - a4;
  v15 = v14 - a4;
  v16 = a4 + a4;
  v18 = a4 + a4 + v17;
  v20 = v16 + v19;
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v18;
  v32.size.height = v20;
  v31.x = a2;
  v31.y = a3;
  if (CGRectContainsPoint(v32, v31) || (objc_msgSend(a1, "pointInside:withEvent:", 0, a2, a3) & 1) != 0)
    return 1;
  v22 = a6;
  v23 = *MEMORY[0x1E0C9D538];
  v30 = v22;
  if (a5 == *MEMORY[0x1E0C9D538] && v22 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    return 0;
  v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v33.origin.x = v13;
  v33.origin.y = v15;
  v33.size.width = v18;
  v33.size.height = v20;
  if (a2 < CGRectGetMinX(v33))
  {
    v34.origin.x = v13;
    v34.origin.y = v15;
    v34.size.width = v18;
    v34.size.height = v20;
    v23 = a2 - CGRectGetMinX(v34);
  }
  v35.origin.x = v13;
  v35.origin.y = v15;
  v35.size.width = v18;
  v35.size.height = v20;
  if (a3 < CGRectGetMinY(v35))
  {
    v36.origin.x = v13;
    v36.origin.y = v15;
    v36.size.width = v18;
    v36.size.height = v20;
    v29 = a3 - CGRectGetMinY(v36);
  }
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v18;
  v37.size.height = v20;
  if (a2 > CGRectGetMaxX(v37))
  {
    v38.origin.x = v13;
    v38.origin.y = v15;
    v38.size.width = v18;
    v38.size.height = v20;
    v23 = a2 - CGRectGetMaxX(v38);
  }
  v39.origin.x = v13;
  v39.origin.y = v15;
  v39.size.width = v18;
  v39.size.height = v20;
  MaxY = CGRectGetMaxY(v39);
  v26 = v29;
  if (a3 > MaxY)
  {
    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v18;
    v40.size.height = v20;
    v26 = a3 - CGRectGetMaxY(v40);
  }
  v27 = v23 == 0.0 || a5 / v23 > 10.0;
  v28 = v26 == 0.0 || v30 / v26 > 10.0;
  return v27 & v28;
}

@end
