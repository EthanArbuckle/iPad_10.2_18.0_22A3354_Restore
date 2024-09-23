@implementation MTLLegacySVRenderCommandEncoder

- (MTLLegacySVRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  char *v8;
  MTLLegacySVRenderCommandEncoder *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  v8 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v12, sel_initWithRenderCommandEncoder_parent_descriptor_, a3, a4, a5);
  v9 = (MTLLegacySVRenderCommandEncoder *)v8;
  if (v8)
  {
    *((_QWORD *)v8 + 8) = a4;
    *((_QWORD *)v8 + 1109) = 0;
    v10 = *((_QWORD *)v8 + 3) + 264;
    *((_QWORD *)v8 + 1105) = v10;
    *((_DWORD *)v8 + 2216) = a6;
    *((_DWORD *)v8 + 2217) = 0;
    v8[62] = (*(_QWORD *)(v10 + 20) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)(v8 + 72));
    if ((*((_BYTE *)&v9->_options->var0 + 2) & 0x80) == 0)
      -[MTLLegacySVRenderCommandEncoder _initBufferArgumentData:](v9, "_initBufferArgumentData:", v9->super.super.super._device);
    *(_WORD *)&v9->_vertexAmpState.count = 1;
  }
  return v9;
}

- (MTLLegacySVRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelEncoder:(id)a4 encoderID:(unsigned int)a5
{
  char *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v10, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v7)
  {
    *((_QWORD *)v7 + 8) = objc_msgSend(a4, "commandBuffer");
    *((_QWORD *)v7 + 1109) = 3;
    v8 = *((_QWORD *)v7 + 3) + 264;
    *((_QWORD *)v7 + 1105) = v8;
    v7[62] = (*(_QWORD *)(v8 + 20) & 0x200000001) != 0;
    *((_DWORD *)v7 + 2216) = a5;
    *((_DWORD *)v7 + 2217) = 0;
    MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)(v7 + 72));
    if ((*(_BYTE *)(*((_QWORD *)v7 + 1105) + 22) & 0x80) == 0)
      objc_msgSend(v7, "_initBufferArgumentData:", *((_QWORD *)v7 + 3));
  }
  return (MTLLegacySVRenderCommandEncoder *)v7;
}

