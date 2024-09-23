@implementation ENUserAuthorization

- (ENUserAuthorization)initWithIdentifier:(id)a3
{
  id v4;
  ENUserAuthorization *v5;
  ENUserAuthorization *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENUserAuthorization;
  v5 = -[ENUserAuthorization init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENUserAuthorization setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const char *v5;
  id v6;
  id v7;
  unint64_t v8;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  id v22;
  unsigned int v23;
  const char *v24;
  id v25;
  void *v26;
  id v27;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  void *v38;
  id v39;

  NSAppendPrintF_safe();
  v39 = 0;
  -[ENUserAuthorization identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v3 = v39;

  v4 = -[ENUserAuthorization userAuthorization](self, "userAuthorization", v29);
  if (v4 > 2)
    v5 = "?";
  else
    v5 = (&off_24C38BAA8)[v4];
  v30 = v5;
  NSAppendPrintF_safe();
  v6 = v3;

  -[ENUserAuthorization expirationDate](self, "expirationDate", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v7 = v6;

  v8 = -[ENUserAuthorization expirationStatus](self, "expirationStatus", v31);
  if (v8 > 2)
    v9 = "?";
  else
    v9 = (&off_24C38BAC0)[v8];
  v32 = v9;
  NSAppendPrintF_safe();
  v10 = v7;

  -[ENUserAuthorization testDateToday](self, "testDateToday", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ENUserAuthorization testDateToday](self, "testDateToday");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v12 = v10;

    v10 = v12;
  }
  -[ENUserAuthorization symptomOnsetDate](self, "symptomOnsetDate", v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ENUserAuthorization symptomOnsetDate](self, "symptomOnsetDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v14 = v10;

    v10 = v14;
  }
  -[ENUserAuthorization didUserTravel](self, "didUserTravel", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ENUserAuthorization didUserTravel](self, "didUserTravel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = "yes";
    else
      v17 = "no";
    v35 = v17;
    NSAppendPrintF_safe();
    v18 = v10;

    v10 = v18;
  }
  -[ENUserAuthorization isUserVaccinated](self, "isUserVaccinated", v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ENUserAuthorization isUserVaccinated](self, "isUserVaccinated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "BOOLValue"))
      v21 = "yes";
    else
      v21 = "no";
    v36 = v21;
    NSAppendPrintF_safe();
    v22 = v10;

    v10 = v22;
  }
  if (-[ENUserAuthorization reportType](self, "reportType", v36))
  {
    v23 = -[ENUserAuthorization reportType](self, "reportType");
    if (v23 > 5)
      v24 = "?";
    else
      v24 = (&off_24C38BAD8)[v23];
    v37 = v24;
    NSAppendPrintF_safe();
    v25 = v10;

    v10 = v25;
  }
  -[ENUserAuthorization verificationCode](self, "verificationCode", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ENUserAuthorization verificationCode](self, "verificationCode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v27 = v10;

    v10 = v27;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v16;

  v16 = a3;
  -[ENUserAuthorization identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("UserAuthorizationKeyIdentifier"));

  objc_msgSend(v16, "encodeInteger:forKey:", -[ENUserAuthorization userAuthorization](self, "userAuthorization"), CFSTR("UserAuthorizationKeyAuthorization"));
  -[ENUserAuthorization lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("UserAuthorizationKeyAuthorizationTimestamp"));
  -[ENUserAuthorization expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("UserAuthorizationKeyExpiration"));

  -[ENUserAuthorization testDateToday](self, "testDateToday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ENUserAuthorization testDateToday](self, "testDateToday");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("UserAuthorizationKeyTestDateToday"));

  }
  -[ENUserAuthorization symptomOnsetDate](self, "symptomOnsetDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ENUserAuthorization symptomOnsetDate](self, "symptomOnsetDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("PreArmSymptomOnsetDate"));

  }
  -[ENUserAuthorization didUserTravel](self, "didUserTravel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ENUserAuthorization didUserTravel](self, "didUserTravel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("PreArmDidUserTravel"));

  }
  -[ENUserAuthorization isUserVaccinated](self, "isUserVaccinated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ENUserAuthorization isUserVaccinated](self, "isUserVaccinated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("PreArmIsUserVaccinated"));

  }
  if (-[ENUserAuthorization reportType](self, "reportType"))
    objc_msgSend(v16, "encodeInt64:forKey:", -[ENUserAuthorization reportType](self, "reportType"), CFSTR("PreArmReportType"));
  -[ENUserAuthorization verificationCode](self, "verificationCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ENUserAuthorization verificationCode](self, "verificationCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("PreArmVerificationCode"));

  }
}

