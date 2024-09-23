@implementation BBCommunicationContext(protobuf)

+ (id)communicationContextFromProtobuf:()protobuf
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v7);

  objc_msgSend(a1, "writeContentURLIfPossibleFromProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentURL:", v8);

  objc_msgSend(v4, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_compactMap:", &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipients:", v10);

  objc_msgSend(v4, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BE0FE40];
    objc_msgSend(v4, "sender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactFromProtobuf:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSender:", v14);

  }
  if (objc_msgSend(v4, "hasMentionsCurrentUser"))
    objc_msgSend(v5, "setMentionsCurrentUser:", objc_msgSend(v4, "mentionsCurrentUser"));
  if (objc_msgSend(v4, "hasNotifyRecipientAnyway"))
    objc_msgSend(v5, "setNotifyRecipientAnyway:", objc_msgSend(v4, "notifyRecipientAnyway"));
  if (objc_msgSend(v4, "hasReplyToCurrentUser"))
    objc_msgSend(v5, "setReplyToCurrentUser:", objc_msgSend(v4, "replyToCurrentUser"));
  if (objc_msgSend(v4, "hasRecipientCount"))
    objc_msgSend(v5, "setRecipientCount:", (int)objc_msgSend(v4, "recipientCount"));
  if (objc_msgSend(v4, "hasImageName"))
  {
    objc_msgSend(v4, "imageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageName:", v15);

  }
  if (objc_msgSend(v4, "hasSystemImage"))
    objc_msgSend(v5, "setSystemImage:", objc_msgSend(v4, "systemImage"));
  if (objc_msgSend(v4, "hasCapabilities"))
    objc_msgSend(v5, "setCapabilities:", (int)objc_msgSend(v4, "capabilities"));

  return v5;
}

+ (id)writeContentURLIfPossibleFromProtobuf:()protobuf
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasContentURLData"))
  {
    objc_msgSend(v3, "contentURLLocalFileLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "contentURLData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[BLTReferenceCountedFile retain:fileData:](BLTReferenceCountedFile, "retain:fileData:", v4, v5);

      if (v6)
      {
        v7 = v4;
LABEL_11:

        goto LABEL_12;
      }
      blt_general_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[BBCommunicationContext(protobuf) writeContentURLIfPossibleFromProtobuf:].cold.2();
    }
    else
    {
      blt_general_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[BBCommunicationContext(protobuf) writeContentURLIfPossibleFromProtobuf:].cold.1((uint64_t)v3, v8);
    }

    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (id)blt_protobuf
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v3);

  objc_msgSend(v2, "setBundleIdentifier:", &stru_24D766A58);
  objc_msgSend(a1, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayName:", v4);

  objc_msgSend(v2, "setMentionsCurrentUser:", objc_msgSend(a1, "mentionsCurrentUser"));
  objc_msgSend(v2, "setNotifyRecipientAnyway:", objc_msgSend(a1, "notifyRecipientAnyway"));
  objc_msgSend(v2, "setReplyToCurrentUser:", objc_msgSend(a1, "isReplyToCurrentUser"));
  objc_msgSend(v2, "setRecipientCount:", objc_msgSend(a1, "recipientCount"));
  objc_msgSend(v2, "setSystemImage:", objc_msgSend(a1, "systemImage"));
  objc_msgSend(a1, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageName:", v5);

  objc_msgSend(v2, "setCapabilities:", objc_msgSend(a1, "capabilities"));
  objc_msgSend(a1, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "blt_protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSender:", v8);

  }
  objc_msgSend(a1, "contentURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "imageDataForContentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setContentURLData:", v10);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "recipients", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "blt_protobuf");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v2, "addRecipients:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v2;
}

+ (void)writeContentURLIfPossibleFromProtobuf:()protobuf .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Error generating contentURL fileName for protobuf %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

+ (void)writeContentURLIfPossibleFromProtobuf:()protobuf .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "Error saving contentURLData to: %@ from protobuf %@");
  OUTLINED_FUNCTION_5();
}

@end
