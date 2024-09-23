@implementation HMDCameraClipSignificantEventBulletin

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 requestIdentifier:(id)a11 clipUUID:(id)a12 shouldShowProvideFeedbackButton:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HMDCameraClipSignificantEventBulletin *v31;
  HMDCameraClipSignificantEventBulletin *v32;
  uint64_t v33;
  NSString *requestIdentifier;
  uint64_t v35;
  NSSet *significantEvents;
  uint64_t v37;
  NSUUID *previewImageNotificationUUID;
  uint64_t v39;
  NSDictionary *userInfo;
  uint64_t v41;
  NSString *title;
  uint64_t v43;
  NSString *body;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSString *threadIdentifier;
  uint64_t v50;
  NSUUID *clipUUID;
  HMDCameraClipSignificantEventBulletin *v53;
  SEL v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  id v62;
  id v63;
  void *v64;
  id v66;
  void *v67;
  id v68;
  id v69;
  objc_super v70;

  v18 = a3;
  v19 = a4;
  v62 = a5;
  v66 = a5;
  v63 = a6;
  v20 = a6;
  obj = a7;
  v21 = a7;
  v22 = a8;
  v69 = a9;
  v68 = a10;
  v23 = a11;
  v24 = a12;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v25 = v69;
  if (!v69)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  v26 = v20;
  v27 = v23;
  v28 = v68;
  if (!v68)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v27)
  {
LABEL_19:
    v53 = (HMDCameraClipSignificantEventBulletin *)_HMFPreconditionFailure();
    return -[HMDCameraClipSignificantEventBulletin initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:clipUUID:shouldShowProvideFeedbackButton:](v53, v54, v55, v56, v57, v58, v59, v60, a9, a10, a11, (BOOL)a12);
  }
  v29 = v21;
  v64 = v26;
  v70.receiver = self;
  v70.super_class = (Class)HMDCameraClipSignificantEventBulletin;
  v30 = v24;
  v67 = v29;
  v31 = -[HMDCameraClipSignificantEventBulletin init](&v70, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_shouldShowProvideFeedbackButton = a13;
    v33 = objc_msgSend(v27, "copy");
    requestIdentifier = v32->_requestIdentifier;
    v32->_requestIdentifier = (NSString *)v33;

    objc_storeStrong((id *)&v32->_camera, obj);
    objc_storeStrong((id *)&v32->_home, a8);
    objc_storeStrong((id *)&v32->_service, a10);
    objc_storeStrong((id *)&v32->_accessory, a9);
    objc_storeStrong((id *)&v32->_previewImageFilePathURL, v62);
    v35 = objc_msgSend(v18, "copy");
    significantEvents = v32->_significantEvents;
    v32->_significantEvents = (NSSet *)v35;

    v37 = objc_msgSend(v19, "copy");
    previewImageNotificationUUID = v32->_previewImageNotificationUUID;
    v32->_previewImageNotificationUUID = (NSUUID *)v37;

    -[HMDCameraClipSignificantEventBulletin createUserInfoWithWithSignificantEvents:previewImageNotificationUUID:camera:home:accessory:recordingService:clipUUID:](v32, "createUserInfoWithWithSignificantEvents:previewImageNotificationUUID:camera:home:accessory:recordingService:clipUUID:", v18, v19, v67, v22, v69, v68, v30);
    v39 = objc_claimAutoreleasedReturnValue();
    userInfo = v32->_userInfo;
    v32->_userInfo = (NSDictionary *)v39;

    objc_msgSend(v22, "name");
    v41 = objc_claimAutoreleasedReturnValue();
    title = v32->_title;
    v32->_title = (NSString *)v41;

    objc_msgSend((id)objc_opt_class(), "localizedMessageForSignificantEvents:cameraAccessory:", v18, v69);
    v43 = objc_claimAutoreleasedReturnValue();
    body = v32->_body;
    v32->_body = (NSString *)v43;

    -[HMDCameraClipSignificantEventBulletin service](v32, "service");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contextSPIUniqueIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "UUIDString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "copy");
    threadIdentifier = v32->_threadIdentifier;
    v32->_threadIdentifier = (NSString *)v48;

    v28 = v68;
    v25 = v69;

    objc_storeStrong((id *)&v32->_dateOfOccurrence, v63);
    v50 = objc_msgSend(v30, "copy");
    clipUUID = v32->_clipUUID;
    v32->_clipUUID = (NSUUID *)v50;

  }
  return v32;
}

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 previewImageFilePathURL:(id)a5 dateOfOccurrence:(id)a6 camera:(id)a7 home:(id)a8 accessory:(id)a9 recordingService:(id)a10 clipUUID:(id)a11 shouldShowProvideFeedbackButton:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  HMDCameraClipSignificantEventBulletin *v31;

  HIDWORD(v29) = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  objc_msgSend(v18, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a12;
  v31 = -[HMDCameraClipSignificantEventBulletin initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:requestIdentifier:clipUUID:shouldShowProvideFeedbackButton:](self, "initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:requestIdentifier:clipUUID:shouldShowProvideFeedbackButton:", v26, v25, v24, v23, v22, v21, v20, v19, v27, v18, v29);

  return v31;
}

