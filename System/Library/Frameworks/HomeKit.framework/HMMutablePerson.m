@implementation HMMutablePerson

- (id)copyWithZone:(_NSZone *)a3
{
  HMPerson *v4;
  void *v5;
  HMPerson *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = +[HMPerson allocWithZone:](HMPerson, "allocWithZone:", a3);
  -[HMPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMPerson initWithUUID:](v4, "initWithUUID:", v5);

  -[HMPerson name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setName:](v6, "setName:", v7);

  -[HMPerson personLinks](self, "personLinks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setPersonLinks:](v6, "setPersonLinks:", v8);

  -[HMPerson externalPersonUUID](self, "externalPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setExternalPersonUUID:](v6, "setExternalPersonUUID:", v9);

  return v6;
}

@end
