@implementation DYMTLCommonDebugFunctionPlayer

- (void)setDevice:(id)a3
{
  id v4;
  void *v5;
  DYMTLDebugWireframeRenderer *v6;
  DYMTLDebugWireframeRenderer *wireframeRenderer;
  DYMTLPostVertexDump *v8;
  DYMTLPostVertexDump *postVertexDump;
  DYMTLShaderDebuggerTraceGenerator *v10;
  DYMTLShaderDebuggerTraceGenerator *shaderDebuggerTraceGenerator;
  DYMTLTextureRenderer *v12;
  void *v13;
  DYMTLTextureRenderer *v14;
  DYMTLTextureRenderer *textureRenderer;
  DYMTLPixelHistoryDrawStatsSupport *v16;
  DYMTLPixelHistoryDrawStatsSupport *pixelHistoryDrawStatsRenderer;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer setDevice:](&v19, sel_setDevice_, v4);
  -[DYMTLFunctionPlayer device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportsTessellation = objc_msgSend(v5, "supportsFeatureSet:", 7);

  v6 = -[DYMTLDebugWireframeRenderer initWithDebugFunctionPlayer:]([DYMTLDebugWireframeRenderer alloc], "initWithDebugFunctionPlayer:", self);
  wireframeRenderer = self->_wireframeRenderer;
  self->_wireframeRenderer = v6;

  v8 = -[DYMTLPostVertexDump initWithDebugFunctionPlayer:]([DYMTLPostVertexDump alloc], "initWithDebugFunctionPlayer:", self);
  postVertexDump = self->_postVertexDump;
  self->_postVertexDump = v8;

  v10 = -[DYMTLShaderDebuggerTraceGenerator initWithDebugFunctionPlayer:]([DYMTLShaderDebuggerTraceGenerator alloc], "initWithDebugFunctionPlayer:", self);
  shaderDebuggerTraceGenerator = self->_shaderDebuggerTraceGenerator;
  self->_shaderDebuggerTraceGenerator = v10;

  v12 = [DYMTLTextureRenderer alloc];
  -[DYMTLFunctionPlayer device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DYMTLTextureRenderer initWithDevice:](v12, "initWithDevice:", v13);
  textureRenderer = self->_textureRenderer;
  self->_textureRenderer = v14;

  v16 = -[DYMTLPixelHistoryDrawStatsSupport initWithDebugFunctionPlayer:]([DYMTLPixelHistoryDrawStatsSupport alloc], "initWithDebugFunctionPlayer:", self);
  pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
  self->_pixelHistoryDrawStatsRenderer = v16;

  objc_msgSend(v4, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAGXDevice = objc_msgSend(v18, "compare:", CFSTR("Unknown Unknown")) == 0;

}

- (DYMTLCommonDebugFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4;
  DYMTLCommonDebugFunctionPlayer *v5;
  uint64_t v6;
  NSMutableDictionary *thumbnailDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *dependencyGraphThumbnails;
  DYMTLCommonDebugFunctionPlayer *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  v5 = -[DYMTLFunctionPlayer initWithCaptureStore:](&v12, sel_initWithCaptureStore_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    thumbnailDictionary = v5->_thumbnailDictionary;
    v5->_thumbnailDictionary = (NSMutableDictionary *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dependencyGraphThumbnails = v5->_dependencyGraphThumbnails;
    v5->_dependencyGraphThumbnails = v8;

    -[DYMTLCommonDebugFunctionPlayer resetPixelHistoryCache](v5, "resetPixelHistoryCache");
    if (-[DYMTLCommonDebugFunctionPlayer initWithCaptureStore:]::onceToken != -1)
      dispatch_once(&-[DYMTLCommonDebugFunctionPlayer initWithCaptureStore:]::onceToken, &__block_literal_global_1);
    v10 = v5;
  }

  return v5;
}

void __55__DYMTLCommonDebugFunctionPlayer_initWithCaptureStore___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)sMemorylessTexturesAndReplacements;
  sMemorylessTexturesAndReplacements = v0;

  v2 = objc_opt_new();
  v3 = (void *)sThumbnailTextures;
  sThumbnailTextures = v2;

}

- (void)encoderMap
{
  return &self->_encoderMap;
}

- (id)thumbnailCache
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[DYMTLFunctionPlayer device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DYMTLFunctionPlayer keyForOriginalObject:](self, "keyForOriginalObject:", v3);

  v9[0] = *MEMORY[0x24BE396F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x24BE39700];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_thumbnailDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dependencyGraphThumbnailCache
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[DYMTLFunctionPlayer device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DYMTLFunctionPlayer keyForOriginalObject:](self, "keyForOriginalObject:", v3);

  v9[0] = *MEMORY[0x24BE396F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x24BE39700];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_dependencyGraphThumbnails);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resetPixelHistoryCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pixelHistory;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *pixelHistoryEncoderStateTrackings;

  v3 = (NSMutableDictionary *)objc_opt_new();
  pixelHistory = self->_pixelHistory;
  self->_pixelHistory = v3;

  v5 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelHistory, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE39610]);

  v6 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelHistory, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE39670]);

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_pixelHistoryInverseObjectMap.__table_.__bucket_list_.__ptr_.__value_);
  v7 = (NSMutableDictionary *)objc_opt_new();
  pixelHistoryEncoderStateTrackings = self->_pixelHistoryEncoderStateTrackings;
  self->_pixelHistoryEncoderStateTrackings = v7;

}

- (id)pixelHistoryCache
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[DYMTLFunctionPlayer device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DYMTLFunctionPlayer keyForOriginalObject:inverseObjectMap:](self, "keyForOriginalObject:inverseObjectMap:", v3, &self->_pixelHistoryInverseObjectMap);

  v9[0] = *MEMORY[0x24BE396F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x24BE39700];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_pixelHistory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_generateThumbnailAndResourceInfoForRequestedTextures:(id)a3 resolution:(id *)a4 commandBuffer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  MTLFence *sparseTextureFence;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id v50;
  DYMTLCommonDebugFunctionPlayer *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  __int128 v65;
  unint64_t var2;

  v7 = a3;
  v55 = a5;
  v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)MEMORY[0x24BE63580];
  -[DYMTLFunctionPlayer device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forDevice:", v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v62 = *MEMORY[0x24BE39328];
  v59 = *MEMORY[0x24BE39338];
  v58 = *MEMORY[0x24BE39330];
  v57 = *MEMORY[0x24BE39320];
  v56 = *MEMORY[0x24BE39318];
  v49 = *MEMORY[0x24BE39348];
  v48 = *MEMORY[0x24BE39468];
  v61 = v7;
  v52 = self;
  while (v10 < objc_msgSend(v7, "count", v48))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v62);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "unsignedLongLongValue");
      objc_msgSend(v11, "objectForKeyedSubscript:", v59);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedLongLongValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", v58);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedLongLongValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", v57);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedLongLongValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", v56);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)sMemorylessTexturesAndReplacements;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v24;
        if (v24)
        {
          v25 = v24;

          v21 = v25;
        }
        v26 = objc_msgSend(v21, "textureType");
        if (v26 > 9)
        {
          v27 = v21;
        }
        else
        {
          if (((1 << v26) & 0x2EF) != 0)
            objc_msgSend(v54, "textureFromTexture:slice:level:depthPlane:commandBuffer:", v21, v16, v18, v20, v55);
          else
            objc_msgSend(v54, "resolveMultisampleTexture:slice:level:depthPlane:commandBuffer:", v21, v16, v18, v20, v55);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v64
            && objc_msgSend(v64, "unsignedLongLongValue") == 9
            && objc_msgSend(v27, "pixelFormat") == 260)
          {
            objc_msgSend(v54, "stencilTextureFromTexture:commandBuffer:", v27, v55);
            v28 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v28;
          }
          if (v27)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v29 = objc_msgSend(v27, "isSparse");
              v65 = *(_OWORD *)&a4->var0;
              var2 = a4->var2;
              if (v29)
                sparseTextureFence = v52->_sparseTextureFence;
              else
                sparseTextureFence = 0;
            }
            else
            {
              sparseTextureFence = 0;
              v65 = *(_OWORD *)&a4->var0;
              var2 = a4->var2;
            }
            objc_msgSend(v54, "generateThumbnailFromTexture:commandBuffer:resolution:withFence:", v27, v55, &v65, sparseTextureFence);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)v31;
            if (v31)
            {
              v53 = (void *)v31;
              v63 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v33 = objc_msgSend(v27, "pixelFormat");
              v34 = 10;
              if (v33 != 1)
                v34 = v33;
              if (v33 == 261)
                v35 = 253;
              else
                v35 = v34;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v36, v62);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v53);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v37, v49);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v38, v48);

              if (v64)
              {
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v64, v56);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v39, v59);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v18);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v40, v58);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v20);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v41, v57);

              }
              objc_msgSend(v50, "addObject:", v63);
              v42 = (void *)sThumbnailTextures;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v53);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKey:", v43);

              v44 = sThumbnailTextures;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v53);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)v44;
              v32 = v53;
              objc_msgSend(v46, "setObject:forKey:", v53, v45);

            }
          }
        }

        self = v52;
      }

    }
    ++v10;
    v7 = v61;
  }

  return v50;
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5
{
  uint64_t v5;
  CoreFunction *v9;
  objc_super v10;

  v5 = *(_QWORD *)&a5;
  if (-[DYMTLCommonDebugFunctionPlayer shouldIgnoreCaptureFile](self, "shouldIgnoreCaptureFile")
    && -[DYFunctionPlayer mainExecutionMode](self, "mainExecutionMode"))
  {
    *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) = (Class)&a3[a4];
    *(_DWORD *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39028]) += a4;
    *(_DWORD *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]) += a4;
  }
  else
  {
    v9 = &a3[a4 - 1];
    if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)v9->var0) & 1) != 0
      || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)v9->var0) & 1) != 0
      || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)v9->var0))
    {
      self->_targetCommandEncoderId = a3[a4 - 1].var4.var0;
    }
    v10.receiver = self;
    v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    -[DYFunctionPlayer executeFunctions:count:subCommandIndex:](&v10, sel_executeFunctions_count_subCommandIndex_, a3, a4, v5);
  }
}

- (void)_splitBlitEncoder
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v3)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      v5 = v4;
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_256BDE0B8))
      {
        if (self->_nRemainingCommandsForCurrentEncoder)
        {
          -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v5[2]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x242623ED8]();
          objc_msgSend(v6, "endEncoding");
          objc_msgSend(v7, "blitCommandEncoder");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v9, v10);

          objc_autoreleasePoolPop(v8);
        }
      }

    }
  }
}

- (void)_splitComputeEncoder
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];
  _QWORD v13[5];
  unint64_t v14;

  v14 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v14);
  if (v3)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      v5 = v4;
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_256BDD688)
        && self->_nRemainingCommandsForCurrentEncoder)
      {
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v5[2]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x242623ED8]();
        objc_msgSend(v6, "endEncoding");
        DYMTLNewStatefulComputeCommandEncoder(v7, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __54__DYMTLCommonDebugFunctionPlayer__splitComputeEncoder__block_invoke;
        v13[3] = &unk_250D6F858;
        v13[4] = self;
        objc_msgSend(v6, "applyToEncoder:rawBytesBlock:", v9, v13);
        if (self->_bSetStageInRegion)
        {
          v10 = *(_OWORD *)&self->_stageInRegion.origin.z;
          v12[0] = *(_OWORD *)&self->_stageInRegion.origin.x;
          v12[1] = v10;
          v12[2] = *(_OWORD *)&self->_stageInRegion.size.height;
          objc_msgSend(v9, "setStageInRegion:", v12);
        }
        else if (self->_stageInIndirectBufferId)
        {
          -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", v11, self->_stageInIndirectBufferOffset);

        }
        -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v9, v14);

        objc_autoreleasePoolPop(v8);
      }

    }
  }
}

uint64_t __54__DYMTLCommonDebugFunctionPlayer__splitComputeEncoder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeBytesForKey:", +[DYMTLFunctionPlayer computeBytesKeyAtIndex:](DYMTLFunctionPlayer, "computeBytesKeyAtIndex:"));
}

- (void)_splitRenderEncoders
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  unint64_t v29;

  v29 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v29);
  if (v3)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      v5 = v4;
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v29);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_256BDCFE8)
        && self->_nRemainingCommandsForCurrentEncoder)
      {
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v5[2]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "descriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 8; ++i)
        {
          objc_msgSend(v8, "colorAttachments");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v11);

          objc_msgSend(v8, "colorAttachments");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setResolveTexture:", 0);

          objc_msgSend(v8, "colorAttachments");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setLoadAction:", 1);

          objc_msgSend(v8, "colorAttachments");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setStoreAction:", 1);

        }
        objc_msgSend(v8, "depthAttachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v18);

        objc_msgSend(v8, "depthAttachment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setResolveTexture:", 0);

        objc_msgSend(v8, "depthAttachment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLoadAction:", 1);

        objc_msgSend(v8, "depthAttachment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setStoreAction:", 1);

        objc_msgSend(v8, "stencilAttachment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v22);

        objc_msgSend(v8, "stencilAttachment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setResolveTexture:", 0);

        objc_msgSend(v8, "stencilAttachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setLoadAction:", 1);

        objc_msgSend(v8, "stencilAttachment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setStoreAction:", 1);

        v26 = (void *)MEMORY[0x242623ED8]();
        objc_msgSend(v6, "endEncoding");
        DYMTLNewStatefulRenderCommandEncoder(v7, v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __54__DYMTLCommonDebugFunctionPlayer__splitRenderEncoders__block_invoke;
        v28[3] = &unk_250D6F1B0;
        v28[4] = self;
        objc_msgSend(v6, "applyAllStateToEncoder:rawBytesBlock:", v27, v28);
        -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v27, v29);

        objc_autoreleasePoolPop(v26);
      }

    }
  }
}

uint64_t __54__DYMTLCommonDebugFunctionPlayer__splitRenderEncoders__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(a1 + 32), "tileBytesForKey:", +[DYMTLFunctionPlayer tileBytesKeyAtIndex:](DYMTLFunctionPlayer, "tileBytesKeyAtIndex:", a4));
  if (a2 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "fragmentBytesForKey:", +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:](DYMTLFunctionPlayer, "fragmentBytesKeyAtIndex:", a4));
  if (a2)
    return 0;
  return objc_msgSend(*(id *)(a1 + 32), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (void)_createBatchIdFilterMapping:(BOOL)a3 withCommandEncoder:(id)a4
{
  _BOOL4 v4;
  id v6;
  vector<std::pair<unsigned int, unsigned int>, std::allocator<std::pair<unsigned int, unsigned int>>> *p_currentEncoderBatchInfo;
  char *end;
  char *value;
  _DWORD *v10;
  unsigned int v11;
  int32x2_t *v12;
  int32x2_t *v13;
  int32x2_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *begin;
  uint64_t v25;
  unint64_t v26;
  int v27;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      LODWORD(v26) = 0;
      v27 = 0;
      objc_msgSend(v6, "commandBatchIdRangeMin:max:", &v26, &v27);
      p_currentEncoderBatchInfo = &self->_currentEncoderBatchInfo;
      end = (char *)p_currentEncoderBatchInfo->__end_;
      value = (char *)p_currentEncoderBatchInfo->__end_cap_.__value_;
      if (end >= value)
      {
        v15 = (end - (char *)p_currentEncoderBatchInfo->__begin_) >> 3;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v17 = value - (char *)p_currentEncoderBatchInfo->__begin_;
        if (v17 >> 2 > v16)
          v16 = v17 >> 2;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&p_currentEncoderBatchInfo->__end_cap_, v18);
        v20 = &v19[8 * v15];
        v22 = &v19[8 * v21];
        *(_DWORD *)v20 = v26;
        *((_DWORD *)v20 + 1) = v27;
        v10 = v20 + 8;
        begin = (char *)p_currentEncoderBatchInfo->__begin_;
        v23 = (char *)p_currentEncoderBatchInfo->__end_;
        if (v23 != p_currentEncoderBatchInfo->__begin_)
        {
          do
          {
            v25 = *((_QWORD *)v23 - 1);
            v23 -= 8;
            *((_QWORD *)v20 - 1) = v25;
            v20 -= 8;
          }
          while (v23 != begin);
          v23 = (char *)p_currentEncoderBatchInfo->__begin_;
        }
        p_currentEncoderBatchInfo->__begin_ = v20;
        p_currentEncoderBatchInfo->__end_ = v10;
        p_currentEncoderBatchInfo->__end_cap_.__value_ = v22;
        if (v23)
          operator delete(v23);
      }
      else
      {
        *(_DWORD *)end = v26;
        *((_DWORD *)end + 1) = v27;
        v10 = end + 8;
      }
      p_currentEncoderBatchInfo->__end_ = v10;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v6, "commandBatchIdOffset");
    v12 = (int32x2_t *)self->_currentEncoderBatchInfo.__begin_;
    v13 = (int32x2_t *)self->_currentEncoderBatchInfo.__end_;
    if (v12 != v13)
    {
      v14 = vdup_n_s32(v11);
      do
      {
        *v12 = vsub_s32(*v12, v14);
        ++v12;
      }
      while (v12 != v13);
    }
    v26 = self->_currentBatchEncoderIndex - 1;
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>>>::__emplace_unique_key_args<unsigned long,unsigned long,std::vector<std::pair<unsigned int,unsigned int>>&>((uint64_t)&self->_encoderIndexToBatchInfo, (uint64_t *)&v26, &v26, (uint64_t **)&self->_currentEncoderBatchInfo);
    self->_currentEncoderBatchInfo.__end_ = self->_currentEncoderBatchInfo.__begin_;
  }

}

- (void)_splitCommandEncoders
{
  uint64_t v3;

  v3 = (int)*MEMORY[0x24BE39040];
  if ((GPUTools::MTL::IsFuncEnumSampledBlitCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                    + v3)) & 1) != 0
    || GPUTools::MTL::IsFuncEnumSampledBlitCallAGX((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v3)))
  {
    --self->_nRemainingCommandsForCurrentEncoder;
    -[DYMTLCommonDebugFunctionPlayer _splitBlitEncoder](self, "_splitBlitEncoder");
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  return 1;
}

- (void)_setupEncodersForBatchIdFiltering
{
  id v3;
  uint64_t v4;
  int v5;
  unint64_t currentBatchEncoderIndex;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
  v4 = (int)*MEMORY[0x24BE39040];
  v5 = **(_DWORD **)((char *)&self->super.super.super.super.isa + v4);
  if ((v5 + 16354) < 4 || v5 == -16014)
  {
    v11 = v3;
    if (objc_msgSend(v3, "playbackMode") == 5)
    {
      currentBatchEncoderIndex = self->_currentBatchEncoderIndex;
      v8 = currentBatchEncoderIndex >= -[NSArray count](self->_batchInfos, "count");
      v3 = v11;
      if (v8)
        goto LABEL_15;
      -[NSArray objectAtIndexedSubscript:](self->_batchInfos, "objectAtIndexedSubscript:", self->_currentBatchEncoderIndex);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_currentEncoderBatchIndex = objc_msgSend(v9, "unsignedIntValue");

      if (self->_currentEncoderBatchIndex != -1)
      {
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 24, 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderIndexToBatchInfo.__table_.__bucket_list_.__ptr_.__value_, &self->_currentBatchEncoderIndex);

      }
    }
    else if (objc_msgSend(v11, "playbackMode") == 12)
    {
      v3 = v11;
      if (self->_currentBatchEncoderIndex)
      {
LABEL_14:
        ++self->_currentBatchEncoderIndex;
        goto LABEL_15;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>>>::clear((uint64_t)&self->_encoderIndexToBatchInfo);
    }
    v3 = v11;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)executeGraphicsFunction
{
  DYMTLCommonDebugFunctionPlayer *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  int *v14;
  int v15;
  void *v17;
  uint64_t v18;
  MTLFence *sparseTextureFence;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_encoderToParallelEncoderMap;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  _DWORD *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  unint64_t *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  _BOOL4 v58;
  int v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  id v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  int *v72;
  int v73;
  void *v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  _QWORD *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  _QWORD *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  objc_object *v101;
  void *v102;
  uint64_t v103;
  _BOOL4 v104;
  NSMutableDictionary *pixelHistoryEncoderStateTrackings;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  GPUTools::MTL *v111;
  int v112;
  unint64_t *v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  void *v122;
  uint64_t Index;
  void *v124;
  void *v125;
  void *v126;
  __CFString *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  char v131;
  void *v132;
  NSMutableDictionary *v133;
  void *v134;
  void *v135;
  void *v136;
  MTLRenderPassDescriptor *currentParallelDescriptor;
  MTLRenderPassDescriptor *v138;
  unsigned int *v139;
  GPUTools::MTL *v140;
  _QWORD *v143;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  unsigned int currentEncoderBatchIndex;
  int v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  BOOL v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  BOOL v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  BOOL v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  char *v188;
  uint64_t v189;
  MTLRenderPassDescriptor *dependencyGraphParallelDescriptor;
  DYMTLRenderPassDescriptor *v191;
  uint64_t k;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  char v207;
  void *v208;
  uint64_t v209;
  void *v210;
  BOOL v211;
  NSDictionary *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  objc_object *v216;
  uint64_t v217;
  _BOOL4 v218;
  int v219;
  uint64_t v220;
  uint64_t v221;
  _QWORD *v222;
  _QWORD *v223;
  _QWORD *v224;
  uint64_t v225;
  _BOOL4 v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  NSDictionary *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  void *v236;
  id v237;
  uint64_t j;
  void *v239;
  id v240;
  uint64_t v241;
  void *v242;
  unsigned int v243;
  void *v244;
  void *v245;
  void *v246;
  int v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t n;
  uint64_t v270;
  void *v271;
  void *v272;
  unint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t ii;
  uint64_t v285;
  void *v286;
  void *v287;
  uint64_t v288;
  char isKindOfClass;
  const __CFString *v290;
  char v291;
  char v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  uint64_t jj;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  uint64_t v306;
  void *v307;
  void *v308;
  _QWORD *v309;
  void *v310;
  GPUTools::MTL *v311;
  void *v312;
  void *v313;
  void *v314;
  id *p_isa;
  void *v316;
  void *v317;
  DYMTLCommonDebugFunctionPlayer *v318;
  id *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t i;
  void *v327;
  char v328;
  id v329;
  void *v330;
  void *v331;
  DYMTLCommonDebugFunctionPlayer *v332;
  void *v333;
  void *v334;
  char v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  unint64_t v340;
  unsigned int v341;
  uint64_t v342;
  void *v343;
  void *v344;
  uint64_t v345;
  void *v346;
  uint64_t v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  _BOOL4 v353;
  void *v354;
  void *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t kk;
  void *v359;
  void *v360;
  uint64_t v361;
  void *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  id v366;
  uint64_t v367;
  void *v368;
  _BOOL4 v369;
  void *v370;
  void *v371;
  void *v372;
  uint64_t v373;
  void *v374;
  uint64_t v375;
  void *v376;
  uint64_t v377;
  void *v378;
  uint64_t v379;
  void *v380;
  void *v381;
  void *v382;
  id v383;
  void *v384;
  int v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  char v399;
  _QWORD *v400;
  _QWORD *v401;
  _QWORD *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  BOOL v411;
  void *v412;
  void *v413;
  BOOL v414;
  void *v416;
  void *v417;
  BOOL v418;
  void *v420;
  void *v421;
  uint64_t v422;
  void *v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  uint64_t v427;
  MTLBuffer *pixelHistoryPixelPreviousStencil;
  MTLBuffer *v429;
  MTLBuffer *pixelHistoryPixelPreviousDepth;
  void *v431;
  void *v432;
  void *v433;
  uint64_t v434;
  void *v435;
  uint64_t v436;
  uint64_t v437;
  unint64_t v438;
  void *v439;
  _BOOL4 v440;
  uint64_t v441;
  uint64_t v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  _QWORD *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *context;
  void *contexta;
  uint64_t v456;
  void *v457;
  void *v458;
  char v459;
  _BOOL4 v460;
  uint64_t v461;
  id v462;
  void *v463;
  uint64_t v464;
  _BOOL4 v465;
  uint64_t v466;
  uint64_t v467;
  int v468;
  void *v469;
  void *v470;
  uint64_t v471;
  void *v472;
  void *v473;
  void *v474;
  uint64_t v475;
  void *v476;
  id v477;
  id v478;
  id v479;
  id v480;
  id obj;
  id obja;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  void *v486;
  uint64_t v487;
  void *v488;
  id v489;
  void *v490;
  void *v491;
  void *v492;
  id v493;
  DYMTLCommonDebugFunctionPlayer *v494;
  _QWORD v495[5];
  _QWORD v496[4];
  id v497;
  id v498;
  id v499;
  uint64_t v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  _QWORD v505[5];
  _QWORD v506[5];
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  id v519;
  id v520;
  objc_super v521;
  id v522;
  objc_super v523;
  id v524;
  id v525;
  objc_super v526;
  objc_super v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  objc_super v532;
  objc_super v533;
  objc_super v534;
  objc_super v535;
  objc_super v536;
  objc_super v537;
  id v538;
  _QWORD v539[4];
  id v540;
  objc_super v541;
  objc_super v542;
  int64x2_t v543;
  uint64_t v544;
  objc_super v545;
  int64x2_t v546;
  uint64_t v547;
  objc_super v548;
  _QWORD v549[5];
  id v550;
  id v551;
  void *v552;
  _QWORD v553[3];
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  _QWORD v558[5];
  unint64_t v559;
  _QWORD v560[3];
  __int128 __p;
  unint64_t v562;
  char v563;
  unint64_t v564;
  _BYTE v565[128];
  _BYTE v566[128];
  _BYTE v567[128];
  _BYTE v568[128];
  _BYTE v569[128];
  _BYTE v570[128];
  uint64_t v571;

  v2 = self;
  v571 = *MEMORY[0x24BDAC8D0];
  v492 = (void *)MEMORY[0x242623ED8](self, a2);
  v494 = v2;
  v493 = *(id *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
  switch(objc_msgSend(v493, "playbackMode"))
  {
    case 0u:
      if (v2->_wireframeRenderMode == 1 || v2->_targetFunctionNeedsSeparatedPostVertexDump)
      {
        if (-[DYFunctionPlayer mainExecutionMode](v2, "mainExecutionMode"))
        {
          v50 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]);
          v9 = v50 == objc_msgSend(v493, "targetFunctionIndex") - 1;
          v2 = v494;
          if (v9)
          {
            v51 = (int)*MEMORY[0x24BE39040];
            v2 = v494;
            if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                       + v51)) & 1) != 0
              || (v2 = v494,
                  (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v51)) & 1) != 0)
              || (v2 = v494,
                  GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v51))))
            {
              *(_QWORD *)&__p = 0;
              *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v51) + 48, 0);
              v52 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v2->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
              if (v52)
              {
                v564 = 0;
                v53 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
                if (!v53
                  || (v564 = v53[3],
                      (v52 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564)) != 0))
                {
                  v55 = v52[5];
                  v54 = v52 + 5;
                  if (v494->_targetCommandEncoderId != v55)
                    objc_msgSend((id)sMemorylessTexturesAndReplacements, "removeAllObjects");
                  v56 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v54);
                  if (v56)
                  {
                    v57 = v56 + 3;
                    v58 = (unint64_t)(v56[185] + 1) > 1
                       || (unint64_t)(v56[186] - 1) < 0xFFFFFFFFFFFFFFFELL;
                  }
                  else
                  {
                    v57 = 0;
                    v58 = 0;
                  }
                  v559 = 0;
                  if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v51)))
                  {
                    v522 = 0;
                    -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v522, &v559);
                    v329 = v522;
                    -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                    v331 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v331, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v330, v559, objc_msgSend(v493, "targetSubCommandIndex"), v329);

                    v332 = v494;
                  }
                  else
                  {
                    v332 = v494;
                    v521.receiver = v494;
                    v521.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    v329 = 0;
                    -[DYMTLFunctionPlayer executeGraphicsFunction](&v521, sel_executeGraphicsFunction);
                  }
                  -[DYMTLCommonDebugFunctionPlayer extractIndirectArgumentBuffers](v332, "extractIndirectArgumentBuffers");
                  -[DYMTLCommonDebugFunctionPlayer extractCommandBufferTranslationData](v332, "extractCommandBufferTranslationData");
                  if (v58)
                    -[DYMTLCommonDebugFunctionPlayer _extractTileMemoryWithRenderPassDescriptor:renderEncoderID:isDrawCall:](v332, "_extractTileMemoryWithRenderPassDescriptor:renderEncoderID:isDrawCall:", v57, (_QWORD)__p, GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v332->super.super.super.super.isa+ v51)));
                  v332->_targetFunctionNeedsSeparatedPostVertexDump = 0;

                }
              }
              goto LABEL_331;
            }
          }
        }
      }
      if (-[DYFunctionPlayer mainExecutionMode](v2, "mainExecutionMode"))
      {
        v77 = *(_DWORD *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]);
        if (v77 == objc_msgSend(v493, "targetFunctionIndex") - 1)
        {
          v78 = (int)*MEMORY[0x24BE39040];
          if (GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v78)))
          {
            v79 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v78) + 48, 0);
            *(_QWORD *)&__p = 0;
            v520 = 0;
            -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v520, &__p);
            v80 = v520;
            -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v81, (_QWORD)__p, objc_msgSend(v493, "targetSubCommandIndex"), v80);

            -[DYMTLCommonDebugFunctionPlayer extractIndirectArgumentBuffers](v494, "extractIndirectArgumentBuffers");
            -[DYMTLCommonDebugFunctionPlayer extractCommandBufferTranslationData](v494, "extractCommandBufferTranslationData");

            goto LABEL_331;
          }
        }
      }
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v494, "_executeGraphicsFunction");
      if (-[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v494, "shouldExecuteGraphicsFunction"))
        goto LABEL_120;
      goto LABEL_331;
    case 1u:
    case 2u:
    case 3u:
    case 5u:
    case 0xBu:
    case 0xCu:
      if ((objc_msgSend(v493, "playbackMode") == 5
         || objc_msgSend(v493, "playbackMode") == 11
         || objc_msgSend(v493, "playbackMode") == 12)
        && (GPUTools::MTL::IsFuncEnumSampleCall((GPUTools::MTL *)**(unsigned int **)((char *)&v2->super.super.super.super.isa
                                                                                   + (int)*MEMORY[0x24BE39040])) & 1) != 0)
      {
        goto LABEL_331;
      }
      if (!v2->_isAGXDevice
        || objc_msgSend(v493, "playbackMode") != 5
        && objc_msgSend(v493, "playbackMode") != 2
        && objc_msgSend(v493, "playbackMode") != 5
        && objc_msgSend(v493, "playbackMode") != 12)
      {
        goto LABEL_15;
      }
      v3 = -[DYMTLFunctionPlayer objectMap](v2, "objectMap");
      v4 = (int)*MEMORY[0x24BE39040];
      v5 = *(int **)((char *)&v494->super.super.super.super.isa + v4);
      v6 = *v5;
      if (*v5 == -16351)
      {
        if (objc_msgSend(v493, "playbackMode") == 2)
          goto LABEL_335;
        -[DYFunctionPlayer processArguments](v494, "processArguments");
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (*(_QWORD **)((char *)&v494->super.super.super.super.isa + v4))[2]);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        GPUTools::MTL::MakeMTLRenderPassDescriptor(**(_QWORD **)((char *)&v494->super.super.super._executePlatform + (int)*MEMORY[0x24BE39008]), (uint64_t)-[DYMTLFunctionPlayer objectMap](v494, "objectMap"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLNewStatefulRenderCommandEncoder(v93, v94);
        v95 = objc_claimAutoreleasedReturnValue();
        v564 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v4) + 24, 0);
        *(_QWORD *)&__p = &v564;
        v96 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v3, &v564, (uint64_t)&std::piecewise_construct, (_QWORD **)&__p);
        v97 = (void *)v96[3];
        v96[3] = v95;

      }
      else if (v6 == -16286)
      {
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", *((_QWORD *)v5 + 2));
        v90 = objc_claimAutoreleasedReturnValue();
        v564 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v4) + 24, 0);
        *(_QWORD *)&__p = &v564;
        v91 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v3, &v564, (uint64_t)&std::piecewise_construct, (_QWORD **)&__p);
        v92 = (void *)v91[3];
        v91[3] = v90;

      }
      else if (v6 != -16246
             || !std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v5 + 2))
      {
LABEL_15:
        v7 = (int)*MEMORY[0x24BE39040];
        v8 = **(_DWORD **)((char *)&v494->super.super.super.super.isa + v7);
        if ((v8 + 7158) < 3)
        {
          -[DYMTLCommonFunctionPlayer layerManager](v494, "layerManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](v494, "replayerLayerForDrawableId:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v7) + 48, 0));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "prepareLayerForPresent:", v11);
        }
        else
        {
          v9 = (v8 + 16359) < 2 || v8 == -16133;
          if (!v9)
          {
            if (v494->_isAGXDevice)
            {
              if (objc_msgSend(v493, "playbackMode") == 12)
              {
                v98 = *(uint64_t *)((char *)&v494->super.super.super.super.isa + v7);
                v99 = *(_QWORD *)(v98 + 16);
                v100 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)(v98 + 16));
                if (v100)
                  v99 = v100[3];
                -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v99);
                v101 = (objc_object *)objc_claimAutoreleasedReturnValue();
                DYMTLGetOriginalObject(v101);
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                v548.receiver = v494;
                v548.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                -[DYMTLFunctionPlayer executeGraphicsFunction](&v548, sel_executeGraphicsFunction);
                v103 = GPUTools::MTL::IsFuncEnumGPUCommandCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                                  + v7));
                if ((v103 & 1) != 0
                  || GPUTools::MTL::IsFuncEnumEndEncoding((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v7)))
                {
                  -[DYMTLCommonDebugFunctionPlayer _createBatchIdFilterMapping:withCommandEncoder:](v494, "_createBatchIdFilterMapping:withCommandEncoder:", v103, v102);
                }
