@implementation AISRepairReport

- (AISRepairReport)initWithAltDSID:(id)a3 userProfileIdentifier:(id)a4 repairedSymptoms:(id)a5 symptomReport:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AISRepairReport *v14;
  uint64_t v15;
  NSString *altDSID;
  uint64_t v17;
  NSString *userProfileIdentifier;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AISRepairReport;
  v14 = -[AISRepairReport init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    altDSID = v14->_altDSID;
    v14->_altDSID = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    userProfileIdentifier = v14->_userProfileIdentifier;
    v14->_userProfileIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_repairedSymptoms, a5);
    objc_storeStrong((id *)&v14->_symptomReport, a6);
  }

  return v14;
}

- (AISRepairReport)initWithAltDSID:(id)a3 repairedSymptoms:(id)a4 symptomReport:(id)a5
{
  return -[AISRepairReport initWithAltDSID:userProfileIdentifier:repairedSymptoms:symptomReport:](self, "initWithAltDSID:userProfileIdentifier:repairedSymptoms:symptomReport:", a3, 0, a4, a5);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (NSArray)repairedSymptoms
{
  return self->_repairedSymptoms;
}

- (AISSymptomReport)symptomReport
{
  return self->_symptomReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptomReport, 0);
  objc_storeStrong((id *)&self->_repairedSymptoms, 0);
  objc_storeStrong((id *)&self->_userProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
