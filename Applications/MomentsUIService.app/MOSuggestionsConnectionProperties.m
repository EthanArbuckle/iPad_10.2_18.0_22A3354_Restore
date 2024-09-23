@implementation MOSuggestionsConnectionProperties

- (MOSuggestionsConnectionProperties)init
{
  MOSuggestionsConnectionProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOSuggestionsConnectionProperties;
  result = -[MOSuggestionsConnectionProperties init](&v3, "init");
  if (result)
    result->_currentViewState = -1;
  return result;
}

- (BSServiceConnectionHost)connectionHost
{
  return self->_connectionHost;
}

- (void)setConnectionHost:(id)a3
{
  objc_storeStrong((id *)&self->_connectionHost, a3);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (void)setSceneIdentityToken:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentityToken, a3);
}

- (unint64_t)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(unint64_t)a3
{
  self->_activationState = a3;
}

- (MOSuggestionSheetOptions)pendingPresentationOptions
{
  return self->_pendingPresentationOptions;
}

- (void)setPendingPresentationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPresentationOptions, a3);
}

- (UISceneSession)session
{
  return (UISceneSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (MOSuggestionsUIServerManagerDelegate)delegate
{
  return (MOSuggestionsUIServerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)unfulfilledUpdateState
{
  return self->_unfulfilledUpdateState;
}

- (void)setUnfulfilledUpdateState:(id)a3
{
  objc_storeStrong((id *)&self->_unfulfilledUpdateState, a3);
}

- (NSNumber)unfulfilledUpdateIsAnimated
{
  return self->_unfulfilledUpdateIsAnimated;
}

- (void)setUnfulfilledUpdateIsAnimated:(id)a3
{
  objc_storeStrong((id *)&self->_unfulfilledUpdateIsAnimated, a3);
}

- (unint64_t)currentViewState
{
  return self->_currentViewState;
}

- (void)setCurrentViewState:(unint64_t)a3
{
  self->_currentViewState = a3;
}

- (BOOL)brokenPipeState
{
  return self->_brokenPipeState;
}

- (void)setBrokenPipeState:(BOOL)a3
{
  self->_brokenPipeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfulfilledUpdateIsAnimated, 0);
  objc_storeStrong((id *)&self->_unfulfilledUpdateState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_pendingPresentationOptions, 0);
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_connectionHost, 0);
}

@end
