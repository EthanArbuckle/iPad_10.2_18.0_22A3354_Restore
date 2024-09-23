@implementation DAStrongDeviceIdentity

- (void)purgeSecurityKey
{
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    CFRelease(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"));
    -[DAStrongDeviceIdentity setDeviceIdentityKey:](self, "setDeviceIdentityKey:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[DAStrongDeviceIdentity purgeSecurityKey](self, "purgeSecurityKey");
  v3.receiver = self;
  v3.super_class = (Class)DAStrongDeviceIdentity;
  -[DAStrongDeviceIdentity dealloc](&v3, "dealloc");
}

- (void)generateAuthInfoWithNonce:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, NSObject *, uint64_t, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  void *v14;
  id *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id *v34;
  id v35;
  id v36;
  id v37;
  id obj;
  _QWORD v39[5];
  NSObject *v40;
  uint8_t *v41;
  uint64_t *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[16];
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v35 = a3;
  v6 = (void (**)(id, void *, NSObject *, uint64_t, uint64_t, _QWORD))a4;
  v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = sub_1000206B0;
  v44[3] = sub_1000206C0;
  v45 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", &__kCFBooleanTrue, kMAOptionsBAASCRTAttestation));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", kMAOptionsBAAOIDDeviceIdentifiers, kMAOptionsBAAOIDHardwareProperties, kMAOptionsBAAOIDKeyUsageProperties, kMAOptionsBAAOIDDeviceOSInformation, kMAOptionsBAAOIDUCRTDeviceIdentifiers, 0));
  v9 = v8;
  if (v35)
  {
    objc_msgSend(v8, "addObject:", kMAOptionsBAAOIDNonce);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, kMAOptionsBAANonce);
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, kMAOptionsBAAOIDSToInclude);
  if (!qword_10016E8F0)
  {
    *(_OWORD *)buf = off_100133868;
    v47 = 0;
    qword_10016E8F0 = _sl_dlopen(buf, 0);
  }
  if (qword_10016E8F0)
  {
    v10 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v47 = 0x3032000000;
    v48 = sub_1000206B0;
    v49 = sub_1000206C0;
    v50 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000206C8;
    v39[3] = &unk_1001337F8;
    v41 = buf;
    v42 = &v43;
    v39[4] = self;
    v11 = v10;
    v40 = v11;
    -[DAStrongDeviceIdentity requestAttestationCertWithOptions:completion:](self, "requestAttestationCertWithOptions:completion:", v7, v39);
    v12 = dispatch_time(0, 60000000000);
    v13 = dispatch_semaphore_wait(v11, v12);
    v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v14)
    {
      v15 = (id *)(v44[0] + 40);
      obj = *(id *)(v44[0] + 40);
      v16 = objc_msgSend(v14, "copyCertificatePEMWithError:", &obj);
      objc_storeStrong(v15, obj);
      if (!v16
        || (v17 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v16, v17) & 1) == 0)
        || *(_QWORD *)(v44[0] + 40))
      {
        v18 = DiagnosticLogHandleForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_1000EB398((uint64_t)v44, v19, v20);

        v16 = 0;
      }
      v21 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "certifcateType");
      if (!v21)
      {
        v23 = 1;
        v22 = 2;
        if (v16)
          goto LABEL_24;
LABEL_30:
        v32 = DiagnosticLogHandleForCategory(1);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_1000EB2E0();

        v34 = (id *)(v44[0] + 40);
        v37 = *(id *)(v44[0] + 40);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity requestAttestationBlobWithOptions:error:](self, "requestAttestationBlobWithOptions:error:", v7, &v37));
        objc_storeStrong(v34, v37);
        v16 = 0;
        v22 = 3;
        goto LABEL_33;
      }
      if (v21 == (id)1)
      {
        v22 = 0;
        v23 = 2;
        if (!v16)
          goto LABEL_30;
LABEL_24:
        v27 = 0;
LABEL_33:

        _Block_object_dispose(buf, 8);
        goto LABEL_34;
      }
      v30 = DiagnosticLogHandleForCategory(1);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        sub_1000EB338();

    }
    else
    {
      if (!v13)
      {
LABEL_29:
        v23 = 0;
        goto LABEL_30;
      }
      v29 = DiagnosticLogHandleForCategory(1);
      v16 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000EB30C();
    }

    goto LABEL_29;
  }
  v24 = DiagnosticLogHandleForCategory(1);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "CoreRepairCore is unavailable. Falling back to attestation blob", buf, 2u);
  }

  v26 = v44[0];
  v36 = *(id *)(v44[0] + 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity requestAttestationBlobWithOptions:error:](self, "requestAttestationBlobWithOptions:error:", v7, &v36));
  v28 = v36;
  v22 = 0;
  v23 = 0;
  v16 = 0;
  v11 = *(NSObject **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v28;
LABEL_34:

  -[DAStrongDeviceIdentity setCertData:](self, "setCertData:", v16);
  v6[2](v6, v27, v16, v23, v22, *(_QWORD *)(v44[0] + 40));

  _Block_object_dispose(&v43, 8);
}

- (id)signPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;

  v6 = a3;
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForData:](self, "SHA256ForData:", v6));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity signDigest:error:](self, "signDigest:error:", v7, a4));
      v9 = 0;
    }
    else
    {
      v12 = DiagnosticLogHandleForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000EB434();

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 1, 0));
      v8 = 0;
    }

    if (v9)
