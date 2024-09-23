@implementation NSUnitFormatter

- (unint64_t)unitOptions
{
  return self->_unitOptions;
}

- (id)stringForObjectValue:(id)a3
{
  double v5;
  double v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  char isKindOfClass;
  void *v15;
  NSNumberFormatter *v17;
  NSString *v19;
  NSMeasurement *v20;
  unint64_t unitOptions;
  NSMeasurement *v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  NSNumberFormatter *v29;
  _OWORD v30[2];
  _QWORD v31[92];
  _QWORD v32[93];

  v32[92] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "doubleValue");
  v6 = v5;
  v7 = (void *)objc_msgSend(a3, "unit");
  if (_unitHasSpecifierAndIsDimensional(v7))
  {
    *(_QWORD *)&v8 = -1;
    *((_QWORD *)&v8 + 1) = -1;
    v30[0] = v8;
    v30[1] = v8;
    if (-[NSUnitFormatter _determineUnitsToFormat:fromMeasurement:](self, "_determineUnitsToFormat:fromMeasurement:", v30, a3) != 1)
    {
      v17 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
      objc_msgSend(a3, "doubleValue");
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[NSNumberFormatter stringFromNumber:](v17, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")), objc_msgSend((id)objc_msgSend(a3, "unit"), "symbol"));
    }
    v9 = LODWORD(v30[0]);
    if (LODWORD(v30[0]) != -1)
    {
      if (LODWORD(v30[0]) == 2563)
      {
        v10 = objc_msgSend(v7, "specifier");
        if ((self->_unitOptions & 1) == 0)
        {
          v11 = v10;
          v12 = objc_msgSend(MEMORY[0x1E0C99DC8], "_preferredTemperatureUnit");
          if (v11 == 2561 && v12 == *MEMORY[0x1E0C99830])
          {
            v13 = 2560;
          }
          else
          {
            if (v11 != 2560 || v12 != *MEMORY[0x1E0C99838])
              return -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", 2563, v6);
            v13 = 2561;
          }
          objc_msgSend((id)objc_msgSend(a3, "measurementByConvertingToUnit:", getDimensionUnitFromUnitSpecifier(v13)), "doubleValue");
          v6 = v25;
        }
        return -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", 2563, v6);
      }
      v20 = -[NSMeasurement initWithDoubleValue:unit:]([NSMeasurement alloc], "initWithDoubleValue:unit:", v7, v6);
      unitOptions = self->_unitOptions;
      v22 = v20;
      if (getDimensionUnitFromUnitSpecifier(v9))
        v22 = -[NSMeasurement measurementByConvertingToUnit:](v20, "measurementByConvertingToUnit:");
      if ((unitOptions & 2) != 0)
      {
        v31[0] = &off_1E0FBDF80;
        v31[1] = &off_1E0FBDFB0;
        v32[0] = &off_1E0FBDF98;
        v32[1] = &off_1E0FBDF98;
        v31[2] = &off_1E0FBDFC8;
        v31[3] = &off_1E0FBDFE0;
        v32[2] = &off_1E0FBDF98;
        v32[3] = &off_1E0FBDFF8;
        v31[4] = &off_1E0FBE010;
        v31[5] = &off_1E0FBE028;
        v32[4] = &off_1E0FBDFF8;
        v32[5] = &off_1E0FBDFF8;
        v31[6] = &off_1E0FBE040;
        v31[7] = &off_1E0FBE058;
        v32[6] = &off_1E0FBDF98;
        v32[7] = &off_1E0FBDFF8;
        v31[8] = &off_1E0FBE070;
        v31[9] = &off_1E0FBE088;
        v32[8] = &off_1E0FBDFF8;
        v32[9] = &off_1E0FBDF98;
        v31[10] = &off_1E0FBE0A0;
        v31[11] = &off_1E0FBE0B8;
        v32[10] = &off_1E0FBDF98;
        v32[11] = &off_1E0FBDF98;
        v31[12] = &off_1E0FBE0D0;
        v31[13] = &off_1E0FBE0E8;
        v32[12] = &off_1E0FBDF98;
        v32[13] = &off_1E0FBDF98;
        v31[14] = &off_1E0FBE100;
        v31[15] = &off_1E0FBE118;
        v32[14] = &off_1E0FBDF98;
        v32[15] = &off_1E0FBDF98;
        v31[16] = &off_1E0FBE130;
        v31[17] = &off_1E0FBE148;
        v32[16] = &off_1E0FBDF98;
        v32[17] = &off_1E0FBDFF8;
        v31[18] = &off_1E0FBE160;
        v31[19] = &off_1E0FBE178;
        v32[18] = &off_1E0FBDFF8;
        v32[19] = &off_1E0FBDFF8;
        v31[20] = &off_1E0FBE190;
        v31[21] = &off_1E0FBE1A8;
        v32[20] = &off_1E0FBDFF8;
        v32[21] = &off_1E0FBDFF8;
        v31[22] = &off_1E0FBE1C0;
        v31[23] = &off_1E0FBE1D8;
        v32[22] = &off_1E0FBDFF8;
        v32[23] = &off_1E0FBDFF8;
        v31[24] = &off_1E0FBE1F0;
        v31[25] = &off_1E0FBE208;
        v32[24] = &off_1E0FBDF98;
        v32[25] = &off_1E0FBDF98;
        v31[26] = &off_1E0FBE220;
        v31[27] = &off_1E0FBE238;
        v32[26] = &off_1E0FBDFF8;
        v32[27] = &off_1E0FBDFF8;
        v31[28] = &off_1E0FBE250;
        v31[29] = &off_1E0FBE280;
        v32[28] = &off_1E0FBE268;
        v32[29] = &off_1E0FBDF98;
        v31[30] = &off_1E0FBE298;
        v31[31] = &off_1E0FBE2B0;
        v32[30] = &off_1E0FBDF98;
        v32[31] = &off_1E0FBDF98;
        v31[32] = &off_1E0FBE2C8;
        v31[33] = &off_1E0FBE2E0;
        v32[32] = &off_1E0FBDFF8;
        v32[33] = &off_1E0FBDF98;
        v31[34] = &off_1E0FBE2F8;
        v31[35] = &off_1E0FBE310;
        v32[34] = &off_1E0FBE268;
        v32[35] = &off_1E0FBDF98;
        v31[36] = &off_1E0FBE328;
        v31[37] = &off_1E0FBE340;
        v32[36] = &off_1E0FBDF98;
        v32[37] = &off_1E0FBDFF8;
        v31[38] = &off_1E0FBE358;
        v31[39] = &off_1E0FBE370;
        v32[38] = &off_1E0FBDF98;
        v32[39] = &off_1E0FBDF98;
        v31[40] = &off_1E0FBE388;
        v31[41] = &off_1E0FBE3A0;
        v32[40] = &off_1E0FBDF98;
        v32[41] = &off_1E0FBDF98;
        v31[42] = &off_1E0FBE3B8;
        v31[43] = &off_1E0FBE3D0;
        v32[42] = &off_1E0FBDF98;
        v32[43] = &off_1E0FBDFF8;
        v31[44] = &off_1E0FBE3E8;
        v31[45] = &off_1E0FBE400;
        v32[44] = &off_1E0FBDF98;
        v32[45] = &off_1E0FBDF98;
        v31[46] = &off_1E0FBE418;
        v31[47] = &off_1E0FBE430;
        v32[46] = &off_1E0FBDF98;
        v32[47] = &off_1E0FBDFF8;
        v31[48] = &off_1E0FBE448;
        v31[49] = &off_1E0FBE460;
        v32[48] = &off_1E0FBDF98;
        v32[49] = &off_1E0FBDF98;
        v31[50] = &off_1E0FBE478;
        v31[51] = &off_1E0FBE490;
        v32[50] = &off_1E0FBDFF8;
        v32[51] = &off_1E0FBDF98;
        v31[52] = &off_1E0FBE4A8;
        v31[53] = &off_1E0FBE4C0;
        v32[52] = &off_1E0FBDF98;
        v32[53] = &off_1E0FBDF98;
        v31[54] = &off_1E0FBE4D8;
        v31[55] = &off_1E0FBE4F0;
        v32[54] = &off_1E0FBDF98;
        v32[55] = &off_1E0FBDF98;
        v31[56] = &off_1E0FBE508;
        v31[57] = &off_1E0FBE520;
        v32[56] = &off_1E0FBDF98;
        v32[57] = &off_1E0FBDF98;
        v31[58] = &off_1E0FBE538;
        v31[59] = &off_1E0FBE550;
        v32[58] = &off_1E0FBDF98;
        v32[59] = &off_1E0FBDF98;
        v31[60] = &off_1E0FBE568;
        v31[61] = &off_1E0FBE580;
        v32[60] = &off_1E0FBDF98;
        v32[61] = &off_1E0FBDFF8;
        v31[62] = &off_1E0FBE598;
        v31[63] = &off_1E0FBE5B0;
        v32[62] = &off_1E0FBDFF8;
        v32[63] = &off_1E0FBDFF8;
        v31[64] = &off_1E0FBE5C8;
        v32[64] = &off_1E0FBDFF8;
        v31[65] = &off_1E0FBE5E0;
        v32[65] = &off_1E0FBDFF8;
        v31[66] = &off_1E0FBE5F8;
        v32[66] = &off_1E0FBDFF8;
        v31[67] = &off_1E0FBE610;
        v32[67] = &off_1E0FBDFF8;
        v31[68] = &off_1E0FBE628;
        v32[68] = &off_1E0FBDFF8;
        v31[69] = &off_1E0FBE640;
        v32[69] = &off_1E0FBDFF8;
        v31[70] = &off_1E0FBE658;
        v32[70] = &off_1E0FBDFF8;
        v31[71] = &off_1E0FBE670;
        v32[71] = &off_1E0FBDFF8;
        v31[72] = &off_1E0FBE688;
        v32[72] = &off_1E0FBDFF8;
        v31[73] = &off_1E0FBE6A0;
        v32[73] = &off_1E0FBE268;
        v31[74] = &off_1E0FBE6B8;
        v32[74] = &off_1E0FBDF98;
        v31[75] = &off_1E0FBE6D0;
        v32[75] = &off_1E0FBDF98;
        v31[76] = &off_1E0FBE6E8;
        v32[76] = &off_1E0FBDFF8;
        v31[77] = &off_1E0FBE700;
        v32[77] = &off_1E0FBDFF8;
        v31[78] = &off_1E0FBE718;
        v32[78] = &off_1E0FBDFF8;
        v31[79] = &off_1E0FBE730;
        v32[79] = &off_1E0FBDF98;
        v31[80] = &off_1E0FBE748;
        v32[80] = &off_1E0FBDFF8;
        v31[81] = &off_1E0FBE760;
        v32[81] = &off_1E0FBE268;
        v31[82] = &off_1E0FBE778;
        v32[82] = &off_1E0FBDF98;
        v31[83] = &off_1E0FBE790;
        v32[83] = &off_1E0FBDF98;
        v31[84] = &off_1E0FBE7A8;
        v32[84] = &off_1E0FBDF98;
        v31[85] = &off_1E0FBE7C0;
        v32[85] = &off_1E0FBDF98;
        v31[86] = &off_1E0FBE7D8;
        v32[86] = &off_1E0FBDF98;
        v31[87] = &off_1E0FBE7F0;
        v32[87] = &off_1E0FBDF98;
        v31[88] = &off_1E0FBE808;
        v32[88] = &off_1E0FBDF98;
        v31[89] = &off_1E0FBE820;
        v32[89] = &off_1E0FBDF98;
        v31[90] = &off_1E0FBE838;
        v32[90] = &off_1E0FBDF98;
        v31[91] = &off_1E0FBE850;
        v32[91] = &off_1E0FBDF98;
        v23 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 92), "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        if (v23)
          v24 = objc_msgSend(v23, "unsignedIntegerValue");
        else
          v24 = 3;
        -[NSMeasurement unit](v22, "unit");
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = (NSMeasurement *)objc_msgSend((id)objc_opt_class(), "_measurementWithNaturalScale:system:", v22, v24);
      }
      if (_unitHasSpecifierAndIsDimensional(-[NSMeasurement unit](v22, "unit")))
      {
        v26 = objc_msgSend(-[NSMeasurement unit](v22, "unit"), "specifier");
        if (v26 == -1)
        {
          v19 = 0;
          goto LABEL_36;
        }
        v27 = v26;
        -[NSMeasurement doubleValue](v22, "doubleValue");
        v28 = -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", v27);
      }
      else
      {
        v29 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
        -[NSMeasurement doubleValue](v22, "doubleValue");
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[NSNumberFormatter stringFromNumber:](v29, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")), objc_msgSend(-[NSMeasurement unit](v22, "unit"), "symbol"));
      }
      v19 = v28;
LABEL_36:

      return v19;
    }
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((-[NSUnitFormatter unitOptions](self, "unitOptions") & 1) != 0 || (isKindOfClass & 1) == 0)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[NSNumberFormatter stringFromNumber:](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6)), objc_msgSend(v7, "symbol"));
    v15 = (void *)objc_msgSend((id)objc_opt_class(), "baseUnit");
    if (_unitHasSpecifierAndIsDimensional(v15))
      return -[NSUnitFormatter stringForObjectValue:](self, "stringForObjectValue:", objc_msgSend(a3, "measurementByConvertingToUnit:", v15));
  }
  return 0;
}

