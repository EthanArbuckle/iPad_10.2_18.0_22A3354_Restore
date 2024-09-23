@implementation DeviceIdentityCreateHostSignatureWithCompletion

void __DeviceIdentityCreateHostSignatureWithCompletion_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFAllocator *v13;
  const __CFData *v14;
  SecCertificateRef v15;
  uint64_t v16;
  uint64_t v17;
  const __CFData *v18;
  SecCertificateRef v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id obj;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v33 = 0;
  vm_create_host_key_signature(v2, v3, &v33, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1813, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("Failed to create host key signature."), v7, v8, v30);
    v25 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1[7] + 8);
  v31 = *(id *)(v9 + 40);
  parseDERCertificatesFromChain(v6, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), v31);
  if (!v10 || objc_msgSend(v10, "count") != 2)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1819, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("Failed to parse certificate data."), v11, v12, v30);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v15 = 0;
LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v15 = SecCertificateCreateWithData(v13, v14);

  if (!v15)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1825, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."), v16, v17, v30);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v18 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v19 = SecCertificateCreateWithData(v13, v18);

  if (!v19)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1831, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."), v20, v21, v30);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15);

  if (!v22)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion_block_invoke", 1837, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode certificate chain."), v23, v24, (uint64_t)v19);
    v25 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_12:
    v26 = *(_QWORD *)(a1[7] + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    v22 = v10;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138543362;
    v35 = v28;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v29 = a1[6];
  if (v29)
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v29 + 16))(v29, v5, v22, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  if (v15)
    CFRelease(v15);
  if (v19)
    CFRelease(v19);

}

@end
