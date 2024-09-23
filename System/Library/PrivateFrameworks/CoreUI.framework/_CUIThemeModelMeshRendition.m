@implementation _CUIThemeModelMeshRendition

- (id)initForArchiving:(id)a3 withSubmeshRenditionKeys:(id)a4
{
  _CUIThemeModelMeshRendition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CUIThemeModelMeshRendition;
  v6 = -[_CUIThemeModelMeshRendition init](&v8, sel_init);
  if (v6)
  {
    v6->_mesh = (MDLMesh *)a3;
    v6->_submeshKeys = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelMeshRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id *v6;
  char *v7;
  char *v8;
  int v9;
  id v10;
  unsigned int *v11;
  NSMutableArray *v12;
  id *v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  unint64_t v20;
  id v21;
  unsigned int v22;
  id v23;
  NSMutableArray *v24;
  unint64_t v25;
  CUIMeshBuffer *v26;
  unint64_t v27;
  uint64_t v28;
  CUIRenditionKey *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _OWORD v43[6];

  v41.receiver = self;
  v41.super_class = (Class)_CUIThemeModelMeshRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v41, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (v6)
  {
    memset(v43, 0, 92);
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    v9 = *((_DWORD *)v7 + 45);
    v8 = v7 + 180;
    if (v9 != 1297040461)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeModelMeshRendition.m"), 102, CFSTR("CoreUI: Expecting a kCSIModelMeshSignature but didn't find it"));
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v8 + 52, *((unsigned int *)v8 + 2), 4);
    objc_msgSend(v6, "setName:", v10);

    v11 = (unsigned int *)&v8[*((unsigned int *)v8 + 2) + 52];
    v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", *((unsigned int *)v8 + 5));
    if (*(_QWORD *)(v8 + 20))
    {
      v13 = v6;
      v14 = 0;
      do
      {
        v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v11 + 8, v11[7], 4);
        v16 = objc_msgSend(objc_alloc((Class)getMDLVertexAttributeClass[0]()), "initWithName:format:offset:bufferIndex:", v15, *(_QWORD *)v11, v11[4], v11[6]);
        -[NSMutableArray addObject:](v12, "addObject:", v16);

        v11 = (unsigned int *)((char *)v11 + v11[7] + *((_QWORD *)v11 + 1) * *(_QWORD *)(v8 + 12) + 32);
        ++v14;
      }
      while (v14 < *(_QWORD *)(v8 + 20));
      v17 = *(_QWORD *)(v8 + 20);
      v6 = v13;
    }
    else
    {
      v17 = 0;
    }
    v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v17);
    if (*(_QWORD *)(v8 + 28))
    {
      v19 = v18;
      v20 = 0;
      do
      {
        v21 = objc_alloc((Class)getMDLVertexBufferLayoutClass[0]());
        v22 = *v11;
        v11 += 2;
        v23 = objc_msgSend(v21, "initWithStride:", v22);
        -[NSMutableArray addObject:](v19, "addObject:", v23);

        ++v20;
      }
      while (v20 < *(_QWORD *)(v8 + 28));
    }
    v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", *((unsigned int *)v8 + 9));
    if (*(_QWORD *)(v8 + 36))
    {
      v25 = 0;
      do
      {
        v26 = -[CUIMeshBuffer initWithBytes:andLength:ofType:]([CUIMeshBuffer alloc], "initWithBytes:andLength:ofType:", v11 + 2, *v11, 1);
        -[NSMutableArray addObject:](v24, "addObject:", v26);

        v11 = (unsigned int *)((char *)v11 + *(_QWORD *)v11 + 8);
        ++v25;
      }
      while (v25 < *(_QWORD *)(v8 + 36));
    }
    v6[28] = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((unsigned int *)v8 + 11));
    if (*(_QWORD *)(v8 + 44))
    {
      v27 = 0;
      do
      {
        if (*v11 >= 0x58)
          v28 = 88;
        else
          v28 = *v11;
        __memcpy_chk(v43, v11 + 1, v28, 92);
        v29 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v43);
        objc_msgSend(v6[28], "addObject:", v29);

        v11 = (unsigned int *)((char *)v11 + *v11 + 4);
        ++v27;
      }
      while (v27 < *(_QWORD *)(v8 + 44));
    }
    v30 = objc_alloc_init(getMDLVertexDescriptorClass());
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v12);
          objc_msgSend(v30, "addOrReplaceAttribute:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i));
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v32);
    }
    v35 = objc_alloc_init((Class)NSArray);
    v6[27] = objc_msgSend(objc_alloc((Class)getMDLMeshClass[0]()), "initWithVertexBuffers:vertexCount:descriptor:submeshes:", v24, *((unsigned int *)v8 + 3), v30, v35);
    objc_msgSend(v6[27], "setName:", objc_msgSend(v6, "name"));

  }
  return v6;
}

