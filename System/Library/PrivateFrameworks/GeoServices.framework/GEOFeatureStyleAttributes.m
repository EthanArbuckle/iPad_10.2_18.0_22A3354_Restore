@implementation GEOFeatureStyleAttributes

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_attributes);
}

- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesPtr:(const void *)a3
{
  GEOFeatureStyleAttributes *v4;
  GEOFeatureStyleAttributes *v5;
  uint64_t v6;
  FeatureStyleAttributes *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOFeatureStyleAttributes;
  v4 = -[GEOFeatureStyleAttributes init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v7 = *(FeatureStyleAttributes **)a3;
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_attributes.__cntrl_;
    v4->_attributes.__ptr_ = v7;
    v4->_attributes.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v5;
}

- (GEOFeatureStyleAttributes)initWithAttributes:(unsigned int)a3
{
  GEOFeatureStyleAttributes *v4;
  void ***p_attributes;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  void **v11;
  unsigned int *v12;
  _DWORD *v13;
  unsigned int *v14;
  __int128 v16;
  uint64_t v17;

  v4 = -[GEOFeatureStyleAttributes init](self, "init");
  if (v4)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v16);
    p_attributes = (void ***)&v4->_attributes;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v4->_attributes, &v16);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v9 = 0;
    v10 = 0;
    *(_QWORD *)&v16 = &v17;
    if (!a3)
      goto LABEL_9;
    v11 = *p_attributes;
    do
    {
      v13 = (_DWORD *)v16;
      *(_QWORD *)&v16 = v16 + 8;
      LODWORD(v13) = *v13;
      v14 = (unsigned int *)((char *)*v11 + v9);
      *v14 = a3;
      v14[1] = v13;
      ++v10;
      v9 += 8;
LABEL_9:
      v12 = (unsigned int *)v16;
      *(_QWORD *)&v16 = v16 + 8;
      a3 = *v12;
      v11 = *p_attributes;
    }
    while (a3);
    *((_BYTE *)v11 + 33) = v10;
    qsort(**p_attributes, *((unsigned __int8 *)*p_attributes + 33), 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
  }
  return v4;
}

- (GEOFeatureStyleAttributes)init
{
  GEOFeatureStyleAttributes *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOFeatureStyleAttributes;
  v2 = -[GEOFeatureStyleAttributes init](&v8, sel_init);
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v7);
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v2->_attributes, &v7);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
    if (*((_QWORD *)&v7 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  return v2;
}

- (GEOFeatureStyleAttributes)initWithPlaceStyleAttributes:(id)a3
{
  id v4;
  GEOFeatureStyleAttributes *v5;
  GEOFeatureStyleAttributes *v6;
  GEOFeatureStyleAttributes *v7;
  shared_ptr<FeatureStyleAttributes> *p_attributes;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t i;
  void *v17;
  FeatureStyleAttributes *ptr;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[GEOFeatureStyleAttributes init](self, "init");
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v24);
    p_attributes = &v6->_attributes;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v6->_attributes, &v24);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    **(_QWORD **)p_attributes->__ptr_ = 0x300000005;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "attributes", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      v15 = 1;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          if (v15 > 0x1F)
          {

            v7 = 0;
            goto LABEL_23;
          }
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v17, "hasKey") && objc_msgSend(v17, "hasValue"))
          {
            *(_DWORD *)(*(_QWORD *)p_attributes->__ptr_ + 8 * v15) = objc_msgSend(v17, "key");
            *(_DWORD *)(*(_QWORD *)p_attributes->__ptr_ + 8 * v15++ + 4) = objc_msgSend(v17, "value");
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v15 = 1;
    }

    ptr = p_attributes->__ptr_;
    *((_BYTE *)ptr + 33) = v15;
    qsort(*(void **)ptr, v15, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    v7 = v6;
  }
LABEL_23:

  return v7;
}

- (shared_ptr<FeatureStyleAttributes>)featureStyleAttributesPtr
{
  FeatureStyleAttributes **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<FeatureStyleAttributes> result;

  cntrl = self->_attributes.__cntrl_;
  *v2 = self->_attributes.__ptr_;
  v2[1] = (FeatureStyleAttributes *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (FeatureStyleAttributes *)self;
  return result;
}

- (int)poiType
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    return FeatureStyleAttributes::poiType(ptr);
  else
    return -1;
}

