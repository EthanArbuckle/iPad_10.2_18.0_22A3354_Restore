@implementation NUViewGeometry

- (NUViewGeometry)init
{
  NUViewGeometry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUViewGeometry;
  result = -[NUViewGeometry init](&v3, sel_init);
  result->_maximumScale = 1.0;
  result->_backingScale = 1.0;
  return result;
}

- (CGSize)viewImageSize
{
  double backingScale;
  double v3;
  double v4;
  CGSize result;

  backingScale = self->_backingScale;
  v3 = self->_imageSize.width / backingScale;
  v4 = self->_imageSize.height / backingScale;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)imageBounds
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)proposedBoundsForBounds:(CGRect)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double MinX;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat MaxY;
  double v61;
  double MinY;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double MaxX;
  CGFloat v82;
  CGFloat recta;
  CGFloat rect;
  double rectb;
  CGFloat v86;
  double v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v87 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v73 = *MEMORY[0x24BDBEFB0];
    v74 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    recta = height;
    v16 = CGRectGetWidth(v88);
    v89.origin.x = v11;
    v89.origin.y = v10;
    v89.size.width = v9;
    v89.size.height = v8;
    v17 = CGRectGetWidth(v89);
    v86 = v9;
    v87 = v8;
    v90.size.width = width;
    v18 = v8;
    v19 = v16 / v17;
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.height = recta;
    v20 = CGRectGetHeight(v90);
    v80 = v11;
    v91.origin.x = v11;
    v69 = v10;
    v91.origin.y = v10;
    v91.size.width = v9;
    v91.size.height = v18;
    v21 = v20 / CGRectGetHeight(v91);
    if (v19 >= v21)
      v22 = v21;
    else
      v22 = v19;
    -[NUViewGeometry viewImageSize](self, "viewImageSize");
    v25 = NUBoundingRectForRotatedRect(v73, v74, v23, v24, self->_angle);
    v27 = v26;
    v29 = v28;
    v82 = v28;
    rect = v30;
    v31 = v30;
    -[NUViewGeometry contentInsetsWithScale:](self, "contentInsetsWithScale:", 1.0 / v22);
    v70 = v33;
    v71 = v32;
    v35 = v34;
    v37 = v36;
    v38 = NURectCenterRectInRect(v25, v27, v29, v31, v73, v74, v86, v87);
    v78 = v39;
    v79 = v38;
    v76 = v41;
    v77 = v40;
    v42 = v25;
    if (-[NUViewGeometry isFlipped](self, "isFlipped"))
      v43 = v71;
    else
      v43 = v37;
    v44 = v74 + v43;
    v45 = v86 - (v70 + v35);
    v46 = v87 - (v71 + v37);
    v47 = v45 * 0.5;
    if (v45 > 0.0)
      v47 = -0.0;
    v48 = v73 + v35 + v47;
    if (v45 <= 0.0)
      v49 = 0.0;
    else
      v49 = v86 - (v70 + v35);
    v50 = v46 * 0.5;
    if (v46 > 0.0)
      v50 = -0.0;
    v51 = v44 + v50;
    if (v46 <= 0.0)
      v52 = 0.0;
    else
      v52 = v46;
    v92.origin.x = v25;
    v75 = v27;
    v92.origin.y = v27;
    v92.size.width = v82;
    v92.size.height = rect;
    v53 = v79;
    v54 = round(CGRectGetWidth(v92));
    v93.origin.x = v48;
    v93.origin.y = v51;
    v93.size.width = v49;
    v93.size.height = v52;
    if (v54 <= round(CGRectGetWidth(v93)))
    {
      v94.origin.x = v48;
      v94.origin.y = v51;
      v94.size.width = v49;
      v94.size.height = v52;
      MaxX = CGRectGetMaxX(v94);
      v95.origin.x = v79;
      v95.origin.y = v78;
      v95.size.width = v77;
      v95.size.height = v76;
      v68 = CGRectGetMaxX(v95);
      v72 = v48;
      v96.origin.x = v48;
      v96.origin.y = v51;
      v96.size.width = v49;
      v96.size.height = v52;
      MinX = CGRectGetMinX(v96);
      v97.origin.x = v79;
      v97.origin.y = v78;
      v97.size.width = v77;
      v97.size.height = v76;
      v56 = CGRectGetMinX(v97);
      if (v68 >= MaxX)
      {
        v57 = 0.0;
        if (v68 > MaxX)
          v57 = -(v56 - (v68 - MaxX));
      }
      else
      {
        v57 = -v56;
      }
      if (v56 >= MinX)
        v58 = v57;
      else
        v58 = -MinX;
      v80 = v58;
      v53 = v79;
      v48 = v72;
    }
    v98.origin.x = v42;
    v98.origin.y = v75;
    v98.size.width = v82;
    v98.size.height = rect;
    v59 = round(CGRectGetHeight(v98));
    v99.origin.x = v48;
    v99.origin.y = v51;
    v99.size.width = v49;
    v99.size.height = v52;
    if (v59 <= round(CGRectGetHeight(v99)))
    {
      v100.origin.x = v48;
      v100.origin.y = v51;
      v100.size.width = v49;
      v100.size.height = v52;
      rectb = CGRectGetMaxY(v100);
      v101.origin.x = v53;
      v101.origin.y = v78;
      v101.size.width = v77;
      v101.size.height = v76;
      MaxY = CGRectGetMaxY(v101);
      v102.size.width = v49;
      v61 = MaxY;
      v102.origin.x = v48;
      v102.origin.y = v51;
      v102.size.height = v52;
      MinY = CGRectGetMinY(v102);
      v103.origin.x = v53;
      v103.origin.y = v78;
      v103.size.width = v77;
      v103.size.height = v76;
      v63 = CGRectGetMinY(v103);
      v64 = v61 - rectb;
      if (v61 < rectb)
        v64 = 0.0;
      v65 = v63 - v64;
      if (v63 >= MinY)
        v66 = v65;
      else
        v66 = MinY;
      v14 = -v66;
      v15 = v86;
    }
    else
    {
      v15 = v86;
      v14 = v69;
    }
    v13 = v80;
  }
  v67 = v87;
  result.size.height = v67;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (uint64_t)insetBoundsForCrop:(CGFloat)a3 inBounds:(CGFloat)a4 inFrame:(CGFloat)a5
{
  CGFloat Width;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.origin.x = a10;
  v24.origin.y = a11;
  v24.size.width = a12;
  v24.size.height = a13;
  Width = CGRectGetWidth(v24);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  CGRectGetWidth(v25);
  v26.origin.x = a10;
  v26.origin.y = a11;
  v26.size.width = a12;
  v26.size.height = a13;
  CGRectGetHeight(v26);
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  CGRectGetHeight(v27);
  return objc_msgSend(a1, "contentInsets", *(_QWORD *)&Width);
}

- (UIEdgeInsets)contentInsetsWithScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  -[NUViewGeometry contentInsets](self, "contentInsets");
  v5 = v4 * a3;
  v7 = v6 * a3;
  v9 = v8 * a3;
  v11 = v10 * a3;
  result.right = v11;
  result.bottom = v9;
  result.left = v7;
  result.top = v5;
  return result;
}

- (CGRect)boundingCropRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[NUViewGeometry cropRect](self, "cropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  CGAffineTransformMakeScale(&v20, 1.0 / self->_backingScale, 1.0 / self->_backingScale);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22 = CGRectApplyAffineTransform(v21, &v20);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  -[NUViewGeometry angle](self, "angle");
  v16 = NUBoundingRectForRotatedRect(x, y, width, height, v15);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)backingScale
{
  return self->_backingScale;
}

- (void)setBackingScale:(double)a3
{
  self->_backingScale = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)isFlipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (double)maximumScale
{
  return self->_maximumScale;
}

- (void)setMaximumScale:(double)a3
{
  self->_maximumScale = a3;
}

@end
