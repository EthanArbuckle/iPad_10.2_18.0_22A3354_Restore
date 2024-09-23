@implementation NSError(HAPError)

- (uint64_t)isHAPError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HAPErrorDomain"));

  return v2;
}

+ (id)_userInfoWithDescription:()HAPError reason:suggestion:underlyingError:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 || v10 || v11 || v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", v9, &stru_1E894EFE8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2D50]);

    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", v10, &stru_1E894EFE8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB2D68]);

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", v11, &stru_1E894EFE8, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D80]);

    }
    if (v13)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3388]);
    v14 = (void *)objc_msgSend(v15, "copy");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)hapErrorWithCode:()HAPError description:reason:suggestion:underlyingError:
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_userInfoWithDescription:reason:suggestion:underlyingError:", a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithOSStatus:()HAPError
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2F90];
  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("?");
  if (v6)
    v8 = (const __CFString *)v6;
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, a3, v9);

  return v10;
}

+ (uint64_t)hapErrorWithCode:()HAPError
{
  return objc_msgSend((id)objc_opt_class(), "hapErrorWithCode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, 0);
}

+ (uint64_t)errorWithHMErrorCode:()HAPError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", a3, 0, 0);
}

+ (id)errorWithHMErrorCode:()HAPError reason:underlyingError:
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = 0;
  if (a3 > 1000)
  {
    v7 = CFSTR("Accessory is calibrating");
    v8 = CFSTR("Unknown error code 3202");
    if (a3 != 3202)
      v8 = 0;
    if (a3 != 2405)
      v7 = v8;
    v9 = CFSTR("Error parsing HAP metadata");
    v10 = CFSTR("Metadata schema version incompatible");
    if (a3 != 1004)
      v10 = 0;
    if (a3 != 1001)
      v9 = v10;
    if (a3 <= 2404)
      v6 = v9;
    else
      v6 = v7;
  }
  else
  {
    switch(a3)
    {
      case 2:
        v6 = CFSTR("Object not found");
        break;
      case 3:
        v6 = CFSTR("Invalid parameter");
        break;
      case 4:
        v6 = CFSTR("Accessory not reachable");
        break;
      case 5:
        v6 = CFSTR("Read only characteristic");
        break;
      case 6:
        v6 = CFSTR("Write only characteristic");
        break;
      case 7:
        v6 = CFSTR("Notification not supported");
        break;
      case 8:
        v6 = CFSTR("Operation timed out");
        break;
      case 10:
        v6 = CFSTR("Access denied");
        break;
      case 11:
        v6 = CFSTR("Object associated with another home");
        break;
      case 14:
        v6 = CFSTR("Accessory busy");
        break;
      case 15:
        v6 = CFSTR("Operation in progress");
        break;
      case 16:
        v6 = CFSTR("Accessory out of resources");
        break;
      case 17:
        v6 = CFSTR("Insufficient privileges");
        break;
      case 18:
        v6 = CFSTR("Accessory pairing failed");
        break;
      case 20:
        v6 = CFSTR("Nil parameter");
        break;
      case 23:
        v6 = CFSTR("Operation cancelled");
        break;
      case 27:
        v6 = CFSTR("Missing parameter");
        break;
      case 43:
        v6 = CFSTR("Invalid value type");
        break;
      case 44:
        v6 = CFSTR("Value lower than minimum");
        break;
      case 45:
        v6 = CFSTR("Value higher than maximum");
        break;
      case 46:
        v6 = CFSTR("String longer than maximum length");
        break;
      case 48:
        v6 = CFSTR("Operation is not supported");
        break;
      case 49:
        v6 = CFSTR("Maximum number of objects of requested type already exist");
        break;
      case 50:
        v6 = CFSTR("Accessory sent an invalid response");
        break;
      case 51:
        v6 = CFSTR("String shorter than the minimum length");
        break;
      case 52:
        v6 = CFSTR("An unknown error occurred");
        break;
      case 53:
        v6 = CFSTR("Security check failed or action not allowed");
        break;
      case 54:
        v6 = CFSTR("Network or other communication failure occurred");
        break;
      case 55:
        v6 = CFSTR("Authentication failed");
        break;
      case 56:
        v6 = CFSTR("Invalid message size");
        break;
      case 57:
        v6 = CFSTR("Accessory discovery failed");
        break;
      case 58:
        v6 = CFSTR("Client request error when communicating with accessory");
        break;
      case 59:
        v6 = CFSTR("Accessory response error when communicating with accessory");
        break;
      case 66:
        v6 = CFSTR("Accessory out of compliance");
        break;
      case 79:
        v6 = CFSTR("Add accessory failed");
        break;
      case 87:
        v6 = CFSTR("Missing or invalid authorization data");
        break;
      case 88:
        v6 = CFSTR("Bridged Accessory not reachable");
        break;
      case 96:
        v6 = CFSTR("Ownership code did not match.");
        break;
      default:
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "_userInfoWithDescription:reason:suggestion:underlyingError:", v6, a4, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)errorWithHMErrorCode:()HAPError userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, a4);
}

@end
