@implementation PKDrawingReplayController

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingGestureRecognizer);
  objc_msgSend(WeakRetained, "setIsReplaying:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PKDrawingReplayController;
  -[PKDrawingReplayController dealloc](&v4, sel_dealloc);
}

+ (BOOL)isDrawingInProgressForWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char HasVisible;
  void *v7;
  char v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "canvasController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HasVisible = -[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v5);

  objc_msgSend(v4, "drawingGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "drawingTargetIsDrawing");

  objc_msgSend(v4, "drawingGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isReplaying");

  return v8 | HasVisible | v10;
}

- (PKDrawingReplayController)initWithSourceTextField:(id)a3
{
  id v4;
  PKDrawingReplayController *v5;
  PKDrawingReplayController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDrawingReplayController;
  v5 = -[PKDrawingReplayController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textField, v4);
    -[PKDrawingReplayController _setUpIfNecessary](v6, "_setUpIfNecessary");
  }

  return v6;
}

- (PKDrawingReplayController)initWithDrawing:(id)a3 transform:(CGAffineTransform *)a4 sourceTextField:(id)a5
{
  id v9;
  id v10;
  PKDrawingReplayController *v11;
  PKDrawingReplayController *v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKDrawingReplayController;
  v11 = -[PKDrawingReplayController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_textField, v10);
    objc_storeStrong((id *)&v12->_drawing, a3);
    v12->_originOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    v13 = *(_OWORD *)&a4->a;
    v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v12->_transform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v12->_transform.c = v14;
    *(_OWORD *)&v12->_transform.a = v13;
    v12->_speedRatio = 1.0;
    -[PKDrawingReplayController _setUpIfNecessary](v12, "_setUpIfNecessary");
  }

  return v12;
}

- (id)pencilTextInputInteractionFromWindowScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3DB0], "activeTextEffectsWindowForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "editingOverlayViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "pencilTextInputInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDisablePencilInput:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)disablePencilInput
{
  void *v2;
  char v3;

  -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (void)_setUpIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[PKDrawingReplayController setupComplete](self, "setupComplete"))
  {
    -[PKDrawingReplayController textField](self, "textField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingReplayController pencilTextInputInteractionFromWindowScene:](self, "pencilTextInputInteractionFromWindowScene:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PKDrawingReplayController setTextInputInteraction:](self, "setTextInputInteraction:", v6);
      objc_msgSend(v6, "drawingGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingReplayController setDrawingGestureRecognizer:](self, "setDrawingGestureRecognizer:", v7);

      -[PKDrawingReplayController setSetupComplete:](self, "setSetupComplete:", 1);
      -[PKDrawingReplayController _loadPointArray](self, "_loadPointArray");
    }
    else
    {
      v8 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "textInputInteraction";
        _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

- (void)beginInsertTextAnimationAtIndex:(unint64_t)a3 offset:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[8];
  double v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  CGRect v32;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  if (-[PKDrawingReplayController isAnimating](self, "isAnimating"))
  {
    v10 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "Trying to begin replay animation, but an animation is currently running, skipping.", buf, 2u);
    }
  }
  else
  {
    -[PKDrawingReplayController textField](self, "textField");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject beginningOfDocument](v10, "beginningOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject positionFromPosition:offset:](v10, "positionFromPosition:offset:", v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NSObject caretRectForPosition:](v10, "caretRectForPosition:", v12);
      v14 = x + v13;
      -[NSObject bounds](v10, "bounds");
      -[NSObject textRectForBounds:](v10, "textRectForBounds:");
      v15 = v14 + v32.origin.x;
      v16 = y + CGRectGetMidY(v32);
      v28 = unk_1BE4FF068;
      v29 = unk_1BE4FF078;
      v30 = unk_1BE4FF088;
      v31 = 0;
      v25 = unk_1BE4FF038;
      v26 = unk_1BE4FF048;
      v27 = unk_1BE4FF058;
      -[PKDrawingReplayController _beginDrawing](self, "_beginDrawing");
      -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)buf = v15;
      v23 = v16;
      v24 = 0x3FE0000000000000;
      objc_msgSend(v17, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", buf, v10, 23, 1);

      -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingReplayController textField](self, "textField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__PKDrawingReplayController_beginInsertTextAnimationAtIndex_offset_completion___block_invoke;
      v20[3] = &unk_1E7778740;
      v20[4] = self;
      v21 = v9;
      objc_msgSend(v18, "simulateReserveSpaceForTextInputView:location:completion:", v19, v20, v15, v16);

    }
  }

}

