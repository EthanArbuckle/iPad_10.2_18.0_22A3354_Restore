@implementation REMeshPartDescriptor

- (REMeshPartDescriptor)initWithMeshAssetPart:(const void *)a3 partTransform:(id *)a4 payloadBuilder:(void *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  re *v16;
  NSObject *v17;
  REMeshAttributeDescriptor *v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  unsigned int v33;
  unsigned int v34;
  char v35;
  char v36;
  REMeshPartDescriptor *v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v42;
  void *v43;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)a3 + 10));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = *((_QWORD *)a3 + 2);
  if (!v9)
  {
LABEL_12:
    v19 = *((unsigned int *)a3 + 58);
    if ((_DWORD)v19)
    {
      v20 = 0;
      v21 = (int *)(*((_QWORD *)a3 + 27) + 8);
      while (1)
      {
        v22 = *v21;
        v21 += 20;
        if (v22 < 0)
          break;
        if (v19 == ++v20)
        {
          LODWORD(v20) = *((_DWORD *)a3 + 58);
          break;
        }
      }
    }
    else
    {
      LODWORD(v20) = 0;
    }
    if ((_DWORD)v19 == (_DWORD)v20)
    {
LABEL_37:
      v35 = *((_BYTE *)a3 + 195) == 1;
      if (!*((_BYTE *)a3 + 194))
        v35 = 2;
      if (*((_BYTE *)a3 + 192))
        v36 = *((_BYTE *)a3 + 193);
      else
        v36 = 2;
      HIDWORD(v40) = *((_DWORD *)a3 + 15);
      LODWORD(v41) = *((_DWORD *)a3 + 16);
      BYTE1(v40) = v35;
      LOBYTE(v40) = v36;
      v37 = -[REMeshPartDescriptor initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:](self, "initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:", v43, *((unsigned int *)a3 + 12), *((unsigned int *)a3 + 10), *((unsigned int *)a3 + 13), v8, *((unsigned __int16 *)a3 + 28), *((double *)a3 + 12), *((double *)a3 + 14), *(double *)v42, *((double *)v42 + 2), *((double *)v42 + 4), *((double *)v42 + 6), v40, v41);
      self = v37;
      goto LABEL_43;
    }
    v23 = v20;
    v24 = *((_QWORD *)a3 + 27);
    while (1)
    {
      v25 = v24 + 80 * v23;
      if ((*(_BYTE *)(v25 + 24) & 1) != 0)
        v26 = *(_QWORD *)(v24 + 80 * v23 + 32);
      else
        v26 = v24 + 80 * v23 + 25;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_BYTE *)(v24 + 80 * v23 + 56) & 1) != 0)
        v28 = *(_QWORD *)(v24 + 80 * v23 + 64);
      else
        v28 = v25 + 57;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        goto LABEL_29;
      objc_msgSend(v8, "objectForKeyedSubscript:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (!v32)
        break;
LABEL_30:

      v33 = *((_DWORD *)a3 + 58);
      v24 = *((_QWORD *)a3 + 27);
      if (v33 <= (int)v20 + 1)
        v33 = v20 + 1;
      while (1)
      {
        v23 = (v20 + 1);
        if (v33 - 1 == (_DWORD)v20)
          break;
        LODWORD(v20) = v20 + 1;
        v34 = v23;
        if ((*(_DWORD *)(v24 + 80 * v23 + 8) & 0x80000000) != 0)
          goto LABEL_36;
      }
      v34 = v33;
LABEL_36:
      LODWORD(v20) = v34;
      if ((_DWORD)v19 == v34)
        goto LABEL_37;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, v27);
LABEL_29:

    goto LABEL_30;
  }
  v10 = *((_QWORD *)a3 + 4);
  v11 = 80 * v9;
  while (1)
  {
    if ((*(_BYTE *)(v10 + 8) & 1) != 0)
      v12 = *(_QWORD *)(v10 + 16);
    else
      v12 = v10 + 9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      v17 = *re::assetTypesLogObjects(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v43;
        v47 = 2112;
        v48 = v13;
        _os_log_error_impl(&dword_224FE9000, v17, OS_LOG_TYPE_ERROR, "Two attribute buffers in the same mesh part (%@) have the same name (%@)", buf, 0x16u);
      }
      goto LABEL_11;
    }
    v18 = -[REMeshAttributeDescriptor initWithMeshAssetBuffer:payloadBuilder:]([REMeshAttributeDescriptor alloc], "initWithMeshAssetBuffer:payloadBuilder:", v10, a5);
    if (!v18)
      break;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v13);

