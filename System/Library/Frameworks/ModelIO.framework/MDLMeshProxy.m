@implementation MDLMeshProxy

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)self->super._allocator, CFSTR("allocator"));
  objc_msgSend_encodeInteger_forKey_(v8, v5, self->super._vertexCount, CFSTR("vertexCount"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_encodeMeshBuffers_withCoder_forKey_(self->super._allocator, v6, (uint64_t)self->super._vertexBuffers, v8, CFSTR("vertexBuffers"));
  objc_msgSend_encodeVertexDescriptorWithCoder_(self->super._vertexDescriptor, v6, (uint64_t)v8);
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->super._submeshes, CFSTR("submeshes"));

}

- (MDLMeshProxy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  MDLMeshBufferAllocator *v13;
  MDLMeshBufferAllocator *allocator;
  const char *v15;
  NSMutableArray *v16;
  NSMutableArray *vertexBuffers;
  const char *v18;
  MDLVertexDescriptor *v19;
  MDLVertexDescriptor *vertexDescriptor;
  const char *v21;
  NSMutableArray *v22;
  NSMutableArray *submeshes;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_setWithObjects_(v5, v9, v6, v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("allocator"));
  v13 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->super._allocator;
  self->super._allocator = v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_decodeMeshBuffersWithCoder_forKey_(self->super._allocator, v15, (uint64_t)v4, CFSTR("vertexBuffers"));
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    vertexBuffers = self->super._vertexBuffers;
    self->super._vertexBuffers = v16;

  }
  self->super._vertexCount = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("vertexCount"));
  objc_msgSend_decodeVertexDescriptorWithCoder_(MDLVertexDescriptor, v18, (uint64_t)v4);
  v19 = (MDLVertexDescriptor *)objc_claimAutoreleasedReturnValue();
  vertexDescriptor = self->super._vertexDescriptor;
  self->super._vertexDescriptor = v19;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v10, CFSTR("submeshes"));
  v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  submeshes = self->super._submeshes;
  self->super._submeshes = v22;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MDLMeshProxy)initWithVertexBuffers:(id)a3 vertexCount:(unint64_t)a4 descriptor:(id)a5 submeshes:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  const char *v44;
  char isEqual;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  const char *v53;
  id v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  const char *v69;
  uint64_t v70;
  unint64_t m;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  char v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  BOOL v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  const char *v88;
  MDLMeshProxy *v89;
  MDLMeshProxy *v90;
  id v96;
  const char *v97;
  uint64_t v98;
  NSMutableArray *vertexBuffers;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  MDLVertexDescriptor *vertexDescriptor;
  id v104;
  const char *v105;
  uint64_t v106;
  NSMutableArray *submeshes;
  MDLMeshProxy *v108;
  void *v111;
  id v112;
  id v113;
  MDLMeshProxy *v115;
  objc_super v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  objc_super v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v113 = a5;
  v111 = v9;
  v112 = a6;
  v129.receiver = self;
  v129.super_class = (Class)MDLMeshProxy;
  v115 = -[MDLObject init](&v129, sel_init);
  if (!v115)
  {
    v90 = 0;
    goto LABEL_48;
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v10 = v9;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v125, v132, 16);
  if (!v14)
    goto LABEL_13;
  v15 = *(_QWORD *)v126;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v126 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
      objc_msgSend_null(MEMORY[0x1E0C99E38], v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v17, v19, (uint64_t)v18) & 1) == 0)
      {
        v22 = objc_msgSend_type(v17, v20, v21) == 1;

        if (v22)
          continue;
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v23, v26, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: vertexBuffer.type must be MDLMeshBufferTypeVertex"), v18, v25);

      }
    }
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v125, v132, 16);
  }
  while (v14);
LABEL_13:

  v29 = v113;
  if (!v113)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v30, v34, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: No descriptor supplied"), v32, v33);

    v29 = 0;
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend_attributes(v29, v27, v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v121, v131, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v122 != v40)
          objc_enumerationMutation(v35);
        v42 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v37, v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v42, v44, (uint64_t)v43);

        if ((isEqual & 1) == 0)
        {
          v46 = objc_msgSend_bufferIndex(v42, v37, v38);
          if (v46 > objc_msgSend_count(v10, v47, v48))
          {
            v49 = (void *)MEMORY[0x1E0C99DA0];
            v50 = (objc_class *)objc_opt_class();
            NSStringFromClass(v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_raise_format_(v49, v53, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Buffer index out of range"), v51, v52);

          }
        }
      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v121, v131, 16);
    }
    while (v39);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v54 = v10;
  v56 = 0;
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v117, v130, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v118;
    do
    {
      for (k = 0; k != v59; ++k)
      {
        if (*(_QWORD *)v118 != v60)
          objc_enumerationMutation(v54);
        if (!v56)
        {
          v62 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * k);
          objc_msgSend_null(MEMORY[0x1E0C99E38], v57, v58);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v62, v64, (uint64_t)v63))
          {

          }
          else
          {
            objc_msgSend_allocator(v62, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67 == 0;

            if (!v68)
            {
              objc_msgSend_allocator(v62, v57, v58);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              continue;
            }
          }
          v56 = 0;
        }
      }
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v117, v130, 16);
    }
    while (v59);
  }

  for (m = 0; objc_msgSend_count(v54, v69, v70) > m; ++m)
  {
    objc_msgSend_objectAtIndexedSubscript_(v54, v72, m);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x1E0C99E38], v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_isEqual_(v73, v77, (uint64_t)v76);

    if ((v78 & 1) == 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v54, v69, m);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allocator(v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82 == v56;

      if (!v83)
      {
        v84 = (void *)MEMORY[0x1E0C99DA0];
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v84, v88, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Allocators on supplied vertexBuffers do not all match, but they must"), v86, v87);

      }
    }
  }
  v116.receiver = v115;
  v116.super_class = (Class)MDLMeshProxy;
  v89 = -[MDLObject init](&v116, sel_init);
  v90 = v89;
  if (v89)
  {
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v89->super._anon_50 = _Q1;
    *(_OWORD *)&v89->super._anon_50[16] = 0u;
    objc_storeStrong((id *)&v89->super._allocator, v56);
    v90->super._vertexCount = a4;
    v96 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v98 = objc_msgSend_initWithArray_(v96, v97, (uint64_t)v54);
    vertexBuffers = v90->super._vertexBuffers;
    v90->super._vertexBuffers = (NSMutableArray *)v98;

    v100 = MEMORY[0x1DF0D0AF8]();
    v102 = objc_msgSend_copyWithZone_(v113, v101, v100);
    vertexDescriptor = v90->super._vertexDescriptor;
    v90->super._vertexDescriptor = (MDLVertexDescriptor *)v102;

    v104 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v106 = objc_msgSend_initWithArray_(v104, v105, (uint64_t)v112);
    submeshes = v90->super._submeshes;
    v90->super._submeshes = (NSMutableArray *)v106;

    v108 = v90;
  }

LABEL_48:
  return v90;
}

@end
