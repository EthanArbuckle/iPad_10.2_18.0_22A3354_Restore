@implementation HFDemoModeFaceRecognitionRecentsData

- (HFDemoModeFaceRecognitionRecentsData)initWithPerson:(id)a3 faceCrop:(id)a4
{
  id v7;
  id v8;
  HFDemoModeFaceRecognitionRecentsData *v9;
  HFDemoModeFaceRecognitionRecentsData *v10;
  uint64_t v11;
  NSUUID *uuid;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFDemoModeFaceRecognitionRecentsData;
  v9 = -[HFDemoModeFaceRecognitionRecentsData init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_faceCrop, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

  }
  return v10;
}

- (HMPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (HMFaceCrop)faceCrop
{
  return self->_faceCrop;
}

- (void)setFaceCrop:(id)a3
{
  objc_storeStrong((id *)&self->_faceCrop, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
