@implementation MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver

- (MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver)initWithIdentifyingModelObject:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver *v5;
  id MPModelObjectClass;
  void *v7;
  void *v8;
  objc_class *v9;
  MPLibraryKeepLocalStatusObserver *v10;
  MPLibraryKeepLocalStatusObserver *underlyingLibraryKeepLocalStatusObserver;
  MPLibraryKeepLocalStatusObserver *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  objc_super v25;
  id location[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver;
  v5 = -[MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver init](&v25, sel_init);
  if (v5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    MPModelObjectClass = getMPModelObjectClass();
    v7 = (void *)MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke;
    v16[3] = &unk_1E9C057C8;
    v18 = &v19;
    v17 = v4;
    objc_msgSend(MPModelObjectClass, "performWithoutEnforcement:", v16);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v8 = (void *)getMPLibraryKeepLocalStatusObserverClass_softClass;
    v30 = getMPLibraryKeepLocalStatusObserverClass_softClass;
    if (!getMPLibraryKeepLocalStatusObserverClass_softClass)
    {
      location[0] = v7;
      location[1] = (id)3221225472;
      location[2] = __getMPLibraryKeepLocalStatusObserverClass_block_invoke;
      location[3] = &unk_1E9C05688;
      location[4] = &v27;
      __getMPLibraryKeepLocalStatusObserverClass_block_invoke((uint64_t)location);
      v8 = (void *)v28[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v27, 8);
    v10 = (MPLibraryKeepLocalStatusObserver *)objc_alloc_init(v9);
    underlyingLibraryKeepLocalStatusObserver = v5->_underlyingLibraryKeepLocalStatusObserver;
    v5->_underlyingLibraryKeepLocalStatusObserver = v10;

    -[MPLibraryKeepLocalStatusObserver setConfiguration:](v5->_underlyingLibraryKeepLocalStatusObserver, "setConfiguration:", v20[5]);
    objc_initWeak(location, v5);
    v12 = v5->_underlyingLibraryKeepLocalStatusObserver;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke_2;
    v14[3] = &unk_1E9C05C98;
    objc_copyWeak(&v15, location);
    -[MPLibraryKeepLocalStatusObserver setStatusBlock:](v12, "setStatusBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);

    _Block_object_dispose(&v19, 8);
  }

  return v5;
}

- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CCDE28]);
  -[MPLibraryKeepLocalStatusObserver configuration](self->_underlyingLibraryKeepLocalStatusObserver, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifyingModelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUnderlyingModelObject:", v5);

  return (MusicKit_SoftLinking_MPModelObject *)v6;
}

- (void)setIdentifyingModelObject:(id)a3
{
  id v4;
  id MPModelObjectClass;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  MPModelObjectClass = getMPModelObjectClass();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __83__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_setIdentifyingModelObject___block_invoke;
  v10 = &unk_1E9C057C8;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend(MPModelObjectClass, "performWithoutEnforcement:", &v7);
  -[MPLibraryKeepLocalStatusObserver setConfiguration:](self->_underlyingLibraryKeepLocalStatusObserver, "setConfiguration:", v14[5], v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)currentStatus
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[MPLibraryKeepLocalStatusObserver currentStatus](self->_underlyingLibraryKeepLocalStatusObserver, "currentStatus");
  return -[MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver _activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:](self, "_activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:", v4, v5, -[MPLibraryKeepLocalStatusObserver downloadPausedReason](self->_underlyingLibraryKeepLocalStatusObserver, "downloadPausedReason"));
}

- (void)calculateDownloadProgressWithIdentifyingModelObject:(id)a3 children:(id)a4
{
  id v6;
  id v7;
  id MPModelObjectClass;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver *v14;

  v6 = a3;
  v7 = a4;
  MPModelObjectClass = getMPModelObjectClass();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke;
  v11[3] = &unk_1E9C05CE8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(MPModelObjectClass, "performWithoutEnforcement:", v11);

}

- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)_activeKeepLocalStatusFromUnderlyingStatus:(SEL)a3 underlyingDownloadPauseReasons:(MPLibraryActiveKeepLocalStatus)a4
{
  int64_t var0;

  if ((unint64_t)(a4.var0 - 1) >= 6)
    var0 = 0;
  else
    var0 = a4.var0;
  retstr->var0 = var0;
  retstr->var1 = a5 & 7;
  retstr->var2 = a4.var1;
  return self;
}

- (void)_handleUpdatedUnderlyingActiveKeepLocalStatus:(MPLibraryActiveKeepLocalStatus)a3
{
  double var1;
  int64_t var0;
  uint64_t v6;
  _QWORD *statusBlock;
  void (*v8)(_QWORD *, __int128 *);
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[MPLibraryKeepLocalStatusObserver downloadPausedReason](self->_underlyingLibraryKeepLocalStatusObserver, "downloadPausedReason");
  v11 = 0uLL;
  v12 = 0;
  -[MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver _activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:](self, "_activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:", var0, *(_QWORD *)&var1, v6);
  statusBlock = self->_statusBlock;
  if (statusBlock)
  {
    v8 = (void (*)(_QWORD *, __int128 *))statusBlock[2];
    v9 = v11;
    v10 = v12;
    v8(statusBlock, &v9);
  }
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (void)setStatusBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryKeepLocalStatusObserver, 0);
}

@end
