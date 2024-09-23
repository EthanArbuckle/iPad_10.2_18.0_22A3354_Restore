@implementation HKPathToValidationSchema

void ___HKPathToValidationSchema_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:inDirectory:", CFSTR("CDA_SDTC"), CFSTR("xsd"), CFSTR("cda_validation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_HKPathToValidationSchema__pathToValidationSchema;
  _HKPathToValidationSchema__pathToValidationSchema = v0;

}

@end
