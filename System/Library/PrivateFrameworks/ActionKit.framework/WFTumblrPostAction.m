@implementation WFTumblrPostAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTumblrPostAction;
  -[WFTumblrPostAction initializeParameters](&v4, sel_initializeParameters);
  -[WFTumblrPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFPostType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);
  -[WFTumblrPostAction updateTagsParameterHidden](self, "updateTagsParameterHidden");

}

- (TMAPIClient)client
{
  TMAPIClient *v3;
  TMAPIClient *client;
  void *v5;
  void *v6;

  if (!self->_client)
  {
    v3 = objc_alloc_init(TMAPIClient);
    client = self->_client;
    self->_client = v3;

  }
  +[WFTumblrAccessResource tumblrOAuthToken](WFTumblrAccessResource, "tumblrOAuthToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient setOAuthToken:](self->_client, "setOAuthToken:", v5);

  +[WFTumblrAccessResource tumblrOAuthTokenSecret](WFTumblrAccessResource, "tumblrOAuthTokenSecret");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient setOAuthTokenSecret:](self->_client, "setOAuthTokenSecret:", v6);

  -[TMAPIClient setOAuthConsumerKey:](self->_client, "setOAuthConsumerKey:", CFSTR("cwKKz80VhsmeSt3n8ORZFqZSqYejgTm7DKGRxM5ecescOhZjRw"));
  -[TMAPIClient setOAuthConsumerSecret:](self->_client, "setOAuthConsumerSecret:", CFSTR("TvXKq6PUXP2GldJBTKM99C4ly30vrKerTF3Cr5LNqy3J3gZBPf"));
  return self->_client;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  __CFString *v31;
  id v32;
  id v33;
  id v34;
  char v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  char v40;
  _QWORD v41[5];
  id v42;
  __CFString *v43;
  id v44;
  id v45;
  char v46;
  _QWORD v47[5];
  id v48;
  __CFString *v49;
  id v50;
  id v51;
  char v52;
  _QWORD v53[5];
  id v54;
  __CFString *v55;
  id v56;
  id v57;
  char v58;
  _QWORD v59[4];
  id v60;
  WFTumblrPostAction *v61;
  __CFString *v62;
  id v63;
  id v64;
  char v65;
  _QWORD aBlock[5];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPostType"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("photos")))
  {

    v5 = CFSTR("photo");
  }
  -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFComposeInApp"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFBlogName"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length")
    || v7
    && ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("photo")) & 1) != 0
     || (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("audio")) & 1) != 0
     || (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("video")) & 1) != 0))
  {
    v70[0] = CFSTR("Post Now");
    v70[1] = CFSTR("Save as Draft");
    v71[0] = CFSTR("published");
    v71[1] = CFSTR("draft");
    v70[2] = CFSTR("Add to Queue");
    v70[3] = CFSTR("Post Privately");
    v71[2] = CFSTR("queue");
    v71[3] = CFSTR("private");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v5, CFSTR("type"), v9, CFSTR("host"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPostState"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("state"));

    -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPostTags"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v14, CFSTR("tags"));

    v15 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8B6F10;
    aBlock[4] = self;
    v16 = _Block_copy(aBlock);
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("text")))
    {
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v15;
      v59[1] = 3221225472;
      v59[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_2;
      v59[3] = &unk_24F8B3358;
      v60 = v11;
      v61 = self;
      v65 = v7;
      v62 = v5;
      v63 = v9;
      v64 = v16;
      objc_msgSend(v29, "generateCollectionByCoercingToItemClasses:completionHandler:", v17, v59);

      v18 = v60;
    }
    else if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("quote")))
    {
      v53[0] = v15;
      v53[1] = 3221225472;
      v53[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_6;
      v53[3] = &unk_24F8B3380;
      v53[4] = self;
      v54 = v11;
      v58 = v7;
      v55 = v5;
      v56 = v9;
      v57 = v16;
      objc_msgSend(v29, "getStringRepresentation:", v53);

      v18 = v54;
    }
    else if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("link")))
    {
      v47[0] = v15;
      v47[1] = 3221225472;
      v47[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_7;
      v47[3] = &unk_24F8B33A8;
      v47[4] = self;
      v48 = v11;
      v52 = v7;
      v49 = v5;
      v50 = v9;
      v51 = v16;
      objc_msgSend(v29, "getObjectRepresentation:forClass:", v47, objc_opt_class());

      v18 = v48;
    }
    else if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("chat")))
    {
      v41[0] = v15;
      v41[1] = 3221225472;
      v41[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_8;
      v41[3] = &unk_24F8B3380;
      v41[4] = self;
      v42 = v11;
      v46 = v7;
      v43 = v5;
      v44 = v9;
      v45 = v16;
      objc_msgSend(v29, "getStringRepresentation:", v41);

      v18 = v42;
    }
    else
    {
      if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("photo")) & 1) == 0
        && (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("audio")) & 1) == 0
        && !-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("video")))
      {
        goto LABEL_23;
      }
      -[WFTumblrPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPostCaption"), objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v23, CFSTR("caption"));

      if (!-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("photo")))
      {
        v67[0] = CFSTR("audio");
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8470]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = CFSTR("video");
        v68[0] = v25;
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8498]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_16;
        v30[3] = &unk_24F8B3480;
        v30[4] = self;
        v35 = v7;
        v31 = v5;
        v32 = v9;
        v33 = v11;
        v34 = v16;
        objc_msgSend(v28, "objectForKey:", v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "getFileRepresentation:forType:", v30, v27);

        goto LABEL_23;
      }
      v24 = objc_opt_class();
      v36[0] = v15;
      v36[1] = 3221225472;
      v36[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_9;
      v36[3] = &unk_24F8B3458;
      v36[4] = self;
      v40 = v7;
      v37 = v9;
      v38 = v11;
      v39 = v16;
      objc_msgSend(v29, "generateCollectionByCoercingToItemClass:completionHandler:", v24, v36);

      v18 = v37;
    }

