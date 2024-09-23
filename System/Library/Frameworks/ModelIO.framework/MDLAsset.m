@implementation MDLAsset

- (void)_conformVertexBuffers:(id)a3 error:(id *)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  const char *v16;
  uint64_t v17;
  MDLMeshBufferDataAllocator *v18;
  MDLMeshBufferAllocator *bufferAllocator;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void **p_vertexDescriptor;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  unint64_t j;
  void *v34;
  const char *v35;
  uint64_t v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  unint64_t k;
  void *v54;
  const char *v55;
  uint64_t v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  int isEqualToString;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  double v128;
  double v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t m;
  id v144;
  const char *v145;
  void *v146;
  const char *v147;
  id obj;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    objc_msgSend_layouts(v4, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v154, v159, 16);
    if (!v12)
    {
LABEL_40:

      goto LABEL_41;
    }
    v13 = 0;
    v14 = *(_QWORD *)v155;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v155 != v14)
          objc_enumerationMutation(v8);
        if (objc_msgSend_stride(*(void **)(*((_QWORD *)&v154 + 1) + 8 * i), v10, v11, obj))
          ++v13;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v154, v159, 16);
    }
    while (v12);

    if (v13)
    {
      if (!self->_bufferAllocator)
      {
        v18 = objc_alloc_init(MDLMeshBufferDataAllocator);
        bufferAllocator = self->_bufferAllocator;
        self->_bufferAllocator = (MDLMeshBufferAllocator *)v18;

      }
      objc_msgSend_layouts(v7, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_count(v20, v21, v22);
      p_vertexDescriptor = (void **)&self->_vertexDescriptor;
      objc_msgSend_layouts(self->_vertexDescriptor, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v23 != objc_msgSend_count(v27, v28, v29);

      for (j = 0; ; ++j)
      {
        objc_msgSend_layouts(v7, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_count(v34, v35, v36) <= j;

        if (((v37 | v30) & 1) != 0)
          break;
        objc_msgSend_layouts(v7, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v40, v41, j);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_stride(v42, v43, v44);
        objc_msgSend_layouts(*p_vertexDescriptor, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v48, v49, j);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v45 != objc_msgSend_stride(v50, v51, v52);

      }
      for (k = 0; ; ++k)
      {
        objc_msgSend_attributes(v7, v38, v39);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend_count(v54, v55, v56) <= k;

        if (((v57 | v30) & 1) != 0)
          break;
        objc_msgSend_attributes(v7, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v60, v61, k);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_attributes(*p_vertexDescriptor, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v68, v69, k);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v65, v74, (uint64_t)v73);

        objc_msgSend_attributes(v7, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v78, v79, k);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend_format(v80, v81, v82);
        objc_msgSend_attributes(*p_vertexDescriptor, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v86, v87, k);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83 == objc_msgSend_format(v88, v89, v90))
          v30 = isEqualToString ^ 1;
        else
          v30 = 1;

        objc_msgSend_attributes(v7, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v93, v94, k);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend_offset(v95, v96, v97);
        objc_msgSend_attributes(*p_vertexDescriptor, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v101, v102, k);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v98 != objc_msgSend_offset(v103, v104, v105))
          v30 = 1;

        objc_msgSend_attributes(v7, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v108, v109, k);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend_bufferIndex(v110, v111, v112);
        objc_msgSend_attributes(*p_vertexDescriptor, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v116, v117, k);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        if (v113 != objc_msgSend_bufferIndex(v118, v119, v120))
          v30 = 1;

        objc_msgSend_attributes(v7, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v123, v124, k);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v125, v126, v127);
        v129 = v128;
        objc_msgSend_attributes(*p_vertexDescriptor, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v132, v133, k);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v134, v135, v136);
        if (v129 != v137)
          v30 = 1;

      }
      if ((v30 & 1) != 0)
      {
        v138 = objc_opt_class();
        objc_msgSend_childObjectsOfClass_(self, v139, v138);
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v140, (uint64_t)&v150, v158, 16);
        if (v141)
        {
          v142 = *(_QWORD *)v151;
          do
          {
            for (m = 0; m != v141; ++m)
            {
              if (*(_QWORD *)v151 != v142)
                objc_enumerationMutation(v8);
              v144 = *(id *)(*((_QWORD *)&v150 + 1) + 8 * m);
              v146 = v144;
              if (v144)
                objc_msgSend_setVertexDescriptor_(v144, v145, (uint64_t)v7);

            }
            v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v147, (uint64_t)&v150, v158, 16);
          }
          while (v141);
        }

        objc_storeStrong(p_vertexDescriptor, obj);
        goto LABEL_40;
      }
    }
  }
LABEL_41:

}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  NSURL *temporaryFolderURL;
  const char *v6;
  char v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  id v13;

  if (self->_temporaryFolderURL)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    temporaryFolderURL = self->_temporaryFolderURL;
    v13 = 0;
    v7 = objc_msgSend_removeItemAtURL_error_(v4, v6, (uint64_t)temporaryFolderURL, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      objc_msgSend_path(self->_temporaryFolderURL, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Failed to remove %@"), v11);

    }
  }
  else
  {
    v8 = 0;
  }

  v12.receiver = self;
  v12.super_class = (Class)MDLAsset;
  -[MDLAsset dealloc](&v12, sel_dealloc);
}

- (void)loadTextures
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v9 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1DCAD07BC;
  v7[3] = &unk_1EA577188;
  v7[4] = self;
  v5 = v3;
  v8 = v5;
  objc_msgSend_enumerateChildObjectsOfClass_usingBlock_stopPointer_(self, v6, v4, v7, &v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extents, 0);
  objc_storeStrong((id *)&self->_unitLength, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_temporaryFolderURL, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_masters, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator preserveTopology:(BOOL)preserveTopology error:(NSError *)error
{
  _BOOL8 v8;
  NSURL *v12;
  MDLVertexDescriptor *v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  MDLAsset *v20;

  v8 = preserveTopology;
  v12 = URL;
  v13 = vertexDescriptor;
  v14 = bufferAllocator;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v15, v18, (uint64_t)v17, CFSTR("kMDLAssetPreserveTopology"));

  if (v14)
    objc_msgSend_setObject_forKey_(v15, v19, (uint64_t)v14, CFSTR("kMDLAssetBufferAllocator"));
  if (v13)
    objc_msgSend_setObject_forKey_(v15, v19, (uint64_t)v13, CFSTR("kMDLAssetVertexDescriptor"));
  v20 = (MDLAsset *)objc_msgSend_initWithURL_options_error_(self, v19, (uint64_t)v12, v15, error);

  return v20;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *objects;
  MDLObjectContainer *v5;
  MDLObjectContainerComponent *masters;
  MDLObjectContainer *v7;
  MDLObjectContainerComponent *animations;
  MDLRelativeAssetResolver *v9;
  const char *v10;
  MDLAssetResolver *v11;
  MDLAssetResolver *resolver;
  NSURL *temporaryFolderURL;
  const char *v14;
  uint64_t v15;
  NSUnitLength *v16;
  NSUnitLength *unitLength;
  MDLAnimatedVector3Array *extents;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objects = self->_objects;
  self->_objects = v3;

  v5 = objc_alloc_init(MDLObjectContainer);
  masters = self->_masters;
  self->_masters = (MDLObjectContainerComponent *)v5;

  v7 = objc_alloc_init(MDLObjectContainer);
  animations = self->_animations;
  self->_animations = (MDLObjectContainerComponent *)v7;

  v9 = [MDLRelativeAssetResolver alloc];
  v11 = (MDLAssetResolver *)objc_msgSend_initWithAsset_(v9, v10, (uint64_t)self);
  resolver = self->_resolver;
  self->_resolver = v11;

  *(int64x2_t *)&self->_startTime = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->__timeCodesPerSecond = 60.0;
  temporaryFolderURL = self->_temporaryFolderURL;
  self->_temporaryFolderURL = 0;

  objc_msgSend_meters(MEMORY[0x1E0CB3AD8], v14, v15);
  v16 = (NSUnitLength *)objc_claimAutoreleasedReturnValue();
  unitLength = self->_unitLength;
  self->_unitLength = v16;

  *(_OWORD *)self->_upAxis = xmmword_1DCC583A0;
  self->_metersPerUnit = 0.01;
  extents = self->_extents;
  self->_extents = 0;

}

- (void)enumerateChildObjectsOfClass:(Class)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5
{
  void (**v8)(id, void *, BOOL *);
  BOOL *v9;
  MDLAsset *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, BOOL *))a4;
  v35 = 0;
  if (a5)
    v9 = a5;
  else
    v9 = (BOOL *)&v35;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8[2](v8, v15, v9);
      if (*v9)
        break;
      objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v15, v16, (uint64_t)a3, v15, v8, v9);
      if (*v9)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v31, v37, 16);
        if (v12)
          goto LABEL_6;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend_masters(v10, v18, v19, 0);
    v10 = (MDLAsset *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v20, (uint64_t)&v27, v36, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v28;
LABEL_17:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v10);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v23);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8[2](v8, v24, v9);
        if (*v9)
          break;
        objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v24, v25, (uint64_t)a3, v24, v8, v9);
        if (*v9)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v26, (uint64_t)&v27, v36, 16);
          if (v21)
            goto LABEL_17;
          break;
        }
      }
    }
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return objc_msgSend_countByEnumeratingWithState_objects_count_(self->_objects, a2, (uint64_t)a3, a4, a5);
}

- (id)masters
{
  return self->_masters;
}