- (unsigned)encoderID
{
  return self->_drawID.encoderID;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return (id)-[MTLToolsRetainingContainer temporaryBufferWithBytes:length:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithBytes:length:", a3, a4);
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  return (id)-[MTLToolsRetainingContainer temporaryBufferWithLength:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithLength:", a3);
}

- (void)flushBindings
{
  int v3;
  MTLToolsObject *baseObject;
  Options *options;
  uint64_t v6;
  int v7;
  MTLToolsObject *v8;
  Options *v9;
  uint64_t v10;
  int v11;
  MTLToolsObject *v12;
  Options *v13;
  uint64_t v14;
  int v15;
  MTLToolsObject *v16;
  Options *v17;
  uint64_t v18;
  $75A86BEFE5181BCE6D1FBDE93997BD40 var0;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  $75A86BEFE5181BCE6D1FBDE93997BD40 v32;
  int v33;
  uint64_t v34;
  MTLLegacySVStageBufferHandles *p_vertexHandles;
  Options *v36;
  _BOOL4 v37;
  uint64_t v38;
  unint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  _BOOL4 enableUseResourceValidation;
  uint64_t v53;
  unint64_t v54;
  _BOOL4 objectStageActive;
  uint64_t v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  unint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  unint64_t v66;
  _BOOL4 v67;
  uint64_t v68;
  unint64_t v69;
  int v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  uint64_t v74;
  unint64_t v75;
  int v76;
  unsigned int v77;
  unint64_t v78;

  if (*(&self->_enableUseResourceValidation + 1))
  {
    self->_drawID.entryPointImageID = (unint64_t)-[MTLLegacySVRenderPipelineState vertexFunctionData](self->_currentPipeline, "vertexFunctionData");
    -[MTLToolsObject setVertexBytes:length:atIndex:](self->super.super.super._baseObject, "setVertexBytes:length:atIndex:");
  }
  if (self->_enableUseResourceValidation)
  {
    self->_drawID.entryPointImageID = (unint64_t)-[MTLLegacySVRenderPipelineState fragmentFunctionData](self->_currentPipeline, "fragmentFunctionData");
    -[MTLToolsObject setFragmentBytes:length:atIndex:](self->super.super.super._baseObject, "setFragmentBytes:length:atIndex:");
    if ((*(_QWORD *)&self->_options->var0 & 0x400000001) != 0)
    {
      v3 = -[MTLLegacySVRenderPipelineState fragmentMaxCallStackDepth](self->_currentPipeline, "fragmentMaxCallStackDepth");
      baseObject = self->super.super.super._baseObject;
      options = self->_options;
      LODWORD(v78) = v3;
      if ((*(_QWORD *)&options->var0 & 0x10000) != 0)
        v6 = 22;
      else
        v6 = 52;
      -[MTLToolsObject setFragmentBytes:length:atIndex:](baseObject, "setFragmentBytes:length:atIndex:", &v78, 4, v6);
    }
  }
  if (self->_objectStageActive)
  {
    self->_drawID.entryPointImageID = (unint64_t)-[MTLLegacySVRenderPipelineState tileFunctionData](self->_currentPipeline, "tileFunctionData");
    -[MTLToolsObject setTileBytes:length:atIndex:](self->super.super.super._baseObject, "setTileBytes:length:atIndex:");
    if ((*(_QWORD *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      v7 = -[MTLLegacySVRenderPipelineState tileMaxCallStackDepth](self->_currentPipeline, "tileMaxCallStackDepth");
      v8 = self->super.super.super._baseObject;
      v9 = self->_options;
      LODWORD(v78) = v7;
      if ((*(_QWORD *)&v9->var0 & 0x10000) != 0)
        v10 = 22;
      else
        v10 = 52;
      -[MTLToolsObject setTileBytes:length:atIndex:](v8, "setTileBytes:length:atIndex:", &v78, 4, v10);
    }
  }
  if (*(&self->_enableUseResourceValidation + 2))
  {
    self->_drawID.entryPointImageID = (unint64_t)-[MTLLegacySVRenderPipelineState objectFunctionData](self->_currentPipeline, "objectFunctionData");
    -[MTLToolsObject setObjectBytes:length:atIndex:](self->super.super.super._baseObject, "setObjectBytes:length:atIndex:");
    if ((*(_QWORD *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      v11 = -[MTLLegacySVRenderPipelineState objectMaxCallStackDepth](self->_currentPipeline, "objectMaxCallStackDepth");
      v12 = self->super.super.super._baseObject;
      v13 = self->_options;
      LODWORD(v78) = v11;
      if ((*(_QWORD *)&v13->var0 & 0x10000) != 0)
        v14 = 22;
      else
        v14 = 52;
      -[MTLToolsObject setObjectBytes:length:atIndex:](v12, "setObjectBytes:length:atIndex:", &v78, 4, v14);
    }
  }
  if (*(&self->_enableUseResourceValidation + 3))
  {
    self->_drawID.entryPointImageID = (unint64_t)-[MTLLegacySVRenderPipelineState meshFunctionData](self->_currentPipeline, "meshFunctionData");
    -[MTLToolsObject setMeshBytes:length:atIndex:](self->super.super.super._baseObject, "setMeshBytes:length:atIndex:");
    if ((*(_QWORD *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      v15 = -[MTLLegacySVRenderPipelineState meshMaxCallStackDepth](self->_currentPipeline, "meshMaxCallStackDepth");
      v16 = self->super.super.super._baseObject;
      v17 = self->_options;
      LODWORD(v78) = v15;
      if ((*(_QWORD *)&v17->var0 & 0x10000) != 0)
        v18 = 22;
      else
        v18 = 52;
      -[MTLToolsObject setMeshBytes:length:atIndex:](v16, "setMeshBytes:length:atIndex:", &v78, 4, v18);
    }
  }
  var0 = self->_options->var0;
  if ((*(_QWORD *)&var0 & 0x200000001) != 0)
  {
    -[MTLToolsRetainingContainer encodeResourceTableBuffers:type:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "encodeResourceTableBuffers:type:", self, 0);
    var0 = self->_options->var0;
  }
  v20 = *(_DWORD *)&var0 & 0x7000000;
  if (*(&self->_enableUseResourceValidation + 3))
  {
    v21 = -[MTLDebugInstrumentationData activeThreadgroupMask](-[MTLToolsRenderPipelineState meshDebugInstrumentationData](self->_currentPipeline, "meshDebugInstrumentationData"), "activeThreadgroupMask");
    v22 = -[MTLDebugInstrumentationData threadgroupArgumentOffset](-[MTLToolsRenderPipelineState meshDebugInstrumentationData](self->_currentPipeline, "meshDebugInstrumentationData"), "threadgroupArgumentOffset");
    if (v20)
    {
      if (self->_meshThreadgroup.needsFlush)
      {
        v77 = v21;
        v23 = MTLGPUDebugThreadgroupLengths::setupTableEntries((uint64_t)&self->_meshThreadgroup, &v77, v22);
        if (v23)
        {
          v24 = v23;
          if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
            v25 = 4;
          else
            v25 = 34;
          -[MTLToolsObject setMeshBytes:length:atIndex:](self->super.super.super._baseObject, "setMeshBytes:length:atIndex:", self->_meshThreadgroup.entries, 256, v25);
          -[MTLToolsObject setThreadgroupMemoryLength:offset:atIndex:](self->super.super.super._baseObject, "setThreadgroupMemoryLength:offset:atIndex:", v24, 0, 0);
        }
        self->_meshThreadgroup.needsFlush = 0;
      }
    }
  }
  v26 = -[MTLDebugInstrumentationData activeThreadgroupMask](-[MTLToolsRenderPipelineState tileDebugInstrumentationData](self->_currentPipeline, "tileDebugInstrumentationData"), "activeThreadgroupMask");
  v27 = -[MTLDebugInstrumentationData activeThreadgroupMask](-[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self->_currentPipeline, "fragmentDebugInstrumentationData"), "activeThreadgroupMask");
  if (v20 && self->_tileThreadgroup.needsFlush)
  {
    v76 = v27 | v26;
    v28 = MTLGPUDebugTileThreadgroup::setupTableEntries((uint64_t)&self->_tileThreadgroup, (unsigned int *)&v76);
    if (v28)
    {
      v29 = v28;
      if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
        v30 = 4;
      else
        v30 = 34;
      -[MTLToolsObject setTileBytes:length:atIndex:](self->super.super.super._baseObject, "setTileBytes:length:atIndex:", &self->_tileThreadgroup, 256, v30);
      if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
        v31 = 4;
      else
        v31 = 34;
      -[MTLToolsObject setFragmentBytes:length:atIndex:](self->super.super.super._baseObject, "setFragmentBytes:length:atIndex:", &self->_tileThreadgroup, 256, v31);
      -[MTLToolsObject setThreadgroupMemoryLength:offset:atIndex:](self->super.super.super._baseObject, "setThreadgroupMemoryLength:offset:atIndex:", v29, 0, 0);
    }
    self->_tileThreadgroup.needsFlush = 0;
  }
  v32 = self->_options->var0;
  if ((*(_DWORD *)&v32 & 0x800000) != 0)
  {
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", self->super.super.super._device[3].samplerObjectCache, 1);
    v49 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 1);
    v50 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self->_currentPipeline, "vertexDebugInstrumentationData"), "bufferAccessMask");
    if (v49)
    {
      v51 = v50;
      if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_vertexHandles.needsFlush)
      {
        v78 = v51;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::VertexEncoderClass>>((uint64_t)&self->_vertexHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    enableUseResourceValidation = self->_enableUseResourceValidation;
    v53 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self->_currentPipeline, "fragmentDebugInstrumentationData"), "bufferAccessMask");
    if (enableUseResourceValidation)
    {
      v54 = v53;
      if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_fragmentHandles.needsFlush)
      {
        v78 = v54;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    objectStageActive = self->_objectStageActive;
    v56 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState tileDebugInstrumentationData](self->_currentPipeline, "tileDebugInstrumentationData"), "bufferAccessMask");
    if (objectStageActive)
    {
      v57 = v56;
      if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_tileHandles.needsFlush)
      {
        v78 = v57;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    v58 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
    v59 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState objectDebugInstrumentationData](self->_currentPipeline, "objectDebugInstrumentationData"), "bufferAccessMask");
    if (v58)
    {
      v60 = v59;
      if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_objectHandles.needsFlush)
      {
        v78 = v60;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    v61 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
    v62 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState meshDebugInstrumentationData](self->_currentPipeline, "meshDebugInstrumentationData"), "bufferAccessMask");
    if (v61)
    {
      v63 = v62;
      if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_meshHandles.needsFlush)
      {
        v78 = v63;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
  }
  else
  {
    v33 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 1);
    v34 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self->_currentPipeline, "vertexDebugInstrumentationData"), "bufferAccessMask");
    p_vertexHandles = &self->_vertexHandles;
    v36 = self->_options;
    if ((*(_DWORD *)&v32 & 0x10000) != 0)
    {
      if (v33)
      {
        if ((*((_BYTE *)&v36->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_vertexHandles.needsFlush)
        {
          v78 = v34;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::VertexEncoderClass>>((uint64_t)p_vertexHandles, &v78, self, 20, 23);
        }
      }
      v64 = self->_enableUseResourceValidation;
      v65 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self->_currentPipeline, "fragmentDebugInstrumentationData"), "bufferAccessMask");
      if (v64)
      {
        v66 = v65;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_fragmentHandles.needsFlush)
        {
          v78 = v66;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, self, 20, 23);
        }
      }
      v67 = self->_objectStageActive;
      v68 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState tileDebugInstrumentationData](self->_currentPipeline, "tileDebugInstrumentationData"), "bufferAccessMask");
      if (v67)
      {
        v69 = v68;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_tileHandles.needsFlush)
        {
          v78 = v69;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, self, 20, 23);
        }
      }
      v70 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
      v71 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState objectDebugInstrumentationData](self->_currentPipeline, "objectDebugInstrumentationData"), "bufferAccessMask");
      if (v70)
      {
        v72 = v71;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_objectHandles.needsFlush)
        {
          v78 = v72;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, self, 20, 23);
        }
      }
      v73 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
      v74 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState meshDebugInstrumentationData](self->_currentPipeline, "meshDebugInstrumentationData"), "bufferAccessMask");
      if (v73)
      {
        v75 = v74;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_meshHandles.needsFlush)
        {
          v78 = v75;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, self, 20, 23);
        }
      }
    }
    else
    {
      if (v33)
      {
        if ((*((_BYTE *)&v36->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_vertexHandles.needsFlush)
        {
          v78 = v34;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::VertexEncoderClass>>((uint64_t)p_vertexHandles, &v78, self);
        }
      }
      v37 = self->_enableUseResourceValidation;
      v38 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self->_currentPipeline, "fragmentDebugInstrumentationData"), "bufferAccessMask");
      if (v37)
      {
        v39 = v38;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_fragmentHandles.needsFlush)
        {
          v78 = v39;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, self);
        }
      }
      v40 = self->_objectStageActive;
      v41 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState tileDebugInstrumentationData](self->_currentPipeline, "tileDebugInstrumentationData"), "bufferAccessMask");
      if (v40)
      {
        v42 = v41;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_tileHandles.needsFlush)
        {
          v78 = v42;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, self);
        }
      }
      v43 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
      v44 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState objectDebugInstrumentationData](self->_currentPipeline, "objectDebugInstrumentationData"), "bufferAccessMask");
      if (v43)
      {
        v45 = v44;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_objectHandles.needsFlush)
        {
          v78 = v45;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, self);
        }
      }
      v46 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
      v47 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsRenderPipelineState meshDebugInstrumentationData](self->_currentPipeline, "meshDebugInstrumentationData"), "bufferAccessMask");
      if (v46)
      {
        v48 = v47;
        if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
          -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
        if (self->_meshHandles.needsFlush)
        {
          v78 = v48;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, self);
        }
      }
    }
  }
  ++self->_drawID.eventID;
}

- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;

  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 1, 1);
  if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    v7 = objc_msgSend(a3, "handleForOffset:", a4);
    -[MTLToolsObject setVertexBytes:length:atIndex:](self->super.super.super._baseObject, "setVertexBytes:length:atIndex:", &v7, 8, 13);
    if (!a3)
      return;
    goto LABEL_7;
  }
  -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, 13);
  if (a3)
  {
LABEL_7:
    -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", a3, 1, 1);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
}

- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 forStage:(unint64_t)a5
{
  uint64_t v8;

  if ((*((_BYTE *)&self->_options->var0 + 2) & 1) != 0)
  {
    switch(a5)
    {
      case 1uLL:
        -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", a3, 0, 5);
        -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", a4, 0, 6);
        self->_vertexBufferUsageTable = (MTLBuffer *)a3;
        v8 = 9008;
        break;
      case 2uLL:
        -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", a3, 0, 5);
        -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", a4, 0, 6);
        self->_fragmentBufferUsageTable = (MTLBuffer *)a3;
        self->_fragmentTextureUsageTable = (MTLBuffer *)a4;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
LABEL_8:
        if (-[MTLToolsDevice supportsTileShaders](self->super.super.super._device, "supportsTileShaders"))
        {
          -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", a3, 0, 5);
          -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", a4, 0, 6);
        }
        return;
      case 8uLL:
        if (!-[MTLToolsDevice supportsMeshShaders](self->super.super.super._device, "supportsMeshShaders"))
          return;
        -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", a3, 0, 5);
        -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", a4, 0, 6);
        self->_objectBufferUsageTable = (MTLBuffer *)a3;
        v8 = 9040;
        break;
      default:
        if (a5 != 16 || !-[MTLToolsDevice supportsMeshShaders](self->super.super.super._device, "supportsMeshShaders"))
          return;
        -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", a3, 0, 5);
        -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", a4, 0, 6);
        self->_meshBufferUsageTable = (MTLBuffer *)a3;
        v8 = 9056;
        break;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)a4;
  }
}

