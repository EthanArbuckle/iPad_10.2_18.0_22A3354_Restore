@implementation ICDateFilterTypeSelection

+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 amount:(unint64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Unknown"), CFSTR("Unknown"), 0, 1);
      a4 = objc_claimAutoreleasedReturnValue();
      return (id)a4;
    case 1uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      v7 = CFSTR("In the Past %lu Hours");
      goto LABEL_8;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      v7 = CFSTR("In the Past %lu Days");
      goto LABEL_8;
    case 3uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      v7 = CFSTR("In the Past %lu Weeks");
      goto LABEL_8;
    case 4uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      v7 = CFSTR("In the Past %lu Months");
      goto LABEL_8;
    case 5uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (void *)MEMORY[0x1E0D64218];
      v7 = CFSTR("In the Past %lu Years");
LABEL_8:
      objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v7, v7, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v8, a4);
      a4 = objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (id)a4;
  }
  return (id)a4;
}

+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 number:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = (void *)objc_msgSend(a4, "longValue");
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Unknown"), CFSTR("Unknown"), 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 1uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("In the Past %lu Hours");
      goto LABEL_8;
    case 2uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("In the Past %lu Days");
      goto LABEL_8;
    case 3uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("In the Past %lu Weeks");
      goto LABEL_8;
    case 4uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("In the Past %lu Months");
      goto LABEL_8;
    case 5uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("In the Past %lu Years");
LABEL_8:
      objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v9, v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)relativeRangeStringComponentsForSelectionType:(unint64_t)a3 number:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:number:](ICDateFilterTypeSelection, "relativeRangeSummaryForSelectionType:number:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v7, "localizedStringWithFormat:", CFSTR("%lu"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSDateFormatter)shortDateFormatter
{
  if (shortDateFormatter_shortDateFormatterOnceToken != -1)
    dispatch_once(&shortDateFormatter_shortDateFormatterOnceToken, &__block_literal_global_15);
  return (NSDateFormatter *)(id)shortDateFormatter_shortDateFormatter;
}

uint64_t __47__ICDateFilterTypeSelection_shortDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)shortDateFormatter_shortDateFormatter;
  shortDateFormatter_shortDateFormatter = (uint64_t)v0;

  objc_msgSend((id)shortDateFormatter_shortDateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)shortDateFormatter_shortDateFormatter, "setTimeStyle:", 0);
}

- (ICDateFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  ICDateFilterTypeSelection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDateFilterTypeSelection;
  result = -[ICDateFilterTypeSelection init](&v5, sel_init);
  if (result)
    result->_selectionType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICDateFilterTypeSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[ICDateFilterTypeSelection initWithSelectionType:](+[ICDateFilterTypeSelection allocWithZone:](ICDateFilterTypeSelection, "allocWithZone:"), "initWithSelectionType:", -[ICDateFilterTypeSelection selectionType](self, "selectionType"));
  -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection setPrimaryDate:](v5, "setPrimaryDate:", v6);

  -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection setSecondaryDate:](v5, "setSecondaryDate:", v7);

  -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](v5, "setRelativeRangeSelectionType:", -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType"));
  -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ICDateFilterTypeSelection setRelativeRangeAmount:](v5, "setRelativeRangeAmount:", v9);

  return v5;
}

- (NSDate)primaryDate
{
  unint64_t v3;
  NSDate *v4;

  v3 = -[ICDateFilterTypeSelection selectionType](self, "selectionType");
  v4 = 0;
  if (v3 <= 0xA && ((1 << v3) & 0x740) != 0)
    v4 = self->_primaryDate;
  return v4;
}

- (void)setPrimaryDate:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDate, a3);
  -[ICDateFilterTypeSelection updateDatesForCurrentSelectionType](self, "updateDatesForCurrentSelectionType");
}