- (MDLAsset)initWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  MDLAsset *v11;
  const __CFURL **p_URL;
  MDLMeshBufferAllocator *v13;
  MDLMeshBufferAllocator *bufferAllocator;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const __CFURL *v19;
  id v20;
  const char *v21;
  char *v22;
  std::string::size_type v23;
  const char *v24;
  const char *v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int v29;
  __int128 *v30;
  char v31;
  __int128 *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unsigned __int16 *v37;
  int v38;
  int v39;
  int v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  int v49;
  unsigned __int16 *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  void *v63;
  BOOL v64;
  BOOL v65;
  int v66;
  int v67;
  id v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  const __CFURL *v81;
  const char *v82;
  unsigned __int16 *v84;
  int v86;
  int v87;
  const char *v89;
  uint64_t v90;
  MDLVertexDescriptor *v91;
  MDLVertexDescriptor *vertexDescriptor;
  uint64_t v93;
  NSUnitLength *unitLength;
  uint64_t v95;
  char v96;
  id v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  MDLAsset *v103;
  uint64_t v105;
  char v106;
  id v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  MDLPhotometricLight *v112;
  const char *v113;
  void *v114;
  const char *v115;
  const char *v116;
  const char *v117;
  id v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  char v123;
  id v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  std::string *p_str;
  id v129;
  const char *v130;
  uint64_t v131;
  unint64_t v132;
  const char *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  id v137;
  id v138;
  _BYTE v139[32];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  void *__p;
  uint64_t v152;
  uint64_t v153;
  _QWORD v154[6];
  _QWORD v155[6];
  _QWORD v156[5];
  _QWORD v157[5];
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  char v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t);
  void (*v166)(uint64_t);
  id v167;
  id v168;
  __int128 v169;
  uint64_t v170;
  std::string __str;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  objc_super v177;

  v9 = a3;
  v10 = a4;
  v177.receiver = self;
  v177.super_class = (Class)MDLAsset;
  v11 = -[MDLAsset init](&v177, sel_init);
  if (!v11)
    goto LABEL_129;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  HIDWORD(v173) = 1070141403;
  LOBYTE(v174) = 1;
  WORD1(v174) = 256;
  DWORD1(v174) = 1078530011;
  v172 = 0u;
  sub_1DCB0345C((_QWORD *)&v174 + 1, "");
  v176 = 0uLL;
  sub_1DCAC765C(v10, (uint64_t)&v172);
  p_URL = (const __CFURL **)&v11->_URL;
  objc_storeStrong((id *)&v11->_URL, a3);
  if ((_QWORD)v173)
    v13 = (MDLMeshBufferAllocator *)(id)v173;
  else
    v13 = (MDLMeshBufferAllocator *)objc_opt_new();
  bufferAllocator = v11->_bufferAllocator;
  v11->_bufferAllocator = v13;

  objc_msgSend__commonInit(v11, v15, v16);
  v19 = *p_URL;
  if (!*p_URL)
    goto LABEL_125;
  memset(&__str, 0, sizeof(__str));
  v136 = (uint64_t)v9;
  objc_msgSend_path(v19, v17, v18);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = (char *)objc_msgSend_cStringUsingEncoding_(v20, v21, 4);
  sub_1DCB0345C(&__str, v22);

  v23 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
  v169 = 0uLL;
  v170 = 0;
  if (v23 == -1)
  {
    v34 = *((_QWORD *)&v172 + 1);
    v35 = v173;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v24, (uint64_t)&v169);
  }
  else
  {
    std::string::basic_string((std::string *)v139, &__str, v23 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v162);
    if (SHIBYTE(v170) < 0)
      operator delete((void *)v169);
    v169 = *(_OWORD *)v139;
    v170 = *(_QWORD *)&v139[16];
    v26 = v139[23];
    v27 = *(_QWORD *)&v139[8];
    if (v139[23] >= 0)
      v27 = HIBYTE(v170);
    if (v27)
    {
      v28 = 0;
      v29 = v139[23] >> 31;
      do
      {
        if ((v29 & 1) != 0)
          v30 = (__int128 *)v169;
        else
          v30 = &v169;
        v31 = __toupper(*((char *)v30 + v28));
        if (v170 >= 0)
          v32 = &v169;
        else
          v32 = (__int128 *)v169;
        *((_BYTE *)v32 + v28++) = v31;
        v29 = SHIBYTE(v170) >> 31;
        v33 = *((_QWORD *)&v169 + 1);
        if (v170 >= 0)
          v33 = HIBYTE(v170);
      }
      while (v28 < v33);
      v26 = SHIBYTE(v170);
    }
    v34 = *((_QWORD *)&v172 + 1);
    v35 = v173;
    if (v26 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v25, (uint64_t)&v169);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v25, v169);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1DCAC71AC(v36, v35 != 0, v34 != 0, v11->_isSceneKitBridged);

  if ((SHIBYTE(v170) & 0x80000000) == 0)
  {
    if (SHIBYTE(v170) == 3)
    {
      v37 = (unsigned __int16 *)&v169;
      goto LABEL_32;
    }
LABEL_36:
    v137 = 0;
    v41 = 1;
    goto LABEL_37;
  }
  if (*((_QWORD *)&v169 + 1) != 3)
    goto LABEL_36;
  v37 = (unsigned __int16 *)v169;
LABEL_32:
  v38 = *v37;
  v39 = *((unsigned __int8 *)v37 + 2);
  if (v38 != 21587 || v39 != 76)
    goto LABEL_36;
  v58 = objc_alloc(MEMORY[0x1E0C99D50]);
  v59 = (uint64_t)*p_URL;
  v168 = 0;
  v137 = (id)objc_msgSend_initWithContentsOfURL_options_error_(v58, v60, v59, 3, &v168);
  v61 = v168;
  v63 = v61;
  if (v61)
  {
    NSLog(CFSTR("%@"), v61);
  }
  else
  {
    if (v137)
    {
      v41 = 1;
      goto LABEL_82;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v62, (uint64_t)CFSTR("Could not load data from %@"), *p_URL);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v111);

  }
  v41 = 0;
LABEL_82:

LABEL_37:
  v162 = 0;
  v163 = &v162;
  v164 = 0x3032000000;
  v165 = sub_1DCB20640;
  v166 = sub_1DCB20650;
  v167 = 0;
  if (sub_1DCAC6D48(*p_URL))
    byte_1F03B50D8 = 1;
  v44 = (void *)sandbox_extension_issue_file();
  v45 = (void *)MEMORY[0x1E0CB3940];
  if (!v44)
  {
    objc_msgSend_path(*p_URL, v42, v43);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v45, v54, (uint64_t)CFSTR("Unable to issue extension for path %@"), v53);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v163[5];
    v163[5] = v55;

    sub_1DCB1FF60((void *)v163[5]);
    v57 = (id)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    NSLog(CFSTR("%@"), v163[5]);
    goto LABEL_113;
  }
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v42, (uint64_t)v44, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  free(v44);
  if (v41)
  {
    v48 = (void *)MEMORY[0x1DF0D25C8]();
    v158 = 0;
    v159 = &v158;
    v160 = 0x2020000000;
    v161 = 0;
    v49 = HIBYTE(v170);
    if (v170 < 0)
    {
      if (*((_QWORD *)&v169 + 1) != 3)
      {
LABEL_72:
        if (SHIBYTE(v170) < 0)
        {
          if (*((_QWORD *)&v169 + 1) == 3)
          {
            v84 = (unsigned __int16 *)v169;
            if (*(_WORD *)v169 != 16975 || *(_BYTE *)(v169 + 2) != 74)
            {
LABEL_88:
              v86 = *v84;
              v87 = *((unsigned __int8 *)v84 + 2);
              if (v86 == 21333 && v87 == 68)
                goto LABEL_96;
              goto LABEL_92;
            }
LABEL_130:
            *(_QWORD *)&v141 = 0;
            v140 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_1DCAF8EE4((uint64_t)v139, 0);
            v152 = 0;
            v153 = 0;
            __p = 0;
            sub_1DCAF8FA8((uint64_t)v139, v11->_URL, (unsigned __int8 *)&v172, v11, &__p);
            v105 = HIBYTE(v153);
            v106 = HIBYTE(v153);
            if (v153 < 0)
              v105 = v152;
            if (v105)
            {
              v107 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v153 >= 0)
                v109 = objc_msgSend_initWithUTF8String_(v107, v108, (uint64_t)&__p);
              else
                v109 = objc_msgSend_initWithUTF8String_(v107, v108, (uint64_t)__p);
              v110 = (void *)v163[5];
              v163[5] = v109;

              v106 = HIBYTE(v153);
            }
            if (v106 < 0)
              operator delete(__p);
            sub_1DCAF8F08((uint64_t)v139);
            goto LABEL_111;
          }
LABEL_92:
          if (sub_1DCAF24E8(&v169, "USDA")
            || sub_1DCAF24E8(&v169, "USDC")
            || sub_1DCAF24E8(&v169, "USDZ")
            || sub_1DCAF24E8(&v169, "ABC"))
          {
LABEL_96:
            *(_QWORD *)&v141 = 0;
            v140 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_1DCAD5E20(v139, 0);
            if (*((_QWORD *)&v172 + 1))
            {
              if (sub_1DCB20040(*((void **)&v172 + 1), v89, v90))
              {
                v91 = (MDLVertexDescriptor *)*((id *)&v172 + 1);
                vertexDescriptor = v11->_vertexDescriptor;
                v11->_vertexDescriptor = v91;
              }
              else
              {
                NSLog(CFSTR("Warning: No valid layouts found for vertex descriptor, using default vertex descriptor instead."));
                vertexDescriptor = v11->_vertexDescriptor;
                v11->_vertexDescriptor = 0;
              }

            }
            objc_msgSend_centimeters(MEMORY[0x1E0CB3AD8], v89, v90);
            v93 = objc_claimAutoreleasedReturnValue();
            unitLength = v11->_unitLength;
            v11->_unitLength = (NSUnitLength *)v93;

            v152 = 0;
            v153 = 0;
            __p = 0;
            sub_1DCAD5128(v11->_URL, (uint64_t)&v172, v11, &__p);
            v95 = HIBYTE(v153);
            v96 = HIBYTE(v153);
            if (v153 < 0)
              v95 = v152;
            if (v95)
            {
              v97 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v153 >= 0)
                v99 = objc_msgSend_initWithUTF8String_(v97, v98, (uint64_t)&__p);
              else
                v99 = objc_msgSend_initWithUTF8String_(v97, v98, (uint64_t)__p);
              v100 = (void *)v163[5];
              v163[5] = v99;

              v96 = HIBYTE(v153);
            }
            if (v96 < 0)
              operator delete(__p);
            sub_1DCAD5D48((uint64_t)v139);
            goto LABEL_111;
          }
          if (sub_1DCAF24E8(&v169, "PLY") && !*((_BYTE *)v159 + 24))
          {
            v150 = 0;
            v148 = 0u;
            v149 = 0u;
            v146 = 0u;
            v147 = 0u;
            v144 = 0u;
            v145 = 0u;
            v142 = 0u;
            v143 = 0u;
            v140 = 0u;
            v141 = 0u;
            memset(v139, 0, sizeof(v139));
            sub_1DCB81648(v139, 0);
            v152 = 0;
            v153 = 0;
            __p = 0;
            sub_1DCB84D28((uint64_t *)v139, v11->_URL, v11, &__p);
            v122 = HIBYTE(v153);
            v123 = HIBYTE(v153);
            if (v153 < 0)
              v122 = v152;
            if (v122)
            {
              v124 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v153 >= 0)
                v126 = objc_msgSend_initWithUTF8String_(v124, v125, (uint64_t)&__p);
              else
                v126 = objc_msgSend_initWithUTF8String_(v124, v125, (uint64_t)__p);
              v127 = (void *)v163[5];
              v163[5] = v126;

              v123 = HIBYTE(v153);
            }
            if (v123 < 0)
              operator delete(__p);
            sub_1DCB81700(v139);
          }
          else if (sub_1DCAF24E8(&v169, "STL") && !*((_BYTE *)v159 + 24))
          {
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_str = &__str;
            else
              p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
            v129 = objc_retainAutorelease(v137);
            v132 = objc_msgSend_bytes(v129, v130, v131);
            v135 = objc_msgSend_length(v129, v133, v134);
            sub_1DCB28DF4((uint64_t)p_str, v132, v135, v11);
          }
          else if (sub_1DCAF24E8(&v169, "IES"))
          {
            v112 = [MDLPhotometricLight alloc];
            v114 = (void *)objc_msgSend_initWithIESProfile_(v112, v113, v136);
            objc_msgSend_generateCubemapFromLight_(v114, v115, 128);
            objc_msgSend_generateSphericalHarmonicsFromLight_(v114, v116, 3);
            objc_msgSend_addObject_(v11, v117, (uint64_t)v114);

          }
          else
          {
            v118 = objc_alloc(MEMORY[0x1E0CB3940]);
            v120 = objc_msgSend_initWithFormat_(v118, v119, (uint64_t)CFSTR("Could not load asset with unknown extension from %@"), *p_URL);
            v121 = (void *)v163[5];
            v163[5] = v120;

          }
LABEL_111:
          _Block_object_dispose(&v158, 8);
          objc_autoreleasePoolPop(v48);
          v101 = (void *)v163[5];
          if (v101)
          {
            sub_1DCB1FF60(v101);
            v57 = (id)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@"), v163[5]);
LABEL_113:
            if (v57)
              goto LABEL_117;
            goto LABEL_114;
          }
          goto LABEL_114;
        }
        v49 = HIBYTE(v170);
