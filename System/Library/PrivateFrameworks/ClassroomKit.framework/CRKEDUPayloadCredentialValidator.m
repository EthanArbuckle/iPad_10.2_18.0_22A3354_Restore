@implementation CRKEDUPayloadCredentialValidator

- (CRKEDUPayloadCredentialValidator)initWithPayload:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5
{
  id v9;
  CRKEDUPayloadCredentialValidator *v10;
  CRKEDUPayloadCredentialValidator *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKEDUPayloadCredentialValidator;
  v10 = -[CRKEDUPayloadCredentialValidator init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_payload, a3);
    v11->_stub = a4;
    v11->_ephemeralMultiUserDevice = a5;
  }

  return v11;
}

- (BOOL)areCredentialsValidWithError:(id *)a3
{
  if (-[CRKEDUPayloadCredentialValidator isStub](self, "isStub"))
    return 1;
  if (-[CRKEDUPayloadCredentialValidator isEphemeralMultiUserDevice](self, "isEphemeralMultiUserDevice"))
    return -[CRKEDUPayloadCredentialValidator areCredentialsValidForSharediPadDeviceWithError:](self, "areCredentialsValidForSharediPadDeviceWithError:", a3);
  return -[CRKEDUPayloadCredentialValidator areCredentialsValidForOneToOneDeviceWithError:](self, "areCredentialsValidForOneToOneDeviceWithError:", a3);
}

- (BOOL)areCredentialsValidForSharediPadDeviceWithError:(id *)a3
{
  _BOOL4 v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[CRKEDUPayloadCredentialValidator hasPayloadCertificate](self, "hasPayloadCertificate");
  v6 = v5 ^ -[CRKEDUPayloadCredentialValidator validateLeaderAnchorsWithError:](self, "validateLeaderAnchorsWithError:", 0);
  if (v6 == 1)
  {
    if (v5)
      v7 = CFSTR("PayloadCertificateUUID");
    else
      v7 = CFSTR("LeaderPayloadCertificateAnchorUUID");
    v8 = v7;
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = CFSTR("PayloadCertificateUUID");
    v12[1] = CFSTR("LeaderPayloadCertificateAnchorUUID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crk_allOrNoneKeysErrorWithProvidedKeys:allOrNoneKeys:", v9, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6 ^ 1;
}

- (BOOL)areCredentialsValidForOneToOneDeviceWithError:(id *)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  if (!-[CRKEDUPayloadCredentialValidator hasPayloadCertificate](self, "hasPayloadCertificate"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", CFSTR("PayloadCertificateUUID"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  v5 = -[CRKEDUPayloadCredentialValidator isStudent](self, "isStudent");
  v6 = -[CRKEDUPayloadCredentialValidator isInstructor](self, "isInstructor");
  if (v5 && v6)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      -[CRKEDUPayloadCredentialValidator payload](self, "payload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "crk_topLevelUserIsBothLeaderAndMemberErrorWithUserIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      *a3 = v10;

      return 0;
    }
    return 0;
  }
  if (!v5 && !v6)
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      -[CRKEDUPayloadCredentialValidator payload](self, "payload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "crk_topLevelUserIsNeitherLeaderNorMemberErrorWithUserIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    return 0;
  }
  if (v5)
    return -[CRKEDUPayloadCredentialValidator validateLeaderAnchorsWithError:](self, "validateLeaderAnchorsWithError:", a3);
  else
    return -[CRKEDUPayloadCredentialValidator validateMemberAnchorsWithError:](self, "validateMemberAnchorsWithError:", a3);
}

- (BOOL)validateMemberAnchorsWithError:(id *)a3
{
  return -[CRKEDUPayloadCredentialValidator validateAnchorsWithKeyPath:payloadKey:error:](self, "validateAnchorsWithKeyPath:payloadKey:error:", CFSTR("memberPayloadCertificateAnchorUUID"), CFSTR("MemberPayloadCertificateAnchorUUID"), a3);
}

- (BOOL)validateLeaderAnchorsWithError:(id *)a3
{
  return -[CRKEDUPayloadCredentialValidator validateAnchorsWithKeyPath:payloadKey:error:](self, "validateAnchorsWithKeyPath:payloadKey:error:", CFSTR("leaderPayloadCertificateAnchorUUID"), CFSTR("LeaderPayloadCertificateAnchorUUID"), a3);
}

- (BOOL)validateAnchorsWithKeyPath:(id)a3 payloadKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[CRKEDUPayloadCredentialValidator payload](self, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (!a5)
    {
      v13 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = objc_msgSend(v11, "count");
  v13 = v12 != 0;
  if (a5 && !v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crk_unsupportedValueErrorWithField:value:", v8, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = 0;
    *a5 = v14;
  }
LABEL_9:

  return v13;
}

- (BOOL)isInstructor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CRKEDUPayloadCredentialValidator payload](self, "payload", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("LeaderIdentifiers"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKEDUPayloadCredentialValidator payload](self, "payload");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isStudent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CRKEDUPayloadCredentialValidator payload](self, "payload", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("MemberIdentifiers"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKEDUPayloadCredentialValidator payload](self, "payload");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)hasPayloadCertificate
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CRKEDUPayloadCredentialValidator payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadCertificateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (CRKEDUPayload)payload
{
  return self->_payload;
}

- (BOOL)isStub
{
  return self->_stub;
}

- (BOOL)isEphemeralMultiUserDevice
{
  return self->_ephemeralMultiUserDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
