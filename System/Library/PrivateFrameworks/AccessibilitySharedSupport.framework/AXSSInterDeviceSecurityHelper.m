@implementation AXSSInterDeviceSecurityHelper

- (AXSSInterDeviceSecurityHelper)init
{
  AXSSInterDeviceSecurityHelper *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSInterDeviceSecurityHelper;
  v2 = -[AXSSInterDeviceSecurityHelper init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_appleIDsDidChange, CFSTR("SFAppleIDIdentityDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SFAppleIDIdentityDidChangeNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AXSSInterDeviceSecurityHelper;
  -[AXSSInterDeviceSecurityHelper dealloc](&v4, sel_dealloc);
}

- (void)_appleIDsDidChange
{
  NSObject *v3;
  NSArray *cachedCertificateChain;
  NSArray *cachedSecurityIdentity;
  uint8_t v6[16];

  AXSSLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_DEFAULT, "Apple IDs changed", v6, 2u);
  }

  cachedCertificateChain = self->_cachedCertificateChain;
  self->_cachedAppleIDIdentity = 0;
  self->_cachedCertificateChain = 0;

  cachedSecurityIdentity = self->_cachedSecurityIdentity;
  self->_cachedSecurityIdentity = 0;

}

- (__SecIdentity)_appleIDIdentity
{
  __SecIdentity *result;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  __SecIdentity *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;

  result = self->_cachedAppleIDIdentity;
  if (!result)
  {
    v24 = 0;
    v4 = (void *)_AppleIDAuthenticationCopyAppleIDs();
    AXSSLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSInterDeviceSecurityHelper _appleIDIdentity].cold.4();

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "lastObject");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = _AppleIDCopySecIdentityForAppleIDAccount();
      if (v7)
      {
        v8 = (__SecIdentity *)v7;
        v9 = _AppleIDAuthenticationCopyCertificateInfo();
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CertificateReference"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          self->_cachedAppleIDIdentity = v8;
        }
        else
        {
          AXSSLogForCategory(1);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[AXSSInterDeviceSecurityHelper _appleIDIdentity].cold.3();

        }
      }
      else
      {
        AXSSLogForCategory(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceSecurityHelper _appleIDIdentity].cold.2((uint64_t)&v24, v9, v17, v18, v19, v20, v21, v22);
      }

    }
    else
    {
      AXSSLogForCategory(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceSecurityHelper _appleIDIdentity].cold.1((uint64_t)&v24, v6, v11, v12, v13, v14, v15, v16);
    }

    return self->_cachedAppleIDIdentity;
  }
  return result;
}

- (id)_certificateChain
{
  NSArray *cachedCertificateChain;
  __SecIdentity *v4;
  __SecIdentity *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SecPolicyRef BasicX509;
  uint64_t v11;
  _BOOL4 v12;
  CFIndex CertificateCount;
  CFIndex v14;
  CFIndex v15;
  uint64_t i;
  CFArrayRef v17;
  CFArrayRef v18;
  uint64_t v19;
  NSArray *v20;
  NSObject *p_super;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFErrorRef error;
  SecTrustRef trust;
  SecCertificateRef certificateRef;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  cachedCertificateChain = self->_cachedCertificateChain;
  if (!cachedCertificateChain)
  {
    v4 = -[AXSSInterDeviceSecurityHelper _appleIDIdentity](self, "_appleIDIdentity");
    if (v4)
    {
      v5 = v4;
      certificateRef = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = SecIdentityCopyCertificate(v5, &certificateRef);
      v8 = v7;
      if (!certificateRef || (_DWORD)v7)
      {
        AXSSLogForCategory(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceSecurityHelper _certificateChain].cold.4(v8, v22, v23, v24, v25, v26, v27, v28);

      }
      else
      {
        trust = 0;
        v46[0] = certificateRef;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        BasicX509 = SecPolicyCreateBasicX509();
        v11 = SecTrustCreateWithCertificates(v9, BasicX509, &trust);
        if (BasicX509)
          CFRelease(BasicX509);
        if (!trust || (_DWORD)v11)
        {
          AXSSLogForCategory(1);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[AXSSInterDeviceSecurityHelper _certificateChain].cold.3(v11, v29, v30, v31, v32, v33, v34, v35);

        }
        else
        {
          error = 0;
          v12 = SecTrustEvaluateWithError(trust, &error);
          if (error || !v12)
          {
            AXSSLogForCategory(1);
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              -[AXSSInterDeviceSecurityHelper _certificateChain].cold.2((uint64_t)&error, p_super, v36, v37, v38, v39, v40, v41);
          }
          else
          {
            CertificateCount = SecTrustGetCertificateCount(trust);
            v14 = CertificateCount - 1;
            if (CertificateCount >= 1)
            {
              v15 = CertificateCount;
              for (i = 0; i != v15; ++i)
              {
                if (v14 == i)
                  break;
                v17 = SecTrustCopyCertificateChain(trust);
                v18 = v17;
                if (v17)
                {
                  v19 = -[__CFArray objectAtIndex:](v17, "objectAtIndex:", i);
                  if (v19)
                    objc_msgSend(v6, "addObject:", v19);
                }

              }
            }
            if (objc_msgSend(v6, "count") == 2)
            {
              v20 = v6;
              p_super = &self->_cachedCertificateChain->super;
              self->_cachedCertificateChain = v20;
            }
            else
            {
              AXSSLogForCategory(1);
              p_super = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                -[AXSSInterDeviceSecurityHelper _certificateChain].cold.1();
            }
          }

          if (error)
            CFRelease(error);
        }
        if (trust)
          CFRelease(trust);

      }
      if (certificateRef)
        CFRelease(certificateRef);

    }
    cachedCertificateChain = self->_cachedCertificateChain;
  }
  return cachedCertificateChain;
}

