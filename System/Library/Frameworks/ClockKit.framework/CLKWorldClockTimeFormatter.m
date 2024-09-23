@implementation CLKWorldClockTimeFormatter

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_invalidateTimeZone_, *MEMORY[0x24BEBDFF0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel_invalidateTimeZone_, *MEMORY[0x24BDBCBC0], 0);

  }
}

+ (void)invalidateTimeZone:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone", a3);
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dayFormatter, "setTimeZone:", v3);

}

+ (id)dayForOffset:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!_dayFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = (void *)_dayFormatter;
    _dayFormatter = (uint64_t)v4;

    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_dayFormatter, "setLocale:", v6);

    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_dayFormatter, "setTimeZone:", v7);

    objc_msgSend((id)_dayFormatter, "setDateStyle:", 1);
    objc_msgSend((id)_dayFormatter, "setTimeStyle:", 0);
    objc_msgSend((id)_dayFormatter, "setDoesRelativeDateFormatting:", 1);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dayFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4
{
  return (id)objc_msgSend(a1, "differenceForOffset:caps:suppressZero:", a4, 1, a3);
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5
{
  return (id)objc_msgSend(a1, "differenceForOffset:caps:suppressZero:size:", a4, a5, 0, a3);
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5 size:(int64_t)a6
{
  _BOOL4 v8;
  double v10;
  double v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v37;
  _QWORD v38[2];

  v8 = a4;
  v38[1] = *MEMORY[0x24BDAC8D0];
  if (differenceForOffset_caps_suppressZero_size__onceToken != -1)
    dispatch_once(&differenceForOffset_caps_suppressZero_size__onceToken, &__block_literal_global_25);
  v10 = fmod(a3, 3600.0);
  if (v10 < 0.0)
    v10 = -v10;
  if (a3 >= 0.0)
    v11 = a3;
  else
    v11 = -a3;
  if (a3 != 0.0)
  {
    if (v11 >= 3600.0)
    {
      if (v11 != 3600.0 && v10 != 0.0)
      {
        objc_msgSend((id)differenceForOffset_caps_suppressZero_size__formatter, "setAllowedUnits:", 96);
        objc_msgSend((id)differenceForOffset_caps_suppressZero_size__formatter, "setUnitsStyle:", 0);
        goto LABEL_35;
      }
      if (!v8)
      {
LABEL_25:
        v15 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
        v16 = 32;
        goto LABEL_26;
      }
      if ((unint64_t)a6 > 2)
        v17 = 0;
      else
        v17 = off_24CBFB330[a6];
      CLKWorldClockLocalizedString(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = v11 / 3600.0;
    }
    else
    {
      if (!v8)
      {
        v15 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
        v16 = 64;
LABEL_26:
        objc_msgSend(v15, "setAllowedUnits:", v16, v10);
        objc_msgSend((id)differenceForOffset_caps_suppressZero_size__formatter, "setUnitsStyle:", 3);
        goto LABEL_35;
      }
      if ((unint64_t)a6 > 2)
        v13 = 0;
      else
        v13 = off_24CBFB318[a6];
      CLKWorldClockLocalizedString(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = v11 / 60.0;
    }
    objc_msgSend(v19, "localizedStringWithFormat:", v18, *(_QWORD *)&v20);
    goto LABEL_34;
  }
  if (!a5)
  {
    if (v8)
    {
      if ((unint64_t)a6 > 2)
        v14 = 0;
      else
        v14 = off_24CBFB330[a6];
      CLKWorldClockLocalizedString(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v18, 0);
LABEL_34:
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_36;
LABEL_35:
      objc_msgSend((id)differenceForOffset_caps_suppressZero_size__formatter, "stringFromTimeInterval:", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  v12 = &stru_24CBFCB28;
LABEL_36:
  if (a3 != 0.0 || !a5)
  {
    v21 = CLKLocaleCurrentNumberSystem();
    v22 = CFSTR("+");
    if (a3 < 0.0)
      v22 = CFSTR("−");
    v23 = &stru_24CBFCB28;
    if (v21 == 1)
      v23 = CFSTR("\u200F");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v23, v22, v12);
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v24;
  }
  v25 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("{"), v10);
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_46;
  v27 = v25;
  v28 = v26;
  v29 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("}"));
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_46;
  v31 = v29;
  v32 = v30;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v12);
  objc_msgSend(v33, "replaceCharactersInRange:withString:", v31, v32, &stru_24CBFCB28);
  objc_msgSend(v33, "replaceCharactersInRange:withString:", v27, v28, &stru_24CBFCB28);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v33);
  v37 = CFSTR("CLKWorldClockCapsAttribute");
  v38[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addAttributes:range:", v35, v27, v31 + ~v27);

  if (!v34)
LABEL_46:
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v12);

  return v34;
}

uint64_t __73__CLKWorldClockTimeFormatter_differenceForOffset_caps_suppressZero_size___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
  differenceForOffset_caps_suppressZero_size__formatter = v0;

  return objc_msgSend((id)differenceForOffset_caps_suppressZero_size__formatter, "setUnitsStyle:", 3);
}

@end
