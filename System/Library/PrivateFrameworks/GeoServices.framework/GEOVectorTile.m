@implementation GEOVectorTile

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_QWORD *)self + 16) = 0;
  return self;
}

- (shared_ptr<geo::codec::VectorTile>)vectorTilePtr
{
  VectorTile **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<geo::codec::VectorTile> result;

  cntrl = self->_vectorTile.__cntrl_;
  *v2 = self->_vectorTile.__ptr_;
  v2[1] = (VectorTile *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VectorTile *)self;
  return result;
}

- (GEOVectorTile)initWithVMP4:(void *)a3 localizationData:(void *)a4 tileKey:(unsigned __int8 *)a5
{
  id v8;
  id v9;
  GEOVectorTile *v10;
  id v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  GEOVectorTile *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  void *v22;
  id v23;
  uint64_t v24;
  char *v25;
  std::string::__raw *v26;
  std::string *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  unint64_t v31;
  id v32;
  std::__shared_weak_count *size;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _BYTE v41[16];
  objc_super v42;
  unint64_t v43;
  __int16 v44;
  char v45;
  std::string __p;
  uint64_t v47;
  char v48;
  _QWORD v49[3];
  std::string *v50;
  std::string v51;
  std::string *v52;
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v42.receiver = a1;
  v42.super_class = (Class)GEOVectorTile;
  v10 = -[GEOVectorTile init](&v42, sel_init);
  if (!v10)
  {
    v16 = 0;
    goto LABEL_40;
  }
  v11 = objc_retainAutorelease(v9);
  geo::codec::PBDataReaderObjC::PBDataReaderObjC((geo::codec::PBDataReaderObjC *)v41, (const unsigned __int8 *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  memset(&__p, 0, sizeof(__p));
  v47 = 0x400000;
  v50 = 0;
  v48 = 1;
  v12 = *a5;
  v13 = v12 & 0x7F;
  if (v13 == 19)
  {
    v17 = *(_QWORD *)(a5 + 1);
    v45 = 0;
    v18 = (v17 << 9) & 0xFFFFFF0000000000 | ((v17 & 0x3F) << 8) & 0x3FFF | (((v17 >> 6) & 0x1FFFFFF) << 14) | v12;
    v44 = (v17 >> 55) & 1;
  }
  else
  {
    if (v13 == 16)
    {
      v14 = *(_DWORD *)(a5 + 9);
      v15 = *(_QWORD *)(a5 + 1);
      v45 = v14 >> 11;
      v43 = (v15 << 8) & 0xFFFFFF0000003FFFLL | ((unint64_t)(v15 >> 6) << 14) | v12;
      v44 = HIBYTE(v15) & 3 | (v15 >> 59) & 0xFC | (32 * v14);
      goto LABEL_11;
    }
    v19 = *(_QWORD *)(a5 + 1);
    if (v13 == 20)
    {
      v44 = HIBYTE(v19) & 3;
      v18 = (v19 << 8) & 0xFFFFFF0000003FFFLL | ((unint64_t)(v19 >> 6) << 14) | v12;
      v45 = ((v19 >> 42) >> 16) & 0xF;
    }
    else
    {
      v20 = *(unsigned int *)(a5 + 9) | ((unint64_t)(*(unsigned __int16 *)(a5 + 13) | (a5[15] << 16)) << 32);
      *((_QWORD *)&v21 + 1) = v20;
      *(_QWORD *)&v21 = *(_QWORD *)(a5 + 1);
      v45 = BYTE6(v20);
      v18 = (v21 >> 32) & 0xFFFFFFFFFFFFFF00 | v12;
      v44 = WORD2(v20);
    }
  }
  v43 = v18;
LABEL_11:
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "languageForTileKey:", a5);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "UTF8String");

  if (v24)
    v25 = (char *)v24;
  else
    v25 = "";
  std::string::basic_string[abi:ne180100]<0>(&v51, v25);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v51;
  v26 = (std::string::__raw *)v49;
  v51.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E1BFA4F0;
  v27 = v50;
  if (v50 == (std::string *)v49)
  {
    v53[0] = &off_1E1BFA4F0;
    v52 = 0;
    (*(void (**)(_QWORD *, std::string *))(v49[0] + 24))(v49, &v51);
    (*(void (**)(std::string *))(v50->__r_.__value_.__r.__words[0] + 32))(v50);
    v50 = 0;
    v52 = &v51;
    (*(void (**)(uint64_t, _QWORD *))(v53[0] + 24))((uint64_t)v53, v49);
    (*(void (**)(_QWORD *))(v53[0] + 32))(v53);
    v50 = (std::string *)v49;
    v27 = v52;
  }
  else
  {
    v52 = v50;
    v49[0] = &off_1E1BFA4F0;
    v50 = (std::string *)v49;
  }
  if (v27 == &v51)
  {
    v28 = 4;
    v27 = &v51;
    goto LABEL_23;
  }
  if (v27)
  {
    v28 = 5;
LABEL_23:
    (*(void (**)(void))(v27->__r_.__value_.__r.__words[0] + 8 * v28))();
  }
  v29 = objc_retainAutorelease(v8);
  v30 = (const char *)objc_msgSend(v29, "bytes");
  v31 = objc_msgSend(v29, "length");
  v32 = objc_retainAutorelease(v11);
  geo::codec::initWithVMP4AndLocData(v30, v31, (_BYTE *)objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"), (uint64_t)&v43, &__p, (geo::codec::VectorTile **)&v51);
  std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v10->_vectorTile, (__int128 *)&v51);
  size = (std::__shared_weak_count *)v51.__r_.__value_.__l.__size_;
  if (v51.__r_.__value_.__l.__size_)
  {
    v34 = (unint64_t *)(v51.__r_.__value_.__l.__size_ + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  if (v10->_vectorTile.__ptr_)
  {
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activeTileGroup");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activeTileSetForKey:", a5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v10->_vectorTile.__ptr_ = objc_msgSend(v38, "version");

    v16 = v10;
  }
  else
  {
    v16 = 0;
  }
  if (v50 == (std::string *)v49)
  {
    v39 = 4;
    goto LABEL_36;
  }
  if (v50)
  {
    v39 = 5;
    v26 = (std::string::__raw *)v50;
LABEL_36:
    (*(void (**)(std::string::__raw *))(v26->__words[0] + 8 * v39))(v26);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  geo::codec::PBDataReaderObjC::~PBDataReaderObjC((geo::codec::PBDataReaderObjC *)v41);
LABEL_40:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_connectivityJunctions, 0);
  objc_storeStrong((id *)&self->_cached_overlapBuildingFootprints, 0);
  objc_storeStrong((id *)&self->_cached_transitLinks, 0);
  objc_storeStrong((id *)&self->_cached_transitLines, 0);
  objc_storeStrong((id *)&self->_cached_buildingFootprints, 0);
  objc_storeStrong((id *)&self->_cached_coastlines, 0);
  objc_storeStrong((id *)&self->_cached_lines, 0);
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_vectorTile);
}

- (void)initWithVMP4:localizationData:tileKey:
{
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  VectorTile *v9;
  std::__shared_weak_count *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "vectorTilePtr");
      v5 = self->_vectorTile.__ptr_ == v9;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v7 = __ldaxr(p_shared_owners);
        while (__stlxr(v7 - 1, p_shared_owners));
        if (!v7)
        {
          ((void (*)())v10->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v10);
        }
      }
    }
    else
    {
      v5 = self->_vectorTile.__ptr_ == 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lines
{
  once_flag *p_initLinesFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initLinesFlag = &self->_initLinesFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initLinesFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initLinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile lines]::$_1 &&>>);
  }

  return v3->_cached_lines;
}

