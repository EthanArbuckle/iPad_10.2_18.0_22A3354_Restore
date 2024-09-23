@implementation NSError(CoreBluetooth)

+ (id)errorWithInfo:()CoreBluetooth
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  NSObject *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  void *v73;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("CBErrorDomain");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "integerValue");
  if (v7 > 901)
  {
    if (v7 > 1501)
    {
      if (v7 <= 1899)
      {
        switch(v7)
        {
          case 1800:
            v13 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Invalid PSM");
            v10 = 21;
            v5 = v13;
            break;
          case 1801:
            v60 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("PSM already registered");
            v10 = 22;
            v5 = v60;
            break;
          case 1802:
            v61 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("No resources available for L2CAP");
            v10 = 23;
            v5 = v61;
            break;
          case 1803:
            v62 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("L2CAP PSM already connected");
            v10 = 24;
            v5 = v62;
            break;
          case 1804:
            v63 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("No such L2CAP connection");
            v10 = 25;
            v5 = v63;
            break;
          case 1805:
            v64 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("L2CAP - failed to register socket pipe");
            v10 = 26;
            v5 = v64;
            break;
          default:
            switch(v7)
            {
              case 1700:
                v15 = CFSTR("CBInternalErrorDomain");

                v8 = CFSTR("No remoteId/stableId");
                v10 = 33;
                v5 = v15;
                break;
              case 1701:
                v68 = CFSTR("CBInternalErrorDomain");

                v8 = CFSTR("WHB Device not found");
                v10 = 48;
                v5 = v68;
                break;
              case 1702:
                v69 = CFSTR("CBInternalErrorDomain");

                v8 = CFSTR("WHB Device is not enabled");
                v10 = 49;
                v5 = v69;
                break;
              case 1703:
                v70 = CFSTR("CBInternalErrorDomain");

                v8 = CFSTR("WHB Connection is interuppted");
                v10 = 51;
                v5 = v70;
                break;
              default:
                if (v7 == 1502)
                {
                  v18 = CFSTR("CBInternalErrorDomain");

                  v8 = CFSTR("Current client did not configure RSSI detection for this device. Client cannot change existing configuration from a different client");
                  v10 = 20;
                  v5 = v18;
                }
                else
                {
LABEL_129:
                  if (objc_msgSend(v4, "integerValue", v8) < 1001 || objc_msgSend(v4, "integerValue") > 1255)
                  {
                    if (CBLogInitOnce != -1)
                      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
                    v73 = (void *)CBLogComponent;
                    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
                      +[NSError(CoreBluetooth) errorWithInfo:].cold.1(v73, v4);
LABEL_136:
                    v10 = 0;
                    v8 = CFSTR("Unknown error.");
                  }
                  else
                  {
                    v72 = CFSTR("CBATTErrorDomain");

                    v10 = objc_msgSend(v4, "integerValue") - 1000;
                    v8 = CFSTR("Unknown ATT error.");
                    v5 = v72;
                  }
                }
                break;
            }
            break;
        }
      }
      else if (v7 <= 2499)
      {
        switch(v7)
        {
          case 1900:
            v14 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("RFCOMM invalid channel ID");
            v10 = 27;
            v5 = v14;
            break;
          case 1901:
            v65 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("No such RFCOMM connection");
            v10 = 28;
            v5 = v65;
            break;
          case 1902:
            v66 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("RFCOMM channel already connected");
            v10 = 29;
            v5 = v66;
            break;
          case 1903:
            v67 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("RFCOMM - failed to register socket pipe");
            v10 = 30;
            v5 = v67;
            break;
          default:
            if (v7 == 2000)
            {
              v34 = CFSTR("CBInternalErrorDomain");

              v8 = CFSTR("Peer LEA connection stalled");
LABEL_127:
              v10 = 15;
              v5 = v34;
            }
            else
            {
              if (v7 != 2200)
                goto LABEL_129;
              v17 = CFSTR("CBInternalErrorDomain");

              v8 = CFSTR("Failed to resolve address with provided IRK");
              v10 = 41;
              v5 = v17;
            }
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 2500:
            v12 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Peer removed pairing information for the pipe");
            v10 = 52;
            v5 = v12;
            break;
          case 2501:
            v54 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("The Pipe connection has timed out unexpectedly");
            v10 = 53;
            v5 = v54;
            break;
          case 2502:
            v55 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("The specified device has disconnected the pipe");
            v10 = 54;
            v5 = v55;
            break;
          case 2503:
            v56 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Pipe MIC failure");
            v10 = 55;
            v5 = v56;
            break;
          case 2504:
            v57 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("The Pipe connection has failed unexpectedly");
            v10 = 56;
            v5 = v57;
            break;
          case 2505:
            v58 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Peer removed service using the pipe");
            v10 = 57;
            v5 = v58;
            break;
          case 2506:
            v59 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Local device unregistered service using the pipe");
            v10 = 58;
            v5 = v59;
            break;
          default:
            goto LABEL_129;
        }
      }
    }
    else
    {
      switch(v7)
      {
        case 902:
        case 905:
          v8 = CFSTR("The specified UUID is not allowed for this operation.");
          v10 = 8;
          break;
        case 903:
        case 904:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1018:
          goto LABEL_129;
        case 914:
          v19 = CFSTR("CBInternalErrorDomain");

          v8 = CFSTR("LE Connection update failed - same params");
          v10 = 45;
          v5 = v19;
          break;
        case 915:
          v20 = CFSTR("CBInternalErrorDomain");

          v8 = CFSTR("Combined connection latency for device not as requested");
          v10 = 46;
          v5 = v20;
          break;
        case 1001:
          v21 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The handle is invalid.");
LABEL_75:
          v10 = 1;
          v5 = v21;
          break;
        case 1002:
          v22 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Reading is not permitted.");
LABEL_77:
          v10 = 2;
          v5 = v22;
          break;
        case 1003:
          v23 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Writing is not permitted.");
LABEL_79:
          v10 = 3;
          v5 = v23;
          break;
        case 1004:
          v24 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The command is invalid.");
LABEL_81:
          v10 = 4;
          v5 = v24;
          break;
        case 1005:
          v25 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Authentication is insufficient.");
LABEL_83:
          v10 = 5;
          v5 = v25;
          break;
        case 1006:
          v26 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The request is not supported.");
LABEL_85:
          v10 = 6;
          v5 = v26;
          break;
        case 1007:
          v27 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The offset is invalid.");
LABEL_87:
          v10 = 7;
          v5 = v27;
          break;
        case 1008:
          v28 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Authorization is insufficient.");
LABEL_61:
          v10 = 8;
          v5 = v28;
          break;
        case 1009:
          v29 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The prepare queue is full.");
LABEL_63:
          v10 = 9;
          v5 = v29;
          break;
        case 1010:
          v11 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The attribute could not be found.");
LABEL_37:
          v10 = 10;
          v5 = v11;
          break;
        case 1011:
          v30 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The attribute is not long.");
LABEL_68:
          v10 = 11;
          v5 = v30;
          break;
        case 1012:
          v31 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The encryption key size is insufficient.");
LABEL_57:
          v10 = 12;
          v5 = v31;
          break;
        case 1013:
          v32 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The value's length is invalid.");
          goto LABEL_46;
        case 1014:
          v33 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Unlikely error.");
LABEL_100:
          v10 = 14;
          v5 = v33;
          break;
        case 1015:
          v34 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Encryption is insufficient.");
          goto LABEL_127;
        case 1016:
          v35 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("The group type is unsupported.");
LABEL_72:
          v10 = 16;
          v5 = v35;
          break;
        case 1017:
          v36 = CFSTR("CBATTErrorDomain");

          v8 = CFSTR("Resources are insufficient.");
LABEL_70:
          v10 = 17;
          v5 = v36;
          break;
        case 1019:
          v32 = CFSTR("CBInternalErrorDomain");

          v8 = CFSTR("Peer failed to respond to ATT value indication");
LABEL_46:
          v10 = 13;
          v5 = v32;
          break;
        default:
          if (v7 == 1500)
          {
            v71 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("RSSI Detection already configured for this device");
            v10 = 18;
            v5 = v71;
          }
          else
          {
            if (v7 != 1501)
              goto LABEL_129;
            v16 = CFSTR("CBInternalErrorDomain");

            v8 = CFSTR("Cannot remove RSSI detection configuration. Not configured for this device.");
            v10 = 19;
            v5 = v16;
          }
          break;
      }
    }
LABEL_137:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, v10, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v8 = CFSTR("One or more parameters were invalid.");
    v10 = 1;
    switch(v7)
    {
      case 0:
        break;
      case 1:
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v37 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          +[NSError(CoreBluetooth) errorWithInfo:].cold.2(v37);
        goto LABEL_136;
      case 3:
        goto LABEL_137;
      case 4:
        v8 = CFSTR("There is not enough space to complete the operation.");
        v10 = 4;
        goto LABEL_137;
      case 6:
        v8 = CFSTR("The operation was cancelled.");
        v10 = 5;
        goto LABEL_137;
      case 7:
        v8 = CFSTR("The specified handle was not valid.");
        v10 = 2;
        goto LABEL_137;
      case 8:
        v8 = CFSTR("Device is invalid.");
        v10 = 12;
        goto LABEL_137;
      case 11:
        v8 = CFSTR("Operation is not supported.");
        v10 = 13;
        goto LABEL_137;
      case 12:
        v31 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Invalid state");
        goto LABEL_57;
      case 17:
      case 162:
        v11 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Operation is not allowed");
        goto LABEL_37;
      case 20:
        v38 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Client Initiated operation");
        v10 = 35;
        v5 = v38;
        goto LABEL_137;
      case 21:
        v39 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Invalid IRK");
        v10 = 40;
        v5 = v39;
        goto LABEL_137;
      case 116:
        v28 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Local address is being refreshed.");
        goto LABEL_61;
      case 117:
        v29 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Peer device LE GATT Disabled.");
        goto LABEL_63;
      case 122:
        v8 = CFSTR("Advertising has already started.");
        v10 = 9;
        goto LABEL_137;
      case 123:
        v10 = 0;
        v8 = CFSTR("Advertising is not started.");
        goto LABEL_137;
      case 156:
        v30 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as the Pincode was incorrect.");
        goto LABEL_68;
      case 158:
        v30 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as the Pincode or Link Key was incorrect.");
        goto LABEL_68;
      case 161:
        v36 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing was cancelled.");
        goto LABEL_70;
      case 166:
        v35 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing Failed due to too many attempts");
        goto LABEL_72;
      case 167:
        v40 = CFSTR("CBInternalErrorDomain");

        v10 = 0;
        v8 = CFSTR("Pairing failed as the passcode was incorrect.");
        v5 = v40;
        goto LABEL_137;
      case 168:
        v21 = CFSTR("CBInternalErrorDomain");

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceOriginalUUID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("CBOriginalPeerIdentifierErrorKey"));

        v8 = CFSTR("Pairing failed as this device is already paired.");
        goto LABEL_75;
      case 170:
        v22 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as confirm value failed.");
        goto LABEL_77;
      case 171:
        v23 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as the security timeout elapsed");
        goto LABEL_79;
      case 172:
        v24 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as there was no response from user to pairing request");
        goto LABEL_81;
      case 173:
        v25 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as DHKEY Check failed");
        goto LABEL_83;
      case 174:
        v26 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as numeric comparison failed failed");
        goto LABEL_85;
      case 176:
        v27 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Pairing failed as numeric comparison failed failed");
        goto LABEL_87;
      case 179:
        v8 = CFSTR("Peer removed pairing information");
        v10 = 14;
        goto LABEL_137;
      case 180:
        v8 = CFSTR("Too many LE devices are paired to this device");
        v10 = 16;
        goto LABEL_137;
      case 182:
        v42 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("MIC failure");
        v10 = 31;
        v5 = v42;
        goto LABEL_137;
      case 202:
        v43 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Local device is powered off.");
        v10 = 32;
        v5 = v43;
        goto LABEL_137;
      case 305:
        v8 = CFSTR("The connection has failed unexpectedly.");
        v10 = 10;
        goto LABEL_137;
      case 307:
        v8 = CFSTR("The connection has timed out unexpectedly.");
        v10 = 6;
        goto LABEL_137;
      case 309:
        v8 = CFSTR("The system has reached the maximum number of connections");
        v10 = 11;
        goto LABEL_137;
      case 312:
        v8 = CFSTR("The specified device is not connected.");
        v10 = 3;
        goto LABEL_137;
      case 313:
        v8 = CFSTR("The specified device has disconnected from us.");
        v10 = 7;
        goto LABEL_137;
      case 315:
        v8 = CFSTR("Failed to encrypt the connection, the connection has timed out unexpectedly.");
        v10 = 15;
        goto LABEL_137;
      case 329:
        v8 = CFSTR("Page timeout");
        v10 = 10;
        goto LABEL_137;
      case 336:
        v33 = CFSTR("CBInternalErrorDomain");

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgNumberOfConnectedDevicesForUseCase"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("CBNumberOfConnectionsForUseCase"));

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUseCase"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("CBConnectionUseCase"));

        v8 = CFSTR("The system has reached the maximum number of connections for this use case");
        goto LABEL_100;
      case 341:
        v46 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Unknown or not an allowed internal client to use BLE");
        v10 = 34;
        v5 = v46;
        goto LABEL_137;
      case 342:
        v47 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("LE Scan timed out or total time achieved");
        v10 = 36;
        v5 = v47;
        goto LABEL_137;
      case 343:
        v48 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("LE Connection disallowed due to Deny or Allow List");
        v10 = 39;
        v5 = v48;
        goto LABEL_137;
      case 344:
        v49 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("LE Connection Scan timed out or total time achieved");
        v10 = 42;
        v5 = v49;
        goto LABEL_137;
      case 345:
        v50 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("The system has reached the maximum number of connections for this client");
        v10 = 47;
        v5 = v50;
        goto LABEL_137;
      case 346:
        v51 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("LE Connection Requested without Client BundleID when it is required");
        v10 = 43;
        v5 = v51;
        goto LABEL_137;
      case 347:
        v52 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Reached maximum allowed for the number of both direct and indirect connections for a client bundleID");
        v10 = 44;
        v5 = v52;
        goto LABEL_137;
      case 348:
        v53 = CFSTR("CBInternalErrorDomain");

        v8 = CFSTR("Use case is not provided when it is required");
        v10 = 50;
        v5 = v53;
        goto LABEL_137;
      default:
        goto LABEL_129;
    }
  }

  return v9;
}

+ (void)errorWithInfo:()CoreBluetooth .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "integerValue");
  _os_log_error_impl(&dword_1A82A2000, v3, OS_LOG_TYPE_ERROR, "WARNING: Unknown error: %ld", (uint8_t *)&v4, 0xCu);

}

+ (void)errorWithInfo:()CoreBluetooth .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "Received lame BT_ERROR", v1, 2u);
}

@end
