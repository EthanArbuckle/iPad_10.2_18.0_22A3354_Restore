@implementation WFWordPressPostAction

- (void)generateHTMLFromInput:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke;
  v10[3] = &unk_24F8B9560;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v10);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void (**v82)(_QWORD);
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  void (**v113)(_QWORD);
  _QWORD *v114;
  _QWORD aBlock[4];
  id v116;
  id v117;
  id v118;
  id v119;
  WFWordPressPostAction *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  _QWORD *v130;
  char v131;
  _QWORD v132[5];
  id v133;
  _QWORD v134[4];
  id v135;
  _QWORD v136[4];
  id v137;
  _QWORD v138[4];
  id v139;

  v110 = a3;
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAccount"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v5;
  objc_msgSend(v5, "accountWithName:", v6);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v108, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "endpointURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v7, v10, v11, v12, v13, v14, v15, v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v4;
  objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v20, v17, CFSTR("WFWordPressBlogs"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Blog"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v21;
  objc_msgSend(v21, "objectMatchingKey:value:", CFSTR("blogName"), v22);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v106, "blogId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v17;
  WFDiskCacheKey(v17, v25, v26, v27, v28, v29, v30, v31, v24);
  v32 = objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Type"), objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x24BDBCF20];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectOfClasses:forKeyComponents:", v38, v32, CFSTR("WFWordPressPostTypes"), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = v39;
  objc_msgSend(v39, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = MEMORY[0x24BDAC760];
  v138[1] = 3221225472;
  v138[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke;
  v138[3] = &unk_24F8B3D48;
  v92 = v33;
  v139 = v92;
  objc_msgSend(v40, "if_compactMap:", v138);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstObject");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Format"), objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectOfClasses:forKeyComponents:", v46, v32, CFSTR("WFWordPressPostFormats"), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v136[0] = MEMORY[0x24BDAC760];
  v136[1] = 3221225472;
  v136[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2;
  v136[3] = &unk_24F8B3D70;
  v90 = v42;
  v91 = v47;
  v137 = v90;
  objc_msgSend(v47, "keysOfEntriesPassingTest:", v136);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "anyObject");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Status"), objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x24BDBCF20];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectOfClasses:forKeyComponents:", v53, v32, CFSTR("WFWordPressPostStatuses"), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v134[0] = MEMORY[0x24BDAC760];
  v134[1] = 3221225472;
  v134[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3;
  v134[3] = &unk_24F8B3D70;
  v88 = v49;
  v89 = v54;
  v135 = v88;
  objc_msgSend(v54, "keysOfEntriesPassingTest:", v134);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "anyObject");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Template"), objc_opt_class());
  v56 = objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x24BDBCF20];
  v59 = objc_opt_class();
  objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v32;
  objc_msgSend(v57, "objectOfClasses:forKeyComponents:", v60, v32, CFSTR("WFWordPressPageTemplates"), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v61;
  v87 = (void *)v56;
  objc_msgSend(v61, "objectForKey:", v56);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Title"), objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Excerpt"), objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Slug"), objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("AllowComments"), objc_opt_class());
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(","));
  v67 = objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Tags"), objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "componentsSeparatedByCharactersInSet:", v67);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "if_compactMap:", &__block_literal_global_18113);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Categories"), objc_opt_class());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v67;
  objc_msgSend(v71, "componentsSeparatedByCharactersInSet:", v67);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "if_compactMap:", &__block_literal_global_188);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("CustomFields"), objc_opt_class());
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3032000000;
  v132[3] = __Block_byref_object_copy__18115;
  v132[4] = __Block_byref_object_dispose__18116;
  v133 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_189;
  aBlock[3] = &unk_24F8B3EC8;
  v109 = v108;
  v116 = v109;
  v107 = v106;
  v117 = v107;
  v105 = v104;
  v118 = v105;
  v111 = v110;
  v119 = v111;
  v120 = self;
  v75 = v62;
  v121 = v75;
  v130 = v132;
  v103 = v102;
  v122 = v103;
  v101 = v100;
  v123 = v101;
  v131 = v66;
  v76 = v64;
  v124 = v76;
  v77 = v63;
  v125 = v77;
  v78 = v99;
  v126 = v78;
  v79 = v70;
  v127 = v79;
  v80 = v73;
  v128 = v80;
  v81 = v74;
  v129 = v81;
  v82 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFWordPressPostAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Date"), objc_opt_class());
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v83, "length"))
  {
    objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = MEMORY[0x24BDAC760];
    v112[1] = 3221225472;
    v112[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_14;
    v112[3] = &unk_24F8B3EF0;
    v114 = v132;
    v113 = v82;
    objc_msgSend(v84, "getObjectRepresentation:forClass:", v112, objc_opt_class());

  }
  else
  {
    v82[2](v82);
  }

  _Block_object_dispose(v132, 8);
}

