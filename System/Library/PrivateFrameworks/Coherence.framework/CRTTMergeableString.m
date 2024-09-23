@implementation CRTTMergeableString

- (id)attributedString
{
  return self->_attributedString;
}

- (id).cxx_construct
{
  self->_orderedSubstrings.__begin_ = 0;
  self->_orderedSubstrings.__end_ = 0;
  self->_orderedSubstrings.__end_cap_.__value_ = 0;
  self->_replica.index = 0;
  uuid_clear(self->_replica.uuid);
  return self;
}

- (CRTTMergeableString)initWithDecoder:(id)a3 error:(id *)a4
{
  void *v6;
  CRTTMergeableString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  CRTTMergeableString *v45;
  CRTTMergeableString *v46;
  uint64_t v48;
  unsigned int v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *__p;
  uint64_t *v58;
  uint64_t *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:](self, "initWithStorage:uuid:createInitialNodes:", 0, v6, 0);

  if (!v7)
    goto LABEL_55;
  objc_msgSend(v50, "storageWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTTMergeableString setAttributedString:](v7, "setAttributedString:", v8);

  -[CRTTMergeableString attributedString](v7, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString setRenameGeneration:](v7, "setRenameGeneration:", objc_msgSend(v10, "generation"));

    -[CRTTMergeableString invalidateCache](v7, "invalidateCache");
    __p = 0;
    v58 = 0;
    v48 = objc_msgSend(v50, "substringCount");
    v11 = v48;
    v59 = 0;
    std::vector<TopoSubstring *>::reserve(&__p, v48);
    if ((_DWORD)v48)
    {
      v12 = 0;
      do
      {
        v13 = operator new();
        *(_DWORD *)(v13 + 16) = 0;
        uuid_clear((unsigned __int8 *)v13);
        *(_DWORD *)(v13 + 20) = 0;
        *(_OWORD *)(v13 + 32) = 0u;
        *(_OWORD *)(v13 + 48) = 0u;
        *(_OWORD *)(v13 + 64) = 0u;
        *(_DWORD *)(v13 + 80) = 0;
        v14 = v58;
        if (v58 >= v59)
        {
          v16 = ((char *)v58 - (_BYTE *)__p) >> 3;
          if ((unint64_t)(v16 + 1) >> 61)
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          v17 = ((char *)v59 - (_BYTE *)__p) >> 2;
          if (v17 <= v16 + 1)
            v17 = v16 + 1;
          if ((unint64_t)((char *)v59 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
            v18 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)&v59, v18);
          else
            v19 = 0;
          v20 = (uint64_t *)&v19[8 * v16];
          *v20 = v13;
          v15 = v20 + 1;
          v22 = (char *)__p;
          v21 = (char *)v58;
          if (v58 != __p)
          {
            do
            {
              v23 = *((_QWORD *)v21 - 1);
              v21 -= 8;
              *--v20 = v23;
            }
            while (v21 != v22);
            v21 = (char *)__p;
          }
          __p = v20;
          v58 = v15;
          v59 = (uint64_t *)&v19[8 * v18];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *v58 = v13;
          v15 = v14 + 1;
        }
        v58 = v15;
        ++v12;
      }
      while (v12 != v48);
    }
    objc_msgSend(v50, "versionWithError:", a4, v48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString setVersion:](v7, "setVersion:", v24);

    objc_msgSend(v50, "addedByVersionWithError:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString setAddedByVersion:](v7, "setAddedByVersion:", v25);

    -[CRTTMergeableString version](v7, "version");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26
      || (-[CRTTMergeableString addedByVersion](v7, "addedByVersion"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = v27 == 0,
          v27,
          v26,
          v28))
    {
      v39 = 1;
      v38 = 1;
    }
    else
    {
      -[CRTTMergeableString version](v7, "version");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sortedUUIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v54 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v35) = objc_msgSend(v35, "isEqual:", v36);

            if ((v35 & 1) != 0)
            {

              v51 = 0;
              v52 = 0;
              goto LABEL_37;
            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          if (v32)
            continue;
          break;
        }
      }

      v51 = 0;
      v52 = 0;
      -[CRTTMergeableString attributedString](v7, "attributedString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = decodeSubstrings(v49, objc_msgSend(v37, "length"), v50, (uint64_t *)&__p, &v52, &v51, (uint64_t)a4);

      if (!v52 || !v51)
      {
LABEL_37:
        NSLog(CFSTR("Corrupt mergeable string, must have start and end."));
        v38 = 0;
      }
      -[CRTTMergeableString setStartNode:](v7, "setStartNode:");
      -[CRTTMergeableString setEndNode:](v7, "setEndNode:", v51);
      if (!v38)
      {
        -[CRTTMergeableString setStartNode:](v7, "setStartNode:", 0);
        if (v11)
        {
          v40 = 0;
          v41 = 8 * v11;
          do
          {
            v42 = *(_QWORD **)((char *)__p + v40);
            if (v42)
            {
              v43 = (void *)v42[7];
              if (v43)
              {
                v42[8] = v43;
                operator delete(v43);
              }
              v44 = (void *)v42[4];
              if (v44)
              {
                v42[5] = v44;
                operator delete(v44);
              }
              MEMORY[0x1C3B7D750](v42, 0x10A0C409FE6E197);
            }
            v40 += 8;
          }
          while (v41 != v40);
        }
      }

      v39 = 0;
    }
    if (__p)
    {
      v58 = (uint64_t *)__p;
      operator delete(__p);
    }
    if ((v39 & 1) == 0)
    {
      if (!v38)
      {
        v46 = 0;
LABEL_56:
        v45 = v46;
        goto LABEL_57;
      }
LABEL_55:
      v46 = v7;
      goto LABEL_56;
    }
  }
  v45 = 0;
LABEL_57:

  return v45;
}

- (ObjCVersion)version
{
  return self->_version;
}

- (id)temporaryNamesExcludingSelf:(BOOL)a3
{
  _BOOL4 v3;
  ObjCVersion *v5;
  const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) **v6;
  const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *v7;
  unsigned __int8 *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *v20;
  ObjCRenameSequence *v21;
  TopoReplica v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(ObjCRenameSequence);
  v5 = objc_alloc_init(ObjCVersion);
  v6 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v7 = *v6;
  v20 = v6[1];
  if (*v6 != v20)
  {
    do
    {
      v8 = (unsigned __int8 *)*v7;
      v9 = *((_DWORD *)*v7 + 4);
      if (v9 && (!v3 || v9 != self->_replica.index || uuid_compare(*v7, self->_replica.uuid)))
      {
        TopoReplica::objc((TopoReplica *)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ObjCRenameSequence addWithReplica:range:](v21, "addWithReplica:range:", v10, *((unsigned int *)v8 + 5), *((unsigned int *)v8 + 6));

      }
      v12 = *((_QWORD *)v8 + 4);
      v11 = *((_QWORD *)v8 + 5);
      while (v12 != v11)
      {
        if (*(_DWORD *)(v12 + 16))
        {
          if (!v3
            || (TopoReplica::TopoReplica(&v22, self->_addedByReplica), *(_DWORD *)(v12 + 16) != v22.index)
            || uuid_compare((const unsigned __int8 *)v12, v22.uuid))
          {
            TopoReplica::objc((TopoReplica *)v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(unsigned int *)(v12 + 20);
            v15 = *((unsigned int *)v8 + 6);
            -[ObjCRenameSequence addAddedByReplica:range:](v21, "addAddedByReplica:range:", v13, v14, v15);
            -[ObjCVersion insertWithRange:replica:](v5, "insertWithRange:replica:", v14, v15, v13);

          }
        }
        v12 += 24;
      }
      ++v7;
    }
    while (v7 != v20);
  }
  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CRTTMergeableString replica](self, "replica");
    TopoReplica::objc(&v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v16, "temporaryComponentsWithExcluding:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)

  objc_msgSend(v18, "subtract:", v5);
  -[ObjCRenameSequence addAddedByVersion:](v21, "addAddedByVersion:", v18);

  return v21;
}

- (ObjCVersion)addedByVersion
{
  return self->_addedByVersion;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)setStartNode:(void *)a3
{
  self->_startNode = a3;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (void)setEndNode:(void *)a3
{
  self->_endNode = a3;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong(&self->_attributedString, a3);
}

- (void)setAddedByVersion:(id)a3
{
  objc_storeStrong((id *)&self->_addedByVersion, a3);
}

- (void)orderedSubstrings
{
  CRTTMergeableString *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_cacheInvalid)
    -[CRTTMergeableString _updateCache](v2, "_updateCache");
  objc_sync_exit(v2);

  return &v2->_orderedSubstrings;
}

- (void)invalidateCache
{
  self->_cacheInvalid = 1;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
}

- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4 createInitialNodes:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  unsigned __int8 v11;
  CRTTMergeableString *v12;
  CRTTMergeableString *v13;
  id v14;
  NSUUID *v15;
  void *v16;
  ObjCReplica *v17;
  ObjCReplica *addedByReplica;
  uint64_t v19;
  NSUUID *v20;
  uint64_t v21;
  NSUUID *v22;
  ObjCVersion *v23;
  ObjCVersion *version;
  ObjCVersion *v25;
  ObjCVersion *addedByVersion;
  objc_super v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  TopoReplica __src;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if ((v11 & 1) == 0
  {
    -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:]::timestampMixUUID = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1B034831-9253-4675-A9D0-969AF8C447A3"));
  }
  v28.receiver = self;
  v28.super_class = (Class)CRTTMergeableString;
  v12 = -[CRTTMergeableString init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a4);
    v14 = +[CRGlobalContextObjC newObjCReplicaFor:](CRGlobalContextObjC, "newObjCReplicaFor:", v13->_uuid);
    objc_msgSend(v14, "uuid");
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    TopoReplica::TopoReplica(&__src, v15, objc_msgSend(v14, "index"));
    v13->_replica = __src;

    -[NSUUID CRTTxorWith:](v13->_uuid, "CRTTxorWith:", -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:]::timestampMixUUID);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[CRGlobalContextObjC newObjCReplicaFor:](CRGlobalContextObjC, "newObjCReplicaFor:", v16);
    addedByReplica = v13->_addedByReplica;
    v13->_addedByReplica = v17;

    if (v5)
    {
      v19 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
      v20 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      TopoReplica::TopoReplica((TopoReplica *)&v31, v20, 0);
      HIDWORD(v32) = 0;
      *(_DWORD *)(v19 + 16) = 0;
      uuid_clear((unsigned __int8 *)v19);
      *(_QWORD *)(v19 + 80) = 0;
      *(_OWORD *)(v19 + 48) = 0u;
      *(_OWORD *)(v19 + 64) = 0u;
      *(_OWORD *)(v19 + 32) = 0u;
      *(_OWORD *)v19 = v31;
      *(_QWORD *)(v19 + 16) = v32;
      *(_DWORD *)(v19 + 24) = 0;
      v13->_startNode = (void *)v19;

      v21 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
      v22 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      TopoReplica::TopoReplica((TopoReplica *)&v29, v22, 0);
      HIDWORD(v30) = -1;
      *(_DWORD *)(v21 + 16) = 0;
      uuid_clear((unsigned __int8 *)v21);
      *(_QWORD *)(v21 + 80) = 0;
      *(_OWORD *)(v21 + 48) = 0u;
      *(_OWORD *)(v21 + 64) = 0u;
      *(_OWORD *)(v21 + 32) = 0u;
      *(_OWORD *)v21 = v29;
      *(_QWORD *)(v21 + 16) = v30;
      *(_DWORD *)(v21 + 24) = 0;
      v13->_endNode = (void *)v21;

      *(_QWORD *)__src.uuid = v13->_endNode;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>((char *)v13->_startNode + 56, (char *)&__src, (uint64_t)&__src.uuid[8], 1uLL);
      *((_DWORD *)v13->_endNode + 20) = 1;
    }
    v23 = objc_alloc_init(ObjCVersion);
    version = v13->_version;
    v13->_version = v23;

    v25 = objc_alloc_init(ObjCVersion);
    addedByVersion = v13->_addedByVersion;
    v13->_addedByVersion = v25;

    v13->_cacheInvalid = 1;
    objc_storeStrong(&v13->_attributedString, a3);

  }
  return v13;
}

- (void)_updateCache
{
  vector<TopoSubstring *, std::allocator<TopoSubstring *>> *p_orderedSubstrings;
  void *startNode;
  _QWORD v5[5];

  p_orderedSubstrings = &self->_orderedSubstrings;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
  self->_cacheInvalid = 0;
  startNode = self->_startNode;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CRTTMergeableString__updateCache__block_invoke;
  v5[3] = &unk_1E775E088;
  v5[4] = self;
  traverseIterative((uint64_t)startNode, v5);
  if (((char *)self->_orderedSubstrings.__end_ - (char *)self->_orderedSubstrings.__begin_) >> 2 < (unint64_t)(self->_orderedSubstrings.__end_cap_.__value_ - self->_orderedSubstrings.__begin_))
    std::vector<TopoSubstring *>::shrink_to_fit((uint64_t)p_orderedSubstrings);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRTTMergeableString temporaryNamesExcludingSelf:](self, "temporaryNamesExcludingSelf:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRGlobalContextObjC releaseObjCSequence:](CRGlobalContextObjC, "releaseObjCSequence:", v3);

  -[CRTTMergeableString deleteAllSubstrings](self, "deleteAllSubstrings");
  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableString;
  -[CRTTMergeableString dealloc](&v4, sel_dealloc);
}

- (void)deleteAllSubstrings
{
  void *startNode;
  _QWORD *i;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)(uint64_t);
  _OWORD v13[2];
  uint64_t v14;
  int v15;

  v8 = 0;
  v9 = &v8;
  v10 = 0x5812000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  memset(v13, 0, sizeof(v13));
  v14 = 0;
  v15 = 1065353216;
  startNode = self->_startNode;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CRTTMergeableString_deleteAllSubstrings__block_invoke;
  v7[3] = &unk_1E775DFE8;
  v7[4] = &v8;
  traverseUnordered((uint64_t)startNode, v7);
  for (i = (_QWORD *)v9[8]; i; i = (_QWORD *)*i)
  {
    v4 = (_QWORD *)i[2];
    if (v4)
    {
      v5 = (void *)v4[7];
      if (v5)
      {
        v4[8] = v5;
        operator delete(v5);
      }
      v6 = (void *)v4[4];
      if (v6)
      {
        v4[5] = v6;
        operator delete(v6);
      }
      MEMORY[0x1C3B7D750](v4, 0x10A0C409FE6E197);
    }
  }
  _Block_object_dispose(&v8, 8);
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v13 + 8);
}

_QWORD *__42__CRTTMergeableString_deleteAllSubstrings__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __35__CRTTMergeableString__updateCache__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (_QWORD *)v3[2];
  v5 = v3[3];
  if ((unint64_t)v4 >= v5)
  {
    v7 = v3[1];
    v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v9 = v5 - v7;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v3 + 3), v11);
    else
      v12 = 0;
    v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(_QWORD *)v13 = a2;
    v6 = v13 + 8;
    v16 = (char *)v3[1];
    v15 = (char *)v3[2];
    if (v15 != v16)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)v3[1];
    }
    v3[1] = v13;
    v3[2] = v6;
    v3[3] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v4 = a2;
    v6 = v4 + 1;
  }
  v3[2] = v6;
}

- (void).cxx_destruct
{
  TopoSubstring **begin;

  objc_storeStrong((id *)&self->_addedByReplica, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_addedByVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_renamedString, 0);
  begin = self->_orderedSubstrings.__begin_;
  if (begin)
  {
    self->_orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
}

- (BOOL)saveToEncoder:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = -[CRTTMergeableString saveSubstrings:encoder:error:](self, "saveSubstrings:encoder:error:", -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings"), v6, a4);

  return (char)a4;
}

- (BOOL)saveSubstrings:(void *)a3 encoder:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t *v7;
  uint64_t *v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id *v23;
  _QWORD *v24;
  uint64_t *v26;
  uint64_t v27;
  _OWORD v28[2];
  int v29;
  uint64_t *v30;

  v23 = a5;
  v6 = a4;
  memset(v28, 0, sizeof(v28));
  v29 = 1065353216;
  v7 = *(uint64_t **)a3;
  v8 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    v9 = 0;
    do
    {
      v27 = *v7;
      v30 = &v27;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v28, &v27, (uint64_t)&std::piecewise_construct, &v30)+ 6) = v9++;
      ++v7;
    }
    while (v7 != v8);
    v10 = *(uint64_t **)a3;
    v26 = (uint64_t *)*((_QWORD *)a3 + 1);
    if (*(uint64_t **)a3 != v26)
    {
      do
      {
        v11 = *v10;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *v10);
        objc_msgSend(v6, "setCharWithId:clock:", v12, *(unsigned int *)(v11 + 20));
        objc_msgSend(v6, "setWithLength:", *(unsigned int *)(v11 + 24));
        v13 = *(_QWORD *)(v11 + 32);
        v14 = *(_QWORD *)(v11 + 40);
        while (v13 != v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v13);
          objc_msgSend(v6, "addAddedById:clock:", v15, *(unsigned int *)(v13 + 20));

          v13 += 24;
        }
        v17 = *(uint64_t **)(v11 + 56);
        v16 = *(uint64_t **)(v11 + 64);
        while (v17 != v16)
        {
          v27 = 0;
          v27 = *v17;
          v30 = &v27;
          objc_msgSend(v6, "addChildWithId:", *((unsigned int *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v28, &v27, (uint64_t)&std::piecewise_construct, &v30)+ 6), v23);
          ++v17;
        }
        objc_msgSend(v6, "finishSubstring");

        ++v10;
      }
      while (v10 != v26);
    }
  }
  -[CRTTMergeableString attributedString](self, "attributedString", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStorage:error:", v18, v24);

  if (v24 && *v24)
  {
    v19 = 0;
  }
  else
  {
    -[CRTTMergeableString version](self, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithVersion:", v20);

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithAddedByVersion:", v21);

    v19 = 1;
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v28);

  return v19;
}

- (CRTTMergeableString)initWithStorage:(id)a3 uuid:(id)a4
{
  return -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:](self, "initWithStorage:uuid:createInitialNodes:", a3, a4, 1);
}