- (id)coastlines
{
  once_flag *p_initCoastlinesFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initCoastlinesFlag = &self->_initCoastlinesFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initCoastlinesFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initCoastlinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile coastlines]::$_2 &&>>);
  }

  return v3->_cached_coastlines;
}

- (id)buildingFootprints
{
  once_flag *p_initBuildingFootprintsFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initBuildingFootprintsFlag = &self->_initBuildingFootprintsFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initBuildingFootprintsFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initBuildingFootprintsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile buildingFootprints]::$_3 &&>>);
  }

  return v3->_cached_buildingFootprints;
}

- (NSMutableArray)junctionsWithoutFeature
{
  once_flag *p_initConnectivityJunctionsFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initConnectivityJunctionsFlag = &self->_initConnectivityJunctionsFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initConnectivityJunctionsFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initConnectivityJunctionsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile junctionsWithoutFeature]::$_4 &&>>);
  }

  return v3->_cached_connectivityJunctions;
}

- (id)transitLines
{
  once_flag *p_initTransitLinesFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initTransitLinesFlag = &self->_initTransitLinesFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initTransitLinesFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initTransitLinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile transitLines]::$_5 &&>>);
  }

  return v3->_cached_transitLines;
}

- (id)transitLinks
{
  once_flag *p_initTransitLinksFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initTransitLinksFlag = &self->_initTransitLinksFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initTransitLinksFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initTransitLinksFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile transitLinks]::$_6 &&>>);
  }

  return v3->_cached_transitLinks;
}

- (NSMutableArray)overlapBuildingFootprints
{
  once_flag *p_initOverlapBuildingFootprintsFlag;
  GEOVectorTile *v3;
  unint64_t v4;
  GEOVectorTile *v6;
  id **v7;
  id *v8;

  p_initOverlapBuildingFootprintsFlag = &self->_initOverlapBuildingFootprintsFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initOverlapBuildingFootprintsFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initOverlapBuildingFootprintsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile overlapBuildingFootprints]::$_7 &&>>);
  }

  return v3->_cached_overlapBuildingFootprints;
}

- (void)polygons
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 12);
}

- (void)venues
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 23);
}

- (void)venueBuildings
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 27);
}

