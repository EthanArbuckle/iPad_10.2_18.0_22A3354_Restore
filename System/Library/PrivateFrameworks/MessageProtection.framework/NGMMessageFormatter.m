@implementation NGMMessageFormatter

+ (id)formatOutgoingMessageWithEncryptedPayload:(id)a3 ephemeral:(id)a4 signature:(id)a5 keyValidator:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NGMPBOuterMessage *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(NGMPBOuterMessage);
  -[NGMPBOuterMessage setEncryptedPayload:](v13, "setEncryptedPayload:", v12);

  objc_msgSend(v11, "dataRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NGMPBOuterMessage setEphemeralPubKey:](v13, "setEphemeralPubKey:", v14);
  -[NGMPBOuterMessage setSignature:](v13, "setSignature:", v10);

  -[NGMPBOuterMessage setKeyValidator:](v13, "setKeyValidator:", v9);
  -[NGMPBOuterMessage data](v13, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)formatOutgoingInnerMessageWithPayload:(id)a3 attributes:(id)a4 destinationIdentity:(id)a5 sendingIdentity:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NGMPBInnerMessage *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char v23;

  v11 = a3;
  v12 = a4;
  v23 = 0;
  v13 = a6;
  v14 = a5;
  v15 = objc_alloc_init(NGMPBInnerMessage);
  +[NGMReplayManager sharedManager](NGMReplayManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "counterForDestinationWithIdentityKey:sendingIdentity:error:success:", v14, v13, a7, &v23);

  -[NGMPBInnerMessage setCounter:](v15, "setCounter:", v17);
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", NGMEncryptedAttributeKTGossipData);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", NGMEncryptedAttributeKTGossipData);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMPBInnerMessage setKtGossipData:](v15, "setKtGossipData:", v19);

    }
  }
  if (v23)
  {
    -[NGMPBInnerMessage setMessage:](v15, "setMessage:", v11);
    -[NGMPBInnerMessage data](v15, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*a7)
    {
      MessageProtectionLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[NGMMessageFormatter formatOutgoingInnerMessageWithPayload:attributes:destinationIdentity:sendingIdentity:error:].cold.1(a7, v21);

    }
    else
    {
      MPLogAndAssignError(6, a7, CFSTR("Error while obtaining counter"));
    }
    v20 = 0;
  }

  return v20;
}

+ (void)formatOutgoingInnerMessageWithPayload:(id *)a1 attributes:(NSObject *)a2 destinationIdentity:sendingIdentity:error:.cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Error while obtaining counter %@", (uint8_t *)&v4, 0xCu);

}

@end
