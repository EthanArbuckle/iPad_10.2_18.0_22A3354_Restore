@implementation DYMTLParallelRenderCommandEncoderStateTracker

- (DYMTLParallelRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  DYMTLParallelRenderCommandEncoderStateTracker *v9;
  DYMTLParallelRenderCommandEncoderStateTracker *v10;
  void *v11;
  DYMTLParallelRenderCommandEncoderStateTracker *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    v9 = -[DYMTLParallelRenderCommandEncoderStateTracker init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_renderEncoder, a3);
      objc_msgSend(v7, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLParallelRenderCommandEncoderStateTracker _setDefaultsWithDescriptor:device:](v10, "_setDefaultsWithDescriptor:device:", v8, v11);

      DYMTLSetAssociatedObject(v10, 0, v8);
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DYMTLParallelRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  DYMTLParallelRenderCommandEncoderStateTracker *v8;
  DYMTLParallelRenderCommandEncoderStateTracker *v9;
  DYMTLParallelRenderCommandEncoderStateTracker *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    v8 = -[DYMTLParallelRenderCommandEncoderStateTracker init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      -[DYMTLParallelRenderCommandEncoderStateTracker _setDefaultsWithDescriptor:device:](v8, "_setDefaultsWithDescriptor:device:", v7, v6);
      DYMTLSetAssociatedObject(v9, 0, v7);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((-[MTLParallelRenderCommandEncoder conformsToProtocol:](self->_renderEncoder, "conformsToProtocol:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    v5 = -[DYMTLParallelRenderCommandEncoderStateTracker conformsToProtocol:](&v7, sel_conformsToProtocol_, v4);
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_renderEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
  if (-[DYMTLParallelRenderCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4
{
  objc_msgSend(a3, "validate:width:height:", a4, &self->_width, &self->_height);
}

- (id)descriptor
{
  return DYMTLGetAssociatedObject(self, 0);
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
}

@end
