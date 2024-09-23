@implementation AMDHealthKitWorkoutEvent

+ (BOOL)validateInput:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  _QWORD __b[8];
  id v22;
  id location[3];
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v22 = *(id *)(__b[1] + 8 * v8);
      v4 = (id)objc_msgSend(v22, "objectForKey:", 0x1EA4BCB88);
      v19 = 0;
      v17 = 0;
      v15 = 0;
      v13 = 0;
      v5 = 1;
      if (v4)
      {
        v20 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("eventType"));
        v19 = 1;
        v5 = 1;
        if (v20)
        {
          v18 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("isFirstPartyDonation"));
          v17 = 1;
          v5 = 1;
          if (v18)
          {
            v16 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("isIndoor"));
            v15 = 1;
            v5 = 1;
            if (v16)
            {
              v14 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("isUpdate"));
              v13 = 1;
              v5 = v14 == 0;
            }
          }
        }
      }
      if ((v13 & 1) != 0)

      if ((v15 & 1) != 0)
      if ((v17 & 1) != 0)

      if ((v19 & 1) != 0)
      if (v5)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
        if (!v9)
          goto LABEL_22;
      }
    }
    v24 = 0;
    v12 = 1;
  }
  else
  {
LABEL_22:
    v12 = 0;
  }

  if (!v12)
    v24 = 1;
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (void)populateRecord:(id)a3
{
  AMDHealthKitWorkoutEvent *v3;
  id v4;
  AMDHealthKitWorkoutEvent *v5;
  id v6;
  AMDHealthKitWorkoutEvent *v7;
  id v8;
  AMDHealthKitWorkoutEvent *v9;
  id v10;
  AMDHealthKitWorkoutEvent *v11;
  id v12;
  id v13;
  AMDHealthKitWorkoutEvent *v14;
  id v15;
  AMDHealthKitWorkoutEvent *v16;
  id v17;
  id v18;
  id location[2];
  AMDHealthKitWorkoutEvent *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = v20;
  v17 = (id)objc_msgSend(location[0], "valueForKey:", 0x1EA4BCB88);
  -[AMDHealthKitWorkoutEvent setEventTime:](v16, "setEventTime:", objc_msgSend(v17, "unsignedLongLongValue"));

  v18 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("activityType"));
  if (v18)
  {
    v14 = v20;
    v15 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("activityType"));
    -[AMDHealthKitWorkoutEvent setActivityType:](v14, "setActivityType:");

  }
  v13 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("activityUUID"));

  if (v13)
  {
    v11 = v20;
    v12 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("activityUUID"));
    -[AMDHealthKitWorkoutEvent setActivityUUID:](v11, "setActivityUUID:");

  }
  v3 = v20;
  v4 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventType"));
  -[AMDHealthKitWorkoutEvent setEventType:](v3, "setEventType:", (__int16)objc_msgSend(v4, "unsignedShortValue"));

  v5 = v20;
  v6 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("isFirstPartyDonation"));
  -[AMDHealthKitWorkoutEvent setIsFirstPartyDonation:](v5, "setIsFirstPartyDonation:", objc_msgSend(v6, "BOOLValue") & 1);

  v7 = v20;
  v8 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("isIndoor"));
  -[AMDHealthKitWorkoutEvent setIsIndoor:](v7, "setIsIndoor:", objc_msgSend(v8, "BOOLValue") & 1);

  v9 = v20;
  v10 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("isUpdate"));
  -[AMDHealthKitWorkoutEvent setIsUpdate:](v9, "setIsUpdate:", objc_msgSend(v10, "BOOLValue") & 1);

  objc_storeStrong(location, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDHealthKitWorkoutEvent"), a2, a1);
}

@end
