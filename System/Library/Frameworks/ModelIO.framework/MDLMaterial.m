@implementation MDLMaterial

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMaterial, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_scatteringFunction, 0);
  objc_storeStrong((id *)&self->_builtinProperties, 0);
  objc_storeStrong((id *)&self->_userProperties, 0);
}

- (MDLMaterialProperty)propertyWithSemantic:(MDLMaterialSemantic)semantic
{
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  _QWORD *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = self->_userProperties;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD **)(*((_QWORD *)&v31 + 1) + 8 * v10);
      if (v11[19] == semantic)
        goto LABEL_19;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v31, v36, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_builtinProperties;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v27, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD **)(*((_QWORD *)&v27 + 1) + 8 * v16);
      if (v11[19] == semantic)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v13, (uint64_t)&v27, v35, 16);
        if (v14)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:
    v24 = v11;
    goto LABEL_20;
  }
LABEL_17:

  objc_msgSend_baseMaterial(self, v17, v18, (_QWORD)v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
    return (MDLMaterialProperty *)0;
  objc_msgSend_baseMaterial(self, v21, v22);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyWithSemantic_(v5, v23, semantic);
  v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v25 = v24;

  return (MDLMaterialProperty *)v25;
}

- (MDLMaterialProperty)propertyNamed:(NSString *)name
{
  NSString *v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  char isEqualToString;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  id v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = name;
  if (!v4)
    goto LABEL_22;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_userProperties;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v39, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
      objc_msgSend_name(v12, v7, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v4, v14, (uint64_t)v13);

      if ((isEqualToString & 1) != 0)
        goto LABEL_20;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v39, v44, 16);
        if (v9)
          goto LABEL_4;
        break;
      }
    }
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_builtinProperties;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v35, v43, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v36;
LABEL_12:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
      objc_msgSend_name(v12, v17, v18, (_QWORD)v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_isEqualToString_(v4, v23, (uint64_t)v22);

      if ((v24 & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v17, (uint64_t)&v35, v43, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
LABEL_20:
    v32 = v12;
    goto LABEL_21;
  }
LABEL_18:

  objc_msgSend_baseMaterial(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v28)
  {
LABEL_22:
    v33 = 0;
    goto LABEL_23;
  }
  objc_msgSend_baseMaterial(self, v29, v30);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyNamed_(v5, v31, (uint64_t)v4);
  v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
  v33 = v32;

LABEL_23:
  return (MDLMaterialProperty *)v33;
}

- (MDLMaterial)baseMaterial
{
  return self->_baseMaterial;
}

- (void)setScatteringFunction:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *builtinProperties;
  objc_class *v8;
  objc_property_t *v9;
  unint64_t i;
  char *Attributes;
  void *v12;
  const char *Name;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  objc_class *v21;
  objc_property_t *v22;
  unint64_t j;
  char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  unsigned int outCount;

  v5 = a3;
  objc_storeStrong((id *)&self->_scatteringFunction, a3);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  builtinProperties = self->_builtinProperties;
  self->_builtinProperties = v6;

  outCount = 0;
  v8 = (objc_class *)objc_opt_class();
  v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Attributes = (char *)property_getAttributes(v9[i]);
      if (strstr(Attributes, "MDLMaterialProperty"))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        Name = property_getName(v9[i]);
        objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("%s"), Name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(v5, v16, (uint64_t)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_addObject_(self->_builtinProperties, v18, (uint64_t)v17);

      }
    }
  }
  free(v9);
  v21 = (objc_class *)objc_msgSend_superclass(v5, v19, v20);
  v22 = class_copyPropertyList(v21, &outCount);
  if (outCount)
  {
    for (j = 0; j < outCount; ++j)
    {
      v24 = (char *)property_getAttributes(v22[j]);
      if (strstr(v24, "MDLMaterialProperty"))
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = property_getName(v22[j]);
        objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("%s"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(v5, v29, (uint64_t)v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_addObject_(self->_builtinProperties, v31, (uint64_t)v30);

      }
    }
  }
  free(v22);

}