uint64_t __79__PKDrawingReplayController_beginInsertTextAnimationAtIndex_offset_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "cancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawingGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_replayDrawingEnded");

  }
  objc_msgSend(*(id *)(a1 + 32), "_endDrawing");
  objc_msgSend(*(id *)(a1 + 32), "drawingGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)beginDrawingAnimationAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v17;
  __int16 v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKDrawingReplayController setOriginOffset:](self, "setOriginOffset:", x, y);
  if (-[PKDrawingReplayController isAnimating](self, "isAnimating"))
  {
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v9 = "Trying to begin replay drawing, but isAnimating is already YES.";
      v10 = (uint8_t *)&v18;
LABEL_10:
      _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    }
  }
  else
  {
    -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "drawingGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isReplaying");

    if (!v13)
    {
      -[PKDrawingReplayController setCompletionHandler:](self, "setCompletionHandler:", v7);
      -[PKDrawingReplayController textField](self, "textField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingReplayController textField](self, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "PK_convertPoint:toView:", v16, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[PKDrawingReplayController setStartingTextFieldOrigin:](self, "setStartingTextFieldOrigin:");

      -[PKDrawingReplayController setCurrentPointIndex:](self, "setCurrentPointIndex:", 0);
      -[PKDrawingReplayController _processNextPoint](self, "_processNextPoint");
      goto LABEL_8;
    }
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = 0;
      v9 = "Trying to begin replay drawing, but the gesture recognizer is already replaying";
      v10 = (uint8_t *)&v17;
      goto LABEL_10;
    }
  }

LABEL_8:
}

- (void)beginDrawingAnimationAtRange:(_NSRange)a3 offset:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  NSUInteger location;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint8_t v21[16];

  y = a4.y;
  x = a4.x;
  location = a3.location;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
    {
      v11 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "NSNotFound is not valid range for replay", v21, 2u);
      }

      v10[2](v10, 0);
    }
  }
  else
  {
    -[PKDrawingReplayController setCompletionHandler:](self, "setCompletionHandler:", v9);
    -[PKDrawingReplayController textField](self, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginningOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionFromPosition:offset:", v13, location);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v12, "caretRectForPosition:", v14);
      v16 = x + v15;
      v18 = y + v17;
      objc_msgSend(v12, "bounds");
      objc_msgSend(v12, "textRectForBounds:");
      -[PKDrawingReplayController beginDrawingAnimationAtPoint:completion:](self, "beginDrawingAnimationAtPoint:completion:", v10, v16 + v19, v18 + v20);
    }

  }
}

- (void)_processNextPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];

  -[PKDrawingReplayController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingReplayController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PK_convertPoint:toView:", v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = v6;
  v9 = v8;

  -[PKDrawingReplayController startingTextFieldOrigin](self, "startingTextFieldOrigin");
  if (vabdd_f64(v7, v11) >= 0.01 || vabdd_f64(v9, v10) >= 0.01)
    -[PKDrawingReplayController cancel](self, "cancel");
  -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawingTouch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 && !-[PKDrawingReplayController cancelled](self, "cancelled"))
  {
    -[PKDrawingReplayController pointArray](self, "pointArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKDrawingReplayController currentPointIndex](self, "currentPointIndex");
    -[PKDrawingReplayController setCurrentPointIndex:](self, "setCurrentPointIndex:", v15 + 1);
    if (v15 >= objc_msgSend(v14, "count"))
    {
      v18 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1BE213000, v18, OS_LOG_TYPE_ERROR, "End Drawing is being called from _processNextPoint, but should have been called _endDrawing instead of calling this method.  Ending drawing.", v19, 2u);
      }

      -[PKDrawingReplayController _endDrawing](self, "_endDrawing");
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        -[PKDrawingReplayController _beginDrawing](self, "_beginDrawing");
      v17 = objc_msgSend(v16, "type");
      switch(v17)
      {
        case 3:
          -[PKDrawingReplayController _strokeEndedWithReplayPoint:](self, "_strokeEndedWithReplayPoint:", v16);
          break;
        case 2:
          -[PKDrawingReplayController _strokeMovedWithReplayPoint:](self, "_strokeMovedWithReplayPoint:", v16);
          break;
        case 1:
          -[PKDrawingReplayController _beginStrokeWithPoint:](self, "_beginStrokeWithPoint:", v16);
          break;
      }

    }
  }
}

