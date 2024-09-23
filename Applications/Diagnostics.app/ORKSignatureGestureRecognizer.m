@implementation ORKSignatureGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") <= 1
    && (unint64_t)-[ORKSignatureGestureRecognizer numberOfTouches](self, "numberOfTouches") < 2)
  {
    -[ORKSignatureGestureRecognizer setState:](self, "setState:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ORKSignatureGestureRecognizer eventDelegate](self, "eventDelegate"));
    objc_msgSend(v13, "gestureTouchesBegan:withEvent:", v6, v7);

  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[ORKSignatureGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), v7, (_QWORD)v14);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ORKSignatureGestureRecognizer eventDelegate](self, "eventDelegate"));
  objc_msgSend(v8, "gestureTouchesMoved:withEvent:", v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ORKSignatureGestureRecognizer setState:](self, "setState:", 3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ORKSignatureGestureRecognizer eventDelegate](self, "eventDelegate"));
  objc_msgSend(v8, "gestureTouchesEnded:withEvent:", v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[ORKSignatureGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;

  v3 = a3;
  v4 = objc_opt_class(UIPanGestureRecognizer);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = objc_opt_class(UISwipeGestureRecognizer);
    isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  }

  return isKindOfClass & 1;
}

- (DrawingGestureRecognizerDelegate)eventDelegate
{
  return (DrawingGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end
