@implementation CBColorPolicyFilter

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  float v5;
  uint64_t v7;
  int i;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v12 = 0;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("CEEnable")) & 1) != 0)
  {
    self->_ceEnabled = objc_msgSend(a3, "BOOLValue") & 1;
    v12 = 1;
  }
  if ((objc_msgSend(a4, "isEqual:", CFSTR("CEConfidenceThreshold")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      v12 = 1;
    }
  }
  if ((objc_msgSend(a4, "isEqual:", CFSTR("MitigationBoundaryOverride")) & 1) != 0)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TTRestriction_th_E"));
        v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TTRestriction_th_L"));
        v7 = objc_msgSend(v11, "count");
        if (v7 == objc_msgSend(v10, "count"))
        {
          if (objc_msgSend(v11, "count"))
          {
            v9 = objc_msgSend(v11, "count");
            if (v9 > 20)
              v9 = 20;
            self->_mitigationThrSize = v9;
            for (i = 0; i < v9; ++i)
            {
              objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", i), "floatValue");
              self->_mitigationThrE[i] = v4;
              objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", i), "floatValue");
              self->_mitigationThrL[i] = v5;
            }
          }
        }
      }
    }
    else
    {
      -[CBColorPolicyFilter initializeMitigationsForDevice:](self, "initializeMitigationsForDevice:", 0);
    }
  }
  return v12 & 1;
}

uint64_t __38__CBColorPolicyFilter_handleALSEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("Mitigated")), "BOOLValue");
    if ((result & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  }
  return result;
}

float __38__CBColorPolicyFilter_handleALSEvent___block_invoke_2(uint64_t a1, void *a2)
{
  float result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("Strength")), "floatValue");
    if (result >= *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    }
  }
  return result;
}

- (id)filterEvent:(id)a3
{
  if (objc_msgSend(a3, "eventType") == 12)
    return -[CBColorPolicyFilter handleALSEvent:](self, "handleALSEvent:", a3);
  else
    return a3;
}

