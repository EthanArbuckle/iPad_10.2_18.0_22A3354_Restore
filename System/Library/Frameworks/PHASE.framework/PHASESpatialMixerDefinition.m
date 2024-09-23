@implementation PHASESpatialMixerDefinition

- (PHASESpatialMixerDefinition)init
{
  -[PHASESpatialMixerDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESpatialMixerDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3
{
  PHASESpatialPipeline *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Phase::Logger *v9;
  PHASESpatialPipeline *v10;
  PHASESpatialPipeline *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  PHASESpatialMixerDefinition *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PHASESpatialPipeline *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PHASESpatialPipeline *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  PHASESpatialMixerDefinition *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  int v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v4 = (PHASESpatialPipeline *)a3;
  v5 = 0;
  v6 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v73;
LABEL_3:
    v8 = 0;
    while (2)
    {
      if (*(_QWORD *)v73 != v7)
        objc_enumerationMutation(v4);
      v9 = (Phase::Logger *)objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v8), "spatialModelerType");
      switch((unint64_t)v9)
      {
        case 0uLL:
          v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 432));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "PHASEMixer.mm";
            v81 = 1024;
            v82 = 101;
            _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid Spatial Modeler Send Definition Type", buf, 0x12u);
          }
          v17 = 0;
          v10 = v4;
          goto LABEL_56;
        case 1uLL:
          v5 |= 1uLL;
          goto LABEL_10;
        case 2uLL:
        case 5uLL:
          v5 |= 2uLL;
          goto LABEL_10;
        case 3uLL:
        case 4uLL:
          v5 |= 4uLL;
          goto LABEL_10;
        default:
LABEL_10:
          if (v6 != ++v8)
            continue;
          v6 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          if (!v6)
            goto LABEL_12;
          goto LABEL_3;
      }
    }
  }
LABEL_12:

  v10 = -[PHASESpatialPipeline initWithFlags:]([PHASESpatialPipeline alloc], "initWithFlags:", v5);
  if ((-[PHASESpatialPipeline flags](v10, "flags") & 1) != 0)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v11 = v4;
    v12 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if (objc_msgSend(v15, "spatialModelerType") == 1)
          {
            objc_msgSend(v15, "sendLevel");
            v19 = v18;
            -[PHASESpatialPipeline entries](v10, "entries");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSendLevel:", v19);

            objc_msgSend(v15, "sendMetaParameterDefinition");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setSendLevelMetaParameterDefinition:", v22);

            objc_msgSend(v15, "tweakParams");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setTweakParams:", v25);

            goto LABEL_26;
          }
        }
        v12 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_26:

  }
  if ((-[PHASESpatialPipeline flags](v10, "flags") & 2) != 0)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v28 = v4;
    v29 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v65;
      while (2)
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v65 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if (objc_msgSend(v32, "spatialModelerType") == 2 || objc_msgSend(v32, "spatialModelerType") == 5)
          {
            objc_msgSend(v32, "sendLevel");
            v34 = v33;
            -[PHASESpatialPipeline entries](v10, "entries");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setSendLevel:", v34);

            objc_msgSend(v32, "sendMetaParameterDefinition");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setSendLevelMetaParameterDefinition:", v37);

            objc_msgSend(v32, "tweakParams");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setTweakParams:", v40);

            goto LABEL_39;
          }
        }
        v29 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        if (v29)
          continue;
        break;
      }
    }
LABEL_39:

  }
  if ((-[PHASESpatialPipeline flags](v10, "flags") & 4) != 0)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v43 = v4;
    v44 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v61;
      while (2)
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if (objc_msgSend(v47, "spatialModelerType") == 3 || objc_msgSend(v47, "spatialModelerType") == 4)
          {
            objc_msgSend(v47, "sendLevel");
            v49 = v48;
            -[PHASESpatialPipeline entries](v10, "entries");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setSendLevel:", v49);

            objc_msgSend(v47, "sendMetaParameterDefinition");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setSendLevelMetaParameterDefinition:", v52);

            objc_msgSend(v47, "tweakParams");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHASESpatialPipeline entries](v10, "entries");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setTweakParams:", v55);

            goto LABEL_52;
          }
        }
        v44 = -[PHASESpatialPipeline countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        if (v44)
          continue;
        break;
      }
    }
