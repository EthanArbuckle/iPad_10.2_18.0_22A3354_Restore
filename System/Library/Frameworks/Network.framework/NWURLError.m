@implementation NWURLError

- (id)userInfo
{
  NWURLErrorUserInfoDictionary *v3;

  v3 = objc_alloc_init(NWURLErrorUserInfoDictionary);
  -[NWURLErrorUserInfoDictionary setError:](v3, "setError:", self);
  return v3;
}

- (NWURLError)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NSCode"));
  if (self)
  {
    v6 = *MEMORY[0x1E0CB32E8];
    v15.receiver = self;
    v15.super_class = (Class)NWURLError;
    self = -[NWURLError initWithDomain:code:userInfo:](&v15, sel_initWithDomain_code_userInfo_, v6, v5, 0);
    if (self)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingError"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setUnderlyingError:](self, "setUnderlyingError:", v7);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failingURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setFailingURL:](self, "setFailingURL:", v8);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkUnavailableReason"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setNetworkUnavailableReason:](self, "setNetworkUnavailableReason:", v9);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webSocketHandshakeFailureReason"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setWebSocketHandshakeFailureReason:](self, "setWebSocketHandshakeFailureReason:", v10);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyProxyFailure"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setPrivacyProxyFailure:](self, "setPrivacyProxyFailure:", v11);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vpnInactiveFailure"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setVpnInactiveFailure:](self, "setVpnInactiveFailure:", v12);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadTaskResumeData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setDownloadTaskResumeData:](self, "setDownloadTaskResumeData:", v13);

    }
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NWURLError code](self, "code"), CFSTR("NSCode"));
  -[NWURLError underlyingError](self, "underlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("underlyingError"));

  -[NWURLError failingURL](self, "failingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("failingURL"));

  -[NWURLError networkUnavailableReason](self, "networkUnavailableReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("networkUnavailableReason"));

  -[NWURLError webSocketHandshakeFailureReason](self, "webSocketHandshakeFailureReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("webSocketHandshakeFailureReason"));

  -[NWURLError privacyProxyFailure](self, "privacyProxyFailure");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("privacyProxyFailure"));

  -[NWURLError vpnInactiveFailure](self, "vpnInactiveFailure");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("vpnInactiveFailure"));

  -[NWURLError downloadTaskResumeData](self, "downloadTaskResumeData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("downloadTaskResumeData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NWURLError *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = +[NWURLError allocWithZone:](NWURLError, "allocWithZone:", a3);
  v5 = -[NWURLError code](self, "code");
  if (v4)
  {
    v6 = *MEMORY[0x1E0CB32E8];
    v17.receiver = v4;
    v17.super_class = (Class)NWURLError;
    v4 = -[NWURLError initWithDomain:code:userInfo:](&v17, sel_initWithDomain_code_userInfo_, v6, v5, 0);
  }
  -[NWURLError underlyingError](self, "underlyingError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setUnderlyingError:](v4, "setUnderlyingError:", v7);

  -[NWURLError failingURL](self, "failingURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setFailingURL:](v4, "setFailingURL:", v8);

  -[NWURLError setPeerTrust:](v4, "setPeerTrust:", -[NWURLError peerTrust](self, "peerTrust"));
  -[NWURLError networkUnavailableReason](self, "networkUnavailableReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setNetworkUnavailableReason:](v4, "setNetworkUnavailableReason:", v9);

  -[NWURLError webSocketHandshakeFailureReason](self, "webSocketHandshakeFailureReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setWebSocketHandshakeFailureReason:](v4, "setWebSocketHandshakeFailureReason:", v10);

  -[NWURLError privacyProxyFailure](self, "privacyProxyFailure");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setPrivacyProxyFailure:](v4, "setPrivacyProxyFailure:", v11);

  -[NWURLError path](self, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setPath:](v4, "setPath:", v12);

  -[NWURLError vpnInactiveFailure](self, "vpnInactiveFailure");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setVpnInactiveFailure:](v4, "setVpnInactiveFailure:", v13);

  -[NWURLError resolutionReport](self, "resolutionReport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setResolutionReport:](v4, "setResolutionReport:", v14);

  -[NWURLError downloadTaskResumeData](self, "downloadTaskResumeData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setDownloadTaskResumeData:](v4, "setDownloadTaskResumeData:", v15);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NWURLError setPeerTrust:](self, "setPeerTrust:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NWURLError;
  -[NWURLError dealloc](&v3, sel_dealloc);
}

- (id)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[NWURLError code](self, "code");
  -[NWURLError failingURL](self, "failingURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CFNetworkErrorCopyLocalizedDescriptionWithHostname();

  return v5;
}

- (id)localizedFailureReason
{
  -[NWURLError code](self, "code");
  return (id)_CFNetworkErrorGetLocalizedFailureReason();
}

- (id)localizedRecoverySuggestion
{
  -[NWURLError code](self, "code");
  return (id)_CFNetworkErrorGetLocalizedRecoverySuggestion();
}

- (void)setPeerTrust:(__SecTrust *)a3
{
  __SecTrust *peerTrust;

  if (a3)
    CFRetain(a3);
  peerTrust = self->_peerTrust;
  if (peerTrust)
    CFRelease(peerTrust);
  self->_peerTrust = a3;
}

- (void)fillErrorForLoader:(id)a3 andTask:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  nw_path_t v9;
  NSObject *v10;
  int isa_high;
  void *v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v19 = a3;
  v6 = a4;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v19, "underlyingConnection");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        v9 = nw_connection_copy_current_path(v7);
        if (v9)
        {
          -[NWURLError setPath:](self, "setPath:", v9);
          v10 = v9;
          isa_high = HIDWORD(v10[47].isa);

          switch(isa_high)
          {
            case 5:
              v12 = &unk_1E14E08F8;
              goto LABEL_10;
            case 26:
              v12 = &unk_1E14E0910;
              goto LABEL_10;
            case 27:
              v12 = &unk_1E14E08E0;
LABEL_10:
              -[NWURLError setNetworkUnavailableReason:](self, "setNetworkUnavailableReason:", v12);
              break;
            case 30:
              -[NWURLError setVpnInactiveFailure:](self, "setVpnInactiveFailure:", MEMORY[0x1E0C9AAB0]);
              break;
            default:
              break;
          }
        }
        v13 = v8;
        v23 = 0;
        v24 = &v23;
        v26 = 0;
        v25 = 0x2020000000;
        v14 = v13 + 34;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __nw_connection_get_privacy_stance_block_invoke;
        v20[3] = &unk_1E14ACE40;
        v22 = &v23;
        v15 = v13;
        v21 = v15;
        os_unfair_lock_lock(v14);
        __nw_connection_get_privacy_stance_block_invoke((uint64_t)v20);
        os_unfair_lock_unlock(v14);
        LODWORD(v14) = *((_DWORD *)v24 + 6);

        _Block_object_dispose(&v23, 8);
        if ((_DWORD)v14 == 3)
          -[NWURLError setPrivacyProxyFailure:](self, "setPrivacyProxyFailure:", MEMORY[0x1E0C9AAB0]);
        v16 = nw_connection_copy_failed_resolution_report(v15);
        -[NWURLError setResolutionReport:](self, "setResolutionReport:", v16);

      }
    }
  }
  if (v6)
  {
    objc_msgSend(v6, "currentRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLError setFailingURL:](self, "setFailingURL:", v18);

    -[NWURLError setPeerTrust:](self, "setPeerTrust:", objc_msgSend(v6, "secTrust"));
  }

}

- (int64_t)translateCodeForError:(__CFError *)a3
{
  CFIndex Code;
  CFErrorDomain Domain;
  CFErrorDomain v8;
  CFErrorDomain v9;

  Code = CFErrorGetCode(a3);
  Domain = CFErrorGetDomain(a3);
  if (CFEqual(Domain, CFSTR("kNWErrorDomainDNS")) && Code >= -65792 && Code <= -65537)
    return -[NWURLError translateDNSError:](self, "translateDNSError:", Code);
  v8 = CFErrorGetDomain(a3);
  if (CFEqual(v8, CFSTR("NSOSStatusErrorDomain")) && Code >= -9899 && Code <= -9800)
    return -[NWURLError translateTLSError:](self, "translateTLSError:", Code);
  v9 = CFErrorGetDomain(a3);
  if (CFEqual(v9, CFSTR("NSPOSIXErrorDomain")))
    return -[NWURLError translatePOSIXError:](self, "translatePOSIXError:", Code);
  else
    return -1;
}

- (int64_t)translateDNSError:(int64_t)a3
{
  int64_t v3;

  v3 = -1006;
  if (a3 == -65568)
    v3 = -1001;
  if (a3 == -65554)
    v3 = -1003;
  if (a3 == -65538)
    return -1003;
  else
    return v3;
}

- (int64_t)translateTLSError:(int64_t)a3
{
  if ((unint64_t)(a3 + 9853) > 0x2E)
    return -1200;
  else
    return *((_QWORD *)&unk_183C6EF40 + a3 + 9853);
}

- (int64_t)translatePOSIXError:(int64_t)a3
{
  int64_t result;

  result = -1;
  switch(a3)
  {
    case 13:
    case 49:
    case 51:
    case 59:
    case 61:
    case 64:
    case 65:
      result = -1004;
      break;
    case 22:
      result = -1000;
      break;
    case 32:
    case 35:
    case 40:
    case 52:
    case 53:
    case 54:
    case 57:
    case 60:
    case 96:
    case 100:
      result = -1005;
      break;
    case 39:
      result = -1010;
      break;
    case 41:
    case 42:
      result = -1011;
      break;
    case 43:
      result = -1002;
      break;
    case 46:
      result = -1008;
      break;
    case 50:
      result = -1009;
      break;
    case 79:
      result = -1016;
      break;
    case 80:
      result = -1013;
      break;
    case 89:
      result = -999;
      break;
    case 91:
      result = -1014;
      break;
    case 92:
      result = -1015;
      break;
    case 94:
      result = -1017;
      break;
    default:
      return result;
  }
  return result;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (NSURL)failingURL
{
  return self->_failingURL;
}

- (void)setFailingURL:(id)a3
{
  objc_storeStrong((id *)&self->_failingURL, a3);
}

- (__SecTrust)peerTrust
{
  return self->_peerTrust;
}

- (NSNumber)networkUnavailableReason
{
  return self->_networkUnavailableReason;
}

- (void)setNetworkUnavailableReason:(id)a3
{
  objc_storeStrong((id *)&self->_networkUnavailableReason, a3);
}

- (NSNumber)webSocketHandshakeFailureReason
{
  return self->_webSocketHandshakeFailureReason;
}

- (void)setWebSocketHandshakeFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_webSocketHandshakeFailureReason, a3);
}

- (NSNumber)privacyProxyFailure
{
  return self->_privacyProxyFailure;
}

- (void)setPrivacyProxyFailure:(id)a3
{
  objc_storeStrong((id *)&self->_privacyProxyFailure, a3);
}

- (NSNumber)vpnInactiveFailure
{
  return self->_vpnInactiveFailure;
}

- (void)setVpnInactiveFailure:(id)a3
{
  objc_storeStrong((id *)&self->_vpnInactiveFailure, a3);
}

- (OS_nw_path)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (OS_nw_resolution_report)resolutionReport
{
  return self->_resolutionReport;
}

- (void)setResolutionReport:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionReport, a3);
}