- (id)handleALSEvent:(id)a3
{
  double v3;
  float *v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  double v9;
  double v10;
  int v11;
  float *v12;
  float *v13;
  float *v14;
  float *v15;
  double v16;
  double v17;
  int v18;
  float *v19;
  float *v20;
  float *v21;
  int v22;
  float *v23;
  int v24;
  float *v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  float *v31;
  uint64_t v32;
  uint64_t v33;
  float *v34;
  double v35;
  float *v36;
  float *v37;
  uint64_t v38;
  float *v39;
  void *v40;
  float *v41;
  float *v42;
  float *v43;
  float *v44;
  float *v45;
  float *v46;
  void *v47;
  float *v48;
  void *v49;
  float *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  os_log_t v56;
  os_log_type_t v57[4];
  uint8_t *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_t v61;
  int v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *context;
  os_log_t v69;
  os_log_type_t v70[4];
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  os_log_t v85;
  os_log_type_t v86[4];
  uint8_t *v87;
  uint64_t inited;
  uint64_t v89;
  uint64_t v90;
  os_log_t log;
  os_log_type_t v92[4];
  uint8_t *buf;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  id v98;
  int v99;
  id v100;
  int isKindOfClass;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  id v111;
  float *v112;
  double v113;
  os_log_type_t v114;
  os_log_t oslog;
  uint64_t v116;
  int v117;
  int v118;
  float (*v119)(uint64_t, void *);
  void *v120;
  _QWORD *v121;
  os_log_type_t *v122;
  _QWORD v123[2];
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t (*v130)(uint64_t, void *);
  os_log_type_t v131[63];
  os_log_type_t v132;
  os_log_type_t v133;
  os_log_type_t type;
  _BYTE __b[137];
  int v136;
  int v137;
  float v138;
  int v139;
  char v140;
  char v141;
  id v142;
  SEL v143;
  CBColorPolicyFilter *v144;
  _BYTE v145[32];
  _BYTE v146[16];
  uint8_t v147[32];
  uint8_t v148[40];
  uint64_t v149;

  v112 = (float *)&v127;
  v149 = *MEMORY[0x1E0C80C00];
  v144 = self;
  v143 = a2;
  v142 = a3;
  v141 = 1;
  v140 = 0;
  v139 = 1049247089;
  v138 = 1.0;
  v137 = 0;
  v136 = 0;
  objc_msgSend(a3, "illuminance");
  v113 = v3;
  *(float *)&v3 = v3;
  v136 = LODWORD(v3);
  memset(__b, 0, sizeof(__b));
  v111 = v142;
  if (v142)
    objc_msgSend(v111, "vendorData");
  else
    memset(__b, 0, sizeof(__b));
  v4 = v112;
  v112[41] = 0.0;
  v4[41] = (float)*(unsigned __int16 *)&__b[6];
  v4[78] = *(float *)&__b[72];
  if (v4[77] >= 10.0)
  {
    if ((__b[82] & 1) != 0)
    {
      v109 = objc_msgSend(*((id *)v112 + 43), "sampleIsFromMitigatedRegion:", *((_QWORD *)v112 + 41));
      if ((v109 & 1) != 0)
      {
        *(float *)&v9 = v112[77];
        *(float *)&v10 = v112[41];
        objc_msgSend(*((id *)v112 + 43), "computeBaselineStrengthForLux:andNits:", v9, v10);
        v108 = v11;
        v12 = v112;
        *((_DWORD *)v112 + 80) = v11;
        objc_msgSend(*((id *)v12 + 41), "setColorMitigationTriggered:", 1);
        *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 1;
      }
      else
      {
        objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 0);
        v13 = v112;
        *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 0;
        v13[80] = 0.27;
      }
      v14 = v112;
      *(_QWORD *)(*((_QWORD *)v112 + 43) + 432) = *((_QWORD *)v112 + 41);
      *(float *)(*((_QWORD *)v14 + 43) + 428) = v14[80];
    }
    else
    {
      v107 = objc_msgSend(*((id *)v112 + 43), "sampleIsFromMitigatedRegion:", *((_QWORD *)v112 + 41));
      if ((v107 & 1) != 0)
      {
        objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 1);
        v15 = v112;
        v112[40] = 0.0;
        *(float *)&v16 = v15[77];
        *(float *)&v17 = v15[41];
        objc_msgSend(*((id *)v15 + 43), "computeBaselineStrengthForLux:andNits:", v16, v17);
        v106 = v18;
        v19 = v112;
        *((_DWORD *)v112 + 40) = v18;
        if ((*(_BYTE *)(*((_QWORD *)v19 + 43) + 384) & 1) != 0)
        {
          v105 = objc_msgSend(*((id *)v112 + 43), "sampleIsFromCERegion:", *((_QWORD *)v112 + 41));
          if ((v105 & 1) != 0)
          {
            v20 = v112;
            v140 = 1;
            *((_QWORD *)v112 + 19) = 0;
            v104 = objc_msgSend(*(id *)(*((_QWORD *)v20 + 43) + 376), "copyInference:", *((_QWORD *)v20 + 41));
            v21 = v112;
            *((_QWORD *)v112 + 19) = v104;
            v102 = *((_QWORD *)v21 + 19);
            v103 = objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if ((isKindOfClass & 1) != 0)
            {
              v100 = (id)objc_msgSend(*((id *)v112 + 19), "objectForKey:", CFSTR("CEStrength"));
              objc_msgSend(v100, "floatValue");
              v99 = v22;
              v23 = v112;
              *((_DWORD *)v112 + 80) = v22;
              v98 = (id)objc_msgSend(*((id *)v23 + 19), "objectForKey:", CFSTR("CEConfidence"));
              objc_msgSend(v98, "floatValue");
              v97 = v24;
              *((_DWORD *)v112 + 79) = v24;
            }

            if (v112[79] >= *(float *)(*((_QWORD *)v112 + 43) + 388))
            {
              if (v112[80] < v112[40])
              {
                v30 = v112;
                v140 = 0;
                *((_QWORD *)v112 + 16) = 0;
                if (*(_QWORD *)(*((_QWORD *)v30 + 43) + 8))
                {
                  v90 = *(_QWORD *)(*((_QWORD *)v112 + 43) + 8);
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                  {
                    v89 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else
                  {
                    inited = init_default_corebrightness_log();
                    v89 = inited;
                  }
                  v90 = v89;
                }
                v31 = v112;
                *((_QWORD *)v112 + 16) = v90;
                v133 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(*((os_log_t *)v31 + 16), OS_LOG_TYPE_INFO))
                {
                  v85 = (os_log_t)*((_QWORD *)v112 + 16);
                  *(_DWORD *)v86 = v133;
                  *(double *)&v32 = v112[80];
                  *(double *)&v33 = v112[40];
                  v87 = v147;
                  __os_log_helper_16_0_2_8_0_8_0((uint64_t)v147, v32, v33);
                  _os_log_impl(&dword_1B5291000, v85, v86[0], "HarmonyPolicy: CE strength (%f) < baseline (%f), using baseline", v147, 0x16u);
                }
                v112[80] = v112[40];
              }
            }
            else
            {
              v25 = v112;
              v112[80] = v112[40];
              *((_QWORD *)v25 + 18) = 0;
              if (*(_QWORD *)(*((_QWORD *)v25 + 43) + 8))
              {
                v96 = *(_QWORD *)(*((_QWORD *)v112 + 43) + 8);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                {
                  v95 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else
                {
                  v94 = init_default_corebrightness_log();
                  v95 = v94;
                }
                v96 = v95;
              }
              v26 = v112;
              *((_QWORD *)v112 + 18) = v96;
              type = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(*((os_log_t *)v26 + 18), OS_LOG_TYPE_INFO))
              {
                log = (os_log_t)*((_QWORD *)v112 + 18);
                *(_DWORD *)v92 = type;
                *(double *)&v27 = v112[79];
                *(double *)&v28 = *(float *)(*((_QWORD *)v112 + 43) + 388);
                *(double *)&v29 = v112[80];
                buf = v148;
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v148, v27, v28, v29);
                _os_log_impl(&dword_1B5291000, log, v92[0], "HarmonyPolicy: Low CE Confidence: %f (threshold: %f), Using baseline strength: %f", v148, 0x20u);
              }
              v140 = 0;
            }
          }
          else
          {
            v112[80] = 0.27;
          }
        }
        else
        {
          v112[80] = v112[40];
        }
        *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 1;
      }
      else
      {
        objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 0);
        v34 = v112;
        *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 0;
        v34[80] = 0.27;
      }
    }
    if ((v141 & 1) != 0)
    {
      *((_QWORD *)v112 + 14) = 0;
      v84 = objc_alloc(MEMORY[0x1E0C99D80]);
      v82 = *((_QWORD *)v112 + 41);
      v83 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v112 + 78));
      *(float *)&v35 = v112[80];
      v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v79 = (id)MEMORY[0x1E0CB37E8];
      v80 = objc_msgSend(*((id *)v112 + 41), "colorMitigationTriggered");
      v78 = objc_msgSend(v79, "numberWithBool:", v80 & 1);
      v77 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v140 & 1);
      v75 = &v55;
      v76 = objc_msgSend(v84, "initWithObjectsAndKeys:", v82, CFSTR("ALSSample"), v83, CFSTR("sampleTimestamp"), v81, CFSTR("Strength"), v78, CFSTR("Mitigated"), v77, CFSTR("isStrengthFromCE"), 0);
      v36 = v112;
      *((_QWORD *)v112 + 14) = v76;
      *((_QWORD *)v36 + 13) = 0;
      if (*(_QWORD *)(*((_QWORD *)v36 + 43) + 8))
      {
        v74 = *(_QWORD *)(*((_QWORD *)v112 + 43) + 8);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
          v73 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else
        {
          v72 = init_default_corebrightness_log();
          v73 = v72;
        }
        v74 = v73;
      }
      v37 = v112;
      *((_QWORD *)v112 + 13) = v74;
      v132 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(*((os_log_t *)v37 + 13), OS_LOG_TYPE_INFO))
      {
        v69 = (os_log_t)*((_QWORD *)v112 + 13);
        *(_DWORD *)v70 = v132;
        v38 = *((_QWORD *)v112 + 14);
        v71 = v146;
        __os_log_helper_16_2_1_8_64((uint64_t)v146, v38);
        _os_log_impl(&dword_1B5291000, v69, v70[0], "HarmonyPolicy: Incoming ALS sample, pushed to queue: %@", v71, 0xCu);
      }
      objc_msgSend(*(id *)(*((_QWORD *)v112 + 43) + 392), "pushObj:", *((_QWORD *)v112 + 14));
      v39 = v112;
      ++*(_QWORD *)(*((_QWORD *)v112 + 43) + 408);

      if (*(_QWORD *)(*((_QWORD *)v112 + 43) + 408) > *(_QWORD *)(*((_QWORD *)v112 + 43) + 400))
      {
        context = (void *)MEMORY[0x1B5E4A8B0]();
        v67 = objc_msgSend(*(id *)(*((_QWORD *)v112 + 43) + 392), "popObj");
        v40 = context;
        v41 = v112;
        *((_QWORD *)v112 + 14) = v67;
        --*(_QWORD *)(*((_QWORD *)v41 + 43) + 408);
        objc_autoreleasePoolPop(v40);
      }
    }
    if ((__b[82] & 1) == 0)
    {
      v66 = objc_msgSend(*((id *)v112 + 41), "colorMitigationTriggered");
      if ((v66 & 1) != 0)
      {
        v45 = v112;
        *(_QWORD *)(*((_QWORD *)v112 + 43) + 416) = 0;
        *((_QWORD *)v45 + 11) = 0;
        v65 = objc_msgSend(*(id *)(*((_QWORD *)v45 + 43) + 392), "stack");
        v46 = v112;
        *((_QWORD *)v112 + 11) = v65;
        *((_QWORD *)v46 + 5) = 0;
        *((_QWORD *)v46 + 6) = v131;
        v46[14] = 1.3744e11;
        *((_DWORD *)v46 + 15) = 48;
        *((_QWORD *)v46 + 8) = __Block_byref_object_copy__21;
        *((_QWORD *)v46 + 9) = __Block_byref_object_dispose__21;
        *((_QWORD *)v46 + 10) = 0;
        *((_QWORD *)v46 + 10) = 0;
        v47 = (void *)*((_QWORD *)v46 + 11);
        v127 = MEMORY[0x1E0C809B0];
        v128 = -1073741824;
        v129 = 0;
        v130 = __38__CBColorPolicyFilter_handleALSEvent___block_invoke;
        *((_QWORD *)v46 + 3) = &unk_1E68EAFC8;
        *((_QWORD *)v46 + 4) = v131;
        objc_msgSend(v47, "enumerateObjectsUsingBlock:", &v127);
        if (!*(_QWORD *)(*((_QWORD *)v112 + 6) + 40))
        {
          v48 = v112;
          *(_BYTE *)(*((_QWORD *)v112 + 43) + 424) = 1;
          v123[0] = 0;
          v123[1] = v123;
          v124 = 0x20000000;
          v125 = 32;
          v126 = 0;
          v49 = (void *)*((_QWORD *)v48 + 11);
          v116 = MEMORY[0x1E0C809B0];
          v117 = -1073741824;
          v118 = 0;
          v119 = __38__CBColorPolicyFilter_handleALSEvent___block_invoke_2;
          v120 = &unk_1E68EBE50;
          v121 = v123;
          v122 = v131;
          objc_msgSend(v49, "enumerateObjectsUsingBlock:", &v116);
          _Block_object_dispose(v123, 8);
        }
        v64 = objc_msgSend(*(id *)(*((_QWORD *)v112 + 6) + 40), "objectForKey:", CFSTR("ALSSample"));
        v50 = v112;
        *(_QWORD *)(*((_QWORD *)v112 + 43) + 432) = v64;
        v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v50 + 6) + 40), "objectForKey:", CFSTR("Strength"));
        objc_msgSend(v63, "floatValue");
        v62 = v51;
        *(_DWORD *)(*((_QWORD *)v112 + 43) + 428) = v51;
        _Block_object_dispose(v131, 8);
      }
      else if ((*(_BYTE *)(*((_QWORD *)v112 + 43) + 424) & 1) != 0)
      {
        v43 = v112;
        ++*(_QWORD *)(*((_QWORD *)v112 + 43) + 416);
        if (*(_QWORD *)(*((_QWORD *)v43 + 43) + 416) < 0x14uLL)
        {
          objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 1);
          v44 = v112;
          *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 1;
          *(_QWORD *)(*((_QWORD *)v44 + 43) + 432) = *((_QWORD *)v44 + 41);
        }
        else
        {
          v44 = v112;
          *(_QWORD *)(*((_QWORD *)v112 + 43) + 432) = *((_QWORD *)v112 + 41);
        }
        *(float *)(*((_QWORD *)v44 + 43) + 428) = v44[80];
      }
      else
      {
        v42 = v112;
        *(_QWORD *)(*((_QWORD *)v112 + 43) + 432) = *((_QWORD *)v112 + 41);
        *(float *)(*((_QWORD *)v42 + 43) + 428) = v42[80];
      }
    }
  }
  else
  {
    v5 = v112;
    v112[80] = 0.27;
    v110 = objc_msgSend(*((id *)v5 + 43), "sampleIsFromMitigatedRegion:", *((_QWORD *)v5 + 41));
    if ((v110 & 1) != 0)
    {
      objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 1);
      v6 = v112;
      *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 1;
      *(_BYTE *)(*((_QWORD *)v6 + 43) + 424) = 1;
      *(_QWORD *)(*((_QWORD *)v6 + 43) + 416) = 0;
    }
    else if ((*(_BYTE *)(*((_QWORD *)v112 + 43) + 424) & 1) != 0
           && (v7 = v112,
               ++*(_QWORD *)(*((_QWORD *)v112 + 43) + 416),
               *(_QWORD *)(*((_QWORD *)v7 + 43) + 416) < 0x14uLL))
    {
      objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 1);
      *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 1;
    }
    else
    {
      objc_msgSend(*((id *)v112 + 41), "setColorMitigationTriggered:", 0);
      *(_BYTE *)(*((_QWORD *)v112 + 43) + 425) = 0;
    }
    v8 = v112;
    v141 = 0;
    *(_QWORD *)(*((_QWORD *)v112 + 43) + 432) = *((_QWORD *)v112 + 41);
    *(float *)(*((_QWORD *)v8 + 43) + 428) = v8[80];
  }
  oslog = 0;
  if (*(_QWORD *)(*((_QWORD *)v112 + 43) + 8))
  {
    v61 = *(os_log_t *)(*((_QWORD *)v112 + 43) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v60 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else
    {
      v59 = init_default_corebrightness_log();
      v60 = v59;
    }
    v61 = v60;
  }
  oslog = v61;
  v114 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    v56 = oslog;
    *(_DWORD *)v57 = v114;
    v52 = *(_QWORD *)(*((_QWORD *)v112 + 43) + 432);
    *(double *)&v53 = *(float *)(*((_QWORD *)v112 + 43) + 428);
    v58 = v145;
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v145, v52, v53);
    _os_log_impl(&dword_1B5291000, v56, v57[0], "HarmonyPolicy: _filteredALS: %@, _filtered strength: %f", v58, 0x16u);
  }
  return *(id *)(*((_QWORD *)v112 + 43) + 432);
}

