@implementation WFAnnounceWrapper

- (WFAnnounceWrapper)init
{
  WFAnnounceWrapper *v2;
  void *v3;
  objc_class *v4;
  ANAnnounce *v5;
  ANAnnounce *announce;
  WFAnnounceWrapper *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)WFAnnounceWrapper;
  v2 = -[WFAnnounceWrapper init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getANAnnounceClass_softClass;
    v14 = getANAnnounceClass_softClass;
    if (!getANAnnounceClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getANAnnounceClass_block_invoke;
      v10[3] = &unk_24F8BB430;
      v10[4] = &v11;
      __getANAnnounceClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (ANAnnounce *)objc_alloc_init(v4);
    announce = v2->_announce;
    v2->_announce = v5;

    v7 = v2;
  }

  return v2;
}

- (void)prewarmWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAnnounceWrapper announce](self, "announce");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prewarmWithHandler:", v4);

}

- (void)invalidate
{
  id v2;

  -[WFAnnounceWrapper announce](self, "announce");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)requestAnnouncementWithAudioFileURL:(id)a3 homeAreaDescriptor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id ANAnnouncementDestinationClass;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v11 = (void *)getANAnnouncementContentClass_softClass;
  v40 = getANAnnouncementContentClass_softClass;
  v12 = MEMORY[0x24BDAC760];
  if (!getANAnnouncementContentClass_softClass)
  {
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __getANAnnouncementContentClass_block_invoke;
    v35 = &unk_24F8BB430;
    v36 = &v37;
    __getANAnnouncementContentClass_block_invoke((uint64_t)&v32);
    v11 = (void *)v38[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v13, "contentWithAudioFileURL:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "areaType");
  switch(v15)
  {
    case 2:
      ANAnnouncementDestinationClass = getANAnnouncementDestinationClass();
      objc_msgSend(v9, "homeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(ANAnnouncementDestinationClass, "destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:", v17, MEMORY[0x24BDBD1A8], v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 1:
      v22 = getANAnnouncementDestinationClass();
      objc_msgSend(v9, "homeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:", v17, v24, MEMORY[0x24BDBD1A8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 0:
      v16 = getANAnnouncementDestinationClass();
      objc_msgSend(v9, "homeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "destinationWithHomeIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_11;
  }
  v18 = 0;
LABEL_11:
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v25 = (void *)getANAnnouncementRequestClass_softClass;
  v40 = getANAnnouncementRequestClass_softClass;
  if (!getANAnnouncementRequestClass_softClass)
  {
    v32 = v12;
    v33 = 3221225472;
    v34 = __getANAnnouncementRequestClass_block_invoke;
    v35 = &unk_24F8BB430;
    v36 = &v37;
    __getANAnnouncementRequestClass_block_invoke((uint64_t)&v32);
    v25 = (void *)v38[3];
  }
  v26 = objc_retainAutorelease(v25);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v26, "requestWithContent:destination:", v14, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAnnounceWrapper announce](self, "announce");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __94__WFAnnounceWrapper_requestAnnouncementWithAudioFileURL_homeAreaDescriptor_completionHandler___block_invoke;
  v30[3] = &unk_24F8B13C8;
  v31 = v10;
  v29 = v10;
  objc_msgSend(v28, "sendRequest:completion:", v27, v30);

}

- (ANAnnounce)announce
{
  return self->_announce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announce, 0);
}

uint64_t __94__WFAnnounceWrapper_requestAnnouncementWithAudioFileURL_homeAreaDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (NSURL)sharedAnnouncementsDirectoryURL
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getHFUtilitiesClass_softClass;
  v9 = getHFUtilitiesClass_softClass;
  if (!getHFUtilitiesClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getHFUtilitiesClass_block_invoke;
    v5[3] = &unk_24F8BB430;
    v5[4] = &v6;
    __getHFUtilitiesClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedAnnouncementsDirectoryURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)afPreferencesLanguageCode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (NSString)currentSiriVoiceVSAssetName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "VSVoiceAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
