@implementation PHASEMedium

- (PHASEMedium)init
{
  -[PHASEMedium doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMedium)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t i;
  float v9;
  double v10;
  PHASESubband *v11;
  long double v12;
  double v13;
  PHASESubband *v14;
  double v15;
  uint64_t j;
  float v17;
  double v18;
  PHASESubband *v19;
  long double v20;
  double v21;
  PHASESubband *v22;
  float v23;
  PHASEMedium *v24;
  double v26[23];
  void *v27[3];

  v6 = a3;
  v7 = (void *)objc_opt_new();
  sGetFrequencies((uint64_t)v27, 0x1FuLL);
  if (a4 == 1835291479)
  {
    Phase::Geometry::WaterUtility<double>::WaterUtility((uint64_t)v26);
    Phase::Geometry::WaterUtility<double>::SetTemperatureInCelsius((uint64_t)v26, 20.0);
    Phase::Geometry::WaterUtility<double>::SetDepthInMeters((uint64_t)v26, 10.0);
    for (i = 0; i != 124; i += 4)
    {
      v9 = *(float *)((char *)v27[0] + i);
      v10 = Phase::Geometry::WaterUtility<double>::WaterAbsorptionInDecibelsPerMeter(v26, v9);
      v11 = [PHASESubband alloc];
      v12 = exp(v10 * -10.0 / 10.0 * 0.115129255);
      *(float *)&v13 = v12;
      *(float *)&v12 = v9;
      v14 = -[PHASESubband initWithFrequency:value:](v11, "initWithFrequency:value:", (double)v12, v13);
      objc_msgSend(v7, "addObject:", v14);

    }
    v15 = v26[22];
  }
  else
  {
    Phase::Geometry::WeatherUtility<double>::WeatherUtility((uint64_t)v26);
    Phase::Geometry::WeatherUtility<double>::SetTemperatureInCelsius((uint64_t)v26, 20.0);
    Phase::Geometry::WeatherUtility<double>::SetRelativeHumidityPercentage((uint64_t)v26, 50.0);
    for (j = 0; j != 124; j += 4)
    {
      v17 = *(float *)((char *)v27[0] + j);
      v18 = Phase::Geometry::WeatherUtility<double>::AtmosphericAbsorptionInDecibelsPerMeter(v26, v17);
      v19 = [PHASESubband alloc];
      v20 = exp(v18 * -10.0 / 10.0 * 0.115129255);
      *(float *)&v21 = v20;
      *(float *)&v20 = v17;
      v22 = -[PHASESubband initWithFrequency:value:](v19, "initWithFrequency:value:", (double)v20, v21);
      objc_msgSend(v7, "addObject:", v22);

    }
    v15 = v26[17];
  }
  v23 = v15;
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  *(float *)&v15 = v23;
  v24 = -[PHASEMedium initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:](self, "initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:", v6, a4, a4, v7, v15);

  return v24;
}

- (PHASEMedium)initWithEngine:(id)a3 attenuationCoefficients:(id)a4 speedOfSound:(float)a5
{
  return -[PHASEMedium initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:](self, "initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:", a3, 1835286898, 1835286898, a4);
}

