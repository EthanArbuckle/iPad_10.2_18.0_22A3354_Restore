@implementation CPSEntityStylesDropShadow

- (void)applyShadowToLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;
  UIColor *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  CPSEntityStylesDropShadow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = location[0];
  v7 = -[CPSEntityStylesDropShadow color](v12, "color");
  objc_msgSend(v6, "setShadowColor:", -[UIColor CGColor](objc_retainAutorelease(v7), "CGColor"));

  v8 = location[0];
  -[CPSEntityStylesDropShadow offset](v12, "offset");
  objc_msgSend(v8, "setShadowOffset:", v3, v4);
  v9 = location[0];
  -[CPSEntityStylesDropShadow radius](v12, "radius");
  objc_msgSend(v9, "setShadowRadius:");
  v10 = location[0];
  -[CPSEntityStylesDropShadow opacity](v12, "opacity");
  *(float *)&v5 = v5;
  objc_msgSend(v10, "setShadowOpacity:", v5);
  objc_storeStrong(location, 0);
}

- (CGRect)rectsForSource:(CGRect)a3 shadowRect:(CGRect *)a4 unionRect:(CGRect *)a5 positionTransform:(CGAffineTransform *)a6
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat tx;
  CGAffineTransform v19;
  CGRect v20;
  CGAffineTransform v21;
  CGRect v22;
  CGAffineTransform __dst;
  CGAffineTransform __b;
  CGRect v25;
  uint64_t v26;
  CGFloat ty;
  double v28;
  uint64_t v29;
  CGAffineTransform v30;
  CGRect v31;
  CGRect v32;
  CGAffineTransform *v33;
  CGRect *v34;
  CGRect *v35;
  SEL v36;
  CPSEntityStylesDropShadow *v37;
  CGRect v38;
  __int128 v39;
  __int128 v40;
  CGRect v41;
  CGRect result;

  v38 = a3;
  v37 = self;
  v36 = a2;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  -[CPSEntityStylesDropShadow radius](self, "radius");
  -[CPSEntityStylesDropShadow radius](v37, "radius");
  -[CPSEntityStylesDropShadow radius](v37, "radius");
  -[CPSEntityStylesDropShadow radius](v37, "radius");
  CGRectMake_11();
  v32.origin.x = v6;
  v32.origin.y = v7;
  v32.size.width = v8;
  v32.size.height = v9;
  -[CPSEntityStylesDropShadow offset](v37, "offset");
  v28 = v10;
  v29 = v11;
  tx = v10;
  -[CPSEntityStylesDropShadow offset](v37, "offset");
  v26 = v12;
  ty = v13;
  CGAffineTransformMakeTranslation(&v30, tx, v13);
  v31 = CGRectApplyAffineTransform(v32, &v30);
  v32 = v31;
  v25 = CGRectUnion(v38, v31);
  memset(&__b, 0, sizeof(__b));
  CGAffineTransformMakeTranslation(&__b, -v25.origin.x, -v25.origin.y);
  v39 = 0u;
  v40 = 0u;
  memcpy(&__dst, &__b, sizeof(__dst));
  v41 = CGRectApplyAffineTransform(v38, &__dst);
  *(CGFloat *)&v39 = v41.origin.x;
  *((_QWORD *)&v39 + 1) = *(_QWORD *)&v41.origin.y;
  *(CGFloat *)&v40 = v41.size.width;
  *((_QWORD *)&v40 + 1) = *(_QWORD *)&v41.size.height;
  memcpy(&v21, &__b, sizeof(v21));
  v22 = CGRectApplyAffineTransform(v32, &v21);
  v32 = v22;
  memcpy(&v19, &__b, sizeof(v19));
  v20 = CGRectApplyAffineTransform(v25, &v19);
  v25 = v20;
  if (v35)
    *v35 = v32;
  if (v34)
    *v34 = v25;
  if (v33)
    memcpy(v33, &__b, sizeof(CGAffineTransform));
  v15 = *((double *)&v39 + 1);
  v14 = *(double *)&v39;
  v17 = *((double *)&v40 + 1);
  v16 = *(double *)&v40;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  height = self->_offset.height;
  width = self->_offset.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
