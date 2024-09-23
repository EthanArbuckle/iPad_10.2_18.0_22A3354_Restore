@implementation CBBacklightNode

- (CBRTPLCParams)rtplc
{
  return self->_rtplc;
}

- (CBBacklightNode)initWithService:(unsigned int)a3
{
  os_log_t v3;
  CBRTPLCParams *v4;
  uint64_t v5;
  CBTwilightParams *v6;
  uint64_t v7;
  CBChromaticCorrectionParams *v8;
  uint64_t v9;
  NSObject *log;
  os_log_type_t v12;
  uint64_t inited;
  NSObject *v14;
  uint8_t v15[7];
  os_log_type_t type;
  os_log_t oslog;
  objc_super v18;
  unsigned int v19;
  SEL v20;
  CBBacklightNode *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBBacklightNode;
  v21 = -[CBBacklightNode init](&v18, sel_init);
  if (!v21)
    return v21;
  if (v19)
  {
    v21->_service = v19;
    v4 = [CBRTPLCParams alloc];
    v5 = -[CBRTPLCParams initWithService:](v4, "initWithService:", v19);
    v21->_rtplc = (CBRTPLCParams *)v5;
    v6 = [CBTwilightParams alloc];
    v7 = -[CBTwilightParams initWithService:](v6, "initWithService:", v19);
    v21->_twilight = (CBTwilightParams *)v7;
    v8 = [CBChromaticCorrectionParams alloc];
    v9 = -[CBChromaticCorrectionParams initFromAmmoliteFromService:](v8, "initFromAmmoliteFromService:", v19);
    v21->_ammolite = (CBChromaticCorrectionParams *)v9;
    -[CBBacklightNode initPropertiesFromService:](v21, "initPropertiesFromService:", v19);
    return v21;
  }
  v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "default");
  v21->_log = (OS_os_log *)v3;
  oslog = 0;
  if (v21->_log)
  {
    v14 = v21->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v14 = inited;
  }
  oslog = v14;
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    v12 = type;
    __os_log_helper_16_0_0(v15);
    _os_log_error_impl(&dword_1B5291000, log, v12, "Service is null", v15, 2u);
  }

  return v21;
}

- (void)initPropertiesFromService:(unsigned int)a3
{
  if ((load_int_from_edt(a3, CFSTR("grimaldi-sampling-strategy"), &self->_grimaldiSamplingStrategy) & 1) == 0)
    self->_grimaldiSamplingStrategy = 0;
}

- (unsigned)createMultipointArrayCommon:(id)a3 unitSize:(unint64_t *)a4 outputCount:(unint64_t *)a5
{
  unsigned int v6;
  unint64_t i;
  unsigned int *v8;
  _DWORD *v9;
  unint64_t count;
  size_t size;
  unint64_t v12;
  void *v13;

  v13 = (void *)IORegistryEntrySearchCFProperty(self->_service, "IOService", (CFStringRef)a3, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
  if (!v13)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v12 = objc_msgSend(v13, "length");
  size = 0;
  count = 0;
  if (v12 == 12)
  {
    count = 6;
    size = 2;
  }
  else if (!(v12 % 4) && v12 >= 0x18)
  {
    count = v12 / 4;
    size = 4;
  }
  v9 = malloc_type_calloc(count, size, 0xBDDC5BFFuLL);
  if (v9)
  {
    objc_msgSend(v13, "getBytes:length:", v9, v12);

    v8 = (unsigned int *)malloc_type_malloc(4 * count, 0x100004052888210uLL);
    if (v8)
    {
      for (i = 0; i < count; ++i)
      {
        if (size == 2)
          v6 = *((unsigned __int16 *)v9 + i);
        else
          v6 = v9[i];
        v8[i] = v6;
      }
      free(v9);
      *a4 = size;
      *a5 = count;
      return v8;
    }
    else
    {
      free(v9);
      return 0;
    }
  }
  else
  {
LABEL_4:

    return 0;
  }
}

- (id)newMultiPointThresholdsArray:(id)a3
{
  double v3;
  unint64_t i;
  id v6;
  unsigned int *v7;
  unint64_t v8;
  _QWORD v9[4];

  v9[3] = self;
  v9[2] = a2;
  v9[1] = a3;
  v9[0] = 0;
  v8 = 0;
  v7 = -[CBBacklightNode createMultipointArrayCommon:unitSize:outputCount:](self, "createMultipointArrayCommon:unitSize:outputCount:", a3, v9, &v8);
  if (!v7)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6)
  {
    for (i = 0; i < v8; ++i)
    {
      *(float *)&v3 = (float)v7[i];
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3));
    }
    free(v7);
    return v6;
  }
  else
  {
    free(v7);
    return 0;
  }
}

- (id)newMultiPointFactorsArray:(id)a3
{
  double v3;
  float v5;
  unint64_t i;
  id v7;
  unsigned int *v8;
  unint64_t v9;
  _QWORD v10[4];

  v10[3] = self;
  v10[2] = a2;
  v10[1] = a3;
  v10[0] = 0;
  v9 = 0;
  v8 = -[CBBacklightNode createMultipointArrayCommon:unitSize:outputCount:](self, "createMultipointArrayCommon:unitSize:outputCount:", a3, v10, &v9);
  if (!v8)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    for (i = 0; i < v9; ++i)
    {
      if (v10[0] == 2)
        v5 = (float)v8[i] / 1000.0;
      else
        v5 = *(float *)&v8[i];
      *(float *)&v3 = v5;
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3));
    }
    free(v8);
    return v7;
  }
  else
  {
    free(v8);
    return 0;
  }
}

