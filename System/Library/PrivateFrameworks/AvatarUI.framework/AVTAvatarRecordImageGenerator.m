@implementation AVTAvatarRecordImageGenerator

+ (id)supportedScopesForScale:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTRenderingScope listControllerThumbnailScope](AVTRenderingScope, "listControllerThumbnailScope", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  +[AVTRenderingScope funCamCarouselThumbnailScope](AVTRenderingScope, "funCamCarouselThumbnailScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 renderer:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarRecordImageGenerator *v12;
  AVTAvatarRecordImageGenerator *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *scopes;
  uint64_t v18;
  AVTUILogger *logger;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTAvatarRecordImageGenerator;
  v12 = -[AVTAvatarRecordImageGenerator init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageStore, a3);
    objc_storeStrong((id *)&v13->_renderer, a4);
    v14 = (void *)objc_opt_class();
    objc_msgSend(v11, "mainScreenScale");
    objc_msgSend(v14, "supportedScopesForScale:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    scopes = v13->_scopes;
    v13->_scopes = (NSArray *)v16;

    objc_msgSend(v11, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v18;

    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 coreEnvironment:(id)a4
{
  id v7;
  id v8;
  AVTAvatarRecordImageGenerator *v9;
  AVTAvatarRecordImageGenerator *v10;
  uint64_t v11;
  AVTUILogger *logger;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarRecordImageGenerator;
  v9 = -[AVTAvatarRecordImageGenerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageStore, a3);
    objc_msgSend(v8, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v10->_logger;
    v10->_logger = (AVTUILogger *)v11;

  }
  return v10;
}

- (AVTCoreModel)coreModel
{
  void *v2;
  void *v3;

  -[AVTAvatarRecordImageGenerator environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorCoreModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTCoreModel *)v3;
}

- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  AVTAvatarRecordCacheableResource *v12;
  void *v13;
  AVTAvatarRecordCacheableResource *v14;
  void *v15;
  AVTAvatarRecordCacheableResource *v16;
  id v17;
  int v18;
  _QWORD v20[5];
  AVTAvatarRecordCacheableResource *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  -[AVTAvatarRecordImageGenerator coreModel](self, "coreModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarConfiguration configurationFromAvatar:coreModel:](AVTAvatarConfiguration, "configurationFromAvatar:coreModel:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [AVTAvatarRecordCacheableResource alloc];
  -[AVTAvatarRecordImageGenerator environment](self, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v12, "initWithAvatarRecord:includeAvatarData:environment:", v8, 0, v13);

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  -[AVTAvatarRecordImageGenerator scopes](self, "scopes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecord_avatar_error___block_invoke;
  v20[3] = &unk_1EA51CF00;
  v23 = &v31;
  v20[4] = self;
  v16 = v14;
  v21 = v16;
  v17 = v11;
  v22 = v17;
  v24 = &v25;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);

  v18 = *((unsigned __int8 *)v32 + 24);
  if (a5 && !*((_BYTE *)v32 + 24))
    *a5 = objc_retainAutorelease((id)v26[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18 != 0;
}

void __80__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecord_avatar_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v6, "generateThumbnailForAvatarRecordItem:avatarConfiguration:scope:error:", v7, v8, a2, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v10;
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke;
  v9[3] = &unk_1EA51CF28;
  v9[5] = &v16;
  v9[6] = &v10;
  v9[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((_BYTE *)v17 + 24))
    *a4 = objc_retainAutorelease((id)v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7 != 0;
}

void __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  AVTAvatarRecordCacheableResource *v9;
  void *v10;
  AVTAvatarRecordCacheableResource *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  AVTAvatarRecordCacheableResource *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  AVTAvatarRecordCacheableResource *v22;
  id v23;
  __int128 v24;

  v6 = a2;
  v7 = (void *)MEMORY[0x1E0D00850];
  v20 = v6;
  objc_msgSend(v6, "avatarData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "canLoadAvatarWithData:", v8);

  if ((v7 & 1) != 0)
  {
    v9 = [AVTAvatarRecordCacheableResource alloc];
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v9, "initWithAvatarRecord:includeAvatarData:environment:", v20, 0, v10);

    objc_msgSend(*(id *)(a1 + 32), "coreModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarConfiguration configurationForRecord:coreModel:](AVTAvatarConfiguration, "configurationForRecord:coreModel:", v20, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scopes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke_2;
    v21[3] = &unk_1EA51CF00;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v11;
    v23 = v13;
    v24 = *(_OWORD *)(a1 + 40);
    v15 = v13;
    v16 = v11;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 702, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *a4 = 1;
  }

}

void __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v6, "generateThumbnailForAvatarRecordItem:avatarConfiguration:scope:error:", v7, v8, a2, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v10;
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailForAvatarRecordItem:(id)a3 avatarConfiguration:(id)a4 scope:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v26;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  -[AVTAvatarRecordImageGenerator logger](self, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "record");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logGeneratingImageForRecord:scope:type:", v15, v16, objc_msgSend(v11, "renderingType"));

  -[AVTAvatarRecordImageGenerator renderer](self, "renderer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("I'm asked to render images but I did not get a renderer"));
  -[AVTAvatarRecordImageGenerator renderer](self, "renderer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageForAvatarConfiguration:scope:", v12, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarRecordImageGenerator imageStore](self, "imageStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v21 = objc_msgSend(v20, "saveImage:forItem:scope:error:", v19, v10, v11, &v26);
  v22 = v26;

  if ((v21 & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v22);
    -[AVTAvatarRecordImageGenerator logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logGeneratingImageError:", v24);

  }
  return v21;
}

- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarRecordImageGenerator_deleteThumbnailsForAvatarRecordsWithIdentifiers_error___block_invoke;
  v9[3] = &unk_1EA51CF50;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((_BYTE *)v17 + 24))
    *a4 = objc_retainAutorelease((id)v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7 != 0;
}

void __87__AVTAvatarRecordImageGenerator_deleteThumbnailsForAvatarRecordsWithIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id obj;

  +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:](AVTAvatarRecordCacheableResource, "persistentIdentifierPrefixForRecordWithIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "deleteImagesForItemsWithPersistentIdentifierPrefix:error:", v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:](AVTAvatarRecordCacheableResource, "persistentIdentifierPrefixForRecordWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:](AVTAvatarRecordCacheableResource, "persistentIdentifierPrefixForRecordWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarRecordImageGenerator imageStore](self, "imageStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v13, "copyImagesForPersistentIdentifierPrefix:toPersistentIdentifierPrefix:error:", v10, v12, a5);

  return (char)a5;
}

- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  AVTAvatarRecordImageGenerator *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke;
  v23[3] = &unk_1EA51CFB8;
  v23[4] = self;
  v10 = v8;
  v24 = v10;
  v11 = (void *)MEMORY[0x1DF0D0754](v23);
  -[AVTAvatarRecordImageGenerator logger](self, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_3;
  v17[3] = &unk_1EA51CFE0;
  v18 = v6;
  v19 = self;
  v20 = v10;
  v21 = v11;
  v22 = v7;
  v13 = v7;
  v14 = v10;
  v15 = v11;
  v16 = v6;
  objc_msgSend(v12, "updatingThumbnailsForRemoteChanges:", v17);

}

uint64_t __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "avt_map:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v23 = 0;
  v6 = objc_msgSend(v5, "deleteThumbnailsForAvatarRecordsWithIdentifiers:error:", v4, &v23);
  v7 = v23;
  if ((v6 & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v18 = v7;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!objc_msgSend(v13, "changeType"))
          {
            v14 = *(void **)(a1 + 40);
            objc_msgSend(v13, "recordIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
      v7 = v18;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logErrorDeletingSomeThumbnail:", v16);

  }
  return v6;
}

uint64_t __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordIdentifier");
}

void __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v24 = 0;
  v6 = objc_msgSend(v2, "processChangeTransactionsWithChangeTokenLocation:handler:error:", v4, v5, &v24);
  v7 = v24;

  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logErrorProcessingChangeTransactionsToUpdateThumbnails:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "renderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
          {
            v18 = *(void **)(a1 + 40);
            v25 = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1, (_QWORD)v20);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "generateThumbnailsForAvatarRecords:error:", v19, 0);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v13);
    }

  }
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  return self->_renderer;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
}

@end
