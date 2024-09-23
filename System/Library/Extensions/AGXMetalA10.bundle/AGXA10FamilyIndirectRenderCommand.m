@implementation AGXA10FamilyIndirectRenderCommand

- (AGXA10FamilyIndirectRenderCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4
{
  self->_encoder = a3;
  self->_index = a4;
  return self;
}

- (void)setRenderPipelineState:(id)a3
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 372)
            + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 376) * self->_index) = *((_QWORD *)a3 + 143);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = (int)*MEMORY[0x24BE51650];
  v6 = *(_QWORD *)(*(_QWORD *)self->_encoder + v5 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 180)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 184) * self->_index;
  v7 = *(_QWORD *)((char *)a3 + v5 + 8) + a4;
  if (a5 >= 0x23)
    v8 = -44;
  else
    v8 = 7;
  *(_QWORD *)(v6 + 8 * (v8 + a5)) = v7;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v6 = (int)*MEMORY[0x24BE51650];
  v7 = *(_QWORD *)(*(_QWORD *)self->_encoder + v6 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 180)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 184) * self->_index;
  v8 = *(_QWORD *)((char *)a3 + v6 + 8) + a4;
  if (a6 >= 0x23)
    v9 = -44;
  else
    v9 = 7;
  *(_QWORD *)(v7 + 8 * (v9 + a6)) = v8;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = (int)*MEMORY[0x24BE51650];
  v6 = *(_QWORD *)(*(_QWORD *)self->_encoder + v5 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 164)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 168) * self->_index;
  v7 = *(_QWORD *)((char *)a3 + v5 + 8) + a4;
  if (a5 >= 0x23)
    v8 = -44;
  else
    v8 = 7;
  *(_QWORD *)(v6 + 8 * (v8 + a5)) = v7;
}

- (void)setVertexArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = (int)*MEMORY[0x24BE51650];
  v6 = *(_QWORD *)(*(_QWORD *)self->_encoder + v5 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 180)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 184) * self->_index;
  v7 = *(_QWORD *)((char *)a3 + v5 + 8) + a4;
  if (a5 >= 0x23)
    v8 = -44;
  else
    v8 = 7;
  *(_QWORD *)(v6 + 8 * (v8 + a5)) = v7;
}

- (void)setFragmentArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = (int)*MEMORY[0x24BE51650];
  v6 = *(_QWORD *)(*(_QWORD *)self->_encoder + v5 + 24)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 164)
     + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 168) * self->_index;
  v7 = *(_QWORD *)((char *)a3 + v5 + 8) + a4;
  if (a5 >= 0x23)
    v8 = -44;
  else
    v8 = 7;
  *(_QWORD *)(v6 + 8 * (v8 + a5)) = v7;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  uint64_t *encoder;
  unsigned int index;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t v14;
  int v15;

  encoder = (uint64_t *)self->_encoder;
  index = self->_index;
  v10 = *encoder;
  v9 = (_DWORD *)encoder[1];
  v11 = *(_QWORD *)(v10 + (int)*MEMORY[0x24BE51650] + 24);
  v12 = (int *)(v11 + v9[35] + v9[36] * index + v9[33]);
  v13 = (_QWORD *)(v11 + v9[71] + v9[72] * index);
  *v13 = a4;
  v13[1] = a7;
  *(_QWORD *)(v11 + v9[45] + v9[46] * index + 16) = a7;
  v14 = 4 * a3;
  v15 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v14) | 0x6E440000;
  LODWORD(v14) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v14);
  *v12 = v15;
  v12[1] = a5;
  v12[2] = a6 - 1;
  v12[3] = a4;
  v12[4] = v14;
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  int v3;

  if (a3 >= 0x23)
    v3 = -44;
  else
    v3 = 7;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 180)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 184) * self->_index
                   + 8 * (v3 + a3));
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  int v3;

  if (a3 >= 0x23)
    v3 = -44;
  else
    v3 = 7;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)self->_encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 164)
                   + *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 168) * self->_index
                   + 8 * (v3 + a3));
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  return -1;
}

