@implementation NetTopoDeviceConnectionLayer

- (void)initNetTopoDeviceConnectionLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CAShapeLayer *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_class *v20;
  int *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;

  if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer initNetTopoDeviceConnectionLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
  self->super._selectable = 0;
  objc_msgSend_setOwningView_(self, a2, (uint64_t)a4);
  v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  self->_connectionLineLayer = v10;
  objc_msgSend_setDelegate_(v10, v11, (uint64_t)self);
  v13 = objc_msgSend_setLineCap_(self->_connectionLineLayer, v12, *MEMORY[0x24BDE5CE8]);
  if (self->super._topoStyle)
  {
    if (sub_21A731938(v13, v14, v15))
    {
      self->_lineColorEthernet = sub_21A71CA30(0.45, 0.45, 0.45, 1.0);
      v16 = 1.0;
      v17 = 0.45;
      v18 = 0.45;
      v19 = 0.45;
    }
    else
    {
      self->_lineColorEthernet = sub_21A71CA30(0.584313725, 0.607843137, 0.662745098, 1.0);
      v16 = 1.0;
      v17 = 0.584313725;
      v18 = 0.607843137;
      v19 = 0.662745098;
    }
    v20 = sub_21A71CA30(v17, v18, v19, v16);
    v21 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
  }
  else
  {
    self->_lineColorActive = sub_21A71CA30(1.0, 1.0, 1.0, 0.8);
    v20 = sub_21A71CA30(1.0, 1.0, 1.0, 0.2);
    v21 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorInactive;
  }
  *(Class *)((char *)&self->super.super.super.isa + *v21) = v20;
  self->_selectedLineColor = sub_21A71CA30(0.117647059, 0.137254902, 0.823529412, 1.0);
  self->_whiteColor = sub_21A71CA30(1.0, 1.0, 1.0, 0.75);
  self->_clearColor = sub_21A71CAC4();
  objc_msgSend_setZPosition_(self, v22, v23, 0.0);
  objc_msgSend_addSublayer_(self, v24, (uint64_t)self->_connectionLineLayer);
}

- (NetTopoDeviceConnectionLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v5;
  NetTopoDeviceConnectionLayer *v6;
  const char *v7;
  NetTopoDeviceConnectionLayer *v8;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NetTopoDeviceConnectionLayer;
  v6 = -[NetTopoObjectLayer initWithUIStyle:andOwningView:](&v10, sel_initWithUIStyle_andOwningView_);
  v8 = v6;
  if (v6)
    objc_msgSend_initNetTopoDeviceConnectionLayerCommonWithStyle_andOwningView_(v6, v7, v5, a4);
  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int topoStyle;
  BOOL v8;
  int *v9;
  int *v10;
  objc_super v11;

  if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);

  self->_connectionLineLayer = 0;
  topoStyle = self->super._topoStyle;
  v8 = topoStyle == 0;
  if (topoStyle)
    v9 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
  else
    v9 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorActive;
  if (v8)
    v10 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorInactive;
  else
    v10 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorEthernet;
  CGColorRelease(*(CGColorRef *)((char *)&self->super.super.super.isa + *v9));
  CGColorRelease(*(CGColorRef *)((char *)&self->super.super.super.isa + *v10));
  CGColorRelease(self->_selectedLineColor);
  self->_selectedLineColor = 0;
  CGColorRelease(self->_clearColor);
  self->_clearColor = 0;
  CGColorRelease(self->_whiteColor);
  self->_whiteColor = 0;
  v11.receiver = self;
  v11.super_class = (Class)NetTopoDeviceConnectionLayer;
  -[NetTopoObjectLayer dealloc](&v11, sel_dealloc);
}