- (void)stealReplicaFrom:(id)a3
{
  id v4;
  unsigned int index;
  __int128 v6;
  unsigned int v7;
  ObjCReplica *addedByReplica;
  ObjCReplica *v9;
  ObjCReplica *v10;
  void *v11;
  int64_t localCounter;
  int64_t addedByLocalCounter;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&replicaLock);
  index = self->_replica.index;
  v6 = *(_OWORD *)self->_replica.uuid;
  v7 = *((_DWORD *)v4 + 40);
  *(_OWORD *)self->_replica.uuid = *((_OWORD *)v4 + 9);
  self->_replica.index = v7;
  *((_OWORD *)v4 + 9) = v6;
  *((_DWORD *)v4 + 40) = index;
  addedByReplica = self->_addedByReplica;
  self->_addedByReplica = 0;
  v9 = (ObjCReplica *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = 0;
  v10 = self->_addedByReplica;
  self->_addedByReplica = v9;

  v11 = (void *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = addedByReplica;

  localCounter = self->_localCounter;
  self->_localCounter = *((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = localCounter;
  addedByLocalCounter = self->_addedByLocalCounter;
  self->_addedByLocalCounter = *((_QWORD *)v4 + 14);
  *((_QWORD *)v4 + 14) = addedByLocalCounter;

  os_unfair_lock_unlock((os_unfair_lock_t)&replicaLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRTTMergeableString copyRenamedIfAvailable:](self, "copyRenamedIfAvailable:", 1);
}

- (id)copyRenamedIfAvailable:(BOOL)a3
{
  void *v5;
  _BOOL8 v6;
  CRTTMergeableString *v7;
  CRTTMergeableString *v8;
  void *v9;
  void *v10;
  void *v11;
  CRTTMergeableString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  char *startNode;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char **v24;
  uint64_t v25;
  _OWORD **v26;
  _OWORD **i;
  uint64_t v28;
  _OWORD *v29;
  __int128 v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void **v45;
  unint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void *v58;
  CRTTMergeableString *v60;
  uint64_t *v61;
  CRTTMergeableString *v62;
  _OWORD *v63;
  uint64_t v64;
  _OWORD v65[2];
  int v66;
  void **p_startNode;

  -[CRTTMergeableString attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = 0;
  else
    v6 = -[ObjCVersion isEmpty](self->_version, "isEmpty");

  if (a3)
  {
    -[CRTTMergeableString renamedIfAvailable](self, "renamedIfAvailable");
    v7 = (CRTTMergeableString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self;
  }
  v60 = v7;
  v8 = [CRTTMergeableString alloc];
  -[CRTTMergeableString attributedString](v60, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  -[CRTTMergeableString uuid](v60, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRTTMergeableString initWithStorage:uuid:createInitialNodes:](v8, "initWithStorage:uuid:createInitialNodes:", v10, v11, v6);

  -[CRTTMergeableString setRenameGeneration:](v12, "setRenameGeneration:", -[CRTTMergeableString renameGeneration](v60, "renameGeneration"));
  if (!v6)
  {
    -[CRTTMergeableString stealReplicaFrom:](v12, "stealReplicaFrom:", self);
    -[CRTTMergeableString version](v60, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v12;
    v14 = (void *)objc_msgSend(v13, "copy");
    -[CRTTMergeableString setVersion:](v12, "setVersion:", v14);

    -[CRTTMergeableString addedByVersion](v60, "addedByVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[CRTTMergeableString setAddedByVersion:](v12, "setAddedByVersion:", v16);

    memset(v65, 0, sizeof(v65));
    v66 = 1065353216;
    v17 = -[CRTTMergeableString orderedSubstrings](v12, "orderedSubstrings");
    v17[1] = *v17;
    v18 = operator new();
    startNode = (char *)v60->_startNode;
    v20 = *(_OWORD *)startNode;
    *(_OWORD *)(v18 + 12) = *(_OWORD *)(startNode + 12);
    *(_OWORD *)v18 = v20;
    *(_QWORD *)(v18 + 40) = 0;
    *(_QWORD *)(v18 + 48) = 0;
    *(_QWORD *)(v18 + 32) = 0;
    std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>((_QWORD *)(v18 + 32), *((const void **)startNode + 4), *((_QWORD *)startNode + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)startNode + 5) - *((_QWORD *)startNode + 4)) >> 3));
    *(_QWORD *)(v18 + 56) = 0;
    *(_QWORD *)(v18 + 64) = 0;
    *(_DWORD *)(v18 + 80) = 0;
    *(_QWORD *)(v18 + 72) = 0;
    *(_DWORD *)(v18 + 84) = *((_DWORD *)startNode + 21);
    p_startNode = &v60->_startNode;
    std::__hash_table<std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,TopoSubstring *>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v65, &v60->_startNode, (uint64_t)&std::piecewise_construct, &p_startNode)[3] = v18;
    v21 = -[CRTTMergeableString orderedSubstrings](v60, "orderedSubstrings");
    v22 = *(uint64_t **)v21;
    v61 = *(uint64_t **)(v21 + 8);
    if (*(uint64_t **)v21 != v61)
    {
      do
      {
        v64 = *v22;
        v23 = std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(v65, &v64)[3];
        v24 = (char **)(v23 + 56);
        std::vector<TopoSubstring *>::reserve((void **)(v23 + 56), (uint64_t)(*(_QWORD *)(v64 + 64) - *(_QWORD *)(v64 + 56)) >> 3);
        v25 = v64;
        *(_DWORD *)(v23 + 80) = *(_DWORD *)(v64 + 80);
        v26 = *(_OWORD ***)(v25 + 56);
        for (i = *(_OWORD ***)(v25 + 64); v26 != i; ++v26)
        {
          v63 = 0;
          v63 = *v26;
          if (!std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(v65, &v63))
          {
            v28 = operator new();
            v29 = v63;
            v30 = *(_OWORD *)((char *)v63 + 12);
            *(_OWORD *)v28 = *v63;
            *(_OWORD *)(v28 + 12) = v30;
            *(_QWORD *)(v28 + 32) = 0;
            *(_QWORD *)(v28 + 40) = 0;
            *(_QWORD *)(v28 + 48) = 0;
            std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>((_QWORD *)(v28 + 32), *((const void **)v29 + 4), *((_QWORD *)v29 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v29 + 5) - *((_QWORD *)v29 + 4)) >> 3));
            *(_QWORD *)(v28 + 56) = 0;
            *(_QWORD *)(v28 + 64) = 0;
            *(_DWORD *)(v28 + 80) = 0;
            *(_QWORD *)(v28 + 72) = 0;
            *(_DWORD *)(v28 + 84) = *((_DWORD *)v29 + 21);
            p_startNode = (void **)&v63;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,TopoSubstring *>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v65, &v63, (uint64_t)&std::piecewise_construct, &p_startNode)[3] = v28;
          }
          p_startNode = (void **)&v63;
          v31 = std::__hash_table<std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,TopoSubstring *>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,TopoSubstring *>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v65, &v63, (uint64_t)&std::piecewise_construct, &p_startNode);
          v32 = v31;
          v34 = *(_QWORD **)(v23 + 64);
          v33 = *(_QWORD *)(v23 + 72);
          if ((unint64_t)v34 >= v33)
          {
            v36 = ((char *)v34 - *v24) >> 3;
            if ((unint64_t)(v36 + 1) >> 61)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v37 = v33 - (_QWORD)*v24;
            v38 = v37 >> 2;
            if (v37 >> 2 <= (unint64_t)(v36 + 1))
              v38 = v36 + 1;
            if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
              v39 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v39 = v38;
            if (v39)
              v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>(v23 + 72, v39);
            else
              v40 = 0;
            v41 = &v40[8 * v36];
            *(_QWORD *)v41 = v32[3];
            v35 = v41 + 8;
            v43 = *(char **)(v23 + 56);
            v42 = *(char **)(v23 + 64);
            if (v42 != v43)
            {
              do
              {
                v44 = *((_QWORD *)v42 - 1);
                v42 -= 8;
                *((_QWORD *)v41 - 1) = v44;
                v41 -= 8;
              }
              while (v42 != v43);
              v42 = *v24;
            }
            *(_QWORD *)(v23 + 56) = v41;
            *(_QWORD *)(v23 + 64) = v35;
            *(_QWORD *)(v23 + 72) = &v40[8 * v39];
            if (v42)
              operator delete(v42);
          }
          else
          {
            *v34 = v31[3];
            v35 = v34 + 1;
          }
          *(_QWORD *)(v23 + 64) = v35;
        }
        v12 = v62;
        v45 = -[CRTTMergeableString orderedSubstrings](v62, "orderedSubstrings");
        v46 = (unint64_t)v45[2];
        v47 = v45[1];
        if ((unint64_t)v47 >= v46)
        {
          v49 = ((char *)v47 - (_BYTE *)*v45) >> 3;
          if ((unint64_t)(v49 + 1) >> 61)
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          v50 = v46 - (_QWORD)*v45;
          v51 = v50 >> 2;
          if (v50 >> 2 <= (unint64_t)(v49 + 1))
            v51 = v49 + 1;
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
            v52 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v52 = v51;
          if (v52)
            v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v45 + 2), v52);
          else
            v53 = 0;
          v54 = &v53[8 * v49];
          *(_QWORD *)v54 = v23;
          v48 = v54 + 8;
          v56 = (char *)*v45;
          v55 = (char *)v45[1];
          if (v55 != *v45)
          {
            do
            {
              v57 = *((_QWORD *)v55 - 1);
              v55 -= 8;
              *((_QWORD *)v54 - 1) = v57;
              v54 -= 8;
            }
            while (v55 != v56);
            v55 = (char *)*v45;
          }
          *v45 = v54;
          v45[1] = v48;
          v45[2] = &v53[8 * v52];
          if (v55)
            operator delete(v55);
        }
        else
        {
          *v47 = v23;
          v48 = v47 + 1;
        }
        v45[1] = v48;
        ++v22;
      }
      while (v22 != v61);
    }
    v12->_startNode = **(void ***)-[CRTTMergeableString orderedSubstrings](v12, "orderedSubstrings");
    v12->_endNode = *(void **)(*(_QWORD *)(-[CRTTMergeableString orderedSubstrings](v12, "orderedSubstrings") + 8) - 8);
    -[CRTTMergeableString coalesce](v12, "coalesce");
    -[CRTTMergeableString temporaryNamesExcludingSelf:](v12, "temporaryNamesExcludingSelf:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:", v58);

    std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v65);
  }

  return v12;
}

- (id)objcReplica
{
  return TopoReplica::objc(&self->_replica);
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[CRTTMergeableString attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)replaceStorageInRange:(_NSRange)a3 withStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  -[CRTTMergeableString beginEditing](self, "beginEditing");
  -[CRTTMergeableString removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
  v8 = objc_msgSend(v7, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CRTTMergeableString_replaceStorageInRange_withStorage___block_invoke;
  v10[3] = &unk_1E775E010;
  v9 = v7;
  v11 = v9;
  -[CRTTMergeableString insertAtIndex:length:getStorage:](self, "insertAtIndex:length:getStorage:", location, v8, v10);
  -[CRTTMergeableString endEditing](self, "endEditing");

}

id __57__CRTTMergeableString_replaceStorageInRange_withStorage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  void *__p;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  length = a3.length;
  location = a3.location;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  if (length)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v6 = operator new(0x10uLL);
    v8 = v6 + 2;
    v9 = v6 + 2;
    *v6 = location;
    v6[1] = length;
    __p = v6;
    -[CRTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &v10, location, length);
    -[CRTTMergeableString deleteSubstrings:withCharacterRanges:](self, "deleteSubstrings:withCharacterRanges:", &v10, &__p);
    if (__p)
    {
      v8 = __p;
      operator delete(__p);
    }
    if (v10)
    {
      v11 = v10;
      operator delete(v10);
    }
  }
}

- (void)removeAll
{
  unint64_t v3;
  _QWORD *v4;
  void *__p;
  void *v6;
  _QWORD *v7;

  if (-[CRTTMergeableString length](self, "length"))
  {
    -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
    v3 = -[CRTTMergeableString length](self, "length");
    v4 = operator new(0x10uLL);
    v6 = v4 + 2;
    v7 = v4 + 2;
    *v4 = 0;
    v4[1] = v3;
    __p = v4;
    -[CRTTMergeableString deleteSubstrings:withCharacterRanges:](self, "deleteSubstrings:withCharacterRanges:", -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings"), &__p);
    if (__p)
    {
      v6 = __p;
      operator delete(__p);
    }
  }
}

- (void)insertAtIndex:(int64_t)a3 length:(int64_t)a4 getStorage:(id)a5
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *startNode;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a5;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  if (a4 >= 1)
  {
    if (a3)
    {
      if (-[CRTTMergeableString length](self, "length") == a3)
      {
        v8 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v9 = ((uint64_t)(v8[1] - *v8) >> 3) - 2;
        do
        {
          v10 = v9;
          startNode = *(void **)(*(_QWORD *)-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8 * v9);
          if (*((_QWORD *)startNode + 5) != *((_QWORD *)startNode + 4))
            break;
          v9 = v10 - 1;
        }
        while (startNode != self->_startNode);
        v12 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v13 = v10 + 1;
      }
      else
      {
        v14 = CRTTBoundedCheckedCastNSUIntegerToUInt32(a3);
        for (i = 0; ; ++i)
        {
          startNode = *(void **)(*(_QWORD *)-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8 * i);
          if (*((_QWORD *)startNode + 5) != *((_QWORD *)startNode + 4))
          {
            v16 = *((_DWORD *)startNode + 6);
            v17 = v14 >= v16;
            v18 = v14 - v16;
            if (!v17)
            {
              v19 = -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", startNode, v14);
              -[CRTTMergeableString invalidateCache](self, "invalidateCache");
              goto LABEL_17;
            }
            v14 = v18;
            if (!(_DWORD)v18)
              break;
          }
        }
        v12 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v13 = i + 1;
      }
    }
    else
    {
      startNode = self->_startNode;
      v12 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v13 = 1;
    }
    v19 = *(void **)(*v12 + 8 * v13);
LABEL_17:
    -[CRTTMergeableString insertStorageLength:after:before:getStorage:](self, "insertStorageLength:after:before:getStorage:", a4, startNode, v19, v20);
  }

}

- (void)beginEditing
{
  ++self->_editCount;
}

- (void)endEditing
{
  unint64_t editCount;
  unint64_t v3;

  editCount = self->_editCount;
  if (editCount)
  {
    v3 = editCount - 1;
    self->_editCount = v3;
    if (!v3)
      -[CRTTMergeableString coalesce](self, "coalesce");
  }
}

- (id)replicaUUIDForCharacterAtIndex:(unint64_t)a3
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;

  v4 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v5 = *v4;
  v6 = v4[1];
  if (*v4 == v6)
  {
LABEL_10:
    v13 = 0;
    return v13;
  }
  v7 = 0;
  while (1)
  {
    v8 = *v5;
    if (*(_QWORD *)(*v5 + 40) != *(_QWORD *)(*v5 + 32))
      break;
    v10 = v7;
LABEL_9:
    ++v5;
    v7 = v10;
    if (v5 == v6)
      goto LABEL_10;
  }
  v9 = *(unsigned int *)(v8 + 24);
  v10 = v7 + v9;
  v11 = a3 >= v7;
  v12 = a3 - v7;
  if (!v11 || v12 >= v9)
    goto LABEL_9;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
  return v13;
}