LABEL_469:

                goto LABEL_470;
              }
              if (objc_msgSend(v493, "playbackMode") == 5 && v494->_batchInfos)
              {
                -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (*(_QWORD **)((char *)&v494->super.super.super.super.isa + v7))[2]);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = v150;
                currentEncoderBatchIndex = v494->_currentEncoderBatchIndex;
                if (currentEncoderBatchIndex == -1
                  || (v494->_currentEncoderBatchIndex = currentEncoderBatchIndex - 1, currentEncoderBatchIndex))
                {
                  v152 = 0;
                }
                else
                {
                  if (v150)
                  {
                    objc_msgSend(v150, "viewports");
                    v152 = 1;
                    goto LABEL_212;
                  }
                  v152 = 1;
                }
                __p = 0uLL;
                v562 = 0;
LABEL_212:
                objc_msgSend(v102, "renderPipelineState");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                if (v152)
                {
                  -[DYMTLCommonDebugFunctionPlayer _generateDummyPipeline:](v494, "_generateDummyPipeline:", v153);
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v154)
                  {
                    objc_msgSend(v102, "setRenderPipelineState:", v154);
                    if (GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v7)))
                    {
                      v546 = vdupq_n_s64(1uLL);
                      v547 = 1;
                      objc_msgSend(v102, "dispatchThreadsPerTile:", &v546);
                    }
                    else
                    {
                      objc_msgSend(v102, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 3, 0, 0, 1);
                    }
                    objc_msgSend(v102, "setRenderPipelineState:", v153);
                  }
                }
                else
                {
                  v154 = 0;
                }
                v545.receiver = v494;
                v545.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                -[DYMTLFunctionPlayer executeGraphicsFunction](&v545, sel_executeGraphicsFunction);
                if (v154)
                  v385 = v152;
                else
                  v385 = 0;
                if (v385 == 1)
                {
                  objc_msgSend(v102, "setRenderPipelineState:", v154);
                  if (GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v7)))
                  {
                    v543 = vdupq_n_s64(1uLL);
                    v544 = 1;
                    objc_msgSend(v102, "dispatchThreadsPerTile:", &v543);
                  }
                  else
                  {
                    objc_msgSend(v102, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 3, 0, 0, 1);
                  }
                  objc_msgSend(v102, "setRenderPipelineState:", v153);
                }

                if ((_QWORD)__p)
                {
                  *((_QWORD *)&__p + 1) = __p;
                  operator delete((void *)__p);
                }
                goto LABEL_469;
              }
              v542.receiver = v494;
              v542.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
              -[DYMTLFunctionPlayer executeGraphicsFunction](&v542, sel_executeGraphicsFunction);
              if (GPUTools::MTL::IsFuncEnumCreateCommandBuffer((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v7)))
              {
                -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v7) + 24, 0));
                v216 = (objc_object *)objc_claimAutoreleasedReturnValue();
                DYMTLGetOriginalObject(v216);
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                if (v102 && (objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v102, "setDisableDeferredEndEncoding:", 1);
                goto LABEL_469;
              }
            }
            else
            {
              v541.receiver = v494;
              v541.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
              -[DYMTLFunctionPlayer executeGraphicsFunction](&v541, sel_executeGraphicsFunction);
            }
LABEL_470:
            -[DYMTLCommonDebugFunctionPlayer _trackObjects](v494, "_trackObjects");
LABEL_96:
            if (v494->_isAGXDevice)
            {
              if (objc_msgSend(v493, "playbackMode") == 3)
              {
                v72 = *(int **)((char *)&v494->super.super.super.super.isa + v7);
                v73 = *v72;
                if ((*v72 + 16343) < 2 || v73 == -12544 || v73 == -15701)
                {
                  -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v72 + 6), 0));
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v76)
                  {
                    v539[0] = MEMORY[0x24BDAC760];
                    v539[1] = 3221225472;
                    v539[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_3;
                    v539[3] = &unk_250D6F8A8;
                    v540 = v493;
                    objc_msgSend(v76, "addCompletedHandler:", v539);

                  }
                }
              }
              else if (objc_msgSend(v493, "playbackMode") == 5 && v494->_batchInfos
                     || objc_msgSend(v493, "playbackMode") == 12)
              {
                -[DYMTLCommonDebugFunctionPlayer _setupEncodersForBatchIdFiltering](v494, "_setupEncodersForBatchIdFiltering");
              }
            }
            goto LABEL_335;
          }
          -[DYMTLCommonFunctionPlayer layerManager](v494, "layerManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](v494, "replayerLayerForDrawableId:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v7) + 72, 0));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "prepareLayerForPresent:", v11);
        }

        goto LABEL_96;
      }
      if (objc_msgSend(v493, "playbackMode") == 5 && v494->_batchInfos
        || objc_msgSend(v493, "playbackMode") == 12)
      {
        -[DYMTLCommonDebugFunctionPlayer _setupEncodersForBatchIdFiltering](v494, "_setupEncodersForBatchIdFiltering");
      }
      -[DYMTLCommonDebugFunctionPlayer _trackObjects](v494, "_trackObjects");
      goto LABEL_335;
    case 4u:
      if (-[DYFunctionPlayer mainExecutionMode](v2, "mainExecutionMode")
        && (v27 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]),
            v27 == objc_msgSend(v493, "targetFunctionIndex") - 1)
        && ((v28 = (int)*MEMORY[0x24BE39040],
             (GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                   + v28)) & 1) != 0)
         || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                                 + v28)) & 1) != 0
         || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                               + v28))))
      {
        *(_QWORD *)&__p = 0;
        *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v28) + 48, 0);
        v29 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        v30 = v29;
        if (v29)
        {
          v31 = v29[4];
          v564 = 0;
          p_encoderToParallelEncoderMap = &v494->_encoderToParallelEncoderMap;
          v33 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
          if (!v33
            || (v564 = v33[3],
                (v30 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564)) != 0))
          {
            v559 = 0;
            if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v28)))
            {
              v538 = 0;
              v34 = -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v538, &v559);
              v489 = v538;
              if (v34)
                v31 = v34;
            }
            else
            {
              v489 = 0;
            }
            v222 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v30 + 5);
            v223 = v222;
            if (v222)
              v224 = v222 + 3;
            else
              v224 = 0;
            if (v494->_wireframeRenderMode == 2)
            {
              v225 = 2;
            }
            else
            {
              v225 = -[DYMTLDebugWireframeRenderer prepareWireframeTextureWithCommandBufferId:commandEncoderId:parallelEncoderId:pipelineId:renderPassDescriptor:](v494->_wireframeRenderer, "prepareWireframeTextureWithCommandBufferId:commandEncoderId:parallelEncoderId:pipelineId:renderPassDescriptor:", v30[3], (_QWORD)__p, v564, v31, v224);
              v494->_wireframeRenderMode = v225;
            }
            if (v223)
              v226 = (unint64_t)(v223[185] + 1) > 1
                  || (unint64_t)(v223[186] - 1) < 0xFFFFFFFFFFFFFFFELL;
            else
              v226 = 0;
            switch(v225)
            {
              case 0:
                if (v489)
                {
                  -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                  v313 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                  v314 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v313, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v314, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                  p_isa = (id *)&v494->super.super.super.super.isa;
                }
                else
                {
                  p_isa = (id *)&v494->super.super.super.super.isa;
                  v537.receiver = v494;
                  v537.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                  -[DYMTLFunctionPlayer executeGraphicsFunction](&v537, sel_executeGraphicsFunction);
                }
                objc_msgSend(p_isa, "extractIndirectArgumentBuffers");
                objc_msgSend(p_isa, "extractCommandBufferTranslationData");
                if (v226)
                  objc_msgSend(p_isa, "_extractTileMemoryWithRenderPassDescriptor:renderEncoderID:isDrawCall:", v224, (_QWORD)__p, GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)p_isa + v28)));
                if (objc_msgSend(p_isa[492], "createAndSetPostVertexDumpPipelineState:commandEncoderId:pipelineId:", v30[3], (_QWORD)__p, v31))
                {
                  if (v489)
                  {
                    -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                    v333 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                    v334 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v333, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v334, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                    p_isa = (id *)&v494->super.super.super.super.isa;
                  }
                  else
                  {
                    p_isa = (id *)&v494->super.super.super.super.isa;
                    v536.receiver = v494;
                    v536.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    -[DYMTLFunctionPlayer executeGraphicsFunction](&v536, sel_executeGraphicsFunction);
                  }
                }
                if (objc_msgSend(p_isa[256], "createWireframeRenderCommandEncoder:", v224))
                {
                  if (v489)
                  {
                    -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                    v387 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                    v388 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v387, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v388, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                  }
                  else
                  {
                    v535.receiver = v494;
                    v535.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    -[DYMTLFunctionPlayer executeGraphicsFunction](&v535, sel_executeGraphicsFunction);
                  }
                  if (v564)
                  {
                    *((_BYTE *)v30 + 48) = 1;
                    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                    v494->_lastEncoderID = 0;
                    v564 = 0;
                  }
                  p_isa = (id *)&v494->super.super.super.super.isa;
                  if (-[DYMTLDebugWireframeRenderer createSolidRenderCommandEncoder:commandBufferId:commandEncoderId:parallelEncoderId:](v494->_wireframeRenderer, "createSolidRenderCommandEncoder:commandBufferId:commandEncoderId:parallelEncoderId:", v224, v30[3], (_QWORD)__p, 0))
                  {
                    if (v489)
                    {
                      -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                      v389 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                      v390 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v389, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v390, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                      p_isa = (id *)&v494->super.super.super.super.isa;
                    }
                    else
                    {
                      p_isa = (id *)&v494->super.super.super.super.isa;
                      v534.receiver = v494;
                      v534.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                      -[DYMTLFunctionPlayer executeGraphicsFunction](&v534, sel_executeGraphicsFunction);
                    }
                    objc_msgSend(p_isa[256], "createOutlineTexture");
                  }
                }
                objc_msgSend(p_isa[256], "wireframeTexture");
                v407 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(p_isa, "setObject:forKey:", v407, *MEMORY[0x24BE63658]);

                -[DYMTLDebugWireframeRenderer outlineTexture](v494->_wireframeRenderer, "outlineTexture");
                v408 = (void *)objc_claimAutoreleasedReturnValue();
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v408, *MEMORY[0x24BE63648]);

                -[DYMTLDebugWireframeRenderer solidTexture](v494->_wireframeRenderer, "solidTexture");
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v336, *MEMORY[0x24BE63650]);
                goto LABEL_526;
              case 1:
                if (v564)
                {
                  *((_BYTE *)v30 + 48) = 1;
                  std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                  v494->_lastEncoderID = 0;
                }
                if (v489)
                {
                  -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                  v316 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v316, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v317, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                  v318 = v494;
                }
                else
                {
                  v318 = v494;
                  v533.receiver = v494;
                  v533.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                  -[DYMTLFunctionPlayer executeGraphicsFunction](&v533, sel_executeGraphicsFunction);
                }
                if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v318->super.super.super.super.isa
                                                                                           + v28)) & 1) != 0)
                  v335 = 1;
                else
                  v335 = GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v28));
                v494->_targetFunctionNeedsSeparatedPostVertexDump = v335;
                -[DYMTLDebugWireframeRenderer wireframeTexture](v494->_wireframeRenderer, "wireframeTexture");
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v336, *MEMORY[0x24BE63658]);
                goto LABEL_526;
              case 2:
                v319 = (id *)&v494->super.super.super.super.isa;
                if (-[DYMTLDebugWireframeRenderer createSolidRenderCommandEncoder:commandBufferId:commandEncoderId:parallelEncoderId:](v494->_wireframeRenderer, "createSolidRenderCommandEncoder:commandBufferId:commandEncoderId:parallelEncoderId:", v224, v30[3], (_QWORD)__p, v564))
                {
                  if (v564)
                  {
                    *((_BYTE *)v30 + 48) = 1;
                    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                    v494->_lastEncoderID = 0;
                  }
                  if (v489)
                  {
                    -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                    v320 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                    v321 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v320, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v321, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                    v319 = (id *)&v494->super.super.super.super.isa;
                  }
                  else
                  {
                    v319 = (id *)&v494->super.super.super.super.isa;
                    v532.receiver = v494;
                    v532.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    -[DYMTLFunctionPlayer executeGraphicsFunction](&v532, sel_executeGraphicsFunction);
                  }
                  objc_msgSend(v319[256], "createOutlineTexture");
                }
                objc_msgSend(v319[256], "outlineTexture");
                v386 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v319, "setObject:forKey:", v386, *MEMORY[0x24BE63648]);

                -[DYMTLDebugWireframeRenderer solidTexture](v494->_wireframeRenderer, "solidTexture");
                v336 = (void *)objc_claimAutoreleasedReturnValue();
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v336, *MEMORY[0x24BE63650]);
LABEL_526:

                goto LABEL_527;
              case 3:
                if (!GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v28)))
                  goto LABEL_502;
                -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v31);
                v488 = (void *)objc_claimAutoreleasedReturnValue();
                DYMTLGetAssociatedObject(v488, 2u);
                v322 = (void *)objc_claimAutoreleasedReturnValue();
                v485 = v322;
                if (v322)
                {
                  v530 = 0u;
                  v531 = 0u;
                  v528 = 0u;
                  v529 = 0u;
                  objc_msgSend(v322, "vertexBindings");
                  v323 = (void *)objc_claimAutoreleasedReturnValue();
                  v324 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v528, v569, 16);
                  if (!v324)
                    goto LABEL_403;
                  v325 = *(_QWORD *)v529;
                  while (1)
                  {
                    for (i = 0; i != v324; ++i)
                    {
                      if (*(_QWORD *)v529 != v325)
                        objc_enumerationMutation(v323);
                      v327 = *(void **)(*((_QWORD *)&v528 + 1) + 8 * i);
                      if (objc_msgSend(v327, "access") == 1 && (objc_msgSend(v327, "type") | 2) == 2)
                      {
                        v328 = 1;
                        goto LABEL_472;
                      }
                    }
                    v324 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v528, v569, 16);
                    if (!v324)
                    {
LABEL_403:
                      v328 = 0;
LABEL_472:

                      goto LABEL_477;
                    }
                  }
                }
                v328 = 0;
LABEL_477:
                v494->_targetFunctionNeedsSeparatedPostVertexDump = 0;
                if (!-[DYMTLPostVertexDump createAndSetPostVertexDumpPipelineState:commandEncoderId:pipelineId:](v494->_postVertexDump, "createAndSetPostVertexDumpPipelineState:commandEncoderId:pipelineId:", v30[3], (_QWORD)__p, v31))goto LABEL_501;
                v527.receiver = v494;
                v527.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                -[DYMTLFunctionPlayer executeGraphicsFunction](&v527, sel_executeGraphicsFunction);
                if ((v328 & 1) != 0)
                {
                  v494->_targetFunctionNeedsSeparatedPostVertexDump = 1;

                }
                else
                {
                  -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                  v394 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v394, "setRenderPipelineState:", v488);

LABEL_501:
LABEL_502:
                  if (v489)
                  {
                    -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
                    v395 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
                    v396 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v395, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v396, v559, objc_msgSend(v493, "targetSubCommandIndex"), v489);

                  }
                  else
                  {
                    v526.receiver = v494;
                    v526.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    -[DYMTLFunctionPlayer executeGraphicsFunction](&v526, sel_executeGraphicsFunction);
                  }
                  -[DYMTLCommonDebugFunctionPlayer extractIndirectArgumentBuffers](v494, "extractIndirectArgumentBuffers");
                  -[DYMTLCommonDebugFunctionPlayer extractCommandBufferTranslationData](v494, "extractCommandBufferTranslationData");
                  if (v226)
                    -[DYMTLCommonDebugFunctionPlayer _extractTileMemoryWithRenderPassDescriptor:renderEncoderID:isDrawCall:](v494, "_extractTileMemoryWithRenderPassDescriptor:renderEncoderID:isDrawCall:", v224, (_QWORD)__p, GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa+ v28)));
                }
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", 0, *MEMORY[0x24BE63658]);
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", 0, *MEMORY[0x24BE63648]);
                -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", 0, *MEMORY[0x24BE63650]);
LABEL_527:

                break;
              default:
                goto LABEL_527;
            }
          }
        }
      }
      else if (-[DYFunctionPlayer mainExecutionMode](v494, "mainExecutionMode")
             && (v83 = *(_DWORD *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]),
                 v83 == objc_msgSend(v493, "targetFunctionIndex") - 1)
             && (v84 = (int)*MEMORY[0x24BE39040],
                 GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v84))))
      {
        v85 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v84) + 48, 0);
        *(_QWORD *)&__p = 0;
        v525 = 0;
        -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v525, &__p);
        v86 = v525;
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v85);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v87, (_QWORD)__p, objc_msgSend(v493, "targetSubCommandIndex"), v86);

        -[DYMTLCommonDebugFunctionPlayer extractIndirectArgumentBuffers](v494, "extractIndirectArgumentBuffers");
        -[DYMTLCommonDebugFunctionPlayer extractCommandBufferTranslationData](v494, "extractCommandBufferTranslationData");

      }
      else
      {
        -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v494, "_executeGraphicsFunction");
        if (-[DYFunctionPlayer mainExecutionMode](v494, "mainExecutionMode"))
        {
          v89 = *(_DWORD *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]);
          if (v89 == objc_msgSend(v493, "targetFunctionIndex") - 1)
          {
            if (GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39040])))
            {
              -[DYMTLCommonDebugFunctionPlayer extractIndirectArgumentBuffers](v494, "extractIndirectArgumentBuffers");
              -[DYMTLCommonDebugFunctionPlayer extractCommandBufferTranslationData](v494, "extractCommandBufferTranslationData");
            }
          }
        }
        v12 = -[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v494, "shouldExecuteGraphicsFunction");
LABEL_126:
        if (v12)
LABEL_120:
          -[DYMTLCommonDebugFunctionPlayer _trackObjects](v494, "_trackObjects");
      }
      goto LABEL_331;
    case 6u:
      if (!-[DYFunctionPlayer mainExecutionMode](v2, "mainExecutionMode"))
        goto LABEL_118;
      v59 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]);
      if (v59 != objc_msgSend(v493, "targetFunctionIndex") - 1)
        goto LABEL_118;
      v60 = (int)*MEMORY[0x24BE39040];
      if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                 + v60)) & 1) == 0
        && !GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v60)))
      {
        goto LABEL_118;
      }
      *(_QWORD *)&__p = 0;
      *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v60) + 48, 0);
      v61 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
      v62 = v61;
      if (v61)
      {
        v63 = v61[4];
        v564 = 0;
        v64 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        if (!v64
          || (v564 = v64[3],
              (v62 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564)) != 0))
        {
          v559 = 0;
          if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v60)))
          {
            v524 = 0;
            v65 = -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v524, &v559);
            v66 = v524;
            if (v65)
              v63 = v65;
          }
          else
          {
            v66 = 0;
          }
          -[DYMTLPostVertexDump createAndSetPostVertexDumpPipelineState:commandEncoderId:pipelineId:](v494->_postVertexDump, "createAndSetPostVertexDumpPipelineState:commandEncoderId:pipelineId:", v62[3], (_QWORD)__p, v63);
          if (v66)
          {
            -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v228, v559, objc_msgSend(v493, "targetSubCommandIndex"), v66);

          }
          else
          {
            v523.receiver = v494;
            v523.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
            -[DYMTLFunctionPlayer executeGraphicsFunction](&v523, sel_executeGraphicsFunction);
          }
          v494->_targetFunctionNeedsSeparatedPostVertexDump = 0;

        }
      }
      goto LABEL_331;
    case 7u:
      v21 = (void *)MEMORY[0x242623ED8]();
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v2, "_executeGraphicsFunction");
      -[DYMTLCommonDebugFunctionPlayer _trackObjects](v2, "_trackObjects");
      v22 = (int)*MEMORY[0x24BE39040];
      if (!GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                               + v22)))
        goto LABEL_330;
      v564 = 0;
      v564 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v22) + 48, 0);
      v23 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564);
      if (!v23)
        goto LABEL_330;
      v24 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v23 + 3);
      if (!v24)
        goto LABEL_330;
      v559 = 0;
      v25 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564);
      if (v25)
      {
        v559 = v25[3];
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v559);
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v559);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v564);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v470 = v26;
      v457 = v157;
      contexta = v21;
      if (!objc_msgSend(v157, "conformsToProtocol:", &unk_256BDCFE8))
        goto LABEL_329;
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v24[3]);
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = v24[2];
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v158);
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "descriptor");
      v491 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        DYMTLGetAssociatedObject(v26, 0);
        v159 = objc_claimAutoreleasedReturnValue();

        v491 = (void *)v159;
      }
      objc_msgSend(v451, "commandBuffer");
      v160 = 0;
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(v491, "colorAttachments");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "objectAtIndexedSubscript:", v160);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v163);

        objc_msgSend(v491, "colorAttachments");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "objectAtIndexedSubscript:", v160);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "setResolveTexture:", 0);

        objc_msgSend(v491, "colorAttachments");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "objectAtIndexedSubscript:", v160);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "setLoadAction:", 1);

        objc_msgSend(v491, "colorAttachments");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "objectAtIndexedSubscript:", v160);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend(v169, "storeAction") == 4;

        if (!v170)
        {
          objc_msgSend(v491, "colorAttachments");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "objectAtIndexedSubscript:", v160);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "setStoreAction:", 1);

        }
        ++v160;
      }
      while (v160 != 8);
      objc_msgSend(v491, "depthAttachment");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v173);

      objc_msgSend(v491, "depthAttachment");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setResolveTexture:", 0);

      objc_msgSend(v491, "depthAttachment");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "setLoadAction:", 1);

      objc_msgSend(v491, "depthAttachment");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = objc_msgSend(v176, "storeAction") == 4;

      if (!v177)
      {
        objc_msgSend(v491, "depthAttachment");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "setStoreAction:", 1);

      }
      objc_msgSend(v491, "stencilAttachment");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v179);

      objc_msgSend(v491, "stencilAttachment");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "setResolveTexture:", 0);

      objc_msgSend(v491, "stencilAttachment");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setLoadAction:", 1);

      objc_msgSend(v491, "stencilAttachment");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = objc_msgSend(v182, "storeAction") == 4;

      if (!v183)
      {
        objc_msgSend(v491, "stencilAttachment");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "setStoreAction:", 1);

      }
      objc_msgSend(v491, "stencilAttachment");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setStencilResolveFilter:", 0);

      if (v26)
      {
        DYMTLNewStatefulParallelRenderCommandEncoder(v161, v491);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLNewStatefulRenderCommandEncoder(v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer encodeStoreActionForParallelRenderCommandEncoder:withDescriptor:](v494, "encodeStoreActionForParallelRenderCommandEncoder:withDescriptor:", v186, v491);
      }
      else
      {
        DYMTLNewStatefulRenderCommandEncoder(v161, v491);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer encodeStoreActionForRenderCommandEncoder:withDescriptor:](v494, "encodeStoreActionForRenderCommandEncoder:withDescriptor:", v187, v491);
        v186 = 0;
      }
      v558[0] = MEMORY[0x24BDAC760];
      v558[1] = 3221225472;
      v558[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke;
      v558[3] = &unk_250D6F1B0;
      v558[4] = v494;
      objc_msgSend(v457, "applyAllStateToEncoder:rawBytesBlock:", v187, v558);
      -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v161, v158);
      -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v187, v564);
      if (v26)
        -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v186, v559);

      objc_msgSend(v457, "endEncoding");
      if (v26)
        objc_msgSend(v26, "endEncoding");
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_303;
      objc_msgSend(v493, "playbackOptions");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      if (v229 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v230 = v229;
        objc_msgSend(v230, "objectForKeyedSubscript:", *MEMORY[0x24BE39708]);
        v231 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        GPUTraceResourceResolutionDecode(v231, (uint64_t)&__p);
        v464 = *((_QWORD *)&__p + 1);
        v466 = __p;
        v461 = v562;

        objc_msgSend(v230, "objectForKeyedSubscript:", *MEMORY[0x24BE39728]);
        v452 = (void *)objc_claimAutoreleasedReturnValue();

        if (v452)
          goto LABEL_307;
      }
      else
      {

LABEL_303:
        v466 = 512;
        v464 = 128;
        v461 = 32;
      }
      v232 = (void *)objc_opt_new();
      v233 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Color.%u"), v233);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "addObject:", v234);

        v233 = (v233 + 1);
      }
      while ((_DWORD)v233 != 8);
      objc_msgSend(v232, "addObject:", CFSTR("Depth."));
      objc_msgSend(v232, "addObject:", CFSTR("Stencil."));
      objc_msgSend(v232, "addObject:", CFSTR("First"));
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v232);
      v452 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_307:
      v459 = objc_msgSend(v452, "containsObject:", CFSTR("All"));
      v556 = 0u;
      v557 = 0u;
      v554 = 0u;
      v555 = 0u;
      obja = v452;
      v235 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v554, v570, 16);
      if (v235)
      {
        v236 = 0;
        v237 = 0;
        v484 = *(_QWORD *)v555;
        v487 = v235;
        while (1)
        {
          for (j = 0; j != v487; ++j)
          {
            if (*(_QWORD *)v555 != v484)
              objc_enumerationMutation(obja);
            v239 = *(void **)(*((_QWORD *)&v554 + 1) + 8 * j);
            if (objc_msgSend(v239, "hasPrefix:", CFSTR("Color.")))
            {
              v240 = v239;
              v241 = objc_msgSend(CFSTR("Color."), "length");
              objc_msgSend(v240, "substringWithRange:", v241, objc_msgSend(v240, "length") - v241);
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              v243 = objc_msgSend(v242, "integerValue");

              if ((v243 & 0xFFFFFFF8) != 0)
                continue;
              objc_msgSend(v491, "colorAttachments");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v244, "objectAtIndexedSubscript:", v243);
              v245 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v245, "texture");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              v247 = 1;
            }
            else if (objc_msgSend(v239, "isEqualToString:", CFSTR("Depth.")))
            {
              objc_msgSend(v491, "depthAttachment");
              v245 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v245, "texture");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              v247 = 2;
            }
            else
            {
              if (!objc_msgSend(v239, "isEqualToString:", CFSTR("Stencil.")))
                continue;
              objc_msgSend(v491, "stencilAttachment");
              v245 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v245, "texture");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              v247 = 4;
            }
            v236 = v245;

            if (v246 && v245)
            {
              v478 = v245;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]));
              v248 = (void *)objc_claimAutoreleasedReturnValue();
              v249 = (void *)MEMORY[0x24BE63580];
              -[DYMTLFunctionPlayer device](v494, "device");
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v249, "forDevice:", v250);
              v251 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v250) = v247;
              v553[0] = v466;
              v553[1] = v464;
              v553[2] = v461;
              v252 = objc_msgSend(v236, "level");
              v253 = objc_msgSend(v236, "slice");
              v254 = objc_msgSend(v236, "depthPlane");
              v549[0] = MEMORY[0x24BDAC760];
              v549[1] = 3221225472;
              v549[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_2;
              v549[3] = &unk_250D6F880;
              v549[4] = v494;
              v255 = v248;
              v550 = v255;
              v551 = v246;
              v552 = v239;
              LODWORD(v436) = (_DWORD)v250;
              v237 = v551;
              objc_msgSend(v251, "resizeTexture:resolution:level:slice:depthPlane:inBuffer:withType:completion:", v551, v553, v252, v253, v254, v474, v436, v549);

              v26 = v470;
              v236 = v478;

              if ((v459 & 1) == 0)
                goto LABEL_328;
            }
            else
            {
              v237 = v246;
            }
          }
          v487 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v554, v570, 16);
          if (!v487)
            goto LABEL_328;
        }
      }
      v236 = 0;
      v237 = 0;
