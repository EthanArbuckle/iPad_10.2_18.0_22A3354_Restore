@implementation MAEIssueDCRTWithCompletion

void __MAEIssueDCRTWithCompletion_block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  SecCertificateRef v11;
  SecCertificateRef v12;
  const __CFAllocator *v13;
  const __CFData *v14;
  const __CFData *v15;
  id v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_11;
  }
  v17 = 0;
  v9 = parseDERCertificatesFromChain(v5, &v17);
  v8 = v17;
  if (!v9)
  {
    v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 443, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v8, CFSTR("Failed to query certificate(s) from DER data."));

    v10 = 0;
    v11 = 0;
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = (const __CFData *)(id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = SecCertificateCreateWithData(v13, v14);

  if (!v11)
  {
    v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 449, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate from pem data."));

    v10 = 0;
    goto LABEL_9;
  }
  v15 = (const __CFData *)(id)objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v12 = SecCertificateCreateWithData(v13, v15);

  if (v12)
  {
    v18[0] = v11;
    v18[1] = v12;
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    goto LABEL_11;
  }
  v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 455, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate from pem data."));

  v10 = 0;
LABEL_10:
  v8 = v16;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v11)
    CFRelease(v11);
  if (v12)
    CFRelease(v12);

}

@end
