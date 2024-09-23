@implementation FEPreferencesOnce

void ___FEPreferencesOnce_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _FEUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_256BAFCB8;
  qword_256BAFCB8 = v0;

}

@end
