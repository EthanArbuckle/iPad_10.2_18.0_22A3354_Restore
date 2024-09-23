@implementation HKCoverageRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("INSURANCE_DETAIL_TITLE"));
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "coverageTypeCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_INSURANCE_TITLE"));
}

- (__CFString)meaningfulDateString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  objc_msgSend(a1, "sortDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4AF0]))
  {

    return &stru_1E74EA150;
  }
  objc_msgSend(a1, "sortDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB4AE8]);

  if ((v6 & 1) != 0)
    return &stru_1E74EA150;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EF4BC9E8;
  objc_msgSendSuper2(&v8, sel_meaningfulDateString);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