LABEL_74:
        if (v49 == 3)
        {
          if ((unsigned __int16)v169 != 16975 || BYTE2(v169) != 74)
          {
            v84 = (unsigned __int16 *)&v169;
            goto LABEL_88;
          }
          goto LABEL_130;
        }
        goto LABEL_92;
      }
      v52 = (unsigned __int16 *)v169;
      v64 = *(_WORD *)v169 == 16975 && *(_BYTE *)(v169 + 2) == 74;
      if (v64 || (*(_WORD *)v169 == 19536 ? (v65 = *(_BYTE *)(v169 + 2) == 89) : (v65 = 0), v65))
      {
LABEL_70:
        if ((byte_1F03B50D8 & 1) == 0)
        {
          v69 = objc_alloc(MEMORY[0x1E0CB3B38]);
          v71 = (void *)objc_msgSend_initWithServiceName_(v69, v70, (uint64_t)CFSTR("com.apple.ModelIO.AssetLoader"));
          objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v72, (uint64_t)&unk_1F03BFF78);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRemoteObjectInterface_(v71, v74, (uint64_t)v73);

          v157[0] = MEMORY[0x1E0C809B0];
          v157[1] = 3221225472;
          v157[2] = sub_1DCB20658;
          v157[3] = &unk_1EA5771B0;
          v157[4] = &v158;
          objc_msgSend_setInterruptionHandler_(v71, v75, (uint64_t)v157);
          v156[0] = MEMORY[0x1E0C809B0];
          v156[1] = 3221225472;
          v156[2] = sub_1DCB20690;
          v156[3] = &unk_1EA5771B0;
          v156[4] = &v158;
          objc_msgSend_setInvalidationHandler_(v71, v76, (uint64_t)v156);
          objc_msgSend_resume(v71, v77, v78);
          v155[0] = MEMORY[0x1E0C809B0];
          v155[1] = 3221225472;
          v155[2] = sub_1DCB206C8;
          v155[3] = &unk_1EA5771D8;
          v155[4] = &v162;
          v155[5] = &v158;
          objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v71, v79, (uint64_t)v155);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = *p_URL;
          v154[0] = MEMORY[0x1E0C809B0];
          v154[1] = 3221225472;
          v154[2] = sub_1DCB20748;
          v154[3] = &unk_1EA577200;
          v154[4] = &v162;
          v154[5] = &v158;
          objc_msgSend_loadURL_extensionToken_withReply_(v80, v82, (uint64_t)v81, v46, v154);

          if (*((_BYTE *)v159 + 24))
            goto LABEL_111;
        }
        goto LABEL_72;
      }
    }
    else
    {
      if (HIBYTE(v170) != 3)
        goto LABEL_74;
      if ((unsigned __int16)v169 == 16975 && BYTE2(v169) == 74)
        goto LABEL_70;
      if ((unsigned __int16)v169 == 19536 && BYTE2(v169) == 89)
        goto LABEL_70;
      v52 = (unsigned __int16 *)&v169;
    }
    v66 = *v52;
    v67 = *((unsigned __int8 *)v52 + 2);
    if (v66 != 21587 || v67 != 76)
      goto LABEL_72;
    goto LABEL_70;
  }
LABEL_114:
  v102 = *((_QWORD *)&v172 + 1);
  if (!*((_QWORD *)&v172 + 1))
  {
    objc_storeStrong((id *)&v172 + 1, v11->_vertexDescriptor);
    v102 = *((_QWORD *)&v172 + 1);
  }
  v138 = 0;
  objc_msgSend__conformVertexBuffers_error_(v11, v47, v102, &v138);
  v57 = v138;
  objc_storeStrong((id *)&v11->_vertexDescriptor, *((id *)&v172 + 1));
LABEL_117:
  if (a5)
    *a5 = objc_retainAutorelease(v57);

  _Block_object_dispose(&v162, 8);
  if (SHIBYTE(v170) < 0)
    operator delete((void *)v169);
  v9 = (id)v136;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__str.__r_.__value_.__l.__data_);
    if (!v57)
    {
LABEL_125:
      objc_msgSend_resolveTextures(v11, v17, v18);
      v57 = 0;
    }
  }
  else if (!v57)
  {
    goto LABEL_125;
  }
  v103 = v11;

  if (SHIBYTE(v175) < 0)
    operator delete(*((void **)&v174 + 1));

LABEL_129:
  return v11;
}

- (NSTimeInterval)frameInterval
{
  return self->_frameInterval;
}

- (id)resolver
{
  return self->_resolver;
}

- (id)bufferAllocator
{
  return self->_bufferAllocator;
}

- (MDLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (void)set_timeCodesPerSecond:(double)a3
{
  self->__timeCodesPerSecond = a3;
}

- (void)setUpAxis:(vector_float3)upAxis
{
  __int128 v3;

  *(_OWORD *)self->_upAxis = v3;
}

- (void)setStartTime:(NSTimeInterval)startTime
{
  self->_startTime = startTime;
}

- (void)setResolver:(id)resolver
{
  objc_storeStrong((id *)&self->_resolver, resolver);
}

- (void)setMetersPerUnit:(float)a3
{
  self->_metersPerUnit = a3;
}

- (void)setFrameInterval:(NSTimeInterval)frameInterval
{
  self->_frameInterval = frameInterval;
}

- (void)setEndTime:(NSTimeInterval)endTime
{
  self->_endTime = endTime;
}

- (void)resolveTextures
{
  uint64_t v3;
  const char *v4;
  _QWORD v5[5];
  char v6;

  v6 = 0;
  v3 = objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1DCAD0670;
  v5[3] = &unk_1EA577160;
  v5[4] = self;
  objc_msgSend_enumerateChildObjectsOfClass_usingBlock_stopPointer_(self, v4, v3, v5, &v6);
}

- (MDLObject)objectAtIndex:(NSUInteger)index
{
  const char *v5;
  void *v6;

  if (objc_msgSend_count(self->_objects, a2, index) <= index)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_objects, v5, index);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MDLObject *)v6;
}

