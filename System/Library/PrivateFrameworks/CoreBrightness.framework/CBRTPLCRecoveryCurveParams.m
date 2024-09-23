@implementation CBRTPLCRecoveryCurveParams

- (BOOL)loadParametersFromService:(unsigned int)a3
{
  const char *v3;
  const char *v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t inited;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *log;
  os_log_type_t v45;
  uint64_t v46;
  NSObject *v47;
  unint64_t ii;
  id v49;
  unint64_t n;
  id v51;
  uint8_t v52[7];
  os_log_type_t v53;
  os_log_t oslog;
  unint64_t m;
  os_log_type_t v56;
  os_log_t v57;
  unint64_t k;
  uint8_t v59[7];
  os_log_type_t v60;
  NSObject *v61;
  uint8_t v62[7];
  os_log_type_t v63;
  NSObject *v64;
  uint8_t v65[7];
  os_log_type_t v66;
  NSObject *v67;
  unint64_t j;
  os_log_type_t v69;
  os_log_t v70;
  unint64_t i;
  uint8_t v72[7];
  os_log_type_t v73;
  NSObject *v74;
  uint8_t v75[7];
  os_log_type_t v76;
  NSObject *v77;
  float v78;
  float fixed_float_from_edt;
  uint8_t v80[15];
  os_log_type_t type;
  NSObject *v82;
  io_registry_entry_t v83;
  SEL v84;
  CBRTPLCRecoveryCurveParams *v85;
  char v86;
  float v87;
  float v88;
  uint8_t v89[16];
  uint8_t v90[16];
  uint8_t v91[16];
  uint8_t v92[16];
  uint8_t v93[32];
  uint8_t v94[48];
  uint8_t v95[24];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v85 = self;
  v84 = a2;
  v83 = a3;
  if (a3)
  {
    fixed_float_from_edt = load_fixed_float_from_edt(v83, CFSTR("LminProduct"));
    v88 = fixed_float_from_edt;
    v78 = load_fixed_float_from_edt(v83, CFSTR("edr-max-nits"));
    v87 = v78;
    v85->_apceTableSizeEDT = load_float_array_from_edt(v83, CFSTR("rtplc-hdr-recovery-curve-apce"), &v85->_apceTableEDT);
    if (v85->_apceTableEDT)
    {
      if (v85->_apceTableSizeEDT)
      {
        for (i = 0; i < v85->_apceTableSizeEDT; ++i)
        {
          if (v85->_apceTableEDT[i] < 0.0 || v85->_apceTableEDT[i] > 1.0)
          {
            v70 = 0;
            if (v85->_log)
            {
              v35 = v85->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                inited = init_default_corebrightness_log();
              v35 = inited;
            }
            v70 = v35;
            v69 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_2_8_0_8_0((uint64_t)v95, i, COERCE__INT64(v85->_apceTableEDT[i]));
              _os_log_error_impl(&dword_1B5291000, v70, v69, "The HDR recovery curve APCE table element #%lu with value %f is out of the valid [0, 1] range", v95, 0x16u);
            }
            v86 = 0;
            return v86 & 1;
          }
        }
        for (j = 0; j < v85->_apceTableSizeEDT - 1; ++j)
        {
          if (v85->_apceTableEDT[j] > v85->_apceTableEDT[j + 1])
          {
            v67 = 0;
            if (v85->_log)
            {
              v33 = v85->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v32 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v32 = init_default_corebrightness_log();
              v33 = v32;
            }
            v67 = v33;
            v66 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v30 = v67;
              v31 = v66;
              __os_log_helper_16_0_0(v65);
              _os_log_error_impl(&dword_1B5291000, v30, v31, "The HDR recovery curve APCE table is not monotonically non-decreasing", v65, 2u);
            }
            v86 = 0;
            return v86 & 1;
          }
        }
        v85->_nitsTableSizeEDT = load_float_array_from_edt(v83, CFSTR("rtplc-hdr-recovery-curve-nits"), &v85->_nitsTableEDT);
        if (v85->_nitsTableEDT)
        {
          if (v85->_nitsTableSizeEDT)
          {
            for (k = 0; k < v85->_nitsTableSizeEDT; ++k)
            {
              if (v85->_nitsTableEDT[k] < fixed_float_from_edt || v85->_nitsTableEDT[k] > v78)
              {
                v57 = 0;
                if (v85->_log)
                {
                  v21 = v85->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v20 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v20 = init_default_corebrightness_log();
                  v21 = v20;
                }
                v57 = v21;
                v56 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v94, k, COERCE__INT64(v85->_nitsTableEDT[k]), COERCE__INT64(fixed_float_from_edt), COERCE__INT64(v78));
                  _os_log_error_impl(&dword_1B5291000, v57, v56, "The HDR recovery curve nits table element #%lu with value %f is out of the valid [%f, %f] range", v94, 0x2Au);
                }
                v86 = 0;
                return v86 & 1;
              }
            }
            for (m = 0; m < v85->_nitsTableSizeEDT - 1; ++m)
            {
              if (v85->_nitsTableEDT[m] < v85->_nitsTableEDT[m + 1])
              {
                oslog = 0;
                if (v85->_log)
                {
                  v19 = v85->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v18 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v18 = init_default_corebrightness_log();
                  v19 = v18;
                }
                oslog = v19;
                v53 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v16 = oslog;
                  v17 = v53;
                  __os_log_helper_16_0_0(v52);
                  _os_log_error_impl(&dword_1B5291000, v16, v17, "The HDR recovery curve nits table is not monotonically non-increasing", v52, 2u);
                }
                v86 = 0;
                return v86 & 1;
              }
            }
            if (v85->_apceTableSizeEDT == v85->_nitsTableSizeEDT)
            {
              v51 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
              for (n = 0; n < v85->_apceTableSizeEDT; ++n)
              {
                v3 = "";
                if (n != v85->_apceTableSizeEDT - 1)
                  v3 = ",";
                objc_msgSend(v51, "appendFormat:", CFSTR(" %f%s"), v85->_apceTableEDT[n], v3);
              }
              objc_msgSend(v51, "appendString:", CFSTR(" "));
              v49 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
              for (ii = 0; ii < v85->_nitsTableSizeEDT; ++ii)
              {
                v4 = "";
                if (ii != v85->_nitsTableSizeEDT - 1)
                  v4 = ",";
                objc_msgSend(v49, "appendFormat:", CFSTR(" %f%s"), v85->_nitsTableEDT[ii], v4);
              }
              objc_msgSend(v49, "appendString:", CFSTR(" "));
              if (v85->_log)
              {
                v13 = v85->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v12 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v12 = init_default_corebrightness_log();
                v13 = v12;
              }
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v92, v85->_apceTableSizeEDT);
                _os_log_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEFAULT, "APCETableSize=%lu", v92, 0xCu);
              }
              if (v85->_log)
              {
                v11 = v85->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v10 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v10 = init_default_corebrightness_log();
                v11 = v10;
              }
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_2_1_8_32((uint64_t)v91, objc_msgSend(v51, "UTF8String"));
                _os_log_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEFAULT, "APCETable={%s}", v91, 0xCu);
              }
              if (v85->_log)
              {
                v9 = v85->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v8 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v8 = init_default_corebrightness_log();
                v9 = v8;
              }
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v90, v85->_nitsTableSizeEDT);
                _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "NitsTableSize=%lu", v90, 0xCu);
              }
              if (v85->_log)
              {
                v7 = v85->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v6 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v6 = init_default_corebrightness_log();
                v7 = v6;
              }
              if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_2_1_8_32((uint64_t)v89, objc_msgSend(v49, "UTF8String"));
                _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "NitsTable={%s}", v89, 0xCu);
              }

              v86 = 1;
            }
            else
            {
              if (v85->_log)
              {
                v15 = v85->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v14 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v14 = init_default_corebrightness_log();
                v15 = v14;
              }
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v93, v85->_apceTableSizeEDT, v85->_nitsTableSizeEDT);
                _os_log_error_impl(&dword_1B5291000, v15, OS_LOG_TYPE_ERROR, "The HDR recovery curve nits table and APCE table do not have matching size (apce.size=%lu, nits.size=%lu)", v93, 0x16u);
              }
              v86 = 0;
            }
          }
          else
          {
            v61 = 0;
            if (v85->_log)
            {
              v25 = v85->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v24 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v24 = init_default_corebrightness_log();
              v25 = v24;
            }
            v61 = v25;
            v60 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v22 = v61;
              v23 = v60;
              __os_log_helper_16_0_0(v59);
              _os_log_error_impl(&dword_1B5291000, v22, v23, "The HDR recovery curve nits table has less than one element", v59, 2u);
            }
            v86 = 0;
          }
        }
        else
        {
          v64 = 0;
          if (v85->_log)
          {
            v29 = v85->_log;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v28 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v28 = init_default_corebrightness_log();
            v29 = v28;
          }
          v64 = v29;
          v63 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v26 = v64;
            v27 = v63;
            __os_log_helper_16_0_0(v62);
            _os_log_error_impl(&dword_1B5291000, v26, v27, "Unable to load the HDR recovery curve nits table", v62, 2u);
          }
          v86 = 0;
        }
      }
      else
      {
        v74 = 0;
        if (v85->_log)
        {
          v39 = v85->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v38 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v38 = init_default_corebrightness_log();
          v39 = v38;
        }
        v74 = v39;
        v73 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v36 = v74;
          v37 = v73;
          __os_log_helper_16_0_0(v72);
          _os_log_error_impl(&dword_1B5291000, v36, v37, "The HDR recovery curve APCE table has less than one element", v72, 2u);
        }
        v86 = 0;
      }
    }
    else
    {
      v77 = 0;
      if (v85->_log)
      {
        v43 = v85->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v42 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v42 = init_default_corebrightness_log();
        v43 = v42;
      }
      v77 = v43;
      v76 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v40 = v77;
        v41 = v76;
        __os_log_helper_16_0_0(v75);
        _os_log_error_impl(&dword_1B5291000, v40, v41, "Unable to load the HDR recovery curve APCE table", v75, 2u);
      }
      v86 = 0;
    }
  }
  else
  {
    v82 = 0;
    if (v85->_log)
    {
      v47 = v85->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v46 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v46 = init_default_corebrightness_log();
      v47 = v46;
    }
    v82 = v47;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      log = v82;
      v45 = type;
      __os_log_helper_16_0_0(v80);
      _os_log_error_impl(&dword_1B5291000, log, v45, "Service is null", v80, 2u);
    }
    v86 = 0;
  }
  return v86 & 1;
}

