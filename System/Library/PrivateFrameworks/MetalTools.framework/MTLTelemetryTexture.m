@implementation MTLTelemetryTexture

- (void)accumTextureDistribution:(id)a3 category:(unint64_t)a4 pixelFormat:(unint64_t)a5 baseAddr:(unint64_t)a6 rowBytes:(unint64_t)a7 isLinear:(BOOL)a8
{
  int v12;
  int v15;
  NSObject *queue;
  _QWORD block[9];
  int v18;
  int v19;
  BOOL v20;

  v12 = a4;
  v15 = objc_msgSend(a3, "textureType");
  queue = self->_telemetryDevice->queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__MTLTelemetryTexture_accumTextureDistribution_category_pixelFormat_baseAddr_rowBytes_isLinear___block_invoke;
  block[3] = &unk_24F794A00;
  v18 = v12;
  v19 = v15;
  block[4] = self;
  block[5] = a3;
  v20 = a8;
  block[6] = a5;
  block[7] = a7;
  block[8] = a6;
  dispatch_sync(queue, block);
}

uint64_t __96__MTLTelemetryTexture_accumTextureDistribution_category_pixelFormat_baseAddr_rowBytes_isLinear___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  _DWORD *v8;
  int v9;
  int v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  int v18;
  unsigned int *v19;
  unsigned int *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  int v26;
  unsigned int *v27;
  unsigned int *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  int v34;
  unsigned int *v35;
  unsigned int *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  _DWORD *v40;
  int v41;
  int v42;
  unsigned int *v43;
  unsigned int *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  _DWORD *v48;
  int v49;
  int v50;
  unsigned int *v51;
  unsigned int *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _DWORD *v60;
  int v61;
  int v62;
  _DWORD *v63;
  _DWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 224;
  v67 = (_QWORD *)(a1 + 48);
  v3 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>(v2, (unint64_t *)(a1 + 48), (uint64_t)&std::piecewise_construct, &v67)+ 3;
  v5 = *(_DWORD *)(a1 + 72);
  v4 = *(_DWORD *)(a1 + 76);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "width");
  if (v6)
  {
    v7 = (uint64_t)&v3[192 * v5 + 24 * v4];
    v10 = *(_DWORD *)(v7 + 40);
    v8 = (_DWORD *)(v7 + 40);
    v9 = v10;
    v11 = v8 - 4;
    v12 = v8 - 3;
    if (v10)
    {
      if (*v12 < v6)
        *v12 = v6;
      if (*v11 <= v6)
        goto LABEL_9;
    }
    else
    {
      *v12 = v6;
    }
    *v11 = v6;
LABEL_9:
    v13 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(_QWORD *)(v13 + 32) += v6;
    *v8 = v9 + 1;
  }
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "height");
  if (!v14)
    goto LABEL_19;
  v15 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v18 = *(_DWORD *)(v15 + 64);
  v16 = (_DWORD *)(v15 + 64);
  v17 = v18;
  v19 = v16 - 4;
  v20 = v16 - 3;
  if (v18)
  {
    if (*v20 < v14)
      *v20 = v14;
    if (*v19 <= v14)
      goto LABEL_18;
  }
  else
  {
    *v20 = v14;
  }
  *v19 = v14;
LABEL_18:
  v21 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v21 + 56) += v14;
  *v16 = v17 + 1;
LABEL_19:
  v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "depth");
  if (!v22)
    goto LABEL_28;
  v23 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v26 = *(_DWORD *)(v23 + 88);
  v24 = (_DWORD *)(v23 + 88);
  v25 = v26;
  v27 = v24 - 4;
  v28 = v24 - 3;
  if (v26)
  {
    if (*v28 < v22)
      *v28 = v22;
    if (*v27 <= v22)
      goto LABEL_27;
  }
  else
  {
    *v28 = v22;
  }
  *v27 = v22;