- (void)resolveTexturesWithResolver:(id)resolver
{
  id v4;
  id v5;
  NSMutableArray *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  NSMutableArray *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  id v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  MDLMaterial *v53;
  __int128 v54;
  __int128 v55;
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
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = resolver;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v53 = self;
  v6 = self->_builtinProperties;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v62, v68, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v63;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v63 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v12);
        objc_msgSend_URLValue(v13, v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else
        {
          objc_msgSend_stringValue(v13, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend_stringValue(v13, v8, v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend_length(v18, v19, v20) == 0;

            if (!v21)
              objc_msgSend_addObject_(v5, v8, (uint64_t)v13);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v62, v68, 16);
      v10 = v22;
    }
    while (v22);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v23 = v53->_userProperties;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v58, v67, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v59;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v59 != v28)
          objc_enumerationMutation(v23);
        v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v29);
        objc_msgSend_URLValue(v30, v25, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {

        }
        else
        {
          objc_msgSend_stringValue(v30, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend_stringValue(v30, v25, v26);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend_length(v35, v36, v37) == 0;

            if (!v38)
              objc_msgSend_addObject_(v5, v25, (uint64_t)v30);
          }
        }
        ++v29;
      }
      while (v27 != v29);
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v58, v67, 16);
      v27 = v39;
    }
    while (v39);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = v5;
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v54, v66, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v55 != v45)
          objc_enumerationMutation(v40);
        v47 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend_stringValue(v47, v42, v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_resolveAssetNamed_(v4, v49, (uint64_t)v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setURLValue_(v47, v51, (uint64_t)v50);

        objc_msgSend_setType_(v47, v52, 1);
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v54, v66, 16);
    }
    while (v44);
  }

}

- (void)setProperty:(MDLMaterialProperty *)property
{
  MDLMaterialProperty *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  MDLMaterialProperty *v11;

  v4 = property;
  if (v4)
  {
    v11 = v4;
    objc_msgSend_name(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyNamed_(self, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend_setProperties_(v9, v10, (uint64_t)v11);
    else
      objc_msgSend_addObject_(self->_userProperties, v10, (uint64_t)v11);

    v4 = v11;
  }

}

- (void)loadTexturesUsingResolver:(id)a3 cache:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  NSMutableArray *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  NSMutableArray *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  MDLTextureSampler *v57;
  const char *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_resolveTexturesWithResolver_(self, v9, (uint64_t)v59);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v10 = self->_builtinProperties;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v68, v74, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v69 != v15)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend_URLValue(v17, v12, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
            objc_msgSend_addObject_(v8, v12, (uint64_t)v17);
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v68, v74, 16);
      }
      while (v14);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v20 = self->_userProperties;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v64, v73, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v65 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          objc_msgSend_URLValue(v27, v22, v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28 == 0;

          if (!v29)
            objc_msgSend_addObject_(v8, v22, (uint64_t)v27);
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v64, v73, 16);
      }
      while (v24);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v30 = v8;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v60, v72, 16);
    if (!v34)
    {
LABEL_38:

      goto LABEL_39;
    }
    v35 = *(_QWORD *)v61;
LABEL_23:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v35)
        objc_enumerationMutation(v30);
      v37 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v36);
      if (v6)
      {
        objc_msgSend_URLValue(*(void **)(*((_QWORD *)&v60 + 1) + 8 * v36), v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v6, v39, (uint64_t)v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40 == 0;

        if (v41)
        {
          objc_msgSend_URLValue(v37, v42, v43);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textureWithURL_(MDLTexture, v50, (uint64_t)v49);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_URLValue(v37, v51, v52);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v48, v44);
          goto LABEL_32;
        }
        objc_msgSend_URLValue(v37, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v6, v45, (uint64_t)v44);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_URLValue(*(void **)(*((_QWORD *)&v60 + 1) + 8 * v36), v32, v33);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textureWithURL_(MDLTexture, v47, (uint64_t)v44);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v48 = (void *)v46;
LABEL_32:

      if (v48)
      {
        objc_msgSend_textureSamplerValue(v37, v54, v55);
        v57 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();
        if (!v57)
          v57 = objc_alloc_init(MDLTextureSampler);
        objc_msgSend_setTexture_(v57, v56, (uint64_t)v48);
        objc_msgSend_setTextureSamplerValue_(v37, v58, (uint64_t)v57);

      }
      if (v34 == ++v36)
      {
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v60, v72, 16);
        if (!v34)
          goto LABEL_38;
        goto LABEL_23;
      }
    }
  }
  objc_msgSend_loadTexturesUsingArchiveAssetResolver_cache_(self, v7, (uint64_t)v59, v6);
LABEL_39:

}

