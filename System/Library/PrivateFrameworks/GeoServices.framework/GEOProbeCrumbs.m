@implementation GEOProbeCrumbs

- (GEOProbeCrumbs)init
{
  GEOProbeCrumbs *result;

  result = (GEOProbeCrumbs *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOProbeCrumbs)initWithRoute:(id)a3
{
  id v4;
  GEOProbeCrumbs *v5;
  GEOProbeCrumbs *v6;
  GEOProbeCrumbs *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOProbeCrumbs;
  v5 = -[GEOProbeCrumbs init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOProbeCrumbs resetStateWithRoute:](v5, "resetStateWithRoute:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOProbeCrumbs clearCache](self, "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)GEOProbeCrumbs;
  -[GEOProbeCrumbs dealloc](&v3, sel_dealloc);
}

- (void)addLocation:(id)a3 polyCoordinate:(PolylineCoordinate)a4 timestamp:(unint64_t)a5
{
  double var1;
  double var0;
  unint64_t UInteger;
  unint64_t v11;
  NSObject *v12;
  unint64_t crumbCounter;
  NSObject *v14;
  unint64_t value;
  NSObject *v16;
  double v17;
  double v18;
  _GEOProbeCrumbsLocation **end;
  _GEOProbeCrumbsLocation **begin;
  unint64_t v21;
  uint64_t v22;
  unint64_t start;
  unint64_t v24;
  _GEOProbeCrumbsLocation **v25;
  _GEOProbeCrumbsLocation *v26;
  _GEOProbeCrumbsLocation *v27;
  _GEOProbeCrumbsLocation **v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _GEOProbeCrumbsLocation **v36;
  int64_t v37;
  _GEOProbeCrumbsLocation **v38;
  _GEOProbeCrumbsLocation **v39;
  _GEOProbeCrumbsLocation **first;
  _GEOProbeCrumbsLocation *v41;
  _GEOProbeCrumbsLocation *v42;
  unint64_t v43;
  _GEOProbeCrumbsLocation **v44;
  uint64_t v45;
  uint64_t v46;
  _GEOProbeCrumbsLocation *v47;
  _GEOProbeCrumbsLocation **v48;
  _GEOProbeCrumbsLocation **v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  _GEOProbeCrumbsLocation **v57;
  uint64_t v58;
  _GEOProbeCrumbsLocation **v59;
  _GEOProbeCrumbsLocation **v60;
  uint64_t v61;
  uint64_t v62;
  _GEOProbeCrumbsLocation **v63;
  _GEOProbeCrumbsLocation *v64;
  _GEOProbeCrumbsLocation **v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t maxCrumbs;
  unint64_t v69;
  char *v70;
  unint64_t v71;
  _GEOProbeCrumbsLocation **v72;
  uint64_t v73;
  _GEOProbeCrumbsLocation **v74;
  _GEOProbeCrumbsLocation **v75;
  uint64_t v76;
  uint64_t v77;
  _GEOProbeCrumbsLocation **v78;
  _GEOProbeCrumbsLocation *v79;
  _GEOProbeCrumbsLocation **v80;
  _GEOProbeCrumbsLocation **v81;
  _GEOProbeCrumbsLocation **v82;
  _GEOProbeCrumbsLocation *v83;
  _GEOProbeCrumbsLocation **v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _GEOProbeCrumbsLocation **v91;
  int64_t v92;
  _GEOProbeCrumbsLocation *v93;
  uint64_t v94;
  unint64_t v95;
  _GEOProbeCrumbsLocation **v96;
  uint64_t v97;
  _GEOProbeCrumbsLocation **v98;
  _GEOProbeCrumbsLocation **i;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _GEOProbeCrumbsLocation **v103;
  unint64_t v104;
  _GEOProbeCrumbsLocation **v105;
  uint64_t v106;
  _GEOProbeCrumbsLocation **v107;
  uint64_t v108;
  uint64_t v109;
  _GEOProbeCrumbsLocation **v110;
  _GEOProbeCrumbsLocation **v111;
  _GEOProbeCrumbsLocation *v112;
  _GEOProbeCrumbsLocation *v113;
  _GEOProbeCrumbsLocation **v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  _GEOProbeCrumbsLocation **v118;
  uint64_t v119;
  _GEOProbeCrumbsLocation **v120;
  _GEOProbeCrumbsLocation **v121;
  uint64_t v122;
  uint64_t v123;
  _GEOProbeCrumbsLocation **v124;
  _GEOProbeCrumbsLocation *v125;
  _GEOProbeCrumbsLocation **v126;
  unint64_t v127;
  int v128;
  int v129;
  $F24F406B2B787EFB06265DBA3D28CBD5 v130;
  uint8_t buf[4];
  _BYTE v132[20];
  __int16 v133;
  int v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v130 = a3;
  if (!self->_enabled)
  {
    GEOGetGEOProbeCrumbsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "addLocation - ignored (disabled)", buf, 2u);
    }

    return;
  }
  var1 = a3.var1;
  var0 = a3.var0;
  ++self->_crumbCounter;
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1EDF4E148);
  if (self->_crumbCounter % UInteger)
  {
    v11 = UInteger;
    GEOGetGEOProbeCrumbsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      crumbCounter = self->_crumbCounter;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v132 = crumbCounter;
      *(_WORD *)&v132[8] = 2048;
      *(_QWORD *)&v132[10] = v11;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "addLocation - ignored (counter=%lu, frequency=%lu)", buf, 0x16u);
    }

    return;
  }
  value = self->_locations.__size_.__value_;
  v129 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", var0);
  v128 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", var1);
  GEOGetGEOProbeCrumbsLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68158467;
    *(_DWORD *)v132 = 16;
    *(_WORD *)&v132[4] = 2097;
    *(_QWORD *)&v132[6] = &v130;
    *(_WORD *)&v132[14] = 1025;
    *(_DWORD *)&v132[16] = v129;
    v133 = 1025;
    v134 = v128;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "addLocation - raw:%{private,geo:coordinate}.*P\te7:%{private}d,%{private}d", buf, 0x1Eu);
  }

  -[GEOComposedRoute distanceToEndFromRouteCoordinate:](self->_route, "distanceToEndFromRouteCoordinate:", a4);
  v18 = v17;
  end = self->_locations.__map_.__end_;
  begin = self->_locations.__map_.__begin_;
  v21 = end - begin;
  if (end == begin)
    v22 = 0;
  else
    v22 = 170 * v21 - 1;
  start = self->_locations.__start_;
  v24 = self->_locations.__size_.__value_ + start;
  if (v22 == v24)
  {
    if (start < 0xAA)
    {
      v39 = self->_locations.__map_.__end_cap_.__value_;
      first = self->_locations.__map_.__first_;
      if (v21 >= v39 - first)
      {
        if (v39 == first)
          v43 = 1;
        else
          v43 = ((char *)v39 - (char *)first) >> 2;
        v44 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v43);
        v46 = v45;
        v127 = value;
        v47 = (_GEOProbeCrumbsLocation *)operator new(0xFF0uLL);
        v48 = &v44[v21];
        v49 = &v44[v46];
        if (v21 == v46)
        {
          v50 = 8 * v21;
          if ((char *)end - (char *)begin < 1)
          {
            v93 = v47;
            v94 = v50 >> 2;
            if (end == begin)
              v95 = 1;
            else
              v95 = v94;
            v96 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v95);
            v48 = &v96[v95 >> 2];
            v49 = &v96[v97];
            if (v44)
              operator delete(v44);
            v44 = v96;
            v47 = v93;
          }
          else
          {
            v51 = v50 >> 3;
            if (v51 >= -1)
              v52 = v51 + 1;
            else
              v52 = v51 + 2;
            v48 -= v52 >> 1;
          }
        }
        *v48 = v47;
        v98 = v48 + 1;
        for (i = self->_locations.__map_.__end_; i != self->_locations.__map_.__begin_; --i)
        {
          if (v48 == v44)
          {
            if (v98 >= v49)
            {
              if (v49 == v44)
                v104 = 1;
              else
                v104 = ((char *)v49 - (char *)v44) >> 2;
              v105 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v104);
              v107 = v105;
              v48 = (_GEOProbeCrumbsLocation **)((char *)v105 + ((2 * v104 + 6) & 0xFFFFFFFFFFFFFFF8));
              v108 = (char *)v98 - (char *)v44;
              v53 = v98 == v44;
              v98 = v48;
              if (!v53)
              {
                v98 = (_GEOProbeCrumbsLocation **)((char *)v48 + (v108 & 0xFFFFFFFFFFFFFFF8));
                v109 = 8 * (v108 >> 3);
                v110 = v48;
                v111 = v44;
                do
                {
                  v112 = *v111++;
                  *v110++ = v112;
                  v109 -= 8;
                }
                while (v109);
              }
              v49 = &v105[v106];
              if (v44)
                operator delete(v44);
              v44 = v107;
            }
            else
            {
              v100 = v49 - v98;
              if (v100 >= -1)
                v101 = v100 + 1;
              else
                v101 = v100 + 2;
              v102 = v101 >> 1;
              v48 = &v44[v101 >> 1];
              v103 = v44;
              if (v98 != v44)
              {
                memmove(v48, v44, (char *)v98 - (char *)v44);
                v103 = v98;
              }
              v98 = &v103[v102];
            }
          }
          v113 = *(i - 1);
          *--v48 = v113;
        }
        v114 = self->_locations.__map_.__first_;
        self->_locations.__map_.__first_ = v44;
        self->_locations.__map_.__begin_ = v48;
        self->_locations.__map_.__end_ = v98;
        self->_locations.__map_.__end_cap_.__value_ = v49;
        value = v127;
        if (v114)
          operator delete(v114);
        goto LABEL_46;
      }
      v41 = (_GEOProbeCrumbsLocation *)operator new(0xFF0uLL);
      v42 = v41;
      if (v39 == end)
      {
        if (begin == first)
        {
          if (end == begin)
            v71 = 1;
          else
            v71 = ((char *)v39 - (char *)begin) >> 2;
          v72 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v71);
          begin = &v72[(v71 + 3) >> 2];
          v74 = self->_locations.__map_.__begin_;
          v75 = begin;
          v76 = (char *)self->_locations.__map_.__end_ - (char *)v74;
          if (v76)
          {
            v75 = (_GEOProbeCrumbsLocation **)((char *)begin + (v76 & 0xFFFFFFFFFFFFFFF8));
            v77 = 8 * (v76 >> 3);
            v78 = &v72[(v71 + 3) >> 2];
            do
            {
              v79 = *v74++;
              *v78++ = v79;
              v77 -= 8;
            }
            while (v77);
          }
          v80 = self->_locations.__map_.__first_;
          self->_locations.__map_.__first_ = v72;
          self->_locations.__map_.__begin_ = begin;
          self->_locations.__map_.__end_ = v75;
          self->_locations.__map_.__end_cap_.__value_ = &v72[v73];
          if (v80)
          {
            operator delete(v80);
            begin = self->_locations.__map_.__begin_;
          }
        }
        *(begin - 1) = v42;
        v81 = self->_locations.__map_.__begin_;
        v82 = self->_locations.__map_.__end_;
        self->_locations.__map_.__begin_ = v81 - 1;
        v83 = *(v81 - 1);
        self->_locations.__map_.__begin_ = v81;
        if (v82 == self->_locations.__map_.__end_cap_.__value_)
        {
          v84 = self->_locations.__map_.__first_;
          v85 = (char *)v81 - (char *)v84;
          if (v81 <= v84)
          {
            v115 = (char *)v82 - (char *)v84;
            v53 = v115 == 0;
            v116 = v115 >> 2;
            if (v53)
              v117 = 1;
            else
              v117 = v116;
            v118 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v117);
            v120 = &v118[v117 >> 2];
            v121 = self->_locations.__map_.__begin_;
            v82 = v120;
            v122 = (char *)self->_locations.__map_.__end_ - (char *)v121;
            if (v122)
            {
              v82 = (_GEOProbeCrumbsLocation **)((char *)v120 + (v122 & 0xFFFFFFFFFFFFFFF8));
              v123 = 8 * (v122 >> 3);
              v124 = &v118[v117 >> 2];
              do
              {
                v125 = *v121++;
                *v124++ = v125;
                v123 -= 8;
              }
              while (v123);
            }
            v126 = self->_locations.__map_.__first_;
            self->_locations.__map_.__first_ = v118;
            self->_locations.__map_.__begin_ = v120;
            self->_locations.__map_.__end_ = v82;
            self->_locations.__map_.__end_cap_.__value_ = &v118[v119];
            if (v126)
            {
              operator delete(v126);
              v82 = self->_locations.__map_.__end_;
            }
          }
          else
          {
            v86 = v85 >> 3;
            v31 = v85 >> 3 < -1;
            v87 = (v85 >> 3) + 2;
            if (v31)
              v88 = v87;
            else
              v88 = v86 + 1;
            v89 = -(v88 >> 1);
            v90 = v88 >> 1;
            v91 = &v81[-v90];
            v92 = (char *)v82 - (char *)v81;
            if (v82 != v81)
            {
              memmove(&v81[-v90], v81, (char *)v82 - (char *)v81);
              v81 = self->_locations.__map_.__begin_;
            }
            v82 = (_GEOProbeCrumbsLocation **)((char *)v91 + v92);
            self->_locations.__map_.__begin_ = &v81[v89];
            self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v91 + v92);
          }
        }
        *v82 = v83;
      }
      else
      {
        *end = v41;
      }
    }
    else
    {
      self->_locations.__start_ = start - 170;
      v27 = *begin;
      v25 = begin + 1;
      v26 = v27;
      self->_locations.__map_.__begin_ = v25;
      if (end == self->_locations.__map_.__end_cap_.__value_)
      {
        v28 = self->_locations.__map_.__first_;
        v29 = (char *)v25 - (char *)v28;
        if (v25 <= v28)
        {
          v54 = (char *)end - (char *)v28;
          v53 = v54 == 0;
          v55 = v54 >> 2;
          if (v53)
            v56 = 1;
          else
            v56 = v55;
          v57 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v56);
          v59 = &v57[v56 >> 2];
          v60 = self->_locations.__map_.__begin_;
          end = v59;
          v61 = (char *)self->_locations.__map_.__end_ - (char *)v60;
          if (v61)
          {
            end = (_GEOProbeCrumbsLocation **)((char *)v59 + (v61 & 0xFFFFFFFFFFFFFFF8));
            v62 = 8 * (v61 >> 3);
            v63 = &v57[v56 >> 2];
            do
            {
              v64 = *v60++;
              *v63++ = v64;
              v62 -= 8;
            }
            while (v62);
          }
          v65 = self->_locations.__map_.__first_;
          self->_locations.__map_.__first_ = v57;
          self->_locations.__map_.__begin_ = v59;
          self->_locations.__map_.__end_ = end;
          self->_locations.__map_.__end_cap_.__value_ = &v57[v58];
          if (v65)
          {
            operator delete(v65);
            end = self->_locations.__map_.__end_;
          }
        }
        else
        {
          v30 = v29 >> 3;
          v31 = v29 >> 3 < -1;
          v32 = (v29 >> 3) + 2;
          if (v31)
            v33 = v32;
          else
            v33 = v30 + 1;
          v34 = -(v33 >> 1);
          v35 = v33 >> 1;
          v36 = &v25[-v35];
          v37 = (char *)end - (char *)v25;
          if (end != v25)
          {
            memmove(&v25[-v35], v25, (char *)end - (char *)v25);
            end = self->_locations.__map_.__begin_;
          }
          v38 = &end[v34];
          end = (_GEOProbeCrumbsLocation **)((char *)v36 + v37);
          self->_locations.__map_.__begin_ = v38;
          self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v36 + v37);
        }
      }
      *end = v26;
    }
    ++self->_locations.__map_.__end_;