- (id)stringForValue:(double)a3 unit:(unint64_t)a4
{
  unsigned int v7;
  unsigned int v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  double v22;
  __int16 v23;
  unint64_t v24;
  _OWORD v25[12];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  v26 = 0;
  memset(v25, 0, sizeof(v25));
  if (!self->_formatter && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** [NSUnitFormatter stringForValue:unit:] _formatter is nil", buf, 2u);
  }
  v7 = uameasfmt_format();
  v8 = v7;
  if ((int)v7 >= 1)
  {
    if (v7 < 0x65)
      return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v25, v7);
    v14 = malloc_type_malloc(2 * v7, 0x7DDDC599uLL);
    if (v14)
    {
      v15 = v14;
      uameasfmt_format();
      v13 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v15, v8);
      free(v15);
      return v13;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = 2 * v8;
      v10 = MEMORY[0x1E0C81028];
      v11 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      v12 = 12;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = u_errorName(U_ZERO_ERROR);
    *(_DWORD *)buf = 136315906;
    v18 = (uint64_t)v9;
    v19 = 1024;
    v20 = v8;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    v10 = MEMORY[0x1E0C81028];
    v11 = "*** uameasfmt_format() failed in NSUnitFormatter: %s, len = %d, value = %f, unit = %lu";
    v12 = 38;
LABEL_7:
    _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
  }
  return 0;
}

