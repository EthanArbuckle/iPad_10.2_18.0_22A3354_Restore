@implementation CBChromaticCorrectionParams

- (float)luxActivationThreshold
{
  return self->_luxActivationThreshold;
}

- (CBFloatArray)nitsTable
{
  return self->_nitsTable;
}

- (float)nitsActivationThreshold
{
  return self->_nitsActivationThreshold;
}

- (float)rampUpLuxDeltaThreshold
{
  return self->_rampUpLuxDeltaThreshold;
}

- (float)rampDownLuxDeltaThreshold
{
  return self->_rampDownLuxDeltaThreshold;
}

- (float)getStrengthForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  return matrix_element((uint64_t)self->_strengthTableOG, a3, a4, self->_nitsTableSizeOG);
}

- (id)initFromTwilightFromService:(unsigned int)a3
{
  os_log_t v3;
  CBFloatArray *v4;
  uint64_t v5;
  CBFloatArray *v6;
  uint64_t v7;
  uint64_t v8;
  CBFloatArray *v9;
  uint64_t v10;
  float *strengthTableOG;
  uint64_t v13;
  CBFloatArray2D *v14;
  char v15;
  objc_super v16;
  unsigned int v17;
  SEL v18;
  CBChromaticCorrectionParams *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBChromaticCorrectionParams;
  v19 = -[CBChromaticCorrectionParams init](&v16, sel_init);
  if (v19)
  {
    v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "Twilight");
    v19->_log = (OS_os_log *)v3;
    v15 = 0;
    if (-[CBChromaticCorrectionParams initFromTwilightFromServiceOG:](v19, "initFromTwilightFromServiceOG:", v17))
    {
      v4 = [CBFloatArray alloc];
      v5 = -[CBFloatArray initWithValues:andCount:](v4, "initWithValues:andCount:", v19->_luxTableOG, v19->_luxTableSizeOG);
      v19->_luxTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      v7 = -[CBFloatArray initWithValues:andCount:](v6, "initWithValues:andCount:", v19->_nitsTableOG, v19->_nitsTableSizeOG);
      v19->_nitsTable = (CBFloatArray *)v7;
      v14 = [CBFloatArray2D alloc];
      strengthTableOG = v19->_strengthTableOG;
      v13 = -[CBFloatArray count](v19->_nitsTable, "count");
      v8 = -[CBFloatArray2D initWithValues:andCountCols:andRows:](v14, "initWithValues:andCountCols:andRows:", strengthTableOG, v13, -[CBFloatArray count](v19->_luxTable, "count"));
      v19->_strengthTable = (CBFloatArray2D *)v8;
      v9 = [CBFloatArray alloc];
      v10 = -[CBFloatArray initWithValues:andCount:](v9, "initWithValues:andCount:", v19->_rampBezierAnchorsOG, 3);
      v19->_rampBezierAnchors = (CBFloatArray *)v10;
      v15 = 1;
    }
    if (v19->_luxTableOG)
      free(v19->_luxTableOG);
    if (v19->_nitsTableOG)
      free(v19->_nitsTableOG);
    if (v19->_strengthTableOG)
      free(v19->_strengthTableOG);
    if (v19->_rampBezierAnchorsOG)
      free(v19->_rampBezierAnchorsOG);
    if ((v15 & 1) == 0)
    {

      return 0;
    }
  }
  return v19;
}

- (id)initFromAmmoliteFromService:(unsigned int)a3
{
  os_log_t v3;
  CBFloatArray *v4;
  uint64_t v5;
  CBFloatArray *v6;
  uint64_t v7;
  uint64_t v8;
  CBFloatArray *v9;
  uint64_t v10;
  float *strengthTableOG;
  uint64_t v13;
  CBFloatArray2D *v14;
  char v15;
  objc_super v16;
  unsigned int v17;
  SEL v18;
  CBChromaticCorrectionParams *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBChromaticCorrectionParams;
  v19 = -[CBChromaticCorrectionParams init](&v16, sel_init);
  if (v19)
  {
    v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "Ammolite");
    v19->_log = (OS_os_log *)v3;
    v15 = 0;
    if (-[CBChromaticCorrectionParams initAmmoliteFromServiceOG:](v19, "initAmmoliteFromServiceOG:", v17))
    {
      v4 = [CBFloatArray alloc];
      v5 = -[CBFloatArray initWithValues:andCount:](v4, "initWithValues:andCount:", v19->_luxTableOG, v19->_luxTableSizeOG);
      v19->_luxTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      v7 = -[CBFloatArray initWithValues:andCount:](v6, "initWithValues:andCount:", v19->_nitsTableOG, v19->_nitsTableSizeOG);
      v19->_nitsTable = (CBFloatArray *)v7;
      v14 = [CBFloatArray2D alloc];
      strengthTableOG = v19->_strengthTableOG;
      v13 = -[CBFloatArray count](v19->_nitsTable, "count");
      v8 = -[CBFloatArray2D initWithValues:andCountCols:andRows:](v14, "initWithValues:andCountCols:andRows:", strengthTableOG, v13, -[CBFloatArray count](v19->_luxTable, "count"));
      v19->_strengthTable = (CBFloatArray2D *)v8;
      v9 = [CBFloatArray alloc];
      v10 = -[CBFloatArray initWithValues:andCount:](v9, "initWithValues:andCount:", v19->_rampBezierAnchorsOG, 3);
      v19->_rampBezierAnchors = (CBFloatArray *)v10;
      v15 = 1;
    }
    if (v19->_luxTableOG)
      free(v19->_luxTableOG);
    if (v19->_nitsTableOG)
      free(v19->_nitsTableOG);
    if (v19->_strengthTableOG)
      free(v19->_strengthTableOG);
    if (v19->_rampBezierAnchorsOG)
      free(v19->_rampBezierAnchorsOG);
    if ((v15 & 1) == 0)
    {

      return 0;
    }
  }
  return v19;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBChromaticCorrectionParams *v4;

  v4 = self;
  v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBChromaticCorrectionParams;
  -[CBChromaticCorrectionParams dealloc](&v2, sel_dealloc);
}