- (BOOL)shouldMitigateForSample:(id)a3 withLuxThr:(float *)a4 NitsThr:(float *)a5 andSize:(int)a6
{
  double v6;
  int i;
  _BYTE __b[137];
  float v10;
  char v11;
  int v12;
  float *v13;
  float *v14;
  int v15;
  float *v16;
  float *v17;
  id v18;
  SEL v19;
  CBColorPolicyFilter *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a5;
  v15 = a6;
  if (!a4 || !v16)
    return 0;
  v14 = v17;
  v13 = v16;
  v12 = v15;
  v11 = 0;
  objc_msgSend(v18, "illuminance");
  *(float *)&v6 = v6;
  v10 = *(float *)&v6;
  memset(__b, 0, sizeof(__b));
  if (v18)
    objc_msgSend(v18, "vendorData");
  else
    memset(__b, 0, sizeof(__b));
  if (v12 < 2 || v10 < *v14)
    return 0;
  if (v10 >= v14[v12 - 1])
    return 0;
  for (i = 0; i < v12 - 1; ++i)
  {
    if (v10 <= v14[i + 1])
    {
      if ((float)(v13[i]
                 + (float)((float)((float)(v13[i + 1] - v13[i]) / (float)(v14[i + 1] - v14[i])) * (float)(v10 - v14[i]))) < (float)*(unsigned __int16 *)&__b[6])
        v11 = 1;
      return v11 & 1;
    }
  }
  return v11 & 1;
}