LABEL_23:
    goto LABEL_24;
  }
  v19 = (void *)MEMORY[0x24BDD1540];
  v20 = *MEMORY[0x24BEC4270];
  v72[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("No Blog"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v10;
  v72[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("You did not specify which blog to post to."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 5, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction finishRunningWithError:](self, "finishRunningWithError:", v22);

LABEL_24:
}

- (void)openFiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WFShareExtensionAction *v11;
  void *v12;
  void *v13;
  void *v14;
  WFShareExtensionAction *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addFile:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v11 = [WFShareExtensionAction alloc];
  -[WFTumblrPostAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction definition](self, "definition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction serializedParameters](self, "serializedParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFShareExtensionAction initWithIdentifier:definition:serializedParameters:](v11, "initWithIdentifier:definition:serializedParameters:", v12, v13, v14);

  -[WFTumblrPostAction processedParameters](self, "processedParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShareExtensionAction setProcessedParameters:](v15, "setProcessedParameters:", v16);

  -[WFTumblrPostAction userInterface](self, "userInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction runningDelegate](self, "runningDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction variableSource](self, "variableSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __32__WFTumblrPostAction_openFiles___block_invoke;
  v20[3] = &unk_24F8BAFA8;
  v20[4] = self;
  -[WFShareExtensionAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:](v15, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v5, v17, v18, v19, MEMORY[0x24BDAC9B8], v20);

}

- (void)openPostWithType:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setScheme:", CFSTR("tumblr"));
  objc_msgSend(v8, "setHost:", CFSTR("x-callback-url"));
  objc_msgSend(CFSTR("/"), "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPath:", v9);
  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPercentEncodedQuery:", v10);
  v11 = (void *)MEMORY[0x24BEC4238];
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction app](self, "app");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "schemes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction userInterface](self, "userInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction appDescriptor](self, "appDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = self;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke;
  v22[3] = &unk_24F8BA540;
  v22[4] = self;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke_2;
  v21[3] = &unk_24F8BB370;
  objc_msgSend(v11, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v12, v15, v16, v18, v22, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performRequest:", v19);

}

- (void)updateTagsParameterHidden
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WFTumblrPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFComposeInApp"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "number");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v10, "number");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    v5 = 1;
  }

  -[WFTumblrPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFPostType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFPostTags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(v6, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", objc_msgSend(&unk_24F93C360, "containsObject:", v9));

  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFTumblrPostAction;
  v7 = -[WFTumblrPostAction setParameterState:forKey:](&v10, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFPostType")))
      -[WFTumblrPostAction updateTagsParameterHidden](self, "updateTagsParameterHidden");
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFComposeInApp")))
    {
      -[WFTumblrPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFPostType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadPossibleStates");

    }
  }

  return v7;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "possibleStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFTumblrPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFComposeInApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "number");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = (void *)objc_msgSend(&unk_24F93C378, "mutableCopy");
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "removeObjectsInArray:", &unk_24F93C390);
  }
  else
  {
    v9 = (void *)objc_msgSend(&unk_24F93C378, "mutableCopy");
  }
  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_257);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Text");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Text")) & 1) != 0
    || (v5 = CFSTR("Quote"), (objc_msgSend(v4, "isEqualToString:", CFSTR("Quote")) & 1) != 0)
    || (v5 = CFSTR("Chat"), (objc_msgSend(v4, "isEqualToString:", CFSTR("Chat")) & 1) != 0)
    || (v5 = CFSTR("Photos"), (objc_msgSend(v4, "isEqualToString:", CFSTR("Photos")) & 1) != 0)
    || (v5 = CFSTR("Link"), (objc_msgSend(v4, "isEqualToString:", CFSTR("Link")) & 1) != 0)
    || (v5 = CFSTR("Audio"), (objc_msgSend(v4, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
    || (v5 = CFSTR("Video"), objc_msgSend(v4, "isEqualToString:", CFSTR("Video"))))
  {
    WFLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)inputsMultipleItems
{
  void *v2;
  void *v3;
  char v4;

  -[WFTumblrPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFPostType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Photos"));

  return v4;
}

- (id)inputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = &unk_24F93C3A8;
  v24[0] = objc_opt_class();
  v23[1] = &unk_24F93C3C0;
  v24[1] = objc_opt_class();
  v23[2] = &unk_24F93C3D8;
  v24[2] = objc_opt_class();
  v23[3] = &unk_24F93C3F0;
  v24[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTumblrPostAction workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFTumblrPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFPostType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
          objc_msgSend(v5, "value", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v6, "objectForKey:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v15;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  else
  {
    objc_msgSend(v3, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "tumblrLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to post %2$@ on Tumblr?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to post on Tumblr?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)generatedResourceNodes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)WFTumblrPostAction;
  -[WFTumblrPostAction generatedResourceNodes](&v27, sel_generatedResourceNodes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "resource", (_QWORD)v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v13 = v10;

          v7 = v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v14 = objc_alloc(MEMORY[0x24BEC3F40]);
  v15 = (void *)objc_msgSend(v14, "initWithParameterKey:parameterValues:relation:", CFSTR("WFComposeInApp"), &unk_24F93C408, *MEMORY[0x24BEC45E8]);
  v16 = objc_alloc(MEMORY[0x24BEC3FF8]);
  objc_msgSend(v7, "resource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3FF8]), "initWithResource:", v15);
  v28 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithResource:subnodes:", v17, v19);

  objc_msgSend(v4, "removeObject:", v7);
  objc_msgSend(v4, "addObject:", v20);
  v21 = v4;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

id __51__WFTumblrPostAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

uint64_t __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

uint64_t __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __32__WFTumblrPostAction_openFiles___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("errors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v9, "count");
  if (v6 && v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "code");
    v21 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v16;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFBlogName"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("post"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v19);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  void *v19;
  _QWORD v20[5];
  void *v21;
  _QWORD aBlock[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  char v28;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_3;
  aBlock[3] = &unk_24F8B3330;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v23 = v5;
  v24 = v6;
  v28 = *(_BYTE *)(a1 + 72);
  v25 = v7;
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 64);
  v8 = _Block_copy(aBlock);
  objc_msgSend(v3, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_4;
    v20[3] = &unk_24F8BA660;
    v12 = &v21;
    v20[4] = *(_QWORD *)(a1 + 40);
    v21 = v8;
    v13 = (void *)MEMORY[0x24BEC14A0];
    v14 = *MEMORY[0x24BDF83F8];
    v15 = v8;
    objc_msgSend(v13, "typeWithUTType:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getFileRepresentation:forType:", v20, v16);

  }
  else
  {
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_5;
    v18[3] = &unk_24F8B8018;
    v12 = &v19;
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v8;
    v17 = v8;
    objc_msgSend(v3, "getStringRepresentation:", v18);
  }

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "length"))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPostSource"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("source"));

    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, CFSTR("quote"));
    v8 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v8, "openPostWithType:withParameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v8, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "quote:parameters:callback:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (v17)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPostTitle"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("title"));

    v11 = *(void **)(a1 + 40);
    objc_msgSend(v17, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("url"));

    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPostDescription"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("description"));

    v15 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v15, "openPostWithType:withParameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v15, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "link:parameters:callback:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);
  }

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPostTitle"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("title"));

    if (*(_BYTE *)(a1 + 72))
      v8 = CFSTR("body");
    else
      v8 = CFSTR("conversation");
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v11, v8);
    v9 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v9, "openPostWithType:withParameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v9, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chat:parameters:callback:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  char v20;
  _QWORD v21[4];
  id v22;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v8 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8438]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, 0);

    objc_msgSend(v6, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_10;
    v21[3] = &unk_24F8B9FA0;
    v22 = v12;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_12;
    v16[3] = &unk_24F8B3430;
    v14 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v20 = *(_BYTE *)(a1 + 64);
    v17 = v14;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v15 = v12;
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v21, v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v7 = *(void **)(a1 + 32);
      v16[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "openFiles:", v8);
LABEL_10:

      goto LABEL_11;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("audio")))
    {
      objc_msgSend(*(id *)(a1 + 32), "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wfType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "MIMEType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audio:filePath:contentType:fileName:parameters:callback:", v9, v11, v13, v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("video")))
    {
      objc_msgSend(*(id *)(a1 + 32), "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wfType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "MIMEType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "video:filePath:contentType:fileName:parameters:callback:", v15, v11, v13, v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }
LABEL_11:

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "preferredFileType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8438]);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_11;
  v11[3] = &unk_24F8BA110;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v6, "getFileRepresentation:forType:", v11, v8);

}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v12, "count"))
  {
    v6 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v6, "openFiles:", v12);
    }
    else
    {
      objc_msgSend(v6, "client");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "if_map:", &__block_literal_global_15525);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "if_map:", &__block_literal_global_220);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "if_map:", &__block_literal_global_221);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photo:filePathArray:contentTypeArray:fileNameArray:parameters:callback:", v8, v9, v10, v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filename");
}

id __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "wfType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MIMEType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "parameterValueForKey:ofClass:", CFSTR("WFPostTitle"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("title"));

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, CFSTR("body"));
  v7 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v7, "openPostWithType:withParameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v7, "client");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text:parameters:callback:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));

  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v9, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:encoding:", v7, 4);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
