@implementation HMDCharacteristicResponseNotificationContext

- (HMDCharacteristicResponseNotificationContext)initWithRequestIdentifier:(id)a3 responses:(id)a4 pendingMultiPartResponses:(BOOL)a5
{
  id v8;
  id v9;
  HMDCharacteristicResponseNotificationContext *v10;
  uint64_t v11;
  NSUUID *requestIdentifier;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  char v47;
  char v48;
  void *v49;
  HMDCharacteristicResponseNotificationContext *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDCharacteristicResponseNotificationContext *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  BOOL v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSSet *responseCharacteristics;
  uint64_t v79;
  NSSet *changedCharacteristics;
  uint64_t v81;
  NSSet *previouslyNilChangedCharacteristics;
  uint64_t v83;
  NSDictionary *notificationPayloadByAccessoryUUID;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  HMDCharacteristicResponseNotificationContext *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id obj;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  const __CFString *v111;
  id v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  const __CFString *v119;
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v110.receiver = self;
  v110.super_class = (Class)HMDCharacteristicResponseNotificationContext;
  v10 = -[HMDCharacteristicResponseNotificationContext init](&v110, sel_init);
  if (v10)
  {
    v87 = v8;
    v11 = objc_msgSend(v8, "copy");
    requestIdentifier = v10->_requestIdentifier;
    v10->_requestIdentifier = (NSUUID *)v11;

    v91 = v10;
    v10->_pendingMultiPartResponses = a5;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v86 = v9;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    if (!v13)
      goto LABEL_67;
    v14 = v13;
    v15 = *(_QWORD *)v107;
    v89 = *MEMORY[0x24BDD5BD8];
    v97 = *(_QWORD *)v107;
    while (1)
    {
      v16 = 0;
      v99 = v14;
      do
      {
        if (*(_QWORD *)v107 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v16);
        objc_msgSend(v17, "request", v86);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "characteristic");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "service");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accessory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v19)
          v23 = v20 == 0;
        else
          v23 = 1;
        if (!v23 && v21 != 0)
        {
          objc_msgSend(v21, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v101, "hmf_mutableDictionaryForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "setObject:forKeyedSubscript:", v27, v26);
          }
          v103 = (void *)v26;
          objc_msgSend(v20, "instanceID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "hmf_mutableDictionaryForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "instanceID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, v32);

          }
          objc_msgSend(v98, "addObject:", v19);
          objc_msgSend(v17, "error");
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v104 = v22;
          v102 = v27;
          if (v33
            || (objc_msgSend(v17, "value"), v39 = (void *)objc_claimAutoreleasedReturnValue(), v39, !v39)
            && (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v89, 4, 0),
                (v33 = (id)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v34 = v30;
            v105 = 0;
            objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v105);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v105;
            if (v35)
            {
              v119 = CFSTR("kCharacteristicErrorDataKey");
              v120 = v35;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)objc_msgSend(v37, "mutableCopy");

            }
            else
            {
              v49 = (void *)MEMORY[0x227676638]();
              v50 = v91;
              HMFGetOSLogHandle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v96 = v49;
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v114 = v52;
                v115 = 2112;
                v116 = v33;
                v117 = 2112;
                v118 = v36;
                _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize error %@: %@", buf, 0x20u);

                v49 = v96;
              }

              objc_autoreleasePoolPop(v49);
              v38 = 0;
            }

            v53 = v103;
            v30 = v34;
          }
          else
          {
            objc_msgSend(v17, "value");
            v33 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "request");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isMemberOfClass:", objc_opt_class());

            if (v41)
            {
              v42 = v30;
              objc_msgSend(v19, "lastKnownValue");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "lastKnownValueUpdateTime");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "valueUpdatedTime");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v44, "compare:", v45) != 1 || v43 == 0;
              v47 = !v46;
              v95 = v47;
              if (v46)
              {

              }
              else
              {
                v48 = objc_msgSend(v43, "isEqual:", v33);

                if ((v48 & 1) != 0)
                {
                  v95 = 0;
                  goto LABEL_45;
                }
                v54 = (void *)MEMORY[0x227676638]();
                v55 = v91;
                HMFGetOSLogHandle();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v92 = v54;
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v114 = v57;
                  v115 = 2112;
                  v116 = v17;
                  v117 = 2112;
                  v118 = v43;
                  _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Updating notification context response to last known characteristic value %@ -> %@", buf, 0x20u);

                  v54 = v92;
                }

                objc_autoreleasePoolPop(v54);
                v44 = v33;
                v33 = v43;
              }

