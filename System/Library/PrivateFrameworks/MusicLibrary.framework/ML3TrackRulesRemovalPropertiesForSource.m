@implementation ML3TrackRulesRemovalPropertiesForSource

void __ML3TrackRulesRemovalPropertiesForSource_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[8];
  _QWORD v22[8];
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)ML3TrackRulesRemovalPropertiesForSource_dictionaries[0];
  ML3TrackRulesRemovalPropertiesForSource_dictionaries[0] = MEMORY[0x1E0C9AA70];

  v23[0] = CFSTR("item_store.sync_id");
  v23[1] = CFSTR("item_store.sync_redownload_params");
  v24[0] = &unk_1E5BAAEC0;
  v24[1] = &stru_1E5B66908;
  v23[2] = CFSTR("item_store.playback_endpoint_type");
  v23[3] = CFSTR("item_store.sync_in_my_library");
  v24[2] = &unk_1E5BAAED8;
  v24[3] = &unk_1E5BAAEC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EEC7CC10;
  qword_1EEC7CC10 = v1;

  v21[0] = CFSTR("item_store.store_saga_id");
  v21[1] = CFSTR("item_store.match_redownload_params");
  v22[0] = &unk_1E5BAAEC0;
  v22[1] = &stru_1E5B66908;
  v21[2] = CFSTR("needs_reporting");
  v21[3] = CFSTR("item_store.playback_endpoint_type");
  v22[2] = &unk_1E5BAAEC0;
  v22[3] = &unk_1E5BAAED8;
  v21[4] = CFSTR("item_store.cloud_playback_endpoint_type");
  v21[5] = CFSTR("item_store.cloud_in_my_library");
  v22[4] = &unk_1E5BAAEC0;
  v22[5] = &unk_1E5BAAEC0;
  v21[6] = CFSTR("item_store.cloud_album_id");
  v21[7] = CFSTR("item_store.cloud_universal_library_id");
  v22[6] = &stru_1E5B66908;
  v22[7] = &stru_1E5B66908;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1EEC7CC18;
  qword_1EEC7CC18 = v3;

  v19[0] = CFSTR("item_store.sync_id");
  v19[1] = CFSTR("item_stats.chosen_by_auto_fill");
  v20[0] = &unk_1E5BAAEC0;
  v20[1] = &unk_1E5BAAEC0;
  v19[2] = CFSTR("item_store.sync_redownload_params");
  v19[3] = CFSTR("item_store.playback_endpoint_type");
  v20[2] = &stru_1E5B66908;
  v20[3] = &unk_1E5BAAED8;
  v19[4] = CFSTR("item_store.sync_in_my_library");
  v20[4] = &unk_1E5BAAEC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1EEC7CC20;
  qword_1EEC7CC20 = v5;

  v17[0] = CFSTR("item_store.purchase_history_id");
  v17[1] = CFSTR("item_store.purchase_history_token");
  v18[0] = &unk_1E5BAAEC0;
  v18[1] = &unk_1E5BAAEC0;
  v17[2] = CFSTR("item_store.purchase_history_redownload_params");
  v17[3] = CFSTR("item_store.playback_endpoint_type");
  v18[2] = &stru_1E5B66908;
  v18[3] = &unk_1E5BAAED8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EEC7CC28;
  qword_1EEC7CC28 = v7;

  v15 = CFSTR("item_store.is_ota_purchased");
  v16 = &unk_1E5BAAEC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EEC7CC30;
  qword_1EEC7CC30 = v9;

  v13 = CFSTR("item_store.is_subscription");
  v14 = &unk_1E5BAAEC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_1EEC7CC38;
  qword_1EEC7CC38 = v11;

}

@end
