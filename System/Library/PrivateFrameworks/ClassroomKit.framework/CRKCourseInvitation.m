@implementation CRKCourseInvitation

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 anchorCertificates:(id)a7
{
  return -[CRKCourseInvitation initWithCourseIdentifier:courseName:courseDescription:instructorName:instructorImageData:anchorCertificates:](self, "initWithCourseIdentifier:courseName:courseDescription:instructorName:instructorImageData:anchorCertificates:", a3, a4, a5, a6, 0, a7);
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 instructorImageData:(id)a7 anchorCertificates:(id)a8
{
  return -[CRKCourseInvitation initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificates:](self, "initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificates:", a3, a4, a5, 0, 0, a6, a7, a8);
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificates:(id)a9
{
  return -[CRKCourseInvitation initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificates:](self, "initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificates:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificates:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  CRKCourseInvitation *v23;

  v17 = a9;
  v18 = a8;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(a10, "crk_mapUsingBlock:", &__block_literal_global_31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CRKCourseInvitation initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificateDatas:](self, "initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificateDatas:", v21, v20, v19, a6, a7, v18, v17, v22);

  return v23;
}

id __164__CRKCourseInvitation_initWithCourseIdentifier_courseName_courseDescription_courseMascotType_courseColorType_instructorName_instructorImageData_anchorCertificates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRKConcreteCertificate *v3;
  void *v4;

  v2 = a2;
  v3 = -[CRKConcreteCertificate initWithCertificate:]([CRKConcreteCertificate alloc], "initWithCertificate:", v2);

  -[CRKConcreteCertificate dataRepresentation](v3, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificateDatas:(id)a9
{
  return -[CRKCourseInvitation initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificateDatas:](self, "initWithCourseIdentifier:courseName:courseDescription:courseMascotType:courseColorType:instructorName:instructorImageData:anchorCertificateDatas:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificateDatas:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CRKCourseInvitation *v22;
  uint64_t v23;
  DMFControlGroupIdentifier *courseIdentifier;
  uint64_t v25;
  NSString *courseName;
  uint64_t v27;
  NSString *courseDescription;
  uint64_t v29;
  NSString *instructorName;
  uint64_t v31;
  NSData *instructorImageData;
  uint64_t v33;
  NSArray *anchorCertificateDatas;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)CRKCourseInvitation;
  v22 = -[CRKCourseInvitation init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    courseIdentifier = v22->_courseIdentifier;
    v22->_courseIdentifier = (DMFControlGroupIdentifier *)v23;

    v25 = objc_msgSend(v17, "copy");
    courseName = v22->_courseName;
    v22->_courseName = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    courseDescription = v22->_courseDescription;
    v22->_courseDescription = (NSString *)v27;

    v22->_courseMascotType = a6;
    v22->_courseColorType = a7;
    v29 = objc_msgSend(v19, "copy");
    instructorName = v22->_instructorName;
    v22->_instructorName = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    instructorImageData = v22->_instructorImageData;
    v22->_instructorImageData = (NSData *)v31;

    v33 = objc_msgSend(v21, "copy");
    anchorCertificateDatas = v22->_anchorCertificateDatas;
    v22->_anchorCertificateDatas = (NSArray *)v33;

  }
  return v22;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKCourseInvitation courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseInvitation courseName](self, "courseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseInvitation instructorName](self, "instructorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, name = %@, instructor = %@ }>"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCourseInvitation)initWithCoder:(id)a3
{
  id v4;
  CRKCourseInvitation *v5;
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
  NSString *instructorName;
  void *v20;
  uint64_t v21;
  NSData *instructorImageData;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *anchorCertificateDatas;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRKCourseInvitation;
  v5 = -[CRKCourseInvitation init](&v29, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("instructorName"));
    v18 = objc_claimAutoreleasedReturnValue();
    instructorName = v5->_instructorName;
    v5->_instructorName = (NSString *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("instructorImageData"));
    v21 = objc_claimAutoreleasedReturnValue();
    instructorImageData = v5->_instructorImageData;
    v5->_instructorImageData = (NSData *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("anchorCertificateDatas"));
    v26 = objc_claimAutoreleasedReturnValue();
    anchorCertificateDatas = v5->_anchorCertificateDatas;
    v5->_anchorCertificateDatas = (NSArray *)v26;

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
  id v12;

  v4 = a3;
  -[CRKCourseInvitation courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKCourseInvitation courseName](self, "courseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("courseName"));

  -[CRKCourseInvitation courseDescription](self, "courseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("courseDescription"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKCourseInvitation courseMascotType](self, "courseMascotType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("courseMascotType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKCourseInvitation courseColorType](self, "courseColorType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("courseColorType"));

  -[CRKCourseInvitation instructorName](self, "instructorName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("instructorName"));

  -[CRKCourseInvitation instructorImageData](self, "instructorImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("instructorImageData"));

  -[CRKCourseInvitation anchorCertificateDatas](self, "anchorCertificateDatas");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("anchorCertificateDatas"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKCourseInvitation *v8;
  CRKCourseInvitation *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKCourseInvitation *v17;
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
  objc_msgSend(CFSTR("courseIdentifier, courseName, courseDescription, courseMascotType, courseColorType, instructorName, instructorImageData, anchorCertificateDatas"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_7;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKCourseInvitation *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKCourseInvitation isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKCourseInvitation valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKCourseInvitation valueForKey:](v17, "valueForKey:", v16);
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

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (NSString)courseName
{
  return self->_courseName;
}

- (NSString)courseDescription
{
  return self->_courseDescription;
}

- (unint64_t)courseMascotType
{
  return self->_courseMascotType;
}

- (unint64_t)courseColorType
{
  return self->_courseColorType;
}

- (NSString)instructorName
{
  return self->_instructorName;
}

- (NSData)instructorImageData
{
  return self->_instructorImageData;
}

- (NSArray)anchorCertificateDatas
{
  return self->_anchorCertificateDatas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificateDatas, 0);
  objc_storeStrong((id *)&self->_instructorImageData, 0);
  objc_storeStrong((id *)&self->_instructorName, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
