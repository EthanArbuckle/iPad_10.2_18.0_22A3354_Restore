@implementation ECEmailAddress

id __72__ECEmailAddress_EMECEmailAddressAdditions__em_partiallyRedactedPeople___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddressValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ef_publicDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
