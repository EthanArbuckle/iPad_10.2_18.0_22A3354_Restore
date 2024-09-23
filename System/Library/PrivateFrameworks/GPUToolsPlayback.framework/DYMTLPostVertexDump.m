@implementation DYMTLPostVertexDump

- (DYMTLPostVertexDump)initWithDebugFunctionPlayer:(id)a3
{
  id v5;
  DYMTLPostVertexDump *v6;
  DYMTLPostVertexDump *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLPostVertexDump;
  v6 = -[DYMTLPostVertexDump init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    -[DYMTLFunctionPlayer device](v7->_player, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {

      v7 = 0;
    }
  }

  return v7;
}

+ (id)internalPipelineStateLabel
{
  return CFSTR("GPUToolsInternalPostTransformPipelineStateLabel");
}

- (BOOL)createAndSetPostVertexDumpPipelineState:(unint64_t)a3 commandEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5
{
  DYMTLCommonDebugFunctionPlayer **p_player;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v15;
  void *v16;
  char v17;
  void *v18;
  unsigned int i;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  id v31;
  _DWORD *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t reflectionPostVertexDumpStride;
  unint64_t reflectionSizeAligned256;
  _DWORD *v37;
  void *v38;
  double v39;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[144];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  p_player = &self->_player;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLFunctionPlayer objectForKey:](*p_player, "objectForKey:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13 || v11 == 0)
  {
    v15 = 0;
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v17 = objc_opt_respondsToSelector();
    if ((v17 & 1) != 0)
    {
      DYMTLGetAssociatedObject(v12, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        -[DYMTLFunctionPlayer device](self->_player, "device");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "maxColorAttachments");

        if (v21 <= i)
          break;
        objc_msgSend(v18, "colorAttachments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "colorAttachments");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:atIndexedSubscript:", v23, i);

      }
      objc_msgSend((id)objc_opt_class(), "internalPipelineStateLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLabel:", v25);

      objc_msgSend(v16, "setDepthAttachmentPixelFormat:", objc_msgSend(v18, "depthAttachmentPixelFormat"));
      objc_msgSend(v16, "setStencilAttachmentPixelFormat:", objc_msgSend(v18, "stencilAttachmentPixelFormat"));
      objc_msgSend(v18, "vertexDescriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setVertexDescriptor:", v26);

      objc_msgSend(v18, "vertexFunction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setVertexFunction:", v27);

      objc_msgSend(v16, "setRasterizationEnabled:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v16, "setInputPrimitiveTopology:", objc_msgSend(v18, "inputPrimitiveTopology"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "setTessellationFactorFormat:", objc_msgSend(v18, "tessellationFactorFormat"));
        objc_msgSend(v16, "setTessellationPartitionMode:", 1);
        objc_msgSend(v16, "setTessellationOutputWindingOrder:", objc_msgSend(v18, "tessellationOutputWindingOrder"));
        objc_msgSend(v16, "setTessellationFactorScaleEnabled:", objc_msgSend(v18, "isTessellationFactorScaleEnabled"));
        objc_msgSend(v16, "setTessellationFactorStepFunction:", objc_msgSend(v18, "tessellationFactorStepFunction"));
        objc_msgSend(v16, "setMaxTessellationFactor:", 1);
        objc_msgSend(v16, "setTessellationControlPointIndexType:", objc_msgSend(v18, "tessellationControlPointIndexType"));
        objc_msgSend(v16, "setSampleCount:", objc_msgSend(v18, "sampleCount"));
        objc_msgSend(v16, "setSampleMask:", objc_msgSend(v18, "sampleMask"));
        objc_msgSend(v16, "setTessellationFactorScaleEnabled:", 1);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "setMaxVertexAmplificationCount:", objc_msgSend(v18, "maxVertexAmplificationCount"));
        objc_msgSend(v16, "setVertexAmplificationMode:", objc_msgSend(v18, "vertexAmplificationMode"));
      }
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __91__DYMTLPostVertexDump_createAndSetPostVertexDumpPipelineState_commandEncoderId_pipelineId___block_invoke;
      v47[3] = &unk_250D6F278;
      v47[4] = &v48;
      objc_msgSend(v10, "enumerateVertexBuffersUsingBlock:", v47);
      -[DYMTLFunctionPlayer device](self->_player, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "maxVertexBuffers");

      if (v49[3] >= v29)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v16, "setPostVertexDumpBufferIndex:");
        -[DYMTLFunctionPlayer device](self->_player, "device");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v46 = 0;
        v44 = (void *)objc_msgSend(v30, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v16, 524291, &v46, &v45);
        v31 = v46;
        v43 = v45;

        DYMTLSetAssociatedObject(v44, 0, v16);
        v15 = v44 != 0;
        if (v44)
        {
          -[DYMTLPostVertexDump _reservePostVertexDumpBufferWithLength:](self, "_reservePostVertexDumpBufferWithLength:", 0x1000000);
          objc_msgSend(v31, "postVertexDumpOutputs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v31;
          MEMORY[0x242623B00](v52);
          v32 = (_DWORD *)-[MTLBuffer contents](self->_postVertexDumpBuffer, "contents");
          objc_msgSend(v31, "postVertexDumpStride");
          v33 = vcvtpd_u64_f64((double)(unint64_t)(GPUTools::MTL::CaptureHelper::SaveObject() + 4) * 0.00390625) << 8;
          self->_reflectionSizeAligned256 = v33;
          *v32 = v33;
          self->_reflectionPostVertexDumpStride = objc_msgSend(v31, "postVertexDumpStride");
          v34 = -[MTLBuffer length](self->_postVertexDumpBuffer, "length");
          reflectionSizeAligned256 = self->_reflectionSizeAligned256;
          reflectionPostVertexDumpStride = self->_reflectionPostVertexDumpStride;
          v37 = (_DWORD *)(-[MTLBuffer contents](self->_postVertexDumpBuffer, "contents")
                         + (reflectionSizeAligned256 & 0xFFFFFFFFFFFFFFFCLL));
          *v37 = 0;
          v37[1] = (v34 - reflectionSizeAligned256 - 8) / reflectionPostVertexDumpStride;
          v31 = v41;
          -[DYMTLFunctionPlayer device](self->_player, "device");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(reflectionPostVertexDumpStride) = objc_msgSend(v38, "supportsFeatureSet:", 7);

          if ((_DWORD)reflectionPostVertexDumpStride)
          {
            LODWORD(v39) = 925353388;
            objc_msgSend(v10, "setTessellationFactorScale:", v39);
          }
          objc_msgSend(v10, "setRenderPipelineState:", v44);
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", self->_postVertexDumpBuffer, self->_reflectionSizeAligned256, v49[3]);
          MEMORY[0x242623B0C](v52);

        }
      }
      _Block_object_dispose(&v48, 8);

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

uint64_t __91__DYMTLPostVertexDump_createAndSetPostVertexDumpPipelineState_commandEncoderId_pipelineId___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v4 + 24) == a3)
    *(_QWORD *)(v4 + 24) = a3 + 1;
  else
    *a4 = 1;
  return result;
}

