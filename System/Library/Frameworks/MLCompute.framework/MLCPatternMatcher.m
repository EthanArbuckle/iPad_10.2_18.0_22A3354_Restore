@implementation MLCPatternMatcher

+ (BOOL)canTransformToReLUNFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 alpha:(float *)a6 beta:(float *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  BOOL v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  float v54;
  float v55;
  unsigned int v56;
  void *v57;
  float v58;
  float v59;
  float v60;
  float v61;
  void *v62;
  float v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  float *v69;
  uint64_t v70;
  void *v71;
  float v72;
  float v73;
  void *v74;
  float v75;
  float v76;
  void *v77;
  float v78;
  void *v79;
  void *v80;
  float v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char isKindOfClass;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  float v95;
  float v96;
  void *v97;
  int v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  float *v105;
  float *v106;
  float *v107;
  float *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  int v112;
  char v113;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(a1, "isActivationLayer:withActivationType:", v12, 1);
  v17 = v12;
  if (v15 && objc_msgSend(v14, "count") != 3)
  {
    if (v16 && objc_msgSend(v14, "count") == 4)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v110 = 2;
      goto LABEL_15;
    }
LABEL_19:
    v35 = 0;
    v28 = v17;
    goto LABEL_63;
  }
  if (!v16)
  {
    if ((objc_msgSend(a1, "isActivationLayer:withActivationType:", v17, 2) & 1) != 0)
    {
      v110 = 1;
      v28 = v17;
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  objc_msgSend(v17, "sourceTensors");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") != 1)
  {
LABEL_24:
    v35 = 0;
    v28 = v17;
LABEL_62:

    goto LABEL_63;
  }
  v111 = v16;
  v105 = a7;
  objc_msgSend(v17, "sourceTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "parentLayers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") != 1)
  {
LABEL_23:

    goto LABEL_24;
  }
  v103 = v15;
  objc_msgSend(v17, "resultTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 1)
  {

    goto LABEL_23;
  }
  v99 = a1;
  v101 = v13;
  objc_msgSend(v17, "resultTensors");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "childLayers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v24, "count");

  if (v109 != 1)
  {
    v35 = 0;
    v28 = v17;
    v13 = v101;
    goto LABEL_63;
  }
  objc_msgSend(v17, "resultTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "childLayers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  a1 = v99;
  if ((objc_msgSend(v99, "isActivationLayer:withActivationType:", v18, 2) & 1) == 0)
  {
    v35 = 0;
    v28 = v17;
    v13 = v101;
    goto LABEL_62;
  }
  v110 = 1;
  v13 = v101;
  v15 = v103;
  a7 = v105;
  v16 = v111;
LABEL_15:

  v28 = v18;
LABEL_16:
  *a6 = 0.0;
  objc_msgSend(a1, "getAccuracyForLayer:", v17);
  v30 = v29;
  objc_msgSend(v28, "descriptor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "a");
  if (fabsf(v31 + 1.0) > v30)
    goto LABEL_61;
  v112 = v16;
  objc_msgSend(v28, "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "b");
  v34 = fabsf(v33);

  if (v34 <= v30)
  {
    if (v112)
    {
      v18 = v17;
    }
    else
    {
      objc_msgSend(v28, "sourceTensors");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count") != 1)
        goto LABEL_61;
      v104 = v15;
      v106 = a7;
      v36 = a1;
      objc_msgSend(v28, "sourceTensors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "parentLayers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      if (v40 != 1)
        goto LABEL_18;
      objc_msgSend(v28, "sourceTensors");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "parentLayers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "fusedLayers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

      if (v45)
      {
        objc_msgSend(v18, "fusedLayers");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastObject");
        v47 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v47;
      }
      a1 = v36;
      v15 = v104;
      a7 = v106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v18, "operation"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v107 = a7;
        v48 = v15;
        v49 = a1;
        v50 = v18;
        v18 = v18;
        objc_msgSend(v18, "descriptor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "activationType");

        switch(v52)
        {
          case 1:
            objc_msgSend(v18, "descriptor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "a");
            v55 = v54;
            goto LABEL_47;
          case 3:
          case 4:
          case 6:
            goto LABEL_49;
          case 9:
            objc_msgSend(v18, "descriptor");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "a");
            v59 = v58;

            if (v59 <= 0.0)
              goto LABEL_49;
            goto LABEL_48;
          case 10:
            objc_msgSend(v18, "descriptor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "a");
            if (v60 > 0.0)
              goto LABEL_44;
            goto LABEL_46;
          case 17:
            objc_msgSend(v18, "descriptor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "a");
            if (v61 < 0.0)
            {
LABEL_44:

LABEL_48:
              goto LABEL_61;
            }
LABEL_46:
            objc_msgSend(v18, "descriptor");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "b");
            v55 = v63;

LABEL_47:
            if (v55 < 0.0)
              goto LABEL_48;
LABEL_49:

            a1 = v49;
            v15 = v48;
            a7 = v107;
            v18 = v50;
            break;
          default:
            goto LABEL_48;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_61;
        v56 = objc_msgSend(v18, "operation");
        v35 = 0;
        if (v56 > 0x17 || ((1 << v56) & 0xC10180) == 0)
          goto LABEL_62;
      }
    }
    v64 = a1;
    objc_msgSend(v28, "resultTensors");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");

    if (v66 == 1)
    {
      if (v15)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:");
        v67 = objc_claimAutoreleasedReturnValue();

        ++v110;
        v28 = (void *)v67;
      }
      else
      {
        v102 = v18;
        objc_msgSend(v28, "resultTensors");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v84, "childLayers");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v85, "count") != 1)
        {
LABEL_74:

          goto LABEL_75;
        }
        v108 = a7;
        objc_msgSend(v84, "childLayers");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_75:

          goto LABEL_76;
        }
        if (v112)
          objc_msgSend(v14, "addObject:", v28);
        objc_msgSend(v84, "childLayers");
        v89 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v89, "objectAtIndexedSubscript:", 0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addObject:", v79);
        LOBYTE(v89) = objc_msgSend(v79, "skipLayer");

        v15 = 0;
        a7 = v108;
        if ((v89 & 1) != 0)
          goto LABEL_69;
        v28 = v79;
        v18 = v102;
      }
      objc_msgSend(v28, "descriptor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "activationType") != 17)
      {
LABEL_60:

        goto LABEL_61;
      }
      v102 = v18;
      v69 = a7;
      v70 = v15;
      objc_msgSend(v28, "descriptor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "a");
      v73 = v72;
      objc_msgSend(v28, "descriptor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "b");
      v76 = vabds_f32(v73, v75);

      if (v76 >= v30)
      {
LABEL_76:
        v35 = 0;
        v18 = v102;
        goto LABEL_62;
      }
      objc_msgSend(v28, "descriptor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "b");
      *v69 = -v78;

      if (v70)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v110);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_57;
      }
      objc_msgSend(v28, "resultTensors");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v84, "childLayers");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v85, "count") == 1)
      {
        objc_msgSend(v84, "childLayers");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v113 = objc_opt_isKindOfClass();

        if ((v113 & 1) != 0)
        {
          objc_msgSend(v84, "childLayers");
          v93 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v93, "objectAtIndexedSubscript:", 0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v79);
          LOBYTE(v93) = objc_msgSend(v79, "skipLayer");

          if ((v93 & 1) == 0)
          {
LABEL_57:
            v28 = v79;
            objc_msgSend(v79, "descriptor");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v102;
            if (objc_msgSend(v68, "activationType") == 2)
            {
              objc_msgSend(v28, "descriptor");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "a");
              if (fabsf(v81 + 1.0) <= v30)
              {
                objc_msgSend(v28, "descriptor");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "b");
                v96 = fabsf(v95);

                if (v96 <= v30)
                {
                  if (v70
                    || (v97 = (void *)objc_msgSend(v14, "mutableCopy"),
                        objc_msgSend(v97, "insertObject:atIndex:", v17, 0),
                        v98 = objc_msgSend(v64, "checkIntermediateTensorsOfFusedLayers:stopGradientTensorList:forPattern:", v97, v13, CFSTR("ReLUN")), v97, v98))
                  {
                    v35 = 1;
                    goto LABEL_62;
                  }
                }
                goto LABEL_61;
              }

            }
            goto LABEL_60;
          }
LABEL_69:
          v35 = 0;
          v18 = v102;
          v28 = v79;
          goto LABEL_62;
        }
        goto LABEL_75;
      }
      goto LABEL_74;
    }
LABEL_61:
    v35 = 0;
    goto LABEL_62;
  }
LABEL_18:
  v35 = 0;
LABEL_63:

  return v35;
}