+ (id)addressMarkerStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 348, 10, 5, 0);
}

+ (id)airportStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 4, 226, 5, 3, 6, 6, 10, 2, 0);
}

- (id)copyWithAirportStyleAttributes
{
  void *v3;
  uint64_t v5;

  v3 = (void *)-[GEOFeatureStyleAttributes copy](self, "copy");
  if (!-[GEOFeatureStyleAttributes isLabelPOI](self, "isLabelPOI"))
  {
    v5 = 0x600000006;
    objc_msgSend(v3, "replaceAttributes:count:", &v5, 1);
  }
  return v3;
}

+ (id)searchResultStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65570, 1, 65572, 1, 5, 3, 0);
}

+ (id)markerWithHalo
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 65599, 2, 0);
}

+ (id)homeStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 346, 65572, 1, 0);
}

+ (id)homeWithHalo
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 346, 65599, 2, 65572, 1, 0);
}

+ (id)workStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 347, 65572, 1, 0);
}

+ (id)workWithHalo
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 347, 65599, 2, 65572, 1, 0);
}

+ (id)schoolStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 169, 65572, 1, 0);
}

+ (id)schoolWithHalo
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 169, 65599, 2, 65572, 1, 0);
}

+ (id)sharedLocationStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 456, 65572, 1, 0);
}

+ (id)sharedLocationWithHalo
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 456, 65572, 1, 65599, 2, 0);
}

+ (id)transitStationStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 127, 65572, 1, 0);
}

+ (id)parkedCarStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 349, 65572, 1, 0);
}

+ (id)restaurantStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 20, 65572, 1, 0);
}

+ (id)calendarEventStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 353, 65572, 1, 0);
}

+ (id)frequentLocationStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 348, 65572, 1, 0);
}

+ (id)gasStationStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 112, 10, 2, 0);
}

+ (id)evChargerStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 335, 10, 2, 0);
}

+ (id)hotelStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 11, 10, 2, 0);
}

+ (id)carRentalStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 137, 10, 2, 0);
}

+ (id)ticketedEventStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 23, 10, 2, 0);
}

+ (id)inviteStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 353, 10, 2, 0);
}

+ (id)nearbyTransitStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 24, 65572, 1, 0);
}

+ (id)RAPLocationStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 414, 65572, 1, 0);
}

+ (id)customRouteGenericAnchorPointStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 348, 0);
}

+ (id)customRouteCreationCurrentLocationStyleAttributes
{
  return -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 463, 0);
}

+ (id)customSavedRouteStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 461, 65572, 1, 0);
}

+ (id)customSavedRouteDashedStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 487, 65572, 1, 0);
}

+ (id)curatedRouteStyleAttributes
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 465, 65572, 1, 0);
}

+ (id)styleAttributesForPlace:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  GEOFeatureStyleAttributes *v8;
  _DWORD v10[2];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    v6 = 348;
    if (v5 <= 42)
    {
      if (v5 > 3)
      {
        if (v5 == 4)
        {
          v6 = 260;
        }
        else if (v5 == 16)
        {
          v6 = 3;
        }
      }
      else
      {
        if (v5 == 2)
          v7 = 2;
        else
          v7 = 348;
        if (v5 == 1)
          v6 = 1;
        else
          v6 = v7;
      }
    }
    else
    {
      switch(v5)
      {
        case '+':
          v6 = 4;
          break;
        case ',':
          v6 = 5;
          break;
        case '-':
        case '/':
          break;
        case '.':
          v6 = 221;
          break;
        case '0':
          v6 = 180;
          break;
        default:
          if (v5 == 55)
          {
            v6 = 223;
          }
          else if (v5 == 61)
          {
            v6 = 0;
          }
          break;
      }
    }
  }
  else
  {
    v6 = 348;
  }
  v8 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 10, 5, 0);
  v10[0] = 6;
  v10[1] = v6;
  -[GEOFeatureStyleAttributes replaceAttributes:count:](v8, "replaceAttributes:count:", v10, 1);

  return v8;
}

