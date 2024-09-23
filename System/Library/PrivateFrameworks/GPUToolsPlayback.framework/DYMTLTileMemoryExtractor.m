@implementation DYMTLTileMemoryExtractor

- (DYMTLTileMemoryExtractor)initWithRenderEncoder:(id)a3 metalDevice:(id)a4 tileSize:(id *)a5 texSize:(id *)a6
{
  id v11;
  id v12;
  DYMTLTileMemoryExtractor *v13;
  DYMTLTileMemoryExtractor *v14;
  __int128 v15;
  __int128 v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DYMTLTileMemoryExtractor;
  v13 = -[DYMTLTileMemoryExtractor init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_renderEncoder, a3);
    objc_storeStrong((id *)&v14->_device, a4);
    v15 = *(_OWORD *)&a5->var0;
    v14->_tileSize.depth = a5->var2;
    *(_OWORD *)&v14->_tileSize.width = v15;
    v16 = *(_OWORD *)&a6->var0;
    v14->_textureSize.depth = a6->var2;
    *(_OWORD *)&v14->_textureSize.width = v16;
    *(_WORD *)&v14->_aliasImplicitImageBlock = 0;
    v14->_aliasImplicitImageBlockColorIndex = 0;
    -[DYMTLTileMemoryExtractor _createDataTypeToStringDictionary](v14, "_createDataTypeToStringDictionary");
  }

  return v14;
}

- (void)processReflection:(id)a3 isDrawCall:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v4 = a4;
  v6 = a3;
  self->_imageBlockArgumentsFromFragment.__end_ = self->_imageBlockArgumentsFromFragment.__begin_;
  self->_imageBlockArgumentsFromTile.__end_ = self->_imageBlockArgumentsFromTile.__begin_;
  self->_fragmentMemberIndex = 0;
  LODWORD(v4) = -[DYMTLTileMemoryExtractor encodeImageBlockDataReturn:isDrawCall:](self, "encodeImageBlockDataReturn:isDrawCall:", v6, v4);
  objc_msgSend(v6, "fragmentBindings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke;
  v18[3] = &unk_250D6F778;
  v18[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);

  objc_msgSend(v6, "tileBindings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke_2;
  v16[3] = &unk_250D6F598;
  v16[4] = self;
  v15 = v6;
  v17 = v15;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  if (v4)
  {
    objc_msgSend(v15, "vertexBuiltInArguments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
      objc_msgSend(v15, "vertexBindings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "count"))
      {
        objc_msgSend(v15, "fragmentBindings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
        {
          self->_imageBlockStatus = 2;
          objc_msgSend(v15, "imageBlockDataReturn");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLTileMemoryExtractor _processArgument:WithImageBlockVector:](self, "_processArgument:WithImageBlockVector:", v12, &self->_imageBlockArgumentsFromTile);
          goto LABEL_7;
        }
LABEL_6:
        self->_imageBlockStatus = 1;
        objc_msgSend(v15, "imageBlockDataReturn");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLTileMemoryExtractor _processArgument:WithImageBlockVector:](self, "_processArgument:WithImageBlockVector:", v12, &self->_imageBlockArgumentsFromFragment);
LABEL_7:

        goto LABEL_8;
      }

    }
    goto LABEL_6;
  }
LABEL_8:

}

void __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "type");
  v4 = *(_QWORD **)(a1 + 32);
  if (v3 == 1)
  {
    v4[25] = 3;
  }
  else if (objc_msgSend(v4, "isArgumentExplicitImageBlock:", v5))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_processArgument:WithImageBlockVector:", v5, *(_QWORD *)(a1 + 32) + 104);
  }

}

void __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "type");
  v4 = *(_QWORD **)(a1 + 32);
  if (v3 == 1)
  {
    v4[25] = 3;
  }
  else if (objc_msgSend(v4, "isArgumentExplicitImageBlock:", v8))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 2;
    objc_msgSend(*(id *)(a1 + 40), "imageBlockDataReturn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(char **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "imageBlockDataReturn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_processArgument:WithImageBlockVector:", v7, *(_QWORD *)(a1 + 32) + 128);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processArgument:WithImageBlockVector:", v8, v6 + 128);
    }
  }

}

- (BOOL)isArgumentExplicitImageBlock:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = v4 == 16 || v4 == 17 && objc_msgSend(v3, "imageBlockKind") == 1;

  return v5;
}