- (CGRect)getUserInteractionBounds
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect result;

  if (dword_2550F4A38 <= 800)
  {
    if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
    {
      objc_msgSend_bounds(self, a2, v2);
      v5 = v4;
      objc_msgSend_bounds(self, v6, v7);
      objc_msgSend_bounds(self, v8, v9);
      objc_msgSend_bounds(self, v10, v11);
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"bounds = (x = %.2f, y = %.2f, w = %.2f, h = %.2f)\n", v12, v13, v14, v15, v5);
    }
    if (dword_2550F4A38 <= 800)
    {
      if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
      {
        objc_msgSend_frame(self, a2, v2);
        v17 = v16;
        objc_msgSend_frame(self, v18, v19);
        objc_msgSend_frame(self, v20, v21);
        objc_msgSend_frame(self, v22, v23);
        sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"frame = (x = %.2f, y = %.2f, w = %.2f, h = %.2f)\n", v24, v25, v26, v27, v17);
      }
      if (dword_2550F4A38 <= 800)
      {
        if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
        {
          objc_msgSend_position(self, a2, v2);
          v29 = v28;
          objc_msgSend_position(self, v30, v31);
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"position = (x = %.2f, y = %.2f)\n", v32, v33, v34, v35, v29);
        }
        if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
        {
          objc_msgSend_anchorPoint(self, a2, v2);
          v37 = v36;
          objc_msgSend_anchorPoint(self, v38, v39);
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer getUserInteractionBounds]", 800, (uint64_t)"anchor = (x = %.2f, y = %.2f)\n", v40, v41, v42, v43, v37);
        }
      }
    }
  }
  objc_msgSend_bounds(self, a2, v2);
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)setDownstreamConnectionPoint:(CGPoint)a3
{
  uint64_t v3;
  double y;
  double x;
  uint64_t *p_downstreamConnectionPoint;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  p_downstreamConnectionPoint = (uint64_t *)&self->_downstreamConnectionPoint;
  v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  *p_downstreamConnectionPoint = v14;
  p_downstreamConnectionPoint[1] = v15;
  if (dword_2550F4A38 <= 800)
  {
    if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setDownstreamConnectionPoint:]", 800, (uint64_t)"input point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setDownstreamConnectionPoint:]", 800, (uint64_t)"converted point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *p_downstreamConnectionPoint);
  }
}

- (CGPoint)downstreamConnectionPoint
{
  uint64_t v2;
  CGPoint *p_downstreamConnectionPoint;
  uint64_t v5;
  const char *v6;
  double v7;
  double v8;
  CGPoint result;

  p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
  v5 = objc_msgSend_superlayer(self, a2, v2);
  objc_msgSend_convertPoint_toLayer_(self, v6, v5, p_downstreamConnectionPoint->x, p_downstreamConnectionPoint->y);
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setUpstreamConnectionPoint:(CGPoint)a3
{
  uint64_t v3;
  double y;
  double x;
  uint64_t *p_upstreamConnectionPoint;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  p_upstreamConnectionPoint = (uint64_t *)&self->_upstreamConnectionPoint;
  v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  *p_upstreamConnectionPoint = v14;
  p_upstreamConnectionPoint[1] = v15;
  if (dword_2550F4A38 <= 800)
  {
    if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setUpstreamConnectionPoint:]", 800, (uint64_t)"input point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setUpstreamConnectionPoint:]", 800, (uint64_t)"converted point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *p_upstreamConnectionPoint);
  }
}

