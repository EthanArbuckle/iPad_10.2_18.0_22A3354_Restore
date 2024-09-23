@implementation SGMultiHeadEspressoModel

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SGMultiHeadEspressoModel;
  -[SGMultiHeadEspressoModel dealloc](&v3, sel_dealloc);
}

- (SGMultiHeadEspressoModel)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputName:(id)a6 inputNumParameters:(unint64_t)a7 headDimensionality:(id)a8
{
  uint64_t v10;
  void *var0;
  id v15;
  id v16;
  SGMultiHeadEspressoModel *v17;
  SGMultiHeadEspressoModel *v18;
  objc_super v20;

  v10 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v15 = a6;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SGMultiHeadEspressoModel;
  v17 = -[SGMultiHeadEspressoModel init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_espressoPlan = a4;
    v17->_espressoContext = a3;
    v17->_espressoModel.plan = var0;
    *(_QWORD *)&v17->_espressoModel.network_index = v10;
    objc_storeStrong((id *)&v17->_inputName, a6);
    v18->_inputNumParameters = a7;
    objc_storeStrong((id *)&v18->_headDimensionality, a8);
  }

  return v18;
}

- (unint64_t)inputNumParameters
{
  return self->_inputNumParameters;
}

- (id)headDimensionality
{
  return self->_headDimensionality;
}

- (id)predict:(id)a3 heads:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSString *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSString *v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  __int128 v28;
  unint64_t v29;
  char v30;
  uint8_t *v31;
  id v32;
  int v33;
  int v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  int v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  NSString *inputName;
  __int128 v53;
  id v54;
  void *v55;
  void *context;
  void *contexta;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[4];
  id v63;
  __int16 v64;
  int v65;
  uint8_t buf[4];
  NSString *v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v55 = v6;
    v8 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v54 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          v14 = *(NSString **)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_headDimensionality, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            sgLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v14;
              _os_log_impl(&dword_21ABF4000, v16, OS_LOG_TYPE_INFO, "Could not validate existence of head %@ in model", buf, 0xCu);
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v17 = objc_msgSend(v8, "count");
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17 >= 9)
      {
        v6 = v55;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = v20;
          v68 = 2048;
          v69 = 8;
          _os_log_fault_impl(&dword_21ABF4000, v19, OS_LOG_TYPE_FAULT, "Running inference on heads %@ but max heads for inference is %lu", buf, 0x16u);

        }
LABEL_29:
        v21 = 0;
        goto LABEL_30;
      }
      v6 = v55;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v22;
        _os_log_impl(&dword_21ABF4000, v19, OS_LOG_TYPE_INFO, "Running multi-head inference on heads %@", buf, 0xCu);

      }
      v19 = objc_opt_new();
      v23 = (void *)MEMORY[0x220753E80]();
      -[NSString cStringUsingEncoding:](self->_inputName, "cStringUsingEncoding:", 4);
      v24 = espresso_network_bind_buffer();
      if (v24)
      {
        v25 = v24;
        sgLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          inputName = self->_inputName;
          *(_DWORD *)buf = 138412546;
          v67 = inputName;
          v68 = 1024;
          LODWORD(v69) = v25;
          _os_log_fault_impl(&dword_21ABF4000, v26, OS_LOG_TYPE_FAULT, "Could not bind the input buffer to layer %@ in espresso plan, status code %d", buf, 0x12u);
        }

        objc_autoreleasePoolPop(v23);
        goto LABEL_29;
      }
      objc_msgSend(v55, "sparseVectorToDense:length:", 0, self->_inputNumParameters);
      bzero(buf, 0x540uLL);
      if (objc_msgSend(v8, "count"))
      {
        context = v23;
        v29 = 0;
        v30 = 0;
        v31 = buf;
        *(_QWORD *)&v28 = 138412546;
        v53 = v28;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v29, v53);
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v32, "cStringUsingEncoding:", 4);
          v33 = espresso_network_bind_buffer();
          if (v33)
          {
            v34 = v33;
            sgLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v62 = v53;
              v63 = v32;
              v64 = 1024;
              v65 = v34;
              _os_log_fault_impl(&dword_21ABF4000, v35, OS_LOG_TYPE_FAULT, "Could not bind the output buffer to layer %@ in espresso plan, status code %d", v62, 0x12u);
            }

            v30 = 1;
          }
          v36 = objc_alloc(MEMORY[0x24BDBCEB8]);
          -[NSDictionary objectForKeyedSubscript:](self->_headDimensionality, "objectForKeyedSubscript:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithCapacity:", objc_msgSend(v37, "unsignedIntegerValue"));
          -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v38, v32);

          ++v29;
          v31 += 168;
        }
        while (v29 < objc_msgSend(v8, "count"));
        v23 = context;
        if ((v30 & 1) != 0)
        {
          sgLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          v7 = v54;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v62 = 0;
            _os_log_fault_impl(&dword_21ABF4000, v39, OS_LOG_TYPE_FAULT, "Could not bind output buffer to network given output names", v62, 2u);
          }
