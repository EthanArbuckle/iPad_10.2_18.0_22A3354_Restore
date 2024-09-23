@implementation LPAVPlayerViewController

- (void)dealloc
{
  objc_super v3;

  if (self->_readyForDisplayCallback)
    -[LPAVPlayerViewController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &readyForDisplayKVOContext_0);
  v3.receiver = self;
  v3.super_class = (Class)LPAVPlayerViewController;
  -[LPAVPlayerViewController dealloc](&v3, sel_dealloc);
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void *v4;
  id readyForDisplayCallback;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (-[LPAVPlayerViewController isReadyForDisplay](self, "isReadyForDisplay"))
  {
    aBlock[2]();
  }
  else
  {
    if (!self->_readyForDisplayCallback)
      -[LPAVPlayerViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 0, &readyForDisplayKVOContext_0);
    v4 = _Block_copy(aBlock);
    readyForDisplayCallback = self->_readyForDisplayCallback;
    self->_readyForDisplayCallback = v4;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &readyForDisplayKVOContext_0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__LPAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)LPAVPlayerViewController;
    -[LPAVPlayerViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __75__LPAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1896);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1896);
    *(_QWORD *)(v3 + 1896) = 0;

    return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("readyForDisplay"), &readyForDisplayKVOContext_0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyForDisplayCallback, 0);
}

@end
