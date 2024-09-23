@implementation ADMetalUtils

+ (unint64_t)getMTLPixelFormat:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  int v7;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;

  if ((int)a3 <= 1380401728)
  {
    if ((int)a3 <= 1111970368)
    {
      if (a3 == 825306677 || a3 == 825437747)
        return 23;
      if (a3 == 843264104)
        return 65;
      goto LABEL_32;
    }
    if ((int)a3 <= 1278226535)
    {
      if (a3 == 1111970369)
        return 80;
      v6 = 1278226534;
      goto LABEL_14;
    }
    if (a3 != 1278226536)
    {
      v7 = 1278226742;
      goto LABEL_24;
    }
    return 25;
  }
  if ((int)a3 > 1717855599)
  {
    if ((int)a3 <= 1751410031)
    {
      if (a3 == 1717855600)
        return 55;
      v6 = 1717856627;
LABEL_14:
      if (a3 != v6)
        goto LABEL_32;
      return 55;
    }
    if (a3 != 1751410032 && a3 != 1751411059)
      goto LABEL_32;
    return 25;
  }
  if ((int)a3 <= 1380411456)
  {
    if (a3 == 1380401729)
      return 70;
    if (a3 == 1380410945)
      return 125;
    goto LABEL_32;
  }
  if (a3 == 1380411457)
    return 115;
  v7 = 1647392359;
LABEL_24:
  if (a3 == v7)
    return 23;
LABEL_32:
  v9 = v3;
  v10 = v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported pixelformat", v8, 2u);
  }
  return 0;
}

+ (id)textureForSize:(CGSize)a3 pixelFormat:(unsigned int)a4 metalDevice:(id)a5
{
  uint64_t v5;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", +[ADMetalUtils getMTLPixelFormat:](ADMetalUtils, "getMTLPixelFormat:", v5), (unint64_t)width, (unint64_t)height, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsage:", 19);
  v10 = (void *)objc_msgSend(v8, "newTextureWithDescriptor:", v9);

  return v10;
}

+ (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7 metalDevice:(id)a8 error:(id *)a9
{
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = a8;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a5, a6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setUsage:", 23);
    v17 = (void *)objc_msgSend(v14, "newTextureWithDescriptor:iosurface:plane:", v16, a3, a7);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 metalDevice:(id)a4
{
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:plane:metalDevice:error:", a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 plane:(unint64_t)a4 metalDevice:(id)a5 error:(id *)a6
{
  id v9;
  __IOSurface *IOSurface;
  unint64_t v11;
  size_t WidthOfPlane;
  void *v13;

  v9 = a5;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v11 = +[ADMetalUtils getMTLPixelFormat:](ADMetalUtils, "getMTLPixelFormat:", CVPixelBufferGetPixelFormatType(a3));
    WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a4);
    +[ADMetalUtils bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:metalDevice:error:](ADMetalUtils, "bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:metalDevice:error:", IOSurface, v11, WidthOfPlane, IOSurfaceGetHeightOfPlane(IOSurface, a4), a4, v9, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6 metalDevice:(id)a7 error:(id *)a8
{
  double height;
  double width;
  id v14;
  IOSurfaceRef IOSurface;
  void *v16;

  height = a5.height;
  width = a5.width;
  v14 = a7;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    +[ADMetalUtils bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:metalDevice:error:](ADMetalUtils, "bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:metalDevice:error:", IOSurface, a4, (unint64_t)width, (unint64_t)height, a6, v14, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result;

  result = 1;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
      result = 2;
      break;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5CuLL:
    case 0x5DuLL:
      result = 4;
      break;
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
    case 0x73uLL:
      result = 8;
      break;
    case 0x7BuLL:
    case 0x7CuLL:
    case 0x7DuLL:
      result = 16;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (void)dispatchCommandEncoder:(id)a3 pipeline:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v10, "threadExecutionWidth");
  v12 = objc_msgSend(v10, "maxTotalThreadsPerThreadgroup");
  v14[0] = (int)((a5 + v11 - 1) / v11);
  v14[1] = (int)((a6 + v12 / v11 - 1) / (v12 / v11));
  v14[2] = 1;
  v13[0] = v11;
  v13[1] = v12 / v11;
  v13[2] = 1;
  objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);

}

@end