- (BOOL)encodeImageBlockDataReturn:(id)a3 isDrawCall:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "imageBlockDataReturn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[DYMTLTileMemoryExtractor isArgumentExplicitImageBlock:](self, "isArgumentExplicitImageBlock:", v7))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    if (v4)
    {
      objc_msgSend(v6, "fragmentBindings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke;
      v16[3] = &unk_250D6F7A0;
      v16[4] = self;
      v17 = v7;
      v18 = &v19;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);

      v9 = *((_BYTE *)v20 + 24) == 0;
      v10 = v17;
    }
    else
    {
      objc_msgSend(v6, "tileBindings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke_2;
      v13[3] = &unk_250D6F7A0;
      v13[4] = self;
      v14 = v7;
      v15 = &v19;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

      v9 = *((_BYTE *)v20 + 24) == 0;
      v10 = v14;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isArgumentExplicitImageBlock:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isArgumentExplicitImageBlock:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (BOOL)getImageBlockStatus
{
  return self->_imageBlockStatus - 1 < 2;
}

- (BOOL)getThreadgroupStatus
{
  return self->_threadgroupStatus == 3;
}

- (void)harvestImageBlockData:(void *)a3
{
  void *v5;
  DYMTLImageBlockArgument **end;
  DYMTLImageBlockArgument **begin;
  uint64_t v8;
  unint64_t v9;
  DYMTLImageBlockArgument *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  DYMTLStatefulRenderCommandEncoder *renderEncoder;
  unint64_t v18;
  void *v19;
  __int128 v20;
  unint64_t depth;
  id v22;

  -[DYMTLStatefulRenderCommandEncoder renderPipelineState](self->_renderEncoder, "renderPipelineState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLStatefulRenderCommandEncoder descriptor](self->_renderEncoder, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_imageBlockStatus == 2)
    std::vector<unsigned long long>::__assign_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>((char *)&self->_imageBlockArgumentsFromFragment, (char *)self->_imageBlockArgumentsFromTile.__begin_, (uint64_t)self->_imageBlockArgumentsFromTile.__end_, self->_imageBlockArgumentsFromTile.__end_ - self->_imageBlockArgumentsFromTile.__begin_);
  begin = self->_imageBlockArgumentsFromFragment.__begin_;
  end = self->_imageBlockArgumentsFromFragment.__end_;
  if (end != begin)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = begin[v9];
      v11 = *((_QWORD *)v10 + 9);
      if (*((_QWORD *)v10 + 10) != v11)
      {
        v18 = v9;
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = v11 + v12;
          -[DYMTLTileMemoryExtractor _generateTextureFromImageBlockMember:](self, "_generateTextureFromImageBlockMember:", v11 + v12, v18);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          -[DYMTLTileMemoryExtractor _generateFunctionFromImageBlockMember:WithIndex:](self, "_generateFunctionFromImageBlockMember:WithIndex:", v14, v8 + v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLTileMemoryExtractor _generateTileRenderPipelineStateWithTileFunction:renderPassDescriptor:renderPipelineState:](self, "_generateTileRenderPipelineStateWithTileFunction:renderPassDescriptor:renderPipelineState:", v15, v5, v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLStatefulRenderCommandEncoder pushDebugGroup:](self->_renderEncoder, "pushDebugGroup:", CFSTR("Dump Tile Data"));
          -[DYMTLStatefulRenderCommandEncoder setRenderPipelineState:](self->_renderEncoder, "setRenderPipelineState:", v16);
          -[DYMTLStatefulRenderCommandEncoder setTileTexture:atIndex:](self->_renderEncoder, "setTileTexture:atIndex:", v22, 0);
          renderEncoder = self->_renderEncoder;
          v20 = *(_OWORD *)&self->_tileSize.width;
          depth = self->_tileSize.depth;
          -[DYMTLStatefulRenderCommandEncoder dispatchThreadsPerTile:](renderEncoder, "dispatchThreadsPerTile:", &v20);
          -[DYMTLStatefulRenderCommandEncoder popDebugGroup](self->_renderEncoder, "popDebugGroup");
          std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)a3, &v22);

          ++v13;
          v11 = *((_QWORD *)v10 + 9);
          v12 += 40;
        }
        while (v13 < 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)v10 + 10) - v11) >> 3));
        begin = self->_imageBlockArgumentsFromFragment.__begin_;
        end = self->_imageBlockArgumentsFromFragment.__end_;
        v8 += v13;
        v9 = v18;
      }
      ++v9;
    }
    while (v9 < end - begin);
  }

}

- (id)harvestThreadgroupAtIndex:(unint64_t)a3 size:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MTLDeviceSPI *device;
  void *v22;
  id v23;
  DYMTLStatefulRenderCommandEncoder *renderEncoder;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int64x2_t v32;
  uint64_t v33;
  id v34;

  -[DYMTLStatefulRenderCommandEncoder renderPipelineState](self->_renderEncoder, "renderPipelineState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLStatefulRenderCommandEncoder descriptor](self->_renderEncoder, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetNullableAssociatedObject(v7, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  DYMTLGetNullableAssociatedObject(v7, 1u);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 | v10)
  {
    v27 = v10;
    v28 = v7;
    v29 = v9;
    -[DYMTLTileMemoryExtractor _generateThreadgroupShaderStringWithThreadgroupIndex:size:](self, "_generateThreadgroupShaderStringWithThreadgroupIndex:size:", a3, a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _generateKernelFunctionFromString:funcName:](self, "_generateKernelFunctionFromString:funcName:", v26, CFSTR("dumpThreadgroupData"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MTLDeviceSPI newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", vcvtps_u32_f32((float)self->_textureSize.width / (float)self->_tileSize.width)* a4* vcvtps_u32_f32((float)self->_textureSize.height / (float)self->_tileSize.height), 0);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setLabel:", CFSTR("Tile Pipeline for dumping Threadgroup data"));
    if (v10)
      v12 = objc_msgSend((id)v10, "rasterSampleCount");
    else
      v12 = objc_msgSend((id)v9, "rasterSampleCount");
    objc_msgSend(v11, "setRasterSampleCount:", v12);
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend(v8, "colorAttachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "texture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "pixelFormat");
      objc_msgSend(v11, "colorAttachments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPixelFormat:", v18);

    }
    objc_msgSend(v11, "setThreadgroupSizeMatchesTileSize:", 0);
    objc_msgSend(v11, "setTileFunction:", v31);
    device = self->_device;
    v34 = 0;
    v22 = (void *)-[MTLDeviceSPI newRenderPipelineStateWithTileDescriptor:error:](device, "newRenderPipelineStateWithTileDescriptor:error:", v11, &v34);
    v23 = v34;
    DYMTLSetAssociatedObject(v22, 1u, v11);
    -[DYMTLStatefulRenderCommandEncoder pushDebugGroup:](self->_renderEncoder, "pushDebugGroup:", CFSTR("Dump Tile Threadgroup Data"));
    -[DYMTLStatefulRenderCommandEncoder setRenderPipelineState:](self->_renderEncoder, "setRenderPipelineState:", v22);
    -[DYMTLStatefulRenderCommandEncoder setTileBuffer:offset:atIndex:](self->_renderEncoder, "setTileBuffer:offset:atIndex:", v30, 0, 0);
    renderEncoder = self->_renderEncoder;
    v32 = vdupq_n_s64(1uLL);
    v33 = 1;
    -[DYMTLStatefulRenderCommandEncoder dispatchThreadsPerTile:](renderEncoder, "dispatchThreadsPerTile:", &v32);
    -[DYMTLStatefulRenderCommandEncoder popDebugGroup](self->_renderEncoder, "popDebugGroup");

    v7 = v28;
    v9 = v29;
    v10 = v27;
    v13 = (void *)v30;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_processArgument:(id)a3 WithImageBlockVector:(void *)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  NSString *v37;
  NSString *imageBlockSignature;
  id v39;

  v39 = a3;
  v6 = operator new();
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  std::vector<DYMTLImageBlockMember>::__base_destruct_at_end[abi:ne180100](v6 + 72, 0);
  objc_msgSend(v39, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)v6;
  *(_QWORD *)v6 = v7;

  *(_QWORD *)(v6 + 8) = objc_msgSend(v39, "type");
  *(_QWORD *)(v6 + 16) = objc_msgSend(v39, "access");
  *(_QWORD *)(v6 + 24) = objc_msgSend(v39, "index");
  *(_QWORD *)(v6 + 40) = objc_msgSend(v39, "imageBlockDataSize");
  objc_msgSend(v39, "imageBlockMasterStructMembers");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_QWORD *)(v6 + 32) = objc_msgSend(v39, "imageBlockKind");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(v6 + 56) = objc_msgSend(v39, "aliasImplicitImageBlock");
    self->_aliasImplicitImageBlock = objc_msgSend(v39, "aliasImplicitImageBlock");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_QWORD *)(v6 + 64) = objc_msgSend(v39, "aliasImplicitImageBlockRenderTarget");
    self->_aliasImplicitImageBlockColor = (unint64_t)objc_msgSend(v39, "aliasImplicitImageBlockRenderTarget") < 8;
    self->_aliasImplicitImageBlockColorIndex = objc_msgSend(v39, "aliasImplicitImageBlockRenderTarget");
  }
  objc_msgSend(v39, "imageBlockMasterStructMembers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v39, "imageBlockMasterStructMembers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _processStructType:WithProcessedArgument:WithMemberName:WithIndent:](self, "_processStructType:WithProcessedArgument:WithMemberName:WithIndent:", v12, v6, &stru_250D704F8, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *((_QWORD *)a4 + 2);
    v15 = (uint64_t *)*((_QWORD *)a4 + 1);
    if ((unint64_t)v15 >= v14)
    {
      v16 = ((uint64_t)v15 - *(_QWORD *)a4) >> 3;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
      v17 = v14 - *(_QWORD *)a4;
      v18 = v17 >> 2;
      if (v17 >> 2 <= (unint64_t)(v16 + 1))
        v18 = v16 + 1;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v18;
      if (v19)
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)a4 + 16, v19);
      else
        v20 = 0;
      v25 = (uint64_t *)&v20[8 * v16];
      v26 = &v20[8 * v19];
      *v25 = v6;
      v24 = v25 + 1;
      v28 = *(char **)a4;
      v27 = (char *)*((_QWORD *)a4 + 1);
      if (v27 == *(char **)a4)
        goto LABEL_37;
      do
      {
        v29 = *((_QWORD *)v27 - 1);
        v27 -= 8;
        *--v25 = v29;
      }
      while (v27 != v28);
