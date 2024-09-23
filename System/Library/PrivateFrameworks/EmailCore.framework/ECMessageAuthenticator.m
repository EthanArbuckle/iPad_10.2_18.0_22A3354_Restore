@implementation ECMessageAuthenticator

- (ECMessageAuthenticator)initWithDKIMVerifier:(id)a3 dmarcVerifier:(id)a4
{
  id v7;
  id v8;
  ECMessageAuthenticator *v9;
  ECMessageAuthenticator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ECMessageAuthenticator;
  v9 = -[ECMessageAuthenticator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dkimVerifier, a3);
    objc_storeStrong((id *)&v10->_dmarcVerifier, a4);
  }

  return v10;
}

- (ECMessageAuthenticator)initWithDNSClient:(id)a3
{
  id v4;
  ECDKIMVerifier *v5;
  ECDMARCVerifier *v6;
  ECMessageAuthenticator *v7;

  v4 = a3;
  v5 = -[ECDKIMVerifier initWithPublicKeySource:]([ECDKIMVerifier alloc], "initWithPublicKeySource:", v4);
  v6 = -[ECDMARCVerifier initWithRecordSource:]([ECDMARCVerifier alloc], "initWithRecordSource:", v4);
  v7 = -[ECMessageAuthenticator initWithDKIMVerifier:dmarcVerifier:](self, "initWithDKIMVerifier:dmarcVerifier:", v5, v6);

  return v7;
}

- (ECMessageAuthenticator)init
{
  ECDNSClient *v3;
  ECMessageAuthenticator *v4;

  v3 = objc_alloc_init(ECDNSClient);
  v4 = -[ECMessageAuthenticator initWithDNSClient:](self, "initWithDNSClient:", v3);

  return v4;
}