- (void)setRelativeRangeTimeInterval:(double)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  ICDateFilterTypeSelection *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[ICDateFilterTypeSelection setSelectionType:](self, "setSelectionType:", 7);
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * (unint64_t)a3, 2) <= 0x444444444444444uLL)
    v5 = (unint64_t)(a3 / 60.0);
  else
    v5 = 0;
  if (v5 % 0x3C)
    v6 = 0;
  else
    v6 = v5 / 0x3C;
  if (v6 == 24 * ((v6 * (unsigned __int128)0xAAAAAAAAAAAAAABuLL) >> 64))
    v7 = (v6 * (unsigned __int128)0xAAAAAAAAAAAAAABuLL) >> 64;
  else
    v7 = 0;
  if (v7 % 7)
    v8 = 0;
  else
    v8 = v7 / 7;
  if (v7 == 30 * (v7 / 0x1E))
    v9 = v7 / 0x1E;
  else
    v9 = 0;
  v10 = v7 - 365;
  if (v7 < 0x16D || v7 % 0x16D)
  {
    if (v9)
    {
      -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](self, "setRelativeRangeSelectionType:", 4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection setRelativeRangeAmount:](self, "setRelativeRangeAmount:", v14);

      if (v9 == 3)
      {
        v12 = self;
        v13 = 4;
        goto LABEL_28;
      }
      if (v9 == 1)
      {
        v12 = self;
        v13 = 3;
        goto LABEL_28;
      }
    }
    else if (v8)
    {
      -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](self, "setRelativeRangeSelectionType:", 3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection setRelativeRangeAmount:](self, "setRelativeRangeAmount:", v15);

      if (v8 == 1)
      {
        v12 = self;
        v13 = 2;
        goto LABEL_28;
      }
    }
    else if (v7)
    {
      -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](self, "setRelativeRangeSelectionType:", 2);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection setRelativeRangeAmount:](self, "setRelativeRangeAmount:", v16);

      if (v7 == 2)
      {
        v12 = self;
        v13 = 1;
        goto LABEL_28;
      }
      if (v7 == 1)
      {
        v12 = self;
        v13 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](self, "setRelativeRangeSelectionType:", 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection setRelativeRangeAmount:](self, "setRelativeRangeAmount:", v17);

    }
  }
  else
  {
    -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](self, "setRelativeRangeSelectionType:", 5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 / 0x16D);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDateFilterTypeSelection setRelativeRangeAmount:](self, "setRelativeRangeAmount:", v11);

    if (v10 <= 0x16C)
    {
      v12 = self;
      v13 = 5;
LABEL_28:
      -[ICDateFilterTypeSelection setSelectionType:](v12, "setSelectionType:", v13);
    }
  }
}

- (void)setSpecificDateRangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  ICDateFilterTypeSelection *v10;
  uint64_t v11;
  ICDateFilterTypeSelection *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 == 0.0)
  {
    v10 = self;
    v11 = 9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v14);
    v16 = v15;

    if (v16 == 0.0)
    {
      -[ICDateFilterTypeSelection setSelectionType:](self, "setSelectionType:", 10);
      v12 = self;
      v13 = v17;
      goto LABEL_6;
    }
    if (!objc_msgSend(v17, "ic_isSameDayAsDate:", v6))
    {
      -[ICDateFilterTypeSelection setSelectionType:](self, "setSelectionType:", 6);
      -[ICDateFilterTypeSelection setPrimaryDate:](self, "setPrimaryDate:", v17);
      -[ICDateFilterTypeSelection setSecondaryDate:](self, "setSecondaryDate:", v6);
      goto LABEL_7;
    }
    v10 = self;
    v11 = 8;
  }
  -[ICDateFilterTypeSelection setSelectionType:](v10, "setSelectionType:", v11);
  v12 = self;
  v13 = v6;
LABEL_6:
  -[ICDateFilterTypeSelection setPrimaryDate:](v12, "setPrimaryDate:", v13);
LABEL_7:

}

- (NSDate)secondaryDate
{
  -[ICDateFilterTypeSelection selectionType](self, "selectionType");
  return self->_secondaryDate;
}

