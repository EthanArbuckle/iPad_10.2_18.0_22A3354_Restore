@implementation MKQuadTrie

- (id)itemsPassingRectTest:(id)a3 coordinateTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *root;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 10);
    root = self->__root;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__MKQuadTrie_itemsPassingRectTest_coordinateTest___block_invoke;
    v15[3] = &unk_1E20DB150;
    v17 = v6;
    v12 = v10;
    v16 = v12;
    v18 = v8;
    __depthFirstApply((uint64_t)root, v15);
    v13 = v18;
    v9 = v12;

  }
  return v9;
}

uint64_t __50__MKQuadTrie_itemsPassingRectTest_coordinateTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  unsigned int v13;
  id v14;
  uint64_t v15;

  v4 = (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  if (!v4)
    return 1;
  if (!*(_QWORD *)(a2 + 40))
  {
    v7 = **(_QWORD **)(a2 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 8);
    v8 = (v6 - v7) >> 3;
    if (v4 == 1)
    {
      if (v6 != v7)
      {
        v9 = 0;
        v10 = 1;
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(**(_QWORD **)(a2 + 32) + 8 * v9));
          v9 = v10;
          v11 = v8 > v10++;
        }
        while (v11);
      }
    }
    else if (v6 != v7)
    {
      v12 = 0;
      v13 = 1;
      do
      {
        v14 = *(id *)(**(_QWORD **)(a2 + 32) + 8 * v12);
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v14, "coordinate");
        if ((*(unsigned int (**)(uint64_t))(v15 + 16))(v15))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

        v12 = v13;
        v11 = v8 > v13++;
      }
      while (v11);
    }
  }
  return 0;
}

uint64_t __30__MKQuadTrie__itemsInMapRect___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  MKMapPoint v33;
  MKMapRect v34;
  MKMapRect v35;
  MKMapRect v36;
  MKMapRect v37;
  MKMapRect v38;

  v4 = *(double *)a2;
  v5 = *(double *)(a2 + 8);
  v6 = *(double *)(a2 + 16);
  v7 = *(double *)(a2 + 24);
  v8 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v34.origin.x = *(double *)a2;
  v34.origin.y = v5;
  v34.size.width = v6;
  v34.size.height = v7;
  v37.origin.x = v8;
  v37.origin.y = v9;
  v37.size.width = v10;
  v37.size.height = v11;
  if (!MKMapRectIntersectsRect(v34, v37))
    return 1;
  if (!*(_QWORD *)(a2 + 40))
  {
    v13 = *(uint64_t **)(a2 + 32);
    v15 = *v13;
    v14 = v13[1];
    v16 = (v14 - *v13) >> 3;
    v35.origin.x = v8;
    v35.origin.y = v9;
    v35.size.width = v10;
    v35.size.height = v11;
    v38.origin.x = v4;
    v38.origin.y = v5;
    v38.size.width = v6;
    v38.size.height = v7;
    if (MKMapRectContainsRect(v35, v38))
    {
      if (v14 != v15)
      {
        v17 = 0;
        v18 = 1;
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(**(_QWORD **)(a2 + 32) + 8 * v17));
          v17 = v18;
          v19 = v16 > v18++;
        }
        while (v19);
      }
    }
    else if (v14 != v15)
    {
      v20 = 0;
      v21 = 1;
      do
      {
        v22 = *(id *)(**(_QWORD **)(a2 + 32) + 8 * v20);
        v23 = *(double *)(a1 + 40);
        v24 = *(double *)(a1 + 48);
        v25 = *(double *)(a1 + 56);
        v26 = *(double *)(a1 + 64);
        v27 = v22;
        objc_msgSend(v27, "coordinate");
        v30 = MKTilePointForCoordinate(v28, v29, 21.0);
        v32 = v31;

        v36.origin.x = v23;
        v36.origin.y = v24;
        v36.size.width = v25;
        v36.size.height = v26;
        v33.x = v30;
        v33.y = v32;
        if (MKMapRectContainsPoint(v36, v33))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);

        v20 = v21;
        v19 = v16 > v21++;
      }
      while (v19);
    }
  }
  return 0;
}