- (PHASEMedium)initWithEngine:(id)a3 preset:(int64_t)a4 privatePreset:(int64_t)a5 attenuationCoefficients:(id)a6 speedOfSound:(float)a7
{
  Phase::Logger *v12;
  PHASEMedium *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  Phase::Logger *v20;
  float v21;
  float v22;
  NSObject *v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  PHASESubband *v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *attenuationCoefficients;
  id WeakRetained;
  uint64_t v34;
  BOOL v35;
  PHASEMedium *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  NSObject *v41;
  id *location;
  PHASEMedium *v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  uint8_t v52[128];
  _BYTE buf[12];
  __int16 v54;
  int v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v46 = a6;
  v12 = (Phase::Logger *)objc_msgSend(v46, "count");
  if (!v12)
  {
    v37 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PHASEMedium.mm";
      v54 = 1024;
      v55 = 189;
      v38 = "%25s:%-5d [PHASEMedium:initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound]: attenuatio"
            "nCoefficients is empty";
      v39 = v37;
      v40 = 18;
LABEL_24:
      _os_log_impl(&dword_2164CC000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    }
LABEL_25:
    v36 = 0;
    goto LABEL_26;
  }
  if (a7 <= 0.0)
  {
    v41 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12) + 432));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "PHASEMedium.mm";
      v54 = 1024;
      v55 = 197;
      v56 = 2048;
      v57 = a7;
      v38 = "%25s:%-5d [PHASEMedium:initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound]: Invalid speedOfSound: %f";
      v39 = v41;
      v40 = 28;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v51.receiver = self;
  v51.super_class = (Class)PHASEMedium;
  v13 = -[PHASEMedium init](&v51, sel_init);
  if (!v13)
    goto LABEL_19;
  v44 = v13;
  location = (id *)&v13->_engine;
  objc_storeWeak((id *)&v13->_engine, obj);
  v44->_preset = a4;
  v44->_privatePreset = a5;
  v14 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = v46;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v15);
        v19 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);
        v20 = (Phase::Logger *)objc_msgSend(v19, "value", location);
        if (v21 < 0.0 || (v20 = (Phase::Logger *)objc_msgSend(v19, "value"), v22 > 1.0))
        {
          v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v20)
                                                                                              + 432)));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v19, "value");
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "PHASEMedium.mm";
            v54 = 1024;
            v55 = 219;
            v56 = 2048;
            v57 = v24;
            _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEMedium attenuation coefficient %f is out-of-range [0, 1]. Clamping...", buf, 0x1Cu);
          }

        }
        objc_msgSend(v19, "value");
        v26 = v25;
        objc_msgSend(v19, "value");
        v27 = v19;
        if (v28 != fminf(fmaxf(v26, 0.0), 1.0))
        {
          v29 = [PHASESubband alloc];
          objc_msgSend(v19, "frequency");
          v30 = -[PHASESubband initWithFrequency:value:](v29, "initWithFrequency:value:");

          v27 = (void *)v30;
        }
        objc_msgSend(v14, "addObject:", v27);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
  v31 = objc_claimAutoreleasedReturnValue();
  attenuationCoefficients = v44->_attenuationCoefficients;
  v44->_attenuationCoefficients = (NSArray *)v31;

  v44->_speedOfSound = a7;
  *(_QWORD *)buf = v15;
  *(float *)&buf[8] = v44->_speedOfSound;
  WeakRetained = objc_loadWeakRetained(location);
  v34 = objc_msgSend(WeakRetained, "implementation");
  -[PHASEMedium setGeoMediumHandle:](v44, "setGeoMediumHandle:", (*(uint64_t (**)(_QWORD, _BYTE *))(**(_QWORD **)(v34 + 368) + 24))(*(_QWORD *)(v34 + 368), buf));

  v35 = -[PHASEMedium geoMediumHandle](v44, "geoMediumHandle") == 0;
  v13 = v44;
  if (v35)
  {
    v36 = 0;
    self = v44;
  }
  else
  {
LABEL_19:
    self = v13;
    v36 = self;
  }
LABEL_26:

  return v36;
}

- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 bandcount:(int)a7
{
  Phase::Logger *v12;
  Phase::Logger *v13;
  NSObject *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  _BYTE __p[18];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = (Phase::Logger *)a3;
  v13 = v12;
  if ((a7 - 32) <= 0xFFFFFFE2)
  {
    v14 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12) + 432));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "PHASEMedium.mm";
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = 255;
      v28 = 1024;
      v29 = a7;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:bandcount]: bandcount %d is out-of-range [3, 31]. Clamping...", __p, 0x18u);
    }
    if (a7 <= 3)
      v15 = 3;
    else
      v15 = a7;
    a7 = ((31 - v15) & ((31 - v15) >> 31)) + v15;
  }
  sGetFrequencies((uint64_t)__p, a7);
  v16 = (void *)objc_opt_new();
  if (a7 >= 1)
  {
    v20 = 0;
    v21 = 4 * a7;
    do
    {
      v22 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v23) = *(_DWORD *)(*(_QWORD *)__p + v20);
      v24 = (void *)objc_msgSend(v22, "initWithFloat:", v23);
      objc_msgSend(v16, "addObject:", v24);

      v20 += 4;
    }
    while (v21 != v20);
  }
  *(float *)&v17 = a4;
  *(float *)&v18 = a5;
  *(float *)&v19 = a6;
  v25 = -[PHASEMedium initAirWithEngine:temperature:pressure:humidity:frequencies:](self, "initAirWithEngine:temperature:pressure:humidity:frequencies:", v13, v16, v17, v18, v19);

  if (*(_QWORD *)__p)
  {
    *(_QWORD *)&__p[8] = *(_QWORD *)__p;
    operator delete(*(void **)__p);
  }

  return v25;
}

- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 frequencies:(id)a7
{
  Phase::Logger *v12;
  Phase::Logger *v13;
  NSObject *v14;
  Phase::Logger *v15;
  NSObject *v16;
  double v17;
  PHASEMedium *v18;
  Phase::Logger *v19;
  double v20;
  double v21;
  void *v22;
  Phase::Logger *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  float v28;
  long double v29;
  PHASESubband *v30;
  PHASESubband *v31;
  void *v32;
  double v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  char v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v12 = (Phase::Logger *)a7;
  v13 = v12;
  if (a5 < 5.0)
  {
    v14 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12) + 432));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "PHASEMedium.mm";
      v43 = 1024;
      v44 = 282;
      v45 = 2048;
      v46 = a5;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:frequencies]: Pressure %2.2f must be > 0.001 (1 Pa). Clamping...", buf, 0x1Cu);
    }
    a5 = fmaxf(a5, 5.0);
  }
  v15 = (Phase::Logger *)-[Phase::Logger count](v13, "count");
  if ((unint64_t)v15 < 3
    || (v15 = (Phase::Logger *)-[Phase::Logger count](v13, "count"), (unint64_t)v15 >= 0x20))
  {
    v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15)
                                                                                        + 432)));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = COERCE_DOUBLE(-[Phase::Logger count](v13, "count"));
      *(_DWORD *)buf = 136315650;
      v42 = "PHASEMedium.mm";
      v43 = 1024;
      v44 = 291;
      v45 = 2048;
      v46 = v17;
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:frequencies]: frequencies.count %zu is out-of-range [3, 31].", buf, 0x1Cu);
    }

    v18 = 0;
    goto LABEL_22;
  }
  Phase::Geometry::WeatherUtility<double>::WeatherUtility((uint64_t)buf);
  Phase::Geometry::WeatherUtility<double>::SetTemperatureInCelsius((uint64_t)buf, a4);
  v20 = Phase::Controller::sClamp<double>(v19, (float)(a5 * 1000.0), v47, v48);
  if (v20 != v49)
  {
    v49 = v20;
    v50 = 1;
LABEL_13:
    Phase::Geometry::WeatherUtility<double>::InitInternal((uint64_t)buf);
    goto LABEL_14;
  }
  if (v50)
    goto LABEL_13;
LABEL_14:
  Phase::Geometry::WeatherUtility<double>::SetRelativeHumidityPercentage((uint64_t)buf, a6);
  v21 = v51;
  v22 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v13;
  v24 = -[Phase::Logger countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v23);
        v27 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v26);
        objc_msgSend(v27, "floatValue");
        v29 = Phase::Geometry::WeatherUtility<double>::AtmosphericAbsorptionInDecibelsPerMeter((double *)buf, v28);
        exp(v29 * -10.0 / 10.0 * 0.115129255);
        v30 = [PHASESubband alloc];
        objc_msgSend(v27, "floatValue");
        v31 = -[PHASESubband initWithFrequency:value:](v30, "initWithFrequency:value:");
        objc_msgSend(v22, "addObject:", v31);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[Phase::Logger countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v33 = v21;
  self = -[PHASEMedium initWithEngine:attenuationCoefficients:speedOfSound:](self, "initWithEngine:attenuationCoefficients:speedOfSound:", v35, v32, v33);

  v18 = self;
LABEL_22:

  return v18;
}