+ (BOOL)canTransformToHardSwishFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  id v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  char v55;
  void *v56;
  char v57;
  char v58;
  id v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  uint64_t v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  char v100;
  char v101;
  BOOL v102;
  char v103;
  void *v104;
  id v105;
  uint64_t v106;
  char v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "count");
  v14 = v13 == 0;
  if (v13)
  {
    if (objc_msgSend(v12, "count") != 4 && objc_msgSend(v12, "count") != 6)
      goto LABEL_12;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = 1;
    v10 = (id)v15;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(a1, "getAccuracyForLayer:", v10);
  v18 = v17;
  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 0)
    || (v106 = v16,
        objc_msgSend(v10, "sourceTensors"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "count"),
        v19,
        v20 != 2))
  {
LABEL_12:
    v33 = 0;
    goto LABEL_92;
  }
  if (v13)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v106);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "sourceTensors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v98 = v12;
  v34 = *a6;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  objc_msgSend(v10, "sourceTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  if (!v36)
  {

    v33 = 0;
    v105 = objc_retainAutorelease(v34);
    *a6 = v105;
    goto LABEL_80;
  }
  v39 = v36;
  v102 = v13 == 0;
  v95 = v11;
  v40 = 0;
  v41 = *(_QWORD *)v118;
  do
  {
    for (i = 0; i != v39; ++i)
    {
      if (*(_QWORD *)v118 != v41)
        objc_enumerationMutation(v35);
      v43 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
      LODWORD(v37) = 3.0;
      *(float *)&v38 = v18;
      if ((objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v43, v37, v38) & 1) != 0)
      {
        v40 = 1;
      }
      else
      {
        v44 = v43;

        v34 = v44;
      }
    }
    v39 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  }
  while (v39);

  v105 = objc_retainAutorelease(v34);
  *a6 = v105;
  v11 = v95;
  if ((v40 & 1) == 0)
    goto LABEL_79;
  objc_msgSend(v10, "resultTensors");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count") != 1)
  {

    goto LABEL_79;
  }
  objc_msgSend(v10, "resultTensors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "childLayers");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  if (v49 != 1)
  {
LABEL_79:
    v33 = 0;
    goto LABEL_80;
  }
  objc_msgSend(v98, "addObject:", v10);
  objc_msgSend(v10, "resultTensors");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "childLayers");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v21, "skipLayer") & 1) != 0)
  {
    v33 = 0;
    v10 = v21;
LABEL_80:
    v12 = v98;
    goto LABEL_91;
  }
  v13 = 0;
  v12 = v98;
  v23 = (uint64_t)v105;
  v14 = v102;
