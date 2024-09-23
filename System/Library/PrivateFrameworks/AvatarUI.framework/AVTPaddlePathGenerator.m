@implementation AVTPaddlePathGenerator

+ (id)concentricCornerPathWithBaseRect:(CGRect)a3 radius:(double)a4 topToBottom:(BOOL)a5 rightToLeft:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v6 = a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  if (v7)
  {
    v17 = MaxY;
    if (v6)
    {
      v18 = MinX - a4;
      v19 = MaxY - a4;
      v20 = 0.0;
      v23 = 1.57079633;
      MinY = MaxY;
LABEL_8:
      MaxX = v18;
      goto LABEL_9;
    }
    v19 = MaxY - a4;
    v18 = MaxX + a4;
    v23 = 3.14159265;
    v20 = 1.57079633;
    MinX = MaxX;
    MinY = MaxY - a4;
  }
  else
  {
    if (!v6)
    {
      v18 = MaxX + a4;
      v19 = MinY + a4;
      v23 = 4.71238898;
      v20 = 3.14159265;
      MinX = MaxX;
      v17 = MinY;
      goto LABEL_8;
    }
    v19 = MinY + a4;
    v18 = MinX - a4;
    v23 = 0.0;
    v20 = 4.71238898;
    v17 = MinY;
    MinY = MinY + a4;
    MaxX = MinX;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moveToPoint:", MaxX, MinY);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, v19, a4, v23, v20);
  objc_msgSend(v21, "addLineToPoint:", MinX, v17);
  objc_msgSend(v21, "closePath");
  return v21;
}

+ (id)paddlePathWithBaseRect:(CGRect)a3 contentRect:(CGRect)a4 radius:(double)a5 topToBottom:(BOOL)a6 rightToLeft:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double MinY;
  uint64_t v16;
  double MaxY;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double rect;
  CGRect v27;
  CGRect v28;

  v7 = a7;
  v8 = a6;
  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  if (a6)
  {
    MinY = CGRectGetMinY(a4);
    v16 = 3;
  }
  else
  {
    MaxY = CGRectGetMaxY(a3);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = rect;
    MinY = MaxY - CGRectGetMaxY(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = rect;
    v13 = CGRectGetMaxY(v28);
    v16 = 12;
  }
  v18 = 13;
  if (!v7)
    v18 = 14;
  v19 = 11;
  if (v7)
    v19 = 7;
  if (v8)
    v20 = v18;
  else
    v20 = v19;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v16, v14, v13, v12, MinY, a5, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "closePath");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v20, x, y, width, rect, a5, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "closePath");
  +[AVTPaddlePathGenerator concentricCornerPathWithBaseRect:radius:topToBottom:rightToLeft:](AVTPaddlePathGenerator, "concentricCornerPathWithBaseRect:radius:topToBottom:rightToLeft:", v8, v7, v14, v13, v12, MinY, a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendPath:", v21);
  objc_msgSend(v24, "appendPath:", v22);
  objc_msgSend(v24, "appendPath:", v23);

  return v24;
}

@end