- (void)notifyReplayerTargetCommandBuffersFinished
{
  MTLBuffer *postVertexDumpBuffer;
  MTLBuffer **p_postVertexDumpBuffer;
  uint64_t v5;
  unint64_t reflectionSizeAligned256;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t reflectionPostVertexDumpStride;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MTLBuffer *v15;
  void *v16;
  id *v17;
  _QWORD *v18;

  p_postVertexDumpBuffer = &self->_postVertexDumpBuffer;
  postVertexDumpBuffer = self->_postVertexDumpBuffer;
  if (postVertexDumpBuffer && self->_reflectionSizeAligned256 && self->_reflectionPostVertexDumpStride)
  {
    v5 = -[MTLBuffer contents](postVertexDumpBuffer, "contents");
    reflectionSizeAligned256 = self->_reflectionSizeAligned256;
    v7 = (unsigned int *)(v5 + (reflectionSizeAligned256 & 0xFFFFFFFFFFFFFFFCLL));
    v9 = *v7;
    v8 = v7[1];
    reflectionPostVertexDumpStride = self->_reflectionPostVertexDumpStride;
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MTLBuffer contents](self->_postVertexDumpBuffer, "contents");
    if (v8 >= v9)
      v13 = v9;
    else
      v13 = v8;
    v14 = (void *)objc_msgSend(v11, "newBufferWithBytes:length:options:", v12, (reflectionSizeAligned256 + reflectionPostVertexDumpStride * v13 + 263) & 0xFFFFFFFFFFFFFF00, 0);

    objc_storeStrong((id *)p_postVertexDumpBuffer, v14);
    v15 = self->_postVertexDumpBuffer;
    v16 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
    v18 = (_QWORD *)MEMORY[0x24BE394A8];
    v17 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v16, MEMORY[0x24BE394A8], (uint64_t)&std::piecewise_construct, &v18);
    objc_storeStrong(v17 + 3, v15);
    self->_reflectionSizeAligned256 = 0;
    self->_reflectionPostVertexDumpStride = 0;

  }
}

- (void)_reservePostVertexDumpBufferWithLength:(unint64_t)a3
{
  void *v5;
  MTLBuffer *v6;
  MTLBuffer *postVertexDumpBuffer;
  MTLBuffer *v8;
  void *v9;
  id *v10;
  _QWORD *v11;

  if (-[MTLBuffer length](self->_postVertexDumpBuffer, "length") < a3)
  {
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (MTLBuffer *)objc_msgSend(v5, "newBufferWithLength:options:", a3, 0);
    postVertexDumpBuffer = self->_postVertexDumpBuffer;
    self->_postVertexDumpBuffer = v6;

    v8 = self->_postVertexDumpBuffer;
    v9 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
    v11 = (_QWORD *)MEMORY[0x24BE394A8];
    v10 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v9, MEMORY[0x24BE394A8], (uint64_t)&std::piecewise_construct, &v11);
    objc_storeStrong(v10 + 3, v8);
  }
}

- (MTLBuffer)postVertexDumpBuffer
{
  return self->_postVertexDumpBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postVertexDumpBuffer, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
