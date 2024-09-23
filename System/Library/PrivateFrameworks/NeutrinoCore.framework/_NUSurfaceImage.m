@implementation _NUSurfaceImage

- (void)readSurfaceRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___NUSurfaceImage_readSurfaceRegion_withBlock___block_invoke;
  v8[3] = &unk_1E50638E0;
  v9 = v6;
  v7 = v6;
  -[_NUImage readRegion:withBlock:](self, "readRegion:withBlock:", a3, v8);

}

- (void)writeSurfaceRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___NUSurfaceImage_writeSurfaceRegion_withBlock___block_invoke;
  v8[3] = &unk_1E50638E0;
  v9 = v6;
  v7 = v6;
  -[_NUImage writeRegion:withBlock:](self, "writeRegion:withBlock:", a3, v8);

}

- (void)readTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v11[1] = 3221225472;
  v11[2] = __54___NUSurfaceImage_readTextureRegion_device_withBlock___block_invoke;
  v11[3] = &unk_1E50639A8;
  v12 = a4;
  v13 = a5;
  v10.receiver = self;
  v10.super_class = (Class)_NUSurfaceImage;
  v11[0] = MEMORY[0x1E0C809B0];
  v8 = v13;
  v9 = v12;
  -[_NUImage readRegion:withBlock:](&v10, sel_readRegion_withBlock_, a3, v11);

}

- (void)writeTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v11[1] = 3221225472;
  v11[2] = __55___NUSurfaceImage_writeTextureRegion_device_withBlock___block_invoke;
  v11[3] = &unk_1E50639A8;
  v12 = a4;
  v13 = a5;
  v10.receiver = self;
  v10.super_class = (Class)_NUSurfaceImage;
  v11[0] = MEMORY[0x1E0C809B0];
  v8 = v13;
  v9 = v12;
  -[_NUImage writeRegion:withBlock:](&v10, sel_writeRegion_withBlock_, a3, v11);

}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  $0AC6E346AE4835514AAA8AC86D8F4844 v13;
  void *v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 v15;
  uint64_t v16;
  BOOL v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18;
  _OWORD v20[2];
  _QWORD v21[5];
  id v22;
  $0AC6E346AE4835514AAA8AC86D8F4844 v23;
  $0AC6E346AE4835514AAA8AC86D8F4844 v24;
  int64_t v25;
  int64_t v26;
  _OWORD v27[2];

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  v12 = a6;
  if (objc_msgSend(v12, "hasMetalSupport"))
  {
    v13 = a4->var1;
    v27[0] = a4->var0;
    v27[1] = v13;
    +[NURegion regionWithRect:](NURegion, "regionWithRect:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62___NUSurfaceImage_copySurfaceStorage_fromRect_toPoint_device___block_invoke;
    v21[3] = &unk_1E50639D0;
    v15 = a4->var1;
    v23 = a4->var0;
    v24 = v15;
    v21[4] = self;
    v25 = var0;
    v26 = var1;
    v22 = v12;
    v16 = objc_msgSend(v11, "readTextureInRegion:device:block:", v14, v22, v21);

    v17 = v16 == 1;
  }
  else
  {
    v18 = a4->var1;
    v20[0] = a4->var0;
    v20[1] = v18;
    v17 = -[_NUSurfaceImage copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", v11, v20, var0, var1);
  }

  return v17;
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  void *v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  uint64_t v13;
  _QWORD v15[7];
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  _OWORD v18[2];

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v10 = a4->var1;
  v18[0] = a4->var0;
  v18[1] = v10;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = 3221225472;
  v12 = a4->var1;
  v16 = a4->var0;
  v17 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __54___NUSurfaceImage_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5063930;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  v13 = objc_msgSend(v9, "readBufferInRegion:block:", v11, v15);

  return v13 == 1;
}

@end
