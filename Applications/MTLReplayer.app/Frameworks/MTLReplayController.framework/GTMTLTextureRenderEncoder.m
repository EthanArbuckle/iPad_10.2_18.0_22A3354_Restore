@implementation GTMTLTextureRenderEncoder

- (GTMTLTextureRenderEncoder)initWithDevice:(id)a3
{
  id v5;
  GTMTLTextureRenderEncoder *v6;
  GTMTLTextureRenderEncoder *v7;
  NSMutableArray *v8;
  NSMutableArray *commands;
  GTMTLTextureRenderEncoderCommand *v10;
  GTMTLTextureRenderEncoderCommand *currentCommand;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLTextureRenderEncoder;
  v6 = -[GTMTLTextureRenderEncoder init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    commands = v7->_commands;
    v7->_commands = v8;

    v10 = objc_alloc_init(GTMTLTextureRenderEncoderCommand);
    currentCommand = v7->_currentCommand;
    v7->_currentCommand = v10;

  }
  return v7;
}

- (void)submitCommand
{
  -[NSMutableArray addObject:](self->_commands, "addObject:", self->_currentCommand);
  -[GTMTLTextureRenderEncoder resetCommand](self, "resetCommand");
}

- (void)resetCommand
{
  GTMTLTextureRenderEncoderCommand *v3;
  GTMTLTextureRenderEncoderCommand *currentCommand;

  v3 = (GTMTLTextureRenderEncoderCommand *)-[GTMTLTextureRenderEncoderCommand copy](self->_currentCommand, "copy");
  currentCommand = self->_currentCommand;
  self->_currentCommand = v3;

  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", 0);
}

- (void)setBounds:(CGRect)a3 contentsScale:(double)a4
{
  -[GTMTLTextureRenderEncoderCommand setBounds:](self->_currentCommand, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[GTMTLTextureRenderEncoderCommand setContentsScale:](self->_currentCommand, "setContentsScale:", a4);
}

- (void)setAnchor:(CGPoint)a3
{
  -[GTMTLTextureRenderEncoderCommand setAnchor:](self->_currentCommand, "setAnchor:", a3.x, a3.y);
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  -[GTMTLTextureRenderEncoderCommand setTransform:](self->_currentCommand, "setTransform:", v7);
}

- (void)drawTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;

  v5 = a5;
  v6 = a4;
  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", a3);
  -[GTMTLTextureRenderEncoderCommand setDepthStencil:](self->_currentCommand, "setDepthStencil:", v6);
  -[GTMTLTextureRenderEncoderCommand setOverlay:](self->_currentCommand, "setOverlay:", 0);
  -[GTMTLTextureRenderEncoderCommand setShrinkToFit:](self->_currentCommand, "setShrinkToFit:", v5);
  -[GTMTLTextureRenderEncoder submitCommand](self, "submitCommand");
}

- (void)drawOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  -[GTMTLTextureRenderEncoderCommand setTexture:](self->_currentCommand, "setTexture:", a3);
  -[GTMTLTextureRenderEncoderCommand setDepthStencil:](self->_currentCommand, "setDepthStencil:", 0);
  -[GTMTLTextureRenderEncoderCommand setOverlay:](self->_currentCommand, "setOverlay:", 1);
  -[GTMTLTextureRenderEncoderCommand setRgb:](self->_currentCommand, "setRgb:", v6);
  -[GTMTLTextureRenderEncoderCommand setShrinkToFit:](self->_currentCommand, "setShrinkToFit:", v5);
  -[GTMTLTextureRenderEncoder submitCommand](self, "submitCommand");
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_commands, "removeAllObjects");
  -[GTMTLTextureRenderEncoder resetCommand](self, "resetCommand");
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)commands
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommand, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

@end