- (id)selectionForCharacterRanges:(id)a3
{
  -[CRTTMergeableString selectionForCharacterRanges:selectionAffinity:](self, "selectionForCharacterRanges:selectionAffinity:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4
{
  id v6;
  __int128 ***v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  __int128 *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  _BOOL4 isStartNode;
  BOOL isEndNode;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  NSUUID *v26;
  void **v27;
  int v28;
  char *v29;
  char *v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  int v38;
  char *v39;
  char *v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 **v45;
  __int128 **v46;
  CRTTMergeableStringSelection *v47;
  TopoReplica v48;
  int v49;
  __int128 v50;
  uint64_t index;
  __int128 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = objc_alloc_init(CRTTMergeableStringSelection);
  -[CRTTMergeableStringSelection setSelectionAffinity:](v47, "setSelectionAffinity:", a4);
  if (!objc_msgSend(v6, "count"))
    goto LABEL_47;
  v7 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v45 = v7[1];
  v46 = *v7;
  if (*v7 == v45)
    goto LABEL_47;
  v8 = 0;
  v9 = 0;
  v10 = 1;
  do
  {
    v11 = *v46;
    if (*((_QWORD *)*v46 + 5) == *((_QWORD *)*v46 + 4))
      goto LABEL_46;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeValue");
      v15 = v14;

      if (v10)
        break;
      v20 = v13 + v15;
      if (v8 + (unint64_t)*((unsigned int *)v11 + 6) <= v13 + v15 - 1)
      {
        v10 = 0;
        goto LABEL_44;
      }
      v50 = *v11;
      v21 = *((_DWORD *)v11 + 5);
      LODWORD(index) = *((_DWORD *)v11 + 4);
      v22 = *(_QWORD *)(-[CRTTMergeableStringSelection selectionRanges](v47, "selectionRanges") + 8);
      *(_OWORD *)(v22 - 24) = v50;
      *(_DWORD *)(v22 - 8) = index;
      *(_DWORD *)(v22 - 4) = v21 + v20 + ~(_DWORD)v8;
      v23 = 1;
      v10 = 1;
LABEL_40:
      v9 += v23;
      if (v9 >= objc_msgSend(v6, "count"))
        goto LABEL_44;
    }
    v10 = v15 == 0;
    if (v15 | a4)
      v16 = 1;
    else
      v16 = v13 == 0;
    v17 = !v16;
    if (a4 || v8 != v13)
    {
      isStartNode = 0;
      isEndNode = 0;
      if (a4 == 1 && v8 == v13)
      {
        isEndNode = TopoSubstring::isEndNode((TopoSubstring *)v11);
        isStartNode = 0;
      }
    }
    else
    {
      isStartNode = TopoSubstring::isStartNode((TopoSubstring *)v11);
      isEndNode = 0;
    }
    v24 = v13 - v17;
    if (v8 + (unint64_t)*((unsigned int *)v11 + 6) > v24 || isEndNode || isStartNode)
    {
      v52 = *v11;
      v25 = *((_DWORD *)v11 + 5);
      v53 = *((_DWORD *)v11 + 4);
      objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
      v26 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      TopoReplica::TopoReplica(&v48, v26, 0);
      v49 = 0;
      v50 = *(_OWORD *)v48.uuid;
      index = v48.index;

      v27 = -[CRTTMergeableStringSelection selectionRanges](v47, "selectionRanges");
      v28 = v25 + v24 - v8;
      v29 = (char *)v27[2];
      v30 = (char *)v27[1];
      if (v30 >= v29)
      {
        v32 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (_BYTE *)*v27) >> 4);
        v33 = v32 + 1;
        if (v32 + 1 > 0x555555555555555)
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        v34 = 0xAAAAAAAAAAAAAAABLL * ((v29 - (_BYTE *)*v27) >> 4);
        if (2 * v34 > v33)
          v33 = 2 * v34;
        if (v34 >= 0x2AAAAAAAAAAAAAALL)
          v35 = 0x555555555555555;
        else
          v35 = v33;
        if (v35)
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<minIdPathData,TopoSubstring *>>>((uint64_t)(v27 + 2), v35);
        else
          v36 = 0;
        v37 = &v36[48 * v32];
        v38 = v53;
        *(_OWORD *)v37 = v52;
        *((_DWORD *)v37 + 4) = v38;
        *((_DWORD *)v37 + 5) = v28;
        *(_OWORD *)(v37 + 24) = v50;
        *((_QWORD *)v37 + 5) = index;
        v40 = (char *)*v27;
        v39 = (char *)v27[1];
        v41 = v37;
        if (v39 != *v27)
        {
          do
          {
            v42 = *((_OWORD *)v39 - 3);
            v43 = *((_OWORD *)v39 - 1);
            *((_OWORD *)v41 - 2) = *((_OWORD *)v39 - 2);
            *((_OWORD *)v41 - 1) = v43;
            *((_OWORD *)v41 - 3) = v42;
            v41 -= 48;
            v39 -= 48;
          }
          while (v39 != v40);
          v39 = (char *)*v27;
        }
        v31 = v37 + 48;
        *v27 = v41;
        v27[1] = v37 + 48;
        v27[2] = &v36[48 * v35];
        if (v39)
          operator delete(v39);
      }
      else
      {
        *(_OWORD *)v30 = v52;
        *((_DWORD *)v30 + 4) = v53;
        *((_DWORD *)v30 + 5) = v28;
        *(_OWORD *)(v30 + 24) = v50;
        *((_QWORD *)v30 + 5) = index;
        v31 = v30 + 48;
      }
      v23 = v15 == 0;
      v27[1] = v31;
      goto LABEL_40;
    }
    v10 = 1;
LABEL_44:
    if (v9 >= objc_msgSend(v6, "count"))
      break;
    v8 += *((unsigned int *)v11 + 6);
LABEL_46:
    ++v46;
  }
  while (v46 != v45);
LABEL_47:

  return v47;
}

- (id)characterRangesForSelection:(id)a3
{
  -[CRTTMergeableString characterRangesForSelection:selectedSubstringsBlock:](self, "characterRangesForSelection:selectedSubstringsBlock:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4
{
  NSUInteger v4;
  id v6;
  void (**v7)(id, uint64_t, _QWORD, NSUInteger);
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  NSUInteger v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSUInteger v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  NSUInteger v26;
  NSUInteger v27;
  NSRange v28;
  uint64_t v29;
  void *v30;
  CRTTMergeableString *v32;
  _QWORD *v33;
  _QWORD *v34;
  id v35;
  unsigned __int8 uu2[16];
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  NSRange v40;
  NSRange v41;

  v32 = self;
  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD, NSUInteger))a4;
  v8 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
  if (v8[1] == *v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[CRTTMergeableString orderedSubstrings](v32, "orderedSubstrings");
  v10 = *(_QWORD **)v9;
  v33 = *(_QWORD **)(v9 + 8);
  if (*(_QWORD **)v9 != v33)
  {
    v11 = 0;
    v12 = 0;
    LOBYTE(v13) = 1;
    while (1)
    {
      v34 = v10;
      v14 = *v10;
      do
      {
        v15 = (__int128 *)(*(_QWORD *)objc_msgSend(v6, "selectionRanges", v32) + 48 * v12);
        v16 = *v15;
        v17 = v15[2];
        v37 = v15[1];
        v38 = v17;
        *(_OWORD *)uu2 = v16;
        if ((v13 & 1) == 0)
        {
          if (!TopoIDRange::contains((TopoIDRange *)v14, (const TopoID *)((char *)&v37 + 8)))
            break;
          v22 = v11;
          if (*(_QWORD *)(v14 + 40) != *(_QWORD *)(v14 + 32))
            v22 = v11 + (HIDWORD(v38) - *(_DWORD *)(v14 + 20) + 1);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, v22 - v4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v23);

          ++v12;
          if (v7)
            v7[2](v7, v14, 0, v22 - v11);
          goto LABEL_24;
        }
        if (!TopoIDRange::contains((TopoIDRange *)v14, (const TopoID *)uu2)
          && (*(_QWORD *)(v14 + 16) != (_QWORD)v37 || uuid_compare((const unsigned __int8 *)v14, uu2)))
        {
          break;
        }
        v4 = v11;
        if (*(_QWORD *)(v14 + 40) != *(_QWORD *)(v14 + 32))
          v4 = v11 + (DWORD1(v37) - *(_DWORD *)(v14 + 20));
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)&v37 + 8);
        objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);
        if (HIDWORD(v38))
          v13 = 0;
        else
          v13 = v20;

        if (!v13)
          goto LABEL_25;
        if (*(_QWORD *)(v14 + 40) != *(_QWORD *)(v14 + 32) && !objc_msgSend(v6, "selectionAffinity"))
          v4 += !TopoSubstring::isStartNode((TopoSubstring *)v14);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v21);

        ++v12;
LABEL_24:
        LOBYTE(v13) = 1;
LABEL_25:
        v24 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
      }
      while (v12 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24[1] - *v24) >> 4));
      v25 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
      if (v12 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25[1] - *v25) >> 4))
      {
        if (!((v7 == 0) | v13 & 1))
        {
          if (*(_QWORD *)(v14 + 40) == *(_QWORD *)(v14 + 32))
            v26 = 0;
          else
            v26 = *(unsigned int *)(v14 + 24);
          v27 = *(unsigned int *)(v14 + 84);
          v41.length = -[CRTTMergeableString length](v32, "length") - v4;
          v40.location = v27;
          v40.length = v26;
          v41.location = v4;
          v28 = NSIntersectionRange(v40, v41);
          v7[2](v7, v14, v28.location, v28.length);
        }
        v29 = *(_QWORD *)(v14 + 40) == *(_QWORD *)(v14 + 32) ? 0 : *(unsigned int *)(v14 + 24);
        v11 += v29;
        v10 = v34 + 1;
        if (v34 + 1 != v33)
          continue;
      }
      break;
    }
  }
LABEL_38:

  return v35;
}

- (id)characterRangesForMergeableRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _OWORD v29[2];
  _OWORD v30[2];
  _QWORD v31[4];
  id v32;
  id v33;
  _OWORD v34[2];
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "range");
  else
    memset(v35, 0, sizeof(v35));
  v6 = objc_msgSend(v5, "renameGeneration");
  if (v6 != -[CRTTMergeableString renameGeneration](self, "renameGeneration"))
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString renamed:](self, "renamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_DWORD *)&v35[16])
    {
      TopoReplica::objc((TopoReplica *)v35);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "renamedWithRange:replica:", *(unsigned int *)&v35[20], *(unsigned int *)&v35[24], v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "rangeCount"))
      {
        v23 = v10;
        v24 = v9;
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", *(unsigned int *)&v35[20], *(unsigned int *)&v35[24]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = *(unsigned int *)&v35[20];
        v13 = *(unsigned int *)&v35[24];
        v15 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke;
        v25[3] = &unk_1E775E038;
        v16 = v22;
        v26 = v16;
        v17 = v12;
        v27 = v17;
        v18 = v24;
        v28 = v18;
        objc_msgSend(v11, "enumerateRangesIn::", v14, v13, v25, v22);
        v31[0] = v15;
        v31[1] = 3221225472;
        v31[2] = __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke_2;
        v31[3] = &unk_1E775E060;
        v34[0] = *(_OWORD *)v35;
        *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)&v35[12];
        v19 = v17;
        v32 = v19;
        v33 = v18;
        objc_msgSend(v16, "enumerateRangesUsingBlock:", v31);
        v20 = v33;
        v7 = v19;

        v9 = v24;
LABEL_11:

        goto LABEL_12;
      }

    }
    v30[0] = *(_OWORD *)v35;
    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)&v35[12];
    objc_msgSend(v9, "characterRangesForIDRange:", v30);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v29[0] = *(_OWORD *)v35;
  *(_OWORD *)((char *)v29 + 12) = *(_OWORD *)&v35[12];
  -[CRTTMergeableString characterRangesForIDRange:](self, "characterRangesForIDRange:", v29);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

uint64_t __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  unsigned int index;
  int v16;
  int v17;
  TopoReplica v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if ((a5 & 0x8000000000000000) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
    TopoReplica::TopoReplica(&v18, v9, 0);
    v14 = *(_OWORD *)v18.uuid;
    v11 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    index = v18.index;
    v16 = a5;
    v17 = a3;
    objc_msgSend(v10, "characterRangesForIDRange:", &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

  }
  return 0;
}

void __56__CRTTMergeableString_characterRangesForMergeableRange___block_invoke_2(uint64_t a1, int a2, int a3)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)(a1 + 48);
  v3 = *(_DWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = a2;
  v10 = a3;
  objc_msgSend(v4, "characterRangesForIDRange:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

}

- (id)characterRangesForIDRange:(TopoIDRange *)a3
{
  id v5;
  __int128 ***v6;
  __int128 **v7;
  __int128 **v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  void *v12;
  void *v13;
  int v14;
  _BYTE v16[20];
  int v17;
  unsigned int v18;
  TopoIDRange v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *__p;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v7 = *v6;
  v8 = v6[1];
  if (*v6 != v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = *v7;
      v11 = **v7;
      *(_OWORD *)&v19.charID.replica.uuid[12] = *(__int128 *)((char *)*v7 + 12);
      *(_OWORD *)v19.charID.replica.uuid = v11;
      v21 = 0;
      v22 = 0;
      v20 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v20, *((const void **)v10 + 4), *((_QWORD *)v10 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v10 + 5) - *((_QWORD *)v10 + 4)) >> 3));
      __p = 0;
      v24 = 0;
      v26 = 0;
      v25 = 0;
      v27 = *((_DWORD *)v10 + 21);
      v12 = v20;
      if (v21 == v20)
      {
        v14 = 3;
        if (!v20)
          goto LABEL_13;
      }
      else
      {
        TopoIDRange::intersection(&v19, a3, (uint64_t)v16);
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17 + v27 - v19.charID.clock);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          v9 += v18;
          v14 = 2 * (v9 >= a3->length);
        }
        else
        {
          v14 = 3;
        }
        if (__p)
        {
          v24 = __p;
          operator delete(__p);
        }
        v12 = v20;
        if (!v20)
          goto LABEL_13;
      }
      v21 = v12;
      operator delete(v12);
LABEL_13:
      if ((v14 == 3 || !v14) && ++v7 != v8)
        continue;
      return v5;
    }
  }
  return v5;
}

