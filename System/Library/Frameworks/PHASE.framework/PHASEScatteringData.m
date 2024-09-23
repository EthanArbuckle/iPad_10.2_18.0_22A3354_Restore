@implementation PHASEScatteringData

- (PHASEScatteringData)init
{
  -[PHASEScatteringData doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3
{
  PHASEScatteringData *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  PHASESubband *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *scatteringCoefficients;
  PHASEScatteringData *v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  if (objc_msgSend(v22, "count"))
  {
    v27.receiver = self;
    v27.super_class = (Class)PHASEScatteringData;
    v4 = -[PHASEScatteringData init](&v27, sel_init);
    if (v4)
    {
      v5 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v6 = v22;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v24;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(v6);
            v10 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v9);
            objc_msgSend(v10, "value");
            v12 = v11;
            objc_msgSend(v10, "value");
            v13 = v10;
            if (v14 != fminf(fmaxf(v12, 0.0), 1.0))
            {
              v15 = [PHASESubband alloc];
              objc_msgSend(v10, "frequency");
              v16 = -[PHASESubband initWithFrequency:value:](v15, "initWithFrequency:value:");

              v13 = (void *)v16;
            }
            objc_msgSend(v5, "addObject:", v13);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v7);
      }

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
      scatteringCoefficients = v4->_scatteringCoefficients;
      v4->_scatteringCoefficients = (NSArray *)v17;

    }
    self = v4;
    v19 = self;
  }
  else
  {
    v20 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "PHASEMaterial.mm";
      v31 = 1024;
      v32 = 399;
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients]: scatteringCoeffients is empty", buf, 0x12u);
    }
    v19 = 0;
  }

  return v19;
}

- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3 frequencyBands:(id)a4
{
  uint64_t v6;
  Phase::Logger *v7;
  PHASEScatteringData *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  PHASESubband *v17;
  void *v18;
  PHASESubband *v19;
  uint64_t v20;
  NSArray *scatteringCoefficients;
  PHASEScatteringData *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  PHASEScatteringData *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v29 = a4;
  if (!objc_msgSend(v28, "count"))
  {
    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "PHASEMaterial.mm";
      v38 = 1024;
      v39 = 431;
      v24 = "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: scatteringCoeffients is empty";
LABEL_19:
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
    }
LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v29, "count"))
  {
    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "PHASEMaterial.mm";
      v38 = 1024;
      v39 = 438;
      v24 = "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: frequencyBands is empty";
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  v6 = objc_msgSend(v28, "count");
  v7 = (Phase::Logger *)objc_msgSend(v29, "count");
  if ((Phase::Logger *)v6 != v7)
  {
    v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "PHASEMaterial.mm";
      v38 = 1024;
      v39 = 447;
      v40 = 2048;
      v41 = objc_msgSend(v28, "count");
      v42 = 2048;
      v43 = objc_msgSend(v29, "count");
      _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: scatteringsCoefficent count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_23;
  }
  v34.receiver = self;
  v34.super_class = (Class)PHASEScatteringData;
  v8 = -[PHASEScatteringData init](&v34, sel_init);
  if (v8)
  {
    v27 = v8;
    v9 = objc_msgSend(v28, "count");
    if (v9 != objc_msgSend(v29, "count"))
    {
      v22 = 0;
      self = v27;
      goto LABEL_24;
    }
    v10 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v28;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "floatValue");
          v17 = [PHASESubband alloc];
          objc_msgSend(v29, "objectAtIndexedSubscript:", v13 + i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          v19 = -[PHASESubband initWithFrequency:value:](v17, "initWithFrequency:value:");

          objc_msgSend(v10, "addObject:", v19);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v13 += i;
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
    v20 = objc_claimAutoreleasedReturnValue();
    scatteringCoefficients = v27->_scatteringCoefficients;
    v27->_scatteringCoefficients = (NSArray *)v20;

    v8 = v27;
  }
  self = v8;
  v22 = self;
LABEL_24:

  return v22;
}

+ (id)objectForDefault
{
  void *v2;
  uint64_t i;
  PHASESubband *v4;
  double v5;
  double v6;
  PHASESubband *v7;
  PHASEScatteringData *v8;
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
  v8 = -[PHASEScatteringData initWithScatteringCoefficients:]([PHASEScatteringData alloc], "initWithScatteringCoefficients:", v2);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v8;
}

- (NSArray)scatteringCoefficients
{
  return self->_scatteringCoefficients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scatteringCoefficients, 0);
}

@end