LABEL_36:
      v27 = *(char **)a4;
LABEL_37:
      *(_QWORD *)a4 = v25;
      *((_QWORD *)a4 + 1) = v24;
      *((_QWORD *)a4 + 2) = v26;
      if (v27)
        operator delete(v27);
      goto LABEL_39;
    }
    goto LABEL_19;
  }
  objc_msgSend(v39, "dataTypeDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v39, "dataTypeDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _processStructType:WithProcessedArgument:WithMemberName:WithIndent:](self, "_processStructType:WithProcessedArgument:WithMemberName:WithIndent:", v22, v6, &stru_250D704F8, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *((_QWORD *)a4 + 2);
    v15 = (uint64_t *)*((_QWORD *)a4 + 1);
    if ((unint64_t)v15 >= v23)
    {
      v30 = ((uint64_t)v15 - *(_QWORD *)a4) >> 3;
      if ((unint64_t)(v30 + 1) >> 61)
        std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
      v31 = v23 - *(_QWORD *)a4;
      v32 = v31 >> 2;
      if (v31 >> 2 <= (unint64_t)(v30 + 1))
        v32 = v30 + 1;
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
        v33 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v33 = v32;
      if (v33)
        v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)a4 + 16, v33);
      else
        v34 = 0;
      v25 = (uint64_t *)&v34[8 * v30];
      v26 = &v34[8 * v33];
      *v25 = v6;
      v24 = v25 + 1;
      v35 = *(char **)a4;
      v27 = (char *)*((_QWORD *)a4 + 1);
      if (v27 == *(char **)a4)
        goto LABEL_37;
      do
      {
        v36 = *((_QWORD *)v27 - 1);
        v27 -= 8;
        *--v25 = v36;
      }
      while (v27 != v35);
      goto LABEL_36;
    }
LABEL_19:
    *v15 = v6;
    v24 = v15 + 1;
LABEL_39:
    *((_QWORD *)a4 + 1) = v24;
    goto LABEL_40;
  }
  v13 = 0;
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("struct ImageblockMaster\n{\n%@};"), v13);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  imageBlockSignature = self->_imageBlockSignature;
  self->_imageBlockSignature = v37;

}

- (id)_processStructType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "members");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    v13 = &stru_250D704F8;
    do
    {
      v14 = 0;
      v15 = v13;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        -[DYMTLTileMemoryExtractor _processStructMember:WithProcessedArgument:WithMemberName:WithIndent:](self, "_processStructMember:WithProcessedArgument:WithMemberName:WithIndent:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14), a4, v19, a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, v16);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v13;
      }
      while (v11 != v14);
      v10 = obj;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v13 = &stru_250D704F8;
  }

  return v13;
}

- (id)_processArrayType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithCurrentName:(id)a6 WithIndent:(unint64_t)a7
{
  void *v7;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v28;
  __CFString *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t fragmentMemberIndex;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  __int128 v43;
  uint64_t v44;

  v12 = a3;
  v38 = a5;
  v39 = a6;
  v40 = v12;
  objc_msgSend(v12, "elementStructType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DYMTLTileMemoryExtractor _generateIndentString:](self, "_generateIndentString:", a7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "arrayLength");
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      v17 = a7 + 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@[%ld]."), v38, v39, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "elementStructType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLTileMemoryExtractor _processStructType:WithProcessedArgument:WithMemberName:WithIndent:](self, "_processStructType:WithProcessedArgument:WithMemberName:WithIndent:", v19, a4, v18, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v20;
      }
      while (v14 != v15);
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@struct\n%@{\n%@%@}%@[%ld];\n"),
      v36,
      v36,
      v20,
      v36,
      v39,
      v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "elementArrayType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v41 = &stru_250D704F8;
      v42 = &stru_250D704F8;
      *(_QWORD *)&v43 = objc_msgSend(v12, "pixelFormat");
      *((_QWORD *)&v43 + 1) = objc_msgSend(v12, "aluType");
      v44 = objc_msgSend(v12, "arrayLength");
      if (objc_msgSend(v39, "containsString:", CFSTR("user(")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@fragmentMember%ld"), v38, self->_fragmentMemberIndex);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = v41;
        v41 = v22;

        objc_storeStrong((id *)&v42, a6);
        v24 = *((_QWORD *)a4 + 10);
        if (v24 >= *((_QWORD *)a4 + 11))
        {
          v26 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v41);
        }
        else
        {
          *(_QWORD *)v24 = v22;
          *(_QWORD *)(v24 + 8) = v39;
          v25 = v44;
          *(_OWORD *)(v24 + 16) = v43;
          *(_QWORD *)(v24 + 32) = v25;
          v26 = v24 + 40;
        }
        *((_QWORD *)a4 + 10) = v26;
        v33 = (void *)MEMORY[0x24BDD17C8];
        fragmentMemberIndex = self->_fragmentMemberIndex;
        self->_fragmentMemberIndex = fragmentMemberIndex + 1;
        objc_msgSend(v33, "stringWithFormat:", CFSTR("fragmentMember%ld"), fragmentMemberIndex);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLTileMemoryExtractor _generateImageBlockStructMember:WithCurrentName:WithIndent:](self, "_generateImageBlockStructMember:WithCurrentName:WithIndent:", &v41, v35, a7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        ++self->_fragmentMemberIndex;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v38, v39);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = v41;
        v41 = v28;

        v30 = *((_QWORD *)a4 + 10);
        if (v30 >= *((_QWORD *)a4 + 11))
        {
          v32 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v41);
        }
        else
        {
          *(_QWORD *)v30 = v28;
          *(_QWORD *)(v30 + 8) = v42;
          v31 = v44;
          *(_OWORD *)(v30 + 16) = v43;
          *(_QWORD *)(v30 + 32) = v31;
          v32 = v30 + 40;
        }
        *((_QWORD *)a4 + 10) = v32;
        -[DYMTLTileMemoryExtractor _generateImageBlockStructMember:WithCurrentName:WithIndent:](self, "_generateImageBlockStructMember:WithCurrentName:WithIndent:", &v41, v39, a7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v7;
}

