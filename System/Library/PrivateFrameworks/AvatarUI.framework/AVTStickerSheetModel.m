@implementation AVTStickerSheetModel

+ (id)sheetModelForAvatarRecord:(id)a3 withConfigurations:(id)a4 cache:(id)a5 taskScheduler:(id)a6 renderingQueue:(id)a7 encodingQueue:(id)a8 stickerGeneratorPool:(id)a9 imageProvider:(id)a10 environment:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  AVTUIStickerItem *v35;
  void *v36;
  AVTUIStickerItem *v37;
  void *v38;
  void *v39;
  void *v40;
  AVTUIStickerPlaceholderProviderFactory *v41;
  void *v42;
  id v44;
  id v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  AVTUIStickerRenderer *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v45 = a10;
  v44 = a11;
  v23 = v16;
  v50 = v19;
  v51 = v18;
  v48 = v21;
  v49 = v20;
  v46 = v22;
  v53 = -[AVTUIStickerRenderer initWithAvatarRecord:cache:renderingScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:environment:]([AVTUIStickerRenderer alloc], "initWithAvatarRecord:cache:renderingScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:environment:", v16, v18, v19, v20, v21, v22, v44);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v17;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v55 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:](v53, "scheduledStickerResourceProviderForStickerConfiguration:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@_%@"), v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = [AVTUIStickerItem alloc];
        objc_msgSend(v29, "localizedName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[AVTUIStickerItem initWithIdentifier:localizedName:resourceProvider:](v35, "initWithIdentifier:localizedName:resourceProvider:", v34, v36, v30);

        objc_msgSend(v24, "addObject:", v37);
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v26);
  }

  +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "providerForRecord:scope:", v23, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");

  v41 = -[AVTUIStickerPlaceholderProviderFactory initWithImageProvider:]([AVTUIStickerPlaceholderProviderFactory alloc], "initWithImageProvider:", v40);
  v42 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAvatarRecord:stickerItems:stickerRenderer:taskScheduler:placeholderProviderFactory:environment:", v23, v24, v53, v50, v41, v44);

  return v42;
}

- (AVTStickerSheetModel)initWithAvatarRecord:(id)a3 stickerItems:(id)a4 stickerRenderer:(id)a5 taskScheduler:(id)a6 placeholderProviderFactory:(id)a7 environment:(id)a8
{
  id v15;
  id v16;
  id v17;
  AVTStickerSheetModel *v18;
  AVTStickerSheetModel *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerSheetModel;
  v18 = -[AVTStickerSheetModel init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_avatarRecord, a3);
    objc_storeStrong((id *)&v19->_stickerItems, a4);
    objc_storeStrong((id *)&v19->_stickerRenderer, a5);
    objc_storeStrong((id *)&v19->_placeholderProviderFactory, a7);
    objc_storeStrong((id *)&v19->_environment, a8);
    objc_storeStrong((id *)&v19->_taskScheduler, a6);
  }

  return v19;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUIStickerPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end