- (BOOL)initAmmoliteFromServiceOG:(unsigned int)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  const char *v8;
  const char *v9;
  float v10;
  float v11;
  double v12;
  const char *v13;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  NSObject *v88;
  float v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  NSObject *v93;
  float v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  NSObject *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  NSObject *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint64_t inited;
  NSObject *v120;
  uint64_t v121;
  NSObject *v122;
  NSObject *v123;
  os_log_type_t v124;
  uint64_t v125;
  NSObject *v126;
  NSObject *v127;
  os_log_type_t v128;
  uint64_t v129;
  NSObject *v130;
  NSObject *v131;
  os_log_type_t v132;
  uint64_t v133;
  NSObject *v134;
  NSObject *v135;
  os_log_type_t v136;
  uint64_t v137;
  NSObject *v138;
  NSObject *v139;
  os_log_type_t v140;
  uint64_t v141;
  NSObject *v142;
  NSObject *log;
  os_log_type_t v144;
  uint64_t v145;
  NSObject *v146;
  unint64_t jj;
  id v148;
  unint64_t ii;
  unint64_t n;
  id v151;
  unint64_t m;
  id v153;
  uint8_t v154[7];
  os_log_type_t v155;
  NSObject *v156;
  uint8_t v157[7];
  os_log_type_t v158;
  NSObject *v159;
  uint8_t v160[7];
  os_log_type_t v161;
  NSObject *v162;
  uint8_t v163[7];
  os_log_type_t v164;
  NSObject *v165;
  uint8_t v166[7];
  os_log_type_t v167;
  NSObject *v168;
  uint8_t v169[7];
  os_log_type_t v170;
  NSObject *v171;
  uint8_t v172[7];
  os_log_type_t v173;
  NSObject *v174;
  uint8_t v175[7];
  os_log_type_t v176;
  NSObject *v177;
  uint8_t v178[7];
  os_log_type_t v179;
  NSObject *v180;
  uint8_t v181[15];
  os_log_type_t v182;
  NSObject *v183;
  unint64_t float_array_from_edt;
  os_log_type_t v185;
  os_log_t v186;
  unint64_t kk;
  unint64_t v188;
  os_log_type_t v189;
  os_log_t v190;
  float v191;
  os_log_type_t v192;
  os_log_t v193;
  unint64_t mm;
  unint64_t v195;
  os_log_type_t v196;
  os_log_t v197;
  unint64_t k;
  os_log_type_t v199;
  os_log_t v200;
  uint8_t v201[7];
  os_log_type_t v202;
  NSObject *v203;
  uint8_t v204[15];
  os_log_type_t v205;
  NSObject *v206;
  unint64_t j;
  os_log_type_t v208;
  os_log_t v209;
  uint8_t v210[7];
  os_log_type_t v211;
  NSObject *v212;
  uint8_t v213[7];
  os_log_type_t v214;
  NSObject *v215;
  uint8_t v216[15];
  os_log_type_t v217;
  NSObject *v218;
  unint64_t i;
  os_log_type_t v220;
  os_log_t v221;
  uint8_t v222[7];
  os_log_type_t v223;
  NSObject *v224;
  uint8_t v225[7];
  os_log_type_t v226;
  NSObject *v227;
  uint8_t v228[7];
  os_log_type_t v229;
  NSObject *v230;
  uint8_t v231[7];
  os_log_type_t v232;
  NSObject *v233;
  float fixed_float_from_edt;
  uint8_t v235[15];
  os_log_type_t v236;
  NSObject *v237;
  char v238;
  int v239;
  uint8_t v240[7];
  os_log_type_t type;
  NSObject *v242;
  io_registry_entry_t v243;
  SEL v244;
  CBChromaticCorrectionParams *v245;
  char v246;
  float aodRampDuration;
  float rampDownLuxDeltaThreshold;
  float rampDownDuration;
  float rampUpLuxDeltaThreshold;
  float rampUpDuration;
  float rampUpdateRate;
  float nitsActivationThreshold;
  float luxActivationThreshold;
  float v255;
  uint8_t v256[32];
  uint8_t v257[16];
  uint8_t v258[16];
  uint8_t v259[16];
  uint8_t v260[16];
  uint8_t v261[16];
  uint8_t v262[16];
  uint8_t v263[16];
  uint8_t v264[16];
  uint8_t v265[16];
  uint8_t v266[16];
  uint8_t v267[32];
  uint8_t v268[16];
  uint8_t v269[16];
  uint8_t v270[16];
  uint8_t v271[16];
  uint8_t v272[16];
  uint8_t v273[32];
  uint8_t v274[16];
  uint8_t v275[32];
  uint8_t v276[32];
  uint8_t v277[16];
  uint8_t v278[24];
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  v245 = self;
  v244 = a2;
  v243 = a3;
  if (a3)
  {
    v239 = 0;
    v238 = load_int_from_edt(v243, CFSTR("supports-ammolite"), &v239) & 1;
    if (v238 && v239)
    {
      fixed_float_from_edt = load_fixed_float_from_edt(v243, CFSTR("LmaxProduct"));
      v255 = fixed_float_from_edt;
      v245->_luxActivationThreshold = load_float_from_edt(v243, CFSTR("aml-lux-activation-threshold"));
      luxActivationThreshold = v245->_luxActivationThreshold;
      if (v245->_luxActivationThreshold >= 0.0)
      {
        v245->_nitsActivationThreshold = load_float_from_edt(v243, CFSTR("aml-nits-activation-threshold"));
        nitsActivationThreshold = v245->_nitsActivationThreshold;
        if (v245->_nitsActivationThreshold >= 0.0)
        {
          v245->_luxTableSizeOG = load_float_array_from_edt(v243, CFSTR("aml-lux-table"), &v245->_luxTableOG);
          if (v245->_luxTableOG)
          {
            if (v245->_luxTableSizeOG)
            {
              if (float_equal(*v245->_luxTableOG, v245->_luxActivationThreshold))
              {
                for (i = 0; i < v245->_luxTableSizeOG - 1; ++i)
                {
                  if (v245->_luxTableOG[i] >= v245->_luxTableOG[i + 1])
                  {
                    v218 = 0;
                    if (v245->_log)
                    {
                      v120 = v245->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                        inited = _COREBRIGHTNESS_LOG_DEFAULT;
                      else
                        inited = init_default_corebrightness_log();
                      v120 = inited;
                    }
                    v218 = v120;
                    v217 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                    {
                      v117 = v218;
                      v118 = v217;
                      __os_log_helper_16_0_0(v216);
                      _os_log_error_impl(&dword_1B5291000, v117, v118, "Lux table is not monotonically increasing", v216, 2u);
                    }
                    v246 = 0;
                    return v246 & 1;
                  }
                }
                v245->_nitsTableSizeOG = load_float_array_from_edt(v243, CFSTR("aml-nits-table"), &v245->_nitsTableOG);
                if (v245->_nitsTableOG)
                {
                  if (v245->_nitsTableSizeOG)
                  {
                    if (float_equal(v245->_nitsTableOG[v245->_nitsTableSizeOG - 1], fixed_float_from_edt))
                    {
                      for (j = 0; j < v245->_nitsTableSizeOG - 1; ++j)
                      {
                        if (v245->_nitsTableOG[j] >= v245->_nitsTableOG[j + 1])
                        {
                          v206 = 0;
                          if (v245->_log)
                          {
                            v106 = v245->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                              v105 = _COREBRIGHTNESS_LOG_DEFAULT;
                            else
                              v105 = init_default_corebrightness_log();
                            v106 = v105;
                          }
                          v206 = v106;
                          v205 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                          {
                            v103 = v206;
                            v104 = v205;
                            __os_log_helper_16_0_0(v204);
                            _os_log_error_impl(&dword_1B5291000, v103, v104, "Nits table is not monotonically increasing", v204, 2u);
                          }
                          v246 = 0;
                          return v246 & 1;
                        }
                      }
                      v245->_strengthTableSizeOG = load_float_array_from_edt(v243, CFSTR("aml-strength-table"), &v245->_strengthTableOG);
                      if (v245->_strengthTableOG)
                      {
                        if (v245->_strengthTableSizeOG == v245->_nitsTableSizeOG * v245->_luxTableSizeOG)
                        {
                          for (k = 0; k < v245->_strengthTableSizeOG; ++k)
                          {
                            if (v245->_strengthTableOG[k] < 0.0 || v245->_strengthTableOG[k] > 1.0)
                            {
                              v197 = 0;
                              if (v245->_log)
                              {
                                v96 = v245->_log;
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                  v95 = _COREBRIGHTNESS_LOG_DEFAULT;
                                else
                                  v95 = init_default_corebrightness_log();
                                v96 = v95;
                              }
                              v197 = v96;
                              v196 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v275, k, COERCE__INT64(v245->_strengthTableOG[k]));
                                _os_log_error_impl(&dword_1B5291000, v197, v196, "Strength table element #%lu with value %f is out of the valid [0, 1] range", v275, 0x16u);
                              }
                              v246 = 0;
                              return v246 & 1;
                            }
                          }
                          v195 = 0;
                          while (2)
                          {
                            if (v195 >= v245->_luxTableSizeOG)
                            {
                              v188 = 0;
LABEL_189:
                              if (v188 >= v245->_nitsTableSizeOG)
                              {
                                v245->_rampUpdateRate = load_float_from_edt(v243, CFSTR("aml-ramp-update-rate"));
                                rampUpdateRate = v245->_rampUpdateRate;
                                float_array_from_edt = load_float_array_from_edt(v243, CFSTR("aml-ramp-bezier-anchors"), &v245->_rampBezierAnchorsOG);
                                if (v245->_rampBezierAnchorsOG)
                                {
                                  if (float_array_from_edt == 3)
                                  {
                                    if (*v245->_rampBezierAnchorsOG >= 0.0 && *v245->_rampBezierAnchorsOG <= 1.0)
                                    {
                                      if (v245->_rampBezierAnchorsOG[1] >= 0.0 && v245->_rampBezierAnchorsOG[1] <= 1.0)
                                      {
                                        if (v245->_rampBezierAnchorsOG[2] >= 0.0
                                          && v245->_rampBezierAnchorsOG[2] <= 1.0)
                                        {
                                          v245->_rampUpDuration = load_float_from_edt(v243, CFSTR("aml-ramp-up-duration"));
                                          rampUpDuration = v245->_rampUpDuration;
                                          if (v245->_rampUpDuration >= 0.0)
                                          {
                                            v245->_rampUpLuxDeltaThreshold = load_float_from_edt(v243, CFSTR("aml-ramp-up-lux-threshold"));
                                            rampUpLuxDeltaThreshold = v245->_rampUpLuxDeltaThreshold;
                                            if (v245->_rampUpLuxDeltaThreshold >= 0.0)
                                            {
                                              v245->_rampDownDuration = load_float_from_edt(v243, CFSTR("aml-ramp-down-duration"));
                                              rampDownDuration = v245->_rampDownDuration;
                                              if (v245->_rampDownDuration >= 0.0)
                                              {
                                                v245->_rampDownLuxDeltaThreshold = load_float_from_edt(v243, CFSTR("aml-ramp-down-lux-threshold"));
                                                rampDownLuxDeltaThreshold = v245->_rampDownLuxDeltaThreshold;
                                                if (v245->_rampDownLuxDeltaThreshold >= 0.0)
                                                {
                                                  if (-[CBAODState isAODSupported](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODSupported")&& (v245->_aodRampDuration = load_float_from_edt(v243, CFSTR("aml-ramp-aod-duration")), aodRampDuration = v245->_aodRampDuration, v245->_aodRampDuration < 0.0))
                                                  {
                                                    v156 = 0;
                                                    if (v245->_log)
                                                    {
                                                      v50 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v49 = init_default_corebrightness_log();
                                                      v50 = v49;
                                                    }
                                                    v156 = v50;
                                                    v155 = OS_LOG_TYPE_ERROR;
                                                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                                                    {
                                                      v47 = v156;
                                                      v48 = v155;
                                                      __os_log_helper_16_0_0(v154);
                                                      _os_log_error_impl(&dword_1B5291000, v47, v48, "AOD ramp duration is negative", v154, 2u);
                                                    }
                                                    v246 = 0;
                                                  }
                                                  else
                                                  {
                                                    v153 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                    for (m = 0; m < v245->_luxTableSizeOG; ++m)
                                                    {
                                                      v8 = "";
                                                      if (m != v245->_luxTableSizeOG - 1)
                                                        v8 = ",";
                                                      objc_msgSend(v153, "appendFormat:", CFSTR(" %f%s"), v245->_luxTableOG[m], v8);
                                                    }
                                                    objc_msgSend(v153, "appendString:", CFSTR(" "));
                                                    v151 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                    for (n = 0; n < v245->_nitsTableSizeOG; ++n)
                                                    {
                                                      v9 = "";
                                                      if (n != v245->_nitsTableSizeOG - 1)
                                                        v9 = ",";
                                                      objc_msgSend(v151, "appendFormat:", CFSTR(" %f%s"), v245->_nitsTableOG[n], v9);
                                                    }
                                                    objc_msgSend(v151, "appendString:", CFSTR(" "));
                                                    if (v245->_log)
                                                    {
                                                      v46 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v45 = init_default_corebrightness_log();
                                                      v46 = v45;
                                                    }
                                                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v271, COERCE__INT64(fixed_float_from_edt));
                                                      _os_log_impl(&dword_1B5291000, v46, OS_LOG_TYPE_DEFAULT, "NitsMaximum=%f", v271, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v44 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v43 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v43 = init_default_corebrightness_log();
                                                      v44 = v43;
                                                    }
                                                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v270, COERCE__INT64(v245->_luxActivationThreshold));
                                                      _os_log_impl(&dword_1B5291000, v44, OS_LOG_TYPE_DEFAULT, "LuxActivationThreshold=%f", v270, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v42 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v41 = init_default_corebrightness_log();
                                                      v42 = v41;
                                                    }
                                                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v269, COERCE__INT64(v245->_nitsActivationThreshold));
                                                      _os_log_impl(&dword_1B5291000, v42, OS_LOG_TYPE_DEFAULT, "NitsActivationThreshold=%f", v269, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v40 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v39 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v39 = init_default_corebrightness_log();
                                                      v40 = v39;
                                                    }
                                                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v268, COERCE__INT64(v245->_rampUpdateRate));
                                                      _os_log_impl(&dword_1B5291000, v40, OS_LOG_TYPE_DEFAULT, "RampUpdateRate=%f", v268, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v38 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v37 = init_default_corebrightness_log();
                                                      v38 = v37;
                                                    }
                                                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v267, COERCE__INT64(*v245->_rampBezierAnchorsOG), COERCE__INT64(v245->_rampBezierAnchorsOG[1]), COERCE__INT64(v245->_rampBezierAnchorsOG[2]));
                                                      _os_log_impl(&dword_1B5291000, v38, OS_LOG_TYPE_DEFAULT, "RampBezierAnchors={ %f, %f, %f }", v267, 0x20u);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v36 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v35 = init_default_corebrightness_log();
                                                      v36 = v35;
                                                    }
                                                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v266, COERCE__INT64(v245->_rampUpDuration));
                                                      _os_log_impl(&dword_1B5291000, v36, OS_LOG_TYPE_DEFAULT, "RampUpDuration=%f", v266, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v34 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v33 = init_default_corebrightness_log();
                                                      v34 = v33;
                                                    }
                                                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v265, COERCE__INT64(v245->_rampUpLuxDeltaThreshold));
                                                      _os_log_impl(&dword_1B5291000, v34, OS_LOG_TYPE_DEFAULT, "RampUpLuxDeltaThreshold=%f", v265, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v32 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v31 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v31 = init_default_corebrightness_log();
                                                      v32 = v31;
                                                    }
                                                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v264, COERCE__INT64(v245->_rampDownDuration));
                                                      _os_log_impl(&dword_1B5291000, v32, OS_LOG_TYPE_DEFAULT, "RampDownDuration=%f", v264, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v30 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v29 = init_default_corebrightness_log();
                                                      v30 = v29;
                                                    }
                                                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v263, COERCE__INT64(v245->_rampDownLuxDeltaThreshold));
                                                      _os_log_impl(&dword_1B5291000, v30, OS_LOG_TYPE_DEFAULT, "RampDownLuxDeltaThreshold=%f", v263, 0xCu);
                                                    }
                                                    if (-[CBAODState isAODSupported](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODSupported"))
                                                    {
                                                      if (v245->_log)
                                                      {
                                                        v28 = v245->_log;
                                                      }
                                                      else
                                                      {
                                                        v27 = _COREBRIGHTNESS_LOG_DEFAULT
                                                            ? _COREBRIGHTNESS_LOG_DEFAULT
                                                            : init_default_corebrightness_log();
                                                        v28 = v27;
                                                      }
                                                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        -[CBChromaticCorrectionParams aodRampDuration](v245, "aodRampDuration");
                                                        __os_log_helper_16_0_1_8_0((uint64_t)v262, COERCE__INT64(v10));
                                                        _os_log_impl(&dword_1B5291000, v28, OS_LOG_TYPE_DEFAULT, "RampAODDuration=%f", v262, 0xCu);
                                                      }
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v26 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v25 = init_default_corebrightness_log();
                                                      v26 = v25;
                                                    }
                                                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v261, v245->_luxTableSizeOG);
                                                      _os_log_impl(&dword_1B5291000, v26, OS_LOG_TYPE_DEFAULT, "LuxTableSize=%lu", v261, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v24 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v23 = init_default_corebrightness_log();
                                                      v24 = v23;
                                                    }
                                                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_2_1_8_32((uint64_t)v260, objc_msgSend(v153, "UTF8String"));
                                                      _os_log_impl(&dword_1B5291000, v24, OS_LOG_TYPE_DEFAULT, "LuxTable={%s}", v260, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v22 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v21 = init_default_corebrightness_log();
                                                      v22 = v21;
                                                    }
                                                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v259, v245->_nitsTableSizeOG);
                                                      _os_log_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEFAULT, "NitsTableSize=%lu", v259, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v20 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v19 = init_default_corebrightness_log();
                                                      v20 = v19;
                                                    }
                                                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_2_1_8_32((uint64_t)v258, objc_msgSend(v151, "UTF8String"));
                                                      _os_log_impl(&dword_1B5291000, v20, OS_LOG_TYPE_DEFAULT, "NitsTable={%s}", v258, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v18 = v245->_log;
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
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v257, v245->_strengthTableSizeOG);
                                                      _os_log_impl(&dword_1B5291000, v18, OS_LOG_TYPE_DEFAULT, "StrengthTableSize=%lu", v257, 0xCu);
                                                    }
                                                    for (ii = 0; ii < v245->_luxTableSizeOG; ++ii)
                                                    {
                                                      v148 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                      for (jj = 0; jj < v245->_nitsTableSizeOG; ++jj)
                                                      {
                                                        -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", ii, jj);
                                                        v12 = v11;
                                                        v13 = "";
                                                        if (jj != v245->_nitsTableSizeOG - 1)
                                                          v13 = ",";
                                                        objc_msgSend(v148, "appendFormat:", CFSTR(" %f%s "), *(_QWORD *)&v12, v13);
                                                      }
                                                      if (v245->_log)
                                                      {
                                                        v16 = v245->_log;
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
                                                        __os_log_helper_16_2_2_8_0_8_32((uint64_t)v256, ii, objc_msgSend(v148, "UTF8String"));
                                                        _os_log_impl(&dword_1B5291000, v16, OS_LOG_TYPE_DEFAULT, "StrengthTable[%lu]={%s}", v256, 0x16u);
                                                      }

                                                    }
                                                    v246 = 1;
                                                  }
                                                }
                                                else
                                                {
                                                  v159 = 0;
                                                  if (v245->_log)
                                                  {
                                                    v54 = v245->_log;
                                                  }
                                                  else
                                                  {
                                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                      v53 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                    else
                                                      v53 = init_default_corebrightness_log();
                                                    v54 = v53;
                                                  }
                                                  v159 = v54;
                                                  v158 = OS_LOG_TYPE_ERROR;
                                                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                                                  {
                                                    v51 = v159;
                                                    v52 = v158;
                                                    __os_log_helper_16_0_0(v157);
                                                    _os_log_error_impl(&dword_1B5291000, v51, v52, "Ramp down lux delta threshold is negative", v157, 2u);
                                                  }
                                                  v246 = 0;
                                                }
                                              }
                                              else
                                              {
                                                v162 = 0;
                                                if (v245->_log)
                                                {
                                                  v58 = v245->_log;
                                                }
                                                else
                                                {
                                                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                    v57 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                  else
                                                    v57 = init_default_corebrightness_log();
                                                  v58 = v57;
                                                }
                                                v162 = v58;
                                                v161 = OS_LOG_TYPE_ERROR;
                                                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                                                {
                                                  v55 = v162;
                                                  v56 = v161;
                                                  __os_log_helper_16_0_0(v160);
                                                  _os_log_error_impl(&dword_1B5291000, v55, v56, "Ramp down duration is negative", v160, 2u);
                                                }
                                                v246 = 0;
                                              }
                                            }
                                            else
                                            {
                                              v165 = 0;
                                              if (v245->_log)
                                              {
                                                v62 = v245->_log;
                                              }
                                              else
                                              {
                                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                  v61 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                else
                                                  v61 = init_default_corebrightness_log();
                                                v62 = v61;
                                              }
                                              v165 = v62;
                                              v164 = OS_LOG_TYPE_ERROR;
                                              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                                              {
                                                v59 = v165;
                                                v60 = v164;
                                                __os_log_helper_16_0_0(v163);
                                                _os_log_error_impl(&dword_1B5291000, v59, v60, "Ramp up lux delta threshold is negative", v163, 2u);
                                              }
                                              v246 = 0;
                                            }
                                          }
                                          else
                                          {
                                            v168 = 0;
                                            if (v245->_log)
                                            {
                                              v66 = v245->_log;
                                            }
                                            else
                                            {
                                              if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                v65 = _COREBRIGHTNESS_LOG_DEFAULT;
                                              else
                                                v65 = init_default_corebrightness_log();
                                              v66 = v65;
                                            }
                                            v168 = v66;
                                            v167 = OS_LOG_TYPE_ERROR;
                                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                            {
                                              v63 = v168;
                                              v64 = v167;
                                              __os_log_helper_16_0_0(v166);
                                              _os_log_error_impl(&dword_1B5291000, v63, v64, "Ramp up duration is negative", v166, 2u);
                                            }
                                            v246 = 0;
                                          }
                                        }
                                        else
                                        {
                                          v171 = 0;
                                          if (v245->_log)
                                          {
                                            v70 = v245->_log;
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                              v69 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            else
                                              v69 = init_default_corebrightness_log();
                                            v70 = v69;
                                          }
                                          v171 = v70;
                                          v170 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                          {
                                            v67 = v171;
                                            v68 = v170;
                                            __os_log_helper_16_0_0(v169);
                                            _os_log_error_impl(&dword_1B5291000, v67, v68, "Third ramp Bezier anchor is out of valid [0, 1] range", v169, 2u);
                                          }
                                          v246 = 0;
                                        }
                                      }
                                      else
                                      {
                                        v174 = 0;
                                        if (v245->_log)
                                        {
                                          v74 = v245->_log;
                                        }
                                        else
                                        {
                                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                                            v73 = _COREBRIGHTNESS_LOG_DEFAULT;
                                          else
                                            v73 = init_default_corebrightness_log();
                                          v74 = v73;
                                        }
                                        v174 = v74;
                                        v173 = OS_LOG_TYPE_ERROR;
                                        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                                        {
                                          v71 = v174;
                                          v72 = v173;
                                          __os_log_helper_16_0_0(v172);
                                          _os_log_error_impl(&dword_1B5291000, v71, v72, "Second ramp Bezier anchor is out of valid [0, 1] range", v172, 2u);
                                        }
                                        v246 = 0;
                                      }
                                    }
                                    else
                                    {
                                      v177 = 0;
                                      if (v245->_log)
                                      {
                                        v78 = v245->_log;
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                                          v77 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        else
                                          v77 = init_default_corebrightness_log();
                                        v78 = v77;
                                      }
                                      v177 = v78;
                                      v176 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                                      {
                                        v75 = v177;
                                        v76 = v176;
                                        __os_log_helper_16_0_0(v175);
                                        _os_log_error_impl(&dword_1B5291000, v75, v76, "First ramp Bezier anchor is out of valid [0, 1] range", v175, 2u);
                                      }
                                      v246 = 0;
                                    }
                                  }
                                  else
                                  {
                                    v180 = 0;
                                    if (v245->_log)
                                    {
                                      v82 = v245->_log;
                                    }
                                    else
                                    {
                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                        v81 = _COREBRIGHTNESS_LOG_DEFAULT;
                                      else
                                        v81 = init_default_corebrightness_log();
                                      v82 = v81;
                                    }
                                    v180 = v82;
                                    v179 = OS_LOG_TYPE_ERROR;
                                    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                                    {
                                      v79 = v180;
                                      v80 = v179;
                                      __os_log_helper_16_0_0(v178);
                                      _os_log_error_impl(&dword_1B5291000, v79, v80, "Incorrect number of ramp Bezier anchors", v178, 2u);
                                    }
                                    v246 = 0;
                                  }
                                }
                                else
                                {
                                  v183 = 0;
                                  if (v245->_log)
                                  {
                                    v86 = v245->_log;
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                      v85 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    else
                                      v85 = init_default_corebrightness_log();
                                    v86 = v85;
                                  }
                                  v183 = v86;
                                  v182 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                                  {
                                    v83 = v183;
                                    v84 = v182;
                                    __os_log_helper_16_0_0(v181);
                                    _os_log_error_impl(&dword_1B5291000, v83, v84, "Unable to load ramp Bezier anchors", v181, 2u);
                                  }
                                  v246 = 0;
                                }
                              }
                              else
                              {
                                for (kk = 0; ; ++kk)
                                {
                                  if (kk >= v245->_luxTableSizeOG - 1)
                                  {
                                    ++v188;
                                    goto LABEL_189;
                                  }
                                  -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", kk, v188);
                                  v89 = v6;
                                  -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", kk + 1, v188);
                                  if (v89 > v7)
                                    break;
                                }
                                v186 = 0;
                                if (v245->_log)
                                {
                                  v88 = v245->_log;
                                }
                                else
                                {
                                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                                    v87 = _COREBRIGHTNESS_LOG_DEFAULT;
                                  else
                                    v87 = init_default_corebrightness_log();
                                  v88 = v87;
                                }
                                v186 = v88;
                                v185 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                                {
                                  __os_log_helper_16_0_1_8_0((uint64_t)v272, v188);
                                  _os_log_error_impl(&dword_1B5291000, v186, v185, "Strength table column #%lu is not monotonically non-decreasing", v272, 0xCu);
                                }
                                v246 = 0;
                              }
                            }
                            else
                            {
                              for (mm = 0; mm < v245->_nitsTableSizeOG - 1; ++mm)
                              {
                                -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", v195, mm);
                                v94 = v3;
                                -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", v195, mm + 1);
                                if (v94 > v4)
                                {
                                  v193 = 0;
                                  if (v245->_log)
                                  {
                                    v93 = v245->_log;
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                      v92 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    else
                                      v92 = init_default_corebrightness_log();
                                    v93 = v92;
                                  }
                                  v193 = v93;
                                  v192 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_1_8_0((uint64_t)v274, v195);
                                    _os_log_error_impl(&dword_1B5291000, v193, v192, "Strength table row #%lu is not monotonically non-decreasing", v274, 0xCu);
                                  }
                                  v246 = 0;
                                  return v246 & 1;
                                }
                              }
                              -[CBChromaticCorrectionParams getStrengthForRow:andColumn:](v245, "getStrengthForRow:andColumn:", v195, 0);
                              v191 = v5;
                              if (float_equal(v5, 0.0))
                              {
                                ++v195;
                                continue;
                              }
                              v190 = 0;
                              if (v245->_log)
                              {
                                v91 = v245->_log;
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                  v90 = _COREBRIGHTNESS_LOG_DEFAULT;
                                else
                                  v90 = init_default_corebrightness_log();
                                v91 = v90;
                              }
                              v190 = v91;
                              v189 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v273, v195, COERCE__INT64(v191));
                                _os_log_error_impl(&dword_1B5291000, v190, v189, "First element of strength table row #%lu with value %f is not 0", v273, 0x16u);
                              }
                              v246 = 0;
                            }
                            break;
                          }
                        }
                        else
                        {
                          v200 = 0;
                          if (v245->_log)
                          {
                            v98 = v245->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                              v97 = _COREBRIGHTNESS_LOG_DEFAULT;
                            else
                              v97 = init_default_corebrightness_log();
                            v98 = v97;
                          }
                          v200 = v98;
                          v199 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                          {
                            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v276, v245->_strengthTableSizeOG, v245->_luxTableSizeOG, v245->_nitsTableSizeOG);
                            _os_log_error_impl(&dword_1B5291000, v200, v199, "Strength table has wrong size %lu for lux table size %lu and nits table size %lu", v276, 0x20u);
                          }
                          v246 = 0;
                        }
                      }
                      else
                      {
                        v203 = 0;
                        if (v245->_log)
                        {
                          v102 = v245->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v101 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v101 = init_default_corebrightness_log();
                          v102 = v101;
                        }
                        v203 = v102;
                        v202 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                        {
                          v99 = v203;
                          v100 = v202;
                          __os_log_helper_16_0_0(v201);
                          _os_log_error_impl(&dword_1B5291000, v99, v100, "Unable to load strength table", v201, 2u);
                        }
                        v246 = 0;
                      }
                    }
                    else
                    {
                      v209 = 0;
                      if (v245->_log)
                      {
                        v108 = v245->_log;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                          v107 = _COREBRIGHTNESS_LOG_DEFAULT;
                        else
                          v107 = init_default_corebrightness_log();
                        v108 = v107;
                      }
                      v209 = v108;
                      v208 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                      {
                        __os_log_helper_16_0_1_8_0((uint64_t)v277, COERCE__INT64(fixed_float_from_edt));
                        _os_log_error_impl(&dword_1B5291000, v209, v208, "Last element in the nits table is not %f", v277, 0xCu);
                      }
                      v246 = 0;
                    }
                  }
                  else
                  {
                    v212 = 0;
                    if (v245->_log)
                    {
                      v112 = v245->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                        v111 = _COREBRIGHTNESS_LOG_DEFAULT;
                      else
                        v111 = init_default_corebrightness_log();
                      v112 = v111;
                    }
                    v212 = v112;
                    v211 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    {
                      v109 = v212;
                      v110 = v211;
                      __os_log_helper_16_0_0(v210);
                      _os_log_error_impl(&dword_1B5291000, v109, v110, "Nits table has less than one element", v210, 2u);
                    }
                    v246 = 0;
                  }
                }
                else
                {
                  v215 = 0;
                  if (v245->_log)
                  {
                    v116 = v245->_log;
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                      v115 = _COREBRIGHTNESS_LOG_DEFAULT;
                    else
                      v115 = init_default_corebrightness_log();
                    v116 = v115;
                  }
                  v215 = v116;
                  v214 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                  {
                    v113 = v215;
                    v114 = v214;
                    __os_log_helper_16_0_0(v213);
                    _os_log_error_impl(&dword_1B5291000, v113, v114, "Unable to load nits table", v213, 2u);
                  }
                  v246 = 0;
                }
              }
              else
              {
                v221 = 0;
                if (v245->_log)
                {
                  v122 = v245->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v121 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v121 = init_default_corebrightness_log();
                  v122 = v121;
                }
                v221 = v122;
                v220 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v278, COERCE__INT64(v245->_luxActivationThreshold));
                  _os_log_error_impl(&dword_1B5291000, v221, v220, "First element in the lux table is not %f", v278, 0xCu);
                }
                v246 = 0;
              }
            }
            else
            {
              v224 = 0;
              if (v245->_log)
              {
                v126 = v245->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v125 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v125 = init_default_corebrightness_log();
                v126 = v125;
              }
              v224 = v126;
              v223 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                v123 = v224;
                v124 = v223;
                __os_log_helper_16_0_0(v222);
                _os_log_error_impl(&dword_1B5291000, v123, v124, "Lux table has less than one element", v222, 2u);
              }
              v246 = 0;
            }
          }
          else
          {
            v227 = 0;
            if (v245->_log)
            {
              v130 = v245->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v129 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v129 = init_default_corebrightness_log();
              v130 = v129;
            }
            v227 = v130;
            v226 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
            {
              v127 = v227;
              v128 = v226;
              __os_log_helper_16_0_0(v225);
              _os_log_error_impl(&dword_1B5291000, v127, v128, "Unable to load lux table", v225, 2u);
            }
            v246 = 0;
          }
        }
        else
        {
          v230 = 0;
          if (v245->_log)
          {
            v134 = v245->_log;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v133 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v133 = init_default_corebrightness_log();
            v134 = v133;
          }
          v230 = v134;
          v229 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            v131 = v230;
            v132 = v229;
            __os_log_helper_16_0_0(v228);
            _os_log_error_impl(&dword_1B5291000, v131, v132, "Ammolite Initialization | Nits activation threshold is negative", v228, 2u);
          }
          v246 = 0;
        }
      }
      else
      {
        v233 = 0;
        if (v245->_log)
        {
          v138 = v245->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v137 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v137 = init_default_corebrightness_log();
          v138 = v137;
        }
        v233 = v138;
        v232 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          v135 = v233;
          v136 = v232;
          __os_log_helper_16_0_0(v231);
          _os_log_error_impl(&dword_1B5291000, v135, v136, "Lux activation threshold is negative", v231, 2u);
        }
        v246 = 0;
      }
    }
    else
    {
      v237 = 0;
      if (v245->_log)
      {
        v142 = v245->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v141 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v141 = init_default_corebrightness_log();
        v142 = v141;
      }
      v237 = v142;
      v236 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
      {
        v139 = v237;
        v140 = v236;
        __os_log_helper_16_0_0(v235);
        _os_log_error_impl(&dword_1B5291000, v139, v140, "Ammolite is not supported", v235, 2u);
      }
      v246 = 0;
    }
  }
  else
  {
    v242 = 0;
    if (v245->_log)
    {
      v146 = v245->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v145 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v145 = init_default_corebrightness_log();
      v146 = v145;
    }
    v242 = v146;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
    {
      log = v242;
      v144 = type;
      __os_log_helper_16_0_0(v240);
      _os_log_error_impl(&dword_1B5291000, log, v144, "Service is null", v240, 2u);
    }
    v246 = 0;
  }
  return v246 & 1;
}

