@implementation ICAttachmentAudioModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_AUDIO_RECORDINGS_%lu"), CFSTR("NOTE_LIST_AUDIO_RECORDINGS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchableTextContent
{
  void *v2;
  void *v3;

  -[ICAttachmentAudioModel audioDocument](self, "audioDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptAsPlainText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICAttachmentAudioModel)initWithAttachment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentAudioModel;
  return -[ICAttachmentModel initWithAttachment:](&v4, sel_initWithAttachment_, a3);
}

- (BOOL)isReadyToPresent
{
  void *v2;
  char v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported") ^ 1;

  return v3;
}

- (ICTTAudioDocument)audioDocument
{
  ICTTAudioDocument **p_audioDocument;
  ICTTAudioDocument *audioDocument;
  ICTTAudioDocument *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICTTAudioDocument *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ICTTAudioDocument *v14;
  NSObject *v15;

  p_audioDocument = &self->_audioDocument;
  audioDocument = self->_audioDocument;
  if (audioDocument)
  {
    v4 = audioDocument;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeableData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[ICTTAudioDocument unarchiveFromData:replicaID:](ICTTAudioDocument, "unarchiveFromData:replicaID:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_storeStrong((id *)p_audioDocument, v9);
      }
      else
      {
        v15 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[ICAttachmentAudioModel audioDocument].cold.1(self, v15);

      }
    }
    else
    {
      v10 = [ICTTAudioDocument alloc];
      -[ICAttachmentModel attachment](self, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentReplicaID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[ICTTAudioDocument initWithReplicaID:compatibleDocument:](v10, "initWithReplicaID:compatibleDocument:", v12, 0);
      v14 = *p_audioDocument;
      *p_audioDocument = (ICTTAudioDocument *)v13;

    }
    v4 = *p_audioDocument;

  }
  return v4;
}

- (void)attachmentWillTurnIntoFault
{
  ICTTAudioDocument *audioDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
  {
    audioDocument = self->_audioDocument;
    self->_audioDocument = 0;

  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  ICTTAudioDocument *audioDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty", a3))
  {
    audioDocument = self->_audioDocument;
    self->_audioDocument = 0;

  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_audioDocument && -[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty", a3))
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergeableData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mergeableData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentModel mergeWithMergeableData:](self, "mergeWithMergeableData:", v6);

    }
  }
}

- (NSArray)composedAudioAssetURLs
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSArray *v10;
  _QWORD v12[5];

  -[ICAttachmentAudioModel audioDocument](self, "audioDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedFragmentUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.notes", "AudioTranscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentAudioModel composedAudioAssetURLs].cold.2(self, (uint64_t)v4, v5);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke;
  v12[3] = &unk_1E76CFB68;
  v12[4] = self;
  objc_msgSend(v4, "ic_compactMap:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 != objc_msgSend(v4, "count"))
  {
    v8 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICAttachmentAudioModel composedAudioAssetURLs].cold.1(self, (uint64_t)v4, v8);

  }
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

id __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke_2;
  v13[3] = &unk_1E76CFB40;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v5, "ic_objectPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isValid"))
  {
    objc_msgSend(v7, "typeUTI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v9);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

uint64_t __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)asset
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__56;
  v15 = __Block_byref_object_dispose__56;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__ICAttachmentAudioModel_asset__block_invoke;
  v8[3] = &unk_1E76CFB90;
  v10 = &v11;
  v4 = v3;
  v9 = v4;
  -[ICAttachmentAudioModel assetWithCompletion:](self, "assetWithCompletion:", v8);
  v5 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __31__ICAttachmentAudioModel_asset__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)assetWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  _BYTE *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  uint8_t v61[128];
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  dispatch_group_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "media");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isValid");

    if (v19
      && (-[ICAttachmentModel attachment](self, "attachment"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "typeUTI"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = +[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v21),
          v21,
          v20,
          v22))
    {
      v23 = (void *)MEMORY[0x1E0C8B3C0];
      -[ICAttachmentModel attachment](self, "attachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "media");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "mediaURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ic_safeURLAssetWithURL:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v45;
      if (v45)
        (*((void (**)(id, void *))v45 + 2))(v45, v27);

    }
    else
    {
      v28 = v45;
      if (v45)
        (*((void (**)(id, _QWORD))v45 + 2))(v45, 0);
    }
  }
  else
  {
    objc_msgSend(v7, "shortLoggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachmentAudioModel composedAudioAssetURLs](self, "composedAudioAssetURLs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke;
    v59[3] = &unk_1E76CFBB8;
    v47 = v9;
    v60 = v47;
    objc_msgSend(v10, "ic_compactMap:", v59);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v46, "count"))
    {
      v11 = objc_msgSend(v46, "count");
      -[ICAttachmentModel attachment](self, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subAttachments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11 == objc_msgSend(v13, "count");

      if (!v14)
      {
        v15 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v41 = objc_msgSend(v46, "count");
          -[ICAttachmentModel attachment](self, "attachment");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "subAttachments");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2112;
          v63 = (uint64_t (*)(uint64_t, uint64_t))v47;
          _os_log_error_impl(&dword_1BD918000, v15, OS_LOG_TYPE_ERROR, "Warning: ICAttachmentAudioModelCompositionInfo count %ld does not match subattachment count %ld - {attachment: %@}", buf, 0x20u);

        }
      }
      if (objc_msgSend(v46, "count") == 1)
      {
        if (v45)
        {
          objc_msgSend(v46, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "asset");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v17);

        }
      }
      else
      {
        v31 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[ICAttachmentAudioModel assetWithCompletion:].cold.2((uint64_t)v47);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v63 = __Block_byref_object_copy__56;
        v64 = __Block_byref_object_dispose__56;
        v65 = dispatch_group_create();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v32 = v46;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v56;
          v35 = *MEMORY[0x1E0C8A7A0];
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v56 != v34)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v36);
              dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)&buf[8] + 40));
              objc_msgSend(v37, "asset");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_48;
              v52[3] = &unk_1E76CFBE0;
              v52[4] = v37;
              v53 = v47;
              v54 = buf;
              objc_msgSend(v38, "loadTracksWithMediaType:completionHandler:", v35, v52);

              ++v36;
            }
            while (v33 != v36);
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          }
          while (v33);
        }

        v39 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        dispatch_get_global_queue(0, 0);
        v40 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_50;
        block[3] = &unk_1E76C7780;
        v49 = v47;
        v50 = v32;
        v51 = v45;
        dispatch_group_notify(v39, v40, block);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      v29 = os_log_create("com.apple.notes", "AudioTranscription");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ICAttachmentAudioModel assetWithCompletion:].cold.1((uint64_t)v47, v29, v30);

      if (v45)
        (*((void (**)(id, _QWORD))v45 + 2))(v45, 0);
    }

    v28 = v45;
  }

}

