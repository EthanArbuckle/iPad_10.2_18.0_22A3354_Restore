@implementation CTCellularPlanDateParser

+ (BOOL)validate:(id)a3 parseTo:(double *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;

  v5 = a3;
  if (!a4)
    goto LABEL_10;
  if (validate_parseTo__onceToken != -1)
    dispatch_once(&validate_parseTo__onceToken, &__block_literal_global);
  v6 = 0;
  if (v5 && validate_parseTo__sDateFormatter)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)validate_parseTo__sDateFormatter, "dateFromString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7 || (objc_msgSend(v7, "timeIntervalSinceReferenceDate"), v9 == 0.0))
      {
        v6 = 0;
      }
      else
      {
        *a4 = v9;
        v6 = 1;
      }

      goto LABEL_13;
    }
LABEL_10:
    v6 = 0;
  }
LABEL_13:

  return v6;
}

void __45__CTCellularPlanDateParser_validate_parseTo___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)validate_parseTo__sDateFormatter;
  validate_parseTo__sDateFormatter = (uint64_t)v0;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)validate_parseTo__sDateFormatter, "setLocale:", v4);
  objc_msgSend((id)validate_parseTo__sDateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ssz"));
  v2 = (void *)validate_parseTo__sDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

+ (BOOL)validate:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return objc_msgSend(a1, "validate:parseTo:", a3, &v4);
}

@end
