@implementation CIRenderDestination

- (CIRenderDestination)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CIRenderDestination init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (CIRenderDestinationInternal)_internalRepresentation
{
  return (CIRenderDestinationInternal *)self->_priv;
}

- (void)_internalRenderDestination
{
  void **priv;

  priv = (void **)self->_priv;
  if (priv)
    return *priv;
  else
    return 0;
}

- (id)_initWithInternalRenderDestination:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorspace:(CGColorSpace *)a7
{
  uint64_t v8;
  CIRenderDestination *v12;
  _QWORD *v13;
  CI::RenderDestination *v14;
  const char *v15;
  int v16;
  int v17;
  char v19;
  objc_super v20;

  if (a3)
  {
    v8 = *(_QWORD *)&a6;
    v20.receiver = self;
    v20.super_class = (Class)CIRenderDestination;
    v12 = -[CIRenderDestination init](&v20, sel_init);
    if (v12)
    {
      v13 = malloc_type_calloc(1uLL, 0x98uLL, 0x10A0040E62546F1uLL);
      v14 = (CI::RenderDestination *)CI::Object::ref((uint64_t)a3);
      *v13 = v14;
      v13[1] = a4;
      v13[2] = a5;
      *((_DWORD *)v13 + 6) = v8;
      CI::RenderDestination::setColorspace(v14, a7);
      v16 = CI::format_modernize(v8, (CI *)"-[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:]", v15);
      v17 = v16;
      if (v16 <= 2568)
      {
        if (!v16)
        {
          v13[15] = 1;
          *((_BYTE *)v13 + 136) = 1;
          goto LABEL_14;
        }
        if (v16 == 2567)
          goto LABEL_7;
      }
      else
      {
        if (v16 == 2569 || v16 == 3081)
        {
LABEL_12:
          v13[15] = 1;
          goto LABEL_13;
        }
        if (v16 == 3079)
        {
LABEL_7:
          v13[15] = 0;
LABEL_13:
          *((_BYTE *)v13 + 136) = 0;
LABEL_14:
          *((_WORD *)v13 + 64) = 0;
          *((_DWORD *)v13 + 33) = CI::format_bits_per_component(v17);
          *((_BYTE *)v13 + 137) = 0;
          v13[18] = 0;
          v12->_priv = v13;
          return v12;
        }
      }
      if (!CI::format_only_alpha(v16))
      {
        if (CI::format_has_unpremul_alpha(v17))
        {
          v13[15] = 2;
          v19 = 1;
        }
        else
        {
          v13[15] = CI::format_has_alpha(v17);
          v19 = CI::format_is_float(v17) ^ 1;
        }
        *((_BYTE *)v13 + 136) = v19;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  void *priv;
  id v4;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {
    if (*(_QWORD *)priv)
      CI::Object::unref(*(CI::Object **)priv);
    v4 = *((id *)priv + 18);
    *((_QWORD *)priv + 18) = 0;
    free(self->_priv);
    self->_priv = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CIRenderDestination;
  -[CIRenderDestination dealloc](&v5, sel_dealloc);
}

- (void)_render:(void *)a3 withContext:(void *)a4
{
  void *v6;
  CI::RenderTask *v8;

  v6 = -[CIRenderDestination _internalRenderDestination](self, "_internalRenderDestination");
  if (v6)
  {
    if (a3)
    {
      if (a4)
        return (void *)(*(uint64_t (**)(void *, void *, void *))(*(_QWORD *)v6 + 64))(v6, a3, a4);
      v8 = (CI::RenderTask *)operator new();
      CI::RenderTask::RenderTask(v8, "internal CI context is invalid.");
    }
    else
    {
      v8 = (CI::RenderTask *)operator new();
      CI::RenderTask::RenderTask(v8, "internal CI image is invalid.");
    }
  }
  else
  {
    v8 = (CI::RenderTask *)operator new();
    CI::RenderTask::RenderTask(v8, "internal CI render destination is invalid.");
  }
  return v8;
}

- (void)_set_YCC_matrix:(int)a3 fullRange:(BOOL)a4 depth:(int)a5 isFloat:(float)a6
{
  int v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  char *priv;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  double v23[3];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a6 == 0.0)
      v8 = a5;
    else
      v8 = 0;
    if (get_rgb_to_ycc_matrix(a3, a4, v8, v23, (uint64_t)&v21, (uint64_t)&v19, (uint64_t)&v17))
    {
      v9 = v21;
      v10 = v22;
      v11 = v19;
      v12 = v20;
      v13 = v17;
      v14 = v18;
      v15 = *(_OWORD *)v23;
    }
    else
    {
      v9 = 0uLL;
      v10 = 0;
      v12 = 0;
      v14 = 0;
      v11 = 0uLL;
      v13 = 0uLL;
      v15 = 0uLL;
    }
    priv = (char *)self->_priv;
    *((_DWORD *)priv + 7) = a3;
    *((_OWORD *)priv + 2) = v9;
    *((_QWORD *)priv + 6) = v10;
    *(_OWORD *)(priv + 56) = v11;
    *((_QWORD *)priv + 9) = v12;
    *((_OWORD *)priv + 5) = v13;
    *((_QWORD *)priv + 12) = v14;
    *(_OWORD *)(priv + 104) = v15;
  }
}

- (CIRenderDestination)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  size_t Width;
  size_t Height;
  __CVBuffer *v7;
  size_t v8;
  uint64_t v9;
  int is_ycc_biplanar;
  CGColorSpace *v11;
  IOSurfaceRef IOSurface;
  CI::RenderToSurface *v13;
  CI::Object *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CIRenderDestination *v47;
  uint64_t is_ycc_full_range;
  uint64_t v50;
  unsigned int is_float;
  unsigned int default_ycc_color_matrix;
  CFTypeRef Attachment;
  const void *v54;
  double v55;
  uint64_t v56;
  NSObject *v57;
  signed int PixelFormatType;
  _BOOL8 v61;
  _DWORD v62[2];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!pixelBuffer)
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithPixelBuffer:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_19;
  }
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  if (Width - 1 >= 0xF4240 || (v8 = Height, Height - 1 >= 0xF4240))
  {
    v23 = ci_logger_api();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithPixelBuffer:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_19;
  }
  v9 = CI::format_from_CVPixelBuffer(pixelBuffer, v7);
  if (!checkFormat(v9))
  {
    v31 = ci_logger_api();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithPixelBuffer:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_19;
  }
  is_ycc_biplanar = CI::format_is_ycc_biplanar(v9);
  if (((is_ycc_biplanar ^ (CVPixelBufferGetPlaneCount(pixelBuffer) < 2)) & 1) == 0)
  {
    v39 = ci_logger_api();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithPixelBuffer:].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);