- (ENUserAuthorization)initWithCoder:(id)a3
{
  id v4;
  ENUserAuthorization *v5;
  void *v6;
  ENUserAuthorization *v7;
  double v8;
  uint64_t v9;
  NSDate *expirationDate;
  uint64_t v11;
  NSDate *testDateToday;
  double v13;
  uint64_t v14;
  NSDate *symptomOnsetDate;
  uint64_t v16;
  NSNumber *didUserTravel;
  uint64_t v18;
  NSNumber *isUserVaccinated;
  unint64_t v20;
  uint64_t v21;
  NSString *verificationCode;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENUserAuthorization;
  v5 = -[ENUserAuthorization init](&v24, sel_init);
  if (!v5)
  {
LABEL_18:
    v7 = v5;
    goto LABEL_19;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserAuthorizationKeyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUserAuthorization setIdentifier:](v5, "setIdentifier:", v6);

  -[ENUserAuthorization identifier](v5, "identifier");
  v7 = (ENUserAuthorization *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UserAuthorizationKeyExpiration"));
    if (v8 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:");
      v9 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v9;

    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UserAuthorizationKeyTestDateToday")) & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserAuthorizationKeyTestDateToday"));
      v11 = objc_claimAutoreleasedReturnValue();
      testDateToday = v5->_testDateToday;
      v5->_testDateToday = (NSDate *)v11;

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UserAuthorizationKeyAuthorizationTimestamp"));
    v5->_lastUpdatedTimestamp = v13;
    -[ENUserAuthorization setUserAuthorization:](v5, "setUserAuthorization:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UserAuthorizationKeyAuthorization")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PreArmSymptomOnsetDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreArmSymptomOnsetDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      symptomOnsetDate = v5->_symptomOnsetDate;
      v5->_symptomOnsetDate = (NSDate *)v14;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PreArmDidUserTravel")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreArmDidUserTravel"));
      v16 = objc_claimAutoreleasedReturnValue();
      didUserTravel = v5->_didUserTravel;
      v5->_didUserTravel = (NSNumber *)v16;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PreArmIsUserVaccinated")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreArmIsUserVaccinated"));
      v18 = objc_claimAutoreleasedReturnValue();
      isUserVaccinated = v5->_isUserVaccinated;
      v5->_isUserVaccinated = (NSNumber *)v18;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PreArmReportType")))
    {
      v20 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PreArmReportType"));
      if (v20 <= 5)
        v5->_reportType = v20;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PreArmVerificationCode")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreArmVerificationCode"));
      v21 = objc_claimAutoreleasedReturnValue();
      verificationCode = v5->_verificationCode;
      v5->_verificationCode = (NSString *)v21;

    }
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (int64_t)userAuthorization
{
  uint64_t v4;
  void *v5;

  if (-[ENUserAuthorization expirationStatus](self, "expirationStatus") == 1)
  {
    if (gLogCategory_ENUserAuthorization <= 30
      && (gLogCategory_ENUserAuthorization != -1 || _LogCategory_Initialize()))
    {
      -[ENUserAuthorization identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      -[ENUserAuthorization setUserAuthorization:](self, "setUserAuthorization:", 2, v5);
    }
    else
    {
      -[ENUserAuthorization setUserAuthorization:](self, "setUserAuthorization:", 2, v4);
    }
  }
  return self->_authorization;
}

- (void)setUserAuthorization:(int64_t)a3
{
  double v4;
  id v5;

  self->_authorization = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  self->_lastUpdatedTimestamp = v4;

}

- (int64_t)expirationStatus
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  double v10;

  -[ENUserAuthorization expirationDate](self, "expirationDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[ENUserAuthorization testDateToday](self, "testDateToday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  objc_msgSend(v9, "timeIntervalSince1970");
  if (v10 - self->_lastUpdatedTimestamp <= 0.0)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v9, "compare:", v4) == 1)
  {
    v8 = 1;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (void)setUserAuthorization:(int64_t)a3 withExpiration:(id)a4
{
  id v6;

  v6 = a4;
  -[ENUserAuthorization setUserAuthorization:](self, "setUserAuthorization:", a3);
  -[ENUserAuthorization setExpirationDate:](self, "setExpirationDate:", v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (double)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (NSDate)testDateToday
{
  return self->_testDateToday;
}

- (void)setTestDateToday:(id)a3
{
  objc_storeStrong((id *)&self->_testDateToday, a3);
}

- (NSNumber)didUserTravel
{
  return self->_didUserTravel;
}

- (void)setDidUserTravel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)isUserVaccinated
{
  return self->_isUserVaccinated;
}

- (void)setIsUserVaccinated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)reportType
{
  return self->_reportType;
}

- (void)setReportType:(unsigned int)a3
{
  self->_reportType = a3;
}

- (NSDate)symptomOnsetDate
{
  return self->_symptomOnsetDate;
}

- (void)setSymptomOnsetDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_symptomOnsetDate, 0);
  objc_storeStrong((id *)&self->_isUserVaccinated, 0);
  objc_storeStrong((id *)&self->_didUserTravel, 0);
  objc_storeStrong((id *)&self->_testDateToday, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
