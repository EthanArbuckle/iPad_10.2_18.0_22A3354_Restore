uint64_t length_Attribute()
{
  return _asn1_length();
}

uint64_t encode_Attribute()
{
  return _asn1_encode();
}

uint64_t free_SignerInfo()
{
  return _asn1_free_top();
}

void sub_1DEEDB1CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __findCertificateByIssuerAndSerialNumber_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CFDataRef v6;
  CFDataRef v7;
  __SecCertificate *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __SecCertificate *certificate;

  certificate = a2;
  v6 = SecCertificateCopyNormalizedIssuerSequence(certificate);
  v7 = SecCertificateCopySerialNumberData(certificate, 0);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToData:", v6)
    || !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqualToData:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      objc_msgSend(v9, "addObject:", v7);
      if (v6)
      {
LABEL_8:
        objc_msgSend(v10, "addObject:", v6);
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      if (v6)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    goto LABEL_11;
  }
  v8 = certificate;
  if (certificate)
  {
    CFRetain(certificate);
    v8 = certificate;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  *a4 = 1;
LABEL_12:

}

void sub_1DEEDB680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t free_AlgorithmIdentifier()
{
  return _asn1_free_top();
}

void sub_1DEEDBBF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DEEDC268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t free_CMSIdentifier()
{
  return _asn1_free_top();
}

uint64_t decode_CMSIdentifier()
{
  return _asn1_decode_top();
}

id CertificateSerialNumberData(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  BOOL v5;

  if (!a1)
    return 0;
  v1 = der_length_heim_integer();
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v1);
  if (!v3)
    return 0;
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "mutableBytes");
  if (der_put_heim_integer())
    v5 = 0;
  else
    v5 = v2 == 0;
  if (!v5)
  {

    return 0;
  }
  return v4;
}

uint64_t findCertificateForIdentifier(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t CertificateBySubjectKeyID;
  uint64_t v13;

  v7 = a2;
  v8 = a3;
  +[MSCMSIdentifier decodeIdentifier:error:](MSCMSIdentifier, "decodeIdentifier:error:", a1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_9;
  v11 = objc_msgSend(v9, "type");
  if (v11 == 2)
  {
    CertificateBySubjectKeyID = findCertificateBySubjectKeyID((_QWORD *)objc_msgSend(v10, "subjectKeyId"), v7, v8, a4);
    goto LABEL_6;
  }
  if (v11 != 1)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, *a4, CFSTR("unable to find certificate by identifier; invalid choice in encoding"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber((_QWORD *)objc_msgSend(v10, "issuerAndSerialNumber"), v7, v8, a4);
LABEL_6:
  v13 = CertificateBySubjectKeyID;
LABEL_10:

  return v13;
}

uint64_t findCertificateByIssuerAndSerialNumber(_QWORD *a1, void *a2, void *a3, id *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CFTypeRef ItemInAllAvailableKeychains;
  CFTypeID v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v39 = a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v36 = a4;
  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__3;
  v63 = __Block_byref_object_dispose__3;
  NSDataFromInteger(a1 + 2);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
  v8 = objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__3;
  v57 = __Block_byref_object_dispose__3;
  v58 = (id)SecDistinguishedNameCopyNormalizedSequence();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 && objc_msgSend(v41, "count"))
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __findCertificateByIssuerAndSerialNumber_block_invoke;
    v48[3] = &unk_1EA962160;
    v50 = &v53;
    v51 = &v59;
    v52 = &v65;
    v49 = v38;
    objc_msgSend(v41, "enumerateObjectsUsingBlock:", v48);

  }
  v37 = (void *)v8;
  v9 = v66[3];
  if (v9)
  {
    v40 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
    if (v54[5])
      v11 = (void *)v54[5];
    else
      v11 = v37;
    objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x1E0CD69E8]);
    objc_msgSend(v10, "setObject:forKey:", v60[5], *MEMORY[0x1E0CD6B48]);
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
    if (v39)
      objc_msgSend(v10, "setObject:forKey:", v39, *MEMORY[0x1E0CD7088]);
    v47 = v7;
    v35 = v10;
    ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v10);
    v40 = v7;

    if (ItemInAllAvailableKeychains)
    {
      v13 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v13 == SecCertificateGetTypeID())
        v66[3] = (uint64_t)ItemInAllAvailableKeychains;
      else
        CFRelease(ItemInAllAvailableKeychains);
    }
    if (!v66[3])
    {
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_34);
      v14 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v60[5], "asMessageSecurityHexString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        v71 = 1752392040;
        v72 = 2112;
        v73 = v15;
        _os_log_impl(&dword_1DEED9000, v14, OS_LOG_TYPE_INFO, "QuerySN = %{mask.hash}@", buf, 0x16u);

      }
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_36);
      v16 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v54[5], "asMessageSecurityHexString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        v71 = 1752392040;
        v72 = 2112;
        v73 = v17;
        _os_log_impl(&dword_1DEED9000, v16, OS_LOG_TYPE_INFO, "QueryIssuer = %{mask.hash}@", buf, 0x16u);

      }
      dumpNSData("QuerySN", (void *)v60[5]);
      dumpNSData("QueryIssuer", (void *)v54[5]);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v38;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v69, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v44;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
            if (MS_DEFAULT_LOG_BLOCK != -1)
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_40);
            v22 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "asMessageSecurityHexString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              v71 = 1752392040;
              v72 = 2112;
              v73 = v24;
              _os_log_impl(&dword_1DEED9000, v22, OS_LOG_TYPE_INFO, "BundledSN = %{mask.hash}@", buf, 0x16u);

            }
            if (MS_DEFAULT_LOG_BLOCK != -1)
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_42);
            v25 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "asMessageSecurityHexString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              v71 = 1752392040;
              v72 = 2112;
              v73 = v27;
              _os_log_impl(&dword_1DEED9000, v25, OS_LOG_TYPE_INFO, "BundledIssuer = %{mask.hash}@", buf, 0x16u);

            }
            objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            dumpNSData("BundledSN", v28);

            objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            dumpNSData("BundledIssuer", v29);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v69, 16);
        }
        while (v18);
      }

      v30 = MSErrorKeychainDomain[0];
      NSStringFromDERIntegerData((void *)v60[5]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSSStringFromIssuerName((void *)v54[5]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", v30, -25300, 1, v40, CFSTR("%s did not find IssuerAndSerialNumber %@ %@"), "findCertificateByIssuerAndSerialNumber", v31, v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v40 = (id)v33;
    }
    if (v36 && v40)
      *v36 = objc_retainAutorelease(v40);
    v9 = v66[3];

  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v9;
}

void sub_1DEEDD0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t copy_SignerInfo()
{
  return _asn1_copy_top();
}

_QWORD *NSDataFromOctetString(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_QWORD *NSDataFromInteger(_QWORD *a1)
{
  _QWORD *v1;
  void *v3;
  char v4;

  v1 = a1;
  if (a1)
  {
    if (*a1 && !*((_DWORD *)a1 + 4) && *(char *)a1[1] < 0)
    {
      v4 = 0;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v4, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendBytes:length:", v1[1], *v1);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v3);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1]);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v1;
}

uint64_t free_Attribute()
{
  return _asn1_free_top();
}

uint64_t decode_Attribute()
{
  return _asn1_decode_top();
}

void sub_1DEEDDAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id NSDataFromIntegerArray(_DWORD *a1, unint64_t a2)
{
  unsigned int v3;
  void *v4;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int16x8_t v10;
  int v11;
  unsigned __int32 v12;
  char v13;
  char v14;

  if (a2 >= 2 && *a1 <= 6u && (v3 = a1[1], v3 <= 0x27))
  {
    v14 = v3 + 40 * *a1;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2 >= 3)
    {
      v7 = 2;
      do
      {
        v8 = 0;
        v9 = a1[v7];
        v13 = v9 & 0x7F;
        v10 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v9), (uint32x4_t)xmmword_1DEF16B60);
        v10.i64[0] = *(_QWORD *)&vmovn_s32((int32x4_t)v10) | 0x80008000800080;
        v12 = vmovn_s16(v10).u32[0];
        do
          v11 = *((unsigned __int8 *)&v12 + v8++);
        while (v11 == 128);
        objc_msgSend(v4, "appendBytes:length:", (char *)&v12 + v8 - 1, 6 - v8);
        v7 = (v7 + 1);
      }
      while (v7 < a2);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id NSStringFromOIDData(void *a1)
{
  id v1;
  id v2;
  id v3;
  unsigned int v4;
  id v5;
  unsigned __int8 v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  id v17;

  v1 = a1;
  if (!objc_msgSend(v1, "length") || (unint64_t)objc_msgSend(v1, "length") > 0x20)
  {
    v2 = 0;
    goto LABEL_20;
  }
  v3 = objc_retainAutorelease(v1);
  v4 = *(unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_retainAutorelease(v3);
  v6 = *(_BYTE *)objc_msgSend(v5, "bytes") % 0x28u;
  v7 = 40 * (v4 / 0x28) - 80;
  if (v4 <= 0x77)
    v8 = v4 / 0x28;
  else
    v8 = 2;
  if (v4 <= 0x77)
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%u.%u"), v8, v7 + v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
  {
LABEL_17:
    v2 = v9;
    goto LABEL_19;
  }
  v10 = 0;
  v11 = 0;
  v12 = 2;
  v13 = 1;
  v14 = 2;
  while (1)
  {
    v15 = objc_retainAutorelease(v5);
    v16 = *(_BYTE *)(objc_msgSend(v15, "bytes") + v13) & 0x7F | (v11 << 7);
    v17 = objc_retainAutorelease(v15);
    if (*(char *)(objc_msgSend(v17, "bytes") + v13) < 0)
      break;
    objc_msgSend(v9, "appendFormat:", CFSTR(".%u"), v16);
    if (v14 > 0x13)
      goto LABEL_18;
    v10 = 0;
    v11 = 0;
    ++v14;
LABEL_16:
    v13 = v12;
    if (objc_msgSend(v17, "length") <= (unint64_t)v12++)
      goto LABEL_17;
  }
  if (++v10 != 4)
  {
    v11 = v16;
    goto LABEL_16;
  }
LABEL_18:
  v2 = 0;
LABEL_19:

LABEL_20:
  return v2;
}

uint64_t length_CMSAttributes()
{
  return _asn1_length();
}

uint64_t encode_CMSAttributes()
{
  return _asn1_encode();
}

uint64_t length_CMSOrderedAttributes()
{
  return _asn1_length();
}

uint64_t encode_CMSOrderedAttributes()
{
  return _asn1_encode();
}

uint64_t free_CertificateSerialNumber()
{
  return _asn1_free_top();
}

uint64_t decode_AlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t decode_CertificateSerialNumber()
{
  return _asn1_decode_top();
}

uint64_t nsheim_decode_AppleHashAgilityValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t free_AppleHashAgilityValue()
{
  return _asn1_free_top();
}

uint64_t nsheim_decode_MessageDigest(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t free_MessageDigest()
{
  return _asn1_free_top();
}

uint64_t nsheim_decode_ContentType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t free_ContentType()
{
  return _asn1_free_top();
}

uint64_t copy_AlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t copy_Attribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AppleAgileHash(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t free_AppleAgileHash()
{
  return _asn1_free_top();
}

uint64_t free_ContentInfo()
{
  return _asn1_free_top();
}

uint64_t nsheim_decode_ContentInfo(void *a1)
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");

  return _asn1_decode_top();
}

_QWORD *NSDataFromAny(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id decodeEmbeddedCMSContent(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  __objc2_class *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (!v8)
    goto LABEL_23;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.7.2")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.7.3")))
    {
      v10 = MSCMSEnvelopedData;
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.7.5")))
    {
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
      v12 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      LOWORD(v18) = 0;
      v13 = "Found unsupported content type: DigestedData";
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.7.6")))
    {
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5_0);
      v12 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      LOWORD(v18) = 0;
      v13 = "Found unimplemented contented type: EncryptedData";
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.9.16.1.2")))
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.9.16.1.23")))
        {
          v10 = MSCMSAuthEnvelopedData;
          goto LABEL_6;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.9.16.1.9")))
        {
          v10 = MSCMSCompressedData;
          goto LABEL_6;
        }
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_11_0);
        v15 = (void *)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          v16 = v15;
          objc_msgSend(v7, "OIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412290;
          v19 = v17;
          _os_log_impl(&dword_1DEED9000, v16, OS_LOG_TYPE_ERROR, "Found unknown content type: %@", (uint8_t *)&v18, 0xCu);

        }
LABEL_23:
        v11 = 0;
        goto LABEL_24;
      }
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_7);
      v12 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      LOWORD(v18) = 0;
      v13 = "Found unsupported content type: AuthenticatedData";
    }
    _os_log_impl(&dword_1DEED9000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v18, 2u);
    goto LABEL_23;
  }
  v10 = MSCMSSignedData;
LABEL_6:
  -[__objc2_class decodeMessageSecurityObject:options:error:](v10, "decodeMessageSecurityObject:options:error:", v8, v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v11;
}

void sub_1DEEE2344(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t nsheim_decode_CMSSignedData(void *a1)
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");

  return _asn1_decode_top();
}

uint64_t free_CMSSignedData()
{
  return _asn1_free_top();
}

void dumpNSData(const char *a1, void *a2)
{
  int v2;
  CFPropertyListRef v3;
  const __CFString *v4;
  CFPropertyListRef v5;
  int IsForced;
  CFTypeID v7;
  CFTypeID TypeID;
  const __CFBoolean *v9;
  BOOL v10;
  CFTypeID v11;
  CFTypeID v12;
  int Value;
  dispatch_once_t *v14;
  id *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  id v21;
  unsigned __int8 *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  const char *v27;
  unsigned int v28;
  int v29;
  NSObject *v30;
  unsigned __int8 *v31;
  char *v32;
  id *v33;
  id v34;
  id v35;
  const char *v36;
  id v37;
  dispatch_once_t *v38;
  unsigned __int8 *v39;
  void *v40;
  uint64_t v41;
  id v43;
  uint64_t v44;
  unsigned __int8 *v45;
  unsigned __int8 *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  _BYTE v52[20];
  _BYTE v53[10];
  char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  if (a1 && v43)
  {
    v2 = os_variant_allows_internal_security_policies();
    v3 = CFPreferencesCopyValue(CFSTR("logCMSDecodingFailures"), CFSTR("com.apple.messagesecurity"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
    v4 = (const __CFString *)*MEMORY[0x1E0C9B228];
    v5 = CFPreferencesCopyAppValue(CFSTR("logCMSDecodingFailures"), (CFStringRef)*MEMORY[0x1E0C9B228]);
    IsForced = CFPreferencesAppValueIsForced(CFSTR("logCMSDecodingFailures"), v4);
    if (v2 && v3 && (v7 = CFGetTypeID(v3), TypeID = CFBooleanGetTypeID(), v9 = (const __CFBoolean *)v3, v7 == TypeID)
      || (IsForced ? (v10 = v5 == 0) : (v10 = 1),
          !v10 && (v11 = CFGetTypeID(v5), v12 = CFBooleanGetTypeID(), v9 = (const __CFBoolean *)v5, v11 == v12)))
    {
      Value = CFBooleanGetValue(v9);
    }
    else
    {
      Value = 0;
    }
    v14 = &MS_DEFAULT_LOG_BLOCK;
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_148);
    v15 = (id *)&MS_DEFAULT_LOG_INTERNAL;
    v16 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
    {
      v17 = v16;
      v18 = objc_msgSend(CFSTR("logCMSDecodingFailures"), "cString");
      *(_DWORD *)buf = 136316674;
      v48 = "valueForBooleanDefault";
      v19 = "NULL";
      v49 = 2080;
      v50 = v18;
      if (v3)
        v20 = "NOT_NULL";
      else
        v20 = "NULL";
      *(_DWORD *)v52 = v2;
      v51 = 1024;
      if (v5)
        v19 = "NOT_NULL";
      *(_WORD *)&v52[4] = 2080;
      *(_QWORD *)&v52[6] = v20;
      *(_WORD *)&v52[14] = 1024;
      *(_DWORD *)&v52[16] = IsForced;
      *(_WORD *)v53 = 2080;
      *(_QWORD *)&v53[2] = v19;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = Value;
      _os_log_impl(&dword_1DEED9000, v17, OS_LOG_TYPE_DEBUG, "%s %s isInternal: %d val: %s isForced: %d appVal: %s result: %d", buf, 0x3Cu);

    }
    if (v3)
      CFRelease(v3);
    if (v5)
      CFRelease(v5);
    if (Value)
    {
      v21 = objc_retainAutorelease(v43);
      v22 = (unsigned __int8 *)objc_msgSend(v21, "bytes");
      v23 = objc_msgSend(v21, "length");
      v24 = (char *)&log_buffer;
      bzero(&log_buffer, 0x2711uLL);
      if (v23)
      {
        v25 = 0;
        v46 = 0;
        v26 = v22 + 1;
        v27 = "0x%02x,";
        do
        {
          v28 = *v22++;
          v29 = snprintf(&v24[v25], 10001 - v25, v27, v28);
          if (!--v23 || (v25 += v29, (unint64_t)(v25 - 9996) <= 5))
          {
            if (*v14 != -1)
              dispatch_once(v14, &__block_literal_global_130_0);
            v30 = *v15;
            v31 = v26;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v45 = v22;
              v32 = v24;
              v33 = v15;
              v34 = objc_retainAutorelease(v21);
              v44 = objc_msgSend(v34, "bytes");
              v35 = objc_retainAutorelease(v34);
              v36 = v27;
              v37 = v21;
              v38 = v14;
              v39 = &v26[-objc_msgSend(v35, "bytes")];
              v40 = v35;
              v15 = v33;
              v24 = v32;
              v22 = v45;
              v41 = objc_msgSend(v40, "length");
              *(_DWORD *)buf = 136316418;
              v48 = a1;
              v49 = 2048;
              v50 = v44;
              v51 = 2048;
              *(_QWORD *)v52 = v46;
              *(_WORD *)&v52[8] = 2048;
              *(_QWORD *)&v52[10] = v39;
              v14 = v38;
              v21 = v37;
              v27 = v36;
              *(_WORD *)&v52[18] = 2048;
              *(_QWORD *)v53 = v41;
              *(_WORD *)&v53[8] = 2080;
              v54 = v24;
              _os_log_impl(&dword_1DEED9000, v30, OS_LOG_TYPE_ERROR, "logging %s 0x%zx [%ld-%ld)/%ld %s", buf, 0x3Eu);
              v31 = v45;
            }

            v46 = &v31[-objc_msgSend(objc_retainAutorelease(v21), "bytes")];
            bzero(v24, 0x2711uLL);
            v25 = 0;
          }
          ++v26;
        }
        while (v23);
      }
    }
  }

}

void _MSLog(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  switch(a1)
  {
    case 1:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
        v4 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
        {
          v10 = 138543362;
          v11 = v3;
          v5 = v4;
          v6 = OS_LOG_TYPE_DEBUG;
          goto LABEL_25;
        }
      }
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_4_0);
        v7 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
        {
          v10 = 138543362;
          v11 = v3;
          v5 = v7;
          v6 = OS_LOG_TYPE_INFO;
          goto LABEL_25;
        }
      }
      break;
    case 3:
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
      v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v3;
        goto LABEL_20;
      }
      break;
    case 4:
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_8);
      v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v3;
LABEL_20:
        v5 = v8;
        v6 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_25;
      }
      break;
    case 5:
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_10_1);
      v9 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543362;
        v11 = v3;
        v5 = v9;
        v6 = OS_LOG_TYPE_ERROR;
LABEL_25:
        _os_log_impl(&dword_1DEED9000, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
      break;
    default:
      break;
  }

}

id findBestMutuallySupportedSignatureAlgorithm(__SecCertificate *a1, void *a2)
{
  id v3;
  uint64_t KeyTypeForCertificate;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = a2;
  KeyTypeForCertificate = getKeyTypeForCertificate(a1);
  if (KeyTypeForCertificate == 1)
  {
    v8 = findBestMutuallySupportedRSASignatureAlgorithm_onceToken;
    v9 = v3;
    if (v8 != -1)
      dispatch_once(&findBestMutuallySupportedRSASignatureAlgorithm_onceToken, &__block_literal_global_11);
    v7 = &findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
  }
  else
  {
    if (KeyTypeForCertificate != 3)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v5 = findBestMutuallySupportedECSignatureAlgorithm_onceToken;
    v6 = v3;
    if (v5 != -1)
      dispatch_once(&findBestMutuallySupportedECSignatureAlgorithm_onceToken, &__block_literal_global_10);
    v7 = &findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
  }
  findBestMutuallySupportAlgorithm((void *)*v7, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v10;
}

uint64_t getKeyTypeForCertificate(__SecCertificate *a1)
{
  SecKeyRef v1;
  SecKeyRef v2;
  uint64_t AlgorithmId;

  if (!a1)
    return -1;
  v1 = SecCertificateCopyKey(a1);
  if (!v1)
    return -1;
  v2 = v1;
  AlgorithmId = SecKeyGetAlgorithmId();
  CFRelease(v2);
  return AlgorithmId;
}

id findBestMutuallySupportedKeyEncryptionAlgorithm(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken, &__block_literal_global);
  findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __findBestMutuallySupportedKeyEncryptionAlgorithm_block_invoke()
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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.45"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.25"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.5"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.3.7"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.42"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.22"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v6);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.2"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v7);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.3.7"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v8);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.3.2"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v9);

  v10 = (void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;

}

id findBestMutuallySupportAlgorithm(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __findBestMutuallySupportAlgorithm_block_invoke;
    v8[3] = &unk_1EA961998;
    v9 = v4;
    v10 = &v13;
    v11 = v12;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
    v6 = (id)v14[5];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void sub_1DEEE3334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id findBestMutuallySupportedEncryptionAlgorithm(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = findBestMutuallySupportedEncryptionAlgorithm_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&findBestMutuallySupportedEncryptionAlgorithm_onceToken, &__block_literal_global_2);
  findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __findBestMutuallySupportedEncryptionAlgorithm_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.42"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.22"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.2"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.3.7"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.3.2"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);

  v6 = (void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;

}

id MSDecryptGCMOneShot(uint64_t a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99DF0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v9, "dataWithLength:", objc_msgSend(v10, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v13);
  objc_msgSend(v15, "bytes");
  objc_msgSend(v15, "length");

  v16 = objc_retainAutorelease(v12);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");

  v17 = objc_retainAutorelease(v10);
  objc_msgSend(v17, "bytes");
  v18 = objc_msgSend(v17, "length");

  v19 = objc_retainAutorelease(v14);
  v20 = objc_msgSend(v19, "mutableBytes");
  v21 = objc_retainAutorelease(v11);
  v22 = objc_msgSend(v21, "bytes");
  v23 = objc_msgSend(v21, "length");

  v30 = v22;
  v24 = CCCryptorGCMOneshotDecrypt();
  if ((_DWORD)v24)
  {
    v25 = v24;
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_4);
    v26 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v33 = v25;
      _os_log_impl(&dword_1DEED9000, v26, OS_LOG_TYPE_ERROR, "Error decrypting underlying crypto error %d", buf, 8u);
    }
    if (a6)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], (int)v25, *a6, CFSTR("MSDecryptGCM error: %d"), v25, v20, v30, v23);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v27;
    }
    else
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], (int)v25, 0, CFSTR("MSDecryptGCM error: %d"), v25, v20, v30, v23);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }

    v28 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v19, v18, v20, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

void __findBestMutuallySupportedECSignatureAlgorithm_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.3.3"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.3.2"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.3.4"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.3.1"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.1"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);

  v6 = (void *)findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
  findBestMutuallySupportedECSignatureAlgorithm_ecPreferences = (uint64_t)v0;

}

void __findBestMutuallySupportedRSASignatureAlgorithm_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.1.12"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.1.11"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.1.13"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.1.14"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.1.5"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);

  v6 = (void *)findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
  findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __findBestMutuallySupportAlgorithm_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v8 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __findBestMutuallySupportAlgorithm_block_invoke_2;
  v16 = &unk_1EA961970;
  v9 = v7;
  v17 = v9;
  v18 = &v19;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
  v10 = v20[3];
  if (v10 == objc_msgSend(*(id *)(a1 + 32), "count", v13, v14, v15, v16))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  v11 = v20[3];
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v11 > *(_QWORD *)(v12 + 24))
  {
    *(_QWORD *)(v12 + 24) = v11;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

  _Block_object_dispose(&v19, 8);
}