ICAttachmentAudioModelCompositionInfo *__46__ICAttachmentAudioModel_assetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  ICAttachmentAudioModelCompositionInfo *v5;
  NSObject *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "ic_isReachable") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_2(a1);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C8B3C0], "ic_safeURLAssetWithURL:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_1(a1);

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = -[ICAttachmentAudioModelCompositionInfo initWithURL:asset:]([ICAttachmentAudioModelCompositionInfo alloc], "initWithURL:asset:", v3, v4);
LABEL_10:

  return v5;
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    v7 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_48_cold_1(a1, (uint64_t)v6, v7);

  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTrack:", v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  CMTimeValue v18;
  void *v19;
  CMTimeValue v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  CMTimeValue v25;
  Float64 Seconds;
  id v27;
  uint64_t v28;
  id obj;
  CMTime time;
  CMTimeRange range;
  id v32;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime v38;
  CMTime buf;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "AudioTranscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_50_cold_1(a1, v2, v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C8B268]);
  v38 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v27 = v4;
  objc_msgSend(v4, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A7A0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = a1;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v11 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v18 = *(_QWORD *)(v28 + 32);
          objc_msgSend(v10, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.value + 4) = v18;
          LOWORD(buf.flags) = 2112;
          *(_QWORD *)((char *)&buf.flags + 2) = v19;
          _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Splicing audio track into composition {attachment: %@, url: %@}", (uint8_t *)&buf, 0x16u);

        }
        objc_msgSend(v10, "track");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "timeRange");
        else
          memset(v33, 0, sizeof(v33));
        objc_msgSend(v10, "track");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        buf = v38;
        v15 = objc_msgSend(v5, "insertTimeRange:ofTrack:atTime:error:", v33, v14, &buf, &v32);
        v16 = v32;

        if (v15)
        {
          if (v5)
            objc_msgSend(v5, "timeRange");
          else
            memset(&range, 0, sizeof(range));
          CMTimeRangeGetEnd(&v38, &range);
        }
        else
        {
          v17 = os_log_create("com.apple.notes", "AudioTranscription");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v20 = *(_QWORD *)(v28 + 32);
            objc_msgSend(v10, "url");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.value) = 138412802;
            *(CMTimeValue *)((char *)&buf.value + 4) = v20;
            LOWORD(buf.flags) = 2112;
            *(_QWORD *)((char *)&buf.flags + 2) = v21;
            HIWORD(buf.epoch) = 2112;
            v40 = v16;
            _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Failed to splice audio track into composition {attachment: %@, url: %@, error: %@}", (uint8_t *)&buf, 0x20u);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v7);
  }

  v22 = os_log_create("com.apple.notes", "AudioTranscription");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(v28 + 32);
    if (v27)
      objc_msgSend(v27, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = v25;
    LOWORD(buf.flags) = 2048;
    *(_QWORD *)((char *)&buf.flags + 2) = (unint64_t)Seconds;
    _os_log_debug_impl(&dword_1BD918000, v22, OS_LOG_TYPE_DEBUG, "Finished composition {attachment: %@, duration: %lu}", (uint8_t *)&buf, 0x16u);
  }

  v23 = *(_QWORD *)(v28 + 48);
  if (v23)
  {
    v24 = (void *)objc_msgSend(v27, "copy");
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  }
}