- (void)addObject:(MDLObject *)object
{
  objc_msgSend_addObject_(self->_objects, a2, (uint64_t)object);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setOriginals:(id)originals
{
  MEMORY[0x1E0DE7D20](self, sel_setMasters_, originals);
}

- (void)_bounds
{
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  float32x4_t v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  a2[1].i64[0] = 0;
  a2[1].i64[1] = 0;
  __asm { FMOV            V0.4S, #-1.0 }
  *a2 = _Q0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = *(id *)(a1 + 16);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    v14 = (__int128 *)MEMORY[0x1E0C83FF0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_transform(v16, v10, v11, v27, v28, v29, v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v17;
        if (v17)
        {
          objc_msgSend_matrix(v17, v18, v19);
          v27 = v21;
          v28 = v22;
          v29 = v23;
          v30 = v24;
        }
        else
        {
          v25 = v14[1];
          v27 = *v14;
          v28 = v25;
          v26 = v14[3];
          v29 = v14[2];
          v30 = v26;
        }
        sub_1DCB1F0A0(v16, (uint64_t)&v27, v31);
        sub_1DCB22B5C(a2, v31);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }

}

- (void)setComponent:(id)a3 forProtocol:(id)a4
{
  const char *v6;
  id v7;
  NSMapTable *components;
  NSMapTable *v9;
  NSMapTable *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  components = self->_components;
  if (!components)
  {
    v9 = (NSMapTable *)objc_opt_new();
    v10 = self->_components;
    self->_components = v9;

    components = self->_components;
  }
  objc_msgSend_setObject_forKey_(components, v6, (uint64_t)v11, v7);

}

- (id)componentConformingToProtocol:(id)a3
{
  objc_msgSend_objectForKey_(self->_components, a2, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKeyedSubscript:(id)a3
{
  objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)components
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectEnumerator(self->_components, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)childObjectsOfClass:(Class)objectClass
{
  uint64_t v6;
  const char *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  MDLAsset *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = objc_opt_class();
  if ((objc_msgSend_isSubclassOfClass_(objectClass, v7, v6) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Requested class must be an MDLObject or a subclass of MDLObject"), v10, v11);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        sub_1DCB1F610((uint64_t)objectClass, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18++), v13);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v19, (uint64_t)&v21, v25, 16);
    }
    while (v16);
  }

  return (NSArray *)v13;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7 = (void *)objc_msgSend_initWithString_(v3, v4, (uint64_t)CFSTR("MDLAsset:\n"));
  for (i = 0; i < objc_msgSend_count(self, v5, v6); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self, v9, i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recursiveDescription(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v7, v14, (uint64_t)v13);

  }
  return v7;
}

- (MDLAxisAlignedBoundingBox)boundingBox
{
  uint64_t v3;

  return (MDLAxisAlignedBoundingBox *)objc_msgSend__bounds(self, a3, v3);
}

- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3
{
  uint64_t v4;

  return (MDLAxisAlignedBoundingBox *)objc_msgSend__bounds(self, a3, v4, time);
}

- (NSTimeInterval)startTime
{
  uint64_t v3;
  const char *v4;
  void *v5;
  double startTime;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  objc_msgSend_childObjectsOfClass_(self, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_transform(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v13), v9, v10, (_QWORD)v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v14;
        if (v14)
        {
          objc_msgSend_minimumTime(v14, v15, v16);
          v19 = v18;
          objc_msgSend_maximumTime(v17, v20, v21);
          if (v19 != v24)
          {
            objc_msgSend_minimumTime(v17, v22, v23);
            if (v27 < startTime)
            {
              objc_msgSend_minimumTime(v17, v25, v26);
              startTime = v28;
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v30, v34, 16);
    }
    while (v11);
  }

  if (startTime == 1.79769313e308)
    startTime = 0.0;

  return startTime;
}

- (NSTimeInterval)endTime
{
  uint64_t v3;
  const char *v4;
  void *v5;
  double endTime;
  double v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  objc_msgSend_childObjectsOfClass_(self, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  v31 = 0u;
  v32 = 0u;
  if (endTime == 1.79769313e308)
    v7 = 0.0;
  else
    v7 = endTime;
  v33 = 0uLL;
  v34 = 0uLL;
  v8 = v5;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_transform(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v10, v11, (_QWORD)v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v15;
        if (v15)
        {
          objc_msgSend_minimumTime(v15, v16, v17);
          v20 = v19;
          objc_msgSend_maximumTime(v18, v21, v22);
          if (v20 != v25)
          {
            objc_msgSend_maximumTime(v18, v23, v24);
            if (v28 > v7)
            {
              objc_msgSend_maximumTime(v18, v26, v27);
              v7 = v29;
            }
          }
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_opt_class();
  v6 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

+ (BOOL)canExportFileExtension:(NSString *)extension
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  char isEqualToString;

  objc_msgSend_lowercaseString(extension, a2, (uint64_t)extension);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("obj")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("stl")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("abc")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("ply")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("usd")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("usda")) & 1) != 0)
  {
    isEqualToString = 1;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("usdc"));
  }

  return isEqualToString;
}

+ (BOOL)canImportFileExtension:(NSString *)extension
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char isEqualToString;

  objc_msgSend_lowercaseString(extension, a2, (uint64_t)extension);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("abc")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("usd")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("usda")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("usdc")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("usdz")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("obj")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("ply")) & 1) != 0)
  {
    isEqualToString = 1;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("stl"));
  }

  return isEqualToString;
}

- (MDLAsset)init
{
  MDLAsset *v2;
  MDLMeshBufferDataAllocator *v3;
  MDLMeshBufferAllocator *bufferAllocator;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  MDLAsset *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MDLAsset;
  v2 = -[MDLAsset init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MDLMeshBufferDataAllocator);
    bufferAllocator = v2->_bufferAllocator;
    v2->_bufferAllocator = (MDLMeshBufferAllocator *)v3;

    objc_msgSend__commonInit(v2, v5, v6);
    sub_1DCBFA038(0, v7, v8);
    v9 = v2;
  }

  return v2;
}

- (MDLAsset)initWithBufferAllocator:(id)bufferAllocator
{
  id v4;
  MDLAsset *v5;
  MDLMeshBufferDataAllocator *v6;
  MDLMeshBufferAllocator *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  MDLAsset *v12;
  objc_super v14;

  v4 = bufferAllocator;
  v14.receiver = self;
  v14.super_class = (Class)MDLAsset;
  v5 = -[MDLAsset init](&v14, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (MDLMeshBufferDataAllocator *)v4;
    else
      v6 = objc_alloc_init(MDLMeshBufferDataAllocator);
    v7 = v5->_bufferAllocator;
    v5->_bufferAllocator = (MDLMeshBufferAllocator *)v6;

    objc_msgSend__commonInit(v5, v8, v9);
    sub_1DCBFA038(v4 != 0, v10, v11);
    v12 = v5;
  }

  return v5;
}

- (MDLAsset)initWithData:(id)a3 name:(id)a4 vertexDescriptor:(id)a5 bufferAllocator:(id)a6 preserveTopology:(BOOL)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  MDLAsset *v19;
  MDLMeshBufferAllocator *v20;
  MDLMeshBufferAllocator *bufferAllocator;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  MDLVertexDescriptor *v33;
  MDLVertexDescriptor *vertexDescriptor;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSUnitLength *unitLength;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  void *v48;
  void *v49;
  void *v50;
  MDLAsset *v51;
  id v53;
  const char *v54;
  uint64_t v55;
  id v56;
  id v57;
  void *__p;
  uint64_t v59;
  uint64_t v60;
  _OWORD v61[3];
  uint64_t v62;
  id obj[2];
  __int128 v64;
  void *v65[2];
  __int128 v66;
  __int128 v67;
  objc_super v68;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v68.receiver = self;
  v68.super_class = (Class)MDLAsset;
  v19 = -[MDLAsset init](&v68, sel_init);
  if (!v19)
    goto LABEL_33;
  v56 = v15;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  *(_OWORD *)v65 = 0u;
  HIDWORD(v64) = 1070141403;
  LOBYTE(v65[0]) = 1;
  WORD1(v65[0]) = 256;
  HIDWORD(v65[0]) = 1078530011;
  *(_OWORD *)obj = 0u;
  sub_1DCB0345C(&v65[1], "");
  v67 = 0uLL;
  if (v18)
    objc_storeStrong((id *)&v64, a6);
  if (v17)
    objc_storeStrong(&obj[1], a5);
  LOBYTE(obj[0]) = a7;
  if ((_QWORD)v64)
    v20 = (MDLMeshBufferAllocator *)(id)v64;
  else
    v20 = (MDLMeshBufferAllocator *)objc_opt_new();
  bufferAllocator = v19->_bufferAllocator;
  v19->_bufferAllocator = v20;

  *(_OWORD *)v19->_upAxis = xmmword_1DCC583A0;
  v19->_metersPerUnit = 0.01;
  objc_msgSend__commonInit(v19, v22, v23);
  objc_msgSend_pathExtension(v16, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_isEqualToString_(v29, v30, (uint64_t)CFSTR("usdz")))
  {
    if (a8)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v35, v39, (uint64_t)CFSTR("[%@ %@]: only accepts usdz file"), v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      sub_1DCB1FF60(v40);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v41 = 0;
    v15 = v56;
    goto LABEL_30;
  }
  v62 = 0;
  memset(v61, 0, sizeof(v61));
  sub_1DCAD5E20(v61, 0);
  if (obj[1])
  {
    if (sub_1DCB20040(obj[1], v31, v32))
    {
      v33 = (MDLVertexDescriptor *)obj[1];
      vertexDescriptor = v19->_vertexDescriptor;
      v19->_vertexDescriptor = v33;
    }
    else
    {
      NSLog(CFSTR("Warning: No valid layouts found for vertex descriptor, using default vertex descriptor instead."));
      vertexDescriptor = v19->_vertexDescriptor;
      v19->_vertexDescriptor = 0;
    }

  }
  objc_msgSend_centimeters(MEMORY[0x1E0CB3AD8], v31, v32);
  v42 = objc_claimAutoreleasedReturnValue();
  unitLength = v19->_unitLength;
  v19->_unitLength = (NSUnitLength *)v42;

  __p = 0;
  v59 = 0;
  v60 = 0;
  sub_1DCBC2D00(v16, v15, (uint64_t)obj, v19, &__p);
  v45 = HIBYTE(v60);
  if (v60 < 0)
    v45 = v59;
  if (!v45)
  {
    v50 = 0;
    goto LABEL_35;
  }
  v46 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v60 >= 0)
    v48 = (void *)objc_msgSend_initWithUTF8String_(v46, v47, (uint64_t)&__p);
  else
    v48 = (void *)objc_msgSend_initWithUTF8String_(v46, v47, (uint64_t)__p);
  v49 = v48;
  sub_1DCB1FF60(v48);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (!v41)
  {
LABEL_35:
    v53 = obj[1];
    if (!obj[1])
    {
      objc_storeStrong(&obj[1], v19->_vertexDescriptor);
      v53 = obj[1];
    }
    v57 = 0;
    objc_msgSend__conformVertexBuffers_error_(v19, v44, (uint64_t)v53, &v57);
    v41 = v57;
    objc_storeStrong((id *)&v19->_vertexDescriptor, obj[1]);
    if (!v41)
    {
      objc_msgSend_resolveTextures(v19, v54, v55);
      v41 = 0;
    }
    v49 = v50;
    if (!a8)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (a8)
LABEL_26:
    *a8 = objc_retainAutorelease(v41);
LABEL_27:

  if (SHIBYTE(v60) < 0)
    operator delete(__p);
  sub_1DCAD5D48((uint64_t)v61);
LABEL_30:
  v51 = v19;

  if (SHIBYTE(v66) < 0)
    operator delete(v65[1]);

LABEL_33:
  return v19;
}

