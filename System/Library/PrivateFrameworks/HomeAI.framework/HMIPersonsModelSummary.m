@implementation HMIPersonsModelSummary

- (HMIPersonsModelSummary)initWithSourceUUID:(id)a3 externalLibrary:(BOOL)a4 faceCountsByPerson:(id)a5
{
  id v9;
  id v10;
  HMIPersonsModelSummary *v11;
  HMIPersonsModelSummary *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMIPersonsModelSummary;
  v11 = -[HMIPersonsModelSummary init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUUID, a3);
    v12->_externalLibrary = a4;
    objc_storeStrong((id *)&v12->_faceCountsByPerson, a5);
  }

  return v12;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isExternalLibrary
{
  return self->_externalLibrary;
}

- (NSDictionary)faceCountsByPerson
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCountsByPerson, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