- (void)pois
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 63);
}

- (GeoCodecsConnectivityJunction)junctions
{
  return (GeoCodecsConnectivityJunction *)*((_QWORD *)self->_vectorTile.__ptr_ + 86);
}

- (void)transitSystems
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 164);
}

- (void)transitNodes
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 176);
}

- (void)transitStationTransfers
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 183);
}

- (GeoCodecsConnectivityJunction)transitJunctions
{
  return (GeoCodecsConnectivityJunction *)*((_QWORD *)self->_vectorTile.__ptr_ + 187);
}

- (void)transitAccessPoints
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 195);
}

- (void)daVinciAssets
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 259);
}

- (void)daVinciDecals
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 275);
}

- (void)daVinciBuildings
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 290);
}

- (void)physicalFeatures
{
  return (void *)*((_QWORD *)self->_vectorTile.__ptr_ + 19);
}

- (unint64_t)linesCount
{
  return 0xCF3CF3CF3CF3CF3DLL
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 5) - *((_QWORD *)self->_vectorTile.__ptr_ + 4)) >> 3);
}

- (unint64_t)coastlinesCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 9) - *((_QWORD *)self->_vectorTile.__ptr_ + 8)) >> 3);
}

- (unint64_t)polygonsCount
{
  return (uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 13) - *((_QWORD *)self->_vectorTile.__ptr_ + 12)) >> 7;
}

- (unint64_t)polygonsVertexCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 16);
}

- (unint64_t)venuesCount
{
  return 0x8E38E38E38E38E39
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 24) - *((_QWORD *)self->_vectorTile.__ptr_ + 23)) >> 4);
}

- (unint64_t)venueBuildingsCount
{
  return 0x86BCA1AF286BCA1BLL
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 28) - *((_QWORD *)self->_vectorTile.__ptr_ + 27)) >> 3);
}

- (GeoCodecsVenueLevel)venueLevels
{
  return (GeoCodecsVenueLevel *)*((_QWORD *)self->_vectorTile.__ptr_ + 32);
}

- (unint64_t)venueLevelsCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 31);
}

- (GeoCodecsVenueComponent)venueComponents
{
  return (GeoCodecsVenueComponent *)*((_QWORD *)self->_vectorTile.__ptr_ + 34);
}

- (unint64_t)venueComponentsCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 33);
}

- (unint64_t)buildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 36) - *((_QWORD *)self->_vectorTile.__ptr_ + 35)) >> 3);
}

- (unint64_t)poisCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 64) - *((_QWORD *)self->_vectorTile.__ptr_ + 63)) >> 5);
}

- (GeoCodecsLabelTextPlacement)labelTextPlacements
{
  return (GeoCodecsLabelTextPlacement *)*((_QWORD *)self->_vectorTile.__ptr_ + 83);
}

- (unsigned)labelTextPlacementsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 168);
}

- (GeoCodecsConnectivityOverpass)overpasses
{
  return (GeoCodecsConnectivityOverpass *)*((_QWORD *)self->_vectorTile.__ptr_ + 85);
}

- (unint64_t)junctionsCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 87);
}

- (BOOL)hasComputedJunctions
{
  return *((_BYTE *)self->_vectorTile.__ptr_ + 704);
}

- (GeoCodecsLineCrossing)lineCrossings
{
  return (GeoCodecsLineCrossing *)*((_QWORD *)self->_vectorTile.__ptr_ + 93);
}

- (unint64_t)lineCrossingsCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 92);
}

- (GeoCodecsConnectivityPointOnRoad)pointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad *)*((_QWORD *)self->_vectorTile.__ptr_ + 89);
}

- (unint64_t)pointsOnRoadCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 90);
}

- ($5E5F304956FB491AF6F034FDF0808287)geoConnectivityPointOnRoad
{
  return ($5E5F304956FB491AF6F034FDF0808287 *)*((_QWORD *)self->_vectorTile.__ptr_ + 89);
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)geoSortedConnectivityPointOnRoad
{
  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)*((_QWORD *)self->_vectorTile.__ptr_ + 91);
}

- (GeoCodecsConnectivityPointOnRoad)sortedPointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad **)*((_QWORD *)self->_vectorTile.__ptr_ + 91);
}

- (GeoCodecsCharacteristicPoint)lineCharacteristicPoints
{
  return (GeoCodecsCharacteristicPoint *)*((_QWORD *)self->_vectorTile.__ptr_ + 150);
}

- (unint64_t)lineCharacteristicPointCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 151);
}

- (GeoCodecsCharacteristicPoint)polygonCharacteristicPoints
{
  return (GeoCodecsCharacteristicPoint *)*((_QWORD *)self->_vectorTile.__ptr_ + 152);
}

- (unint64_t)polygonCharacteristicPointCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 153);
}

- (GeoCodecsStrokeSpecification)lineStrokeSpecifications
{
  return (GeoCodecsStrokeSpecification *)*((_QWORD *)self->_vectorTile.__ptr_ + 154);
}

