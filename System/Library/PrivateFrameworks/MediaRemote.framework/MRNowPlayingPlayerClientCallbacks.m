@implementation MRNowPlayingPlayerClientCallbacks

- (void)setPlaybackSessionMigrateRequestCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (MRNowPlayingPlayerClientCallbacks)initWithPlayerPath:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingPlayerClientCallbacks *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *commandHandlerBlocks;
  MSVMultiCallback *v12;
  MSVMultiCallback *createPlaybackQueueForRequestCallbacks;
  MSVMultiCallback *v14;
  MSVMultiCallback *createItemForOffsetCallbacks;
  MSVMultiCallback *v16;
  MSVMultiCallback *createItemForIdentifierCallbacks;
  MSVMultiCallback *v18;
  MSVMultiCallback *createChildItemCallbacks;
  MSVMultiCallback *v20;
  MSVMultiCallback *metadataCallbacks;
  MSVMultiCallback *v22;
  MSVMultiCallback *languageOptionsCallbacks;
  MSVMultiCallback *v24;
  MSVMultiCallback *infoCallbacks;
  MSVMultiCallback *v26;
  MSVMultiCallback *transcriptAlignmentsCallbacks;
  MSVMultiCallback *v28;
  MSVMultiCallback *lyricsCallbacks;
  MSVMultiCallback *v30;
  MSVMultiCallback *artworkCallbacks;
  MSVMultiCallback *v32;
  MSVMultiCallback *formattedArtworkCallbacks;
  MSVMultiCallback *v34;
  MSVMultiCallback *availableArtworkFormatsCallbacks;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)MRNowPlayingPlayerClientCallbacks;
  v9 = -[MRNowPlayingPlayerClientCallbacks init](&v41, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClientCallbacks initWithPlayerPath:queue:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("MRNowPlayingPlayerClientCallbacks.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    }
    if ((objc_msgSend(v7, "isResolved") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClientCallbacks initWithPlayerPath:queue:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("MRNowPlayingPlayerClientCallbacks.m"), 52, CFSTR("Attempting to use unresolved Player Path"));

    }
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    objc_storeStrong((id *)&v9->_playerPath, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    commandHandlerBlocks = v9->_commandHandlerBlocks;
    v9->_commandHandlerBlocks = v10;

    v12 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    createPlaybackQueueForRequestCallbacks = v9->_createPlaybackQueueForRequestCallbacks;
    v9->_createPlaybackQueueForRequestCallbacks = v12;

    v14 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    createItemForOffsetCallbacks = v9->_createItemForOffsetCallbacks;
    v9->_createItemForOffsetCallbacks = v14;

    v16 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    createItemForIdentifierCallbacks = v9->_createItemForIdentifierCallbacks;
    v9->_createItemForIdentifierCallbacks = v16;

    v18 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    createChildItemCallbacks = v9->_createChildItemCallbacks;
    v9->_createChildItemCallbacks = v18;

    v20 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    metadataCallbacks = v9->_metadataCallbacks;
    v9->_metadataCallbacks = v20;

    v22 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    languageOptionsCallbacks = v9->_languageOptionsCallbacks;
    v9->_languageOptionsCallbacks = v22;

    v24 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    infoCallbacks = v9->_infoCallbacks;
    v9->_infoCallbacks = v24;

    v26 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    transcriptAlignmentsCallbacks = v9->_transcriptAlignmentsCallbacks;
    v9->_transcriptAlignmentsCallbacks = v26;

    v28 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    lyricsCallbacks = v9->_lyricsCallbacks;
    v9->_lyricsCallbacks = v28;

    v30 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    artworkCallbacks = v9->_artworkCallbacks;
    v9->_artworkCallbacks = v30;

    v32 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    formattedArtworkCallbacks = v9->_formattedArtworkCallbacks;
    v9->_formattedArtworkCallbacks = v32;

    v34 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E0D4D088]);
    availableArtworkFormatsCallbacks = v9->_availableArtworkFormatsCallbacks;
    v9->_availableArtworkFormatsCallbacks = v34;

  }
  return v9;
}

- (MSVMultiCallback)metadataCallbacks
{
  return self->_metadataCallbacks;
}

- (MSVMultiCallback)infoCallbacks
{
  return self->_infoCallbacks;
}

- (MSVMultiCallback)languageOptionsCallbacks
{
  return self->_languageOptionsCallbacks;
}

- (MSVMultiCallback)availableArtworkFormatsCallbacks
{
  return self->_availableArtworkFormatsCallbacks;
}