- (HMDCameraClipSignificantEventBulletin)initWithSignificantEvent:(id)a3 previewImageFilePathURL:(id)a4 dateOfOccurrence:(id)a5 camera:(id)a6 home:(id)a7 accessory:(id)a8 recordingService:(id)a9 shouldShowProvideFeedbackButton:(BOOL)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraClipSignificantEventBulletin *v27;
  uint64_t v29;
  void *v30;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v16, "setWithObject:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a10;
  v27 = -[HMDCameraClipSignificantEventBulletin initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:requestIdentifier:clipUUID:shouldShowProvideFeedbackButton:](self, "initWithSignificantEvents:previewImageNotificationUUID:previewImageFilePathURL:dateOfOccurrence:camera:home:accessory:recordingService:requestIdentifier:clipUUID:shouldShowProvideFeedbackButton:", v30, v24, v22, v21, v20, v19, v18, v17, v26, 0, v29);

  return v27;
}

- (id)createUserInfoWithWithSignificantEvents:(id)a3 previewImageNotificationUUID:(id)a4 camera:(id)a5 home:(id)a6 accessory:(id)a7 recordingService:(id)a8 clipUUID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[9];
  _QWORD v44[11];

  v44[9] = *MEMORY[0x1E0C80C00];
  v42 = a9;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  objc_msgSend(a5, "contextSPIUniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "contextSPIUniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "actionURLForHomeUUID:cameraUUID:", v23, v21);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_map:", &__block_literal_global_48_158100);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v19, "na_any:", &__block_literal_global_49_158101);
  v26 = *MEMORY[0x1E0CB8368];
  v43[0] = *MEMORY[0x1E0CB8370];
  v43[1] = v26;
  v44[0] = v41;
  v44[1] = v21;
  v43[2] = *MEMORY[0x1E0CB8360];
  objc_msgSend(v18, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = *MEMORY[0x1E0CB8388];
  v44[2] = v27;
  v44[3] = v23;
  v29 = *MEMORY[0x1E0CB9FA0];
  v43[3] = v28;
  v43[4] = v29;
  objc_msgSend(v40, "absoluteString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v30;
  v43[5] = CFSTR("service");
  objc_msgSend(v15, "contextID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v44[5] = v31;
  v43[6] = CFSTR("home");
  objc_msgSend(v17, "contextID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v44[6] = v32;
  v43[7] = CFSTR("accessory");
  objc_msgSend(v16, "contextID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v44[7] = v33;
  v43[8] = CFSTR("HMDBulletinContextDidDetectedPerson");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  objc_msgSend(v42, "UUIDString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0CB8358]);
  v38 = (void *)objc_msgSend(v36, "copy");

  return v38;
}

- (NSSet)significantEvents
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)previewImageNotificationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)previewImageFilePathURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCameraProfile)camera
{
  return (HMDCameraProfile *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 64, 1);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)shouldShowProvideFeedbackButton
{
  return self->_shouldShowProvideFeedbackButton;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)requestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_previewImageFilePathURL, 0);
  objc_storeStrong((id *)&self->_previewImageNotificationUUID, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
}

BOOL __158__HMDCameraClipSignificantEventBulletin_createUserInfoWithWithSignificantEvents_previewImageNotificationUUID_camera_home_accessory_recordingService_clipUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason") == 2;
}

id __158__HMDCameraClipSignificantEventBulletin_createUserInfoWithWithSignificantEvents_previewImageNotificationUUID_camera_home_accessory_recordingService_clipUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (unint64_t)effectiveReasonForSignificantEvent:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "confidenceLevel") == 100)
    v4 = objc_msgSend(v3, "reason");
  else
    v4 = 1;

  return v4;
}