LABEL_11:
    v10 += 80;
    v11 -= 80;
    if (!v11)
      goto LABEL_12;
  }
  v39 = *re::assetTypesLogObjects(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_log_error_impl(&dword_224FE9000, v39, OS_LOG_TYPE_ERROR, "Failed to create REMeshAttributeDescriptor for attribute buffer %@", buf, 0xCu);
  }

  v37 = 0;
LABEL_43:

  return v37;
}

- (REMeshPartDescriptor)initWithResourceDefinition:(const void *)a3 meshPart:(const void *)a4 payloadBuilder:(void *)a5
{
  uint64_t v8;
  unint64_t v9;
  int *v10;
  unint64_t v11;
  const char **v12;
  const char **v13;
  char *v14;
  char *v15;
  _anonymous_namespace_ *v16;
  const char *v17;
  const re::StringID *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  REMeshAttributeDescriptor *v26;
  char v27;
  void *v28;
  void *v29;
  char *v30;
  void *v31;
  char v32;
  REMeshPartDescriptor *v33;
  REMeshPartDescriptor *result;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _anonymous_namespace_ *v39;
  _QWORD v40[2];
  id *v41;
  uint64_t v42;
  const char **v43;

  v39 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = *((_QWORD *)a3 + 7);
  v9 = *((_QWORD *)a3 + 5);
  v10 = (int *)*((_QWORD *)a4 + 4);
  v37 = (char *)a4;
  v11 = *((_QWORD *)a4 + 2);
  if (v42)
  {
    v12 = v43;
    v13 = &v43[7 * v42];
    v14 = (char *)a5 + 64;
    v15 = (char *)a5 + 8;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *v12);
      v16 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
      v17 = *v12;
      v40[0] = 0;
      v40[1] = &str_110;
      v19 = (uint64_t)((re::bufferIdentifierForMeshAttribute((re *)v40, v18) & 0xFFFFFFFC) == 4 ? v14 : v15);
      re::StringID::destroyString((re::StringID *)v40);
      v21 = v12[4];
      if (!v21)
        break;
      v22 = (uint64_t *)v12[5];
      if (v21 != (const char *)1)
      {
        v24 = &v22[2 * (_QWORD)v21];
        v25 = v22 + 2;
        do
        {
          v25 += 2;
        }
        while (v25 != v24);
      }
      v26 = -[REMeshAttributeDescriptor initWithVertexAttributeDescriptor:payloadOffset:count:]([REMeshAttributeDescriptor alloc], "initWithVertexAttributeDescriptor:payloadOffset:count:", v12, v23, *((unsigned int *)v12 + 4));
      -[_anonymous_namespace_ setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v26, v16);

      v12 += 7;
      if (v12 == v13)
        goto LABEL_11;
    }
    re::internal::assertLog((re::internal *)6, v20, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < size()", "operator[]", 251, 0, 0);
    result = (REMeshPartDescriptor *)_os_crash();
    __break(1u);
  }
  else
  {
LABEL_11:
    if (v37[114])
      v27 = v37[115] == 1;
    else
      v27 = 2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "indexTriangles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_anonymous_namespace_ objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v29, "count");
    if ((*((_QWORD *)v37 + 6) & 1) != 0)
      v30 = (char *)*((_QWORD *)v37 + 7);
    else
      v30 = v37 + 49;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37[112])
      v32 = v37[113];
    else
      v32 = 2;
    HIDWORD(v35) = *((_DWORD *)v37 + 30);
    LODWORD(v36) = 0;
    BYTE1(v35) = v27;
    LOBYTE(v35) = v32;
    v33 = -[REMeshPartDescriptor initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:](self, "initWithName:vertexCount:indexCount:instanceCount:attributes:materialIndex:boundingBoxMin:boundingBoxMax:doubleSidedFlag:windingOrderIsCCW:transform:preSplitVertexCount:patchCount:", v31, *((double *)v37 + 10), *((double *)v37 + 12), *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48), v35, v36);

    re::FixedArray<re::MeshVertexAttributeBuffers::Attribute>::deinit(&v41);
    return v33;
  }
  return result;
}

