@implementation CLKTimeIntervalTextProvider

- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return -[CLKTimeIntervalTextProvider initWithStartDate:endDate:timeZone:](self, "initWithStartDate:endDate:timeZone:", startDate, endDate, 0);
}

- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone
{
  NSDate *v8;
  NSDate *v9;
  NSTimeZone *v10;
  CLKTimeIntervalTextProvider *v11;
  CLKTimeIntervalTextProvider *v12;
  objc_super v14;

  v8 = startDate;
  v9 = endDate;
  v10 = timeZone;
  v14.receiver = self;
  v14.super_class = (Class)CLKTimeIntervalTextProvider;
  v11 = -[CLKTextProvider initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKTimeIntervalTextProvider setStartDate:](v11, "setStartDate:", v8);
    -[CLKTimeIntervalTextProvider setEndDate:](v12, "setEndDate:", v9);
    -[CLKTimeIntervalTextProvider setTimeZone:](v12, "setTimeZone:", v10);
  }

  return v12;
}

+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (CLKTimeIntervalTextProvider *)objc_msgSend(a1, "textProviderWithStartDate:endDate:timeZone:", startDate, endDate, 0);
}

+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v8;
  NSDate *v9;
  NSDate *v10;
  void *v11;

  v8 = timeZone;
  v9 = endDate;
  v10 = startDate;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:timeZone:", v10, v9, v8);

  return (CLKTimeIntervalTextProvider *)v11;
}

+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4
{
  return (id)objc_msgSend(a1, "finalizedTextProviderWithStartDate:endDate:timeZone:", a3, a4, 0);
}

+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  void *v5;

  objc_msgSend(a1, "textProviderWithStartDate:endDate:timeZone:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalize");
  return v5;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormatter;
  NSArray *fallbackSequence;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a4;
  if (!self->_startDate || !self->_endDate)
    goto LABEL_13;
  if (!self->_dateFormatter)
  {
    v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    if (self->_timeZone)
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
  }
  fallbackSequence = self->_fallbackSequence;
  if (!fallbackSequence)
  {
    -[CLKTimeIntervalTextProvider _fallbackSequence](self, "_fallbackSequence");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_fallbackSequence;
    self->_fallbackSequence = v10;

    fallbackSequence = self->_fallbackSequence;
  }
  if (-[NSArray count](fallbackSequence, "count") > a3)
  {
    -[NSArray objectAtIndex:](self->_fallbackSequence, "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    -[CLKTimeIntervalTextProvider _attributedTextForSequenceItem:style:](self, "_attributedTextForSequenceItem:style:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "shouldEmbedTintColors"))
    {
      -[CLKTextProvider tintColor](self, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[CLKTextProvider tintColor](self, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_attributedStringWithForegroundColor:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v17;
      }
    }
    objc_msgSend(v14, "_attributedStringWithOtherAttributesFromStyle:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_13:
    v18 = 0;
  }

  return v18;
}

- (BOOL)_validate
{
  _BOOL4 v3;
  NSDate *startDate;
  NSDate *v5;
  NSDate *endDate;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKTimeIntervalTextProvider;
  v3 = -[CLKTextProvider _validate](&v9, sel__validate);
  if (v3)
  {
    startDate = self->_startDate;
    if (startDate)
    {
      if (self->_endDate)
      {
        -[NSDate earlierDate:](startDate, "earlierDate:");
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
        endDate = self->_endDate;

        if (v5 != endDate)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        CLKLoggingObjectForDomain(10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[CLKTimeIntervalTextProvider _validate].cold.3((uint64_t)self, v7);
      }
      else
      {
        CLKLoggingObjectForDomain(10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[CLKTimeIntervalTextProvider _validate].cold.2();
      }
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalTextProvider _validate].cold.1();
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CLKTimeIntervalTextProvider _rangeOfAnnontatedTime:matchingPattern:](self, "_rangeOfAnnontatedTime:matchingPattern:", a3, &__block_literal_global_20);
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __65__CLKTimeIntervalTextProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("a"));
}

- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CLKTimeIntervalTextProvider _rangeOfAnnontatedTime:matchingPattern:](self, "_rangeOfAnnontatedTime:matchingPattern:", a3, &__block_literal_global_12_0);
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __60__CLKTimeIntervalTextProvider__rangeOfHoursInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("H")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("h")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("K")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("k"));
  }

  return v3;
}

- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  _NSRange result;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = &unk_2115706D6;
  v20 = xmmword_211565CF0;
  v7 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__CLKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_24CBFB0D8;
  v8 = v6;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  v9 = v17[4];
  v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __70__CLKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA78]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v9 + 32) = a3;
    *(_QWORD *)(v9 + 40) = a4;
    *a5 = 1;
  }

}

- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_24CBFCB28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fallbackSequence
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_timeZone)
    objc_msgSend(v3, "setTimeZone:");
  objc_msgSend(v4, "components:fromDate:toDate:options:", 16, self->_startDate, self->_endDate, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "day");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &unk_24CC177D0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "component:fromDate:", 64, self->_startDate);
    if (v8 | objc_msgSend(v4, "component:fromDate:", 64, self->_endDate))
    {
      objc_msgSend(v7, "addObject:", &unk_24CC17800);
      if (v8)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v7, "addObject:", &unk_24CC177E8);
      objc_msgSend(v7, "addObject:", &unk_24CC17800);
    }
    objc_msgSend(v7, "addObject:", &unk_24CC17818);
    goto LABEL_9;
  }
  v7 = &unk_24CC181D8;
LABEL_9:

  return v7;
}

- (id)_attributedTextForSequenceItem:(int64_t)a3 style:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  switch(a3)
  {
    case 0:
      -[CLKTimeIntervalTextProvider _timeIntervalFullAttributedTextWithStyle:](self, "_timeIntervalFullAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      -[CLKTimeIntervalTextProvider _timeIntervalDropMinutesAttributedTextWithStyle:](self, "_timeIntervalDropMinutesAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[CLKTimeIntervalTextProvider _startTimeFullAttributedTextWithStyle:](self, "_startTimeFullAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[CLKTimeIntervalTextProvider _startTimeDropMinutesAttributedTextWithStyle:](self, "_startTimeDropMinutesAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[CLKTimeIntervalTextProvider _dateIntervalWideAttributedTextWithStyle:](self, "_dateIntervalWideAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[CLKTimeIntervalTextProvider _dateIntervalNarrowAttributedTextWithStyle:](self, "_dateIntervalNarrowAttributedTextWithStyle:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_timeIntervalFullAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:](self, "_timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:", a3, 0, 0);
}

- (id)_timeIntervalDropMinutesAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:](self, "_timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:", a3, 1, 0);
}

- (id)_startTimeFullAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:](self, "_timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:", a3, 0, 1);
}

- (id)_startTimeDropMinutesAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:](self, "_timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:", a3, 1, 1);
}

- (id)_dateIntervalWideAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _dateIntervalAttributedTextWithStyle:narrow:](self, "_dateIntervalAttributedTextWithStyle:narrow:", a3, 0);
}

- (id)_dateIntervalNarrowAttributedTextWithStyle:(id)a3
{
  return -[CLKTimeIntervalTextProvider _dateIntervalAttributedTextWithStyle:narrow:](self, "_dateIntervalAttributedTextWithStyle:narrow:", a3, 1);
}

