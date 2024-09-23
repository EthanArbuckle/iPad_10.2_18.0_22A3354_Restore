@implementation ACActivityDescriptor

- (ACActivityDescriptor)initWithIdentifier:(id)a3 target:(id)a4 presentationOptions:(id)a5 isEphemeral:(BOOL)a6 isMomentary:(BOOL)a7 createdDate:(id)a8 descriptorData:(id)a9 contentType:(int64_t)a10 remoteDeviceIdentifier:(id)a11 localizedAppName:(id)a12 protectionClass:(int64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ACActivityDescriptor *v25;
  uint64_t v26;
  NSString *activityIdentifier;
  uint64_t v28;
  NSString *platterTargetBundleIdentifier;
  uint64_t v30;
  ACActivityPresentationOptions *presentationOptions;
  uint64_t v32;
  NSDate *createdDate;
  uint64_t v34;
  NSData *descriptorData;
  uint64_t v36;
  NSString *remoteDeviceIdentifier;
  uint64_t v38;
  NSString *localizedAppName;
  id v41;
  objc_super v42;

  v41 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)ACActivityDescriptor;
  v25 = -[ACActivityDescriptor init](&v42, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v41, "copy");
    activityIdentifier = v25->_activityIdentifier;
    v25->_activityIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    platterTargetBundleIdentifier = v25->_platterTargetBundleIdentifier;
    v25->_platterTargetBundleIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    presentationOptions = v25->_presentationOptions;
    v25->_presentationOptions = (ACActivityPresentationOptions *)v30;

    v25->_isEphemeral = a6;
    v25->_isMomentary = a7;
    v32 = objc_msgSend(v21, "copy");
    createdDate = v25->_createdDate;
    v25->_createdDate = (NSDate *)v32;

    v34 = objc_msgSend(v22, "copy");
    descriptorData = v25->_descriptorData;
    v25->_descriptorData = (NSData *)v34;

    v25->_contentType = a10;
    v36 = objc_msgSend(v23, "copy");
    remoteDeviceIdentifier = v25->_remoteDeviceIdentifier;
    v25->_remoteDeviceIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v24, "copy");
    localizedAppName = v25->_localizedAppName;
    v25->_localizedAppName = (NSString *)v38;

    v25->_protectionClass = a13;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  ACActivityDescriptor *v13;
  void *v15;
  ACActivityDescriptor *v16;

  v16 = [ACActivityDescriptor alloc];
  -[ACActivityDescriptor activityIdentifier](self, "activityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityDescriptor platterTargetBundleIdentifier](self, "platterTargetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityDescriptor presentationOptions](self, "presentationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACActivityDescriptor isEphemeral](self, "isEphemeral");
  v7 = -[ACActivityDescriptor isMomentary](self, "isMomentary");
  -[ACActivityDescriptor createdDate](self, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityDescriptor descriptorData](self, "descriptorData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACActivityDescriptor contentType](self, "contentType");
  -[ACActivityDescriptor remoteDeviceIdentifier](self, "remoteDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityDescriptor localizedAppName](self, "localizedAppName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ACActivityDescriptor initWithIdentifier:target:presentationOptions:isEphemeral:isMomentary:createdDate:descriptorData:contentType:remoteDeviceIdentifier:localizedAppName:protectionClass:](v16, "initWithIdentifier:target:presentationOptions:isEphemeral:isMomentary:createdDate:descriptorData:contentType:remoteDeviceIdentifier:localizedAppName:protectionClass:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12, -[ACActivityDescriptor protectionClass](self, "protectionClass"));

  return v13;
}

- (NSData)descriptorData
{
  return self->_descriptorData;
}

- (void)setDescriptorData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)platterTargetBundleIdentifier
{
  return self->_platterTargetBundleIdentifier;
}

- (void)setPlatterTargetBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ACActivityPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_presentationOptions, a3);
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_isEphemeral = a3;
}

- (BOOL)isMomentary
{
  return self->_isMomentary;
}

- (void)setIsMomentary:(BOOL)a3
{
  self->_isMomentary = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(int64_t)a3
{
  self->_protectionClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_platterTargetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorData, 0);
}

@end
