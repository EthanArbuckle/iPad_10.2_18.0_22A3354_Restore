@implementation CRKInstructor

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
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

  v3 = (void *)objc_opt_new();
  -[CRKInstructor sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionIdentifier"));

  -[CRKInstructor userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("userIdentifier"));

  -[CRKInstructor displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("displayName"));

  -[CRKInstructor courseName](self, "courseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("courseName"));

  -[CRKInstructor imageData](self, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[CRKInstructor imageData](self, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Data with length %lu"), objc_msgSend(v10, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("imageData"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("imageData"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("disallowsClassroomAirDropOverLocalNetwork"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor allowsStudentInitiatedDisconnection](self, "allowsStudentInitiatedDisconnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("allowsStudentInitiatedDisconnection"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor isObservingStudentScreen](self, "isObservingStudentScreen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("observingStudentScreen"));

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v15;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CRKInstructor sessionIdentifier](self, "sessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CRKInstructor *v4;
  BOOL v5;

  v4 = (CRKInstructor *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CRKInstructor isEqualToInstructor:](self, "isEqualToInstructor:", v4);
  }

  return v5;
}

- (BOOL)isEqualToInstructor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  _BOOL4 v32;
  unint64_t v34;
  void *v35;
  int v36;
  void *v37;
  unint64_t v38;
  void *v39;

  v4 = a3;
  -[CRKInstructor sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    LOBYTE(v29) = 0;
  }
  else
  {
    -[CRKInstructor userIdentifier](self, "userIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    if (v12 | v13 && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
    {
      LOBYTE(v29) = 0;
    }
    else
    {
      -[CRKInstructor displayName](self, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 | v18
        && (v19 = objc_msgSend((id)v17, "isEqual:", v18), (id)v18, (id)v17, !v19))
      {
        LOBYTE(v29) = 0;
      }
      else
      {
        -[CRKInstructor courseName](self, "courseName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "courseName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v38 = v21;
        v39 = (void *)v22;
        if (v22 | v38
          && (v36 = objc_msgSend((id)v22, "isEqual:", v38), (id)v38, (id)v22, !v36))
        {
          LOBYTE(v29) = 0;
        }
        else
        {
          v34 = v17;
          -[CRKInstructor imageData](self, "imageData");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "crk_sha1Hash");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "imageData");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "crk_sha1Hash");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v23;
          v26 = v24;
          if ((!(v25 | v26)
             || (v27 = objc_msgSend((id)v25, "isEqual:", v26), (id)v26, (id)v25, v27))
            && (v28 = -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"), v28 == objc_msgSend(v4, "disallowsClassroomAirDropOverLocalNetwork")))
          {
            v30 = -[CRKInstructor allowsStudentInitiatedDisconnection](self, "allowsStudentInitiatedDisconnection");
            v31 = v30 == objc_msgSend(v4, "allowsStudentInitiatedDisconnection");
            v17 = v34;
            if (v31)
            {
              v32 = -[CRKInstructor isObservingStudentScreen](self, "isObservingStudentScreen");
              v29 = v32 ^ objc_msgSend(v4, "isObservingStudentScreen") ^ 1;
            }
            else
            {
              LOBYTE(v29) = 0;
            }
          }
          else
          {
            LOBYTE(v29) = 0;
            v17 = v34;
          }

        }
      }

    }
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKInstructor)initWithCoder:(id)a3
{
  id v4;
  CRKInstructor *v5;
  void *v6;
  uint64_t v7;
  DMFControlSessionIdentifier *sessionIdentifier;
  void *v9;
  uint64_t v10;
  NSString *userIdentifier;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  uint64_t v16;
  NSString *courseName;
  void *v18;
  uint64_t v19;
  NSData *imageData;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRKInstructor;
  v5 = -[CRKInstructor init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sessionIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (DMFControlSessionIdentifier *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("userIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("displayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("courseName"));
    v16 = objc_claimAutoreleasedReturnValue();
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("imageData"));
    v19 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disallowsClassroomAirDropOverLocalNetwork"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disallowsClassroomAirDropOverLocalNetwork = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsStudentInitiatedDisconnection"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsStudentInitiatedDisconnection = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("observingStudentScreen"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_observingStudentScreen = objc_msgSend(v23, "BOOLValue");

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
  -[CRKInstructor sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionIdentifier"));

  -[CRKInstructor userIdentifier](self, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userIdentifier"));

  -[CRKInstructor displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[CRKInstructor courseName](self, "courseName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("courseName"));

  -[CRKInstructor imageData](self, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("imageData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("disallowsClassroomAirDropOverLocalNetwork"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor allowsStudentInitiatedDisconnection](self, "allowsStudentInitiatedDisconnection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("allowsStudentInitiatedDisconnection"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKInstructor isObservingStudentScreen](self, "isObservingStudentScreen"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("observingStudentScreen"));

}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)courseName
{
  return self->_courseName;
}

- (void)setCourseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (BOOL)disallowsClassroomAirDropOverLocalNetwork
{
  return self->_disallowsClassroomAirDropOverLocalNetwork;
}

- (void)setDisallowsClassroomAirDropOverLocalNetwork:(BOOL)a3
{
  self->_disallowsClassroomAirDropOverLocalNetwork = a3;
}

- (BOOL)allowsStudentInitiatedDisconnection
{
  return self->_allowsStudentInitiatedDisconnection;
}

- (void)setAllowsStudentInitiatedDisconnection:(BOOL)a3
{
  self->_allowsStudentInitiatedDisconnection = a3;
}

- (BOOL)isObservingStudentScreen
{
  return self->_observingStudentScreen;
}

- (void)setObservingStudentScreen:(BOOL)a3
{
  self->_observingStudentScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_courseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
