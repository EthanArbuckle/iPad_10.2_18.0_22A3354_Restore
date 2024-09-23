@implementation ASOOverlayTransitionContext

- (ASOOverlayTransitionContext)initWithStartFrame:(CGRect)a3 endFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  ASOOverlayTransitionContext *v12;
  ASOOverlayTransitionContext *v13;
  NSMutableArray *v14;
  NSMutableArray *animationBlocks;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)ASOOverlayTransitionContext;
  v12 = -[ASOOverlayTransitionContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_startFrame.origin.x = v11;
    v12->_startFrame.origin.y = v10;
    v12->_startFrame.size.width = v9;
    v12->_startFrame.size.height = v8;
    v12->_endFrame.origin.x = x;
    v12->_endFrame.origin.y = y;
    v12->_endFrame.size.width = width;
    v12->_endFrame.size.height = height;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    animationBlocks = v13->_animationBlocks;
    v13->_animationBlocks = v14;

  }
  return v13;
}

- (ASOOverlayTransitionContext)initWithCoder:(id)a3
{
  id v4;
  ASOOverlayTransitionContext *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  NSMutableArray *v16;
  NSMutableArray *animationBlocks;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASOOverlayTransitionContext;
  v5 = -[ASOOverlayTransitionContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASOStoreOverlayPresentationStartFrameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v5->_startFrame.origin.x = v7;
    v5->_startFrame.origin.y = v8;
    v5->_startFrame.size.width = v9;
    v5->_startFrame.size.height = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASOStoreOverlayPresentationEndFrameKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGRectValue");
    v5->_endFrame.origin.x = v12;
    v5->_endFrame.origin.y = v13;
    v5->_endFrame.size.width = v14;
    v5->_endFrame.size.height = v15;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    animationBlocks = v5->_animationBlocks;
    v5->_animationBlocks = v16;

  }
  return v5;
}

- (void)addAnimationBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASOOverlayTransitionContext animationBlocks](self, "animationBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x212BAAF30](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (CGRect)startFrameInternal
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartFrameInternal:(CGRect)a3
{
  self->_startFrame = a3;
}

- (CGRect)endFrameInternal
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEndFrameInternal:(CGRect)a3
{
  self->_endFrame = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1968];
  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  v9 = a3;
  objc_msgSend(v4, "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("ASOStoreOverlayPresentationStartFrameKey"));

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v11, CFSTR("ASOStoreOverlayPresentationEndFrameKey"));

}

- (CGRect)startFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (NSMutableArray)animationBlocks
{
  return self->_animationBlocks;
}

- (void)setAnimationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_animationBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end