LABEL_328:

      objc_msgSend(v474, "commit");
      v157 = v457;
LABEL_329:

      v21 = contexta;
LABEL_330:
      objc_autoreleasePoolPop(v21);
      goto LABEL_331;
    case 8u:
      if (!-[DYFunctionPlayer mainExecutionMode](v2, "mainExecutionMode")
        || (v67 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]),
            v67 != objc_msgSend(v493, "targetFunctionIndex") - 1))
      {
LABEL_118:
        -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v494, "_executeGraphicsFunction");
        v12 = -[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v494, "shouldExecuteGraphicsFunction");
        goto LABEL_126;
      }
      *(_QWORD *)&__p = 0;
      v68 = (int)*MEMORY[0x24BE39040];
      *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v68) + 48, 0);
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p))goto LABEL_331;
      -[DYFunctionPlayer engine](v494, "engine");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "playbackOptions");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v564 = 0;
      if (GPUTools::MTL::IsFuncEnumIndirectExecuteCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v68)))
      {
        v519 = 0;
        -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v494, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", objc_msgSend(v493, "targetSubCommandIndex"), &v519, &v564);
        v71 = v519;
      }
      else
      {
        v71 = 0;
      }
      -[DYMTLShaderDebuggerTraceGenerator prepareCommandEncoderForInstrumentedCall:generationOptions:](v494->_shaderDebuggerTraceGenerator, "prepareCommandEncoderForInstrumentedCall:generationOptions:", (_QWORD)__p, v70);
      if (!v71)
      {
        -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v494, "_executeGraphicsFunction");
        goto LABEL_283;
      }
      if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v68)))
      {
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v155, v564, objc_msgSend(v493, "targetSubCommandIndex"), v71);
      }
      else
      {
        if (!GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v68)))
          goto LABEL_283;
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLFunctionPlayer indirectCommandManager](v494, "indirectCommandManager");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v155, v564, objc_msgSend(v493, "targetSubCommandIndex"), v71);
      }

LABEL_283:
      if (-[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v494, "shouldExecuteGraphicsFunction"))
        -[DYMTLCommonDebugFunctionPlayer _trackObjects](v494, "_trackObjects");

      goto LABEL_331;
    case 9u:
      -[DYMTLCommonDebugFunctionPlayer _splitCommandEncoders](v2, "_splitCommandEncoders");
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v2, "_executeGraphicsFunction");
      v12 = -[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v2, "shouldExecuteGraphicsFunction");
      goto LABEL_126;
    case 0xAu:
      v13 = (int)*MEMORY[0x24BE39040];
      v14 = *(int **)((char *)&v2->super.super.super.super.isa + v13);
      v15 = *v14;
      if (*v14 <= -16163)
      {
        switch(v15)
        {
          case -16351:
            -[DYFunctionPlayer processArguments](v2, "processArguments");
            v2->_parallelEncoderCommandBufferID = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v13) + 48, 0);
            v188 = (char *)v2 + (int)*MEMORY[0x24BE39008];
            GPUTools::MTL::MakeMTLRenderPassDescriptor(**((_QWORD **)v188 + 1), (uint64_t)-[DYMTLFunctionPlayer objectMap](v2, "objectMap"));
            v189 = objc_claimAutoreleasedReturnValue();
            dependencyGraphParallelDescriptor = v2->_dependencyGraphParallelDescriptor;
            v2->_dependencyGraphParallelDescriptor = (MTLRenderPassDescriptor *)v189;

            GPUTools::MTL::Utils::MakeDYMTLRenderPassDescriptor(**((GPUTools::MTL::Utils ***)v188 + 1), &v2->_dependencyGraphDYMTLParallelDescriptor, v191);
            goto LABEL_335;
          case -16286:
            for (k = 0; k != 8; ++k)
            {
              -[MTLRenderPassDescriptor colorAttachments](v494->_dependencyGraphParallelDescriptor, "colorAttachments");
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v193, "objectAtIndexedSubscript:", k);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v194);

              -[MTLRenderPassDescriptor colorAttachments](v494->_dependencyGraphParallelDescriptor, "colorAttachments");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "objectAtIndexedSubscript:", k);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v196, "resolveTexture");
              v197 = (void *)objc_claimAutoreleasedReturnValue();

              -[MTLRenderPassDescriptor colorAttachments](v494->_dependencyGraphParallelDescriptor, "colorAttachments");
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v198, "objectAtIndexedSubscript:", k);
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              if (v197)
                objc_msgSend(v199, "setStoreAction:", 3);
              else
                objc_msgSend(v199, "setStoreAction:", 1);

            }
            -[MTLRenderPassDescriptor depthAttachment](v494->_dependencyGraphParallelDescriptor, "depthAttachment");
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v200);

            -[MTLRenderPassDescriptor depthAttachment](v494->_dependencyGraphParallelDescriptor, "depthAttachment");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "resolveTexture");
            v202 = (void *)objc_claimAutoreleasedReturnValue();

            -[MTLRenderPassDescriptor depthAttachment](v494->_dependencyGraphParallelDescriptor, "depthAttachment");
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            if (v202)
              objc_msgSend(v203, "setStoreAction:", 3);
            else
              objc_msgSend(v203, "setStoreAction:", 1);

            -[MTLRenderPassDescriptor stencilAttachment](v494->_dependencyGraphParallelDescriptor, "stencilAttachment");
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v257);

            -[MTLRenderPassDescriptor stencilAttachment](v494->_dependencyGraphParallelDescriptor, "stencilAttachment");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v258, "resolveTexture");
            v259 = (void *)objc_claimAutoreleasedReturnValue();

            -[MTLRenderPassDescriptor stencilAttachment](v494->_dependencyGraphParallelDescriptor, "stencilAttachment");
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            if (v259)
              objc_msgSend(v260, "setStoreAction:", 3);
            else
              objc_msgSend(v260, "setStoreAction:", 1);

            -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v494->_parallelEncoderCommandBufferID);
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "renderCommandEncoderWithDescriptor:", v494->_dependencyGraphParallelDescriptor);
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            v564 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v13) + 24, 0);
            -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v262, v564);
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564);
            __p = v494->_parallelEncoderCommandBufferID;
            v562 = v564;
            v563 = 0;
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&v494->_encoderMap, &v564, &v564, &__p);
            -[DYMTLCommonDebugFunctionPlayer _addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:forEncoder:](v494, "_addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:forEncoder:", &v494->_dependencyGraphDYMTLParallelDescriptor, v564);
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564);

            goto LABEL_335;
          case -16285:
            currentParallelDescriptor = v2->_currentParallelDescriptor;
            v2->_currentParallelDescriptor = 0;

            v2->_currentParallelId = 0;
            v2->_parallelEncoderCommandBufferID = 0;
            v138 = v2->_dependencyGraphParallelDescriptor;
            v2->_dependencyGraphParallelDescriptor = 0;

            goto LABEL_335;
        }
      }
      else
      {
        if ((v15 + 16162) <= 0xA && ((1 << (v15 + 34)) & 0x73F) != 0)
          goto LABEL_335;
        if (v15 == -15789)
        {
          if (!v2->_sparseTextureFence)
          {
            -[DYMTLFunctionPlayer device](v2, "device");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "newFence");
            sparseTextureFence = v494->_sparseTextureFence;
            v494->_sparseTextureFence = (MTLFence *)v18;

            v14 = *(int **)((char *)&v494->super.super.super.super.isa + v13);
          }
          -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v14 + 12), 0));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "updateFence:", v494->_sparseTextureFence);

        }
      }
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v494, "_executeGraphicsFunction");
      -[DYMTLCommonDebugFunctionPlayer _trackObjects](v494, "_trackObjects");
      v139 = *(unsigned int **)((char *)&v494->super.super.super.super.isa + v13);
      v140 = (GPUTools::MTL *)*v139;
      if ((_DWORD)v140 == -16376 || (_DWORD)v140 == -15789 || (_DWORD)v140 == -16246)
      {
        *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v139 + 12), 0);
        v143 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        v144 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v143 + 3);
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v144[3]);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v144[2];
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "commit");
        objc_msgSend(v147, "waitUntilCompleted");
        objc_msgSend(v145, "commandBuffer");
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v148, v146);
        v139 = *(unsigned int **)((char *)&v494->super.super.super.super.isa + v13);
        v140 = (GPUTools::MTL *)*v139;
      }
      if ((_DWORD)v140 == -16361)
      {
        -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v139 + 12), 0));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "waitUntilCompleted");

      }
      else if (GPUTools::MTL::IsFuncEnumEndEncoding(v140))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v493, "playbackOptions");
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          if (v204 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v205 = v204;
            objc_msgSend(v205, "objectForKeyedSubscript:", *MEMORY[0x24BE39730]);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            v207 = objc_msgSend(v206, "BOOLValue");

            objc_msgSend(v205, "objectForKeyedSubscript:", *MEMORY[0x24BE39340]);
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            v209 = *MEMORY[0x24BE39708];
            objc_msgSend(v205, "objectForKeyedSubscript:", *MEMORY[0x24BE39708]);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            v211 = v210 == 0;

            if (v211)
            {
              v215 = 16;
              v213 = 256;
              v214 = 128;
            }
            else
            {
              objc_msgSend(v205, "objectForKeyedSubscript:", v209);
              v212 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              GPUTraceResourceResolutionDecode(v212, (uint64_t)&__p);
              v213 = *((_QWORD *)&__p + 1);
              v214 = __p;
              v215 = v562;

            }
          }
          else
          {
            v208 = 0;
            v207 = 0;
            v215 = 16;
            v213 = 256;
            v214 = 128;
          }

        }
        else
        {
          v208 = 0;
          v207 = 0;
          v215 = 16;
          v213 = 256;
          v214 = 128;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]));
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "objectForKey:", v397);
        v398 = (void *)objc_claimAutoreleasedReturnValue();
        if (v398)
          v399 = v207;
        else
          v399 = 0;
        if ((v399 & 1) != 0)
        {
          *(_QWORD *)&__p = 0;
          *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v494->super.super.super.super.isa + v13) + 48, 0);
          v400 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
          if (v400)
          {
            v401 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v400 + 3);
            if (v401)
            {
              v564 = 0;
              v402 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
              if (v402)
              {
                v564 = v402[3];
                std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v564);
                -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v564);
                v403 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v403 = 0;
              }
              -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v401[2]);
              v404 = (void *)objc_claimAutoreleasedReturnValue();
              v405 = (void *)MEMORY[0x242623ED8]();
              v560[0] = v214;
              v560[1] = v213;
              v560[2] = v215;
              -[DYMTLCommonDebugFunctionPlayer _generateThumbnailAndResourceInfoForRequestedTextures:resolution:commandBuffer:](v494, "_generateThumbnailAndResourceInfoForRequestedTextures:resolution:commandBuffer:", v398, v560, v404);
              v406 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v494->_dependencyGraphThumbnails, "setObject:forKey:", v406, v397);

              objc_autoreleasePoolPop(v405);
            }
          }
        }

      }
      goto LABEL_331;
    case 0xDu:
      v35 = (void *)MEMORY[0x242623ED8]();
      v456 = (int)*MEMORY[0x24BE39040];
      v36 = **(_DWORD **)((char *)&v2->super.super.super.super.isa + v456) + 16162;
      if (v36 < 0xB && ((0x73Fu >> v36) & 1) != 0)
      {
        v49 = 1;
        goto LABEL_221;
      }
      context = v35;
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v2, "_executeGraphicsFunction");
      -[DYMTLCommonDebugFunctionPlayer _trackObjects](v2, "_trackObjects");
      *(_QWORD *)&__p = 0;
      *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v456) + 48, 0);
      v37 = *(Class *)((char *)&v2->super.super.super.super.isa + v456);
      if (*v37 == -16353)
        *(_QWORD *)&__p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v37 + 6), 0);
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_148;
      objc_msgSend(v493, "playbackOptions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v39 = v38;
        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE396B0]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "unsignedLongLongValue");

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE396A0]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v483 = objc_msgSend(v42, "unsignedLongLongValue");

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE396A8]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        obj = (id)objc_msgSend(v43, "unsignedLongLongValue");

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE39698]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v460 = objc_msgSend(v44, "unsignedLongLongValue") != 0;

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE39690]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v465 = objc_msgSend(v45, "unsignedLongLongValue") != 0;

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE39688]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "unsignedLongLongValue");

        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE396B8]);
        v486 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = __p;
        if (v41 && (_QWORD)__p != v41)
        {
          v49 = 2;
          goto LABEL_220;
        }
        v104 = v47 != 0;
      }
      else
      {

LABEL_148:
        v104 = 0;
        v465 = 0;
        v460 = 0;
        v483 = 0;
        v486 = 0;
        obj = 0;
        v48 = __p;
      }
      pixelHistoryEncoderStateTrackings = v494->_pixelHistoryEncoderStateTrackings;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v48);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](pixelHistoryEncoderStateTrackings, "objectForKeyedSubscript:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v107)
      {
        v469 = v107;
        v108 = objc_msgSend(v107, "encoderFunctionIndex");
        -[NSMutableDictionary objectForKeyedSubscript:](v494->_pixelHistory, "objectForKeyedSubscript:", *MEMORY[0x24BE39610]);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v108);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "objectForKeyedSubscript:", v110);
        v458 = (void *)objc_claimAutoreleasedReturnValue();

        v111 = (GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v456);
        if ((_DWORD)v111 != -16353)
        {
          if (!v458)
          {
            v458 = 0;
LABEL_217:
            v49 = 2;
            v463 = v469;
            goto LABEL_218;
          }
          if ((GPUTools::MTL::IsFuncEnumDrawCall(v111) & 1) == 0)
          {
            if (!v465)
              goto LABEL_217;
            v112 = **(_DWORD **)((char *)&v494->super.super.super.super.isa + v456);
            if (!IsFuncEnumPixelHistoryInterestingRenderPassStateItems(v112) && v112 != -16246)
              goto LABEL_217;
          }
        }
      }
      else
      {
        if (**(_DWORD **)((char *)&v494->super.super.super.super.isa + v456) != -16353)
        {
          v49 = 2;
          v463 = 0;

          goto LABEL_219;
        }
        v469 = 0;
        v458 = 0;
      }
      v113 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
      if (!v113)
        goto LABEL_217;
      v114 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v113 + 5);
      if (!v114)
        goto LABEL_217;
      v447 = v114;
      v115 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v494->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v113 + 3);
      if (!v115)
        goto LABEL_217;
      v440 = v104;
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", (_QWORD)__p);
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:", v115[3]);
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = v115[2];
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:");
      v449 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v450, "descriptor");
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      v438 = v113[4];
      -[DYMTLFunctionPlayer objectForKey:](v494, "objectForKey:");
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      if (**(_DWORD **)((char *)&v494->super.super.super.super.isa + v456) == -16353)
      {
        v473 = (void *)objc_opt_new();
        v116 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Color.%u"), v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v473, "addObject:", v117);

          v116 = (v116 + 1);
        }
        while ((_DWORD)v116 != 8);
        objc_msgSend(v473, "addObject:", CFSTR("Depth."));
        objc_msgSend(v473, "addObject:", CFSTR("Stencil."));
        v477 = (id)objc_opt_new();
        v517 = 0u;
        v518 = 0u;
        v515 = 0u;
        v516 = 0u;
        v118 = v473;
        v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v515, v568, 16);
        if (v119)
        {
          v120 = *(_QWORD *)v516;
          do
          {
            for (m = 0; m != v119; ++m)
            {
              if (*(_QWORD *)v516 != v120)
                objc_enumerationMutation(v118);
              v122 = *(void **)(*((_QWORD *)&v515 + 1) + 8 * m);
              if (!objc_msgSend(v122, "hasPrefix:", CFSTR("Color.")))
              {
                if (objc_msgSend(v122, "isEqualToString:", CFSTR("Depth.")))
                {
                  objc_msgSend(v490, "depthAttachment");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "texture");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  v127 = CFSTR("Depth");
                  if (!v126)
                    goto LABEL_185;
                }
                else
                {
                  if (!objc_msgSend(v122, "isEqualToString:", CFSTR("Stencil.")))
                  {
LABEL_184:
                    v126 = 0;
                    v125 = 0;
                    v127 = 0;
                    goto LABEL_185;
                  }
                  objc_msgSend(v490, "stencilAttachment");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "texture");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  v127 = CFSTR("Stencil");
                  if (!v126)
                    goto LABEL_185;
                }
LABEL_179:
                if (v125)
                {
                  v128 = -[DYMTLFunctionPlayer keyForOriginalObject:inverseObjectMap:](v494, "keyForOriginalObject:inverseObjectMap:", v126, &v494->_pixelHistoryInverseObjectMap);
                  if (!v486
                    || (v129 = v128, !objc_msgSend(v486, "count"))
                    || (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v129),
                        v130 = (void *)objc_claimAutoreleasedReturnValue(),
                        v131 = objc_msgSend(v486, "containsObject:", v130),
                        v130,
                        (v131 & 1) != 0))
                  {
                    objc_msgSend(v477, "setObject:forKeyedSubscript:", v125, v127);
                  }
                }
                goto LABEL_185;
              }
              Index = GPUThumbnailOptionsColorGetIndex((NSString *)v122);
              if (Index >= 8)
                goto LABEL_184;
              objc_msgSend(v490, "colorAttachments");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "objectAtIndexedSubscript:", Index);
              v125 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v125, "texture");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Color %i"), Index);
              v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v126)
                goto LABEL_179;
LABEL_185:

            }
            v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v515, v568, 16);
          }
          while (v119);
        }

        v132 = (void *)objc_opt_new();
        v133 = v494->_pixelHistoryEncoderStateTrackings;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (_QWORD)__p);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v133, "setObject:forKeyedSubscript:", v132, v134);

        objc_msgSend(v132, "setEncoderFunctionIndex:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]));
        objc_msgSend(v132, "setFilteredGenerationOptions:", v477);
        v135 = (void *)objc_opt_new();
        objc_msgSend(v132, "setEncoderStateFunctionIndexes:", v135);

        v136 = v132;
      }
      else
      {
        v136 = v469;
      }
      v463 = v136;
      objc_msgSend(v136, "filteredGenerationOptions");
      v446 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = objc_msgSend(v446, "count");
      v218 = v465;
      if (!v458)
        v218 = 0;
      if (v218)
      {
        v219 = **(_DWORD **)((char *)&v494->super.super.super.super.isa + v456);
        if (IsFuncEnumPixelHistoryInterestingRenderPassStateItems(v219))
        {
          v220 = objc_opt_new();
          v221 = **(unsigned int **)((char *)&v494->super.super.super.super.isa + v456);
          switch((_DWORD)v221)
          {
            case 0xFFFFC072:
              v221 = 4294951219;
              break;
            case 0xFFFFC077:
              v221 = 4294951220;
              break;
            case 0xFFFFC083:
              v221 = 4294951077;
              break;
          }
          v445 = (void *)v220;
          objc_msgSend(v463, "encoderStateFunctionIndexes");
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v221);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v337, "objectForKeyedSubscript:", v338);
          v443 = (void *)objc_claimAutoreleasedReturnValue();

          if (v443)
          {
            v339 = v445;
            v340 = objc_msgSend(v443, "unsignedLongValue");
            v341 = objc_msgSend(v463, "lastInterestingFunctionIndex");
            v342 = *MEMORY[0x24BE395E8];
            if (v340 <= v341)
            {
LABEL_434:
              objc_msgSend(v458, "objectForKeyedSubscript:", v342);
              v344 = (void *)objc_claimAutoreleasedReturnValue();
              v345 = (int)*MEMORY[0x24BE39020];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + v345));
              v346 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v344, "setObject:forKeyedSubscript:", v339, v346);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + v345));
              v347 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v463, "encoderStateFunctionIndexes");
              v453 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v221);
              v348 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v453, "setObject:forKeyedSubscript:", v347, v348);
              v439 = (void *)v347;
LABEL_573:

              v265 = v445;