LABEL_19:

    return 0;
  }
  v11 = CVImageBufferCopyColorSpace(pixelBuffer);
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  v13 = (CI::RenderToSurface *)operator new();
  v14 = v13;
  if (IOSurface)
    CI::RenderToSurface::RenderToSurface(v13, IOSurface);
  else
    CI::RenderToPixelBuffer::RenderToPixelBuffer(v13, pixelBuffer);
  v47 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v14, Width, v8, v9, v11);
  -[CIRenderDestination setFlipped:](v47, "setFlipped:", 1);
  CI::Object::unref(v14);
  if (CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8CA8], 0) == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    -[CIRenderDestination setAlphaMode:](v47, "setAlphaMode:", 0);
  if (CI::format_is_ycc_or_ycca(v9))
  {
    is_ycc_full_range = CI::format_is_ycc_full_range(v9);
    v50 = CI::format_bits_per_component(v9);
    is_float = CI::format_is_float(v9);
    default_ycc_color_matrix = CI::format_get_default_ycc_color_matrix(v9);
    Attachment = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
    if (Attachment)
    {
      v54 = Attachment;
      if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x1E0CA8F10]))
      {
        v56 = 601;
      }
      else if (CFEqual(v54, (CFTypeRef)*MEMORY[0x1E0CA8F18]))
      {
        v56 = 709;
      }
      else if (CFEqual(v54, (CFTypeRef)*MEMORY[0x1E0CA8F30]))
      {
        v56 = 240;
      }
      else if (CFEqual(v54, (CFTypeRef)*MEMORY[0x1E0CA8F00]))
      {
        v56 = 2020;
      }
      else
      {
        v56 = default_ycc_color_matrix;
      }
    }
    else
    {
      v56 = CI::format_get_default_ycc_color_matrix(v9);
      v57 = ci_logger_api();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v62[0] = 67109120;
        v62[1] = v56;
        _os_log_impl(&dword_1921E4000, v57, OS_LOG_TYPE_INFO, "CIRenderDestination will use Rec. %d YCC Matrix because the CVPixelBuffer was not tagged with a kCVImageBufferYCbCrMatrixKey.", (uint8_t *)v62, 8u);
      }
    }
    *(float *)&v55 = (float)is_float;
    -[CIRenderDestination _set_YCC_matrix:fullRange:depth:isFloat:](v47, "_set_YCC_matrix:fullRange:depth:isFloat:", v56, is_ycc_full_range, v50, v55);
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v61 = PixelFormatType >> 24 == 38 || (PixelFormatType & 0xFD000000) == 754974720 || PixelFormatType >> 24 == 124;
  -[CIRenderDestination setCompressed:](v47, "setCompressed:", v61);
  CGColorSpaceRelease(v11);
  return v47;
}

- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 pixelBufferProvider:(id)a7
{
  int v9;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (!a7)
  {
    v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_18;
  }
  if (a3 - 1 >= 0xF4240 || a4 - 1 >= 0xF4240)
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.5(v29, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_18;
  }
  v9 = CI::format_from_PixelFormatType(*(CI **)&a5);
  if (!checkFormat(v9))
  {
    v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_18;
  }
  if (!a6)
    goto LABEL_21;
  TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a6) || !CGColorSpaceSupportsOutput(a6))
  {
LABEL_10:
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_18:

    return 0;
  }
  is_luminance = CI::format_is_luminance(v9);
  Model = CGColorSpaceGetModel(a6);
  if (!is_luminance)
  {
    if (Model == kCGColorSpaceModelRGB)
      goto LABEL_21;
    goto LABEL_10;
  }
  if (Model)
    goto LABEL_10;
LABEL_21:
  v46 = ci_logger_api();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:pixelBufferProvider:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);
  return self;
}

- (CIRenderDestination)initWithIOSurface:(IOSurface *)surface
{
  size_t Width;
  size_t Height;
  __IOSurface *v7;
  size_t v8;
  uint64_t v9;
  int is_ycc_biplanar;
  CGColorSpace *v11;
  CI::RenderToSurface *v12;
  CIRenderDestination *v13;
  CFTypeRef v14;
  uint64_t is_ycc_full_range;
  uint64_t v16;
  unsigned int is_float;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t default_ycc_color_matrix;
  NSObject *v52;
  double v53;
  signed int PixelFormat;
  _BOOL8 v57;
  uint8_t buf[4];
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!surface)
  {
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithIOSurface:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_23;
  }
  Width = IOSurfaceGetWidth((IOSurfaceRef)surface);
  Height = IOSurfaceGetHeight((IOSurfaceRef)surface);
  if (Width - 1 >= 0xF4240 || (v8 = Height, Height - 1 >= 0xF4240))
  {
    v26 = ci_logger_api();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithIOSurface:].cold.4(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_23;
  }
  v9 = CI::format_from_IOSurface((CI *)surface, v7);
  if (!checkFormat(v9))
  {
    v34 = ci_logger_api();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithIOSurface:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_23;
  }
  is_ycc_biplanar = CI::format_is_ycc_biplanar(v9);
  if (((is_ycc_biplanar ^ (IOSurfaceGetPlaneCount((IOSurfaceRef)surface) < 2)) & 1) == 0)
  {
    v42 = ci_logger_api();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithIOSurface:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);
LABEL_23:

    return 0;
  }
  v11 = CopySurfaceColorSpace((__IOSurface *)surface);
  v12 = (CI::RenderToSurface *)operator new();
  CI::RenderToSurface::RenderToSurface(v12, surface);
  v13 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v12, Width, v8, v9, v11);
  -[CIRenderDestination setFlipped:](v13, "setFlipped:", 1);
  v14 = IOSurfaceCopyValue((IOSurfaceRef)surface, CFSTR("IOSurfaceAlphaIsOpaque"));
  if (v14 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    -[CIRenderDestination setAlphaMode:](v13, "setAlphaMode:", 0);
  if (v14)
    CFRelease(v14);
  if (CI::format_is_ycc_or_ycca(v9))
  {
    is_ycc_full_range = CI::format_is_ycc_full_range(v9);
    v16 = CI::format_bits_per_component(v9);
    is_float = CI::format_is_float(v9);
    IOSurfaceGetBulkAttachments();
    default_ycc_color_matrix = CI::format_get_default_ycc_color_matrix(v9);
    v52 = ci_logger_api();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v59 = default_ycc_color_matrix;
      _os_log_impl(&dword_1921E4000, v52, OS_LOG_TYPE_INFO, "Will use Rec. %d YCC Matrix because the IOSurface was not tagged with a kIOSurfaceYCbCrMatrix.", buf, 8u);
    }
    *(float *)&v53 = (float)is_float;
    -[CIRenderDestination _set_YCC_matrix:fullRange:depth:isFloat:](v13, "_set_YCC_matrix:fullRange:depth:isFloat:", default_ycc_color_matrix, is_ycc_full_range, v16, v53);
  }
  PixelFormat = IOSurfaceGetPixelFormat((IOSurfaceRef)surface);
  v57 = PixelFormat >> 24 == 38 || (PixelFormat & 0xFD000000) == 754974720 || PixelFormat >> 24 == 124;
  -[CIRenderDestination setCompressed:](v13, "setCompressed:", v57);
  CI::Object::unref(v12);
  CGColorSpaceRelease(v11);
  return v13;
}

