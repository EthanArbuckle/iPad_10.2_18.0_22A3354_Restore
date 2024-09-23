@implementation CUIPSDLayerMaskRef

- (id)initLayerMaskWithLayerRef:(id)a3
{
  CUIPSDLayerMaskRef *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerMaskRef;
  v4 = -[CUIPSDLayerMaskRef init](&v6, sel_init);
  if (v4)
  {
    v4->_layerRef = (CUIPSDLayerRef *)a3;
    v4->_isVectorMask = 0;
  }
  return v4;
}

- (id)initVectorMaskWithLayerRef:(id)a3
{
  CUIPSDLayerMaskRef *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerMaskRef;
  v4 = -[CUIPSDLayerMaskRef init](&v6, sel_init);
  if (v4)
  {
    v4->_layerRef = (CUIPSDLayerRef *)a3;
    v4->_isVectorMask = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerMaskRef;
  -[CUIPSDLayerMaskRef dealloc](&v3, sel_dealloc);
}

- (id)layerRef
{
  return self->_layerRef;
}

- (BOOL)isLinked
{
  _BYTE *v2;

  v2 = -[CUIPSDLayerBaseRef _psdLayerRecord](self->_layerRef, "_psdLayerRecord");
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return v2[117] & 1;
}

- (BOOL)isEnabled
{
  _BYTE *v2;

  v2 = -[CUIPSDLayerBaseRef _psdLayerRecord](self->_layerRef, "_psdLayerRecord");
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return (v2[117] & 2) == 0;
}

- (BOOL)isInvertedWhenBlending
{
  _BYTE *v2;

  v2 = -[CUIPSDLayerBaseRef _psdLayerRecord](self->_layerRef, "_psdLayerRecord");
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return (v2[117] & 3) == 1;
}

- (CGRect)bounds
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int *v5;
  _DWORD *v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = -[CUIPSDLayerBaseRef _psdLayerRecord](self->_layerRef, "_psdLayerRecord");
  if (CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v3 + 20)) == 2 && !self->_isVectorMask)
  {
    v4 = v3 + 30;
    v5 = v3 + 31;
    v6 = v3 + 32;
    v7 = v3 + 33;
  }
  else
  {
    v4 = v3 + 25;
    v5 = v3 + 26;
    v6 = v3 + 27;
    v7 = v3 + 28;
  }
  v8 = *v5;
  v9 = *v4;
  v10 = (double)v8;
  v11 = (double)v9;
  v12 = (double)(*v7 - v8);
  v13 = (double)(*v6 - v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPath)newBezierPath
{
  return -[CUIPSDLayerMaskRef newBezierPathAtScale:](self, "newBezierPathAtScale:", 1.0);
}

- (CGPath)newBezierPathAtScale:(double)a3
{
  CGFloat v3;
  CGFloat v4;
  CGPath *Mutable;
  _QWORD *FirstItemOfTypeID;
  unsigned int v9;
  double v10;
  double v11;
  unsigned __int16 v12;
  double v13;
  double v14;
  uint64_t Subpath;
  unsigned int v16;
  CGPath *v17;
  unsigned int v18;
  unsigned __int16 v19;
  __int128 v20;
  CGPath *v22;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  if (!self->_isVectorMask)
    return 0;
  Mutable = CGPathCreateMutable();
  v9 = *((unsigned __int16 *)FirstItemOfTypeID + 44);
  objc_msgSend(-[CUIPSDLayerBaseRef _psdImageRef](self->_layerRef, "_psdImageRef"), "size");
  if (v9)
  {
    v12 = 0;
    v13 = v10 * a3;
    v14 = v11 * a3;
    do
    {
      Subpath = CPSDPathsResourceItem::GetSubpath((CPSDPathsResourceItem *)(FirstItemOfTypeID + 7), v12);
      v16 = *(unsigned __int8 *)(Subpath + 18);
      v17 = CGPathCreateMutable();
      v18 = 0;
      do
      {
        if (v18 == v16)
          v19 = 0;
        else
          v19 = v18;
        CPSDPathResource::GetBezierKnot(Subpath, v19, &v26, &v25, &v27);
        v20 = v26;
        memset(&v24, 0, sizeof(v24));
        CGAffineTransformMakeScale(&v24, v13, v14);
        if (v18)
          CGPathAddCurveToPoint(v17, &v24, v4, v3, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
        else
          CGPathMoveToPoint(v17, &v24, *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
        v3 = *((double *)&v27 + 1);
        v4 = *(double *)&v27;
      }
      while (v18++ < v16);
      CGPathCloseSubpath(v17);
      CGPathAddPath(Mutable, 0, v17);
      CGPathRelease(v17);
      ++v12;
    }
    while (v9 > v12);
  }
  v22 = (CGPath *)MEMORY[0x1A1AEE508](Mutable);
  CGPathRelease(Mutable);
  return v22;
}

- (CGImage)createCGImageMask
{
  if (self->_isVectorMask)
    return 0;
  else
    return -[CUIPSDLayerBaseRef _createMaskFromAlphaChannel:](self->_layerRef, "_createMaskFromAlphaChannel:", -[CUIPSDLayerBaseRef hasVectorMask](self->_layerRef, "hasVectorMask"));
}

@end