- (id)initWaterWithEngine:(id)a3 temperature:(float)a4 depth:(float)a5 salinity:(float)a6 pH:(float)a7 frequencies:(id)a8
{
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  float v19;
  objc_class *v20;
  void *v21;
  void *v22;
  float v23;
  objc_class *v24;
  void *v25;
  void *v26;
  float v27;
  objc_class *v28;
  void *v29;
  void *v30;
  float v31;
  Phase::Logger *v32;
  Phase::Logger *v33;
  double v34;
  double inited;
  Phase::Logger *v36;
  NSObject *v37;
  uint64_t v38;
  PHASEMedium *v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  id v45;
  float v46;
  long double v47;
  PHASESubband *v48;
  PHASESubband *v49;
  void *v50;
  double v51;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  double v58[13];
  double v59;
  char v60;
  double v61;
  double v62;
  double v63;
  char v64;
  double v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  v15 = a8;
  Phase::Geometry::WaterUtility<double>::WaterUtility((uint64_t)v58);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = PHASEGetPropertyBounded<float>(v17, v18, a4, 0.0, 50.0);

  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = PHASEGetPropertyBounded<float>(v21, v22, a5, 0.0, 10000.0);

  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = PHASEGetPropertyBounded<float>(v25, v26, a6, 0.0, 50.0);

  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = PHASEGetPropertyBounded<float>(v29, v30, a7, 7.0, 9.0);

  Phase::Geometry::WaterUtility<double>::SetTemperatureInCelsius((uint64_t)v58, v19);
  Phase::Geometry::WaterUtility<double>::SetDepthInMeters((uint64_t)v58, v23);
  v34 = Phase::Controller::sClamp<double>(v32, v27, v58[10], v58[11]);
  if (v34 == v59)
  {
    if (!v60)
      goto LABEL_5;
  }
  else
  {
    v59 = v34;
    v60 = 1;
  }
  Phase::Geometry::WaterUtility<double>::InitInternal((uint64_t)v58);
LABEL_5:
  inited = Phase::Controller::sClamp<double>(v33, v31, v61, v62);
  if (inited != v63)
  {
    v63 = inited;
    v64 = 1;
LABEL_8:
    inited = Phase::Geometry::WaterUtility<double>::InitInternal((uint64_t)v58);
    goto LABEL_9;
  }
  if (v64)
    goto LABEL_8;
LABEL_9:
  v36 = (Phase::Logger *)objc_msgSend(v15, "count", inited);
  if ((unint64_t)v36 >= 3 && (v36 = (Phase::Logger *)objc_msgSend(v15, "count"), (unint64_t)v36 < 0x20))
  {
    v40 = v65;
    v37 = objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v15;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v55 != v43)
            objc_enumerationMutation(v41);
          v45 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v45, "floatValue");
          v47 = Phase::Geometry::WaterUtility<double>::WaterAbsorptionInDecibelsPerMeter(v58, v46);
          exp(v47 * -10.0 / 10.0 * 0.115129255);
          v48 = [PHASESubband alloc];
          objc_msgSend(v45, "floatValue");
          v49 = -[PHASESubband initWithFrequency:value:](v48, "initWithFrequency:value:");
          -[NSObject addObject:](v37, "addObject:", v49);

        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v42);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v37);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v51 = v40;
    self = -[PHASEMedium initWithEngine:attenuationCoefficients:speedOfSound:](self, "initWithEngine:attenuationCoefficients:speedOfSound:", v53, v50, v51);

    v39 = self;
  }
  else
  {
    v37 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v36)
                                                                                        + 432)));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 136315650;
      v68 = "PHASEMedium.mm";
      v69 = 1024;
      v70 = 346;
      v71 = 2048;
      v72 = v38;
      _os_log_impl(&dword_2164CC000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium initWaterEWithEngine:temperature:depth:salinity:pH:frequencies]: Frequencies %lu out-of-range [3, 31].", buf, 0x1Cu);
    }
    v39 = 0;
  }

  return v39;
}

- (void)setDefault
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Phase::Logger *v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 216))(v5, -[PHASEMedium geoMediumHandle](self, "geoMediumHandle"));
  }
  else
  {
    v6 = *MEMORY[0x24BDD0FC8];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v6);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315650;
      v13 = "PHASEMedium.mm";
      v14 = 1024;
      v15 = 373;
      v16 = 2080;
      v17 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v12, 0x1Cu);

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v6 = -[PHASEMedium preset](self, "preset");
  v7 = -[PHASEMedium privatePreset](self, "privatePreset");
  -[PHASEMedium attenuationCoefficients](self, "attenuationCoefficients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEMedium speedOfSound](self, "speedOfSound");
  v9 = (void *)objc_msgSend(v4, "initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:", WeakRetained, v6, v7, v8);

  return v9;
}

- (void)dealloc
{
  PHASEEngine **p_engine;
  id WeakRetained;
  id v5;
  uint64_t v6;
  objc_super v7;

  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_engine);
    v6 = *(_QWORD *)(objc_msgSend(v5, "implementation") + 368);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 288))(v6, -[PHASEMedium geoMediumHandle](self, "geoMediumHandle"));

  }
  v7.receiver = self;
  v7.super_class = (Class)PHASEMedium;
  -[PHASEMedium dealloc](&v7, sel_dealloc);
}

- (Handle64)geoMediumHandle
{
  return self->_geoMediumHandle;
}

- (void)setGeoMediumHandle:(Handle64)a3
{
  self->_geoMediumHandle = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (int64_t)privatePreset
{
  return self->_privatePreset;
}

- (NSArray)attenuationCoefficients
{
  return self->_attenuationCoefficients;
}

- (float)speedOfSound
{
  return self->_speedOfSound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attenuationCoefficients, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
