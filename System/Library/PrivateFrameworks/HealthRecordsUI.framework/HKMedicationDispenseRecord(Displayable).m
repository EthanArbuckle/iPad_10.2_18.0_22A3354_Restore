@implementation HKMedicationDispenseRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("MEDICATION_FILL_DETAIL_TITLE"));
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_MEDICATION_TITLE"));
}

@end