LABEL_10:
  v105 = (id)v23;
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v108 = v21;
  if (objc_msgSend(a1, "isActivationLayer:withActivationType:", v21, 10))
  {
    v25 = v21;
    objc_msgSend(v25, "descriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "a");
    v28 = v27;

    objc_msgSend(v25, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "b");
    v31 = v30;

    objc_msgSend(v24, "addObject:", v25);
    v32 = v31 + -6.0;
  }
  else
  {
    v32 = -7.0;
    v28 = -1.0;
  }
  v33 = 0;
  if (fabsf(v28) >= v18 || fabsf(v32) >= v18)
    goto LABEL_90;
  if (!v13)
  {
    objc_msgSend(v12, "addObjectsFromArray:", v24);
    objc_msgSend(v21, "resultTensors");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v84, "count") != 1)
    {

      v33 = 0;
      goto LABEL_90;
    }
    v103 = v14;
    v94 = v24;
    v96 = v11;
    v85 = v12;
    objc_msgSend(v21, "resultTensors");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "childLayers");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");

    if (v89 == 1)
    {
      objc_msgSend(v21, "resultTensors");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "childLayers");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v53, "skipLayer") & 1) == 0)
      {
        v12 = v85;
        v13 = 0;
        goto LABEL_33;
      }
      v33 = 0;
      v108 = v53;
    }
    else
    {
      v33 = 0;
    }
    v12 = v85;
    goto LABEL_89;
  }
  v103 = v14;
  v94 = v24;
  v96 = v11;
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") + v106);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  v54 = 0;
  v55 = 1;
  v56 = v53;
  v57 = 1;
  v58 = 1;
  v59 = v105;
  v97 = v13;
  v99 = v12;
  while (1)
  {
    while (1)
    {
      v107 = v55;
      v100 = v54;
      if ((v58 & 1) != 0 && objc_msgSend(a1, "isArithmeticLayer:withOperation:", v56, 3))
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        objc_msgSend(v56, "sourceTensors");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
        if (v61)
        {
          v64 = v61;
          v65 = *(_QWORD *)v114;
          while (2)
          {
            for (j = 0; j != v64; ++j)
            {
              if (*(_QWORD *)v114 != v65)
                objc_enumerationMutation(v60);
              LODWORD(v62) = 6.0;
              *(float *)&v63 = v18;
              if ((objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j), v62, v63) & 1) != 0)
              {
                v58 = 0;
                v59 = v105;
                goto LABEL_64;
              }
            }
            v64 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
            if (v64)
              continue;
            break;
          }
        }
        v108 = v56;

        goto LABEL_87;
      }
      v108 = v56;
      if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v56, 2))
        goto LABEL_87;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      objc_msgSend(v56, "sourceTensors");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
      if (v67)
      {
        v70 = v67;
        v71 = *(_QWORD *)v110;
LABEL_48:
        v72 = 0;
        while (1)
        {
          if (*(_QWORD *)v110 != v71)
            objc_enumerationMutation(v60);
          if ((v57 & (*(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v72) == (_QWORD)v59)) != 0)
          {
            v57 = 0;
            goto LABEL_63;
          }
          if ((v58 & 1) != 0)
          {
            LODWORD(v68) = 1042983595;
            *(float *)&v69 = v18;
            if ((objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v68, v69) & 1) != 0)
              break;
          }
          if (v70 == ++v72)
          {
            v70 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
            if (v70)
              goto LABEL_48;
            goto LABEL_56;
          }
        }
        v58 = 0;