- (id)_processStructMember:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  int v25;
  void *v26;
  unint64_t fragmentMemberIndex;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  __int128 v45;
  uint64_t v46;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "structType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DYMTLTileMemoryExtractor _generateIndentString:](self, "_generateIndentString:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@."), v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "structType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _processStructType:WithProcessedArgument:WithMemberName:WithIndent:](self, "_processStructType:WithProcessedArgument:WithMemberName:WithIndent:", v17, a4, v16, a6 + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@struct\n%@{\n%@%@}%@;\n"), v13, v13, v18, v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v10, "arrayType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v10, "arrayType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _processArrayType:WithProcessedArgument:WithMemberName:WithCurrentName:WithIndent:](self, "_processArrayType:WithProcessedArgument:WithMemberName:WithCurrentName:WithIndent:", v13, a4, v11, v16, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v43 = &stru_250D704F8;
  v44 = &stru_250D704F8;
  v46 = 0;
  *(_QWORD *)&v45 = objc_msgSend(v10, "pixelFormat");
  *((_QWORD *)&v45 + 1) = objc_msgSend(v10, "aluType");
  objc_msgSend(v10, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsString:", CFSTR("user("));

  v26 = (void *)MEMORY[0x24BDD17C8];
  if (v25)
  {
    fragmentMemberIndex = self->_fragmentMemberIndex;
    self->_fragmentMemberIndex = fragmentMemberIndex + 1;
    objc_msgSend(v26, "stringWithFormat:", CFSTR("fragmentMember%ld"), fragmentMemberIndex);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, v28);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v43;
    v43 = v29;

    objc_msgSend(v10, "name");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = v44;
    v44 = v31;

    v33 = *((_QWORD *)a4 + 10);
    if (v33 >= *((_QWORD *)a4 + 11))
    {
      v35 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v43);
    }
    else
    {
      *(_QWORD *)v33 = v43;
      *(_QWORD *)(v33 + 8) = v31;
      v34 = v46;
      *(_OWORD *)(v33 + 16) = v45;
      *(_QWORD *)(v33 + 32) = v34;
      v35 = v33 + 40;
    }
    *((_QWORD *)a4 + 10) = v35;
    -[DYMTLTileMemoryExtractor _generateImageBlockStructMember:WithCurrentName:WithIndent:](self, "_generateImageBlockStructMember:WithCurrentName:WithIndent:", &v43, v28, a6);
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@"), v11, v36);
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v38 = v43;
    v43 = v37;

    v39 = *((_QWORD *)a4 + 10);
    if (v39 >= *((_QWORD *)a4 + 11))
    {
      v41 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v43);
    }
    else
    {
      *(_QWORD *)v39 = v37;
      *(_QWORD *)(v39 + 8) = v44;
      v40 = v46;
      *(_OWORD *)(v39 + 16) = v45;
      *(_QWORD *)(v39 + 32) = v40;
      v41 = v39 + 40;
    }
    *((_QWORD *)a4 + 10) = v41;
    ++self->_fragmentMemberIndex;
    objc_msgSend(v10, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLTileMemoryExtractor _generateImageBlockStructMember:WithCurrentName:WithIndent:](self, "_generateImageBlockStructMember:WithCurrentName:WithIndent:", &v43, v28, a6);
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v42;

LABEL_6:
  return v21;
}

