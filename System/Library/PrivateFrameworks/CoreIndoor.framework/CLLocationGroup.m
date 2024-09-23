@implementation CLLocationGroup

- (void).cxx_destruct
{
  void **begin;
  void **end;
  void *v5;
  void **value;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;

  sub_216463914((uint64_t)&self->_wifiOnlyDownloadLocIdxs, (_QWORD *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_);
  begin = (void **)self->_locationIds.__begin_;
  if (begin)
  {
    end = (void **)self->_locationIds.__end_;
    v5 = self->_locationIds.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0)
          operator delete(*(end - 3));
        end -= 3;
      }
      while (end != begin);
      v5 = self->_locationIds.__begin_;
    }
    self->_locationIds.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_centerLatLon, 0);
  objc_storeStrong((id *)&self->_centerECEF, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  value = (void **)self->vertices.__ptr_.__value_;
  self->vertices.__ptr_.__value_ = 0;
  if (value)
  {
    v7 = (char *)value[3];
    if (v7)
    {
      v8 = (char *)value[4];
      v9 = value[3];
      if (v8 != v7)
      {
        v10 = (char *)value[4];
        do
        {
          v12 = (void *)*((_QWORD *)v10 - 3);
          v10 -= 24;
          v11 = v12;
          if (v12)
          {
            *((_QWORD *)v8 - 2) = v11;
            operator delete(v11);
          }
          v8 = v10;
        }
        while (v10 != v7);
        v9 = value[3];
      }
      value[4] = v7;
      operator delete(v9);
    }
    v13 = *value;
    if (*value)
    {
      value[1] = v13;
      operator delete(v13);
    }
    JUMPOUT(0x2199F8F9CLL);
  }
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSString)groupId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (void)storeAverage:(id)a3 ofVertices:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);
  if (v11)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v12 = v6;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v12);
          v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend_x(v24, v14, v15, v16, v17, (_QWORD)v42);
          v26 = v25;
          objc_msgSend_y(v24, v27, v28, v29, v30);
          v32 = v31;
          objc_msgSend_z(v24, v33, v34, v35, v36);
          v20 = v20 + v26;
          v21 = v21 + v32;
          v22 = v22 + v37;
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v18);
    }
    else
    {
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
    }

    objc_msgSend_setFromX_y_z_(v5, v38, v39, v40, v41, v20 / (double)(unint64_t)v11, v21 / (double)(unint64_t)v11, v22 / (double)(unint64_t)v11);
  }

}

- (GeographicCoordinate)centerLatLon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 32, 1);
}

- (ECEFCoordinate)centerECEF
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (double)distance:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  _QWORD *value;
  double v19;
  _QWORD *v21;
  _QWORD *v22;
  double v23[2];
  int8x16_t v24;
  uint64_t v25;
  void (**v26)(std::exception *__hidden);

  v4 = a3;
  objc_msgSend_fromLatLonOrigin_andEcefOrigin_andEcefPoint_(ENUCoordinate, v5, (uint64_t)self->_centerLatLon, (uint64_t)self->_centerECEF, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_east(v6, v7, v8, v9, v10);
  v12 = v11;
  objc_msgSend_north(v6, v13, v14, v15, v16);
  v23[0] = v12;
  v23[1] = v17;
  value = self->vertices.__ptr_.__value_;
  if (*value == value[1])
  {
    v21 = (_QWORD *)value[3];
    v22 = (_QWORD *)value[4];
    if (v21 == v22)
    {
LABEL_6:
      v26 = &off_24D570250;
      v24.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/ae269ea5-5122-11ef-a621-12147c76fa9d/Applications/Xcode.ap"
                            "p/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/us"
                            "r/local/include/boost/geometry/algorithms/detail/throw_on_empty_input.hpp";
      v24.i64[1] = (uint64_t)"void boost::geometry::detail::throw_on_empty_input(const Geometry &) [Geometry = boost::geom"
                            "etry::model::polygon<boost::geometry::model::d2::point_xy<double>>]";
      v25 = 54;
      sub_2164A3CA8((uint64_t)&v26, &v24);
    }
    while (*v21 == v21[1])
    {
      v21 += 3;
      if (v21 == v22)
        goto LABEL_6;
    }
  }
  v19 = sub_2164653C8(v23, (uint64_t)value);

  return v19;
}

- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8
{
  id v15;
  id v16;
  id v17;
  CLLocationGroup *v18;
  CLLocationGroup *v19;
  CLLocationGroup *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void **p_begin;
  void **begin;
  void **end;
  void *v27;
  ECEFCoordinate *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  ECEFCoordinate *centerECEF;
  GeographicCoordinate *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  GeographicCoordinate *centerLatLon;
  _OWORD *v58;
  void **value;
  char *v60;
  char *v61;
  void *v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v68;
  void *v69;
  objc_super v70;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v70.receiver = self;
  v70.super_class = (Class)CLLocationGroup;
  v18 = -[CLLocationGroup init](&v70, sel_init);
  v19 = v18;
  v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupId, a3);
    objc_msgSend_stringVectorFromNSArray_(CLLocationGroup, v21, (uint64_t)v16, v22, v23);
    p_begin = &v20->_locationIds.__begin_;
    begin = (void **)v20->_locationIds.__begin_;
    if (begin)
    {
      end = (void **)v20->_locationIds.__end_;
      v27 = v20->_locationIds.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0)
            operator delete(*(end - 3));
          end -= 3;
        }
        while (end != begin);
        v27 = *p_begin;
      }
      v20->_locationIds.__end_ = begin;
      operator delete(v27);
      *p_begin = 0;
      v20->_locationIds.__end_ = 0;
      v20->_locationIds.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v20->_locationIds.__begin_ = v68;
    v20->_locationIds.__end_cap_.__value_ = v69;
    v28 = [ECEFCoordinate alloc];
    objc_msgSend_x(v17, v29, v30, v31, v32);
    v34 = v33;
    objc_msgSend_y(v17, v35, v36, v37, v38);
    v40 = v39;
    objc_msgSend_z(v17, v41, v42, v43, v44);
    v50 = objc_msgSend_initWithX_y_z_(v28, v45, v46, v47, v48, v34, v40, v49);
    centerECEF = v20->_centerECEF;
    v20->_centerECEF = (ECEFCoordinate *)v50;

    v52 = [GeographicCoordinate alloc];
    v56 = objc_msgSend_initFromECEFCoordinate_(v52, v53, (uint64_t)v20->_centerECEF, v54, v55);
    centerLatLon = v20->_centerLatLon;
    v20->_centerLatLon = (GeographicCoordinate *)v56;

    v20->_tolerance = a8;
    if (&v19->_wifiOnlyDownloadLocIdxs != a6)
      sub_216466694((uint64_t **)&v19->_wifiOnlyDownloadLocIdxs, *(_QWORD **)a6, (_QWORD *)a6 + 1);
    v20->_locationContext = a7;
    v58 = (_OWORD *)operator new();
    v58[1] = 0u;
    v58[2] = 0u;
    *v58 = 0u;
    value = (void **)v20->vertices.__ptr_.__value_;
    v20->vertices.__ptr_.__value_ = v58;
    if (value)
    {
      v60 = (char *)value[3];
      if (v60)
      {
        v61 = (char *)value[4];
        v62 = value[3];
        if (v61 != v60)
        {
          v63 = (char *)value[4];
          do
          {
            v65 = (void *)*((_QWORD *)v63 - 3);
            v63 -= 24;
            v64 = v65;
            if (v65)
            {
              *((_QWORD *)v61 - 2) = v64;
              operator delete(v64);
            }
            v61 = v63;
          }
          while (v63 != v60);
          v62 = value[3];
        }
        value[4] = v60;
        operator delete(v62);
      }
      v66 = *value;
      if (*value)
      {
        value[1] = v66;
        operator delete(v66);
      }
      MEMORY[0x2199F8F9C](value, 0x20C40A759441BLL);
    }
  }

  return v20;
}