- (CIRenderDestination)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 colorSpace:(CGColorSpace *)a6 surfaceProvider:(id)a7
{
  int v9;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (!a7)
  {
    v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_18;
  }
  if (a3 - 1 >= 0xF4240 || a4 - 1 >= 0xF4240)
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.5(v29, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_18;
  }
  v9 = CI::format_from_PixelFormatType(*(CI **)&a5);
  if (!checkFormat(v9))
  {
    v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_18;
  }
  if (!a6)
    goto LABEL_21;
  TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a6) || !CGColorSpaceSupportsOutput(a6))
  {
LABEL_10:
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_18:

    return 0;
  }
  is_luminance = CI::format_is_luminance(v9);
  Model = CGColorSpaceGetModel(a6);
  if (!is_luminance)
  {
    if (Model == kCGColorSpaceModelRGB)
      goto LABEL_21;
    goto LABEL_10;
  }
  if (Model)
    goto LABEL_10;
LABEL_21:
  v46 = ci_logger_api();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    -[CIRenderDestination initWithWidth:height:pixelFormat:colorSpace:surfaceProvider:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);
  return self;
}

- (CIRenderDestination)initWithMTLTexture:(id)texture commandBuffer:(id)commandBuffer
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CIRenderDestination *v50;
  int Format;
  uint64_t v53;
  uint64_t v54;
  CGColorSpace *v55;
  CI::Object *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65[2];
  unsigned __int8 v66;

  if (texture)
  {
    v7 = objc_msgSend(texture, "width");
    v8 = objc_msgSend(texture, "height");
    if (v7 - 1 >= 0xF4240 || (v9 = v8, (unint64_t)(v8 - 1) >= 0xF4240))
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.6(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    else if (objc_msgSend(texture, "depth") == 1)
    {
      if (objc_msgSend(texture, "textureType") == 2)
      {
        if ((objc_msgSend(texture, "usage") & 2) != 0)
        {
          v66 = 0;
          Format = CIMetalTextureGetFormat(texture);
          v53 = CIFormatFromCIMetalTextureFormat(Format, &v66);
          if ((_DWORD)v53)
          {
            v54 = v53;
            v55 = default_colorspace_for_format(v53, v66);
            v56 = (CI::Object *)operator new();
            v65[0] = (double)v7;
            v65[1] = (double)v9;
            CI::RenderToMTLTexture::RenderToMTLTexture(v56, texture, commandBuffer, v65, v54);
            v50 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v56, v7, v9, v54, v55);
            -[CIRenderDestination setFlipped:](v50, "setFlipped:", objc_msgSend(texture, "isDrawable"));
            CI::Object::unref(v56);
            CGColorSpaceRelease(v55);
            return v50;
          }
          v57 = ci_logger_api();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.3(v57, v58, v59, v60, v61, v62, v63, v64);
        }
        else
        {
          v10 = ci_logger_api();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }
      else
      {
        v42 = ci_logger_api();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.4(v42, v43, v44, v45, v46, v47, v48, v49);
      }
    }
    else
    {
      v34 = ci_logger_api();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.5(v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
  else
  {
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithMTLTexture:commandBuffer:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  return 0;
}

- (CIRenderDestination)initWithWidth:(NSUInteger)width height:(NSUInteger)height pixelFormat:(MTLPixelFormat)pixelFormat commandBuffer:(id)commandBuffer mtlTextureProvider:(void *)block
{
  uint64_t v12;
  uint64_t v13;
  CGColorSpace *v14;
  CI::Object *v15;
  CIRenderDestination *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v42[2];
  unsigned __int8 v43;

  if (!block)
  {
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_12;
  }
  if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
  {
    v25 = ci_logger_api();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:].cold.3(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_12;
  }
  v43 = 0;
  v12 = CIFormatFromCIMetalTextureFormat(pixelFormat, &v43);
  if (!(_DWORD)v12)
  {
    v33 = ci_logger_api();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);
LABEL_12:

    return 0;
  }
  v13 = v12;
  v14 = default_colorspace_for_format(v12, v43);
  v15 = (CI::Object *)operator new();
  v42[0] = (double)width;
  v42[1] = (double)height;
  CI::RenderToMTLTextureProvider::RenderToMTLTextureProvider(v15, block, commandBuffer, v42, v13);
  v16 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v15, width, height, v13, v14);
  -[CIRenderDestination setFlipped:](v16, "setFlipped:", 1);
  CI::Object::unref(v15);
  CGColorSpaceRelease(v14);
  return v16;
}

- (CIRenderDestination)initWithGLTexture:(unsigned int)texture target:(unsigned int)target width:(NSUInteger)width height:(NSUInteger)height
{
  CGColorSpace *v10;
  CI::Object *v11;
  CIRenderDestination *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGSize v30;

  if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
  {
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithGLTexture:target:width:height:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  if (target != 3553)
  {
    v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithGLTexture:target:width:height:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_9:

    return 0;
  }
  v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v11 = (CI::Object *)operator new();
  v30.width = (double)width;
  v30.height = (double)height;
  CI::RenderToGLTexture::RenderToGLTexture((uint64_t)v11, texture, 3553, &v30);
  v12 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v11, width, height, 0, v10);
  -[CIRenderDestination setFlipped:](v12, "setFlipped:", 1);
  CI::Object::unref(v11);
  CGColorSpaceRelease(v10);
  return v12;
}

+ (int)_crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(unint64_t)a6 format:(int)a7
{
  int v11;
  unint64_t v12;

  v11 = CI::format_bits_per_pixel(a7);
  v12 = (v11 * a4) >> 3;
  if (v11 == 12)
    v12 = a6;
  if (!v11)
    v12 = a6;
  return *((char *)a3 + (a5 - 1) * a6 + v12 - 1) + *(unsigned __int8 *)a3;
}

- (CIRenderDestination)initWithBitmapData:(void *)data width:(NSUInteger)width height:(NSUInteger)height bytesPerRow:(NSUInteger)bytesPerRow format:(CIFormat)format
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CIRenderDestination *v35;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  CGColorSpace *v50;
  CI::Bitmap *v51;
  CI::RenderToBitmap *v52;

  if (data)
  {
    if (width - 1 >= 0xF4240 || height - 1 >= 0xF4240)
    {
      v27 = ci_logger_api();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.6(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    else if (bytesPerRow < 0x3D0901)
    {
      v38 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]", (const char *)data);
      if ((CI::format_is_supported_render_to_bitmap(v38) & 1) != 0)
      {
        v39 = CI::format_destination_rowbytes_requirement(v38);
        if ((int)CI::format_bytes_per_pixel(v38) * width <= bytesPerRow)
        {
          if (!(bytesPerRow % v39))
          {
            +[CIRenderDestination _crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:width:height:bytesPerRow:format:](CIRenderDestination, "_crashed_because_nonaddressable_memory_was_passed_to_initWithBitmapData:width:height:bytesPerRow:format:", data, width, height, bytesPerRow, v38);
            v50 = default_colorspace_for_format(v38, 0);
            v51 = (CI::Bitmap *)operator new();
            CI::Bitmap::Bitmap(v51, data, width, height, bytesPerRow, v38, v50);
            v52 = (CI::RenderToBitmap *)operator new();
            CI::RenderToBitmap::RenderToBitmap(v52, v51);
            v35 = -[CIRenderDestination _initWithInternalRenderDestination:width:height:format:colorspace:](self, "_initWithInternalRenderDestination:width:height:format:colorspace:", v52, width, height, v38, v50);
            -[CIRenderDestination setFlipped:](v35, "setFlipped:", 1);
            CI::Object::unref(v52);
            CI::Object::unref(v51);
            CGColorSpaceRelease(v50);
            return v35;
          }
          v49 = ci_logger_api();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.4(v39, v49);
        }
        else
        {
          v40 = ci_logger_api();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.3(v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
      else
      {
        v48 = ci_logger_api();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.5(v38);
      }
    }
    else
    {
      v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

  return 0;
}

- (NSUInteger)width
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[1];
  else
    return 0;
}

- (NSUInteger)height
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[2];
  else
    return 0;
}

- (CIRenderDestinationAlphaMode)alphaMode
{
  void *priv;

  priv = self->_priv;
  if (priv)
    return *((_QWORD *)priv + 15);
  else
    return 0;
}

- (void)setAlphaMode:(CIRenderDestinationAlphaMode)alphaMode
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *priv;

  if (alphaMode < (CIRenderDestinationAlphaUnpremultiplied|CIRenderDestinationAlphaPremultiplied))
  {
    priv = self->_priv;
    if (priv)
      priv[15] = alphaMode;
  }
  else
  {
    v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination setAlphaMode:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (BOOL)isFlipped
{
  _BYTE *priv;

  priv = self->_priv;
  return priv && priv[128] != 0;
}

- (void)setFlipped:(BOOL)flipped
{
  _BYTE *priv;

  priv = self->_priv;
  if (priv)
    priv[128] = flipped;
}

- (BOOL)isDithered
{
  _BYTE *priv;

  priv = self->_priv;
  return priv && priv[129] != 0;
}

- (void)setDithered:(BOOL)dithered
{
  _BYTE *priv;

  priv = self->_priv;
  if (priv)
    priv[129] = dithered;
}

- (int)ditherDepth
{
  _DWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[33];
  else
    return 0;
}

- (BOOL)isClamped
{
  _BYTE *priv;

  priv = self->_priv;
  return priv && priv[136] != 0;
}

- (void)setClamped:(BOOL)clamped
{
  _BYTE *priv;

  priv = self->_priv;
  if (priv)
    priv[136] = clamped;
}

- (BOOL)isCompressed
{
  _BYTE *priv;

  priv = self->_priv;
  return priv && priv[138] != 0;
}

- (void)setCompressed:(BOOL)a3
{
  _BYTE *priv;

  priv = self->_priv;
  if (priv)
    priv[138] = a3;
}

- (int)format
{
  char *priv;
  int *v3;

  priv = (char *)self->_priv;
  if (priv)
    v3 = (int *)(priv + 24);
  else
    v3 = &kCIFormatNil;
  return *v3;
}

- (CGColorSpaceRef)colorSpace
{
  uint64_t *priv;
  uint64_t v3;

  priv = (uint64_t *)self->_priv;
  if (priv && (v3 = *priv) != 0)
    return *(CGColorSpaceRef *)(v3 + 24);
  else
    return 0;
}

- (void)setColorSpace:(CGColorSpaceRef)colorSpace
{
  void *priv;
  CGColorSpaceRef *v4;
  int v6;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  priv = self->_priv;
  if (priv)
  {
    v4 = *(CGColorSpaceRef **)priv;
    if (*(_QWORD *)priv)
    {
      if (v4[3] != colorSpace)
      {
        if (colorSpace)
        {
          v6 = *((_DWORD *)priv + 6);
          TypeID = CGColorSpaceGetTypeID();
          if (TypeID != CFGetTypeID(colorSpace) || !CGColorSpaceSupportsOutput(colorSpace))
            goto LABEL_9;
          is_luminance = CI::format_is_luminance(v6);
          Model = CGColorSpaceGetModel(colorSpace);
          if (is_luminance)
          {
            if (Model)
              goto LABEL_9;
          }
          else if (Model != kCGColorSpaceModelRGB)
          {
LABEL_9:
            v10 = ci_logger_api();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[CIRenderDestination setColorSpace:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
            return;
          }
        }
        CI::RenderDestination::setColorspace((CI::RenderDestination *)v4, colorSpace);
      }
    }
  }
}

- (CIBlendKernel)blendKernel
{
  void *priv;

  priv = self->_priv;
  if (priv)
    return (CIBlendKernel *)*((_QWORD *)priv + 18);
  else
    return 0;
}

- (void)setBlendKernel:(CIBlendKernel *)blendKernel
{
  id *priv;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  priv = (id *)self->_priv;
  if (priv && priv[18] != blendKernel)
  {
    if (!blendKernel)
      goto LABEL_9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((*(unsigned int (**)(id))(*(_QWORD *)*priv + 16))(*priv) == 85
        && (objc_msgSend(*((id *)*priv + 9), "usage") & 1) == 0)
      {
        v5 = ci_logger_api();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[CIRenderDestination setBlendKernel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        return;
      }
LABEL_9:
      v13 = priv[18];
      priv[18] = blendKernel;
      return;
    }
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CIRenderDestination setBlendKernel:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (BOOL)blendsInDestinationColorSpace
{
  _BYTE *priv;

  priv = self->_priv;
  return priv && priv[137] != 0;
}

- (void)setBlendsInDestinationColorSpace:(BOOL)blendsInDestinationColorSpace
{
  _BYTE *priv;

  priv = self->_priv;
  if (priv)
    priv[137] = blendsInDestinationColorSpace;
}

- (id)label
{
  uint64_t *priv;
  uint64_t v3;

  priv = (uint64_t *)self->_priv;
  if (priv && (v3 = *priv) != 0)
    return *(id *)(v3 + 16);
  else
    return 0;
}

- (void)setLabel:(id)a3
{
  CI::RenderDestination **priv;

  priv = (CI::RenderDestination **)self->_priv;
  if (priv)
  {
    if (*priv)
      CI::RenderDestination::setLabel(*priv, a3);
  }
}

- (id)surface
{
  id **priv;
  id *v3;

  priv = (id **)self->_priv;
  if (priv && (v3 = *priv) != 0 && (*((unsigned int (**)(id *, SEL))*v3 + 2))(v3, a2) == 83)
    return v3[6];
  else
    return 0;
}

- (id)imageRepresentation
{
  unsigned __int8 *priv;
  CI::RenderToMTLTextureProvider *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int has_alpha;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  double v16;
  CIImage *v17;
  void *v18;
  void *v19;
  CIImage *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  priv = (unsigned __int8 *)self->_priv;
  v3 = *(CI::RenderToMTLTextureProvider **)priv;
  v4 = *((_QWORD *)priv + 1);
  v5 = *((_QWORD *)priv + 2);
  v6 = *(_QWORD *)(*(_QWORD *)priv + 24);
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)MEMORY[0x1E0C99E08];
  v30[0] = v6;
  v29[0] = CFSTR("CIImageColorSpace");
  v29[1] = CFSTR("CIImageFlipped");
  v30[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", priv[128]);
  v8 = (void *)objc_msgSend(v7, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v9 = v8;
  v10 = *((_QWORD *)priv + 15);
  switch(v10)
  {
    case 2:
      v12 = MEMORY[0x1E0C9AAA0];
LABEL_9:
      objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("CIImagePremultiplied"));
      break;
    case 1:
      v12 = MEMORY[0x1E0C9AAB0];
      goto LABEL_9;
    case 0:
      has_alpha = CI::format_has_alpha(*((_DWORD *)priv + 6));
      goto LABEL_11;
  }
  has_alpha = 0;
LABEL_11:
  if (*((_DWORD *)priv + 7))
    objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("kCIImageYCCMatrix"));
  v13 = (*(uint64_t (**)(CI::RenderToMTLTextureProvider *))(*(_QWORD *)v3 + 16))(v3);
  v14 = "";
  v16 = (double)v4;
  switch(v13)
  {
    case 'Q':
      v15 = (v13 - 81);
      v17 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(*((_QWORD *)v3 + 6) + 72), (unint64_t)((double)v5 * (double)*(unint64_t *)(*((_QWORD *)v3 + 6) + 96))), *(_QWORD *)(v15 + 96), *(unsigned int *)(v15 + 104), v9, v16, (double)v5);
      goto LABEL_23;
    case 'R':
      v17 = +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", *((_QWORD *)v3 + 6), v9);
      goto LABEL_23;
    case 'S':
      v17 = +[CIImage imageWithIOSurface:options:](CIImage, "imageWithIOSurface:options:", *((_QWORD *)v3 + 6), v9);
      goto LABEL_23;
    case 'T':
      v17 = +[CIImage imageWithTexture:size:options:](CIImage, "imageWithTexture:size:options:", *((unsigned int *)v3 + 16), v9, v16, (double)v5);
      goto LABEL_23;
    case 'U':
      v18 = (void *)*((_QWORD *)v3 + 9);
      v19 = v18;
      goto LABEL_20;
    case 'X':
      v19 = (void *)CI::RenderToMTLTextureProvider::texture(v3);
      v18 = v19;
LABEL_20:
      if ((objc_msgSend(v19, "usage") & 1) != 0)
      {
        v17 = +[CIImage imageWithMTLTexture:options:](CIImage, "imageWithMTLTexture:options:", v18, v9);
LABEL_23:
        v20 = v17;
        if (v17)
        {
          if (has_alpha)
          {
            -[CIImage extent](v17, "extent");
            return -[CIImage imageBySettingAlphaOneInExtent:](v20, "imageBySettingAlphaOneInExtent:");
          }
          return v20;
        }
        v14 = "";
      }
      else
      {
        v14 = " because the MTLTexture usage does not inlude MTLTextureUsageShaderRead";
      }
LABEL_27:
      v21 = ci_logger_api();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CIRenderDestination imageRepresentation].cold.1((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
      return 0;
    default:
      goto LABEL_27;
  }
}

- (id)description
{
  _DWORD *priv;
  _QWORD *v4;
  _QWORD *v5;
  const __CFString *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  objc_super v12;

  priv = self->_priv;
  if (priv)
  {
    v4 = -[CIRenderDestination _internalRenderDestination](self, "_internalRenderDestination");
    v5 = v4;
    if (v4 && v4[2])
      v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), v4[2]);
    else
      v6 = &stru_1E2ECD1B0;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p%@ format: %s size: %ux%u"), v9, self, v6, CI::name_for_format(priv[6]), *((_QWORD *)priv + 1), *((_QWORD *)priv + 2));
    if (v5)
    {
      v11 = (const void *)(*(uint64_t (**)(_QWORD *))(*v5 + 24))(v5);
      v10 = (void *)objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" %@"), v11);
      CFRelease(v11);
    }
    return (id)objc_msgSend(v10, "stringByAppendingString:", CFSTR(">"));
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CIRenderDestination;
    return -[CIRenderDestination description](&v12, sel_description);
  }
}

- (id)debugDescription
{
  uint64_t *priv;
  uint64_t v3;
  _QWORD v5[7];
  objc_super v6;

  priv = (uint64_t *)self->_priv;
  if (priv && (v3 = *priv) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__CIRenderDestination_debugDescription__block_invoke;
    v5[3] = &unk_1E2EC5210;
    v5[4] = self;
    v5[5] = v3;
    v5[6] = priv;
    return (id)(id)stream_to_string((uint64_t)v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CIRenderDestination;
    return -[CIRenderDestination debugDescription](&v6, sel_debugDescription);
  }
}

uint64_t __39__CIRenderDestination_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  fprintf(a2, "%s\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "description"), "UTF8String"));
  fwrite("    colorspace: ", 0x10uLL, 1uLL, a2);
  CI::fprintf_cs(a2, *(__sFILE **)(*(_QWORD *)(a1 + 40) + 24), (CGColorSpace *)1);
  fputc(10, a2);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(v4 + 120);
  if (!v5)
  {
    fwrite("    alphaMode: None\n", 0x14uLL, 1uLL, a2);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(v4 + 120);
  }
  if (v5 == 1)
  {
    fwrite("    alphaMode: Premultiplied\n", 0x1DuLL, 1uLL, a2);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(v4 + 120);
  }
  if (v5 == 2)
  {
    fwrite("    alphaMode: Unpremultiplied\n", 0x1FuLL, 1uLL, a2);
    v4 = *(_QWORD *)(a1 + 48);
  }
  v6 = *(void **)(v4 + 144);
  if (v6)
  {
    fprintf(a2, "    blendKernel: %s\n", (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String"));
    fprintf(a2, "    blendsInDestinationColorSpace: %d\n", *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 137));
    v4 = *(_QWORD *)(a1 + 48);
  }
  fprintf(a2, "    flipped: %d\n", *(unsigned __int8 *)(v4 + 128));
  fprintf(a2, "    dithered: %d\n", *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 129));
  return fprintf(a2, "    clamped: %d", *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 136));
}

- (void)init
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s init is not a valid initializer for CIRenderDestination", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid pixelBuffer argument.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported pixelBuffer plane count.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported pixelBuffer format.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithPixelBuffer:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a pixelBuffer with valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid pixelBuffer provider block.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s not supported yet.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported colorspace.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported pixelBuffer format.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 pixelBufferProvider:(uint64_t)a7 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid surface argument.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported surface plane count.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported surface format.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithIOSurface:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a surface with valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid surface provider block.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s not supported yet.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported colorspace.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported pixelBuffer format.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 colorSpace:(uint64_t)a6 surfaceProvider:(uint64_t)a7 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid MTLTexture argument.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s texture usage must include MTLTextureUsageShaderWrite.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported MTLPixelFormat.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s texture type must be MTLTextureType2D.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a MTLTexture with depth 1.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 commandBuffer:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a MTLTexture with valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid metal texture provider block.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported MTLPixelFormat.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithWidth:(uint64_t)a3 height:(uint64_t)a4 pixelFormat:(uint64_t)a5 commandBuffer:(uint64_t)a6 mtlTextureProvider:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithGLTexture:(uint64_t)a3 target:(uint64_t)a4 width:(uint64_t)a5 height:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s target must be GL_TEXTURE_2D.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithGLTexture:(uint64_t)a3 target:(uint64_t)a4 width:(uint64_t)a5 height:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid data argument.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid bytesPerRow.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s bytesPerRow must be greater than or equal to width times format's bytes per pixel .", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:(uint64_t)a1 width:(NSObject *)a2 height:bytesPerRow:format:.cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "-[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s rowBytes must be a multiple of %ld.", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:(int)a1 width:height:bytesPerRow:format:.cold.5(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s format %{public}s is unsupported.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithBitmapData:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 bytesPerRow:(uint64_t)a6 format:(uint64_t)a7 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid width and height.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setAlphaMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported alpha mode.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported colorspace for this destination.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setBlendKernel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s destination texture usage must include MTLTextureUsageShaderRead to support blending.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setBlendKernel:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s blendKernel must be a subclass of CIBlendKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageRepresentation
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a2, a3, "Using a blend kernel is not supported for this CIRenderDestination%{public}s.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
