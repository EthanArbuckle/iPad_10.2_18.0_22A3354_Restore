@implementation AISSymptom

- (AISSymptom)initWithAltDSID:(id)a3 priority:(unsigned __int8)a4 problemFlag:(unint64_t)a5 errorInfo:(id)a6
{
  id v10;
  id v11;
  AISSymptom *v12;
  uint64_t v13;
  NSString *altDSID;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AISSymptom;
  v12 = -[AISSymptom init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    altDSID = v12->_altDSID;
    v12->_altDSID = (NSString *)v13;

    v12->_priority = a4;
    v12->_problemFlag = a5;
    objc_storeStrong(&v12->_errorInfo, a6);
  }

  return v12;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unint64_t)problemFlag
{
  return self->_problemFlag;
}

- (id)errorInfo
{
  return self->_errorInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorInfo, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
