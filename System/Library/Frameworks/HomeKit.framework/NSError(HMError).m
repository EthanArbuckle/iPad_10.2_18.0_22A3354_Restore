@implementation NSError(HMError)

+ (uint64_t)hmErrorWithCode:()HMError userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, a4);
}

+ (uint64_t)hmErrorWithCode:()HMError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", a3, 0);
}

- (id)hmPublicError
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_msgSend(a1, "isHMError") & 1) != 0)
  {
    switch(objc_msgSend(a1, "code"))
    {
      case 1001:
      case 1002:
      case 1003:
      case 1004:
      case 1005:
      case 1006:
      case 1007:
      case 1008:
      case 1009:
      case 1010:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = -1;
        break;
      case 1011:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 12;
        break;
      case 1012:
      case 1013:
      case 1014:
      case 1015:
      case 1016:
      case 1017:
      case 1020:
      case 1021:
      case 1022:
      case 1023:
      case 1024:
      case 1025:
      case 1026:
      case 1027:
      case 1028:
      case 1029:
      case 1030:
      case 1031:
      case 1032:
      case 1035:
      case 1036:
      case 1041:
      case 1045:
      case 1046:
      case 1047:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 54;
        break;
      case 1018:
      case 1019:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 14;
        break;
      case 1033:
      case 1034:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 4;
        break;
      case 1037:
      case 1038:
      case 1040:
      case 1042:
      case 1043:
      case 1044:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 50;
        break;
      case 1039:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 3;
        break;
      case 1048:
      case 1049:
        v2 = (void *)MEMORY[0x1E0CB35C8];
        v3 = 23;
        break;
      default:
        goto LABEL_4;
    }
    objc_msgSend(v2, "hmErrorWithCode:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v4 = a1;
  }
  return v4;
}

- (uint64_t)isHMError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HMErrorDomain"));

  return v2;
}

+ (id)hmInternalErrorWithCode:()HMError underlyingError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)hmInternalErrorWithCode:()HMError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:underlyingError:", a3, 0);
}

