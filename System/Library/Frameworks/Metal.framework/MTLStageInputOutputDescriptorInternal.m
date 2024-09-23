@implementation MTLStageInputOutputDescriptorInternal

- (MTLStageInputOutputDescriptorInternal)init
{
  MTLStageInputOutputDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  v2 = -[MTLStageInputOutputDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_vertexBufferArray = objc_alloc_init(MTLBufferLayoutDescriptorArrayInternal);
    v2->_attributeArray = objc_alloc_init(MTLAttributeDescriptorArrayInternal);
  }
  return v2;
}

- (id)layouts
{
  return self->_vertexBufferArray;
}

- (id)attributes
{
  return self->_attributeArray;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)indexBufferIndex
{
  return self->_indexBufferIndex;
}

- (void)setIndexBufferIndex:(unint64_t)a3
{
  self->_indexBufferIndex = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  -[MTLStageInputOutputDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLStageInputOutputDescriptorInternal;
  v6 = -[MTLStageInputOutputDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, MTLStageInputOutputDescriptorDescription((uint64_t)self, a3));
}

- (id)description
{
  return -[MTLStageInputOutputDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (void)reset
{
  uint64_t i;
  MTLBufferLayoutDescriptorInternal *v3;
  uint64_t j;
  MTLAttributeDescriptorInternal *v5;

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
  return objc_alloc_init(MTLStageInputOutputDescriptorInternal);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t i;
  MTLBufferLayoutDescriptorInternal *v7;
  uint64_t j;
  MTLAttributeDescriptorInternal *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    for (i = 0; i != 31; ++i)
    {
      v7 = self->_vertexBufferArray->_descriptors[i];
      if (v7)
        *(_QWORD *)(v5[1] + 8 + i * 8) = -[MTLBufferLayoutDescriptorInternal copyWithZone:](v7, "copyWithZone:", a3);
    }
    for (j = 0; j != 31; ++j)
    {
      v9 = self->_attributeArray->_descriptors[j];
      if (v9)
        *(_QWORD *)(v5[2] + 8 + j * 8) = -[MTLAttributeDescriptorInternal copyWithZone:](v9, "copyWithZone:", a3);
    }
    v5[3] = self->_indexBufferIndex;
    v5[4] = self->_indexType;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  MTLBufferLayoutDescriptorInternal **descriptors;
  MTLBufferLayoutDescriptorInternal *v4;
  uint64_t stepFunction;
  uint64_t instanceStepRate;
  int *v7;
  MTLAttributeDescriptorInternal **v8;
  uint64_t i;
  MTLAttributeDescriptorInternal *v10;
  unint64_t vertexFormat;
  int *v12;
  int v14[372];
  unint64_t indexBufferIndex;
  unint64_t indexType;

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
      v10 = (MTLAttributeDescriptorInternal *)v10->_offset;
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
  indexBufferIndex = self->_indexBufferIndex;
  indexType = self->_indexType;
  return _MTLHashState(v14, 0x5E0uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  uint64_t i;
  MTLBufferLayoutDescriptorInternal *v8;
  MTLBufferLayoutDescriptorInternal *v9;
  BOOL v10;
  uint64_t j;
  MTLAttributeDescriptorInternal *v12;
  MTLAttributeDescriptorInternal *v13;
  BOOL v14;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  for (i = 0; i != 31; ++i)
  {
    v8 = self->_vertexBufferArray->_descriptors[i];
    v9 = *(MTLBufferLayoutDescriptorInternal **)(*((_QWORD *)a3 + 1) + 8 + i * 8);
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
  }
  for (j = 0; j != 31; ++j)
  {
    v12 = self->_attributeArray->_descriptors[j];
    v13 = *(MTLAttributeDescriptorInternal **)(*((_QWORD *)a3 + 2) + 8 + j * 8);
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
  }
  return self->_indexBufferIndex == *((_QWORD *)a3 + 3) && self->_indexType == *((_QWORD *)a3 + 4);
}

- (id)newSerializedDescriptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  MTLBufferLayoutDescriptorInternal **descriptors;
  MTLBufferLayoutDescriptorInternal *v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  MTLAttributeDescriptorInternal *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  __int16 v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  unint64_t v31;
  MTLBufferLayoutDescriptorArrayInternal *vertexBufferArray;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  MTLAttributeDescriptorInternal *v41;
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
  _MTLMessageContextBegin_((uint64_t)v49, (uint64_t)"-[MTLStageInputOutputDescriptorInternal newSerializedDescriptor]", 743, 0, 5, (uint64_t)"Serialized Descriptor Creation");
  v7 = 0;
  v8 = 0;
  memset(v51, 0, 31);
  v9 = 0x1EDCC0000uLL;
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
  v14 = 0x1EDCC0000uLL;
  do
  {
    v15 = self->_attributeArray->_descriptors[v12];
    if (v15 && *(Class *)((char *)&v15->super.super.isa + *(int *)(v14 + 1772)))
    {
      v16 = *(uint64_t *)((char *)&self->_vertexBufferArray->super.super.isa + 8 * v15->_bufferIndex
                                                                            + *(int *)(v9 + 1768));
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
    v20 = v19 + 8 * v13;
    v21 = ((v8 & 0x1F) << 6) | ((_WORD)v13 << 11) | (2 * (self->_indexBufferIndex & 0x1F)) | self->_indexType & 1;
    v22 = malloc_type_malloc(v20, 0x9DB263D6uLL);
    bzero(v22, v20);
    v28 = 0;
    v29 = 0;
    *v22 = v20;
    v22[1] = v21;
    size = v20;
    v22[2] = 8;
    v47 = v19;
    v22[3] = v19;
    v30 = *(_DWORD *)(v9 + 1768);
    v31 = 0x1EDCC0000uLL;
    do
    {
      vertexBufferArray = self->_vertexBufferArray;
      if (*((_BYTE *)v51 + v28))
      {
        _MTLMessageContextPush_((uint64_t)v49, 4, (uint64_t)CFSTR("None of the attributes set bufferIndex to %d, but %s set buffer layout[%d].stride(%lu)."), v23, v24, v25, v26, v27, v28);
        v30 = *(_DWORD *)(v9 + 1768);
        vertexBufferArray = self->_vertexBufferArray;
      }
      v33 = *(uint64_t *)((char *)&vertexBufferArray->super.super.isa + 8 * v28 + v30);
      if (v33)
      {
        v34 = *(_QWORD *)(v33 + *(int *)(v31 + 1756));
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
          if (v38 >= 9)
          {
            _MTLMessageContextPush_((uint64_t)v49, 4, (uint64_t)CFSTR("stepFunction is not a valid MTLStepFunction."), v23, v24, v25, v26, v27, v46);
            v38 = *(_QWORD *)(v33 + 16);
            v36 = *v37;
          }
          ++v29;
          validateFunctionStepRate(v38, v36, (uint64_t)v49, v23, v24, v25, v26, v27, v46);
          v30 = *(_DWORD *)(v9 + 1768);
          v31 = 0x1EDCC0000;
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

- (BOOL)validateWithVertexFunction:(id)a3 error:(id *)a4 renderPipelineDescriptor:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  MTLAttributeDescriptorInternal *v19;
  MTLBufferLayoutDescriptorInternal **descriptors;
  uint64_t v21;
  MTLBufferLayoutDescriptorInternal *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  char v32;
  char v33;
  uint64_t v34;
  id *v36;
  uint64_t v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  const __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v60;
  int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  _MTLMessageContextBegin_((uint64_t)v66, (uint64_t)"-[MTLStageInputOutputDescriptorInternal validateWithVertexFunction:error:renderPipelineDescriptor:]", 904, objc_msgSend(a3, "device"), 4, (uint64_t)"Vertex Descriptor Validation");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = (void *)objc_msgSend(a3, "vertexAttributes");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    v11 = 0x1EDCC0000uLL;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "attributeIndex");
        if (objc_msgSend(v13, "isActive"))
        {
          v19 = self->_attributeArray->_descriptors[v14];
          if (!v19 || !v19->_vertexFormat)
          {
            v36 = a4;
            if (a4)
            {
              v37 = objc_msgSend(v13, "name");
              v38 = CFSTR("Vertex attribute %@(%d) is missing from the vertex descriptor");
              _MTLMessageContextPush_((uint64_t)v66, 2, (uint64_t)CFSTR("Vertex attribute %@(%d) is missing from the vertex descriptor"), v39, v40, v41, v42, v43, v37);
              v44 = objc_msgSend(v13, "name");
              goto LABEL_38;
            }
LABEL_39:
            _MTLMessageContextEnd((uint64_t)v66);
            return 0;
          }
          descriptors = self->_vertexBufferArray->_descriptors;
          v21 = *(uint64_t *)((char *)&v19->super.super.isa + *(int *)(v11 + 1780));
          v22 = descriptors[v21];
          if (!v22)
          {
            v36 = a4;
            if (a4)
            {
              v45 = objc_msgSend(v13, "name");
              v46 = v11;
              v38 = CFSTR("Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index");
              _MTLMessageContextPush_((uint64_t)v66, 2, (uint64_t)CFSTR("Vertex attribute %@(%d) references a vertex buffer at index %d, but there is no buffer layout set for that index"), v47, v48, v49, v50, v51, v45);
              v44 = objc_msgSend(v13, "name");
              v57 = *(uint64_t *)((char *)&v19->super.super.isa + *(int *)(v46 + 1780));
LABEL_38:
              *v36 = (id)compilerErrorWithMessage(&v38->isa, v44, v14, v57);
            }
            goto LABEL_39;
          }
          validateVertexAttribute((uint64_t)descriptors[v21], v14, (uint64_t)v19, (uint64_t)v66, v15, v16, v17, v18, v55);
          validateFunctionStepRate(v22->_stepFunction, v22->_instanceStepRate, (uint64_t)v66, v23, v24, v25, v26, v27, v56);
          v28 = objc_msgSend(v13, "attributeType");
          if (v28 < gAttributeTypesCount)
          {
            v29 = v28;
            v30 = objc_msgSend(a5, "openGLModeEnabled");
            if (v29 || !v30 || byte_1EDCC74FC)
            {
              v61 = 0;
              v60 = 0;
              v31 = isVertexFormatInteger((MTLAttributeFormat)v19->_vertexFormat, &v61, &v60);
              if ((BYTE3(attributeTypes[3 * v29 + 2]) & 1) == 0)
              {
                if (v61 == 4)
                  v32 = v31 ^ 1;
                else
                  v32 = 1;
                goto LABEL_24;
              }
              if (v31
                && ((BYTE3(attributeTypes[3 * v29 + 2]) & 2) == 0 || v60)
                && ((BYTE3(attributeTypes[3 * v29 + 2]) & 2) != 0 || !v60))
              {
                objc_msgSend(a5, "openGLModeEnabled");
              }
              else
              {
                v32 = 0;
LABEL_24:
                v33 = objc_msgSend(a5, "openGLModeEnabled");
                if ((v32 & 1) == 0 && (v33 & 1) == 0)
                {
                  if (a4)
                  {
                    v52 = objc_msgSend(v13, "name");
                    v53 = attributeTypes[3 * v29 + 1];
                    v54 = MTLAttributeFormatString((MTLAttributeFormat)v19->_vertexFormat);
                    *a4 = (id)compilerErrorWithMessage(CFSTR("Vertex attribute %@(%d) of type %s cannot be read using %@"), v52, v14, v53, v54);
                  }
                  goto LABEL_39;
                }
              }
              v11 = 0x1EDCC0000;
            }
          }
        }
        ++v12;
      }
      while (v9 != v12);
      v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      v9 = v34;
    }
    while (v34);
  }
  if (a4)
    *a4 = 0;
  _MTLMessageContextEnd((uint64_t)v66);
  return *(_QWORD *)&v66[0] == 0;
}

@end