- (float)filteredStrength
{
  return self->_filteredStrength;
}

- (id)copyPropertyForKey:(id)a3
{
  void *v4;

  v4 = 0;
  if ((objc_msgSend(a3, "isEqual:", CFSTR("CEEnable")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_ceEnabled);
  return v4;
}

- (float)computeBaselineStrengthForLux:(float)a3 andNits:(float)a4
{
  double v4;
  double v5;
  float v6;
  uint64_t inited;
  NSObject *logHandle;
  int j;
  int i;
  float v12;
  char v13;
  char v14;
  char v15;
  char v16;
  _BYTE v17[4];
  float v18;
  float v19;
  SEL v20;
  CBColorPolicyFilter *v21;
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  for (i = 0; i < 47; ++i)
  {
    if (i + 1 >= 47)
    {
      v15 = i;
      v16 = i;
    }
    else
    {
      if ((float)baselineLux[i] < v19 && (float)baselineLux[i + 1] > v19)
      {
        v16 = i;
        v15 = i + 1;
        break;
      }
      if (v19 <= (float)baselineLux[i])
      {
        v15 = i;
        v16 = i;
        break;
      }
    }
  }
  for (j = 0; j < 161; ++j)
  {
    if (j + 1 >= 161)
    {
      v13 = j;
      v14 = j;
    }
    else
    {
      if ((float)baselineNits[j] < v18 && (float)baselineNits[j + 1] > v18)
      {
        v14 = j;
        v13 = j + 1;
        break;
      }
      if (v18 <= (float)baselineNits[j])
      {
        v13 = j;
        v14 = j;
        break;
      }
    }
  }
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v17[3] = v13;
  *(float *)&v4 = v19;
  *(float *)&v5 = v18;
  -[CBColorPolicyFilter biLinearInterpBetweenIndices:forPoint1:andPoint2:](v21, "biLinearInterpBetweenIndices:forPoint1:andPoint2:", v17, v4, v5);
  v12 = (float)(uint64_t)llroundf(v6 * 100.0) / 100.0;
  if (v21->super._logHandle)
  {
    logHandle = v21->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v22, COERCE__INT64(v19), COERCE__INT64(v18), COERCE__INT64(v12));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: BaselineHarmony: mitigatedStr, for (lux, nits): %f, %f = %f (rounded)", v22, 0x20u);
  }
  return v12;
}

- (float)biLinearInterpBetweenIndices:(char *)a3 forPoint1:(float)a4 andPoint2:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  int v31;
  float v33;
  float v34;

  v34 = a4;
  v33 = a5;
  if (!self->_mitigatedStrengthLUT || !a3)
    return -1.0;
  v31 = *a3;
  v30 = a3[1];
  v29 = a3[2];
  v28 = a3[3];
  v27 = (float)baselineLux[v31];
  v26 = (float)baselineLux[v30];
  v25 = (float)baselineNits[v29];
  v24 = (float)baselineNits[v28];
  v23 = self->_mitigatedStrengthLUT[v28][v31];
  v22 = self->_mitigatedStrengthLUT[v28][v30];
  if (__PAIR64__(v29, v30) == __PAIR64__(v28, v31))
    return self->_mitigatedStrengthLUT[v29][v31];
  if (v31 == v30)
  {
    *(float *)&v8 = (float)baselineNits[v29];
    *(float *)&v9 = self->_mitigatedStrengthLUT[v29][v31];
    *(float *)&v5 = (float)baselineNits[v28];
    *(float *)&v6 = self->_mitigatedStrengthLUT[v28][v31];
    *(float *)&v7 = v33;
    -[CBColorPolicyFilter interpolateBetweenX1:Y1:X2:Y2:X:](self, "interpolateBetweenX1:Y1:X2:Y2:X:", v8, v9, v5, v6, v7);
    return v10;
  }
  else
  {
    a4 = (float)baselineLux[v31];
    a5 = self->_mitigatedStrengthLUT[v29][v31];
    *(float *)&v5 = (float)baselineLux[v30];
    *(float *)&v6 = self->_mitigatedStrengthLUT[v29][v30];
    *(float *)&v7 = v34;
    if (v29 != v28)
    {
      -[CBColorPolicyFilter interpolateBetweenX1:Y1:X2:Y2:X:](self, "interpolateBetweenX1:Y1:X2:Y2:X:", *(double *)&a4, *(double *)&a5, v5, v6, v7);
      v21 = v12;
      *(float *)&v13 = v27;
      *(float *)&v14 = v23;
      *(float *)&v15 = v26;
      *(float *)&v16 = v22;
      *(float *)&v17 = v34;
      -[CBColorPolicyFilter interpolateBetweenX1:Y1:X2:Y2:X:](self, "interpolateBetweenX1:Y1:X2:Y2:X:", v13, v14, v15, v16, v17);
      v20 = v18;
      a4 = v25;
      a5 = v21;
      *(float *)&v5 = v24;
      LODWORD(v6) = v20;
      *(float *)&v7 = v33;
    }
    -[CBColorPolicyFilter interpolateBetweenX1:Y1:X2:Y2:X:](self, "interpolateBetweenX1:Y1:X2:Y2:X:", *(double *)&a4, *(double *)&a5, v5, v6, v7);
    return v11;
  }
}

