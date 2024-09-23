@implementation CUAppleIDClient

- (void)dealloc
{
  __SecCertificate *myCertificate;
  __SecIdentity *myIdentity;
  __SecKey *mySecretKey;
  __SecCertificate *peerCertificate;
  __SecKey *peerPublicKey;
  objc_super v8;

  myCertificate = self->_myCertificate;
  if (myCertificate)
  {
    CFRelease(myCertificate);
    self->_myCertificate = 0;
  }
  myIdentity = self->_myIdentity;
  if (myIdentity)
  {
    CFRelease(myIdentity);
    self->_myIdentity = 0;
  }
  mySecretKey = self->_mySecretKey;
  if (mySecretKey)
  {
    CFRelease(mySecretKey);
    self->_mySecretKey = 0;
  }
  peerCertificate = self->_peerCertificate;
  if (peerCertificate)
  {
    CFRelease(peerCertificate);
    self->_peerCertificate = 0;
  }
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    CFRelease(peerPublicKey);
    self->_peerPublicKey = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CUAppleIDClient;
  -[CUAppleIDClient dealloc](&v8, sel_dealloc);
}

- (void)setPeerAppleID:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *peerAppleIDs;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_peerAppleID, a3);
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = v6;
  }
  else
  {
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = 0;
  }

}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  return -[CUAppleIDClient signBytes:length:error:](self, "signBytes:length:error:", v7, v8, a4);
}

- (id)signBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __SecIdentity *v19;
  id v20;
  __SecKey *v21;
  size_t BlockSize;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t (**v32)();
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  size_t v48;
  id v49;
  id v50;
  id v51;
  size_t sigLen;
  uint8_t dataToSign[64];
  uint64_t (**v54)();
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient signBytes:length:error:]", 0x1Eu, (uint64_t)"Sign %zu bytes\n", (uint64_t)a5, v5, v6, v7, a4);
  }
  v51 = 0;
  sigLen = 0;
  v12 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", &v51);
  v13 = v51;
  v18 = v13;
  if (!v12)
    goto LABEL_22;
  v50 = v13;
  v19 = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", &v50);
  v20 = v50;

  if (!v19)
  {
    v18 = v20;
    goto LABEL_22;
  }
  v49 = v20;
  v21 = -[CUAppleIDClient _getMySecretKeyAndReturnError:](self, "_getMySecretKeyAndReturnError:", &v49);
  v18 = v49;

  if (!v21)
    goto LABEL_22;
  BlockSize = SecKeyGetBlockSize(v21);
  sigLen = BlockSize;
  if (BlockSize)
  {
    v29 = BlockSize;
    v30 = (uint8_t *)malloc_type_malloc(BlockSize, 0x362CB884uLL);
    if (v30)
    {
      v31 = v30;
      v32 = kCryptoHashDescriptor_SHA512;
      v71 = 0u;
      v72 = 0;
      v70 = 0u;
      v69 = 0u;
      v68 = 0u;
      v67 = 0u;
      v66 = 0u;
      v65 = 0u;
      v64 = 0u;
      v63 = 0u;
      v62 = 0u;
      v61 = 0u;
      v60 = 0u;
      v59 = 0u;
      v58 = 0u;
      v57 = 0u;
      v55 = 0u;
      v56 = 0u;
      v54 = kCryptoHashDescriptor_SHA512;
      ((void (*)(uint64_t))*kCryptoHashDescriptor_SHA512)((uint64_t)&v54);
      ((void (*)(uint64_t, const void *, CC_LONG))v32[1])((uint64_t)&v54, a3, a4);
      ((void (*)(uint64_t, unsigned __int8 *))v32[2])((uint64_t)&v54, dataToSign);
      v33 = SecKeyRawSign(v21, 1u, dataToSign, 0x40uLL, v31, &sigLen);
      if ((_DWORD)v33)
      {
        v47 = "Sign with AppleID failed";
      }
      else
      {
        v40 = objc_alloc(MEMORY[0x1E0C99D50]);
        v41 = objc_msgSend(v40, "initWithBytesNoCopy:length:", v31, sigLen);
        if (v41)
        {
          v42 = (void *)v41;

          v18 = 0;
          goto LABEL_13;
        }
        v48 = sigLen;
        v47 = "Alloc init AppleID signature failed (%zu bytes)";
        v33 = 4294960568;
      }
      NSErrorWithOSStatusF(v33, (uint64_t)v47, v34, v35, v36, v37, v38, v39, v48);
      v46 = objc_claimAutoreleasedReturnValue();

      free(v31);
      goto LABEL_21;
    }
    v48 = v29;
    v44 = "Malloc AppleID signature buffer failed (%zu bytes)";
    v45 = 4294960568;
  }
  else
  {
    v44 = "Get AppleID key size failed";
    v45 = 4294960553;
  }
  NSErrorWithOSStatusF(v45, (uint64_t)v44, v23, v24, v25, v26, v27, v28, v48);
  v46 = objc_claimAutoreleasedReturnValue();