- (BOOL)isEmptyCRDT
{
  void *v2;
  char v3;

  -[CRTTMergeableString version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty");

  return v3;
}

- (void)addNewAddedByFor:(void *)a3
{
  void *v5;
  ObjCReplica *v6;
  int64_t addedByLocalCounter;
  TopoReplica v8;
  TopoID v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertWithRange:replica:", self->_addedByLocalCounter, *((unsigned int *)a3 + 6), self->_addedByReplica);

  -[CRTTMergeableString addedByReplica](self, "addedByReplica");
  v6 = (ObjCReplica *)objc_claimAutoreleasedReturnValue();
  TopoReplica::TopoReplica(&v8, v6);
  addedByLocalCounter = self->_addedByLocalCounter;
  v9.replica = v8;
  v9.clock = addedByLocalCounter;
  TopoSubstring::addAddedBy((TopoSubstring *)a3, &v9);

  self->_addedByLocalCounter += *((unsigned int *)a3 + 6);
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = *(_QWORD *)a3;
  v7 = *((_QWORD *)a3 + 1);
  while (v6 != v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)v6 + 32);
    if (*(_QWORD *)(*(_QWORD *)v6 + 40) != v8)
      *(_QWORD *)(*(_QWORD *)v6 + 40) = v8;
    v6 += 8;
  }
  v9 = (__int128 *)*((_QWORD *)a4 + 1);
  v10 = 126 - 2 * __clz(((uint64_t)v9 - *(_QWORD *)a4) >> 4);
  if (v9 == *(__int128 **)a4)
    v11 = 0;
  else
    v11 = v10;
  std::__introsort<std::_ClassicAlgPolicy,-[CRTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *,false>(*(_QWORD *)a4, v9, v11, 1);
  v13 = *(uint64_t **)a4;
  v12 = (uint64_t *)*((_QWORD *)a4 + 1);
  while (v13 != v12)
  {
    v14 = *v13;
    v15 = v13[1];
    v13 += 2;
    objc_msgSend(self->_attributedString, "cr_removeObjectsInRange:", v14, v15);
  }
  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertWithRange:replica:", self->_addedByLocalCounter, 1, self->_addedByReplica);

  ++self->_addedByLocalCounter;
  -[CRTTMergeableString coalesce](self, "coalesce");
  -[CRTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
}

- (void)insertStorageLength:(int64_t)a3 after:(void *)a4 before:(void *)a5 getStorage:(id)a6
{
  id v10;
  uint64_t v11;
  int localCounter;
  int v13;
  int v14;
  void *v15;
  ObjCReplica *v16;
  int64_t addedByLocalCounter;
  void *v18;
  int64_t v19;
  void *v20;
  char *v21;
  uint64_t v22;
  void **v23;
  void **v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  TopoReplica v30;
  TopoID __src;
  __int128 v32;
  unsigned int index;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (a3 >= 1)
  {
    v11 = operator new();
    v32 = *(_OWORD *)self->_replica.uuid;
    index = self->_replica.index;
    localCounter = self->_localCounter;
    v13 = *((_DWORD *)a5 + 21);
    v14 = CRTTBoundedCheckedCastNSUIntegerToUInt32(a3);
    *(_DWORD *)(v11 + 16) = 0;
    uuid_clear((unsigned __int8 *)v11);
    *(_OWORD *)(v11 + 48) = 0u;
    *(_OWORD *)(v11 + 64) = 0u;
    *(_OWORD *)(v11 + 32) = 0u;
    *(_DWORD *)(v11 + 80) = 0;
    *(_DWORD *)(v11 + 84) = v13;
    *(_OWORD *)v11 = v32;
    *(_DWORD *)(v11 + 16) = index;
    *(_DWORD *)(v11 + 20) = localCounter;
    *(_DWORD *)(v11 + 24) = v14;
    v29 = v11;
    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertWithRange:replica:", self->_addedByLocalCounter, *(unsigned int *)(v11 + 24), self->_addedByReplica);

    -[CRTTMergeableString addedByReplica](self, "addedByReplica");
    v16 = (ObjCReplica *)objc_claimAutoreleasedReturnValue();
    TopoReplica::TopoReplica(&v30, v16);
    addedByLocalCounter = self->_addedByLocalCounter;
    __src.replica = v30;
    __src.clock = addedByLocalCounter;
    TopoSubstring::addAddedBy((TopoSubstring *)v11, &__src);

    self->_addedByLocalCounter += *(unsigned int *)(v11 + 24);
    -[CRTTMergeableString version](self, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_localCounter;
    TopoReplica::objc(&self->_replica);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertWithRange:replica:", v19, a3, v20);

    self->_localCounter += a3;
    v21 = (char *)*((_QWORD *)a4 + 7);
    v22 = *((_QWORD *)a4 + 8);
    v23 = (void **)v21;
    if (v21 != (char *)v22)
    {
      while (*v23 != a5)
      {
        if (++v23 == (void **)v22)
        {
          v23 = (void **)*((_QWORD *)a4 + 8);
          break;
        }
      }
    }
    if (v23 == (void **)v22)
    {
      if ((void *)v11 != a4)
        std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>((char *)(v11 + 56), v21, v22, (v22 - (uint64_t)v21) >> 3);
      *(_QWORD *)__src.replica.uuid = v11;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>((char *)a4 + 56, (char *)&__src, (uint64_t)&__src.replica.uuid[8], 1uLL);
    }
    else
    {
      *v23 = (void *)v11;
      *(_QWORD *)__src.replica.uuid = a5;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>((char *)(v11 + 56), (char *)&__src, (uint64_t)&__src.replica.uuid[8], 1uLL);
    }
    *(_DWORD *)(v11 + 80) = 1;
    if (!self->_cacheInvalid)
    {
      v24 = *(void ***)-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v25 = (char *)(v24 + 1);
      while (v24 != *(void ***)(-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8))
      {
        if (*v24 == a4)
        {
          std::vector<TopoSubstring *>::insert((uint64_t)-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings"), v25, (char *)&v29);
          v11 = v29;
          break;
        }
        ++v24;
        v25 += 8;
      }
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v11);
    (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v26, *(unsigned int *)(v11 + 16), *(unsigned int *)(v11 + 20));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRTTMergeableString attributedString](self, "attributedString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cr_insertStorage:atIndex:", v27, *(unsigned int *)(v29 + 84));

    -[CRTTMergeableString coalesce](self, "coalesce");
    -[CRTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");

  }
}

- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4
{
  -[CRTTMergeableString getSubstrings:inOrderedSubstrings:forCharacterRange:](self, "getSubstrings:inOrderedSubstrings:forCharacterRange:", a3, -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings"), a4.location, a4.length);
}

- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5
{
  char *v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL v16;
  NSUInteger v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  _QWORD *v44;
  char *v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  void *v58;
  void *v59;

  if (!a5.length)
    return;
  v7 = *(char **)a4;
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
    goto LABEL_66;
  length = a5.length;
  location = a5.location;
  v11 = 0;
  v12 = a5.location + a5.length;
  v57 = (char *)a3 + 16;
  while (1)
  {
    v13 = *(_QWORD *)v7;
    if (*(_QWORD *)(*(_QWORD *)v7 + 40) == *(_QWORD *)(*(_QWORD *)v7 + 32))
    {
      v14 = v11;
      goto LABEL_46;
    }
    v14 = v11 + *(unsigned int *)(v13 + 24);
    if (v14 > location)
      break;
LABEL_46:
    v7 += 8;
    v11 = v14;
    if (v7 == *((char **)a4 + 1))
      goto LABEL_66;
  }
  v15 = v12 - v11;
  if (v12 <= v11)
    goto LABEL_66;
  v16 = location >= v11;
  v17 = location - v11;
  if (v17 != 0 && v16)
  {
    v59 = 0;
    v59 = -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, CRTTBoundedCheckedCastNSUIntegerToUInt32(v17));
    v7 = std::vector<TopoSubstring *>::insert((uint64_t)a4, v7 + 8, (char *)&v59);
    v19 = (_QWORD *)*((_QWORD *)a3 + 1);
    v18 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v19 >= v18)
    {
      v24 = ((uint64_t)v19 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v24 + 1) >> 61)
        goto LABEL_68;
      v25 = v18 - *(_QWORD *)a3;
      v26 = v25 >> 2;
      if (v25 >> 2 <= (unint64_t)(v24 + 1))
        v26 = v24 + 1;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
        v27 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v27 = v26;
      if (v27)
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v27);
      else
        v28 = 0;
      v34 = &v28[8 * v24];
      *(_QWORD *)v34 = v59;
      v20 = v34 + 8;
      v36 = *(char **)a3;
      v35 = (char *)*((_QWORD *)a3 + 1);
      if (v35 != *(char **)a3)
      {
        do
        {
          v37 = *((_QWORD *)v35 - 1);
          v35 -= 8;
          *((_QWORD *)v34 - 1) = v37;
          v34 -= 8;
        }
        while (v35 != v36);
        v35 = *(char **)a3;
      }
      *(_QWORD *)a3 = v34;
      *((_QWORD *)a3 + 1) = v20;
      *((_QWORD *)a3 + 2) = &v28[8 * v27];
      if (v35)
        operator delete(v35);
    }
    else
    {
      *v19 = v59;
      v20 = v19 + 1;
    }
    *((_QWORD *)a3 + 1) = v20;
    if (v12 < v14)
    {
      v58 = -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v59, CRTTBoundedCheckedCastNSUIntegerToUInt32(length));
      v45 = v7 + 8;
      v46 = &v58;
      goto LABEL_65;
    }
    goto LABEL_46;
  }
  if (v14 <= v12)
  {
    v22 = (uint64_t *)*((_QWORD *)a3 + 1);
    v21 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v22 >= v21)
    {
      v29 = ((uint64_t)v22 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v29 + 1) >> 61)
        goto LABEL_68;
      v30 = v21 - *(_QWORD *)a3;
      v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1))
        v31 = v29 + 1;
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v32);
      else
        v33 = 0;
      v38 = &v33[8 * v29];
      *(_QWORD *)v38 = v13;
      v23 = v38 + 8;
      v40 = *(char **)a3;
      v39 = (char *)*((_QWORD *)a3 + 1);
      if (v39 != *(char **)a3)
      {
        do
        {
          v41 = *((_QWORD *)v39 - 1);
          v39 -= 8;
          *((_QWORD *)v38 - 1) = v41;
          v38 -= 8;
        }
        while (v39 != v40);
        v39 = *(char **)a3;
      }
      *(_QWORD *)a3 = v38;
      *((_QWORD *)a3 + 1) = v23;
      *((_QWORD *)a3 + 2) = &v33[8 * v32];
      if (v39)
        operator delete(v39);
    }
    else
    {
      *v22 = v13;
      v23 = v22 + 1;
    }
    *((_QWORD *)a3 + 1) = v23;
    goto LABEL_46;
  }
  v59 = -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, CRTTBoundedCheckedCastNSUIntegerToUInt32(v15));
  v43 = (uint64_t *)*((_QWORD *)a3 + 1);
  v42 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v43 >= v42)
  {
    v47 = ((uint64_t)v43 - *(_QWORD *)a3) >> 3;
    if ((unint64_t)(v47 + 1) >> 61)
LABEL_68:
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v48 = v42 - *(_QWORD *)a3;
    v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1))
      v49 = v47 + 1;
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
      v50 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v50 = v49;
    if (v50)
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v50);
    else
      v51 = 0;
    v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(_QWORD *)v52 = v13;
    v44 = v52 + 8;
    v55 = *(char **)a3;
    v54 = (char *)*((_QWORD *)a3 + 1);
    if (v54 != *(char **)a3)
    {
      do
      {
        v56 = *((_QWORD *)v54 - 1);
        v54 -= 8;
        *((_QWORD *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      v54 = *(char **)a3;
    }
    *(_QWORD *)a3 = v52;
    *((_QWORD *)a3 + 1) = v44;
    *((_QWORD *)a3 + 2) = v53;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v43 = v13;
    v44 = v43 + 1;
  }
  *((_QWORD *)a3 + 1) = v44;
  v45 = v7 + 8;
  v46 = &v59;
LABEL_65:
  std::vector<TopoSubstring *>::insert((uint64_t)a4, v45, (char *)v46);
LABEL_66:
  -[CRTTMergeableString invalidateCache](self, "invalidateCache");
}

- (void)getSubstringBeforeTopoID:(TopoID *)a3
{
  void *startNode;
  _QWORD *v6;
  __int128 **v7;
  __int128 **v8;
  __int128 *v9;
  __int128 v10;
  __int128 v12;
  int v13;
  int v14;
  _BYTE uu2[28];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  startNode = self->_startNode;
  v6 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v7 = (__int128 **)*v6;
  v8 = (__int128 **)v6[1];
  while (1)
  {
    if (v7 == v8)
      return 0;
    v9 = *v7;
    v10 = **v7;
    *(_OWORD *)&uu2[12] = *(__int128 *)((char *)*v7 + 12);
    *(_OWORD *)uu2 = v10;
    if (a3->replica.index == *(_DWORD *)&uu2[16] && !uuid_compare(a3->replica.uuid, uu2))
    {
      if (*(_DWORD *)&uu2[20] == a3->clock)
        return startNode;
      if (TopoID::operator>((uint64_t)a3, (uint64_t)uu2))
      {
        v12 = *(_OWORD *)uu2;
        v13 = *(_DWORD *)&uu2[16];
        v14 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
        if (TopoID::operator<((uint64_t)a3, (uint64_t)&v12))
          break;
      }
    }
    if (*((_QWORD *)v9 + 5) != *((_QWORD *)v9 + 4))
      startNode = v9;
    ++v7;
  }
  if (*((_QWORD *)v9 + 5) != *((_QWORD *)v9 + 4))
  {
    -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v9, a3->clock - *(_DWORD *)&uu2[20]);
    -[CRTTMergeableString invalidateCache](self, "invalidateCache");
    return v9;
  }
  return startNode;
}

- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4
{
  __int128 ***v7;
  __int128 **v8;
  __int128 **v9;
  char v10;
  __int128 *v11;
  __int128 v12;
  unsigned int v13;
  unsigned int clock;
  unsigned int v15;
  unint64_t v16;
  __int128 **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  int v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  __int128 **v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  __int128 v47;
  unsigned int index;
  int v49;
  unsigned __int8 uu1[16];
  unsigned int v51;
  int v52;
  _BYTE uu2[28];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a4->length)
  {
    v7 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v8 = *v7;
    v9 = v7[1];
    if (*v7 != v9)
    {
      v10 = 0;
      while (1)
      {
        v11 = *v8;
        v12 = **v8;
        *(_OWORD *)&uu2[12] = *(__int128 *)((char *)*v8 + 12);
        *(_OWORD *)uu2 = v12;
        if (a4->charID.replica.index != *(_DWORD *)&uu2[16])
          goto LABEL_59;
        if (uuid_compare(a4->charID.replica.uuid, uu2))
          goto LABEL_59;
        *(_OWORD *)uu1 = *(_OWORD *)uu2;
        v51 = *(_DWORD *)&uu2[16];
        v52 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
        if ((TopoID::operator<=(uu1, a4->charID.replica.uuid) & 1) != 0)
          goto LABEL_59;
        v47 = *(_OWORD *)a4->charID.replica.uuid;
        v13 = a4->length + a4->charID.clock;
        index = a4->charID.replica.index;
        v49 = v13;
        if ((TopoID::operator>=(uu2, (unsigned __int8 *)&v47) & 1) != 0)
          goto LABEL_59;
        clock = a4->charID.clock;
        if (clock <= *(_DWORD *)&uu2[20])
        {
          *(_OWORD *)uu1 = *(_OWORD *)uu2;
          v51 = *(_DWORD *)&uu2[16];
          v52 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
          v47 = *(_OWORD *)a4->charID.replica.uuid;
          v23 = a4->length + clock;
          index = a4->charID.replica.index;
          v49 = v23;
          if (!TopoID::operator>((uint64_t)uu1, (uint64_t)&v47))
          {
            v27 = (__int128 **)*((_QWORD *)a3 + 1);
            v26 = *((_QWORD *)a3 + 2);
            if ((unint64_t)v27 >= v26)
            {
              v29 = ((uint64_t)v27 - *(_QWORD *)a3) >> 3;
              if ((unint64_t)(v29 + 1) >> 61)
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              v30 = v26 - *(_QWORD *)a3;
              v31 = v30 >> 2;
              if (v30 >> 2 <= (unint64_t)(v29 + 1))
                v31 = v29 + 1;
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
                v32 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v32 = v31;
              if (v32)
                v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v32);
              else
                v33 = 0;
              v41 = &v33[8 * v29];
              *(_QWORD *)v41 = v11;
              v28 = v41 + 8;
              v43 = *(char **)a3;
              v42 = (char *)*((_QWORD *)a3 + 1);
              if (v42 != *(char **)a3)
              {
                do
                {
                  v44 = *((_QWORD *)v42 - 1);
                  v42 -= 8;
                  *((_QWORD *)v41 - 1) = v44;
                  v41 -= 8;
                }
                while (v42 != v43);
                v42 = *(char **)a3;
              }
              *(_QWORD *)a3 = v41;
              *((_QWORD *)a3 + 1) = v28;
              *((_QWORD *)a3 + 2) = &v33[8 * v32];
              if (v42)
                operator delete(v42);
            }
            else
            {
              *v27 = v11;
              v28 = v27 + 1;
            }
            *((_QWORD *)a3 + 1) = v28;
            goto LABEL_59;
          }
          -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v11, a4->length + a4->charID.clock - *(_DWORD *)&uu2[20]);
          v17 = (__int128 **)*((_QWORD *)a3 + 1);
          v24 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v17 >= v24)
          {
            v34 = ((uint64_t)v17 - *(_QWORD *)a3) >> 3;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v35 = v24 - *(_QWORD *)a3;
            v36 = v35 >> 2;
            if (v35 >> 2 <= (unint64_t)(v34 + 1))
              v36 = v34 + 1;
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
              v21 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v21 = v36;
            if (v21)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v21);
            else
              v22 = 0;
            v37 = &v22[8 * v34];
            *(_QWORD *)v37 = v11;
            v25 = v37 + 8;
            v45 = *(char **)a3;
            v38 = (char *)*((_QWORD *)a3 + 1);
            if (v38 != *(char **)a3)
            {
              do
              {
                v46 = *((_QWORD *)v38 - 1);
                v38 -= 8;
                *((_QWORD *)v37 - 1) = v46;
                v37 -= 8;
              }
              while (v38 != v45);
LABEL_55:
              v38 = *(char **)a3;
            }
LABEL_56:
            *(_QWORD *)a3 = v37;
            *((_QWORD *)a3 + 1) = v25;
            *((_QWORD *)a3 + 2) = &v22[8 * v21];
            if (v38)
              operator delete(v38);
            goto LABEL_58;
          }
        }
        else
        {
          v11 = -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v11, clock - *(_DWORD *)&uu2[20]);
          v15 = a4->length + a4->charID.clock;
          v51 = a4->charID.replica.index;
          v52 = v15;
          *(_OWORD *)uu1 = *(_OWORD *)a4->charID.replica.uuid;
          v47 = *(_OWORD *)uu2;
          index = *(_DWORD *)&uu2[16];
          v49 = *(_DWORD *)&uu2[24] + *(_DWORD *)&uu2[20];
          if (TopoID::operator<((uint64_t)uu1, (uint64_t)&v47))
            -[CRTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v11, a4->length);
          v17 = (__int128 **)*((_QWORD *)a3 + 1);
          v16 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v17 >= v16)
          {
            v18 = ((uint64_t)v17 - *(_QWORD *)a3) >> 3;
            if ((unint64_t)(v18 + 1) >> 61)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v19 = v16 - *(_QWORD *)a3;
            v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1))
              v20 = v18 + 1;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
              v21 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v21 = v20;
            if (v21)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)a3 + 16, v21);
            else
              v22 = 0;
            v37 = &v22[8 * v18];
            *(_QWORD *)v37 = v11;
            v25 = v37 + 8;
            v39 = *(char **)a3;
            v38 = (char *)*((_QWORD *)a3 + 1);
            if (v38 != *(char **)a3)
            {
              do
              {
                v40 = *((_QWORD *)v38 - 1);
                v38 -= 8;
                *((_QWORD *)v37 - 1) = v40;
                v37 -= 8;
              }
              while (v38 != v39);
              goto LABEL_55;
            }
            goto LABEL_56;
          }
        }
        *v17 = v11;
        v25 = v17 + 1;
LABEL_58:
        *((_QWORD *)a3 + 1) = v25;
        v10 = 1;
LABEL_59:
        if (++v8 == v9)
        {
          if ((v10 & 1) != 0)
            -[CRTTMergeableString invalidateCache](self, "invalidateCache");
          return;
        }
      }
    }
  }
}

- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  int v30;

  std::vector<_NSRange>::reserve((void **)a3, (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  v28 = 0u;
  v29 = 0u;
  v30 = 1065353216;
  v7 = *(_QWORD **)a4;
  v8 = (_QWORD *)*((_QWORD *)a4 + 1);
  while (v7 != v8)
  {
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v28, v7, v7);
    ++v7;
  }
  v9 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = *v9;
  v11 = v9[1];
  if (*v9 != v11)
  {
    v12 = 0;
    do
    {
      v27 = *v10;
      v13 = std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(&v28, &v27);
      v14 = v13;
      if (*(_QWORD *)(v27 + 40) == *(_QWORD *)(v27 + 32))
      {
        v15 = 0;
        if (!v13)
          goto LABEL_28;
      }
      else
      {
        v15 = *(unsigned int *)(v27 + 24);
        if (!v13)
          goto LABEL_28;
      }
      v17 = (_QWORD *)*((_QWORD *)a3 + 1);
      v16 = *((_QWORD *)a3 + 2);
      if ((unint64_t)v17 >= v16)
      {
        v19 = *(_QWORD **)a3;
        v20 = ((uint64_t)v17 - *(_QWORD *)a3) >> 4;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60)
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        v22 = v16 - (_QWORD)v19;
        if (v22 >> 3 > v21)
          v21 = v22 >> 3;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
          v23 = 0xFFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)a3 + 16, v23);
          v19 = *(_QWORD **)a3;
          v17 = (_QWORD *)*((_QWORD *)a3 + 1);
        }
        else
        {
          v24 = 0;
        }
        v25 = &v24[16 * v20];
        *(_QWORD *)v25 = v12;
        *((_QWORD *)v25 + 1) = v15;
        v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 16;
            v17 -= 2;
          }
          while (v17 != v19);
          v19 = *(_QWORD **)a3;
        }
        v18 = v25 + 16;
        *(_QWORD *)a3 = v26;
        *((_QWORD *)a3 + 1) = v25 + 16;
        *((_QWORD *)a3 + 2) = &v24[16 * v23];
        if (v19)
          operator delete(v19);
      }
      else
      {
        *v17 = v12;
        v17[1] = v15;
        v18 = v17 + 2;
      }
      *((_QWORD *)a3 + 1) = v18;
      if (*((_QWORD *)&v29 + 1) == 1)
        break;
      std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(&v28, v14);