- (id)securityIdentity
{
  NSArray *cachedSecurityIdentity;
  void *v4;
  __SecIdentity *v5;
  NSObject *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  cachedSecurityIdentity = self->_cachedSecurityIdentity;
  if (!cachedSecurityIdentity)
  {
    -[AXSSInterDeviceSecurityHelper _certificateChain](self, "_certificateChain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = -[AXSSInterDeviceSecurityHelper _appleIDIdentity](self, "_appleIDIdentity");
      if (v5)
      {
        v17[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v6 = objc_claimAutoreleasedReturnValue();
        -[NSObject arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v4);
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v8 = self->_cachedSecurityIdentity;
        self->_cachedSecurityIdentity = v7;

      }
      else
      {
        AXSSLogForCategory(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceSecurityHelper securityIdentity].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
      }

    }
    cachedSecurityIdentity = self->_cachedSecurityIdentity;
  }
  return cachedSecurityIdentity;
}

- (void)verifyCertificate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  NSObject *v8;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, SecTrustRef);
  void *v13;
  AXSSInterDeviceSecurityHelper *v14;
  id v15;

  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a3)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke;
    v13 = &unk_1E5F987B8;
    v14 = self;
    v15 = v6;
    SFAppleIDVerifyCertificateChain();

  }
  else
  {
    AXSSLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF5CC000, v8, OS_LOG_TYPE_DEFAULT, "No certificate to verify.", v9, 2u);
    }

    v7[2](v7, 0);
  }

}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke(uint64_t a1, SecTrustRef trust)
{
  __SecTrust *v2;
  CFArrayRef v4;
  CFArrayRef v5;
  OSStatus v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  OSStatus v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = trust;
  if (trust)
  {
    if (SecTrustGetCertificateCount(trust) < 1)
    {
      v2 = 0;
    }
    else
    {
      v4 = SecTrustCopyCertificateChain(v2);
      v5 = v4;
      if (v4)
        -[__CFArray firstObject](v4, "firstObject");
      v6 = SFAppleIDCommonNameForCertificate();
      v2 = (__SecTrust *)0;
      if (v6)
      {
        v7 = (__CFString *)SecCopyErrorMessageString(v6, 0);
        AXSSLogForCategory(1);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_5();

      }
    }
  }
  if (-[__SecTrust length](v2, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_certificateChain");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v9, "count"))
      goto LABEL_29;
    -[NSObject firstObject](v9, "firstObject");
    v10 = SFAppleIDCommonNameForCertificate();
    v11 = 0;
    if (v10)
    {
      v12 = (__CFString *)SecCopyErrorMessageString(v10, 0);
      AXSSLogForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_4();

    }
    if (objc_msgSend(v11, "length", 0))
    {
      if ((-[__SecTrust isEqualToString:](v2, "isEqualToString:", v11) & 1) != 0)
        goto LABEL_28;
      AXSSLogForCategory(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_3();
    }
    else
    {
      AXSSLogForCategory(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
    }

LABEL_28:
    goto LABEL_29;
  }
  AXSSLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_1(v9, v14, v15, v16, v17, v18, v19, v20);
LABEL_29:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSecurityIdentity, 0);
  objc_storeStrong((id *)&self->_cachedCertificateChain, 0);
}

- (void)_appleIDIdentity
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1AF5CC000, v0, OS_LOG_TYPE_DEBUG, "Apple IDs: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_certificateChain
{
  OUTLINED_FUNCTION_5_0(&dword_1AF5CC000, a2, a3, "Unable to get certificate for Apple ID identity. Error code: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)securityIdentity
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, a1, a3, "Could not get nonempty account identifier from other certificate.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, a1, a3, "Could not get nonempty account identifier from my certificate.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF5CC000, v0, v1, "Mismatch between other identifier \"%{private}@\" and my identifier \"%{private}@\");
  OUTLINED_FUNCTION_1();
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_1(&dword_1AF5CC000, v0, v1, "Unable to get Apple ID common name for my certificate: %i (%@)");
  OUTLINED_FUNCTION_1();
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_1(&dword_1AF5CC000, v0, v1, "Unable to get Apple ID common name for other certificate: %i (%@)");
  OUTLINED_FUNCTION_1();
}

@end