LABEL_21:
  v18 = (id)v46;
LABEL_22:
  if (v18
    && gLogCategory_CUAppleIDClient <= 60
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient signBytes:length:error:]", 0x3Cu, (uint64_t)"### Sign failed (%zu bytes): %{error}\n", v14, v15, v16, v17, a4);
  }
  if (a5)
  {
    v18 = objc_retainAutorelease(v18);
    v42 = 0;
    *a5 = v18;
  }
  else
  {
    v42 = 0;
  }
LABEL_13:

  return v42;
}

- (BOOL)validatePeerWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSData *v18;
  dispatch_queue_t v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  dispatch_time_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  const __CFDictionary *v32;
  CFTypeID TypeID;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __SecCertificate *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __CFString *v64;
  _QWORD v65[4];
  NSObject *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;

  v9 = a3;
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient validatePeerWithFlags:error:]", 0x1Eu, (uint64_t)"Validate peer\n", v4, v5, v6, v7, (uint64_t)v64);
  }
  if (self->_peerValidated)
    return 1;
  if (self->_peerSignatureVerified)
  {
    v18 = self->_peerValidationData;
    if (!v18)
    {
      if (a4)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No peer validation data", v12, v13, v14, v15, v16, v17, (uint64_t)v64);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_52;
    }
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy_;
    v77 = __Block_byref_object_dispose_;
    v78 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 1;
    v19 = dispatch_queue_create("SFAppleIDQueue", 0);
    v20 = dispatch_semaphore_create(0);
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke;
    v65[3] = &unk_1E25DBF68;
    v67 = &v73;
    v68 = &v69;
    v21 = v20;
    v66 = v21;
    ((void (*)(void *, void *, void *))softLinkSFAppleIDParseValidationRecordData[0])(v18, v19, v65);
    v22 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v21, v22))
    {
      if (a4)
      {
        v29 = 4294960574;
LABEL_21:
        NSErrorWithOSStatusF(v29, (uint64_t)"Validate peer data failed", v23, v24, v25, v26, v27, v28, (uint64_t)v64);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

        _Block_object_dispose(&v69, 8);
        _Block_object_dispose(&v73, 8);

LABEL_52:
        return v11;
      }
      goto LABEL_23;
    }
    v30 = *((_DWORD *)v70 + 6);
    if (v30 || (v31 = (void *)v74[5]) == 0)
    {
      if (a4)
      {
        if (v30)
          v29 = v30;
        else
          v29 = 4294960596;
        goto LABEL_21;
      }
LABEL_23:
      v11 = 0;
      goto LABEL_51;
    }
    objc_storeStrong((id *)&self->_peerValidationDict, v31);
    v32 = (const __CFDictionary *)v74[5];
    TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v32, CFSTR("encDsID"), TypeID, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = -[CUAppleIDClient _getPeerCertificateAndReturnError:](self, "_getPeerCertificateAndReturnError:", a4);
      if (v41)
      {
        v64 = 0;
        LODWORD(v42) = SecCertificateCopyCommonName(v41, (CFStringRef *)&v64);
        v49 = v64;
        if ((_DWORD)v42 || !v64)
        {
          if (a4)
          {
            if ((_DWORD)v42)
              v42 = v42;
            else
              v42 = 4294960596;
            NSErrorWithOSStatusF(v42, (uint64_t)"Get peer certificate common name failed", v43, v44, v45, v46, v47, v48, (uint64_t)v64);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
        }
        else if ((-[__CFString hasSuffix:](v64, "hasSuffix:", v40) & 1) != 0)
        {
          if ((v9 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_49;
          }
          if (-[CUAppleIDClient _validatePeerHashes:](self, "_validatePeerHashes:", v74[5]))
          {
            v11 = 1;
            self->_peerValidated = 1;
LABEL_49:

            goto LABEL_50;
          }
          if (a4)
          {
            NSErrorWithOSStatusF(4294960588, (uint64_t)"Peer AppleID not found in hashes", v56, v57, v58, v59, v60, v61, (uint64_t)v64);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
        }
        else if (a4)
        {
          NSErrorWithOSStatusF(4294960552, (uint64_t)"Certificate DSID doesn't match validation info DSID", v50, v51, v52, v53, v54, v55, (uint64_t)v64);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
          v11 = 0;
          *a4 = v62;
          goto LABEL_49;
        }
        v11 = 0;
        goto LABEL_49;
      }
    }
    else if (a4)
    {
      NSErrorWithOSStatusF(4294960591, (uint64_t)"No peer validation info DSID", v34, v35, v36, v37, v38, v39, (uint64_t)v64);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

      goto LABEL_51;
    }
    v11 = 0;
    goto LABEL_50;
  }
  if (!a4)
    return 0;
  NSErrorWithOSStatusF(4294960551, (uint64_t)"Signature not verified. Use verifyData irst", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v64);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (BOOL)_validatePeerHashes:(id)a3
{
  uint64_t v4;
  char *v5;
  CC_LONG v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CFTypeID TypeID;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  const char *v28;
  CC_LONG v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  const char *v50;
  CC_LONG v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFTypeID v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  char v65;
  BOOL v66;
  void *v68;
  id v69;
  NSArray *obj;
  uint64_t v71;
  uint64_t v72;
  const __CFDictionary *v73;
  void *v74;
  uint64_t v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  unsigned __int8 v95[128];
  unsigned __int8 md[32];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v73 = (const __CFDictionary *)a3;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = self->_peerAppleIDs;
  v72 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v72)
  {
    v71 = *(_QWORD *)v90;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v71)
        objc_enumerationMutation(obj);
      v74 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v4);
      v75 = v4;
      objc_msgSend(v74, "lowercaseString");
      v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = (char *)objc_msgSend(v76, "UTF8String");
      v6 = strlen(v5);
      CC_SHA256(v5, v6, md);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
      if (gLogCategory_CUAppleIDClient <= 30
        && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating peer hash: %@\n", v7, v8, v9, v10, (uint64_t)v11);
      }
      TypeID = CFArrayGetTypeID();
      CFDictionaryGetTypedValue(v73, CFSTR("ValidatedEmailHashes"), TypeID, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v86;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v86 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              NSDataWithHex((char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"), -1, 22, 0, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (gLogCategory_CUAppleIDClient <= 30
                && (gLogCategory_CUAppleIDClient != -1
                 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
              {
                LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v20, v21, v22, v23, (uint64_t)v24);
              }
              v25 = objc_msgSend(v24, "isEqual:", v11);

              if ((v25 & 1) != 0)
              {
                LODWORD(v35) = 1;
                v36 = v14;
                goto LABEL_69;
              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
          if (v16)
            continue;
          break;
        }
      }

      if (strchr(v5, 64))
      {
        v26 = v74;
        CUNormalizeEmailAddress(v74, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "isEqual:", v76) & 1) == 0)
        {
          v68 = v27;
          v69 = objc_retainAutorelease(v27);
          v28 = (const char *)objc_msgSend(v69, "UTF8String");
          v29 = strlen(v28);
          CC_SHA256(v28, v29, md);
          v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

          if (gLogCategory_CUAppleIDClient <= 30
            && (gLogCategory_CUAppleIDClient != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating normalized peer hash: %@\n", v31, v32, v33, v34, v30);
          }
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v37 = v14;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v82;
LABEL_33:
            v41 = 0;
            while (1)
            {
              if (*(_QWORD *)v82 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v41);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                NSDataWithHex((char *)objc_msgSend(objc_retainAutorelease(v42), "UTF8String"), -1, 22, 0, 0);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (gLogCategory_CUAppleIDClient <= 30
                  && (gLogCategory_CUAppleIDClient != -1
                   || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v43, v44, v45, v46, (uint64_t)v47);
                }
                v48 = objc_msgSend(v47, "isEqual:", v30);

                if ((v48 & 1) != 0)
                  break;
              }
              if (v39 == ++v41)
              {
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
                if (v39)
                  goto LABEL_33;
                goto LABEL_44;
              }
            }
LABEL_66:
            LODWORD(v35) = 1;
LABEL_67:
            v36 = v69;
            goto LABEL_68;
          }
LABEL_44:

          v11 = (void *)v30;
          v26 = v74;
          v27 = v68;
        }

      }
      else
      {
        v26 = v74;
      }
      CUNormalizePhoneNumber(v26);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v36 = objc_retainAutorelease(v49);
        v50 = (const char *)objc_msgSend(v36, "UTF8String");
        v51 = strlen(v50);
        CC_SHA256(v50, v51, md);
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

        if (gLogCategory_CUAppleIDClient <= 30
          && (gLogCategory_CUAppleIDClient != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Validating peer phone hash: %@\n", v52, v53, v54, v55, v30);
        }
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v56 = CFArrayGetTypeID();
        CFDictionaryGetTypedValue(v73, CFSTR("ValidatedPhoneHashes"), v56, 0);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        if (v35)
        {
          v69 = v36;
          v57 = *(_QWORD *)v78;
LABEL_54:
          v58 = 0;
          while (1)
          {
            if (*(_QWORD *)v78 != v57)
              objc_enumerationMutation(v37);
            v59 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v58);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              NSDataWithHex((char *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String"), -1, 22, 0, 0);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (gLogCategory_CUAppleIDClient <= 30
                && (gLogCategory_CUAppleIDClient != -1
                 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
              {
                LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]", 0x1Eu, (uint64_t)"Attempting match against: %@\n", v60, v61, v62, v63, (uint64_t)v64);
              }
              v65 = objc_msgSend(v64, "isEqual:", v30);

              if ((v65 & 1) != 0)
                goto LABEL_66;
            }
            if (v35 == ++v58)
            {
              v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
              if (v35)
                goto LABEL_54;
              goto LABEL_67;
            }
          }
        }
LABEL_68:

        v11 = (void *)v30;
        goto LABEL_69;
      }
      v36 = 0;
      LODWORD(v35) = 0;
