@implementation CRKSetCoursePropertiesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCoursePropertiesRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetCoursePropertiesRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  uint64_t v10;
  NSString *courseName;
  void *v12;
  uint64_t v13;
  NSString *courseDescription;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *anchorCertificates;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKSetCoursePropertiesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v21, sel_initWithCoder_, v4);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("courseName"));
    v10 = objc_claimAutoreleasedReturnValue();
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("courseDescription"));
    v13 = objc_claimAutoreleasedReturnValue();
    courseDescription = v5->_courseDescription;
    v5->_courseDescription = (NSString *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("anchorCertificates"));
    v18 = objc_claimAutoreleasedReturnValue();
    anchorCertificates = v5->_anchorCertificates;
    v5->_anchorCertificates = (NSArray *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKSetCoursePropertiesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CRKSetCoursePropertiesRequest courseIdentifier](self, "courseIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKSetCoursePropertiesRequest courseName](self, "courseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("courseName"));

  -[CRKSetCoursePropertiesRequest courseDescription](self, "courseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("courseDescription"));

  -[CRKSetCoursePropertiesRequest anchorCertificates](self, "anchorCertificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("anchorCertificates"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (NSString)courseName
{
  return self->_courseName;
}

- (void)setCourseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)courseDescription
{
  return self->_courseDescription;
}

- (void)setCourseDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)anchorCertificates
{
  return self->_anchorCertificates;
}

- (void)setAnchorCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificates, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