LABEL_46:
    begin = self->_locations.__map_.__begin_;
    v24 = self->_locations.__size_.__value_ + self->_locations.__start_;
  }
  v66 = (unint64_t)begin[v24 / 0xAA] + 24 * (v24 % 0xAA);
  *(_QWORD *)v66 = a5;
  *(_DWORD *)(v66 + 8) = v129;
  *(_DWORD *)(v66 + 12) = v128;
  *(_QWORD *)(v66 + 16) = (int)(v18 * 100.0);
  v67 = self->_locations.__size_.__value_ + 1;
  self->_locations.__size_.__value_ = v67;
  maxCrumbs = self->_maxCrumbs;
  if (v67 >= maxCrumbs)
  {
    v69 = self->_locations.__start_;
    do
    {
      --v67;
      self->_locations.__start_ = ++v69;
      self->_locations.__size_.__value_ = v67;
      if (v69 >= 0x154)
      {
        operator delete(*(void **)self->_locations.__map_.__begin_);
        ++self->_locations.__map_.__begin_;
        v67 = self->_locations.__size_.__value_;
        v69 = self->_locations.__start_ - 170;
        self->_locations.__start_ = v69;
        maxCrumbs = self->_maxCrumbs;
      }
    }
    while (v67 >= maxCrumbs);
  }
  else
  {
    if (value)
      return;
    v69 = self->_locations.__start_;
  }
  v70 = (char *)self->_locations.__map_.__begin_[v69 / 0xAA] + 24 * (v69 % 0xAA);
  self->_baseE7Lat = *((_DWORD *)v70 + 2);
  self->_baseE7Lng = *((_DWORD *)v70 + 3);
  self->_baseTimestamp = *(_QWORD *)v70;
  self->_baseDistance = *((_DWORD *)v70 + 4);
}

