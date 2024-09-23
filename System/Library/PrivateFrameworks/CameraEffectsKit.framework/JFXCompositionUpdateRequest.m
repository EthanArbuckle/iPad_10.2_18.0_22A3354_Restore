@implementation JFXCompositionUpdateRequest

- (JFXCompositionUpdateRequest)initWithBlock:(id)a3
{
  JFXCompositionUpdateRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXCompositionUpdateRequest;
  result = -[JFXCompositionPlayerRequest initWithBlock:ofType:](&v4, sel_initWithBlock_ofType_, a3, 1);
  if (result)
  {
    result->_readyForDisplayReceived = 0;
    result->_refreshCompletedReceived = 0;
  }
  return result;
}

- (void)setReadyForDisplayReceived
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  JFXCompositionUpdateRequest *v7;
  int v8;
  JFXCompositionUpdateRequest *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Request %{public}@ ready for display", (uint8_t *)&v8, 0xCu);
  }

  self->_readyForDisplayReceived = 1;
  JFXPlaybackEventSignpostPointCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      -[JFXCompositionPlayerRequest uniqueID](self, "uniqueID");
      v7 = (JFXCompositionUpdateRequest *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v4, OS_SIGNPOST_EVENT, v6, "CompositionUpdateRequest", "ready for display received from AV layer for request id %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)setRefreshCompletedReceived
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  JFXCompositionUpdateRequest *v7;
  int v8;
  JFXCompositionUpdateRequest *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Request %{public}@ refresh completed", (uint8_t *)&v8, 0xCu);
  }

  self->_refreshCompletedReceived = 1;
  JFXPlaybackEventSignpostPointCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      -[JFXCompositionPlayerRequest uniqueID](self, "uniqueID");
      v7 = (JFXCompositionUpdateRequest *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v4, OS_SIGNPOST_EVENT, v6, "CompositionUpdateRequest", "refresh completed received from compositor for request id %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (BOOL)hasCompleted
{
  return self->_readyForDisplayReceived && self->_refreshCompletedReceived;
}

- (void)didEnqueue
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  int v6;
  JFXCompositionUpdateRequest *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXPlaybackEventSignpostPointCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = 138412290;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_EVENT, v5, "CompositionUpdateRequest", "enqueue %@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)didBegin
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  int v6;
  JFXCompositionUpdateRequest *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = 138543362;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CompositionUpdateRequest", "Request %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)didComplete
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_END, v5, "CompositionUpdateRequest", "succeeded", v6, 2u);
    }
  }

}

- (void)didCancel
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CompositionUpdateRequest", "cancelled", v6, 2u);
    }
  }

}

@end
