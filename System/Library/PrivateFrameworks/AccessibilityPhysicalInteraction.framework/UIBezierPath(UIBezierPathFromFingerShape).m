@implementation UIBezierPath(UIBezierPathFromFingerShape)

+ (id)bezierPathForFingerShape:()UIBezierPathFromFingerShape inRect:curveOnly:
{
  void *v14;
  double v15;
  double MaxX;
  double MaxY;
  CGFloat MinX;
  double MinY;
  double v20;
  double MidX;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= a4)
    v15 = a4;
  else
    v15 = a3;
  v28 = v15;
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  MinY = CGRectGetMinY(v32);
  v20 = 0.0;
  switch(a7)
  {
    case 0:
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      MidX = CGRectGetMidX(v33);
      v34.origin.x = a1;
      v34.origin.y = a2;
      v34.size.width = a3;
      v34.size.height = a4;
      objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v34), v28 * 0.5, 1.57079633, 7.85398163);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
      v20 = 4.71238898;
      v25 = 3.14159265;
      v23 = MinX;
      v24 = MaxY;
      break;
    case 2:
      v25 = 4.71238898;
      v23 = MinX;
      v24 = MinY;
      goto LABEL_11;
    case 3:
      v20 = 3.14159265;
      v25 = 1.57079633;
      v23 = MaxX;
      v24 = MaxY;
      MaxY = MinY;
      break;
    case 4:
      v20 = 1.57079633;
      v23 = MaxX;
      v24 = MinY;
      v25 = 0.0;
      MaxY = MinY;
LABEL_11:
      MaxX = MinX;
      break;
    default:
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      MaxY = 0.0;
      MaxX = 0.0;
      break;
  }
  if (a8)
  {
    objc_msgSend(v14, "moveToPoint:", v23, v24);
    objc_msgSend(v14, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, MaxY, v28, v25, v20);
  }
  else
  {
    objc_msgSend(v14, "moveToPoint:", MaxX, MaxY);
    objc_msgSend(v14, "addLineToPoint:", v23, v24);
    objc_msgSend(v14, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, MaxY, v28, v25, v20);
    objc_msgSend(v14, "addLineToPoint:", MaxX, MaxY);
    objc_msgSend(v14, "closePath");
  }
  v22 = v14;
LABEL_16:
  v26 = v22;

  return v26;
}

@end