LABEL_69:

      if ((_DWORD)v35)
      {
        v66 = 1;
        goto LABEL_74;
      }
      v4 = v75 + 1;
      if (v75 + 1 == v72)
      {
        v72 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        if (v72)
          goto LABEL_3;
        break;
      }
    }
  }
  v66 = 0;
LABEL_74:

  return v66;
}

- (BOOL)verifyData:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  return -[CUAppleIDClient verifyBytes:verifyLength:signatureBytes:signatureLength:error:](self, "verifyBytes:verifyLength:signatureBytes:signatureLength:error:", v11, v12, v14, v15, a5);
}

- (BOOL)verifyBytes:(const void *)a3 verifyLength:(unint64_t)a4 signatureBytes:(const void *)a5 signatureLength:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7;
  __SecKey *v14;
  __SecKey *v15;
  uint64_t (**v16)();
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  uint8_t signedData[64];
  uint64_t (**v28)();
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUAppleIDClient, (uint64_t)"-[CUAppleIDClient verifyBytes:verifyLength:signatureBytes:signatureLength:error:]", 0x1Eu, (uint64_t)"Verify signature (%zu bytes data, %zu bytes signature)\n", (uint64_t)a5, a6, (uint64_t)a7, v7, a4);
  }
  v14 = -[CUAppleIDClient _getPeerPublicKeyAndReturnError:](self, "_getPeerPublicKeyAndReturnError:", a7);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = kCryptoHashDescriptor_SHA512;
  v45 = 0u;
  v46 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = kCryptoHashDescriptor_SHA512;
  ((void (*)(uint64_t))*kCryptoHashDescriptor_SHA512)((uint64_t)&v28);
  ((void (*)(uint64_t, const void *, CC_LONG))v16[1])((uint64_t)&v28, a3, a4);
  ((void (*)(uint64_t, unsigned __int8 *))v16[2])((uint64_t)&v28, signedData);
  v17 = SecKeyRawVerify(v15, 1u, signedData, 0x40uLL, (const uint8_t *)a5, a6);
  v24 = (_DWORD)v17 == 0;
  if ((_DWORD)v17)
  {
    if (a7)
    {
      NSErrorWithOSStatusF(v17, (uint64_t)"Verify data signature failed", v18, v19, v20, v21, v22, v23, v26);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    self->_peerSignatureVerified = 1;
  }
  return v24;
}

