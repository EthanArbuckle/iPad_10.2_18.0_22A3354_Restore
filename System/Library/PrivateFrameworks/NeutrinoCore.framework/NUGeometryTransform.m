@implementation NUGeometryTransform

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

- (__n128)transformMatrix:(uint64_t)a1@<X2>
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUGeometryTransform:Identity"));
}

- (unint64_t)hash
{
  return 0xF9475A206469BLL;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (self == a3)
    return 1;
  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (CGRect)transformRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double MaxY;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MaxX;
  double MinY;
  double MinX;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MinY = CGRectGetMinY(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxX = CGRectGetMaxX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v8 = CGRectGetMinY(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v9 = CGRectGetMinX(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MaxY = CGRectGetMaxY(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v11 = CGRectGetMaxX(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v12 = CGRectGetMaxY(v38);
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", MinX, MinY);
  v14 = v13;
  v16 = v15;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", MaxX, v8);
  v18 = v17;
  v20 = v19;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", v9, MaxY);
  v22 = v21;
  v24 = v23;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", v11, v12);
  v26 = v25;
  v28 = v27;
  v39.size.width = 0.0;
  v39.size.height = 0.0;
  v43.size.width = 0.0;
  v43.size.height = 0.0;
  v39.origin.x = v14;
  v39.origin.y = v16;
  v43.origin.x = v18;
  v43.origin.y = v20;
  v40 = CGRectUnion(v39, v43);
  v44.size.width = 0.0;
  v44.size.height = 0.0;
  v44.origin.x = v22;
  v44.origin.y = v24;
  v41 = CGRectUnion(v40, v44);
  v45.size.width = 0.0;
  v45.size.height = 0.0;
  v45.origin.x = v26;
  v45.origin.y = v28;
  return CGRectUnion(v41, v45);
}

@end