- (void)checkIfModified
{
  NSNumberFormatter *v3;
  uint64_t v4;
  const char *v5;
  int64_t unitStyle;
  int v7;
  UAMeasureFormat *v8;
  const char *v9;
  UAMeasureFormat *formatter;
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  UAMeasureFormat *v14;
  __int16 v15;
  uint8_t *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_modified
    || -[NSNumberFormatter checkModify](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "checkModify")
    || !self->_formatter)
  {
    if (self->_formatter)
      uameasfmt_close();
    v3 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
    if (!-[NSNumberFormatter getFormatter](v3, "getFormatter")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = 0;
      _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** [nf getFormatter] failed in NSUnitFormatter: %p", buf, 0xCu);
    }
    v4 = unum_clone();
    if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      v22 = v5;
      v23 = 2048;
      v24 = v4;
      _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** unum_clone() failed in NSUnitFormatter: %s, icuNF: %p", buf, 0x16u);
    }
    -[NSString getCString:maxLength:encoding:](-[NSLocale localeIdentifier](-[NSNumberFormatter locale](v3, "locale"), "localeIdentifier"), "getCString:maxLength:encoding:", buf, 100, 4);
    unitStyle = self->_unitStyle;
    if (unitStyle == 1)
      v7 = 2;
    else
      v7 = unitStyle == 2;
    v8 = (UAMeasureFormat *)uameasfmt_open();
    self->_formatter = v8;
    if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = u_errorName(U_ZERO_ERROR);
      formatter = self->_formatter;
      *(_DWORD *)v11 = 136316162;
      v12 = v9;
      v13 = 2048;
      v14 = formatter;
      v15 = 2080;
      v16 = buf;
      v17 = 1024;
      v18 = v7;
      v19 = 2048;
      v20 = v4;
      _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_open() failed in NSUnitFormatter: %s, _formatter: %p, localeID: %s, width: %u, icuNF: %p", v11, 0x30u);
    }
    self->_modified = 0;
    -[NSNumberFormatter resetCheckModify](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "resetCheckModify");
  }
}

