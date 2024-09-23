@implementation PHASESoundReductionIndex

- (PHASESoundReductionIndex)init
{
  -[PHASESoundReductionIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESoundReductionIndex)initWithAttenuationCoefficients:(id)a3 measuredDepth:(float)a4
{
  Phase::Logger *v6;
  PHASESoundReductionIndex *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  Phase::Logger *v14;
  float v15;
  NSObject *v16;
  float v17;
  id v18;
  float v19;
  float v20;
  Phase::Logger *v21;
  void *v22;
  float v23;
  NSObject *v24;
  float v25;
  PHASESubband *v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *attenuationCoefficients;
  PHASESoundReductionIndex *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  NSObject *v35;
  PHASESoundReductionIndex *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v6 = (Phase::Logger *)objc_msgSend(v38, "count");
  if (!v6)
  {
    v31 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "PHASEMaterial.mm";
      v47 = 1024;
      v48 = 144;
      v32 = "%25s:%-5d [PHASESoundReductionIndex:initWithScatteringCoefficients]: scatteringCoeffients is empty";
      v33 = v31;
      v34 = 18;
LABEL_25:
      _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    }
LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  if (a4 <= 0.0)
  {
    v35 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 432));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v46 = "PHASEMaterial.mm";
      v47 = 1024;
      v48 = 153;
      v49 = 2048;
      v50 = a4;
      v32 = "%25s:%-5d [PHASESoundReductionIndex:initWithScatteringCoefficients]: Invalid material depth: %2.2f. Values m"
            "ust be greater than zero.";
      v33 = v35;
      v34 = 28;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v43.receiver = self;
  v43.super_class = (Class)PHASESoundReductionIndex;
  v7 = -[PHASESoundReductionIndex init](&v43, sel_init);
  if (v7)
  {
    v37 = v7;
    v8 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v38;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v9);
          v13 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v14 = (Phase::Logger *)objc_msgSend(v13, "value");
          if (v15 > 1.0)
          {
            v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v14)
                                                                                                + 432)));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "value");
              *(_DWORD *)buf = 136315650;
              v46 = "PHASEMaterial.mm";
              v47 = 1024;
              v48 = 168;
              v49 = 2048;
              v50 = v17;
              _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input SRI attenuation coefficient value %2.2f. Values greater than 1 are atypical; not clamping.",
                buf,
                0x1Cu);
            }

          }
          v18 = v13;
          objc_msgSend(v18, "value");
          v20 = v19;
          v21 = (Phase::Logger *)objc_msgSend(v18, "value");
          v22 = v18;
          if (v23 != fmaxf(v20, 0.0))
          {
            v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v21)
                                                                                                + 432)));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v18, "value");
              *(_DWORD *)buf = 136315650;
              v46 = "PHASEMaterial.mm";
              v47 = 1024;
              v48 = 176;
              v49 = 2048;
              v50 = v25;
              _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d Clamping input SRI attenuation coefficient value from %2.3f to zero.", buf, 0x1Cu);
            }

            v26 = [PHASESubband alloc];
            objc_msgSend(v18, "frequency");
            v27 = -[PHASESubband initWithFrequency:value:](v26, "initWithFrequency:value:");

            v22 = (void *)v27;
          }
          objc_msgSend(v8, "addObject:", v22, v37);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
    v28 = objc_claimAutoreleasedReturnValue();
    attenuationCoefficients = v37->_attenuationCoefficients;
    v37->_attenuationCoefficients = (NSArray *)v28;

    v37->_measuredDepth = a4;
    v7 = v37;
  }
  self = v7;
  v30 = self;
LABEL_27:

  return v30;
}

