@implementation MTLVertexDescriptorInternal

- (id)attributes
{
  return self->_attributeArray;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLVertexDescriptorInternal;
  -[MTLVertexDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (id)layouts
{
  return self->_vertexBufferArray;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t i;
  MTLVertexBufferLayoutDescriptorInternal *v7;
  uint64_t j;
  MTLVertexAttributeDescriptorInternal *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    for (i = 0; i != 31; ++i)
    {
      v7 = self->_vertexBufferArray->_descriptors[i];
      if (v7)
        *(_QWORD *)(v5[1] + 8 + i * 8) = -[MTLVertexBufferLayoutDescriptorInternal copyWithZone:](v7, "copyWithZone:", a3);
    }
    for (j = 0; j != 31; ++j)
    {
      v9 = self->_attributeArray->_descriptors[j];
      if (v9)
        *(_QWORD *)(v5[2] + 8 + j * 8) = -[MTLVertexAttributeDescriptorInternal copyWithZone:](v9, "copyWithZone:", a3);
    }
  }
  return v5;
}

- (MTLVertexDescriptorInternal)init
{
  MTLVertexDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLVertexDescriptorInternal;
  v2 = -[MTLVertexDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_vertexBufferArray = objc_alloc_init(MTLVertexBufferLayoutDescriptorArrayInternal);
    v2->_attributeArray = objc_alloc_init(MTLVertexAttributeDescriptorArrayInternal);
  }
  return v2;
}

- (id)newSerializedDescriptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int *v9;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  MTLVertexBufferLayoutDescriptorInternal *v11;
  uint64_t v12;
  int v13;
  int *v14;
  MTLVertexAttributeDescriptorInternal *v15;
  uint64_t v16;
  int *v17;
  int *v18;
  uint64_t v19;
  __int16 v20;
  size_t v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int *v31;
  MTLVertexBufferLayoutDescriptorArrayInternal *vertexBufferArray;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  MTLVertexAttributeDescriptorInternal *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v46;
  unsigned __int16 v47;
  size_t size;
  _OWORD v49[3];
  uint64_t v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50 = 0;
  memset(v49, 0, sizeof(v49));
  _MTLMessageContextBegin_((uint64_t)v49, (uint64_t)"-[MTLVertexDescriptorInternal newSerializedDescriptor]", 743, 0, 5, (uint64_t)"Serialized Descriptor Creation");
  v7 = 0;
  v8 = 0;
  memset(v51, 0, 31);
  v9 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
  descriptors = self->_vertexBufferArray->_descriptors;
  do
  {
    v11 = descriptors[v7];
    if (v11 && v11->_stride)
    {
      ++v8;
      *((_BYTE *)v51 + v7) = 1;
    }
    ++v7;
  }
  while (v7 != 31);
  v12 = 0;
  v13 = 0;
  v14 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
  do
  {
    v15 = self->_attributeArray->_descriptors[v12];
    if (v15 && *(Class *)((char *)&v15->super.super.isa + v14[787]))
    {
      v16 = *(uint64_t *)((char *)&self->_vertexBufferArray->super.super.isa + 8 * v15->_bufferIndex + v9[786]);
      v17 = v9;
      v18 = v14;
      validateVertexAttribute(v16, v12, (uint64_t)v15, (uint64_t)v49, v3, v4, v5, v6, v46);
      v14 = v18;
      v9 = v17;
      *((_BYTE *)v51 + v15->_bufferIndex) = 0;
      ++v13;
    }
    ++v12;
  }
  while (v12 != 31);
  if (v13)
  {
    v19 = (16 * v8) | 8;
    v20 = ((v8 & 0x1F) << 6) | ((_WORD)v13 << 11);
    v21 = v19 + 8 * v13;
    v22 = malloc_type_malloc(v21, 0x9DB263D6uLL);
    bzero(v22, v21);
    v28 = 0;
    v29 = 0;
    *v22 = v21;
    v22[1] = v20;
    size = v21;
    v22[2] = 8;
    v47 = v19;
    v22[3] = v19;
    v30 = v9[786];
    v31 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
    do
    {
      vertexBufferArray = self->_vertexBufferArray;
      if (*((_BYTE *)v51 + v28))
      {
        _MTLMessageContextPush_((uint64_t)v49, 4, (uint64_t)CFSTR("None of the attributes set bufferIndex to %d, but %s set buffer layout[%d].stride(%lu)."), v23, v24, v25, v26, v27, v28);
        v30 = v9[786];
        vertexBufferArray = self->_vertexBufferArray;
      }
      v33 = *(uint64_t *)((char *)&vertexBufferArray->super.super.isa + 8 * v28 + v30);
      if (v33)
      {
        v34 = *(_QWORD *)(v33 + v31[783]);
        if (v34)
        {
          v35 = (uint64_t)&v22[8 * v29 + 4];
          *(_QWORD *)(v35 + 8) = v34;
          v36 = *(unsigned int *)(v33 + 24);
          *(_DWORD *)(v35 + 4) = v36;
          v37 = (unsigned int *)(v35 + 4);
          *(_DWORD *)v35 = *(_DWORD *)v35 & 0xFFFFFFE0 | v28;
          *(_DWORD *)v35 = (32 * (unsigned __int16)*(_DWORD *)(v33 + 16)) | v28;
          v38 = *(_QWORD *)(v33 + 16);
          if (v38 >= 5)
          {
            _MTLMessageContextPush_((uint64_t)v49, 4, (uint64_t)CFSTR("stepFunction is not a valid MTLVertexStepFunction."), v23, v24, v25, v26, v27, v46);
            v38 = *(_QWORD *)(v33 + 16);
            v36 = *v37;
          }
          ++v29;
          validateFunctionStepRate(0, v38, v36, (uint64_t)v49);
          v30 = v9[786];
          v31 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
        }
      }
      ++v28;
    }
    while (v28 != 31);
    v39 = 0;
    v40 = 0;
    do
    {
      v41 = self->_attributeArray->_descriptors[v39];
      if (v41)
      {
        if (v41->_vertexFormat)
        {
          v42 = (unsigned int *)((char *)&v22[4 * v40++] + (v47 & 0xFFF8));
          v43 = *v42 & 0xFFFFFFE0 | v39;
          *v42 = v43;
          v42[1] = v41->_offset;
          v44 = v43 & 0xFFFFFC1F | (32 * (v41->_bufferIndex & 0x1F));
          *v42 = v44;
          *v42 = v44 & 0x3FF | (LODWORD(v41->_vertexFormat) << 10);
        }
      }
      ++v39;
    }
    while (v39 != 31);
    _MTLMessageContextEnd((uint64_t)v49);
    return dispatch_data_create(v22, size, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  }
  else
  {
    _MTLMessageContextEnd((uint64_t)v49);
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  MTLVertexBufferLayoutDescriptorInternal *v4;
  uint64_t stepFunction;
  uint64_t instanceStepRate;
  int *v7;
  MTLVertexAttributeDescriptorInternal **v8;
  uint64_t i;
  MTLVertexAttributeDescriptorInternal *v10;
  unint64_t vertexFormat;
  int *v12;
  int v14[372];

  v2 = 0;
  descriptors = self->_vertexBufferArray->_descriptors;
  do
  {
    v4 = *descriptors;
    if (*descriptors)
    {
      *(_QWORD *)&v14[v2] = v4->_stride;
      stepFunction = v4->_stepFunction;
      instanceStepRate = v4->_instanceStepRate;
    }
    else
    {
      *(_QWORD *)&v14[v2] = 0;
      stepFunction = 1;
      instanceStepRate = 1;
    }
    v7 = &v14[v2];
    *((_QWORD *)v7 + 1) = stepFunction;
    *((_QWORD *)v7 + 2) = instanceStepRate;
    v2 += 6;
    ++descriptors;
  }
  while (v2 != 186);
  v8 = self->_attributeArray->_descriptors;
  for (i = 190; i != 376; i += 6)
  {
    v10 = *v8;
    if (*v8)
    {
      vertexFormat = v10->_vertexFormat;
      *(_QWORD *)&v14[i - 2] = v10->_bufferIndex;
      v10 = (MTLVertexAttributeDescriptorInternal *)v10->_offset;
    }
    else
    {
      vertexFormat = 0;
      *(_QWORD *)&v14[i - 2] = 0;
    }
    v12 = &v14[i];
    *((_QWORD *)v12 - 2) = vertexFormat;
    *(_QWORD *)v12 = v10;
    ++v8;
  }
  return _MTLHashState(v14, 0x5D0uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLVertexDescriptorInternal;
  v6 = -[MTLVertexDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, MTLVertexDescriptorDescription((uint64_t)self, a3));
}

- (id)description
{
  return -[MTLVertexDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (void)reset
{
  uint64_t i;
  MTLVertexBufferLayoutDescriptorInternal *v3;
  uint64_t j;
  MTLVertexAttributeDescriptorInternal *v5;

  for (i = 0; i != 31; ++i)
  {
    v3 = self->_vertexBufferArray->_descriptors[i];
    if (v3)
    {
      v3->_stride = 0;
      v3->_stepFunction = 1;
      v3->_instanceStepRate = 1;
    }
  }
  for (j = 0; j != 31; ++j)
  {
    v5 = self->_attributeArray->_descriptors[j];
    if (v5)
    {
      v5->_vertexFormat = 0;
      v5->_bufferIndex = 0;
      v5->_offset = 0;
    }
  }
}

+ (id)vertexDescriptor
{
  return objc_alloc_init(MTLVertexDescriptorInternal);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  BOOL result;
  uint64_t v7;
  MTLVertexBufferLayoutDescriptorInternal *v8;
  MTLVertexBufferLayoutDescriptorInternal *v9;
  BOOL v10;
  uint64_t v11;
  MTLVertexAttributeDescriptorInternal *v12;
  MTLVertexAttributeDescriptorInternal *v13;
  BOOL v14;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class == object_getClass(a3))
  {
    v7 = 0;
    while (1)
    {
      v8 = self->_vertexBufferArray->_descriptors[v7];
      v9 = *(MTLVertexBufferLayoutDescriptorInternal **)(*((_QWORD *)a3 + 1) + 8 + v7 * 8);
      if (v8 != v9)
      {
        if (v8)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (v10)
        {
          if (v8 && (v8->_stride || v8->_stepFunction != 1 || v8->_instanceStepRate != 1)
            || v9 && (v9->_stride || v9->_stepFunction != 1 || v9->_instanceStepRate != 1))
          {
            return 0;
          }
        }
        else if (v8->_stride != v9->_stride
               || v8->_stepFunction != v9->_stepFunction
               || v8->_instanceStepRate != v9->_instanceStepRate)
        {
          return 0;
        }
      }
      if (++v7 == 31)
      {
        v11 = 0;
        result = 1;
        while (1)
        {
          v12 = self->_attributeArray->_descriptors[v11];
          v13 = *(MTLVertexAttributeDescriptorInternal **)(*((_QWORD *)a3 + 2) + 8 + v11 * 8);
          if (v12 != v13)
          {
            if (v12)
              v14 = v13 == 0;
            else
              v14 = 1;
            if (v14)
            {
              if (v12 && (v12->_vertexFormat || v12->_bufferIndex || v12->_offset)
                || v13 && (v13->_vertexFormat || v13->_bufferIndex || v13->_offset))
              {
                return 0;
              }
            }
            else if (v12->_vertexFormat != v13->_vertexFormat
                   || v12->_bufferIndex != v13->_bufferIndex
                   || v12->_offset != v13->_offset)
            {
              return 0;
            }
          }
          if (++v11 == 31)
            return result;
        }
      }
    }
  }
  return 0;
}

- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5
{
  id v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MTLVertexAttributeDescriptorInternal *v18;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  unint64_t bufferIndex;
  MTLVertexBufferLayoutDescriptorInternal *v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  char v26;
  char v27;
  uint64_t v28;
  id *v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  const __CFString *v47;
  uint64_t v48;
  unint64_t v49;
  id v51;
  BOOL v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[3];
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v5 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  v60 = 0;
  memset(v59, 0, sizeof(v59));
  _MTLMessageContextBegin_((uint64_t)v59, (uint64_t)"-[MTLVertexDescriptorInternal validateWithVertexFunction:error:renderPipelineDescriptor:]", 904, objc_msgSend(a3, "device"), 4, (uint64_t)"Vertex Descriptor Validation");
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = (void *)objc_msgSend(v5, "vertexAttributes");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    v51 = v5;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "attributeIndex");
        if (objc_msgSend(v12, "isActive"))
        {
          v18 = self->_attributeArray->_descriptors[v13];
          if (!v18 || !v18->_vertexFormat)
          {
            v30 = a4;
            if (a4)
            {
              v31 = objc_msgSend(v12, "name");
              v32 = CFSTR("Vertex attribute %@(%d) is missing from the vertex descriptor");
              _MTLMessageContextPush_((uint64_t)v59, 2, (uint64_t)CFSTR("Vertex attribute %@(%d) is missing from the vertex descriptor"), v33, v34, v35, v36, v37, v31);
              v38 = objc_msgSend(v12, "name");
              goto LABEL_38;
            }
LABEL_39:
            _MTLMessageContextEnd((uint64_t)v59);
            return 0;
          }
          descriptors = self->_vertexBufferArray->_descriptors;
          bufferIndex = v18->_bufferIndex;
          v21 = descriptors[bufferIndex];
          if (!v21)
          {
            v30 = a4;
            if (a4)
            {
              v39 = objc_msgSend(v12, "name");
              v32 = CFSTR("Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index");
              _MTLMessageContextPush_((uint64_t)v59, 2, (uint64_t)CFSTR("Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index"), v40, v41, v42, v43, v44, v39);
              v38 = objc_msgSend(v12, "name");
              v49 = v18->_bufferIndex;
LABEL_38:
              *v30 = (id)compilerErrorWithMessage(&v32->isa, v38, v13, v49);
            }
            goto LABEL_39;
          }
          validateVertexAttribute((uint64_t)descriptors[bufferIndex], v13, (uint64_t)v18, (uint64_t)v59, v14, v15, v16, v17, v48);
          validateFunctionStepRate(v5, v21->_stepFunction, v21->_instanceStepRate, (uint64_t)v59);
          v22 = objc_msgSend(v12, "attributeType");
          if (v22 < gAttributeTypesCount)
          {
            v23 = v22;
            v24 = objc_msgSend(a5, "openGLModeEnabled");
            if (v23 || !v24 || byte_1EDCC74FC)
            {
              v54 = 0;
              v53 = 0;
              v25 = isVertexFormatInteger((MTLAttributeFormat)v18->_vertexFormat, &v54, &v53);
              if ((BYTE3(attributeTypes[3 * v23 + 2]) & 1) == 0)
              {
                if (v54 == 4)
                  v26 = v25 ^ 1;
                else
                  v26 = 1;
                goto LABEL_24;
              }
              if (v25
                && ((BYTE3(attributeTypes[3 * v23 + 2]) & 2) == 0 || v53)
                && ((BYTE3(attributeTypes[3 * v23 + 2]) & 2) != 0 || !v53))
              {
                objc_msgSend(a5, "openGLModeEnabled");
              }
              else
              {
                v26 = 0;
LABEL_24:
                v27 = objc_msgSend(a5, "openGLModeEnabled");
                if ((v26 & 1) == 0 && (v27 & 1) == 0)
                {
                  if (a4)
                  {
                    v45 = objc_msgSend(v12, "name");
                    v46 = attributeTypes[3 * v23 + 1];
                    v47 = MTLAttributeFormatString((MTLAttributeFormat)v18->_vertexFormat);
                    *a4 = (id)compilerErrorWithMessage(CFSTR("Vertex attribute %@(%d) of type %s cannot be read using %@"), v45, v13, v46, v47);
                  }
                  goto LABEL_39;
                }
              }
              v5 = v51;
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      v9 = v28;
    }
    while (v28);
  }
  if (a4)
    *a4 = 0;
  _MTLMessageContextEnd((uint64_t)v59);
  return *(_QWORD *)&v59[0] == 0;
}

@end
