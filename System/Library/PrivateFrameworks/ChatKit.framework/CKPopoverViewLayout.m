@implementation CKPopoverViewLayout

- (CKPopoverViewLayout)initWithConfiguration:(id)a3
{
  id v5;
  CKPopoverViewLayout *v6;
  CKPopoverViewLayout *v7;
  CGSize v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKPopoverViewLayout;
  v6 = -[CKPopoverViewLayout init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mutating = 0;
    v8 = (CGSize)*MEMORY[0x1E0C9D820];
    v6->_anchorCenter = (CGPoint)*MEMORY[0x1E0C9D538];
    v6->_anchorSize = v8;
    v6->_containerSize = v8;
    v6->_preferredContentSize = v8;
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[CKPopoverViewLayout popoverFrameInContainer](self, "popoverFrameInContainer");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CKPopoverViewLayout: %p, size=%.02fpt%.02fpt, origin=%.02fpt%.02fpt>"), self, v5, v6, v3, v4);
}

- (CGRect)anchorFrameInContainer
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_anchorSize.width;
  height = self->_anchorSize.height;
  v4 = self->_anchorCenter.x - width * 0.5;
  v5 = self->_anchorCenter.y - height * 0.5;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)updateProperties:(id)a3
{
  self->_mutating = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_mutating = 0;
}

- (CGRect)popoverFrameInContainer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double y;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  -[CKPopoverViewLayoutConfiguration optimalSizeForPreferredContentSize:state:](self->_configuration, "optimalSizeForPreferredContentSize:state:", self->_state, self->_preferredContentSize.width, self->_preferredContentSize.height);
  v4 = v3;
  v6 = v5;
  height = self->_containerSize.height;
  -[CKPopoverViewLayoutConfiguration maximumHeight](self->_configuration, "maximumHeight");
  v9 = v8;
  y = self->_anchorCenter.y;
  v28 = self->_containerSize.height;
  v10 = self->_anchorSize.height;
  -[CKPopoverViewLayoutConfiguration minimumTopSpacing](self->_configuration, "minimumTopSpacing");
  v12 = v11;
  -[CKPopoverViewLayout anchorFrameInContainer](self, "anchorFrameInContainer");
  Width = CGRectGetWidth(v29);
  -[CKPopoverViewLayout anchorFrameInContainer](self, "anchorFrameInContainer");
  v14 = Width - CGRectGetMidX(v30);
  if (v14 >= -58.0)
    v15 = v14;
  else
    v15 = -58.0;
  -[CKPopoverViewLayout anchorFrameInContainer](self, "anchorFrameInContainer");
  v16 = CGRectGetMidX(v31) + v15;
  v17 = self->_containerSize.width - (v4 + v16);
  -[CKPopoverViewLayoutConfiguration minimumTrailingSpacing](self->_configuration, "minimumTrailingSpacing");
  v19 = v17 - v18;
  if (v19 >= 0.0)
    v19 = -0.0;
  v20 = v16 + v19;
  if (height >= v9)
    v21 = v9;
  else
    v21 = height;
  v22 = v21 - (v12 + v28 - (y + v10 * 0.5));
  if (v22 < v6)
    v6 = v22;
  -[CKPopoverViewLayout anchorFrameInContainer](self, "anchorFrameInContainer");
  v23 = CGRectGetMaxY(v32) - v6;
  v24 = v20;
  v25 = v4;
  v26 = v6;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (id)newLayoutMetricsWithCoordinateSpace:(id)a3
{
  id v4;
  CKPopoverViewLayoutMetrics *v5;
  unint64_t v6;
  CKPopoverViewLayoutMetrics *v7;

  v4 = a3;
  v5 = [CKPopoverViewLayoutMetrics alloc];
  v6 = -[CKPopoverViewLayout state](self, "state");
  -[CKPopoverViewLayout popoverFrameInContainer](self, "popoverFrameInContainer");
  v7 = -[CKPopoverViewLayoutMetrics initWithState:frame:coordinateSpace:](v5, "initWithState:frame:coordinateSpace:", v6, v4);

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (CGPoint)anchorCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorCenter.x;
  y = self->_anchorCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorCenter:(CGPoint)a3
{
  self->_anchorCenter = a3;
}

- (CGSize)anchorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_anchorSize.width;
  height = self->_anchorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAnchorSize:(CGSize)a3
{
  self->_anchorSize = a3;
}

- (BOOL)isMutating
{
  return self->_mutating;
}

- (void)setMutating:(BOOL)a3
{
  self->_mutating = a3;
}

- (CKPopoverViewLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