+ (id)localizedMessageForSignificantEvents:(id)a3 cameraAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  id v47;
  __CFString *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  __CFString *v52;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[5];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke;
  v67[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v67[4] = a1;
  objc_msgSend(v6, "na_filter:", v67);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_map:", &__block_literal_global_158132);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v11;
  v58 = v10;
  if (objc_msgSend(v11, "count"))
  {
    v55 = v6;
    v12 = v7;
    objc_msgSend(v7, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "personSettingsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v9;
    v65[1] = 3221225472;
    v65[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3;
    v65[3] = &unk_1E89BBA90;
    v54 = v15;
    v66 = v54;
    objc_msgSend(v16, "sortedArrayUsingComparator:", v65);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v10, "count");
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (v18 == 1)
    {
      HMDLocalizedStringForKey(CFSTR("PERSON_FAMILIAR"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      objc_msgSend(v17, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), &v64, v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = v64;

      if (!v23)
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("PERSON_FAMILIAR");
        v7 = v12;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = v17;
          HMFGetLogIdentifier();
          v28 = v25;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v69 = v29;
          v70 = 2112;
          v71 = CFSTR("PERSON_FAMILIAR");
          v72 = 2112;
          v73 = CFSTR("%@");
          v74 = 2112;
          v75 = v24;
LABEL_15:
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          v25 = v28;
LABEL_17:
          v6 = v55;

          objc_autoreleasePoolPop(v25);
          v34 = 0;
          goto LABEL_18;
        }
        goto LABEL_16;
      }
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("PERSON_FAMILIAR_MULTIPLE"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend(v17, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@"), &v63, v33);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = v63;

      if (!v23)
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("PERSON_FAMILIAR_MULTIPLE");
        v7 = v12;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = v17;
          HMFGetLogIdentifier();
          v28 = v25;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v69 = v29;
          v70 = 2112;
          v71 = CFSTR("PERSON_FAMILIAR_MULTIPLE");
          v72 = 2112;
          v73 = CFSTR("%@");
          v74 = 2112;
          v75 = v24;
          goto LABEL_15;
        }
LABEL_16:
        v27 = v17;
        goto LABEL_17;
      }
    }
    v27 = v17;
    v34 = v23;
    v7 = v12;
    v6 = v55;
LABEL_18:
    v9 = MEMORY[0x1E0C809B0];
    v36 = v23;

    objc_msgSend(v8, "addObject:", v36);
    goto LABEL_19;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    v30 = CFSTR("PERSON_UNFAMILIAR");
  }
  else
  {
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
      goto LABEL_19;
    v30 = CFSTR("PERSON_UNFAMILIAR_MULTIPLE");
  }
  HMDLocalizedStringForKey(v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v35);

LABEL_19:
  v62[0] = v9;
  v62[1] = 3221225472;
  v62[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_13;
  v62[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v62[4] = a1;
  if (objc_msgSend(v6, "na_any:", v62))
  {
    HMDLocalizedStringForKey(CFSTR("ANIMAL"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v37);

  }
  v61[0] = v9;
  v61[1] = 3221225472;
  v61[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2_16;
  v61[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v61[4] = a1;
  if (objc_msgSend(v6, "na_any:", v61))
  {
    HMDLocalizedStringForKey(CFSTR("VEHICLE"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v38);

  }
  v60[0] = v9;
  v60[1] = 3221225472;
  v60[2] = __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3_19;
  v60[3] = &__block_descriptor_40_e34_B16__0__HMCameraSignificantEvent_8l;
  v60[4] = a1;
  if (objc_msgSend(v6, "na_any:", v60))
  {
    HMDLocalizedStringForKey(CFSTR("PACKAGE"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v39);

  }
  if (!objc_msgSend(v8, "count"))
  {
    HMDLocalizedStringForKey(CFSTR("MOTION"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v40);

  }
  +[HMDBulletinCategory localizedStringForItems:](HMDBulletinCategory, "localizedStringForItems:", v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v7, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v43, CFSTR("%@ %@"), &v59, v44, v41);
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v46 = v7;
  v47 = v59;

  v48 = v45;
  if (!v45)
  {
    v49 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = v6;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v69 = v51;
      v70 = 2112;
      v71 = CFSTR("CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE");
      v72 = 2112;
      v73 = CFSTR("%@ %@");
      v74 = 2112;
      v75 = v47;
      _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      v6 = v56;
    }

    objc_autoreleasePoolPop(v49);
    v48 = CFSTR("CAMERA_RECORDING_SIGNIFICANT_EVENT_DETECTED_MESSAGE");
  }
  v52 = v48;

  return v52;
}

+ (id)actionURLForHomeUUID:(id)a3 cameraUUID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CBA378];
  v6 = a4;
  objc_msgSend(v5, "tupleWithQueryType:uuidString:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA378], "tupleWithQueryType:uuidString:", 5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  generateURLForHomeKitObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveReasonForSignificantEvent:", a2) == 2;
}

uint64_t __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "areClassificationNotificationsEnabledForPersonUUID:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "areClassificationNotificationsEnabledForPersonUUID:", v11);

  if (v9 == (_DWORD)v10)
  {
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "localizedCaseInsensitiveCompare:", v14);

  }
  else if (v9)
  {
    v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveReasonForSignificantEvent:", a2) == 3;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2_16(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveReasonForSignificantEvent:", a2) == 4;
}

BOOL __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_3_19(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveReasonForSignificantEvent:", a2) == 5;
}

id __94__HMDCameraClipSignificantEventBulletin_localizedMessageForSignificantEvents_cameraAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "faceClassification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