- (id)copyMyAppleIDAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  NSString *myAppleID;
  id v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  uint64_t v20;

  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient copyMyAppleIDAndReturnError:](myInfoClient, "copyMyAppleIDAndReturnError:", a3);
  myAppleID = self->_myAppleID;
  if (myAppleID)
    return myAppleID;
  if (AppleAccountLibrary_sOnce != -1)
    dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_149);
  v8 = objc_alloc_init((Class)getACAccountStoreClass[0]());
  objc_msgSend(v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "username");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = self->_myAppleID;
  self->_myAppleID = v10;

  v18 = self->_myAppleID;
  if (a3)
  {
    if (!v18)
    {
      NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID failed", v12, v13, v14, v15, v16, v17, v20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v18 = self->_myAppleID;
    }
  }
  v19 = (void *)-[NSString copy](v18, "copy");

  return v19;
}

- (__SecCertificate)_getMyCertificateAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  __SecCertificate *result;
  __SecCertificate **p_myCertificate;
  NSData *myCertificateData;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient _getMyCertificateAndReturnError:](myInfoClient, "_getMyCertificateAndReturnError:", a3);
  p_myCertificate = &self->_myCertificate;
  result = self->_myCertificate;
  if (!result)
  {
    myCertificateData = self->_myCertificateData;
    if (!myCertificateData)
    {
      result = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", a3);
      if (!result)
        return result;
      v16 = SecIdentityCopyCertificate(result, p_myCertificate);
      if ((_DWORD)v16)
      {
        if (!a3)
          return *p_myCertificate;
      }
      else
      {
        if (!a3 || *p_myCertificate)
          return *p_myCertificate;
        v16 = 4294960596;
      }
      v15 = "Get AppleID identity certificate failed";
LABEL_16:
      NSErrorWithOSStatusF(v16, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return *p_myCertificate;
    }
    result = SecCertificateCreateWithData(0, (CFDataRef)myCertificateData);
    *p_myCertificate = result;
    if (a3 && !result)
    {
      v15 = "Import my certificate failed";
      v16 = 4294960596;
      goto LABEL_16;
    }
  }
  return result;
}