LABEL_52:

  }
  v58 = -[PHASESpatialMixerDefinition initWithSpatialPipeline:](self, "initWithSpatialPipeline:", v10);
  if (v58)
  {
    self = v58;
    v17 = self;
  }
  else
  {
    self = 0;
    v17 = 0;
  }
LABEL_56:

  return v17;
}

- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3 uid:(id)a4
{
  id v6;
  id v7;
  PHASESpatialMixerDefinition *v8;
  PHASESpatialMixerDefinition *v9;
  PHASESpatialMixerDefinition *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PHASESpatialMixerDefinition initWithSpatialModelerSendDefinitions:](self, "initWithSpatialModelerSendDefinitions:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline
{
  PHASESpatialPipeline *v5;
  PHASESpatialMixerDefinition *v6;
  void *v7;
  PHASESpatialModelerSendDefinition *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHASESpatialModelerSendDefinition *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PHASESpatialModelerSendDefinition *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *spatialModelerDefinitions;
  PHASEDistanceModelParameters *distanceModelParameters;
  PHASEDirectivityModelParameters *listenerDirectivityModelParameters;
  PHASEDirectivityModelParameters *sourceDirectivityModelParameters;
  PHASESpatialMixerDefinition *v37;
  objc_super v39;

  v5 = spatialPipeline;
  v39.receiver = self;
  v39.super_class = (Class)PHASESpatialMixerDefinition;
  v6 = -[PHASEMixerDefinition initInternal](&v39, sel_initInternal);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PHASESpatialPipeline flags](v5, "flags") & 1) != 0)
    {
      v8 = -[PHASESpatialModelerSendDefinition initWithSpatialModelerType:]([PHASESpatialModelerSendDefinition alloc], "initWithSpatialModelerType:", 1);
      -[PHASESpatialPipeline entries](v5, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_13;
      -[PHASESpatialPipeline entries](v5, "entries");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendLevel");
      -[PHASESpatialModelerSendDefinition setSendLevel:](v8, "setSendLevel:");

      -[PHASESpatialPipeline entries](v5, "entries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PHASEDirectPathTransmission"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendLevelMetaParameterDefinition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASESpatialModelerSendDefinition setSendMetaParameterDefinition:](v8, "setSendMetaParameterDefinition:", v15);

      objc_msgSend(v7, "addObject:", v8);
    }
    if ((-[PHASESpatialPipeline flags](v5, "flags") & 2) != 0)
    {
      v16 = -[PHASESpatialModelerSendDefinition initWithSpatialModelerType:]([PHASESpatialModelerSendDefinition alloc], "initWithSpatialModelerType:", 2);
      -[PHASESpatialPipeline entries](v5, "entries");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_13;
      -[PHASESpatialPipeline entries](v5, "entries");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendLevel");
      -[PHASESpatialModelerSendDefinition setSendLevel:](v16, "setSendLevel:");

      -[PHASESpatialPipeline entries](v5, "entries");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PHASEEarlyReflections"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendLevelMetaParameterDefinition");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASESpatialModelerSendDefinition setSendMetaParameterDefinition:](v16, "setSendMetaParameterDefinition:", v23);

      objc_msgSend(v7, "addObject:", v16);
    }
    if ((-[PHASESpatialPipeline flags](v5, "flags") & 4) == 0)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v7);
      v32 = objc_claimAutoreleasedReturnValue();
      spatialModelerDefinitions = v6->_spatialModelerDefinitions;
      v6->_spatialModelerDefinitions = (NSArray *)v32;

      objc_storeStrong((id *)&v6->_spatialPipeline, spatialPipeline);
      distanceModelParameters = v6->_distanceModelParameters;
      v6->_distanceModelParameters = 0;

      listenerDirectivityModelParameters = v6->_listenerDirectivityModelParameters;
      v6->_listenerDirectivityModelParameters = 0;

      sourceDirectivityModelParameters = v6->_sourceDirectivityModelParameters;
      v6->_sourceDirectivityModelParameters = 0;

      v6->_listenerDopplerFactor = 1.0;
      v6->_sourceDopplerFactor = 1.0;
      v37 = v6;

      goto LABEL_12;
    }
    v24 = -[PHASESpatialModelerSendDefinition initWithSpatialModelerType:]([PHASESpatialModelerSendDefinition alloc], "initWithSpatialModelerType:", 3);
    -[PHASESpatialPipeline entries](v5, "entries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[PHASESpatialPipeline entries](v5, "entries");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sendLevel");
      -[PHASESpatialModelerSendDefinition setSendLevel:](v24, "setSendLevel:");

      -[PHASESpatialPipeline entries](v5, "entries");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("PHASELateReverb"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sendLevelMetaParameterDefinition");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASESpatialModelerSendDefinition setSendMetaParameterDefinition:](v24, "setSendMetaParameterDefinition:", v31);

      objc_msgSend(v7, "addObject:", v24);
      goto LABEL_11;
    }
