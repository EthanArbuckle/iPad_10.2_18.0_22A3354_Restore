@implementation HMDelegateCaller

- (void)callCompletion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__HMDelegateCaller_callCompletion_error___block_invoke;
  v10[3] = &unk_1E3AB5C58;
  v11 = v7;
  v12 = v6;
  v10[4] = self;
  v8 = v7;
  v9 = v6;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v10);

}

- (void)callCompletion:(id)a3 array:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__HMDelegateCaller_callCompletion_array___block_invoke;
  v10[3] = &unk_1E3AB60A0;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v10);

}

- (void)callCompletion:(id)a3 obj:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__HMDelegateCaller_callCompletion_obj_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

uint64_t __41__HMDelegateCaller_callCompletion_array___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (HMDelegateCaller)initWithQueue:(id)a3
{
  id v4;
  uint64_t v5;
  __HMQueueDelegateCaller *v6;
  HMDelegateCaller *p_super;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4)
      v6 = -[__HMQueueDelegateCaller initWithQueue:]([__HMQueueDelegateCaller alloc], "initWithQueue:", v4);
    else
      v6 = objc_alloc_init(__HMMainThreadDelegateCaller);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDelegateCaller;
    v6 = -[HMDelegateCaller init](&v9, sel_init);
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
}

- (HMDelegateCaller)init
{
  return -[HMDelegateCaller initWithQueue:](self, "initWithQueue:", 0);
}

void __41__HMDelegateCaller_callCompletion_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __45__HMDelegateCaller_callCompletion_obj_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