- (id)_timeIntervalAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 onlyStartDate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString **v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSDate **p_endDate;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  double v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  _QWORD *v75;
  _QWORD *v76;
  double v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  void *v91;
  uint64_t v92;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  uint64_t v115;
  id v116;
  _QWORD v117[2];
  _QWORD v118[2];
  uint64_t v119;
  void *v120;
  uint64_t v121;
  _QWORD v122[3];

  v5 = a5;
  v6 = a4;
  v122[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CLKFontWithAlternativePunctuation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKTextProvider fontFeatures](self, "fontFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CLKTextProvider fontFeatures](self, "fontFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CLKFontByApplyingFeatureSettings:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x24BDD1500];
  if (v6)
    v15 = &_CLKNoMinutesTimeFormatTemplate;
  else
    v15 = _CLKStandardTimeFormatTemplate;
  v16 = *v15;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFormatFromTemplate:options:locale:", v16, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = 0;
  -[CLKTextProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorExists:", v18, &v108);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v19);
  -[NSDateFormatter _attributedStringWithFieldsFromDate:](self->_dateFormatter, "_attributedStringWithFieldsFromDate:", self->_startDate);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v23 = -[CLKTimeIntervalTextProvider _rangeOfDesignatorInAnnotatedTime:](self, "_rangeOfDesignatorInAnnotatedTime:", v20);
    v103 = v22;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = 0;
      if (!v5)
      {
LABEL_9:
        v106 = v10;
        v25 = v24;
        v26 = v19;
        v27 = v8;
        p_endDate = &self->_endDate;
        -[NSDateFormatter _attributedStringWithFieldsFromDate:](self->_dateFormatter, "_attributedStringWithFieldsFromDate:", self->_endDate);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "string");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          CLKLoggingObjectForDomain(4);
          v42 = objc_claimAutoreleasedReturnValue();
          v8 = v27;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:].cold.2((uint64_t)p_endDate, v42, v43, v44, v45, v46, v47, v48);
          v40 = 0;
          v19 = v26;
          v24 = (uint64_t)v25;
          v49 = v29;
          v50 = v42;
          v10 = v106;
          goto LABEL_55;
        }
        v102 = v23;
        v31 = -[CLKTimeIntervalTextProvider _rangeOfDesignatorInAnnotatedTime:](self, "_rangeOfDesignatorInAnnotatedTime:", v29);
        v100 = v32;
        v101 = 0x7FFFFFFFFFFFFFFFLL;
        v105 = v29;
        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v33 = 0;
        }
        else
        {
          v51 = v31;
          objc_msgSend(v29, "attributedSubstringFromRange:", v31, v32);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "string");
          v33 = objc_claimAutoreleasedReturnValue();

          v101 = v51;
        }
        v8 = v27;
        v19 = v26;
        v24 = (uint64_t)v25;
        v10 = v106;