- (BOOL)isLabelPOI
{
  uint64_t v3;
  unint64_t v4;
  GeoCodecsFeatureStylePair *v5;
  char v6;
  uint64_t var1;
  void *v8;
  void *v9;

  if (qword_1ECDBBAF8 != -1)
    dispatch_once(&qword_1ECDBBAF8, &__block_literal_global_32);
  if (!-[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"))
    return 0;
  v3 = 0;
  v4 = 0;
  while (1)
  {
    v5 = -[GEOFeatureStyleAttributes v](self, "v");
    if (v5)
    {
      if (v5[v3].var0 == 6)
        break;
    }
    ++v4;
    ++v3;
    if (v4 >= -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"))
      return 0;
  }
  var1 = v5[v3].var1;
  v8 = (void *)_MergedGlobals_196;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "containsObject:", v9);

  return v6;
}

void __57__GEOFeatureStyleAttributes_PersonalizedItem__isLabelPOI__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  uint64_t v6;
  char **v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_MergedGlobals_196;
  _MergedGlobals_196 = 0;

  _getValue(GeoServicesConfig_FeatureStyleAttributePOITypesThatAreLabels, (uint64_t)off_1EDF4CEE8, 1, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = v11;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v13;
      v5 = &selRef_initWithPhoneNumbers_allowCellularDataForLookup_traits_;
      do
      {
        v6 = 0;
        v7 = v5;
        do
        {
          if (*(_QWORD *)v13 != v4)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v1, "addObject:", v8);
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_14;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1, "addObject:", v9);

          }
          ++v6;
        }
        while (v3 != v6);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v5 = v7;
      }
      while (v3);
    }

    v10 = objc_msgSend(v1, "copy");
    v2 = (id)_MergedGlobals_196;
    _MergedGlobals_196 = v10;
LABEL_14:

  }
  if (!_MergedGlobals_196)
    _MergedGlobals_196 = (uint64_t)&unk_1E1E85438;

}

