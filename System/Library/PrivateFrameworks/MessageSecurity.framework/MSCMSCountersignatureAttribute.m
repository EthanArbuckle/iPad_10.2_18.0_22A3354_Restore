@implementation MSCMSCountersignatureAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.6"), 0);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:LAContext:error:](self, "initWithAttribute:LAContext:error:", a3, 0, a4);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:error:](self, "initWithAttribute:certificates:LAContext:error:", a3, 0, a4, a5);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:](self, "initWithAttribute:certificates:LAContext:containingSignerInfo:error:", a3, a4, a5, 0, a6);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 containingSignerInfo:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  MSCMSCountersignatureAttribute *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  objc_super v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "attributeType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("1.2.840.113549.1.9.6"));

  if ((v17 & 1) != 0)
  {
    v43.receiver = self;
    v43.super_class = (Class)MSCMSCountersignatureAttribute;
    self = -[MSCMSCountersignatureAttribute init](&v43, sel_init);
    if (!self)
      goto LABEL_13;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    if (a7)
    {
      v18 = *a7;
      if (*a7)
        v18 = (id)objc_msgSend(v18, "copy");
    }
    else
    {
      v18 = 0;
    }
    v42 = v18;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__2;
    v35 = __Block_byref_object_dispose__2;
    v20 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v12, "attributeValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v36 = (id)objc_claimAutoreleasedReturnValue();

    -[MSCMSCountersignatureAttribute setContainingSignerInfo:](self, "setContainingSignerInfo:", v15);
    objc_msgSend(v12, "attributeValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __102__MSCMSCountersignatureAttribute_initWithAttribute_certificates_LAContext_containingSignerInfo_error___block_invoke;
    v25[3] = &unk_1EA962098;
    v29 = &v37;
    v26 = v13;
    v27 = v14;
    v28 = v15;
    v30 = &v31;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v25);

    v19 = (MSCMSCountersignatureAttribute *)objc_msgSend((id)v32[5], "count");
    if (v19)
    {
      objc_storeStrong((id *)&self->_signers, (id)v32[5]);
    }
    else if (a7)
    {
      v24 = (void *)v38[5];
      if (v24)
        *a7 = objc_retainAutorelease(v24);
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    if (v19)
    {
LABEL_13:
      self = self;
      v19 = self;
    }
  }
  else if (a7)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, *a7, CFSTR("Not a Countersignature attribute according to AttributeType"));
    v19 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __102__MSCMSCountersignatureAttribute_initWithAttribute_certificates_LAContext_containingSignerInfo_error___block_invoke(_QWORD *a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id obj;
  _OWORD v12[6];
  uint64_t v13;

  v13 = 0;
  memset(v12, 0, sizeof(v12));
  v3 = nsheim_decode_SignerInfo(a2);
  if (v3)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v3, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("unable to decode signerInfo in countersignature"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
    goto LABEL_4;
  }
  v4 = a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v6 + 40);
  +[MSCMSSignerInfo decodeSignerInfo:certificates:LAContext:error:](MSCMSCounterSignerInfo, "decodeSignerInfo:certificates:LAContext:error:", v12, v4, v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_msgSend(v7, "setContainingSignerInfo:", a1[6]);
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v7);
LABEL_4:

  }
  return free_SignerInfo();
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:](self, "initWithSignerInfo:signerChainMode:additionalCertificates:", a3, 1, 0);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 additionalCertificates:(id)a4
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:](self, "initWithSignerInfo:signerChainMode:additionalCertificates:", a3, 1, a4);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:](self, "initWithSignerInfo:signerChainMode:additionalCertificates:", a3, a4, 0);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4 additionalCertificates:(id)a5
{
  id v8;
  id v9;
  MSCMSCountersignatureAttribute *v10;
  uint64_t v11;
  NSArray *signers;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MSCMSCountersignatureAttribute;
  v10 = -[MSCMSCountersignatureAttribute init](&v14, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    signers = v10->_signers;
    v10->_signers = (NSArray *)v11;

    v10->_chainMode = a4;
    objc_storeStrong((id *)&v10->_additionalCertificates, a5);
  }

  return v10;
}

