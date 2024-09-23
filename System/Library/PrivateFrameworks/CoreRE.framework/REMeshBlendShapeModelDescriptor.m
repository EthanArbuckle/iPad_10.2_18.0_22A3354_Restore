@implementation REMeshBlendShapeModelDescriptor

- (REMeshBlendShapeModelDescriptor)initWithMeshBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6
{
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  REMeshBlendShapeBufferDescriptor *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  void *v24;
  REMeshBlendShapeModelDescriptor *v25;
  unint64_t v27;
  id v29;
  id v30;
  id v31[3];
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  _OWORD v40[5];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v40[0] = 0;
  v27 = a4;

  if (*((_QWORD *)a3 + 2))
  {
    v10 = 0;
    v11 = 48;
    do
    {
      re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)v31, *((_QWORD *)a3 + 4) + v11 - 48, *(unsigned __int16 *)(*((_QWORD *)a3 + 4) + v11), v10++, 0);
      v11 += 56;
    }
    while (v10 < *((_QWORD *)a3 + 2));
  }
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = *(_QWORD **)a6;
  v13 = **(unsigned __int8 **)a6;
  if (v12[2])
  {
    v14 = 0;
    v15 = 0;
    v16 = 8;
    do
    {
      v17 = -[REMeshBlendShapeBufferDescriptor initWithBlendShapeBufferPayload:indexType:payloadBuilder:]([REMeshBlendShapeBufferDescriptor alloc], "initWithBlendShapeBufferPayload:indexType:payloadBuilder:", v12[3] + v14, v13, a5);
      objc_msgSend(v30, "addObject:", v17);
      v18 = v12[8];
      if (v18 <= v15)
      {
        v31[2] = 0;
        memset(v40, 0, sizeof(v40));
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v32 = 136315906;
        v33 = "operator[]";
        v34 = 1024;
        v35 = 468;
        v36 = 2048;
        v37 = v15;
        v38 = 2048;
        v39 = v18;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v12[9] + v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v19);

      ++v15;
      v16 += 16;
      v14 += 184;
    }
    while (v15 < v12[2]);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v27);
  v21 = v12[5];
  if (v21)
  {
    v22 = (unsigned int *)v12[6];
    v23 = 4 * v21;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v24);

      ++v22;
      v23 -= 4;
    }
    while (v23);
  }
  v25 = -[REMeshBlendShapeModelDescriptor initWithBlendShapeIndexType:blendShapeBuffers:perMeshPartBlendShapeBufferIndex:blendGroupNames:](self, "initWithBlendShapeIndexType:blendShapeBuffers:perMeshPartBlendShapeBufferIndex:blendGroupNames:", v13, v30, v20, v29);

  return v25;
}

