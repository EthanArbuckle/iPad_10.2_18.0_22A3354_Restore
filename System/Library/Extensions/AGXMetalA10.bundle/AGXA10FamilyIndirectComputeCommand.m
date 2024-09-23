@implementation AGXA10FamilyIndirectComputeCommand

- (AGXA10FamilyIndirectComputeCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4
{
  self->_encoder = a3;
  self->_index = a4;
  return self;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *encoder;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  encoder = self->_encoder;
  v6 = (int)*MEMORY[0x24BE51650];
  v7 = encoder[1];
  v8 = *(_QWORD *)(*encoder + v6 + 24);
  v9 = *(_DWORD *)(v7 + 64);
  v10 = *(_DWORD *)(v7 + 68);
  if (a3)
    v11 = *(_QWORD *)((char *)a3 + v6 + 8) + a4;
  else
    v11 = 0x1EEEE1111;
  v12 = v9 + v10 * self->_index;
  v13 = a5 + 6;
  if (a5 >= 0x23)
    v13 = a5 == 40;
  *(_QWORD *)(v8 + v12 + 8 * v13) = v11;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  _QWORD *encoder;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  encoder = self->_encoder;
  v7 = (int)*MEMORY[0x24BE51650];
  v8 = encoder[1];
  v9 = *(_QWORD *)(*encoder + v7 + 24);
  v10 = *(_DWORD *)(v8 + 64);
  v11 = *(_DWORD *)(v8 + 68);
  if (a3)
    v12 = *(_QWORD *)((char *)a3 + v7 + 8) + a4;
  else
    v12 = 0x1EEEE1111;
  v13 = v10 + v11 * self->_index;
  v14 = a6 + 6;
  if (a6 >= 0x23)
    v14 = a6 == 40;
  *(_QWORD *)(v9 + v13 + 8 * v14) = v12;
}

- (void)setComputePipelineState:(id)a3
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 96)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 100) * self->_index) = *((_QWORD *)a3 + 13);
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  uint64_t *encoder;
  unsigned int index;
  int var0;
  int32x4_t v7;
  int32x4_t v8;
  int var2;
  int *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  char v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  int32x2_t v26;

  encoder = (uint64_t *)self->_encoder;
  index = self->_index;
  var0 = a3->var0;
  v7 = *(int32x4_t *)&a3->var1;
  v8 = *(int32x4_t *)&a4->var0;
  var2 = a4->var2;
  v10 = (int *)MEMORY[0x24BE51650];
  v11 = *(_DWORD *)(encoder[1] + 48) + *(_DWORD *)(encoder[1] + 52) * index;
  *(_QWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24) + v11) = __ROR8__(*(_QWORD *)(*encoder+ (int)*MEMORY[0x24BE51650]+ 8)+ v11+ 8, 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
  v13 = *encoder;
  v12 = (_DWORD *)encoder[1];
  v14 = *(_QWORD *)(v13 + *v10 + 24) + v12[20] + v12[21] * index;
  *(_DWORD *)v14 = var0;
  *(int32x4_t *)(v14 + 4) = vuzp1q_s32(v7, v8);
  *(_DWORD *)(v14 + 20) = var2;
  v15 = *(_QWORD *)(v13 + *v10 + 24) + v12[18] + v12[19] * index;
  *(_DWORD *)(v15 + 76) = v8.i32[0];
  *(_DWORD *)(v15 + 80) = v8.i32[2];
  *(_DWORD *)(v15 + 84) = var2;
  *(_WORD *)(v15 + 88) = var2 * v8.i16[4] * v8.i16[0];
  *(_WORD *)(v15 + 90) = v8.i16[4] * v8.i16[0];
  if ((unsigned __int16)(v8.i16[4] * v8.i16[0]) == 1)
  {
    v16 = 0;
    LOWORD(v17) = -1;
  }
  else
  {
    v18 = (unsigned __int16)(v8.i16[4] * v8.i16[0]);
    v19 = __clz((unsigned __int16)(v8.i16[4] * v8.i16[0] - 1)) - 16;
    if ((_WORD)v18 == 1)
      LOWORD(v19) = 16;
    v20 = 16 - v19;
    v16 = 15 - v19;
    v17 = ((0x8000 << v20) + (unsigned __int16)(v8.i16[4] * v8.i16[0]) - 1) / v18 - 1;
  }
  *(_WORD *)(v15 + 92) = v16;
  *(_WORD *)(v15 + 94) = v17;
  v21 = __clz((unsigned __int16)(v8.i16[0] - 1)) - 16;
  if (v8.i16[0] == 1)
    LOWORD(v21) = 16;
  v22 = 16 - v21;
  v23 = 15 - v21;
  if (v8.u16[0] == 1)
    v24 = 0;
  else
    v24 = v23;
  if (v8.u16[0] == 1)
    v25 = -1;
  else
    v25 = ((0x8000 << v22) + v8.u16[0] - 1) / v8.u16[0] - 1;
  *(_WORD *)(v15 + 96) = v24;
  *(_WORD *)(v15 + 98) = v25;
  *(_DWORD *)(v15 + 64) = var0;
  v26 = vmovn_s64((int64x2_t)v7);
  *(int32x2_t *)(v15 + 68) = v26;
  *(_DWORD *)(v15 + 100) = var0 * v8.i32[0];
  *(_DWORD *)(v15 + 104) = v26.i32[0] * v8.i32[2];
  *(_DWORD *)(v15 + 108) = v26.i32[1] * var2;
}