- (void)initializeParameters
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)WFWordPressPostAction;
  -[WFWordPressPostAction initializeParameters](&v13, sel_initializeParameters);
  v15[0] = CFSTR("Blog");
  v15[1] = CFSTR("Type");
  v15[2] = CFSTR("Format");
  v15[3] = CFSTR("Status");
  v15[4] = CFSTR("Template");
  v15[5] = CFSTR("WFWordPressPostTags");
  v15[6] = CFSTR("Categories");
  v15[7] = CFSTR("Tags");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 8);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(v8, "setDataSource:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  -[WFWordPressPostAction updateHiddenStates](self, "updateHiddenStates");
}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWordPressPostAction;
  -[WFWordPressPostAction wasAddedToWorkflow:](&v12, sel_wasAddedToWorkflow_, v4);
  -[WFWordPressPostAction updateAccountMetadata](self, "updateAccountMetadata");
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __44__WFWordPressPostAction_wasAddedToWorkflow___block_invoke;
  v9 = &unk_24F8B76C8;
  objc_copyWeak(&v10, &location);
  +[WFAccount addAccountObserver:](WFWordPressAccount, "addAccountObserver:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction setObserver:](self, "setObserver:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWordPressPostAction;
  -[WFWordPressPostAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFWordPressPostAction observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFAccount removeAccountObserver:](WFWordPressAccount, "removeAccountObserver:", v4);

}

- (void)updateAccountMetadata
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  WFWordPressSessionManager *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  WFWordPressPostAction *v29;
  id obj;
  void *v31;
  _QWORD block[5];
  _QWORD v33[4];
  id v34;
  id v35;
  void *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  -[WFWordPressPostAction resourceManager](self, "resourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceObjectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_group_create();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = v5;
  objc_msgSend(v5, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v12 = objc_alloc_init(WFWordPressSessionManager);
        objc_msgSend(v11, "username");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setUsername:](v12, "setUsername:", v13);

        objc_msgSend(v11, "password");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setPassword:](v12, "setPassword:", v14);

        objc_msgSend(v11, "endpointURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setEndpointURL:](v12, "setEndpointURL:", v15);

        objc_msgSend(v11, "username");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endpointURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        WFDiskCacheKey(v16, v19, v20, v21, v22, v23, v24, v25, v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v6);
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke;
        v33[3] = &unk_24F8B7B28;
        v34 = v31;
        v35 = v26;
        v36 = v11;
        v37 = v6;
        v27 = v26;
        -[WFWordPressSessionManager getBlogsWithCompletionHandler:](v12, "getBlogsWithCompletionHandler:", v33);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_8;
  block[3] = &unk_24F8BB638;
  block[4] = v29;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFWordPressPostAction;
  v7 = -[WFWordPressPostAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Type")))
      -[WFWordPressPostAction updateHiddenStates](self, "updateHiddenStates");
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFAccount")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("Blog")))
    {
      -[WFWordPressPostAction updatePossibleStates](self, "updatePossibleStates");
    }
  }

  return v7;
}

- (void)updatePossibleStates
{
  id v2;

  -[WFWordPressPostAction parameters](self, "parameters");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_221_18098);

}

