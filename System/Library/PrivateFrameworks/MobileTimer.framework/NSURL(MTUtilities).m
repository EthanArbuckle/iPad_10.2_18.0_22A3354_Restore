@implementation NSURL(MTUtilities)

+ (uint64_t)mtURLForClockAppSection:()MTUtilities
{
  return objc_msgSend(a1, "mtURLForClockAppSection:timerManager:", a3, 0);
}

+ (id)mtURLForClockAppSection:()MTUtilities timerManager:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  switch(a3)
  {
    case 1:
      v10 = CFSTR("clock-alarm");
      goto LABEL_6;
    case 2:
      v10 = CFSTR("clock-sleep-alarm");
      goto LABEL_6;
    case 3:
      v10 = CFSTR("clock-stopwatch");
      goto LABEL_6;
    case 4:
      objc_msgSend(v6, "currentTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke;
      v16[3] = &unk_1E39CC8F0;
      v17 = v8;
      v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v16);

      goto LABEL_7;
    default:
      v10 = CFSTR("clock-worldclock");
LABEL_6:
      objc_msgSend(v7, "finishWithResult:", v10);
LABEL_7:
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke_2;
      v15[3] = &__block_descriptor_40_e28___NAFuture_16__0__NSString_8l;
      v15[4] = a1;
      objc_msgSend(v8, "flatMap:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
  }
}

+ (id)mtURLForScheme:()MTUtilities
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, CFSTR("default"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mtURLForSection:()MTUtilities
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "schemeForSection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("default"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (const)schemeForSection:()MTUtilities
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("clock-worldclock");
  else
    return off_1E39CD890[a3 - 1];
}

- (uint64_t)mtClockAppSection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("clock-worldclock")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("clock-alarm")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("clock-sleep-alarm")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("clock-stopwatch")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("clock-timer")) & 1) != 0
         || objc_msgSend(v1, "isEqualToString:", CFSTR("clock-timer-running")))
  {
    v2 = 4;
  }
  else
  {
    v2 = -1;
  }

  return v2;
}

- (uint64_t)mtIsList
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("list"));

  return v2;
}

- (uint64_t)mtIsForLastTimer
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("clock-timer")))
  {
    objc_msgSend(a1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("lastTimer"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mtID
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3 >= 2)
  {
    objc_msgSend(a1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