- (void)setContainingSignerInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_containingSignerInfo, v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MSCMSCountersignatureAttribute signers](self, "signers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContainingSignerInfo:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addSigner:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *signers;

  if (a3)
  {
    v4 = a3;
    -[MSCMSCountersignatureAttribute containingSignerInfo](self, "containingSignerInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContainingSignerInfo:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_signers);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v6, "addObject:", v4);

    signers = self->_signers;
    self->_signers = v6;

    -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", 1);
  }
}

- (void)addSigner:(id)a3 withCertificates:(id)a4
{
  id v6;
  MSCMSSignerInfo **p_containingSignerInfo;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v16)
  {
    -[MSCMSCountersignatureAttribute addSigner:](self, "addSigner:");
    p_containingSignerInfo = &self->_containingSignerInfo;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
    objc_msgSend(WeakRetained, "containingSignedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v6)
      {
        v10 = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
        objc_msgSend(v10, "containingSignedData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "certificates");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v6);

      }
      v13 = objc_loadWeakRetained((id *)p_containingSignerInfo);
      objc_msgSend(v13, "containingSignedData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)p_containingSignerInfo);
      objc_msgSend(v14, "addCounterSignerCertificates:mode:error:", v15, 1, 0);

    }
    else
    {
      -[MSCMSCountersignatureAttribute setAdditionalCertificates:](self, "setAdditionalCertificates:", v6);
      -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", 1);
    }
  }

}

- (void)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5
{
  MSCMSSignerInfo **p_containingSignerInfo;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[MSCMSCountersignatureAttribute addSigner:](self, "addSigner:", a3);
  p_containingSignerInfo = &self->_containingSignerInfo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
  objc_msgSend(WeakRetained, "containingSignedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
    objc_msgSend(v13, "containingSignedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)p_containingSignerInfo);
    objc_msgSend(v11, "addCounterSignerCertificates:mode:error:", v12, a4, a5);

  }
  else
  {
    -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", a4);
  }
}

- (void)removeSignerCertificatesWithIndexes:(id)a3
{
  NSArray *signers;
  _QWORD v4[5];

  signers = self->_signers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__MSCMSCountersignatureAttribute_removeSignerCertificatesWithIndexes___block_invoke;
  v4[3] = &unk_1EA9620C0;
  v4[4] = self;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](signers, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

void __70__MSCMSCountersignatureAttribute_removeSignerCertificatesWithIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "setContainingSignerInfo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "containingSignerInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containingSignedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "certificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "signerCertificate");

  objc_msgSend(v5, "removeObject:", v6);
}

- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4
{
  NSArray *v6;
  id signers;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_signers);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray removeObjectsAtIndexes:](v6, "removeObjectsAtIndexes:", v9);
    -[MSCMSCountersignatureAttribute removeSignerCertificatesWithIndexes:](self, "removeSignerCertificatesWithIndexes:", v9);
    signers = self->_signers;
    self->_signers = v6;
  }
  else
  {
    if (a4 && *a4)
      v8 = (void *)objc_msgSend(*a4, "copy");
    else
      v8 = 0;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v8, CFSTR("no signer with input certificate hash"));
    signers = (id)objc_claimAutoreleasedReturnValue();

    if (a4 && signers)
    {
      signers = objc_retainAutorelease(signers);
      *a4 = signers;
    }
  }

}

- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  NSArray *signers;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__MSCMSCountersignatureAttribute_removeSignersWithCertificate_error___block_invoke;
  v8[3] = &unk_1EA961CD0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v8);
  -[MSCMSCountersignatureAttribute removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v10[5], a4);
  _Block_object_dispose(&v9, 8);

}