- (MeshPart)meshPartWithPayloadBuffer:(SEL)a3 partIndexInModel:(const void *)a4
{
  MeshPart *result;
  __int128 v10;
  unint64_t v11;
  _anonymous_namespace_ *v12;
  char v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _anonymous_namespace_ *v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;
  __int16 v47;
  uint64_t v48[2];
  _BYTE v49[2];
  char v50;
  BOOL v51;
  char v52;
  _OWORD v53[2];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62[2];
  __int128 v63;
  __int128 v64;
  _QWORD v65[2];
  unint64_t v66;
  int v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  result = (MeshPart *)-[REMeshPartDescriptor materialIndex](self, "materialIndex");
  if (result < 0x10000)
  {
    v47 = (__int16)result;
    v68 = 0;
    v65[1] = 0;
    v66 = 0;
    v67 = 0;
    re::DynamicArray<re::NamedVertexBuffer>::setCapacity(v65, 0);
    ++v67;
    if (-[REMeshPartDescriptor isIndexed](self, "isIndexed"))
    {
      v11 = a5;
      v12 = -[REMeshPartDescriptor indexType](self, "indexType");
      if (v12 == 1)
        v13 = 36;
      else
        v13 = 0;
      if ((_BYTE)v12)
        v14 = v13;
      else
        v14 = 49;
      LOWORD(v63) = v14;
      v15 = (void *)*((_QWORD *)a4 + 4);
      v16 = -[REMeshPartDescriptor indexPayloadOffset](self, "indexPayloadOffset");
      v17 = -[REMeshPartDescriptor indexBufferSize](self, "indexBufferSize");
      *((_QWORD *)&v63 + 1) = 0;
      *((_QWORD *)&v63 + 1) = v15;
      *(_QWORD *)&v64 = __PAIR64__(v17, v16);
      *((_QWORD *)&v64 + 1) = 0xFFFFFFFF00000000;
      re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v65, (uint64_t)v62);
      a5 = v11;
      if (*((_QWORD *)&v63 + 1))
      {

        *((_QWORD *)&v63 + 1) = 0;
      }
      if (*(_QWORD *)&v62[0] && (BYTE8(v62[0]) & 1) != 0)
        (*(void (**)(void))(**(_QWORD **)&v62[0] + 40))();
    }
    v46 = a5;
    v60 = 0u;
    v61 = 0u;
    v59 = 0u;
    v58 = 0u;
    +[REMeshPartDescriptor coreAttributeNames](REMeshPartDescriptor, "coreAttributeNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[REMeshPartDescriptor coreAttributes](self, "coreAttributes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v24, "addBufferToArray:name:payloadBuffer:", v65, objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), a4);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v19);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[REMeshPartDescriptor customAttributes](self, "customAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v55 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[REMeshPartDescriptor customAttributes](self, "customAttributes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "addBufferToArray:name:payloadBuffer:", v65, objc_msgSend(objc_retainAutorelease(v29), "UTF8String"), a4);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      }
      while (v26);
    }

    -[REMeshPartDescriptor boundingBoxMin](self, "boundingBoxMin");
    v45 = v32;
    -[REMeshPartDescriptor boundingBoxMax](self, "boundingBoxMax");
    v53[0] = v45;
    v53[1] = v33;
    v49[0] = 0;
    v50 = 0;
    v52 = 0;
    if (-[REMeshPartDescriptor doubleSidedFlag](self, "doubleSidedFlag") != 2)
    {
      v49[0] = 1;
      v49[1] = -[REMeshPartDescriptor doubleSidedFlag](self, "doubleSidedFlag") == 1;
    }
    if (-[REMeshPartDescriptor windingOrderIsCCW](self, "windingOrderIsCCW") != 2)
    {
      v50 = 1;
      v51 = -[REMeshPartDescriptor windingOrderIsCCW](self, "windingOrderIsCCW") == 1;
    }
    -[REMeshPartDescriptor name](self, "name");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = (_anonymous_namespace_ *)objc_msgSend(v34, "UTF8String");
    v48[0] = 0;
    v48[1] = (uint64_t)&str_110;
    v36 = v68;
    v37 = v66;
    v38 = -[REMeshPartDescriptor indexCount](self, "indexCount");
    v39 = -[REMeshPartDescriptor vertexCount](self, "vertexCount");
    v40 = -[REMeshPartDescriptor instanceCount](self, "instanceCount");
    -[REMeshPartDescriptor transform](self, "transform");
    v62[0] = v41;
    v62[1] = v42;
    v63 = v43;
    v64 = v44;
    re::MeshPart::MeshPart((uint64_t)retstr, v48, v47, v36, v37, v38, v39, v40, v53, v46, v62, (re::MeshPartFlags *)v49, -[REMeshPartDescriptor preSplitVertexCount](self, "preSplitVertexCount"), -[REMeshPartDescriptor patchCount](self, "patchCount"));
    re::StringID::destroyString((re::StringID *)v48);

    return (MeshPart *)re::DynamicArray<re::NamedVertexBuffer>::deinit((uint64_t)v65);
  }
  else
  {
    *(_OWORD *)&retstr->var0.var4.var5.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var4.var3 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var4.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var2.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var3.var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var2.var3 = 0u;
    *(_OWORD *)&retstr->var0.var4.var3.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var2.var1 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var1.var2 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var6 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var2 = 0u;
    *(_OWORD *)&retstr->var0.var2 = 0u;
    *(_OWORD *)&retstr->var0.var3.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var4.var0.var0 = 0u;
    retstr->var0.var4.var3.var0.var2.var1 = 1;
    retstr->var0.var4.var3.var0.var3.var1.var0 = 0;
    retstr->var0.var4.var3.var0.var3.var0[1] = 0;
    retstr->var0.var4.var3.var1 = 0;
    retstr->var0.var4.var3.var2 = 0;
    retstr->var0.var4.var4.var0 = 0;
    retstr->var0.var4.var4.var1 = 0;
    retstr->var0.var4.var4.var2 = 0;
    retstr->var0.var4.var4.var3 = 0;
    *(_OWORD *)&retstr->var0.var4.var4.var4 = 0u;
    *(_OWORD *)&retstr->var0.var4.var5.var1 = 0u;
    retstr->var0.var4.var5.var3 = 0;
    retstr->var1.var1 = 0;
    retstr->var1.var2 = 0;
    retstr->var1.var0 = 0;
    *(_OWORD *)&retstr->var2.var0.var5[2] = xmmword_2260E5F10;
    *(_OWORD *)&retstr->var2.var0.var5[6] = xmmword_2260E5F20;
    *(_OWORD *)&retstr->var2.var0.var5[10] = xmmword_2260E5F40;
    *(_OWORD *)&retstr->var2.var0.var5[14] = xmmword_2260E5D70;
    *(_QWORD *)&v10 = 0x7F0000007FLL;
    *((_QWORD *)&v10 + 1) = 0x7F0000007FLL;
    *(int32x4_t *)&retstr->var3.var0.var0.var1[2] = vdupq_n_s32(0x7F800000u);
    *(_OWORD *)&retstr->var4 = v10;
    *(_WORD *)&retstr->var8.var0[14] = 0;
    retstr->var8.var0[12] = 0;
    *(_QWORD *)&retstr->var8.var0[4] = 0;
    retstr->var10 = 0;
    *(_QWORD *)&retstr->var11 = &str_110;
    *(_QWORD *)&retstr->var15.var0 = 0;
    LOBYTE(retstr[1].var0.var0.var0) = 3;
    *(CachedVertexFetchFunction **)((char *)&retstr[1].var0.var0.var0 + 4) = (CachedVertexFetchFunction *)0x180197E00000001;
    *(_QWORD *)&retstr->var8.var0[16] = -1;
    *((_QWORD *)&retstr->var8 + 3) = -1;
    *(_QWORD *)(&retstr->var9.var0 + 1) = -1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)coreAttributeNames
{
  if (qword_254104548 != -1)
    dispatch_once(&qword_254104548, &__block_literal_global_3);
  return (NSArray *)(id)_MergedGlobals_106;
}

