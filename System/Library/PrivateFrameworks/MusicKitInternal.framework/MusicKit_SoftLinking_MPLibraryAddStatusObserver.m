@implementation MusicKit_SoftLinking_MPLibraryAddStatusObserver

- (MusicKit_SoftLinking_MPLibraryAddStatusObserver)initWithIdentifyingModelObject:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPLibraryAddStatusObserver *v5;
  id MPModelObjectClass_0;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  MPLibraryAddStatusObserver *v11;
  MPLibraryAddStatusObserver *underlyingLibraryAddStatusObserver;
  MPLibraryAddStatusObserver *v13;
  uint64_t *v14;
  void *v15;
  MPLibraryAddStatusObserver *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  int v27;
  char v28;
  objc_super v29;
  id location[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MusicKit_SoftLinking_MPLibraryAddStatusObserver;
  v5 = -[MusicKit_SoftLinking_MPLibraryAddStatusObserver init](&v29, sel_init);
  if (v5)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2810000000;
    v26 = &unk_1D7773F6B;
    v27 = 0;
    v28 = 0;
    MPModelObjectClass_0 = getMPModelObjectClass_0();
    v7 = (void *)MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke;
    v20[3] = &unk_1E9C057C8;
    v22 = &v23;
    v8 = v4;
    v21 = v8;
    objc_msgSend(MPModelObjectClass_0, "performWithoutEnforcement:", v20);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v9 = (void *)getMPLibraryAddStatusObserverClass_softClass;
    v34 = getMPLibraryAddStatusObserverClass_softClass;
    if (!getMPLibraryAddStatusObserverClass_softClass)
    {
      location[0] = v7;
      location[1] = (id)3221225472;
      location[2] = __getMPLibraryAddStatusObserverClass_block_invoke;
      location[3] = &unk_1E9C05688;
      location[4] = &v31;
      __getMPLibraryAddStatusObserverClass_block_invoke((uint64_t)location);
      v9 = (void *)v32[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v31, 8);
    v11 = (MPLibraryAddStatusObserver *)objc_alloc_init(v10);
    underlyingLibraryAddStatusObserver = v5->_underlyingLibraryAddStatusObserver;
    v5->_underlyingLibraryAddStatusObserver = v11;

    v13 = v5->_underlyingLibraryAddStatusObserver;
    v14 = v24;
    objc_msgSend(v8, "_underlyingModelObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPLibraryAddStatusObserver setConfiguration:identifyingModelObject:](v13, "setConfiguration:identifyingModelObject:", *((unsigned int *)v14 + 8) | ((unint64_t)*((unsigned __int8 *)v14 + 36) << 32), v15);

    objc_initWeak(location, v5);
    v16 = v5->_underlyingLibraryAddStatusObserver;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke_2;
    v18[3] = &unk_1E9C06090;
    objc_copyWeak(&v19, location);
    -[MPLibraryAddStatusObserver setStatusBlock:](v16, "setStatusBlock:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);

    _Block_object_dispose(&v23, 8);
  }

  return v5;
}

- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CCDE28]);
  -[MPLibraryAddStatusObserver identifyingModelObject](self->_underlyingLibraryAddStatusObserver, "identifyingModelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUnderlyingModelObject:", v4);

  return (MusicKit_SoftLinking_MPModelObject *)v5;
}

- (void)setIdentifyingModelObject:(id)a3
{
  id v4;
  id MPModelObjectClass_0;
  id v6;
  MPLibraryAddStatusObserver *underlyingLibraryAddStatusObserver;
  uint64_t *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  int v17;
  char v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2810000000;
  v16 = &unk_1D7773F6B;
  v17 = 0;
  v18 = 0;
  MPModelObjectClass_0 = getMPModelObjectClass_0();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__MusicKit_SoftLinking_MPLibraryAddStatusObserver_setIdentifyingModelObject___block_invoke;
  v10[3] = &unk_1E9C057C8;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend(MPModelObjectClass_0, "performWithoutEnforcement:", v10);
  underlyingLibraryAddStatusObserver = self->_underlyingLibraryAddStatusObserver;
  v8 = v14;
  objc_msgSend(v6, "_underlyingModelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryAddStatusObserver setConfiguration:identifyingModelObject:](underlyingLibraryAddStatusObserver, "setConfiguration:identifyingModelObject:", *((unsigned int *)v8 + 8) | ((unint64_t)*((unsigned __int8 *)v8 + 36) << 32), v9);

  _Block_object_dispose(&v13, 8);
}

- (int64_t)currentStatus
{
  return -[MusicKit_SoftLinking_MPLibraryAddStatusObserver _libraryAddStatusFromUnderlyingStatus:](self, "_libraryAddStatusFromUnderlyingStatus:", -[MPLibraryAddStatusObserver currentStatus](self->_underlyingLibraryAddStatusObserver, "currentStatus"));
}

- (void)_handleUpdatedUnderlyingLibraryAddStatus:(int64_t)a3
{
  int64_t v4;
  void (**statusBlock)(id, int64_t);

  v4 = -[MusicKit_SoftLinking_MPLibraryAddStatusObserver _libraryAddStatusFromUnderlyingStatus:](self, "_libraryAddStatusFromUnderlyingStatus:", a3);
  statusBlock = (void (**)(id, int64_t))self->_statusBlock;
  if (statusBlock)
    statusBlock[2](statusBlock, v4);
}

- (int64_t)_libraryAddStatusFromUnderlyingStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xA)
    return 0;
  else
    return a3;
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
  objc_storeStrong((id *)&self->_underlyingLibraryAddStatusObserver, 0);
}

@end
