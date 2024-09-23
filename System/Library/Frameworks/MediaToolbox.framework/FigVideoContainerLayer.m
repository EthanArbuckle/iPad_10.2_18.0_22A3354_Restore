@implementation FigVideoContainerLayer

- (FigVideoContainerLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigVideoContainerLayer;
  return -[FigBaseCALayer init](&v3, sel_init);
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigVideoContainerLayer;
  -[FigVideoContainerLayer dealloc](&v3, sel_dealloc);
}

- (void)layoutSublayers
{
  CALayer *videoLayer;
  CALayer *STSLayer;

  if (self->_shouldResizeVideoLayer)
  {
    videoLayer = self->_videoLayer;
    -[FigVideoContainerLayer bounds](self, "bounds");
    -[CALayer setFrame:](videoLayer, "setFrame:");
  }
  STSLayer = self->_STSLayer;
  -[FigVideoContainerLayer bounds](self, "bounds");
  -[CALayer setFrame:](STSLayer, "setFrame:");
}

- (void)setSTSLabel:(id)a3
{
  NSString *STSLabel;
  NSString *v6;
  _QWORD block[5];

  STSLabel = self->_STSLabel;
  if (STSLabel != a3)
  {
    v6 = STSLabel;
    self->_STSLabel = (NSString *)a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__FigVideoContainerLayer_setSTSLabel___block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __38__FigVideoContainerLayer_setSTSLabel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(void **)(v2 + 64);
  if (v3)
  {
    if (!v4)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v5 = *(_QWORD **)(a1 + 32);
      v6 = (void *)v5[8];
      objc_msgSend(v5, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(*(id *)(a1 + 32), "addSublayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v7 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v7 + 64);
      v3 = *(_QWORD *)(v7 + 48);
    }
    objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("separatedOptions.STSLabel"));
  }
  else if (v4)
  {
    objc_msgSend(v4, "removeFromSuperlayer");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setVideoLayer:(id)a3
{
  CALayer *videoLayer;

  videoLayer = self->_videoLayer;
  if (videoLayer != a3)
  {

    self->_videoLayer = (CALayer *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CALayer setToneMapToStandardDynamicRange:](self->_videoLayer, "setToneMapToStandardDynamicRange:", -[FigVideoContainerLayer toneMapToStandardDynamicRange](self, "toneMapToStandardDynamicRange"));
  }
}

- (CALayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CALayer setToneMapToStandardDynamicRange:](self->_videoLayer, "setToneMapToStandardDynamicRange:");
  v5.receiver = self;
  v5.super_class = (Class)FigVideoContainerLayer;
  -[FigVideoContainerLayer setToneMapToStandardDynamicRange:](&v5, sel_setToneMapToStandardDynamicRange_, v3);
}

- (BOOL)shouldResizeVideoLayer
{
  return self->_shouldResizeVideoLayer;
}

- (void)setShouldResizeVideoLayer:(BOOL)a3
{
  self->_shouldResizeVideoLayer = a3;
}

- (BOOL)isForScrubbingOnly
{
  return self->_isForScrubbingOnly;
}

- (void)setForScrubbingOnly:(BOOL)a3
{
  self->_isForScrubbingOnly = a3;
}

- (NSString)STSLabel
{
  return self->_STSLabel;
}

@end