- (void)_beginDrawing
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[PKDrawingReplayController setIsAnimating:](self, "setIsAnimating:", 1);
  -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsReplaying:", 1);

  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Beginning replay drawing", v6, 2u);
  }

}

- (void)_endDrawing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  uint8_t v10[16];

  -[PKDrawingReplayController setIsAnimating:](self, "setIsAnimating:", 0);
  -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsReplaying:", 0);

  -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", 3);

  -[PKDrawingReplayController completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKDrawingReplayController completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, -[PKDrawingReplayController cancelled](self, "cancelled") ^ 1);

  }
  -[PKDrawingReplayController setCompletionHandler:](self, "setCompletionHandler:", 0);
  v9 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, "Ending replay drawing", v10, 2u);
  }

}

- (CGPoint)currentOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[PKDrawingReplayController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PK_convertPoint:toView:", v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = v6;
  v9 = v8;

  -[PKDrawingReplayController originOffset](self, "originOffset");
  v11 = v7 + v10;
  v13 = v9 + v12;
  result.y = v13;
  result.x = v11;
  return result;
}

- (void)_beginStrokeWithPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[8];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  if (!-[PKDrawingReplayController cancelled](self, "cancelled"))
  {
    -[PKDrawingReplayController currentOffset](self, "currentOffset");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    if (v4)
      objc_msgSend(v4, "pkInputPointWithOffset:");
    -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingReplayController canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[4] = v13;
    v8[5] = v14;
    v8[6] = v15;
    v8[7] = v16;
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    objc_msgSend(v5, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", v8, v7, 23, 1);

    -[PKDrawingReplayController _processNextPoint](self, "_processNextPoint");
  }

}

- (void)_strokeMovedWithReplayPoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "delay");
  v6 = v5;
  -[PKDrawingReplayController speedRatio](self, "speedRatio");
  if (v7 > 0.0)
  {
    -[PKDrawingReplayController speedRatio](self, "speedRatio");
    v6 = v6 * (1.0 / v8);
  }
  if (-[PKDrawingReplayController shouldEndDrawing](self, "shouldEndDrawing"))
  {
    -[PKDrawingReplayController _endDrawing](self, "_endDrawing");
  }
  else
  {
    v9 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKDrawingReplayController__strokeMovedWithReplayPoint___block_invoke;
    block[3] = &unk_1E77785D8;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);

}

void __57__PKDrawingReplayController__strokeMovedWithReplayPoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[8];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "cancelled") & 1) == 0)
  {
    objc_msgSend(v3, "currentOffset");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v4 = *(void **)(a1 + 32);
    if (v4)
      objc_msgSend(v4, "pkInputPointWithOffset:");
    objc_msgSend(v3, "drawingGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[4] = v11;
    v6[5] = v12;
    v6[6] = v13;
    v6[7] = v14;
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    v6[3] = v10;
    objc_msgSend(v5, "_replayDrawingMoved:", v6);

    objc_msgSend(v3, "_processNextPoint");
  }

}

- (void)_strokeEndedWithReplayPoint:(id)a3
{
  id v4;
  double v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (-[PKDrawingReplayController shouldEndDrawing](self, "shouldEndDrawing"))
  {
    -[PKDrawingReplayController _endDrawing](self, "_endDrawing");
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "delay");
    v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PKDrawingReplayController__strokeEndedWithReplayPoint___block_invoke;
    v7[3] = &unk_1E7777588;
    objc_copyWeak(&v8, &location);
    dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __57__PKDrawingReplayController__strokeEndedWithReplayPoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "cancelled");
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v5, "drawingGestureRecognizer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_replayDrawingEnded");

      objc_msgSend(v5, "_processNextPoint");
      v2 = v5;
    }
  }

}

