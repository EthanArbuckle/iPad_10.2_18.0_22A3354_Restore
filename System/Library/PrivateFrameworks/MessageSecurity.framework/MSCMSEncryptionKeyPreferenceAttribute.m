@implementation MSCMSEncryptionKeyPreferenceAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.11"), 0);
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  return -[MSCMSEncryptionKeyPreferenceAttribute initWithAttribute:certificates:LAContext:error:](self, "initWithAttribute:certificates:LAContext:error:", a3, 0, 0, a4);
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  MSCMSEncryptionKeyPreferenceAttribute *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  uint64_t CertificateBySubjectKeyID;
  __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  MSCMSEncryptionKeyPreferenceAttribute *v30;
  id v32[7];
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  v13 = -[MSCMSEncryptionKeyPreferenceAttribute init](&v33, sel_init);
  objc_msgSend(v10, "attributeType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("1.2.840.113549.1.9.16.2.11"));

  if ((v15 & 1) == 0)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = CFSTR("Not an Encryption Key Preference attribute according to AttributeType");
    v29 = -26275;
    goto LABEL_15;
  }
  objc_msgSend(v10, "attributeValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 != 1)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = CFSTR("Encryption Key Preference Attribute should only have one value");
    v29 = -50;
    goto LABEL_15;
  }
  memset(&v32[1], 0, 48);
  objc_msgSend(v10, "attributeValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndex:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)nsheim_decode_SMIMEEncryptionKeyPreference(v19);

  if ((_DWORD)v20)
  {
    objc_msgSend(v10, "attributeValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(v22);

    if (v23)
    {
      v32[0] = 0;
      asn1ErrorToNSError(v20, v32);
      v24 = v32[0];
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], (int)v20, v24, CFSTR("unable to decode Encryption Key Preference Attribute"));
      v25 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  if (LODWORD(v32[1]) == 3 || LODWORD(v32[1]) == 2)
  {
    CertificateBySubjectKeyID = findCertificateBySubjectKeyID(&v32[2], v11, v12, a6);
    goto LABEL_11;
  }
  if (LODWORD(v32[1]) == 1)
  {
    CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(&v32[2], v11, v12, a6);
LABEL_11:
    if (CertificateBySubjectKeyID)
    {
      v13->_encryptionCertificate = (__SecCertificate *)CertificateBySubjectKeyID;
      free_SMIMEEncryptionKeyPreference();
LABEL_19:
      v30 = v13;
      v25 = 0;
      goto LABEL_20;
    }
    v27 = MSErrorASN1Domain[0];
    v28 = CFSTR("the Encryption Key Preference Attribute did not match any certificates");
    goto LABEL_14;
  }
  v27 = MSErrorASN1Domain[0];
  v28 = CFSTR("unknown type for Encryption Key Preference Attribute");
LABEL_14:
  v29 = 0;
LABEL_15:
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v27, v29, 0, v28);
  v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  free_SMIMEEncryptionKeyPreference();
  if (!v25)
    goto LABEL_19;
  if (a6)
  {
    v25 = objc_retainAutorelease(v25);
    v30 = 0;
    *a6 = v25;
  }
  else
  {
    v30 = 0;
  }
LABEL_20:

  return v30;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithCertificate:(__SecCertificate *)a3
{
  MSCMSEncryptionKeyPreferenceAttribute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  v4 = -[MSCMSEncryptionKeyPreferenceAttribute init](&v6, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    v4->_encryptionCertificate = a3;
  }
  return v4;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithIdentity:(__SecIdentity *)a3
{
  SecCertificateRef certificateRef;

  certificateRef = 0;
  if (!SecIdentityCopyCertificate(a3, &certificateRef))
    self = -[MSCMSEncryptionKeyPreferenceAttribute initWithCertificate:](self, "initWithCertificate:", certificateRef);
  if (certificateRef)
    CFRelease(certificateRef);
  return self;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithEmailAddress:(id)a3
{
  id v4;
  void *v5;
  __SecCertificate *CertificateByEmailAddress;
  MSCMSEncryptionKeyPreferenceAttribute *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && (CertificateByEmailAddress = (__SecCertificate *)findCertificateByEmailAddress(v4, 0, 0)) != 0)
  {
    self->_encryptionCertificate = CertificateByEmailAddress;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  __SecCertificate *encryptionCertificate;
  CFDataRef v6;
  CFDataRef v7;
  CFDataRef v8;
  BOOL v9;
  MSCMSAttribute *v10;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  MSCMSAttribute *v26;
  void *v27;
  void *v28;
  CFErrorRef error;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  error = 0;
  encryptionCertificate = self->_encryptionCertificate;
  if (!encryptionCertificate)
    return 0;
  v6 = SecCertificateCopyNormalizedIssuerSequence(encryptionCertificate);
  v7 = SecCertificateCopySerialNumberData(self->_encryptionCertificate, &error);
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
    if (a3)
      *a3 = error;
    goto LABEL_32;
  }
  -[__CFData length](v6, "length");
  -[__CFData bytes](objc_retainAutorelease(v6), "bytes");
  -[__CFData length](v8, "length");
  -[__CFData bytes](objc_retainAutorelease(v8), "bytes");
  if (!-[MSCMSEncryptionKeyPreferenceAttribute legacyASN1Encoding](self, "legacyASN1Encoding"))
  {
    v12 = length_SMIMEEncryptionKeyPreference();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v14 = objc_retainAutorelease(v18);
      objc_msgSend(v14, "mutableBytes");
      v19 = encode_SMIMEEncryptionKeyPreference();
      if (!v19)
        goto LABEL_20;
      v20 = v19;

      v17 = v20;
      if (!a3)
        goto LABEL_27;
    }
    else
    {
      v17 = 12;
      if (!a3)
        goto LABEL_27;
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Failed encoding type SMIMEEncryptionKeyPreference");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v31;
    v24 = &v30;
    goto LABEL_26;
  }
  v12 = length_SecCMS_SMIMEEncryptionKeyPreference();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_22;
  v14 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "mutableBytes");
  v15 = encode_SecCMS_SMIMEEncryptionKeyPreference();
  if (v15)
  {
    v16 = v15;

    v17 = v16;
    if (!a3)
      goto LABEL_27;
    goto LABEL_23;
  }
LABEL_20:
  if (v12)
  {
    asn1_abort();
LABEL_22:
    v17 = 12;
    if (a3)
    {
LABEL_23:
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("Failed encoding type SecCMS_SMIMEEncryptionKeyPreference");
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = (const __CFString **)v33;
      v24 = &v32;
LABEL_26:
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v17, v25);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_27:
    v14 = 0;
  }
  if (objc_msgSend(v14, "length"))
  {
    v26 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.11"), a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MSCMSAttribute initWithAttributeType:values:](v26, "initWithAttributeType:values:", v27, v28);

  }
  else
  {
    v10 = 0;
  }

LABEL_32:
  return v10;
}

- (void)dealloc
{
  __SecCertificate *encryptionCertificate;
  objc_super v4;

  encryptionCertificate = self->_encryptionCertificate;
  if (encryptionCertificate)
    CFRelease(encryptionCertificate);
  v4.receiver = self;
  v4.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  -[MSCMSEncryptionKeyPreferenceAttribute dealloc](&v4, sel_dealloc);
}

- (__SecCertificate)encryptionCertificate
{
  return self->_encryptionCertificate;
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

@end