- (MDLAsset)initWithURL:(NSURL *)URL
{
  return (MDLAsset *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, a2, (uint64_t)URL, 0, 0, 0, 0);
}

- (MDLAsset)initWithURL:(NSURL *)URL vertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor bufferAllocator:(id)bufferAllocator
{
  return (MDLAsset *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, a2, (uint64_t)URL, vertexDescriptor, bufferAllocator, 0, 0);
}

- (id)initThroughSCNKitBridgeWithURL:(id)a3 preserveTopology:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *inited;
  const __CFString *v17;
  _QWORD v18[2];

  v6 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v17 = CFSTR("kMDLAssetPreserveTopology");
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initThroughSCNKitBridgeWithURL_options_error_(self, v14, (uint64_t)v8, v13, v9);

  return inited;
}

- (id)initThroughSCNKitBridgeWithURL:(id)a3 options:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  self->_isSceneKitBridged = 1;
  objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("kMDLAssetPreserveTopology"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_BOOLValue(v12, v13, v14);

  if (v15)
  {
    v24 = v10;
    v17 = &v24;
    v18 = objc_msgSend_initWithURL_bufferAllocator_preserveIndexing_options_error_(self, v16, (uint64_t)v8, 0, 1, v9, &v24);
  }
  else
  {
    v23 = v10;
    v17 = &v23;
    v18 = objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, v16, (uint64_t)v8, 0, 0, 0, &v23);
  }
  v19 = (void *)v18;
  v20 = *v17;

  v21 = v19;
  return v21;
}

- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 error:(id *)a6
{
  return (MDLAsset *)objc_msgSend_initWithURL_bufferAllocator_preserveIndexing_options_error_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (MDLAsset)initWithURL:(id)a3 bufferAllocator:(id)a4 preserveIndexing:(BOOL)a5 options:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  size_t v18;
  const char *v19;
  size_t v20;
  std::string *v21;
  void *v22;
  void *v23;
  MDLAsset *v24;
  void *v25;
  MDLAsset *v27;
  MDLMeshBufferDataAllocator *v28;
  MDLMeshBufferAllocator *bufferAllocator;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  std::string *v36;
  int data_low;
  int v38;
  unint64_t v40;
  id v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  __int128 *v47;
  unint64_t v48;
  id v49;
  const char *v50;
  void *v51;
  void *v52;
  id v54;
  id v55;
  __int128 v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  void *__p[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  objc_super v69;
  std::string v70;

  v8 = a5;
  v12 = a3;
  v55 = a4;
  v54 = a6;
  memset(&v70, 0, sizeof(v70));
  sub_1DCB207DC(v12, v13, v14, &v70);
  v15 = 0;
  v16 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
  v17 = *(_OWORD *)&v70.__r_.__value_.__l.__data_;
  while (1)
  {
    v18 = strlen(off_1EA577220[v15]);
    v20 = v18;
    if ((v16 & 0x80) != 0)
      break;
    if (v18 == v16)
    {
      v21 = &v70;
      goto LABEL_7;
    }
LABEL_8:
    if (++v15 == 4)
    {
      v23 = v54;
      v22 = v55;
      v24 = (MDLAsset *)(id)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_preserveTopology_error_(self, v19, (uint64_t)v12, 0, v55, v8, a7);
LABEL_10:
      v25 = 0;
      goto LABEL_11;
    }
  }
  if (v18 != *((_QWORD *)&v17 + 1))
    goto LABEL_8;
  v21 = (std::string *)v17;
  if (*((_QWORD *)&v17 + 1) == -1)
    sub_1DCB0350C();
LABEL_7:
  if (memcmp(v21, off_1EA577220[v15], v20))
    goto LABEL_8;
  v69.receiver = self;
  v69.super_class = (Class)MDLAsset;
  v23 = v54;
  v22 = v55;
  v27 = -[MDLAsset init](&v69, sel_init);
  v24 = v27;
  if (!v27)
    goto LABEL_10;
  objc_storeStrong((id *)&v27->_URL, a3);
  if (v55)
    v28 = (MDLMeshBufferDataAllocator *)v55;
  else
    v28 = objc_alloc_init(MDLMeshBufferDataAllocator);
  bufferAllocator = v24->_bufferAllocator;
  v24->_bufferAllocator = (MDLMeshBufferAllocator *)v28;

  *(_OWORD *)v24->_upAxis = xmmword_1DCC583A0;
  v24->_metersPerUnit = 0.01;
  objc_msgSend__commonInit(v24, v30, v31);
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v32, (uint64_t)&v70);
  else
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v32, (uint64_t)v70.__r_.__value_.__l.__data_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1DCAC71AC(v33, v55 == 0, 0, v24->_isSceneKitBridged);

  v67 = 0uLL;
  v68 = 0;
  v63 = 0u;
  *(_OWORD *)__p = 0u;
  v65 = 0u;
  v66 = 0u;
  v62 = 0u;
  HIDWORD(v63) = 1070141403;
  WORD1(__p[0]) = 256;
  HIDWORD(__p[0]) = 1078530011;
  LOBYTE(__p[0]) = 1;
  sub_1DCB0345C(&__p[1], "");
  v66 = 0uLL;
  LOBYTE(v62) = 1;
  BYTE1(v62) = v8;
  objc_msgSend_objectForKeyedSubscript_(v54, v34, (uint64_t)CFSTR("kMDLAssetDefaultUSDColorSpace"));
  *((_QWORD *)&v66 + 1) = objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1DF0D25C8]();
  if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) == 3)
    {
      v36 = &v70;
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if (v70.__r_.__value_.__l.__size_ != 3)
    goto LABEL_30;
  v36 = (std::string *)v70.__r_.__value_.__r.__words[0];
LABEL_26:
  data_low = LOWORD(v36->__r_.__value_.__l.__data_);
  v38 = v36->__r_.__value_.__s.__data_[2];
  if (data_low == 16975 && v38 == 74)
  {
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    v58 = 0u;
    sub_1DCAF8EE4((uint64_t)&v58, 0);
    sub_1DCAF8FA8((uint64_t)&v58, v24->_URL, (unsigned __int8 *)&v62, v24, &v56);
    if (SHIBYTE(v68) < 0)
      operator delete((void *)v67);
    v68 = v57;
    v67 = v56;
    v48 = HIBYTE(v57);
    if ((v57 & 0x8000000000000000) != 0)
      v48 = *((_QWORD *)&v67 + 1);
    if (v48)
    {
      v49 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v68 >= 0)
        v51 = (void *)objc_msgSend_initWithUTF8String_(v49, v50, (uint64_t)&v67);
      else
        v51 = (void *)objc_msgSend_initWithUTF8String_(v49, v50, v67);
      v52 = v51;
      sub_1DCB1FF60(v51);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
    sub_1DCAF8F08((uint64_t)&v58);
  }
  else
  {
LABEL_30:
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    v58 = 0u;
    sub_1DCAD5E20(&v58, 0);
    sub_1DCAD5128(v24->_URL, (uint64_t)&v62, v24, &v56);
    if (SHIBYTE(v68) < 0)
      operator delete((void *)v67);
    v68 = v57;
    v67 = v56;
    v40 = HIBYTE(v57);
    if ((v57 & 0x8000000000000000) != 0)
      v40 = *((_QWORD *)&v67 + 1);
    if (v40)
    {
      v41 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v68 >= 0)
        v43 = (void *)objc_msgSend_initWithUTF8String_(v41, v42, (uint64_t)&v67);
      else
        v43 = (void *)objc_msgSend_initWithUTF8String_(v41, v42, v67);
      v44 = v43;
      sub_1DCB1FF60(v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
    sub_1DCAD5D48((uint64_t)&v58);
  }
  objc_autoreleasePoolPop(v35);
  if (v25)
    *a7 = objc_retainAutorelease(v25);
  if (SHIBYTE(v68) < 0)
  {
    if (!*((_QWORD *)&v67 + 1))
      goto LABEL_49;
    v47 = (__int128 *)v67;
LABEL_48:
    NSLog(CFSTR("%s"), v47);
  }
  else
  {
    if (HIBYTE(v68))
    {
      v47 = &v67;
      goto LABEL_48;
    }
LABEL_49:
    objc_msgSend_resolveTextures(v24, v45, v46);
  }
  v24 = v24;
  if (SHIBYTE(v65) < 0)
    operator delete(__p[1]);

  if (SHIBYTE(v68) < 0)
    operator delete((void *)v67);
LABEL_11:
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);

  return v24;
}

- (NSUInteger)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_objects, a2, v2);
}