LABEL_63:
        v56 = v108;
LABEL_64:

        if (v13)
          goto LABEL_58;
        break;
      }
LABEL_56:

      v56 = v108;
      if ((v103 & 1) == 0)
        goto LABEL_87;
      if (!v13)
        break;
LABEL_58:
      objc_msgSend(v12, "lastObject");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0;
      v54 = 1;
      v56 = v73;
      v103 = 1;
      if ((v107 & 1) == 0)
        goto LABEL_71;
    }
    objc_msgSend(v56, "resultTensors");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "count") != 1)
    {
      v108 = v56;

LABEL_87:
      v33 = 0;
      goto LABEL_88;
    }
    objc_msgSend(v56, "resultTensors");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "childLayers");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v107 & (objc_msgSend(v77, "count") != 1)) != 0)
    {
      v108 = v56;

      goto LABEL_95;
    }
    objc_msgSend(v56, "resultTensors");
    v104 = v74;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "childLayers");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v100 & ((unint64_t)objc_msgSend(v80, "count") > 1);

    if ((v101 & 1) != 0)
      break;
    v12 = v99;
    objc_msgSend(v99, "addObject:", v56);
    objc_msgSend(v56, "resultTensors");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "childLayers");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "lastObject");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v73, "skipLayer") & 1) != 0)
      goto LABEL_83;
    v55 = 0;
    v54 = 1;
    v56 = v73;
    v103 = 1;
    v13 = v97;
    v59 = v105;
    if ((v107 & 1) == 0)
    {
      if (objc_msgSend(a1, "checkIntermediateTensorsOfFusedLayers:stopGradientTensorList:forPattern:", v99, v96, CFSTR("Hardswish")))LABEL_71:v33 = 1;
      else
LABEL_83:
        v33 = 0;
      v108 = v73;
LABEL_88:
      v11 = v96;
      goto LABEL_89;
    }
  }
  v108 = v56;
LABEL_95:
  v33 = 0;
  v11 = v96;
  v12 = v99;
LABEL_89:
  v24 = v94;
LABEL_90:

  v10 = v108;
LABEL_91:

LABEL_92:
  return v33;
}