- (id)copyMyCertificateDataAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  id result;
  NSData *myCertificateData;
  NSData *v8;
  NSData *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *v16;
  uint64_t v17;

  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient copyMyCertificateDataAndReturnError:](myInfoClient, "copyMyCertificateDataAndReturnError:", a3);
  myCertificateData = self->_myCertificateData;
  if (myCertificateData)
    return myCertificateData;
  result = -[CUAppleIDClient _getMyCertificateAndReturnError:](self, "_getMyCertificateAndReturnError:", a3);
  if (result)
  {
    v8 = (NSData *)SecCertificateCopyData((SecCertificateRef)result);
    v9 = self->_myCertificateData;
    self->_myCertificateData = v8;

    v16 = self->_myCertificateData;
    if (a3)
    {
      if (!v16)
      {
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Copy my certificate data failed", v10, v11, v12, v13, v14, v15, v17);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        v16 = self->_myCertificateData;
      }
    }
    return (id)-[NSData copy](v16, "copy");
  }
  return result;
}

- (__SecIdentity)_getMyIdentityAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  __SecIdentity *myIdentity;
  __SecIdentity *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __SecIdentity *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;

  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient _getMyIdentityAndReturnError:](myInfoClient, "_getMyIdentityAndReturnError:", a3);
  myIdentity = self->_myIdentity;
  if (!myIdentity)
  {
    if (self->_mySecretKey || self->_mySecretKeyData)
    {
      if (-[CUAppleIDClient _getMyCertificateAndReturnError:](self, "_getMyCertificateAndReturnError:", a3)
        && -[CUAppleIDClient _getMySecretKeyAndReturnError:](self, "_getMySecretKeyAndReturnError:", a3))
      {
        v8 = (__SecIdentity *)SecIdentityCreate();
        myIdentity = v8;
        self->_myIdentity = v8;
        if (a3)
        {
          if (!v8)
          {
            NSErrorWithOSStatusF(4294960596, (uint64_t)"Import my identity failed", v9, v10, v11, v12, v13, v14, v26);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            return self->_myIdentity;
          }
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      v15 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", a3);
      v16 = v15;
      if (v15)
      {
        v27 = 0;
        v17 = (__SecIdentity *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLink_AppleIDCopySecIdentityForAppleIDAccount[0])((uint64_t)v15, 0, (uint64_t)&v27);
        self->_myIdentity = v17;
        v24 = v27;
        if (a3 && !v17)
        {
          if (v27)
          {
            *a3 = objc_retainAutorelease(v27);
          }
          else
          {
            NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID identity failed", v18, v19, v20, v21, v22, v23, v26);
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a3 = v25;

          }
        }
        myIdentity = self->_myIdentity;

      }
      else
      {
        myIdentity = 0;
      }

    }
  }
  return myIdentity;
}

- (__SecKey)_getMySecretKeyAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  __SecKey **p_mySecretKey;
  __SecKey *mySecretKey;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  __SecKey *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __SecIdentity *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient _getMySecretKeyAndReturnError:](myInfoClient, "_getMySecretKeyAndReturnError:", a3);
  p_mySecretKey = &self->_mySecretKey;
  mySecretKey = self->_mySecretKey;
  if (!mySecretKey)
  {
    if (self->_mySecretKeyData)
    {
      v9 = self->_mySecretKeyType;
      v16 = v9;
      if (v9)
      {
        v17 = *MEMORY[0x1E0CD6A00];
        v18 = *MEMORY[0x1E0CD6A38];
        v38[0] = *MEMORY[0x1E0CD69F8];
        v38[1] = v18;
        v39[0] = v17;
        v39[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
        v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v20 = SecKeyCreateWithData((CFDataRef)self->_mySecretKeyData, v19, (CFErrorRef *)&v37);
        self->_mySecretKey = v20;
        v27 = v37;
        if (a3 && !v20)
        {
          if (v37)
          {
            *a3 = objc_retainAutorelease(v37);
          }
          else
          {
            NSErrorWithOSStatusF(4294960596, (uint64_t)"Import secret key failed", v21, v22, v23, v24, v25, v26, 0);
            v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a3 = v36;

          }
        }
        mySecretKey = *p_mySecretKey;

      }
      else if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"Secret key data without type", v10, v11, v12, v13, v14, v15, (uint64_t)v37);
        mySecretKey = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        mySecretKey = 0;
      }

      return mySecretKey;
    }
    v28 = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", a3);
    if (v28)
    {
      v29 = SecIdentityCopyPrivateKey(v28, &self->_mySecretKey);
      if ((_DWORD)v29)
      {
        if (!a3)
          return *p_mySecretKey;
      }
      else
      {
        if (!a3 || *p_mySecretKey)
          return *p_mySecretKey;
        v29 = 4294960596;
      }
      NSErrorWithOSStatusF(v29, (uint64_t)"Get AppleID key failed", v30, v31, v32, v33, v34, v35, (uint64_t)v37);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return *p_mySecretKey;
    }
    return 0;
  }
  return mySecretKey;
}

