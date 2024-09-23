@implementation FICustomNode

- (FICustomNode)init
{
  FICustomNode *v2;
  FIDSNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FICustomNode;
  v2 = -[FICustomNode init](&v5, sel_init);
  TNode::CreateCustomNode((TNode *)v2, v3);
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[FIPresentationNodeMap shared](FIPresentationNodeMap, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterAllForPresentationNode:", self);

  v4.receiver = self;
  v4.super_class = (Class)FICustomNode;
  -[FICustomNode dealloc](&v4, sel_dealloc);
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  abort();
}

- (id)nodesForSizing
{
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v30;
  uint64_t *v31;
  uint64_t *v32;
  id v33[17];
  id v34[17];
  _QWORD v35[17];
  id v36;
  _QWORD v37[8];
  _QWORD v38[5];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void **v43;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  if ((int)a3 > 1819240306)
  {
    if (a3 == 1885895027)
      goto LABEL_7;
    v11 = 1819240307;
  }
  else
  {
    if (a3 == 1667785588)
      goto LABEL_7;
    v11 = 1684237940;
  }
  if (a3 != v11)
  {
LABEL_18:
    v30.receiver = self;
    v30.super_class = (Class)FICustomNode;
    -[FIDSNode propertyAsNumber:async:options:error:](&v30, sel_propertyAsNumber_async_options_error_, v9, v8, v7, a6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  -[FICustomNode nodesForSizing](self, "nodesForSizing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_18;
  v13 = v12;
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)v34, v12);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v33, -1, v13);
  v14 = std::distance[abi:ne180100]<IDContainerIteratorAdaptor<NSArray<FINode *>>>((uint64_t)v34, (uint64_t)v33);

  type_traits_extras::CopyAsHelper<std::vector<long long>>::MakeWithCapacity(v14, (uint64_t)&v31);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&v36, v13);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v35, -1, v13);
  v43 = (void **)&v31;
  if ((_DWORD)v9 == 1684237940)
    v8 = 0;
  else
    v8 = v8;
  while (v36 != (id)v35[0] || v41 != v35[16])
  {
    v15 = *(id *)(v37[1] + 8 * v40);
    objc_msgSend(v15, "propertyAsNumber:async:options:error:", v9, v8, v7, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    v42 = v17;
    std::back_insert_iterator<std::vector<long long>>::operator=[abi:ne180100]((uint64_t *)&v43, &v42);

    v18 = v40;
    if (v40 >= v39 - 1)
    {
      v19 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v37, v38, 4);
      v18 = -1;
      v39 = v19;
      v40 = -1;
    }
    if (v38[4] != *(_QWORD *)v37[2])
    {
      objc_enumerationMutation(v36);
      v18 = v40;
    }
    v40 = v18 + 1;
    ++v41;
  }

  v21 = v31;
  if (v31 == v32)
  {
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v23 = v31;
    do
    {
      v25 = *v23++;
      v24 = v25;
      v26 = v25 | v22;
      if (v22 >= v25)
        v27 = v24;
      else
        v27 = v22;
      v28 = v24 + v22;
      if (v26 >= 0)
        v22 = v28;
      else
        v22 = v27;
    }
    while (v23 != v32);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    operator delete(v21);

  return v29;
}

@end