LABEL_574:

              goto LABEL_575;
            }
            objc_msgSend(v458, "objectForKeyedSubscript:", *MEMORY[0x24BE395E8]);
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v343, "removeObjectForKey:", v443);

          }
          else
          {
            v342 = *MEMORY[0x24BE395E8];
          }
          v339 = v445;
          goto LABEL_434;
        }
        if (v219 == -16246)
        {
          v513 = 0u;
          v514 = 0u;
          v511 = 0u;
          v512 = 0u;
          objc_msgSend(v463, "encoderStateFunctionIndexes");
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v263, "allKeys");
          v264 = (void *)objc_claimAutoreleasedReturnValue();

          v265 = v264;
          v266 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v511, v567, 16);
          if (v266)
          {
            v267 = *(_QWORD *)v512;
            v268 = *MEMORY[0x24BE395E8];
            do
            {
              for (n = 0; n != v266; ++n)
              {
                if (*(_QWORD *)v512 != v267)
                  objc_enumerationMutation(v264);
                v270 = *(_QWORD *)(*((_QWORD *)&v511 + 1) + 8 * n);
                objc_msgSend(v463, "encoderStateFunctionIndexes");
                v271 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v271, "objectForKeyedSubscript:", v270);
                v272 = (void *)objc_claimAutoreleasedReturnValue();

                v273 = objc_msgSend(v272, "unsignedLongValue");
                if (v273 > objc_msgSend(v463, "lastInterestingFunctionIndex"))
                {
                  objc_msgSend(v458, "objectForKeyedSubscript:", v268);
                  v274 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v274, "removeObjectForKey:", v272);

                }
              }
              v265 = v264;
              v266 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v511, v567, 16);
            }
            while (v266);
          }
          goto LABEL_574;
        }
      }
      if (v217)
      {
        if (**(_DWORD **)((char *)&v494->super.super.super.super.isa + v456) == -16353)
        {
          v275 = (void *)objc_opt_new();

          -[NSMutableDictionary objectForKeyedSubscript:](v494->_pixelHistory, "objectForKeyedSubscript:", *MEMORY[0x24BE39610]);
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + (int)*MEMORY[0x24BE39020]));
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "setObject:forKeyedSubscript:", v275, v277);

          v278 = (void *)objc_opt_new();
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v278, *MEMORY[0x24BE395E8]);

          v279 = (void *)objc_opt_new();
          v475 = *MEMORY[0x24BE395F8];
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v279);

          v280 = (void *)objc_opt_new();
          v471 = *MEMORY[0x24BE39608];
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v280);

          v281 = (void *)objc_opt_new();
          v467 = *MEMORY[0x24BE39600];
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v281);

          v509 = 0u;
          v510 = 0u;
          v507 = 0u;
          v508 = 0u;
          v479 = v446;
          v282 = objc_msgSend(v479, "countByEnumeratingWithState:objects:count:", &v507, v566, 16);
          if (v282)
          {
            v283 = *(_QWORD *)v508;
            do
            {
              for (ii = 0; ii != v282; ++ii)
              {
                if (*(_QWORD *)v508 != v283)
                  objc_enumerationMutation(v479);
                v285 = *(_QWORD *)(*((_QWORD *)&v507 + 1) + 8 * ii);
                objc_msgSend(v479, "objectForKeyedSubscript:", v285);
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v286, "texture");
                v287 = (void *)objc_claimAutoreleasedReturnValue();
                v288 = -[DYMTLFunctionPlayer keyForOriginalObject:inverseObjectMap:](v494, "keyForOriginalObject:inverseObjectMap:", v287, &v494->_pixelHistoryInverseObjectMap);
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v290 = CFSTR("Color");
                if ((isKindOfClass & 1) == 0)
                {
                  objc_opt_class();
                  v291 = objc_opt_isKindOfClass();
                  v290 = CFSTR("Depth");
                  if ((v291 & 1) == 0)
                  {
                    objc_opt_class();
                    v292 = objc_opt_isKindOfClass();
                    v290 = CFSTR("Stencil");
                    if ((v292 & 1) == 0)
                      v290 = 0;
                  }
                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%llu"), v290, v288);
                v293 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v286, "loadAction"));
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v275, "objectForKeyedSubscript:", v475);
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v295, "setObject:forKeyedSubscript:", v294, v293);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v286, "storeAction"));
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v275, "objectForKeyedSubscript:", v471);
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v297, "setObject:forKeyedSubscript:", v296, v293);

                objc_msgSend(v275, "objectForKeyedSubscript:", v467);
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v298, "setObject:forKeyedSubscript:", v285, v293);

              }
              v282 = objc_msgSend(v479, "countByEnumeratingWithState:objects:count:", &v507, v566, 16);
            }
            while (v282);
          }

          v458 = v275;
        }
        objc_msgSend(v448, "commandBuffer");
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        v442 = (int)*MEMORY[0x24BE39020];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dt.gputrace-replayer.pixel-history-contd-after-%u"), *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        v445 = v299;
        objc_msgSend(v299, "setLabel:", v300);

        for (jj = 0; jj != 8; ++jj)
        {
          objc_msgSend(v490, "colorAttachments");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v302, "objectAtIndexedSubscript:", jj);
          v303 = (void *)objc_claimAutoreleasedReturnValue();

          -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v303);
          objc_msgSend(v303, "setResolveTexture:", 0);
          objc_msgSend(v303, "setLoadAction:", 1);
          if (objc_msgSend(v303, "storeAction") != 4)
            objc_msgSend(v303, "setStoreAction:", 1);

        }
        objc_msgSend(v490, "depthAttachment");
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v304);
        objc_msgSend(v304, "setResolveTexture:", 0);
        objc_msgSend(v304, "setLoadAction:", 1);
        if (objc_msgSend(v304, "storeAction") != 4)
          objc_msgSend(v304, "setStoreAction:", 1);

        objc_msgSend(v490, "stencilAttachment");
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](v494, "_updateMemorylessTextures:", v305);
        objc_msgSend(v305, "setResolveTexture:", 0);
        objc_msgSend(v305, "setLoadAction:", 1);
        if (objc_msgSend(v305, "storeAction") != 4)
          objc_msgSend(v305, "setStoreAction:", 1);

        DYMTLNewStatefulRenderCommandEncoder(v445, v490);
        v306 = objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer encodeStoreActionForRenderCommandEncoder:withDescriptor:](v494, "encodeStoreActionForRenderCommandEncoder:withDescriptor:", v306, v490);
        v506[0] = MEMORY[0x24BDAC760];
        v506[1] = 3221225472;
        v506[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_4;
        v506[3] = &unk_250D6F1B0;
        v506[4] = v494;
        objc_msgSend(v450, "applyAllStateToEncoder:rawBytesBlock:", v306, v506);
        objc_msgSend(v450, "endEncoding");
        objc_msgSend(v449, "commit");
        objc_msgSend(v449, "waitUntilCompleted");
        v307 = (void *)MEMORY[0x24BE63580];
        -[DYMTLFunctionPlayer device](v494, "device");
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v443 = (void *)v306;
        objc_msgSend(v307, "forDevice:", v308);
        v439 = (void *)objc_claimAutoreleasedReturnValue();

        v453 = (void *)objc_opt_new();
        v309 = v447;
        v476 = (void *)objc_opt_new();
        objc_msgSend(v453, "setObject:forKeyedSubscript:");
        v311 = (GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa + v456);
        if ((_DWORD)v311 != -16353 && GPUTools::MTL::IsFuncEnumDrawCall(v311))
        {
          if (-[DYMTLDebugWireframeRenderer currentRenderPipelineHasBufferOrTextureReadWrite:](v494->_wireframeRenderer, "currentRenderPipelineHasBufferOrTextureReadWrite:", (_QWORD)__p))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v453, "setObject:forKeyedSubscript:", v312, *MEMORY[0x24BE39618]);

          }
          else
          {
            objc_msgSend(v448, "commandBuffer");
            v349 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dt.gputrace-replayer.pixel-history-total-draws-%u"), *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v349, "setLabel:", v350);

            -[DYMTLPixelHistoryDrawStatsSupport prepareWithCommandEncoderId:parallelEncoderId:pipelineId:renderPassDescriptor:](v494->_pixelHistoryDrawStatsRenderer, "prepareWithCommandEncoderId:parallelEncoderId:pipelineId:renderPassDescriptor:", (_QWORD)__p, 0, v438, v447 + 3);
            v505[0] = MEMORY[0x24BDAC760];
            v505[1] = 3221225472;
            v505[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_5;
            v505[3] = &unk_250D6F8D0;
            v505[4] = v494;
            -[DYMTLCommonDebugFunctionPlayer collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:](v494, "collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:", v349, v444, v483, obj, v505);
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v349, "commit");
            objc_msgSend(v349, "waitUntilCompleted");
            objc_msgSend(v453, "addEntriesFromDictionary:", v351);

            v449 = v349;
          }
          v309 = v447;
        }
        if (**(_DWORD **)((char *)&v494->super.super.super.super.isa + v456) != -16353)
        {
          objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39618]);
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          v353 = objc_msgSend(v352, "longLongValue") == 0;

          v310 = v445;
          v348 = v476;
          v309 = v447;
          if (v460 && v353)
            goto LABEL_572;
        }
        v468 = *((unsigned __int8 *)v309 + 1616);
        objc_msgSend(v448, "commandBuffer", v310);
        v480 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dt.gputrace-replayer.pixel-history-blits-n-additional-stats-%u"), *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
        v354 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v480, "setLabel:", v354);

        -[NSMutableDictionary objectForKeyedSubscript:](v494->_pixelHistory, "objectForKeyedSubscript:", *MEMORY[0x24BE39670]);
        v472 = (void *)objc_claimAutoreleasedReturnValue();
        v503 = 0u;
        v504 = 0u;
        v501 = 0u;
        v502 = 0u;
        objc_msgSend(v446, "allValues");
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        v462 = v355;
        v356 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v501, v565, 16);
        if (v356)
        {
          v357 = *(_QWORD *)v502;
          do
          {
            for (kk = 0; kk != v356; ++kk)
            {
              if (*(_QWORD *)v502 != v357)
                objc_enumerationMutation(v462);
              v359 = *(void **)(*((_QWORD *)&v501 + 1) + 8 * kk);
              objc_msgSend(v359, "texture");
              v360 = (void *)objc_claimAutoreleasedReturnValue();
              v361 = -[DYMTLFunctionPlayer keyForOriginalObject:inverseObjectMap:](v494, "keyForOriginalObject:inverseObjectMap:", v360, &v494->_pixelHistoryInverseObjectMap);
              v362 = (void *)MEMORY[0x24BE63578];
              v363 = objc_msgSend(v359, "level");
              v364 = objc_msgSend(v359, "slice");
              v365 = objc_msgSend(v359, "depthPlane");
              v496[0] = MEMORY[0x24BDAC760];
              v496[1] = 3221225472;
              v496[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_6;
              v496[3] = &unk_250D6F8F8;
              v497 = v472;
              v500 = v361;
              v366 = v360;
              v498 = v366;
              v499 = v476;
              LOBYTE(v437) = v468 != 0;
              objc_msgSend(v362, "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:completion:", v366, v363, v364, v365, v483, obj, v480, v437, v496);

            }
            v355 = v462;
            v356 = objc_msgSend(v462, "countByEnumeratingWithState:objects:count:", &v501, v565, 16);
          }
          while (v356);
        }

        v367 = *MEMORY[0x24BE39618];
        objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39618]);
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        v369 = objc_msgSend(v368, "longLongValue") > 0;

        if (v369)
        {
          v495[0] = MEMORY[0x24BDAC760];
          v495[1] = 3221225472;
          v495[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_7;
          v495[3] = &unk_250D6F8D0;
          v495[4] = v494;
          v370 = v480;
          -[DYMTLCommonDebugFunctionPlayer collectPixelDrawStats:originalEncoderId:originalEncoder:originalPipeline:atX:y:draw:](v494, "collectPixelDrawStats:originalEncoderId:originalEncoder:originalPipeline:atX:y:draw:", v480, (_QWORD)__p, v450, v444, v483, obj, v495);
          v371 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v371 = 0;
          v370 = v480;
        }
        objc_msgSend(v370, "commit");
        objc_msgSend(v370, "waitUntilCompleted");
        if (!v371)
        {
          if (GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                                  + v456)))
          {
            objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C728, *MEMORY[0x24BE395E0]);
            objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C728, *MEMORY[0x24BE395F0]);
            objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C728, *MEMORY[0x24BE39650]);
          }
          goto LABEL_559;
        }
        objc_msgSend(v453, "addEntriesFromDictionary:", v371);
        objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39630]);
        v372 = (void *)objc_claimAutoreleasedReturnValue();
        v373 = objc_msgSend(v372, "longLongValue");

        objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39640]);
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        v375 = objc_msgSend(v374, "longLongValue");

        objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39620]);
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        v377 = objc_msgSend(v376, "longLongValue");

        objc_msgSend(v453, "objectForKeyedSubscript:", *MEMORY[0x24BE39638]);
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        v379 = objc_msgSend(v378, "longLongValue");

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v379);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v453, "setObject:forKeyedSubscript:", v380, *MEMORY[0x24BE395E0]);

        objc_msgSend(v450, "depthStencilState");
        v381 = (void *)objc_claimAutoreleasedReturnValue();
        v382 = v381;
        if (!v381
          || (DYMTLGetAssociatedObject(v381, 0),
              v383 = (id)objc_claimAutoreleasedReturnValue(),
              v383,
              !v383))
        {
          objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C710, *MEMORY[0x24BE395F0]);
          objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C710, *MEMORY[0x24BE39650]);
LABEL_558:

          v370 = v480;
LABEL_559:
          objc_msgSend(v490, "stencilAttachment");
          v421 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v421, "texture");
          v422 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "depthAttachment");
          v423 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v423, "texture");
          v424 = objc_claimAutoreleasedReturnValue();
          if (v422 | v424)
          {
            objc_msgSend(v448, "commandBuffer");
            v425 = objc_claimAutoreleasedReturnValue();

            v370 = (void *)v425;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dt.gputrace-replayer.pixel-history-save-depth-stencil-%u"), *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
            v426 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v370, "setLabel:", v426);

            if (v422)
            {
              LOBYTE(v437) = v468 != 0;
              objc_msgSend(MEMORY[0x24BE63578], "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:", v422, objc_msgSend(v421, "level"), objc_msgSend(v421, "slice"), objc_msgSend(v421, "depthPlane"), v483, obj, v370, v437);
              v427 = objc_claimAutoreleasedReturnValue();
              pixelHistoryPixelPreviousStencil = v494->_pixelHistoryPixelPreviousStencil;
              v494->_pixelHistoryPixelPreviousStencil = (MTLBuffer *)v427;

            }
            if (v424)
            {
              if (v422 == v424)
              {
                v429 = v494->_pixelHistoryPixelPreviousStencil;
              }
              else
              {
                LOBYTE(v437) = v468 != 0;
                objc_msgSend(MEMORY[0x24BE63578], "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:", v424, objc_msgSend(v423, "level"), objc_msgSend(v423, "slice"), objc_msgSend(v423, "depthPlane"), v483, obj, v370, v437);
                v429 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
              }
              pixelHistoryPixelPreviousDepth = v494->_pixelHistoryPixelPreviousDepth;
              v494->_pixelHistoryPixelPreviousDepth = v429;

            }
            objc_msgSend(v370, "commit");
            objc_msgSend(v370, "waitUntilCompleted");
          }

          objc_msgSend(v463, "setLastInterestingFunctionIndex:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
          objc_msgSend(v458, "objectForKeyedSubscript:", *MEMORY[0x24BE395E8]);
          v431 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)&v494->super.super.super.super.isa + v442));
          v432 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v431, "setObject:forKeyedSubscript:", v453, v432);

          if (v440)
          {
            objc_msgSend(v453, "objectForKeyedSubscript:", v367);
            v433 = (void *)objc_claimAutoreleasedReturnValue();
            v434 = objc_msgSend(v433, "longLongValue");

            if (v434 >= 1)
            {
              -[DYMTLCommonDebugFunctionPlayer generatePerPrimitiveHistory:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:](v494, "generatePerPrimitiveHistory:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:", v434, v448, (_QWORD)__p, v450, v444, v483, obj);
              v435 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v453, "setObject:forKeyedSubscript:", v435, *MEMORY[0x24BE39648]);

            }
          }

          v348 = v476;
          v449 = v370;
          v310 = v445;
LABEL_572:
          -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v310, v441);
          -[DYMTLFunctionPlayer setObject:forKey:](v494, "setObject:forKey:", v443, (_QWORD)__p);
          goto LABEL_573;
        }
        if (objc_msgSend(v383, "isDepthWriteEnabled"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v379);
          v384 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v453, "setObject:forKeyedSubscript:", v384, *MEMORY[0x24BE395F0]);

        }
        else
        {
          objc_msgSend(v453, "setObject:forKeyedSubscript:", &unk_250D7C710, *MEMORY[0x24BE395F0]);
        }
        v391 = *MEMORY[0x24BE39680];
        if ((v373 | v375) < 0)
          v392 = v391;
        else
          v392 = v375 < v373;
        if ((v375 | v377) < 0)
          v393 = v391;
        else
          v393 = v377 < v375;
        if (v379 < 0)
        {
          if (v379 == *MEMORY[0x24BE39678])
          {
            v379 = 1;
          }
          else if (v379 == v391)
          {
            v379 = 0xFFFFFFFFLL;
          }
          else
          {
            v379 = 0;
          }
        }
        objc_msgSend(v383, "frontFaceStencil");
        v409 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v409, "stencilFailureOperation"))
        {

        }
        else
        {
          objc_msgSend(v383, "backFaceStencil");
          v410 = (void *)objc_claimAutoreleasedReturnValue();
          v411 = objc_msgSend(v410, "stencilFailureOperation") == 0;

          if (v411)
            v392 = 0;
        }
        objc_msgSend(v383, "frontFaceStencil");
        v412 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v412, "depthFailureOperation"))
        {

        }
        else
        {
          objc_msgSend(v383, "backFaceStencil");
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          v414 = objc_msgSend(v413, "depthFailureOperation") == 0;

          if (v414)
            goto LABEL_546;
        }
        if ((_DWORD)v392)
        {
          if ((int)v393 > 0 && (int)v392 < 0)
            v392 = 1;
          else
            v392 = v392;
        }
        else
        {
          v392 = v393;
        }
LABEL_546:
        objc_msgSend(v383, "frontFaceStencil");
        v416 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v416, "depthStencilPassOperation"))
        {

        }
        else
        {
          objc_msgSend(v383, "backFaceStencil");
          v417 = (void *)objc_claimAutoreleasedReturnValue();
          v418 = objc_msgSend(v417, "depthStencilPassOperation") == 0;

          if (v418)
          {
LABEL_557:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v392);
            v420 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v453, "setObject:forKeyedSubscript:", v420, *MEMORY[0x24BE39650]);

            goto LABEL_558;
          }
        }
        if ((_DWORD)v392)
        {
          if ((int)v379 > 0 && (int)v392 < 0)
            v392 = 1;
          else
            v392 = v392;
        }
        else
        {
          v392 = v379;
        }
        goto LABEL_557;
      }
LABEL_575:

      v49 = 0;
LABEL_218:

LABEL_219:
LABEL_220:

      v35 = context;
LABEL_221:
      objc_autoreleasePoolPop(v35);
      if ((v49 | 2) == 2)
      {
LABEL_331:
        v256 = (int)*MEMORY[0x24BE39040];
        if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                   + v256)) & 1) != 0
          || (GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                      + v256)) & 1) != 0
          || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v494->super.super.super.super.isa
                                                                                                + v256)))
        {
          objc_msgSend(v493, "setExecutedDrawCallCount:", objc_msgSend(v493, "executedDrawCallCount") + 1);
        }
      }
LABEL_335:

      objc_autoreleasePoolPop(v492);
      return;
    default:
      -[DYMTLCommonDebugFunctionPlayer _executeGraphicsFunction](v2, "_executeGraphicsFunction");
      if (!-[DYMTLCommonDebugFunctionPlayer shouldExecuteGraphicsFunction](v2, "shouldExecuteGraphicsFunction"))
        goto LABEL_331;
      goto LABEL_120;
  }
}

uint64_t __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(a1 + 32), "tileBytesForKey:", +[DYMTLFunctionPlayer tileBytesKeyAtIndex:](DYMTLFunctionPlayer, "tileBytesKeyAtIndex:", a4));
  if (a2 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "fragmentBytesForKey:", +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:](DYMTLFunctionPlayer, "fragmentBytesKeyAtIndex:", a4));
  if (a2)
    return 0;
  return objc_msgSend(*(id *)(a1 + 32), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 4176), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE39700];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE39700]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "pixelFormat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE39468];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE39468]);

  v9 = *MEMORY[0x24BE39710];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE39710]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = (void *)objc_opt_new();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "pixelFormat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 56));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 4176), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));
  v14 = (void *)sThumbnailTextures;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v3, v15);

}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v7, "GPUStartTime");
    v5 = v4;
    objc_msgSend(v7, "GPUEndTime");
    objc_msgSend(v3, "addCommandBufferDurationStart:andEnd:", v5, v6);
  }

}

uint64_t __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(a1 + 32), "tileBytesForKey:", +[DYMTLFunctionPlayer tileBytesKeyAtIndex:](DYMTLFunctionPlayer, "tileBytesKeyAtIndex:", a4));
  if (a2 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "fragmentBytesForKey:", +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:](DYMTLFunctionPlayer, "fragmentBytesKeyAtIndex:", a4));
  if (a2)
    return 0;
  return objc_msgSend(*(id *)(a1 + 32), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

id __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_5(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  return objc_msgSendSuper2(&v2, sel_executeGraphicsFunction);
}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *MEMORY[0x24BE39668];
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

    v9 = (void *)objc_opt_new();
    v6 = *MEMORY[0x24BE39668];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE39668]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "pixelFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE39468]);

    objc_msgSend(*(id *)(a1 + 40), "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE39658]);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);
  v13 = objc_msgSend(v12, "indexOfObject:", v17);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

}

id __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_7(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  return objc_msgSendSuper2(&v2, sel_executeGraphicsFunction);
}

- (id)collectPixelDrawStatsTotal:(id)a3 originalPipeline:(id)a4 atX:(unint64_t)a5 y:(unint64_t)a6 draw:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  DYMTLPixelHistoryDrawStatsSupport *pixelHistoryDrawStatsRenderer;
  void *v17;
  _QWORD v19[4];
  id v20;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a7;
  v15 = (void *)objc_opt_new();
  if (-[DYMTLPixelHistoryDrawStatsSupport createNumTotalRenderCommandEncoderInCommandBuffer:originalPipeline:](self->_pixelHistoryDrawStatsRenderer, "createNumTotalRenderCommandEncoderInCommandBuffer:originalPipeline:", v12, v13))
  {
    v14[2](v14);
    pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __89__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStatsTotal_originalPipeline_atX_y_draw___block_invoke;
    v19[3] = &unk_250D6F920;
    v20 = v15;
    -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryStencilDrawStatsAtX:y:completion:](pixelHistoryDrawStatsRenderer, "collectPixelHistoryStencilDrawStatsAtX:y:completion:", a5, a6, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE39618]);

  }
  return v15;
}

void __89__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStatsTotal_originalPipeline_atX_y_draw___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

- (id)collectPixelDrawStats:(id)a3 originalEncoderId:(unint64_t)a4 originalEncoder:(id)a5 originalPipeline:(id)a6 atX:(unint64_t)a7 y:(unint64_t)a8 draw:(id)a9
{
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  DYMTLPixelHistoryDrawStatsSupport *pixelHistoryDrawStatsRenderer;
  void *v22;
  DYMTLPixelHistoryDrawStatsSupport *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  DYMTLPixelHistoryDrawStatsSupport *v41;
  void *v42;
  _BOOL4 v43;
  DYMTLPixelHistoryDrawStatsSupport *v44;
  void *v45;
  void *v46;
  void *v47;
  DYMTLPixelHistoryDrawStatsSupport *v48;
  void *v49;
  _BOOL4 v50;
  DYMTLPixelHistoryDrawStatsSupport *v51;
  void *v52;
  _BOOL4 v53;
  uint64_t v54;
  DYMTLPixelHistoryDrawStatsSupport *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(void);
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[5];

  v71 = a3;
  v15 = a5;
  v68 = a6;
  v63 = v15;
  v64 = (void (**)(void))a9;
  v70 = (id)objc_opt_new();
  objc_msgSend(v15, "descriptor");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BE63580];
  v69 = (void *)v16;
  -[DYMTLFunctionPlayer device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "forDevice:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v19;
  if (-[DYMTLPixelHistoryDrawStatsSupport createNumFragmentPassesRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:](self->_pixelHistoryDrawStatsRenderer, "createNumFragmentPassesRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:", v71, v69, v68))
  {
    -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = 0;
    v93[1] = 0;
    v93[2] = objc_msgSend(v20, "width");
    v93[3] = objc_msgSend(v20, "height");
    objc_msgSend(v20, "setScissorRect:", v93);
    v64[2]();
    pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
    v91[0] = MEMORY[0x24BDAC760];
    v91[1] = 3221225472;
    v91[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke;
    v91[3] = &unk_250D6F920;
    v92 = v70;
    -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryStencilDrawStatsAtX:y:completion:](pixelHistoryDrawStatsRenderer, "collectPixelHistoryStencilDrawStatsAtX:y:completion:", a7, a8, v91);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE39628]);

  }
  if (-[DYMTLPixelHistoryDrawStatsSupport createNumFragmentPassesRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:](self->_pixelHistoryDrawStatsRenderer, "createNumFragmentPassesRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:", v71, v69, v68))
  {
    v64[2]();
    v23 = self->_pixelHistoryDrawStatsRenderer;
    v89[0] = MEMORY[0x24BDAC760];
    v89[1] = 3221225472;
    v89[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_2;
    v89[3] = &unk_250D6F920;
    v90 = v70;
    -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryStencilDrawStatsAtX:y:completion:](v23, "collectPixelHistoryStencilDrawStatsAtX:y:completion:", a7, a8, v89);
    v24 = v90;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE39630]);
  }

  objc_msgSend(v63, "depthStencilState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v25;
  if (v25)
  {
    DYMTLGetAssociatedObject(v25, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = 0;
  }
  objc_msgSend(v69, "stencilAttachment");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "depthAttachment");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "texture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v66, "frontFaceStencil");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "stencilCompareFunction") == 7)
    {
      objc_msgSend(v66, "backFaceStencil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "stencilCompareFunction") == 7;

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 1;
  }

  objc_msgSend(v65, "texture");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    v31 = objc_msgSend(v66, "depthCompareFunction") == 7;
  else
    v31 = 1;

  -[DYMTLFunctionPlayer device](self, "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "supportsFamily:", 3002))
  {

  }
  else
  {
    -[DYMTLFunctionPlayer device](self, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "supportsFamily:", 3003);

    if (!v34)
    {
      v35 = 1;
      if (v29)
        goto LABEL_23;
      goto LABEL_28;
    }
  }
  v35 = 2;
  if (v29)
  {
LABEL_23:
    if (v31)
    {
      v87[0] = MEMORY[0x24BDAC760];
      v87[1] = 3221225472;
      v87[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_3;
      v87[3] = &unk_250D6F8A8;
      v88 = v70;
      objc_msgSend(v71, "addCompletedHandler:", v87);
      v36 = v88;
      v37 = v63;
      v38 = v69;
LABEL_35:
      v57 = v61;
      goto LABEL_40;
    }
    v39 = (void *)MEMORY[0x24BE63578];
    -[DYMTLPixelHistoryDrawStatsSupport mockDepthTexture](self->_pixelHistoryDrawStatsRenderer, "mockDepthTexture");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v40, self->_pixelHistoryPixelPreviousDepth, objc_msgSend(v65, "level"), objc_msgSend(v65, "slice"), objc_msgSend(v65, "depthPlane"), a7, a8, v71);

    v41 = self->_pixelHistoryDrawStatsRenderer;
    -[DYMTLPixelHistoryDrawStatsSupport mockDepthTexture](v41, "mockDepthTexture");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[DYMTLPixelHistoryDrawStatsSupport createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockDepthTexture:visibilityResultMode:atX:y:](v41, "createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockDepthTexture:visibilityResultMode:atX:y:", v71, v69, v68, v66, v42, v35, a7, a8);

    if (v43)
    {
      v64[2]();
      v44 = self->_pixelHistoryDrawStatsRenderer;
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_4;
      v84[3] = &unk_250D6F948;
      v86 = v35;
      v85 = v70;
      -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryVisibilityDrawStatsAtCompletion:](v44, "collectPixelHistoryVisibilityDrawStatsAtCompletion:", v84);
      v45 = v85;
    }
    else
    {
      v58 = *MEMORY[0x24BE39680];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BE39620]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v58);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v45, *MEMORY[0x24BE39638]);
    }
    v37 = v63;
    v38 = v69;
    v57 = v61;

    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_5;
    v82[3] = &unk_250D6F8A8;
    v83 = v70;
    objc_msgSend(v71, "addCompletedHandler:", v82);
    v36 = v83;
    goto LABEL_40;
  }
LABEL_28:
  if (!v31)
  {
    -[DYMTLPixelHistoryDrawStatsSupport mockStencilTexture](self->_pixelHistoryDrawStatsRenderer, "mockStencilTexture");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63578], "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v36, self->_pixelHistoryPixelPreviousStencil, objc_msgSend(v67, "level"), objc_msgSend(v67, "slice"), objc_msgSend(v67, "depthPlane"), a7, a8, v71);
    v53 = -[DYMTLPixelHistoryDrawStatsSupport createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockDepthStencilTexture:visibilityResultMode:atX:y:](self->_pixelHistoryDrawStatsRenderer, "createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockDepthStencilTexture:visibilityResultMode:atX:y:", v71, v69, v68, v66, v36, v35, a7, a8);
    v54 = MEMORY[0x24BDAC760];
    if (v53)
    {
      v64[2]();
      v55 = self->_pixelHistoryDrawStatsRenderer;
      v74[0] = v54;
      v74[1] = 3221225472;
      v74[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_8;
      v74[3] = &unk_250D6F948;
      v76 = v35;
      v75 = v70;
      -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryVisibilityDrawStatsAtCompletion:](v55, "collectPixelHistoryVisibilityDrawStatsAtCompletion:", v74);
      v56 = v75;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v56, *MEMORY[0x24BE39638]);
    }
    v38 = v69;

    v72[0] = v54;
    v72[1] = 3221225472;
    v72[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_9;
    v72[3] = &unk_250D6F8A8;
    v73 = v70;
    objc_msgSend(v71, "addCompletedHandler:", v72);

    v37 = v63;
    goto LABEL_35;
  }
  v46 = (void *)MEMORY[0x24BE63578];
  -[DYMTLPixelHistoryDrawStatsSupport mockStencilTexture](self->_pixelHistoryDrawStatsRenderer, "mockStencilTexture");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v47, self->_pixelHistoryPixelPreviousStencil, objc_msgSend(v67, "level"), objc_msgSend(v67, "slice"), objc_msgSend(v67, "depthPlane"), a7, a8, v71);

  v48 = self->_pixelHistoryDrawStatsRenderer;
  -[DYMTLPixelHistoryDrawStatsSupport mockStencilTexture](v48, "mockStencilTexture");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[DYMTLPixelHistoryDrawStatsSupport createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockStencilTexture:visibilityResultMode:atX:y:](v48, "createNumVisibleRenderCommandEncoderInCommandBuffer:originalRenderPassDescriptor:originalPipeline:depthStencilDescriptor:mockStencilTexture:visibilityResultMode:atX:y:", v71, v69, v68, v66, v49, v35, a7, a8);

  if (v50)
  {
    v64[2]();
    v51 = self->_pixelHistoryDrawStatsRenderer;
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_6;
    v79[3] = &unk_250D6F948;
    v81 = v35;
    v80 = v70;
    -[DYMTLPixelHistoryDrawStatsSupport collectPixelHistoryVisibilityDrawStatsAtCompletion:](v51, "collectPixelHistoryVisibilityDrawStatsAtCompletion:", v79);
    v52 = v80;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v52, *MEMORY[0x24BE39640]);
  }
  v37 = v63;
  v38 = v69;
  v57 = v61;

  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_7;
  v77[3] = &unk_250D6F8A8;
  v78 = v70;
  objc_msgSend(v71, "addCompletedHandler:", v77);
  v36 = v78;
LABEL_40:

  return v70;
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE39630]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE39640];
  v4 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  if (!a2 || *(_QWORD *)(a1 + 40) == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    v4 = *MEMORY[0x24BE39678];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39678]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE39630]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2 || *(_QWORD *)(a1 + 40) == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39678]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *MEMORY[0x24BE39640];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE39640]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2 || *(_QWORD *)(a1 + 40) == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39678]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }

}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE39638]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BE39630];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE39630]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isEqualToNumber:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2);
  }
  else
  {
    v5 = *MEMORY[0x24BE39680];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BE39680]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

