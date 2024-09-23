@implementation IDSService(HMUValidation)

- (uint64_t)hmu_validateFromID:()HMUValidation context:currentAccessory:home:options:error:
{
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;

  v14 = a3;
  v15 = a6;
  objc_msgSend(a4, "senderCorrelationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (a8)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = CFSTR("Context does not contain Sender Correlation Identifier");
      v20 = 2;
      goto LABEL_8;
    }
    goto LABEL_21;
  }
  v17 = +[HMUDevice isAccessory](HMUDevice, "isAccessory");
  if (a5 || !v17)
  {
    if (a5 || (a7 & 1) == 0 || (objc_msgSend(v15, "hmu_isRemoteAccessAllowedForCurrentUser") & 1) != 0)
    {
      objc_msgSend(a1, "deviceForFromID:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if ((objc_msgSend(v15, "hmu_isCurrentUserOwner") & 1) != 0)
        {
          objc_msgSend(v15, "owner");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
          if (a5)
            goto LABEL_18;
          objc_msgSend(v23, "uniqueIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "owner");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "uniqueIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v24, "isEqual:", v26);

          if ((v27 & 1) != 0)
          {
LABEL_18:
            v21 = 1;
LABEL_30:

            goto LABEL_31;
          }
          if (a8)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmu_IDSValidationErrorWithCode:description:", 5, CFSTR("Sender is not owner"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
LABEL_29:
          v21 = 0;
          goto LABEL_30;
        }
        if (a8)
        {
          v28 = (void *)MEMORY[0x24BDD1540];
          v29 = CFSTR("Received message from a known device but current user is not owner.");
          v30 = 5;
LABEL_26:
          objc_msgSend(v28, "hmu_IDSValidationErrorWithCode:description:", v30, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
LABEL_27:
          v21 = 0;
          *a8 = v31;
          goto LABEL_30;
        }
      }
      else
      {
        objc_msgSend(v15, "hmu_userWithSenderCorrelationIdentifier:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_16;
        if (a8)
        {
          v28 = (void *)MEMORY[0x24BDD1540];
          v29 = CFSTR("User with matching Sender Correlation Identifier Not Found");
          v30 = 6;
          goto LABEL_26;
        }
      }
      v23 = 0;
      goto LABEL_29;
    }
    if (a8)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = CFSTR("Remote Access Not Allowed for Current User");
      v20 = 4;
      goto LABEL_8;
    }
LABEL_21:
    v21 = 0;
    goto LABEL_31;
  }
  if (!a8)
    goto LABEL_21;
  v18 = (void *)MEMORY[0x24BDD1540];
  v19 = CFSTR("Device is Accessory but currentAccessory is nil");
  v20 = 3;
LABEL_8:
  objc_msgSend(v18, "hmu_IDSValidationErrorWithCode:description:", v20, v19);
  v21 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v21;
}

- (uint64_t)hmu_validateDestination:()HMUValidation forHome:currentAccessory:options:error:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;

  v12 = a4;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v12, "hmu_userWithDestination:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmu_accessoryWithDestination:service:", v14, a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v16)
  {
    if (a7)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = CFSTR("Destination is not a single recipient");
LABEL_5:
      v19 = 7;
LABEL_29:
      objc_msgSend(v17, "hmu_IDSValidationErrorWithCode:description:", v19, v18);
      v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v20 = +[HMUDevice isAccessory](HMUDevice, "isAccessory");
  if (!v13 && v20)
  {
    if (a7)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = CFSTR("Device is Accessory but currentAccessory is nil");
      v19 = 3;
      goto LABEL_29;
    }
    goto LABEL_32;
  }
  if (v13)
  {
    objc_msgSend(v12, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "isEqual:", v23);

    if ((v24 & 1) == 0)
    {
      if (a7)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = CFSTR("Home does not contain Current Accessory");
        v19 = 8;
        goto LABEL_29;
      }
      goto LABEL_32;
    }
    if (v15)
    {
      if ((a6 & 1) != 0 && (objc_msgSend(v12, "hmu_isRemoteAccessAllowedForUser:", v15) & 1) == 0)
      {
        if (!a7)
          goto LABEL_32;
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = CFSTR("Remote Access Not Allowed for Recipient User");
LABEL_28:
        v19 = 4;
        goto LABEL_29;
      }
    }
    else if (!v16)
    {
      if (a7)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = CFSTR("No Recipient found for Destination");
        goto LABEL_5;
      }
      goto LABEL_32;
    }
  }
  else
  {
    if ((a6 & 1) != 0 && (objc_msgSend(v12, "hmu_isRemoteAccessAllowedForCurrentUser") & 1) == 0)
    {
      if (!a7)
        goto LABEL_32;
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = CFSTR("Remote Access Not Allowed for Current User");
      goto LABEL_28;
    }
    if (!v16)
    {
      if (a7)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = CFSTR("Destination is not an accessory");
        goto LABEL_5;
      }
LABEL_32:
      v25 = 0;
      goto LABEL_33;
    }
  }
  v25 = 1;
LABEL_33:

  return v25;
}

@end
