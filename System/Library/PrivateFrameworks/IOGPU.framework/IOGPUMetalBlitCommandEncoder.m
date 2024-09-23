@implementation IOGPUMetalBlitCommandEncoder

- (unint64_t)getType
{
  return 2;
}

- (void)synchronizeResource:(id)a3
{
  MTLReportFailure();
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  MTLReportFailure();
}

- (void)updateFence:(id)a3
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)waitForFence:(id)a3
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length, *(_QWORD *)&a5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
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
  -[IOGPUMetalBlitCommandEncoder fillTexture:level:slice:region:color:pixelFormat:](self, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v18, v16, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  uint64_t v13;
  __int128 v14;
  _OWORD v15[3];
  $01BB1521EC52D44A8E7628F5261DCEC8 v16;
  _BYTE v17[16];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = a7;
  v13 = MTLPackColor();
  v14 = *(_OWORD *)&a6->var0.var2;
  v15[0] = *(_OWORD *)&a6->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a6->var1.var1;
  -[IOGPUMetalBlitCommandEncoder fillTexture:level:slice:region:bytes:length:](self, "fillTexture:level:slice:region:bytes:length:", a3, a4, a5, v15, v17, v13);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64x2_t v16;
  int8x16_t v17;
  uint64x2_t v18;
  unint64_t v19;
  int8x16_t v20;
  uint64x2_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int8x16_t v25;
  uint64_t v30;
  uint64x2_t v31;
  uint64x2_t v32;
  unint64_t v33;
  _QWORD v34[3];
  _QWORD v35[4];

  v13 = objc_msgSend(a3, "width");
  v14 = objc_msgSend(a3, "height");
  v15 = objc_msgSend(a3, "depth");
  if (a10)
  {
    v30 = 0;
    v16.i64[0] = v13;
    v16.i64[1] = v14;
    v17 = (int8x16_t)vshlq_u64(v16, (uint64x2_t)vnegq_s64(vdupq_n_s64(a5)));
    v18 = (uint64x2_t)vdupq_n_s64(1uLL);
    if (v15 >> a5 <= 1)
      v19 = 1;
    else
      v19 = v15 >> a5;
    v20 = (int8x16_t)vcgtq_u64((uint64x2_t)v17, v18);
    v21 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8(v17, v20), (int64x2_t)vmvnq_s8(v20));
    do
    {
      if (a9)
      {
        v22 = a9;
        v23 = a7;
        v24 = a4;
        v31 = v21;
        do
        {
          memset(v35, 0, 24);
          v33 = v19;
          memset(v34, 0, sizeof(v34));
          v32 = v21;
          -[IOGPUMetalBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, v24, v30 + a5, v35, &v32, a6, v23, v30 + a8, v34);
          v21 = v31;
          ++v23;
          ++v24;
          --v22;
        }
        while (v22);
      }
      v25 = (int8x16_t)vcgtq_u64(v21, (uint64x2_t)vdupq_n_s64(1uLL));
      v21 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v21, 1uLL), v25), (int64x2_t)vmvnq_s8(v25));
      if (v19 <= 1)
        v19 = 1;
      else
        v19 >>= 1;
      ++v30;
    }
    while (v30 != a10);
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
  unint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v7 = objc_msgSend(a3, "width");
  v8 = v7;
  v9 = objc_msgSend(a3, "height");
  v10 = objc_msgSend(a3, "depth");
  v43 = v10;
  v44 = v9;
  v11 = objc_msgSend(a4, "width");
  v12 = objc_msgSend(a4, "height");
  v13 = objc_msgSend(a4, "depth");
  v41 = v13;
  v42 = v12;
  v39 = 0;
  v40 = 0;
  if (v7 <= v11 && v9 <= v12 && v10 <= v13)
  {
    v14 = &v44;
    v15 = &v43;
    v16 = &v39;
    v17 = &v40;
    v18 = v13;
    v19 = v12;
    v20 = v7;
    v8 = v11;
  }
  else
  {
    v14 = &v42;
    v15 = &v41;
    v16 = &v40;
    v17 = &v39;
    v18 = v10;
    v19 = v9;
    v20 = v11;
  }
  v21 = 0;
  while (v8 > v20 || v19 > *v14 || v18 > *v15)
  {
    v8 >>= 1;
    v19 >>= 1;
    ++v21;
    v18 >>= 1;
  }
  *v17 = 0;
  *v16 = v21;
  v22 = v40;
  v23 = v7 >> v40;
  if (v7 >> v40 <= 1)
    v23 = 1;
  v24 = v39;
  v25 = v11 >> v39;
  if (v11 >> v39 <= 1)
    v25 = 1;
  if (v23 != v25)
    goto LABEL_40;
  v26 = v9 >> v40;
  if (v9 >> v40 <= 1)
    v26 = 1;
  v27 = v12 >> v39;
  if (v12 >> v39 <= 1)
    v27 = 1;
  if (v26 != v27)
    goto LABEL_40;
  v28 = v10 >> v40;
  if (v10 >> v40 <= 1)
    v28 = 1;
  v29 = v13 >> v39;
  if (v13 >> v39 <= 1)
    v29 = 1;
  if (v28 != v29 || v40 && v39)
LABEL_40:
    -[IOGPUMetalBlitCommandEncoder copyFromTexture:toTexture:].cold.1();
  v30 = objc_msgSend(a3, "mipmapLevelCount") - v22;
  v31 = objc_msgSend(a4, "mipmapLevelCount");
  if (v30 >= v31 - v24)
    v32 = v31 - v24;
  else
    v32 = v30;
  v33 = objc_msgSend(a3, "arrayLength");
  if ((unint64_t)(objc_msgSend(a3, "textureType") - 5) >= 2)
    v34 = 1;
  else
    v34 = 6;
  v35 = v34 * v33;
  v36 = objc_msgSend(a4, "arrayLength");
  if ((unint64_t)(objc_msgSend(a4, "textureType") - 5) >= 2)
    v37 = 1;
  else
    v37 = 6;
  v38 = v37 * v36;
  if (v35 < v38)
    v38 = v35;
  -[IOGPUMetalBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:](self, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a3, 0, v22, a4, 0, v24, v38, v32);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  -[IOGPUMetalBlitCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length, a5, a6);
}

- (void)copyFromTexture:toTexture:.cold.1()
{
  __assert_rtn("MTLPickLargestMip", "MTLTexture_Private.h", 303, "MAX(srcSize->width >> *srcMip, 1UL) == MAX(dstSize->width >> *dstMip, 1UL) && MAX(srcSize->height >> *srcMip, 1UL) == MAX(dstSize->height >> *dstMip, 1UL) && MAX(srcSize->depth >> *srcMip, 1UL) == MAX(dstSize->depth >> *dstMip, 1UL) && (*srcMip == 0 || *dstMip == 0) && \"Postcondition does not hold\");
}

@end
