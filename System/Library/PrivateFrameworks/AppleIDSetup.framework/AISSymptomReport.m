@implementation AISSymptomReport

- (AISSymptomReport)initWithAltDSID:(id)a3 symptoms:(id)a4 combinedProblemFlags:(unint64_t)a5
{
  id v8;
  id v9;
  AISSymptomReport *v10;
  uint64_t v11;
  NSString *altDSID;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AISSymptomReport;
  v10 = -[AISSymptomReport init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    altDSID = v10->_altDSID;
    v10->_altDSID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_symptoms, a4);
    v10->_combinedProblemFlags = a5;
  }

  return v10;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSArray)symptoms
{
  return self->_symptoms;
}

- (unint64_t)combinedProblemFlags
{
  return self->_combinedProblemFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptoms, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
