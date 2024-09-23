@implementation MFMimePart

id __50__MFMimePart_SMIMEDecoding__decodeMultipartSigned__block_invoke(uint64_t a1, _BYTE *a2, _BYTE *a3, void *a4, _QWORD *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a4;
  *a2 = 0;
  *a3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "signedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstChildPart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextSiblingPart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bodyData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mf_dataByConvertingUnixNewlinesToNetwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length") && v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_decodeEncodedData:detachedContentData:isEncrypted:isSigned:signers:error:", v13, v14, a2, a3, v9, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = v10;
    else
      v16 = 0;
    v17 = v16;
  }
  else
  {
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v15);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __56__MFMimePart_SMIMEDecoding__decodeApplicationPkcs7_mime__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "bodyData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_decodeEncodedData:detachedContentData:isEncrypted:isSigned:signers:error:", v10, 0, a2, a3, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v13, "mf_convertNetworkLineEndingsToUnix");
      objc_msgSend(v13, "mf_makeImmutable");
      v14 = v13;

      v15 = v14;
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
  }
  else
  {
    MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v14);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)_setSignatureInfo:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", v3, CFSTR("x-apple-smime-signature-info"));

}

- (void)_setSigners:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", v3, CFSTR("x-apple-smime-signers"));

}

- (void)_setSMIMEError:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", v3, CFSTR("x-apple-smime-error"));

}

MFMessageSigner *__74__MFMimePart_SMIMEDecoding___verifySignatureWithDecoder_signedData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  MFMessageSigner *v7;
  const void *v9;
  MFMessageSigner *v10;
  id obj;
  CFTypeRef cf;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (v6)
  {
LABEL_2:
    v7 = 0;
    goto LABEL_3;
  }
  obj = 0;
  cf = 0;
  v9 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_signingTrustForAddress:signatureInfo:encryptionTrust:error:", *(_QWORD *)(a1 + 40), v3, &cf, &obj);
  objc_storeStrong(v5, obj);
  if (!v9)
  {
    if (cf)
      CFRelease(cf);
    goto LABEL_2;
  }
  v10 = [MFMessageSigner alloc];
  v7 = -[MFMessageSigner initWithSender:signingTrust:encryptionTrust:verification:](v10, "initWithSender:signingTrust:encryptionTrust:verification:", *(_QWORD *)(a1 + 48), v9, cf, 1);
  CFRelease(v9);
  if (cf)
    CFRelease(cf);
LABEL_3:

  return v7;
}

- (BOOL)_needsSignatureVerification:(void *)a1
{
  _BOOL8 v2;
  id v4;
  void *v5;

  v2 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-error"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *a2 = v4;
    if (v4)
    {
      return 0;
    }
    else
    {
      objc_msgSend((id)v2, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-signers"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v5 == 0;

    }
  }
  return v2;
}

void __107__MFMimePart_SMIMEEncoding___encryptedDataUsingMessageSecurity_compositionSpecification_contentType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56) && (objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

      v8 = v9;
    }
    else
    {
      v13[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = objc_alloc(MEMORY[0x1E0D1E6A8]);
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAddress:certificate:capabilities:", v5, v11, v8);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
}

@end
