@implementation _GEOCoordinatePath

- (uint64_t)calibratePointLengths:(unint64_t)a3 startIndex:(unint64_t)a4 endIndex:(double)a5 rangeLength:
{
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;

  if (result)
  {
    v5 = *(double *)(a2 + 8 * a4) - *(double *)(a2 + 8 * a3);
    v6 = 0.0;
    v7 = v5 <= 0.0 || a5 <= 0.0;
    v8 = a5 / v5;
    if (v7)
      v8 = 1.0;
    if (a3 <= a4)
    {
      v9 = (double *)(a2 + 8 * a3);
      v10 = a3;
      do
      {
        v11 = v6;
        if (v10 < a4)
          v6 = v9[1] - *v9;
        if (v10 > a3)
        {
          v12 = v8 * v11 + *(v9 - 1);
          *v9 = v12;
          if (a4 == v10)
          {
            v13 = *(double *)(a2 + 8 * a3) + a5;
            if (vabdd_f64(v12, v13) < 0.000001)
              *v9 = v13;
          }
        }
        ++v10;
        ++v9;
      }
      while (v10 <= a4);
    }
  }
  return result;
}

- (void)setBasicCoordinates:(_QWORD *)a1
{
  char *v4;
  uint8_t v5[16];

  if (a1)
  {
    if (a1[4] == a1[5])
    {
      v4 = (char *)(a1 + 1);
      if (a1 + 1 != (_QWORD *)a2)
        std::vector<GEOLocationCoordinate3D>::__assign_with_size[abi:ne180100]<GEOLocationCoordinate3D*,GEOLocationCoordinate3D*>(v4, *(char **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
      a1[7] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _zilchPoints.empty()", v5, 2u);
    }
  }
}

- (double)coordinateAt:(_QWORD *)a1
{
  uint64_t v2;
  uint64_t v3;
  zilch::ControlPoint *v4;
  zilch::GeoCoordinates *v5;
  zilch::GeoCoordinates *v6;
  zilch::GeoCoordinates *v7;
  double v8;
  double v9;
  zilch::GeoCoordinates *v10;
  double v11;
  uint64_t v12;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  int v18;
  int v19;
  __int16 v20;

  if (!a1)
    return 0.0;
  v2 = a1[4];
  v3 = a1[5];
  if (v2 == v3)
  {
    v12 = a1[1];
    if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v12) >> 3) > a2)
      return *(double *)(v12 + 24 * a2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v17 = 0;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Assertion failed: index < _basicCoordinates.size()";
      v16 = (uint8_t *)&v17;
      goto LABEL_15;
    }
    return -180.0;
  }
  if (a2 >= (v3 - v2) >> 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v20 = 0;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Assertion failed: index < _zilchPoints.size()";
      v16 = (uint8_t *)&v20;
LABEL_15:
      _os_log_fault_impl(&dword_1885A9000, v14, OS_LOG_TYPE_FAULT, v15, v16, 2u);
      return -180.0;
    }
    return -180.0;
  }
  v4 = (zilch::ControlPoint *)(v2 + 32 * a2);
  v5 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  if (zilch::GeoCoordinates::has_elevation(v5))
  {
    v6 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
    zilch::GeoCoordinates::z(v6);
  }
  v7 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  v19 = zilch::GeoCoordinates::y(v7);
  v9 = zilch::Latitude::toDegrees((zilch::Latitude *)&v19, v8);
  v10 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  v18 = zilch::GeoCoordinates::x(v10);
  zilch::Longitude::toDegrees((zilch::Longitude *)&v18, v11);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOCoordinatePath)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_GEOCoordinatePath;
  v5 = -[_GEOCoordinatePath init](&v20, sel_init);
  if (v5)
  {
    v19 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (char *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_basicCoordinates"), &v19);
    std::vector<GEOLocationCoordinate3D>::__assign_with_size[abi:ne180100]<GEOLocationCoordinate3D*,GEOLocationCoordinate3D*>((char *)v5 + 8, v7, (uint64_t)&v7[24 * (v19 / 0x18uLL)], v19 / 0x18uLL);
    v8 = *((_QWORD *)v5 + 1);
    v9 = *((_QWORD *)v5 + 2);
    if (v8 == v9)
    {
      v19 = 0;
      v11 = (char *)objc_msgSend(objc_retainAutorelease(v6), "decodeBytesForKey:returnedLength:", CFSTR("_zilchPoints"), &v19);
      std::vector<zilch::ControlPoint>::__assign_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>((char *)v5 + 32, v11, (uint64_t)&v11[v19 & 0xFFFFFFFFFFFFFFE0], v19 >> 5);
      v10 = (uint64_t)(*((_QWORD *)v5 + 5) - *((_QWORD *)v5 + 4)) >> 5;
    }
    else
    {
      v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3);
    }
    *((_QWORD *)v5 + 7) = v10;
    objc_msgSend(v6, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_supportPoints"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v12;

    v19 = 0;
    v14 = objc_retainAutorelease(v6);
    v15 = (char *)objc_msgSend(v14, "decodeBytesForKey:returnedLength:", CFSTR("_pointLengths"), &v19);
    std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>((char *)v5 + 72, v15, (uint64_t)&v15[v19 & 0xFFFFFFFFFFFFFFF8], v19 >> 3);
    *((_QWORD *)v5 + 12) = objc_msgSend(v14, "decodeIntegerForKey:", CFSTR("_pathStartIndex"));
    objc_msgSend(v14, "decodeDoubleForKey:", CFSTR("_pathStartOffset"));
    *((_QWORD *)v5 + 13) = v16;
    v17 = v5;
  }

  return (_GEOCoordinatePath *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_basicCoordinates.__begin_, self->_basicCoordinates.__end_ - self->_basicCoordinates.__begin_, CFSTR("_basicCoordinates"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_zilchPoints.__begin_, (char *)self->_zilchPoints.__end_ - (char *)self->_zilchPoints.__begin_, CFSTR("_zilchPoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportPoints, CFSTR("_supportPoints"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_pointLengths.__begin_, (char *)self->_pointLengths.__end_ - (char *)self->_pointLengths.__begin_, CFSTR("_pointLengths"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pathStartIndex, CFSTR("_pathStartIndex"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_pathStartOffset"), self->_pathStartOffset);

}

- (void).cxx_destruct
{
  double *begin;
  ControlPoint *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  begin = self->_pointLengths.__begin_;
  if (begin)
  {
    self->_pointLengths.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_supportPoints, 0);
  v4 = self->_zilchPoints.__begin_;
  if (v4)
  {
    self->_zilchPoints.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_basicCoordinates.__begin_;
  if (v5)
  {
    self->_basicCoordinates.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
