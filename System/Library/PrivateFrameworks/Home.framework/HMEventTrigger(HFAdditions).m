@implementation HMEventTrigger(HFAdditions)

- (uint64_t)hf_requiresConfirmationToRun
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(a1, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_331_1);

  objc_msgSend(a1, "actionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "na_any:", &__block_literal_global_332);

  return v3 & v2;
}

- (uint64_t)hf_affectsCharacteristics:()HFAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F04514F8;
  if ((objc_msgSendSuper2(&v8, sel_hf_affectsCharacteristics_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "hf_characteristicsInEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intersectsSet:", v6);

  }
  return v5;
}

@end