- (NSData)downloadTaskResumeData
{
  return self->_downloadTaskResumeData;
}

- (void)setDownloadTaskResumeData:(id)a3
{
  objc_storeStrong((id *)&self->_downloadTaskResumeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTaskResumeData, 0);
  objc_storeStrong((id *)&self->_resolutionReport, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_vpnInactiveFailure, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailure, 0);
  objc_storeStrong((id *)&self->_webSocketHandshakeFailureReason, 0);
  objc_storeStrong((id *)&self->_networkUnavailableReason, 0);
  objc_storeStrong((id *)&self->_failingURL, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
}

+ (NSDictionary)allUserInfoKeys
{
  if (allUserInfoKeys_onceToken[0] != -1)
    dispatch_once(allUserInfoKeys_onceToken, &__block_literal_global_76779);
  return (NSDictionary *)(id)allUserInfoKeys_keys;
}

void __29__NWURLError_allUserInfoKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[13];
  _QWORD v16[15];

  v16[13] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0CB2D50];
  NSStringFromSelector(sel_localizedDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = *MEMORY[0x1E0CB2D68];
  NSStringFromSelector(sel_localizedFailureReason);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v15[2] = *MEMORY[0x1E0CB2D80];
  NSStringFromSelector(sel_localizedRecoverySuggestion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  v15[3] = *MEMORY[0x1E0CB3388];
  NSStringFromSelector(sel_underlyingError);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v0;
  v15[4] = *MEMORY[0x1E0CB32F0];
  NSStringFromSelector(sel_failingURL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v1;
  v15[5] = *MEMORY[0x1E0CB32F8];
  NSStringFromSelector(sel_peerTrust);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v2;
  v15[6] = *MEMORY[0x1E0CB3310];
  NSStringFromSelector(sel_networkUnavailableReason);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v3;
  v15[7] = *MEMORY[0x1E0C92FC8];
  NSStringFromSelector(sel_webSocketHandshakeFailureReason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v4;
  v15[8] = *MEMORY[0x1E0C92FB8];
  NSStringFromSelector(sel_privacyProxyFailure);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v5;
  v15[9] = *MEMORY[0x1E0C92FA8];
  NSStringFromSelector(sel_path);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v6;
  v15[10] = *MEMORY[0x1E0C92FC0];
  NSStringFromSelector(sel_vpnInactiveFailure);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v7;
  v15[11] = *MEMORY[0x1E0C92FB0];
  NSStringFromSelector(sel_resolutionReport);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v8;
  v15[12] = *MEMORY[0x1E0C92BB8];
  NSStringFromSelector(sel_downloadTaskResumeData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allUserInfoKeys_keys;
  allUserInfoKeys_keys = v10;

}

- (void)initWithNWError:(void *)a3 forLoader:(void *)a4 andTask:
{
  id v7;
  id v8;
  NSObject *v9;
  CFErrorRef v10;
  CFErrorRef v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = a2;
    v10 = nw_error_copy_cf_error(v9);
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(a1, "translateCodeForError:", v10);
      v13 = *MEMORY[0x1E0CB32E8];
      v16.receiver = a1;
      v16.super_class = (Class)NWURLError;
      v14 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v13, v12, 0);
      if (v14)
      {
        a1 = v14;
        objc_msgSend(v14, "setUnderlyingError:", v11);

        objc_msgSend(a1, "fillErrorForLoader:andTask:", v7, v8);
        goto LABEL_8;
      }
      CFRelease(v11);
    }
    else
    {

    }
    a1 = 0;
  }
LABEL_8:

  return a1;
}

@end