- (BOOL)isLandmarkPOI
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  GeoCodecsFeatureStylePair *v6;

  v3 = -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = -[GEOFeatureStyleAttributes v](self, "v");
      if (v6)
      {
        if (v6[v4].var0 == 47)
          break;
      }
      ++v5;
      ++v4;
      if (v5 >= -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"))
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isSearchResult
{
  GeoCodecsFeatureStylePair *v3;
  uint64_t v4;
  unint64_t v5;

  LODWORD(v3) = -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs");
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v3 = -[GEOFeatureStyleAttributes v](self, "v");
      if (v3)
      {
        if (v3[v4].var0 == 65570)
          break;
      }
      ++v5;
      ++v4;
      if (v5 >= -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"))
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    LOBYTE(v3) = v3[v4].var1 == 1;
  }
  return (char)v3;
}

- (BOOL)isTransit
{
  return -[GEOFeatureStyleAttributes poiType](self, "poiType") == 225;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  unint64_t i;
  GeoCodecsFeatureStylePair *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  for (i = 0; i < -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"); ++i)
  {
    v6 = -[GEOFeatureStyleAttributes v](self, "v");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6[v4].var1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6[v4].var0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, v8);

    }
    ++v4;
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isSystemTransit
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  GeoCodecsFeatureStylePair *v6;

  v3 = -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = -[GEOFeatureStyleAttributes v](self, "v");
      if (v6)
      {
        if (v6[v4].var0 == 49)
          break;
      }
      ++v5;
      ++v4;
      if (v5 >= -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"))
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isCustomPOI
{
  BOOL result;
  int v4;
  int v5;

  v5 = 0;
  FeatureStyleAttributesFind(self, 5, &v5);
  result = 0;
  if (v5 == 3)
  {
    v4 = 0;
    FeatureStyleAttributesFind(self, 65572, &v4);
    return v4 == 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithSharedStyleAttributes:(const void *)a3 extAttributes:(const GeoCodecsFeatureStylePairExt *)a4 extAttributeCount:(unsigned __int8)a5
{
  unsigned int v5;
  GEOFeatureStyleAttributes *v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 v20;
  objc_super v21;

  v5 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GEOFeatureStyleAttributes;
  v8 = -[GEOFeatureStyleAttributes init](&v21, sel_init);
  if (v8)
  {
    v9 = (char *)operator new(0x40uLL);
    v10 = v9;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = 0;
    *(_QWORD *)v9 = &off_1E1BFB2F8;
    v11 = *(_QWORD **)a3;
    v12 = *((_QWORD *)a3 + 1);
    *((_QWORD *)v9 + 3) = **(_QWORD **)a3;
    v13 = v9 + 24;
    *((_QWORD *)v9 + 4) = v11;
    *((_QWORD *)v9 + 5) = v12;
    if (v12)
    {
      v14 = (unint64_t *)(v12 + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      v11 = *(_QWORD **)a3;
    }
    *((_QWORD *)v9 + 6) = 0;
    v9[56] = 0;
    *(_WORD *)(v9 + 57) = *((unsigned __int8 *)v11 + 33);
    if (a4 && v5)
      FeatureStyleAttributes::setExtAttributes((FeatureStyleAttributes *)(v9 + 24), a4, v5);
    *(_QWORD *)&v20 = v13;
    *((_QWORD *)&v20 + 1) = v10;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v8->_attributes, &v20);
    v16 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v17 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  return v8;
}

- (GEOFeatureStyleAttributes)initWithStyleAttributes:(const void *)a3
{
  GEOFeatureStyleAttributes *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOFeatureStyleAttributes;
  v4 = -[GEOFeatureStyleAttributes init](&v10, sel_init);
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<FeatureStyleAttributes,std::allocator<FeatureStyleAttributes>,FeatureStyleAttributes const&,void>((FeatureStyleAttributes **)&v9, (uint64_t)a3);
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v4->_attributes, &v9);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return v4;
}

- (GEOFeatureStyleAttributes)initWithGEOStyleAttributes:(id)a3
{
  id v4;
  GEOFeatureStyleAttributes *v5;
  GEOFeatureStyleAttributes *v6;
  uint64_t p_attributes;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  char v11;
  void **v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  __int128 v18;

  v4 = a3;
  v5 = -[GEOFeatureStyleAttributes init](self, "init");
  v6 = v5;
  if (v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v18);
    p_attributes = (uint64_t)&v5->_attributes;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100](p_attributes, &v18);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    if ((unint64_t)objc_msgSend(v4, "attributesCount") >= 0x20)
    {
      *(_BYTE *)(*(_QWORD *)p_attributes + 33) = 32;
    }
    else
    {
      v11 = objc_msgSend(v4, "attributesCount");
      v12 = *(void ***)p_attributes;
      *(_BYTE *)(*(_QWORD *)p_attributes + 33) = v11;
      if (!v11)
      {
        v13 = 0;
LABEL_13:
        qsort(*v12, v13, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        goto LABEL_14;
      }
    }
    v14 = 0;
    v15 = 0;
    do
    {
      objc_msgSend(v4, "attributeAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(**(_QWORD **)p_attributes + v14) = objc_msgSend(v16, "key");
      *(_DWORD *)(**(_QWORD **)p_attributes + v14 + 4) = objc_msgSend(v16, "value");

      ++v15;
      v12 = *(void ***)p_attributes;
      v13 = *(unsigned __int8 *)(*(_QWORD *)p_attributes + 33);
      v14 += 8;
    }
    while (v15 < v13);
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (void)featureStyleAttributes
{
  return self->_attributes.__ptr_;
}

- (void)setExtAttributes:(const GeoCodecsFeatureStylePairExt *)a3 count:(unsigned int)a4
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    FeatureStyleAttributes::setExtAttributes(ptr, a3, a4);
}

- (void)replaceAttributes:(const GeoCodecsFeatureStylePair *)a3 count:(unsigned int)a4
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    FeatureStyleAttributes::replaceAttributes(ptr, a3, a4);
}

- (BOOL)hasAttributes
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  if (*((_BYTE *)ptr + 33))
    return 1;
  return *((_BYTE *)ptr + 32) != 0;
}

- (unsigned)lineType
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *v4;
  int v5;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (*((_BYTE *)ptr + 33))
  {
    v4 = (int *)(*(_QWORD *)ptr + 4);
    while (*(v4 - 1) != 1)
    {
      v4 += 2;
      if (!--v3)
        goto LABEL_6;
    }
    v5 = *v4;
  }
  else
  {
LABEL_6:
    v5 = -1;
  }
  return v5 & ~(v5 >> 31);
}

- (BOOL)isTunnel
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 14; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i == 1;
}

- (BOOL)isBridge
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 14; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i == 2;
}

- (BOOL)isRamp
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 21; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i > 0;
}

- (int)rampType
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;
  int v6;
  int v7;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 1;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 21; i += 2)
  {
    if (!--v3)
      return 1;
  }
  v6 = *i;
  if (*i == 2)
    v7 = 2;
  else
    v7 = 1;
  if (v6)
    return v7;
  else
    return 0;
}

