@implementation HMDCameraAccessModeChangedBulletin

- (HMDCameraAccessModeChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDCameraAccessModeChangedBulletin *v20;
  HMDCameraAccessModeChangedBulletin *v21;
  HMDCameraAccessModeChangedBulletin *v23;
  SEL v24;
  unint64_t v25;
  id v26;
  id v27;
  int64_t v28;
  id v29;
  id obj;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_13:
    v23 = (HMDCameraAccessModeChangedBulletin *)_HMFPreconditionFailure();
    return -[HMDCameraAccessModeChangedBulletin initWithAccessMode:camera:home:changeReason:changeDate:](v23, v24, v25, v26, v27, v28, v29);
  }
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraAccessModeChangedBulletin;
  v20 = -[HMDCameraAccessModeChangedBulletin init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_title, a3);
    objc_storeStrong((id *)&v21->_body, a4);
    objc_storeStrong((id *)&v21->_threadIdentifier, a5);
    objc_storeStrong((id *)&v21->_dateOfOccurrence, a6);
    objc_storeStrong((id *)&v21->_userInfo, obj);
    v21->_timeSensitive = a8;
  }

  return v21;
}

- (HMDCameraAccessModeChangedBulletin)initWithAccessMode:(unint64_t)a3 camera:(id)a4 home:(id)a5 changeReason:(int64_t)a6 changeDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraAccessModeChangedBulletin *v26;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  objc_msgSend((id)objc_opt_class(), "localizedMessageForCameraAccessModeChange:changeReason:camera:", a3, a6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v32[0] = *MEMORY[0x24BDD5350];
    objc_msgSend(v12, "contextSPIUniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    v32[1] = *MEMORY[0x24BDD5370];
    objc_msgSend(v13, "contextSPIUniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v31 = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v18;
    v32[2] = CFSTR("home");
    objc_msgSend(v13, "contextID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v19;
    v32[3] = CFSTR("accessory");
    objc_msgSend(v12, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contextID");
    v21 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v21;
    objc_msgSend(v13, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMDCameraAccessModeChangedBulletin initWithTitle:body:threadIdentifier:dateOfOccurrence:userInfo:isTimeSensitive:](self, "initWithTitle:body:threadIdentifier:dateOfOccurrence:userInfo:isTimeSensitive:", v23, v16, v25, v21, v28, v31 == 2);

    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Title"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin body](self, "body");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Body"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin threadIdentifier](self, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Thread ID"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Date"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin userInfo](self, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("User Info"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraAccessModeChangedBulletin isTimeSensitive](self, "isTimeSensitive");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Time Sensitive"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isTimeSensitive
{
  return self->_timeSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)localizedMessageForCameraAccessModeChange:(unint64_t)a3 changeReason:(int64_t)a4 camera:(id)a5
{
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a5;
  -[__CFString hapAccessory](v8, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3 <= 3)
    {
      HMDLocalizedStringForKey(off_24E79A4C8[a3]);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        if (a4 == 1)
        {
          v12 = CFSTR("CAMERA_ACCESS_MODE_CHANGE_REASON_OCCUPIED");
        }
        else
        {
          if (a4 != 2)
            goto LABEL_22;
          v12 = CFSTR("CAMERA_ACCESS_MODE_CHANGE_REASON_UNOCCUPIED");
        }
        HMDLocalizedStringForKey(v12);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (__CFString *)v22;
          v24 = (void *)MEMORY[0x24BDD17C8];
          HMDLocalizedStringForKey(CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v9, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@ %@ %@"), &v42, v26, v11, v23);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v28 = (__CFString *)v42;

          v29 = v27;
          if (!v27)
          {
            v30 = (void *)MEMORY[0x227676638]();
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = v30;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v44 = v32;
              v45 = 2112;
              v46 = CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON");
              v47 = 2112;
              v48 = CFSTR("%@ %@ %@");
              v49 = 2112;
              v50 = v28;
              _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

              v30 = v40;
            }

            objc_autoreleasePoolPop(v30);
            v29 = CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON");
          }
          v20 = v29;

LABEL_27:
          goto LABEL_14;
        }
LABEL_22:
        v33 = (void *)MEMORY[0x24BDD17C8];
        HMDLocalizedStringForKey(CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        objc_msgSend(v9, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v34, CFSTR("%@ %@"), &v41, v35, v11);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = (__CFString *)v41;

        v36 = v28;
        if (!v28)
        {
          v37 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v44 = v39;
            v45 = 2112;
            v46 = CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION");
            v47 = 2112;
            v48 = CFSTR("%@ %@");
            v49 = 2112;
            v50 = v23;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v37);
          v36 = CFSTR("CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION");
        }
        v20 = v36;
        goto LABEL_27;
      }
    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v16;
      v45 = 2048;
      v46 = (const __CFString *)a3;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown accessMode %lu, not posting notification", buf, 0x16u);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v19;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference was nil on camera: %@", buf, 0x16u);

    }
  }
  objc_autoreleasePoolPop(v13);
  v20 = 0;
LABEL_14:

  return v20;
}

@end
