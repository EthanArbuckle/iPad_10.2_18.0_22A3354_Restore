@implementation XREngineeringValueFormatter

- (void)setDisplaysFullBacktrace:(BOOL)a3
{
  ((void (*)(XREngineeringValueFormatter *, char *, uint64_t))MEMORY[0x24BEDD108])(self, sel_setMultiline_, 1);
}

- (id)stringForEngineeringValue:(id)a3
{
  return sub_226359840(self, a3, 0);
}

- (BOOL)getTitleAndSubtitleForEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  char TitleAndSubtitleForThreadEngineeringValue_title_subtitle;
  BOOL v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v8 = a3;
  v13 = v8;
  if (a4)
  {
    if (a5)
    {
      v14 = objc_msgSend_engineeringType(v8, v9, v10, v11, v12);
      if (v14 <= 208)
      {
        switch(v14)
        {
          case 8:
            TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForThreadEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
            goto LABEL_22;
          case 23:
            TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForProcessEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
            goto LABEL_22;
          case 31:
            TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForCoreEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
            goto LABEL_22;
        }
      }
      else if (v14 > 232)
      {
        if (v14 == 233)
        {
          TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForSwiftActorEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
          goto LABEL_22;
        }
        if (v14 == 242)
        {
          v18 = *a4;
          *a4 = CFSTR("Commutator");

          sub_226359840(self, v13, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *a5;
          *a5 = v19;

          v21 = *a5;
LABEL_17:
          v17 = v21 != 0;
          goto LABEL_23;
        }
      }
      else
      {
        if (v14 == 209)
        {
          TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForURLSessionEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
          goto LABEL_22;
        }
        if (v14 == 225)
        {
          TitleAndSubtitleForThreadEngineeringValue_title_subtitle = objc_msgSend_getTitleAndSubtitleForSwiftTaskEngineeringValue_title_subtitle_(self, v15, (uint64_t)v13, (uint64_t)a4, (uint64_t)a5);
LABEL_22:
          v17 = TitleAndSubtitleForThreadEngineeringValue_title_subtitle;
          goto LABEL_23;
        }
      }
    }
    sub_226359840(self, v13, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *a4;
    *a4 = v22;

    v21 = *a4;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

- (id)typeStringForEngineeringValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __CFString *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  v3 = a3;
  v8 = objc_msgSend_engineeringType(v3, v4, v5, v6, v7);
  if (v8 == 209)
  {
    v9 = CFSTR("URLSession");
    v16 = 0;
    objc_msgSend_getURLSessionName_internalSessionID_backgroundIdentifier_isShared_isEphemeral_(v3, v10, 0, 0, 0, 0, &v16);
    if (v16)
    {
      objc_msgSend_stringByAppendingString_(CFSTR("Ephemeral "), v11, (uint64_t)v9, v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)v14;
    }
  }
  else
  {
    v9 = XR_ENGINEERING_TITLE_BY_ETYPE[v8];
  }

  return v9;
}

- (BOOL)useSimplifiedPlaceholder
{
  return !self->_withinNarrative && self->_useSimplifiedPlaceholder;
}

- (XREngineeringValueFormatter)init
{
  XREngineeringValueFormatter *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *intIDFormatter;
  NSDateFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSDateFormatter *timeOfDayFormatter;
  NSMeasurementFormatter *v13;
  NSMeasurementFormatter *measurementFormatter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)XREngineeringValueFormatter;
  v2 = -[XREngineeringValueFormatter init](&v16, sel_init);
  if (v2)
  {
    if (qword_25583C738 != -1)
      dispatch_once(&qword_25583C738, &unk_24EDC2AF0);
    objc_storeStrong((id *)&v2->_countFormatter, (id)qword_25583C730);
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    intIDFormatter = v2->_intIDFormatter;
    v2->_intIDFormatter = v3;

    if (qword_25583C748 != -1)
      dispatch_once(&qword_25583C748, &unk_24EDC4050);
    objc_storeStrong((id *)&v2->_fpsFormatter, (id)qword_25583C740);
    if (qword_25583C758 != -1)
      dispatch_once(&qword_25583C758, &unk_24EDC4070);
    objc_storeStrong((id *)&v2->_fixedDecimalFormatter, (id)qword_25583C750);
    if (qword_25583C768 != -1)
      dispatch_once(&qword_25583C768, &unk_24EDC4090);
    objc_storeStrong((id *)&v2->_countersFormulaResultFormatter, (id)qword_25583C760);
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend_setDateStyle_(v5, v6, 1, v7, v8);
    objc_msgSend_setTimeStyle_(v5, v9, 2, v10, v11);
    timeOfDayFormatter = v2->_timeOfDayFormatter;
    v2->_timeOfDayFormatter = v5;

    v13 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v2->_measurementFormatter;
    v2->_measurementFormatter = v13;

  }
  return v2;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  *a5 = CFSTR("Unsupported feature of the engineering type formatter");
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)XREngineeringValueFormatter;
  v5 = 1;
  if (!-[XREngineeringValueFormatter isEqual:](&v7, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (self->_multiline != v4[64] || self->_highestResolutionTimeEnabled != v4[65]))
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0x304545234;
  if (!self->_multiline)
    v2 = 0x234098509;
  v3 = 0x2348975685;
  if (!self->_highestResolutionTimeEnabled)
    v3 = 0x8875639026;
  return v3 ^ v2;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_25583FE50, v6, v7))
  {
    objc_msgSend_stringForEngineeringValue_(self, v8, (uint64_t)v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSTimeZone)timeOfDayTimeZone
{
  return (NSTimeZone *)((uint64_t (*)(NSDateFormatter *, char *))MEMORY[0x24BEDD108])(self->_timeOfDayFormatter, sel_timeZone);
}

- (void)setTimeOfDayTimeZone:(id)a3
{
  ((void (*)(NSDateFormatter *, char *, id))MEMORY[0x24BEDD108])(self->_timeOfDayFormatter, sel_setTimeZone_, a3);
}

+ (id)networkAddressStringFromSockaddr:(const void *)a3 length:(unint64_t)a4 resolveHostName:(id)a5
{
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  int v22;
  unint64_t v23;
  const char *v24;
  int v25;
  char v26[255];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v11 = v7;
  if (v7)
  {
    v12 = objc_retainAutorelease(v7);
    v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = "???";
  }
  if (a4 >= 2 && (v18 = *(unsigned __int8 *)a3, v18 <= a4))
  {
    v22 = *((unsigned __int8 *)a3 + 1);
    HIDWORD(v23) = v22 - 2;
    LODWORD(v23) = v22 - 2;
    v19 = &stru_24EDCA888;
    v24 = "route";
    switch((v23 >> 2))
    {
      case 0u:
        if (v18 < 0x10)
          goto LABEL_7;
        v8 = (char *)a3 + 4;
        v25 = *((_DWORD *)a3 + 1);
        if (v25)
          v24 = v17;
        else
          v24 = "*";
        if (!v11 && v25)
          v24 = inet_ntop(v22, v8, v26, 0xFFu);
        if (*((_WORD *)a3 + 1))
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR(":%hu"), v9, v10, __rev16(*((unsigned __int16 *)a3 + 1)));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = CFSTR(":*");
        }
        break;
      case 2u:
        v24 = "ccitt";
        break;
      case 4u:
        break;
      case 7u:
        if (v18 < 0x1C)
          goto LABEL_7;
        if (!v11)
          v17 = inet_ntop(v22, (char *)a3 + 8, v26, 0xFFu);
        if (*((_WORD *)a3 + 1))
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR(".%hu"), v9, v10, __rev16(*((unsigned __int16 *)a3 + 1)));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = CFSTR(".*");
        }
        v24 = v17;
        break;
      default:
        v19 = &stru_24EDCA888;
        v24 = "???";
        break;
    }
    if (v24)
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("%s%@"), v9, v10, v24, v19);
    else
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("%s%@"), v9, v10, "???", v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_24EDCA888;
LABEL_7:
    v20 = CFSTR("<error>");
  }

  return v20;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (BOOL)isHighestResolutionTimeEnabled
{
  return self->_highestResolutionTimeEnabled;
}