LABEL_27:
  v29 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v29 + 80) += v22;
  *v24 = v25 + 1;
LABEL_28:
  v30 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "mipmapLevelCount");
  if (!v30)
    goto LABEL_37;
  v31 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v34 = *(_DWORD *)(v31 + 112);
  v32 = (_DWORD *)(v31 + 112);
  v33 = v34;
  v35 = v32 - 4;
  v36 = v32 - 3;
  if (v34)
  {
    if (*v36 < v30)
      *v36 = v30;
    if (*v35 <= v30)
      goto LABEL_36;
  }
  else
  {
    *v36 = v30;
  }
  *v35 = v30;
LABEL_36:
  v37 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v37 + 104) += v30;
  *v32 = v33 + 1;
LABEL_37:
  v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sampleCount");
  if (!v38)
    goto LABEL_46;
  v39 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v42 = *(_DWORD *)(v39 + 136);
  v40 = (_DWORD *)(v39 + 136);
  v41 = v42;
  v43 = v40 - 4;
  v44 = v40 - 3;
  if (v42)
  {
    if (*v44 < v38)
      *v44 = v38;
    if (*v43 <= v38)
      goto LABEL_45;
  }
  else
  {
    *v44 = v38;
  }
  *v43 = v38;
LABEL_45:
  v45 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v45 + 128) += v38;
  *v40 = v41 + 1;
LABEL_46:
  v46 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "arrayLength");
  if (!v46)
    goto LABEL_55;
  v47 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v50 = *(_DWORD *)(v47 + 160);
  v48 = (_DWORD *)(v47 + 160);
  v49 = v50;
  v51 = v48 - 4;
  v52 = v48 - 3;
  if (v50)
  {
    if (*v52 < v46)
      *v52 = v46;
    if (*v51 <= v46)
      goto LABEL_54;
  }
  else
  {
    *v52 = v46;
  }
  *v51 = v46;
LABEL_54:
  v53 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v53 + 152) += v46;
  *v48 = v49 + 1;
LABEL_55:
  if (objc_msgSend(*(id *)(a1 + 40), "isFramebufferOnly"))
  {
    v54 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v54 + 4);
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "usage") & 2) != 0)
  {
    v55 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v55 + 8);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "usage");
  if ((result & 4) != 0)
  {
    v57 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v57 + 12);
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v58 = *(_QWORD *)(a1 + 56);
    if (!(_DWORD)v58)
      goto LABEL_71;
    v59 = (uint64_t)&v3[192 * v5 + 24 * v4];
    v62 = *(_DWORD *)(v59 + 184);
    v60 = (_DWORD *)(v59 + 184);
    v61 = v62;
    v63 = v60 - 4;
    v64 = v60 - 3;
    if (v62)
    {
      if (*v64 < v58)
        *v64 = v58;
      if (*v63 <= v58)
        goto LABEL_70;
    }
    else
    {
      *v64 = v58;
    }
    *v63 = v58;
LABEL_70:
    v65 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(_QWORD *)(v65 + 176) += v58;
    *v60 = v61 + 1;
LABEL_71:
    if (((*(_DWORD *)(a1 + 64) | v58) & 0x3FLL) != 0)
    {
      v66 = (uint64_t)&v3[192 * v5 + 24 * v4];
      ++*(_DWORD *)(v66 + 16);
    }
  }
  ++LODWORD(v3[192 * v5 + 24 * v4]);
  return result;
}

