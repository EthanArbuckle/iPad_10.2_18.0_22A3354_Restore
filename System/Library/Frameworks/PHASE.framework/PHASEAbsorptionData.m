@implementation PHASEAbsorptionData

- (PHASEAbsorptionData)init
{
  -[PHASEAbsorptionData doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3
{
  PHASEAbsorptionData *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  float v11;
  float v12;
  Phase::Logger *v13;
  float v14;
  void *v15;
  float v16;
  NSObject *v17;
  float v18;
  PHASESubband *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *absorptionCoefficients;
  PHASEAbsorptionData *v23;
  NSObject *v24;
  PHASEAbsorptionData *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  if (objc_msgSend(v27, "count"))
  {
    v32.receiver = self;
    v32.super_class = (Class)PHASEAbsorptionData;
    v4 = -[PHASEAbsorptionData init](&v32, sel_init);
    if (v4)
    {
      v26 = v4;
      v5 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v6 = v27;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v6);
            v10 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v10, "value");
            v12 = v11;
            v13 = (Phase::Logger *)objc_msgSend(v10, "value");
            v14 = fminf(fmaxf(v12, 0.0), 1.0);
            v15 = v10;
            if (v16 != v14)
            {
              v17 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13)
                                                                                                  + 432)));
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v10, "value");
                *(_DWORD *)buf = 136315906;
                v34 = "PHASEMaterial.mm";
                v35 = 1024;
                v36 = 304;
                v37 = 2048;
                v38 = v18;
                v39 = 2048;
                v40 = v14;
                _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Clamping input absorption coefficient value from %2.3f to %2.3f.", buf, 0x26u);
              }

              v19 = [PHASESubband alloc];
              objc_msgSend(v10, "frequency");
              v20 = -[PHASESubband initWithFrequency:value:](v19, "initWithFrequency:value:");

              v15 = (void *)v20;
            }
            objc_msgSend(v5, "addObject:", v15, v26);

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        }
        while (v7);
      }

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
      v21 = objc_claimAutoreleasedReturnValue();
      absorptionCoefficients = v26->_absorptionCoefficients;
      v26->_absorptionCoefficients = (NSArray *)v21;

      v4 = v26;
    }
    self = v4;
    v23 = self;
  }
  else
  {
    v24 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "PHASEMaterial.mm";
      v35 = 1024;
      v36 = 288;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients]: absorptionCoeffients is empty", buf, 0x12u);
    }
    v23 = 0;
  }

  return v23;
}

- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3 frequencyBands:(id)a4
{
  uint64_t v6;
  Phase::Logger *v7;
  PHASEAbsorptionData *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  PHASESubband *v16;
  void *v17;
  PHASESubband *v18;
  uint64_t v19;
  NSArray *absorptionCoefficients;
  PHASEAbsorptionData *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  PHASEAbsorptionData *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v28 = a4;
  if (!objc_msgSend(v27, "count"))
  {
    v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "PHASEMaterial.mm";
      v37 = 1024;
      v38 = 320;
      v23 = "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: absorptionCoeffients is empty";
LABEL_18:
      _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
    }
LABEL_22:
    v21 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(v28, "count"))
  {
    v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "PHASEMaterial.mm";
      v37 = 1024;
      v38 = 327;
      v23 = "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: frequencyBands is empty";
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  v6 = objc_msgSend(v27, "count");
  v7 = (Phase::Logger *)objc_msgSend(v28, "count");
  if ((Phase::Logger *)v6 != v7)
  {
    v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "PHASEMaterial.mm";
      v37 = 1024;
      v38 = 336;
      v39 = 2048;
      v40 = objc_msgSend(v27, "count");
      v41 = 2048;
      v42 = objc_msgSend(v28, "count");
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: aborptionCoefficent count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_22;
  }
  v33.receiver = self;
  v33.super_class = (Class)PHASEAbsorptionData;
  v8 = -[PHASEAbsorptionData init](&v33, sel_init);
  if (v8)
  {
    v26 = v8;
    v9 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v27;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "floatValue");
          v16 = [PHASESubband alloc];
          objc_msgSend(v28, "objectAtIndexedSubscript:", v12 + i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v18 = -[PHASESubband initWithFrequency:value:](v16, "initWithFrequency:value:");

          objc_msgSend(v9, "addObject:", v18);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v12 += i;
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
    v19 = objc_claimAutoreleasedReturnValue();
    absorptionCoefficients = v26->_absorptionCoefficients;
    v26->_absorptionCoefficients = (NSArray *)v19;

    v8 = v26;
  }
  self = v8;
  v21 = self;
LABEL_23:

  return v21;
}

+ (id)objectForDefault
{
  void *v2;
  uint64_t i;
  PHASESubband *v4;
  double v5;
  double v6;
  PHASESubband *v7;
  PHASEAbsorptionData *v8;
  void *__p[3];

  sGetFrequencies((uint64_t)__p);
  v2 = (void *)objc_opt_new();
  for (i = 0; i != 124; i += 4)
  {
    v4 = [PHASESubband alloc];
    LODWORD(v5) = *(_DWORD *)((char *)__p[0] + i);
    LODWORD(v6) = 0;
    v7 = -[PHASESubband initWithFrequency:value:](v4, "initWithFrequency:value:", v5, v6);
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = -[PHASEAbsorptionData initWithAbsorptionCoefficients:]([PHASEAbsorptionData alloc], "initWithAbsorptionCoefficients:", v2);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v8;
}

- (NSArray)absorptionCoefficients
{
  return self->_absorptionCoefficients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absorptionCoefficients, 0);
}

@end
