@implementation EDPUtilities

+ (id)getCertificateChain:(__SecIdentity *)a3 withError:(id *)a4
{
  SecPolicyRef BasicX509;
  __CFArray *Mutable;
  OSStatus v7;
  void *v8;
  CFArrayRef v9;
  CFErrorRef error;
  SecTrustRef trust;
  SecCertificateRef certificateRef;

  trust = 0;
  certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    Mutable = CFArrayCreateMutable(0, 3, 0);
    CFArraySetValueAtIndex(Mutable, 0, certificateRef);
    v7 = SecTrustCreateWithCertificates(Mutable, BasicX509, &trust);
    if (v7)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        v9 = SecTrustCopyCertificateChain(trust);
        if (!Mutable)
          goto LABEL_17;
        goto LABEL_16;
      }
      if (a4)
      {
        v8 = error;
LABEL_13:
        v9 = 0;
        *a4 = v8;
        if (!Mutable)
          goto LABEL_17;
LABEL_16:
        CFRelease(Mutable);
        goto LABEL_17;
      }
    }
    v9 = 0;
    if (!Mutable)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), -67672, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_17:
  if (trust)
    CFRelease(trust);
  if (BasicX509)
    CFRelease(BasicX509);
  if (certificateRef)
    CFRelease(certificateRef);
  return v9;
}

+ (id)createSignature:(id)a3 withCertChain:(id)a4 withTime:(id)a5 withRemoteHandler:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, void *, uint64_t);
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void (**v39)(_QWORD, void *, uint64_t);
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(_QWORD, void *, uint64_t))a6;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66688]), "initWithCertificate:signatureAlgorithm:error:", v15, 0, &v48);
  v17 = v48;
  v18 = v17;
  if (v16)
  {
    v47 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66680]), "initWithDataContent:isDetached:signer:additionalCertificates:error:", v11, 0, v16, v12, &v47);
    v20 = v47;

    if (v19)
    {
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66678]), "initWithEmbeddedContent:", v19);
      v41 = objc_msgSend(objc_alloc(MEMORY[0x24BE66690]), "initWithSigningTime:", v13);
      objc_msgSend(v16, "addProtectedAttribute:");
      v46 = v20;
      objc_msgSend(v16, "calculateSignerInfoDigest:", &v46);
      v21 = objc_claimAutoreleasedReturnValue();
      v18 = v46;

      v43 = (void *)v21;
      if (v21)
      {
        v22 = (void *)MEMORY[0x24BE66670];
        objc_msgSend(v16, "signatureAlgorithm");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v18;
        objc_msgSend(v22, "digestAlgorithmWithSignatureAlgorithm:error:", v23, &v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v45;

        if (v24)
        {
          v39 = v14;
          objc_msgSend(v24, "algorithm");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "OIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = mapDigestAlgorithm(v26);

          if ((_DWORD)v27)
          {
            v39[2](v39, v43, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            v38 = v28;
            if (v28
              && (objc_msgSend(v28, "signature"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30,
                  v30))
            {
              objc_msgSend(v29, "signature");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSignature:", v31);

              v44 = v40;
              objc_msgSend(v42, "encodeMessageSecurityObject:", &v44);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v44;

              if (v32)
              {
                v33 = v32;
              }
              else if (a7 && v18)
              {
                *a7 = objc_retainAutorelease(v18);
              }

            }
            else if (a7
                   && (objc_msgSend(v29, "error"),
                       v35 = (void *)objc_claimAutoreleasedReturnValue(),
                       v35,
                       v35))
            {
              v18 = objc_retainAutorelease(v40);
              v32 = 0;
              *a7 = v18;
            }
            else
            {
              v32 = 0;
              v18 = v40;
            }
            v14 = v39;
            v36 = (void *)v41;

            goto LABEL_38;
          }
          v14 = v39;
          if (a7)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), -67747, 0);
            v32 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
            v18 = v40;
            v36 = (void *)v41;
            goto LABEL_38;
          }
LABEL_31:
          v32 = 0;
          goto LABEL_32;
        }
        if (!a7)
        {
          v24 = 0;
          goto LABEL_31;
        }
        v34 = v40;
      }
      else
      {
        if (!a7)
        {
          v24 = 0;
          v32 = 0;
          goto LABEL_28;
        }
        v34 = v18;
      }
      v18 = objc_retainAutorelease(v34);
      v24 = 0;
      v32 = 0;
      *a7 = v18;
LABEL_28:
      v36 = (void *)v41;
LABEL_38:

      goto LABEL_39;
    }
    if (!a7)
    {
      v32 = 0;
      v18 = v20;
      goto LABEL_39;
    }
    v17 = v20;
  }
  else if (!a7)
  {
    v32 = 0;
    goto LABEL_39;
  }
  v18 = objc_retainAutorelease(v17);
  v32 = 0;
  *a7 = v18;
