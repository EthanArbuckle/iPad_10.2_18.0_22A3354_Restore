@implementation NSDateComponents(Additions)

+ (id)hf_dailyWeekdayIntervalComponents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED378E40 != -1)
    dispatch_once(&qword_1ED378E40, block);
  return (id)_MergedGlobals_230;
}

+ (id)hf_dailyWeekdayIntervalComponentsWithCalendar:()Additions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];

  v3 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 1;
  v4 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v3, "weekdaySymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponentsWithCalendar___block_invoke;
  v9[3] = &unk_1EA72AC08;
  v9[4] = v10;
  objc_msgSend(v4, "na_arrayByRepeatingWithCount:generatorBlock:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v10, 8);
  return v7;
}

+ (id)hf_dailyIntervalComponents
{
  if (qword_1ED378E50 != -1)
    dispatch_once(&qword_1ED378E50, &__block_literal_global_36);
  return (id)qword_1ED378E48;
}

+ (id)hf_weeklyIntervalComponents
{
  if (qword_1ED378E60 != -1)
    dispatch_once(&qword_1ED378E60, &__block_literal_global_4_0);
  return (id)qword_1ED378E58;
}

+ (id)hf_biweeklyIntervalComponents
{
  if (qword_1ED378E70 != -1)
    dispatch_once(&qword_1ED378E70, &__block_literal_global_5_0);
  return (id)qword_1ED378E68;
}

+ (id)hf_monthlyIntervalComponents
{
  if (qword_1ED378E80 != -1)
    dispatch_once(&qword_1ED378E80, &__block_literal_global_6_0);
  return (id)qword_1ED378E78;
}

+ (id)hf_yearlyIntervalComponents
{
  if (qword_1ED378E90 != -1)
    dispatch_once(&qword_1ED378E90, &__block_literal_global_7_0);
  return (id)qword_1ED378E88;
}

+ (id)hf_componentsWithHour:()Additions minute:
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setHour:", a3);
  objc_msgSend(v6, "setMinute:", a4);
  return v6;
}

- (uint64_t)hf_isEqualToHomeKitRecurrence:()Additions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (a1 != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    if ((objc_msgSend(a1, "isEqual:", v4) & 1) == 0)
    {
      v6 = (void *)objc_msgSend(a1, "copy");
      objc_msgSend(v6, "setNanosecond:", 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(v6, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
      v7 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v7, "setNanosecond:", 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(v7, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
      v5 = objc_msgSend(v6, "isEqual:", v7);

      goto LABEL_7;
    }
  }
  v5 = 1;
LABEL_7:

  return v5;
}

- (double)hf_timeInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", a1, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v2);
  v6 = v5;

  return v6;
}

- (id)hf_absoluteValue
{
  void *v2;
  int8x8_t v3;
  id v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unsigned int v8;
  id v9;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  void *v15;
  char v16;

  v2 = (void *)objc_msgSend(a1, "copy");
  v3 = (int8x8_t)objc_msgSend(a1, "hf_validComponents");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __47__NSDateComponents_Additions__hf_absoluteValue__block_invoke;
  v13 = &unk_1EA72ACD0;
  v4 = v2;
  v14 = v4;
  v15 = a1;
  v5 = v11;
  if (v3)
  {
    v16 = 0;
    v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if ((*(_QWORD *)&v3 & (1 << v8)) != 0)
        {
          ((void (*)(_QWORD *))v12)(v5);
          if (v16)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  v9 = v4;
  return v9;
}

- (id)hf_negativeValue
{
  void *v2;
  int8x8_t v3;
  id v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unsigned int v8;
  id v9;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  void *v15;
  char v16;

  v2 = (void *)objc_msgSend(a1, "copy");
  v3 = (int8x8_t)objc_msgSend(a1, "hf_validComponents");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __47__NSDateComponents_Additions__hf_negativeValue__block_invoke;
  v13 = &unk_1EA72ACD0;
  v4 = v2;
  v14 = v4;
  v15 = a1;
  v5 = v11;
  if (v3)
  {
    v16 = 0;
    v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if ((*(_QWORD *)&v3 & (1 << v8)) != 0)
        {
          ((void (*)(_QWORD *))v12)(v5);
          if (v16)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  v9 = v4;
  return v9;
}

- (uint64_t)hf_compareNextMatchingDate:()Additions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "hf_compareNextMatchingDate:withCalendar:", v5, v6);

  return v7;
}

- (uint64_t)hf_compareNextMatchingDate:()Additions withCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(void *, void *);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "hf_zeroDateComponentsWithComponents:calendar:", objc_msgSend(v7, "hf_validComponents") | objc_msgSend(a1, "hf_validComponents"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextDateAfterDate:matchingComponents:options:", v9, v8, 1024);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__NSDateComponents_Additions__hf_compareNextMatchingDate_withCalendar___block_invoke;
  aBlock[3] = &unk_1EA72ACF8;
  v11 = v8;
  v22 = v11;
  v12 = v10;
  v23 = v12;
  v13 = v6;
  v24 = v13;
  v14 = (void (**)(void *, void *))_Block_copy(aBlock);
  v14[2](v14, a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v15;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "compare:", v20);

    if (v15)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_7;
LABEL_3:
  v18 = objc_msgSend(v17, "compare:", v16);
  if (!v15)
LABEL_4:

LABEL_5:
  return v18;
}

+ (id)hf_zeroDateComponentsWithComponents:()Additions calendar:
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint8x8_t v10;
  int v11;
  unsigned int v12;
  void *v13;
  id v14;
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  char v21;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __76__NSDateComponents_Additions__hf_zeroDateComponentsWithComponents_calendar___block_invoke;
  v18 = &unk_1EA72ACD0;
  v7 = v6;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  v9 = v16;
  if (a3)
  {
    v21 = 0;
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.i32[0];
    if (v10.i32[0])
    {
      v12 = 0;
      do
      {
        if (((1 << v12) & a3) != 0)
        {
          ((void (*)(_QWORD *))v17)(v9);
          if (v21)
            break;
          --v11;
        }
        if (v12 > 0x3E)
          break;
        ++v12;
      }
      while (v11 > 0);
    }
  }

  v13 = v20;
  v14 = v7;

  return v14;
}

+ (uint64_t)_hf_allPossibleComponents
{
  return 65278;
}

- (uint64_t)hf_validComponents
{
  int8x8_t v2;
  _QWORD *v3;
  uint8x8_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v2 = (int8x8_t)objc_msgSend((id)objc_opt_class(), "_hf_allPossibleComponents");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __49__NSDateComponents_Additions__hf_validComponents__block_invoke;
  v11 = &unk_1EA72AD20;
  v12 = a1;
  v13 = &v14;
  v3 = v9;
  if (v2)
  {
    v18 = 0;
    v4 = (uint8x8_t)vcnt_s8(v2);
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.i32[0];
    if (v4.i32[0])
    {
      v6 = 0;
      do
      {
        if ((*(_QWORD *)&v2 & (1 << v6)) != 0)
        {
          ((void (*)(_QWORD *))v10)(v3);
          if (v18)
            break;
          --v5;
        }
        if (v6 > 0x3E)
          break;
        ++v6;
      }
      while (v5 > 0);
    }
  }

  v7 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v7;
}

@end
