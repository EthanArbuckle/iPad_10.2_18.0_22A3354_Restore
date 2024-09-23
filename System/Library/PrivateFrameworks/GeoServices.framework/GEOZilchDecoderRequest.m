@implementation GEOZilchDecoderRequest

- (GEOZilchDecoderRequest)initWithDecoder:(id)a3 message:(shared_ptr<zilch::Message>)a4
{
  Message *ptr;
  id v6;
  GEOZilchDecoderRequest *v7;
  GEOZilchDecoderRequest *v8;
  uint64_t v9;
  Message *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v15;
  GEOZilchDecoderRequest *v16;
  void *v17;
  uint64_t v18;
  ZilchMapModel *value;
  _QWORD v21[4];
  GEOZilchDecoderRequest *v22;
  objc_super v23;

  ptr = a4.__ptr_;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOZilchDecoderRequest;
  v7 = -[GEOMapRequest initWithManager:](&v23, sel_initWithManager_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_decoder, v6);
    v10 = *(Message **)ptr;
    v9 = *((_QWORD *)ptr + 1);
    if (v9)
    {
      v11 = (unint64_t *)(v9 + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    cntrl = (std::__shared_weak_count *)v8->_message.__cntrl_;
    v8->_message.__ptr_ = v10;
    v8->_message.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__GEOZilchDecoderRequest_initWithDecoder_message___block_invoke;
    v21[3] = &unk_1E1C0F918;
    v16 = v8;
    v22 = v16;
    v17 = (void *)MEMORY[0x18D765024](v21);
    v18 = operator new();
    geo::ZilchMapModel::ZilchMapModel(v18, v6, v17);
    value = v16->_mapModel.__ptr_.__value_;
    v16->_mapModel.__ptr_.__value_ = (ZilchMapModel *)v18;
    if (value)
      (*(void (**)(ZilchMapModel *))(*(_QWORD *)value + 40))(value);

  }
  return v8;
}

void __50__GEOZilchDecoderRequest_initWithDecoder_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  id v7;

  v5 = a3;
  v6 = (id *)(*(_QWORD *)(a1 + 32) + 88);
  if (!*v6)
  {
    v7 = v5;
    objc_storeStrong(v6, a3);
    v5 = v7;
  }

}

- (void)_finishedDecodingWithPath:(Path<std::shared_ptr<geo::MapEdge>> *)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSError *firstTileLoadingError;
  void (**v9)(_QWORD, _QWORD);

  if (a3->var4.var0 == a3->var4.var1)
    goto LABEL_5;
  -[GEOZilchDecoderRequest pathHandler](self, "pathHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOZilchDecoderRequest pathHandler](self, "pathHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, Path<std::shared_ptr<geo::MapEdge>> *))v6)[2](v6, a3);
LABEL_10:

    goto LABEL_11;
  }
  if (a3->var4.var0 == a3->var4.var1)
  {
LABEL_5:
    -[GEOZilchDecoderRequest errorHandler](self, "errorHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      firstTileLoadingError = self->_firstTileLoadingError;
      if (firstTileLoadingError)
        -[NSError zilchDecoderTileLoadingError](firstTileLoadingError, "zilchDecoderTileLoadingError");
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "zilchDecoderErrorForNoSolution");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GEOZilchDecoderRequest errorHandler](self, "errorHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, v6);

      goto LABEL_10;
    }
  }
LABEL_11:
  -[GEOZilchDecoderRequest setPathHandler:](self, "setPathHandler:", 0);
  -[GEOZilchDecoderRequest setErrorHandler:](self, "setErrorHandler:", 0);
  -[GEOMapRequest complete](self, "complete");
}

- (void)decodeWithPathHandler:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_semaphore *v8;
  OS_dispatch_semaphore *finishedSemaphore;
  id WeakRetained;
  NSObject *v11;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  -[GEOZilchDecoderRequest setPathHandler:](self, "setPathHandler:", v6);
  -[GEOZilchDecoderRequest setErrorHandler:](self, "setErrorHandler:", v7);
  v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  finishedSemaphore = self->_finishedSemaphore;
  self->_finishedSemaphore = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_decoder);
  objc_msgSend(WeakRetained, "decoderQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(v11, block);

}

