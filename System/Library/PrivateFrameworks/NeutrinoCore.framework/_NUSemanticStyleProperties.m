@implementation _NUSemanticStyleProperties

- (NSString)description
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  unsigned int v37;
  char v38;
  uint64_t v39;
  char v40;

  v33 = (void *)MEMORY[0x1E0CB3940];
  v32 = objc_opt_class();
  -[_NUSemanticStyleProperties version](self, "version");
  v3 = objc_claimAutoreleasedReturnValue();
  v31 = -[_NUSemanticStyleProperties isVideo](self, "isVideo");
  -[_NUSemanticStyleProperties keyTime](self, "keyTime");
  if ((v40 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[_NUSemanticStyleProperties keyTime](self, "keyTime");
    objc_msgSend(v5, "numberWithLongLong:", v39);
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("-");
  }
  -[_NUSemanticStyleProperties keyTime](self, "keyTime");
  v34 = (void *)v3;
  v36 = (__CFString *)v4;
  if ((v38 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_NUSemanticStyleProperties keyTime](self, "keyTime");
    objc_msgSend(v6, "numberWithInt:", v37);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = CFSTR("-");
  }
  -[_NUSemanticStyleProperties styleData](self, "styleData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v30, "length");
  v26 = -[_NUSemanticStyleProperties styleDataIsFloat16](self, "styleDataIsFloat16");
  -[_NUSemanticStyleProperties globalToneCurveData](self, "globalToneCurveData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v29, "length");
  -[_NUSemanticStyleProperties baselineExposure](self, "baselineExposure");
  v8 = v7;
  -[_NUSemanticStyleProperties sceneType](self, "sceneType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties subjectRelightingValue](self, "subjectRelightingValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties baseGain](self, "baseGain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties stats](self, "stats");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v28, "count");
  -[_NUSemanticStyleProperties lightMapData](self, "lightMapData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v25, "length");
  -[_NUSemanticStyleProperties linearLightMapData](self, "linearLightMapData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v23, "length");
  -[_NUSemanticStyleProperties lightMapWidth](self, "lightMapWidth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties lightMapHeight](self, "lightMapHeight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties linearGain](self, "linearGain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties linearRangeMin](self, "linearRangeMin");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties linearRangeMax](self, "linearRangeMax");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties faceBasedGlobalExposureBoostRatio](self, "faceBasedGlobalExposureBoostRatio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@:%p version=%@ video=%d key=%@/%@ data:%luB float16:%d GTC:%luB exp:%g scn=%@ srl=%@ gain=%@ stats:%luB lightMap:%luB/%luB(%@x%@) lin:(x%@,%@:%@) fb=%@>"), v32, self, v34, v31, v36, v35, v27, v26, v24, v8, v22, v21, v19, v20, v9, v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v38 & 1) != 0)
  if ((v40 & 1) != 0)

  return (NSString *)v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NUSemanticStyleProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = +[_NUSemanticStyleProperties allocWithZone:](_NUSemanticStyleProperties, "allocWithZone:", a3);
  -[_NUSemanticStyleProperties version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setVersion:](v4, "setVersion:", v5);

  -[_NUSemanticStyleProperties styleData](self, "styleData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setStyleData:](v4, "setStyleData:", v6);

  -[_NUSemanticStyleProperties setStyleDataIsFloat16:](v4, "setStyleDataIsFloat16:", -[_NUSemanticStyleProperties styleDataIsFloat16](self, "styleDataIsFloat16"));
  -[_NUSemanticStyleProperties setIsVideo:](v4, "setIsVideo:", -[_NUSemanticStyleProperties isVideo](self, "isVideo"));
  -[_NUSemanticStyleProperties keyTime](self, "keyTime");
  v21 = v23;
  v22 = v24;
  -[_NUSemanticStyleProperties setKeyTime:](v4, "setKeyTime:", &v21);
  -[_NUSemanticStyleProperties globalToneCurveData](self, "globalToneCurveData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setGlobalToneCurveData:](v4, "setGlobalToneCurveData:", v7);

  -[_NUSemanticStyleProperties baselineExposure](self, "baselineExposure");
  -[_NUSemanticStyleProperties setBaselineExposure:](v4, "setBaselineExposure:");
  -[_NUSemanticStyleProperties sceneType](self, "sceneType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setSceneType:](v4, "setSceneType:", v8);

  -[_NUSemanticStyleProperties subjectRelightingValue](self, "subjectRelightingValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setSubjectRelightingValue:](v4, "setSubjectRelightingValue:", v9);

  -[_NUSemanticStyleProperties stats](self, "stats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setStats:](v4, "setStats:", v10);

  -[_NUSemanticStyleProperties lightMapData](self, "lightMapData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLightMapData:](v4, "setLightMapData:", v11);

  -[_NUSemanticStyleProperties linearLightMapData](self, "linearLightMapData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLinearLightMapData:](v4, "setLinearLightMapData:", v12);

  -[_NUSemanticStyleProperties lightMapWidth](self, "lightMapWidth");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLightMapWidth:](v4, "setLightMapWidth:", v13);

  -[_NUSemanticStyleProperties lightMapHeight](self, "lightMapHeight");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLightMapHeight:](v4, "setLightMapHeight:", v14);

  -[_NUSemanticStyleProperties baseGain](self, "baseGain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setBaseGain:](v4, "setBaseGain:", v15);

  -[_NUSemanticStyleProperties linearGain](self, "linearGain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLinearGain:](v4, "setLinearGain:", v16);

  -[_NUSemanticStyleProperties linearRangeMin](self, "linearRangeMin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLinearRangeMin:](v4, "setLinearRangeMin:", v17);

  -[_NUSemanticStyleProperties linearRangeMax](self, "linearRangeMax");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setLinearRangeMax:](v4, "setLinearRangeMax:", v18);

  -[_NUSemanticStyleProperties faceBasedGlobalExposureBoostRatio](self, "faceBasedGlobalExposureBoostRatio");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSemanticStyleProperties setFaceBasedGlobalExposureBoostRatio:](v4, "setFaceBasedGlobalExposureBoostRatio:", v19);

  return v4;
}

- (NSNumber)tuningType
{
  return self->_tuningType;
}

- (void)setTuningType:(id)a3
{
  objc_storeStrong((id *)&self->_tuningType, a3);
}

- (NSNumber)brightness
{
  return self->_brightness;
}

- (void)setBrightness:(id)a3
{
  objc_storeStrong((id *)&self->_brightness, a3);
}

- (NUVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)styleData
{
  return self->_styleData;
}

- (void)setStyleData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)styleDataIsFloat16
{
  return self->_styleDataIsFloat16;
}

- (void)setStyleDataIsFloat16:(BOOL)a3
{
  self->_styleDataIsFloat16 = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 160);
  return self;
}

- (void)setKeyTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_keyTime.epoch = a3->var3;
  *(_OWORD *)&self->_keyTime.value = v3;
}

- (NSData)globalToneCurveData
{
  return self->_globalToneCurveData;
}

- (void)setGlobalToneCurveData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)baselineExposure
{
  return self->_baselineExposure;
}

- (void)setBaselineExposure:(double)a3
{
  self->_baselineExposure = a3;
}

- (NSNumber)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(id)a3
{
  objc_storeStrong((id *)&self->_sceneType, a3);
}

- (NSNumber)subjectRelightingValue
{
  return self->_subjectRelightingValue;
}

- (void)setSubjectRelightingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)lightMapData
{
  return self->_lightMapData;
}

- (void)setLightMapData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)linearLightMapData
{
  return self->_linearLightMapData;
}

- (void)setLinearLightMapData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)lightMapWidth
{
  return self->_lightMapWidth;
}

- (void)setLightMapWidth:(id)a3
{
  objc_storeStrong((id *)&self->_lightMapWidth, a3);
}

- (NSNumber)lightMapHeight
{
  return self->_lightMapHeight;
}

- (void)setLightMapHeight:(id)a3
{
  objc_storeStrong((id *)&self->_lightMapHeight, a3);
}

- (NSNumber)baseGain
{
  return self->_baseGain;
}

- (void)setBaseGain:(id)a3
{
  objc_storeStrong((id *)&self->_baseGain, a3);
}

- (NSNumber)linearGain
{
  return self->_linearGain;
}

- (void)setLinearGain:(id)a3
{
  objc_storeStrong((id *)&self->_linearGain, a3);
}

- (NSNumber)linearRangeMin
{
  return self->_linearRangeMin;
}

- (void)setLinearRangeMin:(id)a3
{
  objc_storeStrong((id *)&self->_linearRangeMin, a3);
}

- (NSNumber)linearRangeMax
{
  return self->_linearRangeMax;
}

- (void)setLinearRangeMax:(id)a3
{
  objc_storeStrong((id *)&self->_linearRangeMax, a3);
}

- (NSNumber)faceBasedGlobalExposureBoostRatio
{
  return self->_faceBasedGlobalExposureBoostRatio;
}

- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3
{
  objc_storeStrong((id *)&self->_faceBasedGlobalExposureBoostRatio, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBasedGlobalExposureBoostRatio, 0);
  objc_storeStrong((id *)&self->_linearRangeMax, 0);
  objc_storeStrong((id *)&self->_linearRangeMin, 0);
  objc_storeStrong((id *)&self->_linearGain, 0);
  objc_storeStrong((id *)&self->_baseGain, 0);
  objc_storeStrong((id *)&self->_lightMapHeight, 0);
  objc_storeStrong((id *)&self->_lightMapWidth, 0);
  objc_storeStrong((id *)&self->_linearLightMapData, 0);
  objc_storeStrong((id *)&self->_lightMapData, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_subjectRelightingValue, 0);
  objc_storeStrong((id *)&self->_sceneType, 0);
  objc_storeStrong((id *)&self->_globalToneCurveData, 0);
  objc_storeStrong((id *)&self->_styleData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_brightness, 0);
  objc_storeStrong((id *)&self->_tuningType, 0);
}

+ (id)semanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _NUSemanticStyleProperties *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _NUSemanticStyleProperties *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v61;
  void *v62;
  void *specific;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  __int128 v108;
  int64_t var3;
  id v110;
  _BYTE buf[24];
  void *v112;
  uint64_t v113;

  v8 = a4;
  v113 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    NUAssertLogger_2784();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v62;
      _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v65)
      {
        v75 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v76 = (void *)MEMORY[0x1E0CB3978];
        v77 = v75;
        objc_msgSend(v76, "callStackSymbols");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "componentsJoinedByString:", CFSTR("\n"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v75;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v79;
        _os_log_error_impl(&dword_1A6553000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v67;
      _os_log_error_impl(&dword_1A6553000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties semanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 631, CFSTR("Invalid parameter not satisfying: %s"), v80, v81, v82, v83, (uint64_t)"data != nil");
  }
  if (!a6)
  {
    NUAssertLogger_2784();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v69;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
    if (v70)
    {
      if (v72)
      {
        v84 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v85 = (void *)MEMORY[0x1E0CB3978];
        v86 = v84;
        objc_msgSend(v85, "callStackSymbols");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "componentsJoinedByString:", CFSTR("\n"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v84;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v88;
        _os_log_error_impl(&dword_1A6553000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v72)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v74;
      _os_log_error_impl(&dword_1A6553000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties semanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 632, CFSTR("Invalid parameter not satisfying: %s"), v89, v90, v91, v92, (uint64_t)"error != NULL");
  }
  v11 = v10;
  v110 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v110);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v110;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("0"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc_init(_NUSemanticStyleProperties);
      -[_NUSemanticStyleProperties setIsVideo:](v15, "setIsVideo:", v8);
      v108 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      -[_NUSemanticStyleProperties setKeyTime:](v15, "setKeyTime:", &v108);
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("0"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Invalid style version"), v12);
        v22 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_114:

        goto LABEL_115;
      }
      +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", objc_msgSend(v16, "unsignedIntValue"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NUSemanticStyleProperties setVersion:](v15, "setVersion:");
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("1"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NUSemanticStyleProperties setStyleData:](v15, "setStyleData:");
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("2"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v16;
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = v17;
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v19 = (id)_NULogger;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v18;
            _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Invalid use float16 value: %{public}@, ignored", buf, 0xCu);
          }

          v17 = 0;
        }
      }
      -[_NUSemanticStyleProperties setStyleDataIsFloat16:](v15, "setStyleDataIsFloat16:", objc_msgSend(v17, "BOOLValue"));
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("3"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v17;
          v107 = 0;
          objc_msgSend(a1, "globalToneCurveDataFromCaptureMetadata:error:", v20, &v107);
          v22 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
          v23 = v107;

          if (v22)
          {
            -[_NUSemanticStyleProperties setGlobalToneCurveData:](v15, "setGlobalToneCurveData:", v22);

            v13 = v23;
            v17 = v21;
            goto LABEL_17;
          }
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read GTC data"), v20, v23);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          v13 = v23;
          v17 = v21;
        }
        else
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Invalid GTC data"), v20, v13);
          v22 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_113:

        v16 = v106;
        goto LABEL_114;
      }
LABEL_17:
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("4"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v25 = (id)_NULogger;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v24;
            _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Invalid baselineExposure value: %{public}@, ignored.", buf, 0xCu);
          }

          v24 = 0;
        }
      }
      objc_msgSend(v24, "doubleValue");
      -[_NUSemanticStyleProperties setBaselineExposure:](v15, "setBaselineExposure:");
      objc_msgSend(v12, "objectForKey:", CFSTR("5"));
      v26 = objc_claimAutoreleasedReturnValue();
      v101 = v24;
      if (v26)
      {
        v27 = (void *)v26;
        objc_opt_class();
        v28 = v27;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = v27;
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v30 = (id)_NULogger;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v28;
            _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Invalid scene type: %{public}@, ignored", buf, 0xCu);
          }

          v29 = 0;
        }
      }
      else
      {
        v29 = 0;
      }
      v100 = v29;
      -[_NUSemanticStyleProperties setSceneType:](v15, "setSceneType:");
      if (v8)
        v31 = &unk_1E50A24C0;
      else
        v31 = &unk_1E50A24D8;
      -[_NUSemanticStyleProperties setTuningType:](v15, "setTuningType:", v31);
      objc_msgSend(v12, "objectForKey:", CFSTR("b"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v33 = (id)_NULogger;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v32;
            _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Invalid Style SRL Curve Parameter: %{public}@, ignored", buf, 0xCu);
          }

          v32 = 0;
        }
      }
      -[_NUSemanticStyleProperties setSubjectRelightingValue:](v15, "setSubjectRelightingValue:", v32);
      objc_msgSend(v12, "objectForKey:", CFSTR("6"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v35 = (id)_NULogger;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v34;
            _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Invalid Style Stats: %{public}@, ignored", buf, 0xCu);
          }

          v34 = 0;
        }
      }
      -[_NUSemanticStyleProperties setStats:](v15, "setStats:", v34);
      objc_msgSend(v12, "objectForKey:", CFSTR("c"));
      v36 = objc_claimAutoreleasedReturnValue();
      v98 = v34;
      if (v36)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v37 = (void *)v36;
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
          v38 = (id)_NULogger;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v37;
            _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap: %{public}@, ignored", buf, 0xCu);
          }

          v36 = 0;
        }
      }
      -[_NUSemanticStyleProperties setLightMapData:](v15, "setLightMapData:", v36);
      objc_msgSend(v12, "objectForKey:", CFSTR("d"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v17;
      v99 = v32;
      if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v41 = v36;
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
        v42 = (id)_NULogger;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v39;
          _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Invalid Style Linear Lightmap: %{public}@, ignored", buf, 0xCu);
        }
        v40 = v20;

        v39 = 0;
        v36 = v41;
      }
      else
      {
        v40 = v20;
      }
      -[_NUSemanticStyleProperties setLinearLightMapData:](v15, "setLinearLightMapData:", v39);
      objc_msgSend(v12, "objectForKey:", CFSTR("e"));
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("f"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)v43;
      if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v46 = v44;
        if (!v44)
        {
          v93 = v39;
          v47 = v45;
LABEL_80:
          -[_NUSemanticStyleProperties setLightMapWidth:](v15, "setLightMapWidth:", v47);
          -[_NUSemanticStyleProperties setLightMapHeight:](v15, "setLightMapHeight:", v46);
          objc_msgSend(v12, "objectForKey:", CFSTR("h"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = (void *)v36;
          if (v50)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
              v51 = (id)_NULogger;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v50;
                _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Invalid Style baseGain Parameter: %{public}@, ignored", buf, 0xCu);
              }

              v50 = 0;
            }
          }
          -[_NUSemanticStyleProperties setBaseGain:](v15, "setBaseGain:", v50);
          objc_msgSend(v12, "objectForKey:", CFSTR("i"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v40;
          v95 = v46;
          v96 = v47;
          if (v52)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
              v53 = (id)_NULogger;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v52;
                _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Invalid Style Linear Encoding Parameters: %{public}@, ignored", buf, 0xCu);
              }

              v52 = 0;
            }
          }
          objc_msgSend(v52, "objectForKey:", CFSTR("Gain"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKey:", CFSTR("OriginalRangeMin"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKey:", CFSTR("OriginalRangeMax"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = v50;
          if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || v55 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
            v57 = (id)_NULogger;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v55;
              *(_WORD *)&buf[22] = 2114;
              v112 = v56;
              _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Invalid Style Linear Encoding Parameters: %{public}@, %{public}@, %{public}@, ignored", buf, 0x20u);
            }

            v54 = 0;
            v55 = 0;
            v56 = 0;
          }
          -[_NUSemanticStyleProperties setLinearGain:](v15, "setLinearGain:", v54);
          -[_NUSemanticStyleProperties setLinearRangeMin:](v15, "setLinearRangeMin:", v55);
          -[_NUSemanticStyleProperties setLinearRangeMax:](v15, "setLinearRangeMax:", v56);
          objc_msgSend(v12, "objectForKey:", CFSTR("j"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
              v59 = (id)_NULogger;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v58;
                _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "Invalid Style Face Based Global Exposure Boost Ratio: %{public}@, ignored", buf, 0xCu);
              }

              v58 = 0;
            }
          }
          -[_NUSemanticStyleProperties setFaceBasedGlobalExposureBoostRatio:](v15, "setFaceBasedGlobalExposureBoostRatio:", v58);
          v22 = v15;

          v20 = v102;
          v17 = v103;
          goto LABEL_113;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v93 = v39;
          v47 = v45;
          v46 = v44;
          goto LABEL_80;
        }
      }
      v48 = (void *)v36;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
      v49 = (id)_NULogger;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap Dimensions: %{public}@, %{public}@, ignored", buf, 0x16u);
      }

      v36 = 0;
      v93 = 0;
      v47 = 0;
      v46 = 0;
      goto LABEL_80;
    }
    *(_OWORD *)buf = *(_OWORD *)&a5->var0;
    *(_QWORD *)&buf[16] = a5->var3;
    objc_msgSend(a1, "legacySemanticStylePropertiesFromData:fromVideo:keyTime:error:", v11, v8, buf, a6);
    v22 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not deserialized property list from data"), v11, v13);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_115:

  return v22;
}