- (void)setSecondaryDate:(id)a3
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_secondaryDate, a3);
  if (-[ICDateFilterTypeSelection selectionType](self, "selectionType") == 6)
  {
    -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "ic_isEarlierThanDate:", v5);

    if (v6)
      -[ICDateFilterTypeSelection setPrimaryDate:](self, "setPrimaryDate:", v7);
  }

}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
  if (a3 < 6)
  {
    -[ICDateFilterTypeSelection setPrimaryDate:](self, "setPrimaryDate:", 0);
LABEL_4:
    -[ICDateFilterTypeSelection setSecondaryDate:](self, "setSecondaryDate:", 0);
    goto LABEL_5;
  }
  if (a3 - 9 < 2)
    goto LABEL_4;
  if (a3 == 7 && !-[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType"))
    self->_relativeRangeSelectionType = 1;
LABEL_5:
  -[ICDateFilterTypeSelection updateDatesForCurrentSelectionType](self, "updateDatesForCurrentSelectionType");
}

- (NSNumber)relativeRangeAmount
{
  unint64_t v3;
  NSNumber *v4;

  v3 = -[ICDateFilterTypeSelection selectionType](self, "selectionType");
  v4 = 0;
  switch(v3)
  {
    case 0uLL:
      v4 = (NSNumber *)&unk_1E771A498;
      break;
    case 2uLL:
      v4 = (NSNumber *)&unk_1E771A4B0;
      break;
    case 3uLL:
      v4 = (NSNumber *)&unk_1E771A4C8;
      break;
    case 4uLL:
      v4 = (NSNumber *)&unk_1E771A4E0;
      break;
    case 5uLL:
      v4 = (NSNumber *)&unk_1E771A4F8;
      break;
    case 7uLL:
      v4 = self->_relativeRangeAmount;
      break;
    default:
      return v4;
  }
  return v4;
}

- (unint64_t)relativeRangeSelectionType
{
  if (-[ICDateFilterTypeSelection selectionType](self, "selectionType") == 7)
    return self->_relativeRangeSelectionType;
  else
    return 0;
}

- (NSString)primaryDateSummary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;

  switch(-[ICDateFilterTypeSelection selectionType](self, "selectionType"))
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      ICLocalizedStringFromICDateFilterSelectionType((void *)-[ICDateFilterTypeSelection selectionType](self, "selectionType"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v3;
    case 6uLL:
      objc_msgSend((id)objc_opt_class(), "shortDateFormatter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 7uLL:
      v7 = -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType");
      -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:amount:](ICDateFilterTypeSelection, "relativeRangeSummaryForSelectionType:amount:", v7, (int)objc_msgSend(v8, "intValue"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v3;
    case 8uLL:
      objc_msgSend((id)objc_opt_class(), "shortDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0D64218];
      if ((isKindOfClass & 1) != 0)
        v14 = CFSTR("Created on %@");
      else
        v14 = CFSTR("Edited on %@");
      goto LABEL_15;
    case 9uLL:
      objc_msgSend((id)objc_opt_class(), "shortDateFormatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringFromDate:", v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v17 = objc_opt_isKindOfClass();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0D64218];
      if ((v17 & 1) != 0)
        v14 = CFSTR("Created before %@");
      else
        v14 = CFSTR("Edited before %@");
      goto LABEL_15;
    case 10uLL:
      objc_msgSend((id)objc_opt_class(), "shortDateFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v20 = objc_opt_isKindOfClass();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0D64218];
      if ((v20 & 1) != 0)
        v14 = CFSTR("Created after %@");
      else
        v14 = CFSTR("Edited after %@");
LABEL_15:
      objc_msgSend(v13, "localizedFrameworkStringForKey:value:table:allowSiri:", v14, v14, 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v5, v4);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v3 = (void *)v6;

      break;
    default:
      v3 = 0;
      break;
  }
  return (NSString *)v3;
}

- (NSString)secondaryDateSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "shortDateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  ICDateFilterTypeSelection *v4;
  ICDateFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICDateFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICDateFilterTypeSelection isEqualToDateFilterSelection:](self, "isEqualToDateFilterSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v22;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICDateFilterTypeSelection selectionType](self, "selectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "hash");
  -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  LOBYTE(v6) = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hash");

  }
  -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hash");

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hash");

  }
  v20 = ICHashWithHashKeys(v22, v12, v13, v14, v15, v16, v17, v18, v6);

  return v20;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICDateFilterTypeSelection selectionType](self, "selectionType") - 1;
  if (v4 > 9)
    v5 = CFSTR("Today");
  else
    v5 = off_1E76C9378[v4];
  -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType");
  if (v9 - 1 > 4)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E76C9350[v9 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@ - %@\n%@ %@"), v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)relativeDateSummary
{
  return +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:number:](ICDateFilterTypeSelection, "relativeRangeSummaryForSelectionType:number:", self->_relativeRangeSelectionType, self->_relativeRangeAmount);
}

- (NSString)relativeRangeLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICDateFilterTypeSelection relativeDateSummary](self, "relativeDateSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection relativeRangeAmountString](self, "relativeRangeAmountString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "localeIsArabic"))
    objc_msgSend(v5, "lastObject");
  else
    objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_trimmedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)relativeRangeTimeIntervalString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICDateFilterTypeSelection relativeDateSummary](self, "relativeDateSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection relativeRangeAmountString](self, "relativeRangeAmountString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "localeIsArabic"))
    objc_msgSend(v5, "firstObject");
  else
    objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_trimmedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)relativeRangeAmountAndTimeInterval
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v2 = self;
  -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  v5 = objc_msgSend(v2, "relativeRangeSelectionType");
  if (v4 == 1)
  {
    switch(v5)
    {
      case 0:
        goto LABEL_5;
      case 1:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("HOUR_SUMMARY_SINGLE");
        v8 = CFSTR("Hour");
        goto LABEL_10;
      case 2:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("DAY_SUMMARY_SINGLE");
        v8 = CFSTR("Day");
        goto LABEL_10;
      case 3:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("WEEK_SUMMARY_SINGLE");
        v8 = CFSTR("Week");
        goto LABEL_10;
      case 4:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("MONTH_SUMMARY_SINGLE");
        v8 = CFSTR("Month");
        goto LABEL_10;
      case 5:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("YEAR_SUMMARY_SINGLE");
        v8 = CFSTR("Year");
        goto LABEL_10;
      default:
        return (NSString *)v2;
    }
  }
  else
  {
    switch(v5)
    {
      case 0:
LABEL_5:
        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("Unknown");
        v8 = CFSTR("Unknown");
LABEL_10:
        objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v7, v8, 0, 1);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        return (NSString *)v2;
      case 1:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (void *)MEMORY[0x1E0D64218];
        v11 = CFSTR("%d_HOURS");
        goto LABEL_16;
      case 2:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (void *)MEMORY[0x1E0D64218];
        v11 = CFSTR("%d_DAYS");
        goto LABEL_16;
      case 3:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (void *)MEMORY[0x1E0D64218];
        v11 = CFSTR("%d_WEEKS");
        goto LABEL_16;
      case 4:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (void *)MEMORY[0x1E0D64218];
        v11 = CFSTR("%d_MONTHS");
        goto LABEL_16;
      case 5:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (void *)MEMORY[0x1E0D64218];
        v11 = CFSTR("%d_YEARS");
LABEL_16:
        objc_msgSend(v10, "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "relativeRangeAmount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v12, objc_msgSend(v13, "intValue"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        return (NSString *)v2;
    }
  }
  return (NSString *)v2;
}

