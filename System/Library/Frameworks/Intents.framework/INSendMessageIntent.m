@implementation INSendMessageIntent

- (INSendMessageIntent)initWithRecipients:(id)a3 content:(id)a4 serviceName:(id)a5 sender:(id)a6
{
  return -[INSendMessageIntent initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:](self, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", a3, 0, a4, 0, 0, a5, a6, 0);
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content groupName:(NSString *)groupName serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  NSArray *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  INPerson *v16;
  INSpeakableString *v17;
  INSendMessageIntent *v18;

  v12 = recipients;
  v13 = content;
  v14 = groupName;
  v15 = serviceName;
  v16 = sender;
  if (v14)
    v17 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", v14);
  else
    v17 = 0;
  v18 = -[INSendMessageIntent initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:](self, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:", v12, 0, v13, v17, 0, v15, v16);

  return v18;
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  return -[INSendMessageIntent initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:](self, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:", recipients, 0, content, speakableGroupName, conversationIdentifier, serviceName, sender);
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  return -[INSendMessageIntent initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:](self, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", recipients, outgoingMessageType, content, speakableGroupName, conversationIdentifier, serviceName, sender, 0);
}

- (NSString)groupName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "spokenPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v6;
}

- (void)setGroupName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INSpeakableString *v7;

  v4 = a3;
  v7 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", v4);

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpeakableGroupName:", v6);

}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("conversationIdentifier"), CFSTR("serviceName"), CFSTR("sender"), CFSTR("effect"), CFSTR("attachments"), CFSTR("outgoingMessageType"), CFSTR("notificationThreadIdentifier"), 0);
}

- (BOOL)_isValidSubProducer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[INSendMessageIntent sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6 ^ 1;
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 7;
}

- (id)_categoryVerb
{
  return CFSTR("Send");
}

- (int64_t)_preferredInteractionDirection
{
  return 1;
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender attachments:(NSArray *)attachments
{
  NSArray *v16;
  NSString *v17;
  INSpeakableString *v18;
  NSString *v19;
  NSString *v20;
  INPerson *v21;
  NSArray *v22;
  INSendMessageIntent *v23;
  INSendMessageIntent *v24;
  objc_super v26;

  v16 = recipients;
  v17 = content;
  v18 = speakableGroupName;
  v19 = conversationIdentifier;
  v20 = serviceName;
  v21 = sender;
  v22 = attachments;
  v26.receiver = self;
  v26.super_class = (Class)INSendMessageIntent;
  v23 = -[INIntent init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    -[INSendMessageIntent setRecipients:](v23, "setRecipients:", v16);
    -[INSendMessageIntent setOutgoingMessageType:](v24, "setOutgoingMessageType:", outgoingMessageType);
    -[INSendMessageIntent setContent:](v24, "setContent:", v17);
    -[INSendMessageIntent setSpeakableGroupName:](v24, "setSpeakableGroupName:", v18);
    -[INSendMessageIntent setConversationIdentifier:](v24, "setConversationIdentifier:", v19);
    -[INSendMessageIntent setServiceName:](v24, "setServiceName:", v20);
    -[INSendMessageIntent setSender:](v24, "setSender:", v21);
    -[INSendMessageIntent setAttachments:](v24, "setAttachments:", v22);
  }

  return v24;
}

- (NSArray)recipients
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setRecipients:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecipients:", v5);
}

- (INOutgoingMessageType)outgoingMessageType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INOutgoingMessageType v8;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOutgoingMessageType");
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "outgoingMessageType");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = INOutgoingMessageTypeUnknown;

  return v8;
}

- (void)setOutgoingMessageType:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasOutgoingMessageType:", 0);
  else
    objc_msgSend(v5, "setOutgoingMessageType:", v4);

}

- (NSString)content
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setContent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContent:", v5);
}

- (INSpeakableString)speakableGroupName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setSpeakableGroupName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSpeakableGroupName:", v5);
}

- (NSString)conversationIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setConversationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConversationIdentifier:", v4);

}

- (NSString)serviceName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setServiceName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceName:", v4);

}

- (INPerson)sender
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPerson *)v4;
}

- (void)setSender:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContact(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSender:", v5);
}

- (int64_t)effect
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEffect");
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effect") - 1;
  if (v6 <= 0xC)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setEffect:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 0xC)
    objc_msgSend(v4, "setHasEffect:", 0);
  else
    objc_msgSend(v4, "setEffect:");

}

- (NSArray)attachments
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromSendMessageAttachments(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAttachments:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSendMessageAttachments(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttachments:", v5);
}

- (NSString)notificationThreadIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationThreadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationThreadIdentifier:", v4);

}

- (NSString)alternativeConversationIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternativeConversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setAlternativeConversationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternativeConversationIdentifier:", v4);

}