- (unint64_t)lineStrokeSpecificationCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 155);
}

- (GeoCodecsStrokeSpecification)polygonStrokeSpecifications
{
  return (GeoCodecsStrokeSpecification *)*((_QWORD *)self->_vectorTile.__ptr_ + 156);
}

- (unint64_t)polygonStrokeSpecificationCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 157);
}

- (GeoCodecsCurveVertexPool)curveLineVertices
{
  return (GeoCodecsCurveVertexPool *)*((_QWORD *)self->_vectorTile.__ptr_ + 96);
}

- (GeoCodecsVertexPool)lineVertices
{
  return (GeoCodecsVertexPool *)*((_QWORD *)self->_vectorTile.__ptr_ + 99);
}

- (GeoCodecsTileKey)tileKey
{
  return (GeoCodecsTileKey *)((char *)self->_vectorTile.__ptr_ + 4);
}

- (float)geoTileKey
{
  float result;

  LODWORD(result) = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((*(unsigned __int16 *)(*(_QWORD *)(a1 + 8) + 12) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 8) + 14) << 16)) >> 2), (int32x2_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 8) + 14)), (int8x8_t)0xF00003FFFLL).u32[0];
  return result;
}

- (unint64_t)tileReferenceCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 158);
}

- (GeoCodecsTileKey)tileReferences
{
  return (GeoCodecsTileKey *)*((_QWORD *)self->_vectorTile.__ptr_ + 159);
}

- (unint64_t)transitLineCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 161) - *((_QWORD *)self->_vectorTile.__ptr_ + 160)) >> 3);
}

- (unint64_t)transitSystemCount
{
  return 0x8E38E38E38E38E39
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 165) - *((_QWORD *)self->_vectorTile.__ptr_ + 164)) >> 3);
}

- (unint64_t)transitLinkCount
{
  return 0xD37A6F4DE9BD37A7
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 169) - *((_QWORD *)self->_vectorTile.__ptr_ + 168)) >> 3);
}

- (unint64_t)transitLinkLineIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 173);
}

- (unint64_t)transitLinkLineIndicesCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 174);
}

- (GeoCodecsVertexPool)transitVertices
{
  return (GeoCodecsVertexPool *)*((_QWORD *)self->_vectorTile.__ptr_ + 175);
}

- (unint64_t)transitNodeCount
{
  return 0x82FA0BE82FA0BE83
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 177) - *((_QWORD *)self->_vectorTile.__ptr_ + 176)) >> 3);
}

- (unint64_t)transitNodeSystemIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 180);
}

- (unint64_t)transitNodeIndexCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 181);
}

- (GeoCodecsVertexPool)transitStationTransferVertices
{
  return (GeoCodecsVertexPool *)*((_QWORD *)self->_vectorTile.__ptr_ + 182);
}

- (unint64_t)transitStationTransferCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 184) - *((_QWORD *)self->_vectorTile.__ptr_ + 183)) >> 3);
}

- (unint64_t)transitJunctionCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 188);
}

- (GeoCodecsConnectivityPointOnRoad)transitPointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad *)*((_QWORD *)self->_vectorTile.__ptr_ + 189);
}

- (unint64_t)transitPointsOnRoadCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 190);
}

- (unsigned)transitTravelTimes
{
  return (unsigned int *)*((_QWORD *)self->_vectorTile.__ptr_ + 191);
}

- (float)transitLinkLineMinZoomOverrides
{
  return (float *)*((_QWORD *)self->_vectorTile.__ptr_ + 192);
}

- (unint64_t)transitAccessPointCount
{
  return 0xEF7BDEF7BDEF7BDFLL
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 196) - *((_QWORD *)self->_vectorTile.__ptr_ + 195)) >> 3);
}

- (unint64_t)transitNodeLineIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 200);
}

- (unint64_t)transitNodeSubtitleLineIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 203);
}

- (unint64_t)transitShieldIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 205);
}

- (unsigned)transitLineDirections
{
  return (unsigned __int8 *)*((_QWORD *)self->_vectorTile.__ptr_ + 207);
}

- (const)transitLinkSections
{
  return (const GeoCodecsTransitLinkSection *)*((_QWORD *)self->_vectorTile.__ptr_ + 212);
}

- (char)transitCoverage
{
  return *((_BYTE *)self->_vectorTile.__ptr_ + 1712);
}

- (unint64_t)transitNodeCollapseIndices
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 222);
}

- (unint64_t)transitNodeCollapseIndexCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 223);
}

- (unint64_t)transitNodeCollapseIDs
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 224);
}

- (unint64_t)transitNodeCollapseIDCount
{
  return *((_QWORD *)self->_vectorTile.__ptr_ + 225);
}

- (GeoCodecsSslpmTileInfo)sslpmTileInfo
{
  return (GeoCodecsSslpmTileInfo *)*((_QWORD *)self->_vectorTile.__ptr_ + 226);
}

- (unsigned)tileLabelLinesCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 454);
}