- (void)reset
{
  _QWORD *encoder;
  unsigned int index;
  unsigned int *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  encoder = self->_encoder;
  index = self->_index;
  v4 = (unsigned int *)encoder[1];
  v5 = (int *)MEMORY[0x24BE51650];
  v6 = v4[12] + v4[13] * index;
  *(_QWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24) + v6) = __ROR8__(*(_QWORD *)(*encoder+ (int)*MEMORY[0x24BE51650]+ 8)+ v4[9]+ v6, 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
  v7 = *(unsigned int *)(encoder[1] + 68);
  bzero((void *)(*(_QWORD *)(*encoder + *v5 + 24) + *(_DWORD *)(encoder[1] + 64) + v7 * index + 48), v7 - 48);
  v8 = *(_QWORD *)(*encoder + *v5 + 24) + *(_DWORD *)(encoder[1] + 72) + *(_DWORD *)(encoder[1] + 76) * index;
  *(_QWORD *)(v8 + 264) = 0;
  *(_OWORD *)(v8 + 248) = 0u;
  *(_OWORD *)(v8 + 232) = 0u;
  *(_OWORD *)(v8 + 216) = 0u;
  *(_OWORD *)(v8 + 200) = 0u;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  bzero((void *)(*(_QWORD *)(*encoder + *v5 + 24) + *(_DWORD *)(encoder[1] + 80)+ *(_DWORD *)(encoder[1] + 84) * index), *(unsigned int *)(encoder[1] + 84));
  bzero((void *)(*(_QWORD *)(*encoder + *v5 + 24) + *(_DWORD *)(encoder[1] + 88)+ *(_DWORD *)(encoder[1] + 92) * index), *(unsigned int *)(encoder[1] + 92));
  v9 = encoder[1];
  if (!*(_BYTE *)(v9 + 16))
    bzero((void *)(*(_QWORD *)(*encoder + *v5 + 24) + *(_DWORD *)(v9 + 96) + *(_DWORD *)(v9 + 100) * index), *(unsigned int *)(v9 + 100));
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 88)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 92) * self->_index
            + 4 * a4) = a3;
}

- (void)setStageInRegion:(id *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 72)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 76) * self->_index;
  *(int32x4_t *)(v3 + 40) = vuzp1q_s32(*(int32x4_t *)&a3->var0.var0, *(int32x4_t *)&a3->var0.var2);
  *(int32x2_t *)(v3 + 56) = vmovn_s64(*(int64x2_t *)&a3->var1.var1);
}

