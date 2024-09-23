@implementation SGDSuggestManagerInterface

+ (void)_addSGXPCResponseToReplyWhitelistForMethods:(objc_method_description *)a3 count:(unsigned int)a4 interface:(id)a5
{
  uint64_t v7;
  char **p_types;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;

  v37 = a5;
  if (a4)
  {
    v7 = a4;
    p_types = &a3->types;
    v9 = 0x1E0C99000uLL;
    do
    {
      v10 = (void *)MEMORY[0x1A8583A40]();
      v11 = (uint64_t)*(p_types - 1);
      v12 = *p_types;
      if (v11)
      {
        if (!v12)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDSuggestManagerInterface.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

        if (!v12)
        {
LABEL_15:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDSuggestManagerInterface.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("types"));

        }
      }
      objc_msgSend(*(id *)(v9 + 3544), "signatureWithObjCTypes:", v12);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (!strcmp((const char *)objc_msgSend(v13, "getArgumentTypeAtIndex:", objc_msgSend(v13, "numberOfArguments") - 1), "@?"))
      {
        v36 = v10;
        objc_msgSend(v37, "classesForSelector:argumentIndex:ofReply:", v11, 0, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "count")
          || objc_msgSend(v14, "count") == 1
          && (objc_msgSend(v14, "anyObject"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = (void *)objc_msgSend(v15, "alloc"),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v16,
              v15,
              (isKindOfClass & 1) != 0))
        {
          v35 = _classSetPool;
          v34 = objc_alloc(MEMORY[0x1E0C99E60]);
          v33 = objc_opt_class();
          v32 = objc_opt_class();
          v18 = objc_opt_class();
          v19 = v9;
          v20 = objc_opt_class();
          v21 = objc_opt_class();
          v22 = objc_opt_class();
          v29 = v20;
          v9 = v19;
          v23 = (void *)objc_msgSend(v34, "initWithObjects:", v33, v32, v18, v29, v21, v22, objc_opt_class(), 0);
          v24 = (void *)v35;
        }
        else
        {
          v25 = _classSetPool;
          objc_msgSend(v14, "setByAddingObject:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)v25;
        }
        objc_msgSend(v24, "intern:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v36;

        objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v26, v11, 0, 1);
      }

      objc_autoreleasePoolPop(v10);
      p_types += 2;
      --v7;
    }
    while (v7);
  }

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v3 = *(void **)(a1 + 32);
  v29 = a2;
  objc_msgSend(v3, "interface:returns:forSelector:", v29, objc_opt_class(), sel_contactFromRecordId_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_cnContactMatchesForRecordId_withCompletion_);
  v4 = (void *)_classSetPool;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "intern:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_cnContactMatchesForRecordIds_withCompletion_, 0, 0);

  v9 = (void *)_classSetPool;
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_msgSend(v9, "intern:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_cnContactMatchesForRecordIds_withCompletion_, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesWithContact_limitTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesWithContactIdentifier_limitTo_withCompletion_);
  v14 = (void *)_classSetPool;
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_msgSend(v14, "intern:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_contactMatchesWithContactIdentifiers_limitTo_withCompletion_, 0, 0);

  v19 = (void *)_classSetPool;
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  objc_msgSend(v19, "intern:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_contactMatchesWithContactIdentifiers_limitTo_withCompletion_, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesWithFullTextSearch_limitTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesWithMessagingPrefix_limitTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesByPhoneNumber_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesByEmailAddress_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_contactMatchesBySocialProfile_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_birthdayExtractionsForInterval_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_celebrationExtractionsForInterval_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v29, objc_opt_class(), sel_interactionStoreLookupForDetail_withCompletion_);
  v24 = (void *)_classSetPool;
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  objc_msgSend(v24, "intern:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_namesForDetailCacheSnapshotsWithCompletion_, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v29, objc_opt_class(), sel_allContactsWithSnippets_limitTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v29, objc_opt_class(), sel_originFromRecordId_completion_);

}

+ (void)interface:(id)a3 returnsArrayOf:(Class)a4 forSelector:(SEL)a5
{
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = (void *)_classSetPool;
  v8 = (objc_class *)MEMORY[0x1E0C99E60];
  v9 = a3;
  v10 = [v8 alloc];
  v11 = objc_opt_class();
  v13 = (id)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), a4, 0);
  objc_msgSend(v7, "intern:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, a5, 0, 1);

}

+ (void)interface:(id)a3 returns:(Class)a4 forSelector:(SEL)a5
{
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void *)_classSetPool;
  v8 = (objc_class *)MEMORY[0x1E0C99E60];
  v9 = a3;
  v11 = (id)objc_msgSend([v8 alloc], "initWithObjects:", a4, objc_opt_class(), 0);
  objc_msgSend(v7, "intern:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, a5, 0, 1);

}

+ (id)xpcInterfaceForProtocol:(id)a3
{
  Protocol *v4;
  void *v5;
  void *v6;
  id v7;
  Protocol *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  Protocol *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = (Protocol *)a3;
  objc_msgSend(a1, "_initialize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", protocol_getName(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4766;
  v20 = __Block_byref_object_dispose__4767;
  v21 = 0;
  v6 = (void *)_interfaces;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SGDSuggestManagerInterface_xpcInterfaceForProtocol___block_invoke;
  v11[3] = &unk_1E4761DE8;
  v14 = &v16;
  v7 = v5;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v15 = a1;
  objc_msgSend(v6, "runWithLockAcquired:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

+ (void)_initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_initialize_onceToken != -1)
    dispatch_once(&_initialize_onceToken, block);
}

void __54__SGDSuggestManagerInterface_xpcInterfaceForProtocol___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)a1[7];
    v10 = a1[5];
    v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v9, "_whitelistXPCInterface:forProtocol:alreadyWhitelisted:", v11, v10, v12);

    objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
  }

}

+ (void)_whitelistXPCInterface:(id)a3 forProtocol:(id)a4 alreadyWhitelisted:(id)a5
{
  id v8;
  Protocol *v9;
  id v10;
  void *v11;
  Protocol **v12;
  unint64_t i;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  unsigned int outCount;

  v8 = a3;
  v9 = (Protocol *)a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", protocol_getName(v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v10, "addObject:", v11);
    outCount = 0;
    v12 = protocol_copyProtocolList(v9, &outCount);
    if (outCount)
    {
      for (i = 0;
            i < outCount;
    }
    objc_msgSend((id)_whitelistBlocks, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend((id)_whitelistBlocks, "objectForKeyedSubscript:", v11);
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v15)[2](v15, v8);

    }
    free(v12);
    objc_msgSend(a1, "_addSGXPCResponseToReplyWhitelistForProtocol:interface:", v9, v8);
  }

}

