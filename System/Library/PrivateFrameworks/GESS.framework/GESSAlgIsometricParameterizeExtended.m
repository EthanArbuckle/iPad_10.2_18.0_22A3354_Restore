@implementation GESSAlgIsometricParameterizeExtended

- (BOOL)setFaceIntensity:(float *)a3 size:(unint64_t)a4
{
  NSData *v5;
  NSData *faceIntensityData;

  v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  faceIntensityData = self->_faceIntensityData;
  self->_faceIntensityData = v5;

  return 1;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)run:(id)a3
{
  id v4;
  uint64_t v5;
  GESSAlgIsometricParameterizeOptions *options;
  GESSAlgIsometricParameterizeOptions *v7;
  GESSAlgIsometricParameterizeOptions *v8;
  int v9;
  int v10;
  int v11;
  NSData *faceIntensityData;
  uint64_t v13;
  int v14;
  __int128 v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  void *__p[2];
  char v29;
  int v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  unsigned int v34;
  BOOL v35;
  unsigned int v36;
  char v37;
  int v38;
  int v39;
  BOOL v40;
  __int16 v41;
  int v42;
  _QWORD v43[3];
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 1);
  if ((objc_msgSend(v4, "valid") & 1) == 0 || objc_msgSend(v4, "meshType") != 1)
  {
    LOBYTE(v20) = 0;
    goto LABEL_35;
  }
  v5 = objc_msgSend(v4, "meshImpl");
  options = self->_options;
  if (!options)
  {
    v7 = objc_alloc_init(GESSAlgIsometricParameterizeOptions);
    v8 = self->_options;
    self->_options = v7;

    options = self->_options;
  }
  v31 = 10;
  v32 = 1036831949;
  v33 = 0;
  v34 = 100000;
  v35 = 0;
  v41 = 256;
  if (-[GESSAlgParameterizeOptions packingMethod](options, "packingMethod") == 1)
    v9 = 2;
  else
    v9 = 1;
  v38 = v9;
  v39 = 2 * (-[GESSAlgParameterizeOptions overlapCheckMode](self->_options, "overlapCheckMode") == 1);
  v40 = -[GESSAlgParameterizeOptions enableUVUtilizationOptimization](self->_options, "enableUVUtilizationOptimization");
  v36 = -[GESSAlgParameterizeOptions textureResolution](self->_options, "textureResolution");
  v37 = -[GESSAlgParameterizeOptions numOfTextures](self->_options, "numOfTextures");
  -[GESSAlgParameterizeOptions gutter](self->_options, "gutter");
  v42 = v10;
  v31 = -[GESSAlgIsometricParameterizeOptions targetNumOfCharts](self->_options, "targetNumOfCharts");
  -[GESSAlgIsometricParameterizeOptions maximumStretchRatio](self->_options, "maximumStretchRatio");
  v32 = v11;
  HIBYTE(v41) = -[GESSAlgIsometricParameterizeOptions enableParallel](self->_options, "enableParallel");
  v33 = -[GESSAlgIsometricParameterizeOptions skipInitialStretchOptimization](self->_options, "skipInitialStretchOptimization");
  v34 = -[GESSAlgIsometricParameterizeOptions optimizeBoundaryIfFaceNumberLessThan](self->_options, "optimizeBoundaryIfFaceNumberLessThan");
  v35 = -[GESSAlgIsometricParameterizeOptions repairUVSelfIntersection](self->_options, "repairUVSelfIntersection");
  faceIntensityData = self->_faceIntensityData;
  if (faceIntensityData)
  {
    v13 = -[NSData bytes](faceIntensityData, "bytes");
    v30 = -1;
    std::string::basic_string[abi:ne180100]<0>(__p, "f:imt");
    v43[0] = 0;
    v43[1] = 0;
    v14 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>((uint64_t **)(v5 + 56), (uint64_t)v43, (unsigned __int8 *)__p);
    v30 = v14;
    if (v29 < 0)
      operator delete(__p[0]);
    if (v14 == -1)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "f:imt");
      cv3d::cv::gess::mesh::MeshProperty::AddAttribute<cv3d::cv::gess::math::Vector3T<float>>(v5, &v30, (__int128 *)__p);
      if (v29 < 0)
        operator delete(__p[0]);
    }
    if (*(_QWORD *)(v5 + 112) != *(_QWORD *)(v5 + 104))
    {
      v16 = 0;
      v17 = 1;
      do
      {
        LODWORD(v15) = *(_DWORD *)(v13 + 4 * v16);
        v27 = v15;
        LODWORD(__p[0]) = v30;
        v18 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)(v5 + 56), (unsigned int *)__p);
        v19 = *(_QWORD *)(v18 + 40);
        if (v16 >= (*(_QWORD *)(v18 + 48) - v19) >> 4)
          __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
        *(_QWORD *)&v15 = v27;
        *((_QWORD *)&v15 + 1) = v27;
        *(_OWORD *)(v19 + 16 * v16) = v15;
        v16 = v17++;
      }
      while (v16 < (uint64_t)(*(_QWORD *)(v5 + 112) - *(_QWORD *)(v5 + 104)) >> 2);
    }
    LOBYTE(v41) = 1;
  }
  else
  {
    LOBYTE(v41) = 0;
  }
  self->_report.needs_report = 1;
  v47 = 0;
  v45 = 0;
  v20 = cv3d::cv::gess::alg::IsoChartParameterize(v5, (uint64_t)&v31, (uint64_t)&self->_report, (uint64_t)v46, (uint64_t)v44);
  v21 = v45;
  if (v45 == v44)
  {
    v22 = 4;
    v21 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_26;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_26:
  v23 = v47;
  if (v47 == v46)
  {
    v24 = 4;
    v23 = v46;
    goto LABEL_30;
  }
  if (v47)
  {
    v24 = 5;
LABEL_30:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }
  if (v20)
    v25 = 3;
  else
    v25 = 2;
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", v25, v27);
LABEL_35:

  return v20;
}