- (id)copyMyValidationDataAndReturnError:(id *)a3
{
  CUAppleIDClient *myInfoClient;
  NSData *myValidationData;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  id v17;
  CFTypeID TypeID;
  NSData *v19;
  NSData *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSData *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;

  myInfoClient = self->_myInfoClient;
  if (myInfoClient)
    return -[CUAppleIDClient copyMyValidationDataAndReturnError:](myInfoClient, "copyMyValidationDataAndReturnError:", a3);
  myValidationData = self->_myValidationData;
  if (myValidationData)
    return myValidationData;
  v8 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", a3);
  if (v8)
  {
    v31 = 0;
    v9 = getkAppleIDValidatedItemsRecordDataCertificateType[0]();
    v16 = (const __CFDictionary *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_AppleIDAuthenticationCopyCertificateInfo[0])((uint64_t)v8, v9, 0, (uint64_t)&v31);
    v17 = v31;
    if (v16)
    {
      TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v16, CFSTR("AppleIDAccountValidationRecordData"), TypeID, 0);
      v19 = (NSData *)objc_claimAutoreleasedReturnValue();
      v20 = self->_myValidationData;
      self->_myValidationData = v19;

      v27 = self->_myValidationData;
      if (a3)
      {
        if (!v27)
        {
          NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID validation record data failed", v21, v22, v23, v24, v25, v26, v30);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          v27 = self->_myValidationData;
        }
      }
      v28 = (void *)-[NSData copy](v27, "copy");
      goto LABEL_17;
    }
    if (a3)
    {
      if (v31)
      {
        v28 = 0;
        *a3 = objc_retainAutorelease(v31);
LABEL_17:

        goto LABEL_18;
      }
      NSErrorWithOSStatusF(4294960569, (uint64_t)"Get AppleID certificate info failed", v10, v11, v12, v13, v14, v15, v30);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v29;

    }
    v28 = 0;
    goto LABEL_17;
  }
  v28 = 0;
