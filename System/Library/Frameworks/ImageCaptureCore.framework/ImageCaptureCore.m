uint64_t OUTLINED_FUNCTION_3()
{
  void *v0;

  return objc_msgSend(v0, "UTF8String");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1B98FFA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B98FFEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B99002B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SharedICDeviceHardwareHandler()
{
  if (SharedICDeviceHardwareHandler_assetManageToken != -1)
    dispatch_once(&SharedICDeviceHardwareHandler_assetManageToken, &__block_literal_global_0);
  return (id)_gICDeviceHardwareHandler;
}

id __ICLogDateString()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (__ICLogDateString_onceToken != -1)
    dispatch_once(&__ICLogDateString_onceToken, &__block_literal_global_1);
  v0 = (void *)__ICLogDateString_currentCalendar;
  if (__ICLogDateString_unitFlags)
    v1 = 33020;
  else
    v1 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "components:fromDate:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "hour");
  v5 = objc_msgSend(v3, "minute");
  v6 = objc_msgSend(v3, "second");
  v7 = objc_msgSend(v3, "nanosecond");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld:%02ld:%02ld:%06.3ld  "), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __ICOSLogCreate()
{
  if (__ICOSLogCreate_onceToken != -1)
    dispatch_once(&__ICOSLogCreate_onceToken, &__block_literal_global_8);
}

void __ICReadPrefs()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentDomainForName:", ICPreferencesDomain);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("loggingLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v3 = objc_msgSend(v2, "unsignedIntegerValue")) != 0)
  {
    ICLoggingLevel = v3;
  }
  else if (!ICLoggingLevel)
  {
    ICLoggingLevel = 3075;
    v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3075);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, CFSTR("loggingLevel"));

    v6 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSetMultiple((CFDictionaryRef)v1, 0, (CFStringRef)ICPreferencesDomain, (CFStringRef)*MEMORY[0x1E0C9B260], v4);
    CFPreferencesSynchronize((CFStringRef)ICPreferencesDomain, v6, v4);
  }

}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

