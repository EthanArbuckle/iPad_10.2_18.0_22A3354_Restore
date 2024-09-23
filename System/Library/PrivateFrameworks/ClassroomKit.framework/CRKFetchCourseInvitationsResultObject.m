@implementation CRKFetchCourseInvitationsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchCourseInvitationsResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchCourseInvitationsResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *courseInvitations;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *acceptedInvitationIdentifiers;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchCourseInvitationsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("courseInvitations"));
    v9 = objc_claimAutoreleasedReturnValue();
    courseInvitations = v5->_courseInvitations;
    v5->_courseInvitations = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("acceptedInvitationIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    acceptedInvitationIdentifiers = v5->_acceptedInvitationIdentifiers;
    v5->_acceptedInvitationIdentifiers = (NSSet *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchCourseInvitationsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchCourseInvitationsResultObject courseInvitations](self, "courseInvitations", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseInvitations"));

  -[CRKFetchCourseInvitationsResultObject acceptedInvitationIdentifiers](self, "acceptedInvitationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("acceptedInvitationIdentifiers"));

}

- (NSArray)courseInvitations
{
  return self->_courseInvitations;
}

- (void)setCourseInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_courseInvitations, a3);
}

- (NSSet)acceptedInvitationIdentifiers
{
  return self->_acceptedInvitationIdentifiers;
}

- (void)setAcceptedInvitationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedInvitationIdentifiers, 0);
  objc_storeStrong((id *)&self->_courseInvitations, 0);
}

@end
