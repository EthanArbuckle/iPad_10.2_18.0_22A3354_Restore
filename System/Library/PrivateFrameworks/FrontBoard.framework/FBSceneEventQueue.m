@implementation FBSceneEventQueue

- (void)_noteQueueDidDrain
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventQueueDidDrain:", self);

}

- (void)_noteQueueDidUnlock
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventQueueDidUnlock:", self);

}

- (FBSceneEventQueueDelegate)delegate
{
  return (FBSceneEventQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
