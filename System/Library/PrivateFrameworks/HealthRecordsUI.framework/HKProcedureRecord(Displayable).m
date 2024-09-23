@implementation HKProcedureRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("PROCEDURE_DETAIL_TITLE"));
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "procedureCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)meaningfulDateTitle
{
  if (objc_msgSend(a1, "notPerformed"))
    HRLocalizedString(CFSTR("PROCEDURE_RECORD_SORT_DATE_TITLE_NOT_PERFORMED"));
  else
    objc_msgSend(a1, "sortDateTitle");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_PROCEDURE_TITLE"));
}

@end