LABEL_18:

  return v28;
}

- (__SecCertificate)_getPeerCertificateAndReturnError:(id *)a3
{
  __SecCertificate *peerCertificate;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSData *v12;
  __SecCertificate *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  peerCertificate = self->_peerCertificate;
  if (!peerCertificate)
  {
    v12 = self->_peerCertificateData;
    if (v12)
    {
      v13 = SecCertificateCreateWithData(0, (CFDataRef)v12);
      peerCertificate = v13;
      self->_peerCertificate = v13;
      if (a3 && !v13)
      {
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Import peer certificate failed", v14, v15, v16, v17, v18, v19, v21);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        peerCertificate = self->_peerCertificate;
      }
    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960569, (uint64_t)"No peer certificate data", v6, v7, v8, v9, v10, v11, v21);
      peerCertificate = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      peerCertificate = 0;
    }

  }
  return peerCertificate;
}

- (__SecKey)_getPeerPublicKeyAndReturnError:(id *)a3
{
  __SecKey *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = self->_peerPublicKey;
  if (!result)
  {
    result = -[CUAppleIDClient _getPeerCertificateAndReturnError:](self, "_getPeerCertificateAndReturnError:");
    if (result)
    {
      result = SecCertificateCopyKey(result);
      self->_peerPublicKey = result;
      if (a3)
      {
        if (!result)
        {
          NSErrorWithOSStatusF(4294960596, (uint64_t)"Get peer public key from certificate failed", v6, v7, v8, v9, v10, v11, v12);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          return self->_peerPublicKey;
        }
      }
    }
  }
  return result;
}

- (int)securityLevel
{
  int securityLevel;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  securityLevel = self->_securityLevel;
  if (!securityLevel)
  {
    if (AppleAccountLibrary_sOnce != -1)
      dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_149);
    v4 = objc_alloc_init((Class)getACAccountStoreClass[0]());
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountPropertyForKey:", CFSTR("altDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((Class)getAKAccountManagerClass[0](), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "authKitAccountWithAltDSID:error:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        securityLevel = objc_msgSend(v7, "securityLevelForAccount:", v8);
        self->_securityLevel = securityLevel;
      }
      else
      {
        securityLevel = 0;
      }

    }
    else
    {
      securityLevel = 0;
    }

  }
  return securityLevel;
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CUAppleIDClient)myInfoClient
{
  return self->_myInfoClient;
}

- (void)setMyInfoClient:(id)a3
{
  objc_storeStrong((id *)&self->_myInfoClient, a3);
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (NSArray)peerAppleIDs
{
  return self->_peerAppleIDs;
}

- (void)setPeerAppleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)peerCertificateData
{
  return self->_peerCertificateData;
}

- (void)setPeerCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)peerValidationData
{
  return self->_peerValidationData;
}

- (void)setPeerValidationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)myCertificateData
{
  return self->_myCertificateData;
}

- (void)setMyCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)mySecretKeyData
{
  return self->_mySecretKeyData;
}

- (void)setMySecretKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)mySecretKeyType
{
  return self->_mySecretKeyType;
}

- (void)setMySecretKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mySecretKeyType, 0);
  objc_storeStrong((id *)&self->_mySecretKeyData, 0);
  objc_storeStrong((id *)&self->_myCertificateData, 0);
  objc_storeStrong((id *)&self->_peerValidationData, 0);
  objc_storeStrong((id *)&self->_peerCertificateData, 0);
  objc_storeStrong((id *)&self->_peerAppleIDs, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_peerValidationDict, 0);
  objc_storeStrong((id *)&self->_myValidationData, 0);
}

void __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