- (unsigned)rampDirection
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;
  int v6;
  unsigned __int8 v7;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 3;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 33; i += 2)
  {
    if (!--v3)
      return 3;
  }
  v6 = *i;
  if (*i == 2)
    v7 = 2;
  else
    v7 = 3;
  if (v6 == 1)
    return 1;
  else
    return v7;
}

- (BOOL)isFreeway
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (ptr)
  {
    v3 = *((unsigned __int8 *)ptr + 33);
    if (*((_BYTE *)ptr + 33))
    {
      v4 = *(_QWORD *)ptr;
      v5 = (_DWORD *)(v4 + 4);
      v6 = v3;
      while (*(v5 - 1) != 1)
      {
        v5 += 2;
        if (!--v6)
          goto LABEL_8;
      }
      if (*v5 == 9)
      {
LABEL_13:
        for (i = (_DWORD *)(v4 + 4); *(i - 1) != 21; i += 2)
        {
          if (!--v3)
            return 1;
        }
        return *i < 1;
      }
LABEL_8:
      v7 = (_DWORD *)(v4 + 4);
      v8 = v3;
      while (*(v7 - 1) != 1)
      {
        v7 += 2;
        if (!--v8)
          return 0;
      }
      if (*v7 == 10)
        goto LABEL_13;
    }
  }
  return 0;
}

- (BOOL)isRailway
{
  FeatureStyleAttributes *ptr;
  unint64_t v3;
  _DWORD *v4;
  unint64_t v6;
  int *v7;
  int v8;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 12)
    return 1;
  v6 = 0;
  v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 12)
      return v6 < v3;
  }
  v6 = v3;
  return v6 < v3;
}

- (BOOL)isBorder
{
  FeatureStyleAttributes *ptr;
  unint64_t v3;
  _DWORD *v4;
  unint64_t v6;
  int *v7;
  int v8;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 2)
    return 1;
  v6 = 0;
  v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 2)
      return v6 < v3;
  }
  v6 = v3;
  return v6 < v3;
}

- (BOOL)hasDrivingSide
{
  FeatureStyleAttributes *ptr;
  unint64_t v3;
  _DWORD *v4;
  unint64_t v6;
  int *v7;
  int v8;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 24)
    return 1;
  v6 = 0;
  v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 24)
      return v6 < v3;
  }
  v6 = v3;
  return v6 < v3;
}

- (int)drivingSide
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 1;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 24; i += 2)
  {
    if (!--v3)
      return 1;
  }
  return *i != 0;
}

- (BOOL)isRoadPedestrianNavigable
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 75; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i == 1;
}

- (int)sidewalkSide
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;
  int v6;
  _BOOL4 v7;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 76; i += 2)
  {
    if (!--v3)
      return 0;
  }
  v6 = *i;
  v7 = *i == 1;
  if (v6 == 2)
    return 2;
  else
    return v7;
}

- (int)walkableSide
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 77; i += 2)
  {
    if (!--v3)
      return 0;
  }
  if ((*i - 1) >= 3)
    return 0;
  else
    return *i;
}

- (int)bikeableSide
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 86; i += 2)
  {
    if (!--v3)
      return 0;
  }
  if ((*i - 1) >= 3)
    return 0;
  else
    return *i;
}

- (int)bikeLaneSide
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  int *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (int *)(*(_QWORD *)ptr + 4); *(i - 1) != 87; i += 2)
  {
    if (!--v3)
      return 0;
  }
  if ((*i - 1) >= 3)
    return 0;
  else
    return *i;
}

- (BOOL)isWalkable
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 25; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i > 0;
}

- (BOOL)isDrivable
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 26; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i > 0;
}

- (BOOL)shouldSuppress3DBuildingStrokes
{
  FeatureStyleAttributes *ptr;
  uint64_t v3;
  _DWORD *i;

  ptr = self->_attributes.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((_BYTE *)ptr + 33))
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)ptr + 4); *(i - 1) != 35; i += 2)
  {
    if (!--v3)
      return 0;
  }
  return *i == 0;
}

- (GeoCodecsFeatureStylePair)v
{
  GeoCodecsFeatureStylePair **ptr;

  ptr = (GeoCodecsFeatureStylePair **)self->_attributes.__ptr_;
  if (ptr)
    return *ptr;
  else
    return 0;
}