- (void)loadTexturesUsingArchiveAssetResolver:(id)a3 cache:(id)a4
{
  id v6;
  NSMutableArray *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  NSMutableArray *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  BOOL v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  MDLTextureSampler *v60;
  const char *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v6 = a4;
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v7 = self->_builtinProperties;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v72, v78, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend_stringValue(v14, v9, v10, v62);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend_stringValue(v14, v9, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend_length(v16, v17, v18) == 0;

          if (!v19)
            objc_msgSend_addObject_(v63, v9, (uint64_t)v14);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v72, v78, 16);
    }
    while (v11);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v20 = self->_userProperties;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v68, v77, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v69 != v25)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend_stringValue(v27, v22, v23, v62);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend_stringValue(v27, v22, v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_length(v29, v30, v31) == 0;

          if (!v32)
            objc_msgSend_addObject_(v63, v22, (uint64_t)v27);
        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v68, v77, 16);
    }
    while (v24);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v33 = v63;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v64, v76, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v65 != v38)
          objc_enumerationMutation(v33);
        v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
        if (!v6)
        {
          objc_msgSend_stringValue(*(void **)(*((_QWORD *)&v64 + 1) + 8 * k), v35, v36);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textureNamed_assetResolver_(MDLTexture, v50, (uint64_t)v47, v62);
          v49 = objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        objc_msgSend_stringValue(*(void **)(*((_QWORD *)&v64 + 1) + 8 * k), v35, v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v6, v42, (uint64_t)v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43 == 0;

        if (!v44)
        {
          objc_msgSend_stringValue(v40, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v6, v48, (uint64_t)v47);
          v49 = objc_claimAutoreleasedReturnValue();
LABEL_30:
          v51 = (void *)v49;
          goto LABEL_32;
        }
        objc_msgSend_stringValue(v40, v45, v46);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textureNamed_assetResolver_(MDLTexture, v53, (uint64_t)v52, v62);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringValue(v40, v54, v55);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v6, v56, (uint64_t)v51, v47);
LABEL_32:

        if (v51)
        {
          objc_msgSend_textureSamplerValue(v40, v57, v58);
          v60 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();
          if (!v60)
            v60 = objc_alloc_init(MDLTextureSampler);
          objc_msgSend_setTexture_(v60, v59, (uint64_t)v51, v62);
          objc_msgSend_setTextureSamplerValue_(v40, v61, (uint64_t)v60);

        }
      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v64, v76, 16);
    }
    while (v37);
  }

}

- (MDLMaterial)initWithName:(NSString *)name scatteringFunction:(MDLScatteringFunction *)scatteringFunction
{
  NSString *v6;
  MDLScatteringFunction *v7;
  MDLMaterial *v8;
  const char *v9;
  MDLMaterial *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSMutableArray *userProperties;
  const char *v15;
  MDLMaterial *v16;
  objc_super v18;

  v6 = name;
  v7 = scatteringFunction;
  v18.receiver = self;
  v18.super_class = (Class)MDLMaterial;
  v8 = -[MDLMaterial init](&v18, sel_init);
  v10 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v9, (uint64_t)v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v10->_name;
      v10->_name = (NSString *)v11;
    }
    else
    {
      v12 = v8->_name;
      v8->_name = (NSString *)&stru_1EA577998;
    }

    v13 = objc_opt_new();
    userProperties = v10->_userProperties;
    v10->_userProperties = (NSMutableArray *)v13;

    objc_msgSend_setScatteringFunction_(v10, v15, (uint64_t)v7);
    v16 = v10;
  }

  return v10;
}

- (MDLScatteringFunction)scatteringFunction
{
  MDLScatteringFunction *scatteringFunction;
  void *v4;
  const char *v5;

  scatteringFunction = self->_scatteringFunction;
  if (!scatteringFunction)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend_setScatteringFunction_(self, v5, (uint64_t)v4);

    scatteringFunction = self->_scatteringFunction;
  }
  return scatteringFunction;
}

- (NSString)name
{
  return self->_name;
}

- (MDLMaterialFace)materialFace
{
  return self->_materialFace;
}

- (void)loadTexturesUsingResolver:(id)resolver
{
  objc_msgSend_loadTexturesUsingResolver_cache_(self, a2, (uint64_t)resolver, 0);
}

- (MDLMaterial)init
{
  MDLMaterial *v2;
  MDLMaterial *v3;
  NSString *name;
  uint64_t v5;
  NSMutableArray *userProperties;
  void *v7;
  const char *v8;
  MDLMaterial *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MDLMaterial;
  v2 = -[MDLMaterial init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1EA577998;

    v5 = objc_opt_new();
    userProperties = v3->_userProperties;
    v3->_userProperties = (NSMutableArray *)v5;

    v7 = (void *)objc_opt_new();
    objc_msgSend_setScatteringFunction_(v3, v8, (uint64_t)v7);

    v9 = v3;
  }

  return v3;
}