- (id)_generateTextureFromImageBlockMember:(DYMTLImageBlockMember *)a3
{
  unint64_t var2;
  NSDictionary *dataTypeToTextureTypeForInvalidPixelFormatMap;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  var2 = a3->var2;
  if (!var2)
  {
    dataTypeToTextureTypeForInvalidPixelFormatMap = self->_dataTypeToTextureTypeForInvalidPixelFormatMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3->var3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dataTypeToTextureTypeForInvalidPixelFormatMap, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    var2 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  if (a3->var4)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setTextureType:", 3);
    objc_msgSend(v9, "setPixelFormat:", var2);
    objc_msgSend(v9, "setWidth:", self->_textureSize.width);
    objc_msgSend(v9, "setHeight:", self->_textureSize.height);
    objc_msgSend(v9, "setDepth:", 1);
    objc_msgSend(v9, "setArrayLength:", a3->var4);
    objc_msgSend(v9, "setMipmapLevelCount:", 1);
    objc_msgSend(v9, "setSampleCount:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", var2, self->_textureSize.width, self->_textureSize.height, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setUsage:", 2);
  objc_msgSend(v9, "setStorageMode:", 0);
  objc_msgSend(v9, "setSampleCount:", 1);
  DYMTLNewTexture(self->_device, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_generateFunctionFromImageBlockMember:(DYMTLImageBlockMember *)a3 WithIndex:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[DYMTLTileMemoryExtractor _generateImageBlockShaderStringWithMember:index:](self, "_generateImageBlockShaderStringWithMember:index:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLTileMemoryExtractor _generateKernelFunctionFromString:funcName:](self, "_generateKernelFunctionFromString:funcName:", v5, CFSTR("dumpImageBlockData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_generateTileRenderPipelineStateWithTileFunction:(id)a3 renderPassDescriptor:(id)a4 renderPipelineState:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MTLDeviceSPI *device;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  DYMTLGetNullableAssociatedObject(v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v29 = v10;
  DYMTLGetNullableAssociatedObject(v10, 1u);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLabel:", CFSTR("Tile Pipeline for dumping Image Block data"));
  objc_msgSend(v13, "setThreadgroupSizeMatchesTileSize:", 1);
  objc_msgSend(v13, "setTileFunction:", v8);
  if (self->_imageBlockStatus == 1)
    v14 = (void *)v11;
  else
    v14 = (void *)v12;
  objc_msgSend(v13, "setSampleCount:", objc_msgSend(v14, "sampleCount"));
  v26 = (void *)v12;
  v27 = (void *)v11;
  v28 = v8;
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v9, "colorAttachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "texture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "pixelFormat");
    objc_msgSend(v13, "colorAttachments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPixelFormat:", v19);

  }
  device = self->_device;
  v30 = 0;
  v23 = (void *)-[MTLDeviceSPI newRenderPipelineStateWithTileDescriptor:error:](device, "newRenderPipelineStateWithTileDescriptor:error:", v13, &v30);
  v24 = v30;
  DYMTLSetAssociatedObject(v23, 1u, v13);

  return v23;
}

- (id)_generateStringForWritingDataToTexture:(unint64_t)a3
{
  NSDictionary *dataTypeToChannelCount;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *dataTypeToTextureComponentTypeStringMap;
  void *v10;
  void *v11;
  void *v12;

  dataTypeToChannelCount = self->_dataTypeToChannelCount;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataTypeToChannelCount, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataTypeToTextureComponentTypeStringMap, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v8 - 1) >= 4)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_250D6F7C0[v8 - 1], v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_generateIndentString:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    v4 = &stru_250D704F8;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    v5 = &stru_250D704F8;
  }
  return v5;
}

- (id)_generateImageBlockStructMember:(DYMTLImageBlockMember *)a3 WithCurrentName:(id)a4 WithIndent:(unint64_t)a5
{
  id v8;
  void *v9;
  NSDictionary *dataTypeToImageBlockTypeStringMap;
  void *v11;
  void *v12;
  NSDictionary *pixelFormatToDataTypeStringMap;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t var4;
  uint64_t v19;
  void *v20;
  void *v21;

  v8 = a4;
  -[DYMTLTileMemoryExtractor _generateIndentString:](self, "_generateIndentString:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3->var3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataTypeToImageBlockTypeStringMap, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var2)
  {
    pixelFormatToDataTypeStringMap = self->_pixelFormatToDataTypeStringMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](pixelFormatToDataTypeStringMap, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@<%@>"), v9, v15, v12);
  }
  else
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v9, v12);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  var4 = a3->var4;
  if (var4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%lu]"), v17, var4);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v19;
  }
  else
  {
    v20 = v17;
  }
  if ((objc_msgSend(a3->var1, "isEqualToString:", &stru_250D704F8) & 1) != 0)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;\n"), v20);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[[ %@ ]];\n"), v20, a3->var1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_generateImageBlockShaderStringWithMember:(DYMTLImageBlockMember *)a3 index:(unint64_t)a4
{
  unint64_t var3;
  const __CFString *v8;
  void *v9;
  NSDictionary *dataTypeToTextureComponentTypeStringMap;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t var4;
  NSDictionary *dataTypeToImageBlockTypeStringMap;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  NSDictionary *v25;
  id var0;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSDictionary *v32;
  id v33;
  void *v34;
  void *v35;
  NSDictionary *v36;
  void *v37;
  void *v39;

  var3 = a3->var3;
  if (self->_aliasImplicitImageBlock)
  {
    v8 = CFSTR("kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock [[ alias_implicit_imageblock ]],\n");
LABEL_3:
    v39 = (void *)v8;
    goto LABEL_6;
  }
  if (!self->_aliasImplicitImageBlockColor)
  {
    v8 = CFSTR("kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock,\n");
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock [[ alias_implicit_imageblock_color(%ld) ]],\n"), self->_aliasImplicitImageBlockColorIndex);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)MEMORY[0x24BDD17C8];
  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  if (a3->var4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dataTypeToTextureComponentTypeStringMap, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("                               texture2d_array<%@, access::write> imageBlockData [[ texture(0) ]])\n"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_imageBlockStatus == 1 && objc_msgSend(a3->var1, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@fragmentMember%ld"), a3->var0, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD17C8];
      var4 = a3->var4;
      dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](dataTypeToImageBlockTypeStringMap, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLTileMemoryExtractor _generateStringForWritingDataToTexture:](self, "_generateStringForWritingDataToTexture:", var3);
      v20 = 0x24BDD1000;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    for (int i = 0; i < %ld; ++i)\n    {\n        %@ currData = ib->%@[i];\n        %@, i);\n    }\n"),
        var4,
        v19,
        v14,
        v21);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v34 = (void *)v22;

      goto LABEL_16;
    }
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = a3->var4;
    v25 = self->_dataTypeToImageBlockTypeStringMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = a3->var0;
    -[DYMTLTileMemoryExtractor _generateStringForWritingDataToTexture:](self, "_generateStringForWritingDataToTexture:", var3);
    v20 = 0x24BDD1000;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    for (int i = 0; i < %ld; ++i)\n    {\n        %@ currData = ib->%@[i];\n        %@, i);\n    }\n"),
      v24,
      v18,
      var0,
      v19);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dataTypeToTextureComponentTypeStringMap, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("                               texture2d<%@, access::write> imageBlockData [[ texture(0) ]])\n"), v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(a3->var1, "isEqualToString:", &stru_250D704F8);
    v31 = (void *)MEMORY[0x24BDD17C8];
    if ((v30 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fragmentMember%ld"), a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = self->_dataTypeToImageBlockTypeStringMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLTileMemoryExtractor _generateStringForWritingDataToTexture:](self, "_generateStringForWritingDataToTexture:", var3);
      v20 = 0x24BDD1000uLL;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    %@ currData = ib->%@;\n    %@);\n"),
        v19,
        v14,
        v21);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v32 = self->_dataTypeToImageBlockTypeStringMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", var3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = a3->var0;
    -[DYMTLTileMemoryExtractor _generateStringForWritingDataToTexture:](self, "_generateStringForWritingDataToTexture:", var3);
    v20 = 0x24BDD1000;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    %@ currData = ib->%@;\n    %@);\n"),
      v18,
      v33,
      v19);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v27;
