@implementation MDLVertexDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (void)addOrReplaceAttribute:(MDLVertexAttribute *)attribute
{
  const char *v4;
  uint64_t v5;
  unsigned int i;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int isEqualToString;
  unsigned int v33;
  const char *v34;
  unint64_t v35;
  uint64_t v36;
  NSMutableArray *attributes;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *layouts;
  MDLVertexBufferLayout *v43;
  const char *v44;
  MDLVertexAttribute *v45;
  MDLVertexAttribute *v46;

  v46 = attribute;
  for (i = 0; ; i = v9 + 1)
  {
    v9 = i;
    if (objc_msgSend_count(self->_attributes, v4, v5) <= (unint64_t)i)
      break;
    objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v7, i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_time(v10, v11, v12);
    v14 = v13;
    objc_msgSend_time(v46, v15, v16);
    if (v14 != v18)
      goto LABEL_8;
    objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v17, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_8:
      continue;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v22, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v46, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v27, v31, (uint64_t)v30);

    if (isEqualToString)
    {
      objc_msgSend_setObject_atIndexedSubscript_(self->_attributes, v4, (uint64_t)v46, v9);
      v45 = v46;
      goto LABEL_15;
    }
  }
  v33 = 0;
  while (1)
  {
    v35 = objc_msgSend_count(self->_attributes, v7, v8);
    v36 = v33;
    attributes = self->_attributes;
    if (v35 <= v33)
      break;
    objc_msgSend_objectAtIndexedSubscript_(attributes, v34, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_format(v38, v39, v40);

    v33 = v36 + 1;
    if (!v41)
    {
      objc_msgSend_setObject_atIndexedSubscript_(self->_attributes, v7, (uint64_t)v46, v36);
      v45 = v46;
      goto LABEL_15;
    }
  }
  objc_msgSend_addObject_(attributes, v34, (uint64_t)v46);
  layouts = self->_layouts;
  v43 = objc_alloc_init(MDLVertexBufferLayout);
  objc_msgSend_addObject_(layouts, v44, (uint64_t)v43);

  v45 = v46;
LABEL_15:

}

- (MDLVertexDescriptor)init
{
  MDLVertexDescriptor *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  NSMutableArray *attributes;
  int v7;
  NSMutableArray *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSMutableArray *layouts;
  int v15;
  NSMutableArray *v16;
  void *v17;
  const char *v18;
  MDLVertexDescriptor *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MDLVertexDescriptor;
  v2 = -[MDLVertexDescriptor init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend_initWithCapacity_(v3, v4, 31);
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v5;

    v7 = 31;
    do
    {
      v8 = v2->_attributes;
      v9 = (void *)objc_opt_new();
      objc_msgSend_addObject_(v8, v10, (uint64_t)v9);

      --v7;
    }
    while (v7);
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_initWithCapacity_(v11, v12, 31);
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableArray *)v13;

    v15 = 31;
    do
    {
      v16 = v2->_layouts;
      v17 = (void *)objc_opt_new();
      objc_msgSend_addObject_(v16, v18, (uint64_t)v17);

      --v15;
    }
    while (v15);
    v19 = v2;
  }

  return v2;
}