- (CGPoint)upstreamConnectionPoint
{
  uint64_t v2;
  CGPoint *p_upstreamConnectionPoint;
  uint64_t v5;
  const char *v6;
  double v7;
  double v8;
  CGPoint result;

  p_upstreamConnectionPoint = &self->_upstreamConnectionPoint;
  v5 = objc_msgSend_superlayer(self, a2, v2);
  objc_msgSend_convertPoint_toLayer_(self, v6, v5, p_upstreamConnectionPoint->x, p_upstreamConnectionPoint->y);
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)siblingMergePoint
{
  uint64_t v2;
  CGPoint *p_siblingMergePoint;
  uint64_t v5;
  const char *v6;
  double v7;
  double v8;
  CGPoint result;

  p_siblingMergePoint = &self->_siblingMergePoint;
  v5 = objc_msgSend_superlayer(self, a2, v2);
  objc_msgSend_convertPoint_toLayer_(self, v6, v5, p_siblingMergePoint->x, p_siblingMergePoint->y);
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setSiblingMergePoint:(CGPoint)a3
{
  uint64_t v3;
  double y;
  double x;
  uint64_t *p_siblingMergePoint;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  p_siblingMergePoint = (uint64_t *)&self->_siblingMergePoint;
  v8 = objc_msgSend_superlayer(self, a2, v3);
  objc_msgSend_convertPoint_fromLayer_(self, v9, v8, x, y);
  *p_siblingMergePoint = v14;
  p_siblingMergePoint[1] = v15;
  if (dword_2550F4A38 <= 800)
  {
    if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setSiblingMergePoint:]", 800, (uint64_t)"input point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *(uint64_t *)&x);
    if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer setSiblingMergePoint:]", 800, (uint64_t)"converted point=(x = %.2f y = %.2f)\n", v10, v11, v12, v13, *p_siblingMergePoint);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  objc_super v10;

  if (self->super._selectable)
  {
    v3 = a3;
    if (objc_msgSend_isSelected(self, a2, a3) != a3)
    {
      v10.receiver = self;
      v10.super_class = (Class)NetTopoDeviceConnectionLayer;
      -[NetTopoObjectLayer setSelected:](&v10, sel_setSelected_, v3);
      objc_msgSend_setNeedsDisplay(self->_connectionLineLayer, v5, v6);
      v9 = 100.0;
      if (!v3)
        v9 = 0.0;
      objc_msgSend_setZPosition_(self, v7, v8, v9);
    }
  }
}

- (unint64_t)connectionMedium
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_associatedNode(self, a2, v2);
  if (v4)
    return objc_msgSend_medium(v4, v5, v6);
  else
    return self->_connectionMediumFallback;
}

- (void)layoutSublayers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_bounds(self, a2, v2);
  objc_msgSend_setFrame_(self->_connectionLineLayer, v4, v5);
  objc_msgSend_setNeedsDisplay(self->_connectionLineLayer, v6, v7);
}

- (void)addSideWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  const char *v7;
  uint64_t v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint *p_siblingMergePoint;
  CGPoint *p_downstreamConnectionPoint;

  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 4)
  {
    v9 = objc_msgSend_connectionMedium(self, v7, v8) == 1;
    v12 = 1.0;
    v13 = -1.0;
  }
  else
  {
    v9 = objc_msgSend_upstreamDeviceSpatialRelationship(self, v7, v8) == 1;
    v12 = -1.0;
    v13 = 1.0;
  }
  if (v9)
    v14 = v13;
  else
    v14 = v12;
  if (objc_msgSend_upstreamConnectionSide(self, v10, v11, v12) == 1)
    v15 = -10.0;
  else
    v15 = 10.0;
  CGPathMoveToPoint(a3, 0, self->_upstreamConnectionPoint.x + v15, self->_upstreamConnectionPoint.y);
  if (a4 != 0.0)
    CGPathAddLineToPoint(a3, 0, v15 + self->_upstreamConnectionPoint.x, self->_upstreamConnectionPoint.y + a4);
  p_siblingMergePoint = &self->_siblingMergePoint;
  CGPathAddArcToPoint(a3, 0, self->_siblingMergePoint.x - a4, self->_upstreamConnectionPoint.y + a4, self->_siblingMergePoint.x - a4, self->_upstreamConnectionPoint.y + 12.0 + a4, 12.0);
  CGPathAddArcToPoint(a3, 0, p_siblingMergePoint->x - a4, self->_siblingMergePoint.y - a4, p_siblingMergePoint->x + v14 * 12.0 - a4, self->_siblingMergePoint.y - a4, 12.0);
  p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
  CGPathAddArcToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y - a4, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y + 12.0 - a4, 12.0);
  CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_downstreamConnectionPoint->y + -10.0);
  if (a4 != 0.0)
    CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x, p_downstreamConnectionPoint->y + -10.0);
}