- (unint64_t)_onQueue_capabilities
{
  unint64_t v3;

  v3 = 8 * (-[MSVMultiCallback count](self->_createPlaybackQueueForRequestCallbacks, "count") != 0);
  if (self->_createItemToken)
    goto LABEL_2;
  if (-[MSVMultiCallback count](self->_createItemForOffsetCallbacks, "count"))
    goto LABEL_5;
  if (self->_createItemToken)
  {
LABEL_2:
    if ((unint64_t)-[MSVMultiCallback count](self->_createItemForOffsetCallbacks, "count") < 2)
      goto LABEL_6;
LABEL_5:
    v3 |= 2uLL;
  }
LABEL_6:
  if (self->_createItemForIdentifierToken)
    goto LABEL_7;
  if (!-[MSVMultiCallback count](self->_createItemForIdentifierCallbacks, "count"))
  {
    if (!self->_createItemForIdentifierToken)
      return v3;
LABEL_7:
    if ((unint64_t)-[MSVMultiCallback count](self->_createItemForIdentifierCallbacks, "count") < 2)
      return v3;
  }
  v3 |= 4uLL;
  return v3;
}

uint64_t __49__MRNowPlayingPlayerClientCallbacks_capabilities__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_capabilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)capabilities
{
  NSObject *serialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRNowPlayingPlayerClientCallbacks_capabilities__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MSVMultiCallback)createPlaybackQueueForRequestCallbacks
{
  return self->_createPlaybackQueueForRequestCallbacks;
}

- (MSVMultiCallback)createItemForIdentifierCallbacks
{
  return self->_createItemForIdentifierCallbacks;
}

- (MSVMultiCallback)createItemForOffsetCallbacks
{
  return self->_createItemForOffsetCallbacks;
}

- (MSVMultiCallback)artworkCallbacks
{
  return self->_artworkCallbacks;
}

void __64__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (void)setPlaybackSessionCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __78__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateRequestCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

}

void __67__MRNowPlayingPlayerClientCallbacks_addCommandHandlerBlock_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

- (void)addCommandHandlerBlock:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MRNowPlayingPlayerClientCallbacks_addCommandHandlerBlock_forKey___block_invoke;
  block[3] = &unk_1E30C6B98;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

void __76__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateBeginCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

}

void __74__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

}

- (MSVMultiCallback)lyricsCallbacks
{
  return self->_lyricsCallbacks;
}

- (MSVMultiCallback)formattedArtworkCallbacks
{
  return self->_formattedArtworkCallbacks;
}

- (void)setPlaybackSessionMigrateEndCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (void)setPlaybackSessionMigrateBeginCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (id)videoThumbnailsCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__MRNowPlayingPlayerClientCallbacks_videoThumbnailsCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setVideoThumbnailsCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __64__MRNowPlayingPlayerClientCallbacks_setVideoThumbnailsCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (id)audioAmplitudeSamplesCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __66__MRNowPlayingPlayerClientCallbacks_audioAmplitudeSamplesCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAudioAmplitudeSamplesCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __70__MRNowPlayingPlayerClientCallbacks_setAudioAmplitudeSamplesCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (id)playbackSessionCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__MRNowPlayingPlayerClientCallbacks_playbackSessionCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)playbackSessionMigrateBeginCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __72__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateBeginCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)playbackSessionMigrateEndCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __70__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateEndCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)playbackSessionMigrateRequestCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __74__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateRequestCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)endLyricsEventCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __59__MRNowPlayingPlayerClientCallbacks_endLyricsEventCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setBeginLyricsEventCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __65__MRNowPlayingPlayerClientCallbacks_setBeginLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (id)beginLyricsEventCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33;
  v8 = __Block_byref_object_dispose__33;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__MRNowPlayingPlayerClientCallbacks_beginLyricsEventCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setEndLyricsEventCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __63__MRNowPlayingPlayerClientCallbacks_setEndLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

- (BOOL)hasPlaybackQueueCallbacks
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originClientForPlayerPath:", self->_playerPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(v4, "playbackQueueCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  v11 = v6;
  msv_dispatch_sync_on_queue();
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __62__MRNowPlayingPlayerClientCallbacks_hasPlaybackQueueCallbacks__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    v2 = 1;
  }
  else
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 32), "_onQueue_capabilities");
    v2 = result != 0;
    v1 = *(_QWORD *)(*(_QWORD *)(v3 + 40) + 8);
  }
  *(_BYTE *)(v1 + 24) = v2;
  return result;
}