void sub_1DEEE3B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __findBestMutuallySupportAlgorithm_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __algorithmOIDToParameters_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[27];
  _QWORD v3[28];

  v3[27] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1.2.840.113549.2.5");
  v2[1] = CFSTR("1.3.14.3.2.26");
  v3[0] = MEMORY[0x1E0C9AAA0];
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = CFSTR("2.16.840.1.101.3.4.2.4");
  v2[3] = CFSTR("2.16.840.1.101.3.4.2.1");
  v3[2] = MEMORY[0x1E0C9AAB0];
  v3[3] = MEMORY[0x1E0C9AAB0];
  v2[4] = CFSTR("2.16.840.1.101.3.4.2.2");
  v2[5] = CFSTR("2.16.840.1.101.3.4.2.3");
  v3[4] = MEMORY[0x1E0C9AAB0];
  v3[5] = MEMORY[0x1E0C9AAB0];
  v2[6] = CFSTR("1.2.840.113549.1.1.4");
  v2[7] = CFSTR("1.2.840.113549.1.1.5");
  v3[6] = MEMORY[0x1E0C9AAA0];
  v3[7] = MEMORY[0x1E0C9AAA0];
  v2[8] = CFSTR("1.2.840.113549.1.1.14");
  v2[9] = CFSTR("1.2.840.113549.1.1.11");
  v3[8] = MEMORY[0x1E0C9AAA0];
  v3[9] = MEMORY[0x1E0C9AAA0];
  v2[10] = CFSTR("1.2.840.113549.1.1.12");
  v2[11] = CFSTR("1.2.840.113549.1.1.13");
  v3[10] = MEMORY[0x1E0C9AAA0];
  v3[11] = MEMORY[0x1E0C9AAA0];
  v2[12] = CFSTR("1.2.840.10045.4.1");
  v2[13] = CFSTR("1.2.840.10045.4.3.1");
  v3[12] = MEMORY[0x1E0C9AAB0];
  v3[13] = MEMORY[0x1E0C9AAB0];
  v2[14] = CFSTR("1.2.840.10045.4.3.2");
  v2[15] = CFSTR("1.2.840.10045.4.3.3");
  v3[14] = MEMORY[0x1E0C9AAB0];
  v3[15] = MEMORY[0x1E0C9AAB0];
  v2[16] = CFSTR("1.2.840.10045.4.3.4");
  v2[17] = CFSTR("1.2.840.113549.1.1.1");
  v3[16] = MEMORY[0x1E0C9AAB0];
  v3[17] = MEMORY[0x1E0C9AAA0];
  v2[18] = CFSTR("2.16.840.1.101.3.4.1.2");
  v2[19] = CFSTR("2.16.840.1.101.3.4.1.22");
  v3[18] = MEMORY[0x1E0C9AAA0];
  v3[19] = MEMORY[0x1E0C9AAA0];
  v2[20] = CFSTR("2.16.840.1.101.3.4.1.42");
  v2[21] = CFSTR("2.16.840.1.101.3.4.1.6");
  v3[20] = MEMORY[0x1E0C9AAA0];
  v3[21] = MEMORY[0x1E0C9AAA0];
  v2[22] = CFSTR("2.16.840.1.101.3.4.1.26");
  v2[23] = CFSTR("2.16.840.1.101.3.4.1.46");
  v3[22] = MEMORY[0x1E0C9AAA0];
  v3[23] = MEMORY[0x1E0C9AAA0];
  v2[24] = CFSTR("2.16.840.1.101.3.4.1.5");
  v2[25] = CFSTR("2.16.840.1.101.3.4.1.25");
  v3[24] = MEMORY[0x1E0C9AAB0];
  v3[25] = MEMORY[0x1E0C9AAB0];
  v2[26] = CFSTR("2.16.840.1.101.3.4.1.45");
  v3[26] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 27);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters;
  algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters = v0;

}

_QWORD *NSDataFromBaseData(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_QWORD *NSDataFromBitString(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_QWORD *NSDataFromAnySet(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1[1], *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_QWORD *NSStringFromUTF8String(_QWORD *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *a1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_1DEEEAEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1DEEEB038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEEB1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEEB5C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DEEEC260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_1DEEEC498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEECB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id generalizedTimeStringFromDate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x1E0CB3578];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyyMMddHHmmss'Z'"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v5);

  objc_msgSend(v3, "stringFromDate:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id UTCStringFromDate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x1E0CB3578];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyMMddHHmmss'Z'"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v5);

  objc_msgSend(v3, "stringFromDate:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1DEEEE874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF0AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1DEEF133C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF14D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF17B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF1B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF1ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __decodeEmbeddedCMSContent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __decodeEmbeddedCMSContent_block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __decodeEmbeddedCMSContent_block_invoke_6()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __decodeEmbeddedCMSContent_block_invoke_10()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

SecCertificateRef MSSecIdentityCopyCertificateWithError(__SecIdentity *a1, _QWORD *a2)
{
  OSStatus v3;
  id v4;
  SecCertificateRef result;
  SecCertificateRef certificateRef;

  certificateRef = 0;
  v3 = SecIdentityCopyCertificate(a1, &certificateRef);
  if (!v3)
    return certificateRef;
  if (!a2)
    return 0;
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], v3, *a2, CFSTR("unable to get certificate from provided identity"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a2 = v4;
  return result;
}

SecKeyRef MSSecIdentityCopyKeyWithError(__SecIdentity *a1, _QWORD *a2)
{
  OSStatus v3;
  id v4;
  SecKeyRef result;
  SecKeyRef privateKeyRef;

  privateKeyRef = 0;
  v3 = SecIdentityCopyPrivateKey(a1, &privateKeyRef);
  if (!v3)
    return privateKeyRef;
  if (!a2)
    return 0;
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], v3, *a2, CFSTR("unable to get private key from provided identity"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a2 = v4;
  return result;
}

SecTrustRef MSSecTrustCreateWithError(uint64_t a1, void *a2, void *a3, void *a4, id *a5)
{
  id v9;
  const __CFDate *v10;
  id v11;
  void *v12;
  void *v13;
  OSStatus v14;
  SecTrustRef v15;
  const __CFString *v17;
  uint64_t v18;
  SecTrustRef trust;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  trust = 0;
  if (a5 && *a5)
    v12 = (void *)objc_msgSend(*a5, "copy");
  else
    v12 = 0;
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertObject:atIndex:", a1, 0);
  v14 = SecTrustCreateWithCertificates(v13, v11, &trust);
  if (v14)
  {
    v17 = CFSTR("unable to create trust object");
  }
  else
  {
    if (!v10 || (v14 = SecTrustSetVerifyDate(trust, v10)) == 0)
    {
      if (!a5)
        goto LABEL_14;
      goto LABEL_12;
    }
    v17 = CFSTR("unable to set verify date on trust object");
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], v14, v12, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v18;
  if (!a5)
    goto LABEL_14;
LABEL_12:
  if (v12)
    *a5 = objc_retainAutorelease(v12);
LABEL_14:
  v15 = trust;

  return v15;
}

CFTypeRef findItemInAllAvailableKeychains(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  CFTypeRef v12;
  int v13;
  CFTypeID v14;
  CFTypeID TypeID;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v24;
  int v25;
  CFTypeRef v26;
  int v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeRef v30;
  int v32;
  CFTypeRef result;

  v1 = a1;
  result = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CD6F38]);
  v5 = *MEMORY[0x1E0CD70A8];
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70A8]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v1, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (!v9)
    {
      v10 = 0;
      goto LABEL_23;
    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v1);
  objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v5);
  objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x1E0CD6B88], *MEMORY[0x1E0CD6B80]);
  if (SecItemCopyMatching((CFDictionaryRef)v10, &result))
    v11 = 1;
  else
    v11 = v4;
  if (v11 != 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_47;
  }
  v12 = result;
  if (result)
    v13 = v4;
  else
    v13 = 0;
  if (v13 == 1)
  {
    v14 = CFGetTypeID(result);
    TypeID = CFArrayGetTypeID();
    v12 = result;
    if (v14 == TypeID)
    {
      objc_msgSend(v2, "addObjectsFromArray:", result);
LABEL_20:
      v12 = result;
      goto LABEL_21;
    }
  }
  if (v12)
    v19 = v4;
  else
    v19 = 0;
  if (v19 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_20;
  }
LABEL_21:
  if (v12)
  {
    result = 0;
    CFRelease(v12);
  }
LABEL_23:
  v20 = (void *)_SecSecuritydCopyWhoAmI();
  v18 = v20;
  v16 = 0;
  if (!v20)
  {
    v17 = 0;
    goto LABEL_47;
  }
  objc_msgSend(v20, "objectForKey:", CFSTR("status"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_46:
    v16 = 0;
    goto LABEL_47;
  }
  objc_msgSend(v18, "objectForKey:", CFSTR("musr"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("system-keychain"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || !v17 || objc_msgSend(v17, "length") != 16)
  {

    goto LABEL_46;
  }
  v17 = objc_retainAutorelease(v17);
  v22 = objc_msgSend(v17, "bytes");
  v24 = *(_QWORD *)v22 != 0x104B57A5353A5AA7 || *(_DWORD *)(v22 + 8) != -1803342146;

  if (v24)
    goto LABEL_46;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  if (SecItemCopyMatching((CFDictionaryRef)v16, &result))
    v25 = 1;
  else
    v25 = v4;
  if (v25 != 1)
    goto LABEL_47;
  v26 = result;
  if (result)
    v27 = v4;
  else
    v27 = 0;
  if (v27 == 1)
  {
    v28 = CFGetTypeID(result);
    v29 = CFArrayGetTypeID();
    v26 = result;
    if (v28 == v29)
    {
      objc_msgSend(v2, "addObjectsFromArray:", result);
LABEL_57:
      v26 = result;
      goto LABEL_58;
    }
  }
  if (v26)
    v32 = v4;
  else
    v32 = 0;
  if (v32 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_57;
  }
LABEL_58:
  if (v26)
  {
    result = 0;
    CFRelease(v26);
  }
LABEL_47:
  v30 = result;
  if (v4)
  {
    if (result)
    {
      result = 0;
      CFRelease(v30);
    }
    v30 = v2;
    result = v30;
  }

  return v30;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __findCertificateByIssuerAndSerialNumber_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByIssuerAndSerialNumber_block_invoke_35()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByIssuerAndSerialNumber_block_invoke_39()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByIssuerAndSerialNumber_block_invoke_41()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

__CFString *NSStringFromDERIntegerData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  __CFString *v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    objc_msgSend(v3, "bytes");
    objc_msgSend(v3, "length");
    if (der_get_integer() || objc_msgSend(v3, "length"))
    {
      objc_msgSend(v3, "asMessageSecurityHexString");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), 0);
    }
    v5 = (__CFString *)v4;
  }
  else
  {
    v5 = CFSTR("NULL");
  }

  return v5;
}

__CFString *NSSStringFromIssuerName(void *a1)
{
  id v1;
  __CFString *v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  __int128 *v7;
  __CFString *v8;
  __int128 v9;
  __int128 v10;
  MSOID *v11;
  MSOID *v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  unint64_t v25;
  __int128 v26;
  char *__s[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v1 = a1;
  if (v1)
  {
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v24 = v1;
    v2 = CFSTR("INVALID_ISSUER");
    if (!nsheim_decode_Name(v1) && (_DWORD)v30 == 1)
    {
      v3 = DWORD2(v30);
      if (DWORD2(v30))
      {
        v4 = 0;
        v2 = &stru_1EA967BF8;
        do
        {
          v5 = (unsigned int *)(v31 + 16 * v4);
          v6 = *v5;
          if ((_DWORD)v6)
          {
            v25 = v4;
            v7 = (__int128 *)*((_QWORD *)v5 + 1);
            do
            {
              v8 = v2;
              v28 = 0;
              v26 = 0u;
              *(_OWORD *)__s = 0u;
              v9 = *v7;
              v10 = v7[1];
              v28 = *((_QWORD *)v7 + 4);
              v26 = v9;
              *(_OWORD *)__s = v10;
              v11 = -[MSOID initWithAsn1OID:error:]([MSOID alloc], "initWithAsn1OID:error:", &v26, 0);
              v12 = v11;
              if (v11)
              {
                -[MSOID OIDString](v11, "OIDString");
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v13 = CFSTR("INVALID_OID");
              }
              switch(LODWORD(__s[0]))
              {
                case 1:
                case 3:
                  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v16 = __s[1];
                  v15 = v28;
                  v17 = 1;
                  goto LABEL_18;
                case 2:
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s[1], strlen(__s[1]));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "asMessageSecurityHexString");
                  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  break;
                case 4:
                  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v16 = __s[1];
                  v15 = v28;
                  v17 = 2348810496;
                  goto LABEL_18;
                case 5:
                  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v21 = objc_msgSend(v20, "initWithUTF8String:", __s[1]);
                  goto LABEL_19;
                case 6:
                  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v16 = __s[1];
                  v15 = v28;
                  v17 = 10;
LABEL_18:
                  v21 = objc_msgSend(v14, "initWithBytes:length:encoding:", v15, v16, v17);
LABEL_19:
                  v18 = (__CFString *)v21;
                  break;
                default:
                  v18 = CFSTR("UNEXPECTED_VALUE");
                  break;
              }
              -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("%@:%@ "), v13, v18);
              v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v7 = (__int128 *)((char *)v7 + 40);
              --v6;
            }
            while (v6);
            v3 = DWORD2(v30);
            v4 = v25;
          }
          if (++v4 < v3)
          {
            -[__CFString stringByAppendingFormat:](v2, "stringByAppendingFormat:", CFSTR("| "));
            v22 = objc_claimAutoreleasedReturnValue();

            v3 = DWORD2(v30);
            v2 = (__CFString *)v22;
          }
        }
        while (v4 < v3);
      }
      else
      {
        v2 = &stru_1EA967BF8;
      }
    }
    v1 = v24;
  }
  else
  {
    v2 = CFSTR("NULL");
  }

  return v2;
}

uint64_t findCertificateBySubjectKeyID(_QWORD *a1, void *a2, void *a3, id *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  CFTypeRef ItemInAllAvailableKeychains;
  CFTypeID v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v29 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  NSDataFromOctetString(a1);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v27 = a4;
  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 && objc_msgSend(v30, "count"))
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __findCertificateBySubjectKeyID_block_invoke;
    v36[3] = &unk_1EA9621E8;
    v38 = &v40;
    v39 = &v46;
    v37 = v28;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v36);

  }
  v8 = v47[3];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v9, "setObject:forKey:", v41[5], *MEMORY[0x1E0CD6B70]);
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
    if (v29)
      objc_msgSend(v9, "setObject:forKey:", v29, *MEMORY[0x1E0CD7088]);
    v35 = v7;
    v25 = v9;
    ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v9);
    v26 = v7;

    if (ItemInAllAvailableKeychains)
    {
      v11 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v11 == SecCertificateGetTypeID())
        v47[3] = (uint64_t)ItemInAllAvailableKeychains;
      else
        CFRelease(ItemInAllAvailableKeychains);
    }
    if (v47[3])
    {
      v7 = v26;
    }
    else
    {
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_47);
      v12 = (id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v41[5], "asMessageSecurityHexString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        v52 = 1752392040;
        v53 = 2112;
        v54 = v13;
        _os_log_impl(&dword_1DEED9000, v12, OS_LOG_TYPE_INFO, "QuerySKID = %{mask.hash}@", buf, 0x16u);

      }
      dumpNSData("QuerySKID", (void *)v41[5]);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v28;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v50, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v32;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v17);
            if (MS_DEFAULT_LOG_BLOCK != -1)
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_50);
            v19 = (id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v18, "asMessageSecurityHexString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              v52 = 1752392040;
              v53 = 2112;
              v54 = v20;
              _os_log_impl(&dword_1DEED9000, v19, OS_LOG_TYPE_INFO, "BundledSKID = %{mask.hash}@", buf, 0x16u);

            }
            dumpNSData("BundledSKID", v18);
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v50, 16);
        }
        while (v15);
      }

      v21 = MSErrorKeychainDomain[0];
      v22 = v41[5];
      if (v22)
      {
        objc_msgSend((id)v41[5], "asMessageSecurityHexString");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = CFSTR("NULL");
      }
      +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", v21, -25300, 1, v26, CFSTR("%s did not find SubjectKeyIdentifier %@"), "findCertificateBySubjectKeyID", v23, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
    }
    if (v27 && v7)
      *v27 = objc_retainAutorelease(v7);
    v8 = v47[3];

  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v8;
}

void sub_1DEEF3380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void __findCertificateBySubjectKeyID_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *SubjectKeyID;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id cf;

  cf = a2;
  SubjectKeyID = (void *)SecCertificateGetSubjectKeyID();
  v7 = SubjectKeyID;
  if (SubjectKeyID)
    CFRetain(SubjectKeyID);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8 && objc_msgSend(v8, "isEqualToData:", v7))
  {
    v9 = cf;
    if (cf)
    {
      CFRetain(cf);
      v9 = cf;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
    *a4 = 1;
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }

}

void __findCertificateBySubjectKeyID_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateBySubjectKeyID_block_invoke_49()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

uint64_t findCertificateByEmailAddress(void *a1, void *a2, void **a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  CFTypeRef ItemInAllAvailableKeychains;
  CFTypeID v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  CFTypeID v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 buf;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  if (a3)
  {
    v7 = *a3;
    if (*a3)
      v7 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v7 = 0;
  }
  v52 = v7;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0CD7088]);
  v9 = (id *)(v48 + 5);
  obj = (id)v48[5];
  ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9, obj);
  if (ItemInAllAvailableKeychains)
  {
    v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecCertificateGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", ItemInAllAvailableKeychains);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        v16 = 0;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_61);
        v17 = (id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = objc_msgSend(v16, "count");
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1DEED9000, v17, OS_LOG_TYPE_DEBUG, "found %lu candidate email certs from keychain", (uint8_t *)&buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v42[5];
        v42[5] = v19;

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __findCertificateByEmailAddress_block_invoke_62;
        v37[3] = &unk_1EA962278;
        v21 = v5;
        v38 = v21;
        v39 = &v41;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v37);
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_64);
        v22 = (id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = objc_msgSend(v16, "count");
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v23;
          _os_log_impl(&dword_1DEED9000, v22, OS_LOG_TYPE_DEBUG, "found %lu candidate certs from keychain with matching email addresses", (uint8_t *)&buf, 0xCu);
        }

        v13 = (id)v42[5];
        if (objc_msgSend(v13, "count") == 1)
        {
          objc_msgSend(v13, "objectAtIndex:", 0);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v54[3] = (uint64_t)v24;

        }
        else
        {
          if (!objc_msgSend(v13, "count"))
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", MSErrorKeychainDomain[0], -25300, 1, v48[5], CFSTR("unable to find any certificates with email address %@"), v21);
              v14 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }
            goto LABEL_34;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v42[5];
          v42[5] = v25;

          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __findCertificateByEmailAddress_block_invoke_67;
          v36[3] = &unk_1EA9622A0;
          v36[4] = &v47;
          v36[5] = &v41;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v36);
          if (MS_DEFAULT_LOG_BLOCK != -1)
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_69);
          v27 = (id)MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = objc_msgSend(v13, "count");
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v28;
            _os_log_impl(&dword_1DEED9000, v27, OS_LOG_TYPE_DEBUG, "found %lu valid email candidate certs", (uint8_t *)&buf, 0xCu);
          }

          v29 = objc_msgSend((id)v42[5], "count");
          v30 = (void *)v42[5];
          if (v29 != 1)
          {
            if (objc_msgSend(v30, "count"))
            {
              v33 = (id)v42[5];

              v13 = v33;
            }
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v58 = 0x2020000000;
            v59 = 0;
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __findCertificateByEmailAddress_block_invoke_70;
            v35[3] = &unk_1EA9622A0;
            v35[4] = &buf;
            v35[5] = &v53;
            objc_msgSend(v13, "enumerateObjectsUsingBlock:", v35);
            if (a3)
            {
              v34 = (void *)v48[5];
              if (v34)
                *a3 = objc_retainAutorelease(v34);
            }
            v14 = v54[3];
            _Block_object_dispose(&buf, 8);
            goto LABEL_34;
          }
          objc_msgSend(v30, "objectAtIndex:", 0);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v54[3] = (uint64_t)v31;

        }
        v14 = v54[3];
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", ItemInAllAvailableKeychains);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v12;
    goto LABEL_16;
  }
  if (a3)
  {
    +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", MSErrorKeychainDomain[0], -25300, 1, v48[5], CFSTR("unable to find any certificates in keychain"));
    v13 = 0;
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
LABEL_35:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v14;
}

void sub_1DEEF3BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void __findCertificateByEmailAddress_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByEmailAddress_block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = (void *)SecCertificateCopyRFC822Names();
    v3 = v5;
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __findCertificateByEmailAddress_block_invoke_2;
      v6[3] = &unk_1EA962250;
      v7 = *(id *)(a1 + 32);
      if (objc_msgSend(v4, "indexOfObjectPassingTest:", v6) != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

      v3 = v5;
    }
  }

}

BOOL __findCertificateByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

void __findCertificateByEmailAddress_block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByEmailAddress_block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __SecTrust *v5;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = MSSecTrustCreateWithError((uint64_t)v3, 0, 0, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    if (SecTrustEvaluateWithError(v5, 0))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    CFRelease(v5);
  }

}

void __findCertificateByEmailAddress_block_invoke_2_68()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __findCertificateByEmailAddress_block_invoke_70(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  CFTypeRef cf;

  cf = a2;
  SecCertificateNotValidAfter();
  v4 = (void *)cf;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v3;
    v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v6)
    {
      CFRelease(v6);
      v4 = (void *)cf;
    }
    if (v4)
    {
      CFRetain(v4);
      v4 = (void *)cf;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }

}

const void *findIdentityByCertificate(__SecCertificate *a1, void *a2, id *a3)
{
  id v5;
  id v6;
  void *v7;
  CFDataRef v8;
  CFDataRef v9;
  CFErrorRef v10;
  CFDataRef v11;
  CFTypeRef ItemInAllAvailableKeychains;
  const void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  CFErrorRef error;

  v5 = a2;
  error = 0;
  if (a3 && *a3)
    v6 = (id)objc_msgSend(*a3, "copy");
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SecCertificateCopySerialNumberData(a1, &error);
  v9 = v8;
  v10 = error;
  if (error || !v8)
  {

    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -26275, v10, CFSTR("Unable to get serial number from certificate"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  else
  {
    v11 = SecCertificateCopyNormalizedIssuerSequence(a1);
    if (v11)
    {
      objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
      objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x1E0CD69E8]);
      objc_msgSend(v7, "setObject:forKey:", v9, *MEMORY[0x1E0CD6B48]);
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
      if (v5)
        objc_msgSend(v7, "setObject:forKey:", v5, *MEMORY[0x1E0CD7088]);
      ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v7);
      if (ItemInAllAvailableKeychains)
      {
        v13 = ItemInAllAvailableKeychains;
        v14 = CFGetTypeID(ItemInAllAvailableKeychains);
        if (v14 == SecIdentityGetTypeID())
          goto LABEL_18;
        CFRelease(v13);
      }
    }
    else
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -26275, v6, CFSTR("Unable to get issuer sequence from certificate"));
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v15;
    }
  }
  v16 = v6;
  v17 = MSErrorKeychainDomain[0];
  NSStringFromDERIntegerData(v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSSStringFromIssuerName(v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", v17, -25300, 1, v6, CFSTR("%s did not find IssuerAndSerialNumber %@ %@"), "findIdentityByCertificate", v18, v19);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (a3 && v6)
  {
    v6 = objc_retainAutorelease(v6);
    v13 = 0;
    *a3 = v6;
  }
LABEL_18:

  return v13;
}

uint64_t findIdentityByEmailAddress(void *a1, void *a2, void **a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  CFTypeRef ItemInAllAvailableKeychains;
  CFTypeID v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  CFTypeID v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  _QWORD v30[7];
  _QWORD v31[4];
  _QWORD v32[6];
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v5 = a1;
  v6 = a2;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  if (a3)
  {
    v7 = *a3;
    if (*a3)
      v7 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v7 = 0;
  }
  v49 = v7;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0CD7088]);
  v9 = v45;
  obj = v45[5];
  ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9 + 5, obj);
  if (ItemInAllAvailableKeychains)
  {
    v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecIdentityGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", ItemInAllAvailableKeychains);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        v16 = 0;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v39[5];
        v39[5] = v17;

        v19 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __findIdentityByEmailAddress_block_invoke;
        v33[3] = &unk_1EA9622E8;
        v35 = &v44;
        v20 = v5;
        v34 = v20;
        v36 = &v38;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v33);
        v13 = (id)v39[5];

        if (objc_msgSend(v13, "count") == 1)
        {
          objc_msgSend(v13, "objectAtIndex:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v13, "count"))
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", MSErrorKeychainDomain[0], -25300, 1, v45[5], CFSTR("unable to find any identities with email address %@"), v20);
              v14 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }
            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v39[5];
          v39[5] = v22;

          v32[0] = v19;
          v32[1] = 3221225472;
          v32[2] = __findIdentityByEmailAddress_block_invoke_3;
          v32[3] = &unk_1EA9622A0;
          v32[4] = &v44;
          v32[5] = &v38;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v32);
          v24 = objc_msgSend((id)v39[5], "count");
          v25 = (void *)v39[5];
          if (v24 != 1)
          {
            if (objc_msgSend(v25, "count"))
            {
              v28 = (id)v39[5];

              v13 = v28;
            }
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            v31[3] = 0;
            v30[0] = v19;
            v30[1] = 3221225472;
            v30[2] = __findIdentityByEmailAddress_block_invoke_4;
            v30[3] = &unk_1EA962310;
            v30[4] = &v44;
            v30[5] = v31;
            v30[6] = &v50;
            objc_msgSend(v13, "enumerateObjectsUsingBlock:", v30);
            if (a3)
            {
              v29 = v45[5];
              if (v29)
                *a3 = objc_retainAutorelease(v29);
            }
            v14 = v51[3];
            _Block_object_dispose(v31, 8);
            goto LABEL_22;
          }
          objc_msgSend(v25, "objectAtIndex:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v26 = v21;
        v51[3] = (uint64_t)v26;

        v14 = v51[3];
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", ItemInAllAvailableKeychains);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v12;
    goto LABEL_16;
  }
  if (a3)
  {
    +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", MSErrorKeychainDomain[0], -25300, 1, v45[5], CFSTR("unable to find any identities in keychain"));
    v13 = 0;
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
LABEL_23:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v14;
}