LABEL_39:

  return v32;
}

+ (id)signDigest:(id)a3 algorithm:(unsigned int)a4 identity:(__SecIdentity *)a5 error:(id *)a6
{
  uint64_t v8;
  const __CFData *v9;
  const __CFString *v10;
  CFDataRef Signature;
  id v13;
  SecKeyRef privateKeyRef;

  v8 = *(_QWORD *)&a4;
  v9 = (const __CFData *)a3;
  privateKeyRef = 0;
  SecIdentityCopyPrivateKey(a5, &privateKeyRef);
  v10 = (const __CFString *)pickKeyAlgorithm(privateKeyRef, v8, a6);
  if (!v10)
  {
LABEL_6:
    Signature = 0;
    goto LABEL_7;
  }
  v13 = 0;
  Signature = SecKeyCreateSignature(privateKeyRef, v10, v9, (CFErrorRef *)&v13);
  if (!Signature || v13)
  {
    if (a6)
    {
      Signature = 0;
      *a6 = v13;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  if (privateKeyRef)
    CFRelease(privateKeyRef);

  return Signature;
}

+ (id)validateSignature:(id)a3 requireTrust:(BOOL)a4 withError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  CFMutableArrayRef Mutable;
  __CFArray *v10;
  const void *EDPSigning;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  __SecTrust *v18;
  __SecTrust *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  CFArrayRef v29;
  void *v30;
  unsigned int v31;
  id v32;
  id v33;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BE66698]);
  Mutable = CFArrayCreateMutable(0, 1, 0);
  if (!Mutable)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), -67672, 0);
      v20 = 0;
      v14 = 0;
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
      v14 = 0;
      v12 = 0;
    }
    goto LABEL_34;
  }
  v10 = Mutable;
  EDPSigning = (const void *)SecPolicyCreateEDPSigning();
  if (EDPSigning)
  {
    CFArrayAppendValue(v10, EDPSigning);
    objc_msgSend(v8, "setVerifySignatures:", 1);
    objc_msgSend(v8, "setVerifySigners:", 1);
    objc_msgSend(v8, "setSignerPolicies:", v10);
    v33 = 0;
    objc_msgSend(MEMORY[0x24BE66678], "decodeMessageSecurityObject:options:error:", v7, v8, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    v14 = v13;
    if (v12)
      v15 = 1;
    else
      v15 = v6;
    v31 = v15;
    if ((v15 & 1) != 0)
    {
      if (v12)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(v13, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("MSErrorTrustDomain")))
      {
        v23 = objc_msgSend(v14, "code");

        if (v23 == -67808)
        {
          objc_msgSend(v8, "setVerifySigners:", 0);
          objc_msgSend(v8, "setSignerPolicies:", 0);

          v32 = 0;
          objc_msgSend(MEMORY[0x24BE66678], "decodeMessageSecurityObject:options:error:", v7, v8, &v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v32;
          if (v12)
          {
LABEL_8:
            objc_msgSend(v12, "embeddedContent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "signers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "firstObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v16;
            if (v30)
            {
              v18 = (__SecTrust *)objc_msgSend(v30, "createTrustObjectWithPolicies:error:", 0, 0);
              v19 = v18;
              if (v18)
              {
                v29 = SecTrustCopyCertificateChain(v18);
LABEL_29:
                v20 = (void *)objc_opt_new();
                -[__CFArray reverseObjectEnumerator](v29, "reverseObjectEnumerator");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "allObjects");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setCertificateChain:", v25);

                objc_msgSend(v28, "dataContent");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValidatedData:", v26);

                objc_msgSend(v20, "setIsTrusted:", v31);
                goto LABEL_30;
              }
            }
            else
            {
              v19 = 0;
            }
            v29 = 0;
            goto LABEL_29;
          }
        }
      }
      else
      {

      }
    }
    if (a5)
    {
      v21 = objc_retainAutorelease(v14);
      v14 = v21;
      v19 = 0;
      v12 = 0;
      goto LABEL_23;
    }
    v19 = 0;
    v12 = 0;
LABEL_26:
    v20 = 0;
    goto LABEL_30;
  }
  if (!a5)
  {
    v19 = 0;
    v12 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), -25241, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = 0;
  v14 = 0;
LABEL_23:
  v20 = 0;
  *a5 = v21;
LABEL_30:
  CFRelease(v10);
  if (EDPSigning)
    CFRelease(EDPSigning);
  if (v19)
    CFRelease(v19);
LABEL_34:

  return v20;
}

@end