- (int)_determineUnitsToFormat:(int *)a3 fromMeasurement:(id)a4
{
  unint64_t unitOptions;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  void *v12;
  _BYTE *v13;
  int UnitsForUsage;
  int v15;
  uint8_t buf[4];
  const char *v18;
  _BYTE v19[100];
  _BYTE __src[35];
  char buffer[257];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  unitOptions = self->_unitOptions;
  if (!_unitHasSpecifierAndIsDimensional((void *)objc_msgSend(a4, "unit")))
    return 0;
  v8 = objc_msgSend((id)objc_msgSend(a4, "unit"), "specifier");
  v9 = objc_msgSend(MEMORY[0x1E0C99DC8], "_preferredTemperatureUnit");
  if ((unint64_t)(v8 - 2560) > 2)
  {
    if ((unitOptions & 1) != 0)
      goto LABEL_38;
  }
  else
  {
    v10 = self->_unitOptions;
    if (v10 & 4 | unitOptions & 1)
    {
      if ((v10 & 4) != 0)
      {
        v11 = 2563;
LABEL_25:
        *a3 = v11;
        return 1;
      }
LABEL_38:
      *a3 = v8;
      return 1;
    }
    if (v9 == *MEMORY[0x1E0C99830])
    {
      v11 = 2560;
      goto LABEL_25;
    }
    if (v9 == *MEMORY[0x1E0C99838])
    {
      v11 = 2561;
      goto LABEL_25;
    }
  }
  if (!CFStringGetCString((CFStringRef)-[NSLocale localeIdentifier](self->_locale, "localeIdentifier"), buffer, 257, 0x600u))return 0;
  v12 = (void *)objc_msgSend((id)objc_opt_class(), "icuType");
  if (!objc_msgSend(v12, "length")
    || (v13 = v19, (objc_msgSend(v12, "getCString:maxLength:encoding:", v19, 100, 4) & 1) == 0))
  {
    v13 = 0;
  }
  if (((unint64_t)(v8 - 4609) > 8 || ((1 << (v8 - 1)) & 0x103) == 0)
    && (v8 & 0xFFFFFFFFFFFFFFFCLL) != 0xD00
    && (unint64_t)(v8 - 1024) >= 0xA
    && (unint64_t)(v8 - 3072) >= 6
    && (unint64_t)(v8 - 1280) >= 0x13
    && (unint64_t)(v8 - 1536) >= 0xB
    && ((unint64_t)(v8 - 2048) >= 0xA || ((0x2DFu >> v8) & 1) == 0)
    && (v8 & 0xFFFFFFFFFFFFFFFCLL) != 0x900
    && (unint64_t)(v8 - 2560) >= 3
    && ((unint64_t)(v8 - 2816) >= 0x19 || ((0x17FFFBFu >> v8) & 1) == 0)
    || !v13)
  {
    goto LABEL_38;
  }
  UnitsForUsage = uameasfmt_getUnitsForUsage();
  v15 = UnitsForUsage;
  if (UnitsForUsage < 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = u_errorName(U_ZERO_ERROR);
      _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_getUnitsForUsage() failed in NSUnitFormatter: %s", buf, 0xCu);
    }
    a3[v15++] = v8;
  }
  else
  {
    memcpy(a3, __src, 4 * UnitsForUsage);
  }
  return v15;
}

