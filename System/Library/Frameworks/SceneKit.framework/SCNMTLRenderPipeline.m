@implementation SCNMTLRenderPipeline

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (MTLFunction)vertexFunction
{
  return self->_vertexFunction;
}

- (MTLFunction)fragmentFunction
{
  return self->_fragmentFunction;
}

- (void)setVertexFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setVertexDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setShadableBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setNodeBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setFrameBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setFragmentFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)_computeUsageForArguments:(id)a3 function:(id)a4
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = SCNMTLFunctionTypeToProgramStage(objc_msgSend(a4, "functionType"));
  if (v6 >= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderPipeline _computeUsageForArguments:function:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = (char *)self + 4 * v6;
  *((_DWORD *)v15 + 34) = 0;
  v16 = v15 + 136;
  *((_DWORD *)v16 - 4) = 0;
  *((_DWORD *)v16 - 2) = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(a3);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v21, "isActive"))
        {
          v22 = objc_msgSend(v21, "type");
          v23 = v16 - 16;
          if (!v22)
            goto LABEL_15;
          if (v22 == 3)
          {
            v23 = v16;
LABEL_15:
            *(_DWORD *)v23 |= 1 << objc_msgSend(v21, "index");
            continue;
          }
          v23 = v16 - 8;
          if (v22 == 2)
            goto LABEL_15;
        }
      }
      v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }
}

- (MTLRenderPipelineState)state
{
  return self->_state;
}

- (NSArray)shadableBufferBindings
{
  return self->_shadableBufferBindings;
}

- (NSArray)passBufferBindings
{
  return self->_passBufferBindings;
}

- (NSArray)nodeBufferBindings
{
  return self->_nodeBufferBindings;
}

- (NSArray)frameBufferBindings
{
  return self->_frameBufferBindings;
}

- (NSArray)lightBufferBindings
{
  return self->_lightBufferBindings;
}

- (SCNMTLRenderPipeline)init
{
  SCNMTLRenderPipeline *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLRenderPipeline;
  result = -[SCNMTLRenderPipeline init](&v3, sel_init);
  if (result)
    result->_sceneBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLRenderPipeline;
  -[SCNMTLRenderPipeline dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSArray *frameBufferBindings;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *nodeBufferBindings;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSArray *passBufferBindings;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  NSArray *shadableBufferBindings;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  NSArray *lightBufferBindings;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("<state: %@>"), self->_state);
  if (self->_frameBufferBindings)
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n\tFrameBuffer bindings:\n"));
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    frameBufferBindings = self->_frameBufferBindings;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](frameBufferBindings, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v53 != v8)
            objc_enumerationMutation(frameBufferBindings);
          v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v3, "appendString:", CFSTR("\t\t"));
          objc_msgSend(v3, "appendString:", objc_msgSend(v10, "name"));
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](frameBufferBindings, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v7);
    }
  }
  if (self->_nodeBufferBindings)
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n\tNode bindings:\n"));
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    nodeBufferBindings = self->_nodeBufferBindings;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](nodeBufferBindings, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v49 != v14)
            objc_enumerationMutation(nodeBufferBindings);
          v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v3, "appendString:", CFSTR("\t\t"));
          objc_msgSend(v3, "appendString:", objc_msgSend(v16, "name"));
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](nodeBufferBindings, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v13);
    }
  }
  if (self->_passBufferBindings)
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n\tPass bindings:\n"));
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    passBufferBindings = self->_passBufferBindings;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](passBufferBindings, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(passBufferBindings);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
          objc_msgSend(v3, "appendString:", CFSTR("\t\t"));
          objc_msgSend(v3, "appendString:", objc_msgSend(v22, "name"));
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](passBufferBindings, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v19);
    }
  }
  if (self->_shadableBufferBindings)
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n\tShadable bindings:\n"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    shadableBufferBindings = self->_shadableBufferBindings;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](shadableBufferBindings, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        for (m = 0; m != v25; ++m)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(shadableBufferBindings);
          v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * m);
          objc_msgSend(v3, "appendString:", CFSTR("\t\t"));
          objc_msgSend(v3, "appendString:", objc_msgSend(v28, "name"));
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](shadableBufferBindings, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
      }
      while (v25);
    }
  }
  if (self->_lightBufferBindings)
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n\tLight bindings:\n"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    lightBufferBindings = self->_lightBufferBindings;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](lightBufferBindings, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        for (n = 0; n != v31; ++n)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(lightBufferBindings);
          v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * n);
          objc_msgSend(v3, "appendString:", CFSTR("\t\t"));
          objc_msgSend(v3, "appendString:", objc_msgSend(v34, "name"));
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](lightBufferBindings, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
      }
      while (v31);
    }
  }
  return v3;
}

- (BOOL)matchesRenderPassDescriptor:(id)a3
{
  uint64_t v5;
  $E5576432F07829E5C0D2DE91F4559C6D *p_renderPassDesc;
  void *v7;
  unint64_t v8;
  uint64_t sampleCount;
  void *v10;
  unint64_t depthFormat;
  uint64_t v12;
  void *v13;
  unint64_t stencilFormat;
  uint64_t v15;

  v5 = 0;
  p_renderPassDesc = &self->_renderPassDesc;
  while (1)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", v5), "texture");
    v8 = p_renderPassDesc->colorFormat[v5];
    if (v8 != objc_msgSend(v7, "pixelFormat"))
      break;
    if (v7)
    {
      sampleCount = self->_renderPassDesc.sampleCount;
      if (objc_msgSend(v7, "sampleCount") != sampleCount)
        break;
    }
    if (++v5 == 8)
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "depthAttachment"), "texture");
      depthFormat = self->_renderPassDesc.depthFormat;
      if (depthFormat == objc_msgSend(v10, "pixelFormat"))
      {
        if (!v10 || (v12 = self->_renderPassDesc.sampleCount, objc_msgSend(v10, "sampleCount") == v12))
        {
          v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "stencilAttachment"), "texture");
          stencilFormat = self->_renderPassDesc.stencilFormat;
          if (stencilFormat == objc_msgSend(v13, "pixelFormat"))
          {
            if (!v13)
              return 1;
            v15 = self->_renderPassDesc.sampleCount;
            if (objc_msgSend(v13, "sampleCount") == v15)
              return 1;
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

- (unsigned)vertexBuffersUsageMask
{
  return self->_buffersUsageMask[0];
}

- (MTLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (void)setLightBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setPassBufferBindings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)_computeUsageForArguments:(uint64_t)a3 function:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Bad stage", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