LABEL_28:
      v12 += v15;
      ++v10;
    }
    while (v10 != v11);
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v28);
}

- (void)enumerateIndexes:(id)a3
{
  void (**v4)(id, unint64_t, void *, _QWORD, unint64_t);
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  __int128 *v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, unint64_t, void *, _QWORD, unint64_t))a3;
  v5 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = *v5;
  v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      v8 = (__int128 *)*v6;
      if (*(_QWORD *)(*v6 + 40) != *(_QWORD *)(*v6 + 32))
      {
        v10 = *((_DWORD *)v8 + 4);
        v9 = *((_DWORD *)v8 + 5);
        v14 = *v8;
        v15 = v10;
        v16 = v9;
        if (*((_DWORD *)v8 + 6))
        {
          v11 = 0;
          do
          {
            v12 = *((unsigned int *)v8 + 21);
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v14);
            v4[2](v4, v11 + v12, v13, v15, v11 + v16);

            ++v11;
          }
          while (v11 < *((unsigned int *)v8 + 6));
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }

}

- (id)mergeableIndexForCharacterIndex:(int64_t)a3 affinity:(unint64_t)a4
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  TopoSubstring **i;
  CRTTMergeableStringIndex *v16;
  BOOL isStartNode;
  TopoSubstring *v18;
  int v19;
  int v20;
  CRTTMergeableStringIndex *v21;
  int v22;
  int v23;
  int v24;
  int64_t v25;
  void *v26;
  __int128 v28;
  uint64_t v29;
  uuid_t uu;
  int v31;
  int v32;
  void *v33[2];
  void *__p[2];
  __int128 v35;
  int v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  uuid_clear(uu);
  v32 = 0;
  *(_OWORD *)v33 = 0u;
  *(_OWORD *)__p = 0u;
  v35 = 0u;
  v36 = 0;
  v37 = a3;
  v7 = *(_QWORD **)-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v8 = *(_QWORD **)(-[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8);
  if (v8 != v7)
  {
    v9 = v8 - v7;
    do
    {
      v10 = v9 >> 1;
      v11 = &v7[v9 >> 1];
      v13 = *v11;
      v12 = v11 + 1;
      v9 += ~(v9 >> 1);
      if (*(_DWORD *)(v13 + 84) < v37)
        v7 = v12;
      else
        v9 = v10;
    }
    while (v9);
  }
  if (v7 == v8)
  {
    v16 = 0;
  }
  else
  {
    if (*(unsigned int *)(*v7 + 84) <= a3)
      v14 = 0;
    else
      v14 = -1;
    i = (TopoSubstring **)&v7[v14];
    if (a4)
    {
      while (!TopoSubstring::isEndNode(*i) && *((_QWORD *)*i + 5) == *((_QWORD *)*i + 4))
        ++i;
    }
    else if (*((unsigned int *)*i + 21) >= a3)
    {
      for (i = &i[TopoSubstring::isStartNode(*i) - 1]; ; --i)
      {
        isStartNode = TopoSubstring::isStartNode(*i);
        v18 = *i;
        if (isStartNode || *((_QWORD *)v18 + 5) != *((_QWORD *)v18 + 4))
          break;
      }
      v19 = *((_DWORD *)v18 + 6);
      v20 = *((_DWORD *)v18 + 21);
      if (v19)
        LODWORD(a3) = v19 + v20 - 1;
      else
        LODWORD(a3) = v20;
    }
    else
    {
      LODWORD(a3) = a3 - 1;
    }
    v21 = [CRTTMergeableStringIndex alloc];
    v22 = *((_DWORD *)*i + 21);
    v24 = *((_DWORD *)*i + 4);
    v23 = *((_DWORD *)*i + 5);
    v28 = *(_OWORD *)*i;
    LODWORD(v29) = v24;
    HIDWORD(v29) = a3 - v22 + v23;
    v25 = -[CRTTMergeableString renameGeneration](self, "renameGeneration", v28, v29);
    -[CRTTMergeableString version](self, "version");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CRTTMergeableStringIndex initWithTopoID:affinity:renameGeneration:maxCounter:](v21, "initWithTopoID:affinity:renameGeneration:maxCounter:", &v28, a4, v25, objc_msgSend(v26, "maxCounter"));

  }
  if (__p[1])
  {
    *(void **)&v35 = __p[1];
    operator delete(__p[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  return v16;
}

- (unint64_t)_characterIndexForIndex:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  TopoIDRange **v7;
  TopoIDRange **v8;
  TopoIDRange *v9;
  int v10;
  unsigned int clock;
  unsigned int v12;
  unint64_t v13;
  TopoID v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "index");
  else
    memset(&v15, 0, sizeof(v15));
  v6 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings", *(_QWORD *)v15.replica.uuid, *(_QWORD *)&v15.replica.uuid[8]);
  v7 = (TopoIDRange **)*v6;
  v8 = (TopoIDRange **)v6[1];
  while (1)
  {
    if (v7 == v8)
      goto LABEL_15;
    v9 = *v7;
    if (TopoIDRange::contains(*v7, &v15)
      || *(_QWORD *)&v9->charID.replica.index == *(_QWORD *)&v15.replica.index
      && !uuid_compare(v9->charID.replica.uuid, v15.replica.uuid))
    {
      break;
    }
    ++v7;
  }
  if (*(_QWORD *)&v9[1].charID.replica.uuid[12] == *(_QWORD *)&v9[1].charID.replica.uuid[4])
  {
    if (objc_msgSend(v5, "affinity") == 2)
    {
LABEL_15:
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    }
    v13 = *(unsigned int *)v9[3].charID.replica.uuid;
  }
  else
  {
    v10 = *(_DWORD *)v9[3].charID.replica.uuid;
    clock = v15.clock;
    v12 = v9->charID.clock;
    if (objc_msgSend(v5, "affinity"))
      v13 = clock + v10 - v12;
    else
      v13 = clock + v10 - v12 + 1;
  }
LABEL_16:

  return v13;
}

- (unint64_t)characterIndexForIndex:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v5 == objc_msgSend(v4, "renameGeneration"))
  {
    v6 = -[CRTTMergeableString _characterIndexForIndex:](self, "_characterIndexForIndex:", v4);
  }
  else
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString renamed:](self, "renamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renamed:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_characterIndexForIndex:", v9);

  }
  return v6;
}

- (void)enumerateSubstrings:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, _BYTE *);
  _QWORD *v5;
  uint64_t *v6;
  uint64_t *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _BYTE v12[28];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, _BYTE *))a3;
  v5 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = (uint64_t *)*v5;
  v7 = (uint64_t *)v5[1];
  while (v6 != v7)
  {
    v8 = (__int128 *)*v6;
    if (*(_QWORD *)(*v6 + 40) != *(_QWORD *)(*v6 + 32))
    {
      v9 = *((unsigned int *)v8 + 6);
      if ((_DWORD)v9)
      {
        v10 = *((unsigned int *)v8 + 21);
        v11 = *v8;
        *(_OWORD *)&v12[12] = *(__int128 *)((char *)v8 + 12);
        *(_OWORD *)v12 = v11;
        v4[2](v4, v10, v9, v12);
      }
    }
    ++v6;
  }

}

- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4
{
  return (void *)TopoSubstring::splitAt((TopoSubstring *)a3, a4);
}

- (int64_t)substringCount
{
  _QWORD *v2;

  v2 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  return (uint64_t)(v2[1] - *v2) >> 3;
}

- (void)updateAttributedStringAfterMerge
{
  void *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id attributedString;

  objc_msgSend(self->_attributedString, "cr_emptyCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v5 = (uint64_t *)*v4;
  v6 = (uint64_t *)v4[1];
  while (v5 != v6)
  {
    v7 = *v5;
    v8 = objc_msgSend(v3, "length");
    if (*(_QWORD *)(v7 + 40) != *(_QWORD *)(v7 + 32))
      objc_msgSend(v3, "cr_appendStorage:fromRange:", self->_attributedString, *(unsigned int *)(v7 + 84), *(unsigned int *)(v7 + 24));
    *(_DWORD *)(v7 + 84) = CRTTBoundedCheckedCastNSUIntegerToUInt32(v8);
    ++v5;
  }
  attributedString = self->_attributedString;
  self->_attributedString = v3;

}

- (void)updateSubstringIndexes
{
  uint64_t **v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;

  v2 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v3 = *v2;
  v4 = v2[1];
  if (*v2 != v4)
  {
    v5 = 0;
    do
    {
      v6 = *v3;
      *(_DWORD *)(v6 + 84) = v5;
      if (*(_QWORD *)(v6 + 40) != *(_QWORD *)(v6 + 32))
        v5 += *(_DWORD *)(v6 + 24);
      ++v3;
    }
    while (v3 != v4);
  }
}

- (void)coalesce
{
  _QWORD *i;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)(uint64_t);
  _OWORD v13[2];
  uint64_t v14;
  int v15;

  if (!self->_editCount)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x5812000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    memset(v13, 0, sizeof(v13));
    v14 = 0;
    v15 = 1065353216;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__CRTTMergeableString_coalesce__block_invoke;
    v7[3] = &unk_1E775E0B0;
    v7[4] = self;
    v7[5] = &v8;
    -[CRTTMergeableString traverseUnordered:](self, "traverseUnordered:", v7);
    if (v9[9])
    {
      for (i = (_QWORD *)v9[8]; i; i = (_QWORD *)*i)
      {
        v4 = (_QWORD *)i[2];
        if (v4)
        {
          v5 = (void *)v4[7];
          if (v5)
          {
            v4[8] = v5;
            operator delete(v5);
          }
          v6 = (void *)v4[4];
          if (v6)
          {
            v4[5] = v6;
            operator delete(v6);
          }
          MEMORY[0x1C3B7D750](v4, 0x10A0C409FE6E197);
        }
      }
      -[CRTTMergeableString invalidateCache](self, "invalidateCache");
    }
    _Block_object_dispose(&v8, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v13 + 8);
  }
}

uint64_t __31__CRTTMergeableString_coalesce__block_invoke(uint64_t result, TopoIDRange *this)
{
  const TopoIDRange **v3;
  char *v4;
  uint64_t v5;
  const TopoIDRange *v6;
  TopoSubstring *v7;
  TopoIDRange *v8;

  if (*(TopoIDRange **)(*(_QWORD *)(result + 32) + 120) != this)
  {
    v3 = *(const TopoIDRange ***)this[2].charID.replica.uuid;
    v4 = (char *)&this[2];
    if (*(_QWORD *)&this[2].charID.replica.uuid[8] - (_QWORD)v3 == 8)
    {
      v5 = result;
      do
      {
        v8 = 0;
        v6 = *v3;
        v8 = (TopoIDRange *)v6;
        if (v6[2].length != 1)
          break;
        result = TopoSubstring::isSequentialWith((TopoSubstring *)this, v6);
        if (!(_DWORD)result)
          break;
        v7 = (TopoSubstring *)this;
        if (v8 != this)
        {
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(v4, *(char **)v8[2].charID.replica.uuid, *(_QWORD *)&v8[2].charID.replica.uuid[8], (uint64_t)(*(_QWORD *)&v8[2].charID.replica.uuid[8] - *(_QWORD *)v8[2].charID.replica.uuid) >> 3);
          v7 = (TopoSubstring *)v8;
        }
        this->length += *((_DWORD *)v7 + 6);
        result = (uint64_t)std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 48, &v8, &v8);
        v3 = *(const TopoIDRange ***)this[2].charID.replica.uuid;
      }
      while (*(_QWORD *)&this[2].charID.replica.uuid[8] - (_QWORD)v3 == 8);
    }
  }
  return result;
}

- (BOOL)canMergeString:(id)a3
{
  return 1;
}

- (BOOL)hasDeltaTo:(id)a3 compareElements:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t **v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD *v31[2];

  v6 = a3;
  v7 = a4;
  v8 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v8 != objc_msgSend(v6, "renameGeneration"))
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString renamed:](self, "renamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renamed:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "hasDeltaTo:compareElements:", v18, v7);

    goto LABEL_6;
  }
  -[CRTTMergeableString version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasDeltaTo:", v10);

  if ((v11 & 1) == 0)
  {
    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addedByVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hasDeltaTo:", v13);

    if ((v14 & 1) == 0)
    {
      if (v7)
      {
        v20 = objc_msgSend(v6, "orderedSubstrings");
        v31[0] = 0;
        v31[1] = 0;
        v30 = (uint64_t *)v31;
        v21 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v22 = *v21;
        v23 = v21[1];
        while (v22 != v23)
        {
          v24 = *v22;
          *(_QWORD *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](&v30, (_OWORD *)*v22++) = v24;
        }
        v25 = *(uint64_t **)v20;
        if (*(_QWORD *)v20 != *(_QWORD *)(v20 + 8))
        {
          v26 = MEMORY[0x1E0C809B0];
          while (1)
          {
            v28[0] = v26;
            v28[1] = 3221225472;
            v28[2] = __50__CRTTMergeableString_hasDeltaTo_compareElements___block_invoke;
            v28[3] = &unk_1E775E0D8;
            v29 = v7;
            v27 = compareSubstring(v28, *v25, (uint64_t)&v30);

            if (v27)
              break;
            if (++v25 == *(uint64_t **)(v20 + 8))
              goto LABEL_15;
          }
          std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v31[0]);
          goto LABEL_4;
        }
LABEL_15:
        std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v31[0]);
      }
      v15 = 0;
      goto LABEL_6;
    }
  }
LABEL_4:
  v15 = 1;
LABEL_6:

  return v15;
}

uint64_t __50__CRTTMergeableString_hasDeltaTo_compareElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return 0;
}

- (unint64_t)mergeWithString:(id)a3 optimized:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t **v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  id v43;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  _QWORD v50[5];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t **v54;
  uint64_t v55;
  _QWORD *(*v56)(_QWORD *, _QWORD *);
  void (*v57)(uint64_t);
  void *v58;
  _QWORD **v59;
  _QWORD *v60[2];
  TopoReplica v61;
  uint64_t v62;

  v4 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  -[CRTTMergeableString version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v7, "copy");

  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v8, "copy");

  v9 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v9 != objc_msgSend(v6, "renameGeneration"))
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renamed:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    -[CRTTMergeableString apply:skipRetain:alwaysApply:](self, "apply:skipRetain:alwaysApply:", v10, 1, 0);
    v6 = (id)v11;
  }
  if (!v4)
    goto LABEL_6;
  -[CRTTMergeableString version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compareTo:", v13);

  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addedByVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compareTo:", v16) | v14;

  if (v17 < 3)
  {
    v18 = qword_1BE1B5788[v17];
  }
  else
  {
LABEL_6:
    v19 = (_QWORD *)objc_msgSend(v6, "orderedSubstrings", v45);
    v53 = 0;
    v54 = (uint64_t **)&v53;
    v56 = __Block_byref_object_copy__18;
    v57 = __Block_byref_object_dispose__19;
    v55 = 0x4812000000;
    v60[0] = 0;
    v60[1] = 0;
    v58 = &unk_1BE20E2A2;
    v59 = v60;
    v20 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v21 = *v20;
    v22 = v20[1];
    while (v21 != v22)
    {
      v23 = *v21;
      *(_QWORD *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](v54 + 6, (_OWORD *)*v21++) = v23;
    }
    v24 = v19[1];
    if (v24 != *v19)
    {
      v25 = MEMORY[0x1E0C809B0];
      do
      {
        v50[0] = v25;
        v50[1] = 3221225472;
        v50[2] = __49__CRTTMergeableString_mergeWithString_optimized___block_invoke;
        v50[3] = &unk_1E775E100;
        v50[4] = self;
        v51 = v6;
        v52 = &v53;
        v47[0] = v25;
        v47[1] = 3221225472;
        v47[2] = __49__CRTTMergeableString_mergeWithString_optimized___block_invoke_2;
        v47[3] = &unk_1E775E128;
        v47[4] = self;
        v48 = v51;
        v49 = &v53;
        v26 = *(_QWORD *)(v24 - 8);
        v24 -= 8;
        mergeSubstring(v50, v47, v26, v54 + 6, 0, 1u);

      }
      while (v24 != *v19);
    }
    -[CRTTMergeableString version](self, "version");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "merge:", v28);

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addedByVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "merge:", v30);

    -[CRTTMergeableString version](self, "version");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    TopoReplica::objc(&self->_replica);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v6, "replica");
    else
      memset(&v61, 0, sizeof(v61));
    TopoReplica::objc(&v61);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainOrReleaseWithInitial:current:forReplica:copyingFrom:](CRGlobalContextObjC, "retainOrReleaseWithInitial:current:forReplica:copyingFrom:", v45, v31, v32, v33);

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString addedByReplica](self, "addedByReplica");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addedByReplica");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainOrReleaseWithInitial:current:forReplica:copyingFrom:](CRGlobalContextObjC, "retainOrReleaseWithInitial:current:forReplica:copyingFrom:", v46, v34, v35, v36);

    -[CRTTMergeableString context](self, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37 == 0;

    if (v38)
    {
      objc_msgSend(v6, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRTTMergeableString setContext:](self, "setContext:", v39);

    }
    -[CRTTMergeableString temporaryConcurrentNames](self, "temporaryConcurrentNames");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v40, "isEmpty") & 1) == 0)
    {
      -[CRTTMergeableString invalidateCache](self, "invalidateCache");
      -[CRTTMergeableString context](self, "context");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
      {
        v43 = +[CRContext newTransientContextObjC](CRContext, "newTransientContextObjC");
      }
      else
      {
        -[CRTTMergeableString context](self, "context");
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[CRTTMergeableString applyRenamesAndRetainOrRelease:context:](self, "applyRenamesAndRetainOrRelease:context:", v40, v43);

    }
    -[CRTTMergeableString sortSplitNodes](self, "sortSplitNodes");
    -[CRTTMergeableString invalidateCache](self, "invalidateCache");
    -[CRTTMergeableString updateAttributedStringAfterMerge](self, "updateAttributedStringAfterMerge");
    -[CRTTMergeableString coalesce](self, "coalesce");

    _Block_object_dispose(&v53, 8);
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v60[0]);
    v18 = 3;
  }

  return v18;
}