- (void)setVertexReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLLegacySVBufferSubAlloc *p_vertexReportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_vertexReportBuffer = &self->_vertexReportBuffer;
  v8 = a3;

  p_vertexReportBuffer->buffer = (MTLBuffer *)a3;
  p_vertexReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setVertexBuffer:offset:atIndex:](baseObject, "setVertexBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)setFragmentReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLLegacySVBufferSubAlloc *p_fragmentReportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_fragmentReportBuffer = &self->_fragmentReportBuffer;
  v8 = a3;

  p_fragmentReportBuffer->buffer = (MTLBuffer *)a3;
  p_fragmentReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setFragmentBuffer:offset:atIndex:](baseObject, "setFragmentBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)setTileReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLLegacySVBufferSubAlloc *p_tileReportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_tileReportBuffer = &self->_tileReportBuffer;
  v8 = a3;

  p_tileReportBuffer->buffer = (MTLBuffer *)a3;
  p_tileReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setTileBuffer:offset:atIndex:](baseObject, "setTileBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)setObjectReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLLegacySVBufferSubAlloc *p_objectReportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_objectReportBuffer = &self->_objectReportBuffer;
  v8 = a3;

  p_objectReportBuffer->buffer = (MTLBuffer *)a3;
  p_objectReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setObjectBuffer:offset:atIndex:](baseObject, "setObjectBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)setMeshReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLLegacySVBufferSubAlloc *p_meshReportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_meshReportBuffer = &self->_meshReportBuffer;
  v8 = a3;

  p_meshReportBuffer->buffer = (MTLBuffer *)a3;
  p_meshReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setMeshBuffer:offset:atIndex:](baseObject, "setMeshBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)setRenderPipelineStateBuffers:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (*(&self->_enableUseResourceValidation + 1))
    v5 = (void *)objc_msgSend(a3, "vertexConstantsBuffer");
  else
    v5 = 0;
  if (self->_enableUseResourceValidation)
    v6 = (void *)objc_msgSend(a3, "fragmentConstantsBuffer");
  else
    v6 = 0;
  if (self->_objectStageActive)
    v7 = objc_msgSend(a3, "tileConstantsBuffer");
  else
    v7 = 0;
  if (*(&self->_enableUseResourceValidation + 3))
    v8 = objc_msgSend(a3, "meshConstantsBuffer");
  else
    v8 = 0;
  if (*(&self->_enableUseResourceValidation + 2))
    v9 = objc_msgSend(a3, "objectConstantsBuffer");
  else
    v9 = 0;
  if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    v16 = (void *)v7;
    v17 = (void *)v8;
    v18 = (void *)v9;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (void *)objc_msgSend(a3, "binaryFunctionData");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (*(_QWORD *)(v15 + 8))
          {
            -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
            -[MTLLegacySVRenderCommandEncoder useResource:usage:](self, "useResource:usage:", *(_QWORD *)(v15 + 8), 1);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }
    if (v5)
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v5);
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v5, 1, 1);
    }
    if (v6)
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v6);
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v6, 1, 2);
    }
    if (*(&self->_enableUseResourceValidation + 1))
    {
      v19 = objc_msgSend(v5, "handleForOffset:", 0);
      -[MTLToolsObject setVertexBytes:length:atIndex:](self->super.super.super._baseObject, "setVertexBytes:length:atIndex:", &v19, 8, 12);
    }
    if (self->_enableUseResourceValidation)
    {
      v19 = objc_msgSend(v6, "handleForOffset:", 0);
      -[MTLToolsObject setFragmentBytes:length:atIndex:](self->super.super.super._baseObject, "setFragmentBytes:length:atIndex:", &v19, 8, 12);
    }
    if (self->_objectStageActive)
    {
      v19 = objc_msgSend(v16, "handleForOffset:", 0);
      -[MTLToolsObject setTileBytes:length:atIndex:](self->super.super.super._baseObject, "setTileBytes:length:atIndex:", &v19, 8, 12);
    }
    if (*(&self->_enableUseResourceValidation + 3))
    {
      v19 = objc_msgSend(v17, "handleForOffset:", 0);
      -[MTLToolsObject setMeshBytes:length:atIndex:](self->super.super.super._baseObject, "setMeshBytes:length:atIndex:", &v19, 8, 12);
    }
    if (*(&self->_enableUseResourceValidation + 2))
    {
      v19 = objc_msgSend(v18, "handleForOffset:", 0);
      -[MTLToolsObject setObjectBytes:length:atIndex:](self->super.super.super._baseObject, "setObjectBytes:length:atIndex:", &v19, 8, 12);
    }
    if (v16)
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v16);
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v16, 1, 4);
    }
    if (*(&self->_enableUseResourceValidation + 3) && v17)
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v17);
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v17, 1, 16);
    }
    if (*(&self->_enableUseResourceValidation + 2) && v18)
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v18);
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v18, 1, 8);
    }
  }
  else
  {
    if (v5)
      -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", v5, 0, 12);
    if (v6)
      -[MTLToolsObject setFragmentBuffer:offset:atIndex:](self->super.super.super._baseObject, "setFragmentBuffer:offset:atIndex:", v6, 0, 12);
    if (v7)
      -[MTLToolsObject setTileBuffer:offset:atIndex:](self->super.super.super._baseObject, "setTileBuffer:offset:atIndex:", v7, 0, 12);
    if (v8)
      -[MTLToolsObject setMeshBuffer:offset:atIndex:](self->super.super.super._baseObject, "setMeshBuffer:offset:atIndex:", v8, 0, 12);
    if (v9)
      -[MTLToolsObject setObjectBuffer:offset:atIndex:](self->super.super.super._baseObject, "setObjectBuffer:offset:atIndex:", v9, 0, 12);
  }
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 3, 1);
  MTLGPUDebugStageBufferHandles::setBuffer((MTLGPUDebugStageBufferHandles *)&self->_vertexHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, (void *)a5, a6);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLLegacySVRenderCommandEncoder setVertexBufferOffset:attributeStride:atIndex:](self, "setVertexBufferOffset:attributeStride:atIndex:", a3, -1, a4);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBufferOffset((MTLGPUDebugStageBufferHandles *)&self->_vertexHandles, a3, a4, a5);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v10;
  uint64_t v11;
  void *__p[3];

  length = a5.length;
  location = a5.location;
  std::vector<unsigned long>::vector(__p, a5.length);
  v10 = __p[0];
  if (length)
  {
    v11 = 0;
    do
      v10[v11++] = -1;
    while (length > v11);
  }
  -[MTLLegacySVRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a6.length)
  {
    length = a6.length;
    location = a6.location;
    do
    {
      v13 = (uint64_t)*a3++;
      v12 = v13;
      v15 = *a4++;
      v14 = v15;
      v16 = *a5++;
      -[MTLLegacySVRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", v12, v14, v16, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setVertexBytes:length:attributeStride:atIndex:](self, "setVertexBytes:length:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLLegacySVRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", -[MTLLegacySVRenderCommandEncoder temporaryBufferWithBytes:length:](self, "temporaryBufferWithBytes:length:", a3, a4), 0, a5, a6);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer((MTLGPUDebugStageBufferHandles *)&self->_fragmentHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 3, 2);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setBufferOffset((MTLGPUDebugStageBufferHandles *)&self->_fragmentHandles, a3, a4);
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = *a4++;
      -[MTLLegacySVRenderCommandEncoder setFragmentBuffer:offset:atIndex:](self, "setFragmentBuffer:offset:atIndex:", v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setFragmentBuffer:offset:atIndex:](self, "setFragmentBuffer:offset:atIndex:", -[MTLToolsRetainingContainer temporaryBufferWithBytes:length:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithBytes:length:", a3, a4), 0, a5);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer((MTLGPUDebugStageBufferHandles *)&self->_tileHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 3, 4);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setBufferOffset((MTLGPUDebugStageBufferHandles *)&self->_tileHandles, a3, a4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = *a4++;
      -[MTLLegacySVRenderCommandEncoder setTileBuffer:offset:atIndex:](self, "setTileBuffer:offset:atIndex:", v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setTileBuffer:offset:atIndex:](self, "setTileBuffer:offset:atIndex:", -[MTLToolsRetainingContainer temporaryBufferWithBytes:length:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithBytes:length:", a3, a4), 0, a5);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v6;
  objc_super v8;

  v6 = a3;
  if ((*((_BYTE *)&self->_options->var0 + 3) & 7) != 0)
  {
    MTLGPUDebugTileThreadgroup::setThreadgroupMemoryLength((MTLGPUDebugTileThreadgroup *)&self->_tileThreadgroup, a3, a4, a5);
    MTLGPUDebugThreadgroupLengths::setThreadgroupMemoryLength((MTLGPUDebugThreadgroupLengths *)&self->_meshThreadgroup, v6, a5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MTLLegacySVRenderCommandEncoder;
    -[MTLToolsRenderCommandEncoder setThreadgroupMemoryLength:offset:atIndex:](&v8, sel_setThreadgroupMemoryLength_offset_atIndex_, a3, a4, a5);
  }
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer((MTLGPUDebugStageBufferHandles *)&self->_objectHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 3, 8);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setBufferOffset((MTLGPUDebugStageBufferHandles *)&self->_objectHandles, a3, a4);
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = *a4++;
      -[MTLLegacySVRenderCommandEncoder setObjectBuffer:offset:atIndex:](self, "setObjectBuffer:offset:atIndex:", v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setObjectBuffer:offset:atIndex:](self, "setObjectBuffer:offset:atIndex:", -[MTLToolsRetainingContainer temporaryBufferWithBytes:length:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithBytes:length:", a3, a4), 0, a5);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer((MTLGPUDebugStageBufferHandles *)&self->_meshHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, 3, 16);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setBufferOffset((MTLGPUDebugStageBufferHandles *)&self->_meshHandles, a3, a4);
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = *a4++;
      -[MTLLegacySVRenderCommandEncoder setMeshBuffer:offset:atIndex:](self, "setMeshBuffer:offset:atIndex:", v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder setMeshBuffer:offset:atIndex:](self, "setMeshBuffer:offset:atIndex:", -[MTLToolsRetainingContainer temporaryBufferWithBytes:length:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "temporaryBufferWithBytes:length:", a3, a4), 0, a5);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "baseObject");
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4))
      -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, 3, 1);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setVertexTexture:atIndex:](self->super.super.super._baseObject, "setVertexTexture:atIndex:", v7, a4);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4))
          -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", v8, 3, 1);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setVertexTexture:atIndex:](self->super.super.super._baseObject, "setVertexTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "baseObject");
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4))
      -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, 3, 2);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setFragmentTexture:atIndex:](self->super.super.super._baseObject, "setFragmentTexture:atIndex:", v7, a4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4))
          -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", v8, 3, 2);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setFragmentTexture:atIndex:](self->super.super.super._baseObject, "setFragmentTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "baseObject");
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4))
      -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, 3, 4);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setTileTexture:atIndex:](self->super.super.super._baseObject, "setTileTexture:atIndex:", v7, a4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4))
          -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", v8, 3, 4);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setTileTexture:atIndex:](self->super.super.super._baseObject, "setTileTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "baseObject");
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4))
      -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, 3, 16);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setMeshTexture:atIndex:](self->super.super.super._baseObject, "setMeshTexture:atIndex:", v7, a4);
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4))
          -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", v8, 3, 16);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setMeshTexture:atIndex:](self->super.super.super._baseObject, "setMeshTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "baseObject");
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4))
      -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, 3, 8);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setObjectTexture:atIndex:](self->super.super.super._baseObject, "setObjectTexture:atIndex:", v7, a4);
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4))
          -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", v8, 3, 8);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setObjectTexture:atIndex:](self->super.super.super._baseObject, "setObjectTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  objc_super v9;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](&v9, sel_drawPrimitives_vertexStart_vertexCount_, a3, a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v9;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:](&v9, sel_drawPrimitives_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  objc_super v11;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v11.receiver = self;
  v11.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:](&v11, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_, a3, a4, a5, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  objc_super v13;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v13.receiver = self;
  v13.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:](&v13, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  objc_super v13;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v13.receiver = self;
  v13.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:](&v13, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  objc_super v15;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:](&v15, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  objc_super v15;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:](&v15, sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  objc_super v17;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v17.receiver = self;
  v17.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:](&v17, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  objc_super v12;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings", a3, a4, a5, a6, a7);
  v12.receiver = self;
  v12.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:](&v12, sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_, a3, a4, a5, a6, a5);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  objc_super v16;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v16.receiver = self;
  v16.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](&v16, sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_, a3, a4, a5, a6, a7, a8, a9);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  objc_super v16;

  if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    -[MTLLegacySVRenderCommandEncoder setTessellationControlPointIndexBuffer:offset:](self, "setTessellationControlPointIndexBuffer:offset:", a6, a7);
    -[MTLLegacySVRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:](self, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a8, a9);
  }
  else
  {
    -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
    v16.receiver = self;
    v16.super_class = (Class)MTLLegacySVRenderCommandEncoder;
    -[MTLToolsRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:](&v16, sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_, a3, a4, a5, a6, a7, a8, a9);
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  objc_super v18;

  if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    -[MTLLegacySVRenderCommandEncoder setTessellationControlPointIndexBuffer:offset:](self, "setTessellationControlPointIndexBuffer:offset:", a8, a9);
    -[MTLLegacySVRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](self, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a10);
  }
  else
  {
    -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
    v18.receiver = self;
    v18.super_class = (Class)MTLLegacySVRenderCommandEncoder;
    -[MTLToolsRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:](&v18, sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  objc_super v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v6 = *a3;
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder dispatchThreadsPerTile:](&v5, sel_dispatchThreadsPerTile_, &v6);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  __int128 v7;
  __int128 v8;
  objc_super v9;
  _OWORD v10[3];
  __int128 v11;
  unint64_t var2;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v7 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v8 = *(_OWORD *)&a4->var0.var2;
  v10[0] = *(_OWORD *)&a4->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a4->var1.var1;
  v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder dispatchThreadsPerTile:inRegion:](&v9, sel_dispatchThreadsPerTile_inRegion_, &v11, v10);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  _OWORD v12[3];
  __int128 v13;
  unint64_t var2;

  v5 = *(_QWORD *)&a5;
  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v9 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v10 = *(_OWORD *)&a4->var0.var2;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  v13 = v9;
  v11.receiver = self;
  v11.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:](&v11, sel_dispatchThreadsPerTile_inRegion_withRenderTargetArrayIndex_, &v13, v12, v5);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  objc_super v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v12 = *a3;
  v11 = *a4;
  v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](&v9, sel_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, &v12, &v11, &v10);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  objc_super v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v12 = *a3;
  v11 = *a4;
  v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](&v9, sel_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, &v12, &v11, &v10);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  objc_super v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;

  -[MTLLegacySVRenderCommandEncoder flushBindings](self, "flushBindings");
  v13 = *a5;
  v12 = *a6;
  v11.receiver = self;
  v11.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](&v11, sel_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, a3, a4, &v13, &v12);
}