- (GeoCodecsTileLabelLine)tileLabelLines
{
  return (GeoCodecsTileLabelLine *)*((_QWORD *)self->_vectorTile.__ptr_ + 228);
}

- (unsigned)labelLineFeatureSectionsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 458);
}

- (GeoCodecsLabelLineFeatureSection)labelLineFeatureSections
{
  return (GeoCodecsLabelLineFeatureSection *)*((_QWORD *)self->_vectorTile.__ptr_ + 230);
}

- (unsigned)labelLineAttributesCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 462);
}

- (GeoCodecsLabelLineAttribute)labelLineAttributes
{
  return (GeoCodecsLabelLineAttribute *)*((_QWORD *)self->_vectorTile.__ptr_ + 232);
}

- (unint64_t)poiStorefrontBundleIDs
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 234);
}

- (unsigned)poiStorefrontBundleIDsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 466);
}

- (GeoCodecsLabelSummaryIcon)labelSummaryIcons
{
  return (GeoCodecsLabelSummaryIcon *)*((_QWORD *)self->_vectorTile.__ptr_ + 236);
}

- (unsigned)labelSummaryIconsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 470);
}

- (BOOL)containsDaVinciData
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 488) & 1;
}

- (BOOL)containsProjectedLegacyData
{
  return (*((unsigned __int8 *)self->_vectorTile.__ptr_ + 1952) >> 1) & 1;
}

- (unsigned)daVinciVertexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 490);
}

- (GeoCodecsVectorTilePoint3D)daVinciVertices
{
  return (GeoCodecsVectorTilePoint3D *)*((_QWORD *)self->_vectorTile.__ptr_ + 246);
}

- (unsigned)explicitTextureDataCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1000);
}

- (GeoCodecsDaVinciExplicitTextureMappingData)explicitTextureData
{
  return (GeoCodecsDaVinciExplicitTextureMappingData *)*((_QWORD *)self->_vectorTile.__ptr_ + 251);
}

- (unsigned)directionalXYTextureDataCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1008);
}

- (GeoCodecsDaVinciDirectionalXYTextureMappingData)directionalXYTextureData
{
  return (GeoCodecsDaVinciDirectionalXYTextureMappingData *)*((_QWORD *)self->_vectorTile.__ptr_ + 253);
}

- (unsigned)daVinciIndexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 508);
}

- (unsigned)daVinciIndices
{
  return (unsigned __int16 *)*((_QWORD *)self->_vectorTile.__ptr_ + 255);
}

- (unsigned)daVinciMeshCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1024);
}

- (GeoCodecsDaVinciMesh)daVinciMeshes
{
  return (GeoCodecsDaVinciMesh *)*((_QWORD *)self->_vectorTile.__ptr_ + 257);
}

- (unsigned)daVinciAssetCount
{
  return -13107
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 520) - *((_DWORD *)self->_vectorTile.__ptr_ + 518)) >> 3);
}

- (unsigned)daVinciMaterialSheetCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1068);
}

- (GeoCodecsDaVinciMaterialSheet)daVinciMaterialSheets
{
  return (GeoCodecsDaVinciMaterialSheet *)*((_QWORD *)self->_vectorTile.__ptr_ + 268);
}

- (unsigned)daVinciSceneCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1076);
}

- (GeoCodecsDaVinciScene)daVinciScenes
{
  return (GeoCodecsDaVinciScene *)*((_QWORD *)self->_vectorTile.__ptr_ + 270);
}

- (unsigned)daVinciRenderableCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1084);
}

- (GeoCodecsDaVinciRenderable)daVinciRenderables
{
  return (GeoCodecsDaVinciRenderable *)*((_QWORD *)self->_vectorTile.__ptr_ + 272);
}

- (unsigned)daVinciDecalCount
{
  return -29127
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 552) - *((_DWORD *)self->_vectorTile.__ptr_ + 550)) >> 3);
}

- (GeoCodecsDaVinciMetaData)daVinciMetaData
{
  return (GeoCodecsDaVinciMetaData *)*((_QWORD *)self->_vectorTile.__ptr_ + 279);
}

- (unsigned)daVinciBuildingVertexOffset
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 562);
}

- (unsigned)daVinciBuildingVertexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 563);
}

- (unsigned)daVinciLineLoopCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1144);
}

- (GeoCodecsVectorTilePoint3D)daVinciBuildingVertices
{
  return (GeoCodecsVectorTilePoint3D *)*((_QWORD *)self->_vectorTile.__ptr_ + 282);
}

- (GeoCodecsDaVinciLineLoop)daVinciLineLoops
{
  return (GeoCodecsDaVinciLineLoop *)*((_QWORD *)self->_vectorTile.__ptr_ + 287);
}

- (unsigned)daVinciBuildingSectionCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1152);
}

- (GeoCodecsDaVinciBuildingSection)daVinciBuildingSections
{
  return (GeoCodecsDaVinciBuildingSection *)*((_QWORD *)self->_vectorTile.__ptr_ + 289);
}

