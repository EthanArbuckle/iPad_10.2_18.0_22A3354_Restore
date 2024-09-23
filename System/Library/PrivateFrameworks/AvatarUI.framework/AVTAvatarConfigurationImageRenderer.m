@implementation AVTAvatarConfigurationImageRenderer

- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3 avatar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AVTAvatarConfigurationImageRenderer *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "lockProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AVTAvatarConfigurationImageRenderer initWithSnapshotBuilder:avatar:lockProvider:logger:](self, "initWithSnapshotBuilder:avatar:lockProvider:logger:", 0, v6, v8, v9);
  return v10;
}

- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3
{
  return -[AVTAvatarConfigurationImageRenderer initWithEnvironment:avatar:](self, "initWithEnvironment:avatar:", a3, 0);
}

- (AVTAvatarConfigurationImageRenderer)initWithSnapshotBuilder:(id)a3 avatar:(id)a4 lockProvider:(id)a5 logger:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, const char *);
  id v14;
  AVTAvatarConfigurationImageRenderer *v15;
  AVTAvatarConfigurationImageRenderer *v16;
  id *p_snapshotBuilder;
  uint64_t v18;
  OS_dispatch_queue *snapshotBuilderQueue;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, const char *))a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTAvatarConfigurationImageRenderer;
  v15 = -[AVTAvatarConfigurationImageRenderer init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_avatar, a4);
    p_snapshotBuilder = (id *)&v16->_snapshotBuilder;
    objc_storeStrong((id *)&v16->_snapshotBuilder, a3);
    v13[2](v13, "com.apple.AvatarUI.snapshotBuilderRenderingQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    snapshotBuilderQueue = v16->_snapshotBuilderQueue;
    v16->_snapshotBuilderQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_logger, a6);
    if (v16->_avatar)
    {
      if (*p_snapshotBuilder)
        objc_msgSend(*p_snapshotBuilder, "setAvatar:");
    }
  }

  return v16;
}

- (AVTMemoji)avatar
{
  AVTAvatarConfigurationImageRenderer *v2;
  AVTMemoji *avatar;
  uint64_t v4;
  AVTMemoji *v5;
  AVTSnapshotBuilder *snapshotBuilder;
  AVTMemoji *v7;

  v2 = self;
  objc_sync_enter(v2);
  avatar = v2->_avatar;
  if (!avatar)
  {
    objc_msgSend(MEMORY[0x1E0D00670], "memoji");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_avatar;
    v2->_avatar = (AVTMemoji *)v4;

    avatar = v2->_avatar;
    snapshotBuilder = v2->_snapshotBuilder;
    if (snapshotBuilder)
    {
      -[AVTSnapshotBuilder setAvatar:](snapshotBuilder, "setAvatar:", avatar);
      avatar = v2->_avatar;
    }
  }
  v7 = avatar;
  objc_sync_exit(v2);

  return v7;
}

- (AVTSnapshotBuilder)snapshotBuilder
{
  AVTSnapshotBuilder *snapshotBuilder;
  AVTSnapshotBuilder *v4;
  AVTSnapshotBuilder *v5;

  snapshotBuilder = self->_snapshotBuilder;
  if (!snapshotBuilder)
  {
    v4 = (AVTSnapshotBuilder *)objc_alloc_init(MEMORY[0x1E0D00688]);
    v5 = self->_snapshotBuilder;
    self->_snapshotBuilder = v4;

    snapshotBuilder = self->_snapshotBuilder;
    if (self->_avatar)
    {
      -[AVTSnapshotBuilder setAvatar:](snapshotBuilder, "setAvatar:");
      snapshotBuilder = self->_snapshotBuilder;
    }
  }
  return snapshotBuilder;
}

- (id)imageForAvatarConfiguration:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  v22 = 0;
  -[AVTAvatarConfigurationImageRenderer snapshotBuilderQueue](self, "snapshotBuilderQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__AVTAvatarConfigurationImageRenderer_imageForAvatarConfiguration_scope___block_invoke;
  v13[3] = &unk_1EA51E0B0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __73__AVTAvatarConfigurationImageRenderer_imageForAvatarConfiguration_scope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "nts_imageForAvatarConfiguration:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)nts_imageForAvatarConfiguration:(id)a3 scope:(id)a4
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AVTAvatarConfigurationImageRenderer logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logRenderingConfiguration:", v9);

  -[AVTAvatarConfigurationImageRenderer avatar](self, "avatar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToAvatar:animated:", v10, 0);

  v25 = *MEMORY[0x1E0D00638];
  v26[0] = &unk_1EA5718A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v6, "adaptedFramingModeForObjectType:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pose");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D00628]);
  if (v14)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D00630]);
  -[AVTAvatarConfigurationImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v6, "scale");
  objc_msgSend(v15, "imageWithSize:scale:options:", v12, v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarConfigurationImageRenderer logger](self, "logger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logSnapshotReturnedImage:", v23);

  return v21;
}

- (void)setSnapshotBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBuilder, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)snapshotBuilderQueue
{
  return self->_snapshotBuilderQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBuilderQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_snapshotBuilder, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