- (id)relativeRangeAmountString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), -[NSNumber unsignedIntegerValue](self->_relativeRangeAmount, "unsignedIntegerValue"));
}

- (NSDictionary)relativeRangeTimeIntervalOptions
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 1; i != 6; ++i)
  {
    -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDateFilterTypeSelection relativeRangeStringComponentsForSelectionType:number:](ICDateFilterTypeSelection, "relativeRangeStringComponentsForSelectionType:number:", i, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "localeIsArabic"))
      objc_msgSend(v6, "firstObject");
    else
      objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_trimmedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  }
  return (NSDictionary *)v3;
}

- (int64_t)filterType
{
  return -1;
}

- (id)rawFilterValue
{
  unint64_t v2;

  v2 = -[ICDateFilterTypeSelection selectionType](self, "selectionType");
  if (v2 - 1 > 9)
    return CFSTR("Today");
  else
    return off_1E76C9378[v2 - 1];
}

- (BOOL)isValid
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  switch(-[ICDateFilterTypeSelection selectionType](self, "selectionType"))
  {
    case 6uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_12;
      -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "ic_isEarlierThanDate:", v7) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v9, "isEqualToDate:", v10);

        }
      }
      else
      {
        v4 = 0;
      }
      goto LABEL_16;
    case 7uLL:
      -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_12;
      -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "integerValue") > 0;
LABEL_16:

      goto LABEL_17;
    case 8uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v8 != 0;

      }
      else
      {
LABEL_12:
        v4 = 0;
      }
      goto LABEL_17;
    case 9uLL:
    case 10uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3 != 0;