- (void)addBottomWindingConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGPoint *p_siblingMergePoint;
  CGPoint *p_downstreamConnectionPoint;
  uint64_t v16;

  v13 = 1.0;
  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 3
    || (v13 = -1.0, objc_msgSend_upstreamDeviceSpatialRelationship(self, v7, v8) == 5))
  {
    if (dword_2550F4A38 <= 800)
    {
      if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_upstreamConnectionPoint = (x = %.2f y = %.2f)\n", v9, v10, v11, v12, *(_QWORD *)&self->_upstreamConnectionPoint.x);
      if (dword_2550F4A38 <= 800)
      {
        if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_downstreamConnectionPoint = (x = %.2f y = %.2f)\n", v9, v10, v11, v12, *(_QWORD *)&self->_downstreamConnectionPoint.x);
        if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"_siblingMergePoint = (x = %.2f y = %.2f)\n", v9, v10, v11, v12, *(_QWORD *)&self->_siblingMergePoint.x);
      }
    }
    CGPathMoveToPoint(a3, 0, self->_upstreamConnectionPoint.x - a4, self->_upstreamConnectionPoint.y + 4.0);
    if (a4 != 0.0)
      CGPathAddLineToPoint(a3, 0, self->_upstreamConnectionPoint.x - a4, self->_upstreamConnectionPoint.y);
    p_siblingMergePoint = &self->_siblingMergePoint;
    CGPathAddArcToPoint(a3, 0, self->_siblingMergePoint.x - a4, self->_siblingMergePoint.y - a4, self->_siblingMergePoint.x + v13 * 12.0 - a4, self->_siblingMergePoint.y - a4, 12.0);
    p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
    CGPathAddArcToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y - a4, p_downstreamConnectionPoint->x - a4, p_siblingMergePoint->y + 12.0 - a4, 12.0);
    CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x - a4, p_downstreamConnectionPoint->y);
    if (a4 != 0.0)
      CGPathAddLineToPoint(a3, 0, p_downstreamConnectionPoint->x, p_downstreamConnectionPoint->y);
  }
  else if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addBottomWindingConnectionToPath:withOffset:]", 800, (uint64_t)"unsupported spatial relationship for this position\n", v9, v10, v11, v12, v16);
  }
}

- (void)addCurvedArrowConnectionToPath:(CGPath *)a3 withOffset:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double y;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGPath *Mutable;
  uint64_t v16;

  if (objc_msgSend_upstreamDeviceSpatialRelationship(self, a2, (uint64_t)a3) == 1)
  {
    if (dword_2550F4A38 <= 800)
    {
      if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"_upstreamConnectionPoint = (x = %.2f y = %.2f)\n", v7, v8, v9, v10, *(_QWORD *)&self->_upstreamConnectionPoint.x);
      if (dword_2550F4A38 <= 800)
      {
        if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"_downstreamConnectionPoint = (x = %.2f y = %.2f)\n", v7, v8, v9, v10, *(_QWORD *)&self->_downstreamConnectionPoint.x);
        if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"offset = %.2f\n", v7, v8, v9, v10, *(uint64_t *)&a4);
      }
    }
    y = self->_downstreamConnectionPoint.y;
    v12 = self->_downstreamConnectionPoint.x - a4;
    v13 = self->_upstreamConnectionPoint.x + a4 + 3.0;
    v14 = self->_upstreamConnectionPoint.y + 1.0;
    CGPathMoveToPoint(a3, 0, v12, y);
    CGPathAddCurveToPoint(a3, 0, v12 + -25.0, y + -26.0, v13 + 25.0, v14 + -26.0, v13 + 3.0, v14 + -1.0);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v13, v14 + -1.0);
    CGPathAddLineToPoint(Mutable, 0, v13 + 15.0, v14 + -1.0);
    CGPathAddLineToPoint(Mutable, 0, v13 + 8.0, v14 + -13.6999998);
    CGPathCloseSubpath(Mutable);
    self->_arrowhead = Mutable;
    CGPathAddPath(a3, 0, Mutable);
  }
  else if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer addCurvedArrowConnectionToPath:withOffset:]", 800, (uint64_t)"unsupported spatial relationship for this position\n", v7, v8, v9, v10, v16);
  }
}