- (id)getTessellationFactorArguments
{
  void *v2;
  double v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setGPUVirtualAddress:", 0);
  objc_msgSend(v2, "setInstanceStride:", 0);
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setScale:", v3);
  return v2;
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  _QWORD *encoder;
  uint64_t v3;

  encoder = self->_encoder;
  v3 = encoder[1];
  if (*(_BYTE *)(v3 + 397))
    return 0;
  else
    return *(_QWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24)
                     + *(_DWORD *)(v3 + 372)
                     + *(_DWORD *)(v3 + 376) * self->_index);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  uint64_t *encoder;
  unsigned int index;
  int *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;

  encoder = (uint64_t *)self->_encoder;
  index = self->_index;
  v12 = (int *)MEMORY[0x24BE51650];
  v14 = *encoder;
  v13 = (_DWORD *)encoder[1];
  v15 = *(_QWORD *)(v14 + (int)*MEMORY[0x24BE51650] + 24);
  v16 = (_QWORD *)(v15 + v13[71] + v13[72] * index);
  *v16 = a9;
  v16[1] = a10;
  *(_QWORD *)(v15 + v13[45] + v13[46] * index + 16) = a10;
  v17 = *v12;
  v18 = *(_QWORD *)((char *)a6 + v17 + 8) + a7;
  v19 = (int *)(*(_QWORD *)(v14 + v17 + 24) + v13[35] + v13[36] * index + v13[33]);
  v20 = 4 * a3;
  v21 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v20) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a5] | 0x7E400000 | HIDWORD(v18);
  LODWORD(v20) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v20);
  *v19 = v21;
  v19[1] = v18;
  v19[2] = a4;
  v19[3] = a8 - 1;
  v19[4] = a9;
  v19[5] = v20;
}

- (void)reset
{
  id *encoder;
  unsigned int index;
  _DWORD *v4;
  uint64_t v5;
  _QWORD v6[5];

  encoder = (id *)self->_encoder;
  index = self->_index;
  v4 = encoder[1];
  v5 = objc_msgSend(*encoder, "contents");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZN3AGX25IndirectCommandBufferGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13resetCommandsEP18AGXA10FamilyBufferjj_block_invoke;
  v6[3] = &__block_descriptor_40_e27_v32__0_PatchLocation_IIIQ_8l;
  v6[4] = v5;
  AGX::IndirectCommandBufferGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupResetPatchTable(v4, index, 1, (uint64_t)v6);
}

- (BOOL)hasBarrier
{
  return 0;
}

- (id)getPipelineState
{
  return 0;
}

- (unint64_t)getCommandType
{
  _QWORD *encoder;
  unsigned int v3;

  encoder = self->_encoder;
  v3 = *(_DWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24)
                 + *(_DWORD *)(encoder[1] + 140)
                 + *(_DWORD *)(encoder[1] + 144) * self->_index
                 + *(_DWORD *)(encoder[1] + 132)) & 0xF0000000;
  if (v3 == 1610612736)
    return 1;
  else
    return 2 * (v3 == 1879048192);
}