- (id)allItems
{
  void *v2;
  void *v3;

  -[MKQuadTrie itemsInMapRect:](self, "itemsInMapRect:", self->_initialRegion.origin.x, self->_initialRegion.origin.y, self->_initialRegion.size.width, self->_initialRegion.size.height);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemsInMapRect:(id)a3
{
  double var1;
  double v4;
  double var0;
  double v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  void *v18;
  MKMapRect v20;
  MKMapRect v21;

  var1 = a3.var1.var1;
  v4 = a3.var0.var1;
  var0 = a3.var0.var0;
  v7 = a3.var0.var0 + a3.var1.var0;
  if ((a3.var0.var0 >= 0.0 || v7 <= 0.0) && (a3.var0.var0 < 268435456.0 ? (v8 = v7 <= 268435456.0) : (v8 = 1), v8))
  {
    -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", a3.var0.var0, a3.var0.var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21.size.width = 268435456.0;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.height = 268435456.0;
    v20 = MKMapRectIntersection((MKMapRect)a3, v21);
    v10 = INFINITY;
    v11 = v7 + -268435456.0;
    if (v7 > 268435456.0)
      v12 = 0.0;
    else
      v12 = INFINITY;
    if (v7 <= 268435456.0)
      v11 = 0.0;
    else
      v10 = v4;
    if (v7 > 268435456.0)
      v13 = var1;
    else
      v13 = 0.0;
    v14 = fabs(var0);
    v15 = var0 < 0.0;
    if (var0 < 0.0)
      v16 = var0 + 268435456.0;
    else
      v16 = v12;
    if (v15)
    {
      v17 = v14;
    }
    else
    {
      v4 = v10;
      v17 = v11;
    }
    if (!v15)
      var1 = v13;
    -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", v16, v4, v17, var1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v9, "unionSet:", v18);

  }
  return v9;
}

- (id)_itemsInMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  id v8;
  void *root;
  _QWORD v12[4];
  id v13;
  MKMapRect v14;
  MKMapRect v15;
  MKMapRect v16;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16.origin.x = v6;
  v16.origin.y = v5;
  v16.size.width = var0;
  v16.size.height = var1;
  v15 = MKMapRectIntersection((MKMapRect)self->_initialRegion, v16);
  if (v15.origin.x != INFINITY || v15.origin.y != INFINITY)
  {
    root = self->__root;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__MKQuadTrie__itemsInMapRect___block_invoke;
    v12[3] = &unk_1E20DB128;
    v14 = v15;
    v13 = v8;
    __depthFirstApply((uint64_t)root, v12);

  }
  return v8;
}

- (MKQuadTrie)initWithInitialRegion:(id)a3 minimumSize:(id)a4 maximumItems:(unsigned int)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  double v10;
  double v11;
  MKQuadTrie *v12;
  MKQuadTrie *v13;
  double *v14;
  _QWORD *v15;
  MKQuadTrie *v16;
  objc_super v18;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3.var1.var1;
  v9 = a3.var1.var0;
  v10 = a3.var0.var1;
  v11 = a3.var0.var0;
  v18.receiver = self;
  v18.super_class = (Class)MKQuadTrie;
  v12 = -[MKQuadTrie init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_minSize.width = var0;
    v12->_minSize.height = var1;
    v12->_maxItems = a5;
    v12->_initialRegion.origin.x = v11;
    v12->_initialRegion.origin.y = v10;
    v12->_initialRegion.size.width = v9;
    v12->_initialRegion.size.height = v8;
    v14 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    *v14 = v11;
    v14[1] = v10;
    v14[2] = v9;
    v14[3] = v8;
    v13->__root = v14;
    v15 = (_QWORD *)operator new();
    *v15 = 0;
    v15[1] = 0;
    v15[2] = 0;
    *((_QWORD *)v13->__root + 4) = v15;
    v16 = v13;
  }

  return v13;
}