- (unsigned)daVinciBuildingCount
{
  return -13107
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 582) - *((_DWORD *)self->_vectorTile.__ptr_ + 580)) >> 3);
}

- (signed)maxElevationInMeters
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1432);
}

- (signed)minElevationInMeters
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1433);
}

- (float)tileSizeInMeters
{
  return *((float *)self->_vectorTile.__ptr_ + 717);
}

- (unsigned)zResolutionBits
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1436);
}

- (unsigned)elevationRasterByteCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 719);
}

- (char)elevationRasterPng
{
  return (char *)*((_QWORD *)self->_vectorTile.__ptr_ + 360);
}

- (double)metersToTileSize
{
  return *((double *)self->_vectorTile.__ptr_ + 434);
}

- (BOOL)buildingsHaveTerrainElevation
{
  return *((_BYTE *)self->_vectorTile.__ptr_ + 3480);
}

- (unint64_t)physicalFeaturesCount
{
  return 0x2E8BA2E8BA2E8BA3
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 20) - *((_QWORD *)self->_vectorTile.__ptr_ + 19)) >> 4);
}

- (GeoCodecsVertexPool)physicalFeaturesVertices
{
  return (GeoCodecsVertexPool *)*((_QWORD *)self->_vectorTile.__ptr_ + 106);
}

- (unint64_t)totalBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 36) - *((_QWORD *)self->_vectorTile.__ptr_ + 35)) >> 3)
       - 0xF0F0F0F0F0F0F0FLL
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 48) - *((_QWORD *)self->_vectorTile.__ptr_ + 47)) >> 3);
}

- (unint64_t)totalThreeDBuildingsCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 56) - *((_QWORD *)self->_vectorTile.__ptr_ + 55)) >> 4)
       + 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 60) - *((_QWORD *)self->_vectorTile.__ptr_ + 59)) >> 4);
}

- (unint64_t)nonOverlappingBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 36) - *((_QWORD *)self->_vectorTile.__ptr_ + 35)) >> 3);
}

- (unint64_t)nonOverlappingThreeDBuildingsCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 56) - *((_QWORD *)self->_vectorTile.__ptr_ + 55)) >> 4);
}

- (unint64_t)overlapBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((_QWORD *)self->_vectorTile.__ptr_ + 48) - *((_QWORD *)self->_vectorTile.__ptr_ + 47)) >> 3);
}

- (void)forEachRoad:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  if (v8)
  {
    -[GEOVectorTile lines](self, "lines");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "type") == 1)
          v8[2](v8, v7);

        ++v6;
      }
      while (v5 != v6);
    }

  }
}

- (void)forEachPoint:(id)a3
{
  VectorTile *ptr;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  if (v8)
  {
    ptr = self->_vectorTile.__ptr_;
    v5 = *((_QWORD *)ptr + 63);
    v6 = *((_QWORD *)ptr + 64) - v5;
    if (v6)
    {
      v7 = v6 / 224;
      do
      {
        v8[2](v8, v5);
        v5 += 224;
        --v7;
      }
      while (v7);
    }
  }

}

- (void)forEachPolygon:(id)a3
{
  uint64_t v4;
  unint64_t i;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  if (v6)
  {
    v4 = *((_QWORD *)self->_vectorTile.__ptr_ + 12);
    for (i = -[GEOVectorTile polygonsCount](self, "polygonsCount"); i; --i)
    {
      v6[2](v6, v4);
      v4 += 128;
    }
  }

}

- (void)forEachEdgeOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  const GeoCodecsConnectivityJunction *v15;

  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    v8 = *((_QWORD *)self->_vectorTile.__ptr_ + 89);
    -[GEOVectorTile lines](self, "lines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3->var0)
    {
      v10 = 0;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        objc_msgSend(v9, "objectAtIndex:", *(unsigned int *)(v8 + 16 * (v10 + a3->var1) + 4));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v11;
        v13[1] = 3221225472;
        v13[2] = __47__GEOVectorTile_forEachEdgeOnJunction_visitor___block_invoke;
        v13[3] = &unk_1E1C0E6E0;
        v15 = a3;
        v14 = v7;
        -[GEOVectorTile forEachEdgeInRoad:visitTwice:visitor:](self, "forEachEdgeInRoad:visitTwice:visitor:", v12, 1, v13);

        ++v10;
      }
      while (v10 < a3->var0);
    }

  }
}