+ (id)semanticStylePropertiesFromImageMetadata:(id)a3 error:(id *)a4
{
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(a1, "semanticStylePropertiesFromData:fromVideo:keyTime:error:", a3, 0, &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)semanticStylePropertiesFromVideoMetadata:(id)a3 keyTime:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a4;
  objc_msgSend(a1, "semanticStylePropertiesFromData:fromVideo:keyTime:error:", a3, 1, &v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)globalToneCurveDataFromCaptureMetadata:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  _WORD *v8;
  id v9;
  _WORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  float *v15;
  unsigned __int16 *v16;
  unsigned int v17;
  float v18;
  float v19;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_2784();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "gtcData != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties globalToneCurveDataFromCaptureMetadata:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 799, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"gtcData != nil");
  }
  v6 = v5;
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
  {
    v7 = CFSTR("Invalid GTC metadata size");
LABEL_6:
    +[NUError invalidError:object:](NUError, "invalidError:object:", v7, v6);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v8 = (_WORD *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
  if ((unsigned __int16)*v8 - 1 > 0x100)
  {
    v7 = CFSTR("Invalid GTC metadata count");
    goto LABEL_6;
  }
  v11 = v8;
  v12 = (unsigned __int16)(*v8 - 1);
  v13 = (unsigned __int16)(*v8 - 1);
  v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v12));
  v14 = objc_msgSend(v9, "mutableBytes");
  if (v13)
  {
    v15 = (float *)v14;
    v16 = v11 + 1;
    do
    {
      v17 = *v16++;
      v18 = (float)v17 / 65535.0;
      if (v18 <= 0.04045)
        v19 = v18 / 12.92;
      else
        v19 = powf((float)(v18 + 0.055) / 1.055, 2.4);
      *v15++ = v19;
      --v12;
    }
    while (v12);
  }