- (id)_localizedError:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_137;
  }
  v5 = v3;
  if (!objc_msgSend(v5, "isHMError"))
  {
LABEL_131:
    v6 = CFSTR("UNKNOWN_ERROR_CODE");
    goto LABEL_132;
  }
  v6 = CFSTR("UNEXPECTED_ERROR");
  switch(objc_msgSend(v5, "code"))
  {
    case -1:
      goto LABEL_132;
    case 1:
      v6 = CFSTR("ALREADY_EXISTS");
      goto LABEL_132;
    case 2:
      v6 = CFSTR("NOT_FOUND");
      goto LABEL_132;
    case 3:
      v6 = CFSTR("INVALID_PARAMETER");
      goto LABEL_132;
    case 4:
      v6 = CFSTR("ACCESSORY_NOT_REACHABLE");
      goto LABEL_132;
    case 5:
      v6 = CFSTR("READ_ONLY_CHARACTERISTIC");
      goto LABEL_132;
    case 6:
      v6 = CFSTR("WRITE_ONLY_CHARACTERISTIC");
      goto LABEL_132;
    case 7:
      v6 = CFSTR("NOTIFICATION_NOT_SUPPORTED");
      goto LABEL_132;
    case 8:
      v6 = CFSTR("OPERATION_TIMED_OUT");
      goto LABEL_132;
    case 9:
      v6 = CFSTR("ACCESSORY_POWERED_OFF");
      goto LABEL_132;
    case 10:
      v6 = CFSTR("ACCESS_DENIED");
      goto LABEL_132;
    case 11:
      v6 = CFSTR("OBJECT_ASSOCIATED_TO_ANOTHER_HOME");
      goto LABEL_132;
    case 12:
      v6 = CFSTR("OBJECT_NOT_ASSOCIATED_TO_ANY_HOME");
      goto LABEL_132;
    case 13:
      v6 = CFSTR("OBJECT_ALREADY_ASSOCIATED_TO_HOME");
      goto LABEL_132;
    case 14:
      v6 = CFSTR("ACCESSORY_IS_BUSY");
      goto LABEL_132;
    case 15:
      v6 = CFSTR("OPERATION_IN_PROGRESS");
      goto LABEL_132;
    case 16:
      v6 = CFSTR("ACCESSORY_OUT_OF_RESOURCES");
      goto LABEL_132;
    case 17:
      v6 = CFSTR("INSUFFICIENT_PRIVILEGES");
      goto LABEL_132;
    case 18:
      v6 = CFSTR("ACCESSORY_PAIRING_FAILED");
      goto LABEL_132;
    case 19:
      v6 = CFSTR("INVALID_DATA_FORMAT_SPECIFIED");
      goto LABEL_132;
    case 20:
      v6 = CFSTR("NIL_PARAMETER");
      goto LABEL_132;
    case 21:
      v6 = CFSTR("UNCONFIGURED_PARAMETER");
      goto LABEL_132;
    case 22:
      v6 = CFSTR("INVALID_CLASS");
      goto LABEL_132;
    case 23:
      v6 = CFSTR("OPERATION_CANCELLED");
      goto LABEL_132;
    case 24:
      v6 = CFSTR("ROOM_FOR_HOME_CANNOT_BE_IN_ZONE");
      goto LABEL_132;
    case 25:
      v6 = CFSTR("NO_ACTIONS_IN_ACTION_SET");
      goto LABEL_132;
    case 26:
      v6 = CFSTR("NO_REGISTERED_ACTION_SETS");
      goto LABEL_132;
    case 27:
      v6 = CFSTR("MISSING_PARAMETER");
      goto LABEL_132;
    case 28:
      v6 = CFSTR("FIRE_DATE_IN_PAST");
      goto LABEL_132;
    case 29:
      v6 = CFSTR("ROOM_FOR_HOME_CANNOT_BE_UPDATED");
      goto LABEL_132;
    case 30:
      v6 = CFSTR("ACTION_IN_ANOTHER_ACTION_SET");
      goto LABEL_132;
    case 31:
      v6 = CFSTR("OBJECT_WITH_SIMILAR_NAME_EXISTS_IN_HOME");
      goto LABEL_132;
    case 32:
      v6 = CFSTR("HOME_WITH_SIMILAR_NAME_EXISTS");
      goto LABEL_132;
    case 33:
      v6 = CFSTR("RENAME_WITH_SIMILAR_NAME");
      goto LABEL_132;
    case 34:
      v6 = CFSTR("CANNOT_REMOVE_NON_BRIDGE_ACCESSORY");
      goto LABEL_132;
    case 35:
      v6 = CFSTR("NAME_CONTAINS_PROHIBITED_CHARACTERS");
      goto LABEL_132;
    case 36:
      v6 = CFSTR("NAME_DOES_NOT_START_WITH_VALID_CHARACTERS");
      goto LABEL_132;
    case 37:
      v6 = CFSTR("USER_ID_NOT_EMAIL_ADDRESS");
      goto LABEL_132;
    case 38:
      v6 = CFSTR("USER_DECLINED_ADDING_USER");
      goto LABEL_132;
    case 39:
      v6 = CFSTR("USER_DECLINED_REMOVING_USER");
      goto LABEL_132;
    case 40:
      v6 = CFSTR("USER_DECLINED_INVITE");
      goto LABEL_132;
    case 41:
      v6 = CFSTR("USER_MANAGEMENT_FAILED");
      goto LABEL_132;
    case 42:
      v6 = CFSTR("RECURRENCE_TOO_SMALL");
      goto LABEL_132;
    case 43:
      v6 = CFSTR("INVALID_VALUE_TYPE");
      goto LABEL_132;
    case 44:
      v6 = CFSTR("VALUE_LOWER_THAN_MINIMUM");
      goto LABEL_132;
    case 45:
      v6 = CFSTR("VALUE_HIGHER_THAN_MAXIMUM");
      goto LABEL_132;
    case 46:
      v6 = CFSTR("STRING_LONGER_THAN_MAXIMUM");
      goto LABEL_132;
    case 47:
      v6 = CFSTR("HOME_ACCESS_NOT_AUTHORIZED");
      goto LABEL_132;
    case 48:
      v6 = CFSTR("OPERATION_NOT_SUPPORTED");
      goto LABEL_132;
    case 49:
      v6 = CFSTR("MAXIMUM_OBJECT_LIMIT_REACHED");
      goto LABEL_132;
    case 50:
      v6 = CFSTR("ACCESSORY_SENT_INVALID_RESPONSE");
      goto LABEL_132;
    case 51:
      v6 = CFSTR("STRING_SHORTER_THAN_MINIMUM");
      goto LABEL_132;
    case 52:
      v6 = CFSTR("GENERIC_ERROR");
      goto LABEL_132;
    case 53:
      v6 = CFSTR("SECURITY_FAILURE");
      goto LABEL_132;
    case 54:
      v6 = CFSTR("COMMUNICATION_FAILURE");
      goto LABEL_132;
    case 55:
      v6 = CFSTR("MESSAGE_AUTHENTICATION_FAILED");
      goto LABEL_132;
    case 56:
      v6 = CFSTR("INVALID_MESSAGE_SIZE");
      goto LABEL_132;
    case 57:
      v6 = CFSTR("ACCESSORY_DISCOVERY_FAILED");
      goto LABEL_132;
    case 58:
      v6 = CFSTR("CLIENT_REQUEST_ERROR");
      goto LABEL_132;
    case 59:
      v6 = CFSTR("ACCESSORY_RESPONSE_ERROR");
      goto LABEL_132;
    case 60:
      v6 = CFSTR("NAME_DOES_NOT_END_WITH_VALID_CHARACTERS");
      goto LABEL_132;
    case 61:
      v6 = CFSTR("ACCESSORY_IS_BLOCKED");
      goto LABEL_132;
    case 62:
      v6 = CFSTR("INVALID_ASSOCIATED_SERVICE_TYPE");
      goto LABEL_132;
    case 63:
      v6 = CFSTR("ACTION_SET_EXECUTION_FAILED");
      goto LABEL_132;
    case 64:
      v6 = CFSTR("ACTION_SET_EXECUTION_PARTIAL_SUCCESS");
      goto LABEL_132;
    case 65:
      v6 = CFSTR("ACTION_SET_EXECUTION_IN_PROGRESS");
      goto LABEL_132;
    case 66:
      v6 = CFSTR("ACCESSORY_OUT_OF_COMPLIANCE");
      goto LABEL_132;
    case 67:
      v6 = CFSTR("DATA_RESET_FAILURE");
      goto LABEL_132;
    case 68:
      v6 = CFSTR("NOTIFICATION_ALREADY_ENABLED");
      goto LABEL_132;
    case 69:
      v6 = CFSTR("RECURRENCE_MUST_BE_ON_SPECIFIED_BOUNDARIES");
      goto LABEL_132;
    case 70:
      v6 = CFSTR("DATE_MUST_BE_ON_SPECIFIED_BOUNDARIES");
      goto LABEL_132;
    case 71:
      v6 = CFSTR("CANNOT_ACTIVATE_TRIGGER_TOO_FAR_IN_FUTURE");
      goto LABEL_132;
    case 72:
      v6 = CFSTR("RECURRENCE_TOO_LARGE");
      goto LABEL_132;
    case 73:
      v6 = CFSTR("READ_WRITE_PARTIAL_SUCCESS");
      goto LABEL_132;
    case 74:
      v6 = CFSTR("READ_WRITE_FAILURE");
      goto LABEL_132;
    case 75:
      v6 = CFSTR("NOT_SIGNED_INTO_ICLOUD");
      goto LABEL_132;
    case 76:
      v6 = CFSTR("KEYCHAIN_SYNC_NOT_ENABLED");
      goto LABEL_132;
    case 77:
      v6 = CFSTR("CLOUD_DATA_SYNC_IN_PROGRESS");
      goto LABEL_132;
    case 78:
      v6 = CFSTR("NETWORK_UNAVAILABLE");
      goto LABEL_132;
    case 79:
      v6 = CFSTR("ADD_ACCESSORY_FAILED");
      goto LABEL_132;
    case 80:
      v6 = CFSTR("MISSING_ENTITLEMENT");
      goto LABEL_132;
    case 81:
      v6 = CFSTR("CANNOT_UNBLOCK_NON_BRIDGE_ACCESSORY");
      goto LABEL_132;
    case 82:
      v6 = CFSTR("DEVICE_LOCKED");
      goto LABEL_132;
    case 83:
      v6 = CFSTR("CANNOT_REMOVE_BUILTIN_ACTION_SET");
      goto LABEL_132;
    case 84:
      v6 = CFSTR("LOCATION_FOR_HOME_DISABLED");
      goto LABEL_132;
    case 85:
      v6 = CFSTR("NOT_AUTHORIZED_FOR_LOCATION_SERVICES");
      goto LABEL_132;
    case 86:
      v6 = CFSTR("REFER_TO_USER_MANUAL");
      goto LABEL_132;
    case 87:
      v6 = CFSTR("MISSING_OR_INVALID_AUTHORIZATION_DATA");
      goto LABEL_132;
    case 88:
      v6 = CFSTR("BRIDGED_ACCESSORY_NOT_REACHABLE");
      goto LABEL_132;
    case 89:
      v6 = CFSTR("NOT_AUTHORIZED_FOR_MICROPHONE_ACCESS");
      goto LABEL_132;
    case 90:
      v6 = CFSTR("INCOMPATIBLE_WIFI_NETWORK");
      goto LABEL_132;
    case 91:
      v6 = CFSTR("NO_HOME_HUB");
      goto LABEL_132;
    case 92:
      v6 = CFSTR("NO_COMPATIBLE_HOME_HUB");
      goto LABEL_132;
    case 93:
      v6 = CFSTR("INCOMPATIBLE_ACCESSORY");
      goto LABEL_132;
    case 95:
      v6 = CFSTR("OBJECT_WITH_SIMILAR_NAME_EXISTS");
      goto LABEL_132;
    case 96:
      v6 = CFSTR("OWNERSHIP_FAILURE");
      goto LABEL_132;
    case 97:
      v6 = CFSTR("MAXIMUM_ACCESSORIES_OF_TYPE_IN_HOME");
      goto LABEL_132;
    case 98:
      v6 = CFSTR("WIFI_CREDENTIAL_GENERATION_FAILED");
      goto LABEL_132;
    default:
      v8 = objc_msgSend(v5, "code");
      if (v8 > 2299)
      {
        if (v8 > 2499)
        {
          switch(v8)
          {
            case 2500:
              v6 = CFSTR("CONFIG_RESET");
              break;
            case 2501:
              v6 = CFSTR("HOME_UI_SERVICE_TERMINATED");
              break;
            case 2502:
              v6 = CFSTR("HOME_UI_SERVICE_BACKGROUNDED");
              break;
            case 2503:
              v6 = CFSTR("NO_CLIENTS");
              break;
            case 2504:
              v6 = CFSTR("ACCESSORY_BROWSER_STOPPED");
              break;
            default:
              goto LABEL_129;
          }
          goto LABEL_132;
        }
        switch(v8)
        {
          case 2300:
            v6 = CFSTR("VOICE_SHORTCUT_WITH_SIMILAR_NAME_EXISTS");
            goto LABEL_132;
          case 2404:
            v6 = CFSTR("OPERATION_STARTED");
            goto LABEL_132;
          case 2405:
            v6 = CFSTR("ACCESSORY_IS_CALIBRATING");
            goto LABEL_132;
        }
LABEL_129:
        v9 = objc_msgSend(v5, "code");
        if ((unint64_t)(v9 - 1001) > 8)
          goto LABEL_131;
        v6 = off_1E3AAE630[v9 - 1001];
        goto LABEL_132;
      }
      if (v8 <= 2099)
      {
        v6 = CFSTR("OPERATION_CANCELED_BY_USER");
        switch(v8)
        {
          case 2001:
            goto LABEL_132;
          case 2002:
            v6 = CFSTR("INCORRECT_SETUP_CODE");
            break;
          case 2003:
            v6 = CFSTR("SECURE_ACCESS_DENIED");
            break;
          case 2004:
            v6 = CFSTR("UNSUPPORTED_SETUP_PAYLOAD");
            break;
          case 2005:
            v6 = CFSTR("MEDIA_REMOTE_ERROR");
            break;
          case 2007:
            v6 = CFSTR("CLOUD_PHOTO_LIBRARY_NOT_ENABLED");
            break;
          default:
            goto LABEL_129;
        }
        goto LABEL_132;
      }
      if (v8 == 2100)
      {
        v6 = CFSTR("NO_TARGET_ACCESSORY");
        goto LABEL_132;
      }
      if (v8 == 2200)
      {
        v6 = CFSTR("INVALID_CHARACTERS");
        goto LABEL_132;
      }
      if (v8 != 2201)
        goto LABEL_129;
      v6 = CFSTR("PASSWORD_WEAK");
LABEL_132:

      v10 = v6;
      +[HMLocalization sharedManager](HMLocalization, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getLocalizedString:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("UNKNOWN_ERROR_CODE")))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
      objc_msgSend(v5, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2D50]);
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v5, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v5, "code");
      v21 = (void *)objc_msgSend(v17, "copy");
      v7 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, v20, v21);