- (MDLVertexDescriptor)initWithVertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor
{
  MDLVertexDescriptor *v4;
  MDLVertexDescriptor *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSMutableArray *attributes;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSMutableArray *layouts;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = vertexDescriptor;
  v61.receiver = self;
  v61.super_class = (Class)MDLVertexDescriptor;
  v5 = -[MDLVertexDescriptor init](&v61, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend_attributes(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v9, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v6, v13, v12);
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableArray *)v14;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend_attributes(v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v57, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v58;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v58 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v22);
          v24 = MEMORY[0x1DF0D0AF8]();
          v26 = (void *)objc_msgSend_copyWithZone_(v23, v25, v24);
          objc_msgSend_addObject_(v5->_attributes, v27, (uint64_t)v26);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v28, (uint64_t)&v57, v63, 16);
      }
      while (v20);
    }

    v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend_layouts(v4, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v32, v33, v34);
    v37 = objc_msgSend_initWithCapacity_(v29, v36, v35);
    layouts = v5->_layouts;
    v5->_layouts = (NSMutableArray *)v37;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend_layouts(v4, v39, v40, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v53, v62, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v54;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v54 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v45);
          v47 = MEMORY[0x1DF0D0AF8]();
          v49 = (void *)objc_msgSend_copyWithZone_(v46, v48, v47);
          objc_msgSend_addObject_(v5->_layouts, v50, (uint64_t)v49);

          ++v45;
        }
        while (v43 != v45);
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v51, (uint64_t)&v53, v62, 16);
      }
      while (v43);
    }

  }
  return v5;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MDLVertexDescriptor *v4;
  const char *v5;

  v4 = [MDLVertexDescriptor alloc];
  return (id)objc_msgSend_initWithVertexDescriptor_(v4, v5, (uint64_t)self);
}

- (MDLVertexAttribute)attributeNamed:(NSString *)name
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  const char *v16;
  char isEqualToString;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = name;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_attributes(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend_format(v14, v9, v10))
        {
          objc_msgSend_name(v14, v9, v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v4, v16, (uint64_t)v15);

          if ((isEqualToString & 1) != 0)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  return (MDLVertexAttribute *)v11;
}

- (void)removeAttributeNamed:(NSString *)name
{
  const char *v4;
  uint64_t v5;
  unsigned int i;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int isEqualToString;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  NSString *v23;

  v23 = name;
  for (i = 0; objc_msgSend_count(self->_attributes, v4, v5) > (unint64_t)i; ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v7, i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v11, i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v23);

      if (!isEqualToString)
        continue;
      objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v4, i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v19, v20, (uint64_t)&stru_1EA577998);

      objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v21, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFormat_(v8, v22, 0);
    }

  }
}

- (void)reset
{
  id v3;
  int v4;
  const char *v5;
  NSMutableArray *v6;
  NSMutableArray *attributes;
  id v8;
  const char *v9;
  NSMutableArray *v10;
  NSMutableArray *layouts;
  NSMutableArray *v12;
  void *v13;
  const char *v14;
  NSMutableArray *v15;
  void *v16;
  const char *v17;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = 31;
  v6 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v3, v5, 31);
  attributes = self->_attributes;
  self->_attributes = v6;

  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v8, v9, 31);
  layouts = self->_layouts;
  self->_layouts = v10;

  do
  {
    v12 = self->_attributes;
    v13 = (void *)objc_opt_new();
    objc_msgSend_addObject_(v12, v14, (uint64_t)v13);

    v15 = self->_layouts;
    v16 = (void *)objc_opt_new();
    objc_msgSend_addObject_(v15, v17, (uint64_t)v16);

    --v4;
  }
  while (v4);
}