LABEL_45:
              v30 = v42;

              if (!v33)
              {
LABEL_46:
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v33 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v95 = 0;
              if (!v33)
                goto LABEL_46;
            }
            v111 = CFSTR("kCharacteristicValue");
            v112 = v33;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_msgSend(v58, "mutableCopy");

            objc_msgSend(v19, "lastKnownValueUpdateTime");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v59, CFSTR("kCharacteristicValueUpdateTime"));

            objc_msgSend(v19, "notificationContext");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v60, CFSTR("kCharacteristicNotificationContextKey"));

            objc_msgSend(v17, "stateNumber");
            v61 = objc_claimAutoreleasedReturnValue();
            if (v61)
            {
              v62 = (void *)v61;
              v93 = v30;
              objc_msgSend(v17, "stateNumber");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stateNumber");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = HAPCompareStateNumberWithRollover();

              if (v65 == 1)
              {
                objc_msgSend(v17, "stateNumber");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setStateNumber:", v66);

              }
              else
              {
                LOBYTE(v65) = 0;
              }
              v30 = v93;
            }
            else
            {
              LOBYTE(v65) = 0;
            }
            objc_msgSend(v19, "stateNumber");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v67, CFSTR("kCharacteristicValueUpdateStateNumberKey"));

            objc_msgSend(v17, "request");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "previousValue");
            v36 = (id)objc_claimAutoreleasedReturnValue();

            if (v36)
              v69 = v95;
            else
              v69 = 1;
            if ((v69 & 1) != 0
              || !+[HMDCharacteristic value:differentThan:](HMDCharacteristic, "value:differentThan:", v33, v36))
            {
              v72 = 0;
            }
            else
            {
              objc_msgSend(v19, "previousValue");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "lastKnownValue");
              v94 = v30;
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = +[HMDCharacteristic value:differentThan:](HMDCharacteristic, "value:differentThan:", v70, v71);

              v30 = v94;
            }
            v73 = v65 | v72;
            v74 = v90;
            v53 = v103;
            if ((v73 & 1) != 0 || !v36 && (v74 = v88, v33))
              objc_msgSend(v74, "addObject:", v19);
          }

          objc_msgSend(v19, "instanceID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringValue");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v76);

          v14 = v99;
          v15 = v97;
          v22 = v104;
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
      if (!v14)
      {
LABEL_67:

        v77 = objc_msgSend(v98, "copy");
        v10 = v91;
        responseCharacteristics = v91->_responseCharacteristics;
        v91->_responseCharacteristics = (NSSet *)v77;

        v79 = objc_msgSend(v90, "copy");
        changedCharacteristics = v91->_changedCharacteristics;
        v91->_changedCharacteristics = (NSSet *)v79;

        v81 = objc_msgSend(v88, "copy");
        previouslyNilChangedCharacteristics = v91->_previouslyNilChangedCharacteristics;
        v91->_previouslyNilChangedCharacteristics = (NSSet *)v81;

        v83 = objc_msgSend(v101, "copy");
        notificationPayloadByAccessoryUUID = v91->_notificationPayloadByAccessoryUUID;
        v91->_notificationPayloadByAccessoryUUID = (NSDictionary *)v83;

        v9 = v86;
        v8 = v87;
        break;
      }
    }
  }

  return v10;
}