void __42__REMeshPartDescriptor_coreAttributeNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexPosition");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexUV", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexNormal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexBitangent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_106;
  _MergedGlobals_106 = v5;

}

- (REMeshPartDescriptor)initWithName:(__n128)a3 vertexCount:(__n128)a4 indexCount:(__n128)a5 instanceCount:(__n128)a6 attributes:(__n128)a7 materialIndex:(uint64_t)a8 boundingBoxMin:(void *)a9 boundingBoxMax:(unsigned int)a10 doubleSidedFlag:(unsigned int)a11 windingOrderIsCCW:(unsigned int)a12 transform:(void *)a13 preSplitVertexCount:(unsigned int)a14 patchCount:(unsigned __int8)a15
{
  REMeshPartDescriptor *v24;
  uint64_t v25;
  NSString *name;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  re *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDictionary *customAttributes;
  REMeshPartDescriptor *v42;
  NSObject *v44;
  unsigned int v45;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  uint8_t v59[128];
  uint8_t buf[4];
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v52 = a9;
  v53 = a13;
  v58.receiver = a1;
  v58.super_class = (Class)REMeshPartDescriptor;
  v24 = -[REMeshPartDescriptor init](&v58, sel_init);
  if (!v24)
  {
LABEL_18:
    v42 = v24;
    goto LABEL_19;
  }
  v25 = objc_msgSend(v52, "copy");
  v45 = a14;
  name = v24->_name;
  v24->_name = (NSString *)v25;

  v27 = (void *)objc_msgSend(v53, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "indexTriangles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v24->_indexPayloadOffset = 0;
  v24->_indexCount = 0;
  v24->_isIndexed = 0;
  v24->_indexType = 0;
  if (!v29)
  {
LABEL_8:
    v24->_vertexCount = a10;
    v24->_instanceCount = a12;
    v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    +[REMeshPartDescriptor coreAttributeNames](REMeshPartDescriptor, "coreAttributeNames");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(v34);
          v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v35);
    }

    objc_storeStrong((id *)&v24->_coreAttributes, v33);
    v40 = objc_msgSend(v27, "copy");
    customAttributes = v24->_customAttributes;
    v24->_customAttributes = (NSDictionary *)v40;

    v24->_materialIndex = v45;
    *(__n128 *)v24->_boundingBoxMin = a2;
    *(__n128 *)v24->_boundingBoxMax = a3;
    v24->_doubleSidedFlag = a15;
    v24->_windingOrderIsCCW = a16;
    *(__n128 *)&v24[1].super.isa = a4;
    *(__n128 *)&v24[1]._indexCount = a5;
    *(__n128 *)&v24[1]._instanceCount = a6;
    *(__n128 *)&v24[1]._indexType = a7;
    v24->_preSplitVertexCount = a17;
    v24->_patchCount = a18;

    goto LABEL_18;
  }
  v30 = objc_msgSend(v29, "format");
  v31 = (re *)objc_msgSend(v29, "payloadOffset");
  v24->_indexPayloadOffset = v31;
  v24->_indexCount = a11;
  v24->_isIndexed = 1;
  if (v30 == 36)
  {
    v32 = 1;
    goto LABEL_7;
  }
  if (v30 == 49)
  {
    v32 = 0;
LABEL_7:
    v24->_indexType = v32;
    goto LABEL_8;
  }
  v44 = *re::assetTypesLogObjects(v31);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    v61 = v30;
    _os_log_fault_impl(&dword_224FE9000, v44, OS_LOG_TYPE_FAULT, "Unknown MTLVertexFormat (%d) for index buffer", buf, 8u);
  }

  v42 = 0;