LABEL_137:
      return v7;
  }
}

- (void)invokeBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)callCompletion:(id)a3 error:(id)a4 obj:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__HMDelegateCaller_callCompletion_error_obj___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 value:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__HMDelegateCaller_callCompletion_value_error___block_invoke;
  v12[3] = &unk_1E3AB19C0;
  v13 = v9;
  v14 = v8;
  v15 = a4;
  v12[4] = self;
  v10 = v9;
  v11 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v12);

}

- (void)callCompletion:(id)a3 errorString:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HMDelegateCaller_callCompletion_errorString___block_invoke;
  v10[3] = &unk_1E3AB60A0;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v10);

}

- (void)callCompletion:(id)a3 error:(id)a4 dictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HMDelegateCaller_callCompletion_error_dictionary___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 isUsingHomeKit:(BOOL)a4 isUsingCloudServices:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HMDelegateCaller_callCompletion_isUsingHomeKit_isUsingCloudServices_error___block_invoke;
  v14[3] = &unk_1E3AAE150;
  v15 = v11;
  v16 = v10;
  v17 = a4;
  v18 = a5;
  v14[4] = self;
  v12 = v11;
  v13 = v10;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 home:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_home_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 room:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_room_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 zone:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_zone_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 serviceGroup:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_serviceGroup_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 actionSet:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HMDelegateCaller_callCompletion_actionSet_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 eventTrigger:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_eventTrigger_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 timerTrigger:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_timerTrigger_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 error:(id)a4 BOOLValue:(BOOL)a5 array:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__HMDelegateCaller_callCompletion_error_BOOLValue_array___block_invoke;
  v16[3] = &unk_1E3AB22A0;
  v16[4] = self;
  v17 = v11;
  v20 = a5;
  v18 = v12;
  v19 = v10;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v16);

}