- (CGPath)newConnectionPathWithOffset:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGPath *Mutable;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CGPoint *p_downstreamConnectionPoint;
  double y;
  double x;
  uint64_t v23;
  CGPoint *v24;
  double v25;
  CGPoint *p_upstreamConnectionPoint;
  CGPoint *v27;
  uint64_t v29;

  if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"entered with offset %f\n", v3, v4, v5, v6, *(uint64_t *)&a3);
  Mutable = CGPathCreateMutable();
  switch(objc_msgSend_upstreamDeviceSpatialRelationship(self, v10, v11))
  {
    case 1:
    case 2:
      switch(objc_msgSend_connectionStyle(self, v12, v13))
      {
        case 1:
          if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleDirect\n", v14, v15, v16, v17, v29);
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + 10.0, self->_upstreamConnectionPoint.y);
          if (a3 != 0.0)
            CGPathAddLineToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + 10.0, self->_upstreamConnectionPoint.y - a3);
          p_downstreamConnectionPoint = &self->_downstreamConnectionPoint;
          CGPathAddLineToPoint(Mutable, 0, p_downstreamConnectionPoint->x + -10.0, p_downstreamConnectionPoint->y - a3);
          if (a3 == 0.0)
            goto LABEL_53;
          y = p_downstreamConnectionPoint->y;
          x = p_downstreamConnectionPoint->x + -10.0;
          break;
        case 2:
          if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleSingleBend\n", v14, v15, v16, v17, v29);
          if (objc_msgSend_upstreamDeviceSpatialRelationship(self, v18, v19) == 1)
            v25 = 1.0;
          else
            v25 = -1.0;
          p_upstreamConnectionPoint = &self->_upstreamConnectionPoint;
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x + v25 * 10.0, self->_upstreamConnectionPoint.y);
          if (a3 != 0.0)
            CGPathAddLineToPoint(Mutable, 0, p_upstreamConnectionPoint->x + v25 * 10.0, self->_upstreamConnectionPoint.y - a3);
          v27 = &self->_downstreamConnectionPoint;
          CGPathAddArcToPoint(Mutable, 0, v27->x + a3 * v25, p_upstreamConnectionPoint->y - a3, v27->x + a3 * v25, v27->y + -10.0, 12.0);
          CGPathAddLineToPoint(Mutable, 0, v27->x + a3 * v25, v27->y + -10.0);
          if (a3 == 0.0)
            goto LABEL_53;
          x = v27->x;
          y = v27->y + -10.0;
          break;
        case 3:
          goto LABEL_36;
        case 4:
          goto LABEL_31;
        case 5:
          objc_msgSend_addCurvedArrowConnectionToPath_withOffset_(self, v18, (uint64_t)Mutable, a3 + 6.0);
          goto LABEL_53;
        default:
          goto LABEL_53;
      }
      goto LABEL_51;
    case 3:
    case 5:
      objc_msgSend_addBottomWindingConnectionToPath_withOffset_(self, v12, (uint64_t)Mutable, a3);
      goto LABEL_53;
    case 4:
      if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kUpstreamDeviceAboveCenter\n", v14, v15, v16, v17, v29);
      v23 = objc_msgSend_connectionStyle(self, v12, v13);
      switch(v23)
      {
        case 4:
LABEL_31:
          if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleSideWinding\n", v14, v15, v16, v17, v29);
          objc_msgSend_addSideWindingConnectionToPath_withOffset_(self, v18, (uint64_t)Mutable, a3);
          break;
        case 3:
LABEL_36:
          if (dword_2550F4A38 > 800)
            return Mutable;
          if (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u))
            sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleBottomWinding - unsupported for this spatial relationship\n", v14, v15, v16, v17, v29);
          break;
        case 1:
          if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"kConnectionStyleDirect\n", v14, v15, v16, v17, v29);
          CGPathMoveToPoint(Mutable, 0, self->_upstreamConnectionPoint.x, self->_upstreamConnectionPoint.y + 4.0);
          if (a3 != 0.0)
            CGPathAddLineToPoint(Mutable, 0, self->_upstreamConnectionPoint.x - a3, self->_upstreamConnectionPoint.y + 4.0);
          v24 = &self->_downstreamConnectionPoint;
          CGPathAddLineToPoint(Mutable, 0, v24->x - a3, v24->y);
          if (a3 != 0.0)
          {
            x = v24->x;
            y = v24->y;
LABEL_51:
            CGPathAddLineToPoint(Mutable, 0, x, y);
          }
          break;
      }