- (BOOL)exportAssetToURL:(NSURL *)URL error:(NSError *)error
{
  NSURL *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void **v24;
  BOOL v25;
  uint64_t v26;
  const char *v28;
  char *v29;
  const char *v30;
  void **v31;
  const char *v32;
  char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  void **v37;
  void **v38;
  const char *v39;
  const char *v40;
  void **v41;
  void **v42;
  uint64_t v43;
  uint64_t v44;
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
  __int128 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char v60;
  void *v61[2];
  uint64_t v62;

  v6 = URL;
  v61[0] = 0;
  v61[1] = 0;
  v62 = 0;
  objc_msgSend_path(v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (char *)objc_msgSend_cStringUsingEncoding_(v9, v10, 4);
  sub_1DCB0345C(v61, v11);

  objc_msgSend_pathExtension(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1DCBF9EE8(v17);
  v18 = &stru_1EA577998;
  if ((objc_msgSend_isEqualToString_(v17, v19, (uint64_t)CFSTR("usd")) & 1) == 0
    && (objc_msgSend_isEqualToString_(v17, v20, (uint64_t)CFSTR("usda")) & 1) == 0
    && !objc_msgSend_isEqualToString_(v17, v21, (uint64_t)CFSTR("usdc")))
  {
    if (objc_msgSend_isEqualToString_(v17, v22, (uint64_t)CFSTR("abc")))
    {
      if (v62 >= 0)
        v29 = (char *)v61;
      else
        v29 = (char *)v61[0];
      if (!sub_1DCBA8D08(v29, self))
      {
        v31 = v61;
        if (v62 < 0)
          v31 = (void **)v61[0];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("Could not save file to %s"), v31);
LABEL_50:
        v25 = 0;
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      goto LABEL_31;
    }
    if (objc_msgSend_isEqualToString_(v17, v28, (uint64_t)CFSTR("stl")))
    {
      if (v62 >= 0)
        v33 = (char *)v61;
      else
        v33 = (char *)v61[0];
      if (!sub_1DCB2A734(v33, self))
      {
        v38 = v61;
        if (v62 < 0)
          v38 = (void **)v61[0];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v34, (uint64_t)CFSTR("Could not save STL file to %s"), v38);
        goto LABEL_50;
      }
LABEL_31:
      v25 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend_isEqualToString_(v17, v32, (uint64_t)CFSTR("obj")))
    {
      *(_QWORD *)&v48 = 0;
      v46 = 0u;
      v47 = 0u;
      v45 = 0u;
      sub_1DCAF8EE4((uint64_t)&v45, 0);
      sub_1DCAFB814((uint64_t)&v45, v6, self, &v58);
      if (v60 < 0)
      {
        v43 = v59;
        operator delete(v58);
        if (v43)
          goto LABEL_35;
      }
      else if (v60)
      {
LABEL_35:
        v37 = v61;
        if (v62 < 0)
          v37 = (void **)v61[0];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v36, (uint64_t)CFSTR("Could not save OBJ file to %s"), v37);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        goto LABEL_53;
      }
      v25 = 1;
LABEL_53:
      sub_1DCAF8F08((uint64_t)&v45);
      goto LABEL_12;
    }
    if (!objc_msgSend_isEqualToString_(v17, v35, (uint64_t)CFSTR("ply")))
    {
      v42 = v61;
      if (v62 < 0)
        v42 = (void **)v61[0];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v39, (uint64_t)CFSTR("Unknown extension on URL: %s"), v42);
      goto LABEL_50;
    }
    v57 = 0;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    sub_1DCB81648(&v45, 0);
    sub_1DCB8513C((uint64_t)&v45, v6, self, &v58);
    if (v60 < 0)
    {
      v44 = v59;
      operator delete(v58);
      if (v44)
        goto LABEL_44;
    }
    else if (v60)
    {
LABEL_44:
      v41 = v61;
      if (v62 < 0)
        v41 = (void **)v61[0];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v40, (uint64_t)CFSTR("Could not save PLY file to %s"), v41);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      goto LABEL_56;
    }
    v25 = 1;
LABEL_56:
    sub_1DCB81700(&v45);
    goto LABEL_12;
  }
  *(_QWORD *)&v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  sub_1DCAD5E20(&v45, 0);
  sub_1DCC08CDC(v6, self, &v58);
  if (v60 < 0)
  {
    v26 = v59;
    operator delete(v58);
    if (v26)
      goto LABEL_6;
  }
  else if (v60)
  {
LABEL_6:
    v24 = v61;
    if (v62 < 0)
      v24 = (void **)v61[0];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("Could not save file to %s"), v24);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    goto LABEL_11;
  }
  v25 = 1;
LABEL_11:
  sub_1DCAD5D48((uint64_t)&v45);
LABEL_12:
  if (error && !v25)
  {
    sub_1DCB1FF60(v18);
    v25 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  if (SHIBYTE(v62) < 0)
    operator delete(v61[0]);

  return v25;
}

- (BOOL)exportAssetToURL:(NSURL *)URL
{
  return MEMORY[0x1E0DE7D20](self, sel_exportAssetToURL_error_, URL);
}

- (MDLObject)objectAtPath:(NSString *)path
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  NSString *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  int isEqualToString;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = path;
  v7 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v8, (uint64_t)CFSTR("/"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v7, v9, (uint64_t)v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v40, v10, (uint64_t)CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    if (v11 && objc_msgSend_count(v11, v12, v13))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v15 = self->_objects;
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v41, v45, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v42;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v20);
            objc_msgSend_objectAtIndexedSubscript_(v14, v17, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v21, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

            if (isEqualToString)
            {
              if ((unint64_t)objc_msgSend_count(v14, v17, v28) < 2)
              {
                v29 = v21;
              }
              else
              {
                objc_msgSend_objectAtIndexedSubscript_(v14, v30, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend_length(v31, v32, v33);
                objc_msgSend_substringFromIndex_(v40, v35, v34 + 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtPath_(v21, v37, (uint64_t)v36);
                v29 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_19;
            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v41, v45, 16);
          if (v18)
            continue;
          break;
        }
      }
      v29 = 0;
LABEL_19:

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return (MDLObject *)v29;
}

- (void)removeObject:(MDLObject *)object
{
  objc_msgSend_removeObject_(self->_objects, a2, (uint64_t)object);
}

- (id)objects
{
  return self->_objects;
}

- (MDLObject)objectAtIndexedSubscript:(NSUInteger)index
{
  const char *v5;
  void *v6;

  if (objc_msgSend_count(self->_objects, a2, index) <= index)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_objects, v5, index);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MDLObject *)v6;
}

- (void)setMasters:(id)masters
{
  objc_storeStrong((id *)&self->_masters, masters);
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)animations
{
  objc_storeStrong((id *)&self->_animations, animations);
}

- (NSURL)_temporaryFolderURL
{
  return self->_temporaryFolderURL;
}

- (void)set_temporaryFolderURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryFolderURL, a3);
}

- (vector_float3)upAxis
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (double)_timeCodesPerSecond
{
  return self->__timeCodesPerSecond;
}

- (NSUnitLength)unitLength
{
  return self->_unitLength;
}

- (void)setUnitLength:(id)a3
{
  objc_storeStrong((id *)&self->_unitLength, a3);
}

- (float)metersPerUnit
{
  return self->_metersPerUnit;
}

- (MDLAnimatedVector3Array)extents
{
  return self->_extents;
}

- (void)setExtents:(id)a3
{
  objc_storeStrong((id *)&self->_extents, a3);
}