void sub_1DEEF4640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void __findIdentityByEmailAddress_block_invoke(uint64_t a1, void *a2)
{
  __SecIdentity *v3;
  uint64_t v4;
  SecCertificateRef v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    v6 = SecCertificateCopyRFC822Names();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __findIdentityByEmailAddress_block_invoke_2;
      v11 = &unk_1EA962250;
      v12 = *(id *)(a1 + 32);
      if (objc_msgSend(v7, "indexOfObjectPassingTest:", &v8) != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3, v8, v9, v10, v11);
      CFRelease(v5);

    }
    else
    {
      CFRelease(v5);
    }
  }

}

BOOL __findIdentityByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

void __findIdentityByEmailAddress_block_invoke_3(uint64_t a1, void *a2)
{
  __SecIdentity *v3;
  uint64_t v4;
  SecCertificateRef v5;
  uint64_t v6;
  __SecTrust *v7;
  id v8;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(id *)(v6 + 40);
  v7 = MSSecTrustCreateWithError((uint64_t)v5, 0, 0, 0, &v8);
  objc_storeStrong((id *)(v6 + 40), v8);
  if (v7)
  {
    if (SecTrustEvaluateWithError(v7, 0))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    CFRelease(v7);
  }
  if (v5)
    CFRelease(v5);

}

void __findIdentityByEmailAddress_block_invoke_4(_QWORD *a1, void *a2)
{
  __SecIdentity *v3;
  uint64_t v4;
  SecCertificateRef v5;
  double v6;
  uint64_t v7;
  const void *v8;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(a1[4] + 8);
  obj = *(id *)(v4 + 40);
  v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  SecCertificateNotValidAfter();
  v7 = *(_QWORD *)(a1[5] + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    v8 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
    if (v8)
      CFRelease(v8);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = CFRetain(v3);
  }
  if (v5)
    CFRelease(v5);

}

id asn1ErrorToNSError(id result, _QWORD *a2)
{
  const __CFString *v3;

  v3 = CFSTR("ASN1_BAD_TIMEFORMAT");
  switch((int)result)
  {
    case 1859794432:
      break;
    case 1859794433:
      v3 = CFSTR("ASN1_MISSING_FIELD");
      break;
    case 1859794434:
      v3 = CFSTR("ASN1_MISPLACED_FIELD");
      break;
    case 1859794435:
      v3 = CFSTR("ASN1_TYPE_MISMATCH");
      break;
    case 1859794436:
      v3 = CFSTR("ASN1_OVERFLOW");
      break;
    case 1859794437:
      v3 = CFSTR("ASN1_OVERRUN");
      break;
    case 1859794438:
      v3 = CFSTR("ASN1_BAD_ID");
      break;
    case 1859794439:
      v3 = CFSTR("ASN1_BAD_LENGTH");
      break;
    case 1859794440:
      v3 = CFSTR("ASN1_BAD_FORMAT");
      break;
    case 1859794441:
      v3 = CFSTR("ASN1_PARSE_ERROR");
      break;
    case 1859794442:
      v3 = CFSTR("ASN1_EXTRA_DATA");
      break;
    case 1859794443:
      v3 = CFSTR("ASN1_BAD_CHARACTER");
      break;
    case 1859794444:
      v3 = CFSTR("ASN1_MIN_CONSTRAINT");
      break;
    case 1859794445:
      v3 = CFSTR("ASN1_MAX_CONSTRAINT");
      break;
    case 1859794446:
      v3 = CFSTR("ASN1_EXACT_CONSTRAINT");
      break;
    case 1859794447:
      v3 = CFSTR("ASN1_INDEF_OVERRUN");
      break;
    case 1859794448:
      v3 = CFSTR("ASN1_INDEF_UNDERRUN");
      break;
    case 1859794449:
      v3 = CFSTR("ASN1_GOT_BER");
      break;
    case 1859794450:
      v3 = CFSTR("ASN1_INDEF_EXTRA_DATA");
      break;
    case 1859794451:
      v3 = CFSTR("ASN1_INVALID_CHOICE");
      break;
    case 1859794452:
      v3 = CFSTR("ASN1_GOT_INDEFINITE");
      break;
    default:
      v3 = CFSTR("Unknown ASN1 error");
      if (!(_DWORD)result)
        v3 = CFSTR("ASN1 success");
      break;
  }
  if (a2)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], result, *a2, CFSTR("%@"), v3);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

uint64_t uint32ToNetworkByteOrder(uint64_t result, uint64_t a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    *(_BYTE *)(a2 - 1 + a3) = result;
    result = result >> 8;
  }
  return result;
}

void __dumpNSData_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __valueForBooleanDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1DEEF8FF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DEEF94CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t nsheim_decode_CMSVersion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSVersion()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSVersion()
{
  return _asn1_encode();
}

uint64_t length_CMSVersion()
{
  return _asn1_length();
}

uint64_t free_CMSVersion()
{
  return _asn1_free_top();
}