- (void)callCompletion:(id)a3 error:(id)a4 array:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__HMDelegateCaller_callCompletion_error_array___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 array:(id)a4 additionalAccessoryInfo:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HMDelegateCaller *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__HMDelegateCaller_callCompletion_array_additionalAccessoryInfo_error___block_invoke;
  v18[3] = &unk_1E3AB52E0;
  v22 = v13;
  v23 = v10;
  v19 = v11;
  v20 = v12;
  v21 = self;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v18);

}

- (void)callCompletion:(id)a3 invitations:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HMDelegateCaller_callCompletion_invitations_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 user:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_user_error___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 error:(id)a4 snapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDelegateCaller *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HMDelegateCaller_callCompletion_error_snapshot___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v15 = v10;
  v16 = self;
  v17 = v9;
  v18 = v8;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 error:(id)a4 proxiedDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HMDelegateCaller_callCompletion_error_proxiedDevice___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 error:(id)a4 mediaSystem:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HMDelegateCaller_callCompletion_error_mediaSystem___block_invoke;
  v14[3] = &unk_1E3AB4D20;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

- (void)callCompletion:(id)a3 value:(BOOL)a4 conflictName:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__HMDelegateCaller_callCompletion_value_conflictName_error___block_invoke;
  v16[3] = &unk_1E3AB19C0;
  v18 = v12;
  v19 = v10;
  v20 = a4;
  v17 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v16);

}