- (void)clearCache
{
  NSObject *v3;
  _GEOProbeCrumbsLocation **begin;
  _GEOProbeCrumbsLocation **end;
  unint64_t v6;
  _GEOProbeCrumbsLocation **v7;
  unint64_t v8;
  uint8_t v9[16];

  GEOGetGEOProbeCrumbsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "_clearCache", v9, 2u);
  }

  begin = self->_locations.__map_.__begin_;
  end = self->_locations.__map_.__end_;
  self->_locations.__size_.__value_ = 0;
  v6 = (char *)end - (char *)begin;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      v7 = self->_locations.__map_.__end_;
      begin = self->_locations.__map_.__begin_ + 1;
      self->_locations.__map_.__begin_ = begin;
      v6 = (char *)v7 - (char *)begin;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    v8 = 85;
  }
  else
  {
    if (v6 >> 3 != 2)
      return;
    v8 = 170;
  }
  self->_locations.__start_ = v8;
}

- (void)resetStateWithRoute:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t UInteger;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = a3;
  GEOGetGEOProbeCrumbsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "resetState", buf, 2u);
  }

  -[GEOProbeCrumbs clearCache](self, "clearCache");
  objc_storeStrong((id *)&self->_route, a3);
  if (GEOConfigGetBOOL(GeoServicesConfig_ProbeCrumbsEnabled, (uint64_t)off_1EDF4E128))
  {
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1EDF4E148);
    self->_enabled = UInteger != 0;
    if (UInteger)
    {
      GEOGetGEOProbeCrumbsLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "enabled", v12, 2u);
      }

      v9 = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbDuration, (uint64_t)off_1EDF4E138);
      self->_maxCrumbs = v9 / GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1EDF4E148) + 1;
      goto LABEL_12;
    }
  }
  else
  {
    self->_enabled = 0;
  }
  GEOGetGEOProbeCrumbsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "disabled", v11, 2u);
  }

