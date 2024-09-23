@implementation MPCustomDataPlaybackQueue

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  uint64_t quot;
  lldiv_t v15;
  uint64_t v16;
  const UInt8 *v17;
  CFStringRef v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  MPCModelStorePlaybackItemsRequest *v22;
  void *v23;
  void *v24;
  void *v25;
  MPCModelPlaybackContext *v26;
  void *v27;
  MPCModelPlaybackContext *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(v7, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "delegationProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "storeAccountID");

    if (v12)
    {
      v13 = (char *)&v50 + 1;
      quot = v12;
      do
      {
        v15 = lldiv(quot, 10);
        quot = v15.quot;
        if (v15.rem >= 0)
          LOBYTE(v16) = v15.rem;
        else
          v16 = -v15.rem;
        *(v13 - 2) = v16 + 48;
        v17 = (const UInt8 *)(v13 - 2);
        --v13;
      }
      while (v15.quot);
      if (v12 < 0)
      {
        *(v13 - 2) = 45;
        v17 = (const UInt8 *)(v13 - 2);
      }
      v18 = CFStringCreateWithBytes(0, v17, (char *)&v50 - (char *)v17, 0x8000100u, 0);

      v10 = (void *)v18;
    }
    v19 = *(_QWORD **)(a1 + 32);
    if (v19)
      v19 = (_QWORD *)v19[2];
    v20 = v19;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2;
    v43[3] = &unk_24CAB7D10;
    v44 = *(id *)(a1 + 32);
    v21 = v10;
    v45 = v21;
    v46 = *(id *)(a1 + 40);
    v48 = *(_OWORD *)(a1 + 72);
    v49 = *(_QWORD *)(a1 + 88);
    v47 = *(id *)(a1 + 48);
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v43);

    v22 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    objc_msgSend(*(id *)(a1 + 40), "lazyMapWithSections:items:", &__block_literal_global_22181, &__block_literal_global_23);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = (void *)objc_msgSend(v24, "copy");
    -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v22, "setSectionedModelObjects:", v25);

    v26 = objc_alloc_init(MPCModelPlaybackContext);
    v27 = *(void **)(a1 + 56);
    v28 = v26;
    v29 = v27;
    objc_msgSend(v29, "featureName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setPlayActivityFeatureName:](v28, "setPlayActivityFeatureName:", v30);

    objc_msgSend(v29, "queueGroupingID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v28, "setPlayActivityQueueGroupingID:", v31);

    objc_msgSend(v29, "siriRecommendationIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dataUsingEncoding:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v28, "setPlayActivityRecommendationData:", v33);

    objc_msgSend(v29, "siriAssetInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setSiriAssetInfo:](v28, "setSiriAssetInfo:", v34);

    objc_msgSend(v29, "siriReferenceIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setSiriReferenceIdentifier:](v28, "setSiriReferenceIdentifier:", v35);

    objc_msgSend(v29, "siriWHAMetricsInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setSiriWHAMetricsInfo:](v28, "setSiriWHAMetricsInfo:", v36);

    objc_msgSend(v29, "privateListeningOverride");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setPrivateListeningOverride:](v28, "setPrivateListeningOverride:", v37);

    if (objc_msgSend(v29, "isRequestingImmediatePlayback"))
      v38 = 20;
    else
      v38 = 0;
    -[MPCModelPlaybackContext setActionAfterQueueLoad:](v28, "setActionAfterQueueLoad:", v38);
    objc_msgSend(v29, "userIdentity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelPlaybackContext setUserIdentity:](v28, "setUserIdentity:", v39);
    -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v28, "setPlaybackRequestEnvironment:", v7);
    if (v8)
      -[MPCModelPlaybackContext setPrivateListeningOverride:](v28, "setPrivateListeningOverride:", v8);
    -[MPCModelPlaybackContext setRequest:](v28, "setRequest:", v22);
    -[MPCModelPlaybackContext setStartItemIdentifiers:](v28, "setStartItemIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    v40 = *(_QWORD *)(a1 + 32);
    if (v40 && (*(_BYTE *)(v40 + 40) & 1) != 0 && *(_DWORD *)(v40 + 24) == 1)
      -[MPCModelPlaybackContext setShuffleType:](v28, "setShuffleType:", 1);
    objc_msgSend(*(id *)(a1 + 56), "mediaRemoteOptions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x24BE65978]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      -[MPCModelPlaybackContext setQueueEndAction:](v28, "setQueueEndAction:", objc_msgSend(v42, "integerValue"));
    -[MPCModelPlaybackContext setPlayActivityFeatureName:](v28, "setPlayActivityFeatureName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v28, "setPlayActivityQueueGroupingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  MPCModelRadioPlaybackContext *v8;
  void *v9;
  MPCModelRadioPlaybackContext *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  MPCModelRadioContentReference *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  MPCModelRadioContentReference *v43;
  id v44;
  _QWORD v45[4];
  id v46;

  v44 = a2;
  v7 = a3;
  if (a4)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = objc_alloc_init(MPCModelRadioPlaybackContext);
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    v11 = v9;
    objc_msgSend(v11, "featureName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", v12);

    objc_msgSend(v11, "queueGroupingID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityQueueGroupingID:](v10, "setPlayActivityQueueGroupingID:", v13);

    objc_msgSend(v11, "siriRecommendationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityRecommendationData:](v10, "setPlayActivityRecommendationData:", v15);

    objc_msgSend(v11, "siriAssetInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriAssetInfo:](v10, "setSiriAssetInfo:", v16);

    objc_msgSend(v11, "siriReferenceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriReferenceIdentifier:](v10, "setSiriReferenceIdentifier:", v17);

    objc_msgSend(v11, "siriWHAMetricsInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriWHAMetricsInfo:](v10, "setSiriWHAMetricsInfo:", v18);

    objc_msgSend(v11, "privateListeningOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPrivateListeningOverride:](v10, "setPrivateListeningOverride:", v19);

    if (objc_msgSend(v11, "isRequestingImmediatePlayback"))
      v20 = 20;
    else
      v20 = 0;
    -[MPCModelRadioPlaybackContext setActionAfterQueueLoad:](v10, "setActionAfterQueueLoad:", v20, v44);
    objc_msgSend(v11, "userIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelRadioPlaybackContext setUserIdentity:](v10, "setUserIdentity:", v21);
    -[MPCModelRadioPlaybackContext setPlaybackRequestEnvironment:](v10, "setPlaybackRequestEnvironment:", v44);
    if (v7)
      -[MPCModelRadioPlaybackContext setPrivateListeningOverride:](v10, "setPrivateListeningOverride:", v7);
    v22 = *(_QWORD **)(a1 + 40);
    if (v22)
    {
      v23 = (void *)v22[3];
      if (!v23
        || (v24 = v23,
            -[MPCModelRadioPlaybackContext setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", v24),
            v24,
            (v22 = *(_QWORD **)(a1 + 40)) != 0))
      {
        v25 = (void *)v22[4];
        if (!v25
          || (v26 = v25,
              -[MPCModelRadioPlaybackContext setPlayActivityQueueGroupingID:](v10, "setPlayActivityQueueGroupingID:", v26), v26, (v22 = *(_QWORD **)(a1 + 40)) != 0))
        {
          if (!v22[5])
            goto LABEL_15;
          v27 = objc_alloc(MEMORY[0x24BDDC988]);
          v28 = objc_alloc(MEMORY[0x24BDDC758]);
          objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7;
          v45[3] = &unk_24CAB8A40;
          v46 = *(id *)(a1 + 40);
          v30 = (void *)objc_msgSend(v28, "initWithSource:modelKind:block:", CFSTR("RSQ-Proto"), v29, v45);
          v31 = (void *)objc_msgSend(v27, "initWithIdentifiers:block:", v30, &__block_literal_global_38);
          -[MPCModelRadioPlaybackContext setRadioStation:](v10, "setRadioStation:", v31);

          v22 = *(_QWORD **)(a1 + 40);
          if (v22)
          {
LABEL_15:
            v32 = (void *)v22[6];
            if (!v32)
              goto LABEL_19;
            v33 = v32;
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              -[MPCModelRadioPlaybackContext setStationURL:](v10, "setStationURL:", v34);

            v22 = *(_QWORD **)(a1 + 40);
            if (v22)
            {
LABEL_19:
              v35 = (void *)v22[7];
              if (v35)
              {
                v36 = v35;
                _MPCProtoRadioContentReferenceToICRadioContentReference(v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37)
                {
                  v38 = -[MPCModelRadioContentReference initWithICRadioContentReference:]([MPCModelRadioContentReference alloc], "initWithICRadioContentReference:", v37);
                  -[MPCModelRadioPlaybackContext setSeedContentReference:](v10, "setSeedContentReference:", v38);

                  v39 = *(_QWORD *)(a1 + 40);
                  if (v39)
                  {
                    v40 = *(void **)(v39 + 16);
                    if (v40)
                    {
                      v41 = v40;
                      _MPCProtoRadioContentReferenceToICRadioContentReference(v41);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v42)
                      {
                        v43 = -[MPCModelRadioContentReference initWithICRadioContentReference:]([MPCModelRadioContentReference alloc], "initWithICRadioContentReference:", v42);
                        -[MPCModelRadioPlaybackContext setNowPlayingContentReference:](v10, "setNowPlayingContentReference:", v43);

                      }
                    }
                  }
                }

              }
            }
          }
        }
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_8;
  v3[3] = &unk_24CAB8A18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setRadioIdentifiersWithBlock:", v3);

}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
    v4 = *(void **)(v2 + 40);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "setStationStringID:", v5);

}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC8C0], "kindWithModelClass:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke;
  v34[3] = &unk_24CAB8030;
  v35 = v11;
  v36 = v9;
  v37 = v10;
  v17 = v10;
  v18 = v9;
  v26 = v11;
  v19 = (void *)objc_msgSend(v14, "initWithSource:modelKind:block:", CFSTR("RSQ-Proto"), v15, v34);

  objc_msgSend(*(id *)(a1 + 48), "appendSection:", v19);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (v11)
      v20 = (void *)v26[4];
    else
      v20 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v20);
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (v11)
      v21 = (void *)v26[5];
    else
      v21 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v21);
  }
  if (v11)
    v22 = (void *)v26[3];
  else
    v22 = 0;
  v23 = v22;
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3;
  v27[3] = &unk_24CAB7CE8;
  v28 = *(id *)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 80);
  v29 = v24;
  v32 = v25;
  v30 = *(id *)(a1 + 56);
  v33 = a3;
  v31 = *(id *)(a1 + 48);
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v27);

}

id __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "modelKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "modelClass")), "initWithIdentifiers:", v2);

  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "modelKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "modelClass")), "initWithIdentifiers:", v2);

  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC8C0], "kindWithModelClass:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke;
  v24[3] = &unk_24CAB8030;
  v25 = v11;
  v26 = v9;
  v27 = v10;
  v16 = v10;
  v17 = v9;
  v23 = v11;
  v18 = (void *)objc_msgSend(v14, "initWithSource:modelKind:block:", CFSTR("RSQ-Proto"), v15, v24);

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v21 = *(_QWORD *)(v19 + 40);
  v20 = (id *)(v19 + 40);
  if (!v21)
  {
    v22 = *(_QWORD *)(a1 + 48);
    if (v22)
    {
      if (*(_QWORD *)(v22 + 16) == a3 && *(_QWORD *)(v22 + 8) == *(_QWORD *)(a1 + 72))
        objc_storeStrong(v20, v18);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "appendItem:", v18);

}

@end