- (void)updateHiddenStates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  char v56;

  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v3;
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v7;
  objc_msgSend(v7, "endpointURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v8, v11, v12, v13, v14, v15, v16, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Blog"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectOfClasses:forKeyComponents:", v22, v18, CFSTR("WFWordPressBlogs"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v4;
  v49 = v23;
  v50 = v19;
  if (v24)
  {
    objc_msgSend(v19, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectMatchingKey:value:", CFSTR("blogName"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  objc_msgSend(v26, "blogId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v18, v29, v30, v31, v32, v33, v34, v35, v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x24BDBCF20];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectOfClasses:forKeyComponents:", v40, v36, CFSTR("WFWordPressPostTypes"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", CFSTR("attachment"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Type"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "labels");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("singular_name"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "value");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqual:", v46);

  -[WFWordPressPostAction parameters](self, "parameters");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __43__WFWordPressPostAction_updateHiddenStates__block_invoke;
  v55[3] = &__block_descriptor_33_e28_v32__0__WFParameter_8Q16_B24l;
  v56 = v47;
  objc_msgSend(v48, "enumerateObjectsUsingBlock:", v55);

}

- (id)suggestedTagsForTagField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v6;
  v54 = v5;
  if (v7)
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v9, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v9;
  objc_msgSend(v9, "endpointURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v10, v13, v14, v15, v16, v17, v18, v19, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Blog"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v24, v20, CFSTR("WFWordPressBlogs"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v25;
  v50 = v21;
  v27 = v4;
  if (v26)
  {
    objc_msgSend(v21, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectMatchingKey:value:", CFSTR("blogName"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  objc_msgSend(v29, "blogId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v20, v32, v33, v34, v35, v36, v37, v38, v31);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = CFSTR("Tags");
  v55[1] = CFSTR("Categories");
  v56[0] = CFSTR("WFWordPressPostTags");
  v56[1] = CFSTR("WFWordPressPostCategories");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDBCF20];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "key");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectOfClasses:forKeyComponents:", v43, v39, v45, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "if_compactMap:", &__block_literal_global_224);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[WFWordPressPostAction possibleStatesForEnumeration:](self, "possibleStatesForEnumeration:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)possibleStatesForEnumeration:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  void *v112;

  v4 = a3;
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endpointURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v11, v14, v15, v16, v17, v18, v19, v20, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectOfClasses:forKeyComponents:", v24, v21, CFSTR("WFWordPressBlogs"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v26, "isEqualToString:", CFSTR("Blog"));

  if ((_DWORD)v13)
  {
    objc_msgSend(v4, "setHidden:", (unint64_t)objc_msgSend(v25, "count") < 2);
    objc_msgSend(v25, "if_compactMap:", &__block_literal_global_226);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Blog"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v5;
    v97 = v28;
    v98 = v6;
    v95 = v7;
    if (v29)
    {
      objc_msgSend(v28, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectMatchingKey:value:", CFSTR("blogName"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }

    v96 = v31;
    objc_msgSend(v31, "blogId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    WFDiskCacheKey(v21, v34, v35, v36, v37, v38, v39, v40, v33);
    v41 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "key");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("Type"));

    v44 = (void *)MEMORY[0x24BDBCF20];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)v41;
    objc_msgSend(v100, "objectOfClasses:forKeyComponents:", v47, v41, CFSTR("WFWordPressPostTypes"), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v43)
    {

      objc_msgSend(v4, "setHidden:", (unint64_t)objc_msgSend(v49, "count") < 2);
      objc_msgSend(v49, "allKeys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = MEMORY[0x24BDAC760];
      v111[0] = MEMORY[0x24BDAC760];
      v111[1] = 3221225472;
      v111[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_2;
      v111[3] = &unk_24F8B6208;
      v112 = &unk_24F93C420;
      objc_msgSend(v50, "sortedArrayUsingComparator:", v111);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v109[0] = v51;
      v109[1] = 3221225472;
      v109[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_3;
      v109[3] = &unk_24F8B9220;
      v110 = v49;
      v53 = v49;
      objc_msgSend(v52, "if_compactMap:", v109);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = v112;
      v55 = v97;
      v6 = v98;
      v56 = (void *)v41;
      v7 = v95;
    }
    else
    {
      objc_msgSend(v48, "objectForKey:", CFSTR("attachment"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWordPressPostAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Type"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v57;
      objc_msgSend(v57, "labels");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("singular_name"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v58;
      objc_msgSend(v58, "value");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      objc_msgSend(v4, "key");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v60) = objc_msgSend(v63, "isEqualToString:", CFSTR("Format"));

      if ((_DWORD)v60)
      {
        v64 = (void *)MEMORY[0x24BDBCF20];
        v65 = objc_opt_class();
        objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "objectOfClasses:forKeyComponents:", v66, v99, CFSTR("WFWordPressPostFormats"), 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v67, "count") < 2)
          v68 = 1;
        else
          v68 = v62;
        objc_msgSend(v4, "setHidden:", v68);
        objc_msgSend(v67, "allKeys");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = MEMORY[0x24BDAC760];
        v107[0] = MEMORY[0x24BDAC760];
        v107[1] = 3221225472;
        v107[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_4;
        v107[3] = &unk_24F8B6208;
        v108 = &unk_24F93C438;
        objc_msgSend(v69, "sortedArrayUsingComparator:", v107);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        v105[0] = v70;
        v56 = v99;
        v105[1] = 3221225472;
        v105[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_5;
        v105[3] = &unk_24F8B9220;
        v106 = v67;
        v72 = v67;
        objc_msgSend(v71, "if_compactMap:", v105);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = v97;
        v6 = v98;
        v7 = v95;
      }
      else
      {
        objc_msgSend(v4, "key");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("Status"));

        v56 = v99;
        v7 = v95;
        if (v74)
        {
          v75 = (void *)MEMORY[0x24BDBCF20];
          v76 = objc_opt_class();
          objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "objectOfClasses:forKeyComponents:", v77, v99, CFSTR("WFWordPressPostStatuses"), 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v78, "count") < 2)
            v79 = 1;
          else
            v79 = v62;
          objc_msgSend(v4, "setHidden:", v79);
          objc_msgSend(v78, "allKeys");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = MEMORY[0x24BDAC760];
          v103[0] = MEMORY[0x24BDAC760];
          v103[1] = 3221225472;
          v103[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_6;
          v103[3] = &unk_24F8B6208;
          v104 = &unk_24F93C450;
          objc_msgSend(v80, "sortedArrayUsingComparator:", v103);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          v101[0] = v81;
          v56 = v99;
          v101[1] = 3221225472;
          v101[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_7;
          v101[3] = &unk_24F8B9220;
          v102 = v78;
          v83 = v78;
          objc_msgSend(v82, "if_compactMap:", v101);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v4, "key");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v84, "isEqualToString:", CFSTR("Template"));

          if (v85)
          {
            v86 = (void *)MEMORY[0x24BDBCF20];
            v87 = objc_opt_class();
            objc_msgSend(v86, "setWithObjects:", v87, objc_opt_class(), 0);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectOfClasses:forKeyComponents:", v88, v99, CFSTR("WFWordPressPageTemplates"), 0);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v89, "count") < 2)
              v90 = 1;
            else
              v90 = v62;
            objc_msgSend(v4, "setHidden:", v90);
            objc_msgSend(v89, "allKeys");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "if_compactMap:", &__block_literal_global_267);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v27 = 0;
          }
        }
        v55 = v97;
        v6 = v98;
      }
      v53 = v93;
      v54 = v94;
    }

    v5 = v100;
  }

  return v27;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "value", a3);
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "wordpressLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to post %2$@ on WordPress?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to post on WordPress?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong(&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BEC40C8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("singular_name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithValue:", v8);

  return v9;
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEC40C8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithValue:", v6);
  return v7;
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_7(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEC40C8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithValue:", v6);
  return v7;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "blogName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

uint64_t __50__WFWordPressPostAction_suggestedTagsForTagField___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

void __43__WFWordPressPostAction_updateHiddenStates__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("WFAccount")))
    goto LABEL_4;
  objc_msgSend(v7, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Blog")))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v7, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Type"));

  if ((v6 & 1) == 0)
    objc_msgSend(v7, "setHidden:", *(unsigned __int8 *)(a1 + 32));