- (BOOL)shouldEndDrawing
{
  unint64_t v3;
  void *v4;

  v3 = -[PKDrawingReplayController currentPointIndex](self, "currentPointIndex") + 1;
  -[PKDrawingReplayController pointArray](self, "pointArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 >= objc_msgSend(v4, "count");

  return v3;
}

- (void)cancel
{
  void *v3;
  id v4;

  if (!-[PKDrawingReplayController cancelled](self, "cancelled"))
  {
    -[PKDrawingReplayController setCancelled:](self, "setCancelled:", 1);
    -[PKDrawingReplayController _endDrawing](self, "_endDrawing");
    -[PKDrawingReplayController drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_replayDrawingCancelled");

    -[PKDrawingReplayController textInputInteraction](self, "textInputInteraction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelReplay");

  }
}

- (void)_loadPointArray
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  PKDrawingReplayPoint *v20;
  double v21;
  double v22;
  double v23;
  PKDrawingReplayPoint *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PKDrawingReplayController drawing](self, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDrawingReplayController drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  -[PKDrawingReplayController transform](self, "transform");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v29;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "_strokeData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_pointsCount");
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = v14 - 1;
          v18 = v11;
          do
          {
            if (v16)
              v19 = 2;
            else
              v19 = 1;
            v20 = objc_alloc_init(PKDrawingReplayPoint);
            -[PKDrawingReplayPoint setType:](v20, "setType:", v19);
            objc_msgSend(v13, "timestampAtIndex:", v16);
            v11 = v21;
            -[PKDrawingReplayPoint setDelay:](v20, "setDelay:", v21 - v18);
            objc_msgSend(v13, "locationAtIndex:", v16);
            -[PKDrawingReplayPoint setPoint:](v20, "setPoint:", vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v23 - v9), v32, v22 - v7)));
            objc_msgSend(v10, "addObject:", v20);
            if (v17 == v16)
            {
              v24 = objc_alloc_init(PKDrawingReplayPoint);
              -[PKDrawingReplayPoint setType:](v24, "setType:", 3);
              objc_msgSend(v10, "addObject:", v24);

            }
            ++v16;
            v18 = v11;
          }
          while (v15 != v16);
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v27);
  }

  -[PKDrawingReplayController setPointArray:](self, "setPointArray:", v10);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (double)speedRatio
{
  return self->_speedRatio;
}

- (void)setSpeedRatio:(double)a3
{
  self->_speedRatio = a3;
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (PKTiledCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKTextInputInteraction)textInputInteraction
{
  return (PKTextInputInteraction *)objc_loadWeakRetained((id *)&self->_textInputInteraction);
}

- (void)setTextInputInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_textInputInteraction, a3);
}

- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer
{
  return (PKTextInputDrawingGestureRecognizer *)objc_loadWeakRetained((id *)&self->_drawingGestureRecognizer);
}

- (void)setDrawingGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_drawingGestureRecognizer, a3);
}

- (unint64_t)currentPointIndex
{
  return self->_currentPointIndex;
}

- (void)setCurrentPointIndex:(unint64_t)a3
{
  self->_currentPointIndex = a3;
}

- (CGPoint)startingTextFieldOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingTextFieldOrigin.x;
  y = self->_startingTextFieldOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingTextFieldOrigin:(CGPoint)a3
{
  self->_startingTextFieldOrigin = a3;
}

- (CGPoint)originOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originOffset.x;
  y = self->_originOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginOffset:(CGPoint)a3
{
  self->_originOffset = a3;
}

- (void)setCurrentOffset:(CGPoint)a3
{
  self->_currentOffset = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (NSMutableArray)pointArray
{
  return self->_pointArray;
}

- (void)setPointArray:(id)a3
{
  objc_storeStrong((id *)&self->_pointArray, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointArray, 0);
  objc_destroyWeak((id *)&self->_drawingGestureRecognizer);
  objc_destroyWeak((id *)&self->_textInputInteraction);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
}

@end