uint64_t copy_CMSVersion()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_DigestAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_DigestAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifiers(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifiers()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifiers()
{
  return _asn1_encode();
}

uint64_t length_DigestAlgorithmIdentifiers()
{
  return _asn1_length();
}

uint64_t free_DigestAlgorithmIdentifiers()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifiers()
{
  return _asn1_copy_top();
}

uint64_t add_DigestAlgorithmIdentifiers(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0x9EF01670uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t remove_DigestAlgorithmIdentifiers(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  void *v5;
  uint64_t result;

  if (*(_DWORD *)a1 <= a2)
    return 1859794437;
  _asn1_free_top();
  v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(_QWORD *)(a1 + 8) + 24 * a2), (const void *)(*(_QWORD *)(a1 + 8) + 24 * (a2 + 1)), 24 * (v4 - a2));
    v4 = *(_DWORD *)a1;
  }
  v5 = malloc_type_realloc(*(void **)(a1 + 8), 24 * v4, 0x148F2CF7uLL);
  if (!v5 && *(_DWORD *)a1)
    return 0;
  result = 0;
  *(_QWORD *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_SignatureAlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignatureAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SignatureAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_SignatureAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t decode_ContentType()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentType()
{
  return _asn1_encode();
}

uint64_t length_ContentType()
{
  return _asn1_length();
}

uint64_t copy_ContentType()
{
  return _asn1_copy_top();
}

uint64_t decode_MessageDigest()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageDigest()
{
  return _asn1_encode();
}

uint64_t length_MessageDigest()
{
  return _asn1_length();
}

uint64_t copy_MessageDigest()
{
  return _asn1_copy_top();
}

uint64_t decode_ContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentInfo()
{
  return _asn1_encode();
}

uint64_t length_ContentInfo()
{
  return _asn1_length();
}

uint64_t copy_ContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DataContent(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DataContent()
{
  return _asn1_decode_top();
}

uint64_t encode_DataContent()
{
  return _asn1_encode();
}

uint64_t length_DataContent()
{
  return _asn1_length();
}

uint64_t free_DataContent()
{
  return _asn1_free_top();
}

uint64_t copy_DataContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncapsulatedContentInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_EncapsulatedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncapsulatedContentInfo()
{
  return _asn1_encode();
}

uint64_t length_EncapsulatedContentInfo()
{
  return _asn1_length();
}

uint64_t free_EncapsulatedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncapsulatedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateChoices(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CertificateChoices()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateChoices()
{
  return _asn1_encode();
}

uint64_t length_CertificateChoices()
{
  return _asn1_length();
}

uint64_t free_CertificateChoices()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateChoices()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CertificateSet()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateSet()
{
  return _asn1_encode();
}

uint64_t length_CertificateSet()
{
  return _asn1_length();
}

uint64_t free_CertificateSet()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateSet()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateList(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateList()
{
  return _asn1_encode();
}

uint64_t length_CertificateList()
{
  return _asn1_length();
}

uint64_t free_CertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateRevocationLists(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CertificateRevocationLists()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateRevocationLists()
{
  return _asn1_encode();
}

uint64_t length_CertificateRevocationLists()
{
  return _asn1_length();
}

uint64_t free_CertificateRevocationLists()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateRevocationLists()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_IssuerAndSerialNumber(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_IssuerAndSerialNumber()
{
  return _asn1_decode_top();
}

uint64_t encode_IssuerAndSerialNumber()
{
  return _asn1_encode();
}

uint64_t length_IssuerAndSerialNumber()
{
  return _asn1_length();
}

uint64_t free_IssuerAndSerialNumber()
{
  return _asn1_free_top();
}

uint64_t copy_IssuerAndSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t encode_CMSIdentifier()
{
  return _asn1_encode();
}

uint64_t length_CMSIdentifier()
{
  return _asn1_length();
}

uint64_t copy_CMSIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignerIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SignerIdentifier()
{
  return _asn1_length();
}

uint64_t free_SignerIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignerIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientIdentifier()
{
  return _asn1_encode();
}

uint64_t length_RecipientIdentifier()
{
  return _asn1_length();
}

uint64_t free_RecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSAttributes(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSAttributes()
{
  return _asn1_decode_top();
}

uint64_t free_CMSAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSOrderedAttributes(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSOrderedAttributes()
{
  return _asn1_decode_top();
}

uint64_t free_CMSOrderedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSOrderedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignatureValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignatureValue()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureValue()
{
  return _asn1_encode();
}

uint64_t length_SignatureValue()
{
  return _asn1_length();
}

uint64_t free_SignatureValue()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignerInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfo()
{
  return _asn1_encode();
}

uint64_t length_SignerInfo()
{
  return _asn1_length();
}

uint64_t nsheim_decode_SignerInfos(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignerInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfos()
{
  return _asn1_encode();
}

uint64_t length_SignerInfos()
{
  return _asn1_length();
}

uint64_t free_SignerInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SignerInfos()
{
  return _asn1_copy_top();
}

uint64_t decode_CMSSignedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSSignedData()
{
  return _asn1_encode();
}

uint64_t length_CMSSignedData()
{
  return _asn1_length();
}

uint64_t copy_CMSSignedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_OriginatorInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorInfo()
{
  return _asn1_encode();
}

uint64_t length_OriginatorInfo()
{
  return _asn1_length();
}

uint64_t free_OriginatorInfo()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyEncryptionAlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentEncryptionAlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_EncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedKey()
{
  return _asn1_encode();
}

uint64_t length_EncryptedKey()
{
  return _asn1_length();
}

uint64_t free_EncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyTransRecipientInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyTransRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyTransRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_KeyTransRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_KeyTransRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyTransRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_ECC_CMS_SharedInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECC_CMS_SharedInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ECC_CMS_SharedInfo()
{
  return _asn1_encode();
}

uint64_t length_ECC_CMS_SharedInfo()
{
  return _asn1_length();
}

uint64_t free_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherKeyAttribute(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_OtherKeyAttribute()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherKeyAttribute()
{
  return _asn1_encode();
}

uint64_t length_OtherKeyAttribute()
{
  return _asn1_length();
}

uint64_t free_OtherKeyAttribute()
{
  return _asn1_free_top();
}

uint64_t copy_OtherKeyAttribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientKeyIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_RecipientKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_RecipientKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyAgreeRecipientIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyAgreeRecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKey()
{
  return _asn1_encode();
}

uint64_t length_RecipientEncryptedKey()
{
  return _asn1_length();
}

uint64_t free_RecipientEncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKeys(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKeys()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKeys()
{
  return _asn1_encode();
}

uint64_t length_RecipientEncryptedKeys()
{
  return _asn1_length();
}

uint64_t free_RecipientEncryptedKeys()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKeys()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UserKeyingMaterial(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_UserKeyingMaterial()
{
  return _asn1_decode_top();
}

uint64_t encode_UserKeyingMaterial()
{
  return _asn1_encode();
}

uint64_t length_UserKeyingMaterial()
{
  return _asn1_length();
}

uint64_t free_UserKeyingMaterial()
{
  return _asn1_free_top();
}

uint64_t copy_UserKeyingMaterial()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorPublicKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_OriginatorPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorPublicKey()
{
  return _asn1_encode();
}

uint64_t length_OriginatorPublicKey()
{
  return _asn1_length();
}

uint64_t free_OriginatorPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_OriginatorIdentifierOrKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_length();
}

uint64_t free_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorIdentifierOrKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorIdentifierOrKey()
{
  return _asn1_encode();
}

uint64_t length_OriginatorIdentifierOrKey()
{
  return _asn1_length();
}

uint64_t free_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_KeyAgreeRecipientInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_KeyAgreeRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_RecipientInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_RecipientInfo()
{
  return _asn1_length();
}

uint64_t free_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfos(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfos()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_RecipientInfos()
{
  return _asn1_length();
}

uint64_t free_SecCMS_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfos(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfos()
{
  return _asn1_encode();
}

uint64_t length_RecipientInfos()
{
  return _asn1_length();
}

uint64_t free_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContent(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_EncryptedContent()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContent()
{
  return _asn1_encode();
}

uint64_t length_EncryptedContent()
{
  return _asn1_length();
}

uint64_t free_EncryptedContent()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContentInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_EncryptedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContentInfo()
{
  return _asn1_encode();
}

uint64_t length_EncryptedContentInfo()
{
  return _asn1_length();
}

uint64_t free_EncryptedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UnprotectedAttributes(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_UnprotectedAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_UnprotectedAttributes()
{
  return _asn1_encode();
}

uint64_t length_UnprotectedAttributes()
{
  return _asn1_length();
}

uint64_t free_UnprotectedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_UnprotectedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSEncryptedData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSEncryptedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSEncryptedData()
{
  return _asn1_encode();
}

uint64_t length_CMSEncryptedData()
{
  return _asn1_length();
}

uint64_t free_CMSEncryptedData()
{
  return _asn1_free_top();
}

uint64_t copy_CMSEncryptedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_EnvelopedData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_EnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_EnvelopedData()
{
  return _asn1_length();
}

uint64_t free_SecCMS_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EnvelopedData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_EnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_EnvelopedData()
{
  return _asn1_length();
}

uint64_t free_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageAuthenticationCode(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_MessageAuthenticationCode()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageAuthenticationCode()
{
  return _asn1_encode();
}

uint64_t length_MessageAuthenticationCode()
{
  return _asn1_length();
}

uint64_t free_MessageAuthenticationCode()
{
  return _asn1_free_top();
}

uint64_t copy_MessageAuthenticationCode()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthEnvelopedData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AuthEnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthEnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_AuthEnvelopedData()
{
  return _asn1_length();
}

uint64_t free_AuthEnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_AuthEnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_CCM_ICVlen(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AES_CCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_CCM_ICVlen()
{
  return _asn1_encode();
}

uint64_t length_AES_CCM_ICVlen()
{
  return _asn1_length();
}

uint64_t free_AES_CCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_CCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CCMParameters(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_CCMParameters()
{
  return _asn1_encode();
}

uint64_t length_CCMParameters()
{
  return _asn1_length();
}

uint64_t free_CCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_CCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_GCM_ICVlen(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AES_GCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_GCM_ICVlen()
{
  return _asn1_encode();
}

uint64_t length_AES_GCM_ICVlen()
{
  return _asn1_length();
}

uint64_t free_AES_GCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_GCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GCMParameters(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_GCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_GCMParameters()
{
  return _asn1_encode();
}

uint64_t length_GCMParameters()
{
  return _asn1_length();
}

uint64_t free_GCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_GCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSRC2CBCParameter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSRC2CBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSRC2CBCParameter()
{
  return _asn1_encode();
}

uint64_t length_CMSRC2CBCParameter()
{
  return _asn1_length();
}

uint64_t free_CMSRC2CBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSRC2CBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSCBCParameter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CMSCBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSCBCParameter()
{
  return _asn1_encode();
}

uint64_t length_CMSCBCParameter()
{
  return _asn1_length();
}

uint64_t free_CMSCBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSCBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressionAlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CompressionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_CompressionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_CompressionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_CompressionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressedData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CompressedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressedData()
{
  return _asn1_encode();
}

uint64_t length_CompressedData()
{
  return _asn1_length();
}

uint64_t free_CompressedData()
{
  return _asn1_free_top();
}

uint64_t copy_CompressedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_length();
}

uint64_t free_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMEEncryptionKeyPreference()
{
  return _asn1_encode();
}

uint64_t length_SMIMEEncryptionKeyPreference()
{
  return _asn1_length();
}

uint64_t free_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapability(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SMIMECapability()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapability()
{
  return _asn1_encode();
}

uint64_t length_SMIMECapability()
{
  return _asn1_length();
}

uint64_t free_SMIMECapability()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapability()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapabilities(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SMIMECapabilities()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapabilities()
{
  return _asn1_encode();
}

uint64_t length_SMIMECapabilities()
{
  return _asn1_length();
}

uint64_t free_SMIMECapabilities()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapabilities()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignAttrsHash(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SignAttrsHash()
{
  return _asn1_decode_top();
}

uint64_t encode_SignAttrsHash()
{
  return _asn1_encode();
}

uint64_t length_SignAttrsHash()
{
  return _asn1_length();
}

uint64_t free_SignAttrsHash()
{
  return _asn1_free_top();
}

uint64_t copy_SignAttrsHash()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MultipleSignatures(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_MultipleSignatures()
{
  return _asn1_decode_top();
}

uint64_t encode_MultipleSignatures()
{
  return _asn1_encode();
}

uint64_t length_MultipleSignatures()
{
  return _asn1_length();
}

uint64_t free_MultipleSignatures()
{
  return _asn1_free_top();
}

uint64_t copy_MultipleSignatures()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageImprint(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_MessageImprint()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageImprint()
{
  return _asn1_encode();
}

uint64_t length_MessageImprint()
{
  return _asn1_length();
}

uint64_t free_MessageImprint()
{
  return _asn1_free_top();
}

uint64_t copy_MessageImprint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSAPolicyId(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TSAPolicyId()
{
  return _asn1_decode_top();
}

uint64_t encode_TSAPolicyId()
{
  return _asn1_encode();
}

uint64_t length_TSAPolicyId()
{
  return _asn1_length();
}

uint64_t free_TSAPolicyId()
{
  return _asn1_free_top();
}

uint64_t copy_TSAPolicyId()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampReq(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TimeStampReq()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampReq()
{
  return _asn1_encode();
}

uint64_t length_TimeStampReq()
{
  return _asn1_length();
}

uint64_t free_TimeStampReq()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampReq()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatus(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_PKIStatus()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatus()
{
  return _asn1_encode();
}

uint64_t length_PKIStatus()
{
  return _asn1_length();
}

uint64_t free_PKIStatus()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatus()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIFailureInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_PKIFailureInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFailureInfo()
{
  return _asn1_encode();
}

uint64_t length_PKIFailureInfo()
{
  return _asn1_length();
}

uint64_t free_PKIFailureInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFailureInfo()
{
  return _asn1_copy_top();
}

uint64_t PKIFailureInfo2int(int a1)
{
  return a1 & 0x203C025;
}

uint64_t int2PKIFailureInfo(int a1)
{
  return a1 & 0x203C025;
}

uint64_t nsheim_decode_PKIFreeText(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_PKIFreeText()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFreeText()
{
  return _asn1_encode();
}

uint64_t length_PKIFreeText()
{
  return _asn1_length();
}

uint64_t free_PKIFreeText()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFreeText()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatusInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_PKIStatusInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatusInfo()
{
  return _asn1_encode();
}

uint64_t length_PKIStatusInfo()
{
  return _asn1_length();
}

uint64_t free_PKIStatusInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatusInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampToken(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TimeStampToken()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampToken()
{
  return _asn1_encode();
}

uint64_t length_TimeStampToken()
{
  return _asn1_length();
}

uint64_t free_TimeStampToken()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampToken()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Accuracy(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Accuracy()
{
  return _asn1_decode_top();
}

uint64_t encode_Accuracy()
{
  return _asn1_encode();
}

uint64_t length_Accuracy()
{
  return _asn1_length();
}

uint64_t free_Accuracy()
{
  return _asn1_free_top();
}

uint64_t copy_Accuracy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSTInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TSTInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_TSTInfo()
{
  return _asn1_encode();
}

uint64_t length_TSTInfo()
{
  return _asn1_length();
}

uint64_t free_TSTInfo()
{
  return _asn1_free_top();
}

uint64_t copy_TSTInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampResp(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TimeStampResp()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampResp()
{
  return _asn1_encode();
}

uint64_t length_TimeStampResp()
{
  return _asn1_length();
}

uint64_t free_TimeStampResp()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampResp()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Version(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Version()
{
  return _asn1_decode_top();
}

uint64_t encode_Version()
{
  return _asn1_encode();
}

uint64_t length_Version()
{
  return _asn1_length();
}

uint64_t free_Version()
{
  return _asn1_free_top();
}

uint64_t copy_Version()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AlgorithmIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t encode_AlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_AlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t nsheim_decode_AttributeType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AttributeType()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeType()
{
  return _asn1_encode();
}

uint64_t length_AttributeType()
{
  return _asn1_length();
}

uint64_t free_AttributeType()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeType()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AttributeValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeValue()
{
  return _asn1_encode();
}

uint64_t length_AttributeValue()
{
  return _asn1_length();
}

uint64_t free_AttributeValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DirectoryString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DirectoryString()
{
  return _asn1_decode_top();
}

uint64_t encode_DirectoryString()
{
  return _asn1_encode();
}

uint64_t length_DirectoryString()
{
  return _asn1_length();
}

uint64_t free_DirectoryString()
{
  return _asn1_free_top();
}

uint64_t copy_DirectoryString()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Attribute(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t nsheim_decode_AttributeTypeAndValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AttributeTypeAndValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeTypeAndValue()
{
  return _asn1_encode();
}

uint64_t length_AttributeTypeAndValue()
{
  return _asn1_length();
}

uint64_t free_AttributeTypeAndValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeTypeAndValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RelativeDistinguishedName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RelativeDistinguishedName()
{
  return _asn1_decode_top();
}

uint64_t encode_RelativeDistinguishedName()
{
  return _asn1_encode();
}

uint64_t length_RelativeDistinguishedName()
{
  return _asn1_length();
}

uint64_t free_RelativeDistinguishedName()
{
  return _asn1_free_top();
}

uint64_t copy_RelativeDistinguishedName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RDNSequence(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RDNSequence()
{
  return _asn1_decode_top();
}

uint64_t encode_RDNSequence()
{
  return _asn1_encode();
}

uint64_t length_RDNSequence()
{
  return _asn1_length();
}

uint64_t free_RDNSequence()
{
  return _asn1_free_top();
}

uint64_t copy_RDNSequence()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Name(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Name()
{
  return _asn1_decode_top();
}

uint64_t encode_Name()
{
  return _asn1_encode();
}

uint64_t length_Name()
{
  return _asn1_length();
}

uint64_t free_Name()
{
  return _asn1_free_top();
}

uint64_t copy_Name()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSerialNumber(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t encode_CertificateSerialNumber()
{
  return _asn1_encode();
}

uint64_t length_CertificateSerialNumber()
{
  return _asn1_length();
}

uint64_t copy_CertificateSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Time(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Time()
{
  return _asn1_decode_top();
}

uint64_t encode_Time()
{
  return _asn1_encode();
}

uint64_t length_Time()
{
  return _asn1_length();
}

uint64_t free_Time()
{
  return _asn1_free_top();
}

uint64_t copy_Time()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Validity(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Validity()
{
  return _asn1_decode_top();
}

uint64_t encode_Validity()
{
  return _asn1_encode();
}

uint64_t length_Validity()
{
  return _asn1_length();
}

uint64_t free_Validity()
{
  return _asn1_free_top();
}

uint64_t copy_Validity()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UniqueIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_UniqueIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_UniqueIdentifier()
{
  return _asn1_encode();
}

uint64_t length_UniqueIdentifier()
{
  return _asn1_length();
}

uint64_t free_UniqueIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_UniqueIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectPublicKeyInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SubjectPublicKeyInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectPublicKeyInfo()
{
  return _asn1_encode();
}

uint64_t length_SubjectPublicKeyInfo()
{
  return _asn1_length();
}

uint64_t free_SubjectPublicKeyInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectPublicKeyInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extension(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Extension()
{
  return _asn1_decode_top();
}

uint64_t encode_Extension()
{
  return _asn1_encode();
}

uint64_t length_Extension()
{
  return _asn1_length();
}

uint64_t free_Extension()
{
  return _asn1_free_top();
}

uint64_t copy_Extension()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extensions(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Extensions()
{
  return _asn1_decode_top();
}

uint64_t encode_Extensions()
{
  return _asn1_encode();
}

uint64_t length_Extensions()
{
  return _asn1_length();
}

uint64_t free_Extensions()
{
  return _asn1_free_top();
}

uint64_t copy_Extensions()
{
  return _asn1_copy_top();
}

uint64_t add_Extensions(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 40 * *a1 + 40, 0xCAB23D5CuLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t remove_Extensions(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  void *v5;
  uint64_t result;

  if (*(_DWORD *)a1 <= a2)
    return 1859794437;
  _asn1_free_top();
  v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(_QWORD *)(a1 + 8) + 40 * a2), (const void *)(*(_QWORD *)(a1 + 8) + 40 * (a2 + 1)), 40 * (v4 - a2));
    v4 = *(_DWORD *)a1;
  }
  v5 = malloc_type_realloc(*(void **)(a1 + 8), 40 * v4, 0x66CF9F7DuLL);
  if (!v5 && *(_DWORD *)a1)
    return 0;
  result = 0;
  *(_QWORD *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_TBSCertificate(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TBSCertificate()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCertificate()
{
  return _asn1_encode();
}

uint64_t length_TBSCertificate()
{
  return _asn1_length();
}

uint64_t free_TBSCertificate()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCertificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificate(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Certificate()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificate()
{
  return _asn1_encode();
}

uint64_t length_Certificate()
{
  return _asn1_length();
}

uint64_t free_Certificate()
{
  return _asn1_free_top();
}

uint64_t copy_Certificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificates(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_Certificates()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificates()
{
  return _asn1_encode();
}

uint64_t length_Certificates()
{
  return _asn1_length();
}

uint64_t free_Certificates()
{
  return _asn1_free_top();
}

uint64_t copy_Certificates()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ValidationParms(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ValidationParms()
{
  return _asn1_decode_top();
}

uint64_t encode_ValidationParms()
{
  return _asn1_encode();
}

uint64_t length_ValidationParms()
{
  return _asn1_length();
}

uint64_t free_ValidationParms()
{
  return _asn1_free_top();
}

uint64_t copy_ValidationParms()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DomainParameters(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DomainParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_DomainParameters()
{
  return _asn1_encode();
}

uint64_t length_DomainParameters()
{
  return _asn1_length();
}

uint64_t free_DomainParameters()
{
  return _asn1_free_top();
}

uint64_t copy_DomainParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHParameter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DHParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_DHParameter()
{
  return _asn1_encode();
}

uint64_t length_DHParameter()
{
  return _asn1_length();
}

uint64_t free_DHParameter()
{
  return _asn1_free_top();
}

uint64_t copy_DHParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHPublicKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DHPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DHPublicKey()
{
  return _asn1_encode();
}

uint64_t length_DHPublicKey()
{
  return _asn1_length();
}

uint64_t free_DHPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DHPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_OtherName()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherName()
{
  return _asn1_encode();
}

uint64_t length_OtherName()
{
  return _asn1_length();
}

uint64_t free_OtherName()
{
  return _asn1_free_top();
}

uint64_t copy_OtherName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_GeneralName()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralName()
{
  return _asn1_encode();
}

uint64_t length_GeneralName()
{
  return _asn1_length();
}

uint64_t free_GeneralName()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralNames(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_GeneralNames()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralNames()
{
  return _asn1_encode();
}

uint64_t length_GeneralNames()
{
  return _asn1_length();
}

uint64_t free_GeneralNames()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralNames()
{
  return _asn1_copy_top();
}

uint64_t add_GeneralNames(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 40 * *a1 + 40, 0xEE883072uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t remove_GeneralNames(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  void *v5;
  uint64_t result;

  if (*(_DWORD *)a1 <= a2)
    return 1859794437;
  _asn1_free_top();
  v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(_QWORD *)(a1 + 8) + 40 * a2), (const void *)(*(_QWORD *)(a1 + 8) + 40 * (a2 + 1)), 40 * (v4 - a2));
    v4 = *(_DWORD *)a1;
  }
  v5 = malloc_type_realloc(*(void **)(a1 + 8), 40 * v4, 0x24FFAD1DuLL);
  if (!v5 && *(_DWORD *)a1)
    return 0;
  result = 0;
  *(_QWORD *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_KeyUsage(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyUsage()
{
  return _asn1_encode();
}

uint64_t length_KeyUsage()
{
  return _asn1_length();
}

uint64_t free_KeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_KeyUsage()
{
  return _asn1_copy_top();
}

uint64_t KeyUsage2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2KeyUsage(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_KeyIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_KeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityKeyIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AuthorityKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_AuthorityKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_AuthorityKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectKeyIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_SubjectKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SubjectKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_SubjectKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BasicConstraints(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_BasicConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_BasicConstraints()
{
  return _asn1_encode();
}

uint64_t length_BasicConstraints()
{
  return _asn1_length();
}

uint64_t free_BasicConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_BasicConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BaseDistance(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_BaseDistance()
{
  return _asn1_decode_top();
}

uint64_t encode_BaseDistance()
{
  return _asn1_encode();
}

uint64_t length_BaseDistance()
{
  return _asn1_length();
}

uint64_t free_BaseDistance()
{
  return _asn1_free_top();
}

uint64_t copy_BaseDistance()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtree(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_GeneralSubtree()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtree()
{
  return _asn1_encode();
}

uint64_t length_GeneralSubtree()
{
  return _asn1_length();
}

uint64_t free_GeneralSubtree()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtree()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtrees(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_GeneralSubtrees()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtrees()
{
  return _asn1_encode();
}

uint64_t length_GeneralSubtrees()
{
  return _asn1_length();
}

uint64_t free_GeneralSubtrees()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtrees()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_NameConstraints(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_NameConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_NameConstraints()
{
  return _asn1_encode();
}

uint64_t length_NameConstraints()
{
  return _asn1_length();
}

uint64_t free_NameConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_NameConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ExtKeyUsage(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ExtKeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_ExtKeyUsage()
{
  return _asn1_encode();
}

uint64_t length_ExtKeyUsage()
{
  return _asn1_length();
}

uint64_t free_ExtKeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_ExtKeyUsage()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPointReasonFlags(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DistributionPointReasonFlags()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointReasonFlags()
{
  return _asn1_encode();
}

uint64_t length_DistributionPointReasonFlags()
{
  return _asn1_length();
}

uint64_t free_DistributionPointReasonFlags()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointReasonFlags()
{
  return _asn1_copy_top();
}

uint64_t DistributionPointReasonFlags2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2DistributionPointReasonFlags(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_DistributionPointName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DistributionPointName()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointName()
{
  return _asn1_encode();
}

uint64_t length_DistributionPointName()
{
  return _asn1_length();
}

uint64_t free_DistributionPointName()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPoint(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DistributionPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPoint()
{
  return _asn1_encode();
}

uint64_t length_DistributionPoint()
{
  return _asn1_length();
}

uint64_t free_DistributionPoint()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLDistributionPoints(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CRLDistributionPoints()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLDistributionPoints()
{
  return _asn1_encode();
}

uint64_t length_CRLDistributionPoints()
{
  return _asn1_length();
}

uint64_t free_CRLDistributionPoints()
{
  return _asn1_free_top();
}

uint64_t copy_CRLDistributionPoints()
{
  return _asn1_copy_top();
}

uint64_t add_CRLDistributionPoints(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0x6273E012uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t remove_CRLDistributionPoints(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  void *v5;
  uint64_t result;

  if (*(_DWORD *)a1 <= a2)
    return 1859794437;
  _asn1_free_top();
  v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove((void *)(*(_QWORD *)(a1 + 8) + 24 * a2), (const void *)(*(_QWORD *)(a1 + 8) + 24 * (a2 + 1)), 24 * (v4 - a2));
    v4 = *(_DWORD *)a1;
  }
  v5 = malloc_type_realloc(*(void **)(a1 + 8), 24 * v4, 0xC1F12376uLL);
  if (!v5 && *(_DWORD *)a1)
    return 0;
  result = 0;
  *(_QWORD *)(a1 + 8) = v5;
  return result;
}

uint64_t nsheim_decode_DSASigValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DSASigValue()
{
  return _asn1_decode_top();
}

uint64_t encode_DSASigValue()
{
  return _asn1_encode();
}

uint64_t length_DSASigValue()
{
  return _asn1_length();
}

uint64_t free_DSASigValue()
{
  return _asn1_free_top();
}

uint64_t copy_DSASigValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAPublicKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAPublicKey()
{
  return _asn1_encode();
}

uint64_t length_DSAPublicKey()
{
  return _asn1_length();
}

uint64_t free_DSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAParams(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DSAParams()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAParams()
{
  return _asn1_encode();
}

uint64_t length_DSAParams()
{
  return _asn1_length();
}

uint64_t free_DSAParams()
{
  return _asn1_free_top();
}

uint64_t copy_DSAParams()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECPoint(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ECPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_ECPoint()
{
  return _asn1_encode();
}

uint64_t length_ECPoint()
{
  return _asn1_length();
}

uint64_t free_ECPoint()
{
  return _asn1_free_top();
}

uint64_t copy_ECPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECParameters(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ECParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_ECParameters()
{
  return _asn1_encode();
}

uint64_t length_ECParameters()
{
  return _asn1_length();
}

uint64_t free_ECParameters()
{
  return _asn1_free_top();
}

uint64_t copy_ECParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECDSA_Sig_Value(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ECDSA_Sig_Value()
{
  return _asn1_decode_top();
}

uint64_t encode_ECDSA_Sig_Value()
{
  return _asn1_encode();
}

uint64_t length_ECDSA_Sig_Value()
{
  return _asn1_length();
}

uint64_t free_ECDSA_Sig_Value()
{
  return _asn1_free_top();
}

uint64_t copy_ECDSA_Sig_Value()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPublicKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPublicKey()
{
  return _asn1_encode();
}

uint64_t length_RSAPublicKey()
{
  return _asn1_length();
}

uint64_t free_RSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPrivateKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_RSAPrivateKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPrivateKey()
{
  return _asn1_encode();
}

uint64_t length_RSAPrivateKey()
{
  return _asn1_length();
}

uint64_t free_RSAPrivateKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPrivateKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_DigestInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestInfo()
{
  return _asn1_encode();
}

uint64_t length_DigestInfo()
{
  return _asn1_length();
}

uint64_t free_DigestInfo()
{
  return _asn1_free_top();
}

uint64_t copy_DigestInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TBSCRLCertList(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_TBSCRLCertList()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCRLCertList()
{
  return _asn1_encode();
}

uint64_t length_TBSCRLCertList()
{
  return _asn1_length();
}

uint64_t free_TBSCRLCertList()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCRLCertList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLCertificateList(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CRLCertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLCertificateList()
{
  return _asn1_encode();
}

uint64_t length_CRLCertificateList()
{
  return _asn1_length();
}

uint64_t free_CRLCertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CRLCertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLReason(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_CRLReason()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLReason()
{
  return _asn1_encode();
}

uint64_t length_CRLReason()
{
  return _asn1_length();
}

uint64_t free_CRLReason()
{
  return _asn1_free_top();
}

uint64_t copy_CRLReason()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIXXmppAddr(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_PKIXXmppAddr()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIXXmppAddr()
{
  return _asn1_encode();
}

uint64_t length_PKIXXmppAddr()
{
  return _asn1_length();
}

uint64_t free_PKIXXmppAddr()
{
  return _asn1_free_top();
}

uint64_t copy_PKIXXmppAddr()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AccessDescription(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AccessDescription()
{
  return _asn1_decode_top();
}

uint64_t encode_AccessDescription()
{
  return _asn1_encode();
}

uint64_t length_AccessDescription()
{
  return _asn1_length();
}

uint64_t free_AccessDescription()
{
  return _asn1_free_top();
}

uint64_t copy_AccessDescription()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityInfoAccessSyntax(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_AuthorityInfoAccessSyntax()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityInfoAccessSyntax()
{
  return _asn1_encode();
}

uint64_t length_AuthorityInfoAccessSyntax()
{
  return _asn1_length();
}

uint64_t free_AuthorityInfoAccessSyntax()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityInfoAccessSyntax()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyPolicy(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ProxyPolicy()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyPolicy()
{
  return _asn1_encode();
}

uint64_t length_ProxyPolicy()
{
  return _asn1_length();
}

uint64_t free_ProxyPolicy()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyPolicy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyCertInfo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v1, "length"))
      v2 = 1859794442;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t decode_ProxyCertInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyCertInfo()
{
  return _asn1_encode();
}

uint64_t length_ProxyCertInfo()
{
  return _asn1_length();
}

uint64_t free_ProxyCertInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyCertInfo()
{
  return _asn1_copy_top();
}

uint64_t decode_AppleHashAgilityValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleHashAgilityValue()
{
  return _asn1_encode();
}

uint64_t length_AppleHashAgilityValue()
{
  return _asn1_length();
}

uint64_t copy_AppleHashAgilityValue()
{
  return _asn1_copy_top();
}

uint64_t decode_AppleAgileHash()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleAgileHash()
{
  return _asn1_encode();
}

uint64_t length_AppleAgileHash()
{
  return _asn1_length();
}

uint64_t copy_AppleAgileHash()
{
  return _asn1_copy_top();
}

uint64_t sub_1DEF0364C()
{
  uint64_t v0;

  v0 = sub_1DEF14518();
  __swift_allocate_value_buffer(v0, qword_1F0462088);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F0462088);
  return sub_1DEF1450C();
}

uint64_t sub_1DEF036CC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)sub_1DEF144DC();
  v3 = (void *)sub_1DEF144DC();
  v4 = (void *)sub_1DEF144DC();
  v5 = (void *)sub_1DEF144DC();
  v13[0] = 0;
  v6 = MSDecryptGCMOneShot(a1, v2, v3, v4, v5, v13);

  v7 = v13[0];
  v8 = sub_1DEF144F4();
  v10 = v9;

  if (v7)
  {
    v11 = v7;
    swift_willThrow();
    sub_1DEF03824(v8, v10);

  }
  return v8;
}

uint64_t sub_1DEF03824(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1DEF03868()
{
  return 0;
}

uint64_t MSCMSAuthEnvelopedData.dataContent.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent;
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  sub_1DEF03944(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_1DEF03944(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t MSCMSAuthEnvelopedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return sub_1DEF03824(v6, v7);
}

uint64_t (*MSCMSAuthEnvelopedData.dataContent.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DEF03AAC()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t MSCMSAuthEnvelopedData.recipients.getter()
{
  return sub_1DEF03EDC();
}

uint64_t MSCMSAuthEnvelopedData.recipients.setter(uint64_t a1)
{
  return sub_1DEF03F98(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

uint64_t (*MSCMSAuthEnvelopedData.recipients.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.encryptionAlgorithm.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  return *v1;
}

void MSCMSAuthEnvelopedData.encryptionAlgorithm.setter(void *a1)
{
  sub_1DEF040CC(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
}

uint64_t (*MSCMSAuthEnvelopedData.encryptionAlgorithm.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1DEF03C54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  void *v5;

  swift_beginAccess();
  sub_1DEF0B51C(0, a4);
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1DEF1456C();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.getter()
{
  return sub_1DEF03EDC();
}

uint64_t sub_1DEF03D00(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v8;
  uint64_t *v9;

  sub_1DEF0B51C(0, a4);
  v8 = sub_1DEF14578();
  v9 = (uint64_t *)(a1 + *a6);
  swift_beginAccess();
  *v9 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.setter(uint64_t a1)
{
  return sub_1DEF03F98(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.protectedAttributes.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.getter()
{
  return sub_1DEF03EDC();
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.setter(uint64_t a1)
{
  return sub_1DEF03F98(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.unprotectedAttributes.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.getter()
{
  return sub_1DEF03EDC();
}

uint64_t sub_1DEF03EDC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.setter(uint64_t a1)
{
  return sub_1DEF03F98(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates);
}

uint64_t sub_1DEF03F98(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.originatorCertificates.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.contentType.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  return *v1;
}

void MSCMSAuthEnvelopedData.contentType.setter(void *a1)
{
  sub_1DEF040CC(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
}

void sub_1DEF040CC(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*MSCMSAuthEnvelopedData.contentType.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DEF0415C()
{
  return 0;
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.embeddedContent.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1DEF042EC()
{
  return &unk_1DEF17240;
}

uint64_t sub_1DEF042F8()
{
  return 16;
}

id MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1DEF083E4(a1);

  return v4;
}

id MSCMSAuthEnvelopedData.init(encryptionAlgorithm:)(void *a1)
{
  id v2;

  v2 = sub_1DEF083E4(a1);

  return v2;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)(uint64_t a1, unint64_t a2, void *a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1DEF0854C(a1, a2, a3);

  sub_1DEF03824(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v6;

  v6 = sub_1DEF0854C(a1, a2, a3);

  sub_1DEF03824(a1, a2);
  return v6;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_1DEF08810(a1, a2, a3, a4);

  sub_1DEF03824(a1, a2);
  return v10;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:encryptionAlgorithm:)(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v8;

  v8 = sub_1DEF08810(a1, a2, a3, a4);

  sub_1DEF03824(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = objc_allocWithZone(v2);
  sub_1DEF14530();
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v6 = objc_allocWithZone((Class)MSOID);
  v7 = sub_1DEF07CE4();
  v8 = objc_msgSend(v5, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v6;
  id v7;
  id v8;

  v3 = v2;
  sub_1DEF14530();
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v6 = objc_allocWithZone((Class)MSOID);
  v7 = sub_1DEF07CE4();
  v8 = objc_msgSend(v3, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1DEF08A4C(a1, a2, a3);
  swift_unknownObjectRelease();

  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:encryptionAlgorithm:)(void *a1, void *a2, void *a3)
{
  id v5;

  v5 = sub_1DEF08A4C(a1, a2, a3);
  swift_unknownObjectRelease();

  return v5;
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addRecipient(_:)(MSCMSRecipientInfo *a1)
{
  sub_1DEF04E48(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

Swift::OpaquePointer_optional __swiftcall MSCMSAuthEnvelopedData.getAttributes(OID:)(MSOID *OID)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::Bool v6;
  uint64_t i;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  Swift::OpaquePointer_optional result;

  v23 = MEMORY[0x1E0DEE9D8];
  v2 = (uint64_t *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
  swift_beginAccess();
  v3 = *v2;
  if ((unint64_t)*v2 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v4 = sub_1DEF14620();
    if (!v4)
      goto LABEL_14;
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v4)
      goto LABEL_14;
  }
  v5 = (void *)sub_1DEF0B51C(0, (unint64_t *)&unk_1F0461CE0);
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  for (i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x1DF0F1F4C](i, v3);
    else
      v8 = *(id *)(v3 + 8 * i + 32);
    v9 = v8;
    v10 = objc_msgSend(v8, sel_attributeType);
    v11 = sub_1DEF145CC();

    if ((v11 & 1) != 0)
    {
      v12 = v9;
      MEMORY[0x1DF0F1EA4]();
      if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1DEF14590();
      sub_1DEF145A8();
      sub_1DEF14584();
    }

  }
LABEL_14:
  swift_bridgeObjectRelease_n();
  v13 = (uint64_t *)(v22 + OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
  swift_beginAccess();
  v14 = *v13;
  if ((unint64_t)*v13 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v15 = sub_1DEF14620();
    if (v15)
    {
LABEL_16:
      v5 = (void *)sub_1DEF0B51C(0, (unint64_t *)&unk_1F0461CE0);
      if (v15 >= 1)
      {
        for (j = 0; j != v15; ++j)
        {
          if ((v14 & 0xC000000000000001) != 0)
            v17 = (id)MEMORY[0x1DF0F1F4C](j, v14);
          else
            v17 = *(id *)(v14 + 8 * j + 32);
          v18 = v17;
          v19 = objc_msgSend(v17, sel_attributeType);
          v20 = sub_1DEF145CC();

          if ((v20 & 1) != 0)
          {
            v21 = v18;
            MEMORY[0x1DF0F1EA4]();
            if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1DEF14590();
            sub_1DEF145A8();
            sub_1DEF14584();
          }

        }
        goto LABEL_27;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v15)
      goto LABEL_16;
  }
LABEL_27:
  swift_bridgeObjectRelease_n();
  v5 = (void *)v23;
LABEL_30:
  result.value._rawValue = v5;
  result.is_nil = v6;
  return result;
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addProtectedAttribute(_:)(MSCMSAttribute *a1)
{
  sub_1DEF04E48(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addUnprotectedAttribute(_:)(MSCMSAttribute *a1)
{
  sub_1DEF04E48(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

uint64_t sub_1DEF04E48(void *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;
  id v5;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  v5 = a1;
  MEMORY[0x1DF0F1EA4]();
  if (*(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1DEF14590();
  sub_1DEF145A8();
  sub_1DEF14584();
  return swift_endAccess();
}

void sub_1DEF04EEC(char *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  char *v6;
  id v7;
  char *v8;

  v6 = &a1[*a4];
  swift_beginAccess();
  v7 = a3;
  v8 = a1;
  MEMORY[0x1DF0F1EA4]();
  if (*(_QWORD *)((*(_QWORD *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v6 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_1DEF14590();
  sub_1DEF145A8();
  sub_1DEF14584();
  swift_endAccess();

}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.setContentType(type:)(MSOID *type)
{
  uint64_t v1;
  void **v3;
  void *v4;
  MSOID *v5;

  v3 = (void **)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  v4 = *v3;
  *v3 = type;
  v5 = type;

}

void sub_1DEF05004(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

uint64_t MSCMSAuthEnvelopedData.encodeMessageSecurityObject()()
{
  uint64_t v0;
  _QWORD *v1;
  id *v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  uint64_t *v32;
  unint64_t v33;
  void **v34;
  void *v35;
  id v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  _BYTE *v50;
  unint64_t v51;
  uint64_t v52;
  void **v53;
  id v54;
  id v55[3];
  __int128 v56;
  __int128 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0;
  v54 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  v69 = 0;
  v67 = 0u;
  v68 = 0u;
  v65 = 0;
  v66 = 0;
  v1 = (_QWORD *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
  swift_beginAccess();
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v44 = sub_1DEF14620();
    swift_bridgeObjectRelease();
    if (v44 >= 1)
    {
LABEL_3:
      v64 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v2 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
      swift_beginAccess();
      v53 = v2;
      v58 = objc_msgSend(*v2, sel_Asn1OID);
      v59 = v3;
      v63 = swift_slowAlloc();
      v4 = (_QWORD *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
      swift_beginAccess();
      v5 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_initWithOID_, *v4);
      v6 = objc_msgSend(v5, sel_keySize_, 0);

      *(_QWORD *)&v56 = sub_1DEF08C4C((uint64_t)v6);
      *((_QWORD *)&v56 + 1) = v7;
      sub_1DEF07DAC((uint64_t)&v56);
      v57 = v56;
      v8 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_initWithOID_, *v4);
      v9 = objc_msgSend(v8, sel_blockSize_, 0);

      v10 = (void *)swift_slowAlloc();
      *(_QWORD *)&v67 = v9;
      *((_QWORD *)&v67 + 1) = v10;
      v11 = swift_allocObject();
      v12 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], (size_t)v9, v10);
      *(_DWORD *)(v11 + 16) = v12;
      v13 = (_DWORD *)(v11 + 16);
      if (v12)
      {
        if (qword_1F0462080 != -1)
          swift_once();
        v14 = sub_1DEF14518();
        __swift_project_value_buffer(v14, (uint64_t)qword_1F0462088);
        v15 = sub_1DEF14500();
        v16 = sub_1DEF145B4();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v17 = 67109120;
          swift_beginAccess();
          LODWORD(v56) = *v13;
          sub_1DEF145E4();
          _os_log_impl(&dword_1DEED9000, v15, v16, "Unable to generate nonce underlying crypto error %d", v17, 8u);
          MEMORY[0x1DF0F2900](v17, -1, -1);
        }

        swift_beginAccess();
        v0 = *(unsigned int *)(v11 + 16);
        sub_1DEF08C08();
        swift_allocError();
        *(_QWORD *)v18 = v0;
        *(_QWORD *)(v18 + 8) = 0;
        *(_BYTE *)(v18 + 16) = 0;
        swift_willThrow();
        swift_release();
        if (!*((_QWORD *)&v67 + 1))
        {
          __break(1u);
          goto LABEL_44;
        }
        MEMORY[0x1DF0F2900](*((_QWORD *)&v67 + 1), -1, -1);
        sub_1DEF03824(v57, *((unint64_t *)&v57 + 1));
        v19 = v63;
        if (v63)
          goto LABEL_41;
        __break(1u);
      }
      length_GCMParameters();
      v20 = (_BYTE *)swift_slowAlloc();
      v21 = encode_GCMParameters();
      *v13 = v21;
      if (!v21)
        goto LABEL_19;
      if (qword_1F0462080 != -1)
        swift_once();
      v22 = sub_1DEF14518();
      __swift_project_value_buffer(v22, (uint64_t)qword_1F0462088);
      v0 = sub_1DEF14500();
      v23 = sub_1DEF145B4();
      if (os_log_type_enabled((os_log_t)v0, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1DEED9000, (os_log_t)v0, v23, "Invalid data - Error encoding GCM parameters", v24, 2u);
        MEMORY[0x1DF0F2900](v24, -1, -1);
      }

      sub_1DEF08C08();
      swift_allocError();
      *(_OWORD *)v25 = xmmword_1DEF171C0;
      *(_BYTE *)(v25 + 16) = 48;
      swift_willThrow();
      MEMORY[0x1DF0F2900](v20, -1, -1);
      swift_release();
      if (*((_QWORD *)&v67 + 1))
      {
        MEMORY[0x1DF0F2900](*((_QWORD *)&v67 + 1), -1, -1);
        sub_1DEF03824(v57, *((unint64_t *)&v57 + 1));
        v19 = v63;
        if (!v63)
        {
          __break(1u);
LABEL_19:
          v50 = v20;
          v26 = sub_1DEF08DB8(v20, 0);
          v51 = v27;
          v52 = v26;
          v28 = *v53;
          sub_1DEF14530();
          v29 = v28;
          v30 = (void *)sub_1DEF14524();
          swift_bridgeObjectRelease();
          v31 = objc_msgSend(v29, sel_isEqualToString_, v30);

          if (v31)
          {
            v32 = (uint64_t *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
            swift_beginAccess();
            v33 = v32[1];
            sub_1DEF03944(*v32, v33);
            goto LABEL_24;
          }
          v34 = (void **)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
          swift_beginAccess();
          v35 = *v34;
          if (*v34)
          {
            v55[0] = 0;
            v36 = objc_msgSend(v35, sel_encodeMessageSecurityObject_, v55);
            v37 = v55[0];
            if (v36)
            {
              sub_1DEF144F4();
              v33 = v38;

LABEL_24:
              __asm { BR              X10 }
            }
            v43 = v37;
            sub_1DEF144A0();

            swift_willThrow();
            sub_1DEF03824(v52, v51);
            MEMORY[0x1DF0F2900](v50, -1, -1);
            swift_release();
            if (*((_QWORD *)&v67 + 1))
            {
              MEMORY[0x1DF0F2900](*((_QWORD *)&v67 + 1), -1, -1);
              sub_1DEF03824(v57, *((unint64_t *)&v57 + 1));
              v19 = v63;
              if (!v63)
              {
                __break(1u);
                JUMPOUT(0x1DEF05AC0);
              }
              goto LABEL_41;
            }
          }
          else
          {
            if (qword_1F0462080 != -1)
              swift_once();
            v39 = sub_1DEF14518();
            __swift_project_value_buffer(v39, (uint64_t)qword_1F0462088);
            v0 = sub_1DEF14500();
            v40 = sub_1DEF145B4();
            if (os_log_type_enabled((os_log_t)v0, v40))
            {
              v41 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v41 = 0;
              _os_log_impl(&dword_1DEED9000, (os_log_t)v0, v40, "Invalid input data/embedded data", v41, 2u);
              MEMORY[0x1DF0F2900](v41, -1, -1);
            }

            sub_1DEF08C08();
            swift_allocError();
            *(_QWORD *)v42 = 0;
            *(_QWORD *)(v42 + 8) = 0;
            *(_BYTE *)(v42 + 16) = 48;
            swift_willThrow();
            sub_1DEF03824(v52, v51);
            sub_1DEF08E64(0, 0xF000000000000000);
            MEMORY[0x1DF0F2900](v50, -1, -1);
            swift_release();
            if (*((_QWORD *)&v67 + 1))
            {
              MEMORY[0x1DF0F2900](*((_QWORD *)&v67 + 1), -1, -1);
              sub_1DEF03824(v57, *((unint64_t *)&v57 + 1));
              v19 = v63;
              if (!v63)
              {
                __break(1u);
                JUMPOUT(0x1DEF057A4);
              }
              goto LABEL_41;
            }
            __break(1u);
          }
          __break(1u);
          JUMPOUT(0x1DEF06B6CLL);
        }
LABEL_41:
        MEMORY[0x1DF0F2900](v19, -1, -1);

        goto LABEL_42;
      }
LABEL_44:
      __break(1u);
      JUMPOUT(0x1DEF06B60);
    }
  }
  else if (*(uint64_t *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
    goto LABEL_3;
  }
  if (qword_1F0462080 != -1)
    swift_once();
  v45 = sub_1DEF14518();
  __swift_project_value_buffer(v45, (uint64_t)qword_1F0462088);
  v0 = sub_1DEF14500();
  v46 = sub_1DEF145B4();
  if (os_log_type_enabled((os_log_t)v0, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_1DEED9000, (os_log_t)v0, v46, "No recipient found", v47, 2u);
    MEMORY[0x1DF0F2900](v47, -1, -1);
  }

  sub_1DEF08C08();
  swift_allocError();
  *(_OWORD *)v48 = xmmword_1DEF171B0;
  *(_BYTE *)(v48 + 16) = 48;
  swift_willThrow();
LABEL_42:

  return v0;
}

void sub_1DEF06C28(uint64_t a1@<X2>, _BYTE *a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;

  v8 = *(_QWORD *)(a1 + 8);
  if (v8 >> 60 != 15)
  {
    MEMORY[0x1E0C80A78](a7, a8);
    __asm { BR              X10 }
  }
  *a2 = 1;
}

_QWORD *sub_1DEF070D0(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, uint64_t a5, unint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  void **v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  unsigned int v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD *result;
  uint64_t v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD v59[8];

  v59[6] = *MEMORY[0x1E0C80C00];
  v21 = (void **)(a4 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  v22 = *v21;
  v23 = objc_allocWithZone((Class)MSAlgorithmIdentifier);
  v24 = v22;
  sub_1DEF03944(a5, a6);
  v25 = (void *)sub_1DEF144DC();
  sub_1DEF03824(a5, a6);
  v26 = objc_msgSend(v23, sel_initWithOID_parameters_, v24, v25);

  v27 = *a3;
  *a3 = v26;

  v28 = *a3;
  v59[0] = *a7;
  v29 = objc_msgSend(v28, sel_ccAlgorithm_, v59);
  v30 = (void *)v59[0];
  v31 = (void *)*a7;
  *a7 = v59[0];
  v32 = v30;

  v33 = *a3;
  v59[0] = *a7;
  v34 = objc_msgSend(v33, sel_ccMode_, v59);
  v35 = (void *)v59[0];
  v36 = (void *)*a7;
  *a7 = v59[0];
  v37 = v35;

  if (v29 || v34 != 11)
  {
    if (qword_1F0462080 != -1)
      swift_once();
    v45 = sub_1DEF14518();
    __swift_project_value_buffer(v45, (uint64_t)qword_1F0462088);
    v46 = sub_1DEF14500();
    v47 = sub_1DEF145B4();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v48 = 67109120;
      LODWORD(v59[0]) = v29;
      sub_1DEF145E4();
      _os_log_impl(&dword_1DEED9000, v46, v47, "Invalid input algorithm %u", v48, 8u);
      MEMORY[0x1DF0F2900](v48, -1, -1);
    }

    sub_1DEF08C08();
    swift_allocError();
    *(_QWORD *)v49 = 0;
    *(_QWORD *)(v49 + 8) = 0;
    *(_BYTE *)(v49 + 16) = 48;
    return (_QWORD *)swift_willThrow();
  }
  result = objc_msgSend(*a3, sel_asn1AlgId);
  v39 = result[2];
  *(_OWORD *)(a8 + 16) = *(_OWORD *)result;
  *(_QWORD *)(a8 + 32) = v39;
  if (a10)
  {
    v40 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], a11 - (_QWORD)a10, a10);
    swift_beginAccess();
    *(_DWORD *)(a9 + 16) = v40;
    if (v40)
    {
      if (qword_1F0462080 != -1)
        swift_once();
      v41 = sub_1DEF14518();
      __swift_project_value_buffer(v41, (uint64_t)qword_1F0462088);
      swift_retain();
      v42 = sub_1DEF14500();
      v43 = sub_1DEF145B4();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v44 = 67109120;
        swift_beginAccess();
        sub_1DEF145E4();
        swift_release();
        _os_log_impl(&dword_1DEED9000, v42, v43, "Unable to generate key underlying crypto error %d", v44, 8u);
        MEMORY[0x1DF0F2900](v44, -1, -1);

      }
      else
      {

        swift_release();
      }
      swift_beginAccess();
      v55 = *(unsigned int *)(a9 + 16);
LABEL_22:
      sub_1DEF08C08();
      swift_allocError();
      *(_QWORD *)v56 = v55;
      *(_QWORD *)(v56 + 8) = 0;
      *(_BYTE *)(v56 + 16) = 0;
      return (_QWORD *)swift_willThrow();
    }
    result = (_QWORD *)CCCryptorGCMOneshotEncrypt();
    if ((_DWORD)result)
    {
      v50 = result;
      if (qword_1F0462080 != -1)
        swift_once();
      v51 = sub_1DEF14518();
      __swift_project_value_buffer(v51, (uint64_t)qword_1F0462088);
      v52 = sub_1DEF14500();
      v53 = sub_1DEF145B4();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v54 = 67109120;
        sub_1DEF145E4();
        _os_log_impl(&dword_1DEED9000, v52, v53, "Error encrypting underlying crypto error %d", v54, 8u);
        MEMORY[0x1DF0F2900](v54, -1, -1);
      }

      v55 = v50;
      goto LABEL_22;
    }
    v57 = *(_QWORD **)(a8 + 40);
    if (v57)
    {
      v58 = *a14;
      *v57 = a16;
      v57[1] = v58;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t static MSCMSAuthEnvelopedData.decodeMessageSecurityObject(_:options:)(void *a1, uint64_t a2)
{
  return sub_1DEF098A0(a1, a2);
}

uint64_t sub_1DEF07748(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1DEF14620();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1DEF0825C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1DF0F1F4C](i, a1);
        type metadata accessor for SecCertificate();
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DEF0825C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1DEF0825C(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1DEF0B554(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate();
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DEF0825C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1DEF0825C(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1DEF0B554(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

void __swiftcall MSCMSAuthEnvelopedData.type()(MSOID *__return_ptr retstr)
{
  id v1;

  sub_1DEF14530();
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v1 = objc_allocWithZone((Class)MSOID);
  sub_1DEF07CE4();
}

id MSCMSAuthEnvelopedData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSAuthEnvelopedData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MSCMSAuthEnvelopedData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1DEF07CE4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = (void *)sub_1DEF14524();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithString_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_1DEF144A0();

    swift_willThrow();
  }
  return v2;
}

void sub_1DEF07DAC(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_1DEF07E08(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_1DEF07F94(uint64_t a1)
{
  __asm { BR              X11 }
}

void sub_1DEF07FF8(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *v3 = v4;
  v3[1] = (uint64_t)&v6;
  if (v4 > 0)
    *(_QWORD *)(v5 + 8) = v3;
  *v1 = v2;
  v1[1] = a1 & 0xFFFFFFFFFFFFFFLL;
}

char *sub_1DEF081DC(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_1DEF144C4();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_1DEF14434();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_1DEF14458();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_1DEF1444C();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_1DEF0825C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DEF08278(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DEF08278(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461CF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DEF14650();
  __break(1u);
  return result;
}

id sub_1DEF083E4(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_1DEF171E0;
  v4 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v4;
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v4;
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v4;
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_1DEF171E0;
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a1;
  sub_1DEF14530();
  v5 = v1;
  v6 = a1;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v7 = objc_allocWithZone((Class)MSOID);
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_1DEF07CE4();

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_1DEF0854C(uint64_t a1, unint64_t a2, void *a3)
{
  char *v3;
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v17;
  objc_class *ObjectType;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (uint64_t *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_1DEF171E0;
  v7 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  v8 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v8;
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v8;
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v8;
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_1DEF171E0;
  sub_1DEF14530();
  v9 = v3;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v10 = objc_allocWithZone((Class)MSOID);
  v11 = sub_1DEF07CE4();
  *(_QWORD *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = v11;
  sub_1DEF14530();
  v17 = v11;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v12 = objc_allocWithZone((Class)MSOID);
  *(_QWORD *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_1DEF07CE4();
  swift_beginAccess();
  v13 = *v6;
  v14 = v6[1];
  *v6 = a1;
  v6[1] = a2;
  sub_1DEF03944(a1, a2);
  sub_1DEF03824(v13, v14);
  swift_beginAccess();
  v15 = a3;
  MEMORY[0x1DF0F1EA4]();
  if (*(_QWORD *)((*(_QWORD *)v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v7 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_1DEF14590();
  sub_1DEF145A8();
  sub_1DEF14584();
  swift_endAccess();

  v20.receiver = v9;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_init);
}

id sub_1DEF08810(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  char *v4;
  char *v5;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  objc_class *ObjectType;
  objc_super v21;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (uint64_t *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_1DEF171E0;
  v11 = MEMORY[0x1E0DEE9D8];
  v12 = &v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v11;
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v11;
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v11;
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_1DEF171E0;
  *(_QWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a4;
  sub_1DEF14530();
  v13 = v5;
  v14 = a4;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v15 = objc_allocWithZone((Class)MSOID);
  *(_QWORD *)&v13[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_1DEF07CE4();
  swift_beginAccess();
  v16 = *v10;
  v17 = v10[1];
  *v10 = a1;
  v10[1] = a2;
  sub_1DEF03944(a1, a2);
  sub_1DEF03824(v16, v17);
  if (a3)
  {
    swift_beginAccess();
    v18 = a3;
    MEMORY[0x1DF0F1EA4]();
    if (*(_QWORD *)((*(_QWORD *)v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v12 & 0xFFFFFFFFFFFFFF8)
                                                                                 + 0x18) >> 1)
      sub_1DEF14590();
    sub_1DEF145A8();
    sub_1DEF14584();
    swift_endAccess();
  }

  v21.receiver = v13;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_1DEF08A4C(void *a1, void *a2, void *a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_1DEF171E0;
  v9 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  v10 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v10;
  *(_QWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v10;
  *(_QWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v10;
  v11 = &v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent];
  *(_QWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0;
  *(_OWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_1DEF171E0;
  swift_beginAccess();
  *(_QWORD *)v11 = a1;
  v12 = v4;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v13 = objc_msgSend(a1, sel_type);
  *(_QWORD *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = v13;
  swift_beginAccess();
  v14 = a2;
  MEMORY[0x1DF0F1EA4]();
  if (*(_QWORD *)((*(_QWORD *)v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v9 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_1DEF14590();
  sub_1DEF145A8();
  sub_1DEF14584();
  swift_endAccess();
  *(_QWORD *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a3;
  v15 = a3;

  v17.receiver = v12;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1DEF08C08()
{
  unint64_t result;

  result = qword_1F0461E00;
  if (!qword_1F0461E00)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSError, &type metadata for MSCMSError);
    atomic_store(result, (unint64_t *)&qword_1F0461E00);
  }
  return result;
}

uint64_t sub_1DEF08C4C(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1DEF14464();
      swift_allocObject();
      sub_1DEF14440();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1DEF144D0();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_1DEF08CE8()
{
  return swift_deallocObject();
}

uint64_t sub_1DEF08CF8(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_1DEF08DB8(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_1DEF08CF8(__src, &__src[a2]);
  sub_1DEF14464();
  swift_allocObject();
  sub_1DEF14428();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_1DEF144D0();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1DEF08E64(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DEF03824(a1, a2);
  return a1;
}

uint64_t sub_1DEF08E78(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = sub_1DEF14434();
  v8 = result;
  if (result)
  {
    result = sub_1DEF14458();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v8 += a1 - result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = sub_1DEF1444C();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v13 = v8 + v12;
  if (v8)
    v14 = v13;
  else
    v14 = 0;
  a4(v8, v14);
  return 0;
}

void sub_1DEF08F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  char v18;

  if (sub_1DEF14434())
  {
    if (__OFSUB__(a1, sub_1DEF14458()))
    {
      __break(1u);
    }
    else if (!__OFSUB__(a2, a1))
    {
      sub_1DEF1444C();
      sub_1DEF06C28(a4, &v18, a10, a11, a12, a13, a14, a15);
      return;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_1DEF09024(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF090B8@<X0>(_QWORD *a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v9 - 120) = v8;
  *(_WORD *)(v9 - 112) = a3;
  *(_BYTE *)(v9 - 110) = BYTE2(a3);
  *(_BYTE *)(v9 - 109) = BYTE3(a3);
  *(_BYTE *)(v9 - 108) = BYTE4(a3);
  *(_BYTE *)(v9 - 107) = BYTE5(a3);
  *(_BYTE *)(v9 - 106) = BYTE6(a3);
  v10 = a2;
  sub_1DEF03944(v5, v4);
  swift_retain();
  sub_1DEF06C28(v7, (_BYTE *)(v9 - 97), *(_QWORD *)(v9 - 128), v3, *(_QWORD *)(v9 - 136), v22, v21, v20);
  if (v6)
  {
    v11 = *(_QWORD *)(v9 - 120);
    *(_QWORD *)(v9 - 128) = *(unsigned int *)(v9 - 112);
    v12 = *(unsigned __int8 *)(v9 - 108);
    v13 = *(unsigned __int8 *)(v9 - 107);
    v14 = *(unsigned __int8 *)(v9 - 106);

    sub_1DEF03824(v5, v4);
    v15 = *(_QWORD *)(v9 - 128) | (v12 << 32) | (v13 << 40) | (v14 << 48);
  }
  else
  {
    v13 = *(unsigned __int8 *)(v9 - 97);
    v11 = *(_QWORD *)(v9 - 120);
    *(_QWORD *)(v9 - 128) = *(unsigned int *)(v9 - 112);
    *(_QWORD *)(v9 - 136) = *(unsigned __int8 *)(v9 - 108);
    v16 = *(unsigned __int8 *)(v9 - 107);
    v17 = *(unsigned __int8 *)(v9 - 106);

    sub_1DEF03824(v5, v4);
    v15 = *(_QWORD *)(v9 - 128) | (*(_QWORD *)(v9 - 136) << 32) | (v16 << 40) | (v17 << 48);
  }
  *a1 = v11;
  a1[1] = v15;
  swift_release();
  return v13;
}

uint64_t sub_1DEF096E4()
{
  uint64_t result;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;

  result = encode_AuthEnvelopedData();
  if ((_DWORD)result)
  {
    if (qword_1F0462080 != -1)
      swift_once();
    v1 = sub_1DEF14518();
    __swift_project_value_buffer(v1, (uint64_t)qword_1F0462088);
    v2 = sub_1DEF14500();
    v3 = sub_1DEF145B4();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DEED9000, v2, v3, "Invalid data - error encoding AuthEnvelopedData", v4, 2u);
      MEMORY[0x1DF0F2900](v4, -1, -1);
    }

    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v5 = xmmword_1DEF171C0;
    *(_BYTE *)(v5 + 16) = 48;
    return swift_willThrow();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0F28A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for SecCertificate()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F0461D08)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F0461D08);
  }
}

uint64_t sub_1DEF098A0(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  char *v11;
  id v13;
  id v14;
  char *v15;
  char *v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  int v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  _QWORD v50[4];
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(objc_allocWithZone((Class)MSCMSRecipientInfo), sel_init);
  v43 = (char *)objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  v5 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_init);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0u;
  memset(v50, 0, sizeof(v50));
  v51 = 0u;
  v52 = 0u;
  v53 = 0;
  if (nsheim_decode_AuthEnvelopedData(a1))
  {
    if (qword_1F0462080 != -1)
      swift_once();
    v6 = sub_1DEF14518();
    __swift_project_value_buffer(v6, (uint64_t)qword_1F0462088);
    v7 = sub_1DEF14500();
    v8 = sub_1DEF145B4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DEED9000, v7, v8, "Invalid data - error decoding AuthEnvelopedData", v9, 2u);
      MEMORY[0x1DF0F2900](v9, -1, -1);
    }

    dumpNSData("AuthEnvelopedData", a1);
    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v10 = xmmword_1DEF17210;
    *(_BYTE *)(v10 + 16) = 48;
    swift_willThrow();

    v11 = v43;
LABEL_7:

    return a2;
  }
  v13 = objc_allocWithZone((Class)type metadata accessor for MSCMSAuthEnvelopedData());
  v14 = v5;
  v15 = (char *)sub_1DEF083E4(v14);
  v41 = v14;

  v42 = v15;
  v16 = v15;
  a2 = 0;
  swift_bridgeObjectRelease();
  v17 = &v15[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  swift_beginAccess();
  if (*(_QWORD *)v17 >> 62)
  {
    swift_bridgeObjectRetain();
    v30 = sub_1DEF14620();
    swift_bridgeObjectRelease();
    if (v30 >= 1)
      goto LABEL_11;
  }
  else if (*(uint64_t *)((*(_QWORD *)v17 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_11:
    v44 = v17;
    if ((_QWORD)v51)
    {
      v18 = NSDataFromOctetString((_QWORD *)v51);
      v19 = sub_1DEF144F4();
      v21 = v20;

      v22 = (uint64_t *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
      v23 = *(_QWORD *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
      v24 = *(_QWORD *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent + 8];
      *v22 = v19;
      v22[1] = v21;
      sub_1DEF03824(v23, v24);
      *(_QWORD *)&v45 = 0;
      v25 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_initWithAsn1AlgId_error_, &v50[1], &v45);

      (id)v45;
      v26 = v25;
      v27 = NSDataFromOctetString(&v52);
      sub_1DEF144F4();
      v29 = v28;

      __asm { BR              X10 }
    }
    __break(1u);
    swift_once();
    v36 = sub_1DEF14518();
    __swift_project_value_buffer(v36, (uint64_t)qword_1F0462088);
    v37 = sub_1DEF14500();
    v38 = sub_1DEF145B4();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_1DEED9000, v37, v38, "Invalid data - no certificate in originatorCertificates", v39, 2u);
      MEMORY[0x1DF0F2900](v39, -1, -1);
    }

    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v40 = xmmword_1DEF17220;
    *(_BYTE *)(v40 + 16) = 48;
    swift_willThrow();

    v11 = v44;
    goto LABEL_7;
  }

  if (qword_1F0462080 != -1)
    swift_once();
  v31 = sub_1DEF14518();
  __swift_project_value_buffer(v31, (uint64_t)qword_1F0462088);
  v32 = sub_1DEF14500();
  v33 = sub_1DEF145B4();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1DEED9000, v32, v33, "Invalid data - no recipients found", v34, 2u);
    MEMORY[0x1DF0F2900](v34, -1, -1);
  }

  sub_1DEF08C08();
  swift_allocError();
  *(_OWORD *)v35 = xmmword_1DEF17210;
  *(_BYTE *)(v35 + 16) = 48;
  swift_willThrow();

  return a2;
}

uint64_t type metadata accessor for MSCMSAuthEnvelopedData()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSAuthEnvelopedData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_1DEF0B51C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_1DEF0B554(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *sub_1DEF0B568(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DEF070D0(a1, a2, *(id **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD **)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(void **)(v2 + 72), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96), *(uint64_t **)(v2 + 104), *(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 120));
}

uint64_t sub_1DEF0B5A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DEF03944(a1, a2);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id MSCMSCompressedData.type.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSCompressedData_type);
  swift_beginAccess();
  return *v1;
}

void MSCMSCompressedData.type.setter(void *a1)
{
  sub_1DEF040CC(a1, &OBJC_IVAR___MSCMSCompressedData_type);
}

uint64_t (*MSCMSCompressedData.type.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DEF0B6EC()
{
  return 0;
}

uint64_t MSCMSCompressedData.dataContent.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR___MSCMSCompressedData_dataContent;
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  sub_1DEF0B5A8(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t MSCMSCompressedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return sub_1DEF08E64(v6, v7);
}

uint64_t (*MSCMSCompressedData.dataContent.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MSCMSCompressedData.embeddedContent.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t MSCMSCompressedData.embeddedContent.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSCompressedData.embeddedContent.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id MSCMSCompressedData.contentType.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  return *v1;
}

void MSCMSCompressedData.contentType.setter(void *a1)
{
  sub_1DEF040CC(a1, &OBJC_IVAR___MSCMSCompressedData_contentType);
}

uint64_t (*MSCMSCompressedData.contentType.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MSCMSCompressedData.__allocating_init(dataContent:)(uint64_t a1, unint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MSCMSCompressedData.init(dataContent:)(a1, a2);
}

id MSCMSCompressedData.init(dataContent:)(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v3;
  char *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v15;
  objc_super v16;
  objc_class *ObjectType;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &v2[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v2[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_1DEF171D0;
  v7 = &v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(_QWORD *)&v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0;
  swift_beginAccess();
  v9 = *(_QWORD *)v6;
  v8 = *((_QWORD *)v6 + 1);
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v10 = v2;
  sub_1DEF03944(a1, a2);
  sub_1DEF08E64(v9, v8);
  swift_beginAccess();
  *(_QWORD *)v7 = 0;
  swift_unknownObjectRelease();
  sub_1DEF14530();
  v11 = objc_allocWithZone((Class)MSOID);
  v12 = sub_1DEF07CE4();
  if (v3)
  {
    sub_1DEF03824(a1, a2);
    sub_1DEF08E64(*(_QWORD *)v6, *((_QWORD *)v6 + 1));
    swift_unknownObjectRelease();
    v15 = v10;

    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v10[OBJC_IVAR___MSCMSCompressedData_contentType] = v12;
    sub_1DEF14530();
    v13 = objc_allocWithZone((Class)MSOID);
    *(_QWORD *)&v10[OBJC_IVAR___MSCMSCompressedData_type] = sub_1DEF07CE4();

    v16.receiver = v10;
    v16.super_class = ObjectType;
    v15 = objc_msgSendSuper2(&v16, sel_init);
    sub_1DEF03824(a1, a2);
  }
  return v15;
}

objc_class *MSCMSCompressedData.__allocating_init(embeddedContent:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return MSCMSCompressedData.init(embeddedContent:)(a1);
}

objc_class *MSCMSCompressedData.init(embeddedContent:)(void *a1)
{
  char *v1;
  uint64_t v2;
  objc_class *ObjectType;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = &v1[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_1DEF171D0;
  v6 = &v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0;
  swift_beginAccess();
  v7 = *(_QWORD *)v5;
  v8 = *((_QWORD *)v5 + 1);
  *(_OWORD *)v5 = xmmword_1DEF171D0;
  v9 = v1;
  sub_1DEF08E64(v7, v8);
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v10 = objc_msgSend(a1, sel_type);
  v11 = OBJC_IVAR___MSCMSCompressedData_contentType;
  *(_QWORD *)&v9[OBJC_IVAR___MSCMSCompressedData_contentType] = v10;
  sub_1DEF14530();
  v12 = objc_allocWithZone((Class)MSOID);
  v13 = sub_1DEF07CE4();
  if (v2)
  {
    swift_unknownObjectRelease();
    sub_1DEF08E64(*(_QWORD *)v5, *((_QWORD *)v5 + 1));
    swift_unknownObjectRelease();
    v14 = *(void **)&v9[v11];

    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v9[OBJC_IVAR___MSCMSCompressedData_type] = v13;

    v16.receiver = v9;
    v16.super_class = ObjectType;
    ObjectType = (objc_class *)objc_msgSendSuper2(&v16, sel_init);
    swift_unknownObjectRelease();
  }
  return ObjectType;
}

uint64_t MSCMSCompressedData.encodeSecurityObject()()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void **v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v17[2];
  int v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v22 = 0;
  v23 = 0;
  v19 = asn1_oid_id_alg_zlibCompress;
  v20 = 0;
  v21 = 0;
  v1 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  v2 = *v1;
  sub_1DEF14530();
  v3 = v2;
  v4 = (void *)sub_1DEF14524();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_isEqualToString_, v4);

  if (v5)
  {
    v6 = v0 + OBJC_IVAR___MSCMSCompressedData_dataContent;
    swift_beginAccess();
    v7 = *(void **)v6;
    v8 = *(_QWORD *)(v6 + 8);
    sub_1DEF0B5A8((uint64_t)v7, v8);
LABEL_6:
    if (v8 >> 60 != 15)
    {
      v17[0] = v7;
      v17[1] = (id)v8;
      __asm { BR              X10 }
    }
    goto LABEL_7;
  }
  v9 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  v10 = *v9;
  if (*v9)
  {
    v17[0] = 0;
    v11 = objc_msgSend(v10, sel_encodeMessageSecurityObject_, v17);
    v12 = v17[0];
    if (!v11)
    {
      v15 = v12;
      sub_1DEF144A0();

      goto LABEL_8;
    }
    v7 = (void *)sub_1DEF144F4();
    v8 = v13;

    goto LABEL_6;
  }
LABEL_7:
  sub_1DEF08C08();
  swift_allocError();
  *(_OWORD *)v14 = xmmword_1DEF172D0;
  *(_BYTE *)(v14 + 16) = 48;
LABEL_8:
  swift_willThrow();
  return v0;
}

void sub_1DEF0C3B4(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  id *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = (id *)(a2 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  a3[4] = objc_msgSend(*v9, sel_Asn1OID);
  a3[5] = v10;
  a3[6] = a1;
  v11 = length_CompressedData();
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), sel_initWithLength_, v11);
  if (!v12)
  {
    sub_1DEF08C08();
    v15 = swift_allocError();
    *(_OWORD *)v17 = xmmword_1DEF172E0;
    *(_BYTE *)(v17 + 16) = 48;
    swift_willThrow();
    goto LABEL_8;
  }
  v13 = objc_retainAutorelease(v12);
  objc_msgSend(v13, sel_mutableBytes);
  if (encode_CompressedData())
    v14 = 0;
  else
    v14 = v11 == 0;
  if (!v14)
  {
    sub_1DEF08C08();
    v15 = swift_allocError();
    *(_OWORD *)v16 = xmmword_1DEF172D0;
    *(_BYTE *)(v16 + 16) = 48;
    swift_willThrow();

LABEL_8:
    *a4 = v15;
    return;
  }
  *a5 = sub_1DEF144F4();
  a5[1] = v18;

}

objc_class *static MSCMSCompressedData.decodeSecurityObject(_:options:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1DEF0CBB0(a1, a2, a3);
}

id MSCMSCompressedData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSCompressedData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MSCMSCompressedData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DEF0C814(uint64_t a1)
{
  __asm { BR              X12 }
}

void sub_1DEF0C87C(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  _QWORD v18[15];

  v13 = v1;
  LOWORD(v14) = a1;
  BYTE2(v14) = BYTE2(a1);
  HIBYTE(v14) = BYTE3(a1);
  v15 = BYTE4(a1);
  v16 = BYTE5(a1);
  v17 = BYTE6(a1);
  v18[0] = v6;
  v18[1] = &v13;
  sub_1DEF0C3B4((uint64_t)v18, (uint64_t)v3, v4, &v12, v5);
  v7 = v13;
  v8 = v14;
  v9 = v15;
  v10 = v16;
  v11 = v17;

  *v2 = v7;
  v2[1] = v8 | (v9 << 32) | (v10 << 40) | (v11 << 48);
}

void sub_1DEF0CABC(int *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  sub_1DEF144C4();
  v10 = *a1;
  if (a1[1] < (int)v10)
  {
    __break(1u);
    goto LABEL_6;
  }
  v11 = sub_1DEF14434();
  if (!v11)
    goto LABEL_7;
  v12 = v11;
  v13 = sub_1DEF14458();
  if (__OFSUB__(v10, v13))
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  v14 = v12 + v10 - v13;
  sub_1DEF1444C();
  v16[0] = a2;
  v16[1] = v14;
  sub_1DEF0C3B4((uint64_t)v16, (uint64_t)a3, a4, &v15, a5);

}

objc_class *sub_1DEF0CBB0(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  int v7;
  uint64_t v8;
  objc_class *result;
  id v10;
  id v11;
  uint64_t *v12;
  objc_class *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  objc_class *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  objc_class *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  int v30;
  _OWORD v31[3];
  uint64_t v32;

  v4 = v3;
  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  memset(v31, 0, sizeof(v31));
  v6 = (void *)sub_1DEF144DC();
  v7 = nsheim_decode_CompressedData(v6);

  if (v7)
  {
    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v8 = xmmword_1DEF172E0;
    *(_BYTE *)(v8 + 16) = 48;
    swift_willThrow();
LABEL_3:
    free_CompressedData();
    return v4;
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, v31, 0);
  v29 = asn1_oid_id_alg_zlibCompress;
  v11 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, &v29, 0);
  if (!objc_msgSend(v10, sel_isEqual_, v11))
  {
    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v17 = xmmword_1DEF172E0;
    *(_BYTE *)(v17 + 16) = 48;
    swift_willThrow();

    goto LABEL_3;
  }
  v12 = (uint64_t *)*((_QWORD *)&v31[2] + 1);
  v28 = *(_OWORD *)((char *)&v31[1] + 8);
  result = (objc_class *)objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, &v28, 0);
  if (v12)
  {
    v13 = result;
    if (!*v12)
    {
      v14 = 0;
      v16 = 0xC000000000000000;
LABEL_12:
      sub_1DEF14530();
      v18 = (void *)sub_1DEF14524();
      swift_bridgeObjectRelease();
      v19 = -[objc_class isEqualToString:](v13, sel_isEqualToString_, v18, v28, v29);

      if ((v19 & 1) != 0)
      {
        v20 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
        v21 = (objc_class *)MSCMSCompressedData.init(dataContent:)(v14, v16);
        if (!v3)
        {
          v4 = v21;

LABEL_22:
          free_CompressedData();
          return v4;
        }
      }
      else
      {
        v22 = (void *)sub_1DEF144DC();
        v23 = decodeEmbeddedCMSContent(v13, v22, a3, 0);

        if (v23)
        {
          v24 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
          v25 = (void *)swift_unknownObjectRetain();
          v26 = MSCMSCompressedData.init(embeddedContent:)(v25);
          if (!v3)
          {
            v4 = v26;
            sub_1DEF03824(v14, v16);

            swift_unknownObjectRelease();
            goto LABEL_22;
          }
          sub_1DEF03824(v14, v16);

          swift_unknownObjectRelease();
LABEL_20:

          goto LABEL_3;
        }
        sub_1DEF08C08();
        swift_allocError();
        *(_OWORD *)v27 = xmmword_1DEF172E0;
        *(_BYTE *)(v27 + 16) = 48;
        swift_willThrow();
        sub_1DEF03824(v14, v16);
      }

      goto LABEL_20;
    }
    result = (objc_class *)v12[1];
    if (result)
    {
      v14 = sub_1DEF08DB8(result, *v12);
      v16 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MSCMSCompressedData()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSCompressedData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(dataContent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(embeddedContent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t static MSCMSSignedData.isImplementedInSwift()()
{
  return 1;
}

id sub_1DEF0CF9C(uint64_t a1)
{
  return sub_1DEF0D044(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x1E0CD6270], 16);
}

id sub_1DEF0CFF0(uint64_t a1)
{
  return sub_1DEF0D044(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x1E0CD6278], 24);
}

id sub_1DEF0D044(uint64_t a1, uint64_t (*a2)(uint64_t, id *), char a3)
{
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v4 = a2(a1, v9);
  v5 = v9[0];
  if (v4 || !v9[0])
  {
    v6 = v4;
    sub_1DEF08C08();
    swift_allocError();
    *(_QWORD *)v7 = v6;
    *(_QWORD *)(v7 + 8) = 0;
    *(_BYTE *)(v7 + 16) = a3;
    swift_willThrow();

  }
  return v5;
}

id sub_1DEF0D100()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  return *v1;
}

void sub_1DEF0D144(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1DEF0D194())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id MSCMSEnvelopedDataInternal.init(envelopedData:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

NSData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSEnvelopedDataInternal.encodeMessageSecurityObject()()
{
  char *v0;
  uint64_t v1;
  id *v2;
  id v3;
  unint64_t v4;
  id v5;
  unsigned int v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  uint64_t v37;
  __int128 v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v41 = 0;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v2 = (id *)&v0[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData];
  swift_beginAccess();
  v3 = objc_msgSend(*v2, sel_getRecipients);
  sub_1DEF0B51C(0, &qword_1F0461D18);
  v4 = sub_1DEF14578();

  if (!(v4 >> 62))
  {
    if (*(uint64_t *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
      goto LABEL_3;
LABEL_30:
    swift_bridgeObjectRelease();
    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v34 = xmmword_1DEF17200;
    *(_BYTE *)(v34 + 16) = 48;
LABEL_31:
    swift_willThrow();
    return (NSData)v0;
  }
  swift_bridgeObjectRetain();
  v33 = sub_1DEF14620();
  swift_bridgeObjectRelease();
  if (v33 < 1)
    goto LABEL_30;
LABEL_3:
  v5 = objc_msgSend(*v2, sel_version);
  v6 = objc_msgSend(v5, sel_unsignedIntValue);

  v39 = v6;
  v38 = xmmword_1DEF171E0;
  v7 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v8 = (id)MEMORY[0x1DF0F1F4C](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      JUMPOUT(0x1DEF0D750);
    }
    v8 = *(id *)(v4 + 32);
  }
  v9 = v8;
  v10 = objc_msgSend(v8, sel_originatorIdentity);

  if (!v10)
  {
LABEL_13:
    if (v7)
      v15 = (id)MEMORY[0x1DF0F1F4C](0, v4);
    else
      v15 = *(id *)(v4 + 32);
    v16 = v15;
    v17 = objc_msgSend(v15, sel_originator);

    if (v17)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461CF0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1DEF171F0;
      if (v7)
        v19 = (id)MEMORY[0x1DF0F1F4C](0, v4);
      else
        v19 = *(id *)(v4 + 32);
      v20 = v19;
      v21 = objc_msgSend(v19, sel_originator);

      if (v21)
      {
        v22 = (void *)objc_opt_self();
        type metadata accessor for SecCertificate();
        *(_QWORD *)(v18 + 56) = v23;
        *(_QWORD *)(v18 + 32) = v21;
        v24 = (void *)sub_1DEF1456C();
        swift_bridgeObjectRelease();
        v36 = 0;
        v25 = objc_msgSend(v22, sel_encodeOriginatorInfoCertificates_error_, v24, &v36);

        v26 = v36;
        if (v25)
        {
          v27 = sub_1DEF144F4();
          v29 = v28;

          *(_QWORD *)&v38 = v27;
          *((_QWORD *)&v38 + 1) = v29;
          v36 = 0;
          v37 = 0;
          __asm { BR              X10 }
        }
        v30 = v26;
        swift_bridgeObjectRelease();
        sub_1DEF144A0();

        goto LABEL_31;
      }
      __break(1u);
    }
    else
    {
      v36 = 0;
      v37 = 0;
      v31 = v0;
      sub_1DEF0F5A8((uint64_t)&v38);
      v0 = v32;

      swift_bridgeObjectRelease();
      if (v1 || v0)
      {
        sub_1DEF03824(v38, *((unint64_t *)&v38 + 1));
        return (NSData)v0;
      }
    }
    __break(1u);
    JUMPOUT(0x1DEF0D764);
  }
  if (v7)
    v11 = (id)MEMORY[0x1DF0F1F4C](0, v4);
  else
    v11 = *(id *)(v4 + 32);
  v12 = v11;
  v13 = sub_1DEF0CF9C((uint64_t)v10);
  if (!v1)
  {
    v14 = v13;
    objc_msgSend(v12, sel_setOriginator_, v13);

    goto LABEL_13;
  }

  swift_bridgeObjectRelease();
  return (NSData)v0;
}

uint64_t sub_1DEF0D774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  void **v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t result;
  id v18[8];

  v18[7] = *(id *)MEMORY[0x1E0C80C00];
  if (a3 <= 0)
    a1 = 0;
  *(_QWORD *)(a2 + 8) = a1;
  v8 = (void **)(a4 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  v9 = *v8;
  v18[0] = 0;
  v10 = objc_msgSend(v9, sel_encryptContent_, v18);
  v11 = v18[0];
  if (v10)
  {
    v12 = (void *)sub_1DEF144F4();
    v14 = v13;

    v18[5] = v12;
    v18[6] = v14;
    v18[1] = 0;
    __asm { BR              X11 }
  }
  v15 = v11;
  v16 = sub_1DEF144A0();

  result = swift_willThrow();
  *a6 = v16;
  return result;
}

uint64_t sub_1DEF0D958@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  a2[9] = a1;
  v5 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  v6 = objc_msgSend(*v5, sel_contentType);
  v7 = objc_msgSend(v6, sel_Asn1OID);
  v9 = v8;

  a2[4] = v7;
  a2[5] = v9;
  v10 = objc_msgSend(*v5, sel_encryptionAlgorithm);
  v11 = objc_msgSend(v10, sel_algorithm);

  v12 = objc_msgSend(v11, sel_Asn1OID);
  v14 = v13;

  a2[6] = v12;
  a2[7] = v14;
  v15 = objc_msgSend(*v5, sel_encryptionAlgorithm);
  v16 = objc_msgSend(v15, sel_parameters);

  if (v16)
  {
    sub_1DEF144F4();
    v18 = v17;

    __asm { BR              X10 }
  }
  *a4 = 0;
  return sub_1DEF08E64(0, 0xF000000000000000);
}

uint64_t sub_1DEF0DB88@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v6;
  char *v7;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  id *v33;
  char *v34;
  _QWORD v35[2];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(a2 + 64) = a1;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1DEF14620();
    swift_bridgeObjectRelease();
    if ((v12 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_22;
    }
  }
  else
  {
    v12 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (HIDWORD(v12))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    v7 = sub_1DEF0E894((uint64_t)v7);
    goto LABEL_16;
  }
  v28 = a6;
  v29 = a2;
  v30 = v6;
  v31 = a5;
  *(_DWORD *)(a2 + 16) = v12;
  if (v12)
  {
    type metadata accessor for RecipientInfo(0);
    v13 = sub_1DEF1459C();
    v7 = (char *)v13;
    *(_QWORD *)(v13 + 16) = v12;
    v14 = 32;
    do
    {
      v15 = v13 + v14;
      *(_DWORD *)v15 = 0;
      *(_OWORD *)(v15 + 88) = 0uLL;
      *(_OWORD *)(v15 + 72) = 0uLL;
      *(_QWORD *)(v15 + 104) = 0;
      *(_OWORD *)(v15 + 56) = 0uLL;
      *(_OWORD *)(v15 + 40) = 0uLL;
      *(_OWORD *)(v15 + 24) = 0uLL;
      v14 += 112;
      *(_OWORD *)(v15 + 8) = 0uLL;
      --v12;
    }
    while (v12);
  }
  else
  {
    v7 = (char *)MEMORY[0x1E0DEE9D8];
  }
  if (*((_QWORD *)v7 + 2))
  {
    v33 = (id *)(a4 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    if ((a3 & 0xC000000000000001) != 0)
    {
      v16 = (id)MEMORY[0x1DF0F1F4C](0, a3);
    }
    else
    {
      if (!*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        JUMPOUT(0x1DEF0DFB0);
      }
      v16 = *(id *)(a3 + 32);
    }
    v17 = v16;
    v18 = objc_msgSend(*v33, sel_encryptionKey);
    v19 = sub_1DEF144F4();
    v21 = v20;

    v22 = (void *)sub_1DEF144DC();
    sub_1DEF03824(v19, v21);
    v23 = objc_msgSend(v17, sel_encryptBulkKey_, v22);

    sub_1DEF144F4();
    v25 = v24;

    __asm { BR              X9 }
  }
  v34 = v7;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_23;
LABEL_16:
  v26 = *((_QWORD *)v7 + 2);
  v35[0] = v7 + 32;
  v35[1] = v26;
  sub_1DEF0E010(v35, v29, a4, &v34, a3, (uint64_t)v36);
  swift_bridgeObjectRelease();
  if (v30)
  {
    result = swift_bridgeObjectRelease();
    *v31 = v30;
  }
  else
  {
    *v28 = v36[0];
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DEF0E010@<X0>(_QWORD *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char **v6;
  char **v7;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  id *v16;
  id v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  int *v27;
  id *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  char **v32;
  id v33;
  id *v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  void *v43;
  char isUniquelyReferenced_nonNull_native;
  char v45;
  void (**v46)(char **, uint64_t);
  void (**v47)(char **, uint64_t);
  uint64_t v48;
  void (**v49)(char **, uint64_t);
  uint64_t v51;
  id v52;
  _QWORD *v53;
  unint64_t v54;
  void (**v55)(char **, uint64_t);
  id v56;
  char **v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  char v61[32];
  _OWORD v62[2];
  int v63;
  char *v64;
  __int128 v65;
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v7 = v6;
  v59 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v58 = sub_1DEF144AC();
  v55 = *(void (***)(char **, uint64_t))(v58 - 8);
  MEMORY[0x1E0C80A78](v58, v13);
  v15 = (char **)((char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_QWORD *)(a2 + 24) = *a1;
  v64 = 0;
  v16 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  v17 = objc_msgSend(*v16, sel_unprotectedAttributes);
  v53 = (_QWORD *)a6;
  if (!v17)
  {
    v63 = 0;
    a6 = MEMORY[0x1E0DEE9D8];
    LODWORD(v20) = 1;
    goto LABEL_18;
  }
  v18 = v17;
  v56 = (id)a3;
  v19 = (unint64_t)objc_msgSend(v17, sel_count);

  if ((v19 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_60;
  }
  if (HIDWORD(v19))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v63 = v19;
  if (v19)
  {
    type metadata accessor for Attribute(0);
    a6 = sub_1DEF1459C();
    *(_QWORD *)(a6 + 16) = v19;
    LODWORD(v20) = a6 + 32;
    v21 = v19;
    v22 = a6 + 32;
    do
    {
      *(_QWORD *)(v22 + 24) = 0;
      *(_QWORD *)v22 = 0;
      *(_QWORD *)(v22 + 8) = 0;
      *(_DWORD *)(v22 + 16) = 0;
      v22 += 32;
      --v21;
    }
    while (v21);
    if ((_DWORD)v19)
    {
      v23 = objc_msgSend(*v16, sel_unprotectedAttributes);
      if (v23)
      {
        v54 = a2;
        v57 = v6;
        v24 = v23;
        sub_1DEF145C0();
        v52 = v24;

        sub_1DEF0FA4C();
        sub_1DEF145D8();
        if ((_QWORD)v67)
        {
          a2 = -1;
          a3 = MEMORY[0x1E0DEE9B8] + 8;
          do
          {
            sub_1DEF0B554(&v65, v62);
            sub_1DEF0FA94((uint64_t)v62, (uint64_t)v61);
            sub_1DEF0B51C(0, &qword_1F0461D10);
            swift_dynamicCast();
            v25 = v60;
            objc_msgSend(v60, sel_generateAttributeStruct);

            if (++a2 >= *(_QWORD *)(a6 + 16))
              goto LABEL_57;
            copy_Attribute();
            free_Attribute();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v62);
            sub_1DEF145D8();
            LODWORD(v20) = v20 + 32;
          }
          while ((_QWORD)v67);
        }
        v55[1](v15, v58);

        LODWORD(v20) = 0;
        v7 = v57;
        a2 = v54;
      }
      else
      {
        LODWORD(v20) = 0;
      }
      goto LABEL_17;
    }
  }
  else
  {
    a6 = MEMORY[0x1E0DEE9D8];
  }
  LODWORD(v20) = 1;
LABEL_17:
  a3 = (unint64_t)v56;
LABEL_18:
  v15 = v7;
  swift_bridgeObjectRetain();
  v26 = (char *)a6;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_58;
  while (1)
  {
    v64 = v26 + 32;
    v27 = &v63;
    if ((_DWORD)v20)
      v27 = 0;
    *(_QWORD *)(a2 + 80) = v27;
    v28 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    if (objc_msgSend(*v28, sel_legacyASN1Encoding))
    {
      v29 = *(_QWORD *)(a2 + 8);
      v30 = *(_DWORD *)(a2 + 16);
      LODWORD(v65) = *(_DWORD *)a2;
      *((_QWORD *)&v65 + 1) = v29;
      v66 = v30;
      v67 = *(_OWORD *)(a2 + 24);
      v68 = *(_OWORD *)(a2 + 40);
      v69 = *(_OWORD *)(a2 + 56);
      v70 = *(_OWORD *)(a2 + 72);
      v31 = length_SecCMS_EnvelopedData();
    }
    else
    {
      v31 = length_EnvelopedData();
    }
    v32 = (char **)v31;
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), sel_initWithLength_, v31);
    if (!v33)
    {
      sub_1DEF08C08();
      swift_allocError();
      *(_OWORD *)v39 = xmmword_1DEF17200;
      *(_BYTE *)(v39 + 16) = 48;
      swift_willThrow();
      goto LABEL_53;
    }
    v58 = (uint64_t)v26;
    v57 = v15;
    v55 = (void (**)(char **, uint64_t))objc_retainAutorelease(v33);
    objc_msgSend(v55, sel_mutableBytes);
    v15 = v32;
    v60 = 0;
    v34 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    v35 = objc_msgSend(*v34, sel_legacyASN1Encoding);
    v56 = v32;
    if (v35)
    {
      v36 = *(_QWORD *)(a2 + 8);
      v37 = *(_DWORD *)(a2 + 16);
      LODWORD(v65) = *(_DWORD *)a2;
      *((_QWORD *)&v65 + 1) = v36;
      v66 = v37;
      v67 = *(_OWORD *)(a2 + 24);
      v68 = *(_OWORD *)(a2 + 40);
      v69 = *(_OWORD *)(a2 + 56);
      v70 = *(_OWORD *)(a2 + 72);
      v38 = encode_SecCMS_EnvelopedData();
    }
    else
    {
      v38 = encode_EnvelopedData();
    }
    LODWORD(v54) = v38;
    v40 = v59;
    v41 = *a4;
    a2 = *((_QWORD *)*a4 + 2);
    if (!a2)
      break;
    v16 = (id *)(v59 & 0xC000000000000001);
    if ((v59 & 0xC000000000000001) != 0 || a2 <= *(_QWORD *)((v59 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v20 = 0;
      a3 = 32;
      v15 = &selRef_initWithHashAgilityValue_;
      while (1)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a4 = v41;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v41 = sub_1DEF0E894((uint64_t)v41);
          *a4 = v41;
        }
        if (v20 >= *((_QWORD *)v41 + 2))
          break;
        if (v16)
          v42 = (id)MEMORY[0x1DF0F1F4C](v20, v40);
        else
          v42 = *(id *)(v40 + 8 * v20 + 32);
        v43 = v42;
        ++v20;
        objc_msgSend(v42, sel_freeRecipientInfo_, &v41[a3]);

        v41 = *a4;
        a3 += 112;
        v40 = v59;
        if (a2 == v20)
          goto LABEL_40;
      }
      __break(1u);
      goto LABEL_56;
    }
LABEL_61:
    __break(1u);
LABEL_62:
    a6 = (uint64_t)sub_1DEF0E8A8(a6);
LABEL_42:
    a3 = 0;
    LODWORD(v20) = a6 + 32;
    while (a3 < *(_QWORD *)(a6 + 16))
    {
      ++a3;
      free_Attribute();
      LODWORD(v20) = v20 + 32;
      if (v16 == (id *)a3)
        goto LABEL_47;
    }
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    v26 = sub_1DEF0E8A8(a6);
  }
LABEL_40:
  v16 = *(id **)(a6 + 16);
  if (v16)
  {
    v45 = swift_isUniquelyReferenced_nonNull_native();
    v15 = v57;
    if ((v45 & 1) != 0)
      goto LABEL_42;
    goto LABEL_62;
  }
  v15 = v57;
LABEL_47:
  v46 = v55;
  if ((_DWORD)v54 || v60 != v56)
  {
    sub_1DEF08C08();
    swift_allocError();
    *(_OWORD *)v48 = xmmword_1DEF17200;
    *(_BYTE *)(v48 + 16) = 48;
    swift_willThrow();

  }
  else
  {
    v47 = v55;
    if (v15)
    {

    }
    else
    {
      v49 = v47;

      *v53 = v49;
    }
  }
LABEL_53:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id MSCMSEnvelopedDataInternal.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSEnvelopedDataInternal.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MSCMSEnvelopedDataInternal.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1DEF0E894(uint64_t a1)
{
  return sub_1DEF0E8BC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1DEF0E8A8(uint64_t a1)
{
  return sub_1DEF0E9D4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1DEF0E8BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461E88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 112);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[112 * v8])
      memmove(v12, v13, 112 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 112 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1DEF0E9D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461E80);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DEF0EACC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v12 = sub_1DEF14434();
  if (!v12)
LABEL_6:
    __break(1u);
  v13 = v12;
  v14 = sub_1DEF14458();
  if (__OFSUB__(a1, v14))
  {
    __break(1u);
    goto LABEL_6;
  }
  v15 = v13 + a1 - v14;
  sub_1DEF1444C();
  v19[0] = a3;
  v19[1] = v15;
  result = sub_1DEF0DB88((uint64_t)v19, a4, a5, a6, &v17, &v18);
  if (!v6)
    return v18;
  return result;
}

void sub_1DEF0EBA8(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF0EC10@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  _QWORD v27[15];

  v21 = v5;
  LOWORD(v22) = a1;
  BYTE2(v22) = BYTE2(a1);
  HIBYTE(v22) = BYTE3(a1);
  v23 = BYTE4(a1);
  v24 = BYTE5(a1);
  v25 = BYTE6(a1);
  v27[0] = v6;
  v27[1] = &v21;
  swift_bridgeObjectRetain();
  v8 = v2;
  sub_1DEF0DB88((uint64_t)v27, v4, v3, (unint64_t)v8, &v20, &v26);
  if (v7)
  {
    v9 = v21;
    v10 = v22;
    v11 = v23;
    v12 = v24;
    v13 = v25;

    swift_bridgeObjectRelease();
    *v1 = v9;
    v1[1] = v10 | (v11 << 32) | (v12 << 40) | (v13 << 48);
  }
  else
  {
    v9 = v26;
    v19 = v21;
    v14 = v22;
    v15 = v23;
    v16 = v24;
    v17 = v25;

    swift_bridgeObjectRelease();
    *v1 = v19;
    v1[1] = v14 | (v15 << 32) | (v16 << 40) | (v17 << 48);
  }
  return v9;
}

void sub_1DEF0F004(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF0F068@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;

  v20 = v5;
  LOWORD(v21) = a2;
  BYTE2(v21) = BYTE2(a2);
  HIBYTE(v21) = BYTE3(a2);
  v22 = BYTE4(a2);
  v23 = BYTE5(a2);
  v24 = BYTE6(a2);
  *(_QWORD *)(v4 + 8) = &v20;
  v7 = a1;
  swift_bridgeObjectRetain();
  sub_1DEF0D958(v4, v6, (uint64_t)v7, &v19);
  if (v3)
  {
    v8 = v20;
    v9 = v21;
    v10 = v22;
    v11 = v23;
    v12 = v24;
    swift_bridgeObjectRelease();

    *v2 = v8;
    v2[1] = v9 | (v10 << 32) | (v11 << 40) | (v12 << 48);
  }
  else
  {
    v8 = v19;
    v18 = v20;
    v13 = v21;
    v14 = v22;
    v15 = v23;
    v16 = v24;
    swift_bridgeObjectRelease();

    *v2 = v18;
    v2[1] = v13 | (v14 << 32) | (v15 << 40) | (v16 << 48);
  }
  return v8;
}

uint64_t sub_1DEF0F4E8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17[3];

  result = sub_1DEF14434();
  if (!result)
    goto LABEL_6;
  v15 = result;
  result = sub_1DEF14458();
  if (__OFSUB__(a1, result))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    return result;
  }
  v16 = v15 + a1 - result;
  sub_1DEF1444C();
  *a3 = a4;
  a3[1] = v16;
  result = sub_1DEF0D774((uint64_t)a3, a5, a4, a6, a7, v17);
  if (!v7)
    return v17[2];
  return result;
}

void sub_1DEF0F5A8(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF0F610@<X0>(void *a1@<X4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  uint64_t v27;

  v22 = v6;
  LOWORD(v23) = a2;
  BYTE2(v23) = BYTE2(a2);
  HIBYTE(v23) = BYTE3(a2);
  v24 = BYTE4(a2);
  v25 = BYTE5(a2);
  v26 = BYTE6(a2);
  *v7 = v8;
  v7[1] = (uint64_t)&v22;
  v9 = a1;
  swift_bridgeObjectRetain();
  sub_1DEF0D774((uint64_t)v7, v5, v8, (uint64_t)v9, v2, &v21);
  if (v4)
  {
    v10 = v22;
    v11 = v23;
    v12 = v24;
    v13 = v25;
    v14 = v26;
    swift_bridgeObjectRelease();

    *v3 = v10;
    v3[1] = v11 | (v12 << 32) | (v13 << 40) | (v14 << 48);
  }
  else
  {
    v10 = v27;
    v20 = v22;
    v15 = v23;
    v16 = v24;
    v17 = v25;
    v18 = v26;
    swift_bridgeObjectRelease();

    *v3 = v20;
    v3[1] = v15 | (v16 << 32) | (v17 << 40) | (v18 << 48);
  }
  return v10;
}

uint64_t type metadata accessor for MSCMSEnvelopedDataInternal()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSEnvelopedDataInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

void type metadata accessor for RecipientInfo(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461E98);
}

unint64_t sub_1DEF0FA4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F0461E78;
  if (!qword_1F0461E78)
  {
    v1 = sub_1DEF144AC();
    result = MEMORY[0x1DF0F28AC](MEMORY[0x1E0CAFB80], v1);
    atomic_store(result, (unint64_t *)&qword_1F0461E78);
  }
  return result;
}

uint64_t sub_1DEF0FA94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void type metadata accessor for Attribute(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461E90);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DEF0FB14(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF0FB34(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t sub_1DEF0FB84(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 112))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF0FBA4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 112) = v3;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for Attribute_value(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461EA0);
}

void type metadata accessor for heim_oid(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461EA8);
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_1DEF0FC7C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 104))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF0FC9C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 104) = v3;
  return result;
}

void type metadata accessor for RecipientInfo.__Unnamed_union_u(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461EB0);
}

void type metadata accessor for RecipientInfo_enum(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461EB8);
}

uint64_t sub_1DEF0FD08(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF0FD28(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for heim_base_data(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461EC0);
}

void sub_1DEF0FD64(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1DEF0FDB4()
{
  sub_1DEF11DF0();
  return sub_1DEF1468C();
}

uint64_t sub_1DEF0FDDC()
{
  sub_1DEF11DF0();
  return sub_1DEF14680();
}

void MSCMSContentError.errorDescription.getter()
{
  __asm { BR              X12 }
}

uint64_t sub_1DEF0FE58()
{
  sub_1DEF1465C();
  sub_1DEF14554();
  swift_bridgeObjectRelease();
  return 0x72726520314E5341;
}

unint64_t static MSCMSContentError.errorDomain.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t MSCMSContentError.errorCode.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_1DEF0FF70 + 4 * byte_1DEF17444[*(unsigned __int8 *)(v0 + 16)]))(1);
}

uint64_t sub_1DEF0FF70()
{
  return 2;
}

uint64_t sub_1DEF0FF78()
{
  return 4;
}

uint64_t sub_1DEF0FF80()
{
  _OWORD *v0;

  if (*v0 == 0)
    return 3;
  else
    return 5;
}

unint64_t MSCMSContentError.errorUserInfo.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  char v23;
  void *v24;
  id v25;
  char v26;
  unint64_t v28;
  unint64_t v29;
  _OWORD v30[2];
  __int128 v31;
  char v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 16);
  v4 = sub_1DEF1031C(MEMORY[0x1E0DEE9D8]);
  v29 = v4;
  *(_QWORD *)&v31 = v1;
  *((_QWORD *)&v31 + 1) = v2;
  v32 = v3;
  MSCMSContentError.errorDescription.getter();
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    v9 = sub_1DEF14530();
    v11 = v10;
    v33 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v31 = v7;
    *((_QWORD *)&v31 + 1) = v8;
    sub_1DEF0B554(&v31, v30);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1DEF115FC(v30, v9, v11, isUniquelyReferenced_nonNull_native);
    v29 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  switch(v3)
  {
    case 2:
      v33 = MEMORY[0x1E0DEE0F8];
      LODWORD(v31) = (_DWORD)v1;
      sub_1DEF0B554(&v31, v30);
      v13 = swift_isUniquelyReferenced_nonNull_native();
      v28 = v29;
      v15 = 0x5664696C61766E49;
      v14 = 0xEE006E6F69737265;
      goto LABEL_8;
    case 1:
      v16 = sub_1DEF14530();
      v18 = v17;
      v19 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      v20 = (void *)sub_1DEF14524();
      v21 = objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, (int)v1, 0);

      v22 = sub_1DEF1172C();
      v33 = v22;
      *(_QWORD *)&v31 = v21;
      sub_1DEF0B554(&v31, v30);
      v23 = swift_isUniquelyReferenced_nonNull_native();
      sub_1DEF115FC(v30, v16, v18, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v1 & 0x80000000) != 0)
        __break(1u);
      *(_QWORD *)&v31 = 0;
      asn1ErrorToNSError(v1, &v31);
      v24 = (void *)v31;
      if ((_QWORD)v31)
      {
        v33 = v22;
        sub_1DEF0B554(&v31, v30);
        v25 = v24;
        v26 = swift_isUniquelyReferenced_nonNull_native();
        sub_1DEF115FC(v30, 0x6F727245314E5341, 0xE900000000000072, v26);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1DEF1103C(0x6F727245314E5341, 0xE900000000000072, &v31);
        sub_1DEF11768((uint64_t)&v31);
      }

      break;
    case 0:
      v33 = MEMORY[0x1E0DEA968];
      *(_QWORD *)&v31 = v1;
      *((_QWORD *)&v31 + 1) = v2;
      sub_1DEF0B554(&v31, v30);
      swift_bridgeObjectRetain();
      v13 = swift_isUniquelyReferenced_nonNull_native();
      v28 = v29;
      v14 = 0x80000001DEF1B280;
      v15 = 0xD000000000000015;
LABEL_8:
      sub_1DEF115FC(v30, v15, v14, v13);
      v29 = v28;
      swift_bridgeObjectRelease();
      break;
  }
  return v29;
}

unint64_t sub_1DEF1031C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461F00);
  v2 = sub_1DEF14644();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DEF12160(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1DEF10FD8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1DEF0B554(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DEF10444()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_1DEF10460()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_1DEF10480 + 4 * byte_1DEF17448[*(unsigned __int8 *)(v0 + 16)]))(1);
}

uint64_t sub_1DEF10480()
{
  return 2;
}

uint64_t sub_1DEF10488()
{
  return 4;
}

uint64_t sub_1DEF10490()
{
  _OWORD *v0;

  if (*v0 == 0)
    return 3;
  else
    return 5;
}

uint64_t sub_1DEF104B0()
{
  sub_1DEF11DAC();
  return sub_1DEF1468C();
}

uint64_t sub_1DEF104D8()
{
  sub_1DEF11DAC();
  return sub_1DEF14680();
}

unint64_t MSCMSContentTypeError.errorDescription.getter()
{
  uint64_t v0;
  int v1;
  unint64_t v2;

  v1 = *(unsigned __int8 *)(v0 + 16) >> 6;
  v2 = 0xD000000000000010;
  if (v1 != 1)
    v2 = 0xD000000000000014;
  if (v1)
    return v2;
  else
    return 0xD000000000000014;
}

unint64_t static MSCMSContentTypeError.errorDomain.getter()
{
  return 0xD00000000000002FLL;
}

unint64_t MSCMSContentTypeError.errorCode.getter()
{
  uint64_t v0;

  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

unint64_t MSCMSContentTypeError.errorUserInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ValueMetadata *v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _OWORD v20[2];
  __int128 v21;
  char v22;
  ValueMetadata *v23;

  v2 = *(_QWORD *)v0;
  v1 = *(_QWORD *)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 16);
  v4 = sub_1DEF1031C(MEMORY[0x1E0DEE9D8]);
  if (v3 >> 6)
  {
    if (v3 >> 6 == 1)
    {
      v5 = 0xD000000000000010;
      v6 = 0x80000001DEF1B2C0;
      goto LABEL_7;
    }
    v7 = "TimeStampToken error";
  }
  else
  {
    v7 = "Unknown content type";
  }
  v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
  v5 = 0xD000000000000014;
LABEL_7:
  v8 = sub_1DEF14530();
  v10 = v9;
  v11 = (ValueMetadata *)MEMORY[0x1E0DEA968];
  v23 = (ValueMetadata *)MEMORY[0x1E0DEA968];
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v6;
  sub_1DEF0B554(&v21, v20);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1DEF115FC(v20, v8, v10, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3 > 0x3F)
  {
    v15 = sub_1DEF14530();
    v17 = v16;
    v23 = &type metadata for MSCMSContentError;
    *(_QWORD *)&v21 = v2;
    *((_QWORD *)&v21 + 1) = v1;
    v22 = v3 & 0x3F;
    sub_1DEF0B554(&v21, v20);
    sub_1DEF117A8(v2, v1, v3);
    v18 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DEF115FC(v20, v15, v17, v18);
    v14 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = v11;
    *(_QWORD *)&v21 = v2;
    *((_QWORD *)&v21 + 1) = v1;
    sub_1DEF0B554(&v21, v20);
    swift_bridgeObjectRetain();
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DEF115FC(v20, 0xD000000000000015, 0x80000001DEF1B330, v13);
    v14 = v4;
  }
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1DEF1078C()
{
  return 0xD00000000000002FLL;
}

unint64_t sub_1DEF107A8()
{
  uint64_t v0;

  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

uint64_t sub_1DEF107BC()
{
  sub_1DEF11D68();
  return sub_1DEF1468C();
}

uint64_t sub_1DEF107E4()
{
  sub_1DEF11D68();
  return sub_1DEF14680();
}

void MSCMSError.errorDescription.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF1085C()
{
  uint64_t v0;

  sub_1DEF145FC();
  swift_bridgeObjectRelease();
  sub_1DEF1465C();
  sub_1DEF14554();
  swift_bridgeObjectRelease();
  return v0 + 3;
}

unint64_t static MSCMSError.errorDomain.getter()
{
  return 0xD000000000000019;
}

uint64_t MSCMSError.errorCode.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_1DEF10B74
                                          + 4 * byte_1DEF17453[(*(unsigned __int8 *)(v0 + 16) >> 3) & 7]))(-6);
}

uint64_t sub_1DEF10B74()
{
  return -7;
}

uint64_t sub_1DEF10B7C()
{
  return -15;
}

uint64_t sub_1DEF10B84()
{
  return -16;
}

uint64_t sub_1DEF10B8C()
{
  return 1;
}

uint64_t sub_1DEF10B94()
{
  return 2;
}

uint64_t sub_1DEF10B9C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v8;

  v3 = *(_QWORD *)(v2 + 8);
  if (a1 == 48 && (v3 | v1) == 0)
    return -1;
  if (a1 == 48 && v1 == 1 && v3 == 0)
    return -2;
  if (a1 == 48 && v1 == 2 && !v3)
    return -3;
  if (a1 == 48 && v1 == 3 && !v3)
    return -4;
  if (a1 == 48 && v1 == 4 && !v3)
    return -5;
  if (a1 == 48 && v1 == 5 && !v3)
    return -8;
  if (a1 == 48 && v1 == 6 && !v3)
    return -9;
  if (a1 == 48 && v1 == 7 && !v3)
    return -10;
  if (a1 == 48 && v1 == 8 && !v3)
    return -11;
  if (a1 == 48 && v1 == 9 && !v3)
    return -12;
  if (v3)
    v8 = 0;
  else
    v8 = v1 == 10;
  if (v8 && a1 == 48)
    return -13;
  else
    return -14;
}

unint64_t MSCMSError.errorUserInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _OWORD v18[2];
  __int128 v19;
  char v20;
  ValueMetadata *v21;

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  v4 = sub_1DEF1031C(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v19 = v1;
  *((_QWORD *)&v19 + 1) = v2;
  v20 = v3;
  MSCMSError.errorDescription.getter();
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    v9 = sub_1DEF14530();
    v11 = v10;
    v21 = (ValueMetadata *)MEMORY[0x1E0DEA968];
    *(_QWORD *)&v19 = v7;
    *((_QWORD *)&v19 + 1) = v8;
    sub_1DEF0B554(&v19, v18);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1DEF115FC(v18, v9, v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((v3 & 0x30) == 0x20)
  {
    v13 = sub_1DEF14530();
    v15 = v14;
    v21 = &type metadata for MSCMSContentTypeError;
    *(_QWORD *)&v19 = v1;
    *((_QWORD *)&v19 + 1) = v2;
    v20 = v3 & 0xC7;
    sub_1DEF0B554(&v19, v18);
    sub_1DEF117E8(v1, v2, v3);
    v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DEF115FC(v18, v13, v15, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_1DEF10E38()
{
  return 0xD000000000000019;
}

uint64_t sub_1DEF10E54()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_1DEF10E7C
                                          + 4 * byte_1DEF1745A[(*(unsigned __int8 *)(v0 + 16) >> 3) & 7]))(-6);
}

uint64_t sub_1DEF10E7C()
{
  return -7;
}

uint64_t sub_1DEF10E84()
{
  return -15;
}

uint64_t sub_1DEF10E8C()
{
  return -16;
}

uint64_t sub_1DEF10E94()
{
  return 1;
}

uint64_t sub_1DEF10E9C()
{
  return 2;
}

uint64_t sub_1DEF10EA4@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v8;

  v3 = *(_QWORD *)(v2 + 8);
  if (a1 == 48 && (v3 | v1) == 0)
    return -1;
  if (a1 == 48 && v1 == 1 && v3 == 0)
    return -2;
  if (a1 == 48 && v1 == 2 && !v3)
    return -3;
  if (a1 == 48 && v1 == 3 && !v3)
    return -4;
  if (a1 == 48 && v1 == 4 && !v3)
    return -5;
  if (a1 == 48 && v1 == 5 && !v3)
    return -8;
  if (a1 == 48 && v1 == 6 && !v3)
    return -9;
  if (a1 == 48 && v1 == 7 && !v3)
    return -10;
  if (a1 == 48 && v1 == 8 && !v3)
    return -11;
  if (a1 == 48 && v1 == 9 && !v3)
    return -12;
  if (v3)
    v8 = 0;
  else
    v8 = v1 == 10;
  if (v8 && a1 == 48)
    return -13;
  else
    return -14;
}

unint64_t sub_1DEF10FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DEF146B0();
  sub_1DEF14548();
  v4 = sub_1DEF146BC();
  return sub_1DEF11E9C(a1, a2, v4);
}

double sub_1DEF1103C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1DEF10FD8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1DEF11F7C();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1DEF0B554((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1DEF11428(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1DEF1112C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461F00);
  v6 = sub_1DEF14638();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1DEF0B554(v24, v35);
      }
      else
      {
        sub_1DEF0FA94((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1DEF146B0();
      sub_1DEF14548();
      result = sub_1DEF146BC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1DEF0B554(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1DEF11428(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1DEF145F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1DEF146B0();
        swift_bridgeObjectRetain();
        sub_1DEF14548();
        v10 = sub_1DEF146BC();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_1DEF115FC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1DEF10FD8(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_1DEF0B554(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1DEF11F7C();
      goto LABEL_7;
    }
    sub_1DEF1112C(v15, a4 & 1);
    v21 = sub_1DEF10FD8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1DEF11E34(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1DEF14674();
  __break(1u);
  return result;
}

unint64_t sub_1DEF1172C()
{
  unint64_t result;

  result = qword_1F0461EC8;
  if (!qword_1F0461EC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F0461EC8);
  }
  return result;
}

uint64_t sub_1DEF11768(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461ED0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DEF117A8(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3;

  v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1)
    return sub_1DEF117D4(result, a2, a3 & 0x3F);
  if (!(a3 >> 6))
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DEF117D4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DEF117E8(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20)
    return sub_1DEF117A8(result, a2, a3 & 0xC7);
  return result;
}

unint64_t sub_1DEF11804()
{
  unint64_t result;

  result = qword_1F0461ED8;
  if (!qword_1F0461ED8)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSContentError, &type metadata for MSCMSContentError);
    atomic_store(result, (unint64_t *)&qword_1F0461ED8);
  }
  return result;
}

unint64_t sub_1DEF1184C()
{
  unint64_t result;

  result = qword_1F0461EE0;
  if (!qword_1F0461EE0)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSContentTypeError, &type metadata for MSCMSContentTypeError);
    atomic_store(result, (unint64_t *)&qword_1F0461EE0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11B48(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117D4);
}

uint64_t destroy for MSCMSContentError(uint64_t a1)
{
  return sub_1DEF118B0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1DEF118B0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *assignWithCopy for MSCMSContentError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11BA4(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117D4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF118B0);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for MSCMSContentError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1DEF11C10(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF118B0);
}

uint64_t getEnumTagSinglePayload for MSCMSContentError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSContentError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DEF11984(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1DEF119A0(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentError()
{
  return &type metadata for MSCMSContentError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentTypeError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11B48(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117A8);
}

uint64_t destroy for MSCMSContentTypeError(uint64_t a1)
{
  return sub_1DEF119E4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1DEF119E4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3;

  v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1)
    return sub_1DEF118B0(result, a2, a3 & 0x3F);
  if (!(a3 >> 6))
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *assignWithCopy for MSCMSContentTypeError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11BA4(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117A8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF119E4);
}

uint64_t *assignWithTake for MSCMSContentTypeError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1DEF11C10(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF119E4);
}

uint64_t getEnumTagSinglePayload for MSCMSContentTypeError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3E && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 62);
  v3 = (*(_BYTE *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSContentTypeError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 62;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3E)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3E)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_1DEF11AD4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_1DEF11AE0(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1DEF11AF0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentTypeError()
{
  return &type metadata for MSCMSContentTypeError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11B48(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117E8);
}

uint64_t destroy for MSCMSError(uint64_t a1)
{
  return sub_1DEF11B30(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1DEF11B30(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20)
    return sub_1DEF119E4(result, a2, a3 & 0xC7);
  return result;
}

uint64_t sub_1DEF11B48(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a2;
  v6 = a2[1];
  v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for MSCMSError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1DEF11BA4(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1DEF117E8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF11B30);
}

uint64_t *sub_1DEF11BA4(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *a2;
  v8 = a2[1];
  v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  v10 = *a1;
  v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  v12 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for MSCMSError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1DEF11C10(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DEF11B30);
}

uint64_t *sub_1DEF11C10(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v8 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xA && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 10);
  v3 = ((2 * *(unsigned __int8 *)(a1 + 16)) & 8 | (*(unsigned __int8 *)(a1 + 16) >> 3) & 7) ^ 0xF;
  if (v3 >= 9)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 10;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xA)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xA)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * ((((-a2 & 8) != 0) - 2 * a2) & 0xF);
    }
  }
  return result;
}

uint64_t sub_1DEF11CFC(uint64_t a1)
{
  unsigned int v1;

  v1 = (*(unsigned __int8 *)(a1 + 16) >> 3) & 7;
  if (v1 <= 5)
    return v1;
  else
    return (*(_DWORD *)a1 + 6);
}

uint64_t sub_1DEF11D18(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0xC7u;
  return result;
}

uint64_t sub_1DEF11D28(uint64_t result, unsigned int a2)
{
  if (a2 < 6)
  {
    *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 0xC3 | (8 * (a2 & 7));
  }
  else
  {
    *(_QWORD *)result = a2 - 6;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 48;
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCMSError()
{
  return &type metadata for MSCMSError;
}

unint64_t sub_1DEF11D68()
{
  unint64_t result;

  result = qword_1F0461EE8;
  if (!qword_1F0461EE8)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSError, &type metadata for MSCMSError);
    atomic_store(result, (unint64_t *)&qword_1F0461EE8);
  }
  return result;
}

unint64_t sub_1DEF11DAC()
{
  unint64_t result;

  result = qword_1F0461EF0;
  if (!qword_1F0461EF0)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSContentTypeError, &type metadata for MSCMSContentTypeError);
    atomic_store(result, (unint64_t *)&qword_1F0461EF0);
  }
  return result;
}

unint64_t sub_1DEF11DF0()
{
  unint64_t result;

  result = qword_1F0461EF8;
  if (!qword_1F0461EF8)
  {
    result = MEMORY[0x1DF0F28AC](&protocol conformance descriptor for MSCMSContentError, &type metadata for MSCMSContentError);
    atomic_store(result, (unint64_t *)&qword_1F0461EF8);
  }
  return result;
}

_OWORD *sub_1DEF11E34(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1DEF0B554(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_1DEF11E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1DEF14668() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1DEF14668() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1DEF11F7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461F00);
  v2 = *v0;
  v3 = sub_1DEF1462C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1DEF0FA94(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1DEF0B554(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DEF12160(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id MSCMSTimestampAttributeInternal.attributeType.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  return *v1;
}

void MSCMSTimestampAttributeInternal.attributeType.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*MSCMSTimestampAttributeInternal.attributeType.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__n128 sub_1DEF12324@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  v4 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(v3 + 128);
  v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  result = *(__n128 *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_1DEF12390(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 112) = v4;
  *(_QWORD *)(v3 + 128) = *(_QWORD *)(a1 + 128);
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 48) = v5;
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 80) = v6;
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *(__n128 *)(v3 + 16) = result;
  return result;
}

uint64_t (*sub_1DEF123FC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1DEF12440()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1DEF1248C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1DEF124DC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id MSCMSTimestampAttributeInternal.__deallocating_deinit()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  free_TSTInfo();
  swift_endAccess();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void MSCMSTimestampAttributeInternal.__allocating_init(attribute:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  MSCMSTimestampAttributeInternal.init(attribute:)(a1);
}

void MSCMSTimestampAttributeInternal.init(attribute:)(void *a1)
{
  char *v1;
  uint64_t v2;
  objc_class *ObjectType;
  void **v5;
  char *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _OWORD v31[8];
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[16];

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (void **)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(_QWORD *)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0;
  v6 = v1;
  v7 = objc_msgSend(a1, sel_attributeType);
  sub_1DEF14530();
  v8 = (void *)sub_1DEF14524();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_isEqualToString_, v8);

  if (!v9)
  {
    sub_1DEF08C08();
    swift_allocError();
    *(_QWORD *)v19 = 0;
    *(_QWORD *)(v19 + 8) = 0;
    *(_BYTE *)(v19 + 16) = 48;
    swift_willThrow();
LABEL_9:

    v21 = *v5;
    swift_deallocPartialClassInstance();
    return;
  }
  v10 = objc_msgSend(a1, sel_attributeType);
  v11 = OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType;
  *(_QWORD *)&v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v10;
  v12 = objc_msgSend(a1, sel_attributeValues);
  v13 = sub_1DEF14578();

  v14 = *(_QWORD *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (v14 != 1)
  {
    sub_1DEF08C08();
    swift_allocError();
    *(_QWORD *)v20 = 0;
    *(_QWORD *)(v20 + 8) = 0;
    *(_BYTE *)(v20 + 16) = 48;
    swift_willThrow();

    goto LABEL_8;
  }
  v15 = objc_msgSend(a1, sel_attributeValues);
  v16 = (_QWORD *)sub_1DEF14578();

  if (v16[2])
  {
    v17 = v16[4];
    v18 = v16[5];
    sub_1DEF03944(v17, v18);
    swift_bridgeObjectRelease();
    sub_1DEF13778((uint64_t)v31);
    if (v2)
    {

      sub_1DEF03824(v17, v18);
LABEL_8:
      a1 = *(void **)&v6[v11];
      goto LABEL_9;
    }
    sub_1DEF03824(v17, v18);
    sub_1DEF13C9C((uint64_t)&v33, (uint64_t)v34);
    swift_beginAccess();
    v22 = *v5;
    sub_1DEF13C9C((uint64_t)v34, (uint64_t)v5);

    v23 = &v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)v23 = v31[0];
    v24 = v31[4];
    v26 = v31[1];
    v25 = v31[2];
    *((_OWORD *)v23 + 3) = v31[3];
    *((_OWORD *)v23 + 4) = v24;
    *((_OWORD *)v23 + 1) = v26;
    *((_OWORD *)v23 + 2) = v25;
    v27 = v31[6];
    v28 = v31[7];
    v29 = v31[5];
    *((_QWORD *)v23 + 16) = v32;
    *((_OWORD *)v23 + 6) = v27;
    *((_OWORD *)v23 + 7) = v28;
    *((_OWORD *)v23 + 5) = v29;

    v30.receiver = v6;
    v30.super_class = ObjectType;
    objc_msgSendSuper2(&v30, sel_init);

  }
  else
  {
    __break(1u);
  }
}

__n128 sub_1DEF1298C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[9];

  sub_1DEF13778((uint64_t)v7);
  if (!v1)
  {
    v4 = v7[7];
    *(_OWORD *)(a1 + 96) = v7[6];
    *(_OWORD *)(a1 + 112) = v4;
    *(_OWORD *)(a1 + 128) = v7[8];
    v5 = v7[3];
    *(_OWORD *)(a1 + 32) = v7[2];
    *(_OWORD *)(a1 + 48) = v5;
    v6 = v7[5];
    *(_OWORD *)(a1 + 64) = v7[4];
    *(_OWORD *)(a1 + 80) = v6;
    result = (__n128)v7[1];
    *(_OWORD *)a1 = v7[0];
    *(__n128 *)(a1 + 16) = result;
  }
  return result;
}

uint64_t MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MSCMSTimestampAttributeInternal.init(timestampToken:)(a1, a2);
}

uint64_t MSCMSTimestampAttributeInternal.init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v3;
  void **v6;
  char *v7;
  id v8;
  void *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  uint64_t result;
  objc_super v19;
  _OWORD v20[8];
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[16];
  objc_class *ObjectType;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (void **)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(_QWORD *)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0;
  sub_1DEF14530();
  objc_allocWithZone((Class)MSOID);
  v7 = v2;
  v8 = sub_1DEF07CE4();
  if (v3)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v8;
    sub_1DEF13778((uint64_t)v20);
    sub_1DEF13C9C((uint64_t)&v22, (uint64_t)v23);
    swift_beginAccess();
    v9 = *v6;
    sub_1DEF13C9C((uint64_t)v23, (uint64_t)v6);

    v10 = &v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)v10 = v20[0];
    v11 = v20[4];
    v13 = v20[1];
    v12 = v20[2];
    *((_OWORD *)v10 + 3) = v20[3];
    *((_OWORD *)v10 + 4) = v11;
    *((_OWORD *)v10 + 1) = v13;
    *((_OWORD *)v10 + 2) = v12;
    v14 = v20[6];
    v15 = v20[7];
    v16 = v20[5];
    *((_QWORD *)v10 + 16) = v21;
    *((_OWORD *)v10 + 6) = v14;
    *((_OWORD *)v10 + 7) = v15;
    *((_OWORD *)v10 + 5) = v16;

    v19.receiver = v7;
    v19.super_class = ObjectType;
    v17 = objc_msgSendSuper2(&v19, sel_init);
    sub_1DEF03824(a1, a2);
    return (uint64_t)v17;
  }
  return result;
}

__n128 sub_1DEF12D24@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v2;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(v1 + 128);
  v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  result = *(__n128 *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_1DEF12D50(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v1 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v1 + 112) = v2;
  *(_QWORD *)(v1 + 128) = *(_QWORD *)(a1 + 128);
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 48) = v3;
  v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v1 + 80) = v4;
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)v1 = *(_OWORD *)a1;
  *(__n128 *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_1DEF12D7C())()
{
  return nullsub_1;
}

void *sub_1DEF12D8C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 136);
  v2 = v1;
  return v1;
}

void sub_1DEF12DB0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = a1;
}

uint64_t (*sub_1DEF12DD8())()
{
  return nullsub_1;
}

__n128 sub_1DEF12DE8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a3 + 112) = v3;
  v4 = *(_QWORD *)(a1 + 128);
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 48) = v5;
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(__n128 *)(a3 + 16) = result;
  *(_QWORD *)(a3 + 128) = v4;
  *(_QWORD *)(a3 + 136) = a2;
  return result;
}

void MSCMSTimestampAttributeInternal.verifyTimestamp(expectedMessageDigest:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void **v5;
  void *v6;
  id v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20[7];

  v20[6] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void **)(v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  v6 = *v5;
  if (*v5)
  {
    v20[0] = 0;
    v7 = v6;
    v8 = objc_msgSend(v7, sel_verifySignatures_, v20);
    v9 = v20[0];
    if (v8)
    {
      v10 = v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
      swift_beginAccess();
      v11 = v9;
      v12 = NSDataFromOctetString((_QWORD *)(v10 + 48));
      swift_endAccess();
      v13 = sub_1DEF144F4();
      v15 = v14;

      sub_1DEF13D98(a1, a2);
      if ((v16 & 1) == 0)
      {
        sub_1DEF1184C();
        swift_allocError();
        *(_OWORD *)v17 = xmmword_1DEF17780;
        *(_BYTE *)(v17 + 16) = -125;
        swift_willThrow();
      }
      sub_1DEF03824(v13, v15);
    }
    else
    {
      v19 = v20[0];
      sub_1DEF144A0();

      swift_willThrow();
    }

  }
  else
  {
    sub_1DEF1184C();
    swift_allocError();
    *(_OWORD *)v18 = xmmword_1DEF17780;
    *(_BYTE *)(v18 + 16) = 67;
    swift_willThrow();
  }
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSTimestampAttributeInternal.encodeAttribute()(MSCMSAttribute *__return_ptr retstr)
{
  uint64_t v1;

  sub_1DEF08C08();
  swift_allocError();
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_BYTE *)(v1 + 16) = 48;
  swift_willThrow();
}

NSDate __swiftcall MSCMSTimestampAttributeInternal.timestampToken()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  return (NSDate)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSince1970_, (double)*(uint64_t *)(v1 + 88));
}

id MSCMSTimestampAttributeInternal.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSTimestampAttributeInternal.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DEF132EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1DEF1334C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1DEF13530);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_1DEF13554(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1DEF135B0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_1DEF132EC((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_1DEF03824(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

void sub_1DEF13778(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_1DEF144DC();
  v45 = 0;
  v4 = objc_msgSend(v2, sel_decodeMessageSecurityObject_options_error_, v3, 0, &v45);

  if (!v4)
  {
    v22 = v45;
    v20 = (void *)sub_1DEF144A0();

    swift_willThrow();
    goto LABEL_15;
  }
  v5 = v45;
  v6 = objc_msgSend(v4, sel_contentType);
  sub_1DEF14530();
  v7 = (void *)sub_1DEF14524();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_isEqualToString_, v7);

  if (!v8)
  {
    v23 = objc_msgSend(v4, sel_contentType);
    v24 = objc_msgSend(v23, sel_OIDString);

    v25 = sub_1DEF14530();
    v27 = v26;

    sub_1DEF08C08();
    v20 = (void *)swift_allocError();
    *(_QWORD *)v28 = v25;
    *(_QWORD *)(v28 + 8) = v27;
    v29 = 96;
LABEL_14:
    *(_BYTE *)(v28 + 16) = v29;
    swift_willThrow();

    goto LABEL_15;
  }
  if (!objc_msgSend(v4, sel_embeddedContent))
  {
LABEL_13:
    sub_1DEF08C08();
    v20 = (void *)swift_allocError();
    *(_QWORD *)v28 = 0;
    *(_QWORD *)(v28 + 8) = 0;
    v29 = 99;
    goto LABEL_14;
  }
  objc_opt_self();
  v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  v10 = v9;
  v44 = a1;
  v11 = objc_msgSend(v9, sel_contentType);
  sub_1DEF14530();
  v12 = (void *)sub_1DEF14524();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_isEqualToString_, v12);

  if (v13)
  {
    LODWORD(v45) = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    memset(v49, 0, 28);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v14 = objc_msgSend(v10, sel_dataContent);
    if (v14)
    {
      v15 = sub_1DEF144F4();
      v17 = v16;

      v14 = (id)sub_1DEF144DC();
      sub_1DEF03824(v15, v17);
    }
    v18 = nsheim_decode_TSTInfo(v14);

    if (v18)
    {
      sub_1DEF11804();
      v20 = (void *)swift_allocError();
      *(_QWORD *)v19 = v18;
      *(_QWORD *)(v19 + 8) = 0;
      v21 = 1;
    }
    else
    {
      v41 = v45;
      if ((_DWORD)v45 == 1)
      {

        v42 = *(_QWORD *)&v49[1];
        v43 = DWORD2(v49[1]);
        *(_DWORD *)v44 = 1;
        *(_OWORD *)(v44 + 8) = v46;
        *(_OWORD *)(v44 + 24) = v47;
        *(_OWORD *)(v44 + 40) = v48;
        *(_OWORD *)(v44 + 56) = v49[0];
        *(_QWORD *)(v44 + 72) = v42;
        *(_DWORD *)(v44 + 80) = v43;
        *(_OWORD *)(v44 + 88) = v50;
        *(_OWORD *)(v44 + 104) = v51;
        *(_OWORD *)(v44 + 120) = v52;
        *(_QWORD *)(v44 + 136) = v10;
        return;
      }
      sub_1DEF11804();
      v20 = (void *)swift_allocError();
      *(_QWORD *)v19 = v41;
      *(_QWORD *)(v19 + 8) = 0;
      v21 = 2;
    }
    *(_BYTE *)(v19 + 16) = v21;
  }
  else
  {
    v35 = objc_msgSend(v10, sel_contentType);
    v36 = objc_msgSend(v35, sel_OIDString);

    v37 = sub_1DEF14530();
    v39 = v38;

    sub_1DEF11804();
    v20 = (void *)swift_allocError();
    *(_QWORD *)v40 = v37;
    *(_QWORD *)(v40 + 8) = v39;
    *(_BYTE *)(v40 + 16) = 0;
  }
  swift_willThrow();

  swift_unknownObjectRelease();
LABEL_15:
  v30 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0461F30);
  if (swift_dynamicCast())
  {

    v31 = v45;
    v32 = v46;
    v33 = BYTE8(v46) | 0xA0;
    sub_1DEF08C08();
    swift_allocError();
    *(_QWORD *)v34 = v31;
    *(_QWORD *)(v34 + 8) = v32;
    *(_BYTE *)(v34 + 16) = v33;
    swift_willThrow();
  }

}

uint64_t sub_1DEF13C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0460E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DEF13CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1DEF14434();
  v11 = result;
  if (result)
  {
    result = sub_1DEF14458();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1DEF1444C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1DEF132EC(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1DEF13D98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1DEF13DDC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1DEF13E10 + *((int *)qword_1DEF13ED0 + (v0 >> 62))))();
}

uint64_t sub_1DEF13E20@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_1DEF03944(v2, v1);
      sub_1DEF13554(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t type metadata accessor for MSCMSTimestampAttributeInternal()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSTimestampAttributeInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(attribute:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void destroy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1)
{

}

uint64_t initializeWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;

  v3 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(void **)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v3 = *(void **)(a1 + 136);
  v4 = *(void **)(a2 + 136);
  *(_QWORD *)(a1 + 136) = v4;
  v5 = v4;

  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v3 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);

  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 144))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 136);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 144) = 0;
    if (a2)
      *(_QWORD *)(result + 136) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCMSTimestampAttributeInternal.decodedAttribute()
{
  return &type metadata for MSCMSTimestampAttributeInternal.decodedAttribute;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_1DEF14210(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF14230(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 136) = v3;
  return result;
}

void type metadata accessor for TSTInfo(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F28);
}

void type metadata accessor for Extensions(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F38);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1DEF142B8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF142D8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for GeneralName(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F40);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for Accuracy(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F48);
}

uint64_t sub_1DEF14348(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DEF14368(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for heim_integer(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F50);
}

void type metadata accessor for MessageImprint(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F58);
}

void type metadata accessor for Extension(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F60);
}

void type metadata accessor for GeneralName.__Unnamed_union_u(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F68);
}

void type metadata accessor for GeneralName_enum(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F70);
}

void type metadata accessor for AlgorithmIdentifier(uint64_t a1)
{
  sub_1DEF0FD64(a1, &qword_1F0461F78);
}

uint64_t sub_1DEF1441C()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1DEF14428()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1DEF14434()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1DEF14440()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1DEF1444C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1DEF14458()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1DEF14464()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1DEF14470()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1DEF1447C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1DEF14488()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1DEF14494()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DEF144A0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DEF144AC()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1DEF144B8()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1DEF144C4()
{
  return MEMORY[0x1E0CB00F0]();
}

uint64_t sub_1DEF144D0()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1DEF144DC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DEF144E8()
{
  return MEMORY[0x1E0CB0200]();
}

uint64_t sub_1DEF144F4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DEF14500()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DEF1450C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DEF14518()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DEF14524()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DEF14530()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DEF1453C()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_1DEF14548()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DEF14554()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DEF14560()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DEF1456C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DEF14578()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DEF14584()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DEF14590()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DEF1459C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DEF145A8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DEF145B4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DEF145C0()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1DEF145CC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DEF145D8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1DEF145E4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DEF145F0()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DEF145FC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DEF14608()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DEF14614()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DEF14620()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DEF1462C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DEF14638()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DEF14644()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DEF14650()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DEF1465C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DEF14668()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DEF14674()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DEF14680()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1DEF1468C()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1DEF14698()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DEF146A4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DEF146B0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DEF146BC()
{
  return MEMORY[0x1E0DEDF40]();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C80098](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C800A8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1E0C800D8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1E0C800E0]();
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1E0C80100](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

int CCSymmetricKeyUnwrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  return MEMORY[0x1E0C802C8](*(_QWORD *)&algorithm, iv, ivLen, kek, kekLen, wrappedKey, wrappedKeyLen, rawKey);
}

int CCSymmetricKeyWrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  return MEMORY[0x1E0C802D0](*(_QWORD *)&algorithm, iv, ivLen, kek, kekLen, rawKey, rawKeyLen, wrappedKey);
}

size_t CCSymmetricUnwrappedSize(CCWrappingAlgorithm algorithm, size_t wrappedKeyLen)
{
  return MEMORY[0x1E0C802D8](*(_QWORD *)&algorithm, wrappedKeyLen);
}

size_t CCSymmetricWrappedSize(CCWrappingAlgorithm algorithm, size_t rawKeyLen)
{
  return MEMORY[0x1E0C802E0](*(_QWORD *)&algorithm, rawKeyLen);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

uint64_t SecCertificateCopyIssuerSequence()
{
  return MEMORY[0x1E0CD5F88]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFDataRef SecCertificateCopyNormalizedIssuerSequence(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5FA0](certificate);
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1E0CD5FC8]();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD5FD8](certificate, error);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x1E0CD6008]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x1E0CD6020]();
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1E0CD6028]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x1E0CD6030]();
}

uint64_t SecCertificateGetSubjectKeyID()
{
  return MEMORY[0x1E0CD6048]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1E0CD6050]();
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x1E0CD6058]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

uint64_t SecCertificateVersion()
{
  return MEMORY[0x1E0CD6080]();
}

uint64_t SecDistinguishedNameCopyNormalizedSequence()
{
  return MEMORY[0x1E0CD6250]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x1E0CD6278](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1E0CD6288]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6300](privateKey, algorithm, publicKey, parameters, error);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x1E0CD6310]();
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6340](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6358](key, algorithm, plaintext, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x1E0CD63D0]();
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x1E0CD6408]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1E0CD6710](trust, anchorCertificates);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x1E0CD6760](trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _SecSecuritydCopyWhoAmI()
{
  return MEMORY[0x1E0CD6800]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x1E0DE5870]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x1E0DE5878]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x1E0DE5880]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x1E0DE5888]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x1E0DE5890]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t asn1_abort()
{
  return MEMORY[0x1E0DE5898]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C821F0]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1E0C823D8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C823E8]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t copy_heim_any()
{
  return MEMORY[0x1E0DE58A0]();
}

uint64_t copy_heim_any_set()
{
  return MEMORY[0x1E0DE58A8]();
}

uint64_t der_copy_oid()
{
  return MEMORY[0x1E0DE58B8]();
}

uint64_t der_free_octet_string()
{
  return MEMORY[0x1E0DE58C0]();
}

uint64_t der_free_oid()
{
  return MEMORY[0x1E0DE58C8]();
}

uint64_t der_get_integer()
{
  return MEMORY[0x1E0DE58D0]();
}

uint64_t der_get_length()
{
  return MEMORY[0x1E0DE58D8]();
}

uint64_t der_get_octet_string_ber()
{
  return MEMORY[0x1E0DE58E0]();
}

uint64_t der_get_tag()
{
  return MEMORY[0x1E0DE58E8]();
}

uint64_t der_length_heim_integer()
{
  return MEMORY[0x1E0DE58F0]();
}

uint64_t der_put_heim_integer()
{
  return MEMORY[0x1E0DE58F8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

