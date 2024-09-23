@implementation NSCalendar(MTUtilities)

+ (uint64_t)mtGregorianCalendar
{
  return objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
}

- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingComponents:
{
  return objc_msgSend(a1, "_mtNextDateAfterDate:matchingComponents:backwards:", a3, a4, 0);
}

- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingComponents:
{
  return objc_msgSend(a1, "_mtNextDateAfterDate:matchingComponents:backwards:", a3, a4, 1);
}

- (id)_mtNextDateAfterDate:()MTUtilities matchingComponents:backwards:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(), "_optionsForBackwards:", a5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__NSCalendar_MTUtilities___mtNextDateAfterDate_matchingComponents_backwards___block_invoke;
  v14[3] = &unk_1E39CD750;
  v14[4] = a1;
  v15 = v8;
  v16 = v10;
  v11 = v8;
  objc_msgSend(a1, "_nextDateHelperAfterDate:nextDateBlock:", v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingUnit:value:
{
  return objc_msgSend(a1, "_mtNextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 0);
}

- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingUnit:value:
{
  return objc_msgSend(a1, "_mtNextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 1);
}

- (id)_mtNextDateAfterDate:()MTUtilities matchingUnit:value:backwards:
{
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[8];

  v10 = a3;
  v11 = objc_msgSend((id)objc_opt_class(), "_optionsForBackwards:", a6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__NSCalendar_MTUtilities___mtNextDateAfterDate_matchingUnit_value_backwards___block_invoke;
  v14[3] = &unk_1E39CD778;
  v14[4] = a1;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = v11;
  objc_msgSend(a1, "_nextDateHelperAfterDate:nextDateBlock:", v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_nextDateHelperAfterDate:()MTUtilities nextDateBlock:
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daylightSavingTimeOffsetForDate:", v6);
  v10 = v9;

  if (v10 <= 0.0)
    goto LABEL_7;
  objc_msgSend(v6, "dateByAddingTimeInterval:", -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "daylightSavingTimeOffsetForDate:", v11);
  v14 = v13;

  if (v10 <= v14)
  {
LABEL_6:

LABEL_7:
    v7[2](v7, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7[2](v7, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "mtIsAfterDate:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }

LABEL_8:
  return v15;
}

+ (uint64_t)_optionsForBackwards:()MTUtilities
{
  if (a3)
    return 516;
  else
    return 512;
}

- (uint64_t)mtDateRequiresSingularTimeString:()MTUtilities
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(a1, "component:fromDate:", 32, a3);
  if (result != 1)
  {
    if (result == 13)
    {
      objc_msgSend(a1, "locale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "mtIsIn24HourTime");

      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