+ (__CFString)hmStringFromErrorCode:()HMError
{
  __CFString *v3;
  __CFString *result;

  if (a3 > 1000)
  {
    if (a3 > 2200)
    {
      if (a3 > 2999)
      {
        switch(a3)
        {
          case 3000:
            result = CFSTR("User did not respond for trigger execution");
            break;
          case 3001:
            result = CFSTR("Did not execute trigger as user declined");
            break;
          case 3002:
            result = CFSTR("End event cancelled the restore");
            break;
          case 3003:
            result = CFSTR("Event trigger execution session was deallocated");
            break;
          case 3005:
            result = CFSTR("Trigger failed to execute due to recurrence mismatch");
            break;
          case 3006:
            result = CFSTR("Event trigger evaluation condition evalutated to false");
            break;
          case 3007:
            result = CFSTR("Did not find compatible resident to send the permission to confirm the trigger execution");
            break;
          default:
            goto LABEL_149;
        }
      }
      else if (a3 <= 2404)
      {
        switch(a3)
        {
          case 2201:
            return CFSTR("Weak password");
          case 2300:
            return CFSTR("Voice Shortcut with similar name exists");
          case 2404:
            return CFSTR("The requested operation has started");
          default:
LABEL_149:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown error code %ld"), a3);
            v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
            return v3;
        }
      }
      else
      {
        switch(a3)
        {
          case 2500:
            result = CFSTR("kResetConfigRequestKey");
            break;
          case 2501:
            result = CFSTR("HomeUIService terminated");
            break;
          case 2502:
            result = CFSTR("HomeUIService backgrounded");
            break;
          case 2503:
            result = CFSTR("No clients");
            break;
          case 2504:
            result = CFSTR("Accessory Browser stopped");
            break;
          default:
            if (a3 != 2405)
              goto LABEL_149;
            result = CFSTR("Accessory is calibrating");
            break;
        }
      }
    }
    else if (a3 > 2000)
    {
      switch(a3)
      {
        case 2001:
          return CFSTR("Operation canceled by user.");
        case 2002:
          return CFSTR("Incorrect setup code.");
        case 2003:
          return CFSTR("Secure access Denied.");
        case 2004:
          return CFSTR("Unsupported setup payload.");
        case 2005:
          return CFSTR("Media remote error");
        case 2006:
          goto LABEL_149;
        case 2007:
          return CFSTR("Cloud photo library not enabled");
        default:
          if (a3 == 2100)
          {
            result = CFSTR("No Target Accessory");
          }
          else
          {
            if (a3 != 2200)
              goto LABEL_149;
            result = CFSTR("Invalid characters");
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          result = CFSTR("Error parsing HAP metadata");
          break;
        case 1002:
          result = CFSTR("Error serializing HAP metadata");
          break;
        case 1003:
          result = CFSTR("Metadata version older than client version");
          break;
        case 1004:
          result = CFSTR("Metadata schema version incompatible");
          break;
        case 1005:
          result = CFSTR("Failed to create remote view service");
          break;
        case 1006:
          result = CFSTR("Invitation has expired");
          break;
        case 1007:
          result = CFSTR("Invitation has already been accepted");
          break;
        case 1008:
          result = CFSTR("Invitation has already been declined");
          break;
        case 1009:
          result = CFSTR("Request was not handled");
          break;
        default:
          goto LABEL_149;
      }
    }
  }
  else
  {
    v3 = CFSTR("Unexpected error");
    switch(a3)
    {
      case -1:
        return v3;
      case 1:
        v3 = CFSTR("Object already exists");
        return v3;
      case 2:
        result = CFSTR("Object not found");
        break;
      case 3:
        result = CFSTR("Invalid parameter");
        break;
      case 4:
        result = CFSTR("Accessory not reachable");
        break;
      case 5:
        result = CFSTR("Read only characteristic");
        break;
      case 6:
        result = CFSTR("Write only characteristic");
        break;
      case 7:
        result = CFSTR("Notification not supported");
        break;
      case 8:
        result = CFSTR("Operation timed out");
        break;
      case 9:
        result = CFSTR("Accessory powered off");
        break;
      case 10:
        result = CFSTR("Access denied");
        break;
      case 11:
        result = CFSTR("Object associated with another home");
        break;
      case 12:
        result = CFSTR("Object not associated with a home");
        break;
      case 13:
        result = CFSTR("Object already associated to home");
        break;
      case 14:
        result = CFSTR("Accessory busy");
        break;
      case 15:
        result = CFSTR("Operation in progress");
        break;
      case 16:
        result = CFSTR("Accessory out of resources");
        break;
      case 17:
        result = CFSTR("Insufficient privileges");
        break;
      case 18:
        result = CFSTR("Accessory pairing failed");
        break;
      case 19:
        result = CFSTR("Invalid data format");
        break;
      case 20:
        result = CFSTR("Nil parameter");
        break;
      case 21:
        result = CFSTR("Unconfigured parameter");
        break;
      case 22:
        result = CFSTR("Parameter of invalid class");
        break;
      case 23:
        result = CFSTR("Operation cancelled");
        break;
      case 24:
        result = CFSTR("Room for home cannot be added to a zone");
        break;
      case 25:
        result = CFSTR("No actions in Action set");
        break;
      case 26:
        result = CFSTR("No registered Action sets for trigger");
        break;
      case 27:
        result = CFSTR("Missing parameter");
        break;
      case 28:
        result = CFSTR("FireDate in past");
        break;
      case 29:
        result = CFSTR("Room For home cannot be updated");
        break;
      case 30:
        result = CFSTR("Action already associated with another Action set");
        break;
      case 31:
        result = CFSTR("Object with similar name exists in home");
        break;
      case 32:
        result = CFSTR("Home with similar name exists");
        break;
      case 33:
        result = CFSTR("Cannot rename to similar name");
        break;
      case 34:
        result = CFSTR("Cannot remove non-bridge accessory");
        break;
      case 35:
        result = CFSTR("Name contains prohibited characters");
        break;
      case 36:
        result = CFSTR("Name does not start with valid characters");
        break;
      case 37:
        result = CFSTR("UserID is not an email address");
        break;
      case 38:
        result = CFSTR("Confirmation to add user was declined");
        break;
      case 39:
        result = CFSTR("Confirmation to remove user was declined");
        break;
      case 40:
        result = CFSTR("User declined invite to access home");
        break;
      case 41:
        result = CFSTR("User management failed");
        break;
      case 42:
        result = CFSTR("Recurrence too small");
        break;
      case 43:
        result = CFSTR("Invalid value type");
        break;
      case 44:
        result = CFSTR("Value lower than minimum");
        break;
      case 45:
        result = CFSTR("Value higher than maximum");
        break;
      case 46:
        result = CFSTR("String longer than maximum length");
        break;
      case 47:
        result = CFSTR("Access to home data is not authorized");
        break;
      case 48:
        result = CFSTR("Operation is not supported");
        break;
      case 49:
        result = CFSTR("Maximum number of objects of requested type already exist");
        break;
      case 50:
        result = CFSTR("Accessory sent an invalid response");
        break;
      case 51:
        result = CFSTR("String shorter than the minimum length");
        break;
      case 52:
        result = CFSTR("An unknown error occurred");
        break;
      case 53:
        result = CFSTR("Security check failed or action not allowed");
        break;
      case 54:
        result = CFSTR("Network or other communication failure occurred");
        break;
      case 55:
        result = CFSTR("Authentication failed");
        break;
      case 56:
        result = CFSTR("Invalid message size");
        break;
      case 57:
        result = CFSTR("Accessory discovery failed");
        break;
      case 58:
        result = CFSTR("Client request error when communicating with accessory");
        break;
      case 59:
        result = CFSTR("Accessory response error when communicating with accessory");
        break;
      case 60:
        result = CFSTR("Name does not end with valid characters");
        break;
      case 61:
        result = CFSTR("Accessory is blocked");
        break;
      case 62:
        result = CFSTR("Invalid associated service type");
        break;
      case 63:
        result = CFSTR("Action set execution failed");
        break;
      case 64:
        result = CFSTR("Action set execution partially succeeded");
        break;
      case 65:
        result = CFSTR("Action set being executed");
        break;
      case 66:
        result = CFSTR("Accessory out of compliance");
        break;
      case 67:
        result = CFSTR("Data reset failed");
        break;
      case 68:
        result = CFSTR("Characteristic notification already enabled");
        break;
      case 69:
        result = CFSTR("Timer trigger recurrence must be on specified boundaries");
        break;
      case 70:
        result = CFSTR("Timer trigger fire date must be on specified boundaries");
        break;
      case 71:
        result = CFSTR("Cannot activate a timer trigger that is too far in the future");
        break;
      case 72:
        result = CFSTR("Recurrence too large");
        break;
      case 73:
        result = CFSTR("Read/Write operation partially succeeded");
        break;
      case 74:
        result = CFSTR("Read/Write operation failed");
        break;
      case 75:
        result = CFSTR("User is not signed into iCloud");
        break;
      case 76:
        result = CFSTR("User does not have iCloud Keychain sync enabled");
        break;
      case 77:
        result = CFSTR("Cloud data sync is in progress");
        break;
      case 78:
        result = CFSTR("Network Unavailable");
        break;
      case 79:
        result = CFSTR("Add accessory failed");
        break;
      case 80:
        result = CFSTR("Missing entitlement for API/SPI");
        break;
      case 81:
        result = CFSTR("Cannot unblock bridged accessories: only bridges may be unblocked");
        break;
      case 82:
        result = CFSTR("Device locked");
        break;
      case 83:
        result = CFSTR("Cannot remove builtin action set");
        break;
      case 84:
        result = CFSTR("Location Services for Home is disabled");
        break;
      case 85:
        result = CFSTR("Not Authorized for Location Services");
        break;
      case 86:
        result = CFSTR("Refer to User Manual");
        break;
      case 87:
        result = CFSTR("Missing or invalid authorization data");
        break;
      case 88:
        result = CFSTR("Bridged Accessory not reachable");
        break;
      case 89:
        result = CFSTR("Not Authorized for Microphone Access");
        break;
      case 90:
        result = CFSTR("Incompatible network.");
        break;
      case 91:
        result = CFSTR("No HomeHub");
        break;
      case 92:
        result = CFSTR("No Compatible HomeHub.");
        break;
      case 93:
        result = CFSTR("Incompatible Accessory");
        break;
      case 95:
        result = CFSTR("Object with similar name exists");
        break;
      case 96:
        result = CFSTR("Ownership code did not match.");
        break;
      case 97:
        result = CFSTR("Maximum accessories of the type in home");
        break;
      case 98:
        result = CFSTR("WiFi credential generation failed");
        break;
      case 103:
        result = CFSTR("Accessory is suspended");
        break;
      default:
        goto LABEL_149;
    }
  }
  return result;
}

+ (id)_hmUserInfoForDescription:()HMError reason:suggestion:underlyingError:
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

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 || v10 || v11 || v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v9, &stru_1E3AB7688, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2D50]);

    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v10, &stru_1E3AB7688, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB2D68]);

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", v11, &stru_1E3AB7688, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB2D80]);

    }
    if (v13)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3388]);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)hmErrorWithCode:()HMError description:reason:suggestion:underlyingError:
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_hmUserInfoForDescription:reason:suggestion:underlyingError:", a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)hmInternalErrorWithCode:()HMError description:reason:suggestion:underlyingError:
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_hmUserInfoForDescription:reason:suggestion:underlyingError:", a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)hmErrorWithCode:()HMError description:reason:suggestion:
{
  return objc_msgSend(a1, "hmErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, a5, a6, 0);
}

+ (uint64_t)hmInternalErrorWithCode:()HMError description:reason:suggestion:
{
  return objc_msgSend(a1, "hmInternalErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, a5, a6, 0);
}

+ (uint64_t)hmInternallErrorWithCode:()HMError userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, a4);
}

+ (uint64_t)hmPrivateErrorWithCode:()HMError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, 0);
}

+ (uint64_t)hmInternalErrorWithCode:()HMError userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, a4);
}

+ (uint64_t)hmPrivateErrorWithCode:()HMError underlyingError:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:description:underlyingError:", a3, 0, a4);
}

+ (id)hmPrivateErrorWithCode:()HMError description:underlyingError:
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (v7 | v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", v7, &stru_1E3AB7688, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);

    }
    if (v8)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