LABEL_19:

  return v42;
}

- (REMeshPartDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *coreAttributes;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *customAttributes;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  _BOOL4 v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;
  __int128 *v36;
  NSString *v37;
  __int128 v38;
  __int128 v39;
  float v40;
  _BOOL4 v41;
  __int128 v42;
  _BOOL4 v43;
  __int128 v44;
  _BOOL4 v45;
  _BOOL4 v46;
  _BOOL4 v47;
  float v48;
  _BOOL4 v49;
  float v50;
  _BOOL4 v51;
  float v52;
  int v53;
  REMeshPartDescriptor *v54;
  void *v55;
  NSString *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  v57 = self->_name;
  v59 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vertexCount"));
  self->_vertexCount = v59;
  v58 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("instanceCount"));
  self->_instanceCount = v58;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preSplitVertexCount"));
  self->_preSplitVertexCount = v7;
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("patchCount"));
  self->_patchCount = v8;
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("coreAttributes"));
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  coreAttributes = self->_coreAttributes;
  self->_coreAttributes = v13;

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("customAttributes"));
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  customAttributes = self->_customAttributes;
  self->_customAttributes = v19;

  v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("indexPayloadOffset"));
  self->_indexPayloadOffset = v21;
  v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("indexCount"));
  self->_indexCount = v22;
  self->_isIndexed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIndexed"));
  v23 = validateMTLIndexType((re *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("indexType")), (MTLIndexType *)&self->_indexType);
  if (v57)
    v24 = v23;
  else
    v24 = 0;
  v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("materialIndex"));
  *(_QWORD *)self->_boundingBoxMin = 0;
  self->_materialIndex = v25;
  v26 = (v25 | v21 | v22 | v8 | v7 | v58 | (unint64_t)v59) >> 32 != 0;
  *(_QWORD *)&self->_boundingBoxMin[8] = 0;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.x"));
  *(_DWORD *)self->_boundingBoxMin = v27;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.y"));
  *(_DWORD *)&self->_boundingBoxMin[4] = v28;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.z"));
  *(_QWORD *)self->_boundingBoxMax = 0;
  *(_DWORD *)&self->_boundingBoxMin[8] = v29;
  *(_QWORD *)&self->_boundingBoxMax[8] = 0;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.x"));
  *(_DWORD *)self->_boundingBoxMax = v30;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.y"));
  *(_DWORD *)&self->_boundingBoxMax[4] = v31;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.z"));
  *(_DWORD *)&self->_boundingBoxMax[8] = v32;
  v33 = validateMeshPartOptionalFlag((re *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("doubleSidedFlag")), (char *)&self->_doubleSidedFlag);
  v34 = validateMeshPartOptionalFlag((re *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("windingOrderIsCCW")), (char *)&self->_windingOrderIsCCW);
  v60 = 0;
  v35 = objc_retainAutorelease(v4);
  v36 = (__int128 *)objc_msgSend(v35, "decodeBytesForKey:returnedLength:", CFSTR("transform"), &v60);
  if (v60 != 64)
  {
    if (!v26)
    {
LABEL_40:
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "failWithError:", v55);
LABEL_43:

      v54 = 0;
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  v38 = *v36;
  v39 = v36[1];
  LODWORD(v40) = HIDWORD(*v36);
  v41 = (*v36 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v38) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v38) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (LODWORD(v40) & 0x7FFFFFFFu) < 0x7F800000;
  v42 = v36[2];
  v43 = (v39 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v39) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v39) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v39) & 0x7FFFFFFFu) < 0x7F800000;
  v44 = v36[3];
  v45 = (v42 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v42) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v42) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v42) & 0x7FFFFFFFu) < 0x7F800000;
  v46 = (v44 & 0x7FFFFFFF) <= 0x7F7FFFFF
     && (DWORD1(v44) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (DWORD2(v44) & 0x7FFFFFFFu) <= 0x7F7FFFFF
     && (HIDWORD(v44) & 0x7FFFFFFFu) < 0x7F800000;
  v47 = v40 == 0.0;
  v48 = fabsf(v40);
  if (v48 < (float)((float)(v48 + 1.0) * 0.00001))
    v47 = 1;
  v49 = *((float *)&v39 + 3) == 0.0;
  v50 = fabsf(*((float *)&v39 + 3));
  if (v50 < (float)((float)(v50 + 1.0) * 0.00001))
    v49 = 1;
  v51 = *((float *)&v42 + 3) == 0.0;
  v52 = fabsf(*((float *)&v42 + 3));
  if (v52 < (float)((float)(v52 + 1.0) * 0.00001))
    v51 = 1;
  if (*((float *)&v44 + 3) != 1.0
    && fabsf(*((float *)&v44 + 3) + -1.0) >= (float)((float)((float)(fabsf(*((float *)&v44 + 3)) + 1.0) + 1.0) * 0.00001))
  {
    v51 = 0;
  }
  if (v51 && v49 && v47 && v46 && v45 && v43 && v41)
  {
    *(_OWORD *)&self[1].super.isa = v38;
    *(_OWORD *)&self[1]._indexCount = v39;
    v53 = v34 && v33;
    *(_OWORD *)&self[1]._instanceCount = v42;
    *(_OWORD *)&self[1]._indexType = v44;
    if (!v26)
      goto LABEL_38;
LABEL_42:
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "failWithError:", v55);
    goto LABEL_43;
  }
  v53 = 0;
  *(_OWORD *)&self[1]._instanceCount = 0u;
  *(_OWORD *)&self[1]._indexType = 0u;
  *(_OWORD *)&self[1].super.isa = 0u;
  *(_OWORD *)&self[1]._indexCount = 0u;
  if (v26)
    goto LABEL_42;