LABEL_7:

  return v9;
}

+ (id)baselineExposureFromLegacyMetadata:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_2784();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadata != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties baselineExposureFromLegacyMetadata:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 830, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"metadata != nil");
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smartStyleBaselineExposure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Invalid baseline exposure value: %{public}@, ignored", buf, 0xCu);
    }

LABEL_10:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ispDGain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing metadata property"), CFSTR("ispDGain"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ispDGainRangeExpansionFactor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing metadata property"), CFSTR("ispDGain"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v9, "doubleValue");
    v12 = v11;
    objc_msgSend(v10, "doubleValue");
    v14 = v13;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AverageLTM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1.0;
    if (v15)
    {
      v18 = objc_msgSend(v15, "count", 1.0);
      v7 = (void *)v18;
      if (!v18)
      {
        +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid metadata property"), CFSTR("AverageLTM"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      if (v18 == 1)
      {
        v19 = 1.0;
        v20 = 0.0;
      }
      else
      {
        v20 = (double)(unint64_t)(v18 - 1);
        v19 = 1.0;
        v21 = 1;
        do
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23 / 65535.0;

          v19 = v19 * (v24 / ((double)v21++ / v20));
        }
        while (v7 != (void *)v21);
      }
      v17 = pow(v19, 1.0 / v20);
    }
    v25 = v12 / (v14 * 256.0) * v17 * 1.41;
    if (v25 < 1.0)
      v25 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!v7)
    goto LABEL_10;
