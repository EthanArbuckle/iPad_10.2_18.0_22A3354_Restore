@implementation CMISmartStyleColorCubeV1

- (CMISmartStyleColorCubeV1)initWithBackgroundCube:(id)a3 foregroundCube:(id)a4
{
  id v7;
  id v8;
  CMISmartStyleColorCubeV1 *v9;
  CMISmartStyleColorCubeV1 *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMISmartStyleColorCubeV1;
  v9 = -[CMISmartStyleColorCubeV1 init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_backgroundCube, a3);
      objc_storeStrong((id *)&v10->_foregroundCube, a4);
      FigMetalIncRef(v10->_backgroundCube);
      FigMetalIncRef(v10->_foregroundCube);
      v10->_needsUpdate = 1;
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  FigMetalDecRef((id *)&self->_backgroundCube);
  FigMetalDecRef((id *)&self->_foregroundCube);
  v3.receiver = self;
  v3.super_class = (Class)CMISmartStyleColorCubeV1;
  -[CMISmartStyleColorCubeV1 dealloc](&v3, sel_dealloc);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (MTLTexture)backgroundCube
{
  return self->_backgroundCube;
}

- (MTLTexture)foregroundCube
{
  return self->_foregroundCube;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundCube, 0);
  objc_storeStrong((id *)&self->_backgroundCube, 0);
}

@end