- (float)interpolateBetweenX1:(float)a3 Y1:(float)a4 X2:(float)a5 Y2:(float)a6 X:(float)a7
{
  return a4 + (float)((float)((float)(a6 - a4) / (float)(a5 - a3)) * (float)(a7 - a3));
}

- (BOOL)sampleIsFromCERegion:(id)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = -[CBColorPolicyFilter shouldMitigateForSample:withLuxThr:NitsThr:andSize:](self, "shouldMitigateForSample:withLuxThr:NitsThr:andSize:", a3, self->_ceMitigationThrE, self->_ceMitigationThrL, self->_ceMitigationThrSize);
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    if ((v7 & 1) != 0)
      v3 = "";
    else
      v3 = "NOT";
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: Sample IS %s from CE region", v9, 0xCu);
  }
  return v7 & 1;
}

- (BOOL)sampleIsFromMitigatedRegion:(id)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = -[CBColorPolicyFilter shouldMitigateForSample:withLuxThr:NitsThr:andSize:](self, "shouldMitigateForSample:withLuxThr:NitsThr:andSize:", a3, self->_mitigationThrE, self->_mitigationThrL, self->_mitigationThrSize);
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    if ((v7 & 1) != 0)
      v3 = "";
    else
      v3 = "NOT";
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: Sample IS %s from mitigated region", v9, 0xCu);
  }
  return v7 & 1;
}