void __49__CRTTMergeableString_mergeWithString_optimized___block_invoke(uint64_t a1, uint64_t a2, const TopoSubstring *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  ObjCVersion *v11;
  ObjCVersion *v12;
  void *v13;
  id v14;

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v7;
  if (*(_DWORD *)(a2 + 24))
  {
    v10 = *(_QWORD *)(a2 + 32);
    v9 = *(_QWORD *)(a2 + 40);
    objc_msgSend(v7, "addedByVersion");
    v11 = (ObjCVersion *)objc_claimAutoreleasedReturnValue();
    TopoSubstring::removeAddsNotIn((TopoSubstring *)a2, a3, v11);

    objc_msgSend(v14, "addedByVersion");
    v12 = (ObjCVersion *)objc_claimAutoreleasedReturnValue();
    TopoSubstring::addAddsIn((TopoSubstring *)a2, a3, v12);

    objc_msgSend(v8, "attributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    mergeStringData(v14, v9 == v10, a2, (uint64_t)a3, v13, 0);

  }
  mergeAddChildren(a2, (uint64_t)a3, v6 + 48);

}

void __49__CRTTMergeableString_mergeWithString_optimized___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  mergeAddNewSubstring(v4, v5, a2, (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48));

}

- (BOOL)canDeltaMerge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v4 = a3;
  -[CRTTMergeableString version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasTemporaryComponents") & 1) != 0 || objc_msgSend(v6, "hasTemporaryComponents"))
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copy");

    v9 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v8, "apply:", v7);
    objc_msgSend(v9, "apply:", v7);

    v5 = v8;
    v6 = v9;
  }
  objc_msgSend(v4, "fromVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasDeltaTo:", v10) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "fromAddedByVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "hasDeltaTo:", v12);

    v11 = v13 ^ 1;
  }

  return v11;
}

- (BOOL)deltaMerge:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t **v34;
  uint64_t v35;
  _QWORD *(*v36)(_QWORD *, _QWORD *);
  void (*v37)(uint64_t);
  void *v38;
  _QWORD **v39;
  _QWORD *v40[3];

  v4 = a3;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  v5 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v5 < objc_msgSend(v4, "renameGeneration")
    && -[CRTTMergeableString needToFinalizeTimestamps](self, "needToFinalizeTimestamps"))
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString apply:skipRetain:alwaysApply:](self, "apply:skipRetain:alwaysApply:", v6, 0, 0);

  }
  v7 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  v8 = objc_msgSend(v4, "renameGeneration");
  if (v7 <= v8)
    v9 = v8;
  else
    v9 = v7;
  -[CRTTMergeableString setRenameGeneration:](self, "setRenameGeneration:", v9);
  v10 = -[CRTTMergeableString canDeltaMerge:](self, "canDeltaMerge:", v4);
  if (v10)
  {
    v11 = (_QWORD *)objc_msgSend(v4, "orderedSubstrings");
    v33 = 0;
    v34 = (uint64_t **)&v33;
    v36 = __Block_byref_object_copy__18;
    v37 = __Block_byref_object_dispose__19;
    v35 = 0x4812000000;
    v40[0] = 0;
    v40[1] = 0;
    v38 = &unk_1BE20E2A2;
    v39 = v40;
    v12 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v13 = *v12;
    v14 = v12[1];
    while (v13 != v14)
    {
      v15 = *v13;
      *(_QWORD *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](v34 + 6, (_OWORD *)*v13++) = v15;
    }
    v16 = v11[1];
    if (v16 != *v11)
    {
      v17 = MEMORY[0x1E0C809B0];
      do
      {
        v30[0] = v17;
        v30[1] = 3221225472;
        v30[2] = __34__CRTTMergeableString_deltaMerge___block_invoke;
        v30[3] = &unk_1E775E100;
        v30[4] = self;
        v31 = v4;
        v32 = &v33;
        v27[0] = v17;
        v27[1] = 3221225472;
        v27[2] = __34__CRTTMergeableString_deltaMerge___block_invoke_2;
        v27[3] = &unk_1E775E128;
        v27[4] = self;
        v28 = v31;
        v29 = &v33;
        v18 = *(_QWORD *)(v16 - 8);
        v16 -= 8;
        mergeSubstring(v30, v27, v18, v34 + 6, 0, 1u);

      }
      while (v16 != *v11);
    }
    -[CRTTMergeableString version](self, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "merge:", v20);

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addedByVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "merge:", v22);

    -[CRTTMergeableString temporaryConcurrentNames](self, "temporaryConcurrentNames");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEmpty") & 1) == 0)
    {
      -[CRTTMergeableString invalidateCache](self, "invalidateCache");
      -[CRTTMergeableString context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[CRTTMergeableString context](self, "context");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = +[CRContext newTransientContextObjC](CRContext, "newTransientContextObjC");
      }
      -[CRTTMergeableString applyRenamesAndRetainOrRelease:context:](self, "applyRenamesAndRetainOrRelease:context:", v23, v25);

    }
    -[CRTTMergeableString sortSplitNodes](self, "sortSplitNodes");
    -[CRTTMergeableString invalidateCache](self, "invalidateCache");
    -[CRTTMergeableString updateAttributedStringAfterMerge](self, "updateAttributedStringAfterMerge");
    -[CRTTMergeableString coalesce](self, "coalesce");

    _Block_object_dispose(&v33, 8);
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v40[0]);
  }

  return v10;
}

void __34__CRTTMergeableString_deltaMerge___block_invoke(uint64_t a1, uint64_t a2, const TopoSubstring *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  ObjCVersion *v12;
  id v13;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = v6;
  v13 = v7;
  if (*(_DWORD *)(a2 + 24))
  {
    v11 = *(_QWORD *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 40);
    TopoSubstring::removeDeltaAddsNotIn((TopoSubstring *)a2, a3);
    objc_msgSend(v9, "addedByVersion");
    v12 = (ObjCVersion *)objc_claimAutoreleasedReturnValue();
    TopoSubstring::addAddsIn((TopoSubstring *)a2, a3, v12);

    mergeStringData(v9, v10 == v11, a2, (uint64_t)a3, v13, 1);
  }
  mergeAddChildren(a2, (uint64_t)a3, v8 + 48);

}

void __34__CRTTMergeableString_deltaMerge___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  mergeAddNewSubstring(v4, v5, a2, (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48));

}

- (id)undoCommandToChangeFrom:(id)a3 unedited:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CRTTMergeableStringUndoEditCommand *v9;
  CRTTMergeableStringUndoEditCommand *v10;
  uint64_t *v11;
  __int128 **v12;
  __int128 **v13;
  __int128 *v14;
  void **v15;
  unint64_t v16;
  _OWORD *v17;
  __int128 v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  char *v27;
  char *v28;
  _OWORD *v29;
  __int128 v30;
  _QWORD *v31;
  CRTTMergeableStringUndoEditCommand *v32;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "undoCommandToChangeTo:unedited:", self, v7);
    v9 = (CRTTMergeableStringUndoEditCommand *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = v7;
    v10 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
    v11 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v12 = (__int128 **)*v11;
    v13 = (__int128 **)v11[1];
    if ((__int128 **)*v11 != v13)
    {
      do
      {
        v14 = *v12;
        if (*((_DWORD *)*v12 + 6))
        {
          v15 = -[CRTTMergeableStringUndoEditCommand deleteRanges](v10, "deleteRanges");
          v16 = (unint64_t)v15[2];
          v17 = v15[1];
          if ((unint64_t)v17 >= v16)
          {
            v20 = 0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (_BYTE *)*v15) >> 2);
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) > 0x924924924924924)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v16 - (_QWORD)*v15) >> 2);
            if (2 * v22 > v21)
              v21 = 2 * v22;
            if (v22 >= 0x492492492492492)
              v23 = 0x924924924924924;
            else
              v23 = v21;
            if (v23)
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v15 + 2), v23);
            else
              v24 = 0;
            v25 = &v24[28 * v20];
            v26 = *v14;
            *(_OWORD *)(v25 + 12) = *(__int128 *)((char *)v14 + 12);
            *(_OWORD *)v25 = v26;
            v28 = (char *)*v15;
            v27 = (char *)v15[1];
            v29 = v25;
            if (v27 != *v15)
            {
              do
              {
                v30 = *(_OWORD *)(v27 - 28);
                *(v29 - 1) = *((_OWORD *)v27 - 1);
                *(_OWORD *)((char *)v29 - 28) = v30;
                v29 = (_OWORD *)((char *)v29 - 28);
                v27 -= 28;
              }
              while (v27 != v28);
              v27 = (char *)*v15;
            }
            v19 = v25 + 28;
            *v15 = v29;
            v15[1] = v25 + 28;
            v15[2] = &v24[28 * v23];
            if (v27)
              operator delete(v27);
          }
          else
          {
            v18 = *v14;
            *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)v14 + 12);
            *v17 = v18;
            v19 = (char *)v17 + 28;
          }
          v15[1] = v19;
        }
        ++v12;
      }
      while (v12 != v13);
    }
    v31 = -[CRTTMergeableStringUndoEditCommand deleteRanges](v10, "deleteRanges");
    if (v31[1] == *v31)
      v32 = 0;
    else
      v32 = v10;
    v9 = v32;

    v8 = v34;
  }

  return v9;
}

- (void)compareTo:(id)a3 merge:(id)a4 add:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  uint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  _QWORD *v28[2];
  void *__p;
  _QWORD *v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v11 == objc_msgSend(v8, "renameGeneration"))
  {
    v12 = objc_msgSend(v8, "orderedSubstrings");
    __p = 0;
    v30 = 0;
    v31 = 0;
    v28[0] = 0;
    v28[1] = 0;
    v13 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings", v28);
    v14 = *v13;
    v15 = v13[1];
    while (v14 != v15)
    {
      v16 = *v14;
      *(_QWORD *)std::map<TopoIDRange,TopoSubstring *,$_2,std::allocator<std::pair<TopoIDRange const,TopoSubstring *>>>::operator[](&v27, (_OWORD *)*v14++) = v16;
    }
    v20 = *(uint64_t **)v12;
    v21 = *(uint64_t **)(v12 + 8);
    if (v20 != v21)
    {
      do
        mergeSubstring(v9, v10, *v20++, &v27, &__p, 0);
      while (v20 != v21);
      v22 = __p;
      v23 = v30;
      while (v22 != v23)
      {
        v24 = (_QWORD *)*v22;
        if (*v22)
        {
          v25 = (void *)v24[7];
          if (v25)
          {
            v24[8] = v25;
            operator delete(v25);
          }
          v26 = (void *)v24[4];
          if (v26)
          {
            v24[5] = v26;
            operator delete(v26);
          }
          MEMORY[0x1C3B7D750](v24, 0x10A0C409FE6E197);
        }
        ++v22;
      }
    }
    std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v28[0]);
    if (__p)
    {
      v30 = __p;
      operator delete(__p);
    }
  }
  else
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString renamed:](self, "renamed:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "compareTo:merge:add:", v18, v9, v10);

  }
}

- (id)undoCommandToChangeTo:(id)a3 unedited:(id)a4
{
  id v6;
  id v7;
  CRTTMergeableStringUndoEditCommand *v8;
  uint64_t v9;
  id v10;
  id v11;
  CRTTMergeableStringUndoEditCommand *v12;
  _QWORD *v13;
  _QWORD *v14;
  CRTTMergeableStringUndoEditCommand *v15;
  _QWORD v17[4];
  CRTTMergeableStringUndoEditCommand *v18;
  _QWORD v19[4];
  CRTTMergeableStringUndoEditCommand *v20;
  CRTTMergeableString *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke;
  v19[3] = &unk_1E775E150;
  v20 = v8;
  v21 = self;
  v10 = v7;
  v23 = v10;
  v11 = v6;
  v22 = v11;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke_2;
  v17[3] = &unk_1E775E088;
  v12 = v20;
  v18 = v12;
  -[CRTTMergeableString compareTo:merge:add:](self, "compareTo:merge:add:", v11, v19, v17);
  -[CRTTMergeableStringUndoEditCommand retainTemporaryIDs](v12, "retainTemporaryIDs");
  v13 = -[CRTTMergeableStringUndoEditCommand deleteRanges](v12, "deleteRanges");
  if (v13[1] == *v13
    && (v14 = -[CRTTMergeableStringUndoEditCommand insertStrings](v12, "insertStrings"), v14[1] == *v14))
  {
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

void __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  _OWORD *v9;
  unint64_t v10;
  __int128 v11;
  char *v12;
  char **v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  CRTTMergeableStringRange *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  CRTTMergeableStringRange *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  char *v55;
  char *v56;
  __int128 v57;
  char *v58;
  _QWORD v59[5];
  _OWORD v60[2];
  _OWORD v61[2];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a2 + 24))
    return;
  v7 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  if (*((_QWORD *)a3 + 5) != *((_QWORD *)a3 + 4))
  {
    if (v6 == v7)
    {
      v8 = (void **)objc_msgSend(*(id *)(a1 + 32), "deleteRanges");
      v9 = v8[1];
      v10 = (unint64_t)v8[2];
      if ((unint64_t)v9 >= v10)
      {
        v34 = 0x6DB6DB6DB6DB6DB7 * (((char *)v9 - (_BYTE *)*v8) >> 2);
        v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) > 0x924924924924924)
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        v36 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - (_QWORD)*v8) >> 2);
        if (2 * v36 > v35)
          v35 = 2 * v36;
        if (v36 >= 0x492492492492492)
          v37 = 0x924924924924924;
        else
          v37 = v35;
        if (v37)
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v8 + 2), v37);
        else
          v38 = 0;
        v52 = &v38[28 * v34];
        v53 = &v38[28 * v37];
        v54 = *a3;
        *(_OWORD *)(v52 + 12) = *(__int128 *)((char *)a3 + 12);
        *(_OWORD *)v52 = v54;
        v12 = v52 + 28;
        v56 = (char *)*v8;
        v55 = (char *)v8[1];
        if (v55 != *v8)
        {
          do
          {
            v57 = *(_OWORD *)(v55 - 28);
            *((_OWORD *)v52 - 1) = *((_OWORD *)v55 - 1);
            *(_OWORD *)(v52 - 28) = v57;
            v52 -= 28;
            v55 -= 28;
          }
          while (v55 != v56);
          v55 = (char *)*v8;
        }
        *v8 = v52;
        v8[1] = v12;
        v8[2] = v53;
        if (v55)
          operator delete(v55);
      }
      else
      {
        v11 = *a3;
        *(_OWORD *)((char *)v9 + 12) = *(__int128 *)((char *)a3 + 12);
        *v9 = v11;
        v12 = (char *)v9 + 28;
      }
      v8[1] = v12;
      return;
    }
    goto LABEL_12;
  }
  if (v6 == v7)
  {
LABEL_12:
    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
    {
      v24 = [CRTTMergeableStringRange alloc];
      v60[0] = *a3;
      *(_OWORD *)((char *)v60 + 12) = *(__int128 *)((char *)a3 + 12);
      v25 = objc_msgSend(*(id *)(a1 + 40), "renameGeneration");
      objc_msgSend(*(id *)(a1 + 40), "version");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "maxCounter");

      objc_msgSend(*(id *)(a1 + 48), "version");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "maxCounter");

      if (v27 <= v29)
        v30 = v29;
      else
        v30 = v27;
      v31 = -[CRTTMergeableStringRange initWithTopoIDRange:renameGeneration:maxCounter:](v24, "initWithTopoIDRange:renameGeneration:maxCounter:", v60, v25, v30);
      if (*((_QWORD *)a3 + 5) == *((_QWORD *)a3 + 4))
        v32 = 0;
      else
        v32 = *((unsigned int *)a3 + 6);
      if (*(_QWORD *)(a2 + 40) == *(_QWORD *)(a2 + 32))
        v33 = 0;
      else
        v33 = *(unsigned int *)(a2 + 24);
      (*(void (**)(uint64_t, CRTTMergeableStringRange *, _QWORD, uint64_t, _QWORD, uint64_t))(v23 + 16))(v23, v31, *((unsigned int *)a3 + 21), v32, *(unsigned int *)(a2 + 84), v33);

    }
    return;
  }
  v13 = (char **)objc_msgSend(*(id *)(a1 + 32), "insertStrings");
  objc_msgSend(*(id *)(a1 + 40), "attributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (*(_QWORD *)(a2 + 40) == *(_QWORD *)(a2 + 32))
    v16 = 0;
  else
    v16 = *(unsigned int *)(a2 + 24);
  objc_msgSend(v14, "cr_storageFromRange:", *(unsigned int *)(a2 + 84), v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v61[0] = *a3;
  *(_OWORD *)((char *)v61 + 12) = *(__int128 *)((char *)a3 + 12);
  v18 = (unint64_t)v13[2];
  v19 = (unint64_t)v13[1];
  if (v19 >= v18)
  {
    v39 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (_QWORD)*v13) >> 3);
    v40 = v39 + 1;
    if (v39 + 1 > 0x666666666666666)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v41 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - (_QWORD)*v13) >> 3);
    if (2 * v41 > v40)
      v40 = 2 * v41;
    if (v41 >= 0x333333333333333)
      v42 = 0x666666666666666;
    else
      v42 = v40;
    v59[4] = v13 + 2;
    v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v13 + 2), v42);
    v45 = &v43[40 * v39];
    *(_OWORD *)(v45 + 12) = *(_OWORD *)((char *)v61 + 12);
    *(_OWORD *)v45 = v61[0];
    *((_QWORD *)v45 + 4) = v17;
    v47 = *v13;
    v46 = v13[1];
    if (v46 == *v13)
    {
      v51 = v13[1];
      v48 = &v43[40 * v39];
    }
    else
    {
      v48 = &v43[40 * v39];
      do
      {
        v49 = *(_OWORD *)(v46 - 40);
        *(_OWORD *)(v48 - 28) = *(_OWORD *)(v46 - 28);
        *(_OWORD *)(v48 - 40) = v49;
        v50 = *((_QWORD *)v46 - 1);
        *((_QWORD *)v46 - 1) = 0;
        *((_QWORD *)v48 - 1) = v50;
        v48 -= 40;
        v46 -= 40;
      }
      while (v46 != v47);
      v51 = *v13;
      v46 = v13[1];
    }
    v22 = v45 + 40;
    *v13 = v48;
    v59[0] = v51;
    v59[1] = v51;
    v13[1] = v45 + 40;
    v59[2] = v46;
    v58 = v13[2];
    v13[2] = &v43[40 * v44];
    v59[3] = v58;
    std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v59);
  }
  else
  {
    v20 = *a3;
    v21 = *((_QWORD *)a3 + 2);
    *(_DWORD *)(v19 + 24) = *((_DWORD *)a3 + 6);
    *(_QWORD *)(v19 + 16) = v21;
    *(_OWORD *)v19 = v20;
    *(_QWORD *)(v19 + 32) = v17;
    v22 = (char *)(v19 + 40);
  }
  v13[1] = v22;

}