- (id)generatePerPrimitiveHistory:(unint64_t)a3 commandQueue:(id)a4 currentEncoderId:(unint64_t)a5 originalEncoder:(id)a6 originalPipeline:(id)a7 atX:(unint64_t)a8 y:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  v19 = *(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]);
  if (*(_DWORD *)v19 == -16250)
  {
    -[DYMTLCommonDebugFunctionPlayer generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:](self, "generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:", **(_QWORD **)(v19 + 72), **(_QWORD **)(v19 + 96), **(_QWORD **)(v19 + 120), a3, v15, a5, v16, v17, a8, a9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 total:(unint64_t)a6 commandQueue:(id)a7 currentEncoderId:(unint64_t)a8 originalEncoder:(id)a9 originalPipeline:(id)a10 atX:(unint64_t)a11 y:(unint64_t)a12
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[9];
  _QWORD v43[9];
  void *v44;
  void *v45;
  _QWORD v46[3];

  v18 = a9;
  v46[1] = *MEMORY[0x24BDAC8D0];
  v40 = a7;
  v39 = a9;
  v41 = a10;
  if (a6)
  {
    if (a3 == 3)
    {
      if (a5 == 3)
      {
        v19 = (void *)MEMORY[0x24BDBCED8];
        v46[0] = *MEMORY[0x24BE39618];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:", &unk_250D7C760, v20);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x24BDBCE70];
        v45 = v38;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:", v36, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = (void *)objc_opt_new();
        objc_msgSend(v40, "commandBuffer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (unint64_t)(double)(a5 / 6);
        v24 = 3 * v23;
        v25 = MEMORY[0x24BDAC760];
        if (v23)
        {
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke;
          v43[3] = &unk_250D6F970;
          v43[4] = self;
          v43[5] = a8;
          v43[6] = 3;
          v43[7] = a4;
          v43[8] = 3 * v23;
          -[DYMTLCommonDebugFunctionPlayer collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:](self, "collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:", v38, v41, a11, a12, v43);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        v34 = a5 - v24;
        v35 = v24 + a4;
        if (a5 == v24)
        {
          v37 = 0;
          v26 = v38;
        }
        else
        {
          v42[0] = v25;
          v42[1] = 3221225472;
          v42[2] = __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke_2;
          v42[3] = &unk_250D6F970;
          v42[4] = self;
          v42[5] = a8;
          v42[6] = 3;
          v42[7] = v24 + a4;
          v42[8] = a5 - v24;
          v26 = v38;
          -[DYMTLCommonDebugFunctionPlayer collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:](self, "collectPixelDrawStatsTotal:originalPipeline:atX:y:draw:", v38, v41, a11, a12, v42);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v26, "commit");
        objc_msgSend(v26, "waitUntilCompleted");
        v27 = (_QWORD *)MEMORY[0x24BE39618];
        if (v36)
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x24BE39618]);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "longLongValue");

        }
        else
        {
          v29 = 0;
        }
        if (v37)
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", *v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "longLongValue");

        }
        else
        {
          v31 = 0;
        }
        if (v29 >= 1)
        {
          -[DYMTLCommonDebugFunctionPlayer generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:](self, "generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:", 3, a4, v24, v29, v40, a8, v39, v41, a11, a12);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addEntriesFromDictionary:", v32);

        }
        if (v31 < 1)
          goto LABEL_23;
        -[DYMTLCommonDebugFunctionPlayer generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:](self, "generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:vertexStart:vertexCount:total:commandQueue:currentEncoderId:originalEncoder:originalPipeline:atX:y:", 3, v35, v34, v31, v40, a8, v39, v41, a11, a12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEntriesFromDictionary:", v22);
      }

LABEL_23:
    }
  }
  else
  {
    v18 = (void *)objc_opt_new();
  }

  return v18;
}

void __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawPrimitives:vertexStart:vertexCount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawPrimitives:vertexStart:vertexCount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)extractIndirectArgumentBuffers
{
  uint64_t v3;
  void *v4;
  char **v5;
  char *v6[2];

  v6[0] = 0;
  v6[1] = 0;
  v5 = v6;
  v3 = (int)*MEMORY[0x24BE39040];
  if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                             + v3)) & 1) != 0
    || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                            + v3)) & 1) != 0
    || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                          + v3)))
  {
    -[DYMTLCommonDebugFunctionPlayer extractRenderIndirectArgumentBuffers:](self, "extractRenderIndirectArgumentBuffers:", &v5);
  }
  else if ((GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                     + v3)) & 1) != 0
         || GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v3)))
  {
    -[DYMTLCommonDebugFunctionPlayer extractComputeIndirectArgumentBuffers:](self, "extractComputeIndirectArgumentBuffers:", &v5);
  }
  -[DYMTLFunctionPlayer indirectArgumentManager](self, "indirectArgumentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyReplayerTargetIndirectArgumentBuffers:", &v5);

  std::__tree<std::__value_type<objc_object  {objcproto9MTLBuffer}*,std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>>,std::__map_value_compare<objc_object  {objcproto9MTLBuffer}*,std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>,std::less<objc_object  {objcproto9MTLBuffer}*>,true>,std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}><std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>>>::destroy((uint64_t)&v5, v6[0]);
}

- (void)extractCommandBufferTranslationData
{
  id v2;

  -[DYMTLFunctionPlayer indirectCommandManager](self, "indirectCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateReplayerTranslationBuffer");

}

- (void)extractRenderIndirectArgumentBuffers:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[6];
  _QWORD **v39;
  _QWORD *v40[2];
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[6];
  _QWORD **v47;
  _QWORD *v48[2];
  _QWORD v49[4];
  id v50;
  _QWORD **v51;
  void *v52;
  _QWORD v53[5];
  _QWORD *v54[6];
  _QWORD **v55;
  _QWORD *v56[2];
  unint64_t v57[2];

  v57[0] = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 48, 0);
  v54[0] = v57;
  v5 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)-[DYMTLFunctionPlayer objectMap](self, "objectMap"), v57, (uint64_t)&std::piecewise_construct, v54)[3];
  objc_msgSend(v5, "renderPipelineState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v6, 2u);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    DYMTLGetNullableAssociatedObject(v6, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = (_QWORD *)0x4812000000;
    v54[3] = __Block_byref_object_copy__4;
    v54[4] = __Block_byref_object_dispose__4;
    v56[0] = 0;
    v56[1] = 0;
    v54[5] = "";
    v55 = v56;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke;
    v53[3] = &unk_250D6F278;
    v53[4] = v54;
    objc_msgSend(v5, "enumerateVertexBuffersUsingBlock:", v53);
    objc_msgSend(v7, "vertexBindings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataTypeDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_22:

        _Block_object_dispose(v54, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v55, v56[0]);

        goto LABEL_23;
      }
    }
    v14 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_2;
    v49[3] = &unk_250D6F998;
    v51 = v54;
    v52 = a3;
    v15 = v32;
    v50 = v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v49);
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x4812000000;
    v46[3] = __Block_byref_object_copy__4;
    v46[4] = __Block_byref_object_dispose__4;
    v48[0] = 0;
    v48[1] = 0;
    v46[5] = "";
    v47 = v48;
    v45[0] = v14;
    v45[1] = 3221225472;
    v45[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_3;
    v45[3] = &unk_250D6F278;
    v45[4] = v46;
    objc_msgSend(v5, "enumerateFragmentBuffersUsingBlock:", v45);
    v30 = a3;
    objc_msgSend(v7, "fragmentBindings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v31, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v31, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dataTypeDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
      {
LABEL_20:

        _Block_object_dispose(v46, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v47, v48[0]);
        v9 = v50;
        goto LABEL_21;
      }
    }
    v21 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_4;
    v41[3] = &unk_250D6F998;
    v43 = v46;
    v44 = v30;
    v42 = v15;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v41);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_18:
      v16 = v42;
      goto LABEL_19;
    }
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x4812000000;
    v38[3] = __Block_byref_object_copy__4;
    v38[4] = __Block_byref_object_dispose__4;
    v40[0] = 0;
    v40[1] = 0;
    v38[5] = "";
    v39 = v40;
    v37[0] = v21;
    v37[1] = 3221225472;
    v37[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_5;
    v37[3] = &unk_250D6F278;
    v37[4] = v38;
    objc_msgSend(v5, "enumerateTileBuffersUsingBlock:", v37);
    DYMTLGetNullableAssociatedObject(v6, 1u);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tileBindings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_12;
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v22, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dataTypeDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) != 0)
      {
LABEL_12:
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_6;
        v33[3] = &unk_250D6F998;
        v35 = v38;
        v36 = v30;
        v28 = v29;
        v34 = v28;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v33);

LABEL_17:
        _Block_object_dispose(v38, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v39, v40[0]);
        goto LABEL_18;
      }
    }
    else
    {

    }
    goto LABEL_17;
  }
LABEL_23:

}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v7;
  unint64_t *v8;

  v4 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v7 = a3;
  v8 = &v7;
  v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if (!objc_msgSend(v3, "type") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dataTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "dataTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "elementIsArgumentBuffer");

      if (v6)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = objc_msgSend(v3, "index");
        v11 = *(_QWORD **)(v7 + 56);
        v10 = (_QWORD *)(v7 + 56);
        v9 = v11;
        if (!v11)
          goto LABEL_16;
        v12 = v10;
        do
        {
          v13 = v9[4];
          v14 = v13 >= v8;
          if (v13 >= v8)
            v15 = v9;
          else
            v15 = v9 + 1;
          if (v14)
            v12 = v9;
          v9 = (_QWORD *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4])
LABEL_16:
          v12 = v10;
        if (v12 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56))
        {
          v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              v25 = v16;
              v17 = *(uint64_t ***)(a1 + 48);
              v22 = &v25;
              v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6])
                v19 = (uint64_t *)v12[7];
              else
                v19 = 0;
              objc_msgSend(*(id *)(a1 + 32), "vertexFunction");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v3;
              v22 = (id *)v19;
              v23 = v20;
              v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);

            }
          }
        }
      }
    }
    else
    {

    }
  }

}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v7;
  unint64_t *v8;

  v4 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v7 = a3;
  v8 = &v7;
  v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if (!objc_msgSend(v3, "type") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dataTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "dataTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "elementIsArgumentBuffer");

      if (v6)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = objc_msgSend(v3, "index");
        v11 = *(_QWORD **)(v7 + 56);
        v10 = (_QWORD *)(v7 + 56);
        v9 = v11;
        if (!v11)
          goto LABEL_16;
        v12 = v10;
        do
        {
          v13 = v9[4];
          v14 = v13 >= v8;
          if (v13 >= v8)
            v15 = v9;
          else
            v15 = v9 + 1;
          if (v14)
            v12 = v9;
          v9 = (_QWORD *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4])
LABEL_16:
          v12 = v10;
        if (v12 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56))
        {
          v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              v25 = v16;
              v17 = *(uint64_t ***)(a1 + 48);
              v22 = &v25;
              v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6])
                v19 = (uint64_t *)v12[7];
              else
                v19 = 0;
              objc_msgSend(*(id *)(a1 + 32), "fragmentFunction");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v3;
              v22 = (id *)v19;
              v23 = v20;
              v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);

            }
          }
        }
      }
    }
    else
    {

    }
  }

}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v7;
  unint64_t *v8;

  v4 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v7 = a3;
  v8 = &v7;
  v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if (!objc_msgSend(v3, "type") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dataTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "dataTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "elementIsArgumentBuffer");

      if (v6)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = objc_msgSend(v3, "index");
        v11 = *(_QWORD **)(v7 + 56);
        v10 = (_QWORD *)(v7 + 56);
        v9 = v11;
        if (!v11)
          goto LABEL_16;
        v12 = v10;
        do
        {
          v13 = v9[4];
          v14 = v13 >= v8;
          if (v13 >= v8)
            v15 = v9;
          else
            v15 = v9 + 1;
          if (v14)
            v12 = v9;
          v9 = (_QWORD *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4])
LABEL_16:
          v12 = v10;
        if (v12 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56))
        {
          v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              v25 = v16;
              v17 = *(uint64_t ***)(a1 + 48);
              v22 = &v25;
              v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6])
                v19 = (uint64_t *)v12[7];
              else
                v19 = 0;
              objc_msgSend(*(id *)(a1 + 32), "tileFunction");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v3;
              v22 = (id *)v19;
              v23 = v20;
              v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);

            }
          }
        }
      }
    }
    else
    {

    }
  }

}

- (void)extractComputeIndirectArgumentBuffers:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD **v19;
  void *v20;
  _QWORD v21[5];
  _QWORD *v22[6];
  _QWORD **v23;
  _QWORD *v24[2];
  unint64_t v25;

  v25 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 48, 0);
  v22[0] = &v25;
  v5 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)-[DYMTLFunctionPlayer objectMap](self, "objectMap"), &v25, (uint64_t)&std::piecewise_construct, v22)[3];
  objc_msgSend(v5, "computePipelineState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v6, 2u);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a3;
  DYMTLGetAssociatedObject(v6, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = (_QWORD *)0x4812000000;
  v22[3] = __Block_byref_object_copy__4;
  v22[4] = __Block_byref_object_dispose__4;
  v24[0] = 0;
  v24[1] = 0;
  v8 = MEMORY[0x24BDAC760];
  v22[5] = "";
  v23 = v24;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke;
  v21[3] = &unk_250D6F278;
  v21[4] = v22;
  objc_msgSend(v5, "enumerateBuffersUsingBlock:", v21);
  objc_msgSend(v7, "arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataTypeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
LABEL_4:
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke_2;
    v17[3] = &unk_250D6F998;
    v19 = v22;
    v20 = v15;
    v18 = v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
    v10 = v18;
LABEL_6:

  }
  _Block_object_dispose(v22, 8);
  std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v23, v24[0]);

}

id *__72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v7;
  unint64_t *v8;

  v4 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v7 = a3;
  v8 = &v7;
  v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if (!objc_msgSend(v3, "type") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dataTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "dataTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "elementIsArgumentBuffer");

      if (v6)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = objc_msgSend(v3, "index");
        v11 = *(_QWORD **)(v7 + 56);
        v10 = (_QWORD *)(v7 + 56);
        v9 = v11;
        if (!v11)
          goto LABEL_16;
        v12 = v10;
        do
        {
          v13 = v9[4];
          v14 = v13 >= v8;
          if (v13 >= v8)
            v15 = v9;
          else
            v15 = v9 + 1;
          if (v14)
            v12 = v9;
          v9 = (_QWORD *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4])
LABEL_16:
          v12 = v10;
        if (v12 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56))
        {
          v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              v25 = v16;
              v17 = *(uint64_t ***)(a1 + 48);
              v22 = &v25;
              v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6])
                v19 = (uint64_t *)v12[7];
              else
                v19 = 0;
              objc_msgSend(*(id *)(a1 + 32), "computeFunction");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v3;
              v22 = (id *)v19;
              v23 = v20;
              v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);

            }
          }
        }
      }
    }
    else
    {

    }
  }

}

- (void)_extractTileMemoryWithRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 renderEncoderID:(unint64_t)a4 isDrawCall:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  unint64_t tileWidth;
  unint64_t tileHeight;
  uint64_t v12;
  uint64_t v13;
  DYMTLTileMemoryExtractor *v14;
  void *v15;
  DYMTLTileMemoryExtractor *v16;
  DYMTLTileMemoryExtractor *tileMemoryExtractor;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  void **v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  _QWORD v27[6];
  _QWORD v28[3];
  _QWORD v29[3];
  void **v30;
  void ***v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  void (*v34)(uint64_t);
  const char *v35;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;

  v5 = a5;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v33 = __Block_byref_object_copy__478;
  v34 = __Block_byref_object_dispose__479;
  v32 = 0x4812000000;
  v35 = "";
  memset(v36, 0, sizeof(v36));
  -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderPipelineState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  tileWidth = a3->tileWidth;
  tileHeight = a3->tileHeight;
  v12 = objc_msgSend(v8, "width");
  v13 = objc_msgSend(v8, "height");
  v14 = [DYMTLTileMemoryExtractor alloc];
  -[DYMTLFunctionPlayer device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = tileWidth;
  v29[1] = tileHeight;
  v29[2] = 1;
  v28[0] = v12;
  v28[1] = v13;
  v28[2] = 0;
  v16 = -[DYMTLTileMemoryExtractor initWithRenderEncoder:metalDevice:tileSize:texSize:](v14, "initWithRenderEncoder:metalDevice:tileSize:texSize:", v8, v15, v29, v28);
  tileMemoryExtractor = self->_tileMemoryExtractor;
  self->_tileMemoryExtractor = v16;

  DYMTLGetAssociatedObject(v9, 2u);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLTileMemoryExtractor processReflection:isDrawCall:](self->_tileMemoryExtractor, "processReflection:isDrawCall:", v18, v5);
  if (-[DYMTLTileMemoryExtractor getImageBlockStatus](self->_tileMemoryExtractor, "getImageBlockStatus"))
    -[DYMTLTileMemoryExtractor harvestImageBlockData:](self->_tileMemoryExtractor, "harvestImageBlockData:", &v37);
  if (-[DYMTLTileMemoryExtractor getThreadgroupStatus](self->_tileMemoryExtractor, "getThreadgroupStatus"))
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __104__DYMTLCommonDebugFunctionPlayer__extractTileMemoryWithRenderPassDescriptor_renderEncoderID_isDrawCall___block_invoke;
    v27[3] = &unk_250D6F9C0;
    v27[4] = self;
    v27[5] = &v30;
    objc_msgSend(v8, "enumerateThreadgroupMemoryUsingBlock:", v27);
  }
  v19 = v37;
  if (v38 != v37)
  {
    v20 = 0;
    v21 = *MEMORY[0x24BE394B8];
    v22 = 1;
    do
    {
      -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", *(_QWORD *)(v19 + 8 * v20), v21 + v20);
      v20 = v22;
      v19 = v37;
      ++v22;
    }
    while (v20 < (v38 - v37) >> 3);
  }
  v23 = v31[6];
  if (v31[7] != v23)
  {
    v24 = 0;
    v25 = *MEMORY[0x24BE394C0];
    v26 = 1;
    do
    {
      -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v23[v24], v25 + v24);
      v24 = v26;
      v23 = v31[6];
      ++v26;
    }
    while (v24 < v31[7] - v23);
  }

  _Block_object_dispose(&v30, 8);
  v40 = (void **)v36;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100](&v40);
  v30 = (void **)&v37;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100](&v30);
}

void __104__DYMTLCommonDebugFunctionPlayer__extractTileMemoryWithRenderPassDescriptor_renderEncoderID_isDrawCall___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3952), "harvestThreadgroupAtIndex:size:", a3, *a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), &v4);

  }
}

- (void)_superExecutePlatformFunction
{
  objc_super v2;

  if ((**(_DWORD **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]) + 7167) >= 2)
  {
    v2.receiver = self;
    v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    -[DYMTLCommonFunctionPlayer executePlatformFunction](&v2, sel_executePlatformFunction);
  }
}

- (void)executePlatformFunction
{
  void *v3;
  uint64_t v4;
  id v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;

  v3 = (void *)MEMORY[0x242623ED8](self, a2);
  v4 = (int)*MEMORY[0x24BE39040];
  if (**(_DWORD **)((char *)&self->super.super.super.super.isa + v4) != -7161)
  {
    v5 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
    v6 = objc_msgSend(v5, "playbackMode");
    v7 = v6 > 0xC || ((1 << v6) & 0x182E) == 0;
    if (v7 || (**(_DWORD **)((char *)&self->super.super.super.super.isa + v4) + 7158) > 2)
    {
      -[DYMTLCommonDebugFunctionPlayer _superExecutePlatformFunction](self, "_superExecutePlatformFunction");
    }
    else
    {
      -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](self, "replayerLayerForDrawableId:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 48, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepareLayerForPresent:", v9);

    }
    v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 48, 0);
    v11 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
    if (*v11 == -7167)
    {
      v18 = v10;
      v19 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v11 + 6), 0);
      v24 = v19;
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "texture");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLAddDrawableTextureDescriptor(v22);
        -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v22, v19);
        v25 = &v24;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_textureToDrawableMap, &v24, (uint64_t)&std::piecewise_construct, &v25)[3] = v18;

      }
    }
    else if (*v11 == -7166)
    {
      v12 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v11 + 12), 0);
      v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 24, 0);
      -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](self, "replayerLayerForDrawableId:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      -[DYMTLCommonDebugFunctionPlayer updateReplayerLayer:withOriginalLayer:](self, "updateReplayerLayer:withOriginalLayer:", v24, v12);
      v14 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->super._drawableRenderabilityStatusMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
      if (!v14
        || !*((_BYTE *)v14 + 24)
        || (-[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v24),
            (v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        do
        {
          objc_msgSend(v13, "nextDrawable");
          v15 = objc_claimAutoreleasedReturnValue();
          v25 = &v24;
          *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v24, (uint64_t)&std::piecewise_construct, &v25)+ 24) = 1;
        }
        while (!v15);
      }
      -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v15, v24);
      v25 = &v24;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableIdToLayerIdMap, &v24, (uint64_t)&std::piecewise_construct, &v25)[3] = v23;
      v25 = &v24;
      v16 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->super._drawableMap, &v24, (uint64_t)&std::piecewise_construct, &v25);
      v17 = (void *)v16[3];
      v16[3] = v15;

    }
    if (objc_msgSend(v5, "playbackMode") <= 1)
      -[DYMTLCommonDebugFunctionPlayer _trackObjects](self, "_trackObjects");

  }
  objc_autoreleasePoolPop(v3);
}

- (void)resetFunctionPlayerData
{
  self->_currentBatchEncoderIndex = 0;
}

- (void)enableConsistentState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v7, sel_commandQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (v3)
      v6 = objc_msgSend(v4, "getStatOptions") | 0x80000000;
    else
      v6 = objc_msgSend(v4, "getStatOptions") & 0x7FFFFFFF;
    objc_msgSend(v5, "setStatOptions:", v6);
  }

}

- (void)allowOverlap:(BOOL)a3 withPState:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v10, sel_commandQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setGPUPriority:", v5 ^ 1);
    objc_msgSend(v8, "setStatEnabled:", v5);
    if ((_DWORD)v4)
      -[DYMTLCommonDebugFunctionPlayer setConsistentStateTo:](self, "setConsistentStateTo:", v4);
    if (v5)
      v9 = 2952790016;
    else
      v9 = 0x10000000;
    objc_msgSend(v8, "setStatOptions:", v9);
  }

}

- (void)setConsistentStateTo:(unsigned int)a3
{
  uint64_t v3;
  objc_object *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[DYMTLFunctionPlayer device](self, "device");
  v4 = (objc_object *)objc_claimAutoreleasedReturnValue();
  DYMTLGetOriginalObject(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setConsistentGPUPerfStateTo:", v3);

}

- (void)prepareForCaptureExecution
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYFunctionPlayer prepareForCaptureExecution](&v4, sel_prepareForCaptureExecution);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  self->_lastEncoderID = 0;
  self->_disableWireframe = 0;
  -[DYMTLCommonDebugFunctionPlayer resetFunctionPlayerData](self, "resetFunctionPlayerData");
  -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetLayersVisibility");
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->super._drawableMap);

}

- (void)_endEncodingForAllRemainingEncoders:(void *)a3
{
  uint64_t *v3;
  DYMTLCommonDebugFunctionPlayer *v4;
  char **v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;

  v3 = (uint64_t *)*((_QWORD *)a3 + 2);
  if (v3)
  {
    v4 = self;
    v5 = &selRef_setDepthStoreActionOptions_;
    while (*((_BYTE *)v3 + 48))
    {
LABEL_42:
      v3 = (uint64_t *)*v3;
      if (!v3)
        return;
    }
    -[DYMTLFunctionPlayer objectForKey:](v4, "objectForKey:", v3[2]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "conformsToProtocol:", v5[486]))
    {
      if (objc_msgSend((id)objc_msgSend(v37, "performSelector:", sel_parent), "conformsToProtocol:", &unk_256BDE6D8))
      {
        DYMTLGetAssociatedObject(v37, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 8; ++i)
        {
          objc_msgSend(v6, "colorAttachments");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "texture");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v6, "colorAttachments");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "storeAction");

            if (v13 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v37, "setColorStoreAction:atIndex:", 1, i);
          }
          else
          {

          }
        }
        objc_msgSend(v6, "depthAttachment");
        v4 = self;
        v5 = &selRef_setDepthStoreActionOptions_;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "texture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v6, "depthAttachment");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "storeAction");

          if (v17 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v37, "setDepthStoreAction:", 1);
        }
        else
        {

        }
        objc_msgSend(v6, "stencilAttachment");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "texture");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v6, "stencilAttachment");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "storeAction");

          if (v35 != 4 || (objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_40;
          goto LABEL_33;
        }
        goto LABEL_39;
      }
    }
    else if (objc_msgSend(v37, "conformsToProtocol:", &unk_256BDE828))
    {
      DYMTLGetAssociatedObject(v37, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j != 8; ++j)
      {
        objc_msgSend(v6, "colorAttachments");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "texture");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v6, "colorAttachments");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", j);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "storeAction");

          if (v24 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v37, "setColorStoreAction:atIndex:", 1, j);
        }
        else
        {

        }
      }
      objc_msgSend(v6, "depthAttachment");
      v4 = self;
      v5 = &selRef_setDepthStoreActionOptions_;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "texture");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v6, "depthAttachment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "storeAction");

        if (v28 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v37, "setDepthStoreAction:", 1);
      }
      else
      {

      }
      objc_msgSend(v6, "stencilAttachment");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "texture");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v6, "stencilAttachment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "storeAction");

        if (v32 != 4 || (objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_40;
LABEL_33:
        objc_msgSend(v37, "setStencilStoreAction:", 1);
LABEL_40:

        goto LABEL_41;
      }
LABEL_39:

      goto LABEL_40;
    }
LABEL_41:
    objc_msgSend(v37, "endEncoding");
    *((_BYTE *)v3 + 48) = 1;

    goto LABEL_42;
  }
}

- (void)commitEncodersAndCommandBuffers
{
  MTLRenderPassDescriptor *currentParallelDescriptor;
  _QWORD *i;
  void *v5;

  -[DYMTLCommonDebugFunctionPlayer _endEncodingForAllRemainingEncoders:](self, "_endEncodingForAllRemainingEncoders:", &self->_encoderMap);
  -[DYMTLCommonDebugFunctionPlayer _endEncodingForAllRemainingEncoders:](self, "_endEncodingForAllRemainingEncoders:", &self->_parallelEncoderMap);
  currentParallelDescriptor = self->_currentParallelDescriptor;
  self->_currentParallelDescriptor = 0;

  self->_currentParallelId = 0;
  for (i = self->_commandBufferMap.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    if (!*((_BYTE *)i + 32))
    {
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", i[2]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commit");
      *((_BYTE *)i + 32) = 1;

    }
  }
}

- (void)waitForCommmandBuffersCompletion
{
  _QWORD *i;
  void *v4;

  for (i = self->_commandQueueSet.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", i[2]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finish");

  }
}

- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTextureType:", 2);
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
  v15 = objc_msgSend(v12, "width");
  if (v15 >> a4 <= 1)
    v16 = 1;
  else
    v16 = v15 >> a4;
  objc_msgSend(v14, "setWidth:", v16);
  v17 = objc_msgSend(v12, "height");
  if (v17 >> a4 <= 1)
    v18 = 1;
  else
    v18 = v17 >> a4;
  objc_msgSend(v14, "setHeight:", v18);
  if (!self->_isAGXDevice)
    objc_msgSend(v14, "setResourceOptions:", 32);
  if ((objc_msgSend(v12, "isFramebufferOnly") & 1) != 0)
  {
    v19 = v12;
  }
  else
  {
    -[DYMTLFunctionPlayer device](self, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v20, v14);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "textureType") == 4 || objc_msgSend(v12, "textureType") == 8)
    {
      objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "colorAttachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setTexture:", v12);
      objc_msgSend(v23, "setLevel:", a4);
      objc_msgSend(v23, "setSlice:", a5);
      objc_msgSend(v23, "setDepthPlane:", a6);
      objc_msgSend(v23, "setResolveTexture:", v19);
      objc_msgSend(v23, "setLoadAction:", 1);
      objc_msgSend(v23, "setStoreAction:", 2);
      DYMTLNewStatefulRenderCommandEncoder(v13, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endEncoding");

    }
    else
    {
      objc_msgSend(v13, "blitCommandEncoder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = 0;
      v28[1] = 0;
      v28[2] = a6;
      v27[0] = objc_msgSend(v19, "width");
      v27[1] = objc_msgSend(v19, "height");
      v27[2] = 1;
      memset(v26, 0, sizeof(v26));
      objc_msgSend(v21, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v12, a5, a4, v28, v27, v19, 0, 0, v26);
      objc_msgSend(v21, "endEncoding");
    }

  }
  return v19;
}

