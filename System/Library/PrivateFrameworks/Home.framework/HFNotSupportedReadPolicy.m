@implementation HFNotSupportedReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  unsigned int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0CB8780]) & 1) != 0)
  {

  }
  else
  {
    v9 = -[HFNotSupportedReadPolicy _requiresNotificationsForCharacteristic:](self, "_requiresNotificationsForCharacteristic:", v6);

    if (v9)
    {
      objc_msgSend(v7, "addObject:", CFSTR("DoesNotSupportNotifications"));
      v10 = 0;
      goto LABEL_6;
    }
  }
  v10 = 1;
LABEL_6:
  objc_msgSend(v6, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", *MEMORY[0x1E0CB8778]))
  {
    v12 = objc_msgSend(v6, "hasAuthorizationData");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "addObject:", CFSTR("InvalidOrMissingAuthorizationData"));
      v10 = 0;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAdditionalSetupRequired");

  if (v15)
  {
    objc_msgSend(v7, "addObject:", CFSTR("AdditionalSetupRequired"));
    v10 = 0;
  }
  if (a4)
    *a4 = (id)objc_msgSend(v7, "copy");

  return v10;
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB99A0]);

  if ((v6 & 1) != 0)
    goto LABEL_3;
  v7 = *MEMORY[0x1E0CB8808];
  v17[0] = *MEMORY[0x1E0CB87B8];
  v17[1] = v7;
  v8 = *MEMORY[0x1E0CB8920];
  v17[2] = *MEMORY[0x1E0CB8928];
  v17[3] = v8;
  v9 = *MEMORY[0x1E0CB8A18];
  v17[4] = *MEMORY[0x1E0CB8A80];
  v17[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_3:
    v13 = 0;
  }
  else
  {
    v14 = (void *)*MEMORY[0x1E0CB88F8];
    objc_msgSend(v3, "characteristicType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v14, "isEqualToString:", v15);

    v13 = v14 ^ 1;
  }

  return v13;
}

@end