+ (void)_addSGXPCResponseToReplyWhitelistForProtocol:(id)a3 interface:(id)a4
{
  id v6;
  Protocol *v7;
  objc_method_description *v8;
  objc_method_description *v9;
  unsigned int outCount;

  outCount = 0;
  v6 = a4;
  v7 = (Protocol *)a3;
  v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &outCount);
  objc_msgSend(a1, "_addSGXPCResponseToReplyWhitelistForMethods:count:interface:", v8, outCount, v6);
  free(v8);
  v9 = protocol_copyMethodDescriptionList(v7, 0, 1, &outCount);

  objc_msgSend(a1, "_addSGXPCResponseToReplyWhitelistForMethods:count:interface:", v9, outCount, v6);
  free(v9);
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;
  uint64_t v51;

  v2 = objc_opt_new();
  v3 = (void *)_whitelistBlocks;
  _whitelistBlocks = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815B8]), "initWithBehavior:copyWithZone:", 1, 0);
  v5 = (void *)_classSetPool;
  _classSetPool = v4;

  v6 = (void *)_classSetPool;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  objc_msgSend(v6, "intern:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0D815F0]);
  v18 = (void *)objc_opt_new();
  v19 = objc_msgSend(v17, "initWithGuardedData:", v18);
  v20 = (void *)_interfaces;
  _interfaces = v19;

  v21 = *(void **)(a1 + 32);
  v22 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_2;
  v49[3] = &unk_1E4761D40;
  v23 = v16;
  v24 = *(_QWORD *)(a1 + 32);
  v50 = v23;
  v51 = v24;
  objc_msgSend(v21, "_registerWhitelistBlock:forProtocol:", v49, &unk_1EE669A00);
  v25 = *(void **)(a1 + 32);
  v48[0] = v22;
  v48[1] = 3221225472;
  v48[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_3;
  v48[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v48[4] = v25;
  objc_msgSend(v25, "_registerWhitelistBlock:forProtocol:", v48, &unk_1EE669E98);
  v26 = *(void **)(a1 + 32);
  v47[0] = v22;
  v47[1] = 3221225472;
  v47[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_4;
  v47[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v47[4] = v26;
  objc_msgSend(v26, "_registerWhitelistBlock:forProtocol:", v47, &unk_1EE66A020);
  v27 = *(void **)(a1 + 32);
  v44[0] = v22;
  v44[1] = 3221225472;
  v44[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_5;
  v44[3] = &unk_1E4761D40;
  v46 = v27;
  v28 = v23;
  v45 = v28;
  objc_msgSend(v27, "_registerWhitelistBlock:forProtocol:", v44, &unk_1EE66ACC8);
  v29 = *(void **)(a1 + 32);
  v43[0] = v22;
  v43[1] = 3221225472;
  v43[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_6;
  v43[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v43[4] = v29;
  objc_msgSend(v29, "_registerWhitelistBlock:forProtocol:", v43, &unk_1EE66A550);
  v30 = *(void **)(a1 + 32);
  v42[0] = v22;
  v42[1] = 3221225472;
  v42[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_7;
  v42[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v42[4] = v30;
  objc_msgSend(v30, "_registerWhitelistBlock:forProtocol:", v42, &unk_1EE66A250);
  v31 = *(void **)(a1 + 32);
  v41[0] = v22;
  v41[1] = 3221225472;
  v41[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_8;
  v41[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v41[4] = v31;
  objc_msgSend(v31, "_registerWhitelistBlock:forProtocol:", v41, &unk_1EE66A400);
  v32 = *(void **)(a1 + 32);
  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_9;
  v40[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v40[4] = v32;
  objc_msgSend(v32, "_registerWhitelistBlock:forProtocol:", v40, &unk_1EE66A488);
  v33 = *(void **)(a1 + 32);
  v39[0] = v22;
  v39[1] = 3221225472;
  v39[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_10;
  v39[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v39[4] = v33;
  objc_msgSend(v33, "_registerWhitelistBlock:forProtocol:", v39, &unk_1EE669120);
  v34 = *(void **)(a1 + 32);
  v36[0] = v22;
  v36[1] = 3221225472;
  v36[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_11;
  v36[3] = &unk_1E4761D40;
  v37 = v28;
  v38 = v34;
  v35 = v28;
  objc_msgSend(v34, "_registerWhitelistBlock:forProtocol:", v36, &unk_1EE66AE50);
  objc_msgSend(*(id *)(a1 + 32), "_registerWhitelistBlock:forProtocol:", &__block_literal_global_4771, &unk_1EE66AF08);

}

+ (void)_registerWhitelistBlock:(id)a3 forProtocol:(id)a4
{
  Protocol *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *Name;
  void *v10;
  id v11;

  v5 = (Protocol *)a4;
  v11 = (id)objc_msgSend(a3, "copy");
  v6 = (void *)MEMORY[0x1A8583BFC]();
  v7 = (void *)_whitelistBlocks;
  v8 = (void *)MEMORY[0x1E0CB3940];
  Name = protocol_getName(v5);

  objc_msgSend(v8, "stringWithUTF8String:", Name);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v10);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_recentURLsWithLimit_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion_);

}

+ (id)xpcInterface
{
  return (id)objc_msgSend(a1, "xpcInterfaceForProtocol:", &unk_1EE66AF68);
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;

  v3 = *(_QWORD *)(a1 + 32);
  v75 = a2;
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_suggestionsFromSearchableItem_options_withCompletion_, 0, 1);
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_suggestionsFromSearchableItem_options_processingType_withCompletion_, 0, 1);
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_harvestedSuggestionsFromSearchableItem_options_withCompletion_, 0, 1);
  v4 = (void *)_classSetPool;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "intern:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_reportMessagesFound_lost_withCompletion_, 0, 0);

  v9 = (void *)_classSetPool;
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_msgSend(v9, "intern:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_reportMessagesFound_lost_withCompletion_, 1, 0);

  v14 = (void *)_classSetPool;
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_msgSend(v14, "intern:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updateMessages_state_completion_, 0, 0);

  v19 = (void *)_classSetPool;
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  objc_msgSend(v19, "intern:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_messagesToRefreshWithCompletion_, 0, 1);

  v24 = (void *)_classSetPool;
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  objc_msgSend(v24, "intern:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_fullDownloadRequestBatch_withCompletion_, 0, 1);

  v29 = (void *)_classSetPool;
  v30 = objc_alloc(MEMORY[0x1E0C99E60]);
  v31 = objc_opt_class();
  v32 = (void *)objc_msgSend(v30, "initWithObjects:", v31, objc_opt_class(), 0);
  objc_msgSend(v29, "intern:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_resolveFullDownloadRequests_withCompletion_, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_saliencyFromRFC822Data_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v75, objc_opt_class(), sel_topSalienciesForMailboxId_limit_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v75, objc_opt_class(), sel_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion_);
  v34 = (void *)_classSetPool;
  v35 = objc_alloc(MEMORY[0x1E0C99E60]);
  v36 = objc_opt_class();
  v37 = (void *)objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
  objc_msgSend(v34, "intern:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 3, 0);

  v39 = (void *)_classSetPool;
  v40 = objc_alloc(MEMORY[0x1E0C99E60]);
  v41 = objc_opt_class();
  v42 = (void *)objc_msgSend(v40, "initWithObjects:", v41, objc_opt_class(), 0);
  objc_msgSend(v39, "intern:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 4, 0);

  v44 = (void *)_classSetPool;
  v45 = objc_alloc(MEMORY[0x1E0C99E60]);
  v46 = objc_opt_class();
  v47 = (void *)objc_msgSend(v45, "initWithObjects:", v46, objc_opt_class(), 0);
  objc_msgSend(v44, "intern:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 5, 0);

  v49 = (void *)_classSetPool;
  v50 = objc_alloc(MEMORY[0x1E0C99E60]);
  v51 = objc_opt_class();
  v52 = (void *)objc_msgSend(v50, "initWithObjects:", v51, objc_opt_class(), 0);
  objc_msgSend(v49, "intern:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 6, 0);

  v54 = (void *)_classSetPool;
  v55 = objc_alloc(MEMORY[0x1E0C99E60]);
  v56 = objc_opt_class();
  v57 = (void *)objc_msgSend(v55, "initWithObjects:", v56, objc_opt_class(), 0);
  objc_msgSend(v54, "intern:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v58, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 7, 0);

  v59 = (void *)_classSetPool;
  v60 = objc_alloc(MEMORY[0x1E0C99E60]);
  v61 = objc_opt_class();
  v62 = (void *)objc_msgSend(v60, "initWithObjects:", v61, objc_opt_class(), 0);
  objc_msgSend(v59, "intern:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 8, 0);

  v64 = (void *)_classSetPool;
  v65 = objc_alloc(MEMORY[0x1E0C99E60]);
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  v70 = (void *)objc_msgSend(v65, "initWithObjects:", v66, v67, v68, v69, objc_opt_class(), 0);
  objc_msgSend(v64, "intern:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_, 0, 1);

  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_reportUserEngagement_forWarning_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_reportValue_forFeatureSetting_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v75, objc_opt_class(), sel_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v75, objc_opt_class(), sel_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion_);
  v72 = (void *)_classSetPool;
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v72, "intern:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_saliencyFromEmailHeaders_withCompletion_, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_identifyFollowUpWarningFromSubject_body_date_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v75, objc_opt_class(), sel_saliencyFromEmailHeaders_withCompletion_);
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_dissectAttachmentsFromSearchableItem_options_withCompletion_, 0, 1);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_eventsStartingAt_endingAt_limitTo_options_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_eventsStartingAt_endingAt_prefix_limitTo_options_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_eventsInFutureLimitTo_options_withCompletion_);
  objc_msgSend(*(id *)(a1 + 40), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion_);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_suggestionsFromRFC822Data_source_options_withCompletion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_suggestionsFromEmailContent_headers_source_options_withCompletion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_suggestionsFromSimpleMailMessage_headers_options_withCompletion_, 0, 1);
  v5 = (void *)_classSetPool;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v9 = (id)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "intern:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_addInteractions_bundleId_completion_, 0, 0);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_ipsosMessagesFromSearchableItems_withCompletion_);
  v5 = (void *)_classSetPool;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "intern:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_ipsosMessagesFromSearchableItems_withCompletion_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, objc_opt_class(), sel_titleSuggestionForMessage_withCompletion_);
  v10 = (void *)_classSetPool;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v10, "intern:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_titleSuggestionForMessage_withCompletion_, 0, 0);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_schemaOrgToEvents_completion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_allEventsLimitedTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, objc_opt_class(), sel_isEventCandidateForURL_title_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_suggestionsFromURL_title_HTMLPayload_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, objc_opt_class(), sel_eventFromUniqueId_completion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, objc_opt_class(), sel_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion_);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "interface:returnsArrayOf:forSelector:", v4, objc_opt_class(), sel_allRemindersLimitedTo_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, objc_opt_class(), sel_reminderTitleForContent_withCompletion_);
  objc_msgSend(*(id *)(a1 + 32), "interface:returns:forSelector:", v4, 0, sel_logUserCreatedReminderTitle_withCompletion_);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "interface:returnsArrayOf:forSelector:", v3, objc_opt_class(), sel_allDeliveriesWithLimit_withCompletion_);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "interface:returns:forSelector:", v3, objc_opt_class(), sel_foundInStringForRecordId_style_withCompletion_);

}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v9 = a2;
  v10[0] = sel_suggestionsFromMessage_options_completionHandler_;
  v10[1] = sel_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler_;
  v10[2] = sel_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler_;
  do
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), v10[v3++], 0, 1);
  while (v3 != 3);
  v4 = (void *)_classSetPool;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "intern:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler_, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "interface:returns:forSelector:", v9, objc_opt_class(), sel_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion_);
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)_classSetPool;
  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_opt_class();
  v8 = (id)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v2, "intern:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_evaluateRecipe_attachments_completion_, 1, 0);

}

@end