LABEL_12:
}

- (id)recentLocationHistory
{
  unint64_t value;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t v6;
  GEORecentLocationHistory *v7;
  GEOLatLngE7 *v8;
  uint64_t v9;
  uint64_t value_low;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_enabled)
  {
    GEOGetGEOProbeCrumbsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - ignored (disabled)", buf, 2u);
    }
    goto LABEL_11;
  }
  value = self->_locations.__size_.__value_;
  GEOGetGEOProbeCrumbsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!value)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - ignored (nothing recorded)", buf, 2u);
    }
LABEL_11:

    return 0;
  }
  if (v5)
  {
    v6 = self->_locations.__size_.__value_;
    *(_DWORD *)buf = 67109120;
    v21 = v6;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - %d locations", buf, 8u);
  }

  v7 = objc_alloc_init(GEORecentLocationHistory);
  v8 = -[GEOLatLngE7 initWithE7Latitude:longitude:]([GEOLatLngE7 alloc], "initWithE7Latitude:longitude:", self->_baseE7Lat, self->_baseE7Lng);
  -[GEORecentLocationHistory setBaseLocation:](v7, "setBaseLocation:", v8);

  -[GEORecentLocationHistory setBaseTimestamp:](v7, "setBaseTimestamp:", self->_baseTimestamp);
  -[GEORecentLocationHistory setLatlngCount:](v7, "setLatlngCount:", LODWORD(self->_locations.__size_.__value_));
  v9 = MEMORY[0x1E0C809B0];
  value_low = LODWORD(self->_locations.__size_.__value_);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke;
  v19[3] = &unk_1E1C15D10;
  v19[4] = self;
  -[GEOProbeCrumbs _encodedDataForIntegersCount:valueCallback:](self, "_encodedDataForIntegersCount:valueCallback:", value_low, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORecentLocationHistory setEncodedLats:](v7, "setEncodedLats:", v11);

  v12 = LODWORD(self->_locations.__size_.__value_);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_2;
  v18[3] = &unk_1E1C15D10;
  v18[4] = self;
  -[GEOProbeCrumbs _encodedDataForIntegersCount:valueCallback:](self, "_encodedDataForIntegersCount:valueCallback:", v12, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORecentLocationHistory setEncodedLngs:](v7, "setEncodedLngs:", v13);

  -[GEORecentLocationHistory setTimeResolution:](v7, "setTimeResolution:", GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1EDF4E148));
  -[GEORecentLocationHistory setBaseDistanceToDestination:](v7, "setBaseDistanceToDestination:", self->_baseDistance);
  v14 = LODWORD(self->_locations.__size_.__value_);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_3;
  v17[3] = &unk_1E1C15D10;
  v17[4] = self;
  -[GEOProbeCrumbs _encodedDataForIntegersCount:valueCallback:](self, "_encodedDataForIntegersCount:valueCallback:", v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORecentLocationHistory setEncodedDistancesToDestination:](v7, "setEncodedDistancesToDestination:", v15);

  return v7;
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
                                     + 8 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 8);
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
                                     + 8 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 12);
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
                                     + 8 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 16);
}