- (void)setPackedStrides
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t k;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  NSMutableArray *layouts;
  MDLVertexBufferLayout *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  _QWORD *v31;
  NSMutableArray *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *obj;
  id obja;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = self->_attributes;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v64, v70, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v65 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        v10 = objc_msgSend_bufferIndex(*(void **)(*((_QWORD *)&v64 + 1) + 8 * i), v4, v5);
        objc_msgSend_numberWithUnsignedLong_(v9, v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v55, v13, (uint64_t)v12);

      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v64, v70, 16);
    }
    while (v6);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obja = v55;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v14, (uint64_t)&v60, v69, 16);
  if (v15)
  {
    v51 = *(_QWORD *)v61;
    do
    {
      v52 = v15;
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v61 != v51)
          objc_enumerationMutation(obja);
        v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        for (k = objc_msgSend_count(self->_layouts, v16, v17, v51); ; ++k)
        {
          v23 = objc_msgSend_unsignedLongValue(v19, v20, v21);
          layouts = self->_layouts;
          if (k >= v23)
            break;
          v27 = objc_alloc_init(MDLVertexBufferLayout);
          objc_msgSend_addObject_(layouts, v28, (uint64_t)v27);

        }
        v29 = objc_msgSend_unsignedLongValue(v19, v24, v25);
        objc_msgSend_objectAtIndexedSubscript_(layouts, v30, v29);
        v31 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v31[1] = 0;

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v32 = self->_attributes;
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v56, v68, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v57;
          do
          {
            for (m = 0; m != v36; ++m)
            {
              if (*(_QWORD *)v57 != v37)
                objc_enumerationMutation(v32);
              v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * m);
              v40 = objc_msgSend_bufferIndex(v39, v34, v35);
              if (v40 == objc_msgSend_unsignedLongValue(v19, v41, v42))
              {
                v43 = objc_msgSend_format(v39, v34, v35);
                v44 = sub_1DCACC518(v43);
                v45 = self->_layouts;
                v48 = objc_msgSend_unsignedLongValue(v19, v46, v47);
                objc_msgSend_objectAtIndexedSubscript_(v45, v49, v48);
                v50 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                v50[1] += v44;

              }
            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v56, v68, 16);
          }
          while (v36);
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v16, (uint64_t)&v60, v69, 16);
    }
    while (v15);
  }

}

- (void)setPackedOffsets
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  MDLVertexDescriptor *v35;
  NSMutableArray *obj;
  id obja;
  id v38;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = self;
  obj = self->_attributes;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v47, v53, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        v10 = objc_msgSend_bufferIndex(*(void **)(*((_QWORD *)&v47 + 1) + 8 * i), v4, v5);
        objc_msgSend_numberWithUnsignedLong_(v9, v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v38, v13, (uint64_t)v12);

      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v47, v53, 16);
    }
    while (v6);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obja = v38;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v14, (uint64_t)&v43, v52, 16);
  if (v15)
  {
    v34 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(obja);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v18 = v35->_attributes;
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v39, v51, 16);
        if (v22)
        {
          v23 = 0;
          v24 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v40 != v24)
                objc_enumerationMutation(v18);
              v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
              v27 = objc_msgSend_bufferIndex(v26, v20, v21, v34);
              if (v27 == objc_msgSend_unsignedLongValue(v17, v28, v29))
              {
                objc_msgSend_setOffset_(v26, v20, v23);
                v32 = objc_msgSend_format(v26, v30, v31);
                v23 += sub_1DCACC518(v32);
              }
            }
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v39, v51, 16);
          }
          while (v22);
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v33, (uint64_t)&v43, v52, 16);
    }
    while (v15);
  }

}

- (void)debugPrintToFile:(__sFILE *)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;
  __sFILE *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  NSMutableArray *obj;
  NSMutableArray *obja;
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
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = self->_attributes;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v52, v57, 16);
  if (v7)
  {
    v45 = 0;
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v5, v6);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v10, v12, (uint64_t)v11) & 1) == 0)
        {
          v15 = objc_msgSend_format(v10, v13, v14) == 0;

          if (v15)
            continue;
          objc_msgSend_name(v10, v5, v6);
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v16 = a3;
          v18 = (const char *)objc_msgSend_cStringUsingEncoding_(v11, v17, 4);
          v21 = objc_msgSend_format(v10, v19, v20);
          v22 = sub_1DCBD213C(v21);
          v25 = objc_msgSend_offset(v10, v23, v24);
          v28 = objc_msgSend_bufferIndex(v10, v26, v27);
          v43 = v25;
          a3 = v16;
          fprintf(v16, "%lu %s %s off=%lu buf%lu\n", v45 + i, v18, v22, v43, v28);
        }

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v52, v57, 16);
      v45 += i;
    }
    while (v7);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obja = self->_layouts;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v29, (uint64_t)&v48, v56, 16);
  if (v32)
  {
    v33 = 0;
    v34 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v30, v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v36, v38, (uint64_t)v37) & 1) != 0)
        {

        }
        else
        {
          v41 = objc_msgSend_stride(v36, v39, v40) == 0;

          if (!v41)
          {
            v42 = objc_msgSend_stride(v36, v30, v31);
            fprintf(a3, "%lu stride=%lu\n", v33 + j, v42);
          }
        }
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v30, (uint64_t)&v48, v56, 16);
      v33 += j;
    }
    while (v32);
  }

}