- ($7B206454A2DF4CD367C4131B04854098)getStageInRegion
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)self->var0.var1 + (int)*MEMORY[0x24BE51650] + 24)
                + (*(_DWORD *)(*(_QWORD *)(self->var0.var1 + 8) + 72)
                               + *(_DWORD *)(*(_QWORD *)(self->var0.var1 + 8) + 76) * LODWORD(self->var0.var2)));
  v4 = v3[5];
  v5 = v3[6];
  *(_QWORD *)&v6 = v4;
  *((_QWORD *)&v6 + 1) = HIDWORD(v4);
  v7 = v6;
  *(_QWORD *)&v6 = v5;
  *((_QWORD *)&v6 + 1) = HIDWORD(v5);
  *(_OWORD *)&retstr->var0.var0 = v7;
  *(_OWORD *)&retstr->var0.var2 = v6;
  *(_QWORD *)&v7 = v3[7];
  *(_QWORD *)&v6 = v7;
  *((_QWORD *)&v6 + 1) = DWORD1(v7);
  *(_OWORD *)&retstr->var1.var1 = v6;
  return self;
}

- (BOOL)hasBarrier
{
  return 1;
}

- (id)getImageBlockSize
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWidth:", 0);
  objc_msgSend(v2, "setHeight:", 0);
  return v2;
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
                         + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 88)
                         + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 92) * self->_index
                         + 4 * a3);
}

- (id)dispatchThreadsArguments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];

  v3 = (void *)objc_opt_new();
  memset(v11, 0, sizeof(v11));
  objc_msgSend(v3, "setThreadsPerGrid:", v11);
  v4 = *(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 80)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 84) * self->_index;
  v5 = *(unsigned int *)(v4 + 20);
  v6 = *(_QWORD *)(v4 + 12);
  *(_QWORD *)&v7 = v6;
  *((_QWORD *)&v7 + 1) = HIDWORD(v6);
  v9 = v7;
  v10 = v5;
  objc_msgSend(v3, "setThreadsPerThreadgroup:", &v9);
  return v3;
}

- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3
{
  unsigned int v3;

  v3 = a3 + 6;
  if (a3 >= 0x23)
    v3 = a3 == 40;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 64)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 68) * self->_index
                   + 8 * v3);
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  return -1;
}

- (unint64_t)getCommandType
{
  _QWORD *encoder;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  int v7;

  encoder = self->_encoder;
  v3 = *encoder + (int)*MEMORY[0x24BE51650];
  v4 = *(_DWORD *)(encoder[1] + 48) + *(_DWORD *)(encoder[1] + 52) * self->_index;
  v5 = (_DWORD *)(*(_QWORD *)(v3 + 24) + v4);
  v6 = (v5[1] & 0xFFFFFFFC | ((unint64_t)*v5 << 32)) - (*(_QWORD *)(v3 + 8) + v4);
  v7 = *v5 >> 30;
  if (v6 > 8 && v7 == 1)
    return 0;
  else
    return 32;
}

- (id)dispatchThreadgroupsArguments
{
  void *v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v3 = (void *)objc_opt_new();
  v4 = (int *)MEMORY[0x24BE51650];
  v5 = *(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 80)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 84) * self->_index;
  v6 = *(unsigned int *)(v5 + 8);
  *(_QWORD *)&v7 = *(_QWORD *)v5;
  *((_QWORD *)&v7 + 1) = HIDWORD(*(_QWORD *)v5);
  v14 = v7;
  v15 = v6;
  objc_msgSend(v3, "setThreadgroupsPerGrid:", &v14);
  v8 = *(_QWORD *)(*(_QWORD *)self->_encoder + *v4 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 80)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 84) * self->_index;
  v9 = *(unsigned int *)(v8 + 20);
  v10 = *(_QWORD *)(v8 + 12);
  *(_QWORD *)&v7 = v10;
  *((_QWORD *)&v7 + 1) = HIDWORD(v10);
  v12 = v7;
  v13 = v9;
  objc_msgSend(v3, "setThreadsPerThreadgroup:", &v12);
  return v3;
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 96)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 100) * self->_index);
}

@end