- (void)restoreInternalState:(id)a3
{
  id v5;
  int v6;
  char v7;
  $F2C01696BA3A25927D5D590033353FCF *mappings;

  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = objc_msgSend(a3, "inheritsBuffers");
  v7 = objc_msgSend(a3, "inheritsPipelineState");
  if (!v6 || (v7 & 1) == 0)
  {
    self->_vertexHandles.needsFlush = 1;
    self->_fragmentHandles.needsFlush = 1;
    if (self->_vertexAmpState.mappingsValid)
      mappings = self->_vertexAmpState.mappings;
    else
      mappings = 0;
    objc_msgSend(v5, "setVertexAmplificationCount:viewMappings:", self->_vertexAmpState.count, mappings);
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;
  unint64_t v9;
  int v10;

  length = a4.length;
  location = a4.location;
  v9 = LODWORD(a4.location) | ((unint64_t)LODWORD(a4.length) << 32);
  v10 = 1;
  -[MTLLegacySVRenderCommandEncoder prepareExecuteIndirect:variant:](self, "prepareExecuteIndirect:variant:", a3, &v9);
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:withRange:](&v8, sel_executeCommandsInBuffer_withRange_, a3, location, length);
  -[MTLLegacySVRenderCommandEncoder restoreInternalState:](self, "restoreInternalState:", a3);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v9;
  _QWORD v10[2];
  int v11;

  v10[0] = a4;
  v10[1] = a5;
  v11 = 0;
  -[MTLLegacySVRenderCommandEncoder prepareExecuteIndirect:variant:](self, "prepareExecuteIndirect:variant:", a3, v10);
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:](&v9, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
  -[MTLLegacySVRenderCommandEncoder restoreInternalState:](self, "restoreInternalState:", a3);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  objc_super v7;

  self->_vertexAmpState.count = a3;
  self->_vertexAmpState.mappingsValid = a4 != 0;
  if (a3 && a4)
    memmove(self->_vertexAmpState.mappings, a4, 8 * a3);
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setVertexAmplificationCount:viewMappings:](&v7, sel_setVertexAmplificationCount_viewMappings_, a3, a4);
}

- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  if (a5.var1)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", a3, a4, a5.var0.var1);
  else
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a3, a4, a5.var0.var1);
}

- (void)_useResourceCommon:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5;
  unint64_t var1;
  uint64_t v10;

  v5 = *(_QWORD *)&a5.var1;
  var1 = a5.var0.var1;
  -[MTLLegacySVRenderCommandEncoder useResourceInternal:usage:stages:](self, "useResourceInternal:usage:stages:", objc_msgSend(a3, "baseObject"), a4, a5.var0.var1, *(_QWORD *)&a5.var1);
  if ((_BYTE)v5)
    v10 = var1;
  else
    v10 = 27;
  if (*(&self->_enableUseResourceValidation + 4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTLLegacySVCommandBuffer markBuffer:usage:stages:](self->_commandBuffer, "markBuffer:usage:stages:", a3, a4, v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[MTLLegacySVCommandBuffer markTexture:usage:stages:](self->_commandBuffer, "markTexture:usage:stages:", a3, a4, v10);
    }
  }
  objc_msgSend(a3, "useWithRenderEncoder:usage:stages:", self, a4, var1, v5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLLegacySVRenderCommandEncoder _useResourceCommon:usage:stages:](self, "_useResourceCommon:usage:stages:", a3, a4, 0, 0);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  -[MTLLegacySVRenderCommandEncoder _useResourceCommon:usage:stages:](self, "_useResourceCommon:usage:stages:", a3, a4, a5, 1);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      v9 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder useResource:usage:](self, "useResource:usage:", v9, a5);
      --v6;
    }
    while (v6);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  unint64_t v8;
  uint64_t v11;

  if (a4)
  {
    v8 = a4;
    do
    {
      v11 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder useResource:usage:stages:](self, "useResource:usage:stages:", v11, a5, a6);
      --v8;
    }
    while (v8);
  }
}