- (id)_redactedDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[INSendMessageIntent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("<redacted>"), CFSTR("content"));
  return v3;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  INOutgoingMessageType v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("recipients");
  -[INSendMessageIntent recipients](self, "recipients");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = CFSTR("outgoingMessageType");
  v5 = -[INSendMessageIntent outgoingMessageType](self, "outgoingMessageType");
  v6 = CFSTR("unknown");
  if (v5 == INOutgoingMessageTypeOutgoingMessageAudio)
    v6 = CFSTR("outgoingMessageAudio");
  if (v5 == INOutgoingMessageTypeOutgoingMessageText)
    v6 = CFSTR("outgoingMessageText");
  v25 = v6;
  v28[1] = v25;
  v27[2] = CFSTR("content");
  -[INSendMessageIntent content](self, "content");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v7;
  v28[2] = v7;
  v27[3] = CFSTR("speakableGroupName");
  -[INSendMessageIntent speakableGroupName](self, "speakableGroupName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v28[3] = v9;
  v27[4] = CFSTR("conversationIdentifier");
  -[INSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v11;
  v27[5] = CFSTR("serviceName");
  -[INSendMessageIntent serviceName](self, "serviceName", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v4;
  v28[5] = v14;
  v27[6] = CFSTR("sender");
  -[INSendMessageIntent sender](self, "sender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v16;
  v27[7] = CFSTR("attachments");
  -[INSendMessageIntent attachments](self, "attachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v15)
  if (!v13)

  if (!v12)
  if (!v10)

  if (!v8)
  if (!v26)

  return v19;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  -[INSendMessageIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v9, a3, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRecipients:", v10);
  objc_msgSend(v7, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v11, a3, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContent:", v12);

  objc_msgSend(v7, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactFromContact(v13, a3, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSender:", v14);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)_keyCodableAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "attributeByName:", CFSTR("speakableGroupName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)INSendMessageIntent;
  -[INIntent _validParameterCombinationsWithSchema:](&v27, sel__validParameterCombinationsWithSchema_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", CFSTR("speakableGroupName"))
    && objc_msgSend(v5, "containsObject:", CFSTR("recipients")))
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E60];
    v7 = v4;
    v8 = [v6 alloc];
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __INCoalesceValidMessagingParameterCombinations_block_invoke;
    v28[3] = &unk_1E228E268;
    v29 = v10;
    v11 = v10;
    INDictionaryWithObjectsForKeysPassingTest(v7, v28);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("conversationIdentifier"))
    && ((objc_msgSend(v5, "containsObject:", CFSTR("speakableGroupName")) & 1) != 0
     || objc_msgSend(v5, "containsObject:", CFSTR("recipients"))))
  {
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v18, "containsObject:", CFSTR("speakableGroupName")) & 1) != 0
            || objc_msgSend(v18, "containsObject:", CFSTR("recipients")))
          {
            objc_msgSend(v4, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setByAddingObject:", CFSTR("conversationIdentifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v19, v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v15);
    }

    v5 = v22;
  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)_currentParameterCombination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("serviceName"), CFSTR("sender"), CFSTR("effect"), CFSTR("attachments"), CFSTR("messageType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("conversationIdentifier"));

  if (!v7)
    goto LABEL_4;
  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v4, "removeObject:", CFSTR("conversationIdentifier"));
    -[INIntent _parameterCombinations](self, "_parameterCombinations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_4:
      v12.receiver = self;
      v12.super_class = (Class)INSendMessageIntent;
      -[INIntent _currentParameterCombination](&v12, sel__currentParameterCombination);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (id)domain
{
  return CFSTR("Messages");
}

- (id)verb
{
  return CFSTR("SendMessage");
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[INSendMessageIntent recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        INPersonToCSPerson(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setPrimaryRecipients:", v8);
  NSStringFromSelector(sel_displayName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientNames:", v16);

  objc_msgSend(v8, "valueForKeyPath:", CFSTR("handles.@distinctUnionOfArrays.self"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientAddresses:", v17);

  -[INSendMessageIntent content](self, "content");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextContent:", v18);

  -[INSendMessageIntent sender](self, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contactIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v6, "setAccountIdentifier:", v20);
  }
  else
  {
    objc_msgSend(v19, "customIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccountIdentifier:", v21);

  }
  INPersonToCSPerson(v19);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
  {
    v37 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAuthors:", v24);

    objc_msgSend(v23, "handles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccountHandles:", v25);

  }
  -[INSendMessageIntent speakableGroupName](self, "speakableGroupName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "spokenPhrase");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "length"))
  {
    v36 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlternateNames:", v28);

  }
  v31.receiver = self;
  v31.super_class = (Class)INSendMessageIntent;
  v29 = -[INIntent configureAttributeSet:includingData:](&v31, sel_configureAttributeSet_includingData_, v6, v4);

  return v29;
}

- (id)_spotlightContentType
{
  __CFString *v2;

  v2 = CFSTR("com.apple.siri.interaction.message");
  return CFSTR("com.apple.siri.interaction.message");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_resolveOutgoingMessageTypeWithCompletionHandler:(id)a3
{
  INOutgoingMessageType v4;
  void (**v5)(id, uint64_t);
  uint64_t v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  v4 = -[INSendMessageIntent outgoingMessageType](self, "outgoingMessageType");
  if (v4 == INOutgoingMessageTypeOutgoingMessageAudio)
  {
    +[INIntentResolutionResult unsupported](INIntentResolutionResult, "unsupported");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    v8[2](v8, v6);

    goto LABEL_8;
  }
  if (v4 == INOutgoingMessageTypeOutgoingMessageText)
  {
    +[INOutgoingMessageTypeResolutionResult successWithResolvedOutgoingMessageType:](INOutgoingMessageTypeResolutionResult, "successWithResolvedOutgoingMessageType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = v8;
  if (v4 == INOutgoingMessageTypeUnknown)
  {
    v8[2](v8, 0);
LABEL_8:
    v5 = v8;
  }

}

@end
