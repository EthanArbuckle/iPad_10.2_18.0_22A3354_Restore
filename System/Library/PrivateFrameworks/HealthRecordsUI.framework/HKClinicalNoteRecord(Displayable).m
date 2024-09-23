@implementation HKClinicalNoteRecord(Displayable)

- (id)title
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("CLINICAL_NOTE_DETAIL_TITLE"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Notes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "documentTypeCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRClinicalNotesLocalizedString(CFSTR("RECORD_DETAIL_CLINICAL_NOTE_TITLE"));
}

@end