- (int)createMultipointRestrictionArrayForThresholdsName:(id)a3 andFactorsName:(id)a4 andThresholds:(id *)a5 andFactors:(id *)a6
{
  uint64_t v7;
  id v8;
  id v9;

  if (!a3 || !a4 || !a5 || !a6)
    return 0;
  v9 = -[CBBacklightNode newMultiPointThresholdsArray:](self, "newMultiPointThresholdsArray:", a3);
  if (v9)
  {
    v8 = -[CBBacklightNode newMultiPointFactorsArray:](self, "newMultiPointFactorsArray:", a4);
    if (v8)
    {
      v7 = objc_msgSend(v9, "count");
      if (v7 == objc_msgSend(v8, "count"))
      {
        *a5 = v9;
        *a6 = v8;
        return 1;
      }

    }
    return 0;
  }
  return 0;
}

- (__CFDictionary)copyRestrictionDictionaryMultiPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v12;
  int v13;
  unsigned int v14[2];
  float float_from_edt;
  int v16;
  unsigned int v17;
  id v18;
  id v19;
  id v20;
  int v21;
  SEL v22;
  CBBacklightNode *v23;
  float v25;

  v23 = self;
  v22 = a2;
  v21 = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v20)
    return 0;
  v19 = 0;
  v18 = 0;
  if (-[CBBacklightNode createMultipointRestrictionArrayForThresholdsName:andFactorsName:andThresholds:andFactors:](v23, "createMultipointRestrictionArrayForThresholdsName:andFactorsName:andThresholds:andFactors:", CFSTR("max-restriction-thresholds"), CFSTR("max-restriction-factors"), &v19, &v18))
  {
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("max_thresholds"));
    objc_msgSend(v20, "setObject:forKey:", v18, CFSTR("max_factors"));

    v21 = 1;
    v17 = 0;
    v16 = 0;
    float_from_edt = 0.0;
    float_from_edt = load_float_from_edt(v23->_service, CFSTR("max-restr-rise-time-fast-thr"));
    v25 = float_from_edt;
    *(float *)&v2 = float_from_edt;
    objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2), CFSTR("max_rise_time_fast_threshold"));
    if ((load_uint_from_edt(v23->_service, CFSTR("max-restr-rise-time-fast"), &v17) & 1) != 0)
    {
      v3 = (float)v17 / 1000.0;
      *(float *)&v3 = v3;
      v16 = LODWORD(v3);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3), CFSTR("max_rise_time_fast"));
    }
    if ((load_uint_from_edt(v23->_service, CFSTR("max-restriction-rise-time"), &v17) & 1) != 0)
    {
      v4 = (float)v17 / 1000.0;
      *(float *)&v4 = v4;
      v16 = LODWORD(v4);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("max_rise_time"));
    }
    if ((load_uint_from_edt(v23->_service, CFSTR("max-restriction-fall-time"), &v17) & 1) != 0)
    {
      v5 = (float)v17 / 1000.0;
      *(float *)&v5 = v5;
      v16 = LODWORD(v5);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("max_fall_time"));
    }
    if ((load_uint_from_edt(v23->_service, CFSTR("max-restriction-factor-aab-off"), &v17) & 1) != 0)
    {
      v6 = (float)v17 / 1000.0;
      *(float *)&v6 = v6;
      v14[1] = LODWORD(v6);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("max_factor_aab_off"));
    }
  }
  v19 = 0;
  v18 = 0;
  if (-[CBBacklightNode createMultipointRestrictionArrayForThresholdsName:andFactorsName:andThresholds:andFactors:](v23, "createMultipointRestrictionArrayForThresholdsName:andFactorsName:andThresholds:andFactors:", CFSTR("min-restriction-thresholds"), CFSTR("min-restriction-factors"), &v19, &v18))
  {
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("min_thresholds"));
    objc_msgSend(v20, "setObject:forKey:", v18, CFSTR("min_factors"));

    v21 = 1;
    v14[0] = 0;
    v13 = 0;
    if ((load_uint_from_edt(v23->_service, CFSTR("min-restriction-rise-time"), v14) & 1) != 0)
    {
      v7 = (float)v14[0] / 1000.0;
      *(float *)&v7 = v7;
      v13 = LODWORD(v7);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("min_rise_time"));
    }
    if ((load_uint_from_edt(v23->_service, CFSTR("min-restriction-fall-time"), v14) & 1) != 0)
    {
      v8 = (float)v14[0] / 1000.0;
      *(float *)&v8 = v8;
      v13 = LODWORD(v8);
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), CFSTR("min_fall_time"));
    }
  }
  if (v21)
  {
    v12 = 0;
    if ((load_uint_from_edt(v23->_service, CFSTR("restriction-pivoting-l"), &v12) & 1) != 0)
    {
      *(float *)&v9 = (float)v12;
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), CFSTR("pivoting_L"));
    }
    if ((load_uint_from_edt(v23->_service, CFSTR("restriction-pivoting-l-2"), &v12) & 1) != 0)
    {
      *(float *)&v10 = (float)v12;
      objc_msgSend(v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("pivoting_L_max"));
    }
    objc_msgSend(v20, "setObject:forKey:", &unk_1E69169E8, CFSTR("multi_point"));
  }
  else
  {

    return 0;
  }
  return (__CFDictionary *)v20;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBBacklightNode *v4;

  v4 = self;
  v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBBacklightNode;
  -[CBBacklightNode dealloc](&v2, sel_dealloc);
}

- (int)grimaldiSamplingStrategy
{
  return self->_grimaldiSamplingStrategy;
}

- (CBTwilightParams)twilight
{
  return self->_twilight;
}

- (CBChromaticCorrectionParams)ammolite
{
  return self->_ammolite;
}

@end
