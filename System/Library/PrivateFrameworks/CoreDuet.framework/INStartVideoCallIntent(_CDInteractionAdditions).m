@implementation INStartVideoCallIntent(_CDInteractionAdditions)

- (uint64_t)cd_sender
{
  return 0;
}

- (uint64_t)cd_interactionMechanism
{
  return 12;
}

- (uint64_t)cd_groupName
{
  return 0;
}

@end