- (void)presentDrawable
{
  unint64_t *p_lastEncoderID;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  BOOL v44;
  __int16 v45;
  unsigned __int8 v46;
  double v47;
  double v48;
  double v49;
  double v50;
  DYMTLTextureRenderer *textureRenderer;
  void *v52;
  void *v53;
  BOOL v54;
  double v55;
  double v56;
  double v57;
  double v58;
  DYMTLTextureRenderer *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  void *context;
  void *v67;
  id v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[40];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  p_lastEncoderID = &self->_lastEncoderID;
  if (self->_lastEncoderID)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v74, 1, 1);
    v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, p_lastEncoderID);
    if (!v4)
      goto LABEL_45;
    v5 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 5);
    if (v5)
    {
      v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, v5 + 3);
      if (!v4)
        goto LABEL_45;
    }
    if (!v4[5])
      goto LABEL_45;
    -[DYMTLCommonDebugFunctionPlayer _attachmentInfoForCommandEncoderID:](self, "_attachmentInfoForCommandEncoderID:");
    if (!v70)
      goto LABEL_45;
    v6 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 3);
    if (!v6)
      goto LABEL_45;
    v68 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
    v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_textureToDrawableMap.__table_.__bucket_list_.__ptr_.__value_, &v70);
    v69 = 0;
    if (v7)
    {
      v69 = v7[3];
      v8 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_drawableIdToLayerIdMap.__table_.__bucket_list_.__ptr_.__value_, &v69);
      v9 = v69;
      if (v8)
      {
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v69);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "texture");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v8[3];
        v9 = v69;
        goto LABEL_13;
      }
    }
    else
    {
      v9 = 0;
    }
    v11 = 0;
    v12 = -1;
LABEL_13:
    -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](self, "replayerLayerForDrawableId:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == -1)
    {
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v70);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v11 = 0;
        v29 = 0;
        v28 = 0;
LABEL_44:

LABEL_45:
        GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v74);
        return;
      }
      v15 = objc_msgSend(v14, "width");
      if (v15 >> v71 <= 1)
        v16 = 1;
      else
        v16 = v15 >> v71;
      v17 = objc_msgSend(v14, "height");
      if (v17 >> v71 <= 1)
        v18 = 1;
      else
        v18 = v17 >> v71;
      v19 = (void *)objc_opt_class();
      -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "boundsForCurrentInterfaceOrientation");
      objc_msgSend(v19, "shrinkSourceSize:toDestSize:", (double)v16, (double)v18);
      v22 = v21;
      v24 = v23;

      objc_msgSend(v13, "setBounds:", 0.0, 0.0, v22, v24);
      objc_msgSend(v13, "setDrawableSize:", (double)(unint64_t)objc_msgSend(v14, "width"), (double)(unint64_t)objc_msgSend(v14, "height"));
      -[DYMTLFunctionPlayer device](self, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDevice:", v25);

      objc_msgSend(v13, "setPixelFormat:", 80);
      -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultContentsScale");
      objc_msgSend(v13, "setContentsScale:");

      v11 = v14;
    }
    context = (void *)MEMORY[0x242623ED8]();
    do
    {
      objc_msgSend(v13, "nextDrawable");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
    }
    while (!v27);
    objc_msgSend(v27, "texture");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && v11)
    {
      -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v6[3]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "commandBuffer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setTexture:", v29);
      objc_msgSend(v31, "setLoadAction:", 2);
      objc_msgSend(v31, "setStoreAction:", 1);
      objc_msgSend(v31, "setClearColor:", 0.0, 0.0, 0.0, 1.0);
      if (!v69)
      {
        v32 = v11;
        v33 = v32;
        if ((objc_msgSend(v32, "pixelFormat") & 0xFFFFFFFFFFFFFFFELL) == 0x226)
        {
          objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v29, "pixelFormat"), objc_msgSend(v29, "width"), objc_msgSend(v29, "height"), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "device");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          DYMTLNewTexture(v35, v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v33, "storageMode") == 3)
        {
          v36 = (void *)sMemorylessTexturesAndReplacements;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            v39 = v38;
          else
            v39 = v33;
          v40 = v39;

          v33 = v40;
        }
        -[DYMTLCommonDebugFunctionPlayer _texture2DFromTexture:level:slice:depthPlane:commandBuffer:](self, "_texture2DFromTexture:level:slice:depthPlane:commandBuffer:", v33, v71, v72, v73, v67);
        v41 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v41;
      }
      DYMTLNewStatefulRenderCommandEncoder(v67, v65);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLTextureRenderer renderTexture:withEncoder:enableBlending:layerIndex:](self->_textureRenderer, "renderTexture:withEncoder:enableBlending:layerIndex:", v11, v42, 0, 0);
      if (objc_msgSend(v68, "enableWireframePresent"))
      {
        if (!self->_disableWireframe)
        {
          -[DYMTLDebugWireframeRenderer wireframeTexture](self->_wireframeRenderer, "wireframeTexture");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43 == 0;

          if (!v44)
          {
            v63 = objc_msgSend(v68, "wireframeLineColor");
            v62 = objc_msgSend(v68, "wireframeLineColor");
            v45 = objc_msgSend(v68, "wireframeLineColor");
            v46 = objc_msgSend(v68, "wireframeLineColor");
            *(float *)&v47 = (float)(v63 & 0xFF000000) / 4278200000.0;
            *(float *)&v48 = (float)(v62 & 0xFF0000) / 16712000.0;
            *(float *)&v49 = (float)(v45 & 0xFF00) / 65280.0;
            *(float *)&v50 = (float)v46 / 255.0;
            -[DYMTLTextureRenderer setBlendColorRed:green:blue:alpha:](self->_textureRenderer, "setBlendColorRed:green:blue:alpha:", v47, v48, v49, v50);
            textureRenderer = self->_textureRenderer;
            -[DYMTLDebugWireframeRenderer wireframeTexture](self->_wireframeRenderer, "wireframeTexture");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLTextureRenderer renderTexture:withEncoder:enableBlending:layerIndex:](textureRenderer, "renderTexture:withEncoder:enableBlending:layerIndex:", v52, v42, 1, 0);

          }
        }
      }
      if (objc_msgSend(v68, "enableOutlinePresent"))
      {
        -[DYMTLDebugWireframeRenderer outlineTexture](self->_wireframeRenderer, "outlineTexture");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53 == 0;

        if (!v54)
        {
          LODWORD(v55) = 1.0;
          LODWORD(v56) = 0;
          LODWORD(v57) = 0;
          LODWORD(v58) = 1.0;
          -[DYMTLTextureRenderer setBlendColorRed:green:blue:alpha:](self->_textureRenderer, "setBlendColorRed:green:blue:alpha:", v55, v56, v57, v58);
          v59 = self->_textureRenderer;
          -[DYMTLDebugWireframeRenderer outlineTexture](self->_wireframeRenderer, "outlineTexture");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLTextureRenderer renderTexture:withEncoder:enableBlending:layerIndex:](v59, "renderTexture:withEncoder:enableBlending:layerIndex:", v60, v42, 1, 0);

        }
      }
      objc_msgSend(v42, "endEncoding");
      objc_msgSend(v67, "commit");
      objc_msgSend(v67, "waitUntilCompleted");
      -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "prepareLayerForPresent:", v13);
      objc_msgSend(v28, "present");

    }
    objc_autoreleasePoolPop(context);
    goto LABEL_44;
  }
}

- (id)replayerLayerForDrawableId:(unint64_t)a3
{
  unordered_map<unsigned long long, CAMetalLayer *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, CAMetalLayer *>>> *p_metalLayers;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id *v19;
  unint64_t v21;
  unint64_t *v22;

  v21 = a3;
  p_metalLayers = &self->_metalLayers;
  v5 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_metalLayers.__table_.__bucket_list_.__ptr_.__value_, &v21);
  if (v5)
  {
    v6 = (id)v5[3];
  }
  else
  {
    v7 = (int)*MEMORY[0x24BE39038];
    if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v7), "conformsToProtocol:", &unk_256BDE888))
    {
      v8 = *(id *)((char *)&self->super.super.super.super.isa + v7);
      objc_msgSend(v8, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", v21, 0, 0, 0.0, 0.0, 1.0, 1.0, 1.0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
        v9 = v21 == 0;
      else
        v9 = 1;
      if (!v9)
      {
        objc_msgSend(v8, "boundsForCurrentInterfaceOrientation");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v8, "defaultContentsScale");
        objc_msgSend(v8, "updateLayer:contentRect:contentsScale:properties:", v6, 0, v11, v13, v15, v17, v18);
        objc_msgSend(v6, "setFramebufferOnly:", 0);
        v22 = &v21;
        v19 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_metalLayers, &v21, (uint64_t)&std::piecewise_construct, &v22);
        objc_storeStrong(v19 + 3, v6);
      }

    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (void)updateReplayerLayer:(unint64_t)a3 withOriginalLayer:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _OWORD v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  _QWORD *v19[6];

  v19[5] = *(_QWORD **)MEMORY[0x24BDAC8D0];
  v18 = a3;
  -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = &v18;
  v6 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_metalLayers, &v18, (uint64_t)&std::piecewise_construct, v19)[3];
  GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setBounds:");
  objc_msgSend(v5, "position");
  objc_msgSend(v6, "setPosition:");
  objc_msgSend(v5, "anchorPoint");
  objc_msgSend(v6, "setAnchorPoint:");
  objc_msgSend(v5, "anchorPointZ");
  objc_msgSend(v6, "setAnchorPointZ:");
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
  }
  v9[4] = v14;
  v9[5] = v15;
  v9[6] = v16;
  v9[7] = v17;
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  v9[3] = v13;
  objc_msgSend(v6, "setTransform:", v9);
  objc_msgSend(v6, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
  objc_msgSend(v5, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "device");
  else
    -[DYMTLFunctionPlayer device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevice:", v8);

  objc_msgSend(v5, "contentsScale");
  objc_msgSend(v6, "setContentsScale:");
  objc_msgSend(v6, "setFramebufferOnly:", 0);
  objc_msgSend(v5, "drawableSize");
  objc_msgSend(v6, "setDrawableSize:");
  GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);

}

+ (id)thumbnailTexture:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)sThumbnailTextures;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)sThumbnailTextures;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  return v6;
}

+ (id)harvestableTexture:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)sMemorylessTexturesAndReplacements;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v3;
  if (v6)
  {
    v8 = (void *)sMemorylessTexturesAndReplacements;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)encodeStoreActionForRenderCommandEncoder:(id)a3 withDescriptor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "depthAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "storeAction");

  if (v7 == 4)
    objc_msgSend(v14, "setDepthStoreAction:", 1);
  objc_msgSend(v5, "stencilAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "storeAction");

  if (v9 == 4)
    objc_msgSend(v14, "setStencilStoreAction:", 1);
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v5, "colorAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "storeAction");

    if (v13 == 4)
      objc_msgSend(v14, "setColorStoreAction:atIndex:", 1, i);
  }

}

- (void)encodeStoreActionForParallelRenderCommandEncoder:(id)a3 withDescriptor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v5 = a4;
  objc_msgSend(v5, "depthAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "storeAction");

  if (v7 == 4)
  {
    objc_msgSend(v5, "depthAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolveTexture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = 3;
    else
      v10 = 1;
    objc_msgSend(v24, "setDepthStoreAction:", v10);

  }
  objc_msgSend(v5, "stencilAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "storeAction");

  if (v12 == 4)
  {
    objc_msgSend(v5, "stencilAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resolveTexture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = 3;
    else
      v15 = 1;
    objc_msgSend(v24, "setStencilStoreAction:", v15);

  }
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v5, "colorAttachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "storeAction");

    if (v19 == 4)
    {
      objc_msgSend(v5, "colorAttachments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "resolveTexture");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        v23 = 3;
      else
        v23 = 1;
      objc_msgSend(v24, "setColorStoreAction:atIndex:", v23, i);

    }
  }

}

- (void)_executeGraphicsFunction
{
  uint64_t v3;
  int *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t targetCommandEncoderId;
  BOOL v17;
  void *v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MTLRenderPassDescriptor **p_currentParallelDescriptor;
  _QWORD *v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  _QWORD *v40;
  BOOL v41;
  unint64_t v42;
  _QWORD *v43;
  BOOL v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  uint64_t *p_currentParallelId;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_persistantEncoder2ParallelMap;
  MTLRenderPassDescriptor *currentParallelDescriptor;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  objc_super v61;
  objc_super v62;
  objc_super v63;
  unint64_t v64;
  objc_super v65;
  objc_super v66;
  objc_super v67;
  objc_super v68;
  objc_super v69;
  objc_super v70;
  objc_super v71;
  unint64_t *v72;

  v3 = (int)*MEMORY[0x24BE39040];
  v4 = *(int **)((char *)&self->super.super.super.super.isa + v3);
  v5 = *v4;
  if (*v4 > -16163)
  {
    switch(v5)
    {
      case -16162:
      case -16154:
        goto LABEL_3;
      case -16161:
      case -16153:
        goto LABEL_53;
      case -16160:
      case -16152:
        goto LABEL_60;
      case -16159:
        v39 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        v40 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor)
          v41 = v40 == 0;
        else
          v41 = 1;
        if (!v41 && v40[3] == v39)
          return;
LABEL_3:
        v6 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0);
        v7 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 96, 0);
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "descriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "colorAttachments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "storeAction");

        if (v12 == 4)
        {
          v69.receiver = self;
          v69.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          -[DYMTLFunctionPlayer executeGraphicsFunction](&v69, sel_executeGraphicsFunction);
        }
        goto LABEL_40;
      case -16158:
        v42 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        v43 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor)
          v44 = v43 == 0;
        else
          v44 = 1;
        if (!v44 && v43[3] == v42)
          return;
LABEL_53:
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "descriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "depthAttachment");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "storeAction");

        if (v46 == 4)
        {
          v68.receiver = self;
          v68.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          -[DYMTLFunctionPlayer executeGraphicsFunction](&v68, sel_executeGraphicsFunction);
        }
        goto LABEL_40;
      case -16157:
        v47 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        v48 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor)
          v49 = v48 == 0;
        else
          v49 = 1;
        if (!v49 && v48[3] == v47)
          return;
LABEL_60:
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "descriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stencilAttachment");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "storeAction");

        if (v51 == 4)
        {
          v67.receiver = self;
          v67.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          -[DYMTLFunctionPlayer executeGraphicsFunction](&v67, sel_executeGraphicsFunction);
        }
        goto LABEL_40;
      case -16156:
      case -16155:
        goto LABEL_66;
      default:
        if ((v5 + 7158) < 3)
        {
          v64 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
          -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](self, "replayerLayerForDrawableId:", v64);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "prepareLayerForPresent:", v9);
          v62.receiver = self;
          v62.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          -[DYMTLFunctionPlayer executeGraphicsFunction](&v62, sel_executeGraphicsFunction);
          v72 = &v64;
          v13 = std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v64, (uint64_t)&std::piecewise_construct, &v72);
          goto LABEL_39;
        }
        if (v5 == -16133)
          goto LABEL_38;
        goto LABEL_66;
    }
  }
  if (v5 > -16287)
  {
    switch(v5)
    {
      case -16286:
        v71.receiver = self;
        v71.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v71, sel_executeGraphicsFunction);
        v72 = (unint64_t *)GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 24, 0);
        p_currentParallelId = (uint64_t *)&self->_currentParallelId;
        if (self->_currentParallelId)
        {
          p_persistantEncoder2ParallelMap = &self->_persistantEncoder2ParallelMap;
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_persistantEncoder2ParallelMap, (unint64_t *)&v72);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned long long &>((uint64_t)p_persistantEncoder2ParallelMap, (unint64_t *)&v72, &v72, p_currentParallelId);
        }
        break;
      case -16285:
        currentParallelDescriptor = self->_currentParallelDescriptor;
        self->_currentParallelDescriptor = 0;

        self->_currentParallelId = 0;
        v70.receiver = self;
        v70.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v70, sel_executeGraphicsFunction);
        break;
      case -16195:
LABEL_15:
        -[DYFunctionPlayer processArguments](self, "processArguments");
        self->_isTileRenderPassDescriptor = 0;
        GPUTools::MTL::MakeMTLRenderPassDescriptor(**(_QWORD **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x24BE39008]), (uint64_t)-[DYMTLFunctionPlayer objectMap](self, "objectMap"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 24, 0);
        v15 = v14;
        targetCommandEncoderId = self->_targetCommandEncoderId;
        if (targetCommandEncoderId)
          v17 = v14 == targetCommandEncoderId;
        else
          v17 = 0;
        if (v17)
          -[DYMTLCommonDebugFunctionPlayer _modifyDescriptorForStore:](self, "_modifyDescriptorForStore:", obj);
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _modifyDescriptorForLayering:withBuffer:](self, "_modifyDescriptorForLayering:withBuffer:", obj, v18);
        if (**(_DWORD **)((char *)&self->super.super.super.super.isa + v3) == -16353)
        {
          v19 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
          if (objc_msgSend(v19, "playbackMode") == 10
            || objc_msgSend(v19, "playbackMode") == 13)
          {
            for (i = 0; i != 8; ++i)
            {
              objc_msgSend(obj, "colorAttachments", obj);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectAtIndexedSubscript:", i);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v22);

              objc_msgSend(obj, "colorAttachments");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectAtIndexedSubscript:", i);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "resolveTexture");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(obj, "colorAttachments");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectAtIndexedSubscript:", i);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                objc_msgSend(v27, "setStoreAction:", 3);
              else
                objc_msgSend(v27, "setStoreAction:", 1);

            }
            objc_msgSend(obj, "depthAttachment");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v28);

            objc_msgSend(obj, "depthAttachment");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "resolveTexture");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(obj, "depthAttachment");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v31, "setStoreAction:", 3);
            else
              objc_msgSend(v31, "setStoreAction:", 1);

            objc_msgSend(obj, "stencilAttachment");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v55);

            objc_msgSend(obj, "stencilAttachment");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "resolveTexture");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(obj, "stencilAttachment");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
              objc_msgSend(v58, "setStoreAction:", 3);
            else
              objc_msgSend(v58, "setStoreAction:", 1);

          }
          DYMTLNewStatefulRenderCommandEncoder(v18, obj);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v59, v15);
          -[DYMTLCommonDebugFunctionPlayer encodeStoreActionForRenderCommandEncoder:withDescriptor:](self, "encodeStoreActionForRenderCommandEncoder:withDescriptor:", v59, obj);

        }
        else
        {
          p_currentParallelDescriptor = &self->_currentParallelDescriptor;
          objc_storeStrong((id *)&self->_currentParallelDescriptor, obj);
          self->_currentParallelId = v15;
          v33 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
          if (v33 && v33[3] == v15)
          {
            for (j = 0; j != 8; ++j)
            {
              -[MTLRenderPassDescriptor colorAttachments](*p_currentParallelDescriptor, "colorAttachments", obj);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectAtIndexedSubscript:", j);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v36);

            }
            -[MTLRenderPassDescriptor depthAttachment](*p_currentParallelDescriptor, "depthAttachment");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v37);

            -[MTLRenderPassDescriptor stencilAttachment](*p_currentParallelDescriptor, "stencilAttachment");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v38);

            -[DYMTLCommonDebugFunctionPlayer _modifyDescriptorForStore:](self, "_modifyDescriptorForStore:", *p_currentParallelDescriptor);
          }
          DYMTLNewStatefulParallelRenderCommandEncoder(v18, obj);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v19, v15);
          -[DYMTLCommonDebugFunctionPlayer encodeStoreActionForParallelRenderCommandEncoder:withDescriptor:](self, "encodeStoreActionForParallelRenderCommandEncoder:withDescriptor:", v19, obj);
        }

        break;
      default:
LABEL_66:
        v61.receiver = self;
        v61.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v61, sel_executeGraphicsFunction);
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case -16359:
      case -16358:
LABEL_38:
        v64 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 18), 0);
        -[DYMTLCommonFunctionPlayer layerManager](self, "layerManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer replayerLayerForDrawableId:](self, "replayerLayerForDrawableId:", v64);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "prepareLayerForPresent:", v9);
        v63.receiver = self;
        v63.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v63, sel_executeGraphicsFunction);
        v72 = &v64;
        v13 = std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v64, (uint64_t)&std::piecewise_construct, &v72);
LABEL_39:
        *((_BYTE *)v13 + 24) = 0;
LABEL_40:

        break;
      case -16354:
        if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]), "playbackMode") == 9)-[DYMTLCommonDebugFunctionPlayer _updateRemainingCommandsForEncoder](self, "_updateRemainingCommandsForEncoder");
        v65.receiver = self;
        v65.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v65, sel_executeGraphicsFunction);
        break;
      case -16353:
      case -16351:
        goto LABEL_15;
      case -16352:
        v66.receiver = self;
        v66.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        -[DYMTLFunctionPlayer executeGraphicsFunction](&v66, sel_executeGraphicsFunction);
        self->_bSetStageInRegion = 0;
        self->_stageInIndirectBufferId = 0;
        break;
      default:
        goto LABEL_66;
    }
  }
}

- (AttachmentInfo)_attachmentInfoForCommandEncoderID:(SEL)a3
{
  __int128 v5;
  AttachmentInfo *result;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __n128 (*v10)(uint64_t, uint64_t);
  uint64_t (*v11)();
  const char *v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;

  v15 = a4;
  v7 = 0;
  v8 = &v7;
  v9 = 0x5012000000;
  v10 = __Block_byref_object_copy__600;
  v11 = __Block_byref_object_dispose__601;
  v12 = "";
  v13 = 0u;
  v14 = 0u;
  if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, &v15))
  {
    GPUTools::MTL::Utils::EnumerateValidAttachmentsForType();
  }
  v5 = *((_OWORD *)v8 + 4);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->var2 = v5;
  _Block_object_dispose(&v7, 8);
  return result;
}

uint64_t __69__DYMTLCommonDebugFunctionPlayer__attachmentInfoForCommandEncoderID___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  *a5 = 1;
  if ((a2[9] & 0xFFFFFFFELL) == 2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    result = a1 + 32;
    v7 = a2[5];
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 48) = a2[4];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 8) + 56) = v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 8) + 64) = a2[6];
    v8 = a2 + 7;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    result = a1 + 32;
    v10 = a2[1];
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 48) = *a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 8) + 56) = v10;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 8) + 64) = a2[2];
    v8 = a2 + 3;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 8) + 72) = *v8;
  return result;
}

- (void)_addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 forEncoder:(unint64_t)a4
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t *v7;

  v6 = a4;
  v7 = &v6;
  v5 = std::__hash_table<std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_commandEncoderDescriptorMap, (uint64_t *)&v6, (uint64_t)&std::piecewise_construct, &v7);
  memcpy(v5 + 3, a3, 0x63BuLL);
}

- (void)_addRenderPassDescriptorToEncoderMapFromArgumentPointer:(void *)a3 forEncoder:(unint64_t)a4
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE v8[8];
  uint64_t v9;
  _BYTE v10[64];
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = 0;
  v6 = 16;
  do
  {
    v7 = &v8[v6];
    *((_OWORD *)v7 + 2) = 0uLL;
    *((_OWORD *)v7 + 3) = 0uLL;
    *(_OWORD *)v7 = 0uLL;
    *((_OWORD *)v7 + 1) = 0uLL;
    *((_QWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 9) = 1;
    *((_OWORD *)v7 + 5) = 0uLL;
    *((_OWORD *)v7 + 6) = 0uLL;
    *((_QWORD *)v7 + 14) = 0x3FF0000000000000;
    v6 += 144;
    *((_QWORD *)v7 + 16) = 0;
    *((_QWORD *)v7 + 17) = 0;
  }
  while (v7 + 144 != v10);
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v12 = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0x3FF0000000000000;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  v22 = 1;
  v24 = 0u;
  v23 = 0u;
  v25 = 0x3FF0000000000000;
  v27 = 0;
  v26 = 0;
  GPUTools::MTL::Utils::MakeDYMTLRenderPassDescriptor(*(GPUTools::MTL::Utils **)a3, v8, (DYMTLRenderPassDescriptor *)a3);
  -[DYMTLCommonDebugFunctionPlayer _addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:forEncoder:](self, "_addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:forEncoder:", v8, a4);
}

- (void)_trackObjects
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int v10;
  int v11;
  int v12;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_textureToDrawableMap;
  unint64_t *v14;
  _QWORD *v15;
  unordered_map<unsigned long long, CommandBufferInfo, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, CommandBufferInfo>>> *p_commandBufferMap;
  uint64_t v17;
  unordered_map<unsigned long long, EncoderInfo, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, EncoderInfo>>> *p_encoderMap;
  _QWORD *v19;
  unint64_t v20;
  __int128 v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;

  v3 = (int)*MEMORY[0x24BE39040];
  v25 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0);
  v4 = -[DYMTLCommonDebugFunctionPlayer _isFunctionCommandEncoderCreation](self, "_isFunctionCommandEncoderCreation");
  if (-[DYMTLCommonDebugFunctionPlayer _isReceiverTypeCommandEncoderRelated](self, "_isReceiverTypeCommandEncoderRelated")|| v4)
  {
    v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v3);
    v6 = v5 + 48;
    v7 = v5 + 24;
    if (v4)
      v8 = v7;
    else
      v8 = v6;
    self->_lastEncoderID = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v8, 0);
    self->_disableWireframe = v4;
  }
  v9 = *(int **)((char *)&self->super.super.super.super.isa + v3);
  v10 = *v9;
  if (*v9 <= -16247)
  {
    if (v10 <= -16339)
    {
      if (v10 <= -16344)
      {
        switch(v10)
        {
          case -16363:
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
            goto LABEL_59;
          case -16362:
          case -16360:
          case -16359:
          case -16358:
          case -16357:
          case -16356:
          case -16355:
            return;
          case -16361:
            goto LABEL_30;
          case -16354:
          case -16352:
            goto LABEL_60;
          case -16353:
            goto LABEL_47;
          case -16351:
            v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
            v21 = v25;
            v22 = v24;
            v23 = 0;
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_parallelEncoderMap, &v24, &v24, &v21);
            -[DYMTLCommonDebugFunctionPlayer _addRenderPassDescriptorToEncoderMapFromArgumentPointer:forEncoder:](self, "_addRenderPassDescriptorToEncoderMapFromArgumentPointer:forEncoder:", *(void **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x24BE39008]), v24);
            return;
          default:
            if (v10 == -16383)
              goto LABEL_58;
            v12 = -16376;
            goto LABEL_42;
        }
      }
      if ((v10 + 16343) >= 2)
        return;
LABEL_53:
      v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
      p_commandBufferMap = &self->_commandBufferMap;
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_commandBufferMap, &v24);
      *(_QWORD *)&v21 = v25;
      BYTE8(v21) = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CommandBufferInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,CommandBufferInfo>((uint64_t)p_commandBufferMap, &v24, &v24, &v21);
      return;
    }
    if (v10 > -16288)
    {
      switch(v10)
      {
        case -16287:
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
          break;
        case -16286:
          v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
          v19 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
          v21 = (unint64_t)v19[3];
          v22 = v24;
          v23 = 0;
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_encoderMap, &v24, &v24, &v21);
          v20 = v25;
          *(_QWORD *)&v21 = &v24;
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_encoderToParallelEncoderMap, &v24, (uint64_t)&std::piecewise_construct, (_QWORD **)&v21)[3] = v20;
          break;
        case -16285:
          v17 = 1912;
          goto LABEL_55;
        case -16280:
          goto LABEL_58;
        case -16279:
          goto LABEL_49;
        default:
          return;
      }
      return;
    }
    if ((v10 + 16316) >= 2)
    {
      if (v10 != -16338)
      {
        v12 = -16325;
        goto LABEL_42;
      }
      goto LABEL_58;
    }