- (CBColorPolicyFilter)initWithID:(unsigned int)a3
{
  os_log_t v3;
  CBStack *v4;
  objc_super v6;
  unsigned int v7;
  SEL v8;
  CBColorPolicyFilter *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBColorPolicyFilter;
  v9 = -[CBFilter init](&v6, sel_init);
  if (v9)
  {
    v3 = os_log_create("com.apple.CoreBrightness.CBColorPolicyFilter", "default");
    v9->super._logHandle = (OS_os_log *)v3;
    -[CBColorPolicyFilter initializeMitigationsForDevice:](v9, "initializeMitigationsForDevice:", v7);
    v4 = -[CBStack initWithLength:]([CBStack alloc], "initWithLength:");
    v9->_alsStack = v4;
    v9->_stackLength = 20;
    v9->_stackCurrentCount = 0;
    v9->_consecutiveNonMitgatedCount = 0;
    v9->_mitigationUsedYet = 0;
    v9->_ceConfidenceThreshold = 0.1;
    v9->_ceEnabled = 1;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBColorPolicyFilter *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBColorPolicyFilter;
  -[CBFilter dealloc](&v2, sel_dealloc);
}

- (void)setModuleObject:(id)a3
{
  CBCEModule *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_ceModule = (CBCEModule *)a3;
    v3 = self->_ceModule;
  }
}

