@implementation GEOMapAccessTransitStop

- (unint64_t)hallID
{
  unint64_t *v2;

  v2 = *(unint64_t **)(*((_QWORD *)self->super._node.__ptr_ + 5) + 256);
  if (v2)
    return *v2;
  else
    return 0;
}

- (id)findHall:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  GEOMapAccess *map;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  GEOMapAccessTransitStop *v19;
  void (**v20)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_hall)
  {
    v10 = *(uint64_t **)(*((_QWORD *)self->super._node.__ptr_ + 5) + 256);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __54__GEOMapAccessTransitStop_findHall_completionHandler___block_invoke;
        v18 = &unk_1E1C02B80;
        v19 = self;
        v20 = v6;
        v12 = (void *)MEMORY[0x18D765024](&v15);
        map = self->super._map;
        -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate", v15, v16, v17, v18, v19);
        -[GEOMapAccess findTransitHallWithID:near:hallHandler:completionHandler:](map, "findTransitHallWithID:near:hallHandler:completionHandler:", v11, v12, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (v6)
    v6[2](v6);
  if (!v8)
    goto LABEL_11;
  v8[2](v8, 0);
  v9 = 0;
LABEL_12:

  return v9;
}

void __54__GEOMapAccessTransitStop_findHall_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapAccess *map;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    map = self->super._map;
    v9 = -[GEOMapAccessTransitStop hallID](self, "hallID");
    -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate");
    v11 = v10;
    v13 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__GEOMapAccessTransitStop_findAccessPoints_completionHandler___block_invoke;
    v16[3] = &unk_1E1C02B30;
    v17 = v6;
    -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 1, v16, v7, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __62__GEOMapAccessTransitStop_findAccessPoints_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findLinksIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapNodeTransit *ptr;
  GEOMapAccess *map;
  void (*v9)(MapNodeTransit *, GEOMapAccess *, _QWORD *, id);
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  map = self->super._map;
  ptr = self->super._node.__ptr_;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__GEOMapAccessTransitStop_findLinksIn_completionHandler___block_invoke;
  v13[3] = &unk_1E1C02BA8;
  v13[4] = self;
  v14 = v6;
  v9 = *(void (**)(MapNodeTransit *, GEOMapAccess *, _QWORD *, id))(*(_QWORD *)ptr + 40);
  v10 = v6;
  v9(ptr, map, v13, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __57__GEOMapAccessTransitStop_findLinksIn_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitLink *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitLink *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitLink alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitLink initWithMap:transitEdge:](v4, "initWithMap:transitEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findLinksOut:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapNodeTransit *ptr;
  GEOMapAccess *map;
  void (*v9)(MapNodeTransit *, GEOMapAccess *, _QWORD *, id);
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  map = self->super._map;
  ptr = self->super._node.__ptr_;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__GEOMapAccessTransitStop_findLinksOut_completionHandler___block_invoke;
  v13[3] = &unk_1E1C02BA8;
  v13[4] = self;
  v14 = v6;
  v9 = *(void (**)(MapNodeTransit *, GEOMapAccess *, _QWORD *, id))(*(_QWORD *)ptr + 48);
  v10 = v6;
  v9(ptr, map, v13, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __58__GEOMapAccessTransitStop_findLinksOut_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitLink *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitLink *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitLink alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitLink initWithMap:transitEdge:](v4, "initWithMap:transitEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hall, 0);
}

@end