LABEL_13:
    std::terminate();
  }
LABEL_12:

  return v6;
}

- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline identifier:(NSString *)identifier
{
  PHASESpatialPipeline *v6;
  NSString *v7;
  PHASESpatialMixerDefinition *v8;
  PHASESpatialMixerDefinition *v9;
  PHASESpatialMixerDefinition *v10;

  v6 = spatialPipeline;
  v7 = identifier;
  v8 = -[PHASESpatialMixerDefinition initWithSpatialPipeline:](self, "initWithSpatialPipeline:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (void)setListenerDopplerFactor:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_listenerDopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);

}

- (void)setSourceDopplerFactor:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sourceDopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);

}

- (PHASESpatialPipeline)spatialPipeline
{
  return self->_spatialPipeline;
}

- (PHASEDistanceModelParameters)distanceModelParameters
{
  return self->_distanceModelParameters;
}

- (void)setDistanceModelParameters:(PHASEDistanceModelParameters *)distanceModelParameters
{
  objc_storeStrong((id *)&self->_distanceModelParameters, distanceModelParameters);
}

- (PHASEDirectivityModelParameters)listenerDirectivityModelParameters
{
  return self->_listenerDirectivityModelParameters;
}

- (void)setListenerDirectivityModelParameters:(PHASEDirectivityModelParameters *)listenerDirectivityModelParameters
{
  objc_storeStrong((id *)&self->_listenerDirectivityModelParameters, listenerDirectivityModelParameters);
}

- (PHASEDirectivityModelParameters)sourceDirectivityModelParameters
{
  return self->_sourceDirectivityModelParameters;
}

- (void)setSourceDirectivityModelParameters:(PHASEDirectivityModelParameters *)sourceDirectivityModelParameters
{
  objc_storeStrong((id *)&self->_sourceDirectivityModelParameters, sourceDirectivityModelParameters);
}

- (double)listenerDopplerFactor
{
  return self->_listenerDopplerFactor;
}

- (double)sourceDopplerFactor
{
  return self->_sourceDopplerFactor;
}

- (NSArray)spatialModelerDefinitions
{
  return self->_spatialModelerDefinitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialModelerDefinitions, 0);
  objc_storeStrong((id *)&self->_sourceDirectivityModelParameters, 0);
  objc_storeStrong((id *)&self->_listenerDirectivityModelParameters, 0);
  objc_storeStrong((id *)&self->_distanceModelParameters, 0);
  objc_storeStrong((id *)&self->_spatialPipeline, 0);
}

@end
