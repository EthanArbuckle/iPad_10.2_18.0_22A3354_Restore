@implementation NSDateFormatter(MessageUIAdditions)

+ (id)ef_formatDate:()MessageUIAdditions shortStyle:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (a4)
    _sharedShortDateFormatter();
  else
    _sharedLongDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ef_formatterForStyle:()MessageUIAdditions
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  switch(a3)
  {
    case 0:
      _sharedShortDateFormatter();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 1:
      _sharedLongDateFormatter();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      if (_sharedMediumRelativeDateFormatter_sharedMediumRelativeDateFormatterOnceToken != -1)
        dispatch_once(&_sharedMediumRelativeDateFormatter_sharedMediumRelativeDateFormatterOnceToken, &__block_literal_global_11);
      v4 = (void *)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter;
      goto LABEL_17;
    case 3:
      if (_sharedMediumRelativeDateOnlyFormatter_sharedMediumRelativeDateOnlyFormatterOnceToken != -1)
        dispatch_once(&_sharedMediumRelativeDateOnlyFormatter_sharedMediumRelativeDateOnlyFormatterOnceToken, &__block_literal_global_12);
      v4 = (void *)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter;
      goto LABEL_17;
    case 4:
      if (_sharedShortTimeFormatter_sharedShortTimeFormatterrOnceToken != -1)
        dispatch_once(&_sharedShortTimeFormatter_sharedShortTimeFormatterrOnceToken, &__block_literal_global_13);
      v4 = (void *)_sharedShortTimeFormatter__sharedShortTimeFormatter;
      goto LABEL_17;
    case 5:
      v4 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
      if (!_sharedLongTimeDateFormatter___sharedLongDateFormatter)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        v6 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
        _sharedLongTimeDateFormatter___sharedLongDateFormatter = (uint64_t)v5;

        objc_msgSend((id)_sharedLongTimeDateFormatter___sharedLongDateFormatter, "setTimeStyle:", 3);
        objc_msgSend((id)_sharedLongTimeDateFormatter___sharedLongDateFormatter, "setDateStyle:", 1);
        v4 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
      }
LABEL_17:
      v3 = v4;
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)ef_isoDateFormatter
{
  if (ef_isoDateFormatter_onceToken != -1)
    dispatch_once(&ef_isoDateFormatter_onceToken, &__block_literal_global_15);
  return (id)ef_isoDateFormatter_dateFormatter;
}

+ (id)ef_formatDate:()MessageUIAdditions style:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatterForStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ef_formatDate:()MessageUIAdditions style:formattingContext:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatterForStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "formattingContext");
  objc_msgSend(v8, "setFormattingContext:", a5);
  objc_msgSend(v8, "stringFromDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFormattingContext:", v9);

  return v10;
}

@end