- (id)unitStringFromValue:(double)a3 unit:(unint64_t)a4
{
  NSNumberFormatter *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  unint64_t v10;
  __CFString *v11;
  int v12;
  NSString *v13;
  NSFormattingContext v14;
  __CFString *v15;
  const char *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  _OWORD v22[12];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1EDC54F18 != -1)
    dispatch_once(&qword_1EDC54F18, &__block_literal_global_71);
  v6 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
  v7 = -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  if (self->_prules)
  {
    v8 = v7;
    if (!-[NSNumberFormatter checkLocaleChange](v6, "checkLocaleChange")
      && -[NSString isEqualToString:](v8, "isEqualToString:", -[NSLocale localeIdentifier](-[NSNumberFormatter locale](v6, "locale"), "localeIdentifier")))
    {
      goto LABEL_9;
    }
    if (self->_prules)
      uplrules_close();
  }
  -[NSString getCString:maxLength:encoding:](-[NSLocale localeIdentifier](-[NSNumberFormatter locale](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "locale"), "localeIdentifier"), "getCString:maxLength:encoding:", v22, 100, 4);
  self->_prules = (UPluralRules *)uplrules_open();
  -[NSNumberFormatter resetCheckLocaleChange](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "resetCheckLocaleChange");
LABEL_9:
  v9 = objc_msgSend((id)_MergedGlobals_8, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v10 = self->_unitStyle - 1;
  if (v10 > 2)
    v11 = 0;
  else
    v11 = off_1E0F525A0[v10];
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  v12 = uplrules_select();
  if (v12 < 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v16 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      v19 = v16;
      v20 = 1024;
      v21 = v12;
      _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** uplrules_select() failed in NSUnitFormatter: %s, len = %d", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    v13 = -[NSString uppercaseString](+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v22, v12), "uppercaseString");
    v14 = -[NSNumberFormatter formattingContext](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "formattingContext");
    if ((unint64_t)v14 > NSFormattingContextMiddleOfSentence)
      v15 = 0;
    else
      v15 = off_1E0F525B8[v14];
    return (id)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@_%@"), v9, v11, v13, v15), &stru_1E0F56070, CFSTR("UnitFormatting"));
  }
}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = objc_alloc_init(NSNumberFormatter);
    self->_numberFormatter = v4;
    -[NSNumberFormatter setNumberStyle:](v4, "setNumberStyle:", 1);
    -[NSNumberFormatter setPropertyBit](self->_numberFormatter, "setPropertyBit");
    -[NSNumberFormatter setLocale:](self->_numberFormatter, "setLocale:", self->_locale);
    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (void)setUnitOptions:(unint64_t)a3
{
  if (self->_unitOptions != a3)
  {
    self->_unitOptions = a3;
    self->_modified = 1;
  }
}