void __47__GEOVectorTile_forEachEdgeOnJunction_visitor___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "junctionA") == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)forEachEdgeInRoad:(id)a3 visitTwice:(BOOL)a4 visitor:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  VectorTile *ptr;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BYTE v32[56];
  uint64_t v33;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8 && v9)
  {
    ptr = self->_vectorTile.__ptr_;
    v12 = *((_QWORD *)ptr + 86);
    v13 = *((_QWORD *)ptr + 91);
    v33 = 0;
    geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v8, "get"), 0, &v33);
    v14 = objc_msgSend(v8, "roadPointIndex");
    v15 = objc_msgSend(v8, "roadPointCount");
    v16 = -[GEORoadEdge init:withMultiSectionFeatureInterface:]([GEORoadEdge alloc], "init:withMultiSectionFeatureInterface:", v32, v8);
    v31 = v8;
    v17 = objc_msgSend(v8, "getRoad");
    *(_QWORD *)objc_msgSend(v16, "get") = v17;
    *(_QWORD *)(objc_msgSend(v16, "get") + 8) = 0;
    *(_QWORD *)(objc_msgSend(v16, "get") + 16) = 0;
    *(_QWORD *)(objc_msgSend(v16, "get") + 24) = 0;
    *(_QWORD *)(objc_msgSend(v16, "get") + 32) = 0;
    *(_QWORD *)(objc_msgSend(v16, "get") + 40) = 0;
    v18 = 0;
    *(_QWORD *)(objc_msgSend(v16, "get") + 48) = 0;
    v19 = v33 - 1;
    v20 = v13 + 8 * v14;
    do
    {
      if (v18 >= v15)
      {
        *(_QWORD *)(objc_msgSend(v16, "get") + 16) = v19;
        *(_QWORD *)(objc_msgSend(v16, "get") + 32) = 0;
        v25 = objc_msgSend(v16, "get");
        v26 = 0;
      }
      else
      {
        v21 = *(unsigned int **)(v20 + 8 * v18);
        v22 = v21[3];
        *(_QWORD *)(objc_msgSend(v16, "get") + 16) = v22;
        v23 = *v21;
        *(_QWORD *)(objc_msgSend(v16, "get") + 32) = v23;
        v24 = *v21;
        v25 = objc_msgSend(v16, "get");
        v26 = v12 + 32 * v24;
      }
      *(_QWORD *)(v25 + 48) = v26;
      v27 = objc_msgSend(v16, "vertexIndexA");
      if (v27 < objc_msgSend(v16, "vertexIndexB"))
      {
        ((void (**)(_QWORD, id))v10)[2](v10, v16);
        if (v6)
        {
          GEORoadEdgeFlip(v16);
          ((void (**)(_QWORD, id))v10)[2](v10, v16);
          GEORoadEdgeFlip(v16);
        }
      }
      v28 = objc_msgSend(v16, "vertexIndexB");
      *(_QWORD *)(objc_msgSend(v16, "get") + 8) = v28;
      v29 = objc_msgSend(v16, "junctionIndexB");
      *(_QWORD *)(objc_msgSend(v16, "get") + 24) = v29;
      v30 = objc_msgSend(v16, "junctionB");
      *(_QWORD *)(objc_msgSend(v16, "get") + 40) = v30;
      ++v18;
    }
    while (v18 <= v15);

    v8 = v31;
  }

}

- (void)forEachTransitLinkOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void (**v11)(id, void *);

  v6 = (void (**)(id, void *))a4;
  if (a3 && v6)
  {
    v11 = v6;
    v7 = *((_QWORD *)self->_vectorTile.__ptr_ + 189);
    -[GEOVectorTile transitLinks](self, "transitLinks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3->var0)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", *(unsigned int *)(v7 + 16 * (v9 + a3->var1) + 4));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v10);

        ++v9;
      }
      while (v9 < a3->var0);
    }

    v6 = v11;
  }

}

- (void)forEachJunction:(id)a3
{
  VectorTile *ptr;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  void (**v13)(id, _QWORD);

  v13 = (void (**)(id, _QWORD))a3;
  ptr = self->_vectorTile.__ptr_;
  if (*((_QWORD *)ptr + 87))
  {
    v5 = 0;
    v6 = *((_QWORD *)ptr + 99);
    v7 = *(_QWORD **)(v6 + 32);
    v8 = *(_QWORD *)(v6 + 8) + 8 * *v7;
    v9 = *((_QWORD *)ptr + 89);
    v10 = 4;
    do
    {
      v11 = *((_QWORD *)ptr + 4);
      v12 = (unsigned int *)(v9 + 16 * *(unsigned int *)(*((_QWORD *)ptr + 86) + v10));
      v13[2](v13, v8 + 8 * (v7[2 * v12[2] + 2 * *(_DWORD *)(v11 + 168 * v12[1] + 96)] + v12[3]));
      ++v5;
      ptr = self->_vectorTile.__ptr_;
      v10 += 32;
    }
    while (v5 < *((_QWORD *)ptr + 87));
  }

}