+ (NSArray)placeLightProbesWithDensity:(float)value heuristic:(MDLProbePlacement)type usingIrradianceDataSource:(id)dataSource
{
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  __int128 v23;
  __int16 v24;
  float v25;
  __int128 v26;
  __int128 v27;
  float v28;
  MDLTransform *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  MDLLightProbe *v35;
  const char *v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  id v41;
  __int128 v42;
  unsigned int v43;
  int8x16_t v44;
  float v45;
  float32x2_t v46;
  float v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  float32x4_t v64;
  float32x4_t v65;
  int32x4_t v66;
  const char *v67;
  uint64_t v68;
  float32x4_t v69;
  int16x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  float32x4_t v78;
  int32x4_t v79;
  MDLTransform *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  __int128 v88;
  float32x4_t v90;
  float32x4_t v91;
  __int128 v92;
  float32x4_t v93;
  float v94;
  float v95;
  __int128 v96;
  __int128 v97;
  float v98;
  __int128 v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  float32x4_t v110;
  uint64_t v111;
  int v112;
  float v113;
  float32x4_t v114;
  int32x4_t v115;
  float v116;
  void *v117;
  id v118;
  const char *v119;
  uint64_t v120;
  float32x4_t v121;
  float32x4_t v122;
  int32x4_t v123;
  uint64_t j;
  id v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  double v129;
  _MDLProbeCluster *v130;
  const char *v131;
  uint64_t v132;
  id v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t k;
  void *v145;
  float32x4_t v146;
  id v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  float v153;
  uint64_t v154;
  uint64_t m;
  void *v156;
  float32x4_t v157;
  float32x4_t v158;
  int32x4_t v159;
  const char *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  const char *v166;
  unsigned int v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  char v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  float32x4_t v180;
  const char *v181;
  uint64_t v182;
  __int128 v183;
  id v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  char v188;
  float32x4_t v189;
  int32x4_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t kk;
  void *v194;
  uint64_t v195;
  float32x4_t v196;
  float32x4_t v197;
  int32x4_t v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  const char *v203;
  const char *v204;
  const char *v205;
  id v206;
  const char *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t n;
  uint64_t v213;
  void *v214;
  const char *v215;
  id v217;
  const char *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t ii;
  void *v224;
  MDLTransform *v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  MDLLightProbe *v233;
  const char *v234;
  const char *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t jj;
  unsigned int v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  id v245;
  id v246;
  id v247;
  uint64_t v248;
  id v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  id v253[2];
  id v254;
  __int128 v255;
  uint64_t v256;
  float32x4_t v257;
  void *v258;
  id obj;
  id v260;
  id v261;
  float32x4_t v262;
  uint64_t v263;
  float32x4_t v264;
  float32x4_t v265;
  double v266;
  float32x4_t v267;
  float v268;
  id v269[2];
  id v270[2];
  id v271[2];
  float32x4_t v272;
  id v273;
  float v274;
  id v275[2];
  float v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _OWORD v321[4];
  _OWORD v322[8];
  _BYTE v323[128];
  uint64_t v324;

  v324 = *MEMORY[0x1E0C80C00];
  v8 = dataSource;
  if (value <= 0.0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v9, v13, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: density must be greater than 0"), v11, v12);

  }
  if (type == MDLProbePlacementIrradianceDistribution && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: must implement sphericalHarmonicsCoefficientsAtPosition: selector if using heuristic type MDLProbePlacementIrradianceDistribution"), v16, v17);

  }
  v261 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_boundingBox(v8, v19, v20);
  v257 = v22;
  v265 = v21;
  if ((vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v22, v21))).u8[0] & 1) == 0)
  {
    *((_QWORD *)&v23 + 1) = 0;
    LODWORD(v23) = v21.i32[0];
    v24 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v257, v21))).i16[1];
    v25 = 1.0 / value;
    do
    {
      DWORD1(v23) = v265.i32[1];
      if ((v24 & 1) != 0)
      {
        v26 = v23;
      }
      else
      {
        *(_QWORD *)&v27 = v23;
        do
        {
          *((_QWORD *)&v27 + 1) = __PAIR64__(HIDWORD(v23), v265.u32[2]);
          while (1)
          {
            *(_OWORD *)v269 = v27;
            v28 = *((float *)&v27 + 2);
            if (*((float *)&v27 + 2) > v257.f32[2])
              break;
            v29 = [MDLTransform alloc];
            v32 = (void *)objc_msgSend_initWithIdentity(v29, v30, v31);
            objc_msgSend_setTranslation_(v32, v33, v34, *(double *)v269);
            v35 = objc_alloc_init(MDLLightProbe);
            objc_msgSend_setTransform_(v35, v36, (uint64_t)v32);
            objc_msgSend_addObject_(v261, v37, (uint64_t)v35);
            *(id *)&v38 = v269[0];
            *((float *)&v38 + 2) = v28 + v25;
            HIDWORD(v38) = HIDWORD(v269[1]);
            *(_OWORD *)v270 = v38;

            v27 = *(_OWORD *)v270;
          }
          LODWORD(v26) = v27;
          *((float *)&v26 + 1) = *((float *)&v27 + 1) + v25;
          HIDWORD(v23) = HIDWORD(v27);
          DWORD2(v26) = DWORD2(v27);
          *(_QWORD *)&v27 = v26;
        }
        while ((float)(*((float *)v269 + 1) + v25) <= v257.f32[1]);
      }
      *(float *)&v39 = *(float *)&v26 + v25;
      DWORD1(v39) = DWORD1(v26);
      *((_QWORD *)&v39 + 1) = __PAIR64__(HIDWORD(v23), DWORD2(v26));
      v23 = v39;
    }
    while ((float)(*(float *)&v26 + v25) <= v257.f32[0]);
  }
  if (type == MDLProbePlacementIrradianceDistribution)
  {
    v245 = v261;
    v260 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v43 = 0;
    v44 = (int8x16_t)vsubq_f32(v257, v265);
    v45 = fabsf(*(float *)v44.i32);
    *(int8x16_t *)v253 = v44;
    v44.i32[0] = vextq_s8(v44, v44, 8uLL).u32[0];
    v46 = vabs_f32(*(float32x2_t *)v44.i8);
    if (v46.f32[1] >= v46.f32[0])
      *(float *)&v42 = v46.f32[1];
    else
      *(float *)&v42 = v46.f32[0];
    if (v45 >= *(float *)&v42)
      *(float *)&v42 = v45;
    v255 = v42;
    if (v46.f32[0] >= v46.f32[1])
      v46.f32[0] = v46.f32[1];
    if (v46.f32[0] < v45)
      v45 = v46.f32[0];
    v47 = v45 * 0.05;
    do
    {
      v311 = 0u;
      v312 = 0u;
      v309 = 0u;
      v310 = 0u;
      obj = v245;
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v309, v323, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v310;
        v262 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v255, 0);
        do
        {
          v53 = 0;
          do
          {
            if (*(_QWORD *)v310 != v52)
              objc_enumerationMutation(obj);
            v54 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v53);
            objc_msgSend_position(v54, v49, v50);
            objc_msgSend_sphericalHarmonicsCoefficientsAtPosition_(v8, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend_sphericalHarmonicsLevel(v8, v58, v59);
            objc_msgSend_calculateIrradianceGradientUsingSamples_ofSize_fromSH_withLevel_(MDLLightProbe, v61, (uint64_t)&unk_1F03AD5D0, 26, v57, v60);
            v65 = v64;
            v66 = (int32x4_t)vmulq_f32(v64, v64);
            if (vaddq_f32(vaddq_f32((float32x4_t)v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.i8, 1)), (float32x4_t)vdupq_laneq_s32(v66, 2)).f32[0] == 0.0)
            {
              objc_msgSend_addObject_(v260, v62, (uint64_t)v54);
LABEL_39:
              v73 = v57;
              goto LABEL_40;
            }
            *(float32x4_t *)v271 = v65;
            objc_msgSend_position(v54, v62, v63);
            v272 = vmlaq_f32(v69, v262, *(float32x4_t *)v271);
            v70 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v272, v265)));
            if ((v70.i8[0] & 1) != 0)
              goto LABEL_39;
            if ((v70.i8[2] & 1) != 0)
              goto LABEL_39;
            v71 = v272;
            v71.i32[3] = v265.i32[2];
            v72 = v257;
            v72.i32[3] = v272.i32[2];
            if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v72, v71))), 0xFuLL))) & 1) != 0)goto LABEL_39;
            objc_msgSend_sphericalHarmonicsCoefficientsAtPosition_(v8, v67, v68);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = objc_msgSend_sphericalHarmonicsLevel(v8, v74, v75);
            objc_msgSend_calculateIrradianceGradientUsingSamples_ofSize_fromSH_withLevel_(MDLLightProbe, v77, (uint64_t)&unk_1F03AD5D0, 26, v73, v76);
            v79 = (int32x4_t)vmulq_f32(v78, v78);
            if (vaddq_f32(vaddq_f32((float32x4_t)v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.i8, 1)), (float32x4_t)vdupq_laneq_s32(v79, 2)).f32[0] != 0.0)
            {
              v80 = [MDLTransform alloc];
              v83 = (void *)objc_msgSend_initWithIdentity(v80, v81, v82);
              objc_msgSend_setTranslation_(v83, v84, v85, *(double *)v272.i64);
              objc_msgSend_setTransform_(v54, v86, (uint64_t)v83);

            }