- (PHASESoundReductionIndex)initWithSoundReductionIndices:(id)a3 frequencyBands:(id)a4 measuredDepth:(float)a5
{
  uint64_t v8;
  Phase::Logger *v9;
  PHASESoundReductionIndex *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  float v18;
  PHASESubband *v19;
  void *v20;
  PHASESubband *v21;
  uint64_t v22;
  NSArray *attenuationCoefficients;
  PHASESoundReductionIndex *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  NSObject *v30;
  PHASESoundReductionIndex *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  double v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v34 = a4;
  if (!objc_msgSend(v33, "count"))
  {
    v25 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "PHASEMaterial.mm";
      v43 = 1024;
      v44 = 196;
      v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: soundReduct"
            "ionIndices is empty";
LABEL_19:
      v27 = v25;
      v28 = 18;
LABEL_20:
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_26:
    v24 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v34, "count"))
  {
    v25 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "PHASEMaterial.mm";
      v43 = 1024;
      v44 = 203;
      v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: frequencyBands is empty";
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  v8 = objc_msgSend(v33, "count");
  v9 = (Phase::Logger *)objc_msgSend(v34, "count");
  if ((Phase::Logger *)v8 != v9)
  {
    v29 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "PHASEMaterial.mm";
      v43 = 1024;
      v44 = 212;
      v45 = 2048;
      v46 = COERCE_DOUBLE(objc_msgSend(v33, "count"));
      v47 = 2048;
      v48 = objc_msgSend(v34, "count");
      _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: soundReductionIndices count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (a5 <= 0.0)
  {
    v30 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 432));
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136315650;
    v42 = "PHASEMaterial.mm";
    v43 = 1024;
    v44 = 221;
    v45 = 2048;
    v46 = a5;
    v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: Invalid mater"
          "ial depth: %2.2f. Values must be greater than zero.";
    v27 = v30;
    v28 = 28;
    goto LABEL_20;
  }
  v39.receiver = self;
  v39.super_class = (Class)PHASESoundReductionIndex;
  v10 = -[PHASESoundReductionIndex init](&v39, sel_init);
  if (v10)
  {
    v32 = v10;
    v11 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v33;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "floatValue");
          expf((float)((float)(fmaxf(v18, 0.0) * -10.0) / 10.0) * 0.11513);
          v19 = [PHASESubband alloc];
          objc_msgSend(v34, "objectAtIndexedSubscript:", v14 + i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v21 = -[PHASESubband initWithFrequency:value:](v19, "initWithFrequency:value:");

          objc_msgSend(v11, "addObject:", v21);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        v14 += i;
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
    v22 = objc_claimAutoreleasedReturnValue();
    attenuationCoefficients = v32->_attenuationCoefficients;
    v32->_attenuationCoefficients = (NSArray *)v22;

    v32->_measuredDepth = a5;
    v10 = v32;
  }
  self = v10;
  v24 = self;
LABEL_27:

  return v24;
}

+ (id)objectForDefault
{
  void *v2;
  uint64_t i;
  PHASESubband *v4;
  double v5;
  double v6;
  PHASESubband *v7;
  PHASESoundReductionIndex *v8;
  double v9;
  PHASESoundReductionIndex *v10;
  void *__p[3];

  sGetFrequencies((uint64_t)__p);
  v2 = (void *)objc_opt_new();
  for (i = 0; i != 124; i += 4)
  {
    v4 = [PHASESubband alloc];
    LODWORD(v5) = *(_DWORD *)((char *)__p[0] + i);
    LODWORD(v6) = 1.0;
    v7 = -[PHASESubband initWithFrequency:value:](v4, "initWithFrequency:value:", v5, v6);
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = [PHASESoundReductionIndex alloc];
  LODWORD(v9) = 1041865114;
  v10 = -[PHASESoundReductionIndex initWithAttenuationCoefficients:measuredDepth:](v8, "initWithAttenuationCoefficients:measuredDepth:", v2, v9);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v10;
}

- (NSArray)attenuationCoefficients
{
  return self->_attenuationCoefficients;
}

- (float)measuredDepth
{
  return self->_measuredDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attenuationCoefficients, 0);
}

@end
