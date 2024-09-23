@implementation HKMedicationRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("MEDICATION_STATEMENT_DETAIL_TITLE"));
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "medicationCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)meaningfulDateTitle
{
  if (objc_msgSend(a1, "notTaken"))
    HRLocalizedString(CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_NOT_TAKEN"));
  else
    objc_msgSend(a1, "sortDateTitle");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_MEDICATION_TITLE"));
}

@end