- (id)notificationWithHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HMDCharacteristicResponseNotificationContext requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[HMDCharacteristicResponseNotificationContext notificationPayloadByAccessoryUUID](self, "notificationPayloadByAccessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kModifiedCharacteristicsForAccessoryKey"));

    -[HMDCharacteristicResponseNotificationContext requestIdentifier](self, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kModifiedCharacteristicsMessageIdentifierKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDCharacteristicResponseNotificationContext hasPendingMultiPartResponses](self, "hasPendingMultiPartResponses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("kMultiPartResponseKey"));

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("HMDAccessoryCharacteristicsResponseReceivedNotification"), v4, v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponseNotificationContext requestIdentifier](self, "requestIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Request Identifier"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponseNotificationContext hasPendingMultiPartResponses](self, "hasPendingMultiPartResponses");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Has Pending Multi Part Responses"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponseNotificationContext changedCharacteristics](self, "changedCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Changed Characteristics"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponseNotificationContext previouslyNilChangedCharacteristics](self, "previouslyNilChangedCharacteristics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Previously Nil Changed Characteristics"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponseNotificationContext notificationPayloadByAccessoryUUID](self, "notificationPayloadByAccessoryUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Notification Payload"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)changedCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)previouslyNilChangedCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)notificationPayloadByAccessoryUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)responseCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasPendingMultiPartResponses
{
  return self->_pendingMultiPartResponses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCharacteristics, 0);
  objc_storeStrong((id *)&self->_notificationPayloadByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_previouslyNilChangedCharacteristics, 0);
  objc_storeStrong((id *)&self->_changedCharacteristics, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

+ (id)responsePayloadForHome:(id)a3 changedAccessories:(id)a4 moreMessagesInMultipart:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("kModifiedCharacteristicsForAccessoryKey"));
  if (v7)
  {
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("kHomeUUID"));

  }
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("kMultiPartResponseKey"));
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

+ (id)notificationUpdateMessagePayloadForHome:(id)a3 notificationEnabled:(BOOL)a4 characteristics:(id)a5 characteristicsErrorsMap:(id)a6
{
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  _BOOL4 v51;
  void *v52;
  id v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v51 = a4;
  v71 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v8 = a5;
  v54 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v8;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v59;
    v52 = v9;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v59 != v56)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v11, "service", v50);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "instanceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (v17)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v65 = v21;
            v66 = 2112;
            v67 = v12;
            v68 = 2112;
            v69 = v11;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Missing required service (%@) properties for characteristic %@ - dropping the notification", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
        }
        else
        {
          v22 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v9, "objectForKeyedSubscript:", v16);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = MEMORY[0x24BDBD1B8];
          if (v23)
            v26 = v23;
          else
            v26 = MEMORY[0x24BDBD1B8];
          objc_msgSend(v22, "dictionaryWithDictionary:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v27, "objectForKeyedSubscript:", v13);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v29)
            v31 = v29;
          else
            v31 = v25;
          objc_msgSend(v28, "dictionaryWithDictionary:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", v11);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v34, 1, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v33;
            v37 = v35;
            v38 = CFSTR("kCharacteristicErrorDataKey");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v51);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("kCharacteristicNotificationEnableKey"));

            objc_msgSend(v11, "notificationEnabledTime");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v33;
            v37 = v35;
            v38 = CFSTR("kCharacteristicNotificationEnableTime");
          }
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v38);

          v40 = (void *)objc_msgSend(v33, "copy");
          objc_msgSend(v11, "instanceID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, v41);

          v42 = (void *)objc_msgSend(v32, "copy");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, v13);

          v43 = (void *)objc_msgSend(v27, "copy");
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v43, v16);

          v9 = v52;
        }

      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v57);
  }

  if (objc_msgSend(v9, "count"))
  {
    v62[0] = CFSTR("kModifiedNotificationsForAccessoryKey");
    v44 = (void *)objc_msgSend(v9, "copy");
    v62[1] = CFSTR("kHomeUUID");
    v63[0] = v44;
    v45 = v50;
    objc_msgSend(v50, "uuid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "UUIDString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v47;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = (void *)MEMORY[0x24BDBD1B8];
    v45 = v50;
  }

  return v48;
}

+ (id)updateMultipleCharacteristicReadWriteResponsePayload:(id)a3 withUnhandledRequests:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke;
      v22 = &unk_24E799278;
      v13 = v8;
      v23 = v13;
      v24 = v12;
      v14 = v12;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v19);
      v15 = (void *)objc_msgSend(v5, "mutableCopy", v19, v20, v21, v22);
      v16 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("kModifiedCharacteristicsForAccessoryKey"));

      v17 = (id)objc_msgSend(v15, "copy");
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v17 = v5;
    }

  }
  else
  {
    v17 = v5;
  }

  return v17;
}

void __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "hmf_dictionaryForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke_2;
  v15[3] = &unk_24E799250;
  v16 = v12;
  v17 = *(id *)(a1 + 40);
  v14 = v12;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);

  v13 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v7);

}

void __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v19 = v5;
  objc_msgSend(*(id *)(a1 + 32), "hmf_dictionaryForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = *(_QWORD *)(a1 + 40);
        v24 = CFSTR("kCharacteristicErrorDataKey");
        v25 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, v19);

}

@end