- (void)writeMergeableData
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v5, "Wrote mergeable data {attachment: %@}", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a3;
  -[ICAttachmentAudioModel audioDocument](self, "audioDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mergeWithMergeableData:replicaID:", v5, v7);

  if (v8 == 2)
  {
    v9 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentAudioModel mergeWithMergeableData:mergeableFieldState:].cold.1(self, v9);

    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
  }
  return v8 == 2;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICAttachmentAudioModel audioDocument](self, "audioDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAfterLoadWithSubAttachmentIdentifierMap:", v4);

  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveMergeableDataIfNeeded");

}

- (void)updateFileBasedAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICAttachmentAudioModel *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentAudioModel;
  -[ICAttachmentModel updateFileBasedAttributes](&v11, sel_updateFileBasedAttributes);
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke;
  v8[3] = &unk_1E76CFC08;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "assetWithCompletion:", v8);

}

void __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke_2;
  v7[3] = &unk_1E76C73B0;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double Seconds;
  void *v9;
  void *v10;
  CMTime v11;
  CMTime time;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "duration");
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    if (v5)
      objc_msgSend(v5, "duration");
    else
      memset(&time, 0, sizeof(time));
    v6 = vabdd_f64(v4, CMTimeGetSeconds(&time));

    if (v6 < 0.01)
    {
      v7 = *(void **)(a1 + 32);
      if (v7)
        objc_msgSend(v7, "duration");
      else
        memset(&v11, 0, sizeof(v11));
      Seconds = CMTimeGetSeconds(&v11);
      objc_msgSend(*(id *)(a1 + 40), "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDuration:", Seconds);

      objc_msgSend(*(id *)(a1 + 40), "attachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Updated duration from audio asset"));

    }
  }
}