- (NSArray)submeshKeys
{
  return &self->_submeshKeys->super;
}

- (id)modelMesh
{
  return self->_mesh;
}

- (unint64_t)writeToData:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  MDLVertexAttributeData *v11;
  id v12;
  NSData *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *j;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  NSArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *m;
  void *v33;
  NSMutableArray *submeshKeys;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  id v39;
  id v41;
  uint64_t v42;
  id v43;
  NSMutableArray *obj;
  NSUInteger v45;
  _CUIThemeModelMeshRendition *v46;
  id v47;
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
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  NSUInteger v73;
  uint64_t v74;
  uint64_t v75;
  NSUInteger v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];

  v70 = 0;
  v41 = objc_msgSend(a3, "length");
  v47 = objc_alloc_init((Class)NSMutableArray);
  v71 = 0x14D4F444DLL;
  v45 = -[MDLMesh vertexCount](self->_mesh, "vertexCount");
  v73 = v45;
  v75 = 0;
  v74 = 0;
  v76 = -[NSArray count](-[MDLMesh vertexBuffers](self->_mesh, "vertexBuffers"), "count");
  v77 = -[NSMutableArray count](self->_submeshKeys, "count");
  v43 = -[MDLMesh name](self->_mesh, "name");
  v72 = objc_msgSend(v43, "length");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v46 = self;
  obj = -[MDLVertexDescriptor attributes](-[MDLMesh vertexDescriptor](self->_mesh, "vertexDescriptor"), "attributes");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v11 = -[MDLMesh vertexAttributeDataForAttributeNamed:](v46->_mesh, "vertexAttributeDataForAttributeNamed:", objc_msgSend(v10, "name", v41));
        if (-[MDLVertexAttributeData format](v11, "format"))
        {
          v64 = 0u;
          v65 = 0u;
          v12 = +[NSMutableData data](NSMutableData, "data");
          v13 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", -[MDLVertexAttributeData dataStart](v11, "dataStart"), -[MDLVertexAttributeData stride](v11, "stride") * v45);
          *(_QWORD *)&v64 = -[MDLVertexAttributeData format](v11, "format");
          *((_QWORD *)&v64 + 1) = -[MDLVertexAttributeData stride](v11, "stride");
          *(_QWORD *)&v65 = objc_msgSend(v10, "offset");
          DWORD2(v65) = objc_msgSend(v10, "bufferIndex");
          HIDWORD(v65) = objc_msgSend(objc_msgSend(v10, "name"), "length");
          objc_msgSend(v12, "appendBytes:length:", &v64, 32);
          v14 = objc_msgSend(objc_msgSend(v10, "name"), "UTF8String");
          objc_msgSend(v12, "appendBytes:length:", v14, HIDWORD(v65));
          objc_msgSend(v12, "appendData:", v13);
          objc_msgSend(v47, "addObject:", v12);
          v74 = ++v7;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v6);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v15 = -[MDLVertexDescriptor layouts](-[MDLMesh vertexDescriptor](v46->_mesh, "vertexDescriptor", v41), "layouts");
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v21, "stride"))
        {
          *(_QWORD *)&v64 = 0;
          v22 = +[NSMutableData data](NSMutableData, "data");
          *(_QWORD *)&v64 = objc_msgSend(v21, "stride");
          objc_msgSend(v22, "appendBytes:length:", &v64, 8);
          objc_msgSend(v47, "addObject:", v22);
          v75 = ++v18;
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v17);
  }
  objc_msgSend(a3, "appendBytes:length:", &v71, 52);
  v23 = objc_msgSend(v43, "UTF8String");
  objc_msgSend(a3, "appendBytes:length:", v23, v72);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v24 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(v47);
        objc_msgSend(a3, "appendData:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k));
      }
      v25 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
    }
    while (v25);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v28 = -[MDLMesh vertexBuffers](v46->_mesh, "vertexBuffers");
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v52, v79, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v53;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)m);
        *(_QWORD *)&v64 = 0;
        *(_QWORD *)&v64 = objc_msgSend(v33, "length");
        objc_msgSend(a3, "appendBytes:length:", &v64, 8);
        objc_msgSend(a3, "appendData:", objc_msgSend(v33, "data"));
      }
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v52, v79, 16);
    }
    while (v30);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  submeshKeys = v46->_submeshKeys;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](submeshKeys, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v49;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(submeshKeys);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)n), "keyList");
        v70 = 4 * CUIRenditionKeyTokenCount((uint64_t)v39) + 4;
        objc_msgSend(a3, "appendBytes:length:", &v70, 4);
        objc_msgSend(a3, "appendBytes:length:", v39, v70);
      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](submeshKeys, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
    }
    while (v36);
  }

  return (unint64_t)objc_msgSend(a3, "length") - v42;
}

@end
