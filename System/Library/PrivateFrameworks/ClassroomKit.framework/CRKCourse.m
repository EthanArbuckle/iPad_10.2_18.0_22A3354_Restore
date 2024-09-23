@implementation CRKCourse

- (CRKCourse)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v8;
  CRKCourse *v9;
  CRKCourse *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCourse.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CRKCourse;
  v9 = -[CRKCourse init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_courseIdentifier, a3);
    v10->_type = a4;
  }

  return v10;
}

- (CRKCourse)initWithIdentifier:(id)a3 managed:(BOOL)a4
{
  return -[CRKCourse initWithIdentifier:type:](self, "initWithIdentifier:type:", a3, !a4);
}

- (BOOL)isManaged
{
  return -[CRKCourse type](self, "type") == 0;
}

- (BOOL)allowsUnenroll
{
  return -[CRKCourse type](self, "type") == 1;
}

- (BOOL)mustRequestUnenroll
{
  return self->_mustRequestUnenroll || self->_requestingUnenroll;
}

- (void)setManaged:(BOOL)a3
{
  -[CRKCourse setType:](self, "setType:", !a3);
}

+ (id)stringForType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24D9C8080[a3];
}

+ (id)keyPathsForValuesAffectingExpired
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("studentCredentialsAreValid");
  v6[1] = CFSTR("validTrustedCertificatePersistentIds");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isExpired
{
  BOOL v3;
  void *v4;

  if (-[CRKCourse type](self, "type") == 2)
    return 0;
  if (!-[CRKCourse studentCredentialsAreValid](self, "studentCredentialsAreValid"))
    return 1;
  -[CRKCourse validTrustedCertificatePersistentIds](self, "validTrustedCertificatePersistentIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") == 0;

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKCourse courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse courseName](self, "courseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse courseUser](self, "courseUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse instructorsByIdentifier](self, "instructorsByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {identifier = %@, name = %@, studentUser = %@, instructors = %@ }>"), v4, self, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRKCourse courseIdentifier](self, "courseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CRKCourse *v4;
  BOOL v5;

  v4 = (CRKCourse *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CRKCourse isEqualToCourse:](self, "isEqualToCourse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCourse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  BOOL v11;

  v4 = a3;
  -[CRKCourse courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "courseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    v11 = 0;
  }
  else
  {
    v10 = -[CRKCourse type](self, "type");
    v11 = v10 == objc_msgSend(v4, "type");
  }

  return v11;
}

- (BOOL)isDeeplyEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKCourse *v8;
  CRKCourse *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKCourse *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("courseIdentifier, courseName, courseDescription, courseMascotType, courseColorType, courseUser, instructorsByIdentifier, type, mustRequestUnenroll, requestingUnenroll, automaticRemovalDate, expired"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_5;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKCourse *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKCourse isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKCourse valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKCourse valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCourse)initWithCoder:(id)a3
{
  id v4;
  CRKCourse *v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  CRKUser *courseUser;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *instructorsByIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDate *automaticRemovalDate;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSSet *trustedCertificatePersistentIds;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSSet *validTrustedCertificatePersistentIds;
  void *v43;
  void *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CRKCourse;
  v5 = -[CRKCourse init](&v46, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("courseMascotType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_courseMascotType = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("courseColorType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_courseColorType = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("courseUser"));
    v18 = objc_claimAutoreleasedReturnValue();
    courseUser = v5->_courseUser;
    v5->_courseUser = (CRKUser *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("instructorsByIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    instructorsByIdentifier = v5->_instructorsByIdentifier;
    v5->_instructorsByIdentifier = (NSDictionary *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mustRequestUnenroll"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mustRequestUnenroll = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingUnenroll"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestingUnenroll = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("automaticRemovalDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    automaticRemovalDate = v5->_automaticRemovalDate;
    v5->_automaticRemovalDate = (NSDate *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("studentCredentialsAreValid"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_studentCredentialsAreValid = objc_msgSend(v32, "BOOLValue");

    v33 = (void *)MEMORY[0x24BDBCF20];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("trustedCertificatePersistentIds"));
    v36 = objc_claimAutoreleasedReturnValue();
    trustedCertificatePersistentIds = v5->_trustedCertificatePersistentIds;
    v5->_trustedCertificatePersistentIds = (NSSet *)v36;

    v38 = (void *)MEMORY[0x24BDBCF20];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("validTrustedCertificatePersistentIds"));
    v41 = objc_claimAutoreleasedReturnValue();
    validTrustedCertificatePersistentIds = v5->_validTrustedCertificatePersistentIds;
    v5->_validTrustedCertificatePersistentIds = (NSSet *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managed"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
      v5->_type = objc_msgSend(v43, "BOOLValue") ^ 1;

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[CRKCourse courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKCourse courseName](self, "courseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("courseName"));

  -[CRKCourse courseDescription](self, "courseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("courseDescription"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKCourse courseMascotType](self, "courseMascotType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("courseMascotType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKCourse courseColorType](self, "courseColorType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("courseColorType"));

  -[CRKCourse courseUser](self, "courseUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("courseUser"));

  -[CRKCourse instructorsByIdentifier](self, "instructorsByIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("instructorsByIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKCourse type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKCourse mustRequestUnenroll](self, "mustRequestUnenroll"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("mustRequestUnenroll"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKCourse isRequestingUnenroll](self, "isRequestingUnenroll"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("requestingUnenroll"));

  -[CRKCourse automaticRemovalDate](self, "automaticRemovalDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("automaticRemovalDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKCourse isExpired](self, "isExpired"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("expired"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKCourse studentCredentialsAreValid](self, "studentCredentialsAreValid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("studentCredentialsAreValid"));

  -[CRKCourse trustedCertificatePersistentIds](self, "trustedCertificatePersistentIds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("trustedCertificatePersistentIds"));

  -[CRKCourse validTrustedCertificatePersistentIds](self, "validTrustedCertificatePersistentIds");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("validTrustedCertificatePersistentIds"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CRKCourse *v4;
  void *v5;
  CRKCourse *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = [CRKCourse alloc];
  -[CRKCourse courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKCourse initWithIdentifier:type:](v4, "initWithIdentifier:type:", v5, -[CRKCourse type](self, "type"));

  -[CRKCourse courseName](self, "courseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setCourseName:](v6, "setCourseName:", v7);

  -[CRKCourse courseDescription](self, "courseDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setCourseDescription:](v6, "setCourseDescription:", v8);

  -[CRKCourse setCourseMascotType:](v6, "setCourseMascotType:", -[CRKCourse courseMascotType](self, "courseMascotType"));
  -[CRKCourse setCourseColorType:](v6, "setCourseColorType:", -[CRKCourse courseColorType](self, "courseColorType"));
  -[CRKCourse courseUser](self, "courseUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setCourseUser:](v6, "setCourseUser:", v9);

  -[CRKCourse instructorsByIdentifier](self, "instructorsByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setInstructorsByIdentifier:](v6, "setInstructorsByIdentifier:", v10);

  -[CRKCourse setMustRequestUnenroll:](v6, "setMustRequestUnenroll:", -[CRKCourse mustRequestUnenroll](self, "mustRequestUnenroll"));
  -[CRKCourse setRequestingUnenroll:](v6, "setRequestingUnenroll:", -[CRKCourse isRequestingUnenroll](self, "isRequestingUnenroll"));
  -[CRKCourse automaticRemovalDate](self, "automaticRemovalDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setAutomaticRemovalDate:](v6, "setAutomaticRemovalDate:", v11);

  -[CRKCourse setStudentCredentialsAreValid:](v6, "setStudentCredentialsAreValid:", -[CRKCourse studentCredentialsAreValid](self, "studentCredentialsAreValid"));
  -[CRKCourse trustedCertificatePersistentIds](self, "trustedCertificatePersistentIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setTrustedCertificatePersistentIds:](v6, "setTrustedCertificatePersistentIds:", v12);

  -[CRKCourse validTrustedCertificatePersistentIds](self, "validTrustedCertificatePersistentIds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourse setValidTrustedCertificatePersistentIds:](v6, "setValidTrustedCertificatePersistentIds:", v13);

  return v6;
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

- (unint64_t)courseMascotType
{
  return self->_courseMascotType;
}

- (void)setCourseMascotType:(unint64_t)a3
{
  self->_courseMascotType = a3;
}

- (unint64_t)courseColorType
{
  return self->_courseColorType;
}

- (void)setCourseColorType:(unint64_t)a3
{
  self->_courseColorType = a3;
}

- (CRKUser)courseUser
{
  return self->_courseUser;
}

- (void)setCourseUser:(id)a3
{
  objc_storeStrong((id *)&self->_courseUser, a3);
}

- (NSDictionary)instructorsByIdentifier
{
  return self->_instructorsByIdentifier;
}

- (void)setInstructorsByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setMustRequestUnenroll:(BOOL)a3
{
  self->_mustRequestUnenroll = a3;
}

- (BOOL)isRequestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (NSDate)automaticRemovalDate
{
  return self->_automaticRemovalDate;
}

- (void)setAutomaticRemovalDate:(id)a3
{
  objc_storeStrong((id *)&self->_automaticRemovalDate, a3);
}

- (BOOL)studentCredentialsAreValid
{
  return self->_studentCredentialsAreValid;
}

- (void)setStudentCredentialsAreValid:(BOOL)a3
{
  self->_studentCredentialsAreValid = a3;
}

- (NSSet)trustedCertificatePersistentIds
{
  return self->_trustedCertificatePersistentIds;
}

- (void)setTrustedCertificatePersistentIds:(id)a3
{
  objc_storeStrong((id *)&self->_trustedCertificatePersistentIds, a3);
}

- (NSSet)validTrustedCertificatePersistentIds
{
  return self->_validTrustedCertificatePersistentIds;
}

- (void)setValidTrustedCertificatePersistentIds:(id)a3
{
  objc_storeStrong((id *)&self->_validTrustedCertificatePersistentIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validTrustedCertificatePersistentIds, 0);
  objc_storeStrong((id *)&self->_trustedCertificatePersistentIds, 0);
  objc_storeStrong((id *)&self->_automaticRemovalDate, 0);
  objc_storeStrong((id *)&self->_instructorsByIdentifier, 0);
  objc_storeStrong((id *)&self->_courseUser, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKCourse.m"), 204, CFSTR("%@ is unavailable for %@"), v5, a1);

  return 0;
}

- (CRKCourse)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCourse.m"), 209, CFSTR("%@ is unavailable for %@"), v5, self);

  return 0;
}

@end