- (id)_encodedDataForIntegersCount:(unsigned int)a3 valueCallback:(id)a4
{
  unsigned int (**v5)(id, _QWORD);
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  int v17;
  int32x4_t v18;
  double v19;
  int v20;
  google::protobuf::internal::ArenaImpl *v21;
  _QWORD *v22;
  double v23;
  double v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  _QWORD *v36;
  std::string *v37;
  std::string::size_type size;
  unsigned int v40;
  unsigned int v41;
  std::string v42;
  char v43[8];
  uint64_t v44;
  int v45;
  unsigned int v46[2];
  uint64_t v47;
  unint64_t v48;
  unsigned int v49;
  int v50;

  v5 = (unsigned int (**)(id, _QWORD))a4;
  if (a3 >= 2)
  {
    maps::path_codec::geo3::RiceEncodedIntegers::RiceEncodedIntegers((maps::path_codec::geo3::RiceEncodedIntegers *)v43, 0);
    v49 = 0;
    v45 &= ~2u;
    if ((uint64_t *)v48 != &google::protobuf::internal::fixed_address_empty_string)
    {
      v7 = v48 & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)((v48 & 0xFFFFFFFFFFFFFFFELL) + 23) < 0)
      {
        **(_BYTE **)v7 = 0;
        *(_QWORD *)(v7 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v7 = 0;
        *(_BYTE *)(v7 + 23) = 0;
      }
    }
    v45 &= ~1u;
    v46[0] = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v41 = a3 - 1;
    v11 = v5[2](v5, 0) >> 31;
    v12 = 1;
    v13 = a3;
    do
    {
      v14 = v5[2](v5, v12);
      v15 = v12 - 1;
      v16 = v14 - ((uint64_t (*)(id, uint64_t))v5[2])(v5, v12 - 1);
      if (v16 >= 0)
        v17 = v16;
      else
        v17 = -v16;
      if ((v11 & 1) != v16 >> 31)
      {
        v11 = v16 >> 31;
        v18 = (int32x4_t)vandq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vdupq_n_s32((int)v12 - v10), (uint32x4_t)xmmword_189CE1940), (int8x16_t)xmmword_189CE1950);
        v18.i32[0] = vaddvq_s32(v18) & 0xF;
        *(int8x8_t *)v18.i8 = vcnt_s8(*(int8x8_t *)v18.i8);
        v18.i16[0] = vaddlv_u8(*(uint8x8_t *)v18.i8);
        v9 += v18.i32[0] + 1;
        v10 = v12;
      }
      v8 += v17;
      ++v12;
    }
    while (v15 + 2 != v13);
    v19 = log2(fmax((double)v8 / (double)v41 * 0.69, 2.0));
    v40 = 8 * v9;
    if (8 * v9 > v41)
      v20 = 1;
    else
      v20 = 2;
    v45 |= 4u;
    v50 = v20;
    v49 = v5[2](v5, 0);
    v45 |= 3u;
    v21 = (google::protobuf::internal::ArenaImpl *)(v44 & 0xFFFFFFFFFFFFFFFELL);
    if ((v44 & 1) != 0)
      v21 = *(google::protobuf::internal::ArenaImpl **)v21;
    v22 = (_QWORD *)v48;
    if ((uint64_t *)v48 == &google::protobuf::internal::fixed_address_empty_string)
      v22 = google::protobuf::internal::ArenaStringPtr::MutableSlow<>(&v48, v21);
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = (unint64_t)v22;
    v23 = ceil(v19) + 2.0;
    v24 = 0.0;
    if (v40 > v41)
      v24 = 1.0;
    maps::path_codec::BitStream::reserve((std::string **)&v42, (unint64_t)((v23 + v24) * (double)v41 * 0.125));
    v25 = vcvtad_u64_f64(v19);
    maps::path_codec::BitStream::write((maps::path_codec::BitStream *)&v42, 5u, v25);
    v26 = 0;
    v27 = v49 >> 31;
    v28 = 1;
    do
    {
      v29 = v5[2](v5, v28);
      v30 = v28 - 1;
      v31 = v29 - ((uint64_t (*)(id, uint64_t))v5[2])(v5, v28 - 1);
      if (v40 <= v41)
      {
        if ((v27 & 1) != v31 >> 31)
        {
          v32 = v28 - v26;
          v33 = v46[0];
          if (v46[0] == v46[1])
          {
            v34 = v46[0] + 1;
            google::protobuf::RepeatedField<int>::Reserve(v46, v46[0] + 1);
            *(_DWORD *)(v47 + 4 * v33) = v32;
          }
          else
          {
            *(_DWORD *)(v47 + 4 * v46[0]) = v32;
            v34 = v33 + 1;
          }
          v46[0] = v34;
          LOBYTE(v27) = v27 ^ 1;
          v26 = v28;
        }
      }
      else
      {
        maps::path_codec::BitStream::write((maps::path_codec::BitStream *)&v42, 1u, v31 >> 31);
      }
      if (v31 >= 0)
        v35 = v31;
      else
        v35 = -v31;
      maps::path_codec::BitStream::write_rice((maps::path_codec::BitStream *)&v42, v25, v35);
      ++v28;
    }
    while (v30 + 2 != v13);
    v36 = (_QWORD *)v42.__r_.__value_.__r.__words[0];
    std::string::resize((std::string *)v42.__r_.__value_.__l.__data_, (LODWORD(v42.__r_.__value_.__r.__words[1]) + 7) >> 3, 0);
    std::string::shrink_to_fit[abi:ne180100](v36);
    memset(&v42, 0, sizeof(v42));
    google::protobuf::MessageLite::AppendPartialToString((uint64_t)v43, &v42);
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v37 = &v42;
    else
      v37 = (std::string *)v42.__r_.__value_.__r.__words[0];
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
    else
      size = v42.__r_.__value_.__l.__size_;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37, size, &v48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    maps::path_codec::geo3::RiceEncodedIntegers::~RiceEncodedIntegers((maps::path_codec::geo3::RiceEncodedIntegers *)v43);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  _GEOProbeCrumbsLocation **begin;
  _GEOProbeCrumbsLocation **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _GEOProbeCrumbsLocation **v9;
  _GEOProbeCrumbsLocation **v10;
  _GEOProbeCrumbsLocation **first;

  begin = self->_locations.__map_.__begin_;
  end = self->_locations.__map_.__end_;
  self->_locations.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_locations.__map_.__end_;
      begin = self->_locations.__map_.__begin_ + 1;
      self->_locations.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 85;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 170;
LABEL_7:
    self->_locations.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_locations.__map_.__begin_;
    v9 = self->_locations.__map_.__end_;
    if (v9 != v10)
      self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v9
                                                                  + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_locations.__map_.__first_;
  if (first)
    operator delete(first);
  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end