LABEL_17:

      break;
    default:
      v4 = 1;
      break;
  }
  return v4;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("selectionType"), CFSTR("primaryDate"), CFSTR("secondaryDate"), CFSTR("relativeRangeAmount"), 0);
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;

  switch(-[ICDateFilterTypeSelection selectionType](self, "selectionType"))
  {
    case 6uLL:
    case 8uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4 == 0;

      }
      else
      {
        v5 = 1;
      }
      goto LABEL_9;
    case 7uLL:
      -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 9uLL:
    case 10uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v3 = (void *)v6;
      v5 = v6 == 0;
LABEL_9:

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_selectionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_primaryDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_secondaryDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_relativeRangeAmount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToDateFilterSelection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  char v22;
  int v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;

  v4 = a3;
  v5 = -[ICDateFilterTypeSelection selectionType](self, "selectionType");
  if (v5 == objc_msgSend(v4, "selectionType"))
  {
    -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        goto LABEL_40;
      v15 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v15)
      {
        v22 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v10)
      v16 = 0;
    else
      v16 = (void *)v10;
    v17 = v16;
    if (v8 == v13)
      v18 = 0;
    else
      v18 = v13;
    v19 = v18;
    if (!(v17 | v19))
      goto LABEL_29;
    v20 = (void *)v19;
    if (v17)
      v21 = v19 == 0;
    else
      v21 = 1;
    if (v21)
    {
      v22 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v23 = objc_msgSend((id)v17, "isEqual:", v19);

    if (v23)
    {
LABEL_29:
      v24 = -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType");
      if (v24 == objc_msgSend(v4, "relativeRangeSelectionType"))
      {
        -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "relativeRangeAmount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == (void *)v17)
          v25 = 0;
        else
          v25 = (void *)v17;
        v26 = v25;
        if (v8 == v20)
          v27 = 0;
        else
          v27 = v20;
        v28 = v27;
        v29 = (void *)v28;
        if (v26 | v28)
        {
          v22 = 0;
          if (v26 && v28)
            v22 = objc_msgSend((id)v26, "isEqual:", v28);
        }
        else
        {
          v22 = 1;
        }

        goto LABEL_44;
      }
    }
LABEL_40:
    v22 = 0;
LABEL_45:

    goto LABEL_46;
  }
  v22 = 0;
LABEL_47:

  return v22;
}

- (void)updateDatesForCurrentSelectionType
{
  void *v3;
  void *v4;
  int v5;
  NSDate *v6;
  NSDate *secondaryDate;
  objc_class *v8;
  void *v9;
  NSDate *v10;
  NSDate *primaryDate;
  uint64_t v12;
  void *v13;
  NSDate *v14;

  switch(-[ICDateFilterTypeSelection selectionType](self, "selectionType"))
  {
    case 6uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "ic_isLaterThanDate:", v4);

      if (v5)
      {
        -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
        v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
        secondaryDate = self->_secondaryDate;
        self->_secondaryDate = v6;
        goto LABEL_10;
      }
      return;
    case 8uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_startOfDay");
      v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
      primaryDate = self->_primaryDate;
      self->_primaryDate = v10;

      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      -[NSDate ic_endOfDay](v14, "ic_endOfDay");
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v12 = 32;
      goto LABEL_9;
    case 9uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      -[NSDate ic_startOfDay](v14, "ic_startOfDay");
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 10uLL:
      -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      -[NSDate ic_endOfDay](v14, "ic_endOfDay");
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v12 = 24;
LABEL_9:
      v13 = *(Class *)((char *)&self->super.super.isa + v12);
      *(Class *)((char *)&self->super.super.isa + v12) = v8;

      secondaryDate = v14;
LABEL_10:

      break;
    default:
      return;
  }
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setRelativeRangeAmount:(id)a3
{
  objc_storeStrong((id *)&self->_relativeRangeAmount, a3);
}

- (void)setRelativeRangeSelectionType:(unint64_t)a3
{
  self->_relativeRangeSelectionType = a3;
}

- (double)relativeRangeTimeInterval
{
  return self->_relativeRangeTimeInterval;
}

- (NSString)relativeRangeDateSummary
{
  return self->_relativeRangeDateSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeRangeDateSummary, 0);
  objc_storeStrong((id *)&self->_relativeRangeAmount, 0);
  objc_storeStrong((id *)&self->_secondaryDate, 0);
  objc_storeStrong((id *)&self->_primaryDate, 0);
}

@end
