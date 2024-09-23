@implementation HFSymptomFixManagerItem

- (HFSymptomFixManagerItem)initWithSymptom:(id)a3 fixSession:(id)a4 accessory:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFSymptomFixManagerItem *v12;
  HFSymptomFixManagerItem *v13;
  uint64_t v14;
  NSUUID *identifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFSymptomFixManagerItem;
  v12 = -[HFSymptomFixManagerItem init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_symptom, a3);
    objc_storeStrong((id *)&v13->_fixSession, a4);
    objc_storeStrong((id *)&v13->_accessory, a5);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSymptomFixManagerItem symptom](self, "symptom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("symptom"));

  -[HFSymptomFixManagerItem fixSession](self, "fixSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("fixSession"));

  -[HFSymptomFixManagerItem accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("accessory"));

  -[HFSymptomFixManagerItem identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("identifier"));

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (HMSymptomFixSession)fixSession
{
  return self->_fixSession;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_fixSession, 0);
  objc_storeStrong((id *)&self->_symptom, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