LABEL_5:

}

void __45__WFWordPressPostAction_updatePossibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "reloadPossibleStates");

}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  WFWordPressSessionManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v33 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", v5, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressBlogs"), 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x24BDAC760];
    v35 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v35)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v11 = objc_alloc_init(WFWordPressSessionManager);
        objc_msgSend(*(id *)(a1 + 48), "username");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setUsername:](v11, "setUsername:", v12);

        objc_msgSend(*(id *)(a1 + 48), "password");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setPassword:](v11, "setPassword:", v13);

        objc_msgSend(v10, "endpointURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setEndpointURL:](v11, "setEndpointURL:", v14);

        objc_msgSend(v10, "blogId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWordPressSessionManager setBlogId:](v11, "setBlogId:", v15);

        v16 = *(void **)(a1 + 40);
        objc_msgSend(v10, "blogId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        WFDiskCacheKey(v16, v19, v20, v21, v22, v23, v24, v25, v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v56[0] = v8;
        v56[1] = 3221225472;
        v56[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_2;
        v56[3] = &unk_24F8B3F18;
        v57 = *(id *)(a1 + 32);
        v27 = v26;
        v58 = v27;
        v59 = *(id *)(a1 + 56);
        -[WFWordPressSessionManager getPostStatusesWithCompletionHandler:](v11, "getPostStatusesWithCompletionHandler:", v56);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v52[0] = v8;
        v52[1] = 3221225472;
        v52[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_3;
        v52[3] = &unk_24F8B3F18;
        v53 = *(id *)(a1 + 32);
        v28 = v27;
        v54 = v28;
        v55 = *(id *)(a1 + 56);
        -[WFWordPressSessionManager getPageTemplatesWithCompletionHandler:](v11, "getPageTemplatesWithCompletionHandler:", v52);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v48[0] = v8;
        v48[1] = 3221225472;
        v48[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_4;
        v48[3] = &unk_24F8B3F18;
        v49 = *(id *)(a1 + 32);
        v29 = v28;
        v50 = v29;
        v51 = *(id *)(a1 + 56);
        -[WFWordPressSessionManager getPostTypesWithCompletionHandler:](v11, "getPostTypesWithCompletionHandler:", v48);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v44[0] = v8;
        v44[1] = 3221225472;
        v44[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_5;
        v44[3] = &unk_24F8B3F18;
        v45 = *(id *)(a1 + 32);
        v30 = v29;
        v46 = v30;
        v47 = *(id *)(a1 + 56);
        -[WFWordPressSessionManager getPostFormatsWithCompletionHandler:](v11, "getPostFormatsWithCompletionHandler:", v44);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v40[0] = v8;
        v40[1] = 3221225472;
        v40[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_6;
        v40[3] = &unk_24F8BB348;
        v41 = *(id *)(a1 + 32);
        v31 = v30;
        v42 = v31;
        v43 = *(id *)(a1 + 56);
        -[WFWordPressSessionManager getTermsForTaxonomy:completionHandler:](v11, "getTermsForTaxonomy:completionHandler:", CFSTR("category"), v40);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v36[0] = v8;
        v36[1] = 3221225472;
        v36[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_7;
        v36[3] = &unk_24F8BB348;
        v37 = *(id *)(a1 + 32);
        v38 = v31;
        v39 = *(id *)(a1 + 56);
        v32 = v31;
        -[WFWordPressSessionManager getTermsForTaxonomy:completionHandler:](v11, "getTermsForTaxonomy:completionHandler:", CFSTR("post_tag"), v36);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateHiddenStates");
  return objc_msgSend(*(id *)(a1 + 32), "updatePossibleStates");
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPostStatuses"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPageTemplates"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPostTypes"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPostFormats"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPostCategories"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(_QWORD *)(a1 + 40), CFSTR("WFWordPressPostTags"), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __44__WFWordPressPostAction_wasAddedToWorkflow___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAccountMetadata");

}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("singular_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_189(uint64_t a1)
{
  WFWordPressSessionManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WFWordPressSessionManager *v13;
  WFWordPressSessionManager *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  WFWordPressSessionManager *v19;
  _QWORD v20[5];
  WFWordPressSessionManager *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  _QWORD v34[4];
  WFWordPressSessionManager *v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(WFWordPressSessionManager);
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setUsername:](v2, "setUsername:", v3);

  objc_msgSend(*(id *)(a1 + 32), "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setPassword:](v2, "setPassword:", v4);

  objc_msgSend(*(id *)(a1 + 40), "endpointURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFWordPressSessionManager setEndpointURL:](v2, "setEndpointURL:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endpointURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWordPressSessionManager setEndpointURL:](v2, "setEndpointURL:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "blogId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setBlogId:](v2, "setBlogId:", v7);

  objc_msgSend(*(id *)(a1 + 48), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("attachment"));

  if (v9)
  {
    v10 = *(void **)(a1 + 56);
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2_193;
    v34[3] = &unk_24F8B7680;
    v12 = *(_QWORD *)(a1 + 64);
    v35 = v2;
    v36 = v12;
    v13 = v2;
    objc_msgSend(v10, "generateCollectionByCoercingToItemClasses:completionHandler:", v11, v34);

    v14 = v35;
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 56);
    v15 = *(void **)(a1 + 64);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_7;
    v20[3] = &unk_24F8B3EA0;
    v20[4] = v15;
    v21 = v2;
    v22 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 144);
    v23 = v17;
    v32 = v18;
    v24 = *(id *)(a1 + 80);
    v25 = *(id *)(a1 + 88);
    v33 = *(_BYTE *)(a1 + 152);
    v26 = *(id *)(a1 + 96);
    v27 = *(id *)(a1 + 104);
    v28 = *(id *)(a1 + 112);
    v29 = *(id *)(a1 + 120);
    v30 = *(id *)(a1 + 128);
    v31 = *(id *)(a1 + 136);
    v19 = v2;
    objc_msgSend(v15, "generateHTMLFromInput:completionHandler:", v16, v20);

    v14 = v21;
  }

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2_193(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3_194;
  v6[3] = &unk_24F8B54C0;
  v7 = *(id *)(a1 + 32);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_6;
  v5[3] = &unk_24F8BAFA8;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "transformFileRepresentationsForType:usingBlock:completionHandler:", 0, v6, v5);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_8;
    aBlock[3] = &unk_24F8B3E78;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v23 = v5;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 128);
    v24 = v7;
    v34 = v8;
    v25 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 72);
    v35 = *(_BYTE *)(a1 + 136);
    v27 = *(id *)(a1 + 80);
    v28 = *(id *)(a1 + 88);
    v29 = *(id *)(a1 + 96);
    v30 = *(id *)(a1 + 104);
    v31 = *(id *)(a1 + 112);
    v9 = *(id *)(a1 + 120);
    v10 = *(_QWORD *)(a1 + 32);
    v32 = v9;
    v33 = v10;
    v11 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("ThumbnailImage"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_opt_class();
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_11;
      v16[3] = &unk_24F8B7308;
      v19 = v11;
      v14 = *(id *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 32);
      v17 = v14;
      v18 = v15;
      objc_msgSend(v12, "generateCollectionByCoercingToItemClass:completionHandler:", v13, v16);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
    }

  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_BYTE *)(a1 + 144);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = *(_OWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 120);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_9;
  v17[3] = &unk_24F8B3E50;
  v17[4] = v7;
  v18 = v3;
  LOBYTE(v14) = v11;
  objc_msgSend(v18, "createPostWithTitle:content:type:date:format:status:allowingComments:name:excerpt:template:tags:categories:thumbnailId:customFields:completionHandler:", v4, v5, v6, v8, v9, v10, v14, v16, v15, v12, a2, v13, v17);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_11(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_12;
  v6[3] = &unk_24F8BA0C0;
  v9 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v6, 0);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_13;
    v4[3] = &unk_24F8B3E00;
    v3 = *(void **)(a1 + 32);
    v4[4] = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v3, "uploadFile:completionHandler:", a2, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "fileId");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_10;
  v4[3] = &unk_24F8B3E28;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "getPost:completionHandler:", a2, v4);
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "link");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3_194(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4_195;
  v9[3] = &unk_24F8B3E00;
  v11 = v6;
  v10 = v7;
  v8 = v6;
  objc_msgSend(v10, "uploadFile:completionHandler:", a2, v9);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4_195(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "fileId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5_196;
    v5[3] = &unk_24F8B3DD8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "getPost:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5_196(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "link");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_2;
  v14[3] = &unk_24F8B6320;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v15 = v7;
  v16 = v8;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_7;
  v11[3] = &unk_24F8BB108;
  v12 = v7;
  v13 = v9;
  v10 = v7;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v14, v11);

}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_3;
    v18[3] = &unk_24F8B3D18;
    v19 = *(id *)(a1 + 32);
    v20 = v7;
    objc_msgSend(v6, "getObjectRepresentation:forClass:", v18, objc_opt_class());

    v8 = v19;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_4;
      v15[3] = &unk_24F8BA660;
      v17 = v7;
      v16 = *(id *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getFileRepresentation:forType:", v15, v9);

      v8 = v17;
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_5;
      v12[3] = &unk_24F8BA0C0;
      v11 = *(int8x16_t *)(a1 + 32);
      v10 = (id)v11.i64[0];
      v13 = vextq_s8(v11, v11, 8uLL);
      v14 = v7;
      objc_msgSend(v6, "getFileRepresentation:forType:", v12, 0);

      v8 = (void *)v13.i64[1];
    }
  }

}