- (void)removeCommandHandlerBlockForKey:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MRNowPlayingPlayerClientCallbacks_removeCommandHandlerBlockForKey___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __69__MRNowPlayingPlayerClientCallbacks_removeCommandHandlerBlockForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (NSArray)commandHandlerBlocks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MRNowPlayingPlayerClientCallbacks_commandHandlerBlocks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __57__MRNowPlayingPlayerClientCallbacks_commandHandlerBlocks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks
{
  dispatch_queue_t v3;

  v3 = dispatch_queue_create("com.apple.MediaRemote.PlaybackQueueNowPlayingInfo.serialQueue", 0);
  -[MRNowPlayingPlayerClientCallbacks registerNowPlayingInfoCallbacks:](self, "registerNowPlayingInfoCallbacks:", v3);
  -[MRNowPlayingPlayerClientCallbacks registerNowPlayingInfoAssetCallbacks:](self, "registerNowPlayingInfoAssetCallbacks:", v3);
  -[MRNowPlayingPlayerClientCallbacks registerNowPlayingInfoArtworkAssetCallback:](self, "registerNowPlayingInfoArtworkAssetCallback:", v3);

}

- (void)registerNowPlayingInfoCallbacks:(id)a3
{
  id v4;
  MSVMultiCallback *createItemForOffsetCallbacks;
  void *v6;
  void *v7;
  void *v8;
  MSVMultiCallback *v9;
  MSVMultiCallback *createItemToken;
  MSVMultiCallback *createItemForIdentifierCallbacks;
  void *v12;
  void *v13;
  void *v14;
  MSVMultiCallback *v15;
  MSVMultiCallback *createItemForIdentifierToken;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  if (!self->_createItemToken)
  {
    objc_initWeak(&location, self);
    createItemForOffsetCallbacks = self->_createItemForOffsetCallbacks;
    v6 = (void *)MEMORY[0x1E0D4D058];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke;
    v19[3] = &unk_1E30CD2D8;
    objc_copyWeak(&v20, &location);
    v7 = (void *)MEMORY[0x194036C44](v19);
    objc_msgSend(v6, "callbackWithQueue:block:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(createItemForOffsetCallbacks, 2, v8);
    createItemToken = self->_createItemToken;
    self->_createItemToken = v9;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  if (!self->_createItemForIdentifierToken)
  {
    objc_initWeak(&location, self);
    createItemForIdentifierCallbacks = self->_createItemForIdentifierCallbacks;
    v12 = (void *)MEMORY[0x1E0D4D058];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke_2;
    v17[3] = &unk_1E30CD300;
    objc_copyWeak(&v18, &location);
    v13 = (void *)MEMORY[0x194036C44](v17);
    objc_msgSend(v12, "callbackWithQueue:block:", v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(createItemForIdentifierCallbacks, 2, v14);
    createItemForIdentifierToken = self->_createItemForIdentifierToken;
    self->_createItemForIdentifierToken = v15;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

MRContentItem *__69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  MRContentItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  v5 = 0;
  if (!a2 && WeakRetained)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerClientForPlayerPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nowPlayingInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[MRContentItem extractedIdentifierFromNowPlayingInfo:](MRContentItem, "extractedIdentifierFromNowPlayingInfo:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MRContentItemCreate(*MEMORY[0x1E0C9AE00], (uint64_t)v10);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

MRContentItem *__69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  MRContentItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  v5 = 0;
  if (a2 && WeakRetained)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerClientForPlayerPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nowPlayingInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[MRContentItem extractedIdentifierFromNowPlayingInfo:](MRContentItem, "extractedIdentifierFromNowPlayingInfo:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", a2))
        v5 = MRContentItemCreate(*MEMORY[0x1E0C9AE00], a2);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)registerNowPlayingInfoAssetCallbacks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSVMultiCallback *v8;
  MSVMultiCallback *metadataToken;
  MSVMultiCallback *v10;
  MSVMultiCallback *languageToken;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  if (!self->_metadataToken || !self->_languageToken)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0D4D058];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __74__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoAssetCallbacks___block_invoke;
    v15 = &unk_1E30CD328;
    objc_copyWeak(&v16, &location);
    v6 = (void *)MEMORY[0x194036C44](&v12);
    objc_msgSend(v5, "callbackWithQueue:block:", v4, v6, v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_metadataToken)
    {
      v8 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(self->_metadataCallbacks, 2, v7);
      metadataToken = self->_metadataToken;
      self->_metadataToken = v8;

    }
    if (!self->_languageToken)
    {
      v10 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(self->_languageOptionsCallbacks, 2, v7);
      languageToken = self->_languageToken;
      self->_languageToken = v10;

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __74__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoAssetCallbacks___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id Error;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerClientForPlayerPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "nowPlayingInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[MRContentItem extractedIdentifierFromNowPlayingInfo:](MRContentItem, "extractedIdentifierFromNowPlayingInfo:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v16))
      {
        objc_msgSend(v13, "nowPlayingArtwork");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          MRContentItemSetHasArtworkData(v8, 1);
        objc_msgSend(v8, "setNowPlayingInfo:policy:request:", v14, 0, v7);
        Error = 0;
      }
      else
      {
        Error = (id)MRMediaRemoteCreateError(15);
      }

    }
    else
    {
      Error = 0;
    }

    v18 = (uint64_t)Error;
  }
  else
  {
    v18 = MRMediaRemoteCreateError(4);
  }
  v20 = (id)v18;
  v9[2](v9);

}

