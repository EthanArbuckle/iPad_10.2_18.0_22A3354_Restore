@implementation MTLTelemetryBlitCommandEncoder

- (void)accumulateBlitDistribution:(unint64_t)a3 samples:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6 bufferSize:(unint64_t)a7 type:(unint64_t)a8 option:(unint64_t)a9 src:(unint64_t)a10
{
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unordered_map<MTLPixelFormat, MTLTelemetryBlitDistribution, std::hash<unsigned long long>, std::equal_to<MTLPixelFormat>, std::allocator<std::pair<const MTLPixelFormat, MTLTelemetryBlitDistribution>>> *p_blitMap;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  unsigned int *v20;
  _DWORD *v21;
  int v22;
  unsigned int *v23;
  _QWORD *v24;
  _QWORD *v25;
  _DWORD *v26;
  int v27;
  int v28;
  unsigned int *v29;
  unsigned int *v30;
  _QWORD *v31;
  _DWORD *v32;
  int v33;
  int v34;
  unsigned int *v35;
  unsigned int *v36;
  unint64_t v37;
  int v38;
  unsigned int *v39;
  unsigned int *v40;
  unint64_t v41;
  unsigned int *v42;
  _DWORD *v43;
  int v44;
  unsigned int *v45;
  unint64_t v46;
  unsigned int *v47;
  _DWORD *v48;
  int v49;
  unsigned int *v50;
  unint64_t v51;
  unsigned int *v52;
  _DWORD *v53;
  int v54;
  unsigned int *v55;
  _DWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  int v60;
  unsigned int *v61;
  unsigned int *v62;
  unint64_t v63;
  unint64_t *v64;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v63 = a3;
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    p_blitMap = &self->_telemetryCommandBuffer->blitMap;
    v64 = &v63;
    v17 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>((uint64_t)p_blitMap, &v63, (uint64_t)&std::piecewise_construct, &v64);
    v18 = v17 + 3;
    ++self->_beBlits;
    ++self->_telemetryCommandBuffer->cbBlits;
    if (a9)
    {
      if ((a9 & 3) == 0)
        goto LABEL_44;
      if (!v13)
      {
LABEL_34:
        if (!v12)
        {
LABEL_43:
          ++LODWORD(v18[117 * a8 + 39 + 13 * a10]);
LABEL_44:
          if ((a9 & 4) == 0)
            return;
          if (!v13)
          {
LABEL_54:
            if (!v12)
            {
LABEL_63:
              v56 = &v18[117 * a8 + 78 + 13 * a10];
LABEL_84:
              ++*v56;
              return;
            }
            v51 = (unint64_t)&v18[117 * a8 + 13 * a10];
            v52 = (unsigned int *)(v51 + 680);
            v53 = (_DWORD *)(v51 + 696);
            v54 = *(_DWORD *)(v51 + 696);
            v55 = (unsigned int *)(v51 + 684);
            if (v54)
            {
              if (*v55 < v12)
                *v55 = v12;
              if (*v52 <= v12)
                goto LABEL_62;
            }
            else
            {
              *v55 = v12;
            }
            *v52 = v12;
LABEL_62:
            v18[117 * a8 + 86 + 13 * a10] += v12;
            *v53 = v54 + 1;
            goto LABEL_63;
          }
          v46 = (unint64_t)&v18[117 * a8 + 13 * a10];
          v47 = (unsigned int *)(v46 + 656);
          v48 = (_DWORD *)(v46 + 672);
          v49 = *(_DWORD *)(v46 + 672);
          v50 = (unsigned int *)(v46 + 660);
          if (v49)
          {
            if (*v50 < v13)
              *v50 = v13;
            if (*v47 <= v13)
              goto LABEL_53;
          }
          else
          {
            *v50 = v13;
          }
          *v47 = v13;
LABEL_53:
          v18[117 * a8 + 83 + 13 * a10] += v13;
          *v48 = v49 + 1;
          goto LABEL_54;
        }
        v41 = (unint64_t)&v18[117 * a8 + 13 * a10];
        v42 = (unsigned int *)(v41 + 368);
        v43 = (_DWORD *)(v41 + 384);
        v44 = *(_DWORD *)(v41 + 384);
        v45 = (unsigned int *)(v41 + 372);
        if (v44)
        {
          if (*v45 < v12)
            *v45 = v12;
          if (*v42 <= v12)
            goto LABEL_42;
        }
        else
        {
          *v45 = v12;
        }
        *v42 = v12;
LABEL_42:
        v18[117 * a8 + 47 + 13 * a10] += v12;
        *v43 = v44 + 1;
        goto LABEL_43;
      }
      v19 = (unint64_t)&v18[117 * a8 + 13 * a10];
      v20 = (unsigned int *)(v19 + 344);
      v21 = (_DWORD *)(v19 + 360);
      v22 = *(_DWORD *)(v19 + 360);
      v23 = (unsigned int *)(v19 + 348);
      if (v22)
      {
        if (*v23 < v13)
          *v23 = v13;
        if (*v20 <= v13)
          goto LABEL_33;
      }
      else
      {
        *v23 = v13;
      }
      *v20 = v13;
LABEL_33:
      v18[117 * a8 + 44 + 13 * a10] += v13;
      *v21 = v22 + 1;
      goto LABEL_34;
    }
    if (a8)
    {
      if ((a8 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (!v13)
          goto LABEL_70;
        v24 = &v18[117 * a8];
        v25 = &v24[13 * a10];
        v28 = *((_DWORD *)v25 + 12);
        v26 = v25 + 6;
        v27 = v28;
        v29 = v26 - 4;
        v30 = v26 - 3;
        if (v28)
        {
          if (*v30 < v13)
            *v30 = v13;
          if (*v29 <= v13)
            goto LABEL_69;
        }
        else
        {
          *v30 = v13;
        }
        *v29 = v13;
LABEL_69:
        v24[13 * a10 + 5] += v13;
        *v26 = v27 + 1;
LABEL_70:
        if (v12)
        {
          v58 = &v18[117 * a8];
          v59 = &v58[13 * a10];
          v60 = *((_DWORD *)v59 + 18);
          v32 = v59 + 9;
          v33 = v60;
          v61 = v32 - 4;
          v62 = v32 - 3;
          if (v60)
          {
            if (*v62 < v12)
              *v62 = v12;
            if (*v61 <= v12)
              goto LABEL_78;
          }
          else
          {
            *v62 = v12;
          }
          *v61 = v12;
LABEL_78:
          v57 = &v58[13 * a10 + 8];
          v14 = v12;
          goto LABEL_82;
        }
LABEL_83:
        v56 = &v18[117 * a8 + 13 * a10];
        goto LABEL_84;
      }
      if (a8 != 1 || !v11)
        goto LABEL_83;
      v37 = (unint64_t)&v17[13 * a10 + 120];
      v38 = *(_DWORD *)(v37 + 96);
      v32 = (_DWORD *)(v37 + 96);
      v33 = v38;
      v39 = v32 - 4;
      v40 = v32 - 3;
      if (v38)
      {
        if (*v40 < v11)
          *v40 = v11;
        if (*v39 <= v11)
          goto LABEL_81;
      }
      else
      {
        *v40 = v11;
      }
      *v39 = v11;
LABEL_81:
      v57 = &v17[13 * a10 + 131];
      v14 = v11;
      goto LABEL_82;
    }
    if (!v14)
      goto LABEL_83;
    v31 = &v18[13 * a10];
    v34 = *((_DWORD *)v31 + 6);
    v32 = v31 + 3;
    v33 = v34;
    v35 = v32 - 4;
    v36 = v32 - 3;
    if (v34)
    {
      if (*v36 < v14)
        *v36 = v14;
      if (*v35 <= v14)
        goto LABEL_66;
    }
    else
    {
      *v36 = v14;
    }
    *v35 = v14;
LABEL_66:
    v57 = &v18[13 * a10 + 2];
LABEL_82:
    *v57 += v14;
    *v32 = v33 + 1;
    goto LABEL_83;
  }
}

