@implementation NSUserActivity

id __79__NSUserActivity_ContactsUICore___cnui_startAudioCallIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CBDC10];
  v3 = a2;
  v4 = [v2 alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v5, 1);
  return v6;
}

id __79__NSUserActivity_ContactsUICore___cnui_startVideoCallIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CBDC10];
  v3 = a2;
  v4 = [v2 alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v5, 2);
  return v6;
}

id __76__NSUserActivity_ContactsUICore___cnui_sendMessageIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CBDB80];
  v3 = a2;
  v4 = [v2 alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", v5, 1, 0, 0, 0, 0, 0, 0);
  return v6;
}

@end