- (void)registerNowPlayingInfoArtworkAssetCallback:(id)a3
{
  id v4;
  MSVMultiCallback *artworkCallbacks;
  void *v6;
  void *v7;
  void *v8;
  MSVMultiCallback *v9;
  MSVMultiCallback *artworkToken;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  if (!self->_artworkToken)
  {
    objc_initWeak(&location, self);
    artworkCallbacks = self->_artworkCallbacks;
    v6 = (void *)MEMORY[0x1E0D4D058];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __80__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoArtworkAssetCallback___block_invoke;
    v14 = &unk_1E30CD328;
    objc_copyWeak(&v15, &location);
    v7 = (void *)MEMORY[0x194036C44](&v11);
    objc_msgSend(v6, "callbackWithQueue:block:", v4, v7, v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(artworkCallbacks, 2, v8);
    artworkToken = self->_artworkToken;
    self->_artworkToken = v9;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __80__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoArtworkAssetCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  void (**v6)(_QWORD);
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id Error;
  id v23;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerClientForPlayerPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "nowPlayingArtwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nowPlayingInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRContentItem extractedIdentifierFromNowPlayingInfo:](MRContentItem, "extractedIdentifierFromNowPlayingInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MRContentItemGetIdentifier(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v14))
    {
      v20 = v13;
      v21 = (id)objc_msgSend(v11, "copyImageData");
      MRContentItemSetArtworkData(a3, (uint64_t)v21);
      objc_msgSend(v12, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataWidth"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longValue");
      objc_msgSend(v12, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataHeight"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MRContentItemSetArtworkDataSize(a3, v16, objc_msgSend(v17, "longValue"));

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "mimeType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        MRContentItemSetArtworkMIMEType(a3, v18);

      }
      Error = 0;
      v13 = v20;
    }
    else
    {
      Error = (id)MRMediaRemoteCreateError(15);
    }

    v19 = (uint64_t)Error;
  }
  else
  {
    v19 = MRMediaRemoteCreateError(4);
  }
  v23 = (id)v19;
  v6[2](v6);

}

- (BOOL)removePlaybackQueueDataSourceCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingPlayerClientCallbacks_removePlaybackQueueDataSourceCallback___block_invoke;
  block[3] = &unk_1E30CD350;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __75__MRNowPlayingPlayerClientCallbacks_removePlaybackQueueDataSourceCallback___block_invoke(uint64_t a1)
{
  char v2;

  objc_msgSend(*(id *)(a1 + 32), "hasPlaybackQueueCallbacks");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeCallback:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeCallback:", *(_QWORD *)(a1 + 40));
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "hasPlaybackQueueCallbacks");
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MSVMultiCallback)createChildItemCallbacks
{
  return self->_createChildItemCallbacks;
}

- (MSVMultiCallback)transcriptAlignmentsCallbacks
{
  return self->_transcriptAlignmentsCallbacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableArtworkFormatsCallbacks, 0);
  objc_storeStrong((id *)&self->_formattedArtworkCallbacks, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_artworkToken, 0);
  objc_storeStrong((id *)&self->_languageToken, 0);
  objc_storeStrong((id *)&self->_metadataToken, 0);
  objc_storeStrong((id *)&self->_createItemForIdentifierToken, 0);
  objc_storeStrong((id *)&self->_createItemToken, 0);
  objc_storeStrong((id *)&self->_commandHandlerBlocks, 0);
  objc_storeStrong(&self->_audioAmplitudeSamplesCallback, 0);
  objc_storeStrong(&self->_videoThumbnailsCallback, 0);
  objc_storeStrong(&self->_endLyricsEventCallback, 0);
  objc_storeStrong(&self->_beginLyricsEventCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateRequestCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateEndCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateBeginCallback, 0);
  objc_storeStrong(&self->_playbackSessionCallback, 0);
  objc_storeStrong((id *)&self->_artworkCallbacks, 0);
  objc_storeStrong((id *)&self->_lyricsCallbacks, 0);
  objc_storeStrong((id *)&self->_transcriptAlignmentsCallbacks, 0);
  objc_storeStrong((id *)&self->_infoCallbacks, 0);
  objc_storeStrong((id *)&self->_languageOptionsCallbacks, 0);
  objc_storeStrong((id *)&self->_metadataCallbacks, 0);
  objc_storeStrong((id *)&self->_createChildItemCallbacks, 0);
  objc_storeStrong((id *)&self->_createItemForIdentifierCallbacks, 0);
  objc_storeStrong((id *)&self->_createItemForOffsetCallbacks, 0);
  objc_storeStrong((id *)&self->_createPlaybackQueueForRequestCallbacks, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
