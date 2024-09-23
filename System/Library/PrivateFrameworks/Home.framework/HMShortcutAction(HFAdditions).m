@implementation HMShortcutAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  if (qword_1ED379B20 != -1)
    dispatch_once(&qword_1ED379B20, &__block_literal_global_23_6);
  return (id)qword_1ED379B28;
}

- (id)hf_affectedAccessoryRepresentables
{
  if (qword_1ED379B30 != -1)
    dispatch_once(&qword_1ED379B30, &__block_literal_global_25_3);
  return (id)qword_1ED379B38;
}

@end