- (MDLMaterial)initWithName:(id)a3
{
  id v4;
  MDLMaterial *v5;
  const char *v6;
  MDLMaterial *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSMutableArray *userProperties;
  MDLScatteringFunction *scatteringFunction;
  MDLMaterial *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MDLMaterial;
  v5 = -[MDLMaterial init](&v15, sel_init);
  v7 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v6, (uint64_t)v4);
      v8 = objc_claimAutoreleasedReturnValue();
      name = v7->_name;
      v7->_name = (NSString *)v8;
    }
    else
    {
      name = v5->_name;
      v5->_name = (NSString *)&stru_1EA577998;
    }

    v10 = objc_opt_new();
    userProperties = v7->_userProperties;
    v7->_userProperties = (NSMutableArray *)v10;

    scatteringFunction = v7->_scatteringFunction;
    v7->_scatteringFunction = 0;

    v13 = v7;
  }

  return v7;
}

- (MDLMaterial)initWithName:(id)a3 physicallyPlausibleBSDF:(PhysicallyPlausibleDistribution *)a4
{
  id v6;
  MDLMaterial *v7;
  const char *v8;
  MDLMaterial *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSMutableArray *userProperties;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  MDLMaterial *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MDLMaterial;
  v7 = -[MDLMaterial init](&v19, sel_init);
  v9 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v8, (uint64_t)v6);
      v10 = objc_claimAutoreleasedReturnValue();
      name = v9->_name;
      v9->_name = (NSString *)v10;
    }
    else
    {
      name = v7->_name;
      v7->_name = (NSString *)&stru_1EA577998;
    }

    v12 = objc_opt_new();
    userProperties = v9->_userProperties;
    v9->_userProperties = (NSMutableArray *)v12;

    v14 = (_QWORD *)objc_opt_new();
    objc_msgSend_setScatteringFunction_(v9, v15, (uint64_t)v14);
    v16 = v14[11];
    *(_QWORD *)(v16 + 112) = a4[1].var1.var2;
    *(float *)(v16 + 120) = a4[1].var1.var3;
    *(_OWORD *)(v16 + 96) = *(_OWORD *)&a4[1].var1.var0;
    *(_QWORD *)(v16 + 128) = *(_QWORD *)&a4[1].var1.var5;
    *(float *)(v16 + 136) = a4[1].var1.var7;
    v17 = v9;

  }
  return v9;
}

- (void)conformToMatProperties
{
  uint64_t i;
  void *v4;
  const char *v5;

  for (i = 0; i != 192; i += 4)
  {
    objc_msgSend_propertyWithSemantic_(self, a2, (uint64_t)(&off_1EA576490)[i + 1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v4, v5, (uint64_t)(&off_1EA576490)[i + 3]);

  }
}

- (NSArray)propertiesWithSemantic:(MDLMaterialSemantic)semantic
{
  void *v5;
  NSMutableArray *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;
  void *v25;
  BOOL v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, semantic);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = self->_userProperties;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v36, v41, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v11);
        if (*(_QWORD *)(v12 + 152) == semantic)
          objc_msgSend_addObject_(v5, v8, v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v36, v41, 16);
    }
    while (v9);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_builtinProperties;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v32, v40, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
        if (*(_QWORD *)(v19 + 152) == semantic)
          objc_msgSend_addObject_(v5, v15, v19, (_QWORD)v32);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v32, v40, 16);
    }
    while (v16);
  }

  if (objc_msgSend_count(v5, v20, v21)
    || (objc_msgSend_baseMaterial(self, v22, v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = v25 == 0,
        v25,
        v26))
  {
    v24 = v5;
  }
  else
  {
    objc_msgSend_baseMaterial(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertiesWithSemantic_(v29, v30, semantic);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v24;
}

- (void)removeProperty:(MDLMaterialProperty *)property
{
  objc_msgSend_removeObject_(self->_userProperties, a2, (uint64_t)property);
}

- (void)removeAllProperties
{
  NSMutableArray *v3;
  NSMutableArray *userProperties;

  v3 = (NSMutableArray *)objc_opt_new();
  userProperties = self->_userProperties;
  self->_userProperties = v3;

}

- (BidirectionalScatteringDistributionFunction)bsdf
{
  MDLScatteringFunction *scatteringFunction;
  void *v4;
  const char *v5;

  scatteringFunction = self->_scatteringFunction;
  if (!scatteringFunction)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend_setScatteringFunction_(self, v5, (uint64_t)v4);

    scatteringFunction = self->_scatteringFunction;
  }
  return scatteringFunction->_bsdf.__ptr_.__value_;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  void *v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v19;
  uint64_t v20;
  unint64_t i;
  const char *v22;
  void *v24;

  var0 = a3->var0;
  v12 = 0;
  if (var0 < objc_msgSend_count(self->_builtinProperties, a2, (uint64_t)a3) && a5 != 0)
  {
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v10, var0 + v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a4[v12] = v14;

      v15 = var0 + v12++ + 1;
    }
    while (v15 < objc_msgSend_count(self->_builtinProperties, v16, v17) && v12 < a5);
  }
  for (i = var0 - objc_msgSend_count(self->_builtinProperties, v10, v11);
        i < objc_msgSend_count(self->_userProperties, v19, v20) && v12 < a5;
        ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_userProperties, v22, i);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    a4[v12] = v24;

    ++v12;
  }
  if (a5 > v12)
    bzero(&a4[v12], 8 * (a5 - v12));
  bzero(&unk_1F03B4CD0, 0x400uLL);
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&unk_1F03B4CD0;
  a3->var0 += a5;
  return v12;
}