LABEL_53:
      if (dword_2550F4A38 <= 800 && (dword_2550F4A38 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A38, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4A38, (uint64_t)"-[NetTopoDeviceConnectionLayer newConnectionPathWithOffset:]", 800, (uint64_t)"done\n", v14, v15, v16, v17, v29);
      return Mutable;
    default:
      goto LABEL_53;
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  const CGPath *v6;
  const char *v7;
  uint64_t v8;
  char isGhosted;
  const char *v10;
  int topoStyle;
  CAShapeLayer *connectionLineLayer;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  CAShapeLayer *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  CAShapeLayer *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  int *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;

  v6 = (const CGPath *)objc_msgSend_newConnectionPathWithOffset_(self, a2, (uint64_t)a3, 0.0);
  isGhosted = objc_msgSend_isGhosted(self, v7, v8);
  topoStyle = self->super._topoStyle;
  connectionLineLayer = self->_connectionLineLayer;
  if ((isGhosted & 1) == 0)
  {
    if (topoStyle)
    {
      objc_msgSend_setLineDashPattern_(self->_connectionLineLayer, v10, 0);
      goto LABEL_9;
    }
    v22 = 568;
LABEL_8:
    objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v10, *(uint64_t *)((char *)&self->super.super.super.isa + v22));
    goto LABEL_9;
  }
  if (!topoStyle)
  {
    v22 = 576;
    goto LABEL_8;
  }
  v13 = (void *)MEMORY[0x24BDBCE30];
  v14 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, 6);
  v16 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v15, 6);
  v18 = objc_msgSend_arrayWithObjects_(v13, v17, v14, v16, 0);
  objc_msgSend_setLineDashPattern_(connectionLineLayer, v19, v18);
LABEL_9:
  if (self->super._selectable && objc_msgSend_isSelected(self, v20, v21))
  {
    objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v20, (uint64_t)self->_selectedLineColor);
    v24 = 6.0;
    goto LABEL_23;
  }
  if (objc_msgSend_connectionMedium(self, v20, v21) == 1 || objc_msgSend_connectionMedium(self, v25, v26) == 3)
  {
    v28 = self->_connectionLineLayer;
    if (self->super._topoStyle)
    {
      objc_msgSend_setStrokeColor_(self->_connectionLineLayer, v25, (uint64_t)self->_lineColorWiFi);
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDBCE30];
      v30 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v25, 0);
      v32 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v31, 10);
      v34 = objc_msgSend_arrayWithObjects_(v29, v33, v30, v32, 0);
      objc_msgSend_setLineDashPattern_(v28, v35, v34);
    }
LABEL_22:
    v24 = 4.0;
    goto LABEL_23;
  }
  if (objc_msgSend_connectionMedium(self, v25, v27) == 2 || (v24 = 4.0, !objc_msgSend_connectionMedium(self, v23, v36)))
  {
    v37 = self->_connectionLineLayer;
    if (self->super._topoStyle)
      objc_msgSend_setStrokeColor_(v37, v23, (uint64_t)self->_lineColorEthernet);
    else
      objc_msgSend_setLineDashPattern_(v37, v23, 0);
    goto LABEL_22;
  }
