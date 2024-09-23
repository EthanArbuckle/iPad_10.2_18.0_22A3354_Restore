@implementation CRKFetchActiveStudentCourseIdentifiersResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveStudentCourseIdentifiersResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchActiveStudentCourseIdentifiersResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *activeCourseIdentifiers;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *activeInstructorIdentifiers;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchActiveStudentCourseIdentifiersResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("activeCourseIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    activeCourseIdentifiers = v5->_activeCourseIdentifiers;
    v5->_activeCourseIdentifiers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("activeInstructorIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    activeInstructorIdentifiers = v5->_activeInstructorIdentifiers;
    v5->_activeInstructorIdentifiers = (NSArray *)v14;

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
  v7.super_class = (Class)CRKFetchActiveStudentCourseIdentifiersResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchActiveStudentCourseIdentifiersResultObject activeCourseIdentifiers](self, "activeCourseIdentifiers", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activeCourseIdentifiers"));

  -[CRKFetchActiveStudentCourseIdentifiersResultObject activeInstructorIdentifiers](self, "activeInstructorIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeInstructorIdentifiers"));

}

- (NSArray)activeCourseIdentifiers
{
  return self->_activeCourseIdentifiers;
}

- (void)setActiveCourseIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)activeInstructorIdentifiers
{
  return self->_activeInstructorIdentifiers;
}

- (void)setActiveInstructorIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInstructorIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeCourseIdentifiers, 0);
}

@end
