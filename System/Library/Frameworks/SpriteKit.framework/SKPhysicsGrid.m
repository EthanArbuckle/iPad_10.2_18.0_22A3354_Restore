@implementation SKPhysicsGrid

+ (id)gridFromOccupancyArray:(const char *)a3 width:(int)a4 height:(int)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D7D2F8], "gridFromOccupancyArray:bytePitch:width:height:", a3, 1, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

+ (id)gridFromTexture:(id)a3 alphaThreshold:(float)a4 accuracy:(float)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  CGImage *v12;
  CGImage *v13;
  CGDataProvider *DataProvider;
  const __CFData *v15;
  const UInt8 *BytePtr;
  size_t Width;
  size_t Height;
  double v19;
  double v20;
  void *v21;

  v7 = a3;
  v8 = v7;
  LODWORD(v9) = 981668463;
  LODWORD(v10) = 1.0;
  if (a5 <= 1.0)
    *(float *)&v10 = a5;
  if (a5 >= 0.001)
    v11 = *(float *)&v10;
  else
    v11 = 0.001;
  v12 = (CGImage *)objc_msgSend(v7, "_newTextureFromGLCache", v9, v10);
  v13 = v12;
  if (v12)
  {
    DataProvider = CGImageGetDataProvider(v12);
    v15 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v15);
    Width = CGImageGetWidth(v13);
    Height = CGImageGetHeight(v13);
    *(float *)&v19 = a4;
    *(float *)&v20 = v11;
    objc_msgSend(MEMORY[0x1E0D7D2F8], "gridFromRGBAU8PixelData:imageWidth:imageHeight:alphaThreshold:accuracy:", BytePtr, (int)(float)Width, (int)(float)Height, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v13);
    CFRelease(v15);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)vectorGridFromTexture:(id)a3 accuracy:(float)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  CGImage *v10;
  CGImage *v11;
  CGDataProvider *DataProvider;
  const __CFData *v13;
  const UInt8 *BytePtr;
  size_t Width;
  size_t Height;
  double v17;
  void *v18;

  v5 = a3;
  v6 = v5;
  LODWORD(v7) = 981668463;
  LODWORD(v8) = 1.0;
  if (a4 <= 1.0)
    *(float *)&v8 = a4;
  if (a4 >= 0.001)
    v9 = *(float *)&v8;
  else
    v9 = 0.001;
  v10 = (CGImage *)objc_msgSend(v5, "_createCGImage", v7, v8);
  v11 = v10;
  if (v10)
  {
    DataProvider = CGImageGetDataProvider(v10);
    v13 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v13);
    Width = CGImageGetWidth(v11);
    Height = CGImageGetHeight(v11);
    *(float *)&v17 = v9;
    objc_msgSend(MEMORY[0x1E0D7D2F8], "vectorGridFromRGBAU8PixelData:imageWidth:imageHeight:accuracy:", BytePtr, (int)(float)Width, (int)(float)Height, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v11);
    CFRelease(v13);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)spritesFromGrid:(id)a3 gridSize:(CGSize)a4 zPosition:(double)a5 edgeColor:(id)a6 interiorColor:(id)a7 spriteSize:(CGSize)a8 physicsBody:(id)a9
{
  double height;
  double width;
  double v15;
  double v16;
  id v18;
  id v19;
  id v20;
  float v21;
  float v22;
  float v23;
  float v24;
  SKPhysicsGrid *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  id v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  void *v35;
  id v36;

  height = a8.height;
  width = a8.width;
  v15 = a4.height;
  v16 = a4.width;
  v36 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (v36)
  {
    -[SKPhysicsGrid height](self, "height");
    v22 = v21;
    -[SKPhysicsGrid width](self, "width");
    v24 = v23;
    v25 = self;
    if ((int)v22 >= 1)
    {
      v26 = 0;
      v27 = (int)v24;
      do
      {
        if (v27 >= 1)
        {
          v28 = 0;
          do
          {
            v29 = -[SKPhysicsGrid gridDataAtX:y:z:](v25, "gridDataAtX:y:z:", v28, v26, 1);
            if (v29)
            {
              if (v29 == 2)
                v30 = v19;
              else
                v30 = v18;
              +[SKSpriteNode spriteNodeWithColor:size:](SKSpriteNode, "spriteNodeWithColor:size:", v30, width, height);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKPhysicsGrid width](v25, "width");
              v33 = v32;
              -[SKPhysicsGrid height](v25, "height");
              objc_msgSend(v31, "setPosition:", v16 * (float)((float)(int)v28 / v33), v15 * (float)((float)(int)v26 / v34));
              objc_msgSend(v31, "setZPosition:", a5);
              v35 = (void *)objc_msgSend(v20, "copy");
              objc_msgSend(v31, "setPhysicsBody:", v35);

              objc_msgSend(v36, "addChild:", v31);
            }
            v28 = (v28 + 5);
          }
          while ((int)v28 < v27);
        }
        v26 = (v26 + 5);
      }
      while ((int)v26 < (int)v22);
    }

  }
  else
  {
    NSLog(CFSTR("Can't create grid sprites with no root"));
  }

}

- (void)spritesFromGrid:(id)a3 xDivisions:(int)a4 zPosition:(double)a5 spriteSize:(CGSize)a6 texture:(id)a7 physicsBody:(id)a8
{
  id v12;
  id v13;
  float v14;
  SKPhysicsGrid *v15;
  float v16;
  float v17;
  uint64_t v18;
  double v19;
  double v20;
  int v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double height;
  float v28;
  double width;
  id v31;

  height = a6.height;
  width = a6.width;
  v31 = a3;
  v12 = a7;
  v13 = a8;
  HIDWORD(v26) = a4;
  if (a4 >= 1 && v31 && v12)
  {
    v14 = height / width;
    v15 = self;
    *(float *)&v26 = v14;
    if (v14 > 0.0)
    {
      v16 = 1.0 / (float)a4;
      v17 = 0.0;
      do
      {
        v18 = (int)v17;
        v28 = v17;
        v19 = v17;
        v20 = height * v17;
        v21 = HIDWORD(v26);
        v22 = 0.0;
        do
        {
          v22 = v16 + v22;
          if ((-[SKPhysicsGrid isGridRegionOccupied:y:width:height:](v15, "isGridRegionOccupied:y:width:height:", (int)v22, v18, (int)v16, (int)v16, v26) & 1) != 0)
          {
            +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v12, v22, v19, v16, v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[SKSpriteNode spriteNodeWithTexture:size:](SKSpriteNode, "spriteNodeWithTexture:size:", v23, width * v16, height * v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setPosition:", width * v22, v20);
            objc_msgSend(v24, "setZPosition:", a5);
            v25 = (void *)objc_msgSend(v13, "copy");
            objc_msgSend(v24, "setPhysicsBody:", v25);

            objc_msgSend(v31, "addChild:", v24);
          }
          --v21;
        }
        while (v21);
        v17 = v16 + v28;
      }
      while ((float)(v16 + v28) < *(float *)&v26);
    }

  }
  else
  {
    NSLog(CFSTR("Can't create grid sprites"));
  }

}

- (float)width
{
  return self->_width;
}

- (float)height
{
  return self->_height;
}

@end