- (NSString)title
{
  NSString *title;
  NSString *v3;
  void *v4;

  title = self->_title;
  if (title)
  {
    v3 = title;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSDate)creationDate
{
  NSDate *creationDate;
  NSDate *v3;
  void *v4;

  creationDate = self->_creationDate;
  if (creationDate)
  {
    v3 = creationDate;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modificationDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)hidesSubAttachmentsInAttachmentBrowser
{
  return 1;
}

- (BOOL)recordedInNotes
{
  return self->_recordedInNotes;
}

- (void)setRecordedInNotes:(BOOL)a3
{
  self->_recordedInNotes = a3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAudioDocument:(id)a3
{
  objc_storeStrong((id *)&self->_audioDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDocument, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)needsTranscription
{
  ICAttachmentAudioModel *v2;
  char v3;

  v2 = self;
  v3 = ICAttachmentAudioModel.needsTranscription.getter();

  return v3 & 1;
}

- (void)transformNewlyAddedMediaAttachment
{
  ICAttachmentAudioModel *v2;

  v2 = self;
  ICAttachmentAudioModel.transformNewlyAddedMediaAttachment()();

}

- (id)createSubattachmentForRecordingAndReturnError:(id *)a3
{
  ICAttachmentAudioModel *v4;
  ICAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = self;
  ICAttachmentAudioModel.createSubattachmentForRecording()(v5);
  v8 = v7;

  if (v6)
  {
    if (a3)
    {
      v9 = (void *)sub_1BDBFC870();

      v10 = v9;
      v8 = 0;
      *a3 = v9;
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (BOOL)saveSummaryToAttachmentWithSummary:(id)a3 error:(id *)a4
{
  id v6;
  ICAttachmentAudioModel *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = self;
  ICAttachmentAudioModel.saveSummaryToAttachment(summary:)((NSAttributedString)v6);

  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_1BDBFC870();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (BOOL)saveTopLineSummaryToAttachmentWithSummary:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  ICAttachmentAudioModel *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_1BDBFD6F8();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ICAttachmentAudioModel.saveTopLineSummaryToAttachment(summary:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1BDBFC870();

      v13 = v12;
      *a4 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (BOOL)saveAttachmentAndReturnError:(id *)a3
{
  ICAttachmentAudioModel *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  ICAttachmentAudioModel.saveAttachment()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1BDBFC870();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (id)bitFlippeddUUIDWithUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  ICAttachmentAudioModel *v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  uint64_t v15;

  v4 = sub_1BDBFCB40();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v15 - v9;
  sub_1BDBFCB10();
  v11 = self;
  sub_1BDBFCB28();
  sub_1BDBFCB1C();

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v13 = (void *)sub_1BDBFCAF8();
  v12(v10, v4);
  return v13;
}

- (void)audioDocument
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v5, "Cannot decode audio model for attachment {attachment: %@}", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

- (void)composedAudioAssetURLs
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_loggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_1BD918000, a3, v6, "Fragments for composing {attachment: %@, fragments: %@}", v7);

  OUTLINED_FUNCTION_2();
}

- (void)assetWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, a3, "Failed to collect any ICAttachmentAudioModelCompositionInfo {attachment: %@}", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)assetWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1BD918000, v1, (uint64_t)v1, "Composing AVAudioAsset {attachment: %@, infos: %@}", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v2, (uint64_t)v2, "Failed to create AVURLAsset {attachment: %@, url: %@}", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v2, (uint64_t)v2, "Audio file is not reachable {attachment: %@, url: %@}", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_48_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint8_t v7[22];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v8 = v6;
  v9 = a2;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Failed to load audio track {attachment: %@, url: %@, error: %@}", v7, 0x20u);

}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_50_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Finished loading audio tracks {attachment: %@}", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)mergeWithMergeableData:(void *)a1 mergeableFieldState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_loggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "audioDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedFragmentUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_1BD918000, a2, v8, "Audio model updated from merge {attachment: %@, fragments: %@}", v9);

}

@end