- (void)useHeap:(id)a3
{
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markHeap:stages:](self->_commandBuffer, "markHeap:stages:", a3, 31);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  -[MTLToolsObject useHeap:](self->super.super.super._baseObject, "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  if (*(&self->_enableUseResourceValidation + 4))
    -[MTLLegacySVCommandBuffer markHeap:stages:](self->_commandBuffer, "markHeap:stages:", a3, a4);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  -[MTLToolsObject useHeap:stages:](self->super.super.super._baseObject, "useHeap:stages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;

  if (a4)
  {
    v4 = a4;
    do
    {
      v7 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder useHeap:](self, "useHeap:", v7);
      --v4;
    }
    while (v4);
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      v9 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder useHeap:stages:](self, "useHeap:stages:", v9, a5);
      --v6;
    }
    while (v6);
  }
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;

  if ((*(_QWORD *)&self->_options->var0 & 0x200000001) != 0)
    -[MTLToolsRetainingContainer addResidencySetGPUDebug:fromEncoder:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addResidencySetGPUDebug:fromEncoder:", a3, self);
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder useResidencySet:](&v5, sel_useResidencySet_, a3);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  const void **v8;
  unint64_t v9;
  uint64_t v10;
  objc_super v11;

  if ((*(_QWORD *)&self->_options->var0 & 0x200000001) != 0 && a4 != 0)
  {
    v8 = a3;
    v9 = a4;
    do
    {
      v10 = (uint64_t)*v8++;
      -[MTLToolsRetainingContainer addResidencySetGPUDebug:fromEncoder:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addResidencySetGPUDebug:fromEncoder:", v10, self);
      --v9;
    }
    while (v9);
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder useResidencySets:count:](&v11, sel_useResidencySets_count_, a3, a4);
}

- (void)setDepthStencilState:(id)a3
{
  objc_super v3;

  self->_currentDepthStencil = (MTLToolsDepthStencilState *)a3;
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setDepthStencilState:](&v3, sel_setDepthStencilState_);
}