LABEL_37:
    *(_QWORD *)&v21 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&self->_commandQueueSet, (unint64_t *)&v21, &v21);
    return;
  }
  if (v10 > -15890)
  {
    if (v10 > -15790)
    {
      if (v10 <= -15351)
      {
        if (v10 == -15789)
          goto LABEL_54;
        v11 = -15701;
      }
      else
      {
        if (v10 == -15350)
          goto LABEL_37;
        if (v10 == -15343)
          goto LABEL_30;
        v11 = -12544;
      }
      if (v10 != v11)
        return;
      goto LABEL_53;
    }
    if (v10 <= -15871)
    {
      if (v10 != -15889)
      {
        v12 = -15884;
LABEL_42:
        if (v10 != v12)
          return;
        goto LABEL_54;
      }
LABEL_58:
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
LABEL_59:
      self->_lastEncoderID = 0;
      return;
    }
    if (v10 != -15870)
    {
      if (v10 != -15790)
        return;
      goto LABEL_58;
    }
LABEL_60:
    v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
    p_encoderMap = &self->_encoderMap;
    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderMap, &v24);
    v22 = 0;
    v21 = v25;
    v23 = 0;
    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)p_encoderMap, &v24, &v24, &v21);
    return;
  }
  if (v10 > -16171)
  {
    if ((v10 + 16014) >= 2)
    {
      if (v10 == -16170)
        goto LABEL_54;
      if (v10 != -15908)
        return;
LABEL_30:
      *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, &v25)+ 32) = 1;
      return;
    }
    goto LABEL_60;
  }
  if (v10 <= -16196)
  {
    if (v10 != -16246)
    {
      if (v10 != -16238)
        return;
      p_textureToDrawableMap = &self->_textureToDrawableMap;
      v14 = &v25;
LABEL_48:
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_textureToDrawableMap, v14);
      return;
    }
LABEL_54:
    v17 = 1872;
LABEL_55:
    *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((Class *)((char *)&self->super.super.super.super.isa + v17), &v25)+ 48) = 1;
    return;
  }
  switch(v10)
  {
    case -16195:
LABEL_47:
      v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
      v21 = v25;
      v22 = v24;
      v23 = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_encoderMap, &v24, &v24, &v21);
      -[DYMTLCommonDebugFunctionPlayer _addRenderPassDescriptorToEncoderMapFromArgumentPointer:forEncoder:](self, "_addRenderPassDescriptorToEncoderMapFromArgumentPointer:forEncoder:", *(void **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x24BE39008]), v24);
      p_textureToDrawableMap = &self->_encoderToParallelEncoderMap;
      v14 = &v24;
      goto LABEL_48;
    case -16193:
      goto LABEL_58;
    case -16192:
LABEL_49:
      v15 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
      v15[4] = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 72, 0);
      break;
  }
}

- (void)_forceAttachmentLoadActionToLoad:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(v5, "loadAction");

    if (!v4)
      objc_msgSend(v5, "setLoadAction:", 1);
  }

}

- (void)_forceAttachmentStoreActionToStore:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(v7, "storeAction"))
    {
      v4 = objc_msgSend(v7, "storeAction");

      if (v4 != 4)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(v7, "resolveTexture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 3;
    else
      v6 = 1;
    objc_msgSend(v7, "setStoreAction:", v6);

  }
LABEL_10:

}

- (void)_updateMemorylessTextures:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "storageMode") == 3)
  {
    v5 = (void *)sMemorylessTexturesAndReplacements;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      DYMTLGetAssociatedObject(v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStorageMode:", 2);
      -[DYMTLFunctionPlayer device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      DYMTLNewTexture(v9, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_15;
      v10 = (void *)sMemorylessTexturesAndReplacements;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

    }
    if (!objc_msgSend(v20, "loadAction"))
      objc_msgSend(v20, "setLoadAction:", 2);
    objc_msgSend(v20, "setTexture:", v7);

  }
  objc_msgSend(v20, "resolveTexture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v20, "resolveTexture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "storageMode") == 3)
    {
      v13 = (void *)sMemorylessTexturesAndReplacements;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        DYMTLGetAssociatedObject(v8, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setStorageMode:", 2);
        -[DYMTLFunctionPlayer device](self, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLNewTexture(v17, v16);
        v15 = objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
LABEL_14:

          goto LABEL_15;
        }
        v18 = (void *)sMemorylessTexturesAndReplacements;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v19);

      }
      objc_msgSend(v20, "setResolveTexture:", v15);
      v16 = (void *)v15;
      goto LABEL_14;
    }
LABEL_15:

  }
}

- (id)_generateDummyPipeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  MTLFunction *v10;
  MTLFunction *nopDrawVertexFunction;
  MTLFunction *v12;
  MTLFunction *nopDrawFragFunction;
  MTLFunction *v14;
  MTLFunction *nopTileFunction;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    DYMTLGetAssociatedObject(v4, 2u);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
    if (!self->_nopDrawVertexFunction)
    {
      -[DYMTLFunctionPlayer device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v8 = (void *)objc_msgSend(v7, "newLibraryWithSource:options:error:", CFSTR("#include <metal_stdlib>\n\nusing namespace metal;\n\nstruct TransformMatrices\n{\n    float4 modelview_projection_matrix[4];\n};\n\nstruct VertexOutput\n{\n    float4 pos [[position]];\n    float4 color;\n};\n\nvertex VertexOutput defaultVertexProgram(uint vid [[ vertex_id ]])\n{\n    VertexOutput out;\n\n    out.pos   = float4(0.0, 0.0, 0.0, 1.0);\n    out.color = float4(0.0, 0.0, 0.0, 1.0);\n\n    return out;\n}\n\nfragment float4 defaultFragmentProgram(VertexOutput vo [[ stage_in ]])\n{\n    return float4(vo.color.bgr, 1.0f);\n}\n\nkernel void defaultKernel()\n{\n\n}\n\n"),
                     0,
                     &v23);
      v9 = v23;

      v10 = (MTLFunction *)objc_msgSend(v8, "newFunctionWithName:", CFSTR("defaultVertexProgram"));
      nopDrawVertexFunction = self->_nopDrawVertexFunction;
      self->_nopDrawVertexFunction = v10;

      v12 = (MTLFunction *)objc_msgSend(v8, "newFunctionWithName:", CFSTR("defaultFragmentProgram"));
      nopDrawFragFunction = self->_nopDrawFragFunction;
      self->_nopDrawFragFunction = v12;

      v14 = (MTLFunction *)objc_msgSend(v8, "newFunctionWithName:", CFSTR("defaultKernel"));
      nopTileFunction = self->_nopTileFunction;
      self->_nopTileFunction = v14;

    }
    DYMTLGetNullableAssociatedObject(v5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    if (v17)
    {
      if (!self->_nopDrawVertexFunction || !self->_nopDrawFragFunction)
      {
        v19 = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v17, "setVertexFunction:");
      objc_msgSend(v17, "setFragmentFunction:", self->_nopDrawFragFunction);
      -[DYMTLFunctionPlayer device](self, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "newRenderPipelineStateWithDescriptor:error:", v17, 0);
    }
    else
    {
      DYMTLGetNullableAssociatedObject(v5, 1u);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v20, "copy");

      if (v18 && self->_nopTileFunction)
      {
        objc_msgSend(v18, "setTileFunction:");
        -[DYMTLFunctionPlayer device](self, "device");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v21, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v18, 0, 0, 0);

      }
      else
      {
        v19 = 0;
      }
    }

    goto LABEL_17;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)_swizzleAttachmentTextureForLoad:(id)a3 withBuffer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "texture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    DYMTLGetAssociatedObject(v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRotation:", 0);
    if ((objc_msgSend(v10, "usage") & 1) == 0)
    {
      objc_msgSend(v10, "setUsage:", objc_msgSend(v10, "usage") | 5);
      -[DYMTLFunctionPlayer device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      DYMTLNewTexture(v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "loadAction") == 1)
      {
        objc_msgSend(v7, "blitCommandEncoder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "slice");
        v14 = objc_msgSend(v6, "level");
        v20[0] = 0;
        v20[1] = 0;
        v20[2] = objc_msgSend(v6, "depthPlane");
        v19[0] = objc_msgSend(v9, "width");
        v19[1] = objc_msgSend(v9, "height");
        v19[2] = 1;
        v15 = objc_msgSend(v6, "slice");
        v16 = objc_msgSend(v6, "level");
        v18[0] = 0;
        v18[1] = 0;
        v18[2] = objc_msgSend(v6, "depthPlane");
        objc_msgSend(v13, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v9, v17, v14, v20, v19, v12, v15, v16, v18);
        objc_msgSend(v13, "endEncoding");

      }
      objc_msgSend(v6, "setTexture:", v12);
      -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v12, v12);

    }
  }

}

- (void)_modifyDescriptorForLayering:(id)a3 withBuffer:(id)a4
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a3;
  v6 = a4;
  v7 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
  if (objc_msgSend(v7, "playbackMode") != 7)
    goto LABEL_23;
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v46, "colorAttachments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _forceAttachmentLoadActionToLoad:](self, "_forceAttachmentLoadActionToLoad:", v10);

    objc_msgSend(v46, "colorAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v12);

    objc_msgSend(v46, "colorAttachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v46, "colorAttachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "texture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v46, "colorAttachments");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v19);

        objc_msgSend(v46, "colorAttachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _swizzleAttachmentTextureForLoad:withBuffer:](self, "_swizzleAttachmentTextureForLoad:withBuffer:", v21, v6);

        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(v46, "colorAttachments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:atIndexedSubscript:", 0, i);
LABEL_8:

  }
  objc_msgSend(v46, "depthAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v46, "stencilAttachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v46, "depthAttachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "texture");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stencilAttachment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "texture");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 == v27)
      {
        objc_msgSend(v46, "depthAttachment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v28);

        objc_msgSend(v46, "depthAttachment");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _swizzleAttachmentTextureForLoad:withBuffer:](self, "_swizzleAttachmentTextureForLoad:withBuffer:", v29, v6);

        objc_msgSend(v46, "depthAttachment");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "texture");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stencilAttachment");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTexture:", v31);

        goto LABEL_21;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v46, "depthAttachment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLCommonDebugFunctionPlayer _forceAttachmentLoadActionToLoad:](self, "_forceAttachmentLoadActionToLoad:", v33);

  objc_msgSend(v46, "depthAttachment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v34);

  objc_msgSend(v46, "depthAttachment");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35
    && (objc_msgSend(v46, "depthAttachment"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v36, "texture"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v37,
        v36,
        v35,
        v37))
  {
    objc_msgSend(v46, "depthAttachment");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v38);

    objc_msgSend(v46, "depthAttachment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _swizzleAttachmentTextureForLoad:withBuffer:](self, "_swizzleAttachmentTextureForLoad:withBuffer:", v39, v6);

  }
  else
  {
    objc_msgSend(v46, "setDepthAttachment:", 0);
  }
  objc_msgSend(v46, "stencilAttachment");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLCommonDebugFunctionPlayer _forceAttachmentLoadActionToLoad:](self, "_forceAttachmentLoadActionToLoad:", v40);

  objc_msgSend(v46, "stencilAttachment");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v41);

  objc_msgSend(v46, "stencilAttachment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42
    && (objc_msgSend(v46, "stencilAttachment"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v43, "texture"),
        v44 = (void *)objc_claimAutoreleasedReturnValue(),
        v44,
        v43,
        v42,
        v44))
  {
    objc_msgSend(v46, "stencilAttachment");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v45);

    objc_msgSend(v46, "stencilAttachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _swizzleAttachmentTextureForLoad:withBuffer:](self, "_swizzleAttachmentTextureForLoad:withBuffer:", v30, v6);
LABEL_21:

  }
  else
  {
    objc_msgSend(v46, "setStencilAttachment:", 0);
  }
LABEL_23:

}

- (void)_modifyDescriptorForStore:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
  if (objc_msgSend(v4, "playbackMode") == 4 || !objc_msgSend(v4, "playbackMode"))
  {
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend(v21, "colorAttachments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v7);

      objc_msgSend(v21, "colorAttachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "texture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "colorAttachments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v12);

      }
      else
      {
        objc_msgSend(v11, "setObject:atIndexedSubscript:", 0, i);
      }

    }
    objc_msgSend(v21, "depthAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v13);

    objc_msgSend(v21, "depthAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "texture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v21, "depthAttachment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v16);

    }
    else
    {
      objc_msgSend(v21, "setDepthAttachment:", 0);
    }
    objc_msgSend(v21, "stencilAttachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLCommonDebugFunctionPlayer _forceAttachmentStoreActionToStore:](self, "_forceAttachmentStoreActionToStore:", v17);

    objc_msgSend(v21, "stencilAttachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "texture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v21, "stencilAttachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLCommonDebugFunctionPlayer _updateMemorylessTextures:](self, "_updateMemorylessTextures:", v20);

    }
    else
    {
      objc_msgSend(v21, "setStencilAttachment:", 0);
    }
  }

}

- (BOOL)_isFunctionCommandEncoderCreation
{
  int v2;

  v2 = **(_DWORD **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39040]);
  return (v2 + 16354) < 3 || (v2 + 16014) < 2 || v2 == -16195;
}

- (BOOL)_isReceiverTypeCommandEncoderRelated
{
  unsigned int v2;

  v2 = GPUTools::MTL::GetFuncEnumReceiverType((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                 + (int)*MEMORY[0x24BE39040]))
     - 21;
  return (v2 < 0x3E) & (0x2002000000200081uLL >> v2);
}

- (BOOL)isBlitSamplingSupported
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer device](&v9, sel_device);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("nvidia"));

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)setupCounterConfigurationAndGetFrameProfilerCounters
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v15, sel_commandQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[DYMTLCommonDebugFunctionPlayer isBlitSamplingSupported](self, "isBlitSamplingSupported"))
      v4 = 41493;
    else
      v4 = 33297;
    objc_msgSend(v3, "setStatLocations:", v4);
    objc_msgSend(v3, "availableCounters");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", self->_statVertices, (_QWORD)v11) & 1) != 0)
          {

            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[NSMutableArray removeObject:](self->_frameCounters, "removeObject:", self->_statVertices);
    -[NSMutableArray removeObject:](self->_frameCounters, "removeObject:", self->_statPixels);
LABEL_15:
    v9 = self->_frameCounters;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)enableStatsSampling:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v7, sel_commandQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setStatEnabled:", v3);
    if (v3)
    {
      objc_msgSend(v6, "setStatOptions:", 1);
      if (self->_isAGXDevice)
      {
        objc_msgSend(v6, "setStatOptions:", 0x10000000);
        objc_msgSend(v6, "setGPUPriority:", 0);
      }
    }
  }

}

- (BOOL)isCounterAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v16, sel_commandQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "availableCounters");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)setupAllStatLocationsWithBlitOption:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v8, sel_commandQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_isAGXDevice)
      v6 = 63;
    else
      v6 = 33297;
    if (!self->_isAGXDevice && v3)
    {
      if (-[DYMTLCommonDebugFunctionPlayer isBlitSamplingSupported](self, "isBlitSamplingSupported", v6))
        v6 = 41493;
      else
        v6 = 33297;
    }
    objc_msgSend(v5, "setStatLocations:", v6);
  }

}

- (void)setupProfilingForCounterLists
{
  void *v3;
  id v4;
  id *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  if (self->_isAGXDevice)
  {
    v10.receiver = self;
    v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    -[DYMTLFunctionPlayer commandQueue](&v10, sel_commandQueue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke_2;
      v8[3] = &unk_250D6FA10;
      v5 = &v9;
      v8[4] = self;
      v9 = v4;
      v6 = v4;
      objc_msgSend(v3, "addPerfSampleHandler:", v8);
LABEL_6:

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    -[DYMTLFunctionPlayer commandQueue](&v13, sel_commandQueue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke;
      v11[3] = &unk_250D6FA10;
      v5 = &v12;
      v11[4] = self;
      v12 = v7;
      v6 = v7;
      objc_msgSend(v3, "addPerfSampleHandler:", v11);
      goto LABEL_6;
    }
  }

}

void __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *__p;
  char *v63;
  char *v64;

  v7 = a2;
  v8 = a3;
  if (v8 && a4)
  {
    v56 = v8;
    v54 = v7;
    v55 = v7;
    v60 = objc_msgSend(v55, "getListIndex");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 5904), "objectAtIndexedSubscript:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v9, "count");

    if (objc_msgSend(v56, "length") < (unint64_t)(8 * v61))
    {
LABEL_50:

      v8 = v56;
      goto LABEL_51;
    }
    v58 = objc_retainAutorelease(v56);
    v10 = objc_msgSend(v58, "bytes");
    v11 = v60;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v10 + 8 * *(unsigned int *)(v12 + 3976));
    if (*(id *)(v12 + 4056) == v55)
    {
      v14 = 4096;
      v15 = v61;
      if (*(_QWORD *)(v12 + 4064) == v13 && v61 == (uint64_t)(*(_QWORD *)(v12 + 4104) - *(_QWORD *)(v12 + 4096)) >> 3)
      {
LABEL_12:
        v22 = 0;
        *(_QWORD *)(v12 + 4056) = v55;
        __p = 0;
        v63 = 0;
        v64 = 0;
        v57 = a4;
        do
        {
          v23 = v14;
          v24 = objc_msgSend(objc_retainAutorelease(v58), "bytes");
          v25 = v61;
          v59 = v22;
          v26 = v24 + 8 * v22 * v61;
          v27 = *(_QWORD *)(a1 + 32);
          v28 = *(_QWORD *)(v26 + 8 * *(unsigned int *)(v27 + 3976));
          v29 = *(_QWORD *)(v26 + 8 * *(unsigned int *)(v27 + 3980));
          if (*(_QWORD *)(v27 + 4080) != v28 || *(_QWORD *)(v27 + 4088) != v29)
          {
            ++*(_QWORD *)(v27 + 4072);
            v31 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 4080);
            *v31 = v28;
            v31[1] = v29;
          }
          v14 = v23;
          if (v61)
          {
            v32 = 0;
            do
            {
              v33 = *(_QWORD *)(a1 + 32);
              v34 = *(unsigned int *)(v33 + 3984);
              if (*(_QWORD *)(v26 + 8 * v34))
              {
                v35 = *(_QWORD *)(v26 + 8 * v32);
                if (((*(_QWORD *)(*(_QWORD *)(v33 + 3912) + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v32) & 1) != 0)
                {
                  v36 = *(_QWORD *)(*(_QWORD *)(v33 + (int)v14) + 8 * v32);
                  v37 = v35 >= v36;
                  v38 = v35 - v36;
                  if (v37)
                    v35 = v38;
                  else
                    v35 = 0;
                }
                v39 = *(_QWORD *)(*(_QWORD *)(v33 + 1808) + 8 * v11) + v32;
                v40 = v63;
                if (v63 >= v64)
                {
                  v42 = a1;
                  v43 = (char *)__p;
                  v44 = 0xAAAAAAAAAAAAAAABLL * ((v63 - (_BYTE *)__p) >> 4);
                  v45 = v44 + 1;
                  if (v44 + 1 > 0x555555555555555)
                    std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                  v46 = v14;
                  if (0x5555555555555556 * ((v64 - (_BYTE *)__p) >> 4) > v45)
                    v45 = 0x5555555555555556 * ((v64 - (_BYTE *)__p) >> 4);
                  if (0xAAAAAAAAAAAAAAABLL * ((v64 - (_BYTE *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                    v47 = 0x555555555555555;
                  else
                    v47 = v45;
                  if (v47)
                  {
                    v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v64, v47);
                    v43 = (char *)__p;
                    v40 = v63;
                  }
                  else
                  {
                    v48 = 0;
                  }
                  v49 = &v48[16 * ((v63 - (_BYTE *)__p) >> 4)];
                  *(_QWORD *)v49 = *(_QWORD *)(v33 + 4064);
                  *((_QWORD *)v49 + 1) = *(_QWORD *)(v33 + 4072);
                  *((_QWORD *)v49 + 2) = *(_QWORD *)(v26 + 8 * v34);
                  *((_QWORD *)v49 + 3) = v39;
                  *((_QWORD *)v49 + 4) = v35;
                  *((_QWORD *)v49 + 5) = 0;
                  if (v40 == v43)
                  {
                    v51 = &v48[48 * v44];
                    a1 = v42;
                  }
                  else
                  {
                    v50 = &v48[48 * v44];
                    a1 = v42;
                    do
                    {
                      v51 = v50 - 48;
                      v52 = *((_OWORD *)v40 - 3);
                      v53 = *((_OWORD *)v40 - 1);
                      *((_OWORD *)v50 - 2) = *((_OWORD *)v40 - 2);
                      *((_OWORD *)v50 - 1) = v53;
                      *((_OWORD *)v50 - 3) = v52;
                      v40 -= 48;
                      v50 -= 48;
                    }
                    while (v40 != v43);
                  }
                  v41 = v49 + 48;
                  __p = v51;
                  v63 = v49 + 48;
                  v64 = &v48[48 * v47];
                  v11 = v60;
                  if (v43)
                    operator delete(v43);
                  v25 = v61;
                  v14 = v46;
                }
                else
                {
                  *(_QWORD *)v63 = *(_QWORD *)(v33 + 4064);
                  *((_QWORD *)v40 + 1) = *(_QWORD *)(v33 + 4072);
                  *((_QWORD *)v40 + 2) = *(_QWORD *)(v26 + 8 * v34);
                  *((_QWORD *)v40 + 3) = v39;
                  *((_QWORD *)v40 + 4) = v35;
                  *((_QWORD *)v40 + 5) = 0;
                  v41 = v40 + 48;
                }
                v63 = v41;
                v33 = *(_QWORD *)(a1 + 32);
              }
              *(_QWORD *)(*(_QWORD *)(v33 + 4096) + 8 * v32) = *(_QWORD *)(v26 + 8 * v32);
              ++v32;
            }
            while (v32 != v25);
            a4 = v57;
          }
          v22 = v59 + 1;
        }
        while (v59 + 1 != a4);
        objc_msgSend(*(id *)(a1 + 40), "addCommandBufferFrameProfile:", &__p);
        v7 = v54;
        if (__p)
        {
          v63 = (char *)__p;
          operator delete(__p);
        }
        goto LABEL_50;
      }
    }
    else
    {
      v15 = v61;
    }
    std::vector<unsigned long long>::resize(v12 + 4096, v15);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 4104) - *(_QWORD *)(v16 + 4096);
    if (v17 >= 1)
    {
      bzero(*(void **)(v16 + 4096), 8 * (((unint64_t)v17 >> 3) - ((unint64_t)v17 > 7)) + 8);
      v16 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v16 + 4064) = v13;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 4072) = 0;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = objc_msgSend(objc_retainAutorelease(v58), "bytes");
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(v19 + 8 * *(unsigned int *)(v20 + 3980));
    v20 += 4080;
    *(_QWORD *)v20 = *(_QWORD *)(v18 + 4064);
    *(_QWORD *)(v20 + 8) = v21;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = 4096;
    goto LABEL_12;
  }
LABEL_51:

}

void __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke_2(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t *v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  BOOL v49;
  char *v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  char *v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  void *v70;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *__p;
  char *v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  int v83;
  char *v84;
  char *v85;
  unint64_t v86;

  v6 = a2;
  v72 = a3;
  v7 = v6;
  v75 = objc_msgSend(v7, "getListIndex");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 5904), "objectAtIndexedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v8, "count");

  v9 = *(_QWORD **)(a1 + 32);
  if ((id)v9[507] != v7 || v76 != (uint64_t)(v9[513] - v9[512]) >> 3)
  {
    std::vector<unsigned long long>::resize((uint64_t)(v9 + 512), v76);
    v9 = *(_QWORD **)(a1 + 32);
    v10 = (void *)v9[512];
    v11 = v9[513] - (_QWORD)v10;
    if (v11 >= 1)
    {
      bzero(v10, 8 * (((unint64_t)v11 >> 3) - ((unint64_t)v11 > 7)) + 8);
      v9 = *(_QWORD **)(a1 + 32);
    }
  }
  v70 = v7;
  v9[507] = v7;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  v81 = 0u;
  v82 = 0u;
  v83 = 1065353216;
  v12 = 4 * (objc_msgSend(*(id *)(a1 + 40), "playbackMode") != 9);
  v74 = a1;
  if (v12 < a4)
  {
    do
    {
      v73 = v12;
      v13 = objc_msgSend(objc_retainAutorelease(v72), "bytes") + 8 * v12 * v76;
      v14 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v13 + 8 * *(unsigned int *)(v14 + 3976)) != -1)
      {
        v15 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v81, (unint64_t *)(v13 + 8 * *(unsigned int *)(v14 + 3980)));
        v16 = v76;
        if (v15)
        {
          v77 = v15[3];
        }
        else
        {
          v17 = *((_QWORD *)&v82 + 1);
          __p = (void *)(v13 + 8 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 3980));
          v77 = 0;
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v81, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (_QWORD **)&__p)[3] = v17;
          v16 = v76;
        }
        v18 = v75;
        if (v16)
        {
          for (i = 0; i != v16; ++i)
          {
            v20 = *(_QWORD *)(a1 + 32);
            if (*(_QWORD *)(v13 + 8 * *(unsigned int *)(v20 + 3992)) == 2)
            {
              v21 = *(_QWORD *)(v20 + 3912);
              v22 = *(_QWORD *)(v13 + 8 * i);
              if (((*(_QWORD *)(v21 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i) & 1) != 0)
                v22 -= *(_QWORD *)(*(_QWORD *)(v20 + 4096) + 8 * i);
              v23 = *(unsigned int *)(v20 + 3996);
              v24 = *(_QWORD *)(v13 + 8 * v23);
              if (((*(_QWORD *)(v21 + ((v23 >> 3) & 0x1FFFFFF8)) >> v23) & 1) != 0)
                v24 -= *(_QWORD *)(*(_QWORD *)(v20 + 4096) + 8 * v23);
              v25 = *(unsigned int *)(v20 + 3976);
              v26 = *(unsigned int *)(v20 + 3988);
              v27 = *(_QWORD *)(*(_QWORD *)(v20 + 1808) + 8 * v18) + i;
              v28 = v85;
              if ((unint64_t)v85 >= v86)
              {
                v30 = v84;
                v31 = 0xAAAAAAAAAAAAAAABLL * ((v85 - v84) >> 4);
                v32 = v31 + 1;
                if (v31 + 1 > 0x555555555555555)
                  std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((uint64_t)(v86 - (_QWORD)v84) >> 4) > v32)
                  v32 = 0x5555555555555556 * ((uint64_t)(v86 - (_QWORD)v84) >> 4);
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v86 - (_QWORD)v84) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                  v33 = 0x555555555555555;
                else
                  v33 = v32;
                if (v33)
                {
                  v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v86, v33);
                  v30 = v84;
                  v28 = v85;
                }
                else
                {
                  v34 = 0;
                }
                v35 = &v34[48 * v31];
                *(_QWORD *)v35 = *(_QWORD *)(v13 + 8 * v25);
                *((_QWORD *)v35 + 1) = v77;
                *((_QWORD *)v35 + 2) = *(_QWORD *)(v13 + 8 * v26);
                *((_QWORD *)v35 + 3) = v27;
                *((_QWORD *)v35 + 4) = v22;
                *((_QWORD *)v35 + 5) = v24;
                if (v28 == v30)
                {
                  v37 = &v34[48 * v31];
                  a1 = v74;
                }
                else
                {
                  v36 = &v34[48 * v31];
                  a1 = v74;
                  do
                  {
                    v37 = v36 - 48;
                    v38 = *((_OWORD *)v28 - 3);
                    v39 = *((_OWORD *)v28 - 1);
                    *((_OWORD *)v36 - 2) = *((_OWORD *)v28 - 2);
                    *((_OWORD *)v36 - 1) = v39;
                    *((_OWORD *)v36 - 3) = v38;
                    v28 -= 48;
                    v36 -= 48;
                  }
                  while (v28 != v30);
                }
                v29 = (uint64_t *)(v35 + 48);
                v84 = v37;
                v85 = v35 + 48;
                v86 = (unint64_t)&v34[48 * v33];
                if (v30)
                  operator delete(v30);
                v18 = v75;
                v16 = v76;
              }
              else
              {
                *(_QWORD *)v85 = *(_QWORD *)(v13 + 8 * v25);
                *((_QWORD *)v28 + 1) = v77;
                *((_QWORD *)v28 + 2) = *(_QWORD *)(v13 + 8 * v26);
                *((_QWORD *)v28 + 3) = v27;
                *((_QWORD *)v28 + 4) = v22;
                *((_QWORD *)v28 + 5) = v24;
                v29 = (uint64_t *)(v28 + 48);
              }
              v85 = (char *)v29;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)(v20 + 4096) + 8 * i) = *(_QWORD *)(v13 + 8 * i);
            }
          }
        }
      }
      v12 = v73 + 1;
    }
    while (v73 + 1 != a4);
  }
  v40 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v85 - v84) >> 4));
  if (v85 == v84)
    v41 = 0;
  else
    v41 = v40;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)v84, (uint64_t *)v85, (uint64_t)&__p, v41, 1);
  __p = 0;
  v79 = 0;
  v80 = 0;
  std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::reserve(&__p, 2 * v76 * *((_QWORD *)&v82 + 1));
  v42 = v84;
  v43 = v85;
  v44 = v75;
  if (v84 != v85)
  {
    v45 = 0;
    do
    {
      if (v45
        && (v46 = *((_QWORD *)v45 + 3), v46 == *((_QWORD *)v42 + 3))
        && *((_QWORD *)v45 + 2) == *((_QWORD *)v42 + 2)
        && ((v48 = v45, v47 = *(_QWORD *)v45, *((_QWORD *)v48 + 1) == *((_QWORD *)v42 + 1))
          ? (v49 = v47 == *(_QWORD *)v42)
          : (v49 = 0),
            v49))
      {
        v66 = *(_QWORD *)(v74 + 32);
        v67 = v46 - *(_QWORD *)(*(_QWORD *)(v66 + 1808) + 8 * v44);
        if (v67 != *(_DWORD *)(v66 + 3976)
          && v67 != *(_DWORD *)(v66 + 3980)
          && v67 != *(_DWORD *)(v66 + 3984)
          && v67 != *(_DWORD *)(v66 + 3988)
          && v67 != *(_DWORD *)(v66 + 3992))
        {
          v68 = v79;
          v69 = *((_QWORD *)v79 - 1);
          *((_QWORD *)v79 - 2) += *((_QWORD *)v42 + 4);
          *((_QWORD *)v68 - 1) = v69 + *((_QWORD *)v42 + 5);
        }
      }
      else
      {
        v50 = v79;
        if (v79 >= v80)
        {
          v54 = (char *)__p;
          v55 = 0xAAAAAAAAAAAAAAABLL * ((v79 - (_BYTE *)__p) >> 4);
          v56 = v55 + 1;
          if (v55 + 1 > 0x555555555555555)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((v80 - (_BYTE *)__p) >> 4) > v56)
            v56 = 0x5555555555555556 * ((v80 - (_BYTE *)__p) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((v80 - (_BYTE *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v57 = 0x555555555555555;
          else
            v57 = v56;
          if (v57)
          {
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v80, v57);
            v54 = (char *)__p;
            v50 = v79;
          }
          else
          {
            v58 = 0;
          }
          v59 = &v58[48 * v55];
          v60 = *(_OWORD *)v42;
          v61 = *((_OWORD *)v42 + 2);
          *((_OWORD *)v59 + 1) = *((_OWORD *)v42 + 1);
          *((_OWORD *)v59 + 2) = v61;
          *(_OWORD *)v59 = v60;
          if (v50 == v54)
          {
            v63 = &v58[48 * v55];
          }
          else
          {
            v62 = &v58[48 * v55];
            do
            {
              v63 = v62 - 48;
              v64 = *((_OWORD *)v50 - 3);
              v65 = *((_OWORD *)v50 - 1);
              *((_OWORD *)v62 - 2) = *((_OWORD *)v50 - 2);
              *((_OWORD *)v62 - 1) = v65;
              *((_OWORD *)v62 - 3) = v64;
              v50 -= 48;
              v62 -= 48;
            }
            while (v50 != v54);
          }
          v53 = v59 + 48;
          __p = v63;
          v79 = v59 + 48;
          v80 = &v58[48 * v57];
          if (v54)
            operator delete(v54);
          v44 = v75;
        }
        else
        {
          v51 = *(_OWORD *)v42;
          v52 = *((_OWORD *)v42 + 2);
          *((_OWORD *)v79 + 1) = *((_OWORD *)v42 + 1);
          *((_OWORD *)v50 + 2) = v52;
          *(_OWORD *)v50 = v51;
          v53 = v50 + 48;
        }
        v79 = v53;
      }
      v45 = v42;
      v42 += 48;
    }
    while (v42 != v43);
  }
  objc_msgSend(*(id *)(v74 + 40), "addCommandBufferFrameProfile:", &__p);
  if (__p)
  {
    v79 = (char *)__p;
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v81);
  if (v84)
  {
    v85 = v84;
    operator delete(v84);
  }

}

- (void)setupFrameTimeProfiling
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v8, sel_commandQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE39038]);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__DYMTLCommonDebugFunctionPlayer_setupFrameTimeProfiling__block_invoke;
    v6[3] = &unk_250D6FA38;
    v7 = v4;
    v5 = v4;
    objc_msgSend(v3, "addPerfSampleHandler:", v6);

  }
}

