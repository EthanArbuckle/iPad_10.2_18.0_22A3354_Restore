@implementation DUDisplayInfoObjC

- (DUDisplayInfoObjC)init
{
  DUDisplayInfoObjC *v2;
  _TtC21DocumentUnderstanding13DUDisplayInfo *v3;
  _TtC21DocumentUnderstanding13DUDisplayInfo *underlying;
  DUDisplayInfoObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUDisplayInfoObjC;
  v2 = -[DUDisplayInfoObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DUDisplayInfo);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (CGRect)frameInWindow
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[DUDisplayInfo frameInWindow](self->_underlying, "frameInWindow");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  -[DUDisplayInfo setFrameInWindow:](self->_underlying, "setFrameInWindow:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGPoint)absoluteOriginOnScreen
{
  double v2;
  double v3;
  CGPoint result;

  -[DUDisplayInfo absoluteOriginOnScreen](self->_underlying, "absoluteOriginOnScreen");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  -[DUDisplayInfo setAbsoluteOriginOnScreen:](self->_underlying, "setAbsoluteOriginOnScreen:", a3.x, a3.y);
}

- (BOOL)isOnScreen
{
  return -[DUDisplayInfo isOnScreen](self->_underlying, "isOnScreen");
}

- (void)setIsOnScreen:(BOOL)a3
{
  -[DUDisplayInfo setIsOnScreen:](self->_underlying, "setIsOnScreen:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