- (void)setRenderPipelineState:(id)a3
{
  BOOL v5;
  BOOL v6;
  int v7;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  self->_drawID.pipelineStateID = (unint64_t)a3;
  *(&self->_enableUseResourceValidation + 1) = objc_msgSend(a3, "vertexFunctionData") != 0;
  self->_enableUseResourceValidation = objc_msgSend(a3, "fragmentFunctionData") != 0;
  v5 = objc_msgSend(a3, "tileFunctionData") != 0;
  self->_objectStageActive = v5;
  self->_meshStageActive |= v5;
  v6 = !*(&self->_enableUseResourceValidation + 1) && objc_msgSend(a3, "objectFunctionData") != 0;
  *(&self->_enableUseResourceValidation + 2) = v6;
  v7 = !*(&self->_enableUseResourceValidation + 1) && objc_msgSend(a3, "meshFunctionData") != 0;
  *(&self->_enableUseResourceValidation + 3) = v7;
  if (*(&self->_enableUseResourceValidation + 2) || v7 != 0)
  {
    -[MTLLegacySVCommandBuffer beginUseOfMeshShadersInEncoder:](self->_commandBuffer, "beginUseOfMeshShadersInEncoder:", self);
    v7 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
  }
  if (v7)
  {
    if (self->_currentPipeline != a3)
    {
      v9 = (void *)objc_msgSend(a3, "meshDebugInstrumentationData");
      if (objc_msgSend(v9, "activeThreadgroupMask")
        || objc_msgSend(v9, "threadgroupArgumentOffset"))
      {
        self->_meshThreadgroup.needsFlush = 1;
      }
    }
  }
  if (self->_meshStageActive && self->_currentPipeline != a3)
  {
    v10 = (void *)objc_msgSend(a3, "tileDebugInstrumentationData");
    v11 = (void *)objc_msgSend(a3, "fragmentDebugInstrumentationData");
    if (objc_msgSend(v10, "activeThreadgroupMask")
      || objc_msgSend(v11, "activeThreadgroupMask"))
    {
      self->_tileThreadgroup.needsFlush = 1;
    }
  }
  if (self->_currentPipeline != a3)
  {
    if ((*((_BYTE *)&self->_options->var0 + 2) & 0x40) != 0)
      -[MTLLegacySVRenderCommandEncoder setRenderPipelineStateBuffers:](self, "setRenderPipelineStateBuffers:", a3);
    self->_vertexHandles.needsFlush |= *(&self->_enableUseResourceValidation + 1);
    self->_fragmentHandles.needsFlush |= self->_enableUseResourceValidation;
    self->_tileHandles.needsFlush |= self->_objectStageActive;
  }
  self->_currentPipeline = (MTLLegacySVRenderPipelineState *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setRenderPipelineState:](&v12, sel_setRenderPipelineState_, a3);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_vertexHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 1);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setVertexVisibleFunctionTable:atBufferIndex:](self, "setVertexVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_fragmentHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 2);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setFragmentVisibleFunctionTable:atBufferIndex:](self, "setFragmentVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_tileHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setTileVisibleFunctionTable:atBufferIndex:](self, "setTileVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_objectHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 8);
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setObjectVisibleFunctionTable:atBufferIndex:](self, "setObjectVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_meshHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 16);
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setMeshVisibleFunctionTable:atBufferIndex:](self, "setMeshVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_vertexHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 1);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setVertexIntersectionFunctionTable:atBufferIndex:](self, "setVertexIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_fragmentHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 2);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setFragmentIntersectionFunctionTable:atBufferIndex:](self, "setFragmentIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_tileHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 4);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setTileIntersectionFunctionTable:atBufferIndex:](self, "setTileIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_vertexHandles, a3, a4);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_fragmentHandles, a3, a4);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_tileHandles, a3, a4);
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_objectHandles, a3, a4);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setObjectIntersectionFunctionTable:atBufferIndex:](self, "setObjectIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_meshHandles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:stages:](self->super.super.super._baseObject, "useResource:usage:stages:", *((_QWORD *)a3 + 2), 1, 16);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLLegacySVRenderCommandEncoder setMeshIntersectionFunctionTable:atBufferIndex:](self, "setMeshIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_objectHandles, a3, a4);
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_meshHandles, a3, a4);
}

- (void)endEncoding
{
  objc_super v3;

  -[MTLToolsRetainingContainer endingEncoder:type:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "endingEncoder:type:", self, self->_encoderType);
  MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)&self->_vertexHandles);
  MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)&self->_fragmentHandles);
  MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)&self->_tileHandles);
  MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)&self->_objectHandles);
  MTLGPUDebugStageBufferHandles::clear((MTLGPUDebugStageBufferHandles *)&self->_meshHandles);

  self->_vertexReportBuffer.buffer = 0;
  self->_vertexReportBuffer.offset = 0;

  self->_fragmentReportBuffer.buffer = 0;
  self->_fragmentReportBuffer.offset = 0;

  self->_tileReportBuffer.buffer = 0;
  self->_tileReportBuffer.offset = 0;

  self->_objectReportBuffer.buffer = 0;
  self->_objectReportBuffer.offset = 0;

  self->_meshReportBuffer.buffer = 0;
  self->_meshReportBuffer.offset = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVRenderCommandEncoder;
  -[MTLToolsCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 1688) = 0;
  *((_BYTE *)self + 3312) = 0;
  *((_BYTE *)self + 4936) = 0;
  *((_BYTE *)self + 5200) = 0;
  *((_BYTE *)self + 6824) = 0;
  *((_BYTE *)self + 8448) = 0;
  *((_BYTE *)self + 8836) = 0;
  *((_QWORD *)self + 1112) = 0;
  *((_QWORD *)self + 1114) = 0;
  *((_QWORD *)self + 1116) = 0;
  *((_QWORD *)self + 1118) = 0;
  *((_QWORD *)self + 1120) = 0;
  return self;
}

@end