- (BOOL)isEqual:(id)a3
{
  MDLVertexDescriptor *v4;
  uint64_t *v5;
  const char *v6;
  const char *v7;
  char isEqualToArray;

  v4 = (MDLVertexDescriptor *)a3;
  if (self == v4)
  {
    isEqualToArray = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend_isEqualToArray_(self->_attributes, v6, v5[1]))
        isEqualToArray = objc_msgSend_isEqualToArray_(self->_layouts, v7, v5[2]);
      else
        isEqualToArray = 0;

    }
    else
    {
      isEqualToArray = 0;
    }
  }

  return isEqualToArray;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_attributes, a2, v2);
  return objc_msgSend_hash(self->_layouts, v5, v6) ^ v4;
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_attributes(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend_format(v13, v8, v9))
        {
          objc_msgSend_addObject_(v30, v8, (uint64_t)v13);
          v16 = objc_msgSend_bufferIndex(v13, v14, v15);
          objc_msgSend_layouts(self, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v19, v20, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v22, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v21, v23);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }

  v25 = (void *)MEMORY[0x1E0CB3940];
  v26 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("<%@: %p attributes:%@ layouts:%@>"), v26, self, v30, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)_encodeVertexDescriptorLayoutsWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  id v29;

  v29 = a3;
  objc_msgSend_layouts(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  objc_msgSend_encodeInt32_forKey_(v29, v10, v9, CFSTR("layouts.count"));
  v11 = v9 << 32;
  if (v9 << 32)
  {
    v12 = 0;
    v13 = v11 >> 32;
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    do
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v17 = (void *)objc_msgSend_initWithFormat_(v15, v16, (uint64_t)CFSTR("layouts[%zu]"), v12);
      objc_msgSend_layouts(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v20, v21, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend_stride(v22, v23, v24);
      objc_msgSend_stringByAppendingString_(v17, v26, (uint64_t)CFSTR(".stride"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v29, v28, v25, v27);

      ++v12;
    }
    while (v14 != v12);
  }

}

- (void)_encodeVertexDescriptorAttributesWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  void *v50;
  const char *v51;
  id v52;

  v52 = a3;
  objc_msgSend_attributes(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  objc_msgSend_encodeInt32_forKey_(v52, v10, v9, CFSTR("attributes.count"));
  if (v9 << 32)
  {
    v11 = 0;
    if ((unint64_t)(int)v9 <= 1)
      v12 = 1;
    else
      v12 = (int)v9;
    do
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      v15 = (void *)objc_msgSend_initWithFormat_(v13, v14, (uint64_t)CFSTR("attributes[%zu]"), v11);
      objc_msgSend_attributes(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v18, v19, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_name(v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v15, v24, (uint64_t)CFSTR(".name"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v52, v26, (uint64_t)v23, v25);

      v29 = objc_msgSend_bufferIndex(v20, v27, v28);
      objc_msgSend_stringByAppendingString_(v15, v30, (uint64_t)CFSTR(".bufferIndex"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v52, v32, v29, v31);

      v35 = objc_msgSend_format(v20, v33, v34);
      objc_msgSend_stringByAppendingString_(v15, v36, (uint64_t)CFSTR(".format"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v52, v38, v35, v37);

      v41 = objc_msgSend_offset(v20, v39, v40);
      objc_msgSend_stringByAppendingString_(v15, v42, (uint64_t)CFSTR(".offset"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v52, v44, v41, v43);

      objc_msgSend_time(v20, v45, v46);
      v48 = v47;
      objc_msgSend_stringByAppendingString_(v15, v49, (uint64_t)CFSTR(".time"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeDouble_forKey_(v52, v51, (uint64_t)v50, v48);

      ++v11;
    }
    while (v12 != v11);
  }

}

+ (id)_decodeVertexDescriptorAttributesWithCoder:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t i;
  id v10;
  const char *v11;
  void *v12;
  MDLVertexAttribute *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;

  v3 = a3;
  v5 = objc_msgSend_decodeIntegerForKey_(v3, v4, (uint64_t)CFSTR("attributes.count"));
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v6, v7, v5);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = (void *)objc_msgSend_initWithFormat_(v10, v11, (uint64_t)CFSTR("attributes[%zu]"), i);
      v13 = objc_alloc_init(MDLVertexAttribute);
      v14 = objc_opt_class();
      objc_msgSend_stringByAppendingString_(v12, v15, (uint64_t)CFSTR(".name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v3, v17, v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v13, v19, (uint64_t)v18);

      objc_msgSend_stringByAppendingString_(v12, v20, (uint64_t)CFSTR(".bufferIndex"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_decodeIntegerForKey_(v3, v22, (uint64_t)v21);
      objc_msgSend_setBufferIndex_(v13, v24, v23);

      objc_msgSend_stringByAppendingString_(v12, v25, (uint64_t)CFSTR(".format"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_decodeIntegerForKey_(v3, v27, (uint64_t)v26);
      objc_msgSend_setFormat_(v13, v29, v28);

      objc_msgSend_stringByAppendingString_(v12, v30, (uint64_t)CFSTR(".offset"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_decodeIntegerForKey_(v3, v32, (uint64_t)v31);
      objc_msgSend_setOffset_(v13, v34, v33);

      objc_msgSend_stringByAppendingString_(v12, v35, (uint64_t)CFSTR(".time"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeDoubleForKey_(v3, v37, (uint64_t)v36);
      objc_msgSend_setTime_(v13, v38, v39);

      objc_msgSend_addObject_(v8, v40, (uint64_t)v13);
    }
  }

  return v8;
}

+ (id)_decodeVertexDescriptorLayoutsWithCoder:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t i;
  id v10;
  const char *v11;
  void *v12;
  MDLVertexBufferLayout *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;

  v3 = a3;
  v5 = objc_msgSend_decodeIntegerForKey_(v3, v4, (uint64_t)CFSTR("layouts.count"));
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v6, v7, v5);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = (void *)objc_msgSend_initWithFormat_(v10, v11, (uint64_t)CFSTR("layouts[%zu]"), i);
      v13 = objc_alloc_init(MDLVertexBufferLayout);
      objc_msgSend_stringByAppendingString_(v12, v14, (uint64_t)CFSTR(".stride"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_decodeIntegerForKey_(v3, v16, (uint64_t)v15);
      objc_msgSend_setStride_(v13, v18, v17);

      objc_msgSend_addObject_(v8, v19, (uint64_t)v13);
    }
  }

  return v8;
}

- (void)encodeVertexDescriptorWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  id v6;

  v6 = a3;
  objc_msgSend__encodeVertexDescriptorAttributesWithCoder_(self, v4, (uint64_t)v6);
  objc_msgSend__encodeVertexDescriptorLayoutsWithCoder_(self, v5, (uint64_t)v6);

}

+ (id)decodeVertexDescriptorWithCoder:(id)a3
{
  id v4;
  MDLVertexDescriptor *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;

  v4 = a3;
  v5 = objc_alloc_init(MDLVertexDescriptor);
  objc_msgSend__decodeVertexDescriptorAttributesWithCoder_(a1, v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttributes_(v5, v8, (uint64_t)v7);

  objc_msgSend__decodeVertexDescriptorLayoutsWithCoder_(a1, v9, (uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLayouts_(v5, v11, (uint64_t)v10);

  return v5;
}

- (void)setAttributes:(NSMutableArray *)attributes
{
  objc_storeStrong((id *)&self->_attributes, attributes);
}

- (void)setLayouts:(NSMutableArray *)layouts
{
  objc_storeStrong((id *)&self->_layouts, layouts);
}

@end