- (void)setHighestResolutionTimeEnabled:(BOOL)a3
{
  self->_highestResolutionTimeEnabled = a3;
}

- (NSDate)offsetForRelativeTimes
{
  return self->_offsetForRelativeTimes;
}

- (void)setOffsetForRelativeTimes:(id)a3
{
  objc_storeStrong((id *)&self->_offsetForRelativeTimes, a3);
}

- (BOOL)withinNarrative
{
  return self->_withinNarrative;
}

- (void)setUseSimplifiedPlaceholder:(BOOL)a3
{
  self->_useSimplifiedPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetForRelativeTimes, 0);
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_timeOfDayFormatter, 0);
  objc_storeStrong((id *)&self->_countersFormulaResultFormatter, 0);
  objc_storeStrong((id *)&self->_fixedDecimalFormatter, 0);
  objc_storeStrong((id *)&self->_fpsFormatter, 0);
  objc_storeStrong((id *)&self->_intIDFormatter, 0);
  objc_storeStrong((id *)&self->_countFormatter, 0);
}

- (BOOL)getTitleAndSubtitleForCoreEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v6 = a3;
  v11 = v6;
  if (a4)
  {
    if (objc_msgSend_uint32(v6, v7, v8, v9, v10) == 100000)
    {
      v16 = CFSTR("-");
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = objc_msgSend_uint32(v11, v12, v13, v14, v15);
      objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("CPU %u"), v20, v21, v18);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v22 = *a4;
    *a4 = v16;

  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForProcessEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  id v15;
  void *v17;

  if (a4)
  {
    v17 = 0;
    if (objc_msgSend_getValue_fieldIndex_(a3, a2, (uint64_t)&v17, 0, (uint64_t)a5))
    {
      v10 = objc_msgSend_uint32(v17, v6, v7, v8, v9);
      if ((int)v10 < 1)
      {
        if ((_DWORD)v10)
          v14 = CFSTR("Unknown");
        else
          v14 = CFSTR("kernel_task");
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("Process %d"), v12, v13, v10);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("<error>");
    }
    v15 = *a4;
    *a4 = v14;

  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForThreadEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  __CFString *v7;
  id v8;
  void *v10;

  if (a4)
  {
    v10 = 0;
    if (objc_msgSend_getValue_fieldIndex_(a3, a2, (uint64_t)&v10, 0, (uint64_t)a5))
    {
      sub_226359840(self, v10, 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("unknown");
    }
    v8 = *a4;
    *a4 = v7;

  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForURLSessionEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  id v10;
  id v11;
  __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v19;
  id v20;

  if (a4)
  {
    v19 = 0;
    v20 = 0;
    objc_msgSend_getURLSessionName_internalSessionID_backgroundIdentifier_isShared_isEphemeral_(a3, a2, (uint64_t)&v20, 0, (uint64_t)&v19, 0, 0);
    v7 = (__CFString *)v20;
    v8 = v19;
    if (a5)
    {
      if (v7)
        v9 = v7;
      else
        v9 = &stru_24EDCA888;
      objc_storeStrong(a4, v9);
      v10 = v8;
      v11 = *a5;
      *a5 = v10;
    }
    else
    {
      v12 = v7;
      v16 = v12;
      if (v8)
      {
        objc_msgSend_stringByAppendingFormat_(v12, v13, (uint64_t)CFSTR(" (%@)"), v14, v15, v8);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      v11 = *a4;
      *a4 = v16;
    }

  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForSwiftTaskEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int Value_fieldIndex;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  id v31;

  v8 = a3;
  v11 = v8;
  if (a4)
  {
    v30 = 0;
    v31 = 0;
    v29 = 0;
    Value_fieldIndex = objc_msgSend_getValue_fieldIndex_(v8, v9, (uint64_t)&v29, 2, v10);
    if (objc_msgSend_getValue_fieldIndex_(v11, v13, (uint64_t)&v31, 1, v14))
    {
      v19 = 0;
      if (objc_msgSend_getValue_fieldIndex_(v11, v15, (uint64_t)&v30, 0, v16))
      {
        if (Value_fieldIndex)
          objc_msgSend_stringForSwiftTaskNameUsingTextSymbolEngineeringValue_andTextSymbolBacktrace_(self, v17, (uint64_t)v31, (uint64_t)v29, v18);
        else
          objc_msgSend_stringForTextSymbolEngineeringValue_shouldIncludeLibrary_(self, v17, (uint64_t)v31, 0, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        sub_226359840(self, v30, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
          objc_storeStrong(a4, v20);
          v25 = v24;
          v26 = *a5;
          *a5 = v25;
        }
        else
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, (uint64_t)CFSTR("%@ (%@)"), v22, v23, v20, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *a4;
          *a4 = v27;
        }

        v19 = 1;
      }
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)stringForSwiftTaskNameUsingTextSymbolEngineeringValue:(id)a3 andTextSymbolBacktrace:(id)a4
{
  uint64_t v4;

  return (id)objc_msgSend_stringForTextSymbolEngineeringValue_shouldIncludeLibrary_(self, a2, (uint64_t)a3, 0, v4);
}

- (BOOL)getTitleAndSubtitleForSwiftActorEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;

  v8 = a3;
  v11 = v8;
  if (a4)
  {
    v24 = 0;
    v25 = 0;
    if (objc_msgSend_getValue_fieldIndex_(v8, v9, (uint64_t)&v25, 1, v10))
    {
      v14 = 0;
      if (objc_msgSend_getValue_fieldIndex_(v11, v12, (uint64_t)&v24, 0, v13))
      {
        sub_226359840(self, v25, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_226359840(self, v24, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
          objc_storeStrong(a4, v15);
          v20 = v19;
          v21 = *a5;
          *a5 = v20;
        }
        else
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("%@ (%@)"), v17, v18, v15, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *a4;
          *a4 = v22;
        }

        v14 = 1;
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)getTitleAndSubtitleForSwiftTaskPriorityEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;

  v8 = a3;
  v11 = v8;
  if (a4)
  {
    v25 = 0;
    v26 = 0;
    if (objc_msgSend_getValue_fieldIndex_(v8, v9, (uint64_t)&v25, 1, v10))
    {
      v14 = 0;
      if (objc_msgSend_getValue_fieldIndex_(v11, v12, (uint64_t)&v26, 0, v13))
      {
        sub_226359840(self, v26, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_226359840(self, v25, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v16;
        if (a5)
        {
          if (v15)
          {
            objc_storeStrong(a4, v15);
            v21 = v20;
            v22 = *a5;
            *a5 = v21;
LABEL_15:

            v14 = 1;
            goto LABEL_16;
          }
          v23 = v16;
        }
        else
        {
          if (v15)
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%@ (%@)"), v18, v19, v15, v16);
          else
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%@"), v18, v19, v16);
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v22 = *a4;
        *a4 = v23;
        goto LABEL_15;
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (id)stringForLibraryAddressEngineeringValue:(id)a3
{
  uint64_t v3;
  __CFString *v5;
  void *v7;

  v7 = 0;
  if (objc_msgSend_getValue_fieldIndex_(a3, a2, (uint64_t)&v7, 1, v3))
  {
    sub_226359840(self, v7, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("unknown");
  }

  return v5;
}

- (id)stringForTextSymbolEngineeringValue:(id)a3 shouldIncludeLibrary:(BOOL)a4
{
  uint64_t v4;
  __CFString *v6;
  void *v8;

  v8 = 0;
  if (objc_msgSend_getValue_fieldIndex_(a3, a2, (uint64_t)&v8, 1, v4))
  {
    sub_226359840(self, v8, 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("unknown");
  }

  return v6;
}

- (id)stringForBacktraceEngineeringValue:(id)a3
{
  return CFSTR("backtrace");
}

- (id)stringForCallSiteEngineeringValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 withinNarrative;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v18;
  void *v19;

  v4 = a3;
  v18 = 0;
  v19 = 0;
  if (objc_msgSend_getValue_fieldIndex_(v4, v5, (uint64_t)&v19, 0, v6)
    && objc_msgSend_getValue_fieldIndex_(v4, v7, (uint64_t)&v18, 1, v8))
  {
    withinNarrative = self->_withinNarrative;
    v10 = (void *)MEMORY[0x24BDD17C8];
    sub_226359840(self, v19, withinNarrative);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_226359840(self, v18, withinNarrative);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v13, (uint64_t)CFSTR("%@ + %@"), v14, v15, v11, v12);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("bad call site");
  }

  return v16;
}

- (id)stringForCoreProfileBacktraceEngineeringValue:(id)a3
{
  return CFSTR("kperf backtrace");
}

- (id)stringForUserIDEngineeringValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_msgSend_uint32(a3, a2, (uint64_t)a3, v3, v4);
  return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%u"), v8, v9, v6);
}

- (id)stringForInstrumentTypeEngineeringValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_string(a3, a2, (uint64_t)a3, v3, v4);
}

- (id)stringForSocketAddrEngineeringValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __CFString *v11;
  _QWORD v13[5];
  uint64_t v14;
  _BYTE v15[248];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0;
  if (objc_msgSend_getLengthOfUint64Representation_(v3, v4, (uint64_t)&v14, v5, v6))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_22635C550;
    v13[3] = &unk_24EDC3F60;
    v13[4] = v15;
    objc_msgSend_enumerateUint64Values_(v3, v7, (uint64_t)v13, v8, v9);
    objc_msgSend_networkAddressStringFromSockaddr_length_resolveHostName_(XREngineeringValueFormatter, v10, (uint64_t)v15, 8 * v14, 0);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("<error>");
  }

  return v11;
}

@end