LABEL_47:

          objc_autoreleasePoolPop(v23);
          v21 = 0;
          goto LABEL_31;
        }
      }
      v40 = espresso_plan_execute_sync();
      if (v40)
      {
        v41 = v40;
        sgLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v62 = 67109120;
          LODWORD(v63) = v41;
          _os_log_fault_impl(&dword_21ABF4000, v39, OS_LOG_TYPE_FAULT, "Could not execute espresso plan, status code %d", v62, 8u);
        }
        v7 = v54;
        goto LABEL_47;
      }
      contexta = v23;
      if (objc_msgSend(v8, "count"))
      {
        v42 = 0;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_headDimensionality, "objectForKeyedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "unsignedIntegerValue");

          if (v45)
          {
            v47 = 0;
            do
            {
              LODWORD(v46) = *(_DWORD *)(*(_QWORD *)&buf[168 * v42] + 4 * v47);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v43);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:atIndexedSubscript:", v48, v47);

              ++v47;
              -[NSDictionary objectForKeyedSubscript:](self->_headDimensionality, "objectForKeyedSubscript:", v43);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "unsignedIntegerValue");

            }
            while (v47 < v51);
          }

          ++v42;
        }
        while (v42 < objc_msgSend(v8, "count"));
      }
      objc_autoreleasePoolPop(contexta);
      v19 = v19;
      v21 = v19;
    }
    else
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_21ABF4000, v19, OS_LOG_TYPE_FAULT, "No available heads were found for inference", buf, 2u);
      }
      v21 = 0;
    }
    v6 = v55;
LABEL_30:
    v7 = v54;
LABEL_31:

    goto LABEL_32;
  }
  v21 = MEMORY[0x24BDBD1B8];
LABEL_32:

  return v21;
}

- (id)predict:(id)a3
{
  NSDictionary *headDimensionality;
  id v5;
  void *v6;
  void *v7;

  headDimensionality = self->_headDimensionality;
  v5 = a3;
  -[NSDictionary allKeys](headDimensionality, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMultiHeadEspressoModel predict:heads:](self, "predict:heads:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

+ (id)makeStringForShape:(unint64_t)a3[10]
{
  void *v4;
  uint64_t i;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR("{"));
  for (i = 0; i != 10; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR(" %zu"), a3[i]);
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  return v4;
}

+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4
{
  unint64_t v4;
  unint64_t result;
  uint64_t v6;

  if (!a4)
    return 0;
  v4 = 10;
  if (a4 < 0xA)
    v4 = a4;
  result = 1;
  do
  {
    v6 = *a3++;
    result *= v6;
    --v4;
  }
  while (v4);
  return result;
}

+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t plan;
  uint64_t v13;
  id v14;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  int v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  int v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  int v36;
  SGMultiHeadEspressoModel *v37;
  id v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  int v44;
  NSObject *v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  id v57;
  int v58;
  int v59;
  NSObject *v60;
  uint64_t v61;
  int v62;
  int v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  uint32_t v67;
  unint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  SGMultiHeadEspressoModel *v73;
  void *v74;
  unint64_t v75;
  id v76;
  void *context;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  uint8_t v97[4];
  id v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  unint64_t v102;
  __int16 v103;
  unint64_t v104;
  uint8_t v105[32];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t v109[32];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  _BYTE v119[128];
  _BYTE v120[80];
  uint8_t buf[32];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = espresso_create_context();
  if (!v10)
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v18 = "Could not create espresso context";
LABEL_10:
    v19 = v17;
    v20 = 2;
    goto LABEL_11;
  }
  v11 = v10;
  plan = espresso_create_plan();
  if (!plan)
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v18 = "Could not create espresso plan";
    goto LABEL_10;
  }
  v13 = plan;
  v84 = v11;
  v95 = 0;
  v96 = 0;
  v14 = objc_retainAutorelease(v7);
  objc_msgSend(v14, "UTF8String");
  v15 = espresso_plan_add_network();
  if (v15)
  {
    v16 = v15;
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 65568;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      v18 = "Could not add espresso network from file %@ with storage type %05x, status code %d";
      v19 = v17;
      v20 = 24;
LABEL_11:
      _os_log_fault_impl(&dword_21ABF4000, v19, OS_LOG_TYPE_FAULT, v18, buf, v20);
    }