uint64_t __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "appendString:", a2);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  const xmlDoc *Memory;
  xmlDoc *v9;
  xmlNodePtr RootElement;
  xmlNodePtr v11;
  void *v12;
  int v13;
  xmlNodePtr children;
  void *v15;
  int v16;
  void (*v17)(void);
  void *v18;
  void *v19;
  xmlNode *i;
  xmlBufferPtr v21;
  const xmlChar *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(a2, "mappedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v26 || !v6)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v7 = objc_retainAutorelease(v5);
    Memory = htmlReadMemory((const char *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0, 0, 2049);
    if (Memory)
    {
      v9 = (xmlDoc *)Memory;
      RootElement = xmlDocGetRootElement(Memory);
      if (RootElement)
      {
        v11 = RootElement;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", RootElement->name);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("html"));

        if (v13)
        {
          children = v11->children;
          if (children)
          {
            while (1)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", children->name);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("body"));

              if (v16)
                break;
              children = xmlNextElementSibling(children);
              if (!children)
                goto LABEL_9;
            }
            xmlDocSetRootElement(v9, children);
          }
          else
          {
LABEL_9:
            children = v11;
          }
          for (i = children->children; i; i = xmlNextElementSibling(i))
          {
            v21 = xmlBufferCreate();
            xmlNodeDump(v21, v9, i, 0, 0);
            v22 = xmlBufferContent(v21);
            v23 = xmlBufferLength(v21);
            v24 = *(void **)(a1 + 32);
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v22, v23, 4);
            objc_msgSend(v24, "appendString:", v25);

            xmlBufferFree(v21);
          }
        }
        else
        {
          v18 = *(void **)(a1 + 32);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
          objc_msgSend(v18, "appendString:", v19);

        }
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      }
      xmlFreeDoc(v9);
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v17();

}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_5(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WFWordPressSessionManager *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v3 = a2;
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "parameterForKey:", CFSTR("WFAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFAccount"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpointURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFDiskCacheKey(v8, v11, v12, v13, v14, v15, v16, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v21, v18, CFSTR("WFWordPressBlogs"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("Blog"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectMatchingKey:value:", CFSTR("blogName"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(WFWordPressSessionManager);
  objc_msgSend(v7, "username");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setUsername:](v25, "setUsername:", v26);

  objc_msgSend(v7, "password");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setPassword:](v25, "setPassword:", v27);

  objc_msgSend(v24, "endpointURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setEndpointURL:](v25, "setEndpointURL:", v28);

  objc_msgSend(v24, "blogId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWordPressSessionManager setBlogId:](v25, "setBlogId:", v29);

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_6;
  v30[3] = &unk_24F8B3E00;
  v31 = a1[5];
  v32 = a1[6];
  -[WFWordPressSessionManager uploadFile:completionHandler:](v25, "uploadFile:completionHandler:", v3, v30);

}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByEncodingHTMLEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByEncodingHTMLEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("<img src=\"%@\" alt=\"%@\">\n"), v9, v11);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