- (GeoCodecsFeatureStylePairExt)extAttrs
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    return (GeoCodecsFeatureStylePairExt *)*((_QWORD *)ptr + 3);
  else
    return 0;
}

- (unsigned)countExtAttrs
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    return *((_BYTE *)ptr + 32);
  else
    return 0;
}

- (unsigned)countAttrs
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    return *((_BYTE *)ptr + 33);
  else
    return 0;
}

- (NSString)poiCategory
{
  void *v3;
  void *v4;

  if (self->_attributes.__ptr_)
  {
    +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "categoryForPOIType:", FeatureStyleAttributes::poiType(self->_attributes.__ptr_));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (GEOFeatureStyleAttributes)initWithCoder:(id)a3
{
  id v4;
  GEOFeatureStyleAttributes *v5;
  uint64_t v6;
  void *v7;
  GEOFeatureStyleAttributes *v8;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v26;
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
  v4 = a3;
  v5 = -[GEOFeatureStyleAttributes init](self, "init");
  if (!v5)
    goto LABEL_24;
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("v"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v7, "count") <= 0x1F)
  {
    v26 = v4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v7;
    v10 = 0;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)(*(_QWORD *)v5->_attributes.__ptr_ + 8 * v10) = objc_msgSend(v14, "unsignedIntValue");
          *(_DWORD *)(*(_QWORD *)v5->_attributes.__ptr_ + 8 * v10 + 4) = objc_msgSend(v15, "intValue");

          ++v10;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    *((_BYTE *)v5->_attributes.__ptr_ + 33) = v10;
    v16 = objc_opt_class();
    objc_msgSend(v26, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v16, objc_opt_class(), CFSTR("extAttrs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (unint64_t)objc_msgSend(v17, "count") > 0xFF)
    {

      v8 = 0;
      v4 = v26;
      goto LABEL_25;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v17;
    v19 = 0;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v18, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)(*((_QWORD *)v5->_attributes.__ptr_ + 3) + 12 * v19) = objc_msgSend(v23, "unsignedIntValue");
          *(_QWORD *)(*((_QWORD *)v5->_attributes.__ptr_ + 3) + 12 * v19 + 4) = objc_msgSend(v24, "unsignedLongLongValue");

          ++v19;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    *((_BYTE *)v5->_attributes.__ptr_ + 32) = v19;
    -[GEOFeatureStyleAttributes sort](v5, "sort");

    v4 = v26;
LABEL_24:
    v8 = v5;
    goto LABEL_25;
  }

  v8 = 0;
LABEL_25:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  FeatureStyleAttributes *ptr;
  uint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  FeatureStyleAttributes *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *((unsigned __int8 *)self->_attributes.__ptr_ + 33));
  ptr = self->_attributes.__ptr_;
  if (*((_BYTE *)ptr + 33))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (unsigned int *)(*(_QWORD *)ptr + v6);
      v9 = *v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      ++v7;
      ptr = self->_attributes.__ptr_;
      v6 += 8;
    }
    while (v7 < *((unsigned __int8 *)ptr + 33));
  }
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("v"));
  if (*((_BYTE *)self->_attributes.__ptr_ + 32))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *((unsigned __int8 *)self->_attributes.__ptr_ + 32));
    v13 = self->_attributes.__ptr_;
    if (*((_BYTE *)v13 + 32))
    {
      v14 = 0;
      v15 = 0;
      do
      {
        v16 = (unsigned int *)(*((_QWORD *)v13 + 3) + v14);
        v17 = *v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v16 + 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

        ++v15;
        v13 = self->_attributes.__ptr_;
        v14 += 12;
      }
      while (v15 < *((unsigned __int8 *)v13 + 32));
    }
    objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("extAttrs"));

  }
}

- (char)featureType
{
  FeatureStyleAttributes *ptr;

  ptr = self->_attributes.__ptr_;
  if (ptr)
    LOBYTE(ptr) = *((_BYTE *)ptr + 34);
  return (char)ptr;
}