void __57__DYMTLCommonDebugFunctionPlayer_setupFrameTimeProfiling__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD *v13;
  uint64_t v14;
  void *__p;
  void *v16;
  _QWORD *v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE39260]);

  if ((v8 & 1) == 0)
  {
    v17 = 0;
    objc_msgSend(v5, "GPUStartTime");
    v10 = v9;
    objc_msgSend(v5, "GPUEndTime");
    v12 = v11;
    v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v17, 1uLL);
    *v13 = (unint64_t)(v10 * 1000000000.0);
    v13[1] = (unint64_t)(v12 * 1000000000.0);
    v13[2] = v5;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
    __p = v13;
    v17 = &v13[6 * v14];
    v16 = v13 + 6;
    objc_msgSend(*(id *)(a1 + 32), "addCommandBufferFrameProfile:", &__p);
    if (__p)
    {
      v16 = __p;
      operator delete(__p);
    }
  }

}

- (BOOL)setupProfilingForListAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  BOOL v7;
  NSDictionary *counterInfos;
  NSDictionary *v9;
  NSDictionary *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t *begin;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  char v28;
  int *v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  int v35;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v43, sel_commandQueue);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38
    || (-[NSMutableArray objectAtIndexedSubscript:](self->_counterListsPerPass, "objectAtIndexedSubscript:", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v38, "requestCounters:withIndex:", v5, a3),
        v5,
        v6))
  {
    v7 = 0;
    goto LABEL_40;
  }
  counterInfos = self->_counterInfos;
  if (!counterInfos)
  {
    objc_msgSend(v38, "counterInfo");
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_counterInfos;
    self->_counterInfos = v9;

    counterInfos = self->_counterInfos;
  }
  if (-[NSDictionary count](counterInfos, "count"))
    std::vector<BOOL>::resize((uint64_t)&self->_isDeltaCounter, -[NSDictionary count](self->_counterInfos, "count"), 0);
  if (self->_isAGXDevice)
  {
    self->_nSecIndex = -1;
    v11 = 7;
  }
  else
  {
    v11 = 3;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->_counterListsPerPass, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v13)
  {
    v7 = 1;
    goto LABEL_39;
  }
  obj = v12;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v40 != v16)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      -[NSDictionary objectForKeyedSubscript:](self->_counterInfos, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("type"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v7 = 0;
        goto LABEL_37;
      }
      objc_opt_class();
      v21 = v14 + i;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_msgSend(v20, "unsignedIntegerValue");
        begin = self->_isDeltaCounter.__begin_;
        v24 = v21 >> 6;
        v25 = 1 << v21;
        if (v22 == 1)
        {
LABEL_19:
          v26 = begin[v24] | v25;
LABEL_23:
          begin[v24] = v26;
          goto LABEL_24;
        }
LABEL_22:
        v26 = begin[v24] & ~v25;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = objc_msgSend(v20, "isEqualToString:", CFSTR("DELTA"));
        begin = self->_isDeltaCounter.__begin_;
        v24 = v21 >> 6;
        v25 = 1 << v21;
        if (v27)
          goto LABEL_19;
        goto LABEL_22;
      }
LABEL_24:
      if (v15 < v11)
      {
        v28 = objc_msgSend(CFSTR("MTLStatCommandBufferIndex"), "isEqualToString:", v18);
        v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__commandBufferIndex;
        if ((v28 & 1) != 0)
          goto LABEL_32;
        v30 = objc_msgSend(CFSTR("MTLStatEncoderIndex"), "isEqualToString:", v18);
        v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__encoderIndex;
        if ((v30 & 1) != 0)
          goto LABEL_32;
        v31 = objc_msgSend(CFSTR("MTLStatCommandIndex"), "isEqualToString:", v18);
        v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__drawIndex;
        if ((v31 & 1) != 0)
          goto LABEL_32;
        v32 = objc_msgSend(CFSTR("MTLStatDataMaster"), "isEqualToString:", v18);
        v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__datamasterIndex;
        if ((v32 & 1) != 0
          || (v33 = objc_msgSend(CFSTR("MTLStatSampleLocation"), "isEqualToString:", v18),
              v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__sampleLocationIndex,
              (v33 & 1) != 0)
          || (v34 = objc_msgSend(CFSTR("MTLStatTotalGPUCycles"), "isEqualToString:", v18),
              v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__gpuCyclesIndex,
              (v34 & 1) != 0)
          || (v35 = objc_msgSend(CFSTR("MTLStat_nSec"), "isEqualToString:", v18),
              v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__nSecIndex,
              v35))
        {
LABEL_32:
          *(_DWORD *)((char *)&self->super.super.super.super.isa + *v29) = v21;
          ++v15;
        }
      }

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v14 += i;
    if (v13)
      continue;
    break;
  }
  v7 = 1;
LABEL_37:
  v12 = obj;
LABEL_39:

LABEL_40:
  return v7;
}

- (id)counterInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *counterListsPerPass;
  uint64_t v18;
  vector<unsigned long, std::allocator<unsigned long>> *p_baseCounterIndexForList;
  uint64_t v20;
  unint64_t v21;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v24;
  unint64_t *begin;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v40 = (id)objc_opt_new();
  v45.receiver = self;
  v45.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v45, sel_commandQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v38 = v4;
    v37 = objc_msgSend(v4, "isStatEnabled");
    if ((v37 & 1) == 0)
      objc_msgSend(v5, "setStatEnabled:", 1);
    if (v39)
    {
      v6 = v39;
      if (self->_isAGXDevice)
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("MTLStatCommandBufferIndex"), CFSTR("MTLStatEncoderIndex"), CFSTR("MTLStatCommandIndex"), CFSTR("MTLStatDataMaster"), CFSTR("MTLStatSampleLocation"), CFSTR("MTLStatTotalGPUCycles"), CFSTR("MTLStat_nSec"), 0);
      else
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("MTLStatCommandBufferIndex"), CFSTR("MTLStatEncoderIndex"), CFSTR("MTLStatCommandIndex"), CFSTR("MTLStat_nSec"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v42 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            if ((objc_msgSend(v9, "containsObject:", v14) & 1) == 0)
              objc_msgSend(v8, "addObject:", v14);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v11);
      }

      v7 = v8;
      v5 = v38;
    }
    else
    {
      objc_msgSend(v5, "availableCounters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "subdivideCounterList:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
    counterListsPerPass = self->_counterListsPerPass;
    self->_counterListsPerPass = v16;

    v18 = -[NSMutableArray count](self->_counterListsPerPass, "count");
    p_baseCounterIndexForList = &self->_baseCounterIndexForList;
    self->_baseCounterIndexForList.__end_ = self->_baseCounterIndexForList.__begin_;
    if (v18)
    {
      v20 = 0;
      v21 = 0;
      do
      {
        end = self->_baseCounterIndexForList.__end_;
        value = self->_baseCounterIndexForList.__end_cap_.__value_;
        if (end >= value)
        {
          begin = p_baseCounterIndexForList->__begin_;
          v26 = end - p_baseCounterIndexForList->__begin_;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          v28 = (char *)value - (char *)begin;
          if (v28 >> 2 > v27)
            v27 = v28 >> 2;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
          {
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_baseCounterIndexForList.__end_cap_, v29);
            begin = p_baseCounterIndexForList->__begin_;
            end = self->_baseCounterIndexForList.__end_;
          }
          else
          {
            v30 = 0;
          }
          v31 = (unint64_t *)&v30[8 * v26];
          *v31 = v21;
          v24 = v31 + 1;
          while (end != begin)
          {
            v32 = *--end;
            *--v31 = v32;
          }
          p_baseCounterIndexForList->__begin_ = v31;
          self->_baseCounterIndexForList.__end_ = v24;
          self->_baseCounterIndexForList.__end_cap_.__value_ = (unint64_t *)&v30[8 * v29];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = v21;
          v24 = end + 1;
        }
        self->_baseCounterIndexForList.__end_ = v24;
        -[NSMutableArray objectAtIndexedSubscript:](self->_counterListsPerPass, "objectAtIndexedSubscript:", v20);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        v21 += v34;
        ++v20;
      }
      while (v20 != v18);
    }
    objc_msgSend(v40, "setObject:forKeyedSubscript:", self->_counterListsPerPass, *MEMORY[0x24BE39308]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BE395D8]);

    objc_msgSend(v40, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE39310]);
    if ((v37 & 1) == 0)
      objc_msgSend(v38, "setStatEnabled:", 0);

    v5 = v38;
  }

  return v40;
}

- (void)sampleEncoderCounters
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v5, sel_commandQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (self->_isAGXDevice)
    {
      v4 = 63;
    }
    else if (-[DYMTLCommonDebugFunctionPlayer isBlitSamplingSupported](self, "isBlitSamplingSupported"))
    {
      v4 = 63;
    }
    else
    {
      v4 = 51;
    }
    objc_msgSend(v3, "setStatLocations:", v4);
  }

}

- (void)sampleSplitEncoderCounters
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v4, sel_commandQueue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "setStatLocations:", 12);

}

- (void)setStatLocations:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v6, sel_commandQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setStatLocations:", a3);

}

- (unint64_t)getStatLocations
{
  void *v2;
  void *v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v6, sel_commandQueue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "getStatLocations");
  else
    v4 = 0;

  return v4;
}

- (void)stopFrameProfiling
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer commandQueue](&v5, sel_commandQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setStatEnabled:", 0);
    if (self->_isAGXDevice)
      objc_msgSend(v4, "setGPUPriority:", 1);
  }

}

- (id)derivedCounterData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  -[DYMTLFunctionPlayer device](&v15, sel_device);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63570]), "initWithMTLDevice:", v2);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "counterDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v3, "counterDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE39378]);

      objc_msgSend(v3, "derivedCounterScript");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE39380]);

      objc_msgSend(v3, "analysisScript");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE39350]);

      objc_msgSend(v3, "configurationVariables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE39360]);

      objc_msgSend(v3, "metalPluginName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v3, "metalPluginName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("MetalPluginName"));

      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setupProfileInfo:(id)a3
{
  NSDictionary *profileInfo;
  NSArray *v6;
  NSArray *splitEncoderCommandCount;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_profileInfo, a3);
  profileInfo = self->_profileInfo;
  if (profileInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](profileInfo, "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    splitEncoderCommandCount = self->_splitEncoderCommandCount;
    self->_splitEncoderCommandCount = v6;

  }
}

- (void)setupBatchFilterForEncoders:(id)a3
{
  objc_storeStrong((id *)&self->_batchInfos, a3);
}

- (void)_updateRemainingCommandsForEncoder
{
  unsigned int v3;
  void *v4;
  id v5;

  if (self->_splitEncoderCommandCount)
  {
    v3 = -[DYMTLCommonDebugFunctionPlayer currentEncoderIndex](self, "currentEncoderIndex");
    if (-[NSArray count](self->_splitEncoderCommandCount, "count") > v3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_splitEncoderCommandCount, "objectAtIndexedSubscript:", -[DYMTLCommonDebugFunctionPlayer currentEncoderIndex](self, "currentEncoderIndex"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = v4;
        self->_nRemainingCommandsForCurrentEncoder = objc_msgSend(v4, "unsignedIntValue");
        v4 = v5;
      }

    }
  }
}

- (unint64_t)_executeIndirectCommandBufferUpToSubIndex:(unint64_t)a3 outBuffer:(id *)a4 outDataPointer:(const char *)a5
{
  unint64_t v5;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  GPUTools::MTL *v16;
  const char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;

  v10 = (int)*MEMORY[0x24BE39040];
  v11 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 48, 0);
  -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 72, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "size");
  if (v13 - 1 >= a3)
    v14 = a3;
  else
    v14 = v13 - 1;
  -[DYFunctionPlayer processArguments](self, "processArguments");
  v15 = *(unsigned int **)((char *)&self->super.super.super.super.isa + v10);
  v16 = (GPUTools::MTL *)*v15;
  switch(v16)
  {
    case 0xFFFFC1A4:
    case 0xFFFFC1A6:
      v17 = **(const char ***)((char *)&self->super.super.super._executeGraphics + (int)*MEMORY[0x24BE39008]);
      v5 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v15 + 24), 0);
      GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 96, 1uLL);
      v16 = (GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v10);
      break;
    case 0xFFFFC1A5:
    case 0xFFFFC1A7:
      v18 = (char *)self + (int)*MEMORY[0x24BE39008];
      v17 = (const char *)**((_QWORD **)v18 + 4);
      v5 = ***((_QWORD ***)v18 + 5);
      break;
    default:
      v17 = 0;
      break;
  }
  if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall(v16))
  {
    -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v14 > v5)
      objc_msgSend(v19, "executeCommandsInBuffer:withRange:", v12, v5, v14 - v5);
    -[DYMTLFunctionPlayer indirectCommandManager](self, "indirectCommandManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "setupRenderCommandEncoder:withData:atIndex:forIndirectCommandBuffer:", v20, v17, v14, v12);
  }
  else
  {
    if (!GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v10)))
    {
      v24 = 0;
      goto LABEL_18;
    }
    -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    if (v14 > v5)
      objc_msgSend(v23, "executeCommandsInBuffer:withRange:", v12, v5, v14 - v5);
    -[DYMTLFunctionPlayer indirectCommandManager](self, "indirectCommandManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "setupComputeCommandEncoder:withData:atIndex:forIndirectCommandBuffer:", v20, v17, v14, v12);
  }
  v24 = v22;

LABEL_18:
  v25 = objc_retainAutorelease(v12);
  *a4 = v25;
  *a5 = v17;

  return v24;
}

- (int64_t)wireframeRenderMode
{
  return self->_wireframeRenderMode;
}

- (void)setWireframeRenderMode:(int64_t)a3
{
  self->_wireframeRenderMode = a3;
}

- (DYMTLPostVertexDump)postVertexDump
{
  return self->_postVertexDump;
}

- (BOOL)targetFunctionNeedsSeparatedPostVertexDump
{
  return self->_targetFunctionNeedsSeparatedPostVertexDump;
}

- (DYMTLShaderDebuggerTraceGenerator)shaderDebuggerTraceGenerator
{
  return self->_shaderDebuggerTraceGenerator;
}

- (BOOL)shouldIgnoreCaptureFile
{
  return self->_shouldIgnoreCaptureFile;
}

- (void)setShouldIgnoreCaptureFile:(BOOL)a3
{
  self->_shouldIgnoreCaptureFile = a3;
}

- (unsigned)currentEncoderIndex
{
  return self->_currentEncoderIndex;
}

- (void)setCurrentEncoderIndex:(unsigned int)a3
{
  self->_currentEncoderIndex = a3;
}

- (NSMutableArray)counterListsPerPass
{
  return self->_counterListsPerPass;
}

- (void)setCounterListsPerPass:(id)a3
{
  objc_storeStrong((id *)&self->_counterListsPerPass, a3);
}

- (NSString)statVertices
{
  return self->_statVertices;
}

- (void)setStatVertices:(id)a3
{
  objc_storeStrong((id *)&self->_statVertices, a3);
}

- (NSString)statPixels
{
  return self->_statPixels;
}

- (void)setStatPixels:(id)a3
{
  objc_storeStrong((id *)&self->_statPixels, a3);
}

- (NSMutableArray)frameCounters
{
  return self->_frameCounters;
}

- (void)setFrameCounters:(id)a3
{
  objc_storeStrong((id *)&self->_frameCounters, a3);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  void *v5;
  unint64_t *v6;

  objc_storeStrong((id *)&self->_frameCounters, 0);
  objc_storeStrong((id *)&self->_statPixels, 0);
  objc_storeStrong((id *)&self->_statVertices, 0);
  objc_storeStrong((id *)&self->_counterListsPerPass, 0);
  objc_storeStrong((id *)&self->_pixelHistoryEncoderStateTrackings, 0);
  objc_storeStrong((id *)&self->_pixelHistoryDrawStatsRenderer, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_pixelHistoryInverseObjectMap);
  objc_storeStrong((id *)&self->_pixelHistoryPixelPreviousDepth, 0);
  objc_storeStrong((id *)&self->_pixelHistoryPixelPreviousStencil, 0);
  objc_storeStrong((id *)&self->_pixelHistory, 0);
  objc_storeStrong((id *)&self->_sparseTextureFence, 0);
  objc_storeStrong((id *)&self->_dependencyGraphParallelDescriptor, 0);
  objc_storeStrong((id *)&self->_dependencyGraphThumbnails, 0);
  objc_storeStrong((id *)&self->_thumbnailDictionary, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_persistantEncoder2ParallelMap);
  objc_storeStrong((id *)&self->_currentParallelDescriptor, 0);
  begin = self->_last.__begin_;
  if (begin)
  {
    self->_last.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_metalLayers);
  objc_storeStrong((id *)&self->_textureRenderer, 0);
  objc_storeStrong((id *)&self->_shaderDebuggerTraceGenerator, 0);
  objc_storeStrong((id *)&self->_tileMemoryExtractor, 0);
  objc_storeStrong((id *)&self->_postVertexDump, 0);
  v4 = self->_isDeltaCounter.__begin_;
  if (v4)
    operator delete(v4);
  objc_storeStrong((id *)&self->_nopRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_nopTileFunction, 0);
  objc_storeStrong((id *)&self->_nopDrawVertexFunction, 0);
  objc_storeStrong((id *)&self->_nopDrawFragFunction, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_splitEncoderCommandCount, 0);
  v5 = self->_currentEncoderBatchInfo.__begin_;
  if (v5)
  {
    self->_currentEncoderBatchInfo.__end_ = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>>>::~__hash_table((uint64_t)&self->_encoderIndexToBatchInfo);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_parallelRenderCommandEncoderDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderer, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandQueueSet);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_encoderToParallelEncoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_parallelEncoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_encoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandBufferMap);
  v6 = self->_baseCounterIndexForList.__begin_;
  if (v6)
  {
    self->_baseCounterIndexForList.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_counterInfos, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandEncoderDescriptorMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_textureToDrawableMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_drawableIdToLayerIdMap);
}

- (id).cxx_construct
{
  char *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;

  *((_OWORD *)self + 105) = 0u;
  *((_OWORD *)self + 106) = 0u;
  *((_DWORD *)self + 428) = 1065353216;
  *(_OWORD *)((char *)self + 1720) = 0u;
  *(_OWORD *)((char *)self + 1736) = 0u;
  *((_DWORD *)self + 438) = 1065353216;
  *((_OWORD *)self + 110) = 0u;
  *((_OWORD *)self + 111) = 0u;
  *((_DWORD *)self + 448) = 1065353216;
  *((_QWORD *)self + 227) = 0;
  *((_QWORD *)self + 228) = 0;
  *((_QWORD *)self + 226) = 0;
  *(_OWORD *)((char *)self + 1832) = 0u;
  *(_OWORD *)((char *)self + 1848) = 0u;
  *((_DWORD *)self + 466) = 1065353216;
  *((_OWORD *)self + 117) = 0u;
  *((_OWORD *)self + 118) = 0u;
  *((_DWORD *)self + 476) = 1065353216;
  *(_OWORD *)((char *)self + 1912) = 0u;
  *(_OWORD *)((char *)self + 1928) = 0u;
  *((_DWORD *)self + 486) = 1065353216;
  *((_OWORD *)self + 122) = 0u;
  *((_OWORD *)self + 123) = 0u;
  *((_DWORD *)self + 496) = 1065353216;
  *((_DWORD *)self + 510) = 1065353216;
  *(_OWORD *)((char *)self + 2008) = 0u;
  *(_OWORD *)((char *)self + 2024) = 0u;
  *((_QWORD *)self + 261) = 0;
  v2 = (char *)self + 3248;
  v3 = 2096;
  do
  {
    v4 = (char *)self + v3;
    *((_OWORD *)v4 + 2) = 0uLL;
    *((_OWORD *)v4 + 3) = 0uLL;
    *(_OWORD *)v4 = 0uLL;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((_QWORD *)v4 + 8) = 0;
    *((_QWORD *)v4 + 9) = 1;
    *((_OWORD *)v4 + 5) = 0uLL;
    *((_OWORD *)v4 + 6) = 0uLL;
    *((_QWORD *)v4 + 14) = 0x3FF0000000000000;
    v3 += 144;
    *((_QWORD *)v4 + 16) = 0;
    *((_QWORD *)v4 + 17) = 0;
  }
  while (v4 + 144 != v2);
  *((_QWORD *)self + 414) = 0;
  *((_OWORD *)self + 205) = 0u;
  *((_OWORD *)self + 206) = 0u;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)self + 204) = 0u;
  *((_QWORD *)self + 415) = 1;
  *((_OWORD *)self + 208) = 0u;
  *((_OWORD *)self + 209) = 0u;
  *((_QWORD *)self + 420) = 0x3FF0000000000000;
  *((_OWORD *)self + 211) = 0u;
  *((_OWORD *)self + 212) = 0u;
  *((_OWORD *)self + 213) = 0u;
  *((_OWORD *)self + 214) = 0u;
  *((_OWORD *)self + 215) = 0u;
  *((_QWORD *)self + 432) = 0;
  *((_QWORD *)self + 433) = 1;
  *((_OWORD *)self + 218) = 0u;
  *((_OWORD *)self + 217) = 0u;
  *((_QWORD *)self + 438) = 0x3FF0000000000000;
  *((_QWORD *)self + 441) = 0;
  *((_QWORD *)self + 440) = 0;
  *(_OWORD *)((char *)self + 3720) = 0u;
  *(_OWORD *)((char *)self + 3736) = 0u;
  *((_DWORD *)self + 938) = 1065353216;
  *((_QWORD *)self + 471) = 0;
  *((_QWORD *)self + 472) = 0;
  *((_QWORD *)self + 470) = 0;
  *((_QWORD *)self + 490) = 0;
  *((_QWORD *)self + 491) = 0;
  *((_QWORD *)self + 489) = 0;
  *((_OWORD *)self + 251) = 0u;
  *((_OWORD *)self + 252) = 0u;
  *((_DWORD *)self + 1012) = 1065353216;
  *((_QWORD *)self + 510) = 0;
  *((_QWORD *)self + 511) = 0;
  *((_QWORD *)self + 513) = 0;
  *((_QWORD *)self + 514) = 0;
  *((_QWORD *)self + 512) = 0;
  *(_OWORD *)((char *)self + 4136) = 0u;
  *(_OWORD *)((char *)self + 4152) = 0u;
  *((_DWORD *)self + 1042) = 1065353216;
  *((_QWORD *)self + 527) = 0;
  v5 = (char *)self + 5376;
  v6 = 4224;
  do
  {
    v7 = (char *)self + v6;
    *((_OWORD *)v7 + 2) = 0uLL;
    *((_OWORD *)v7 + 3) = 0uLL;
    *(_OWORD *)v7 = 0uLL;
    *((_OWORD *)v7 + 1) = 0uLL;
    *((_QWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 9) = 1;
    *((_OWORD *)v7 + 5) = 0uLL;
    *((_OWORD *)v7 + 6) = 0uLL;
    *((_QWORD *)v7 + 14) = 0x3FF0000000000000;
    v6 += 144;
    *((_QWORD *)v7 + 16) = 0;
    *((_QWORD *)v7 + 17) = 0;
  }
  while (v7 + 144 != v5);
  *((_QWORD *)self + 680) = 0;
  *((_OWORD *)self + 338) = 0u;
  *((_OWORD *)self + 339) = 0u;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)self + 337) = 0u;
  *((_QWORD *)self + 681) = 1;
  *((_OWORD *)self + 341) = 0u;
  *((_OWORD *)self + 342) = 0u;
  *((_QWORD *)self + 686) = 0x3FF0000000000000;
  *((_OWORD *)self + 344) = 0u;
  *((_OWORD *)self + 345) = 0u;
  *((_OWORD *)self + 346) = 0u;
  *((_OWORD *)self + 347) = 0u;
  *((_OWORD *)self + 348) = 0u;
  *((_QWORD *)self + 698) = 0;
  *((_QWORD *)self + 699) = 1;
  *((_OWORD *)self + 351) = 0u;
  *((_OWORD *)self + 350) = 0u;
  *((_QWORD *)self + 704) = 0x3FF0000000000000;
  *((_QWORD *)self + 707) = 0;
  *((_QWORD *)self + 706) = 0;
  *((_OWORD *)self + 365) = 0u;
  *((_OWORD *)self + 366) = 0u;
  *((_DWORD *)self + 1468) = 1065353216;
  return self;
}

@end