- (void)resetFilter
{
  -[CBStack clear](self->_alsStack, "clear", a2);
  self->_stackCurrentCount = 0;
  self->_consecutiveNonMitgatedCount = 0;
  self->_mitigationUsedYet = 0;
}

- (void)initializeMitigationsForDevice:(unsigned int)a3
{
  _BYTE v5[44];
  _BYTE v6[44];
  _BYTE v7[44];
  _BYTE __dst[44];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, &unk_1B546A410, sizeof(__dst));
  memcpy(v7, &unk_1B546A43C, sizeof(v7));
  self->_isColorMitigationTriggered = 0;
  self->_filteredStrength = 0.27;
  self->_mitigatedStrengthLUT = (float (*)[47])&baselineStrengthLUT;
  self->_mitigationThrSize = 11;
  __memcpy_chk();
  __memcpy_chk();
  if (a3 == 1 || a3 == 3)
  {
    memcpy(v6, &unk_1B546A468, sizeof(v6));
    memcpy(v5, &unk_1B546A494, sizeof(v5));
    self->_ceMitigationThrSize = 11;
    __memcpy_chk();
    __memcpy_chk();
  }
  else if (a3 == 2 || a3 == 4)
  {
    self->_ceMitigationThrSize = 5;
    __memcpy_chk();
    __memcpy_chk();
  }
}

- (BOOL)isColorMitigationTriggered
{
  return self->_isColorMitigationTriggered;
}

- (void)setIsColorMitigationTriggered:(BOOL)a3
{
  self->_isColorMitigationTriggered = a3;
}

- (void)setFilteredStrength:(float)a3
{
  self->_filteredStrength = a3;
}

- (CBHIDEvent)filteredALS
{
  return self->_filteredALS;
}

@end
