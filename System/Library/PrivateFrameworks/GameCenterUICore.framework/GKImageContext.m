@implementation GKImageContext

+ (id)contextDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6;
  double height;
  double width;
  void (**v10)(id, void *);
  GKImageContext *v11;
  GKImageContext *v12;

  v6 = *(_QWORD *)&a5;
  height = a3.height;
  width = a3.width;
  v10 = (void (**)(id, void *))a6;
  v11 = -[GKImageContext initWithSize:scale:options:data:]([GKImageContext alloc], "initWithSize:scale:options:data:", v6, 0, width, height, a4);
  v12 = v11;
  if ((v6 & 4) != 0)
  {
    UIGraphicsPushContext(-[GKImageContext CGContext](v11, "CGContext"));
    v10[2](v10, v12);
    UIGraphicsPopContext();
  }
  else
  {
    v10[2](v10, v11);
  }

  return v12;
}

+ (id)imageDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "contextDrawnWithSize:scale:options:usingBlock:", *(_QWORD *)&a5, a6, a3.width, a3.height, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)GKImageContext;
  -[GKImageContext dealloc](&v3, sel_dealloc);
}

- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 data:(void *)a6
{
  void *v6;
  size_t v7;
  char v9;
  double height;
  double width;
  GKImageContext *v13;
  GKImageContext *v14;
  double v15;
  float v16;
  float v17;
  GKImageContext *v19;
  size_t AlignedBytesPerRow;
  uint32_t v21;
  CGColorSpace *DeviceGray;
  CGContext *v23;
  CGAffineTransform *v24;
  double v25;
  double v26;
  uint64_t v28;
  char v29;
  objc_super v30;
  CGRect v31;

  v9 = a5;
  height = a3.height;
  width = a3.width;
  v30.receiver = self;
  v30.super_class = (Class)GKImageContext;
  v13 = -[GKImageContext init](&v30, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_24;
  v13->_size.width = width;
  v13->_size.height = height;
  if (a4 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    a4 = v15;

  }
  v14->_scale = a4;
  v16 = width * a4;
  LODWORD(v7) = vcvtps_s32_f32(v16);
  v17 = height * a4;
  LODWORD(v6) = vcvtps_s32_f32(v17);
  if ((int)v7 >= 1 && (int)v6 >= 1)
  {
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    if ((v9 & 2) != 0)
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      v21 = 0;
    }
    else
    {
      if ((v9 & 1) != 0)
        v21 = 8198;
      else
        v21 = 8194;
      DeviceGray = CGColorSpaceCreateDeviceRGB();
    }
    v23 = CGBitmapContextCreate(a6, v7, (size_t)v6, 8uLL, AlignedBytesPerRow, DeviceGray, v21);
    CGColorSpaceRelease(DeviceGray);
    if (!v23)
      goto LABEL_23;
    if (a6)
    {
      if ((v9 & 8) == 0)
      {
LABEL_19:
        CGContextTranslateCTM(v23, 0.0, (double)(int)v6);
        CGContextScaleCTM(v23, a4, -a4);
        v24 = (CGAffineTransform *)&v29;
        v25 = a4;
        v26 = -a4;
LABEL_22:
        CGAffineTransformMakeScale(v24, v25, v26);
        CGContextSetBaseCTM();
LABEL_23:
        v14->_CGContext = v23;
LABEL_24:
        v19 = v14;
        goto LABEL_25;
      }
    }
    else
    {
      v31.size.width = (double)(int)v7;
      v31.size.height = (double)(int)v6;
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      CGContextClearRect(v23, v31);
      if ((v9 & 8) == 0)
        goto LABEL_19;
    }
    CGContextScaleCTM(v23, a4, a4);
    v24 = (CGAffineTransform *)&v28;
    v25 = a4;
    v26 = a4;
    goto LABEL_22;
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5
{
  return -[GKImageContext initWithSize:scale:options:data:](self, "initWithSize:scale:options:data:", *(_QWORD *)&a5, 0, a3.width, a3.height, a4);
}

- (UIImage)image
{
  CGImageRef Image;
  CGImage *v4;
  void *v5;
  void *v6;

  Image = CGBitmapContextCreateImage(self->_CGContext);
  if (Image)
  {
    v4 = Image;
    v5 = (void *)MEMORY[0x24BDF6AC8];
    -[GKImageContext scale](self, "scale");
    objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return (UIImage *)v6;
}

- (BOOL)writeRawPixelsToURL:(id)a3 error:(id *)a4
{
  id v6;
  CGContext *CGContext;
  int BytesPerRow;
  unsigned int height;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  uint64_t v16;
  unsigned int width;
  unsigned int v18;
  int v19;
  int v20;
  CGBitmapInfo BitmapInfo;

  v6 = a3;
  CGContext = self->_CGContext;
  v16 = 64181;
  BytesPerRow = CGBitmapContextGetBytesPerRow(CGContext);
  height = self->_size.height;
  width = self->_size.width;
  v18 = height;
  LODWORD(self) = self->_scale;
  v19 = BytesPerRow;
  v20 = (int)self;
  BitmapInfo = CGBitmapContextGetBitmapInfo(CGContext);
  v10 = height * self * BytesPerRow;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v10 + 28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendBytes:length:", &v16, 28);
  objc_msgSend(v11, "appendBytes:length:", CGBitmapContextGetData(CGContext), v10);
  v15 = 0;
  LOBYTE(v10) = objc_msgSend(v11, "writeToURL:options:error:", v6, 1, &v15);
  v12 = v15;
  if ((v10 & 1) == 0)
  {
    if (!*MEMORY[0x24BE3A308])
      v13 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
    {
      -[GKImageContext writeRawPixelsToURL:error:].cold.1();
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v12);
LABEL_7:

  return v12 == 0;
}

+ (id)imageFromRawPixelsAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  os_log_t *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  _DWORD *v14;
  unsigned int *v15;
  int *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  id v31;

  v3 = a3;
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 1, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  if (v4)
  {
    if ((unint64_t)objc_msgSend(v4, "length") > 0x23)
    {
      v13 = objc_retainAutorelease(v4);
      v14 = (_DWORD *)objc_msgSend(v13, "bytes");
      v15 = v14;
      if (*v14 == 64181)
      {
        v16 = v14 + 1;
        if (v14[1])
        {
          if (!*MEMORY[0x24BE3A308])
            v17 = (id)GKOSLoggers();
          v18 = *MEMORY[0x24BE3A300];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
            +[GKImageContext imageFromRawPixelsAtURL:].cold.4(v16, (uint64_t)v3, v18);
        }
        else
        {
          if (objc_msgSend(v13, "length") >= (unint64_t)(v14[5] * v14[3] * v14[4]) + 28)
          {
            v25 = (void *)MEMORY[0x24BDF6AC8];
            objc_msgSend(v13, "subdataWithRange:", 28, objc_msgSend(v13, "length") - 28);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v27) = v15[2];
            LODWORD(v28) = v15[3];
            LODWORD(v29) = v15[5];
            objc_msgSend(v25, "_gkImageWithRawData:size:scale:rowBytes:bitmapInfo:", v26, v15[4], v15[6], (double)v27, (double)v28, (double)v29);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }
          if (!*MEMORY[0x24BE3A308])
            v23 = (id)GKOSLoggers();
          v24 = (void *)*MEMORY[0x24BE3A300];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
            +[GKImageContext imageFromRawPixelsAtURL:].cold.3(v24);
        }
      }
      else
      {
        if (!*MEMORY[0x24BE3A308])
          v19 = (id)GKOSLoggers();
        v20 = *MEMORY[0x24BE3A300];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
          +[GKImageContext imageFromRawPixelsAtURL:].cold.5(v15, (uint64_t)v3, v20);
      }
    }
    else
    {
      v6 = (NSObject **)MEMORY[0x24BE3A308];
      v7 = *MEMORY[0x24BE3A308];
      if (!*MEMORY[0x24BE3A308])
      {
        v8 = (id)GKOSLoggers();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[GKImageContext imageFromRawPixelsAtURL:].cold.2(v7);
    }
  }
  else
  {
    v9 = (os_log_t *)MEMORY[0x24BE3A2E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E8], OS_LOG_TYPE_DEBUG))
    {
      v30 = 0;
      v10 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", &v30);
      v11 = v30;
      if (v10)
      {
        if (!*MEMORY[0x24BE3A308])
          v12 = (id)GKOSLoggers();
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          +[GKImageContext imageFromRawPixelsAtURL:].cold.1();
      }
    }
    else
    {
      v11 = 0;
    }

  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (void)writeRawPixelsToURL:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_219F71000, v0, (uint64_t)v0, "cannot write raw pixels:%@ to URL:%@", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)imageFromRawPixelsAtURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2(&dword_219F71000, v0, (uint64_t)v0, "cannot read raw pixels:%@ for image at URL:%@", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)imageFromRawPixelsAtURL:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_219F71000, v1, v3, "image header size way too small:%lu from image at URL:%@", v4);

  OUTLINED_FUNCTION_4_1();
}

+ (void)imageFromRawPixelsAtURL:(void *)a1 .cold.3(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_219F71000, v1, v3, "image header size can't contain full image:%lu for image at URL:%@", v4);

  OUTLINED_FUNCTION_4_1();
}

+ (void)imageFromRawPixelsAtURL:(os_log_t)log .cold.4(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_219F71000, log, OS_LOG_TYPE_ERROR, "unknown image version:%d for image at URL:%@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

+ (void)imageFromRawPixelsAtURL:(NSObject *)a3 .cold.5(unsigned int *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_2(&dword_219F71000, a3, (uint64_t)a3, "unknown magic value:%lXfor image at URL:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

@end
