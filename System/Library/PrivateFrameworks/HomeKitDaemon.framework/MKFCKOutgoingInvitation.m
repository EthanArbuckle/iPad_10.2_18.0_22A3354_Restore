@implementation MKFCKOutgoingInvitation

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  MKFCKOutgoingInvitation *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  __objc2_class *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  MKFCKOutgoingInvitation *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!-[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, v8))
    goto LABEL_17;
  v9 = v7;
  v10 = v8;
  if (!self)
  {
LABEL_23:

    goto LABEL_18;
  }
  -[MKFCKOutgoingInvitation pendingUser](self, "pendingUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MKFCKOutgoingInvitation pendingUser](self, "pendingUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchLocalModelWithContext:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v9, "pendingUser");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v15)
        objc_msgSend(v9, "setPendingUser:", v15);
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v20;
        v43 = 2112;
        v44 = v18;
        v45 = 2112;
        v46 = 0;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between outgoing invitation and pending user yet: %@.pendingUser = %@", buf, 0x20u);

        v17 = v39;
      }

      objc_autoreleasePoolPop(v17);
    }

  }
  if (!-[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:context:](self, v9, CFSTR("allowedAccessories_"), v10))goto LABEL_17;
  v21 = v9;
  v22 = v10;
  v23 = &OBJC_METACLASS___HMDAccessorySetupCoordinator;
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isRestrictedGuestEnabled");

  if ((v25 & 1) == 0)
  {

LABEL_20:
    v30 = v21;
    v31 = v22;
    objc_msgSend(&v23[86], "featuresDataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isRestrictedGuestEnabled");

    if (v33)
    {
      objc_msgSend(v30, "entity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "relationshipsByName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("yearDayScheduleRules_"));
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v31;
      v38 = (void *)v36;
      LOBYTE(self) = +[MKFCKGuest _importYearDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:](MKFCKGuest, "_importYearDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:", v30, self, v36, CFSTR("guestYearDayScheduleRules"), CFSTR("invitation"), v37);

    }
    else
    {
      LOBYTE(self) = 1;
    }
    goto LABEL_23;
  }
  objc_msgSend(v21, "entity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "relationshipsByName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("weekDayScheduleRules_"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = +[MKFCKGuest _importWeekDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:](MKFCKGuest, "_importWeekDayScheduleRulesIntoLocalModel:fromCloudModel:localRelationship:cloudAttributeName:parentRelationshipName:context:", v21, self, v28, CFSTR("guestWeekDayScheduleRules"), CFSTR("invitation"), v22);

  v23 = &OBJC_METACLASS___HMDAccessorySetupCoordinator;
  if (v40)
    goto LABEL_20;
LABEL_17:
  LOBYTE(self) = 0;
LABEL_18:

  return (char)self;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  MKFCKOutgoingInvitation *v12;
  void *v13;
  void *v14;
  MKFCKOutgoingInvitation *v15;
  NSObject *v16;
  MKFCKOutgoingInvitation *v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *context;
  void *contexta;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  MKFCKOutgoingInvitation *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (-[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v7, v8))
  {
    v9 = v7;
    v10 = v8;
    v11 = self != 0;
    if (!self)
      goto LABEL_21;
    objc_msgSend(v9, "pendingUser");
    v12 = (MKFCKOutgoingInvitation *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[MKFCKModel fetchWithLocalModel:context:](MKFCKUser, "fetchWithLocalModel:context:", v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[MKFCKOutgoingInvitation pendingUser](self, "pendingUser");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v13)
        {
          context = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v33;
            v39 = 2112;
            v40 = v13;
            v41 = 2112;
            v42 = v15;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Linking user [%@] to invitation : [%@]", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          -[MKFCKOutgoingInvitation setPendingUser:](v15, "setPendingUser:", v13);
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v34;
          v39 = 2112;
          v40 = v9;
          v41 = 2112;
          v42 = v12;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between outgoing invitation and pending user yet: %@.pendingUser = %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(contexta);
      }

    }
    if (-[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:context:](self, v9, CFSTR("allowedAccessories_"), v10))
    {
      v19 = v9;
      +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isRestrictedGuestEnabled");

      if (v21)
      {
        objc_msgSend(v19, "weekDayScheduleRules");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKOutgoingInvitation guestWeekDayScheduleRules](self, "guestWeekDayScheduleRules");
        v23 = objc_claimAutoreleasedReturnValue();
        +[MKFCKGuest _dictionaryRepresentationFromWeekDayScheduleRules:cloudWeekDayScheduleRulesDictionary:](MKFCKGuest, "_dictionaryRepresentationFromWeekDayScheduleRules:cloudWeekDayScheduleRulesDictionary:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[MKFCKOutgoingInvitation guestWeekDayScheduleRules](self, "guestWeekDayScheduleRules");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = HMFEqualObjects();

        if ((v23 & 1) == 0)
          -[MKFCKOutgoingInvitation setGuestWeekDayScheduleRules:](self, "setGuestWeekDayScheduleRules:", v24);

      }
      v26 = v19;
      +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isRestrictedGuestEnabled");

      if (!v28)
      {
        v11 = 1;
        goto LABEL_24;
      }
      objc_msgSend(v26, "yearDayScheduleRules");
      v29 = objc_claimAutoreleasedReturnValue();
      -[MKFCKOutgoingInvitation guestYearDayScheduleRules](self, "guestYearDayScheduleRules");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKFCKGuest _dictionaryRepresentationFromYearDayScheduleRules:cloudYearDayScheduleRulesDictionary:](MKFCKGuest, "_dictionaryRepresentationFromYearDayScheduleRules:cloudYearDayScheduleRulesDictionary:", v29, v30);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[MKFCKOutgoingInvitation guestYearDayScheduleRules](self, "guestYearDayScheduleRules");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = HMFEqualObjects();

      if ((v29 & 1) == 0)
        -[MKFCKOutgoingInvitation setGuestYearDayScheduleRules:](self, "setGuestYearDayScheduleRules:", v10);
LABEL_21:

LABEL_24:
      goto LABEL_25;
    }
  }
  v11 = 0;
LABEL_25:

  return v11;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKOutgoingInvitation"));
}

@end