+ (BOOL)canTransformToGELUFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v54;
  id v55;
  id v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "count");
  objc_msgSend(a1, "getAccuracyForLayer:", v10);
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = 1;
    v10 = (id)v16;
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
  {
    objc_msgSend(v10, "sourceTensors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ++v17;
    }
    else
    {
      v55 = v11;
      if (a6)
        *a6 = objc_retainAutorelease(v19);
      objc_msgSend(v12, "addObject:", v10);
      objc_msgSend(v10, "sourceTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = v19;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "parentLayers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v23;
      v10 = v22;
      v11 = v55;
    }

    if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v20, 2))
      goto LABEL_28;
    objc_msgSend(v20, "sourceTensors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 0.5;
    LODWORD(v29) = v15;
    v21 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v27, v28, v29);

    if (v21)
    {
      if (v13)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        ++v17;
      }
      else
      {
        objc_msgSend(v12, "addObject:", v20);
        objc_msgSend(v20, "sourceTensors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "parentLayers");
        v56 = v11;
        v33 = v19;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v33;
        v11 = v56;

        v20 = v31;
      }

      if (objc_msgSend(a1, "isArithmeticLayer:withOperation:", v30, 0))
      {
        objc_msgSend(v30, "sourceTensors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v37) = 1.0;
        LODWORD(v38) = v15;
        v21 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v36, v37, v38);

        if (v21)
        {
          if (v13)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(a1, "isActivationLayer:withActivationType:", v20, 5) & 1) != 0)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v17 + 1);
              v39 = objc_claimAutoreleasedReturnValue();

              v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              objc_msgSend(v12, "subarrayWithRange:", v17 + 2, objc_msgSend(v12, "count") - (v17 + 2));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = (void *)objc_msgSend(v41, "mutableCopy");

              LODWORD(v43) = v15;
              if ((objc_msgSend(a1, "canTransformToGELUType1FromLayer:fusedLayers:inputTensor:withAccuracy:", v39, v42, v19, v43) & 1) == 0)
              {
                LODWORD(v44) = v15;
                if ((objc_msgSend(a1, "canTransformToGELUType2FromLayer:fusedLayers:inputTensor:withAccuracy:", v39, v42, v19, v44) & 1) == 0)goto LABEL_34;
              }
LABEL_33:
              LOBYTE(v21) = 1;
LABEL_35:

              v20 = (void *)v39;
              goto LABEL_29;
            }
            goto LABEL_28;
          }
          objc_msgSend(v12, "addObject:", v30);
          objc_msgSend(v30, "sourceTensors");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "parentLayers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(a1, "isActivationLayer:withActivationType:", v20, 5) & 1) != 0)
          {
            objc_msgSend(v12, "addObject:", v20);
            objc_msgSend(v20, "sourceTensors");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "parentLayers");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "lastObject");
            v39 = objc_claimAutoreleasedReturnValue();

            v51 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            LODWORD(v52) = v15;
            if ((objc_msgSend(a1, "canTransformToGELUType1FromLayer:fusedLayers:inputTensor:withAccuracy:", v39, v51, v19, v52) & 1) != 0)
            {
              v42 = v51;
            }
            else
            {
              v42 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");

              LODWORD(v54) = v15;
              if ((objc_msgSend(a1, "canTransformToGELUType2FromLayer:fusedLayers:inputTensor:withAccuracy:", v39, v42, v19, v54) & 1) == 0)goto LABEL_34;
            }
            objc_msgSend(v12, "addObjectsFromArray:", v42);
            if (objc_msgSend(a1, "checkIntermediateTensorsOfFusedLayers:stopGradientTensorList:forPattern:", v12, v11, CFSTR("GELU")))goto LABEL_33;
LABEL_34:
            LOBYTE(v21) = 0;
            goto LABEL_35;
          }
LABEL_28:
          LOBYTE(v21) = 0;
          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v21) = 0;
      }
      v20 = v30;
    }
LABEL_29:

    v10 = v20;
    goto LABEL_30;
  }
  LOBYTE(v21) = 0;
LABEL_30:

  return v21;
}

+ (float)getAccuracyForLayer:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  float v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "sourceTensors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.00000001;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        v9 = v7;
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "dataType");

        if (v11 == 3)
        {
          v7 = fminf(v7, 0.0001);
        }
        else
        {
          v7 = 0.0;
          if (v11 == 1)
            v7 = fminf(v9, 0.00000001);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.00000001;
  }

  return v7;
}