- (CBRTPLCRecoveryCurveParams)initWithService:(unsigned int)a3
{
  os_log_t v3;
  CBFloatArray *v4;
  uint64_t v5;
  CBFloatArray *v6;
  uint64_t v7;
  char v9;
  objc_super v10;
  unsigned int v11;
  SEL v12;
  CBRTPLCRecoveryCurveParams *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CBRTPLCRecoveryCurveParams;
  v13 = -[CBRTPLCRecoveryCurveParams init](&v10, sel_init);
  if (v13)
  {
    v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "RTPLCRecoveryCurve");
    v13->_log = (OS_os_log *)v3;
    v9 = 0;
    if (-[CBRTPLCRecoveryCurveParams loadParametersFromService:](v13, "loadParametersFromService:", v11))
    {
      v4 = [CBFloatArray alloc];
      v5 = -[CBFloatArray initWithValues:andCount:](v4, "initWithValues:andCount:", v13->_apceTableEDT, v13->_apceTableSizeEDT);
      v13->_apce = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      v7 = -[CBFloatArray initWithValues:andCount:](v6, "initWithValues:andCount:", v13->_nitsTableEDT, v13->_nitsTableSizeEDT);
      v13->_nits = (CBFloatArray *)v7;
      v9 = 1;
    }
    if (v13->_apceTableEDT)
      free(v13->_apceTableEDT);
    if (v13->_nitsTableEDT)
      free(v13->_nitsTableEDT);
    if ((v9 & 1) == 0)
    {

      return 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBRTPLCRecoveryCurveParams *v4;

  v4 = self;
  v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRTPLCRecoveryCurveParams;
  -[CBRTPLCRecoveryCurveParams dealloc](&v2, sel_dealloc);
}

- (CBFloatArray)apce
{
  return self->_apce;
}

- (CBFloatArray)nits
{
  return self->_nits;
}

@end