LABEL_23:
  objc_msgSend_setFillColor_(self->_connectionLineLayer, v23, (uint64_t)self->_clearColor);
  objc_msgSend_setLineWidth_(self->_connectionLineLayer, v38, v39, v24);
  objc_msgSend_setLineJoin_(self->_connectionLineLayer, v40, *MEMORY[0x24BDE5D08]);
  objc_msgSend_setPath_(self->_connectionLineLayer, v41, (uint64_t)v6);
  if (self->_arrowhead)
  {
    CGContextSaveGState(a4);
    if (self->super._topoStyle)
      v42 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorWiFi;
    else
      v42 = &OBJC_IVAR___NetTopoDeviceConnectionLayer__lineColorActive;
    CGContextSetFillColorWithColor(a4, *(CGColorRef *)((char *)&self->super.super.super.isa + *v42));
    CGContextAddPath(a4, self->_arrowhead);
    CGContextFillPath(a4);
    CGContextRestoreGState(a4);
    objc_msgSend_setLineJoin_(self->_connectionLineLayer, v43, *MEMORY[0x24BDE5D00]);
    self->_arrowhead = 0;
  }
  CGPathRelease(v6);
  if (self->super._topoStyle == 1 && !sub_21A731938(v44, v45, v46))
  {
    LODWORD(v49) = 1.0;
    objc_msgSend_setShadowOpacity_(self->_connectionLineLayer, v47, v48, v49);
    objc_msgSend_setShadowOffset_(self->_connectionLineLayer, v50, v51, 0.0, 1.0);
    objc_msgSend_setShadowRadius_(self->_connectionLineLayer, v52, v53, 0.0);
    MEMORY[0x24BEDD108](self->_connectionLineLayer, sel_setShadowColor_, self->_whiteColor);
  }
}

- (void)setNeedsDisplay
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NetTopoDeviceConnectionLayer;
  -[NetTopoDeviceConnectionLayer setNeedsDisplay](&v5, sel_setNeedsDisplay);
  objc_msgSend_setNeedsDisplay(self->_connectionLineLayer, v3, v4);
}

- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5
{
  objc_class *v8;
  const char *Name;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const __CFString *v18;
  const char *v19;

  v8 = (objc_class *)objc_opt_class();
  Name = class_getName(v8);
  v12 = objc_msgSend_retainCount(a4, v10, v11);
  objc_msgSend_appendFormat_(a3, v13, (uint64_t)CFSTR("<%s: %p retains %d> ("), Name, a4, v12);
  v16 = objc_msgSend_connectionMedium(self, v14, v15);
  v18 = CFSTR("unknown medium");
  if (v16 == 2)
    v18 = CFSTR("Ethernet");
  if (v16 == 1)
    objc_msgSend_appendString_(a3, v17, (uint64_t)CFSTR("WiFi"));
  else
    objc_msgSend_appendString_(a3, v17, (uint64_t)v18);
  objc_msgSend_appendString_(a3, v19, (uint64_t)CFSTR(")"));
  return a3;
}

- (NSString)debugDescription
{
  NSString *v3;
  const char *v4;

  v3 = (NSString *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], a2, (uint64_t)&stru_24DD08368);
  objc_msgSend_describeOne_uiLayer_indent_(self, v4, (uint64_t)v3, self, 0);
  return v3;
}

- (unint64_t)upstreamDeviceSpatialRelationship
{
  return self->_upstreamDeviceSpatialRelationship;
}

- (void)setUpstreamDeviceSpatialRelationship:(unint64_t)a3
{
  self->_upstreamDeviceSpatialRelationship = a3;
}

- (unint64_t)connectionStyle
{
  return self->_connectionStyle;
}

- (void)setConnectionStyle:(unint64_t)a3
{
  self->_connectionStyle = a3;
}

- (unint64_t)upstreamConnectionSide
{
  return self->_upstreamConnectionSide;
}

- (void)setUpstreamConnectionSide:(unint64_t)a3
{
  self->_upstreamConnectionSide = a3;
}

- (unint64_t)connectionMediumFallback
{
  return self->_connectionMediumFallback;
}

- (void)setConnectionMediumFallback:(unint64_t)a3
{
  self->_connectionMediumFallback = a3;
}

- (CGPath)hitTestPath
{
  return self->_hitTestPath;
}

@end
