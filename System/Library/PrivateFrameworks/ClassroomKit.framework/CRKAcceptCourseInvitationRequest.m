@implementation CRKAcceptCourseInvitationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKAcceptCourseInvitationRequest)initWithCoder:(id)a3
{
  id v4;
  CRKAcceptCourseInvitationRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  uint64_t v10;
  NSString *pin;
  uint64_t v12;
  NSDictionary *studentInformation;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRKAcceptCourseInvitationRequest;
  v5 = -[CATTaskRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("courseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("pin"));
    v10 = objc_claimAutoreleasedReturnValue();
    pin = v5->_pin;
    v5->_pin = (NSString *)v10;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("studentInformation"));
    v12 = objc_claimAutoreleasedReturnValue();
    studentInformation = v5->_studentInformation;
    v5->_studentInformation = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRKAcceptCourseInvitationRequest courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKAcceptCourseInvitationRequest pin](self, "pin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pin"));

  -[CRKAcceptCourseInvitationRequest studentInformation](self, "studentInformation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("studentInformation"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)studentInformation
{
  return self->_studentInformation;
}

- (void)setStudentInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentInformation, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
