@implementation HKAllergyRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("ALLERGY_DETAIL_TITLE"));
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allergyCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_ALLERGY_TITLE"));
}

@end