- (void)setUnitStyle:(int64_t)a3
{
  if (self->_unitStyle != a3)
  {
    self->_unitStyle = a3;
    self->_modified = 1;
  }
}

- (NSUnitFormatter)init
{
  NSUnitFormatter *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSUnitFormatter;
  result = -[NSUnitFormatter init](&v3, sel_init);
  if (result)
  {
    result->_unitStyle = 2;
    result->_unitOptions = 0;
    result->_modified = 0;
  }
  return result;
}

- (void)dealloc
{
  NSLocale *locale;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[NSUnitFormatter setNumberFormatter:](self, "setNumberFormatter:", 0);
  if (self->_formatter)
    uameasfmt_close();
  if (self->_prules)
    uplrules_close();
  locale = self->_locale;
  if (locale)

  v4.receiver = self;
  v4.super_class = (Class)NSUnitFormatter;
  -[NSUnitFormatter dealloc](&v4, sel_dealloc);
}

- (void)setLocale:(id)a3
{
  id v3;
  NSLocale *locale;

  v3 = a3;
  if (!a3)
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  if ((-[NSLocale isEqual:](self->_locale, "isEqual:", v3) & 1) == 0)
  {
    locale = self->_locale;
    self->_locale = (NSLocale *)v3;

    -[NSUnitFormatter setNumberFormatter:](self, "setNumberFormatter:", 0);
    self->_modified = 1;
  }
}

- (void)setNumberFormatter:(id)a3
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v6;

  numberFormatter = self->_numberFormatter;
  if (numberFormatter != a3)
  {
    -[NSNumberFormatter clearPropertyBit](numberFormatter, "clearPropertyBit");

    v6 = (NSNumberFormatter *)objc_msgSend(a3, "copyWithZone:", 0);
    self->_numberFormatter = v6;
    -[NSNumberFormatter setPropertyBit](v6, "setPropertyBit");
    self->_modified = 1;
  }
}

- (NSLocale)locale
{
  NSLocale *locale;

  locale = self->_locale;
  if (!locale)
  {
    locale = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    self->_locale = locale;
  }
  return locale;
}

- (int64_t)unitStyle
{
  return self->_unitStyle;
}

- (id)stringForValue1:(double)a3 unit1:(unint64_t)a4 value2:(double)a5 unit2:(unint64_t)a6
{
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unsigned int v18;
  _OWORD v19[12];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v6 = uameasfmt_formatMultiple();
  v7 = v6;
  if ((int)v6 >= 1)
  {
    if (v6 < 0x65)
      return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v19, v6);
    v12 = malloc_type_malloc(2 * v6, 0xC74DC359uLL);
    if (v12)
    {
      v13 = v12;
      uameasfmt_formatMultiple();
      v11 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v13, v7);
      free(v13);
      return v11;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = (const char *)(2 * v7);
      v8 = MEMORY[0x1E0C81028];
      v9 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      v10 = 12;
      goto LABEL_4;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = u_errorName(U_ZERO_ERROR);
    v17 = 1024;
    v18 = v7;
    v8 = MEMORY[0x1E0C81028];
    v9 = "*** uameasfmt_formatMultiple() failed in NSUnitFormatter: %s, len = %d";
    v10 = 18;
LABEL_4:
    _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
  }
  return 0;
}

