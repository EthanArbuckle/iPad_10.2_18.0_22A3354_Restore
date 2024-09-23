@implementation WFCreatePlaylistAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  WFCreatePlaylistAction *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFCreatePlaylistAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlaylistName"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCreatePlaylistAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlaylistAuthor"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCreatePlaylistAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlaylistDescription"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v8 = (void *)getMPMediaPlaylistCreationMetadataClass_softClass;
    v34 = getMPMediaPlaylistCreationMetadataClass_softClass;
    if (!getMPMediaPlaylistCreationMetadataClass_softClass)
    {
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __getMPMediaPlaylistCreationMetadataClass_block_invoke;
      v29 = &unk_24F8BB430;
      v30 = &v31;
      __getMPMediaPlaylistCreationMetadataClass_block_invoke((uint64_t)&v26);
      v8 = (void *)v32[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v31, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "initWithName:", v5);
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v10, "setAuthorDisplayName:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applicationBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedInfoDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAuthorDisplayName:", v17);

    }
    if (objc_msgSend(v7, "length"))
      v18 = v7;
    else
      v18 = 0;
    objc_msgSend(v10, "setDescriptionText:", v18);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v19 = (void *)getMPMediaLibraryClass_softClass_35833;
    v34 = getMPMediaLibraryClass_softClass_35833;
    if (!getMPMediaLibraryClass_softClass_35833)
    {
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __getMPMediaLibraryClass_block_invoke_35834;
      v29 = &unk_24F8BB430;
      v30 = &v31;
      __getMPMediaLibraryClass_block_invoke_35834((uint64_t)&v26);
      v19 = (void *)v32[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v20, "defaultMediaLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke;
    v23[3] = &unk_24F8B7278;
    v24 = v4;
    v25 = self;
    objc_msgSend(v21, "getPlaylistWithUUID:creationMetadata:completionHandler:", v22, v10, v23);

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No name was provided. Please provide a name for the playlist."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCreatePlaylistAction finishRunningWithError:](self, "finishRunningWithError:", v10);
  }

}

- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a new Music playlist?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke_2;
    v3[3] = &unk_24F8BAFA8;
    v2 = *(void **)(a1 + 32);
    v3[4] = *(_QWORD *)(a1 + 40);
    WFAddContentToPlaylist(a2, v2, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:");
  }
}

void __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