+ (BOOL)isArithmeticLayer:(id)a3 withOperation:(int)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v5, "operation") == a4;

  return v6;
}

+ (BOOL)isActivationLayer:(id)a3 withActivationType:(int)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationType") == a4;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isConstTensor:(id)a3 withValue:(float)a4 withAccuracy:(float)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  float *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  char v21;
  BOOL v22;
  id v23;
  __int16 *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int16 v28;
  float v34;
  char v35;
  NSObject *v36;

  v8 = a3;
  if ((objc_msgSend(v8, "computeFlags") & 2) == 0)
    goto LABEL_24;
  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "elementCount");

  if (v10 != 1)
    goto LABEL_24;
  objc_msgSend(v8, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dataType");

  if (v12 != 3)
  {
    if (v12 == 1)
    {
      objc_msgSend(v8, "data");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (float *)objc_msgSend(v13, "bytes");

      objc_msgSend(v8, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "elementCount");

      if (v16)
      {
        v17 = v16 - 1;
        do
        {
          v18 = *v14++;
          v19 = vabds_f32(v18, a4);
          _CF = v17-- != 0;
          v21 = _CF;
          v22 = v19 < a5;
        }
        while (v19 < a5 && (v21 & 1) != 0);
        goto LABEL_25;
      }
LABEL_26:
      v22 = 1;
      goto LABEL_25;
    }
    +[MLCLog framework](MLCLog, "framework");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[MLCPatternMatcher isConstTensor:withValue:withAccuracy:].cold.1(a2, v8, v36);

LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v8, "data");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (__int16 *)objc_msgSend(v23, "bytes");

  objc_msgSend(v8, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "elementCount");

  if (!v26)
    goto LABEL_26;
  v27 = v26 - 1;
  do
  {
    v28 = *v24++;
    _H0 = v28;
    __asm { FCVT            S0, H0 }
    v34 = vabds_f32(_S0, a4);
    _CF = v27-- != 0;
    v35 = _CF;
    v22 = v34 < a5;
  }
  while (v34 < a5 && (v35 & 1) != 0);
LABEL_25:

  return v22;
}

+ (BOOL)canTransformToGELUType1FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "count");
  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
    goto LABEL_14;
  objc_msgSend(v10, "sourceTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1061962281;
  *(float *)&v17 = a6;
  v18 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v15, v16, v17);

  if (v18)
  {
    if (v13)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 1;
    }
    else
    {
      objc_msgSend(v11, "addObject:", v10);
      objc_msgSend(v10, "sourceTensors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "parentLayers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0;
      v10 = v21;
    }

    if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v19, 0))
      goto LABEL_8;
    objc_msgSend(v19, "sourceTensors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25 != v12)
      goto LABEL_8;
    if (v13)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      ++v20;
    }
    else
    {
      objc_msgSend(v11, "addObject:", v19);
      objc_msgSend(v19, "sourceTensors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "parentLayers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v26;
    }

    if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
      goto LABEL_14;
    objc_msgSend(v10, "sourceTensors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v30 != v12)
      goto LABEL_14;
    if (v13)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ++v20;
    }
    else
    {
      objc_msgSend(v11, "addObject:", v10);
      objc_msgSend(v10, "sourceTensors");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "parentLayers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v32;
    }

    if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v19, 2))
      goto LABEL_8;
    objc_msgSend(v19, "sourceTensors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 1027024659;
    *(float *)&v38 = a6;
    v39 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v36, v37, v38);

    if (!v39)
    {
LABEL_8:
      LOBYTE(v18) = 0;
      v10 = v19;
      goto LABEL_15;
    }
    if (v13)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "addObject:", v19);
      objc_msgSend(v19, "sourceTensors");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "parentLayers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v40;
    }

    if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
    {
LABEL_14:
      LOBYTE(v18) = 0;
      goto LABEL_15;
    }
    objc_msgSend(v10, "sourceTensors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    if (v44 != v12)
    {

      goto LABEL_14;
    }
    objc_msgSend(v10, "sourceTensors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v18) = v46 == v12;
    if (v46 == v12 && !v13)
    {
      objc_msgSend(v11, "addObject:", v10);
      LOBYTE(v18) = 1;
    }
  }
LABEL_15:

  return v18;
}

