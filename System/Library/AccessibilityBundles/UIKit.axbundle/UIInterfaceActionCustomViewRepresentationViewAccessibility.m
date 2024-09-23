@implementation UIInterfaceActionCustomViewRepresentationViewAccessibility

uint64_t __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke(CGRect *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  BOOL v11;
  double MaxY;
  double v13;
  BOOL v14;
  double v15;
  double MaxX;
  BOOL v17;
  double MinY;
  double MinX;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[32];

  *(double *)v24 = a2;
  *(double *)&v24[8] = a3;
  *(double *)&v24[16] = a4;
  *(double *)&v24[24] = a5;
  MinX = CGRectGetMinX(a1[1]);
  v21 = 0;
  if (MinX == CGRectGetMinX(*(CGRect *)v24))
  {
    MinY = CGRectGetMinY(a1[1]);
    v21 = MinY == CGRectGetMinY(*(CGRect *)v24);
  }
  MaxX = CGRectGetMaxX(a1[1]);
  v17 = 0;
  if (MaxX == CGRectGetMaxX(*(CGRect *)v24))
  {
    v15 = CGRectGetMinY(a1[1]);
    v17 = v15 == CGRectGetMinY(*(CGRect *)v24);
  }
  v5 = 0;
  if (v17)
    v5 = 2;
  v22 = v21 | (unint64_t)v5;
  v13 = CGRectGetMinX(a1[1]);
  v14 = 0;
  if (v13 == CGRectGetMinX(*(CGRect *)v24))
  {
    MaxY = CGRectGetMaxY(a1[1]);
    v14 = MaxY == CGRectGetMaxY(*(CGRect *)v24);
  }
  v6 = 0;
  if (v14)
    v6 = 4;
  v23 = v22 | v6;
  v10 = CGRectGetMaxX(a1[1]);
  v11 = 0;
  if (v10 == CGRectGetMaxX(*(CGRect *)v24))
  {
    v9 = CGRectGetMaxY(a1[1]);
    v11 = v9 == CGRectGetMaxY(*(CGRect *)v24);
  }
  v7 = 0;
  if (v11)
    v7 = 8;
  return v23 | v7;
}

BOOL __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke_2(void *a1, void *a2)
{
  double v2;
  id v4;
  BOOL v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "layer");
  objc_msgSend(v4, "cornerRadius");
  v5 = v2 > 0.0;

  objc_storeStrong(location, 0);
  return v5;
}

@end