LABEL_38:
  if ((v53 & v24 & 1) == 0)
    goto LABEL_40;
  v54 = self;
LABEL_44:

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_vertexCount, CFSTR("vertexCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_instanceCount, CFSTR("instanceCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_preSplitVertexCount, CFSTR("preSplitVertexCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_patchCount, CFSTR("patchCount"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_coreAttributes, CFSTR("coreAttributes"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_customAttributes, CFSTR("customAttributes"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_indexPayloadOffset, CFSTR("indexPayloadOffset"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_indexCount, CFSTR("indexCount"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_isIndexed, CFSTR("isIndexed"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_indexType, CFSTR("indexType"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_materialIndex, CFSTR("materialIndex"));
  LODWORD(v4) = *(_DWORD *)self->_boundingBoxMin;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.x"), v4);
  LODWORD(v5) = *(_DWORD *)&self->_boundingBoxMin[4];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.y"), v5);
  LODWORD(v6) = *(_DWORD *)&self->_boundingBoxMin[8];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.z"), v6);
  LODWORD(v7) = *(_DWORD *)self->_boundingBoxMax;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.x"), v7);
  LODWORD(v8) = *(_DWORD *)&self->_boundingBoxMax[4];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.y"), v8);
  LODWORD(v9) = *(_DWORD *)&self->_boundingBoxMax[8];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.z"), v9);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_doubleSidedFlag, CFSTR("doubleSidedFlag"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_windingOrderIsCCW, CFSTR("windingOrderIsCCW"));
  objc_msgSend(v10, "encodeBytes:length:forKey:", &self[1], 64, CFSTR("transform"));

}

- (BOOL)validateAttribute:(id)a3 withName:(id)a4 payloadSize:(FixedInlineArray<unsigned)long required:(8UL> *)a5 error:(BOOL)a6
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  _anonymous_namespace_ *v15;
  const re::StringID *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  unsigned int v21;
  unsigned int patchCount;
  BOOL v23;
  BOOL result;
  uint64_t v25;
  void *v26;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (!v12)
  {
    if (!v8)
      goto LABEL_15;
    goto LABEL_18;
  }
  v15 = (_anonymous_namespace_ *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  v25 = 0;
  v26 = &str_110;
  v17 = re::bufferIdentifierForMeshAttribute((re *)&v25, v16);
  re::StringID::destroyString((re::StringID *)&v25);
  if (v17 < 8)
  {
    if ((objc_msgSend(v12, "validateWithPayloadSize:error:", a5->var0[v17], a7) & 1) != 0)
    {
      v19 = objc_msgSend(v12, "stepFunction");
      if (v19 == 3)
      {
        v21 = objc_msgSend(v12, "count");
        patchCount = self->_patchCount;
      }
      else
      {
        if (v19 != 1)
        {
          if (v19)
          {
            v20 = CFSTR("REMeshAttributeDescriptor: unsupported vertex step function");
            goto LABEL_17;
          }
          if (!objc_msgSend(v12, "count"))
          {
            v20 = CFSTR("REMeshAttributeDescriptor: vertex count is 0");
LABEL_17:
            goto LABEL_18;
          }
          goto LABEL_15;
        }
        v21 = objc_msgSend(v12, "count");
        patchCount = self->_vertexCount;
      }
      if (v21 < patchCount)
      {
        v20 = CFSTR("REMeshAttributeDescriptor: attribute buffer is too small");
        goto LABEL_17;
      }
LABEL_15:
      v23 = 1;
LABEL_19:

      return v23;
    }
LABEL_18:
    v23 = 0;
    goto LABEL_19;
  }
  re::internal::assertLog((re::internal *)6, v18, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < N", "operator[]", 234, v17, 8, v25, v26);
  result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4
{
  unint64_t indexPayloadOffset;
  unint64_t v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  id obj;
  NSDictionary *obja;
  _OWORD v35[4];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (self->_isIndexed)
  {
    if (self->_indexCount == -1)
    {
      v9 = CFSTR("REMeshPartDescriptor: index count is UINT32_MAX");
      goto LABEL_12;
    }
    indexPayloadOffset = self->_indexPayloadOffset;
    v7 = -[REMeshPartDescriptor indexBufferSize](self, "indexBufferSize");
    if (__CFADD__(indexPayloadOffset, v7)
      || (v8 = *((_QWORD *)a3 + 4), v8 <= indexPayloadOffset)
      || indexPayloadOffset + v7 > v8)
    {
      v9 = CFSTR("REMeshPartDescriptor: index buffer payload range is invalid");
      goto LABEL_12;
    }
  }
  if (self->_vertexCount + 1 <= 1)
  {
    v9 = CFSTR("REMeshPartDescriptor: vertex count must be between 1 and UINT32_MAX");
LABEL_12:
    return 0;
  }
  if (self->_instanceCount + 1 <= 1)
  {
    v9 = CFSTR("REMeshPartDescriptor: instance count must be between 1 and UINT32_MAX");
    goto LABEL_12;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[REMeshPartDescriptor coreAttributeNames](REMeshPartDescriptor, "coreAttributeNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v42;
    LOBYTE(v13) = 1;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "vertexPosition");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v13)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_coreAttributes, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *((_OWORD *)a3 + 1);
          v40[0] = *(_OWORD *)a3;
          v40[1] = v19;
          v20 = *((_OWORD *)a3 + 3);
          v40[2] = *((_OWORD *)a3 + 2);
          v40[3] = v20;
          v13 = -[REMeshPartDescriptor validateAttribute:withName:payloadSize:required:error:](self, "validateAttribute:withName:payloadSize:required:error:", v18, v15, v40, v17, a4);

        }
        else
        {
          v13 = 0;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 1;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obja = self->_customAttributes;
  v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obja);
        v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        +[REMeshPartDescriptor coreAttributeNames](REMeshPartDescriptor, "coreAttributeNames");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsObject:", v24);

        if ((v26 & v13) == 1)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("REMeshPartDescriptor: custom attribute %@ is also in core attributes list"), v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0;
        }
        else
        {
          v28 = (v26 ^ 1) & v13;
        }
        -[NSDictionary objectForKeyedSubscript:](self->_customAttributes, "objectForKeyedSubscript:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v30 = *((_OWORD *)a3 + 1);
          v35[0] = *(_OWORD *)a3;
          v35[1] = v30;
          v31 = *((_OWORD *)a3 + 3);
          v35[2] = *((_OWORD *)a3 + 2);
          v35[3] = v31;
          v13 = -[REMeshPartDescriptor validateAttribute:withName:payloadSize:required:error:](self, "validateAttribute:withName:payloadSize:required:error:", v29, v24, v35, 1, a4);
        }
        else
        {
          v13 = 0;
        }

      }
      v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v21);
  }

  if (!v13)
    return 0;
  if (self->_materialIndex >= 0xFFFF)
  {
    return 0;
  }
  return 1;
}