- (void)forEachJunctionInRoad:(void *)a3 visitor:(id)a4
{
  void (**v6)(id, _QWORD);
  VectorTile *ptr;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(id, _QWORD);
  uint64_t v17;

  v6 = (void (**)(id, _QWORD))a4;
  if (a3 && v6)
  {
    v16 = v6;
    ptr = self->_vectorTile.__ptr_;
    v8 = *((_QWORD *)ptr + 91);
    v9 = *((_QWORD *)ptr + 99);
    v10 = *(uint64_t **)(v9 + 32);
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *v10;
    geo::codec::multiSectionFeaturePoints(a3, 0, &v17);
    v13 = *((unsigned __int16 *)a3 + 72);
    if (*((_WORD *)a3 + 72))
    {
      v14 = v11 + 8 * v12;
      v15 = v8 + 8 * *((unsigned int *)a3 + 33);
      do
      {
        v16[2](v16, v14+ 8* (v10[2 * (*(_DWORD *)(*(_QWORD *)v15 + 8) + *((_DWORD *)a3 + 24))]+ *(unsigned int *)(*(_QWORD *)v15 + 12)));
        v15 += 8;
        --v13;
      }
      while (v13);
    }
    v6 = v16;
  }

}

- (unsigned)runningTrackFlags
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 934);
}

- (void)forEachRunningTrack:(id)a3
{
  VectorTile *ptr;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  ptr = self->_vectorTile.__ptr_;
  v5 = *((_QWORD *)ptr + 468);
  v6 = *((_QWORD *)ptr + 469);
  while (v5 != v6)
  {
    v7[2](v7, v5);
    v5 += 128;
  }

}

- (void)transitSystemInfoForFeatureID:(unint64_t)a3
{
  return (void *)geo::codec::VectorTile::transitSystemInfoForFeatureID((geo::codec::VectorTile *)self->_vectorTile.__ptr_, a3);
}

- (void)transitLineForFeatureID:(unint64_t)a3
{
  VectorTile *ptr;
  _BYTE *v4;
  void *result;
  unint64_t v6;

  ptr = self->_vectorTile.__ptr_;
  v4 = (_BYTE *)*((_QWORD *)ptr + 161);
  result = (void *)*((_QWORD *)ptr + 160);
  if (v4 == result)
    return 0;
  v6 = (v4 - (_BYTE *)result) / 104;
  if (v6 <= 1)
    v6 = 1;
  while (*((_QWORD *)result + 5) != a3)
  {
    result = (char *)result + 104;
    if (!--v6)
      return 0;
  }
  return result;
}

- (void)transitNodeForFeatureID:(unint64_t)a3
{
  VectorTile *ptr;
  _BYTE *v4;
  void *result;
  unint64_t v6;

  ptr = self->_vectorTile.__ptr_;
  v4 = (_BYTE *)*((_QWORD *)ptr + 177);
  result = (void *)*((_QWORD *)ptr + 176);
  if (v4 == result)
    return 0;
  v6 = (v4 - (_BYTE *)result) / 344;
  if (v6 <= 1)
    v6 = 1;
  while (*((_QWORD *)result + 5) != a3)
  {
    result = (char *)result + 344;
    if (!--v6)
      return 0;
  }
  return result;
}

- (void)transitAccessPointForFeatureID:(unint64_t)a3
{
  VectorTile *ptr;
  _BYTE *v4;
  void *result;
  unint64_t v6;

  ptr = self->_vectorTile.__ptr_;
  v4 = (_BYTE *)*((_QWORD *)ptr + 196);
  result = (void *)*((_QWORD *)ptr + 195);
  if (v4 == result)
    return 0;
  v6 = (v4 - (_BYTE *)result) / 248;
  if (v6 <= 1)
    v6 = 1;
  while (*((_QWORD *)result + 5) != a3)
  {
    result = (char *)result + 248;
    if (!--v6)
      return 0;
  }
  return result;
}

- (unsigned)daVinciStyleAttributeRasterCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1420);
}

- (GeoCodecsDaVinciStyleAttributeRaster)daVinciStyleAttributeRasters
{
  return (GeoCodecsDaVinciStyleAttributeRaster *)*((_QWORD *)self->_vectorTile.__ptr_ + 354);
}

- (unsigned)daVinciTileVersion
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 698);
}

- (unsigned)daVinciExternalAssetCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1398);
}

- (unsigned)daVinciExternalMaterialCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1400);
}

- (unint64_t)daVinciExternalAssetIDs
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 351);
}

- (unint64_t)daVinciExternalMaterialIDs
{
  return (unint64_t *)*((_QWORD *)self->_vectorTile.__ptr_ + 353);
}

- (GEOVectorTile)initWithVectorTile:(const void *)a3
{
  GEOVectorTile *v4;
  GEOVectorTile *v5;
  VectorTile *v6;
  BOOL v7;
  GEOVectorTile *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GEOVectorTile;
  v4 = -[GEOVectorTile init](&v16, sel_init);
  v5 = v4;
  v6 = *(VectorTile **)a3;
  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = *((_QWORD *)a3 + 1);
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    cntrl = (std::__shared_weak_count *)v4->_vectorTile.__cntrl_;
    v4->_vectorTile.__ptr_ = v6;
    v4->_vectorTile.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v8 = v5;
  }

  return v8;
}

- (_QWORD)initWithVMP4:localizationData:tileKey:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E1BFA4F0;
  return result;
}

- (uint64_t)initWithVMP4:localizationData:tileKey:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