uint64_t __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke(uint64_t a1)
{
  zilch::Message *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  zilch::Probability *v6;
  double v7;
  std::__shared_weak_count_vtbl **v8;
  void **v9;
  zilch::ControlPoint *v10;
  _BOOL4 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  zilch::Message *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  std::__shared_weak_count *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  zilch::ControlPoint *v29;
  unsigned int v30;
  const zilch::GeoCoordinates *v31;
  unint64_t v32;
  unint64_t v33;
  const zilch::GeoCoordinates *v34;
  unsigned int v35;
  BOOL v36;
  char v37;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int *v42;
  unsigned int v43;
  int v44;
  char v45;
  std::__shared_weak_count_vtbl *v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count_vtbl *v50;
  unint64_t *v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  unint64_t *v55;
  unint64_t *v56;
  unint64_t v57;
  void *v58;
  int v59;
  id WeakRetained;
  NSObject *v61;
  _QWORD block[5];
  __int128 v64;
  uint64_t v65;
  _QWORD v66[3];
  void *v67[3];
  void *__p;
  void *v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  int v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  void **v87;
  std::__shared_weak_count *v88;
  unsigned int v89[3];

  v78 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v79 = 3;
  v80 = 0x404E000000000000;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0;
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)&v71);
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)((char *)&v71 + 12));
  v77 = 0;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v2 = *(zilch::Message **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = operator new();
  v4 = v79;
  v5 = v80;
  *(_QWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_DWORD *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 24) = v5;
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)(v3 + 32));
  v6 = zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)(v3 + 44));
  *(_QWORD *)(v3 + 120) = 0;
  *(_OWORD *)(v3 + 104) = 0u;
  *(_OWORD *)(v3 + 88) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  v7 = zilch::Probability::one(v6);
  *(_QWORD *)(v3 + 136) = 0;
  *(double *)(v3 + 128) = v7;
  *(_QWORD *)(v3 + 144) = 0;
  zilch::AbstractMapModel<std::shared_ptr<geo::MapEdge>>::Road::Road(v3 + 152);
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)(v3 + 192));
  *(_QWORD *)(v3 + 304) = 0;
  *(_OWORD *)(v3 + 272) = 0u;
  *(_OWORD *)(v3 + 288) = 0u;
  *(_OWORD *)(v3 + 240) = 0u;
  *(_OWORD *)(v3 + 256) = 0u;
  *(_OWORD *)(v3 + 208) = 0u;
  *(_OWORD *)(v3 + 224) = 0u;
  *(_DWORD *)(v3 + 312) = 1065353216;
  *(_DWORD *)(v3 + 320) = 0;
  *(_QWORD *)(v3 + 328) = -1;
  *(_QWORD *)(v3 + 336) = 0;
  v8 = std::shared_ptr<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>>::shared_ptr[abi:ne180100]<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>,void>((std::__shared_weak_count_vtbl **)&v87, (std::__shared_weak_count_vtbl *)v3);
  v9 = v87;
  *((double *)v9 + 16) = zilch::Probability::one((zilch::Probability *)v8);
  v10 = (zilch::ControlPoint *)zilch::Message::operator[]((_QWORD **)v2, 0);
  v11 = zilch::Message::size(v2) == 1;
  zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::update((unint64_t)v87, v78, v10, &v81, v11, 1);
  v84 = 0;
  v12 = v88;
  if (v88)
  {
    p_shared_owners = (unint64_t *)&v88->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  while (1)
  {
    v15 = *(zilch::Message **)(*(_QWORD *)(a1 + 32) + 56);
    if (!zilch::Message::size(v15))
      break;
    if (!*((_QWORD *)&v83 + 1))
      break;
    v16 = v84++;
    if (v16 >= 75000)
      break;
    v17 = *((_QWORD *)&v81 + 1);
    v18 = *((_QWORD *)&v83 + 1) + v83 - 1;
    v19 = v18 >> 8;
    v20 = (unint64_t *)(*(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (v18 >> 8)) + 16 * v18);
    v22 = *v20;
    v21 = (std::__shared_weak_count *)v20[1];
    if (v21)
    {
      v23 = (unint64_t *)&v21->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
      v17 = *((_QWORD *)&v81 + 1);
      v25 = (BYTE8(v83) + v83 - 1);
      v19 = (unint64_t)(*((_QWORD *)&v83 + 1) + v83 - 1) >> 8;
    }
    else
    {
      v25 = (BYTE8(v83) + v83 - 1);
    }
    v87 = (void **)v22;
    v88 = v21;
    std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100](*(_QWORD *)(v17 + 8 * v19) + 16 * v25);
    v26 = (*((_QWORD *)&v83 + 1))--;
    v27 = 32 * (v82 - *((_QWORD *)&v81 + 1)) - 1;
    if ((_QWORD)v82 == *((_QWORD *)&v81 + 1))
      v27 = 0;
    if ((unint64_t)(v27 - (v26 + v83) - 511) <= 0xFFFFFFFFFFFFFDFFLL)
    {
      operator delete(*(void **)(v82 - 8));
      *(_QWORD *)&v82 = v82 - 8;
    }
    v28 = *(_DWORD *)(v22 + 328);
    if (v28 + 1 < zilch::Message::size(v15))
    {
      v29 = (zilch::ControlPoint *)zilch::Message::operator[]((_QWORD **)v15, v28 + 1);
      if (zilch::ControlPoint::dummy(v29))
        v30 = *(_DWORD *)(v22 + 16) + 3;
      else
        v30 = *(_DWORD *)(v22 + 16);
      if (*(_QWORD *)(v22 + 104) == *(_QWORD *)(v22 + 112))
        goto LABEL_40;
      v89[0] = 0;
      v85 = 0;
      v31 = (const zilch::GeoCoordinates *)zilch::ControlPoint::position(v29);
      zilch::GeoPolyline::getClosestPoint((zilch::GeoPolyline *)(v22 + 152), v31, v89, &v85);
      v32 = v85;
      v33 = zilch::GeoPolyline::size((zilch::GeoPolyline *)(v22 + 152));
      v34 = (const zilch::GeoCoordinates *)zilch::ControlPoint::position(v29);
      v35 = zilch::GeoCoordinates::distanceTo((zilch::GeoCoordinates *)(v22 + 192), v34);
      v36 = zilch::ControlPoint::dummy(v29);
      v37 = v35 >= v30 || v36;
      if ((v37 & 1) != 0)
      {
        if (v32 >= v33 - 1 || v89[0] >= v30)
          v39 = 2;
        else
          v39 = 0;
        goto LABEL_41;
      }
      v40 = *(_QWORD *)(v22 + 216) - *(_QWORD *)(v22 + 208);
      if (!v40)
      {
LABEL_40:
        v39 = 1;
      }
      else
      {
        v41 = v40 >> 4;
        if ((unint64_t)(v40 >> 4) <= 1)
          v41 = 1;
        v42 = (unsigned int *)(*(_QWORD *)(v22 + 232) + 36);
        do
        {
          v43 = *v42;
          v42 += 10;
          if (v43 < 4 * v30)
          {
            v39 = 3;
            goto LABEL_41;
          }
          --v41;
        }
        while (v41);
        v39 = 1;
      }
LABEL_41:
      v44 = zilch::Message::size(v15) - 2;
      switch(v39)
      {
        case 0:
          if (zilch::ControlPoint::dummy(v29))
          {
            zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::update(v22, v78, v29, &v81, v44 == v28, 0);
            v45 = 0;
            goto LABEL_59;
          }
          v50 = (std::__shared_weak_count_vtbl *)operator new();
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::PathHypothesis((uint64_t)v50, v22);
          std::shared_ptr<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>>::shared_ptr[abi:ne180100]<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>,void>((std::__shared_weak_count_vtbl **)&v85, v50);
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::extend(v22, v78, &v81);
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::update(v85, v78, v29, &v81, v44 == v28, 0);
          if (v44 == v28)
          {
            zilch::Path<std::shared_ptr<geo::MapEdge>>::operator=((uint64_t)&v71, (__int128 *)(v85 + 32));
            v47 = v86;
            if (!v86)
              break;
            v51 = (unint64_t *)&v86->__shared_owners_;
            do
              v49 = __ldaxr(v51);
            while (__stlxr(v49 - 1, v51));
            goto LABEL_56;
          }
          v52 = v86;
          if (!v86)
            goto LABEL_71;
          v55 = (unint64_t *)&v86->__shared_owners_;
          do
            v54 = __ldaxr(v55);
          while (__stlxr(v54 - 1, v55));
          goto LABEL_69;
        case 1:
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::update(v22, v78, v29, &v81, v44 == v28, 1);
          if (v44 != v28)
            goto LABEL_71;
          zilch::Path<std::shared_ptr<geo::MapEdge>>::operator=((uint64_t)&v71, (__int128 *)(v22 + 32));
          break;
        case 2:
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::extend(v22, v78, &v81);
          goto LABEL_71;
        case 3:
          v46 = (std::__shared_weak_count_vtbl *)operator new();
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::PathHypothesis((uint64_t)v46, v22);
          std::shared_ptr<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>>::shared_ptr[abi:ne180100]<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>,void>((std::__shared_weak_count_vtbl **)&v85, v46);
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::extend(v22, v78, &v81);
          zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>::update(v85, v78, v29, &v81, v44 == v28, 1);
          if (v44 == v28)
          {
            zilch::Path<std::shared_ptr<geo::MapEdge>>::operator=((uint64_t)&v71, (__int128 *)(v85 + 32));
            v47 = v86;
            if (v86)
            {
              v48 = (unint64_t *)&v86->__shared_owners_;
              do
                v49 = __ldaxr(v48);
              while (__stlxr(v49 - 1, v48));
LABEL_56:
              if (!v49)
              {
                ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
                std::__shared_weak_count::__release_weak(v47);
              }
            }
            break;
          }
          v52 = v86;
          if (v86)
          {
            v53 = (unint64_t *)&v86->__shared_owners_;
            do
              v54 = __ldaxr(v53);
            while (__stlxr(v54 - 1, v53));
LABEL_69:
            if (!v54)
            {
              ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
              std::__shared_weak_count::__release_weak(v52);
            }
          }
LABEL_71:
          v45 = 0;
          if (v21)
            goto LABEL_72;
          goto LABEL_76;
        default:
          goto LABEL_71;
      }
    }
    v45 = 1;
LABEL_59:
    if (v21)
    {
LABEL_72:
      v56 = (unint64_t *)&v21->__shared_owners_;
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
LABEL_76:
    if ((v45 & 1) != 0)
      break;
    objc_msgSend(*(id *)(a1 + 32), "pathHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      v59 = 0;
      goto LABEL_80;
    }
  }
  v59 = 1;
LABEL_80:
  geo::ZilchMapModel::finish(*(id **)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 96));
  if (v59)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(WeakRetained, "requestQueue");
    v61 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke_2;
    block[3] = &unk_1E1BFB868;
    block[4] = *(_QWORD *)(a1 + 32);
    v64 = v71;
    v65 = v72;
    memset(v66, 0, sizeof(v66));
    std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__init_with_size[abi:ne180100]<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*,zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*>(v66, v73, *((uint64_t *)&v73 + 1), 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)&v73 + 1) - v73) >> 3));
    memset(v67, 0, sizeof(v67));
    std::vector<zilch::GeometryPathElement>::__init_with_size[abi:ne180100]<zilch::GeometryPathElement*,zilch::GeometryPathElement*>(v67, *((uint64_t *)&v74 + 1), v75, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v75 - *((_QWORD *)&v74 + 1)) >> 4));
    __p = 0;
    v69 = 0;
    v70 = 0;
    std::vector<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry,std::allocator<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry>>::__init_with_size[abi:ne180100]<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*,zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*>(&__p, (const void *)v76, *((uint64_t *)&v76 + 1), (uint64_t)(*((_QWORD *)&v76 + 1) - v76) >> 4);
    dispatch_async(v61, block);

    if (__p)
    {
      v69 = __p;
      operator delete(__p);
    }
    v87 = v67;
    std::vector<zilch::GeometryPathElement>::__destroy_vector::operator()[abi:ne180100](&v87);
    v87 = (void **)v66;
    std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__destroy_vector::operator()[abi:ne180100](&v87);
  }
  if ((_QWORD)v76)
  {
    *((_QWORD *)&v76 + 1) = v76;
    operator delete((void *)v76);
  }
  v87 = (void **)&v74 + 1;
  std::vector<zilch::GeometryPathElement>::__destroy_vector::operator()[abi:ne180100](&v87);
  v87 = (void **)&v73;
  std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__destroy_vector::operator()[abi:ne180100](&v87);
  return std::deque<std::shared_ptr<zilch::PathHypothesis<std::shared_ptr<geo::MapEdge>>>>::~deque[abi:ne180100]((uint64_t)&v81);
}

