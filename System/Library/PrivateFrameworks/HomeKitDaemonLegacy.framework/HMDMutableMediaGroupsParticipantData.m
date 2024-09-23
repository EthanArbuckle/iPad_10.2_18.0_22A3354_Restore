@implementation HMDMutableMediaGroupsParticipantData

- (id)copyWithZone:(_NSZone *)a3
{
  HMDMediaGroupsParticipantData *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaGroupsParticipantData *v8;

  v4 = [HMDMediaGroupsParticipantData alloc];
  -[HMDMediaGroupsParticipantData destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMediaGroupsParticipantData initWithDestination:destinationControllerData:backedUpGroups:](v4, "initWithDestination:destinationControllerData:backedUpGroups:", v5, v6, v7);

  return v8;
}

@end