- (unint64_t)indexBufferSize
{
  unint64_t indexType;
  unsigned int v3;
  unint64_t result;

  indexType = self->_indexType;
  if (!indexType)
  {
    v3 = 2;
    return v3 * (unint64_t)self->_indexCount;
  }
  if (indexType == 1)
  {
    v3 = 4;
    return v3 * (unint64_t)self->_indexCount;
  }
  re::internal::assertLog((re::internal *)5, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) Invalid index type: %d", "false", "-[REMeshPartDescriptor indexBufferSize]", 685, self->_indexType);
  result = _os_crash();
  __break(1u);
  return result;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  objc_class *v5;
  size_t v6;
  NSString *name;
  uint64_t v8;
  objc_class *v9;
  size_t v10;
  NSDictionary *coreAttributes;
  uint64_t v12;
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  size_t v27;
  NSDictionary *customAttributes;
  uint64_t v29;
  NSUInteger v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  if (self->_name
    && (v5 = (objc_class *)objc_opt_class(), v6 = class_getInstanceSize(v5),
                                             name = self->_name,
                                             InstanceSize += v6,
                                             name))
  {
    v8 = -[NSString lengthOfBytesUsingEncoding:](name, "lengthOfBytesUsingEncoding:", 4) + 1;
  }
  else
  {
    v8 = 0;
  }
  if (self->_coreAttributes)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = class_getInstanceSize(v9);
    coreAttributes = self->_coreAttributes;
  }
  else
  {
    coreAttributes = 0;
    v10 = 0;
  }
  v12 = -[NSDictionary count](coreAttributes, "count");
  v13 = -[NSDictionary count](self->_coreAttributes, "count");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[NSDictionary allKeys](self->_coreAttributes, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  v16 = v8 + InstanceSize + v10 + 8 * v12 + 8 * v13;
  if (v15)
  {
    v17 = *(_QWORD *)v57;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v18);
        if (v19)
        {
          v20 = (objc_class *)objc_opt_class();
          v16 += class_getInstanceSize(v20);
          v21 = objc_msgSend(v19, "lengthOfBytesUsingEncoding:", 4) + 1;
        }
        else
        {
          v21 = 0;
        }
        v16 += v21;
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v15);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[NSDictionary allValues](self->_coreAttributes, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v53;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(v22);
        v16 += objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v25++), "estimateContainerSize");
      }
      while (v23 != v25);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v23);
  }

  if (self->_customAttributes)
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = class_getInstanceSize(v26);
    customAttributes = self->_customAttributes;
  }
  else
  {
    customAttributes = 0;
    v27 = 0;
  }
  v29 = -[NSDictionary count](customAttributes, "count");
  v30 = -[NSDictionary count](self->_customAttributes, "count");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NSDictionary allKeys](self->_customAttributes, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  v33 = v27 + v16 + 8 * v29 + 8 * v30;
  if (v32)
  {
    v34 = *(_QWORD *)v49;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v35);
        if (v36)
        {
          v37 = (objc_class *)objc_opt_class();
          v33 += class_getInstanceSize(v37);
          v38 = objc_msgSend(v36, "lengthOfBytesUsingEncoding:", 4) + 1;
        }
        else
        {
          v38 = 0;
        }
        v33 += v38;
        ++v35;
      }
      while (v32 != v35);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v32);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSDictionary allValues](self->_customAttributes, "allValues", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v45;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v45 != v41)
          objc_enumerationMutation(v39);
        v33 += objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v42++), "estimateContainerSize");
      }
      while (v40 != v42);
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v40);
  }

  return v33;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)indexPayloadOffset
{
  return self->_indexPayloadOffset;
}

- (unsigned)indexCount
{
  return self->_indexCount;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (unsigned)vertexCount
{
  return self->_vertexCount;
}

- (NSDictionary)coreAttributes
{
  return self->_coreAttributes;
}

- (NSDictionary)customAttributes
{
  return self->_customAttributes;
}

- (unsigned)preSplitVertexCount
{
  return self->_preSplitVertexCount;
}

- (unsigned)patchCount
{
  return self->_patchCount;
}

- (unsigned)instanceCount
{
  return self->_instanceCount;
}

- (unsigned)materialIndex
{
  return self->_materialIndex;
}

- (__n128)boundingBoxMin
{
  return a1[5];
}

- (__n128)boundingBoxMax
{
  return a1[6];
}

- (unsigned)doubleSidedFlag
{
  return self->_doubleSidedFlag;
}

- (unsigned)windingOrderIsCCW
{
  return self->_windingOrderIsCCW;
}

- (__n128)transform
{
  return a1[7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_coreAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
