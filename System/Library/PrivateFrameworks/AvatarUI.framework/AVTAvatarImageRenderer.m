@implementation AVTAvatarImageRenderer

- (OS_dispatch_queue)snapshotBuilderQueue
{
  return self->_snapshotBuilderQueue;
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
  }
  return snapshotBuilder;
}

- (AVTAvatarImageRenderer)init
{
  void *v3;
  AVTAvatarImageRenderer *v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTAvatarImageRenderer initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (AVTAvatarImageRenderer)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVTAvatarImageRenderer *v8;

  v4 = a3;
  objc_msgSend(v4, "lockProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteRenderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AVTAvatarImageRenderer initWithSnapshotBuilder:lockProvider:remoteImageRenderer:logger:](self, "initWithSnapshotBuilder:lockProvider:remoteImageRenderer:logger:", 0, v5, v6, v7);
  return v8;
}

- (AVTAvatarImageRenderer)initWithSnapshotBuilder:(id)a3 lockProvider:(id)a4 remoteImageRenderer:(id)a5 logger:(id)a6
{
  id v11;
  void (**v12)(id, const char *);
  id v13;
  id v14;
  AVTAvatarImageRenderer *v15;
  AVTAvatarImageRenderer *v16;
  uint64_t v17;
  OS_dispatch_queue *snapshotBuilderQueue;
  objc_super v20;

  v11 = a3;
  v12 = (void (**)(id, const char *))a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTAvatarImageRenderer;
  v15 = -[AVTAvatarImageRenderer init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_snapshotBuilder, a3);
    objc_storeStrong((id *)&v16->_remoteImageRenderer, a5);
    objc_storeStrong((id *)&v16->_logger, a6);
    v12[2](v12, "com.apple.AvatarUI.avatarSnapshotBuilderRenderingQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    snapshotBuilderQueue = v16->_snapshotBuilderQueue;
    v16->_snapshotBuilderQueue = (OS_dispatch_queue *)v17;

  }
  return v16;
}

- (AVTAvatarImageRenderer)initWithSceneNodeModifications:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVTAvatarImageRenderer *v9;

  -[AVTAvatarImageRenderer updateSnapshotBuilderModifications:](self, "updateSnapshotBuilderModifications:", a3);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteRenderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTAvatarImageRenderer initWithSnapshotBuilder:lockProvider:remoteImageRenderer:logger:](self, "initWithSnapshotBuilder:lockProvider:remoteImageRenderer:logger:", v8, v5, v6, v7);

  return v9;
}

- (void)updateSnapshotBuilderModifications:(id)a3
{
  id v4;
  double v5;
  int v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "verticalLensShift");
  LODWORD(v5) = 0;
  HIDWORD(v5) = v6;
  v11 = v5;
  -[AVTAvatarImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "framingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "projectionDirection");
  objc_msgSend(v4, "fieldOfView");
  v10 = v9;

  objc_msgSend(v12, "deprecated_avtui_applyModificationsForFramingMode:projectionDirectionModification:fieldOfViewModification:lensShiftModification:", v7, v8, v10, v11);
}

- (double)fieldOfViewForNodeWithName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[AVTAvatarImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deprecated_avtui_fieldOfViewForFramingMode:", v4);
  v7 = v6;

  return v7;
}

- (id)imageForAvatar:(id)a3 scope:(id)a4
{
  return -[AVTAvatarImageRenderer imageForAvatar:scope:usingService:](self, "imageForAvatar:scope:usingService:", a3, a4, 0);
}

- (id)imageForAvatar:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  return -[AVTAvatarImageRenderer imageForAvatar:scope:withSCNModifications:usingService:](self, "imageForAvatar:scope:withSCNModifications:usingService:", a3, a4, 0, a5);
}

- (id)_imageForAvatar:(id)a3 scope:(id)a4
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
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  -[AVTAvatarImageRenderer snapshotBuilderQueue](self, "snapshotBuilderQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__AVTAvatarImageRenderer__imageForAvatar_scope___block_invoke;
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

void __48__AVTAvatarImageRenderer__imageForAvatar_scope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "nts_imageForAvatar:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)imageForAvatar:(id)a3 scope:(id)a4 withSCNModifications:(id)a5 usingService:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  _QWORD *v17;
  id v18;
  dispatch_time_t v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v6)
  {
    -[AVTAvatarImageRenderer remoteImageRenderer](self, "remoteImageRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    v30 = 0;
    v15 = dispatch_semaphore_create(0);
    v16 = v15;
    if (v13)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke;
      v24[3] = &unk_1EA51E0D8;
      v24[5] = &v25;
      v17 = v24;
      v24[4] = v15;
      objc_msgSend(v14, "getSnapshotForAvatar:scope:withModifications:withReply:", v10, v11, v13, v24);
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke_2;
      v23[3] = &unk_1EA51E0D8;
      v23[5] = &v25;
      v17 = v23;
      v23[4] = v15;
      objc_msgSend(v14, "getSnapshotForAvatar:scope:withReply:", v10, v11, v23);
    }

    v19 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v19))
    {
      -[AVTAvatarImageRenderer logger](self, "logger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logTimedOutWaitingForSnapshotInService:", v21);

    }
    v18 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (v12)
      -[AVTAvatarImageRenderer updateSnapshotBuilderModifications:](self, "updateSnapshotBuilderModifications:", v12);
    -[AVTAvatarImageRenderer _imageForAvatar:scope:](self, "_imageForAvatar:scope:", v10, v11);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)nts_imageForAvatar:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AVTAvatarImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setAvatar:", v7);

  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
    v9 = 1;
  else
    v9 = 2;
  v22 = *MEMORY[0x1E0D00638];
  v23[0] = &unk_1EA571800;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v6, "adaptedFramingModeForObjectType:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pose");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D00628]);
  if (v13)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D00630]);
  -[AVTAvatarImageRenderer snapshotBuilder](self, "snapshotBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v6, "scale");
  objc_msgSend(v14, "imageWithSize:scale:options:", v11, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setSnapshotBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBuilder, a3);
}

- (AVTAvatarRemoteImageRenderer)remoteImageRenderer
{
  return self->_remoteImageRenderer;
}

- (void)setRemoteImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteImageRenderer, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBuilderQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_remoteImageRenderer, 0);
  objc_storeStrong((id *)&self->_snapshotBuilder, 0);
}

@end
