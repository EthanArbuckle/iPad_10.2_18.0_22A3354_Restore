@implementation HMCharacteristicWriteAction(HFAdditions)

- (id)hf_affectedAccessoryProfiles
{
  if (qword_1ED379B00 != -1)
    dispatch_once(&qword_1ED379B00, &__block_literal_global_19_11);
  return (id)qword_1ED379B08;
}

- (id)hf_affectedAccessoryRepresentables
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