- (BOOL)initFromTwilightFromServiceOG:(unsigned int)a3
{
  void *v3;
  uint64_t v4;
  io_registry_entry_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  const char *v12;
  const char *v13;
  float v14;
  float v15;
  double v16;
  const char *v17;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  NSObject *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  float v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  float v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  NSObject *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint64_t v107;
  NSObject *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  NSObject *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint64_t v119;
  NSObject *v120;
  NSObject *v121;
  os_log_type_t v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  os_log_type_t v126;
  uint64_t inited;
  NSObject *v128;
  uint64_t v129;
  NSObject *v130;
  NSObject *v131;
  os_log_type_t v132;
  uint64_t v133;
  NSObject *v134;
  NSObject *v135;
  os_log_type_t v136;
  uint64_t v137;
  NSObject *v138;
  NSObject *v139;
  os_log_type_t v140;
  uint64_t v141;
  NSObject *v142;
  NSObject *v143;
  os_log_type_t v144;
  uint64_t v145;
  NSObject *v146;
  NSObject *v147;
  os_log_type_t v148;
  uint64_t v149;
  NSObject *v150;
  float fixed_float_from_edt;
  NSObject *v152;
  os_log_type_t v153;
  uint64_t v154;
  NSObject *v155;
  NSObject *log;
  os_log_type_t v157;
  uint64_t v158;
  NSObject *v159;
  unint64_t jj;
  id v161;
  unint64_t ii;
  unint64_t n;
  id v164;
  unint64_t m;
  id v166;
  uint8_t v167[7];
  os_log_type_t v168;
  NSObject *v169;
  uint8_t v170[7];
  os_log_type_t v171;
  NSObject *v172;
  uint8_t v173[7];
  os_log_type_t v174;
  NSObject *v175;
  uint8_t v176[7];
  os_log_type_t v177;
  NSObject *v178;
  uint8_t v179[7];
  os_log_type_t v180;
  NSObject *v181;
  uint8_t v182[7];
  os_log_type_t v183;
  NSObject *v184;
  uint8_t v185[7];
  os_log_type_t v186;
  NSObject *v187;
  uint8_t v188[7];
  os_log_type_t v189;
  NSObject *v190;
  uint8_t v191[7];
  os_log_type_t v192;
  NSObject *v193;
  uint8_t v194[15];
  os_log_type_t v195;
  NSObject *v196;
  unint64_t float_array_from_edt;
  os_log_type_t v198;
  os_log_t v199;
  float v200;
  os_log_type_t v201;
  os_log_t v202;
  unint64_t kk;
  unint64_t v204;
  os_log_type_t v205;
  os_log_t v206;
  float v207;
  os_log_type_t v208;
  os_log_t v209;
  unint64_t mm;
  unint64_t v211;
  os_log_type_t v212;
  os_log_t v213;
  unint64_t k;
  os_log_type_t v215;
  os_log_t v216;
  uint8_t v217[7];
  os_log_type_t v218;
  NSObject *v219;
  uint8_t v220[15];
  os_log_type_t v221;
  NSObject *v222;
  unint64_t j;
  os_log_type_t v224;
  os_log_t v225;
  os_log_type_t v226;
  os_log_t v227;
  uint8_t v228[7];
  os_log_type_t v229;
  NSObject *v230;
  uint8_t v231[7];
  os_log_type_t v232;
  NSObject *v233;
  uint8_t v234[15];
  os_log_type_t v235;
  NSObject *v236;
  unint64_t i;
  os_log_type_t v238;
  os_log_t v239;
  uint8_t v240[7];
  os_log_type_t v241;
  NSObject *v242;
  uint8_t v243[7];
  os_log_type_t v244;
  NSObject *v245;
  uint8_t v246[7];
  os_log_type_t v247;
  NSObject *v248;
  uint8_t v249[7];
  os_log_type_t v250;
  NSObject *v251;
  uint8_t v252[7];
  os_log_type_t v253;
  NSObject *v254;
  float v255;
  uint8_t v256[15];
  os_log_type_t v257;
  NSObject *v258;
  char v259;
  int v260;
  uint8_t v261[7];
  os_log_type_t type;
  NSObject *v263;
  io_registry_entry_t v264;
  uint64_t v265;
  id v266;
  char v267;
  int v268;
  int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  float v276;
  uint8_t v277[32];
  uint8_t v278[16];
  uint8_t v279[16];
  uint8_t v280[16];
  uint8_t v281[16];
  uint8_t v282[16];
  uint8_t v283[16];
  uint8_t v284[16];
  uint8_t v285[16];
  uint8_t v286[16];
  uint8_t v287[16];
  uint8_t v288[32];
  uint8_t v289[16];
  uint8_t v290[16];
  uint8_t v291[16];
  uint8_t v292[16];
  uint8_t v293[32];
  uint8_t v294[16];
  uint8_t v295[32];
  uint8_t v296[16];
  uint8_t v297[32];
  uint8_t v298[32];
  uint8_t v299[16];
  uint8_t v300[16];
  uint8_t v301[24];
  uint64_t v302;

  v3 = (void *)((uint64_t (*)(CBChromaticCorrectionParams *, SEL, _QWORD))MEMORY[0x1E0C80A78])(self, a2, *(_QWORD *)&a3);
  v302 = *MEMORY[0x1E0C80C00];
  v266 = v3;
  v265 = v4;
  v264 = v5;
  if (v5)
  {
    v260 = 0;
    v259 = load_int_from_edt(v264, CFSTR("supports-twilight"), &v260) & 1;
    if (v259 && v260)
    {
      fixed_float_from_edt = load_fixed_float_from_edt(v264, CFSTR("LminProduct"));
      v255 = fminf(fixed_float_from_edt, load_fixed_float_from_edt(v264, CFSTR("aot-accessible-min-nits")));
      v276 = v255;
      *((float *)v266 + 20) = load_float_from_edt(v264, CFSTR("tw-lux-activation-threshold"));
      v275 = *((_DWORD *)v266 + 20);
      if (*((float *)v266 + 20) >= 0.0)
      {
        *((float *)v266 + 21) = load_float_from_edt(v264, CFSTR("tw-nits-activation-threshold"));
        v274 = *((_DWORD *)v266 + 21);
        if (*((float *)v266 + 21) >= 0.0)
        {
          *((_QWORD *)v266 + 2) = load_float_array_from_edt(v264, CFSTR("tw-lux-table"), (_QWORD *)v266 + 3);
          if (*((_QWORD *)v266 + 3))
          {
            if (*((_QWORD *)v266 + 2) >= 2uLL)
            {
              if (float_equal(**((float **)v266 + 3), 0.0))
              {
                if (float_equal(*(float *)(*((_QWORD *)v266 + 3) + 4 * (*((_QWORD *)v266 + 2) - 1)), *((float *)v266 + 20)))
                {
                  for (i = 0; i < *((_QWORD *)v266 + 2) - 1; ++i)
                  {
                    if (*(float *)(*((_QWORD *)v266 + 3) + 4 * i) >= *(float *)(*((_QWORD *)v266 + 3) + 4 * (i + 1)))
                    {
                      v236 = 0;
                      if (*((_QWORD *)v266 + 1))
                      {
                        v128 = *((_QWORD *)v266 + 1);
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                          inited = _COREBRIGHTNESS_LOG_DEFAULT;
                        else
                          inited = init_default_corebrightness_log();
                        v128 = inited;
                      }
                      v236 = v128;
                      v235 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                      {
                        v125 = v236;
                        v126 = v235;
                        __os_log_helper_16_0_0(v234);
                        _os_log_error_impl(&dword_1B5291000, v125, v126, "Lux table is not monotonically increasing", v234, 2u);
                      }
                      v267 = 0;
                      return v267 & 1;
                    }
                  }
                  *((_QWORD *)v266 + 4) = load_float_array_from_edt(v264, CFSTR("tw-nits-table"), (_QWORD *)v266 + 5);
                  if (*((_QWORD *)v266 + 5))
                  {
                    if (*((_QWORD *)v266 + 4) >= 2uLL)
                    {
                      if (float_equal(**((float **)v266 + 5), v255))
                      {
                        if (float_equal(*(float *)(*((_QWORD *)v266 + 5) + 4 * (*((_QWORD *)v266 + 4) - 1)), *((float *)v266 + 21)))
                        {
                          for (j = 0; j < *((_QWORD *)v266 + 4) - 1; ++j)
                          {
                            if (*(float *)(*((_QWORD *)v266 + 5) + 4 * j) >= *(float *)(*((_QWORD *)v266 + 5)
                                                                                       + 4 * (j + 1)))
                            {
                              v222 = 0;
                              if (*((_QWORD *)v266 + 1))
                              {
                                v112 = *((_QWORD *)v266 + 1);
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                  v111 = _COREBRIGHTNESS_LOG_DEFAULT;
                                else
                                  v111 = init_default_corebrightness_log();
                                v112 = v111;
                              }
                              v222 = v112;
                              v221 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                              {
                                v109 = v222;
                                v110 = v221;
                                __os_log_helper_16_0_0(v220);
                                _os_log_error_impl(&dword_1B5291000, v109, v110, "Nits table is not monotonically increasing", v220, 2u);
                              }
                              v267 = 0;
                              return v267 & 1;
                            }
                          }
                          *((_QWORD *)v266 + 6) = load_float_array_from_edt(v264, CFSTR("tw-strength-table"), (_QWORD *)v266 + 7);
                          if (*((_QWORD *)v266 + 7))
                          {
                            if (*((_QWORD *)v266 + 6) == *((_QWORD *)v266 + 4) * *((_QWORD *)v266 + 2))
                            {
                              for (k = 0; k < *((_QWORD *)v266 + 6); ++k)
                              {
                                if (*(float *)(*((_QWORD *)v266 + 7) + 4 * k) < 0.0
                                  || *(float *)(*((_QWORD *)v266 + 7) + 4 * k) > 1.0)
                                {
                                  v213 = 0;
                                  if (*((_QWORD *)v266 + 1))
                                  {
                                    v102 = *((_QWORD *)v266 + 1);
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                      v101 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    else
                                      v101 = init_default_corebrightness_log();
                                    v102 = v101;
                                  }
                                  v213 = v102;
                                  v212 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v297, k, COERCE__INT64(*(float *)(*((_QWORD *)v266 + 7) + 4 * k)));
                                    _os_log_error_impl(&dword_1B5291000, v213, v212, "Strength table element #%lu with value %f is out of the valid [0, 1] range", v297, 0x16u);
                                  }
                                  v267 = 0;
                                  return v267 & 1;
                                }
                              }
                              v211 = 0;
                              while (2)
                              {
                                if (v211 >= *((_QWORD *)v266 + 2))
                                {
                                  v204 = 0;
                                  while (2)
                                  {
                                    if (v204 >= *((_QWORD *)v266 + 4))
                                    {
                                      *((float *)v266 + 16) = load_float_from_edt(v264, CFSTR("tw-ramp-update-rate"));
                                      v273 = *((_DWORD *)v266 + 16);
                                      float_array_from_edt = load_float_array_from_edt(v264, CFSTR("tw-ramp-bezier-anchors"), (_QWORD *)v266 + 9);
                                      if (*((_QWORD *)v266 + 9))
                                      {
                                        if (float_array_from_edt == 3)
                                        {
                                          if (**((float **)v266 + 9) >= 0.0 && **((float **)v266 + 9) <= 1.0)
                                          {
                                            if (*(float *)(*((_QWORD *)v266 + 9) + 4) >= 0.0
                                              && *(float *)(*((_QWORD *)v266 + 9) + 4) <= 1.0)
                                            {
                                              if (*(float *)(*((_QWORD *)v266 + 9) + 8) >= 0.0
                                                && *(float *)(*((_QWORD *)v266 + 9) + 8) <= 1.0)
                                              {
                                                *((float *)v266 + 23) = load_float_from_edt(v264, CFSTR("tw-ramp-up-duration"));
                                                v272 = *((_DWORD *)v266 + 23);
                                                if (*((float *)v266 + 23) >= 0.0)
                                                {
                                                  *((float *)v266 + 24) = load_float_from_edt(v264, CFSTR("tw-ramp-up-lux-threshold"));
                                                  v271 = *((_DWORD *)v266 + 24);
                                                  if (*((float *)v266 + 24) >= 0.0)
                                                  {
                                                    *((float *)v266 + 25) = load_float_from_edt(v264, CFSTR("tw-ramp-down-duration"));
                                                    v270 = *((_DWORD *)v266 + 25);
                                                    if (*((float *)v266 + 25) >= 0.0)
                                                    {
                                                      *((float *)v266 + 26) = load_float_from_edt(v264, CFSTR("tw-ramp-down-lux-threshold"));
                                                      v269 = *((_DWORD *)v266 + 26);
                                                      if (*((float *)v266 + 26) >= 0.0)
                                                      {
                                                        if (-[CBAODState isAODSupported](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODSupported")&& (*((float *)v266 + 27) = load_float_from_edt(v264, CFSTR("tw-ramp-aod-duration")), v268 = *((_DWORD *)v266 + 27), *((float *)v266 + 27) < 0.0))
                                                        {
                                                          v169 = 0;
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v54 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v53 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v53 = init_default_corebrightness_log();
                                                            v54 = v53;
                                                          }
                                                          v169 = v54;
                                                          v168 = OS_LOG_TYPE_ERROR;
                                                          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                                                          {
                                                            v51 = v169;
                                                            v52 = v168;
                                                            __os_log_helper_16_0_0(v167);
                                                            _os_log_error_impl(&dword_1B5291000, v51, v52, "AOD ramp duration is negative", v167, 2u);
                                                          }
                                                          v267 = 0;
                                                        }
                                                        else
                                                        {
                                                          v166 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                          for (m = 0; m < *((_QWORD *)v266 + 2); ++m)
                                                          {
                                                            v12 = "";
                                                            if (m != *((_QWORD *)v266 + 2) - 1)
                                                              v12 = ",";
                                                            objc_msgSend(v166, "appendFormat:", CFSTR(" %f%s"), *(float *)(*((_QWORD *)v266 + 3) + 4 * m), v12);
                                                          }
                                                          objc_msgSend(v166, "appendString:", CFSTR(" "));
                                                          v164 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                          for (n = 0; n < *((_QWORD *)v266 + 4); ++n)
                                                          {
                                                            v13 = "";
                                                            if (n != *((_QWORD *)v266 + 4) - 1)
                                                              v13 = ",";
                                                            objc_msgSend(v164, "appendFormat:", CFSTR(" %f%s"), *(float *)(*((_QWORD *)v266 + 5) + 4 * n), v13);
                                                          }
                                                          objc_msgSend(v164, "appendString:", CFSTR(" "));
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v50 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v49 = init_default_corebrightness_log();
                                                            v50 = v49;
                                                          }
                                                          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v292, COERCE__INT64(v255));
                                                            _os_log_impl(&dword_1B5291000, v50, OS_LOG_TYPE_DEFAULT, "NitsMinimum=%f", v292, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v48 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v47 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v47 = init_default_corebrightness_log();
                                                            v48 = v47;
                                                          }
                                                          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v291, COERCE__INT64(*((float *)v266 + 20)));
                                                            _os_log_impl(&dword_1B5291000, v48, OS_LOG_TYPE_DEFAULT, "LuxActivationThreshold=%f", v291, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v46 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v45 = init_default_corebrightness_log();
                                                            v46 = v45;
                                                          }
                                                          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v290, COERCE__INT64(*((float *)v266 + 21)));
                                                            _os_log_impl(&dword_1B5291000, v46, OS_LOG_TYPE_DEFAULT, "NitsActivationThreshold=%f", v290, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v44 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v43 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v43 = init_default_corebrightness_log();
                                                            v44 = v43;
                                                          }
                                                          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v289, COERCE__INT64(*((float *)v266 + 22)));
                                                            _os_log_impl(&dword_1B5291000, v44, OS_LOG_TYPE_DEFAULT, "RampUpdateRate=%f", v289, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v42 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v41 = init_default_corebrightness_log();
                                                            v42 = v41;
                                                          }
                                                          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v288, COERCE__INT64(**((float **)v266 + 9)), COERCE__INT64(*(float *)(*((_QWORD *)v266 + 9) + 4)), COERCE__INT64(*(float *)(*((_QWORD *)v266 + 9) + 8)));
                                                            _os_log_impl(&dword_1B5291000, v42, OS_LOG_TYPE_DEFAULT, "RampBezierAnchors={ %f, %f, %f }", v288, 0x20u);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v40 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v39 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v39 = init_default_corebrightness_log();
                                                            v40 = v39;
                                                          }
                                                          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v287, COERCE__INT64(*((float *)v266 + 23)));
                                                            _os_log_impl(&dword_1B5291000, v40, OS_LOG_TYPE_DEFAULT, "RampUpDuration=%f", v287, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v38 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v37 = init_default_corebrightness_log();
                                                            v38 = v37;
                                                          }
                                                          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v286, COERCE__INT64(*((float *)v266 + 24)));
                                                            _os_log_impl(&dword_1B5291000, v38, OS_LOG_TYPE_DEFAULT, "RampUpLuxDeltaThreshold=%f", v286, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v36 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v35 = init_default_corebrightness_log();
                                                            v36 = v35;
                                                          }
                                                          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v285, COERCE__INT64(*((float *)v266 + 25)));
                                                            _os_log_impl(&dword_1B5291000, v36, OS_LOG_TYPE_DEFAULT, "RampDownDuration=%f", v285, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v34 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v33 = init_default_corebrightness_log();
                                                            v34 = v33;
                                                          }
                                                          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v284, COERCE__INT64(*((float *)v266 + 26)));
                                                            _os_log_impl(&dword_1B5291000, v34, OS_LOG_TYPE_DEFAULT, "RampDownLuxDeltaThreshold=%f", v284, 0xCu);
                                                          }
                                                          if (-[CBAODState isAODSupported](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODSupported"))
                                                          {
                                                            if (*((_QWORD *)v266 + 1))
                                                            {
                                                              v32 = *((_QWORD *)v266 + 1);
                                                            }
                                                            else
                                                            {
                                                              v31 = _COREBRIGHTNESS_LOG_DEFAULT
                                                                  ? _COREBRIGHTNESS_LOG_DEFAULT
                                                                  : init_default_corebrightness_log();
                                                              v32 = v31;
                                                            }
                                                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              objc_msgSend(v266, "aodRampDuration");
                                                              __os_log_helper_16_0_1_8_0((uint64_t)v283, COERCE__INT64(v14));
                                                              _os_log_impl(&dword_1B5291000, v32, OS_LOG_TYPE_DEFAULT, "RampAODDuration=%f", v283, 0xCu);
                                                            }
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v30 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v29 = init_default_corebrightness_log();
                                                            v30 = v29;
                                                          }
                                                          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v282, *((_QWORD *)v266 + 2));
                                                            _os_log_impl(&dword_1B5291000, v30, OS_LOG_TYPE_DEFAULT, "LuxTableSize=%lu", v282, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v28 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v27 = init_default_corebrightness_log();
                                                            v28 = v27;
                                                          }
                                                          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_2_1_8_32((uint64_t)v281, objc_msgSend(v166, "UTF8String"));
                                                            _os_log_impl(&dword_1B5291000, v28, OS_LOG_TYPE_DEFAULT, "LuxTable={%s}", v281, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v26 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v25 = init_default_corebrightness_log();
                                                            v26 = v25;
                                                          }
                                                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v280, *((_QWORD *)v266 + 4));
                                                            _os_log_impl(&dword_1B5291000, v26, OS_LOG_TYPE_DEFAULT, "NitsTableSize=%lu", v280, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v24 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v23 = init_default_corebrightness_log();
                                                            v24 = v23;
                                                          }
                                                          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_2_1_8_32((uint64_t)v279, objc_msgSend(v164, "UTF8String"));
                                                            _os_log_impl(&dword_1B5291000, v24, OS_LOG_TYPE_DEFAULT, "NitsTable={%s}", v279, 0xCu);
                                                          }
                                                          if (*((_QWORD *)v266 + 1))
                                                          {
                                                            v22 = *((_QWORD *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                              v21 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            else
                                                              v21 = init_default_corebrightness_log();
                                                            v22 = v21;
                                                          }
                                                          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v278, *((_QWORD *)v266 + 6));
                                                            _os_log_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEFAULT, "StrengthTableSize=%lu", v278, 0xCu);
                                                          }
                                                          for (ii = 0; ii < *((_QWORD *)v266 + 2); ++ii)
                                                          {
                                                            v161 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                                                            for (jj = 0; jj < *((_QWORD *)v266 + 4); ++jj)
                                                            {
                                                              objc_msgSend(v266, "getStrengthForRow:andColumn:", ii, jj);
                                                              v16 = v15;
                                                              v17 = "";
                                                              if (jj != *((_QWORD *)v266 + 4) - 1)
                                                                v17 = ",";
                                                              objc_msgSend(v161, "appendFormat:", CFSTR(" %f%s "), *(_QWORD *)&v16, v17);
                                                            }
                                                            if (*((_QWORD *)v266 + 1))
                                                            {
                                                              v20 = *((_QWORD *)v266 + 1);
                                                            }
                                                            else
                                                            {
                                                              if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                                v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                              else
                                                                v19 = init_default_corebrightness_log();
                                                              v20 = v19;
                                                            }
                                                            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              __os_log_helper_16_2_2_8_0_8_32((uint64_t)v277, ii, objc_msgSend(v161, "UTF8String"));
                                                              _os_log_impl(&dword_1B5291000, v20, OS_LOG_TYPE_DEFAULT, "StrengthTable[%lu]={%s}", v277, 0x16u);
                                                            }

                                                          }
                                                          v267 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v172 = 0;
                                                        if (*((_QWORD *)v266 + 1))
                                                        {
                                                          v58 = *((_QWORD *)v266 + 1);
                                                        }
                                                        else
                                                        {
                                                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                            v57 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                          else
                                                            v57 = init_default_corebrightness_log();
                                                          v58 = v57;
                                                        }
                                                        v172 = v58;
                                                        v171 = OS_LOG_TYPE_ERROR;
                                                        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                                                        {
                                                          v55 = v172;
                                                          v56 = v171;
                                                          __os_log_helper_16_0_0(v170);
                                                          _os_log_error_impl(&dword_1B5291000, v55, v56, "Ramp down lux delta threshold is negative", v170, 2u);
                                                        }
                                                        v267 = 0;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v175 = 0;
                                                      if (*((_QWORD *)v266 + 1))
                                                      {
                                                        v62 = *((_QWORD *)v266 + 1);
                                                      }
                                                      else
                                                      {
                                                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                          v61 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                        else
                                                          v61 = init_default_corebrightness_log();
                                                        v62 = v61;
                                                      }
                                                      v175 = v62;
                                                      v174 = OS_LOG_TYPE_ERROR;
                                                      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                                                      {
                                                        v59 = v175;
                                                        v60 = v174;
                                                        __os_log_helper_16_0_0(v173);
                                                        _os_log_error_impl(&dword_1B5291000, v59, v60, "Ramp down duration is negative", v173, 2u);
                                                      }
                                                      v267 = 0;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v178 = 0;
                                                    if (*((_QWORD *)v266 + 1))
                                                    {
                                                      v66 = *((_QWORD *)v266 + 1);
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                        v65 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      else
                                                        v65 = init_default_corebrightness_log();
                                                      v66 = v65;
                                                    }
                                                    v178 = v66;
                                                    v177 = OS_LOG_TYPE_ERROR;
                                                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                                    {
                                                      v63 = v178;
                                                      v64 = v177;
                                                      __os_log_helper_16_0_0(v176);
                                                      _os_log_error_impl(&dword_1B5291000, v63, v64, "Ramp up lux delta threshold is negative", v176, 2u);
                                                    }
                                                    v267 = 0;
                                                  }
                                                }
                                                else
                                                {
                                                  v181 = 0;
                                                  if (*((_QWORD *)v266 + 1))
                                                  {
                                                    v70 = *((_QWORD *)v266 + 1);
                                                  }
                                                  else
                                                  {
                                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                      v69 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                    else
                                                      v69 = init_default_corebrightness_log();
                                                    v70 = v69;
                                                  }
                                                  v181 = v70;
                                                  v180 = OS_LOG_TYPE_ERROR;
                                                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                                  {
                                                    v67 = v181;
                                                    v68 = v180;
                                                    __os_log_helper_16_0_0(v179);
                                                    _os_log_error_impl(&dword_1B5291000, v67, v68, "Ramp up duration is negative", v179, 2u);
                                                  }
                                                  v267 = 0;
                                                }
                                              }
                                              else
                                              {
                                                v184 = 0;
                                                if (*((_QWORD *)v266 + 1))
                                                {
                                                  v74 = *((_QWORD *)v266 + 1);
                                                }
                                                else
                                                {
                                                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                    v73 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                  else
                                                    v73 = init_default_corebrightness_log();
                                                  v74 = v73;
                                                }
                                                v184 = v74;
                                                v183 = OS_LOG_TYPE_ERROR;
                                                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                                                {
                                                  v71 = v184;
                                                  v72 = v183;
                                                  __os_log_helper_16_0_0(v182);
                                                  _os_log_error_impl(&dword_1B5291000, v71, v72, "Third ramp Bezier anchor is out of valid [0, 1] range", v182, 2u);
                                                }
                                                v267 = 0;
                                              }
                                            }
                                            else
                                            {
                                              v187 = 0;
                                              if (*((_QWORD *)v266 + 1))
                                              {
                                                v78 = *((_QWORD *)v266 + 1);
                                              }
                                              else
                                              {
                                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                  v77 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                else
                                                  v77 = init_default_corebrightness_log();
                                                v78 = v77;
                                              }
                                              v187 = v78;
                                              v186 = OS_LOG_TYPE_ERROR;
                                              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                                              {
                                                v75 = v187;
                                                v76 = v186;
                                                __os_log_helper_16_0_0(v185);
                                                _os_log_error_impl(&dword_1B5291000, v75, v76, "Second ramp Bezier anchor is out of valid [0, 1] range", v185, 2u);
                                              }
                                              v267 = 0;
                                            }
                                          }
                                          else
                                          {
                                            v190 = 0;
                                            if (*((_QWORD *)v266 + 1))
                                            {
                                              v82 = *((_QWORD *)v266 + 1);
                                            }
                                            else
                                            {
                                              if (_COREBRIGHTNESS_LOG_DEFAULT)
                                                v81 = _COREBRIGHTNESS_LOG_DEFAULT;
                                              else
                                                v81 = init_default_corebrightness_log();
                                              v82 = v81;
                                            }
                                            v190 = v82;
                                            v189 = OS_LOG_TYPE_ERROR;
                                            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                                            {
                                              v79 = v190;
                                              v80 = v189;
                                              __os_log_helper_16_0_0(v188);
                                              _os_log_error_impl(&dword_1B5291000, v79, v80, "First ramp Bezier anchor is out of valid [0, 1] range", v188, 2u);
                                            }
                                            v267 = 0;
                                          }
                                        }
                                        else
                                        {
                                          v193 = 0;
                                          if (*((_QWORD *)v266 + 1))
                                          {
                                            v86 = *((_QWORD *)v266 + 1);
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                              v85 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            else
                                              v85 = init_default_corebrightness_log();
                                            v86 = v85;
                                          }
                                          v193 = v86;
                                          v192 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                                          {
                                            v83 = v193;
                                            v84 = v192;
                                            __os_log_helper_16_0_0(v191);
                                            _os_log_error_impl(&dword_1B5291000, v83, v84, "Incorrect number of ramp Bezier anchors", v191, 2u);
                                          }
                                          v267 = 0;
                                        }
                                      }
                                      else
                                      {
                                        v196 = 0;
                                        if (*((_QWORD *)v266 + 1))
                                        {
                                          v90 = *((_QWORD *)v266 + 1);
                                        }
                                        else
                                        {
                                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                                            v89 = _COREBRIGHTNESS_LOG_DEFAULT;
                                          else
                                            v89 = init_default_corebrightness_log();
                                          v90 = v89;
                                        }
                                        v196 = v90;
                                        v195 = OS_LOG_TYPE_ERROR;
                                        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                                        {
                                          v87 = v196;
                                          v88 = v195;
                                          __os_log_helper_16_0_0(v194);
                                          _os_log_error_impl(&dword_1B5291000, v87, v88, "Unable to load ramp Bezier anchors", v194, 2u);
                                        }
                                        v267 = 0;
                                      }
                                    }
                                    else
                                    {
                                      for (kk = 0; kk < *((_QWORD *)v266 + 2) - 1; ++kk)
                                      {
                                        objc_msgSend(v266, "getStrengthForRow:andColumn:", kk, v204);
                                        v95 = v9;
                                        objc_msgSend(v266, "getStrengthForRow:andColumn:", kk + 1, v204);
                                        if (v95 < v10)
                                        {
                                          v202 = 0;
                                          if (*((_QWORD *)v266 + 1))
                                          {
                                            v94 = *((_QWORD *)v266 + 1);
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                                              v93 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            else
                                              v93 = init_default_corebrightness_log();
                                            v94 = v93;
                                          }
                                          v202 = v94;
                                          v201 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                                          {
                                            __os_log_helper_16_0_1_8_0((uint64_t)v294, v204);
                                            _os_log_error_impl(&dword_1B5291000, v202, v201, "Strength table column #%lu is not monotonically non-increasing", v294, 0xCu);
                                          }
                                          v267 = 0;
                                          return v267 & 1;
                                        }
                                      }
                                      v200 = 0.0;
                                      objc_msgSend(v266, "getStrengthForRow:andColumn:", *((_QWORD *)v266 + 2) - 1, v204);
                                      v200 = v11;
                                      if (float_equal(v11, 0.0))
                                      {
                                        ++v204;
                                        continue;
                                      }
                                      v199 = 0;
                                      if (*((_QWORD *)v266 + 1))
                                      {
                                        v92 = *((_QWORD *)v266 + 1);
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                                          v91 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        else
                                          v91 = init_default_corebrightness_log();
                                        v92 = v91;
                                      }
                                      v199 = v92;
                                      v198 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                                      {
                                        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v293, v204, COERCE__INT64(v200));
                                        _os_log_error_impl(&dword_1B5291000, v199, v198, "Last element of strength table column #%lu with value %f is not 0", v293, 0x16u);
                                      }
                                      v267 = 0;
                                    }
                                    break;
                                  }
                                }
                                else
                                {
                                  for (mm = 0; mm < *((_QWORD *)v266 + 4) - 1; ++mm)
                                  {
                                    objc_msgSend(v266, "getStrengthForRow:andColumn:", v211, mm);
                                    v100 = v6;
                                    objc_msgSend(v266, "getStrengthForRow:andColumn:", v211, mm + 1);
                                    if (v100 < v7)
                                    {
                                      v209 = 0;
                                      if (*((_QWORD *)v266 + 1))
                                      {
                                        v99 = *((_QWORD *)v266 + 1);
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                                          v98 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        else
                                          v98 = init_default_corebrightness_log();
                                        v99 = v98;
                                      }
                                      v209 = v99;
                                      v208 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                                      {
                                        __os_log_helper_16_0_1_8_0((uint64_t)v296, v211);
                                        _os_log_error_impl(&dword_1B5291000, v209, v208, "Strength table row #%lu is not monotonically non-increasing", v296, 0xCu);
                                      }
                                      v267 = 0;
                                      return v267 & 1;
                                    }
                                  }
                                  v207 = 0.0;
                                  objc_msgSend(v266, "getStrengthForRow:andColumn:", v211, *((_QWORD *)v266 + 4) - 1);
                                  v207 = v8;
                                  if (float_equal(v8, 0.0))
                                  {
                                    ++v211;
                                    continue;
                                  }
                                  v206 = 0;
                                  if (*((_QWORD *)v266 + 1))
                                  {
                                    v97 = *((_QWORD *)v266 + 1);
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                                      v96 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    else
                                      v96 = init_default_corebrightness_log();
                                    v97 = v96;
                                  }
                                  v206 = v97;
                                  v205 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v295, v211, COERCE__INT64(v207));
                                    _os_log_error_impl(&dword_1B5291000, v206, v205, "Last element of strength table row #%lu with value %f is not 0", v295, 0x16u);
                                  }
                                  v267 = 0;
                                }
                                break;
                              }
                            }
                            else
                            {
                              v216 = 0;
                              if (*((_QWORD *)v266 + 1))
                              {
                                v104 = *((_QWORD *)v266 + 1);
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT)
                                  v103 = _COREBRIGHTNESS_LOG_DEFAULT;
                                else
                                  v103 = init_default_corebrightness_log();
                                v104 = v103;
                              }
                              v216 = v104;
                              v215 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v298, *((_QWORD *)v266 + 6), *((_QWORD *)v266 + 2), *((_QWORD *)v266 + 4));
                                _os_log_error_impl(&dword_1B5291000, v216, v215, "Strength table has wrong size %lu for lux table size %lu and nits table size %lu", v298, 0x20u);
                              }
                              v267 = 0;
                            }
                          }
                          else
                          {
                            v219 = 0;
                            if (*((_QWORD *)v266 + 1))
                            {
                              v108 = *((_QWORD *)v266 + 1);
                            }
                            else
                            {
                              if (_COREBRIGHTNESS_LOG_DEFAULT)
                                v107 = _COREBRIGHTNESS_LOG_DEFAULT;
                              else
                                v107 = init_default_corebrightness_log();
                              v108 = v107;
                            }
                            v219 = v108;
                            v218 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                            {
                              v105 = v219;
                              v106 = v218;
                              __os_log_helper_16_0_0(v217);
                              _os_log_error_impl(&dword_1B5291000, v105, v106, "Unable to load strength table", v217, 2u);
                            }
                            v267 = 0;
                          }
                        }
                        else
                        {
                          v225 = 0;
                          if (*((_QWORD *)v266 + 1))
                          {
                            v114 = *((_QWORD *)v266 + 1);
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT)
                              v113 = _COREBRIGHTNESS_LOG_DEFAULT;
                            else
                              v113 = init_default_corebrightness_log();
                            v114 = v113;
                          }
                          v225 = v114;
                          v224 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                          {
                            __os_log_helper_16_0_1_8_0((uint64_t)v299, COERCE__INT64(*((float *)v266 + 21)));
                            _os_log_error_impl(&dword_1B5291000, v225, v224, "Last element in the nits table is not %f", v299, 0xCu);
                          }
                          v267 = 0;
                        }
                      }
                      else
                      {
                        v227 = 0;
                        if (*((_QWORD *)v266 + 1))
                        {
                          v116 = *((_QWORD *)v266 + 1);
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT)
                            v115 = _COREBRIGHTNESS_LOG_DEFAULT;
                          else
                            v115 = init_default_corebrightness_log();
                          v116 = v115;
                        }
                        v227 = v116;
                        v226 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v300, COERCE__INT64(v255));
                          _os_log_error_impl(&dword_1B5291000, v227, v226, "First element in the nits table is not %f", v300, 0xCu);
                        }
                        v267 = 0;
                      }
                    }
                    else
                    {
                      v230 = 0;
                      if (*((_QWORD *)v266 + 1))
                      {
                        v120 = *((_QWORD *)v266 + 1);
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT)
                          v119 = _COREBRIGHTNESS_LOG_DEFAULT;
                        else
                          v119 = init_default_corebrightness_log();
                        v120 = v119;
                      }
                      v230 = v120;
                      v229 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                      {
                        v117 = v230;
                        v118 = v229;
                        __os_log_helper_16_0_0(v228);
                        _os_log_error_impl(&dword_1B5291000, v117, v118, "Nits table has less than two elements", v228, 2u);
                      }
                      v267 = 0;
                    }
                  }
                  else
                  {
                    v233 = 0;
                    if (*((_QWORD *)v266 + 1))
                    {
                      v124 = *((_QWORD *)v266 + 1);
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT)
                        v123 = _COREBRIGHTNESS_LOG_DEFAULT;
                      else
                        v123 = init_default_corebrightness_log();
                      v124 = v123;
                    }
                    v233 = v124;
                    v232 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
                    {
                      v121 = v233;
                      v122 = v232;
                      __os_log_helper_16_0_0(v231);
                      _os_log_error_impl(&dword_1B5291000, v121, v122, "Unable to load nits table", v231, 2u);
                    }
                    v267 = 0;
                  }
                }
                else
                {
                  v239 = 0;
                  if (*((_QWORD *)v266 + 1))
                  {
                    v130 = *((_QWORD *)v266 + 1);
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT)
                      v129 = _COREBRIGHTNESS_LOG_DEFAULT;
                    else
                      v129 = init_default_corebrightness_log();
                    v130 = v129;
                  }
                  v239 = v130;
                  v238 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_0_1_8_0((uint64_t)v301, COERCE__INT64(*((float *)v266 + 20)));
                    _os_log_error_impl(&dword_1B5291000, v239, v238, "Last element in the lux table is not %f", v301, 0xCu);
                  }
                  v267 = 0;
                }
              }
              else
              {
                v242 = 0;
                if (*((_QWORD *)v266 + 1))
                {
                  v134 = *((_QWORD *)v266 + 1);
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                    v133 = _COREBRIGHTNESS_LOG_DEFAULT;
                  else
                    v133 = init_default_corebrightness_log();
                  v134 = v133;
                }
                v242 = v134;
                v241 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v131 = v242;
                  v132 = v241;
                  __os_log_helper_16_0_0(v240);
                  _os_log_error_impl(&dword_1B5291000, v131, v132, "First element in the lux table is not 0", v240, 2u);
                }
                v267 = 0;
              }
            }
            else
            {
              v245 = 0;
              if (*((_QWORD *)v266 + 1))
              {
                v138 = *((_QWORD *)v266 + 1);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v137 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v137 = init_default_corebrightness_log();
                v138 = v137;
              }
              v245 = v138;
              v244 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              {
                v135 = v245;
                v136 = v244;
                __os_log_helper_16_0_0(v243);
                _os_log_error_impl(&dword_1B5291000, v135, v136, "Lux table has less than two elements", v243, 2u);
              }
              v267 = 0;
            }
          }
          else
          {
            v248 = 0;
            if (*((_QWORD *)v266 + 1))
            {
              v142 = *((_QWORD *)v266 + 1);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                v141 = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                v141 = init_default_corebrightness_log();
              v142 = v141;
            }
            v248 = v142;
            v247 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              v139 = v248;
              v140 = v247;
              __os_log_helper_16_0_0(v246);
              _os_log_error_impl(&dword_1B5291000, v139, v140, "Unable to load lux table", v246, 2u);
            }
            v267 = 0;
          }
        }
        else
        {
          v251 = 0;
          if (*((_QWORD *)v266 + 1))
          {
            v146 = *((_QWORD *)v266 + 1);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v145 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v145 = init_default_corebrightness_log();
            v146 = v145;
          }
          v251 = v146;
          v250 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
          {
            v143 = v251;
            v144 = v250;
            __os_log_helper_16_0_0(v249);
            _os_log_error_impl(&dword_1B5291000, v143, v144, "Nits activation threshold is negative", v249, 2u);
          }
          v267 = 0;
        }
      }
      else
      {
        v254 = 0;
        if (*((_QWORD *)v266 + 1))
        {
          v150 = *((_QWORD *)v266 + 1);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v149 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v149 = init_default_corebrightness_log();
          v150 = v149;
        }
        v254 = v150;
        v253 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
        {
          v147 = v254;
          v148 = v253;
          __os_log_helper_16_0_0(v252);
          _os_log_error_impl(&dword_1B5291000, v147, v148, "Lux activation threshold is negative", v252, 2u);
        }
        v267 = 0;
      }
    }
    else
    {
      v258 = 0;
      if (*((_QWORD *)v266 + 1))
      {
        v155 = *((_QWORD *)v266 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v154 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v154 = init_default_corebrightness_log();
        v155 = v154;
      }
      v258 = v155;
      v257 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      {
        v152 = v258;
        v153 = v257;
        __os_log_helper_16_0_0(v256);
        _os_log_error_impl(&dword_1B5291000, v152, v153, "Twilight is not supported", v256, 2u);
      }
      v267 = 0;
    }
  }
  else
  {
    v263 = 0;
    if (*((_QWORD *)v266 + 1))
    {
      v159 = *((_QWORD *)v266 + 1);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v158 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v158 = init_default_corebrightness_log();
      v159 = v158;
    }
    v263 = v159;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
    {
      log = v263;
      v157 = type;
      __os_log_helper_16_0_0(v261);
      _os_log_error_impl(&dword_1B5291000, log, v157, "Service is null", v261, 2u);
    }
    v267 = 0;
  }
  return v267 & 1;
}

- (CBFloatArray)luxTable
{
  return self->_luxTable;
}

- (CBFloatArray2D)strengthTable
{
  return self->_strengthTable;
}

- (CBFloatArray)rampBezierAnchors
{
  return self->_rampBezierAnchors;
}

- (float)rampUpdateRate
{
  return self->_rampUpdateRate;
}

- (float)rampUpDuration
{
  return self->_rampUpDuration;
}

- (float)rampDownDuration
{
  return self->_rampDownDuration;
}

- (float)aodRampDuration
{
  return self->_aodRampDuration;
}

@end