LABEL_32:

LABEL_33:
    v37 = 0;
    goto LABEL_34;
  }
  v83 = v13;
  v21 = objc_retainAutorelease(v8);
  objc_msgSend(v21, "cStringUsingEncoding:", 4);
  v22 = espresso_network_declare_input();
  if (v22)
  {
    v23 = v22;
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_32;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23;
    v18 = "Could not declare espresso network input %@, status code %d";
    v19 = v17;
    v20 = 18;
    goto LABEL_11;
  }
  v94 = 0u;
  v92 = 0u;
  v93 = 0u;
  v91 = 0u;
  v24 = v9;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v131, 16);
  if (v25)
  {
    v26 = v25;
    v79 = v7;
    v81 = v9;
    v27 = 0;
    v28 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v92 != v28)
          objc_enumerationMutation(v24);
        v30 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i));
        objc_msgSend(v30, "cStringUsingEncoding:", 4);
        v31 = espresso_network_declare_output();
        if (v31)
        {
          v32 = v31;
          sgLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_fault_impl(&dword_21ABF4000, v33, OS_LOG_TYPE_FAULT, "Could not declare espresso network output %@, status code %d", buf, 0x12u);
          }

          v27 = 1;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v131, 16);
    }
    while (v26);

    v7 = v79;
    v9 = v81;
    if ((v27 & 1) != 0)
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v18 = "Espresso multi head model did not have all declared heads";
      goto LABEL_10;
    }
  }
  else
  {

  }
  v34 = v83;
  v35 = espresso_plan_build();
  if (v35)
  {
    v36 = v35;
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_32;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v36;
    v18 = "Could not build espresso plan, status code %d";
    v19 = v17;
    v20 = 8;
    goto LABEL_11;
  }
  context = (void *)MEMORY[0x220753E80]();
  v130 = 0;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  memset(buf, 0, sizeof(buf));
  v39 = objc_retainAutorelease(v21);
  objc_msgSend(v39, "cStringUsingEncoding:", 4);
  v40 = espresso_network_bind_buffer();
  if (v40)
  {
    v41 = v40;
    sgLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v109 = 138412546;
      *(_QWORD *)&v109[4] = v39;
      *(_WORD *)&v109[12] = 1024;
      *(_DWORD *)&v109[14] = v41;
      _os_log_fault_impl(&dword_21ABF4000, v42, OS_LOG_TYPE_FAULT, "Could not bind the input buffer to layer %@ in espresso plan during initialization, status code %d", v109, 0x12u);
    }

    objc_autoreleasePoolPop(context);
    goto LABEL_33;
  }
  v90 = 0;
  memset(v120, 0, sizeof(v120));
  v43 = espresso_buffer_unpack_tensor_shape();
  if (v43)
  {
    v44 = v43;
    v82 = v9;
    sgLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v109 = 138412546;
      *(_QWORD *)&v109[4] = v39;
      *(_WORD *)&v109[12] = 1024;
      *(_DWORD *)&v109[14] = v44;
      _os_log_fault_impl(&dword_21ABF4000, v45, OS_LOG_TYPE_FAULT, "Unable to get input shape to layer %@ in espresso plan during initialization, status code %d", v109, 0x12u);
    }
    v46 = context;
    goto LABEL_43;
  }
  v76 = v39;
  v78 = v8;
  v80 = v7;
  v47 = +[SGMultiHeadEspressoModel getNumParametersFromShape:rank:](SGMultiHeadEspressoModel, "getNumParametersFromShape:rank:", v120, v90);
  sgLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    +[SGMultiHeadEspressoModel makeStringForShape:](SGMultiHeadEspressoModel, "makeStringForShape:", v120);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v109 = 138413058;
    *(_QWORD *)&v109[4] = v76;
    *(_WORD *)&v109[12] = 2048;
    *(_QWORD *)&v109[14] = v90;
    *(_WORD *)&v109[22] = 2112;
    *(_QWORD *)&v109[24] = v74;
    LOWORD(v110) = 2048;
    *(_QWORD *)((char *)&v110 + 2) = v47;
    _os_log_debug_impl(&dword_21ABF4000, v48, OS_LOG_TYPE_DEBUG, "Input layer %@ has rank %zu, shape %@, num parameters %tu", v109, 0x2Au);

  }
  v75 = v47;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v49 = v24;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v119, 16);
  if (!v50)
  {

    goto LABEL_75;
  }
  v51 = v50;
  v82 = v9;
  v52 = 0;
  v53 = *(_QWORD *)v87;
  do
  {
    for (j = 0; j != v51; ++j)
    {
      if (*(_QWORD *)v87 != v53)
        objc_enumerationMutation(v49);
      v55 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
      objc_msgSend(v49, "objectForKeyedSubscript:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      memset(v109, 0, sizeof(v109));
      v57 = objc_retainAutorelease(v55);
      objc_msgSend(v57, "cStringUsingEncoding:", 4);
      v58 = espresso_network_bind_buffer();
      if (!v58)
      {
        v61 = v53;
        v107 = 0u;
        v108 = 0u;
        v106 = 0u;
        memset(v105, 0, sizeof(v105));
        v62 = espresso_buffer_unpack_tensor_shape();
        if (v62)
        {
          v63 = v62;
          sgLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v97 = 138412546;
            v98 = v57;
            v99 = 1024;
            LODWORD(v100) = v63;
            v65 = v64;
            v66 = "Unable to get output shape to layer %@ in espresso plan during initialization, status code %d";
            v67 = 18;
            goto LABEL_64;
          }
          goto LABEL_65;
        }
        v85 = v52;
        v68 = +[SGMultiHeadEspressoModel getNumParametersFromShape:rank:](SGMultiHeadEspressoModel, "getNumParametersFromShape:rank:", v105, 0);
        v69 = objc_msgSend(v56, "unsignedIntegerValue");
        sgLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        v64 = v70;
        if (v69 == v68)
        {
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            +[SGMultiHeadEspressoModel makeStringForShape:](SGMultiHeadEspressoModel, "makeStringForShape:", v105);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v97 = 138413058;
            v98 = v57;
            v99 = 2048;
            v100 = 0;
            v101 = 2112;
            v102 = (unint64_t)v72;
            v103 = 2048;
            v104 = v68;
            _os_log_debug_impl(&dword_21ABF4000, v64, OS_LOG_TYPE_DEBUG, "Output layer %@ has rank %zu, shape %@, num parameters %tu", v97, 0x2Au);

          }
          v52 = v85;
        }
        else
        {
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
          {
            v71 = objc_msgSend(v56, "unsignedIntegerValue");
            *(_DWORD *)v97 = 138412802;
            v98 = v57;
            v99 = 2048;
            v100 = v71;
            v101 = 2048;
            v102 = v68;
            v65 = v64;
            v66 = "Output layer %@ has expected dimensionality %lu but has actual dimensionality %lu";
            v67 = 32;
LABEL_64:
            _os_log_fault_impl(&dword_21ABF4000, v65, OS_LOG_TYPE_FAULT, v66, v97, v67);
          }
LABEL_65:
          v52 = 1;
        }

        v53 = v61;
        goto LABEL_67;
      }
      v59 = v58;
      sgLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v105 = 138412546;
        *(_QWORD *)&v105[4] = v57;
        *(_WORD *)&v105[12] = 1024;
        *(_DWORD *)&v105[14] = v59;
        _os_log_fault_impl(&dword_21ABF4000, v60, OS_LOG_TYPE_FAULT, "Could not bind the output buffer to layer %@ in espresso plan during initialization, status code %d", v105, 0x12u);
      }

      v52 = 1;
LABEL_67:

    }
    v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v119, 16);
  }
  while (v51);

  v9 = v82;
  v34 = v83;
  if ((v52 & 1) == 0)
  {
LABEL_75:
    objc_autoreleasePoolPop(context);
    v73 = [SGMultiHeadEspressoModel alloc];
    v37 = -[SGMultiHeadEspressoModel initWithEspressoContext:espressoPlan:espressoModel:inputName:inputNumParameters:headDimensionality:](v73, "initWithEspressoContext:espressoPlan:espressoModel:inputName:inputNumParameters:headDimensionality:", v84, v34, v95, v96, v76, v75, v49);
    v8 = v78;
    v7 = v80;
    goto LABEL_34;
  }
  sgLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  v8 = v78;
  v46 = context;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v109 = 0;
    _os_log_fault_impl(&dword_21ABF4000, v45, OS_LOG_TYPE_FAULT, "Espresso multi head model output dimensionality did not match that expected", v109, 2u);
  }
  v7 = v80;
LABEL_43:

  objc_autoreleasePoolPop(v46);
  v37 = 0;
  v9 = v82;
LABEL_34:

  return v37;
}

@end
