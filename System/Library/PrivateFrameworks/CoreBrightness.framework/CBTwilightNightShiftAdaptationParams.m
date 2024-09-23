@implementation CBTwilightNightShiftAdaptationParams

- (BOOL)loadParametersFromService:(unsigned int)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *log;
  os_log_type_t v70;
  uint64_t inited;
  NSObject *v72;
  unint64_t jj;
  id v74;
  unint64_t ii;
  unint64_t n;
  id v77;
  unint64_t m;
  id v79;
  uint8_t v80[7];
  os_log_type_t v81;
  NSObject *v82;
  uint8_t v83[7];
  os_log_type_t v84;
  NSObject *v85;
  unint64_t k;
  os_log_type_t v87;
  os_log_t v88;
  unint64_t j;
  uint8_t v90[7];
  os_log_type_t v91;
  NSObject *v92;
  uint8_t v93[7];
  os_log_type_t v94;
  NSObject *v95;
  uint8_t v96[7];
  os_log_type_t v97;
  NSObject *v98;
  uint8_t v99[7];
  os_log_type_t v100;
  NSObject *v101;
  uint8_t v102[15];
  os_log_type_t v103;
  NSObject *v104;
  unint64_t i;
  os_log_type_t v106;
  os_log_t v107;
  uint8_t v108[7];
  os_log_type_t v109;
  NSObject *v110;
  uint8_t v111[15];
  os_log_type_t v112;
  NSObject *v113;
  float v114;
  uint8_t v115[15];
  os_log_type_t v116;
  NSObject *v117;
  char v118;
  int v119;
  uint8_t v120[7];
  os_log_type_t v121;
  NSObject *v122;
  uint8_t v123[7];
  os_log_type_t type;
  NSObject *v125;
  io_registry_entry_t v126;
  SEL v127;
  CBTwilightNightShiftAdaptationParams *v128;
  char v129;
  uint8_t v130[32];
  uint8_t v131[16];
  uint8_t v132[16];
  uint8_t v133[16];
  uint8_t v134[16];
  uint8_t v135[16];
  uint8_t v136[32];
  uint8_t v137[32];
  uint8_t v138[24];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v128 = self;
  v127 = a2;
  v126 = a3;
  v125 = 0;
  if (self->_log)
  {
    v72 = v128->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v72 = inited;
  }
  v125 = v72;
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    log = v125;
    v70 = type;
    __os_log_helper_16_0_0(v123);
    _os_log_impl(&dword_1B5291000, log, v70, "Initialization | Start", v123, 2u);
  }
  if (v126)
  {
    v119 = 0;
    v118 = load_int_from_edt(v126, CFSTR("use-tw-ns-adaptation"), &v119) & 1;
    if (v118 && v119)
    {
      v114 = 6500.0;
      v128->_cctTableSizeOG = load_float_array_from_edt(v126, CFSTR("tw-ns-cct-table"), &v128->_cctTableOG);
      if (v128->_cctTableOG)
      {
        if (v128->_cctTableSizeOG)
        {
          if (float_equal(v128->_cctTableOG[v128->_cctTableSizeOG - 1], v114))
          {
            for (i = 0; i < v128->_cctTableSizeOG - 1; ++i)
            {
              if (v128->_cctTableOG[i] > v128->_cctTableOG[i + 1])
              {
                v104 = 0;
                if (v128->_log)
                {
                  v50 = v128->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v49 = init_default_corebrightness_log();
                  v50 = v49;
                }
                v104 = v50;
                v103 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  v47 = v104;
                  v48 = v103;
                  __os_log_helper_16_0_0(v102);
                  _os_log_error_impl(&dword_1B5291000, v47, v48, "CCT table is not strictly increasing", v102, 2u);
                }
                v129 = 0;
                return v129 & 1;
              }
            }
            v128->_twilightStrengthTableSizeOG = load_float_array_from_edt(v126, CFSTR("tw-ns-strength-table"), &v128->_twilightStrengthTableOG);
            if (v128->_twilightStrengthTableOG)
            {
              if (v128->_twilightStrengthTableSizeOG >= 2)
              {
                if (float_equal(*v128->_twilightStrengthTableOG, 0.0))
                {
                  if (float_equal(v128->_twilightStrengthTableOG[v128->_twilightStrengthTableSizeOG - 1], 1.0))
                  {
                    for (j = 0; j < v128->_twilightStrengthTableSizeOG; ++j)
                    {
                      if (v128->_twilightStrengthTableOG[j] < 0.0 || v128->_twilightStrengthTableOG[j] > 1.0)
                      {
                        v88 = 0;
                        if (v128->_log)
                        {
                          v30 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v29 = init_default_corebrightness_log();
                          v30 = v29;
                        }
                        v88 = v30;
                        v87 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v137, j, COERCE__INT64(v128->_twilightStrengthTableOG[j]));
                          _os_log_error_impl(&dword_1B5291000, v88, v87, "Twilight strength table element #%lu with value %f is out of the valid [0, 1] range", v137, 0x16u);
                        }
                        v129 = 0;
                        return v129 & 1;
                      }
                    }
                    for (k = 0; k < v128->_twilightStrengthTableSizeOG - 1; ++k)
                    {
                      if (v128->_twilightStrengthTableOG[k] > v128->_twilightStrengthTableOG[k + 1])
                      {
                        v85 = 0;
                        if (v128->_log)
                        {
                          v28 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v27 = init_default_corebrightness_log();
                          v28 = v27;
                        }
                        v85 = v28;
                        v84 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                        {
                          v25 = v85;
                          v26 = v84;
                          __os_log_helper_16_0_0(v83);
                          _os_log_error_impl(&dword_1B5291000, v25, v26, "Twilight strength table is not strictly increasing", v83, 2u);
                        }
                        v129 = 0;
                        return v129 & 1;
                      }
                    }
                    v128->_cctDeltaTableSizeOG = load_float_array_from_edt(v126, CFSTR("tw-ns-cct-delta-table"), &v128->_cctDeltaTableOG);
                    if (v128->_cctDeltaTableOG)
                    {
                      if (v128->_cctDeltaTableSizeOG == v128->_cctTableSizeOG * v128->_twilightStrengthTableSizeOG)
                      {
                        v79 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                        for (m = 0; m < v128->_cctTableSizeOG; ++m)
                        {
                          v3 = "";
                          if (m != v128->_cctTableSizeOG - 1)
                            v3 = ",";
                          objc_msgSend(v79, "appendFormat:", CFSTR(" %f%s"), v128->_cctTableOG[m], v3);
                        }
                        objc_msgSend(v79, "appendString:", CFSTR(" "));
                        v77 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                        for (n = 0; n < v128->_twilightStrengthTableSizeOG; ++n)
                        {
                          v4 = "";
                          if (n != v128->_twilightStrengthTableSizeOG - 1)
                            v4 = ",";
                          objc_msgSend(v77, "appendFormat:", CFSTR(" %f%s"), v128->_twilightStrengthTableOG[n], v4);
                        }
                        objc_msgSend(v77, "appendString:", CFSTR(" "));
                        if (v128->_log)
                        {
                          v18 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v17 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v17 = init_default_corebrightness_log();
                          v18 = v17;
                        }
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v135, v128->_cctTableSizeOG);
                          _os_log_impl(&dword_1B5291000, v18, OS_LOG_TYPE_DEFAULT, "CCTTableSize=%lu", v135, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v16 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v15 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v15 = init_default_corebrightness_log();
                          v16 = v15;
                        }
                        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_2_1_8_32((uint64_t)v134, objc_msgSend(v79, "UTF8String"));
                          _os_log_impl(&dword_1B5291000, v16, OS_LOG_TYPE_DEFAULT, "CCTTable={%s}", v134, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v14 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v13 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v13 = init_default_corebrightness_log();
                          v14 = v13;
                        }
                        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v133, v128->_twilightStrengthTableSizeOG);
                          _os_log_impl(&dword_1B5291000, v14, OS_LOG_TYPE_DEFAULT, "TwilightStrengthTableSize=%lu", v133, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v12 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v11 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v11 = init_default_corebrightness_log();
                          v12 = v11;
                        }
                        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_2_1_8_32((uint64_t)v132, objc_msgSend(v77, "UTF8String"));
                          _os_log_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEFAULT, "TwilightStrengthTable={%s}", v132, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v10 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v9 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v9 = init_default_corebrightness_log();
                          v10 = v9;
                        }
                        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v131, v128->_cctDeltaTableSizeOG);
                          _os_log_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEFAULT, "CCTDeltaTableSize=%lu", v131, 0xCu);
                        }
                        for (ii = 0; ii < v128->_twilightStrengthTableSizeOG; ++ii)
                        {
                          v74 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                          for (jj = 0; jj < v128->_cctTableSizeOG; ++jj)
                          {
                            v5 = "";
                            if (jj != v128->_cctTableSizeOG - 1)
                              v5 = ",";
                            objc_msgSend(v74, "appendFormat:", CFSTR("%f%s "), v128->_cctDeltaTableOG[ii * v128->_cctTableSizeOG + jj], v5);
                          }
                          if (v128->_log)
                          {
                            v8 = v128->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                              v7 = _COREBRIGHTNESS_LOG_DEFAULT;
                            else
                              v7 = init_default_corebrightness_log();
                            v8 = v7;
                          }
                          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                          {
                            __os_log_helper_16_2_2_8_0_8_32((uint64_t)v130, ii, objc_msgSend(v74, "UTF8String"));
                            _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEFAULT, "CCTDeltaTable[%lu]={ %s}", v130, 0x16u);
                          }

                        }
                        v129 = 1;
                      }
                      else
                      {
                        if (v128->_log)
                        {
                          v20 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v19 = init_default_corebrightness_log();
                          v20 = v19;
                        }
                        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v136, v128->_cctDeltaTableSizeOG, v128->_cctTableSizeOG, v128->_twilightStrengthTableSizeOG);
                          _os_log_error_impl(&dword_1B5291000, v20, OS_LOG_TYPE_ERROR, "CCT delta table has wrong size %lu for CCT table size %lu and Twilight strength table size %lu", v136, 0x20u);
                        }
                        v129 = 0;
                      }
                    }
                    else
                    {
                      v82 = 0;
                      if (v128->_log)
                      {
                        v24 = v128->_log;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                          v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                        else
                          v23 = init_default_corebrightness_log();
                        v24 = v23;
                      }
                      v82 = v24;
                      v81 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                      {
                        v21 = v82;
                        v22 = v81;
                        __os_log_helper_16_0_0(v80);
                        _os_log_error_impl(&dword_1B5291000, v21, v22, "Unable to load the CCT delta table", v80, 2u);
                      }
                      v129 = 0;
                    }
                  }
                  else
                  {
                    v92 = 0;
                    if (v128->_log)
                    {
                      v34 = v128->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                        v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                      else
                        v33 = init_default_corebrightness_log();
                      v34 = v33;
                    }
                    v92 = v34;
                    v91 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      v31 = v92;
                      v32 = v91;
                      __os_log_helper_16_0_0(v90);
                      _os_log_error_impl(&dword_1B5291000, v31, v32, "Last element in the Twilight strength table is not 1", v90, 2u);
                    }
                    v129 = 0;
                  }
                }
                else
                {
                  v95 = 0;
                  if (v128->_log)
                  {
                    v38 = v128->_log;
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                      v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                    else
                      v37 = init_default_corebrightness_log();
                    v38 = v37;
                  }
                  v95 = v38;
                  v94 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v35 = v95;
                    v36 = v94;
                    __os_log_helper_16_0_0(v93);
                    _os_log_error_impl(&dword_1B5291000, v35, v36, "First element in the Twilight strength table is not 0", v93, 2u);
                  }
                  v129 = 0;
                }
              }
              else
              {
                v98 = 0;
                if (v128->_log)
                {
                  v42 = v128->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v41 = init_default_corebrightness_log();
                  v42 = v41;
                }
                v98 = v42;
                v97 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  v39 = v98;
                  v40 = v97;
                  __os_log_helper_16_0_0(v96);
                  _os_log_error_impl(&dword_1B5291000, v39, v40, "Twilight strength table has less than two elements", v96, 2u);
                }
                v129 = 0;
              }
            }
            else
            {
              v101 = 0;
              if (v128->_log)
              {
                v46 = v128->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v45 = init_default_corebrightness_log();
                v46 = v45;
              }
              v101 = v46;
              v100 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v43 = v101;
                v44 = v100;
                __os_log_helper_16_0_0(v99);
                _os_log_error_impl(&dword_1B5291000, v43, v44, "Unable to load the Twilight strength table", v99, 2u);
              }
              v129 = 0;
            }
          }
          else
          {
            v107 = 0;
            if (v128->_log)
            {
              v52 = v128->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v51 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v51 = init_default_corebrightness_log();
              v52 = v51;
            }
            v107 = v52;
            v106 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_1_8_0((uint64_t)v138, COERCE__INT64(v114));
              _os_log_error_impl(&dword_1B5291000, v107, v106, "Last element in the CCT table is not %f", v138, 0xCu);
            }
            v129 = 0;
          }
        }
        else
        {
          v110 = 0;
          if (v128->_log)
          {
            v56 = v128->_log;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v55 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v55 = init_default_corebrightness_log();
            v56 = v55;
          }
          v110 = v56;
          v109 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v53 = v110;
            v54 = v109;
            __os_log_helper_16_0_0(v108);
            _os_log_error_impl(&dword_1B5291000, v53, v54, "CCT table has less than one element", v108, 2u);
          }
          v129 = 0;
        }
      }
      else
      {
        v113 = 0;
        if (v128->_log)
        {
          v60 = v128->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v59 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v59 = init_default_corebrightness_log();
          v60 = v59;
        }
        v113 = v60;
        v112 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v57 = v113;
          v58 = v112;
          __os_log_helper_16_0_0(v111);
          _os_log_error_impl(&dword_1B5291000, v57, v58, "Unable to load the CCT table", v111, 2u);
        }
        v129 = 0;
      }
    }
    else
    {
      v117 = 0;
      if (v128->_log)
      {
        v64 = v128->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v63 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v63 = init_default_corebrightness_log();
        v64 = v63;
      }
      v117 = v64;
      v116 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v61 = v117;
        v62 = v116;
        __os_log_helper_16_0_0(v115);
        _os_log_error_impl(&dword_1B5291000, v61, v62, "Twilight / Night Shift Adaptation is not supported", v115, 2u);
      }
      v129 = 0;
    }
  }
  else
  {
    v122 = 0;
    if (v128->_log)
    {
      v68 = v128->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v67 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v67 = init_default_corebrightness_log();
      v68 = v67;
    }
    v122 = v68;
    v121 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v65 = v122;
      v66 = v121;
      __os_log_helper_16_0_0(v120);
      _os_log_error_impl(&dword_1B5291000, v65, v66, "Service is null", v120, 2u);
    }
    v129 = 0;
  }
  return v129 & 1;
}

