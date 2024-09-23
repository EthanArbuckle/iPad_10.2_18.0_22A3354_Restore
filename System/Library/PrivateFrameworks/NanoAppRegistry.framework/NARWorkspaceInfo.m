@implementation NARWorkspaceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NARWorkspaceInfo)initWithCoder:(id)a3
{
  id v4;
  NARWorkspaceInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *applications;
  uint64_t v11;
  NSUUID *UUID;
  uint64_t v13;
  NSNumber *sequenceNumber;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NARWorkspaceInfo;
  v5 = -[NARWorkspaceInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("applications"));
    v9 = objc_claimAutoreleasedReturnValue();
    applications = v5->_applications;
    v5->_applications = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceNumber"));
    v13 = objc_claimAutoreleasedReturnValue();
    sequenceNumber = v5->_sequenceNumber;
    v5->_sequenceNumber = (NSNumber *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *applications;
  id v5;

  applications = self->_applications;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applications, CFSTR("applications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sequenceNumber, CFSTR("sequenceNumber"));

}

- (NARWorkspaceInfo)initWithApplications:(id)a3 UUID:(id)a4 sequenceNumber:(id)a5
{
  id v9;
  id v10;
  id v11;
  NARWorkspaceInfo *v12;
  NARWorkspaceInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NARWorkspaceInfo;
  v12 = -[NARWorkspaceInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applications, a3);
    objc_storeStrong((id *)&v13->_UUID, a4);
    objc_storeStrong((id *)&v13->_sequenceNumber, a5);
  }

  return v13;
}

- (NSArray)applications
{
  return self->_applications;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSArray)standaloneGlances
{
  return self->_standaloneGlances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standaloneGlances, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_applications, 0);
}

@end
