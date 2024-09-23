@implementation _MKUserInteractionGestureRecognizer

- (void)setTouchObserver:(id)a3
{
  objc_storeWeak((id *)&self->_touchObserver, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  NSMutableSet *activeTouches;
  NSMutableSet *v7;
  NSMutableSet *v8;
  uint64_t v9;
  BOOL v10;
  id WeakRetained;
  id v12;

  v12 = a3;
  v5 = -[NSMutableSet count](self->_activeTouches, "count");
  activeTouches = self->_activeTouches;
  if (!activeTouches)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_activeTouches;
    self->_activeTouches = v7;

    activeTouches = self->_activeTouches;
  }
  -[NSMutableSet unionSet:](activeTouches, "unionSet:", v12);
  v9 = -[NSMutableSet count](self->_activeTouches, "count");
  if (v5)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    objc_msgSend(WeakRetained, "gestureRecognizerTouchesBegan:", self);

    -[_MKUserInteractionGestureRecognizer setState:](self, "setState:", 1);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v5 = -[NSMutableSet count](self->_activeTouches, "count");
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", v9);
  v6 = -[NSMutableSet count](self->_activeTouches, "count");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    objc_msgSend(WeakRetained, "gestureRecognizerTouchesEnded:", self);

    -[_MKUserInteractionGestureRecognizer setState:](self, "setState:", 3);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v5 = -[NSMutableSet count](self->_activeTouches, "count");
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", v9);
  v6 = -[NSMutableSet count](self->_activeTouches, "count");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    objc_msgSend(WeakRetained, "gestureRecognizerTouchesCanceled:", self);

    -[_MKUserInteractionGestureRecognizer setState:](self, "setState:", 4);
  }

}

- (_MKUserInteractionGestureRecognizerTouchObserver)touchObserver
{
  return (_MKUserInteractionGestureRecognizerTouchObserver *)objc_loadWeakRetained((id *)&self->_touchObserver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchObserver);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end
