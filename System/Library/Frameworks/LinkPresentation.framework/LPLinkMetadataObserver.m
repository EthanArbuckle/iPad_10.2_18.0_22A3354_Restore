@implementation LPLinkMetadataObserver

- (LPLinkMetadataObserver)initWithMetadata:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  LPLinkMetadataObserver *v9;
  LPLinkMetadataObserver *v10;
  void *v11;
  id callback;
  LPLinkMetadataObserver *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPLinkMetadataObserver;
  v9 = -[LPLinkMetadataObserver init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    v11 = _Block_copy(v8);
    callback = v10->_callback;
    v10->_callback = v11;

    -[LPLinkMetadata addObserver:forKeyPath:options:context:](v10->_metadata, "addObserver:forKeyPath:options:context:", v10, CFSTR("_dummyPropertyForObservation"), 0, observerContext);
    v13 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[LPLinkMetadataObserver stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)LPLinkMetadataObserver;
  -[LPLinkMetadataObserver dealloc](&v3, sel_dealloc);
}

- (void)stopObserving
{
  LPLinkMetadata *metadata;
  id callback;

  -[LPLinkMetadata removeObserver:forKeyPath:context:](self->_metadata, "removeObserver:forKeyPath:context:", self, CFSTR("_dummyPropertyForObservation"), observerContext);
  metadata = self->_metadata;
  self->_metadata = 0;

  callback = self->_callback;
  self->_callback = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)observerContext == a6 && !self->_hasScheduledCallback)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__LPLinkMetadataObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    self->_hasScheduledCallback = 1;
  }

}

uint64_t __73__LPLinkMetadataObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