- (void)initMipmapClipType
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[MTLToolsTexture width](self, "width");
  if (v3 <= -[MTLToolsTexture height](self, "height"))
    v4 = -[MTLToolsTexture height](self, "height");
  else
    v4 = -[MTLToolsTexture width](self, "width");
  if (v4 <= -[MTLToolsTexture depth](self, "depth"))
  {
    -[MTLToolsTexture depth](self, "depth");
  }
  else
  {
    v5 = -[MTLToolsTexture width](self, "width");
    if (v5 <= -[MTLToolsTexture height](self, "height"))
      -[MTLToolsTexture height](self, "height");
    else
      -[MTLToolsTexture width](self, "width");
  }
  v6 = _mtlNumMipmapLevelsForSize();
  if (v6 <= -[MTLToolsTexture mipmapLevelCount](self, "mipmapLevelCount"))
  {
    self->mipmapClipType = 0;
  }
  else
  {
    if (-[MTLToolsTexture mipmapLevelCount](self, "mipmapLevelCount") < 2)
    {
      if (-[MTLToolsTexture parentRelativeLevel](self, "parentRelativeLevel"))
        v7 = 2;
      else
        v7 = 1;
    }
    else
    {
      v7 = 3;
    }
    self->mipmapClipType = v7;
  }
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 descriptor:(id)a6 offset:(unint64_t)a7 bytesPerRow:(unint64_t)a8
{
  MTLTelemetryTexture *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTLTelemetryTexture;
  v14 = -[MTLToolsTexture initWithBaseObject:parent:buffer:](&v16, sel_initWithBaseObject_parent_buffer_);
  if (v14)
  {
    v14->_telemetryDescriptor = (MTLTextureDescriptor *)objc_msgSend(a6, "copy");
    v14->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if (objc_msgSend(a4, "enableTelemetry"))
    {
      -[MTLTelemetryTexture initMipmapClipType](v14, "initMipmapClipType");
      -[MTLTelemetryTexture accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:](v14, "accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:", a3, 1, objc_msgSend(a3, "pixelFormat"), objc_msgSend(a5, "contents") + a7, a8, 1);
    }
  }
  return v14;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5 plane:(unint64_t)a6
{
  MTLTelemetryTexture *v9;
  __IOSurface *v10;
  uint64_t v11;
  void *BaseAddress;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTLTelemetryTexture;
  v9 = -[MTLToolsResource initWithBaseObject:parent:](&v14, sel_initWithBaseObject_parent_, a3, a4, a5, a6);
  if (v9)
  {
    v9->_telemetryDescriptor = (MTLTextureDescriptor *)objc_msgSend(a5, "copy");
    v9->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if (objc_msgSend(a4, "enableTelemetry"))
    {
      -[MTLTelemetryTexture initMipmapClipType](v9, "initMipmapClipType");
      v10 = (__IOSurface *)objc_msgSend(-[MTLToolsObject baseObject](v9, "baseObject"), "iosurface");
      v11 = objc_msgSend(a3, "pixelFormat");
      BaseAddress = IOSurfaceGetBaseAddress(v10);
      -[MTLTelemetryTexture accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:](v9, "accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:", a3, 3, v11, BaseAddress, IOSurfaceGetBytesPerRow(v10), 1);
    }
  }
  return v9;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5
{
  MTLTelemetryTexture *v8;

  v8 = -[MTLTelemetryTexture initWithBaseTexture:device:descriptor:plane:](self, "initWithBaseTexture:device:descriptor:plane:", a3, a4, a5, 0);
  if (v8)
  {
    v8->_telemetryDescriptor = (MTLTextureDescriptor *)objc_msgSend(a5, "copy");
    v8->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if (objc_msgSend(a4, "enableTelemetry"))
    {
      -[MTLTelemetryTexture initMipmapClipType](v8, "initMipmapClipType");
      -[MTLTelemetryTexture accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:](v8, "accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:", a3, 0, objc_msgSend(a3, "pixelFormat"), 0, 0, 0);
    }
  }
  return v8;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 descriptor:(id)a6
{
  MTLTelemetryTexture *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryTexture;
  v8 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:](&v10, sel_initWithBaseObject_parent_parentTexture_, a3, a4, a5);
  if (v8)
  {
    v8->_telemetryDescriptor = (MTLTextureDescriptor *)objc_msgSend(a6, "copy");
    v8->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if (objc_msgSend(a4, "enableTelemetry"))
      -[MTLTelemetryTexture initMipmapClipType](v8, "initMipmapClipType");
  }
  return v8;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6
{
  return -[MTLTelemetryTexture initWithBaseTexture:device:texture:descriptor:](self, "initWithBaseTexture:device:texture:descriptor:", a3, a4, a5, self->_telemetryDescriptor);
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9 swizzle:(id)a10
{
  MTLTelemetryTexture *v14;
  NSUInteger length;
  NSObject *queue;
  _QWORD block[8];
  _NSRange v19;
  int v20;
  int v21;

  v14 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:descriptor:](self, "initWithBaseTexture:device:texture:descriptor:", a3, a4, a5, self->_telemetryDescriptor);
  if (v14 && objc_msgSend(a4, "enableTelemetry"))
  {
    if (a7 - 5 >= 2)
      length = a9.length;
    else
      length = a9.length / 6;
    queue = v14->_telemetryDevice->queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__MTLTelemetryTexture_initWithBaseTexture_device_texture_pixelFormat_textureType_levels_slices_swizzle___block_invoke;
    block[3] = &unk_24F794A28;
    v20 = 2;
    v21 = a7;
    block[6] = a6;
    block[7] = length;
    v19 = a9;
    block[4] = v14;
    block[5] = a5;
    dispatch_sync(queue, block);
  }
  return v14;
}

uint64_t __104__MTLTelemetryTexture_initWithBaseTexture_device_texture_pixelFormat_textureType_levels_slices_swizzle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  _DWORD *v8;
  int v9;
  int v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  int v18;
  unsigned int *v19;
  unsigned int *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  int v26;
  unsigned int *v27;
  unsigned int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  int v34;
  int v35;
  _DWORD *v36;
  _DWORD *v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  _DWORD *v41;
  int v42;
  int v43;
  unsigned int *v44;
  unsigned int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  int v51;
  int v52;
  _DWORD *v53;
  _DWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t result;
  uint64_t v59;
  _QWORD *v60;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 224;
  v60 = (_QWORD *)(a1 + 48);
  v3 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>(v2, (unint64_t *)(a1 + 48), (uint64_t)&std::piecewise_construct, &v60)+ 3;
  v5 = *(_DWORD *)(a1 + 80);
  v4 = *(_DWORD *)(a1 + 84);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "width");
  if (v6)
  {
    v7 = (uint64_t)&v3[192 * v5 + 24 * v4];
    v10 = *(_DWORD *)(v7 + 40);
    v8 = (_DWORD *)(v7 + 40);
    v9 = v10;
    v11 = v8 - 4;
    v12 = v8 - 3;
    if (v10)
    {
      if (*v12 < v6)
        *v12 = v6;
      if (*v11 <= v6)
        goto LABEL_9;
    }
    else
    {
      *v12 = v6;
    }
    *v11 = v6;
LABEL_9:
    v13 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(_QWORD *)(v13 + 32) += v6;
    *v8 = v9 + 1;
  }
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "height");
  if (!v14)
    goto LABEL_19;
  v15 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v18 = *(_DWORD *)(v15 + 64);
  v16 = (_DWORD *)(v15 + 64);
  v17 = v18;
  v19 = v16 - 4;
  v20 = v16 - 3;
  if (v18)
  {
    if (*v20 < v14)
      *v20 = v14;
    if (*v19 <= v14)
      goto LABEL_18;
  }
  else
  {
    *v20 = v14;
  }
  *v19 = v14;
LABEL_18:
  v21 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v21 + 56) += v14;
  *v16 = v17 + 1;
