@implementation HKHealthWrapMessageConfiguration

- (HKHealthWrapMessageConfiguration)initWithChannel:(id)a3 payloadType:(id)a4 certificate:(__SecCertificate *)a5
{
  id v9;
  id v10;
  void *v11;
  HKHealthWrapMessageConfiguration *v12;
  uint64_t v13;
  NSString *channel;
  uint64_t v15;
  NSString *payloadType;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payloadType != nil"));

    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("channel != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)HKHealthWrapMessageConfiguration;
  v12 = -[HKHealthWrapMessageConfiguration init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    channel = v12->_channel;
    v12->_channel = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    payloadType = v12->_payloadType;
    v12->_payloadType = (NSString *)v15;

    CFRetain(a5);
    v12->_certificate = a5;
  }

  return v12;
}

- (HKHealthWrapMessageConfiguration)initWithSubjectUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 certificate:(__SecCertificate *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKHealthWrapMessageConfiguration *v17;
  uint64_t v18;
  NSUUID *subjectUUID;
  uint64_t v20;
  NSUUID *studyUUID;
  void *v23;
  void *v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subjectUUID != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studyUUID != nil"));

LABEL_3:
  v17 = -[HKHealthWrapMessageConfiguration initWithChannel:payloadType:certificate:](self, "initWithChannel:payloadType:certificate:", v15, v16, a7);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    subjectUUID = v17->_subjectUUID;
    v17->_subjectUUID = (NSUUID *)v18;

    v20 = objc_msgSend(v14, "copy");
    studyUUID = v17->_studyUUID;
    v17->_studyUUID = (NSUUID *)v20;

  }
  return v17;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  objc_super v4;

  certificate = self->_certificate;
  if (certificate)
    CFRelease(certificate);
  v4.receiver = self;
  v4.super_class = (Class)HKHealthWrapMessageConfiguration;
  -[HKHealthWrapMessageConfiguration dealloc](&v4, sel_dealloc);
}

- (NSUUID)subjectUUID
{
  return self->_subjectUUID;
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)disableCompression
{
  return self->_disableCompression;
}

- (void)setDisableCompression:(BOOL)a3
{
  self->_disableCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_subjectUUID, 0);
}

@end