- (id)returnReport
{
  GESSAlgIsometricParameterizeReport *v3;
  ParameterizeReport *p_report;
  double v5;
  double v6;
  double v7;
  unsigned int param_status;
  uint64_t v9;

  v3 = objc_alloc_init(GESSAlgIsometricParameterizeReport);
  if (-[GESSAlgBase algStatus](self, "algStatus") && -[GESSAlgBase algStatus](self, "algStatus") != 1)
  {
    -[GESSAlgReport setSuccess:](v3, "setSuccess:", -[GESSAlgBase algStatus](self, "algStatus") == 3);
    p_report = &self->_report;
    -[GESSAlgIsometricParameterizeReport setChartingTime:](v3, "setChartingTime:", p_report->chart_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setInitialParameterizationTime:](v3, "setInitialParameterizationTime:", p_report->initial_param_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setSplitParameterizationTime:](v3, "setSplitParameterizationTime:", p_report->split_param_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setChartMergingTime:](v3, "setChartMergingTime:", p_report->chart_merge_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setFixSelfIntersectionTime:](v3, "setFixSelfIntersectionTime:", p_report->fix_self_intersect_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setPackingTime:](v3, "setPackingTime:", p_report->pack_time.__rep_);
    -[GESSAlgIsometricParameterizeReport setNumOfCharts:](v3, "setNumOfCharts:", LODWORD(p_report->chart_number));
    -[GESSAlgIsometricParameterizeReport setNumOfPackedTextures:](v3, "setNumOfPackedTextures:", LODWORD(p_report->pack_img_number));
    *(float *)&v5 = p_report->max_stretch_ratio;
    -[GESSAlgIsometricParameterizeReport setMaximumStretchRatio:](v3, "setMaximumStretchRatio:", v5);
    *(float *)&v6 = p_report->avg_stretch_ratio;
    -[GESSAlgIsometricParameterizeReport setAverageStretchRatio:](v3, "setAverageStretchRatio:", v6);
    *(float *)&v7 = p_report->self_intersect_ratio;
    -[GESSAlgIsometricParameterizeReport setSelfIntersectionRatio:](v3, "setSelfIntersectionRatio:", v7);
    param_status = p_report->param_status;
    if (param_status >= 4)
      v9 = 4;
    else
      v9 = param_status;
    -[GESSAlgIsometricParameterizeReport setParameterizeStatus:](v3, "setParameterizeStatus:", v9);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIntensityData, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 108) = 0u;
  *((_DWORD *)self + 31) = 3;
  *((_BYTE *)self + 128) = 1;
  return self;
}

@end