LABEL_19:
  v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "depth");
  if (!v22)
    goto LABEL_28;
  v23 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v26 = *(_DWORD *)(v23 + 88);
  v24 = (_DWORD *)(v23 + 88);
  v25 = v26;
  v27 = v24 - 4;
  v28 = v24 - 3;
  if (v26)
  {
    if (*v28 < v22)
      *v28 = v22;
    if (*v27 <= v22)
      goto LABEL_27;
  }
  else
  {
    *v28 = v22;
  }
  *v27 = v22;
LABEL_27:
  v29 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v29 + 80) += v22;
  *v24 = v25 + 1;
LABEL_28:
  v30 = *(_QWORD *)(a1 + 56);
  if (!(_DWORD)v30)
    goto LABEL_37;
  v31 = *(_QWORD *)(a1 + 56);
  v32 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v35 = *(_DWORD *)(v32 + 112);
  v33 = (_DWORD *)(v32 + 112);
  v34 = v35;
  v36 = v33 - 4;
  v37 = v33 - 3;
  if (v35)
  {
    if (*v37 < v30)
      *v37 = v30;
    if (*v36 <= v30)
      goto LABEL_36;
  }
  else
  {
    *v37 = v30;
  }
  *v36 = v30;
LABEL_36:
  v38 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v38 + 104) += v31;
  *v33 = v34 + 1;