- (BOOL)contains:(id)a3
{
  id v4;
  double *root;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  id v25;
  BOOL v26;
  MKMapPoint v28;
  MKMapRect v29;

  v4 = a3;
  root = (double *)self->__root;
  v6 = *root;
  v7 = root[1];
  v8 = root[2];
  v9 = root[3];
  v10 = v4;
  objc_msgSend(v10, "coordinate");
  v13 = MKTilePointForCoordinate(v11, v12, 21.0);
  v15 = v14;

  v29.origin.x = v6;
  v29.origin.y = v7;
  v29.size.width = v8;
  v29.size.height = v9;
  v28.x = v13;
  v28.y = v15;
  if (MKMapRectContainsPoint(v29, v28))
  {
    v16 = self->__root;
    v17 = v10;
    v18 = *(_QWORD *)(_insertionNodeForItem(v17, (uint64_t)v16) + 32);
    v19 = *(id **)v18;
    v20 = *(_QWORD *)(v18 + 8) - *(_QWORD *)v18;
    if (v20)
    {
      v21 = v20 >> 3;
      if (v21 <= 1)
        v22 = 1;
      else
        v22 = v21;
      if (*v19 == v17)
      {
        v26 = 1;
      }
      else
      {
        v23 = 0;
        v24 = v19 + 1;
        while (v22 - 1 != v23)
        {
          v25 = (id)v24[v23++];
          if (v25 == v17)
            goto LABEL_15;
        }
        v23 = v22;
LABEL_15:
        v26 = v23 < v21;
      }
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)insert:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MKMapRect *root;
  id v10;
  MKMapPoint v11;

  v10 = a3;
  objc_msgSend(v10, "coordinate");
  v6 = MKTilePointForCoordinate(v4, v5, 21.0);
  v8 = v7;

  root = (MKMapRect *)self->__root;
  v11.x = v6;
  v11.y = v8;
  if (MKMapRectContainsPoint(*root, v11))
    _insert(v10, (uint64_t)root, self);

}

- (void)clearAllItemsPerforming:(id)a3
{
  id v4;
  void *root;
  id v6;
  double x;
  double y;
  double width;
  double height;
  double *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  root = self->__root;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__MKQuadTrie_clearAllItemsPerforming___block_invoke;
  v13[3] = &unk_1E20DB178;
  v6 = v4;
  v14 = v6;
  _breadthFirstApply(root, v13);
  x = self->_initialRegion.origin.x;
  y = self->_initialRegion.origin.y;
  width = self->_initialRegion.size.width;
  height = self->_initialRegion.size.height;
  v11 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
  *v11 = x;
  v11[1] = y;
  v11[2] = width;
  v11[3] = height;
  self->__root = v11;
  v12 = (_QWORD *)operator new();
  *v12 = 0;
  v12[1] = 0;
  v12[2] = 0;
  *((_QWORD *)self->__root + 4) = v12;

}

uint64_t __38__MKQuadTrie_clearAllItemsPerforming___block_invoke(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (_QWORD *)a2[4];
    if (v3)
    {
      v4 = *(_QWORD *)(a2[4] + 8) - *v3;
      if (v4)
      {
        v6 = 0;
        v7 = v4 >> 3;
        if (v7 <= 1)
          v8 = 1;
        else
          v8 = v7;
        do
        {
          v9 = *(id *)(*(_QWORD *)a2[4] + 8 * v6);
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

          ++v6;
        }
        while (v8 != v6);
      }
    }
  }
  MKQuadTrieNodeFree(a2);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MKQuadTrie clearAllItemsPerforming:](self, "clearAllItemsPerforming:", 0);
  MKQuadTrieNodeFree((_QWORD *)self->__root);
  v3.receiver = self;
  v3.super_class = (Class)MKQuadTrie;
  -[MKQuadTrie dealloc](&v3, sel_dealloc);
}

- (BOOL)remove:(id)a3
{
  id v4;
  double *root;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id **v18;
  void **v19;
  id *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  BOOL v29;
  void **v30;
  void **i;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  MKMapPoint v42;
  MKMapRect v43;

  v4 = a3;
  root = (double *)self->__root;
  v6 = *root;
  v7 = root[1];
  v8 = root[2];
  v9 = root[3];
  v10 = v4;
  objc_msgSend(v10, "coordinate");
  v13 = MKTilePointForCoordinate(v11, v12, 21.0);
  v15 = v14;

  v43.origin.x = v6;
  v43.origin.y = v7;
  v43.size.width = v8;
  v43.size.height = v9;
  v42.x = v13;
  v42.y = v15;
  if (MKMapRectContainsPoint(v43, v42))
  {
    v16 = self->__root;
    v17 = v10;
    v18 = *(id ***)(_insertionNodeForItem(v17, (uint64_t)v16) + 32);
    v20 = *v18;
    v19 = v18[1];
    if (v19 == *v18)
    {
LABEL_12:

LABEL_18:
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      v33 = self->__root;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __21__MKQuadTrie_remove___block_invoke;
      v35[3] = &unk_1E20DB100;
      v36 = v17;
      v37 = &v38;
      _breadthFirstApply(v33, v35);
      v29 = *((_BYTE *)v39 + 24) != 0;

      _Block_object_dispose(&v38, 8);
      goto LABEL_19;
    }
    v21 = v19 - *v18;
    if (v21 <= 1)
      v22 = 1;
    else
      v22 = v19 - *v18;
    if (*v20 != v17)
    {
      v23 = 0;
      v24 = 0;
      v25 = v22 - 1;
      while (v25 != v24)
      {
        v26 = v20[v24 + 1];
        v23 += 0x100000000;
        ++v24;
        if (v26 == v17)
        {
          v27 = v24 < v21;
          v28 = v23 >> 32;
          goto LABEL_14;
        }
      }
      goto LABEL_12;
    }
    v28 = 0;
    v27 = 1;
LABEL_14:
    v30 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>(&v20[v28 + 1], v19, &v20[v28]);
    for (i = v18[1]; i != v30; --i)
    {
      v32 = *(i - 1);

    }
    v18[1] = v30;

    if (!v27)
      goto LABEL_18;
    v29 = 1;
  }
  else
  {
    v29 = 0;
  }
LABEL_19:

  return v29;
}

