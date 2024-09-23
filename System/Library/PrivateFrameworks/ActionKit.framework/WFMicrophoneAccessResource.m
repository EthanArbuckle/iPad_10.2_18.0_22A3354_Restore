@implementation WFMicrophoneAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Microphone"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x24BEC14E0], "workflowKitImageNamed:", CFSTR("Microphone"));
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getAVAudioSessionClass_softClass_33482;
  v19 = getAVAudioSessionClass_softClass_33482;
  v9 = MEMORY[0x24BDAC760];
  if (!getAVAudioSessionClass_softClass_33482)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getAVAudioSessionClass_block_invoke_33483;
    v15[3] = &unk_24F8BB430;
    v15[4] = &v16;
    __getAVAudioSessionClass_block_invoke_33483((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  v11 = (void *)objc_msgSend(v10, "performSelector:", sel_sharedInstance);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__WFMicrophoneAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v13[3] = &unk_24F8B6920;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "requestRecordPermission:", v13);

}

uint64_t __79__WFMicrophoneAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
