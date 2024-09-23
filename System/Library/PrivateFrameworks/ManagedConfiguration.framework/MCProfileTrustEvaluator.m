@implementation MCProfileTrustEvaluator

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t ConfigurationProfileSigner;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  if (os_variant_has_internal_ui())
  {
    v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEBUG, "Allowing all profiles to write defaults.", buf, 2u);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    ConfigurationProfileSigner = SecPolicyCreateConfigurationProfileSigner();
    if (ConfigurationProfileSigner)
    {
      v8 = (const void *)ConfigurationProfileSigner;
      v6 = -[MCProfileTrustEvaluator _verifyCerts:policy:](self, "_verifyCerts:policy:", v4, ConfigurationProfileSigner);
      CFRelease(v8);
    }
    else
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_ERROR, "Cannot create customer policy.", v15, 2u);
      }
      v6 = 0;
    }
    v10 = SecPolicyCreateConfigurationProfileSigner();
    if (v10)
    {
      v11 = (const void *)v10;
      v6 |= -[MCProfileTrustEvaluator _verifyCerts:policy:](self, "_verifyCerts:policy:", v4, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Cannot create QA policy.", v14, 2u);
      }
    }
  }

  return v6;
}

- (BOOL)_verifyCerts:(id)a3 policy:(__SecPolicy *)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  CFStringRef v9;
  NSObject *v10;
  CFErrorRef err;
  SecTrustRef trust;
  uint8_t buf[4];
  CFStringRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
LABEL_5:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  trust = 0;
  if (SecTrustCreateWithCertificates(v5, a4, &trust))
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Cannot create trust for certificate evaluation.", buf, 2u);
    }
    goto LABEL_5;
  }
  err = 0;
  v7 = SecTrustEvaluateWithError(trust, &err);
  if (v7)
  {
    v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEBUG, "Certificate chain is allowed to write defaults.", buf, 2u);
    }
  }
  else
  {
    v9 = CFErrorCopyDescription(err);
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Write defaults, trust evaluation failed: %{public}@", buf, 0xCu);
    }
    CFRelease(v9);
    CFRelease(err);
  }
  CFRelease(trust);
LABEL_13:

  return v7;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t AppleATVVPNProfileSigning;
  const void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CFStringRef v11;
  NSObject *v12;
  CFErrorRef err;
  SecTrustRef trust;
  uint8_t buf[4];
  CFStringRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_ui())
  {
    v4 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Allowing all unsupported payloads to be installed.", buf, 2u);
    }
    LOBYTE(v5) = 1;
    goto LABEL_22;
  }
  AppleATVVPNProfileSigning = SecPolicyCreateAppleATVVPNProfileSigning();
  if (AppleATVVPNProfileSigning)
  {
    v7 = (const void *)AppleATVVPNProfileSigning;
    if (objc_msgSend(v3, "count"))
    {
      trust = 0;
      if (!SecTrustCreateWithCertificates(v3, v7, &trust))
      {
        err = 0;
        v5 = SecTrustEvaluateWithError(trust, &err);
        if (v5)
        {
          v10 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Certificate chain is allowed to install unsupported payloads.", buf, 2u);
          }
        }
        else
        {
          v11 = CFErrorCopyDescription(err);
          v12 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v17 = v11;
            _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Unsupported payload, trust evaluation failed: %{public}@", buf, 0xCu);
          }
          CFRelease(v11);
          CFRelease(err);
        }
        CFRelease(trust);
        goto LABEL_21;
      }
      v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Cannot create trust for unsupported payload certificate evaluation.", buf, 2u);
      }
    }
    LOBYTE(v5) = 0;
LABEL_21:
    CFRelease(v7);
    goto LABEL_22;
  }
  v9 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_ERROR, "Cannot create unsupported payload policy.", buf, 2u);
  }
  LOBYTE(v5) = 0;
LABEL_22:

  return v5;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(id)a3
{
  id v3;
  uint64_t ConfigurationProfileSigner;
  const void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  CFStringRef v10;
  NSObject *v11;
  CFErrorRef err;
  SecTrustRef trust;
  uint8_t buf[4];
  CFStringRef v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ConfigurationProfileSigner = SecPolicyCreateConfigurationProfileSigner();
  if (ConfigurationProfileSigner)
  {
    v5 = (const void *)ConfigurationProfileSigner;
    if (objc_msgSend(v3, "count"))
    {
      trust = 0;
      if (!SecTrustCreateWithCertificates(v3, v5, &trust))
      {
        err = 0;
        v7 = SecTrustEvaluateWithError(trust, &err);
        if (v7)
        {
          v9 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEBUG, "Certificate chain is allowed to install supervised restrictions on unsupervised devices.", buf, 2u);
          }
        }
        else
        {
          v10 = CFErrorCopyDescription(err);
          v11 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v10;
            _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_ERROR, "Install supervised restrictions on unsupervised devices, trust evaluation failed: %{public}@", buf, 0xCu);
          }
          CFRelease(v10);
          CFRelease(err);
        }
        CFRelease(trust);
        goto LABEL_17;
      }
      v6 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Cannot create trust for certificate evaluation.", buf, 2u);
      }
    }
    LOBYTE(v7) = 0;
LABEL_17:
    CFRelease(v5);
    goto LABEL_18;
  }
  v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Cannot create policy.", buf, 2u);
  }
  LOBYTE(v7) = 0;
LABEL_18:

  return v7;
}

@end