uint64_t __21__MKQuadTrie_remove___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  void **v14;
  void **i;
  void *v16;

  v2 = *(_QWORD **)(a2 + 32);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 8) - *v2;
  if (!v3)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = v3 >> 3;
  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  while (1)
  {
    v10 = *(id *)(**(_QWORD **)(a2 + 32) + 8 * v7);
    v11 = v10;
    if (v10 == *(id *)(a1 + 32))
      break;

    ++v7;
    v6 += 0x100000000;
    if (v9 == v7)
      return 0;
  }
  v13 = *(_QWORD *)(a2 + 32);
  v14 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>((void **)(*(_QWORD *)v13 + (v6 >> 29) + 8), *(void ***)(v13 + 8), (void **)(*(_QWORD *)v13 + (v6 >> 29)));
  for (i = *(void ***)(v13 + 8); i != v14; --i)
  {
    v16 = *(i - 1);

  }
  *(_QWORD *)(v13 + 8) = v14;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 2;
}

- (void)foreach:(id)a3
{
  id v4;
  void *root;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  root = self->__root;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__MKQuadTrie_foreach___block_invoke;
  v7[3] = &unk_1E20DB178;
  v8 = v4;
  v6 = v4;
  _breadthFirstApply(root, v7);

}

uint64_t __22__MKQuadTrie_foreach___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v6;
  unsigned int i;
  id v8;
  char v9;

  v2 = *(uint64_t **)(a2 + 32);
  if (!v2)
    return 0;
  v3 = *v2;
  if (v2[1] == *v2)
    return 0;
  v6 = 0;
  for (i = 1; ; ++i)
  {
    v8 = *(id *)(v3 + 8 * v6);
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if ((v9 & 1) == 0)
      break;
    v6 = i;
    v3 = **(_QWORD **)(a2 + 32);
    if (v6 >= (*(_QWORD *)(*(_QWORD *)(a2 + 32) + 8) - v3) >> 3)
      return 0;
  }
  return 2;
}

- (unint64_t)count
{
  void *root;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  root = self->__root;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __19__MKQuadTrie_count__block_invoke;
  v5[3] = &unk_1E20DB1A0;
  v5[4] = &v6;
  _breadthFirstApply(root, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __19__MKQuadTrie_count__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a2 + 32);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  return 0;
}

- (id)depthFirstDescription
{
  void *root;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  root = self->__root;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__MKQuadTrie_depthFirstDescription__block_invoke;
  v9[3] = &unk_1E20DB1C8;
  v9[4] = &v14;
  v9[5] = &v10;
  __depthFirstApply((uint64_t)root, v9);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> %lu items, %lu nodes"), v6, self, v15[3], v11[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __35__MKQuadTrie_depthFirstDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a2 + 32);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return 0;
}

- (id)breadthFirstDescription
{
  void *root;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  root = self->__root;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__MKQuadTrie_breadthFirstDescription__block_invoke;
  v9[3] = &unk_1E20DB1C8;
  v9[4] = &v14;
  v9[5] = &v10;
  _breadthFirstApply(root, v9);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> %lu items, %lu nodes"), v6, self, v15[3], v11[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __37__MKQuadTrie_breadthFirstDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a2 + 32);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MKQuadTrie breadthFirstDescription](self, "breadthFirstDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKQuadTrie depthFirstDescription](self, "depthFirstDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Breadth first description:\n%@\n\nDepth first description:\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemDescriptions
{
  id v3;
  void *root;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  root = self->__root;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__MKQuadTrie_itemDescriptions__block_invoke;
  v7[3] = &unk_1E20DB1F0;
  v5 = v3;
  v8 = v5;
  _breadthFirstApply(root, v7);

  return v5;
}

uint64_t __30__MKQuadTrie_itemDescriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v2 = *(_QWORD **)(a2 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 8) - *v2;
    if (v3)
    {
      v6 = 0;
      v7 = v3 >> 3;
      if (v7 <= 1)
        v8 = 1;
      else
        v8 = v7;
      do
      {
        v9 = *(id *)(**(_QWORD **)(a2 + 32) + 8 * v6);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR("%@\n"), v11);

        ++v6;
      }
      while (v8 != v6);
    }
  }
  return 0;
}

@end