- (shared_ptr<const)_sharedAttributes
{
  _QWORD *v2;
  FeatureStyleAttributes *ptr;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  shared_ptr<const FeatureStyleAttributes> result;

  ptr = self->_attributes.__ptr_;
  if (ptr)
  {
    v5 = *((_QWORD *)ptr + 1);
    v4 = *((_QWORD *)ptr + 2);
    *v2 = v5;
    v2[1] = v4;
    if (v4)
    {
      v6 = (unint64_t *)(v4 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
  }
  else
  {
    *v2 = 0;
    v2[1] = 0;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (FeatureStyleAttributes *)self;
  return result;
}

- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesConstPtr:(const void *)a3
{
  GEOFeatureStyleAttributes *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOFeatureStyleAttributes;
  v4 = -[GEOFeatureStyleAttributes init](&v10, sel_init);
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<FeatureStyleAttributes,std::allocator<FeatureStyleAttributes>,FeatureStyleAttributes const&,void>((FeatureStyleAttributes **)&v9, *(_QWORD *)a3);
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v4->_attributes, &v9);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  GEOFeatureStyleAttributes *v5;
  FeatureStyleAttributes *ptr;

  v4 = *((_QWORD *)self->_attributes.__ptr_ + 1);
  v5 = +[GEOFeatureStyleAttributes allocWithZone:](GEOFeatureStyleAttributes, "allocWithZone:", a3);
  ptr = self->_attributes.__ptr_;
  if (v4)
    return -[GEOFeatureStyleAttributes _initWithSharedStyleAttributes:extAttributes:extAttributeCount:](v5, "_initWithSharedStyleAttributes:extAttributes:extAttributeCount:", (char *)ptr + 8, *((_QWORD *)ptr + 3), *((unsigned __int8 *)ptr + 32));
  else
    return -[GEOFeatureStyleAttributes initWithStyleAttributes:](v5, "initWithStyleAttributes:", ptr);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19[2];
  FeatureStyleAttributes *ptr;
  __shared_weak_count *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cntrl = self->_attributes.__cntrl_;
    ptr = self->_attributes.__ptr_;
    v21 = cntrl;
    if (cntrl)
    {
      v6 = (unint64_t *)((char *)cntrl + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    if (v4)
    {
      objc_msgSend(v4, "featureStyleAttributesPtr");
      v8 = v17;
      v9 = v18;
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    v19[0] = v8;
    v19[1] = (uint64_t)v9;
    v10 = geo::codec::featureStyleAttributesCompare((uint64_t *)&ptr, v19) == 0;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v13 = (std::__shared_weak_count *)v21;
    if (v21)
    {
      v14 = (unint64_t *)((char *)v21 + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sort
{
  qsort(*(void **)self->_attributes.__ptr_, *((unsigned __int8 *)self->_attributes.__ptr_ + 33), 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  __CFString *v6;
  FeatureStyleAttributes *ptr;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if (self->_attributes.__ptr_)
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p attrs:["), v5, self);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    ptr = self->_attributes.__ptr_;
    if (*((_BYTE *)ptr + 33))
    {
      v8 = 0;
      v9 = 0;
      do
      {
        -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("(%d,%d)"), *(unsigned int *)(*(_QWORD *)ptr + v8), *(unsigned int *)(*(_QWORD *)ptr + v8 + 4));
        ++v9;
        ptr = self->_attributes.__ptr_;
        v10 = *((unsigned __int8 *)ptr + 33);
        if (v9 < v10)
        {
          -[__CFString appendString:](v6, "appendString:", CFSTR(", "));
          ptr = self->_attributes.__ptr_;
          v10 = *((unsigned __int8 *)ptr + 33);
        }
        v8 += 8;
      }
      while (v9 < v10);
    }
    if (*((_BYTE *)ptr + 32))
    {
      v11 = 0;
      v12 = 0;
      do
      {
        -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("(%d,%llu)"), *(unsigned int *)(*((_QWORD *)ptr + 3) + v11), *(_QWORD *)(*((_QWORD *)ptr + 3) + v11 + 4));
        ++v12;
        ptr = self->_attributes.__ptr_;
        v13 = *((unsigned __int8 *)ptr + 32);
        if (v12 < v13)
        {
          -[__CFString appendString:](v6, "appendString:", CFSTR(", "));
          ptr = self->_attributes.__ptr_;
          v13 = *((unsigned __int8 *)ptr + 32);
        }
        v11 += 12;
      }
      while (v12 < v13);
    }
    -[__CFString appendString:](v6, "appendString:", CFSTR("]>"));
  }
  else
  {
    v6 = &stru_1E1C241D0;
  }
  return v6;
}

@end