void __54__CRTTMergeableString_undoCommandToChangeTo_unedited___block_invoke_2(uint64_t a1, __int128 *a2)
{
  void **v3;
  _OWORD *v4;
  unint64_t v5;
  __int128 v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;
  char *v17;
  __int128 v18;

  if (*((_QWORD *)a2 + 5) != *((_QWORD *)a2 + 4))
  {
    v3 = (void **)objc_msgSend(*(id *)(a1 + 32), "deleteRanges");
    v4 = v3[1];
    v5 = (unint64_t)v3[2];
    if ((unint64_t)v4 >= v5)
    {
      v8 = 0x6DB6DB6DB6DB6DB7 * (((char *)v4 - (_BYTE *)*v3) >> 2);
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) > 0x924924924924924)
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      v10 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5 - (_QWORD)*v3) >> 2);
      if (2 * v10 > v9)
        v9 = 2 * v10;
      if (v10 >= 0x492492492492492)
        v11 = 0x924924924924924;
      else
        v11 = v9;
      if (v11)
        v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v3 + 2), v11);
      else
        v12 = 0;
      v13 = &v12[28 * v8];
      v14 = &v12[28 * v11];
      v15 = *a2;
      *(_OWORD *)(v13 + 12) = *(__int128 *)((char *)a2 + 12);
      *(_OWORD *)v13 = v15;
      v7 = v13 + 28;
      v17 = (char *)*v3;
      v16 = (char *)v3[1];
      if (v16 != *v3)
      {
        do
        {
          v18 = *(_OWORD *)(v16 - 28);
          *((_OWORD *)v13 - 1) = *((_OWORD *)v16 - 1);
          *(_OWORD *)(v13 - 28) = v18;
          v13 -= 28;
          v16 -= 28;
        }
        while (v16 != v17);
        v16 = (char *)*v3;
      }
      *v3 = v13;
      v3[1] = v7;
      v3[2] = v14;
      if (v16)
        operator delete(v16);
    }
    else
    {
      v6 = *a2;
      *(_OWORD *)((char *)v4 + 12) = *(__int128 *)((char *)a2 + 12);
      *v4 = v6;
      v7 = (char *)v4 + 28;
    }
    v3[1] = v7;
  }
}

- (void)deltaTo:(id)a3 edited:(id)a4 unedited:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, __n128 *);
  uint64_t (*v50)();
  void *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x4012000000;
  v49 = __Block_byref_object_copy__25;
  v50 = __Block_byref_object_dispose__26;
  v51 = &unk_1BE20E2A2;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__28;
  v40 = __Block_byref_object_dispose__29;
  v41 = 0;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke;
  aBlock[3] = &unk_1E775E178;
  v32 = &v42;
  v33 = &v46;
  v34 = &v52;
  v11 = v8;
  v31 = v11;
  v35 = &v36;
  v12 = v7;
  v30 = v12;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_2;
  v20[3] = &unk_1E775E1A0;
  v21 = _Block_copy(aBlock);
  v24 = v56;
  v13 = v9;
  v22 = v13;
  v25 = &v42;
  v14 = v11;
  v23 = v14;
  v26 = &v46;
  v27 = &v52;
  v28 = &v36;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_3;
  v17[3] = &unk_1E775E1C8;
  v15 = v21;
  v18 = v15;
  v19 = v56;
  -[CRTTMergeableString compareTo:merge:add:](self, "compareTo:merge:add:", v12, v20, v17);
  if (*((_BYTE *)v43 + 24))
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))v14 + 2))(v14, v47[6], v47[7], v53[3], v37[5]);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);

}

void __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || a2 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56)
          + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48)
          + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && ((*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))(),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0) == 0))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)(v12 + 48) = a2;
    *(_QWORD *)(v12 + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  if (a4 < 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56) += a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a4;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a4;
    if (a4)
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "attributedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      if (v15)
      {
        objc_msgSend(v15, "cr_appendStorage:fromRange:", v16, a5, a6);
      }
      else
      {
        objc_msgSend(v16, "cr_storageFromRange:", a5, a6);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

      }
    }
  }
}

uint64_t __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    v6 = (_QWORD *)result;
    v8 = *(_QWORD *)(a3 + 32);
    v7 = *(_QWORD *)(a3 + 40);
    v10 = *(_QWORD *)(a2 + 32);
    v9 = *(_QWORD *)(a2 + 40);
    if (v7 == v8)
    {
      if (v9 != v10)
        return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    }
    else
    {
      if (v9 == v10)
      {
        result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
      }
      else
      {
        result = *(_QWORD *)(result + 40);
        if (result)
        {
          if (*(_BYTE *)(*(_QWORD *)(v6[8] + 8) + 24))
          {
            (*(void (**)(void))(v6[6] + 16))();
            *(_BYTE *)(*(_QWORD *)(v6[8] + 8) + 24) = 0;
            result = v6[5];
            v8 = *(_QWORD *)(a3 + 32);
            v7 = *(_QWORD *)(a3 + 40);
            v10 = *(_QWORD *)(a2 + 32);
            v9 = *(_QWORD *)(a2 + 40);
            v3 = *(_DWORD *)(a2 + 24);
          }
          if (v7 == v8)
            v11 = 0;
          else
            v11 = *(unsigned int *)(a3 + 24);
          if (v9 == v10)
            v12 = 0;
          else
            v12 = v3;
          result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(result + 16))(result, *(unsigned int *)(a3 + 84), v11, *(unsigned int *)(a2 + 84), v12);
        }
      }
      *(_QWORD *)(*(_QWORD *)(v6[7] + 8) + 24) += *(unsigned int *)(a3 + 24);
    }
  }
  return result;
}

uint64_t __47__CRTTMergeableString_deltaTo_edited_unedited___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(a2 + 40) != *(_QWORD *)(a2 + 32))
  {
    v2 = result;
    v3 = *(unsigned int *)(a2 + 24);
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) += v3;
  }
  return result;
}

- (void)sortSplitNodes
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  minIdPath((__int128 *)self->_startNode, 0, (uint64_t)v2);
}

- (void)traverseUnordered:(id)a3
{
  traverseUnordered((uint64_t)self->_startNode, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTTMergeableString attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p = '%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id attributedString;
  void *v6;
  BOOL v7;

  v4 = a3;
  attributedString = self->_attributedString;
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(attributedString) = objc_msgSend(attributedString, "isEqual:", v6);

  v7 = (attributedString & 1) != 0 && -[CRTTMergeableString graphIsEqual:](self, "graphIsEqual:", v4);
  return v7;
}

- (BOOL)graphIsEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const unsigned __int8 *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[6];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t (*v38)(uint64_t);
  _BYTE v39[32];
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v4 = a3;
  v5 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v5 == objc_msgSend(v4, "renameGeneration"))
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    v34 = 0;
    v35 = &v34;
    v36 = 0x5812000000;
    v37 = __Block_byref_object_copy__34;
    v38 = __Block_byref_object_dispose__35;
    memset(v39, 0, sizeof(v39));
    v40 = 0;
    v41 = 1065353216;
    -[CRTTMergeableString coalesce](self, "coalesce");
    objc_msgSend(v4, "coalesce");
    -[CRTTMergeableString version](self, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_29;
    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addedByVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if ((v11 & 1) == 0)
      goto LABEL_29;
    v12 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __36__CRTTMergeableString_graphIsEqual___block_invoke;
    v33[3] = &unk_1E775DFE8;
    v33[4] = &v34;
    -[CRTTMergeableString traverseUnordered:](self, "traverseUnordered:", v33);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __36__CRTTMergeableString_graphIsEqual___block_invoke_2;
    v32[3] = &unk_1E775E1F0;
    v32[4] = &v34;
    v32[5] = &v42;
    objc_msgSend(v4, "traverseUnordered:", v32);
    v13 = v43;
    if (*((_BYTE *)v43 + 24))
    {
      v14 = v35 + 8;
      do
      {
        v14 = (_QWORD *)*v14;
        v15 = v14 == 0;
        if (!v14)
          break;
        v16 = (_QWORD *)v14[5];
        v17 = (_QWORD *)v14[6];
        if (v16)
          v18 = v17 == 0;
        else
          v18 = 1;
        if (v18 || (v19 = v16[4], v20 = v16[5], v21 = v17[4], v20 - v19 != v17[5] - v21))
        {
LABEL_33:
          v15 = 0;
          *((_BYTE *)v13 + 24) = 0;
          break;
        }
        while (v19 != v20)
        {
          if (*(_DWORD *)(v19 + 20) != *(_DWORD *)(v21 + 20)
            || *(_DWORD *)(v19 + 16) != *(_DWORD *)(v21 + 16)
            || uuid_compare((const unsigned __int8 *)v19, (const unsigned __int8 *)v21))
          {
            goto LABEL_32;
          }
          v19 += 24;
          v21 += 24;
        }
        v23 = v16[7];
        v22 = v16[8];
        v24 = (v22 - v23) >> 3;
        if (v24 != (uint64_t)(v17[8] - v17[7]) >> 3)
        {
LABEL_32:
          v13 = v43;
          goto LABEL_33;
        }
        if (v22 != v23)
        {
          v25 = 0;
          if (v24 <= 1)
            v26 = 1;
          else
            v26 = (v22 - v23) >> 3;
          while (1)
          {
            v27 = *(const unsigned __int8 **)(v16[7] + 8 * v25);
            if (uuid_compare(v27, v27))
              break;
            if (v26 == ++v25)
              goto LABEL_26;
          }
          *((_BYTE *)v43 + 24) = 0;
        }
LABEL_26:
        v13 = v43;
      }
      while (*((_BYTE *)v43 + 24));
    }
    else
    {
LABEL_29:
      v15 = 0;
    }
    _Block_object_dispose(&v34, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v39[8]);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString renamed:](self, "renamed:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renamed:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v29, "graphIsEqual:", v30);

  }
  return v15;
}

_QWORD *__36__CRTTMergeableString_graphIsEqual___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  _OWORD *v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v4, (uint64_t)a2, (uint64_t)&std::piecewise_construct, &v7)+ 5) = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v5, (uint64_t)a2, (uint64_t)&std::piecewise_construct, &v7);
  result[6] = 0;
  return result;
}

uint64_t *__36__CRTTMergeableString_graphIsEqual___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::find<TopoID>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), a2);
  if (result)
  {
    result[6] = a2;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)dotDescription:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void ***v9;
  void **v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v31;
  void **v32;
  __CFString *v33;
  CRTTMergeableString *v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendFormat:", CFSTR("subgraph cluster_%ld%p_%ld {\n  rankdir=\"LR\";\n"), a3, self, a3);
  v34 = self;
  -[CRTTMergeableString attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRTTMergeableString replica](self, "replica");
  TopoReplica::toString((TopoReplica *)v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  label=\"%@_%ld version=(%@) addedBy=(%@)    '%@'\"\n"), v8, a3, v34->_version, v34->_addedByVersion, v31);

  objc_msgSend(v5, "appendFormat:", CFSTR("  color=lightgrey;\n"));
  v9 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = *v9;
  v32 = v9[1];
  if (*v9 != v32)
  {
    do
    {
      v11 = *v10;
      if (v34->_startNode == *v10)
      {
        v16 = CFSTR("  N%ld%p [label=\"Start\"];\n");
      }
      else
      {
        if (v34->_endNode != v11)
        {
          if (v11[5] == v11[4])
          {
            v33 = &stru_1E77650F0;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v12 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v34->_attributedString, "string");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v11[5] == v11[4])
                v15 = 0;
              else
                v15 = *((unsigned int *)v11 + 6);
              objc_msgSend(v13, "substringWithRange:", *((unsigned int *)v11 + 21), v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v18);
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

              goto LABEL_19;
            }
            objc_opt_class();
            v33 = CFSTR("?");
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v11[5] == v11[4])
                v17 = 0;
              else
                v17 = *((unsigned int *)v11 + 6);
              v19 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v34->_attributedString, "substringWithRange:", *((unsigned int *)v11 + 21), v17);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v14);
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

            }
          }
          v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v21 = (__int128 *)v11[4];
          v22 = (__int128 *)v11[5];
          while (v21 != v22)
          {
            v23 = *v21;
            *(_QWORD *)&v35[16] = *((_QWORD *)v21 + 2);
            *(_OWORD *)v35 = v23;
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v35);
            objc_msgSend(v24, "CRTTShortDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendFormat:", CFSTR("%@.%d,%d "), v25, *(unsigned int *)&v35[16], *(unsigned int *)&v35[20]);

            v21 = (__int128 *)((char *)v21 + 24);
          }
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v11);
          objc_msgSend(v26, "CRTTShortDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"%@ %@.%d,%d-%u (%@)\"];\n"),
            a3,
            v11,
            v33,
            v27,
            *((unsigned int *)v11 + 4),
            *((unsigned int *)v11 + 5),
            (*((_DWORD *)v11 + 5) + *((_DWORD *)v11 + 6) - 1),
            v20);

          goto LABEL_24;
        }
        v16 = CFSTR("  N%ld%p [label=\"End\"];\n");
      }
      objc_msgSend(v5, "appendFormat:", v16, a3, v11);
LABEL_24:
      v28 = (_QWORD *)v11[7];
      v29 = (_QWORD *)v11[8];
      while (v28 != v29)
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p -> N%ld%p;\n"), a3, v11, a3, *v28++);
      ++v10;
    }
    while (v10 != v32);
  }
  objc_msgSend(v5, "appendString:", CFSTR("}\n"));

  return v5;
}

- (void)useRenameIfAvailable
{
  CRTTMergeableString *renamedString;
  CRTTMergeableString *v3;
  CRTTMergeableString *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_renamedString)
  {
    -[CRTTMergeableString deleteAllSubstrings](obj, "deleteAllSubstrings");
    renamedString = obj->_renamedString;
    obj->_startNode = renamedString->_startNode;
    obj->_endNode = renamedString->_endNode;
    objc_storeStrong((id *)&obj->_version, renamedString->_version);
    objc_storeStrong((id *)&obj->_addedByVersion, obj->_renamedString->_addedByVersion);
    obj->_renameGeneration = -[CRTTMergeableString renameGeneration](obj->_renamedString, "renameGeneration");
    obj->_renamedString->_startNode = 0;
    obj->_renamedString->_orderedSubstrings.__end_ = obj->_renamedString->_orderedSubstrings.__begin_;
    v3 = obj->_renamedString;
    obj->_renamedString = 0;

    -[CRTTMergeableString invalidateCache](obj, "invalidateCache");
  }
  objc_sync_exit(obj);

}