- (CBTwilightNightShiftAdaptationParams)initWithService:(unsigned int)a3
{
  os_log_t v3;
  CBFloatArray *v4;
  uint64_t v5;
  CBFloatArray *v6;
  uint64_t v7;
  uint64_t v8;
  float *cctDeltaTableOG;
  uint64_t v11;
  CBFloatArray2D *v12;
  char v13;
  objc_super v14;
  unsigned int v15;
  SEL v16;
  CBTwilightNightShiftAdaptationParams *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBTwilightNightShiftAdaptationParams;
  v17 = -[CBTwilightNightShiftAdaptationParams init](&v14, sel_init);
  if (v17)
  {
    v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "TwilightNightShiftAdaptation");
    v17->_log = (OS_os_log *)v3;
    v13 = 0;
    if (-[CBTwilightNightShiftAdaptationParams loadParametersFromService:](v17, "loadParametersFromService:", v15))
    {
      v4 = [CBFloatArray alloc];
      v5 = -[CBFloatArray initWithValues:andCount:](v4, "initWithValues:andCount:", v17->_cctTableOG, v17->_cctTableSizeOG);
      v17->_cctTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      v7 = -[CBFloatArray initWithValues:andCount:](v6, "initWithValues:andCount:", v17->_twilightStrengthTableOG, v17->_twilightStrengthTableSizeOG);
      v17->_twilightStrengthTable = (CBFloatArray *)v7;
      v12 = [CBFloatArray2D alloc];
      cctDeltaTableOG = v17->_cctDeltaTableOG;
      v11 = -[CBFloatArray count](v17->_cctTable, "count");
      v8 = -[CBFloatArray2D initWithValues:andCountCols:andRows:](v12, "initWithValues:andCountCols:andRows:", cctDeltaTableOG, v11, -[CBFloatArray count](v17->_twilightStrengthTable, "count"));
      v17->_cctDeltaTable = (CBFloatArray2D *)v8;
      v13 = 1;
    }
    if (v17->_cctTableOG)
      free(v17->_cctTableOG);
    if (v17->_twilightStrengthTableOG)
      free(v17->_twilightStrengthTableOG);
    if (v17->_cctDeltaTableOG)
      free(v17->_cctDeltaTableOG);
    if ((v13 & 1) == 0)
    {

      return 0;
    }
  }
  return v17;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBTwilightNightShiftAdaptationParams *v4;

  v4 = self;
  v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBTwilightNightShiftAdaptationParams;
  -[CBTwilightNightShiftAdaptationParams dealloc](&v2, sel_dealloc);
}

- (CBFloatArray)cctTable
{
  return self->_cctTable;
}

- (CBFloatArray)twilightStrengthTable
{
  return self->_twilightStrengthTable;
}

- (CBFloatArray2D)cctDeltaTable
{
  return self->_cctDeltaTable;
}

@end