- (id)authenticateMessageData:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ECMessageAuthenticationResult *v18;
  uint64_t v19;
  ECMessageAuthenticationResult *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43 = v6;
  objc_msgSend(v7, "emailAddressValue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v46 = v10;

  -[ECMessageAuthenticator dkimVerifier](self, "dkimVerifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = 0;
  objc_msgSend(v11, "verifiableMessageForMessageData:dkimSignatureHeaders:error:", v6, &v56, &v55);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v56;
  v44 = v55;

  if (v47)
  {
    objc_msgSend(v46, "emailAddressValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v46, "emailAddressValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      v54 = 0;
      +[ECDMARCVerifier partitionDKIMSignatureHeadersByIdentifierAlignment:forSender:strictAligned:relaxedAligned:unaligned:](ECDMARCVerifier, "partitionDKIMSignatureHeadersByIdentifierAlignment:forSender:strictAligned:relaxedAligned:unaligned:", v45, v13, &v54, &v53, 0);
      v14 = v54;
      v15 = v53;

      v16 = v14;
      v17 = v15;
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v42 = v17;
    -[ECMessageAuthenticator _verifyMessage:withSender:strictlyAlignedDKIMSignatureHeaders:relaxedAlignedDKIMSignatureHeaders:dkimVerifierOptions:](self, "_verifyMessage:withSender:strictlyAlignedDKIMSignatureHeaders:relaxedAlignedDKIMSignatureHeaders:dkimVerifierOptions:", v47, v46, v16);
    v18 = (ECMessageAuthenticationResult *)objc_claimAutoreleasedReturnValue();
    if (!-[ECMessageAuthenticationResult dkimHeadersVerified](v18, "dkimHeadersVerified"))
    {
      -[ECMessageAuthenticator _verifyMessage:withSender:strictlyAlignedDKIMSignatureHeaders:relaxedAlignedDKIMSignatureHeaders:dkimVerifierOptions:](self, "_verifyMessage:withSender:strictlyAlignedDKIMSignatureHeaders:relaxedAlignedDKIMSignatureHeaders:dkimVerifierOptions:", v47, v46, v41, v42, 1);
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (ECMessageAuthenticationResult *)v19;
    }
    if (!v18)
    {
      -[ECMessageAuthenticator _verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:](self, "_verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:", v47, v45, v46, 0, 7);
      v20 = (ECMessageAuthenticationResult *)objc_claimAutoreleasedReturnValue();
      if (-[ECMessageAuthenticationResult dkimHeadersVerified](v20, "dkimHeadersVerified"))
      {
        v18 = v20;
      }
      else
      {
        -[ECMessageAuthenticator _verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:](self, "_verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:", v47, v45, v46, 0, 1);
        v21 = objc_claimAutoreleasedReturnValue();

        v18 = (ECMessageAuthenticationResult *)v21;
      }
    }
    if (!-[ECMessageAuthenticationResult dkimAttemptedBodyVerification](v18, "dkimAttemptedBodyVerification"))
    {
      objc_msgSend(v47, "bodyData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length") == 0;

      if (!v23)
        -[ECMessageAuthenticationResult setDkimAttemptedBodyVerification:](v18, "setDkimAttemptedBodyVerification:", 1);
    }
    objc_msgSend(v47, "headers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ECHeaderAuthenticationResults authenticationResultsForRawHeaders:](ECHeaderAuthenticationResults, "authenticationResultsForRawHeaders:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v50;
      while (2)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v28);
          objc_msgSend(v29, "firstStatementForMethod:", CFSTR("dkim"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            -[ECMessageAuthenticationResult setDkimHasServerResult:](v18, "setDkimHasServerResult:", 1);
            objc_msgSend(v30, "result");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[ECMessageAuthenticationResult setDkimServerVerified:](v18, "setDkimServerVerified:", objc_msgSend(v31, "isEqualToString:", CFSTR("pass")));

            objc_msgSend(v30, "valueForPropertyType:property:", CFSTR("header"), CFSTR("d"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v32)
            {
              objc_msgSend(v30, "valueForPropertyType:property:", CFSTR("header"), CFSTR("i"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "length") && objc_msgSend(v33, "characterAtIndex:", 0) == 64)
              {
                objc_msgSend(v33, "substringFromIndex:", 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v33, "emailAddressValue");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "domain");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
            -[ECMessageAuthenticationResult setDkimServerSigningDomain:](v18, "setDkimServerSigningDomain:", v32);
            objc_msgSend(v30, "valueForPropertyType:property:", CFSTR("header"), CFSTR("s"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[ECMessageAuthenticationResult setDkimServerResultSelector:](v18, "setDkimServerResultSelector:", v35);

          }
          objc_msgSend(v29, "firstStatementForMethod:", CFSTR("dmarc"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            if (authenticateMessageData_sender__onceToken != -1)
              dispatch_once(&authenticateMessageData_sender__onceToken, &__block_literal_global_11);
            v37 = (void *)authenticateMessageData_sender__kDMARCStatusByResultString;
            objc_msgSend(v36, "result");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[ECMessageAuthenticationResult setDmarcServerStatus:](v18, "setDmarcServerStatus:", objc_msgSend(v39, "integerValue"));

          }
          if (-[ECMessageAuthenticationResult dkimHasServerResult](v18, "dkimHasServerResult")
            && -[ECMessageAuthenticationResult dmarcServerStatus](v18, "dmarcServerStatus"))
          {

            goto LABEL_41;
          }

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_41:

  }
  else
  {
    v18 = objc_alloc_init(ECMessageAuthenticationResult);
    -[ECMessageAuthenticationResult setDkimAttemptedHeaderVerification:](v18, "setDkimAttemptedHeaderVerification:", 0);
    -[ECMessageAuthenticationResult setDkimAttemptedBodyVerification:](v18, "setDkimAttemptedBodyVerification:", 0);
    -[ECMessageAuthenticationResult setBestDKIMSignatureHeader:](v18, "setBestDKIMSignatureHeader:", 0);
    -[ECMessageAuthenticationResult setDkimError:](v18, "setDkimError:", v44);
  }

  return v18;
}

void __57__ECMessageAuthenticator_authenticateMessageData_sender___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("none");
  v2[1] = CFSTR("pass");
  v3[0] = &unk_1E7135F90;
  v3[1] = &unk_1E7135FA8;
  v2[2] = CFSTR("fail");
  v2[3] = CFSTR("temperror");
  v3[2] = &unk_1E7135FC0;
  v3[3] = &unk_1E7135FD8;
  v2[4] = CFSTR("permerror");
  v3[4] = &unk_1E7135FF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)authenticateMessageData_sender__kDMARCStatusByResultString;
  authenticateMessageData_sender__kDMARCStatusByResultString = v0;

}

- (id)_verifyMessage:(id)a3 withSender:(id)a4 strictlyAlignedDKIMSignatureHeaders:(id)a5 relaxedAlignedDKIMSignatureHeaders:(id)a6 dkimVerifierOptions:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (objc_msgSend(v14, "count"))
  {
    -[ECMessageAuthenticator _verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:](self, "_verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:", v12, v14, v13, 2, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (objc_msgSend(v16, "dmarcStatus") == 2)
      goto LABEL_15;
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v15, "count"))
  {
    -[ECMessageAuthenticator _verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:](self, "_verifyMessage:withDKIMSignatureHeaders:sender:identifierAlignment:dkimVerifierOptions:", v12, v15, v13, 1, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      v20 = objc_msgSend(v18, "dmarcStatus");
      if (v20 == 2 || v20 == 3 && (v21 = objc_msgSend(v17, "dmarcStatus"), v21 <= 5) && ((1 << v21) & 0x33) != 0)
      {
        v22 = v19;

        v17 = v22;
      }
    }
    else
    {
      v17 = v18;
    }

  }
  v16 = v17;
LABEL_15:
  v23 = v16;

  return v23;
}

- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 sender:(id)a5 identifierAlignment:(int64_t)a6 dkimVerifierOptions:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  ECMessageAuthenticationResult *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24 = v12;
  v15 = objc_alloc_init(ECMessageAuthenticationResult);
  if (objc_msgSend(v13, "count"))
  {
    -[ECMessageAuthenticator dkimVerifier](self, "dkimVerifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v16, "verifyMessage:withDKIMSignatureHeaders:options:error:", v12, v13, a7, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;

  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  v25 = 0;
  objc_msgSend(v14, "emailAddressValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ECMessageAuthenticator dmarcVerifier](self, "dmarcVerifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "emailAddressValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "dmarcStatusForSender:dkimResult:identifierAlignment:receiverPolicy:", v21, v17 != 0, a6, &v25);

    if ((a7 & 1) == 0)
    {
LABEL_6:
      -[ECMessageAuthenticationResult setDkimAttemptedHeaderVerification:](v15, "setDkimAttemptedHeaderVerification:", 0);
      goto LABEL_9;
    }
  }
  else
  {
    v22 = 3;
    if ((a7 & 1) == 0)
      goto LABEL_6;
  }
  -[ECMessageAuthenticationResult setDkimAttemptedHeaderVerification:](v15, "setDkimAttemptedHeaderVerification:", 1);
  -[ECMessageAuthenticationResult setDkimHeadersVerified:](v15, "setDkimHeadersVerified:", v17 != 0);
LABEL_9:
  if ((a7 & 2) != 0)
  {
    -[ECMessageAuthenticationResult setDkimAttemptedBodyVerification:](v15, "setDkimAttemptedBodyVerification:", 1);
    -[ECMessageAuthenticationResult setDkimBodyVerified:](v15, "setDkimBodyVerified:", v17 != 0);
  }
  else
  {
    -[ECMessageAuthenticationResult setDkimAttemptedBodyVerification:](v15, "setDkimAttemptedBodyVerification:", 0);
  }
  -[ECMessageAuthenticationResult setBestDKIMSignatureHeader:](v15, "setBestDKIMSignatureHeader:", v17);
  -[ECMessageAuthenticationResult setDkimError:](v15, "setDkimError:", v18);
  -[ECMessageAuthenticationResult setDmarcStatus:](v15, "setDmarcStatus:", v22);
  -[ECMessageAuthenticationResult setDmarcReceiverPolicy:](v15, "setDmarcReceiverPolicy:", v25);
  -[ECMessageAuthenticationResult setDmarcIdentifierAlignment:](v15, "setDmarcIdentifierAlignment:", a6);

  return v15;
}

- (BOOL)_isErrorStatus:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (ECDKIMVerifier)dkimVerifier
{
  return self->_dkimVerifier;
}

- (ECDMARCVerifier)dmarcVerifier
{
  return self->_dmarcVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmarcVerifier, 0);
  objc_storeStrong((id *)&self->_dkimVerifier, 0);
}

@end