+ (vector<std::string,)stringVectorFromNSArray:(id)a2
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  _QWORD *end;
  size_t v26;
  size_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  vector<std::string, std::allocator<std::string>> *result;
  id v34;
  id v35;
  uint64_t v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v34 = v5;
  v10 = objc_msgSend_count(v5, v6, v7, v8, v9);
  sub_216466560((char **)retstr, v10);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v34;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v39;
    v35 = v11;
    do
    {
      v15 = 0;
      v36 = v13;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x2199F91F4]();
        v18 = objc_retainAutorelease(v16);
        v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
        v24 = v23;
        v37 = v23;
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v29 = sub_2164A4DC0(&retstr->__begin_, &v37);
          goto LABEL_17;
        }
        v26 = strlen(v23);
        if (v26 >= 0x7FFFFFFFFFFFFFF8)
          sub_21646B134();
        v27 = v26;
        if (v26 >= 0x17)
        {
          v30 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v26 | 7) != 0x17)
            v30 = v26 | 7;
          v31 = v30 + 1;
          v28 = operator new(v30 + 1);
          end[1] = v27;
          end[2] = v31 | 0x8000000000000000;
          *end = v28;
          v11 = v35;
        }
        else
        {
          *((_BYTE *)end + 23) = v26;
          v28 = end;
          if (!v26)
            goto LABEL_16;
        }
        memmove(v28, v24, v27);
LABEL_16:
        *((_BYTE *)v28 + v27) = 0;
        v29 = (char *)(end + 3);
        retstr->__end_ = end + 3;
        v13 = v36;
LABEL_17:
        retstr->__end_ = v29;
        objc_autoreleasePoolPop(v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v32, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v13);
  }

  return result;
}

- (const)getVertices
{
  return &self->vertices;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  return self;
}

- (const)getLocationIds
{
  return &self->_locationIds;
}

- (basic_string<char,)getGroupId
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v12;

  v7 = (const char *)objc_msgSend_UTF8String(*(void **)(v1 + 16), v2, v3, v4, v5);
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)strlen(v7);
  if ((unint64_t)result >= 0x7FFFFFFFFFFFFFF8)
    sub_21646B134();
  v9 = (unint64_t)result;
  if ((unint64_t)result >= 0x17)
  {
    v10 = ((unint64_t)result & 0xFFFFFFFFFFFFFFF8) + 8;
    if (((unint64_t)result | 7) != 0x17)
      v10 = (unint64_t)result | 7;
    v11 = v10 + 1;
    v12 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v10 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v9;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = v11 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v12;
    retstr = v12;
  }
  else
  {
    *((_BYTE *)&retstr->__r_.__value_.var0.var1 + 23) = (_BYTE)result;
    if (!result)
    {
      retstr->__r_.__value_.var0.var0.__data_[0] = 0;
      return result;
    }
  }
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)memmove(retstr, v7, v9);
  retstr->__r_.__value_.var0.var0.__data_[v9] = 0;
  return result;
}

- (CLLocationGroup)init
{
  id v3;
  ECEFCoordinate *v4;
  const char *v5;
  CLLocationGroup *v6;
  _QWORD **v8;
  _QWORD *v9[2];

  v3 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v4 = objc_alloc_init(ECEFCoordinate);
  v9[0] = 0;
  v9[1] = 0;
  v8 = v9;
  v6 = (CLLocationGroup *)objc_msgSend_initWithGroupId_locationIds_center_wifiOnlyDownloadLocIdxs_locationContext_andTolerance_(self, v5, (uint64_t)&stru_24D571BA0, (uint64_t)v3, (uint64_t)v4, &v8, 0, 0.0);
  sub_216463914((uint64_t)&v8, v9[0]);

  return v6;
}

- (BOOL)allowCellularDownload:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_;
  v4 = left;
  if (!left)
    goto LABEL_12;
  v6 = p_pair1;
  do
  {
    v7 = (unint64_t)v4[4].__value_.__left_;
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&v4[1];
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > (void *)a3)
LABEL_12:
    v6 = p_pair1;
  return v6 == p_pair1;
}

- (vector<std::string,)locationIds
{
  vector<std::string, std::allocator<std::string>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_locationIds, (void (__cdecl *)(void *, const void *))sub_2164A3BD4);
  return result;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (set<unsigned)wifiOnlyDownloadLocIdxs
{
  set<unsigned long, std::less<unsigned long>, std::allocator<unsigned long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_wifiOnlyDownloadLocIdxs, (void (__cdecl *)(void *, const void *))sub_2164A3C18);
  return result;
}

- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long
{
  objc_copyCppObjectAtomic(&self->_wifiOnlyDownloadLocIdxs, a3, (void (__cdecl *)(void *, const void *))sub_2164A3C7C);
}

@end