LABEL_28:

  return v7;
}

+ (id)legacySemanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _NUSemanticStyleProperties *v14;
  void *v15;
  void *v16;
  _NUSemanticStyleProperties *v17;
  _NUSemanticStyleProperties *v18;
  _NUSemanticStyleProperties *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v43;
  void *v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _NUSemanticStyleProperties *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  int64_t var3;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v8 = a4;
  v95 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    NUAssertLogger_2784();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v92 = v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v57;
        v93 = 2114;
        v94 = v61;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v92 = v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties legacySemanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 892, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"data != nil");
  }
  if (!a6)
  {
    NUAssertLogger_2784();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v92 = v51;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        v93 = 2114;
        v94 = v70;
        _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v92 = v56;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties legacySemanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 893, CFSTR("Invalid parameter not satisfying: %s"), v71, v72, v73, v74, (uint64_t)"error != NULL");
  }
  v11 = v10;
  v90 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v90);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v90;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(_NUSemanticStyleProperties);
    -[_NUSemanticStyleProperties setIsVideo:](v14, "setIsVideo:", v8);
    v88 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[_NUSemanticStyleProperties setKeyTime:](v14, "setKeyTime:", &v88);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("smartStyleMetadataVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", objc_msgSend(v15, "unsignedIntValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[_NUSemanticStyleProperties setVersion:](v14, "setVersion:", v16);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficients"));
    v18 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16 && !v18)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing style data"), v12);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:

      goto LABEL_81;
    }
    if (!v16 && v18 && !v8)
    {
      v87 = v13;
      -[_NUSemanticStyleProperties decompressedDataUsingAlgorithm:error:](v18, "decompressedDataUsingAlgorithm:error:", 1, &v87);
      v17 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
      v20 = v87;

      if (!v17)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decompress style data"), v12, v20);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        goto LABEL_80;
      }
      v19 = v17;
      v13 = v20;
    }
    -[_NUSemanticStyleProperties setStyleData:](v14, "setStyleData:", v19);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficientsUseFloat16"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
        v22 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = v21;
          _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Invalid use float16 value: %{public}@, ignored", buf, 0xCu);
        }

        v21 = 0;
      }
    }
    -[_NUSemanticStyleProperties setStyleDataIsFloat16:](v14, "setStyleDataIsFloat16:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GlobalToneCurveLookUpTable"));
    v23 = objc_claimAutoreleasedReturnValue();
    v83 = v19;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v82 = v21;
        v86 = 0;
        objc_msgSend(a1, "globalToneCurveDataFromCaptureMetadata:error:", v23, &v86);
        v24 = (void *)v23;
        v17 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
        v25 = v86;

        if (v17)
        {
          -[_NUSemanticStyleProperties setGlobalToneCurveData:](v14, "setGlobalToneCurveData:", v17);

          v23 = (uint64_t)v24;
LABEL_28:
          v81 = (void *)v23;
          v85 = 0;
          objc_msgSend(a1, "baselineExposureFromLegacyMetadata:error:", v12, &v85);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v85;

          if (v26)
          {
            objc_msgSend(v26, "doubleValue");
            -[_NUSemanticStyleProperties setBaselineExposure:](v14, "setBaselineExposure:");
            objc_msgSend(v12, "objectForKey:", CFSTR("smartStyleSemanticStyleSceneType"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
                v28 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v27;
                  _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Invalid scene type: %{public}@, ignored", buf, 0xCu);
                }

                v27 = 0;
              }
            }
            -[_NUSemanticStyleProperties setSceneType:](v14, "setSceneType:", v27);
            objc_msgSend(v12, "objectForKey:", CFSTR("smartStyleSRLCoefficient"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
                v30 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v29;
                  _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Invalid Style SRL Curve Parameter: %{public}@, ignored", buf, 0xCu);
                }

                v29 = 0;
              }
            }
            -[_NUSemanticStyleProperties setSubjectRelightingValue:](v14, "setSubjectRelightingValue:", v29);
            objc_msgSend(v12, "objectForKey:", CFSTR("smartStyleImageStatistics"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
                v32 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v31;
                  _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Invalid Style Stats: %{public}@, ignored", buf, 0xCu);
                }

                v31 = 0;
              }
            }
            -[_NUSemanticStyleProperties setStats:](v14, "setStats:", v31);
            objc_msgSend(v12, "objectForKey:", CFSTR("smallLightMapData"));
            v33 = objc_claimAutoreleasedReturnValue();
            v78 = v31;
            if (v33)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v75 = (void *)v33;
                if (_NULogOnceToken != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
                v34 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v75;
                  _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap: %{public}@, ignored", buf, 0xCu);
                }

                v33 = 0;
              }
            }
            -[_NUSemanticStyleProperties setLightMapData:](v14, "setLightMapData:", v33);
            objc_msgSend(v12, "objectForKey:", CFSTR("smallLinearLightMapData"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = v29;
            v80 = v27;
            v77 = v26;
            if (v35)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v76 = v33;
                if (_NULogOnceToken != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
                v36 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v35;
                  _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Invalid Style Linear Lightmap: %{public}@, ignored", buf, 0xCu);
                }

                v35 = 0;
                v33 = v76;
              }
            }
            -[_NUSemanticStyleProperties setLinearLightMapData:](v14, "setLinearLightMapData:", v35);
            objc_msgSend(v12, "objectForKey:", CFSTR("smallLightMapWidth"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", CFSTR("smallLightMapHeight"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v40 = (void *)v33;
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
              v41 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v92 = v37;
                v93 = 2114;
                v94 = v38;
                _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap Dimensions: %{public}@, %{public}@, ignored", buf, 0x16u);
              }

              v39 = 0;
              v35 = 0;
              v37 = 0;
              v38 = 0;
            }
            else
            {
              v39 = (void *)v33;
            }
            -[_NUSemanticStyleProperties setLightMapWidth:](v14, "setLightMapWidth:", v37);
            -[_NUSemanticStyleProperties setLightMapHeight:](v14, "setLightMapHeight:", v38);
            v17 = v14;

            v21 = v82;
            v26 = v77;
          }
          else
          {
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get baseline exposure value"), v12, v13);
            v17 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v82;
          }

          v24 = v81;
          goto LABEL_79;
        }
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read GTC data"), v24, v25);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v25;
        v21 = v82;
      }
      else
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Invalid GTC data"), v23, v13);
        v24 = (void *)v23;
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_79:

      goto LABEL_80;
    }
    v82 = v21;
    v25 = v13;
    goto LABEL_28;
  }
  +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not deserialized property list from data"), v11, v13);
  v17 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_81:

  return v17;
}

@end