LABEL_40:

            ++v53;
          }
          while (v51 != v53);
          v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v309, v323, 16);
          v51 = v87;
        }
        while (v87);
      }

      v88 = v255;
      *(float *)&v88 = *(float *)&v255 * 0.5;
      v255 = v88;
    }
    while (*(float *)&v88 >= v47 || v43++ < 9);
    v90.i64[0] = 0x3F0000003F000000;
    v90.i64[1] = 0x3F0000003F000000;
    v91 = vmulq_f32(vaddq_f32(v257, v265), v90);
    v92 = *(_OWORD *)v253;
    v93 = vmulq_f32(*(float32x4_t *)v253, v90);
    v94 = 0.5 * v93.f32[0];
    v95 = vmuls_lane_f32(0.5, *(float32x2_t *)v93.f32, 1);
    v93.f32[0] = vmuls_lane_f32(0.5, v93, 2);
    *(float *)&v92 = v91.f32[0] - v94;
    v96 = v92;
    *((float *)&v96 + 1) = v91.f32[1] - v95;
    v97 = v96;
    *((float *)&v97 + 2) = v91.f32[2] - v93.f32[0];
    *((float *)&v96 + 2) = v93.f32[0] + v91.f32[2];
    v322[0] = v97;
    v322[1] = v96;
    v98 = v95 + v91.f32[1];
    *((float *)&v92 + 1) = v98;
    v99 = v92;
    *((float *)&v99 + 2) = v91.f32[2] - v93.f32[0];
    *((float *)&v92 + 2) = v93.f32[0] + v91.f32[2];
    v322[2] = v99;
    v322[3] = v92;
    v91.f32[0] = v94 + v91.f32[0];
    v100 = v91;
    v100.i32[1] = DWORD1(v96);
    v101 = v100;
    v101.f32[2] = v91.f32[2] - v93.f32[0];
    v91.f32[1] = v98;
    v102 = v91;
    v102.f32[2] = v91.f32[2] - v93.f32[0];
    v91.f32[2] = v93.f32[0] + v91.f32[2];
    v100.f32[2] = v91.f32[2];
    v322[4] = v101;
    v322[5] = v100;
    v322[6] = v102;
    v322[7] = v91;
    memset(v321, 0, sizeof(v321));
    v305 = 0u;
    v306 = 0u;
    v307 = 0u;
    v308 = 0u;
    v273 = v260;
    v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v103, (uint64_t)&v305, v320, 16);
    if (v106)
    {
      v107 = *(_QWORD *)v306;
      do
      {
        for (i = 0; i != v106; ++i)
        {
          if (*(_QWORD *)v306 != v107)
            objc_enumerationMutation(v273);
          v109 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * i);
          objc_msgSend_position(v109, v104, v105);
          v111 = 0;
          v112 = -1;
          v113 = 3.4028e38;
          do
          {
            v114 = vsubq_f32((float32x4_t)v322[v111], v110);
            v115 = (int32x4_t)vmulq_f32(v114, v114);
            v116 = vaddq_f32(vaddq_f32((float32x4_t)v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.i8, 1)), (float32x4_t)vdupq_laneq_s32(v115, 2)).f32[0];
            if (v116 < v113)
            {
              v113 = v116;
              v112 = v111;
            }
            ++v111;
          }
          while (v111 != 8);
          v117 = (void *)*((_QWORD *)v321 + v112);
          if (v117)
          {
            v118 = v117;
            objc_msgSend_position(v118, v119, v120);
            v122 = vsubq_f32((float32x4_t)v322[v112], v121);
            v123 = (int32x4_t)vmulq_f32(v122, v122);
            if (vaddq_f32(vaddq_f32((float32x4_t)v123, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v123.i8, 1)), (float32x4_t)vdupq_laneq_s32(v123, 2)).f32[0] >= v113)objc_storeStrong((id *)v321 + v112, v109);

          }
          else
          {
            objc_storeStrong((id *)v321 + v112, v109);
          }
        }
        v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v104, (uint64_t)&v305, v320, 16);
      }
      while (v106);
    }

    v251 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (j = 0; j != 64; j += 8)
    {
      v125 = *(id *)((char *)v321 + j);
      v128 = v125;
      if (v125)
      {
        objc_msgSend_position(v125, v126, v127);
        v266 = v129;
        v130 = objc_alloc_init(_MDLProbeCluster);
        objc_msgSend_setCentroid_(v130, v131, v132, v266);
        v133 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend_setProbes_(v130, v134, (uint64_t)v133);

        objc_msgSend_probes(v130, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v137, v138, (uint64_t)v128);

        objc_msgSend_addObject_(v251, v139, (uint64_t)v130);
      }

    }
    v303 = 0u;
    v304 = 0u;
    v301 = 0u;
    v302 = 0u;
    v246 = v273;
    v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v246, v140, (uint64_t)&v301, v319, 16);
    if (v143)
    {
      v263 = *(_QWORD *)v302;
      do
      {
        for (k = 0; k != v143; ++k)
        {
          if (*(_QWORD *)v302 != v263)
            objc_enumerationMutation(v246);
          v145 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * k);
          objc_msgSend_position(v145, v141, v142);
          v267 = v146;
          v299 = 0u;
          v300 = 0u;
          v297 = 0u;
          v298 = 0u;
          v147 = v251;
          v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v148, (uint64_t)&v297, v318, 16);
          if (v151)
          {
            v152 = *(_QWORD *)v298;
            v153 = 3.4028e38;
            v154 = 8;
            do
            {
              for (m = 0; m != v151; ++m)
              {
                if (*(_QWORD *)v298 != v152)
                  objc_enumerationMutation(v147);
                v156 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * m);
                objc_msgSend_centroid(v156, v149, v150);
                v158 = vsubq_f32(v157, v267);
                v159 = (int32x4_t)vmulq_f32(v158, v158);
                v274 = vaddq_f32(vaddq_f32((float32x4_t)v159, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v159.i8, 1)), (float32x4_t)vdupq_laneq_s32(v159, 2)).f32[0];
                if (v274 < v153)
                {
                  v154 = objc_msgSend_indexOfObject_(v147, v149, (uint64_t)v156);
                  v153 = v274;
                }
              }
              v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v149, (uint64_t)&v297, v318, 16);
            }
            while (v151);
          }
          else
          {
            v154 = 8;
          }

          objc_msgSend_objectAtIndexedSubscript_(v147, v160, v154);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_probes(v161, v162, v163);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v164, v165, (uint64_t)v145);

          objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v161, v166, MEMORY[0x1E0C9AA60]);
        }
        v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v246, v141, (uint64_t)&v301, v319, 16);
      }
      while (v143);
    }

    v167 = 0;
LABEL_89:
    if (v167 > 4)
      goto LABEL_130;
    v241 = v167;
    v295 = 0u;
    v296 = 0u;
    v293 = 0u;
    v294 = 0u;
    v254 = v251;
    v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v254, v168, (uint64_t)&v293, v317, 16);
    if (!v169)
    {

      goto LABEL_130;
    }
    v242 = v169;
    v243 = *(_QWORD *)v294;
    v171 = 1;
LABEL_92:
    v244 = 0;
    while (1)
    {
      if (*(_QWORD *)v294 != v243)
        objc_enumerationMutation(v254);
      v172 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * v244);
      v248 = objc_msgSend_indexOfObject_(v254, v170, (uint64_t)v172);
      v249 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v291 = 0u;
      v292 = 0u;
      v289 = 0u;
      v290 = 0u;
      objc_msgSend_probes(v172, v173, v174);
      v247 = (id)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v175, (uint64_t)&v289, v316, 16);
      if (v178)
        break;
LABEL_115:

      v283 = 0u;
      v284 = 0u;
      v281 = 0u;
      v282 = 0u;
      v206 = v249;
      v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v207, (uint64_t)&v281, v314, 16);
      if (v210)
      {
        v211 = *(_QWORD *)v282;
        do
        {
          for (n = 0; n != v210; ++n)
          {
            if (*(_QWORD *)v282 != v211)
              objc_enumerationMutation(v206);
            v213 = *(_QWORD *)(*((_QWORD *)&v281 + 1) + 8 * n);
            objc_msgSend_probes(v172, v208, v209);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObject_(v214, v215, v213);

          }
          v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v208, (uint64_t)&v281, v314, 16);
        }
        while (v210);
      }

      if (++v244 == v242)
      {
        v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v254, v170, (uint64_t)&v293, v317, 16);
        if (!v242)
        {

          v167 = v241 + ((v171 & 1) == 0);
          if ((v171 & 1) != 0)
          {
LABEL_130:
            v279 = 0u;
            v280 = 0u;
            v277 = 0u;
            v278 = 0u;
            v217 = v251;
            v221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v217, v218, (uint64_t)&v277, v313, 16);
            if (v221)
            {
              v222 = *(_QWORD *)v278;
              do
              {
                for (ii = 0; ii != v221; ++ii)
                {
                  if (*(_QWORD *)v278 != v222)
                    objc_enumerationMutation(v217);
                  v224 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * ii);
                  if ((objc_msgSend_isEmpty(v224, v219, v220) & 1) == 0)
                  {
                    v225 = [MDLTransform alloc];
                    v228 = (void *)objc_msgSend_initWithIdentity(v225, v226, v227);
                    objc_msgSend_centroid(v224, v229, v230);
                    objc_msgSend_setTranslation_(v228, v231, v232);
                    v233 = objc_alloc_init(MDLLightProbe);
                    objc_msgSend_setTransform_(v233, v234, (uint64_t)v228);
                    objc_msgSend_addObject_(obj, v235, (uint64_t)v233);

                  }
                }
                v221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v217, v219, (uint64_t)&v277, v313, 16);
              }
              while (v221);
            }

            objc_msgSend_allObjects(v246, v236, v237);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectsInArray_(obj, v239, (uint64_t)v238);

            v41 = obj;
            for (jj = 56; jj != -8; jj -= 8)

LABEL_127:
            v40 = v261;
            goto LABEL_128;
          }
          goto LABEL_89;
        }
        goto LABEL_92;
      }
    }
    v252 = *(_QWORD *)v290;
LABEL_97:
    v179 = 0;
    v250 = v178;
    while (1)
    {
      if (*(_QWORD *)v290 != v252)
        objc_enumerationMutation(v247);
      v258 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * v179);
      objc_msgSend_position(v258, v176, v177);
      v264 = v180;
      objc_msgSend_centroid(v172, v181, v182);
      *(_OWORD *)v275 = v183;
      v287 = 0u;
      v288 = 0u;
      v285 = 0u;
      v286 = 0u;
      v184 = v254;
      v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v185, (uint64_t)&v285, v315, 16);
      if (v187)
      {
        v256 = v179;
        v188 = 0;
        v189 = vsubq_f32(*(float32x4_t *)v275, v264);
        v190 = (int32x4_t)vmulq_f32(v189, v189);
        LODWORD(v276) = vaddq_f32(vaddq_f32((float32x4_t)v190, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v190.i8, 1)), (float32x4_t)vdupq_laneq_s32(v190, 2)).u32[0];
        v191 = *(_QWORD *)v286;
        v192 = v248;
        do
        {
          for (kk = 0; kk != v187; ++kk)
          {
            if (*(_QWORD *)v286 != v191)
              objc_enumerationMutation(v184);
            v194 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * kk);
            if ((objc_msgSend_isEqual_(v172, v186, (uint64_t)v194) & 1) == 0)
            {
              objc_msgSend_centroid(v194, v186, v195);
              v197 = vsubq_f32(v196, v264);
              v198 = (int32x4_t)vmulq_f32(v197, v197);
              v268 = vaddq_f32(vaddq_f32((float32x4_t)v198, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v198.i8, 1)), (float32x4_t)vdupq_laneq_s32(v198, 2)).f32[0];
              if (v268 < v276)
              {
                v192 = objc_msgSend_indexOfObject_(v184, v186, (uint64_t)v194);
                v171 = 0;
                v188 = 1;
                v276 = v268;
              }
            }
          }
          v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v186, (uint64_t)&v285, v315, 16);
        }
        while (v187);

        v178 = v250;
        v179 = v256;
        if ((v188 & 1) == 0)
          goto LABEL_113;
        objc_msgSend_objectAtIndex_(v184, v176, v192);
        v184 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_probes(v184, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v201, v202, (uint64_t)v258);

        objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v184, v203, MEMORY[0x1E0C9AA60]);
        objc_msgSend_addObject_(v249, v204, (uint64_t)v258);
        objc_msgSend_calculateCentroidNotIncludingSamplesinArray_(v172, v205, (uint64_t)v249);
      }

LABEL_113:
      if (++v179 == v178)
      {
        v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v176, (uint64_t)&v289, v316, 16);
        if (!v178)
          goto LABEL_115;
        goto LABEL_97;
      }
    }
  }
  if (type)
  {
    v41 = 0;
    goto LABEL_127;
  }
  v40 = v261;
  v41 = v261;
LABEL_128:

  return (NSArray *)v41;
}

@end
