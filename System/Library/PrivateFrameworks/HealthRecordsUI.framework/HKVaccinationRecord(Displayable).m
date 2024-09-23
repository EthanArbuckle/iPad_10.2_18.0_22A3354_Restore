@implementation HKVaccinationRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("IMMUNIZATION_DETAIL_TITLE"));
}

- (id)meaningfulDateTitle
{
  if (objc_msgSend(a1, "notGiven"))
    HRLocalizedString(CFSTR("VACCINATION_RECORD_SORT_DATE_TITLE_NOT_ADMINISTERED"));
  else
    objc_msgSend(a1, "sortDateTitle");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_IMMUNIZATION_TITLE"));
}

@end