LABEL_22:
        CLKLocalizedString(CFSTR("INTERVAL_HYPHEN_NARROW"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v33;
        if (!(v24 | v33))
        {
          if (v5)
          {
            objc_msgSend(v20, "string");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v105;
          }
          else
          {
            v65 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v20, "string");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v105;
            objc_msgSend(v105, "string");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringWithFormat:", CFSTR("%@%@%@"), v66, v107, v67);
            v68 = objc_claimAutoreleasedReturnValue();

            v53 = (void *)v68;
          }
          v69 = objc_alloc(MEMORY[0x24BDD1458]);
          v121 = *MEMORY[0x24BEBD270];
          v122[0] = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (id)objc_msgSend(v69, "initWithString:attributes:", v53, v70);
          v50 = v104;
          goto LABEL_54;
        }
        v96 = v19;
        v54 = *MEMORY[0x24BEBD270];
        v119 = *MEMORY[0x24BEBD270];
        v120 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v99 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "smallCapsBaseFont");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKTextProvider fontFeatures](self, "fontFeatures");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          -[CLKTextProvider fontFeatures](self, "fontFeatures");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "CLKFontByApplyingFeatureSettings:", v57);
          v58 = v8;
          v59 = objc_claimAutoreleasedReturnValue();

          v55 = (void *)v59;
          v8 = v58;
        }
        v97 = v8;
        v98 = v55;
        if (CLKUsesFauxSmallCaps())
        {
          objc_msgSend(v8, "smallCapsBaseFont");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "font");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v60, "isEqual:", v61);

          if (v62)
          {
            objc_msgSend(v10, "pointSize");
            objc_msgSend(v10, "fontWithSize:", v63 + -2.5);
            v64 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v64 = v55;
          }
          v71 = v64;
          v118[0] = v64;
          v72 = *MEMORY[0x24BDC4C20];
          v117[0] = v54;
          v117[1] = v72;
          v115 = *MEMORY[0x24BDC4C18];
          v116 = v64;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v118[1] = v73;
          v74 = (void *)MEMORY[0x24BDBCE70];
          v75 = v118;
          v76 = v117;
        }
        else
        {
          if ((CTFontGetSymbolicTraits((CTFontRef)v10) & 1) == 0)
          {
            v109 = v54;
            objc_msgSend(v55, "CLKFontWithLocalizedSmallCaps");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = v71;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
          objc_msgSend(v10, "pointSize");
          objc_msgSend(v10, "fontWithSize:", v77 * 0.75);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = v71;
          v78 = *MEMORY[0x24BDC4C20];
          v113[0] = v54;
          v113[1] = v78;
          v111 = *MEMORY[0x24BDC4C18];
          v112 = v71;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v114[1] = v73;
          v74 = (void *)MEMORY[0x24BDBCE70];
          v75 = v114;
          v76 = v113;
        }
        objc_msgSend(v74, "dictionaryWithObjects:forKeys:count:", v75, v76, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
        v79 = objc_alloc(MEMORY[0x24BDD1688]);
        objc_msgSend(v20, "string");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (void *)objc_msgSend(v79, "initWithString:attributes:", v80, v99);

        objc_msgSend(v81, "addAttributes:range:", v70, v102, v103);
        if (v5)
        {
          v40 = v81;
          v81 = v40;
          v19 = v96;
          v53 = (void *)v99;
          v50 = v104;
          v49 = v105;
LABEL_53:

          v8 = v97;
LABEL_54:

LABEL_55:
          goto LABEL_56;
        }
        v82 = objc_alloc(MEMORY[0x24BDD1688]);
        objc_msgSend(v105, "string");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v82, "initWithString:attributes:", v83, v99);

        v95 = v84;
        objc_msgSend(v84, "addAttributes:range:", v70, v101, v100);
        v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v107, v99);
        v50 = v104;
        if (v104 && objc_msgSend((id)v24, "isEqualToString:", v104))
        {
          if (!CLKDropLeftRedundantDesignator())
          {
            v94 = v85;
            v19 = v96;
            if (v101 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v53 = (void *)v99;
LABEL_51:
              v90 = 0x24BDD1000uLL;
              v85 = v94;
              goto LABEL_52;
            }
            objc_msgSend(v105, "string");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLKTimeIntervalTextProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v101, v100, v91);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = (void *)v99;
            v92 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v87, v99);
            v89 = v95;
            v95 = (void *)v92;
LABEL_50:

            v50 = v104;
            goto LABEL_51;
          }
          v19 = v96;
          if (v102 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v94 = v85;
            objc_msgSend(v20, "string");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLKTimeIntervalTextProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v102, v103, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = (void *)v99;
            v88 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v87, v99);
            v89 = v81;
            v81 = (void *)v88;
            goto LABEL_50;
          }
        }
        else
        {
          v19 = v96;
        }
        v53 = (void *)v99;
        v90 = 0x24BDD1000;
