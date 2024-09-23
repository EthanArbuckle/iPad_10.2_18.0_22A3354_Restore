@implementation AVTouchGestureRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 1;
}

- (void)reset
{
  NSMutableArray *candidateGestureIncrementsMultiTouchInfo;
  NSTimer *gestureWarmUpDelayTimer;

  candidateGestureIncrementsMultiTouchInfo = self->_candidateGestureIncrementsMultiTouchInfo;
  self->_candidateGestureIncrementsMultiTouchInfo = 0;

  -[NSTimer invalidate](self->_gestureWarmUpDelayTimer, "invalidate");
  gestureWarmUpDelayTimer = self->_gestureWarmUpDelayTimer;
  self->_gestureWarmUpDelayTimer = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *candidateGestureIncrementsMultiTouchInfo;
  void *v10;
  NSTimer *v11;
  NSTimer *gestureWarmUpDelayTimer;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  candidateGestureIncrementsMultiTouchInfo = self->_candidateGestureIncrementsMultiTouchInfo;
  self->_candidateGestureIncrementsMultiTouchInfo = v8;

  -[AVTouchGestureRecognizer _addCandidateGestureIncrementForTouches:]((id *)&self->super.super.isa, v6);
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0C99E88];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__AVTouchGestureRecognizer_touchesBegan_withEvent___block_invoke;
  v13[3] = &unk_1E5BB49A8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 0.0);
  v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  gestureWarmUpDelayTimer = self->_gestureWarmUpDelayTimer;
  self->_gestureWarmUpDelayTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[AVTouchGestureRecognizer _addCandidateGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  if (-[NSMutableArray count](self->_candidateGestureIncrementsMultiTouchInfo, "count") == 7)
    -[AVTouchGestureRecognizer _evaluateCandidateGestureIncrements](self);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (self)
  {
    if (-[AVTouchGestureRecognizer state](self, "state", a3, a4) == 1)
      v5 = 3;
    else
      v5 = 5;
    -[AVTouchGestureRecognizer setState:](self, "setState:", v5);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (self)
  {
    if (-[AVTouchGestureRecognizer state](self, "state", a3, a4) == 1)
      v5 = 4;
    else
      v5 = 5;
    -[AVTouchGestureRecognizer setState:](self, "setState:", v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateGestureIncrementsMultiTouchInfo, 0);
  objc_storeStrong((id *)&self->_gestureWarmUpDelayTimer, 0);
}

- (void)_addCandidateGestureIncrementForTouches:(id *)a1
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v3 = (unint64_t)objc_msgSend(a1, "numberOfTouches") > 1 || (unint64_t)objc_msgSend(v5, "count") > 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[35], "addObject:", v4);

  }
}

- (_QWORD)_evaluateCandidateGestureIncrements
{
  _QWORD *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (_QWORD *)objc_msgSend(result, "state");
    if (!result)
    {
      v2 = (void *)v1[35];
      if (v2)
      {
        v9 = 0u;
        v10 = 0u;
        v11 = 0u;
        v12 = 0u;
        v3 = v2;
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
        {
          v5 = v4;
          v6 = *(_QWORD *)v10;
          v7 = 5;
LABEL_7:
          v8 = 0;
          while (1)
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v3);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "BOOLValue", (_QWORD)v9) & 1) != 0)
              break;
            if (v5 == ++v8)
            {
              v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
              if (v5)
                goto LABEL_7;
              goto LABEL_13;
            }
          }
        }
        else
        {
LABEL_13:
          v7 = 1;
        }

        return (_QWORD *)objc_msgSend(v1, "setState:", v7);
      }
    }
  }
  return result;
}

void __51__AVTouchGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVTouchGestureRecognizer _evaluateCandidateGestureIncrements](WeakRetained);

}

@end