+ (BOOL)canTransformToGELUType2FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "count");
  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
    goto LABEL_3;
  objc_msgSend(v10, "sourceTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 != v12)
    goto LABEL_3;
  if (v13)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
  }
  else
  {
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(v10, "sourceTensors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "parentLayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v10 = v20;
  }

  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v18, 2))
    goto LABEL_20;
  objc_msgSend(v18, "sourceTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1027024659;
  *(float *)&v26 = a6;
  v27 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v24, v25, v26);

  if (!v27)
    goto LABEL_20;
  if (v13)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    ++v19;
  }
  else
  {
    objc_msgSend(v11, "addObject:", v18);
    objc_msgSend(v18, "sourceTensors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "parentLayers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v28;
  }

  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 0))
    goto LABEL_3;
  objc_msgSend(v10, "sourceTensors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v33) = 1.0;
  *(float *)&v34 = a6;
  v35 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v32, v33, v34);

  if (!v35)
    goto LABEL_3;
  if (v13)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ++v19;
  }
  else
  {
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(v10, "sourceTensors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "parentLayers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v36;
  }

  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v18, 2)
    || (objc_msgSend(v18, "sourceTensors"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v39, "objectAtIndexedSubscript:", 1),
        v40 = (id)objc_claimAutoreleasedReturnValue(),
        v40,
        v39,
        v40 != v12))
  {
LABEL_20:
    LOBYTE(v16) = 0;
    v10 = v18;
    goto LABEL_4;
  }
  if (v13)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "addObject:", v18);
    objc_msgSend(v18, "sourceTensors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "parentLayers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v41;
  }

  if (!objc_msgSend(a1, "isArithmeticLayer:withOperation:", v10, 2))
  {
LABEL_3:
    LOBYTE(v16) = 0;
    goto LABEL_4;
  }
  objc_msgSend(v10, "sourceTensors");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndexedSubscript:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = 1340983747;
  *(float *)&v47 = a6;
  v16 = objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v45, v46, v47);

  if (v16 && !v13)
  {
    objc_msgSend(v11, "addObject:", v10);
    LOBYTE(v16) = 1;
  }
LABEL_4:

  return v16;
}

+ (BOOL)checkIntermediateTensorsOfFusedLayers:(id)a3 stopGradientTensorList:(id)a4 forPattern:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  const char *aSelector;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "count");
  v13 = v12 - 1;
  if (v12 == 1)
  {
    v15 = 1;
  }
  else
  {
    v14 = v12;
    aSelector = a2;
    v32 = v9;
    v33 = v10;
    v15 = 0;
    v16 = 1;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v16 - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "skipLayer"))
        break;
      objc_msgSend(v17, "resultTensors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "computeFlags");

      if ((v20 & 1) != 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_19;
        NSStringFromSelector(aSelector);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resultTensors");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = v26;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v33;
        v40 = 2112;
        v41 = v28;
        v29 = "%@: cannot fuse layers = %@ to %@, because tensor = %@ is output";
LABEL_18:
        _os_log_impl(&dword_1D4999000, v24, OS_LOG_TYPE_INFO, v29, buf, 0x2Au);

        goto LABEL_19;
      }
      objc_msgSend(v17, "resultTensors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v11, "containsObject:", v22);

      if (v23)
      {
        +[MLCLog framework](MLCLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_19;
        NSStringFromSelector(aSelector);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resultTensors");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = v26;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v33;
        v40 = 2112;
        v41 = v28;
        v29 = "%@: cannot fuse layers = %@ to %@, because tensor = %@ is in stop gradient list";
        goto LABEL_18;
      }

      v15 = v16++ >= v13;
      if (v14 == v16)
      {
        v15 = 1;
        v9 = v32;
        goto LABEL_20;
      }
    }
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v25;
      v36 = 2112;
      v37 = v33;
      v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_1D4999000, v24, OS_LOG_TYPE_INFO, "%@: cannot fuse layers to %@, because layer = %@ was previously fused", buf, 0x20u);

    }
LABEL_19:
    v9 = v32;

LABEL_20:
    v10 = v33;
  }

  return v15;
}

+ (void)isConstTensor:(const char *)a1 withValue:(void *)a2 withAccuracy:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 1024;
  v10 = objc_msgSend(v6, "dataType");
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: Unsupported data type = %d", (uint8_t *)&v7, 0x12u);

}

@end