- (id)drawArguments
{
  void *v3;
  void *v4;
  _QWORD *encoder;
  int *v6;
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  v6 = (int *)MEMORY[0x24BE51650];
  v7 = ((*(_DWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(encoder[1] + 140)
                   + *(_DWORD *)(encoder[1] + 144) * self->_index
                   + *(_DWORD *)(encoder[1] + 132)) >> 8) & 0xF)
     - 1;
  if (v7 > 0xA)
    v8 = 0;
  else
    v8 = qword_232D76760[v7];
  objc_msgSend(v3, "setPrimitiveType:", v8);
  v9 = self->_encoder;
  objc_msgSend(v4, "setVertexStart:", *(unsigned int *)(*(_QWORD *)(*v9 + *v6 + 24)+ *(_DWORD *)(v9[1] + 140)+ *(_DWORD *)(v9[1] + 144) * self->_index+ *(_DWORD *)(v9[1] + 132)+ 12));
  v10 = self->_encoder;
  objc_msgSend(v4, "setVertexCount:", *(unsigned int *)(*(_QWORD *)(*v10 + *v6 + 24)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ *(_DWORD *)(v10[1] + 132)+ 4));
  v11 = self->_encoder;
  objc_msgSend(v4, "setInstanceCount:", (*(_DWORD *)(*(_QWORD *)(*v11 + *v6 + 24)+ *(_DWORD *)(v11[1] + 140)+ *(_DWORD *)(v11[1] + 144) * self->_index+ *(_DWORD *)(v11[1] + 132)+ 8)+ 1));
  objc_msgSend(v4, "setBaseInstance:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)self->_encoder + *v6 + 24)+ *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 284)+ *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 288) * self->_index+ 8));
  return v4;
}

- (id)drawIndexedArguments
{
  void *v3;
  void *v4;
  _QWORD *encoder;
  int *v6;
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  unsigned __int8 *v12;
  _QWORD *v13;
  _QWORD *v14;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  v6 = (int *)MEMORY[0x24BE51650];
  v7 = ((*(_DWORD *)(*(_QWORD *)(*encoder + (int)*MEMORY[0x24BE51650] + 24)
                   + *(_DWORD *)(encoder[1] + 140)
                   + *(_DWORD *)(encoder[1] + 144) * self->_index
                   + *(_DWORD *)(encoder[1] + 132)) >> 8) & 0xF)
     - 1;
  if (v7 > 0xA)
    v8 = 0;
  else
    v8 = qword_232D76760[v7];
  objc_msgSend(v3, "setPrimitiveType:", v8);
  v9 = self->_encoder;
  objc_msgSend(v4, "setIndexCount:", *(unsigned int *)(*(_QWORD *)(*v9 + *v6 + 24)+ *(_DWORD *)(v9[1] + 140)+ *(_DWORD *)(v9[1] + 144) * self->_index+ *(_DWORD *)(v9[1] + 132)+ 8));
  v10 = self->_encoder;
  objc_msgSend(v4, "setIndexType:", ((*(_DWORD *)(*(_QWORD *)(*v10 + *v6 + 24)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ *(_DWORD *)(v10[1] + 132)) >> 17) & 3u)- 1);
  v11 = self->_encoder;
  v12 = (unsigned __int8 *)(*(_QWORD *)(*v11 + *v6 + 24)
                          + *(_DWORD *)(v11[1] + 140)
                          + *(_DWORD *)(v11[1] + 144) * self->_index
                          + *(_DWORD *)(v11[1] + 132));
  objc_msgSend(v4, "setIndexBufferGPUVirtualAddress:", *((unsigned int *)v12 + 1) | ((unint64_t)*v12 << 32));
  v13 = self->_encoder;
  objc_msgSend(v4, "setInstanceCount:", (*(_DWORD *)(*(_QWORD *)(*v13 + *v6 + 24)+ *(_DWORD *)(v13[1] + 140)+ *(_DWORD *)(v13[1] + 144) * self->_index+ *(_DWORD *)(v13[1] + 132)+ 12)+ 1));
  v14 = self->_encoder;
  objc_msgSend(v4, "setBaseVertex:", *(unsigned int *)(*(_QWORD *)(*v14 + *v6 + 24)+ *(_DWORD *)(v14[1] + 140)+ *(_DWORD *)(v14[1] + 144) * self->_index+ *(_DWORD *)(v14[1] + 132)+ 16));
  objc_msgSend(v4, "setBaseInstance:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)self->_encoder + *v6 + 24)+ *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 284)+ *(_DWORD *)(*((_QWORD *)self->_encoder + 1) + 288) * self->_index+ 8));
  return v4;
}

- (id)drawPatchesArguments
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNumberOfPatchControlPoints:", 0);
  objc_msgSend(v2, "setPatchStart:", 0);
  objc_msgSend(v2, "setPatchCount:", 0);
  objc_msgSend(v2, "setPatchIndexBufferGPUVirtualAddress:", 0);
  objc_msgSend(v2, "setPatchIndexBufferOffset:", 0);
  objc_msgSend(v2, "setInstanceCount:", 0);
  objc_msgSend(v2, "setBaseInstance:", 0);
  return v2;
}

- (id)drawIndexedPatchesArguments
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNumberOfPatchControlPoints:", 0);
  objc_msgSend(v2, "setPatchStart:", 0);
  objc_msgSend(v2, "setPatchCount:", 0);
  objc_msgSend(v2, "setPatchIndexBufferGPUVirtualAddress:", 0);
  objc_msgSend(v2, "setControlPointIndexBufferGPUVirtualAddress:", 0);
  objc_msgSend(v2, "setInstanceCount:", 0);
  objc_msgSend(v2, "setBaseInstance:", 0);
  return v2;
}

- (id)drawMeshThreadgroupsArguments
{
  void *v2;
  _BYTE v4[24];
  _BYTE v5[24];
  _BYTE v6[24];

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setThreadgroupsPerGrid:", v6);
  objc_msgSend(v2, "setThreadsPerObjectThreadgroup:", v5);
  objc_msgSend(v2, "setThreadsPerMeshThreadgroup:", v4);
  return v2;
}

- (id)drawMeshThreadsArguments
{
  void *v2;
  _BYTE v4[24];
  _BYTE v5[24];
  _BYTE v6[24];

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setThreadsPerGrid:", v6);
  objc_msgSend(v2, "setThreadsPerObjectThreadgroup:", v5);
  objc_msgSend(v2, "setThreadsPerMeshThreadgroup:", v4);
  return v2;
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return 0;
}

@end
