@implementation MTLIOAccelBlitCommandEncoder

- (void)synchronizeResource:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[MTLIOAccelBlitCommandEncoder synchronizeResource:]", 24, (uint64_t)CFSTR("synchronizeResource: is not supported on this platform"), v3, v4, v5, v6, v7);
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[MTLIOAccelBlitCommandEncoder synchronizeTexture:slice:level:]", 29, (uint64_t)CFSTR("synchronizeTexture:slice:level:Resource: is not available on this platform"), a5, v5, v6, v7, v8);
}

- (void)updateFence:(id)a3
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)waitForFence:(id)a3
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (unint64_t)getType
{
  return 2;
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length, *(_QWORD *)&a5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  uint64_t v16;
  __int128 v17;
  _OWORD v18[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v16 = objc_msgSend(a3, "pixelFormat");
  v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLIOAccelBlitCommandEncoder fillTexture:level:slice:region:color:pixelFormat:](self, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v18, v16, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  uint64_t (*v13)(float32x4_t *, uint64_t);
  __int128 v14;
  _OWORD v15[3];
  float64x2_t v16;
  double var2;
  double var3;
  _BYTE v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16.f64[0] = a7.var0;
  v16.f64[1] = a7.var1;
  var2 = a7.var2;
  var3 = a7.var3;
  v13 = MTLPackColor(a8, &v16, (uint64_t)v19);
  v14 = *(_OWORD *)&a6->var0.var2;
  v15[0] = *(_OWORD *)&a6->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLIOAccelBlitCommandEncoder fillTexture:level:slice:region:bytes:length:](self, "fillTexture:level:slice:region:bytes:length:", a3, a4, a5, v15, v19, v13);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64x2_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int8x16_t v21;
  int8x16_t v22;
  unint64_t v24;
  uint64x2_t v27;
  uint64_t v28;
  uint64x2_t v29;
  uint64x2_t v30;
  unint64_t v31;
  _QWORD v32[3];
  _QWORD v33[4];

  if ((unint64_t)objc_msgSend(a3, "width") >> a5 < 2)
    v14 = 1;
  else
    v14 = (unint64_t)objc_msgSend(a3, "width") >> a5;
  if ((unint64_t)objc_msgSend(a3, "height") >> a5 < 2)
    v15 = 1;
  else
    v15 = (unint64_t)objc_msgSend(a3, "height") >> a5;
  v24 = a5;
  if ((unint64_t)objc_msgSend(a3, "depth") >> a5 < 2)
    v16 = 1;
  else
    v16 = (unint64_t)objc_msgSend(a3, "depth") >> a5;
  if (a10)
  {
    v28 = 0;
    v17.i64[0] = v14;
    v17.i64[1] = v15;
    v27 = (uint64x2_t)vdupq_n_s64(1uLL);
    do
    {
      if (a9)
      {
        v18 = a4;
        v19 = a9;
        v20 = a7;
        v29 = v17;
        do
        {
          memset(v33, 0, 24);
          memset(v32, 0, sizeof(v32));
          v30 = v17;
          v31 = v16;
          -[MTLIOAccelBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, v18, v28 + v24, v33, &v30, a6, v20, v28 + a8, v32);
          v17 = v29;
          ++v20;
          ++v18;
          --v19;
        }
        while (v19);
      }
      v21 = (int8x16_t)vshrq_n_u64(v17, 1uLL);
      v22 = (int8x16_t)vcgtq_u64((uint64x2_t)v21, v27);
      v17 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8(v21, v22), (int64x2_t)vmvnq_s8(v22));
      if (v16 >> 1 <= 1)
        v16 = 1;
      else
        v16 >>= 1;
      ++v28;
    }
    while (v28 != a10);
  }
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;

  v7 = objc_msgSend(a3, "width");
  v8 = objc_msgSend(a3, "height");
  v9 = objc_msgSend(a3, "depth");
  v35 = v9;
  v36 = v8;
  v10 = objc_msgSend(a4, "width");
  v11 = objc_msgSend(a4, "height");
  v12 = objc_msgSend(a4, "depth");
  v33 = v12;
  v34 = v11;
  if (v7 <= v10 && v8 <= v11 && v9 <= v12)
  {
    v15 = 0;
    v13 = &v36;
    v14 = &v35;
    v8 = v11;
    v9 = v12;
    v16 = v7;
    v7 = v10;
  }
  else
  {
    v13 = &v34;
    v14 = &v33;
    v15 = 1;
    v16 = v10;
  }
  v17 = 0;
  while (v7 > v16 || v8 > *v13 || v9 > *v14)
  {
    v7 >>= 1;
    v8 >>= 1;
    ++v17;
    v9 >>= 1;
  }
  if (v15)
    v18 = v17;
  else
    v18 = 0;
  if (v15)
    v19 = 0;
  else
    v19 = v17;
  v20 = objc_msgSend(a3, "mipmapLevelCount") - v18;
  v21 = objc_msgSend(a4, "mipmapLevelCount") - v19;
  if (v20 >= v21)
    v22 = a4;
  else
    v22 = a3;
  if (v20 >= v21)
    v23 = v19;
  else
    v23 = v18;
  v24 = objc_msgSend(v22, "mipmapLevelCount") - v23;
  v25 = objc_msgSend(a3, "arrayLength");
  if ((unint64_t)(objc_msgSend(a3, "textureType") - 5) >= 2)
    v26 = 1;
  else
    v26 = 6;
  v27 = v26 * v25;
  v28 = objc_msgSend(a4, "arrayLength");
  if ((unint64_t)(objc_msgSend(a4, "textureType") - 5) >= 2)
    v29 = 1;
  else
    v29 = 6;
  if (v27 >= v29 * v28)
    v30 = a4;
  else
    v30 = a3;
  v31 = objc_msgSend(v30, "arrayLength");
  if ((unint64_t)(objc_msgSend(v30, "textureType") - 5) >= 2)
    v32 = 1;
  else
    v32 = 6;
  -[MTLIOAccelBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:](self, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a3, 0, v18, a4, 0, v19, v32 * v31, v24, v33, v34);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  -[MTLIOAccelBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length, a5, a6);
}

@end
