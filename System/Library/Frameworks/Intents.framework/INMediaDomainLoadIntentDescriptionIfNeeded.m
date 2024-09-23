@implementation INMediaDomainLoadIntentDescriptionIfNeeded

void ___INMediaDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentDescription *v3;
  INIntentDescription *v4;
  uint64_t v5;
  uint64_t v6;
  INIntentDescription *v7;
  INIntentSlotDescription *v8;
  INIntentSlotDescription *v9;
  INIntentSlotDescription *v10;
  INIntentSlotDescription *v11;
  void *v12;
  void *v13;
  INIntentDescription *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  INIntentDescription *v33;
  void *v34;
  void *v35;
  INIntentSlotDescription *v36;
  INIntentSlotDescription *v37;
  void *v38;
  void *v39;
  INIntentSlotDescription *v40;
  INIntentSlotDescription *v41;
  INIntentSlotDescription *v42;
  INIntentSlotDescription *v43;
  INIntentSlotDescription *v44;
  uint64_t v45;
  INIntentSlotDescription *v46;
  uint64_t v47;
  INIntentDescription *v48;
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  INIntentSlotDescription *v51;
  INIntentSlotDescription *v52;
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  INIntentSlotDescription *v56;
  INIntentSlotDescription *v57;
  INIntentSlotDescription *v58;
  INIntentSlotDescription *v59;
  INIntentSlotDescription *v60;
  INIntentDescription *v61;
  void *v62;
  void *v63;
  INIntentSlotDescription *v64;
  INIntentSlotDescription *v65;
  INIntentSlotDescription *v66;
  INIntentSlotDescription *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _QWORD v73[4];
  _QWORD v74[3];
  _QWORD v75[17];
  _QWORD v76[4];
  _QWORD v77[6];

  v77[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v67 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaItems"), 2, CFSTR("mediaItems"), CFSTR("mediaItems"), 0, 0, 153, 3, &unk_1E23F75D8, &unk_1E23F75F0, objc_opt_class(), sel_resolveMediaItemsForAddMedia_withCompletion_, sel_resolveMediaItemsForAddMedia_completion_, 0);
  v76[0] = v67;
  v66 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaSearch"), 3, CFSTR("mediaSearch"), CFSTR("mediaSearch"), 0, 0, 157, 1, 0, 0, 0, 0);
  v76[1] = v66;
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaDestination"), 4, CFSTR("mediaDestination"), CFSTR("mediaDestination"), 0, 0, 159, 1, &unk_1E23F7608, &unk_1E23F7620, objc_opt_class(), sel_resolveMediaDestinationForAddMedia_withCompletion_, sel_resolveMediaDestinationForAddMedia_completion_, 0);
  v76[2] = v65;
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("privateAddMediaIntentData"), 6, CFSTR("privateAddMediaIntentData"), CFSTR("privateAddMediaIntentData"), 0, 1, 164, 1, 0, 0, 0, 0);
  v76[3] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("AddMediaIntent"), CFSTR("AddMediaIntentResponse"), v1, v2, CFSTR("sirikit.intent.media.AddMediaIntent"), 0, sel_handleAddMedia_completion_, sel_confirmAddMedia_completion_, v62);
  v77[0] = v61;
  v3 = [INIntentDescription alloc];
  v47 = objc_opt_class();
  v45 = objc_opt_class();
  v60 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaItems"), 2, CFSTR("mediaItems"), CFSTR("mediaItems"), 0, 0, 153, 3, &unk_1E23F7638, &unk_1E23F7650, objc_opt_class(), sel_resolveMediaItemsForPlayMedia_withCompletion_, sel_resolveMediaItemsForPlayMedia_completion_, 0);
  v75[0] = v60;
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaContainer"), 3, CFSTR("mediaContainer"), CFSTR("mediaContainer"), 0, 0, 153, 1, 0, 0, 0, 0);
  v75[1] = v59;
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("playShuffled"), 4, CFSTR("playShuffled"), CFSTR("playShuffled"), 0, 0, 1, 1, &unk_1E23F7668, &unk_1E23F7680, objc_opt_class(), sel_resolvePlayShuffledForPlayMedia_withCompletion_, sel_resolvePlayShuffledForPlayMedia_completion_, 0);
  v75[2] = v58;
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("playbackRepeatMode"), 5, CFSTR("playbackRepeatMode"), CFSTR("playbackRepeatMode"), 0, 0, 155, 1, &unk_1E23F7698, &unk_1E23F76B0, objc_opt_class(), sel_resolvePlaybackRepeatModeForPlayMedia_withCompletion_, sel_resolvePlaybackRepeatModeForPlayMedia_completion_, 0);
  v75[3] = v57;
  v56 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resumePlayback"), 6, CFSTR("resumePlayback"), CFSTR("resumePlayback"), 0, 0, 1, 1, &unk_1E23F76C8, &unk_1E23F76E0, objc_opt_class(), sel_resolveResumePlaybackForPlayMedia_withCompletion_, sel_resolveResumePlaybackForPlayMedia_completion_, 0);
  v75[4] = v56;
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("expirationDate"), 7, CFSTR("expirationDate"), CFSTR("expirationDate"), 0, 1, 34, 1, 0, 0, 0, 0);
  v75[5] = v55;
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("bucket"), 8, CFSTR("buckets"), CFSTR("buckets"), 0, 1, 12, 3, 0, 0, 0, 0);
  v75[6] = v54;
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recoID"), 9, CFSTR("recoID"), CFSTR("recoID"), 0, 1, 7, 1, 0, 0, 0, 0);
  v75[7] = v53;
  v52 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("playbackQueueLocation"), 10, CFSTR("playbackQueueLocation"), CFSTR("playbackQueueLocation"), 0, 0, 156, 1, &unk_1E23F76F8, &unk_1E23F7710, objc_opt_class(), sel_resolvePlaybackQueueLocationForPlayMedia_withCompletion_, sel_resolvePlaybackQueueLocationForPlayMedia_completion_, 0);
  v75[8] = v52;
  v51 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("playbackSpeed"), 11, CFSTR("playbackSpeed"), CFSTR("playbackSpeed"), 0, 0, 3, 1, &unk_1E23F7728, &unk_1E23F7740, objc_opt_class(), sel_resolvePlaybackSpeedForPlayMedia_withCompletion_, sel_resolvePlaybackSpeedForPlayMedia_completion_, 0);
  v75[9] = v51;
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaSearch"), 12, CFSTR("mediaSearch"), CFSTR("mediaSearch"), 0, 0, 157, 1, 0, 0, 0, 0);
  v75[10] = v50;
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("hashedRouteUIDs"), 13, CFSTR("hashedRouteUIDs"), CFSTR("hashedRouteUIDs"), 0, 1, 30, 3, 0, 0, 0, 0);
  v75[11] = v49;
  v44 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("audioSearchResults"), 20, CFSTR("audioSearchResults"), CFSTR("audioSearchResults"), 0, 1, 160, 3, 0, 0, 0, 0);
  v75[12] = v44;
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alternativeResults"), 21, CFSTR("alternativeResults"), CFSTR("alternativeResults"), 0, 1, 160, 3, 0, 0, 0, 0);
  v75[13] = v43;
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parsecCategory"), 22, CFSTR("parsecCategory"), CFSTR("parsecCategory"), 0, 1, 161, 1, 0, 0, 0, 0);
  v75[14] = v42;
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("proxiedBundleIdentifier"), 100, CFSTR("proxiedBundleIdentifier"), CFSTR("proxiedBundleIdentifier"), 0, 1, 7, 1, 0, 0, 0, 0);
  v75[15] = v41;
  v40 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("privatePlayMediaIntentData"), 110, CFSTR("privatePlayMediaIntentData"), CFSTR("privatePlayMediaIntentData"), 0, 1, 163, 1, 0, 0, 0, 0);
  v75[16] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("PlayMediaIntent"), CFSTR("PlayMediaIntentResponse"), v47, v45, CFSTR("sirikit.intent.media.PlayMediaIntent"), 0, sel_handlePlayMedia_completion_, sel_confirmPlayMedia_completion_, v38);
  v77[1] = v48;
  v4 = [INIntentDescription alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 153, 3, &unk_1E23F7758, &unk_1E23F7770, objc_opt_class(), sel_resolveMediaItemsForSearchForMedia_withCompletion_, sel_resolveMediaItemsForSearchForMedia_completion_, 0);
  v74[0] = v46;
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 157, 1, 0, 0, 0, 0);
  v74[1] = v37;
  v36 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("privateSearchForMediaIntentData"), 100, CFSTR("privateSearchForMediaIntentData"), CFSTR("privateSearchForMediaIntentData"), 0, 1, 166, 1, 0, 0, 0, 0);
  v74[2] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v4, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchForMediaIntent"), CFSTR("SearchForMediaIntentResponse"), v5, v6, CFSTR("sirikit.intent.media.SearchForMediaIntent"), 0, sel_handleSearchForMedia_completion_, sel_confirmSearchForMedia_completion_, v34);
  v77[2] = v7;
  v33 = [INIntentDescription alloc];
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaItems"), 2, CFSTR("mediaItems"), CFSTR("mediaItems"), 0, 0, 153, 3, &unk_1E23F7788, &unk_1E23F77A0, objc_opt_class(), sel_resolveMediaItemsForUpdateMediaAffinity_withCompletion_, sel_resolveMediaItemsForUpdateMediaAffinity_completion_, 0);
  v73[0] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaSearch"), 3, CFSTR("mediaSearch"), CFSTR("mediaSearch"), 0, 0, 157, 1, 0, 0, 0, 0);
  v73[1] = v9;
  v10 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("affinityType"), 4, CFSTR("affinityType"), CFSTR("affinityType"), 0, 0, 158, 1, &unk_1E23F77B8, &unk_1E23F77D0, objc_opt_class(), sel_resolveAffinityTypeForUpdateMediaAffinity_withCompletion_, sel_resolveAffinityTypeForUpdateMediaAffinity_completion_, 0);
  v73[2] = v10;
  v11 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("privateUpdateMediaAffinityIntentData"), 6, CFSTR("privateUpdateMediaAffinityIntentData"), CFSTR("privateUpdateMediaAffinityIntentData"), 0, 1, 165, 1, 0, 0, 0, 0);
  v73[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v33, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("UpdateMediaAffinityIntent"), CFSTR("UpdateMediaAffinityIntentResponse"), v32, v31, CFSTR("sirikit.intent.media.UpdateMediaAffinityIntent"), 0, sel_handleUpdateMediaAffinity_completion_, sel_confirmUpdateMediaAffinity_completion_, v13);
  v77[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v69 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v24, v25);

        objc_msgSend(v24, "type");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v24, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend(v17, "copy");
  v28 = (void *)sMediaDomain_intentDescsByName;
  sMediaDomain_intentDescsByName = v27;

  v29 = objc_msgSend(v18, "copy");
  v30 = (void *)sMediaDomain_intentDescsByType;
  sMediaDomain_intentDescsByType = v29;

}

@end