- (MDLMaterialProperty)objectAtIndexedSubscript:(NSUInteger)idx
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  NSMutableArray *userProperties;
  uint64_t v9;
  const char *v10;
  void *v11;

  if (objc_msgSend_count(self->_builtinProperties, a2, idx) <= idx)
  {
    userProperties = self->_userProperties;
    v9 = idx - objc_msgSend_count(self->_builtinProperties, v5, v6);
    objc_msgSend_objectAtIndexedSubscript_(userProperties, v10, v9);
  }
  else
  {
    if (objc_msgSend_count(self->_builtinProperties, v5, v6) <= idx)
    {
      v11 = 0;
      return (MDLMaterialProperty *)v11;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v7, idx);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return (MDLMaterialProperty *)v11;
}

- (MDLMaterialProperty)objectForKeyedSubscript:(NSString *)name
{
  const char *v4;
  NSString *v5;
  void *v6;

  v5 = name;
  if (v5)
  {
    objc_msgSend_propertyNamed_(self, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (MDLMaterialProperty *)v6;
}

- (NSUInteger)count
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_count(self->_userProperties, a2, v2);
  return objc_msgSend_count(self->_builtinProperties, v5, v6) + v4;
}

- (void)encodeMaterialWithCoder:(id)a3 allocator:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t j;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  v9 = objc_msgSend_count(self->_userProperties, v7, v8);
  objc_msgSend_encodeInteger_forKey_(v26, v10, v9, CFSTR("userProperties.count"));
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_userProperties, v11, i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("userProperties[%ld]"), i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeMaterialPropertyWithCoder_forKey_allocator_(v14, v17, (uint64_t)v26, v16, v6);

    }
  }
  v18 = objc_msgSend_count(self->_builtinProperties, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v26, v19, v18, CFSTR("builtinProperties.count"));
  if (v18 >= 1)
  {
    for (j = 0; j != v18; ++j)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_builtinProperties, v20, j);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("builtinProperties[%ld]"), j);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeMaterialPropertyWithCoder_forKey_allocator_(v22, v25, (uint64_t)v26, v24, v6);

    }
  }

}

+ (id)decodeMaterialWithCoder:(id)a3 allocator:(id)a4
{
  id v5;
  id v6;
  MDLMaterial *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MDLMaterial);
  v10 = objc_msgSend_decodeIntegerForKey_(v5, v8, (uint64_t)CFSTR("userProperties.count"));
  if (v10 >= 1)
  {
    v11 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("userProperties[%ld]"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeMaterialPropertyWithCoder_forKey_allocator_(MDLMaterialProperty, v13, (uint64_t)v5, v12, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v7->_userProperties, v15, (uint64_t)v14);
      ++v11;
    }
    while (v10 != v11);
  }
  v17 = objc_msgSend_decodeIntegerForKey_(v5, v9, (uint64_t)CFSTR("builtinProperties.count"));
  if (v17 >= 1)
  {
    v18 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("builtinProperties[%ld]"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeMaterialPropertyWithCoder_forKey_allocator_(MDLMaterialProperty, v20, (uint64_t)v5, v19, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v7->_builtinProperties, v22, (uint64_t)v21);
      ++v18;
    }
    while (v17 != v18);
  }

  return v7;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 32);
}

- (void)setBaseMaterial:(MDLMaterial *)baseMaterial
{
  objc_storeStrong((id *)&self->_baseMaterial, baseMaterial);
}

- (void)setMaterialFace:(MDLMaterialFace)materialFace
{
  self->_materialFace = materialFace;
}

@end