void __69__MSCMSCountersignatureAttribute_removeSignersWithCertificate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
  {
    v9 = v5;
    v7 = objc_msgSend(v5, "signerCertificate");
    v6 = v9;
    if (v7)
    {
      v8 = CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)objc_msgSend(v9, "signerCertificate"));
      v6 = v9;
      if (v8)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addIndex:", a3);
        v6 = v9;
      }
    }
  }

}

- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *signers;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke;
  v12 = &unk_1EA961D20;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", &v9);
  -[MSCMSCountersignatureAttribute removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v16[5], a4, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

void __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a2, "signerCertificate");
  v7 = (id)SecCertificateCopyRFC822Names();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke_2;
  v8[3] = &unk_1EA961CF8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  void *v7;
  SecCertificateRef v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  v12 = v7;
  v8 = MSSecIdentityCopyCertificateWithError(a3, &v12);
  v9 = v12;

  if (v8)
  {
    v11 = v9;
    -[MSCMSCountersignatureAttribute removeSignersWithCertificate:error:](self, "removeSignersWithCertificate:error:", v8, &v11);
    v10 = v11;

    v9 = v10;
  }
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  if (v8)
    CFRelease(v8);

}

- (BOOL)verifyCountersignatures:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSArray *signers;
  void *v9;
  BOOL v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  if (a4)
  {
    v7 = *a4;
    if (*a4)
      v7 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v7 = 0;
  }
  v22 = v7;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  signers = self->_signers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__MSCMSCountersignatureAttribute_verifyCountersignatures_error___block_invoke;
  v12[3] = &unk_1EA9620E8;
  v12[5] = &v13;
  v12[6] = a4;
  v12[4] = &v17;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v12);
  if (a4)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __64__MSCMSCountersignatureAttribute_verifyCountersignatures_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "verifySignature:", a1[6]) & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("signature verification failed for signer %lu"), a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if ((objc_msgSend(v16, "verifyCountersignatures:", a1[6]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("countersignature verification failed for signer %lu"), a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[4] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && (objc_msgSend(v16, "verifyTimestamps:", a1[6]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("timestamp verification failed for signer %lu"), a3);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[4] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
  }

}

- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  BOOL v18;
  NSArray *signers;
  void *v20;
  BOOL v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  if (a7)
  {
    v16 = *a7;
    if (*a7)
      v16 = (id)objc_msgSend(v16, "copy");
  }
  else
  {
    v16 = 0;
  }
  v40 = v16;
  v17 = (id *)(v36 + 5);
  obj = (id)v36[5];
  v18 = -[MSCMSCountersignatureAttribute verifyCountersignatures:error:](self, "verifyCountersignatures:error:", v15, &obj);
  objc_storeStrong(v17, obj);
  if (v18)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    signers = self->_signers;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __133__MSCMSCountersignatureAttribute_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error___block_invoke;
    v24[3] = &unk_1EA962110;
    v25 = v12;
    v26 = v13;
    v27 = v14;
    v28 = &v35;
    v29 = &v30;
    -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v24);
    if (a7)
    {
      v20 = (void *)v36[5];
      if (v20)
        *a7 = objc_retainAutorelease(v20);
    }
    v21 = *((_BYTE *)v31 + 24) == 0;

    _Block_object_dispose(&v30, 8);
  }
  else if (a7 && (v22 = (void *)v36[5]) != 0)
  {
    v21 = 0;
    *a7 = objc_retainAutorelease(v22);
  }
  else
  {
    v21 = 0;
  }
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __133__MSCMSCountersignatureAttribute_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __SecTrust *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  CFIndex Code;
  CFErrorRef v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  CFErrorRef error;

  v3 = a2;
  error = 0;
  v4 = a1[4];
  objc_msgSend(v3, "verifyTime:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[6];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  v8 = (__SecTrust *)objc_msgSend(v3, "createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:", v4, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!v8)
    goto LABEL_12;
  if (!SecTrustEvaluateWithError(v8, &error))
  {
    if (error)
    {
      Code = CFErrorGetCode(error);
      v17 = error;
    }
    else
    {
      v17 = 0;
      Code = -1;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], Code, v17, CFSTR("trust evaluation of signer failed"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[7] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    goto LABEL_11;
  }
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  v12 = *(_QWORD *)(a1[7] + 8);
  v22 = *(id *)(v12 + 40);
  v13 = objc_msgSend(v3, "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:", v9, v10, v11, &v22);
  objc_storeStrong((id *)(v12 + 40), v22);
  if (!v13
    || (v14 = *(_QWORD *)(a1[7] + 8),
        v21 = *(id *)(v14 + 40),
        v15 = objc_msgSend(v3, "verifyTimestamps:", &v21),
        objc_storeStrong((id *)(v14 + 40), v21),
        !v15))
  {
LABEL_11:
    CFRelease(v8);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    goto LABEL_6;
  }
  CFRelease(v8);
LABEL_6:

}

- (id)encodeAttributeWithError:(id *)a3
{
  id v5;
  NSArray *signers;
  MSCMSAttribute *v7;
  void *v8;
  MSCMSAttribute *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_signers, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  if (a3)
  {
    v5 = *a3;
    if (*a3)
      v5 = (id)objc_msgSend(v5, "copy");
  }
  else
  {
    v5 = 0;
  }
  v18 = v5;
  signers = self->_signers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MSCMSCountersignatureAttribute_encodeAttributeWithError___block_invoke;
  v12[3] = &unk_1EA962138;
  v12[4] = &v13;
  v12[5] = &v19;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v12);
  if (objc_msgSend((id)v20[5], "count"))
  {
    v7 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.6"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MSCMSAttribute initWithAttributeType:values:](v7, "initWithAttributeType:values:", v8, v20[5]);

    if (!a3)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if (!a3)
      goto LABEL_11;
  }
  v10 = (void *)v14[5];
  if (v10)
    *a3 = objc_retainAutorelease(v10);
LABEL_11:
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __59__MSCMSCountersignatureAttribute_encodeAttributeWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  MSCMSCountersignatureAttribute *v28;
  SEL v29;
  id obj;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = malloc_type_malloc(0x68uLL, 0x10B00404EF9CE24uLL);
  objc_msgSend(v6, "containingSignerInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  v9 = (void *)v8;
  objc_msgSend(v6, "containingSignerInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v6, "encodeSignerInfo:error:", v7, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      v14 = length_SignerInfo();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v19 = 12;
        goto LABEL_9;
      }
      v16 = objc_retainAutorelease(v15);
      objc_msgSend(v16, "mutableBytes");
      v17 = encode_SignerInfo();
      if (v17)
      {
        v18 = v17;

        v19 = v18;
LABEL_9:
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CB2D50];
        v32[0] = CFSTR("Failed encoding type SignerInfo");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v19, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        goto LABEL_12;
      }
      if (v14)
      {
        v28 = (MSCMSCountersignatureAttribute *)asn1_abort();
        -[MSCMSCountersignatureAttribute containingSignerInfo](v28, v29);
        return;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);

    }
  }
  else
  {
LABEL_7:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, 0, CFSTR("counter signer has no reference to a signer with a signature"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
LABEL_12:
  free_SignerInfo();
  free(v7);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeAllObjects");
    *a4 = 1;
  }

}

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (NSArray)signers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)chainMode
{
  return self->_chainMode;
}

- (void)setChainMode:(unint64_t)a3
{
  self->_chainMode = a3;
}

- (NSArray)additionalCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCertificates, 0);
  objc_storeStrong((id *)&self->_signers, 0);
  objc_destroyWeak((id *)&self->_containingSignerInfo);
}

@end