LABEL_52:
        v40 = (id)objc_msgSend(objc_alloc(*(Class *)(v90 + 1672)), "initWithAttributedString:", v81);
        objc_msgSend(v40, "appendAttributedString:", v85);
        objc_msgSend(v40, "appendAttributedString:", v95);

        v49 = v105;
        goto LABEL_53;
      }
    }
    else
    {
      objc_msgSend(v20, "attributedSubstringFromRange:", v23, v22);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "string");
      v24 = objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_9;
    }
    v102 = v23;
    v33 = 0;
    v105 = 0;
    v100 = 0;
    v101 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  CLKLoggingObjectForDomain(4);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:].cold.1((uint64_t)&self->_startDate, v24, v34, v35, v36, v37, v38, v39);
  v40 = 0;
LABEL_56:

  return v40;
}

- (id)_dateIntervalAttributedTextWithStyle:(id)a3 narrow:(BOOL)a4
{
  const __CFString *v5;
  NSDateFormatter *dateFormatter;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
    v5 = CFSTR("M/d");
  else
    v5 = CFSTR("MMM d");
  dateFormatter = self->_dateFormatter;
  v7 = a3;
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](dateFormatter, "setLocalizedDateFormatFromTemplate:", v5);
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_startDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_endDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKTextProvider fontFeatures](self, "fontFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CLKTextProvider fontFeatures](self, "fontFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CLKFontByApplyingFeatureSettings:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  CLKLocalizedString(CFSTR("INTERVAL_HYPHEN_WIDE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@%@"), v8, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BDD1458]);
  v21 = *MEMORY[0x24BEBD270];
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v16, v18);

  return v19;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKTimeIntervalTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKTimeIntervalTextProvider *v4;
  id *p_isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  p_isa = (id *)&v4->super.super.isa;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong(p_isa + 19, self->_endDate);
    objc_storeStrong(p_isa + 20, self->_timeZone);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  if (-[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_startDate, v4[18])
    && CLKEqualObjects(self->_endDate, v4[19]))
  {
    v5 = CLKEqualObjects(self->_timeZone, v4[20]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  v3 = -[CLKTextProvider hash](&v7, sel_hash);
  v4 = &v3[-[NSDate hash](self->_startDate, "hash")];
  v5 = &v4[4 * -[NSDate hash](self->_endDate, "hash")];
  return (unint64_t)&v5[16 * -[NSTimeZone hash](self->_timeZone, "hash")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKTimeIntervalTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("_endDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timeZone, CFSTR("_timeZone"));

}

- (CLKTimeIntervalTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKTimeIntervalTextProvider *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  NSTimeZone *timeZone;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;

  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKTimeIntervalTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v16, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
    v8 = (void *)v5[18];
    v5[18] = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v9);
    v11 = (void *)v5[19];
    v5[19] = v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeZone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithJSONObjectRepresentation:", v12);
      v14 = (void *)v5[20];
      v5[20] = v13;

    }
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKTimeIntervalTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v8, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate JSONObjectRepresentation](self->_startDate, "JSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("startDate"));

  -[NSDate JSONObjectRepresentation](self->_endDate, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endDate"));

  -[NSTimeZone JSONObjectRepresentation](self->_timeZone, "JSONObjectRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeZone"));

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(NSDate *)startDate
{
  objc_storeStrong((id *)&self->_startDate, startDate);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(NSDate *)endDate
{
  objc_storeStrong((id *)&self->_endDate, endDate);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  objc_storeStrong((id *)&self->_timeZone, timeZone);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_fallbackSequence, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_validate
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Value of 'startDate' must be earlier than 'endDate' on %@", (uint8_t *)&v4, 0xCu);

}

- (void)_timeIntervalAttributedTextWithStyle:(uint64_t)a3 dropMinutes:(uint64_t)a4 onlyStartDate:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "CLKTimeIntervalTextProvider unexpected nil annotated start string (startDate = %@)", a5, a6, a7, a8, 2u);
}

- (void)_timeIntervalAttributedTextWithStyle:(uint64_t)a3 dropMinutes:(uint64_t)a4 onlyStartDate:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "CLKTimeIntervalTextProvider unexpected nil annotated end string (endDate = %@)", a5, a6, a7, a8, 2u);
}

@end