void __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  _QWORD v6[3];
  void *v7[3];
  void *__p;
  void *v9;
  uint64_t v10;
  void **v11;

  v2 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 56);
  memset(v6, 0, sizeof(v6));
  std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__init_with_size[abi:ne180100]<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*,zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*>(v6, v3, *(_QWORD *)(a1 + 72), 0x8E38E38E38E38E39 * ((*(_QWORD *)(a1 + 72) - v3) >> 3));
  memset(v7, 0, sizeof(v7));
  std::vector<zilch::GeometryPathElement>::__init_with_size[abi:ne180100]<zilch::GeometryPathElement*,zilch::GeometryPathElement*>(v7, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 4));
  __p = 0;
  v9 = 0;
  v10 = 0;
  std::vector<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry,std::allocator<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry>>::__init_with_size[abi:ne180100]<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*,zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*>(&__p, *(const void **)(a1 + 112), *(_QWORD *)(a1 + 120), (uint64_t)(*(_QWORD *)(a1 + 120) - *(_QWORD *)(a1 + 112)) >> 4);
  objc_msgSend(v2, "_finishedDecodingWithPath:", &v4);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  v11 = v7;
  std::vector<zilch::GeometryPathElement>::__destroy_vector::operator()[abi:ne180100](&v11);
  v11 = (void **)v6;
  std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__destroy_vector::operator()[abi:ne180100](&v11);
}

- (void)cancel
{
  void *v3;
  NSObject *finishedSemaphore;
  objc_super v5;

  -[GEOZilchDecoderRequest pathHandler](self, "pathHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEOZilchDecoderRequest setPathHandler:](self, "setPathHandler:", 0);
    geo::ZilchMapModel::cancel((geo::ZilchMapModel *)self->_mapModel.__ptr_.__value_);
    finishedSemaphore = self->_finishedSemaphore;
    if (finishedSemaphore)
      dispatch_semaphore_wait(finishedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  -[GEOZilchDecoderRequest setErrorHandler:](self, "setErrorHandler:", 0);
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoderRequest;
  -[GEOMapRequest cancel](&v5, sel_cancel);
}

- (id)pathHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPathHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  ZilchMapModel *value;

  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_firstTileLoadingError, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_pathHandler, 0);
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_message);
  objc_destroyWeak((id *)&self->_decoder);
  value = self->_mapModel.__ptr_.__value_;
  self->_mapModel.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ZilchMapModel *))(*(_QWORD *)value + 40))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