LABEL_12:
      +[DSAnalytics sendAnalyticsWithEvent:error:](DSAnalytics, "sendAnalyticsWithEvent:error:", 1, v9);
  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000EB408();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 0, 0));
    v8 = 0;
    if (v9)
      goto LABEL_12;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (id)signFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;

  v6 = a3;
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForFileHandle:](self, "SHA256ForFileHandle:", v8));
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity signDigest:error:](self, "signDigest:error:", v9, a4));
      }
      else
      {
        v16 = DiagnosticLogHandleForCategory(1);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1000EB514();

        v10 = 0;
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 3, 0));
      }

      v13 = 0;
    }
    else
    {
      v14 = DiagnosticLogHandleForCategory(1);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000EB48C(v6, v15);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 2, 0));
      v10 = 0;
    }

    if (a4)
LABEL_18:
      *a4 = objc_retainAutorelease(v13);
  }
  else
  {
    v11 = DiagnosticLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000EB460();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 0, 0));
    v10 = 0;
    if (a4)
      goto LABEL_18;
  }

  return v10;
}

- (id)SHA256ForData:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  __int128 v7;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length", 0, 0, 0, 0);
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFD)
  {
    v5 = 0;
  }
  else
  {
    CC_SHA256(objc_msgSend(objc_retainAutorelease(v3), "bytes"), (CC_LONG)v4, (unsigned __int8 *)&v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 32));
  }

  return v5;
}

- (id)SHA256ForFileHandle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _OWORD v10[2];
  CC_SHA256_CTX c;

  v3 = a3;
  v4 = objc_msgSend(v3, "offsetInFile");
  objc_msgSend(v3, "seekToFileOffset:", 0);
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readDataOfLength:", 0x10000));
    v6 = objc_msgSend(v5, "length");
    v7 = objc_retainAutorelease(v5);
    CC_SHA256_Update(&c, objc_msgSend(v7, "bytes"), (CC_LONG)v6);

  }
  while (v6);
  objc_msgSend(v3, "seekToFileOffset:", v4);
  memset(v10, 0, sizeof(v10));
  CC_SHA256_Final((unsigned __int8 *)v10, &c);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 32));

  return v8;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  CFDataRef v7;
  CFErrorRef v8;
  __CFError *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  CFErrorRef error;
  NSErrorUserInfoKey v17;
  __CFError *v18;
  uint8_t buf[4];
  void *v20;

  error = 0;
  v6 = (const __CFData *)a3;
  v7 = SecKeyCreateSignature(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"), kSecKeyAlgorithmECDSASignatureDigestX962SHA256, v6, &error);

  if (!v7)
  {
    v8 = error;
    v9 = error;
    v10 = DiagnosticLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError description](v9, "description"));
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to create signature with underlying error = (%@).", buf, 0xCu);

      }
      v17 = NSUnderlyingErrorKey;
      v18 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      if (!a4)
        goto LABEL_7;
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to create signature.", buf, 2u);
      }

      v14 = 0;
      if (!a4)
        goto LABEL_7;
    }
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 4, v14));
LABEL_7:

  }
  return v7;
}

- (id)requestAttestationBlobWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  id v17;
  NSErrorUserInfoKey v18;
  id v19;

  v6 = a3;
  -[DAStrongDeviceIdentity purgeSecurityKey](self, "purgeSecurityKey");
  v17 = 0;
  v7 = DeviceIdentityCopyAttestationDictionary(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"), v6, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = v17;
  if (!v8
    || (v16 = 0,
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v8, 100, 0, &v16)), v11 = v16, v9, v9 = v11, !v10))
  {
    if (v9)
    {
      if (a4)
      {
        v18 = NSUnderlyingErrorKey;
        v19 = v9;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 5, v12));

      }
    }
    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.StrongDeviceIdentityError"), 5, 0));
    }
    v13 = DiagnosticLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_1000EB540();

    +[DSAnalytics sendAnalyticsWithEvent:error:](DSAnalytics, "sendAnalyticsWithEvent:error:", 0, v9);
    v10 = 0;
  }

  return v10;
}

- (id)deviceIdentityPublicKeyDigest
{
  __SecKey *v3;
  CFDataRef v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  CFErrorRef error;

  error = 0;
  v3 = SecKeyCopyPublicKey(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"));
  v4 = SecKeyCopyExternalRepresentation(v3, &error);
  CFRelease(v3);
  if (error)
  {
    v5 = DiagnosticLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EB5A0((uint64_t *)&error, v6, v7);

    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForData:](self, "SHA256ForData:", v4));
  }

  return v8;
}

- (id)deviceIdentityCert
{
  return -[DAStrongDeviceIdentity certData](self, "certData");
}

- (void)requestAttestationCertWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  dispatch_group_t v12;
  id v13;
  id v14;
  __int128 *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  if (!qword_10016E8F0)
  {
    v19 = off_100133868;
    v20 = 0;
    qword_10016E8F0 = _sl_dlopen(&v19, 0);
  }
  if (qword_10016E8F0)
  {
    *(_QWORD *)&v19 = 0;
    *((_QWORD *)&v19 + 1) = &v19;
    v20 = 0x3032000000;
    v21 = sub_1000206B0;
    v22 = sub_1000206C0;
    v23 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000206B0;
    v17[4] = sub_1000206C0;
    v18 = 0;
    v7 = dispatch_queue_create("com.apple.Diagnostics.requestAttestationCertificate", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000213E4;
    block[3] = &unk_100133848;
    v12 = dispatch_group_create();
    v13 = v5;
    v15 = &v19;
    v16 = v17;
    v14 = v6;
    v8 = v12;
    dispatch_group_async(v8, v7, block);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v9 = DiagnosticLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000EB60C();

  }
}

- (__SecKey)deviceIdentityKey
{
  return self->_deviceIdentityKey;
}

- (void)setDeviceIdentityKey:(__SecKey *)a3
{
  self->_deviceIdentityKey = a3;
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
  objc_storeStrong((id *)&self->_certData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certData, 0);
}

@end