LABEL_16:

  objc_msgSend(*(id *)(v20 + 1992), "stringWithFormat:", CFSTR("#include <metal_stdlib>\n#include <metal_imageblocks>\n#include <simd/simd.h>\nusing namespace metal;\n\n%@\n%@                               uint2 gid [[ thread_position_in_grid ]],\n                               ushort2 lid [[ thread_position_in_threadgroup ]],\n%@{\n%@}\n"),
    self->_imageBlockSignature,
    v39,
    v13,
    v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)_generateThreadgroupShaderStringWithThreadgroupIndex:(unint64_t)a3 size:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#include <metal_stdlib>\nusing namespace metal;\n\n#define THREADGROUP_MEMORY_LENGTH %ld\n\nkernel void dumpThreadgroupData(uint2 threadgroupInGrid [[ threadgroup_position_in_grid ]],\n                                uint2 threadgroupsPerGrid [[ threadgroups_per_grid ]],\n                                device uint8_t* threadgroupBufferDump [[ buffer(0) ]],\n                                threadgroup uint8_t* threadgroupData [[ threadgroup(%ld) ]])\n{\n   uint tileIndex = (threadgroupInGrid.y * threadgroupsPerGrid.x) + threadgroupInGrid.x;\n   uint offset = THREADGROUP_MEMORY_LENGTH * tileIndex;\n\n   for (uint32_t i = 0; i < THREADGROUP_MEMORY_LENGTH; ++i)\n   {\n       threadgroupBufferDump[offset + i] = threadgroupData[i];\n   }\n}\n"),
    a4,
    a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_generateKernelFunctionFromString:(id)a3 funcName:(id)a4
{
  id v6;
  MTLDeviceSPI *device;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a4;
  device = self->_device;
  v12 = 0;
  v8 = (void *)-[MTLDeviceSPI newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", a3, 0, &v12);
  v9 = v12;
  v10 = (void *)objc_msgSend(v8, "newFunctionWithName:", v6);

  return v10;
}

- (void)_createDataTypeToStringDictionary
{
  NSDictionary *v3;
  NSDictionary *dataTypeToTextureComponentTypeStringMap;
  NSDictionary *v5;
  NSDictionary *dataTypeToImageBlockTypeStringMap;
  NSDictionary *v7;
  NSDictionary *pixelFormatToDataTypeStringMap;
  NSDictionary *v9;
  NSDictionary *dataTypeToTextureTypeForInvalidPixelFormatMap;
  NSDictionary *v11;
  NSDictionary *dataTypeToChannelCount;
  _QWORD v13[36];
  _QWORD v14[36];
  _QWORD v15[36];
  _QWORD v16[36];
  _QWORD v17[16];
  _QWORD v18[16];
  _QWORD v19[36];
  _QWORD v20[36];
  _QWORD v21[36];
  _QWORD v22[38];

  v22[36] = *MEMORY[0x24BDAC8D0];
  v21[0] = &unk_250D7C008;
  v21[1] = &unk_250D7C020;
  v22[0] = CFSTR("float");
  v22[1] = CFSTR("float");
  v21[2] = &unk_250D7C038;
  v21[3] = &unk_250D7C050;
  v22[2] = CFSTR("float");
  v22[3] = CFSTR("float");
  v21[4] = &unk_250D7C068;
  v21[5] = &unk_250D7C080;
  v22[4] = CFSTR("half");
  v22[5] = CFSTR("half");
  v21[6] = &unk_250D7C098;
  v21[7] = &unk_250D7C0B0;
  v22[6] = CFSTR("half");
  v22[7] = CFSTR("half");
  v21[8] = &unk_250D7C0C8;
  v21[9] = &unk_250D7C0E0;
  v22[8] = CFSTR("int");
  v22[9] = CFSTR("int");
  v21[10] = &unk_250D7C0F8;
  v21[11] = &unk_250D7C110;
  v22[10] = CFSTR("int");
  v22[11] = CFSTR("int");
  v21[12] = &unk_250D7C128;
  v21[13] = &unk_250D7C140;
  v22[12] = CFSTR("uint");
  v22[13] = CFSTR("uint");
  v21[14] = &unk_250D7C158;
  v21[15] = &unk_250D7C170;
  v22[14] = CFSTR("uint");
  v22[15] = CFSTR("uint");
  v21[16] = &unk_250D7C188;
  v21[17] = &unk_250D7C1A0;
  v22[16] = CFSTR("short");
  v22[17] = CFSTR("short");
  v21[18] = &unk_250D7C1B8;
  v21[19] = &unk_250D7C1D0;
  v22[18] = CFSTR("short");
  v22[19] = CFSTR("short");
  v21[20] = &unk_250D7C1E8;
  v21[21] = &unk_250D7C200;
  v22[20] = CFSTR("ushort");
  v22[21] = CFSTR("ushort");
  v21[22] = &unk_250D7C218;
  v21[23] = &unk_250D7C230;
  v22[22] = CFSTR("ushort");
  v22[23] = CFSTR("ushort");
  v21[24] = &unk_250D7C248;
  v21[25] = &unk_250D7C260;
  v22[24] = CFSTR("int");
  v22[25] = CFSTR("int");
  v21[26] = &unk_250D7C278;
  v21[27] = &unk_250D7C290;
  v22[26] = CFSTR("int");
  v22[27] = CFSTR("int");
  v21[28] = &unk_250D7C2A8;
  v21[29] = &unk_250D7C2C0;
  v22[28] = CFSTR("uint");
  v22[29] = CFSTR("uint");
  v21[30] = &unk_250D7C2D8;
  v21[31] = &unk_250D7C2F0;
  v22[30] = CFSTR("uint");
  v22[31] = CFSTR("uint");
  v21[32] = &unk_250D7C308;
  v21[33] = &unk_250D7C320;
  v22[32] = CFSTR("uint");
  v22[33] = CFSTR("uint");
  v21[34] = &unk_250D7C338;
  v21[35] = &unk_250D7C350;
  v22[34] = CFSTR("uint");
  v22[35] = CFSTR("uint");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 36);
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  self->_dataTypeToTextureComponentTypeStringMap = v3;

  v20[0] = CFSTR("float");
  v20[1] = CFSTR("float2");
  v20[2] = CFSTR("float3");
  v20[3] = CFSTR("float4");
  v20[4] = CFSTR("half");
  v20[5] = CFSTR("half2");
  v20[6] = CFSTR("half3");
  v20[7] = CFSTR("half4");
  v20[8] = CFSTR("int");
  v20[9] = CFSTR("int2");
  v20[10] = CFSTR("int3");
  v20[11] = CFSTR("int4");
  v20[12] = CFSTR("uint");
  v20[13] = CFSTR("uint2");
  v20[14] = CFSTR("uint3");
  v20[15] = CFSTR("uint4");
  v20[16] = CFSTR("short");
  v20[17] = CFSTR("short2");
  v20[18] = CFSTR("short3");
  v20[19] = CFSTR("short4");
  v20[20] = CFSTR("ushort");
  v20[21] = CFSTR("ushort2");
  v20[22] = CFSTR("ushort3");
  v20[23] = CFSTR("ushort4");
  v20[24] = CFSTR("char");
  v20[25] = CFSTR("char2");
  v20[26] = CFSTR("char3");
  v20[27] = CFSTR("char4");
  v20[28] = CFSTR("uchar");
  v20[29] = CFSTR("uchar2");
  v20[30] = CFSTR("uchar3");
  v20[31] = CFSTR("uchar4");
  v20[32] = CFSTR("BOOL");
  v20[33] = CFSTR("BOOL2");
  v20[34] = CFSTR("BOOL3");
  v19[0] = &unk_250D7C008;
  v19[1] = &unk_250D7C020;
  v19[2] = &unk_250D7C038;
  v19[3] = &unk_250D7C050;
  v19[4] = &unk_250D7C068;
  v19[5] = &unk_250D7C080;
  v19[6] = &unk_250D7C098;
  v19[7] = &unk_250D7C0B0;
  v19[8] = &unk_250D7C0C8;
  v19[9] = &unk_250D7C0E0;
  v19[10] = &unk_250D7C0F8;
  v19[11] = &unk_250D7C110;
  v19[12] = &unk_250D7C128;
  v19[13] = &unk_250D7C140;
  v19[14] = &unk_250D7C158;
  v19[15] = &unk_250D7C170;
  v19[16] = &unk_250D7C188;
  v19[17] = &unk_250D7C1A0;
  v19[18] = &unk_250D7C1B8;
  v19[19] = &unk_250D7C1D0;
  v19[20] = &unk_250D7C1E8;
  v19[21] = &unk_250D7C200;
  v19[22] = &unk_250D7C218;
  v19[23] = &unk_250D7C230;
  v19[24] = &unk_250D7C248;
  v19[25] = &unk_250D7C260;
  v19[26] = &unk_250D7C278;
  v19[27] = &unk_250D7C290;
  v19[28] = &unk_250D7C2A8;
  v19[29] = &unk_250D7C2C0;
  v19[30] = &unk_250D7C2D8;
  v19[31] = &unk_250D7C2F0;
  v19[32] = &unk_250D7C308;
  v19[33] = &unk_250D7C320;
  v19[34] = &unk_250D7C338;
  v19[35] = &unk_250D7C350;
  v20[35] = CFSTR("BOOL4");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 36);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
  self->_dataTypeToImageBlockTypeStringMap = v5;

  v17[0] = &unk_250D7C368;
  v17[1] = &unk_250D7C380;
  v18[0] = CFSTR("r8unorm");
  v18[1] = CFSTR("r8snorm");
  v17[2] = &unk_250D7C398;
  v17[3] = &unk_250D7C3B0;
  v18[2] = CFSTR("r16unorm");
  v18[3] = CFSTR("r16snorm");
  v17[4] = &unk_250D7C0E0;
  v17[5] = &unk_250D7C110;
  v18[4] = CFSTR("rg8unorm");
  v18[5] = CFSTR("rg8snorm");
  v17[6] = &unk_250D7C3C8;
  v17[7] = &unk_250D7C3E0;
  v18[6] = CFSTR("rg16unorm");
  v18[7] = CFSTR("rg16snorm");
  v17[8] = &unk_250D7C3F8;
  v17[9] = &unk_250D7C410;
  v18[8] = CFSTR("rgba8unorm");
  v18[9] = CFSTR("srgba8unorm");
  v17[10] = &unk_250D7C428;
  v17[11] = &unk_250D7C440;
  v18[10] = CFSTR("rgba8snorm");
  v18[11] = CFSTR("rgba16unorm");
  v17[12] = &unk_250D7C458;
  v17[13] = &unk_250D7C470;
  v18[12] = CFSTR("rgba16snorm");
  v18[13] = CFSTR("rgb10a2");
  v17[14] = &unk_250D7C488;
  v17[15] = &unk_250D7C4A0;
  v18[14] = CFSTR("rg11b10f");
  v18[15] = CFSTR("rgb9e5");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 16);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  pixelFormatToDataTypeStringMap = self->_pixelFormatToDataTypeStringMap;
  self->_pixelFormatToDataTypeStringMap = v7;

  v16[1] = &unk_250D7C4B8;
  v16[2] = &unk_250D7C4D0;
  v16[3] = &unk_250D7C4D0;
  v16[5] = &unk_250D7C4E8;
  v16[6] = &unk_250D7C500;
  v16[7] = &unk_250D7C500;
  v16[9] = &unk_250D7C518;
  v16[10] = &unk_250D7C530;
  v16[11] = &unk_250D7C530;
  v16[12] = &unk_250D7C548;
  v16[13] = &unk_250D7C560;
  v16[14] = &unk_250D7C578;
  v16[15] = &unk_250D7C578;
  v16[16] = &unk_250D7C590;
  v16[17] = &unk_250D7C5A8;
  v16[18] = &unk_250D7C5C0;
  v16[19] = &unk_250D7C5C0;
  v16[20] = &unk_250D7C5D8;
  v16[0] = &unk_250D7C320;
  v16[4] = &unk_250D7C308;
  v16[8] = &unk_250D7C338;
  v15[0] = &unk_250D7C0C8;
  v15[1] = &unk_250D7C0E0;
  v15[2] = &unk_250D7C0F8;
  v15[3] = &unk_250D7C110;
  v15[4] = &unk_250D7C128;
  v15[5] = &unk_250D7C140;
  v15[6] = &unk_250D7C158;
  v15[7] = &unk_250D7C170;
  v15[8] = &unk_250D7C008;
  v15[9] = &unk_250D7C020;
  v15[10] = &unk_250D7C038;
  v15[11] = &unk_250D7C050;
  v15[12] = &unk_250D7C068;
  v15[13] = &unk_250D7C080;
  v15[14] = &unk_250D7C098;
  v15[15] = &unk_250D7C0B0;
  v15[16] = &unk_250D7C188;
  v15[17] = &unk_250D7C1A0;
  v15[18] = &unk_250D7C1B8;
  v15[19] = &unk_250D7C1D0;
  v15[20] = &unk_250D7C1E8;
  v15[21] = &unk_250D7C200;
  v16[21] = &unk_250D7C5F0;
  v15[22] = &unk_250D7C218;
  v15[23] = &unk_250D7C230;
  v16[22] = &unk_250D7C608;
  v16[23] = &unk_250D7C608;
  v15[24] = &unk_250D7C248;
  v15[25] = &unk_250D7C260;
  v16[24] = &unk_250D7C620;
  v16[25] = &unk_250D7C140;
  v15[26] = &unk_250D7C278;
  v15[27] = &unk_250D7C290;
  v16[26] = &unk_250D7C638;
  v16[27] = &unk_250D7C638;
  v15[28] = &unk_250D7C2A8;
  v15[29] = &unk_250D7C2C0;
  v16[28] = &unk_250D7C650;
  v16[29] = &unk_250D7C128;
  v16[32] = &unk_250D7C650;
  v15[30] = &unk_250D7C2D8;
  v15[31] = &unk_250D7C2F0;
  v16[30] = &unk_250D7C668;
  v16[31] = &unk_250D7C668;
  v15[32] = &unk_250D7C308;
  v15[33] = &unk_250D7C320;
  v16[33] = &unk_250D7C128;
  v15[34] = &unk_250D7C338;
  v15[35] = &unk_250D7C350;
  v16[34] = &unk_250D7C668;
  v16[35] = &unk_250D7C668;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 36);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dataTypeToTextureTypeForInvalidPixelFormatMap = self->_dataTypeToTextureTypeForInvalidPixelFormatMap;
  self->_dataTypeToTextureTypeForInvalidPixelFormatMap = v9;

  v13[0] = &unk_250D7C008;
  v13[1] = &unk_250D7C020;
  v13[2] = &unk_250D7C038;
  v13[3] = &unk_250D7C050;
  v13[4] = &unk_250D7C0C8;
  v13[5] = &unk_250D7C0E0;
  v13[6] = &unk_250D7C0F8;
  v13[7] = &unk_250D7C110;
  v14[0] = &unk_250D7C680;
  v14[1] = &unk_250D7C698;
  v13[8] = &unk_250D7C068;
  v13[9] = &unk_250D7C080;
  v14[2] = &unk_250D7C6B0;
  v14[3] = &unk_250D7C6C8;
  v14[4] = &unk_250D7C680;
  v14[5] = &unk_250D7C698;
  v14[6] = &unk_250D7C6B0;
  v14[7] = &unk_250D7C6C8;
  v14[8] = &unk_250D7C680;
  v14[9] = &unk_250D7C698;
  v13[10] = &unk_250D7C098;
  v13[11] = &unk_250D7C0B0;
  v14[10] = &unk_250D7C6B0;
  v14[11] = &unk_250D7C6C8;
  v13[12] = &unk_250D7C128;
  v13[13] = &unk_250D7C140;
  v14[12] = &unk_250D7C680;
  v14[13] = &unk_250D7C698;
  v13[14] = &unk_250D7C158;
  v13[15] = &unk_250D7C170;
  v14[14] = &unk_250D7C6B0;
  v14[15] = &unk_250D7C6C8;
  v13[16] = &unk_250D7C188;
  v13[17] = &unk_250D7C1A0;
  v14[16] = &unk_250D7C680;
  v14[17] = &unk_250D7C698;
  v13[18] = &unk_250D7C1B8;
  v13[19] = &unk_250D7C1D0;
  v14[18] = &unk_250D7C6B0;
  v14[19] = &unk_250D7C6C8;
  v13[20] = &unk_250D7C1E8;
  v13[21] = &unk_250D7C200;
  v14[20] = &unk_250D7C680;
  v14[21] = &unk_250D7C698;
  v13[22] = &unk_250D7C218;
  v13[23] = &unk_250D7C230;
  v14[22] = &unk_250D7C6B0;
  v14[23] = &unk_250D7C6C8;
  v13[24] = &unk_250D7C248;
  v13[25] = &unk_250D7C260;
  v14[24] = &unk_250D7C680;
  v14[25] = &unk_250D7C698;
  v13[26] = &unk_250D7C278;
  v13[27] = &unk_250D7C290;
  v14[26] = &unk_250D7C6B0;
  v14[27] = &unk_250D7C6C8;
  v13[28] = &unk_250D7C2A8;
  v13[29] = &unk_250D7C2C0;
  v14[28] = &unk_250D7C680;
  v14[29] = &unk_250D7C698;
  v13[30] = &unk_250D7C2D8;
  v13[31] = &unk_250D7C2F0;
  v14[30] = &unk_250D7C6B0;
  v14[31] = &unk_250D7C6C8;
  v13[32] = &unk_250D7C308;
  v13[33] = &unk_250D7C320;
  v14[32] = &unk_250D7C680;
  v14[33] = &unk_250D7C698;
  v13[34] = &unk_250D7C338;
  v13[35] = &unk_250D7C350;
  v14[34] = &unk_250D7C6B0;
  v14[35] = &unk_250D7C6C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 36);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dataTypeToChannelCount = self->_dataTypeToChannelCount;
  self->_dataTypeToChannelCount = v11;

}

- (void).cxx_destruct
{
  DYMTLImageBlockArgument **begin;
  DYMTLImageBlockArgument **v4;

  objc_storeStrong((id *)&self->_dataTypeToChannelCount, 0);
  objc_storeStrong((id *)&self->_pixelFormatToDataTypeStringMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToImageBlockTypeStringMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToTextureTypeForInvalidPixelFormatMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToTextureComponentTypeStringMap, 0);
  begin = self->_imageBlockArgumentsFromTile.__begin_;
  if (begin)
  {
    self->_imageBlockArgumentsFromTile.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_imageBlockArgumentsFromFragment.__begin_;
  if (v4)
  {
    self->_imageBlockArgumentsFromFragment.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_imageBlockSignature, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

@end