LABEL_37:
  v39 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sampleCount");
  if (!v39)
    goto LABEL_46;
  v40 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v43 = *(_DWORD *)(v40 + 136);
  v41 = (_DWORD *)(v40 + 136);
  v42 = v43;
  v44 = v41 - 4;
  v45 = v41 - 3;
  if (v43)
  {
    if (*v45 < v39)
      *v45 = v39;
    if (*v44 <= v39)
      goto LABEL_45;
  }
  else
  {
    *v45 = v39;
  }
  *v44 = v39;
LABEL_45:
  v46 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v46 + 128) += v39;
  *v41 = v42 + 1;
LABEL_46:
  v47 = *(_QWORD *)(a1 + 72);
  if (!(_DWORD)v47)
    goto LABEL_55;
  v48 = *(_QWORD *)(a1 + 72);
  v49 = (uint64_t)&v3[192 * v5 + 24 * v4];
  v52 = *(_DWORD *)(v49 + 160);
  v50 = (_DWORD *)(v49 + 160);
  v51 = v52;
  v53 = v50 - 4;
  v54 = v50 - 3;
  if (v52)
  {
    if (*v54 < v47)
      *v54 = v47;
    if (*v53 <= v47)
      goto LABEL_54;
  }
  else
  {
    *v54 = v47;
  }
  *v53 = v47;
LABEL_54:
  v55 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(_QWORD *)(v55 + 152) += v48;
  *v50 = v51 + 1;
LABEL_55:
  if (objc_msgSend(*(id *)(a1 + 40), "isFramebufferOnly"))
  {
    v56 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v56 + 4);
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "usage") & 2) != 0)
  {
    v57 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v57 + 8);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "usage");
  if ((result & 4) != 0)
  {
    v59 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v59 + 12);
  }
  ++LODWORD(v3[192 * v5 + 24 * v4]);
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  id result;
  id v6;
  MTLTelemetryTexture *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", v6, -[MTLToolsObject device](self, "device"), self, a3, objc_msgSend(v6, "textureType"), 0, objc_msgSend(v6, "arrayLength"), 0, 0, 84148994);

    return v7;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  id result;
  id v14;
  MTLTelemetryTexture *v15;

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, a5.location, a5.length, a6.location, a6.length);
  if (result)
  {
    v14 = result;
    v15 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", result, -[MTLToolsObject device](self, "device"), self, a3, a4, v9, v8, location, length, 84148994);

    return v15;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id result;
  id v15;
  MTLTelemetryTexture *v16;

  length = a6.length;
  location = a6.location;
  v9 = a5.length;
  v10 = a5.location;
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
  if (result)
  {
    v15 = result;
    v16 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", result, -[MTLToolsObject device](self, "device"), self, a3, a4, v10, v9, location, length, *(unsigned int *)&a7);

    return v16;
  }
  return result;
}

@end