- (MTLTelemetryBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLTelemetryBlitCommandEncoder *v6;
  MTLTelemetryBlitCommandEncoder *v7;
  MTLDevice *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryBlitCommandEncoder;
  v6 = -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v10, sel_initWithBlitCommandEncoder_parent_descriptor_, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v8 = -[MTLToolsObject device](v6, "device");
    v7->_telemetryDevice = (MTLTelemetryDevice *)v8;
    if (-[MTLDevice enableTelemetry](v8, "enableTelemetry"))
    {
      v7->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
      v7->_beBlits = 0;
    }
  }
  return v7;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  unint64_t v16;
  unint64_t v17;
  _BOOL8 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;
  __int128 v25;
  unint64_t v26;
  __int128 v27;
  unint64_t var2;

  v16 = a7->var0 - a6->var0;
  if (v16 == objc_msgSend(a3, "width"))
  {
    v17 = a7->var1 - a6->var1;
    v18 = v17 != objc_msgSend(a3, "height");
  }
  else
  {
    v18 = 1;
  }
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a8, "pixelFormat"), objc_msgSend(a8, "sampleCount"), 0, 0, 0, 0, 0, v18);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v20 = objc_msgSend(a3, "baseObject");
  v27 = *(_OWORD *)&a6->var0;
  var2 = a6->var2;
  v25 = *(_OWORD *)&a7->var0;
  v26 = a7->var2;
  v21 = objc_msgSend(a8, "baseObject");
  v24 = *a11;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v20, a4, a5, &v27, &v25, v21, a9, a10, &v24);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  unint64_t v17;
  unint64_t v18;
  _BOOL8 v19;
  id v20;
  uint64_t v21;
  __int128 v24;
  unint64_t v25;
  __int128 v26;
  unint64_t var2;

  v17 = a7->var0 - a6->var0;
  if (v17 == objc_msgSend(a3, "width"))
  {
    v18 = a7->var1 - a6->var1;
    v19 = v18 != objc_msgSend(a3, "height");
  }
  else
  {
    v19 = 1;
  }
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a3, "pixelFormat"), 1, a10, a11, 0, 2, a12, v19);
  v20 = -[MTLToolsObject baseObject](self, "baseObject");
  v21 = objc_msgSend(a3, "baseObject");
  v26 = *(_OWORD *)&a6->var0;
  var2 = a6->var2;
  v24 = *(_OWORD *)&a7->var0;
  v25 = a7->var2;
  objc_msgSend(v20, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v21, a4, a5, &v26, &v24, objc_msgSend(a8, "baseObject"), a9, a10, a11, a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  v12 = *a6;
  v11 = *a7;
  -[MTLTelemetryBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v12, &v11, a8, a9, a10, a11, 0);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v19;
  uint64_t v20;
  uint64_t v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;

  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a8, "pixelFormat"), 1, a5, a6, 0, 3, a12, a4 != 0);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v20 = objc_msgSend(a3, "baseObject");
  v23 = *a7;
  v21 = objc_msgSend(a8, "baseObject");
  v22 = *a11;
  objc_msgSend(v19, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v20, a4, a5, a6, &v23, v21, a9, a10, &v22, a12);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  v12 = *a7;
  v11 = *a11;
  -[MTLTelemetryBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v12, a8, a9, a10, &v11, 0);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", 0, 1, 0, 0, a7, 1, 0, a4 != 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6, a7);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", 0, 1, 0, 0, a4.length, 4, 0, 2);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:value:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", 0, 1, 0, 0, a4.length, 4, 0, 2);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:pattern4:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  id v15;
  uint64_t v16;
  __int128 v17;
  _OWORD v18[3];

  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a3, "pixelFormat"), objc_msgSend(a3, "sampleCount"), 0, 0, 0, 5, 0, 2);
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = objc_msgSend(a3, "baseObject");
  v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v15, "fillTexture:level:slice:region:bytes:length:", v16, a4, a5, v18, a7, a8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a3, "pixelFormat"), objc_msgSend(a3, "sampleCount"), 0, 0, 0, 5, 0, 2);
  v16 = -[MTLToolsObject baseObject](self, "baseObject");
  v17 = objc_msgSend(a3, "baseObject");
  v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v16, "fillTexture:level:slice:region:color:", v17, a4, a5, v19, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a3, "pixelFormat"), objc_msgSend(a3, "sampleCount"), 0, 0, 0, 5, 0, 2);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v20 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v20;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:pixelFormat:", v19, a4, a5, v21, a8, var0, var1, var2, var3);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a6, "pixelFormat"), objc_msgSend(a6, "sampleCount"), 0, 0, 0, 0, 0, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  -[MTLTelemetryBlitCommandEncoder accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:](self, "accumulateBlitDistribution:samples:bytesPerRow:bytesPerImage:bufferSize:type:option:src:", objc_msgSend(a4, "pixelFormat"), objc_msgSend(a4, "sampleCount"), 0, 0, 0, 0, 0, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:toTexture:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)endEncoding
{
  uint64_t beBlits;
  MTLTelemetryStatisticUIRec *blitEncoderBlitDistribution;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    beBlits = self->_beBlits;
    if ((_DWORD)beBlits)
    {
      blitEncoderBlitDistribution = self->_telemetryCommandBuffer->blitEncoderBlitDistribution;
      if (blitEncoderBlitDistribution->count)
      {
        if (beBlits > blitEncoderBlitDistribution->max)
        {
          blitEncoderBlitDistribution->max = beBlits;
          blitEncoderBlitDistribution = self->_telemetryCommandBuffer->blitEncoderBlitDistribution;
        }
        if (beBlits >= blitEncoderBlitDistribution->min)
          goto LABEL_10;
      }
      else
      {
        blitEncoderBlitDistribution->max = beBlits;
        blitEncoderBlitDistribution = self->_telemetryCommandBuffer->blitEncoderBlitDistribution;
      }
      blitEncoderBlitDistribution->min = beBlits;
LABEL_10:
      self->_telemetryCommandBuffer->blitEncoderBlitDistribution->total += beBlits;
      ++self->_telemetryCommandBuffer->blitEncoderBlitDistribution->count;
    }
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

@end