- (id)stringFromUnit:(id)a3
{
  unsigned int UnitName;
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  NSString *v10;
  void *v12;
  void *v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  _OWORD v19[12];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!_unitHasSpecifierAndIsDimensional(a3))
    return (id)objc_msgSend(a3, "symbol");
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  objc_msgSend(a3, "specifier");
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  UnitName = uameasfmt_getUnitName();
  v6 = UnitName;
  if ((int)UnitName >= 1)
  {
    if (UnitName < 0x65)
      return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v19, UnitName);
    v12 = malloc_type_malloc(2 * UnitName, 0x73771978uLL);
    if (v12)
    {
      v13 = v12;
      v14 = uameasfmt_getUnitName();
      if (v14 >= 1)
      {
        v10 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v13, v14);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v16 = u_errorName(U_ZERO_ERROR);
          v17 = 1024;
          v18 = v14;
          _os_log_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d", buf, 0x12u);
        }
        v10 = 0;
      }
      free(v13);
      return v10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = (const char *)(2 * v6);
      v7 = MEMORY[0x1E0C81028];
      v8 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      v9 = 12;
      goto LABEL_5;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = u_errorName(U_ZERO_ERROR);
    v17 = 1024;
    v18 = v6;
    v7 = MEMORY[0x1E0C81028];
    v8 = "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d";
    v9 = 18;
LABEL_5:
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
  }
  return 0;
}

- (NSUnitFormatter)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  const __CFString **v10;
  void *v11;
  void *v12;
  NSUnitFormatter *v13;
  NSUnitFormatter *v14;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.unitOptions"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.unitStyle")))
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.unitStyle"));
  else
    v6 = 2;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.locale")))
  {
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", MEMORY[0x1E0C99DC8], CFSTR("NS.locale"));
    if (!v7)
    {

      v18 = CFSTR("NSLocalizedDescription");
      v19[0] = CFSTR("Locale has been corrupted!");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (const __CFString **)v19;
      v10 = &v18;
LABEL_18:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1)));
      return 0;
    }
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.numberFormatter")))
  {
    v11 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", NSNumberFormatter, CFSTR("NS.numberFormatter"));
    if (!v11)
    {

      v16 = CFSTR("NSLocalizedDescription");
      v17 = CFSTR("Number formatter has been corrupted!");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v17;
      v10 = &v16;
      goto LABEL_18;
    }
    v12 = v11;
    objc_msgSend(v11, "setPropertyBit");
  }
  else
  {
    v12 = 0;
  }
  v13 = -[NSUnitFormatter init](self, "init");
  v14 = v13;
  if (v13)
  {
    if (v6 != 2)
      v13->_unitStyle = v6;
    v13->_unitOptions = v5;
    v13->_locale = (NSLocale *)objc_msgSend(v7, "copy");
    v14->_numberFormatter = (NSNumberFormatter *)objc_msgSend(v12, "copy");
    v14->_modified = 1;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t unitStyle;
  NSLocale *locale;
  NSNumberFormatter *numberFormatter;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitFormatter cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_unitOptions, CFSTR("NS.unitOptions"));
  unitStyle = self->_unitStyle;
  if (unitStyle != 2)
    objc_msgSend(a3, "encodeInteger:forKey:", unitStyle, CFSTR("NS.unitStyle"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(a3, "encodeObject:forKey:", locale, CFSTR("NS.locale"));
  numberFormatter = self->_numberFormatter;
  if (numberFormatter)
    objc_msgSend(a3, "encodeObject:forKey:", numberFormatter, CFSTR("NS.numberFormatter"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUnitStyle:", self->_unitStyle);
  objc_msgSend(v4, "setNumberFormatter:", self->_numberFormatter);
  objc_msgSend(v4, "setLocale:", self->_locale);
  return v4;
}

@end