- (void)callCompletion:(id)a3 service:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__HMDelegateCaller_callCompletion_service_error___block_invoke;
  v14[3] = &unk_1E3AB5C58;
  v16 = v10;
  v17 = v8;
  v15 = v9;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HMDelegateCaller invokeBlock:](self, "invokeBlock:", v14);

}

uint64_t __49__HMDelegateCaller_callCompletion_service_error___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

uint64_t __60__HMDelegateCaller_callCompletion_value_conflictName_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

void __53__HMDelegateCaller_callCompletion_error_mediaSystem___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 48));

  }
}

void __55__HMDelegateCaller_callCompletion_error_proxiedDevice___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 48));

  }
}

void __50__HMDelegateCaller_callCompletion_error_snapshot___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __46__HMDelegateCaller_callCompletion_user_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __53__HMDelegateCaller_callCompletion_invitations_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __71__HMDelegateCaller_callCompletion_array_additionalAccessoryInfo_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_localizedError:", *(_QWORD *)(a1 + 56));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);

  }
}

void __47__HMDelegateCaller_callCompletion_error_array___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 48));

  }
}

void __57__HMDelegateCaller_callCompletion_error_BOOLValue_array___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v1 + 16))(v1, v3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
}

void __54__HMDelegateCaller_callCompletion_timerTrigger_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __54__HMDelegateCaller_callCompletion_eventTrigger_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __51__HMDelegateCaller_callCompletion_actionSet_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __54__HMDelegateCaller_callCompletion_serviceGroup_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __46__HMDelegateCaller_callCompletion_zone_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __46__HMDelegateCaller_callCompletion_room_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __46__HMDelegateCaller_callCompletion_home_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_localizedError:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __77__HMDelegateCaller_callCompletion_isUsingHomeKit_isUsingCloudServices_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    v3 = *(unsigned __int8 *)(a1 + 57);
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);

  }
}

void __52__HMDelegateCaller_callCompletion_error_dictionary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 48));

  }
}

uint64_t __47__HMDelegateCaller_callCompletion_errorString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __47__HMDelegateCaller_callCompletion_value_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

void __45__HMDelegateCaller_callCompletion_error_obj___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedError:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 48));

  }
}

+ (id)delegateCallerWithOperationQueue:(id)a3
{
  id v3;
  __HMOperationQueueDelegateCaller *v4;

  v3 = a3;
  v4 = -[__HMOperationQueueDelegateCaller initWithOperationQueue:]([__HMOperationQueueDelegateCaller alloc], "initWithOperationQueue:", v3);

  return v4;
}

@end