- (REMeshBlendShapeModelDescriptor)initWithBlendShapeData:(const void *)a3 meshPartCount:(unint64_t)a4 payloadBuilder:(void *)a5 deformationModelData:(void *)a6
{
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  REMeshBlendShapeBufferDescriptor *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  void *v24;
  REMeshBlendShapeModelDescriptor *v25;
  unint64_t v27;
  id v29;
  id v30;
  id v31[3];
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  _OWORD v40[5];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v40[0] = 0;
  v27 = a4;

  if (*((_QWORD *)a3 + 2))
  {
    v10 = 0;
    v11 = 48;
    do
    {
      re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)v31, *((_QWORD *)a3 + 4) + v11 - 48, *(unsigned __int16 *)(*((_QWORD *)a3 + 4) + v11), v10++, 0);
      v11 += 56;
    }
    while (v10 < *((_QWORD *)a3 + 2));
  }
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = *(_QWORD **)a6;
  v13 = **(unsigned __int8 **)a6;
  if (v12[2])
  {
    v14 = 0;
    v15 = 0;
    v16 = 8;
    do
    {
      v17 = -[REMeshBlendShapeBufferDescriptor initWithBlendShapeBufferPayload:indexType:payloadBuilder:]([REMeshBlendShapeBufferDescriptor alloc], "initWithBlendShapeBufferPayload:indexType:payloadBuilder:", v12[3] + v14, v13, a5);
      objc_msgSend(v30, "addObject:", v17);
      v18 = v12[8];
      if (v18 <= v15)
      {
        v31[2] = 0;
        memset(v40, 0, sizeof(v40));
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v32 = 136315906;
        v33 = "operator[]";
        v34 = 1024;
        v35 = 468;
        v36 = 2048;
        v37 = v15;
        v38 = 2048;
        v39 = v18;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v12[9] + v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v19);

      ++v15;
      v16 += 16;
      v14 += 184;
    }
    while (v15 < v12[2]);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v27);
  v21 = v12[5];
  if (v21)
  {
    v22 = (unsigned int *)v12[6];
    v23 = 4 * v21;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v24);

      ++v22;
      v23 -= 4;
    }
    while (v23);
  }
  v25 = -[REMeshBlendShapeModelDescriptor initWithBlendShapeIndexType:blendShapeBuffers:perMeshPartBlendShapeBufferIndex:blendGroupNames:](self, "initWithBlendShapeIndexType:blendShapeBuffers:perMeshPartBlendShapeBufferIndex:blendGroupNames:", v13, v30, v20, v29);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshBlendShapeModelDescriptor)initWithBlendShapeIndexType:(unint64_t)a3 blendShapeBuffers:(id)a4 perMeshPartBlendShapeBufferIndex:(id)a5 blendGroupNames:(id)a6
{
  id v10;
  id v11;
  id v12;
  REMeshBlendShapeModelDescriptor *v13;
  REMeshBlendShapeModelDescriptor *v14;
  uint64_t v15;
  NSArray *blendShapeBuffers;
  uint64_t v17;
  NSArray *perMeshPartBlendShapeBufferIndex;
  uint64_t v19;
  NSArray *blendShapeGroupNames;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)REMeshBlendShapeModelDescriptor;
  v13 = -[REMeshBlendShapeModelDescriptor init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_blendShapeIndexType = a3;
    v15 = objc_msgSend(v10, "copy");
    blendShapeBuffers = v14->_blendShapeBuffers;
    v14->_blendShapeBuffers = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    perMeshPartBlendShapeBufferIndex = v14->_perMeshPartBlendShapeBufferIndex;
    v14->_perMeshPartBlendShapeBufferIndex = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    blendShapeGroupNames = v14->_blendShapeGroupNames;
    v14->_blendShapeGroupNames = (NSArray *)v19;

  }
  return v14;
}

- (REMeshBlendShapeModelDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  NSArray *blendShapeBuffers;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *perMeshPartBlendShapeBufferIndex;
  void *v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *blendShapeGroupNames;
  NSUInteger v21;
  NSString *v22;
  REMeshBlendShapeModelDescriptor *v24;
  void *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("blendShapeBuffers"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  blendShapeBuffers = self->_blendShapeBuffers;
  self->_blendShapeBuffers = v8;

  v10 = validateMTLIndexType((re *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blendShapeIndexType")), (MTLIndexType *)&self->_blendShapeIndexType);
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("perMeshPartBlendShapeBufferIndex"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  perMeshPartBlendShapeBufferIndex = self->_perMeshPartBlendShapeBufferIndex;
  self->_perMeshPartBlendShapeBufferIndex = v14;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("blendShapeGroupNames"));
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  blendShapeGroupNames = self->_blendShapeGroupNames;
  self->_blendShapeGroupNames = v19;

  v21 = -[NSArray count](self->_blendShapeGroupNames, "count");
  if (v21 == -[NSArray count](self->_blendShapeBuffers, "count") && v10)
  {
    v24 = self;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v25);

    v24 = 0;
  }

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendShapeBuffers, CFSTR("blendShapeBuffers"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_blendShapeIndexType, CFSTR("blendShapeIndexType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_perMeshPartBlendShapeBufferIndex, CFSTR("perMeshPartBlendShapeBufferIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendShapeGroupNames, CFSTR("blendShapeGroupNames"));

}

- (BOOL)validateWithPayloadSize:(const void *)a3 partCount:(unint64_t)a4 error:(id *)a5
{
  __CFString *v8;
  unint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  int v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_perMeshPartBlendShapeBufferIndex, "count") > a4)
  {
    v8 = CFSTR("REMeshBlendShapeModelDescriptor: blend shape index per mesh part out of range");
    goto LABEL_26;
  }
  v9 = -[NSArray count](self->_blendShapeBuffers, "count");
  if (-[NSArray count](self->_blendShapeGroupNames, "count") != v9)
  {
    v8 = CFSTR("REMeshBlendShapeModelDescriptor: blend shape group name count does not match blend shape count");
LABEL_26:
    return 0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_perMeshPartBlendShapeBufferIndex;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntValue");
        if (v14 != -1 && v9 < v14)
        {

          return 0;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = self->_blendShapeBuffers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v16);
        v20 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "validateWithPayloadSize:error:", a3, a5, (_QWORD)v24);

        if (!v21)
        {
          v22 = 0;
          goto LABEL_30;
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v17)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_30:

  return v22;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  objc_class *v5;
  size_t v6;
  NSArray *perMeshPartBlendShapeBufferIndex;
  uint64_t v8;
  objc_class *v9;
  size_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  objc_class *v17;
  size_t v18;
  NSArray *blendShapeBuffers;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  size_t v27;
  NSArray *blendShapeGroupNames;
  uint64_t v29;
  objc_class *v30;
  size_t v31;
  NSArray *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  size_t v38;
  uint64_t v39;
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
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  if (self->_perMeshPartBlendShapeBufferIndex)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = class_getInstanceSize(v5);
    perMeshPartBlendShapeBufferIndex = self->_perMeshPartBlendShapeBufferIndex;
  }
  else
  {
    perMeshPartBlendShapeBufferIndex = 0;
    v6 = 0;
  }
  v8 = -[NSArray count](perMeshPartBlendShapeBufferIndex, "count");
  v9 = (objc_class *)objc_opt_class();
  v10 = class_getInstanceSize(v9);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v11 = self->_perMeshPartBlendShapeBufferIndex;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v13 = v6 + InstanceSize + 8 * v8;
  if (v12)
  {
    v14 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v11);
        if (*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v15))
          v16 = v10;
        else
          v16 = 0;
        v13 += v16;
        ++v15;
      }
      while (v12 != v15);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v12);
  }

  if (self->_blendShapeBuffers)
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = class_getInstanceSize(v17);
    blendShapeBuffers = self->_blendShapeBuffers;
  }
  else
  {
    blendShapeBuffers = 0;
    v18 = 0;
  }
  v20 = -[NSArray count](blendShapeBuffers, "count");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = self->_blendShapeBuffers;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  v23 = v18 + v13 + 8 * v20;
  if (v22)
  {
    v24 = *(_QWORD *)v46;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        v23 += objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v25++), "estimateContainerSize");
      }
      while (v22 != v25);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v22);
  }

  if (self->_blendShapeGroupNames)
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = class_getInstanceSize(v26);
    blendShapeGroupNames = self->_blendShapeGroupNames;
  }
  else
  {
    blendShapeGroupNames = 0;
    v27 = 0;
  }
  v29 = -[NSArray count](blendShapeGroupNames, "count");
  v30 = (objc_class *)objc_opt_class();
  v31 = class_getInstanceSize(v30);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = self->_blendShapeGroupNames;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  v34 = v27 + v23 + 8 * v29;
  if (v33)
  {
    v35 = *(_QWORD *)v42;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v36);
        if (v37)
          v38 = v31;
        else
          v38 = 0;
        if (v37)
          v39 = objc_msgSend(v37, "lengthOfBytesUsingEncoding:", 4, (_QWORD)v41) + 1;
        else
          v39 = 0;
        v34 += v38 + v39;
        ++v36;
      }
      while (v33 != v36);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v33);
  }

  return v34;
}

- (unint64_t)blendShapeIndexType
{
  return self->_blendShapeIndexType;
}

- (NSArray)perMeshPartBlendShapeBufferIndex
{
  return self->_perMeshPartBlendShapeBufferIndex;
}

- (NSArray)blendShapeBuffers
{
  return self->_blendShapeBuffers;
}

- (NSArray)blendShapeGroupNames
{
  return self->_blendShapeGroupNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendShapeGroupNames, 0);
  objc_storeStrong((id *)&self->_blendShapeBuffers, 0);
  objc_storeStrong((id *)&self->_perMeshPartBlendShapeBufferIndex, 0);
}

@end