- (void)apply:(id)a3 skipRetain:(BOOL)a4 alwaysApply:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v17 = v8;
  if (v6)
  {
    -[CRTTMergeableString _apply:alwaysApply:](self, "_apply:alwaysApply:", v8, v5);
  }
  else
  {
    -[CRTTMergeableString version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    -[CRTTMergeableString _apply:alwaysApply:](self, "_apply:alwaysApply:", v17, v5);
    -[CRTTMergeableString version](self, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TopoReplica::objc(&self->_replica);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainOrReleaseWithInitial:current:forReplica:](CRGlobalContextObjC, "retainOrReleaseWithInitial:current:forReplica:", v10, v13, v14);

    -[CRTTMergeableString addedByVersion](self, "addedByVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString addedByReplica](self, "addedByReplica");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainOrReleaseWithInitial:current:forReplica:](CRGlobalContextObjC, "retainOrReleaseWithInitial:current:forReplica:", v12, v15, v16);

  }
}

- (void)_apply:(id)a3 alwaysApply:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[4];

  v6 = a3;
  v7 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v7 < objc_msgSend(v6, "generation") || a4)
  {
    v8 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v9 = *v8;
    v10 = v8[1];
    if (*v8 != v10)
    {
      do
      {
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x2020000000;
        v11 = *v9;
        v18[3] = v11;
        if (*(_DWORD *)(v11 + 16))
        {
          TopoReplica::objc((TopoReplica *)v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "renamedWithRange:replica:", *(unsigned int *)(v11 + 20), *(unsigned int *)(v11 + 24), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(unsigned int *)(v11 + 20);
          v15 = *(unsigned int *)(v11 + 24);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __42__CRTTMergeableString__apply_alwaysApply___block_invoke;
          v17[3] = &unk_1E775E218;
          v17[4] = self;
          v17[5] = v18;
          objc_msgSend(v13, "enumerateRangesIn::", v14, v15, v17);

        }
        _Block_object_dispose(v18, 8);
        ++v9;
      }
      while (v9 != v10);
    }
    -[CRTTMergeableString invalidateCache](self, "invalidateCache");
    if (!a4)
      -[CRTTMergeableString setRenameGeneration:](self, "setRenameGeneration:", objc_msgSend(v6, "generation"));
    -[CRTTMergeableString version](self, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "apply:", v6);

    -[CRTTMergeableString applyTimestampRenames:](self, "applyTimestampRenames:", v6);
    -[CRTTMergeableString coalesce](self, "coalesce");
  }

}

uint64_t __42__CRTTMergeableString__apply_alwaysApply___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  NSUUID *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int index;
  TopoReplica v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3 >= *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 24))
  {
    v9 = 0;
    if (a5 < 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "splitTopoSubstring:atIndex:");
  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_5:
    TopoReplica::TopoReplica(&v13, v8, 0);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    index = v13.index;
    *(_OWORD *)v10 = *(_OWORD *)v13.uuid;
    *(_DWORD *)(v10 + 16) = index;
    *(_DWORD *)(v10 + 20) = a5;
  }
LABEL_6:
  if (v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

  return 0;
}

- (void)applyTimestampRenames:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  __n128 *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  CRTTMergeableString *v22;
  _QWORD v23[7];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  uint64_t (*v29)();
  void *v30;
  uint64_t v31;
  _BYTE v32[9];

  v4 = a3;
  v22 = self;
  v5 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v25 = 0;
  v26 = &v25;
  v27 = 0x3812000000;
  v28 = __Block_byref_object_copy__67;
  v29 = __Block_byref_object_dispose__68;
  v30 = &unk_1BE20E2A2;
  v6 = *v5;
  v31 = v6;
  if (v6 != v5[1])
  {
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = *(_QWORD *)v6;
      v9 = *(_QWORD *)(*(_QWORD *)v6 + 32);
      v10 = *(_QWORD *)(*(_QWORD *)v6 + 40);
      if (v9 != v10)
      {
        v11 = 0;
        do
        {
          if (*(_DWORD *)(v9 + 16))
          {
            TopoReplica::objc((TopoReplica *)v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = *(unsigned int *)(v9 + 20);
            v14 = *(unsigned int *)(v8 + 24);
            objc_msgSend(v4, "renamedWithRange:replica:", v13, v14, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "rangeCountIn:", v13, v14);
            if (v16 == 1)
            {
              v24[0] = v7;
              v24[1] = 3221225472;
              v24[2] = __45__CRTTMergeableString_applyTimestampRenames___block_invoke;
              v24[3] = &__block_descriptor_40_e34_B40__0__NSRange_QQ_8__NSUUID_24q32l;
              v24[4] = v9;
              objc_msgSend(v15, "enumerateRangesIn::", v13, v14, v24);
            }
            else if (v16 >= 2)
            {
              v23[0] = v7;
              v23[1] = 3221225472;
              v23[2] = __45__CRTTMergeableString_applyTimestampRenames___block_invoke_2;
              v23[3] = &unk_1E775E260;
              v23[4] = &v25;
              v23[5] = v8;
              v23[6] = v5;
              objc_msgSend(v15, "enumerateRangesIn::", v13, v14, v23);

              v6 = v26[6];
              goto LABEL_17;
            }

            v11 = 1;
          }
          v9 += 24;
        }
        while (v9 != v10);
        if ((v11 & 1) != 0)
        {
          v17 = *(_QWORD *)(v8 + 32);
          v18 = *(__n128 **)(v8 + 40);
          v19 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v18 - v17) >> 3));
          if (v18 == (__n128 *)v17)
            v20 = 0;
          else
            v20 = v19;
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,TopoID *,false>(v17, v18, (uint64_t)v32, v20, 1);
        }
      }
      v6 = v26[6] + 8;
      v26[6] = v6;
LABEL_17:
      ;
    }
    while (v6 != v5[1]);
  }
  _Block_object_dispose(&v25, 8);
  -[CRTTMergeableString addedByVersion](v22, "addedByVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "apply:", v4);

}

uint64_t __45__CRTTMergeableString_applyTimestampRenames___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSUUID *v7;
  uint64_t v8;
  unsigned int index;
  TopoReplica v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((a5 & 0x8000000000000000) == 0)
  {
    TopoReplica::TopoReplica(&v11, v7, 0);
    v8 = *(_QWORD *)(a1 + 32);
    index = v11.index;
    *(_OWORD *)v8 = *(_OWORD *)v11.uuid;
    *(_DWORD *)(v8 + 16) = index;
    *(_DWORD *)(v8 + 20) = a5;
  }

  return 1;
}

uint64_t __45__CRTTMergeableString_applyTimestampRenames___block_invoke_2(_QWORD *a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v9;

  v6 = a4;
  v7 = a1[5];
  if (a3 >= *(unsigned int *)(v7 + 24))
    __assert_rtn("-[CRTTMergeableString applyTimestampRenames:]_block_invoke_2", "TTMergeableString.mm", 2553, "0");
  v9 = TopoSubstring::splitAt((TopoSubstring *)v7, a3);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48) = std::vector<TopoSubstring *>::insert(a1[6], (char *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48) + 8), (char *)&v9)- 8;

  return 1;
}

- (id)renamed:(id)a3
{
  id v4;
  uint64_t v5;
  CRTTMergeableString *v6;
  CRTTMergeableString *renamedString;
  uint64_t v8;
  CRTTMergeableString *v9;
  CRTTMergeableString *v10;
  char v11;
  CRTTMergeableString *v12;
  CRTTMergeableString *v13;
  CRTTMergeableString *v14;
  CRTTMergeableString *v15;

  v4 = a3;
  v5 = -[CRTTMergeableString renameGeneration](self, "renameGeneration");
  if (v5 < objc_msgSend(v4, "generation") || (objc_msgSend(v4, "hasLocalRenames") & 1) != 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    renamedString = v6->_renamedString;
    if (renamedString)
    {
      v8 = -[CRTTMergeableString renameGeneration](renamedString, "renameGeneration");
      if (v8 >= objc_msgSend(v4, "generation"))
      {
        v11 = objc_msgSend(v4, "hasLocalRenames");
        v9 = v6->_renamedString;
        if ((v11 & 1) == 0)
        {
          v10 = v9;
LABEL_13:
          objc_sync_exit(v6);

          goto LABEL_14;
        }
      }
      else
      {
        v9 = v6->_renamedString;
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9)
      v12 = v9;
    else
      v12 = v6;
    v13 = -[CRTTMergeableString copyRenamedIfAvailable:](v12, "copyRenamedIfAvailable:", 0);
    -[CRTTMergeableString apply:skipRetain:alwaysApply:](v13, "apply:skipRetain:alwaysApply:", v4, 0, 0);
    v14 = v6->_renamedString;
    v6->_renamedString = v13;
    v15 = v13;

    v10 = v6->_renamedString;
    goto LABEL_13;
  }
  v10 = self;
LABEL_14:

  return v10;
}

- (id)temporaryConcurrentNames
{
  ObjCRenameSequence *v3;
  __int128 *startNode;
  ObjCRenameSequence *v5;
  _QWORD v7[4];
  ObjCRenameSequence *v8;
  char v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(ObjCRenameSequence);
  startNode = (__int128 *)self->_startNode;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CRTTMergeableString_temporaryConcurrentNames__block_invoke;
  v7[3] = &unk_1E775E288;
  v5 = v3;
  v8 = v5;
  minIdPath(startNode, v7, (uint64_t)v9);

  return v5;
}

void __47__CRTTMergeableString_temporaryConcurrentNames__block_invoke(uint64_t a1, TopoReplica *this)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  TopoReplica::objc(this);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addWithReplica:range:");

}

- (id)fullyRenamed:(id)a3
{
  id v4;
  CRTTMergeableString *v5;
  id *v6;
  id v7;
  id *v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5;
  v7 = v6[6];
  v8 = v6;
  if (v7)
  {
    v8 = (id *)v7;

  }
  objc_msgSend(v8, "temporaryNamesExcludingSelf:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v10;
  if ((objc_msgSend(v9, "isEmpty") & 1) == 0)
  {
    v12 = (void *)objc_msgSend(v10, "copyRenamedIfAvailable:", 0);

    objc_msgSend(v6, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v9, objc_msgSend(v13, "maxCounter"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "apply:skipRetain:alwaysApply:", v14, 1, 0);
    +[CRGlobalContextObjC releaseObjCSequence:](CRGlobalContextObjC, "releaseObjCSequence:", v9);

    v11 = (id *)v12;
  }
  if (v11 != v6)
    objc_storeStrong(v6 + 6, v11);
  objc_msgSend(v11, "setContext:", v4);

  objc_sync_exit(v6);
  return v11;
}

- (id)renamedIfAvailable
{
  CRTTMergeableString *v2;
  CRTTMergeableString *renamedString;
  CRTTMergeableString *v4;

  v2 = self;
  objc_sync_enter(v2);
  renamedString = v2->_renamedString;
  if (!renamedString)
    renamedString = v2;
  v4 = renamedString;
  objc_sync_exit(v2);

  return v4;
}

- (void)applyRenamesAndRetainOrRelease:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(v10, "isEmpty") & 1) == 0)
  {
    -[CRTTMergeableString version](self, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v10, objc_msgSend(v7, "maxCounter"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRTTMergeableString apply:skipRetain:alwaysApply:](self, "apply:skipRetain:alwaysApply:", v8, 0, 1);
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableString apply:skipRetain:alwaysApply:](self, "apply:skipRetain:alwaysApply:", v9, 0, 0);

    -[CRTTMergeableString setContext:](self, "setContext:", v6);
  }

}

- (BOOL)needToFinalizeTimestamps
{
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;

  v3 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  for (i = (uint64_t *)*v3; i != (uint64_t *)v3[1]; ++i)
  {
    v5 = *i;
    if (*(_DWORD *)(*i + 16))
      return 1;
    v6 = *(_QWORD *)(v5 + 32);
    v7 = *(_QWORD *)(v5 + 40);
    while (v6 != v7)
    {
      if (*(_DWORD *)(v6 + 16))
        return 1;
      v6 += 24;
    }
  }
  -[CRTTMergeableString addedByVersion](self, "addedByVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "hasTemporaryComponents");

  return v8;
}

- (void)finalizeTimestamps:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRTTMergeableString useRenameIfAvailable](self, "useRenameIfAvailable");
  -[CRTTMergeableString temporaryNamesExcludingSelf:](self, "temporaryNamesExcludingSelf:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTTMergeableString version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v4, objc_msgSend(v5, "maxCounter"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRTTMergeableString apply:skipRetain:alwaysApply:](self, "apply:skipRetain:alwaysApply:", v6, 0, 0);
  -[CRTTMergeableString setContext:](self, "setContext:", v7);

}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TopoReplica)replica
{
  *retstr = *(TopoReplica *)((char *)self + 144);
  return self;
}

- (int64_t)localCounter
{
  return self->_localCounter;
}

- (void)setLocalCounter:(int64_t)a3
{
  self->_localCounter = a3;
}

- (ObjCReplica)addedByReplica
{
  return self->_addedByReplica;
}

- (int64_t)addedByLocalCounter
{
  return self->_addedByLocalCounter;
}

- (void)setAddedByLocalCounter:(int64_t)a3
{
  self->_addedByLocalCounter = a3;
}

- (void)startNode
{
  return self->_startNode;
}

- (void)endNode
{
  return self->_endNode;
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  __int128 *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  __int128 *v31;
  unint64_t v32;
  __int128 *v33;
  __int128 *v34;
  __int128 *v35;
  __int128 *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 *v41;
  BOOL v43;
  uint64_t v44;
  unint64_t *v45;
  __int128 *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  __int128 *v58;
  __int128 v59;
  unint64_t v60;
  __int128 *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD *v66;
  __int128 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  __int128 *v72;
  unint64_t v73;
  uint64_t v74;
  __int128 *v75;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

- (BOOL)hasAllIDsIn:(void *)a3
{
  __int128 *v4;
  __int128 *v5;
  __int128 v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  __int128 **v12;
  __int128 **v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  int v21;
  __int128 *v22;
  _BYTE v23[28];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 1065353216;
  v4 = *(__int128 **)a3;
  v5 = (__int128 *)*((_QWORD *)a3 + 1);
  if (*(__int128 **)a3 != v5)
  {
    do
    {
      v6 = *v4;
      *(_OWORD *)&v23[12] = *(__int128 *)((char *)v4 + 12);
      *(_OWORD *)v23 = v6;
      v24 = *((id *)v4 + 4);
      if (v24)
      {
        v7 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::find<TopoReplica>(&v19, (uint64_t)v23);
        if (v7)
        {
          objc_msgSend((id)v7[5], "addIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24]);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24], v19, (_QWORD)v20);
          v8 = objc_claimAutoreleasedReturnValue();
          v22 = (__int128 *)v23;
          v9 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::__emplace_unique_key_args<TopoReplica,std::piecewise_construct_t const&,std::tuple<TopoReplica const&>,std::tuple<>>((uint64_t)&v19, (uint64_t)v23, (uint64_t)&std::piecewise_construct, &v22);
          v10 = (void *)v9[5];
          v9[5] = v8;

        }
      }

      v4 = (__int128 *)((char *)v4 + 40);
    }
    while (v4 != v5);
  }
  v11 = -[CRTTMergeableString orderedSubstrings](self, "orderedSubstrings", v19, (_QWORD)v20);
  v12 = (__int128 **)*v11;
  v13 = (__int128 **)v11[1];
  while (v12 != v13)
  {
    v14 = **v12;
    *(_OWORD *)&v23[12] = *(__int128 *)((char *)*v12 + 12);
    *(_OWORD *)v23 = v14;
    v15 = std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::find<TopoReplica>(&v19, (uint64_t)v23);
    v16 = v15;
    if (v15)
    {
      objc_msgSend((id)v15[5], "removeIndexesInRange:", *(unsigned int *)&v23[20], *(unsigned int *)&v23[24]);
      if (!objc_msgSend((id)v16[5], "count"))
        std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::erase(&v19, v16);
    }
    ++v12;
  }
  v17 = *((_QWORD *)&v20 + 1) == 0;
  std::__hash_table<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::__unordered_map_hasher<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::hash<TopoReplica>,std::equal_to<TopoReplica>,true>,std::__unordered_map_equal<TopoReplica,std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>,std::equal_to<TopoReplica>,std::hash<TopoReplica>,true>,std::allocator<std::__hash_value_type<TopoReplica,NSMutableIndexSet * {__strong}>>>::~__hash_table((uint64_t)&v19);
  return v17;
}

- (void)undeleteSubstrings:(void *)a3
{
  __int128 *v3;
  __int128 *v4;
  __int128 v6;
  id v7;
  char *v8;
  char *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int128 v15;
  void *__p;
  char *v17;
  uint64_t v18;
  __int128 v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = *(__int128 **)a3;
  v4 = (__int128 *)*((_QWORD *)a3 + 1);
  if (*(__int128 **)a3 != v4)
  {
    do
    {
      v22 = *v3;
      *((_QWORD *)&v6 + 1) = *((_QWORD *)&v22 + 1);
      v23 = *((_DWORD *)v3 + 4);
      *(_QWORD *)&v6 = *(_QWORD *)((char *)v3 + 20);
      v15 = v6;
      v7 = *((id *)v3 + 4);
      if (v7)
      {
        __p = 0;
        v17 = 0;
        v18 = 0;
        v19 = v22;
        v20 = v23;
        v21 = v15;
        -[CRTTMergeableString getSubstrings:forTopoIDRange:](self, "getSubstrings:forTopoIDRange:", &__p, &v19);
        v8 = (char *)__p;
        v9 = v17;
        if (v17 != __p)
        {
          do
          {
            v11 = *((_QWORD *)v9 - 1);
            v9 -= 8;
            v10 = (_DWORD *)v11;
            if (*(_QWORD *)(v11 + 40) == *(_QWORD *)(v11 + 32))
            {
              v13 = v10[5];
              v12 = v10[6];
              -[CRTTMergeableString attributedString](self, "attributedString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "cr_replaceStorageInRange:withStorage:fromRange:", v10[21], 0, v7, (v13 - v15), v12);

              -[CRTTMergeableString addNewAddedByFor:](self, "addNewAddedByFor:", v10);
              v8 = (char *)__p;
            }
          }
          while (v9 != v8);
        }
        -[CRTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes", v15);
        if (__p)
        {
          v17 = (char *)__p;
          operator delete(__p);
        }
      }

      v3 = (__int128 *)((char *)v3 + 40);
    }
    while (v3 != v4);
  }
}

@end