id __ICLongValueToErrorString(int a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[72];
  _QWORD v8[73];

  v8[72] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E70DBF48;
  v7[1] = &unk_1E70DBF60;
  v8[0] = &unk_1E70D9D60;
  v8[1] = &unk_1E70D9D88;
  v7[2] = &unk_1E70DBF78;
  v7[3] = &unk_1E70DBF90;
  v8[2] = &unk_1E70D9DB0;
  v8[3] = &unk_1E70D9DD8;
  v7[4] = &unk_1E70DBFA8;
  v7[5] = &unk_1E70DBFC0;
  v8[4] = &unk_1E70D9E00;
  v8[5] = &unk_1E70D9E28;
  v7[6] = &unk_1E70DBFD8;
  v7[7] = &unk_1E70DBFF0;
  v8[6] = &unk_1E70D9E50;
  v8[7] = &unk_1E70D9E78;
  v7[8] = &unk_1E70DC008;
  v7[9] = &unk_1E70DC020;
  v8[8] = &unk_1E70D9EA0;
  v8[9] = &unk_1E70D9EC8;
  v7[10] = &unk_1E70DC038;
  v7[11] = &unk_1E70DC050;
  v8[10] = &unk_1E70D9EF0;
  v8[11] = &unk_1E70D9F18;
  v7[12] = &unk_1E70DC068;
  v7[13] = &unk_1E70DC080;
  v8[12] = &unk_1E70D9F40;
  v8[13] = &unk_1E70D9F68;
  v7[14] = &unk_1E70DC098;
  v7[15] = &unk_1E70DC0B0;
  v8[14] = &unk_1E70D9F90;
  v8[15] = &unk_1E70D9FB8;
  v7[16] = &unk_1E70DC0C8;
  v7[17] = &unk_1E70DC0E0;
  v8[16] = &unk_1E70D9FE0;
  v8[17] = &unk_1E70DA008;
  v7[18] = &unk_1E70DC0F8;
  v7[19] = &unk_1E70DC110;
  v8[18] = &unk_1E70DA030;
  v8[19] = &unk_1E70DA058;
  v7[20] = &unk_1E70DC128;
  v7[21] = &unk_1E70DC140;
  v8[20] = &unk_1E70DA080;
  v8[21] = &unk_1E70DA0A8;
  v7[22] = &unk_1E70DC158;
  v7[23] = &unk_1E70DC170;
  v8[22] = &unk_1E70DA0D0;
  v8[23] = &unk_1E70DA0F8;
  v7[24] = &unk_1E70DC188;
  v7[25] = &unk_1E70DC1A0;
  v8[24] = &unk_1E70DA120;
  v8[25] = &unk_1E70DA148;
  v7[26] = &unk_1E70DC1B8;
  v7[27] = &unk_1E70DC1D0;
  v8[26] = &unk_1E70DA170;
  v8[27] = &unk_1E70DA198;
  v7[28] = &unk_1E70DC1E8;
  v7[29] = &unk_1E70DC200;
  v8[28] = &unk_1E70DA1C0;
  v8[29] = &unk_1E70DA1E8;
  v7[30] = &unk_1E70DC218;
  v7[31] = &unk_1E70DC230;
  v8[30] = &unk_1E70DA210;
  v8[31] = &unk_1E70DA238;
  v7[32] = &unk_1E70DC248;
  v7[33] = &unk_1E70DC260;
  v8[32] = &unk_1E70DA260;
  v8[33] = &unk_1E70DA288;
  v7[34] = &unk_1E70DC278;
  v7[35] = &unk_1E70DC290;
  v8[34] = &unk_1E70DA2B0;
  v8[35] = &unk_1E70DA2D8;
  v7[36] = &unk_1E70DC2A8;
  v7[37] = &unk_1E70DC2C0;
  v8[36] = &unk_1E70DA300;
  v8[37] = &unk_1E70DA328;
  v7[38] = &unk_1E70DC2D8;
  v7[39] = &unk_1E70DC2F0;
  v8[38] = &unk_1E70DA350;
  v8[39] = &unk_1E70DA378;
  v7[40] = &unk_1E70DC308;
  v7[41] = &unk_1E70DC320;
  v8[40] = &unk_1E70DA3A0;
  v8[41] = &unk_1E70DA3C8;
  v7[42] = &unk_1E70DC338;
  v7[43] = &unk_1E70DC350;
  v8[42] = &unk_1E70DA3F0;
  v8[43] = &unk_1E70DA418;
  v7[44] = &unk_1E70DC368;
  v7[45] = &unk_1E70DC380;
  v8[44] = &unk_1E70DA440;
  v8[45] = &unk_1E70DA468;
  v7[46] = &unk_1E70DC398;
  v7[47] = &unk_1E70DC3B0;
  v8[46] = &unk_1E70DA490;
  v8[47] = &unk_1E70DA4B8;
  v7[48] = &unk_1E70DC3C8;
  v7[49] = &unk_1E70DC3E0;
  v8[48] = &unk_1E70DA4E0;
  v8[49] = &unk_1E70DA508;
  v7[50] = &unk_1E70DC3F8;
  v7[51] = &unk_1E70DC410;
  v8[50] = &unk_1E70DA530;
  v8[51] = &unk_1E70DA558;
  v7[52] = &unk_1E70DC428;
  v7[53] = &unk_1E70DC440;
  v8[52] = &unk_1E70DA580;
  v8[53] = &unk_1E70DA5A8;
  v7[54] = &unk_1E70DC458;
  v7[55] = &unk_1E70DC470;
  v8[54] = &unk_1E70DA5D0;
  v8[55] = &unk_1E70DA5F8;
  v7[56] = &unk_1E70DC488;
  v7[57] = &unk_1E70DC4A0;
  v8[56] = &unk_1E70DA620;
  v8[57] = &unk_1E70DA648;
  v7[58] = &unk_1E70DC4B8;
  v7[59] = &unk_1E70DC4D0;
  v8[58] = &unk_1E70DA670;
  v8[59] = &unk_1E70DA698;
  v7[60] = &unk_1E70DC4E8;
  v7[61] = &unk_1E70DC500;
  v8[60] = &unk_1E70DA6C0;
  v8[61] = &unk_1E70DA6E8;
  v7[62] = &unk_1E70DC518;
  v7[63] = &unk_1E70DC530;
  v8[62] = &unk_1E70DA710;
  v8[63] = &unk_1E70DA738;
  v7[64] = &unk_1E70DC548;
  v8[64] = &unk_1E70DA760;
  v7[65] = &unk_1E70DC560;
  v8[65] = &unk_1E70DA788;
  v7[66] = &unk_1E70DC578;
  v8[66] = &unk_1E70DA7B0;
  v7[67] = &unk_1E70DC590;
  v1 = ~a1;
  v8[67] = &unk_1E70DA7D8;
  v7[68] = &unk_1E70DC5A8;
  v8[68] = &unk_1E70DA800;
  v7[69] = &unk_1E70DC5C0;
  v8[69] = &unk_1E70DA828;
  v7[70] = &unk_1E70DC5D8;
  v8[70] = &unk_1E70DA850;
  v7[71] = &unk_1E70DC5F0;
  v8[71] = &unk_1E70DA878;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 72);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __ICValueToErrorString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[72];
  _QWORD v8[73];

  v8[72] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E70DBF48;
  v7[1] = &unk_1E70DBF60;
  v8[0] = &unk_1E70DA8A0;
  v8[1] = &unk_1E70DA8C8;
  v7[2] = &unk_1E70DBF78;
  v7[3] = &unk_1E70DBF90;
  v8[2] = &unk_1E70DA8F0;
  v8[3] = &unk_1E70DA918;
  v7[4] = &unk_1E70DBFA8;
  v7[5] = &unk_1E70DBFC0;
  v8[4] = &unk_1E70DA940;
  v8[5] = &unk_1E70DA968;
  v7[6] = &unk_1E70DBFD8;
  v7[7] = &unk_1E70DBFF0;
  v8[6] = &unk_1E70DA990;
  v8[7] = &unk_1E70DA9B8;
  v7[8] = &unk_1E70DC008;
  v7[9] = &unk_1E70DC020;
  v8[8] = &unk_1E70DA9E0;
  v8[9] = &unk_1E70DAA08;
  v7[10] = &unk_1E70DC038;
  v7[11] = &unk_1E70DC050;
  v8[10] = &unk_1E70DAA30;
  v8[11] = &unk_1E70DAA58;
  v7[12] = &unk_1E70DC068;
  v7[13] = &unk_1E70DC080;
  v8[12] = &unk_1E70DAA80;
  v8[13] = &unk_1E70DAAA8;
  v7[14] = &unk_1E70DC098;
  v7[15] = &unk_1E70DC0B0;
  v8[14] = &unk_1E70DAAD0;
  v8[15] = &unk_1E70DAAF8;
  v7[16] = &unk_1E70DC0C8;
  v7[17] = &unk_1E70DC0E0;
  v8[16] = &unk_1E70DAB20;
  v8[17] = &unk_1E70DAB48;
  v7[18] = &unk_1E70DC0F8;
  v7[19] = &unk_1E70DC110;
  v8[18] = &unk_1E70DAB70;
  v8[19] = &unk_1E70DAB98;
  v7[20] = &unk_1E70DC128;
  v7[21] = &unk_1E70DC140;
  v8[20] = &unk_1E70DABC0;
  v8[21] = &unk_1E70DABE8;
  v7[22] = &unk_1E70DC158;
  v7[23] = &unk_1E70DC170;
  v8[22] = &unk_1E70DAC10;
  v8[23] = &unk_1E70DAC38;
  v7[24] = &unk_1E70DC188;
  v7[25] = &unk_1E70DC1A0;
  v8[24] = &unk_1E70DAC60;
  v8[25] = &unk_1E70DAC88;
  v7[26] = &unk_1E70DC1B8;
  v7[27] = &unk_1E70DC1D0;
  v8[26] = &unk_1E70DACB0;
  v8[27] = &unk_1E70DACD8;
  v7[28] = &unk_1E70DC1E8;
  v7[29] = &unk_1E70DC200;
  v8[28] = &unk_1E70DAD00;
  v8[29] = &unk_1E70DAD28;
  v7[30] = &unk_1E70DC218;
  v7[31] = &unk_1E70DC230;
  v8[30] = &unk_1E70DAD50;
  v8[31] = &unk_1E70DAD78;
  v7[32] = &unk_1E70DC248;
  v7[33] = &unk_1E70DC260;
  v8[32] = &unk_1E70DADA0;
  v8[33] = &unk_1E70DADC8;
  v7[34] = &unk_1E70DC278;
  v7[35] = &unk_1E70DC290;
  v8[34] = &unk_1E70DADF0;
  v8[35] = &unk_1E70DAE18;
  v7[36] = &unk_1E70DC2A8;
  v7[37] = &unk_1E70DC2C0;
  v8[36] = &unk_1E70DAE40;
  v8[37] = &unk_1E70DAE68;
  v7[38] = &unk_1E70DC2D8;
  v7[39] = &unk_1E70DC2F0;
  v8[38] = &unk_1E70DAE90;
  v8[39] = &unk_1E70DAEB8;
  v7[40] = &unk_1E70DC308;
  v7[41] = &unk_1E70DC320;
  v8[40] = &unk_1E70DAEE0;
  v8[41] = &unk_1E70DAF08;
  v7[42] = &unk_1E70DC338;
  v7[43] = &unk_1E70DC350;
  v8[42] = &unk_1E70DAF30;
  v8[43] = &unk_1E70DAF58;
  v7[44] = &unk_1E70DC368;
  v7[45] = &unk_1E70DC380;
  v8[44] = &unk_1E70DAF80;
  v8[45] = &unk_1E70DAFA8;
  v7[46] = &unk_1E70DC398;
  v7[47] = &unk_1E70DC3B0;
  v8[46] = &unk_1E70DAFD0;
  v8[47] = &unk_1E70DAFF8;
  v7[48] = &unk_1E70DC3C8;
  v7[49] = &unk_1E70DC3E0;
  v8[48] = &unk_1E70DB020;
  v8[49] = &unk_1E70DB048;
  v7[50] = &unk_1E70DC3F8;
  v7[51] = &unk_1E70DC410;
  v8[50] = &unk_1E70DB070;
  v8[51] = &unk_1E70DB098;
  v7[52] = &unk_1E70DC428;
  v7[53] = &unk_1E70DC440;
  v8[52] = &unk_1E70DB0C0;
  v8[53] = &unk_1E70DB0E8;
  v7[54] = &unk_1E70DC458;
  v7[55] = &unk_1E70DC470;
  v8[54] = &unk_1E70DB110;
  v8[55] = &unk_1E70DB138;
  v7[56] = &unk_1E70DC488;
  v7[57] = &unk_1E70DC4A0;
  v8[56] = &unk_1E70DB160;
  v8[57] = &unk_1E70DB188;
  v7[58] = &unk_1E70DC4B8;
  v7[59] = &unk_1E70DC4D0;
  v8[58] = &unk_1E70DB1B0;
  v8[59] = &unk_1E70DB1D8;
  v7[60] = &unk_1E70DC4E8;
  v7[61] = &unk_1E70DC500;
  v8[60] = &unk_1E70DB200;
  v8[61] = &unk_1E70DB228;
  v7[62] = &unk_1E70DC518;
  v7[63] = &unk_1E70DC530;
  v8[62] = &unk_1E70DB250;
  v8[63] = &unk_1E70DB278;
  v7[64] = &unk_1E70DC548;
  v8[64] = &unk_1E70DB2A0;
  v7[65] = &unk_1E70DC560;
  v8[65] = &unk_1E70DB2C8;
  v7[66] = &unk_1E70DC578;
  v8[66] = &unk_1E70DB2F0;
  v7[67] = &unk_1E70DC590;
  v8[67] = &unk_1E70DB318;
  v7[68] = &unk_1E70DC5A8;
  v8[68] = &unk_1E70DB340;
  v7[69] = &unk_1E70DC5C0;
  v8[69] = &unk_1E70DB368;
  v7[70] = &unk_1E70DC5D8;
  v8[70] = &unk_1E70DB390;
  v7[71] = &unk_1E70DC5F0;
  v8[71] = &unk_1E70DB3B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 72);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __ICErrorValueDict(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[72];
  _QWORD v7[73];

  v7[72] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E70DBF48;
  v6[1] = &unk_1E70DBF60;
  v7[0] = &unk_1E70DB3E0;
  v7[1] = &unk_1E70DB408;
  v6[2] = &unk_1E70DBF78;
  v6[3] = &unk_1E70DBF90;
  v7[2] = &unk_1E70DB430;
  v7[3] = &unk_1E70DB458;
  v6[4] = &unk_1E70DBFA8;
  v6[5] = &unk_1E70DBFC0;
  v7[4] = &unk_1E70DB480;
  v7[5] = &unk_1E70DB4A8;
  v6[6] = &unk_1E70DBFD8;
  v6[7] = &unk_1E70DBFF0;
  v7[6] = &unk_1E70DB4D0;
  v7[7] = &unk_1E70DB4F8;
  v6[8] = &unk_1E70DC008;
  v6[9] = &unk_1E70DC020;
  v7[8] = &unk_1E70DB520;
  v7[9] = &unk_1E70DB548;
  v6[10] = &unk_1E70DC038;
  v6[11] = &unk_1E70DC050;
  v7[10] = &unk_1E70DB570;
  v7[11] = &unk_1E70DB598;
  v6[12] = &unk_1E70DC068;
  v6[13] = &unk_1E70DC080;
  v7[12] = &unk_1E70DB5C0;
  v7[13] = &unk_1E70DB5E8;
  v6[14] = &unk_1E70DC098;
  v6[15] = &unk_1E70DC0B0;
  v7[14] = &unk_1E70DB610;
  v7[15] = &unk_1E70DB638;
  v6[16] = &unk_1E70DC0C8;
  v6[17] = &unk_1E70DC0E0;
  v7[16] = &unk_1E70DB660;
  v7[17] = &unk_1E70DB688;
  v6[18] = &unk_1E70DC0F8;
  v6[19] = &unk_1E70DC110;
  v7[18] = &unk_1E70DB6B0;
  v7[19] = &unk_1E70DB6D8;
  v6[20] = &unk_1E70DC128;
  v6[21] = &unk_1E70DC140;
  v7[20] = &unk_1E70DB700;
  v7[21] = &unk_1E70DB728;
  v6[22] = &unk_1E70DC158;
  v6[23] = &unk_1E70DC170;
  v7[22] = &unk_1E70DB750;
  v7[23] = &unk_1E70DB778;
  v6[24] = &unk_1E70DC188;
  v6[25] = &unk_1E70DC1A0;
  v7[24] = &unk_1E70DB7A0;
  v7[25] = &unk_1E70DB7C8;
  v6[26] = &unk_1E70DC1B8;
  v6[27] = &unk_1E70DC1D0;
  v7[26] = &unk_1E70DB7F0;
  v7[27] = &unk_1E70DB818;
  v6[28] = &unk_1E70DC1E8;
  v6[29] = &unk_1E70DC200;
  v7[28] = &unk_1E70DB840;
  v7[29] = &unk_1E70DB868;
  v6[30] = &unk_1E70DC218;
  v6[31] = &unk_1E70DC230;
  v7[30] = &unk_1E70DB890;
  v7[31] = &unk_1E70DB8B8;
  v6[32] = &unk_1E70DC248;
  v6[33] = &unk_1E70DC260;
  v7[32] = &unk_1E70DB8E0;
  v7[33] = &unk_1E70DB908;
  v6[34] = &unk_1E70DC278;
  v6[35] = &unk_1E70DC290;
  v7[34] = &unk_1E70DB930;
  v7[35] = &unk_1E70DB958;
  v6[36] = &unk_1E70DC2A8;
  v6[37] = &unk_1E70DC2C0;
  v7[36] = &unk_1E70DB980;
  v7[37] = &unk_1E70DB9A8;
  v6[38] = &unk_1E70DC2D8;
  v6[39] = &unk_1E70DC2F0;
  v7[38] = &unk_1E70DB9D0;
  v7[39] = &unk_1E70DB9F8;
  v6[40] = &unk_1E70DC308;
  v6[41] = &unk_1E70DC320;
  v7[40] = &unk_1E70DBA20;
  v7[41] = &unk_1E70DBA48;
  v6[42] = &unk_1E70DC338;
  v6[43] = &unk_1E70DC350;
  v7[42] = &unk_1E70DBA70;
  v7[43] = &unk_1E70DBA98;
  v6[44] = &unk_1E70DC368;
  v6[45] = &unk_1E70DC380;
  v7[44] = &unk_1E70DBAC0;
  v7[45] = &unk_1E70DBAE8;
  v6[46] = &unk_1E70DC398;
  v6[47] = &unk_1E70DC3B0;
  v7[46] = &unk_1E70DBB10;
  v7[47] = &unk_1E70DBB38;
  v6[48] = &unk_1E70DC3C8;
  v6[49] = &unk_1E70DC3E0;
  v7[48] = &unk_1E70DBB60;
  v7[49] = &unk_1E70DBB88;
  v6[50] = &unk_1E70DC3F8;
  v6[51] = &unk_1E70DC410;
  v7[50] = &unk_1E70DBBB0;
  v7[51] = &unk_1E70DBBD8;
  v6[52] = &unk_1E70DC428;
  v6[53] = &unk_1E70DC440;
  v7[52] = &unk_1E70DBC00;
  v7[53] = &unk_1E70DBC28;
  v6[54] = &unk_1E70DC458;
  v6[55] = &unk_1E70DC470;
  v7[54] = &unk_1E70DBC50;
  v7[55] = &unk_1E70DBC78;
  v6[56] = &unk_1E70DC488;
  v6[57] = &unk_1E70DC4A0;
  v7[56] = &unk_1E70DBCA0;
  v7[57] = &unk_1E70DBCC8;
  v6[58] = &unk_1E70DC4B8;
  v6[59] = &unk_1E70DC4D0;
  v7[58] = &unk_1E70DBCF0;
  v7[59] = &unk_1E70DBD18;
  v6[60] = &unk_1E70DC4E8;
  v6[61] = &unk_1E70DC500;
  v7[60] = &unk_1E70DBD40;
  v7[61] = &unk_1E70DBD68;
  v6[62] = &unk_1E70DC518;
  v6[63] = &unk_1E70DC530;
  v7[62] = &unk_1E70DBD90;
  v7[63] = &unk_1E70DBDB8;
  v6[64] = &unk_1E70DC548;
  v7[64] = &unk_1E70DBDE0;
  v6[65] = &unk_1E70DC560;
  v7[65] = &unk_1E70DBE08;
  v6[66] = &unk_1E70DC578;
  v7[66] = &unk_1E70DBE30;
  v6[67] = &unk_1E70DC590;
  v7[67] = &unk_1E70DBE58;
  v6[68] = &unk_1E70DC5A8;
  v7[68] = &unk_1E70DBE80;
  v6[69] = &unk_1E70DC5C0;
  v7[69] = &unk_1E70DBEA8;
  v6[70] = &unk_1E70DC5D8;
  v7[70] = &unk_1E70DBED0;
  v6[71] = &unk_1E70DC5F0;
  v7[71] = &unk_1E70DBEF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 72);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __ICAddDecodedErrorToDict(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICAErrorKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    if (v5)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICAErrorKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      a2 = objc_msgSend(v6, "intValue");

    }
    __ICValueToErrorString(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
    if (v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorDecoded"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1B990392C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B9904078(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B9904624(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B9904DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B990565C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9905AC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B9905F60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B9906434(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B99069E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B9906F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9907250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9907618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ReadUInt16(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

_WORD **WriteUInt16(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t ReadUInt32(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

_DWORD **WriteUInt32(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t ReadUInt64(_QWORD **a1)
{
  return *(*a1)++;
}

_QWORD **WriteUInt64(_QWORD **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

id CopyUnicodeStringWithLengthByteFromBuffer(const void **a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, (2 * v1 - 2), CFStringConvertEncodingToNSStringEncoding(0x14000100u), 1);
  }
  else
  {
    v4 = (void *)objc_msgSend(&stru_1E70C89C0, "copy");
  }
  return v4;
}

id CopyUnicodeStringWithLengthByteFromBufferMaxSize(const void **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 > a2)
    return 0;
  CopyUnicodeStringWithLengthByteFromBuffer(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void WriteUnicodeStringWithLengthByteToBuffer(_BYTE **a1, void *a2)
{
  int v3;
  void *v4;
  int v5;
  _BYTE *v6;
  id v7;
  _BYTE *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "length");
  if (v3)
  {
    objc_msgSend(v9, "dataUsingEncoding:", CFStringConvertEncodingToNSStringEncoding(0x14000100u));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 + 1;
    **a1 = v3 + 1;
    v6 = *a1 + 1;
    *a1 = v6;
    v7 = objc_retainAutorelease(v4);
    memcpy(v6, (const void *)objc_msgSend(v7, "bytes"), (2 * v3));
    v8 = *a1;
    do
    {
      v8 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)v8 = 0;
    *a1 += (2 * v5);

  }
  else
  {
    *(*a1)++ = 0;
  }

}

__CFString *stringForOperationCode(uint64_t a1)
{
  __CFString *result;
  __CFString *v3;

  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        result = CFSTR("PTPOperationCodeGetNumDownloadableObjects_Apple");
        break;
      case 36866:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo32_Apple");
        break;
      case 36867:
        result = CFSTR("PTPOperationCodeGetUserAssignedDeviceName_Apple");
        break;
      case 36868:
        result = CFSTR("PTPOperationCodeAllowKeepAwake_Apple");
        break;
      case 36869:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo64_Apple");
        break;
      case 36870:
        result = CFSTR("PTPOperationCodeGetObjectCompressedSize64_Apple");
        break;
      case 36871:
        result = CFSTR("PTPOperationCodeGetPartialObject64_Apple");
        break;
      case 36872:
        result = CFSTR("Canon_InitiateReleaseControl");
        break;
      case 36873:
        result = CFSTR("PTPOperationCodeGetObjectMetadata_Apple");
        break;
      case 36874:
        result = CFSTR("PTPOperationCodeGetMD5PartialObject64_Apple");
        break;
      case 36875:
        result = CFSTR("PTPOperationCodeSetMediaCapabilities");
        break;
      case 36876:
        result = CFSTR("PTPOperationCodeGetAdjustedThumb_Apple");
        break;
      case 36877:
        result = CFSTR("PTPOperationCodeGetPartialAssetData_Apple");
        break;
      case 36878:
        result = CFSTR("PTPOperationCodeSetHostSupportedFormats_Apple");
        break;
      case 36879:
        result = CFSTR("PTPOperationCodeGetObjectInfosForNextGroup_Apple");
        break;
      case 36880:
        result = CFSTR("PTPOperationCodeSetHostSupportsGroups_Apple");
        break;
      case 36881:
        result = CFSTR("Canon_SetCustomizeData");
        break;
      case 36882:
        result = CFSTR("Canon_GetCaptureStatus");
        break;
      case 36883:
        result = CFSTR("Canon_CheckEvent");
        break;
      case 36884:
        result = CFSTR("Canon_FocusLock");
        break;
      case 36885:
        result = CFSTR("Canon_FocusUnlock");
        break;
      case 36886:
        result = CFSTR("Canon_GetLocalReleaseParam");
        break;
      case 36887:
        result = CFSTR("Canon_SetLocalReleaseParam");
        break;
      case 36888:
        result = CFSTR("Canon_AskAboutPcEvf");
        break;
      case 36889:
LABEL_19:
        result = CFSTR("Canon_SendPartialObject");
        break;
      case 36890:
        result = CFSTR("Canon_InitiateCaptureInMemory");
        break;
      case 36891:
LABEL_49:
        result = CFSTR("Canon_GetPartialObjectEx");
        break;
      case 36892:
LABEL_22:
        result = CFSTR("Canon_SetObjectTime");
        break;
      case 36893:
        result = CFSTR("Canon_GetViewfinderImage");
        break;
      case 36894:
        result = CFSTR("Canon_GetObjectAttributes");
        break;
      case 36895:
        result = CFSTR("Canon_ChangeUSBProtocol");
        break;
      case 36896:
        result = CFSTR("Canon_GetChanges");
        break;
      case 36897:
LABEL_10:
        result = CFSTR("Canon_GetObjectInfoEx");
        break;
      case 36898:
        result = CFSTR("Canon_InitiateDirectTransfer");
        break;
      case 36899:
        result = CFSTR("Canon_TerminateDirectTransfer");
        break;
      case 36900:
        result = CFSTR("Canon_SendObjectInfoByPath");
        break;
      case 36901:
        result = CFSTR("Canon_SendObjectByPath");
        break;
      case 36902:
        result = CFSTR("Canon_InitiateDirectTansferEx");
        break;
      case 36903:
        result = CFSTR("Canon_GetAncillaryObjectHandles");
        break;
      case 36904:
        result = CFSTR("Canon_GetTreeInfo");
        break;
      case 36905:
        result = CFSTR("Canon_GetTreeSize");
        break;
      case 36906:
        result = CFSTR("Canon_NotifyProgress");
        break;
      case 36907:
        result = CFSTR("Canon_NotifyCancelAccepted");
        break;
      case 36908:
        result = CFSTR("Canon_902C");
        break;
      case 36909:
        result = CFSTR("Canon_GetDirectory");
        break;
      case 36910:
        result = CFSTR("Canon_902E");
        break;
      case 36911:
        result = CFSTR("Canon_902F");
        break;
      case 36912:
        result = CFSTR("Canon_SetPairingInfo");
        break;
      case 36913:
        result = CFSTR("Canon_GetPairingInfo");
        break;
      case 36914:
        result = CFSTR("Canon_DeletePairingInfo");
        break;
      case 36915:
        result = CFSTR("Canon_GetMACAddress");
        break;
      case 36916:
        result = CFSTR("Canon_SetDisplayMonitor");
        break;
      case 36917:
        result = CFSTR("Canon_PairingComplete");
        break;
      case 36918:
        result = CFSTR("Canon_GetWirelessMAXChannel");
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_214:
        if ((a1 & 0xF000) == 0x9000)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPOperationCodeVendorDefined (0x%04X)"), a1);
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPOperationCodeReserved (0x%04X)"), a1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(0x%04X)"), a1);
        }
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_220:
        result = v3;
        break;
      case 36968:
        result = CFSTR("Canon_GetWebServiceSpec");
        break;
      case 36969:
        result = CFSTR("Canon_GetWebServiceData");
        break;
      case 36970:
        result = CFSTR("Canon_SetWebServiceData");
        break;
      case 36971:
        result = CFSTR("Canon_DeleteWebServiceData");
        break;
      case 36972:
        result = CFSTR("Canon_GetRootCertificateSpec");
        break;
      case 36973:
        result = CFSTR("Canon_GetRootCertificateData");
        break;
      case 36975:
        result = CFSTR("Canon_SetRootCertificateData");
        break;
      case 36981:
        result = CFSTR("Canon_GetGpsMobilelinkObjectInfo");
        break;
      case 36982:
        result = CFSTR("Canon_SendGpsTagInfo");
        break;
      case 36983:
        result = CFSTR("Canon_GetTranscodeApproxSize");
        break;
      case 36984:
        result = CFSTR("Canon_RequestTranscodeStart");
        break;
      case 36985:
        result = CFSTR("Canon_RequestTranscodeCancel");
        break;
      case 36998:
        result = CFSTR("Canon_SetRemoteShootingMode");
        break;
      default:
        v3 = CFSTR("PTPOperationCodeUndefined");
        switch((int)a1)
        {
          case 4096:
            goto LABEL_220;
          case 4097:
            result = CFSTR("PTPOperationCodeGetDeviceInfo");
            break;
          case 4098:
            result = CFSTR("PTPOperationCodeOpenSession");
            break;
          case 4099:
            result = CFSTR("PTPOperationCodeCloseSession");
            break;
          case 4100:
            result = CFSTR("PTPOperationCodeGetStorageIDs");
            break;
          case 4101:
            result = CFSTR("PTPOperationCodeGetStorageInfo");
            break;
          case 4102:
            result = CFSTR("PTPOperationCodeGetNumObjects");
            break;
          case 4103:
            result = CFSTR("PTPOperationCodeGetObjectHandles");
            break;
          case 4104:
            result = CFSTR("PTPOperationCodeGetObjectInfo");
            break;
          case 4105:
            result = CFSTR("PTPOperationCodeGetObject");
            break;
          case 4106:
            result = CFSTR("PTPOperationCodeGetThumb");
            break;
          case 4107:
            result = CFSTR("PTPOperationCodeDeleteObject");
            break;
          case 4108:
            result = CFSTR("PTPOperationCodeSendObjectInfo");
            break;
          case 4109:
            result = CFSTR("PTPOperationCodeSendObject");
            break;
          case 4110:
            result = CFSTR("PTPOperationCodeInitiateCapture");
            break;
          case 4111:
            result = CFSTR("PTPOperationCodeFormatStore");
            break;
          case 4112:
            result = CFSTR("PTPOperationCodeResetDevice");
            break;
          case 4113:
            result = CFSTR("PTPOperationCodeSelfTest");
            break;
          case 4114:
            result = CFSTR("PTPOperationCodeSetObjectProtection");
            break;
          case 4115:
            result = CFSTR("PTPOperationCodePowerDown");
            break;
          case 4116:
            result = CFSTR("PTPOperationCodeGetDevicePropDesc");
            break;
          case 4117:
            result = CFSTR("PTPOperationCodeGetDevicePropValue");
            break;
          case 4118:
            result = CFSTR("PTPOperationCodeSetDevicePropValue");
            break;
          case 4119:
            result = CFSTR("PTPOperationCodeResetDevicePropValue");
            break;
          case 4120:
            result = CFSTR("PTPOperationCodeTerminateOpenCapture");
            break;
          case 4121:
            result = CFSTR("PTPOperationCodeMoveObject");
            break;
          case 4122:
            result = CFSTR("PTPOperationCodeCopyObject");
            break;
          case 4123:
            result = CFSTR("PTPOperationCodeGetPartialObject");
            break;
          case 4124:
            result = CFSTR("PTPOperationCodeInitiateOpenCapture");
            break;
          case 4131:
            result = CFSTR("PTPOperationCodeGetFilesystemManifest");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        result = CFSTR("Canon_GetStorageIDs");
        break;
      case 37122:
        result = CFSTR("Canon_GetStorageInfo");
        break;
      case 37123:
        result = CFSTR("Canon_GetObjectInfo");
        break;
      case 37124:
        result = CFSTR("Canon_GetObject");
        break;
      case 37125:
        result = CFSTR("Canon_DeleteObject");
        break;
      case 37126:
        result = CFSTR("Canon_FormatStore");
        break;
      case 37127:
        result = CFSTR("Canon_GetPartialObject");
        break;
      case 37128:
        result = CFSTR("Canon_GetDeviceInfoEx");
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        result = CFSTR("Canon_GetThumbEx");
        break;
      case 37131:
        goto LABEL_19;
      case 37132:
        result = CFSTR("Canon_SetObjectAttributes");
        break;
      case 37133:
        result = CFSTR("Canon_GetObjectTime");
        break;
      case 37134:
        goto LABEL_22;
      case 37135:
        result = CFSTR("Canon_RemoteRelease");
        break;
      case 37136:
        result = CFSTR("Canon_SetDevicePropValueEx");
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_214;
      case 37139:
        result = CFSTR("Canon_GetRemoteMode");
        break;
      case 37140:
        result = CFSTR("Canon_SetRemoteMode");
        break;
      case 37141:
        result = CFSTR("Canon_SetEventMode");
        break;
      case 37142:
        result = CFSTR("Canon_GetEvent");
        break;
      case 37143:
        result = CFSTR("Canon_TransferComplete");
        break;
      case 37144:
        result = CFSTR("Canon_CancelTransfer");
        break;
      case 37145:
        result = CFSTR("Canon_ResetTransfer");
        break;
      case 37146:
        result = CFSTR("Canon_PCHDDCapacity");
        break;
      case 37147:
        result = CFSTR("Canon_SetUILock");
        break;
      case 37148:
        result = CFSTR("Canon_ResetUILock");
        break;
      case 37149:
        result = CFSTR("Canon_KeepDeviceOn");
        break;
      case 37150:
        result = CFSTR("Canon_SetNullPacketMode");
        break;
      case 37151:
        result = CFSTR("Canon_UpdateFirmware");
        break;
      case 37152:
        result = CFSTR("Canon_TransferCompleteDT");
        break;
      case 37153:
        result = CFSTR("Canon_CancelTransferDT");
        break;
      case 37154:
        result = CFSTR("Canon_SetWftProfile");
        break;
      case 37155:
        result = CFSTR("Canon_GetWftProfile");
        break;
      case 37157:
        result = CFSTR("Canon_BulbStart");
        break;
      case 37158:
        result = CFSTR("Canon_BulbEnd");
        break;
      case 37159:
        result = CFSTR("Canon_RequestDevicePropValue");
        break;
      case 37160:
        result = CFSTR("Canon_RemoteReleaseOn");
        break;
      case 37161:
        result = CFSTR("Canon_RemoteReleaseOff");
        break;
      case 37162:
        result = CFSTR("Canon_RegistBackgroundImage");
        break;
      case 37163:
        result = CFSTR("Canon_ChangePhotoStudioMode");
        break;
      case 37164:
        goto LABEL_49;
      case 37168:
        result = CFSTR("Canon_ResetMirrorLockupState");
        break;
      case 37169:
        result = CFSTR("Canon_PopupBuiltinFlash");
        break;
      case 37170:
        result = CFSTR("Canon_EndGetPartialObjectEx");
        break;
      case 37171:
        result = CFSTR("Canon_MovieSelectSWOn");
        break;
      case 37172:
        result = CFSTR("Canon_MovieSelectSWOff");
        break;
      case 37173:
        result = CFSTR("Canon_GetCTGInfo");
        break;
      case 37174:
        result = CFSTR("Canon_GetLensAdjust");
        break;
      case 37175:
        result = CFSTR("Canon_SetLensAdjust");
        break;
      case 37176:
        result = CFSTR("Canon_ReadyToSendMusic");
        break;
      case 37177:
        result = CFSTR("Canon_CreateHandle");
        break;
      case 37178:
        result = CFSTR("Canon_SendPartialObjectEx");
        break;
      case 37179:
        result = CFSTR("Canon_EndSendPartialObjectEx");
        break;
      case 37180:
        result = CFSTR("Canon_SetCTGInfo");
        break;
      case 37181:
        result = CFSTR("Canon_SetRequestOLCInfoGroup");
        break;
      case 37182:
        result = CFSTR("Canon_SetRequestRollingPitchingLevel");
        break;
      case 37183:
        result = CFSTR("Canon_GetCameraSupport");
        break;
      case 37184:
        result = CFSTR("Canon_SetRating");
        break;
      case 37185:
        result = CFSTR("Canon_RequestInnerDevelopStart");
        break;
      case 37186:
        result = CFSTR("Canon_RequestInnerDevelopParamChange");
        break;
      case 37187:
        result = CFSTR("Canon_RequestInnerDevelopEnd");
        break;
      case 37188:
        result = CFSTR("Canon_GpsLoggingDataMode");
        break;
      case 37189:
        result = CFSTR("Canon_GetGpsLogCurrentHandle");
        break;
      case 37190:
        result = CFSTR("Canon_SetImageRecoveryData");
        break;
      case 37191:
        result = CFSTR("Canon_GetImageRecoveryList");
        break;
      case 37192:
        result = CFSTR("Canon_FormatImageRecoveryData");
        break;
      case 37193:
        result = CFSTR("Canon_GetPresetLensAdjustParam");
        break;
      case 37194:
        result = CFSTR("Canon_GetRawDispImage");
        break;
      case 37195:
        result = CFSTR("Canon_SaveImageRecoveryData");
        break;
      case 37196:
        result = CFSTR("Canon_RequestBLE");
        break;
      case 37197:
        result = CFSTR("Canon_DrivePowerZoom");
        break;
      case 37199:
        result = CFSTR("Canon_GetIptcData");
        break;
      case 37200:
        result = CFSTR("Canon_SetIptcData");
        break;
      case 37201:
        result = CFSTR("Canon_InitiateViewfinder");
        break;
      case 37202:
        result = CFSTR("Canon_TerminateViewfinder");
        break;
      case 37203:
        result = CFSTR("Canon_GetViewFinderData");
        break;
      case 37204:
        result = CFSTR("Canon_DoAf");
        break;
      case 37205:
        result = CFSTR("Canon_DriveLens");
        break;
      case 37206:
        result = CFSTR("Canon_DepthOfFieldPreview");
        break;
      case 37207:
        result = CFSTR("Canon_ClickWB");
        break;
      case 37208:
        result = CFSTR("Canon_Zoom");
        break;
      case 37209:
        result = CFSTR("Canon_ZoomPosition");
        break;
      case 37210:
        result = CFSTR("Canon_SetLiveAfFrame");
        break;
      case 37211:
        result = CFSTR("Canon_TouchAfPosition");
        break;
      case 37212:
        result = CFSTR("Canon_SetLvPcFlavoreditMode");
        break;
      case 37213:
        result = CFSTR("Canon_SetLvPcFlavoreditParam");
        break;
      case 37216:
        result = CFSTR("Canon_AfCancel");
        break;
      case 37227:
        result = CFSTR("Canon_SetImageRecoveryDataEx");
        break;
      case 37228:
        result = CFSTR("Canon_GetImageRecoveryListEx");
        break;
      case 37230:
        result = CFSTR("Canon_NotifyAutoTransferStatus");
        break;
      case 37231:
        result = CFSTR("Canon_GetReducedObject");
        break;
      case 37232:
        result = CFSTR("Canon_GetObjectInfo64");
        break;
      case 37233:
        result = CFSTR("Canon_GetObject64");
        break;
      case 37234:
        result = CFSTR("Canon_GetPartialObject64");
        break;
      case 37235:
        result = CFSTR("Canon_GetObjectInfoEx64");
        break;
      case 37236:
        result = CFSTR("Canon_GetPartialObjectEX64");
        break;
      case 37237:
        result = CFSTR("Canon_CreateHandle64");
        break;
      case 37239:
        result = CFSTR("Canon_NotifySaveComplete");
        break;
      case 37250:
        result = CFSTR("Canon_NotifyEstimateNumberofImport");
        break;
      case 37251:
        result = CFSTR("Canon_NotifyNumberofImported");
        break;
      case 37252:
        result = CFSTR("Canon_NotifySizeOfPartialDataTransfer");
        break;
      case 37253:
        result = CFSTR("Canon_NotifyFinish");
        break;
      case 37291:
        result = CFSTR("Canon_GetObjectURL");
        break;
      case 37305:
        result = CFSTR("Canon_SetFELock");
        break;
      case 37310:
        result = CFSTR("Canon_SetDefaultCameraSetting");
        break;
      case 37311:
        result = CFSTR("Canon_GetAEData");
        break;
      case 37352:
        result = CFSTR("Canon_NotifyNetworkError");
        break;
      case 37353:
        result = CFSTR("Canon_AdapterTransferProgress");
        break;
      case 37360:
        result = CFSTR("Canon_TransferCompleteFTP");
        break;
      case 37361:
        result = CFSTR("Canon_CancelTransferFTP");
        break;
      case 37374:
        result = CFSTR("Canon_FAPIMessageTX");
        break;
      case 37375:
        result = CFSTR("Canon_FAPIMessageRX");
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            result = CFSTR("MTPGetObjectPropsSupported");
            break;
          case 38914:
            result = CFSTR("MTPGetObjectPropDesc");
            break;
          case 38915:
            result = CFSTR("MTPGetObjectPropValue");
            break;
          case 38917:
            result = CFSTR("MTPGetObjectPropList");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  return result;
}

__CFString *stringForResponseCode(uint64_t a1)
{
  if ((a1 - 0x2000) < 0x21)
    return off_1E70C7428[(__int16)(a1 - 0x2000)];
  if ((a1 & 0xF000) == 0xA000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPResponseCodeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) == 0x2000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPResponseCodeReserved (0x%04X)"), a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForProtectionStatus(unsigned int a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("PTPProtectionStatusNoProtection");
  if (a1 == 1)
  {
    v1 = CFSTR("PTPProtectionStatusReadOnly");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPProtectionStatusReserved (0x%04X)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *stringForObjectFormatCode(int a1)
{
  __CFString *result;
  int v2;
  __CFString *v3;

  switch(a1)
  {
    case 14336:
      result = CFSTR("PTPObjectFormatCodeUnknownImageObject");
      break;
    case 14337:
      result = CFSTR("PTPObjectFormatCodeEXIF_JPEG");
      break;
    case 14338:
      result = CFSTR("PTPObjectFormatCodeTIFF_EP");
      break;
    case 14339:
      result = CFSTR("PTPObjectFormatCodeFlashPix");
      break;
    case 14340:
      result = CFSTR("PTPObjectFormatCodeBMP");
      break;
    case 14341:
      result = CFSTR("PTPObjectFormatCodeCIFF");
      break;
    case 14342:
      result = CFSTR("PTPObjectFormatCodeReserved1");
      break;
    case 14343:
      result = CFSTR("PTPObjectFormatCodeGIF");
      break;
    case 14344:
      result = CFSTR("PTPObjectFormatCodeJFIF");
      break;
    case 14345:
      result = CFSTR("PTPObjectFormatCodePCD");
      break;
    case 14346:
      result = CFSTR("PTPObjectFormatCodePICT");
      break;
    case 14347:
      result = CFSTR("PTPObjectFormatCodePNG");
      break;
    case 14348:
      result = CFSTR("PTPObjectFormatCodeReserved2");
      break;
    case 14349:
      result = CFSTR("PTPObjectFormatCodeTIFF");
      break;
    case 14350:
      result = CFSTR("PTPObjectFormatCodeTIFF_IT");
      break;
    case 14351:
      result = CFSTR("PTPObjectFormatCodeJP2");
      break;
    case 14352:
      result = CFSTR("PTPObjectFormatCodeJPX");
      break;
    default:
      v2 = a1 - 12288;
      v3 = CFSTR("PTPObjectFormatCodeUndefinedNonImageObject");
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          result = CFSTR("PTPObjectFormatCodeAssociation");
          break;
        case 2:
          result = CFSTR("PTPObjectFormatCodeScript");
          break;
        case 3:
          result = CFSTR("PTPObjectFormatCodeExecutable");
          break;
        case 4:
          result = CFSTR("PTPObjectFormatCodeText");
          break;
        case 5:
          result = CFSTR("PTPObjectFormatCodeHTML");
          break;
        case 6:
          result = CFSTR("PTPObjectFormatCodeDPOF");
          break;
        case 7:
          result = CFSTR("PTPObjectFormatCodeAIFF");
          break;
        case 8:
          result = CFSTR("PTPObjectFormatCodeWAV");
          break;
        case 9:
          result = CFSTR("PTPObjectFormatCodeMP3");
          break;
        case 10:
          result = CFSTR("PTPObjectFormatCodeAVI");
          break;
        case 11:
          result = CFSTR("PTPObjectFormatCodeMPEG");
          break;
        case 12:
          result = CFSTR("PTPObjectFormatCodeASF");
          break;
        case 13:
          result = CFSTR("PTPObjectFormatCodeMOV");
          break;
        case 14:
          result = CFSTR("PTPObjectFormatCodeXML");
          break;
        default:
          if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0xB000)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPObjectFormatCodeVendorDefined (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0x3000)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPObjectFormatCodeReservedForFuture (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_40:
          result = v3;
          break;
      }
      break;
  }
  return result;
}

__CFString *stringForAssociationType(uint64_t a1)
{
  if (a1 < 8)
    return off_1E70C7530[(__int16)a1];
  if ((a1 & 0xF000) == 0x8000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPAssociationTypeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTPAssociationTypeReserved (0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

CGImageRef ICCreateRotatedImageFromCGImage(unint64_t a1, CGImageRef image)
{
  CGImage *v2;
  size_t Width;
  size_t Height;
  CGColorSpace *ColorSpace;
  CGColorSpace *v7;
  unint64_t v8;
  _BOOL4 v9;
  size_t v10;
  size_t v11;
  CGContext *v12;
  CGContext *v13;
  _QWORD *v14;
  __int128 v15;
  CGAffineTransform v17;
  _QWORD v18[11];
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  double v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  CGRect v48;

  v2 = image;
  v47 = *MEMORY[0x1E0C80C00];
  if (!image)
    return v2;
  Width = CGImageGetWidth(image);
  Height = CGImageGetHeight(v2);
  ColorSpace = CGImageGetColorSpace(v2);
  v7 = ColorSpace;
  if (a1 - 9 < 0xFFFFFFFFFFFFFFF8)
    v8 = 1;
  else
    v8 = a1;
  v9 = CGColorSpaceGetNumberOfComponents(ColorSpace) != 1;
  if (v8 <= 4)
    v10 = Height;
  else
    v10 = Width;
  if (v8 <= 4)
    v11 = Width;
  else
    v11 = Height;
  v12 = CGBitmapContextCreate(0, v11, v10, 8uLL, v11 << (2 * v9), v7, 2 * v9);
  if (v12)
  {
    v13 = v12;
    v18[0] = 0x3FF0000000000000;
    v18[1] = 0;
    v18[2] = 0;
    v18[3] = 0x3FF0000000000000;
    v18[4] = 0;
    v18[5] = 0;
    v18[6] = 0xBFF0000000000000;
    v18[7] = 0;
    v18[8] = 0;
    v18[9] = 0x3FF0000000000000;
    *(double *)&v18[10] = (double)Width;
    v19 = xmmword_1B9938070;
    v20 = 0;
    v21 = 0;
    v22 = 0xBFF0000000000000;
    v23 = (double)Width;
    v24 = (double)Height;
    v26 = 0;
    v27 = 0;
    v25 = 0x3FF0000000000000;
    v28 = xmmword_1B9938080;
    v30 = xmmword_1B9938070;
    v31 = xmmword_1B9938080;
    v29 = (double)Height;
    v32 = (double)Height;
    v33 = (double)Width;
    v34 = xmmword_1B9938070;
    v36 = 0;
    v37 = 0;
    v35 = 0x3FF0000000000000;
    v38 = (double)Width;
    v39 = xmmword_1B9938090;
    v41 = 0u;
    v42 = 0u;
    v40 = 0x3FF0000000000000;
    v43 = 0x3FF0000000000000;
    v44 = xmmword_1B9938080;
    v45 = (double)Height;
    v46 = 0;
    v14 = &v18[6 * v8];
    v15 = *((_OWORD *)v14 - 2);
    *(_OWORD *)&v17.a = *((_OWORD *)v14 - 3);
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tx = *((_OWORD *)v14 - 1);
    CGContextConcatCTM(v12, &v17);
    v48.origin.x = 0.0;
    v48.origin.y = 0.0;
    v48.size.width = (double)Width;
    v48.size.height = (double)Height;
    CGContextDrawImage(v13, v48, v2);
    v2 = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    return v2;
  }
  return CGImageRetain(v2);
}

id ICStandardDateFromPTPString(void *a1)
{
  tm v2;

  if (a1)
  {
    memset(&v2, 0, sizeof(v2));
    v2.tm_isdst = -1;
    strptime_l((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String", 0, 0, 0, 0, *(_QWORD *)&v2.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v2, 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)mktime(&v2));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void ICPerformBlockOnMainThread(dispatch_block_t block)
{
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void sub_1B9911D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;
  uint64_t v68;

  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose((const void *)(v68 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B99139B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

id ICLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ICLocalizedString_once;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ICLocalizedString_once, &__block_literal_global_5);
  objc_msgSend((id)ICLocalizedString_bundle, "localizedStringForKey:value:table:", v2, v2, CFSTR("ImageCaptureCore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B99157E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9916C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t ICAcessQueryCompletion(void (**a1)(_QWORD, _QWORD), int a2, _QWORD *a3)
{
  uint64_t v5;
  os_log_t *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  os_log_t *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  uint64_t v16;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 >= 1)
  {
    v5 = a2;
    v6 = (os_log_t *)&_gICOSLog;
    do
    {
      if (*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v7);

      }
      __ICOSLogCreate();
      v8 = CFSTR("adding");
      if ((unint64_t)objc_msgSend(CFSTR("adding"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("adding"), "substringWithRange:", 0, 18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v6;
        v13 = objc_retainAutorelease(v8);
        v14 = v11;
        v15 = v13;
        v6 = v12;
        v16 = -[__CFString UTF8String](v15, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v21 = v16;
        v22 = 2114;
        v23 = v10;
        _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      ++a3;
      --v5;
    }
    while (v5);
  }
  ((void (**)(_QWORD, void *))a1)[2](a1, v19);

  return 0;
}

void sub_1B99175C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICAcessStatusQuery(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 >= 1)
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)(a3 + 8 * v8))
      {
        switch((int)v8)
        {
          case 0:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *(_QWORD *)(a4 + 8 * v8));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            v9 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *(_QWORD *)(a4 + 8 * v8));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

LABEL_6:
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (a2 != v8);
  }
  objc_msgSend(v14, "addObject:", v7);

  return 0;
}

void sub_1B99181B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B9918500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4_0(id a1)
{
  return objc_retainAutorelease(a1);
}

id OUTLINED_FUNCTION_5()
{
  void *v0;

  return v0;
}

void sub_1B991B24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

time_t ICTimeIntervalSince1970FromPTPString(void *a1)
{
  tm v2;

  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String", 0, 0, 0, 0, *(_QWORD *)&v2.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

void sub_1B9920380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ICMakeLocalizedError(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  __ICErrorValueDict(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("legacy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = CFSTR("legacy");
  else
    v4 = CFSTR("modern");
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICLocalizedString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), a1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id ICMakeLocalizedErrorWithCodeAndString(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICLocalizedString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), a1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ICMakeFormattedLocalizedError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  __ICErrorValueDict(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legacy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = CFSTR("legacy");
  else
    v6 = CFSTR("modern");
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  ICLocalizedString(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), a1, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1B9925F44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B992A714(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__243(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1BCCC74B4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__244(uint64_t a1)
{

}

void sub_1B992E364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B992E914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B992EBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B992F2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9930168(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B993086C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B9930DC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B9931338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9931838(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B99320EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B99326D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99548](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return MEMORY[0x1E0CBC540]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1E0D466A0]();
}

uint64_t MMCSSignatureGeneratorCreateWithBoundaryKey()
{
  return MEMORY[0x1E0D466C0]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1E0D466D0]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1E0D466D8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1E0C835D8](*(_QWORD *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C841C8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1E0C855E0](a1, a2, a3, a4);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1E0C85648](__str, __sep);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

