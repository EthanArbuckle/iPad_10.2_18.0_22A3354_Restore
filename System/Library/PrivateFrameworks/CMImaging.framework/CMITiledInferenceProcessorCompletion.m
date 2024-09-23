@implementation CMITiledInferenceProcessorCompletion

- (CMITiledInferenceProcessorCompletion)initWithHandler:(id)a3
{
  id v4;
  CMITiledInferenceProcessorCompletion *v5;
  uint64_t v6;
  id completionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMITiledInferenceProcessorCompletion;
  v5 = -[CMITiledInferenceProcessorCompletion init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D824D3C0](v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

  }
  return v5;
}

- (void)setExpectedTiles:(unint64_t)a3
{
  self->_expectedStreamCompleteCount = a3;
}

- (void)_finalCompletion
{
  if (!self->_completionHandlerExecuted)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    self->_completionHandlerExecuted = 1;
  }
}

- (void)networkTileCompletion:(int)a3
{
  unint64_t expectedStreamCompleteCount;
  unint64_t v5;
  _BOOL4 metalComplete;
  CMITiledInferenceProcessorCompletion *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a3)
    ++obj->_streamErrors;
  expectedStreamCompleteCount = obj->_expectedStreamCompleteCount;
  v5 = obj->_streamCompleteCount + 1;
  obj->_streamCompleteCount = v5;
  if (v5 >= expectedStreamCompleteCount)
  {
    obj->_streamComplete = 1;
    metalComplete = obj->_metalComplete;
    objc_sync_exit(obj);

    if (metalComplete)
      -[CMITiledInferenceProcessorCompletion _finalCompletion](obj, "_finalCompletion");
  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (void)metalCompletion:(int)a3
{
  CMITiledInferenceProcessorCompletion *v4;
  _BOOL4 streamComplete;

  v4 = self;
  objc_sync_enter(v4);
  if (a3)
    ++v4->_metalErrors;
  v4->_metalComplete = 1;
  streamComplete = v4->_streamComplete;
  objc_sync_exit(v4);

  if (streamComplete)
    -[CMITiledInferenceProcessorCompletion _finalCompletion](v4, "_finalCompletion");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
