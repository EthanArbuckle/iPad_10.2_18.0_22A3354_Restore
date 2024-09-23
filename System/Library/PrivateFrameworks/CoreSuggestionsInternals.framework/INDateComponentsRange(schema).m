@implementation INDateComponentsRange(schema)

+ (uint64_t)fromStartDate:()schema
{
  return objc_msgSend(MEMORY[0x1E0CBD860], "fromStartDate:endDate:", a3, 0);
}

+ (id)fromStartDate:()schema endDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D78], "sg_dateComponentsFromISO8601String:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99D78], "sg_dateComponentsFromISO8601String:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD860]), "initWithStartDateComponents:endDateComponents:", v8, v9);

  return v10;
}

@end
