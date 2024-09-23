@implementation CKLocalizedStringForDuration

uint64_t __CKLocalizedStringForDuration_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3570], "__ck_durationFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKLocalizedStringForDuration_sMSDurationFormatter;
  CKLocalizedStringForDuration_sMSDurationFormatter = v0;

  return objc_msgSend((id)CKLocalizedStringForDuration_sMSDurationFormatter, "setAllowedUnits:", 192);
}

uint64_t __CKLocalizedStringForDuration_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3570], "__ck_durationFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKLocalizedStringForDuration_sHMSDurationFormatter;
  CKLocalizedStringForDuration_sHMSDurationFormatter = v0;

  return objc_msgSend((id)CKLocalizedStringForDuration_sHMSDurationFormatter, "setAllowedUnits:", 224);
}

@end
