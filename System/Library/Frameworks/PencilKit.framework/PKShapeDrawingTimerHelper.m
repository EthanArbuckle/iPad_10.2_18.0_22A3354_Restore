@implementation PKShapeDrawingTimerHelper

- (PKShapeDrawingTimerHelper)initWithDelegate:(id)a3
{
  id v4;
  PKShapeDrawingTimerHelper *v5;
  PKShapeDrawingTimerHelper *v6;
  PKShapeDrawingController *v7;
  PKShapeDrawingController *shapeDrawingController;
  PKShapeDrawingController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShapeDrawingTimerHelper;
  v5 = -[PKShapeDrawingTimerHelper init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], v6);
    shapeDrawingController = v6->_shapeDrawingController;
    v6->_shapeDrawingController = v7;

    v9 = v6->_shapeDrawingController;
    if (v9)
      v9->_shapeRecognitionOn = 1;
  }

  return v6;
}

- (void)beginStrokeAtPoint:(CGPoint)a3
{
  PKShapeDrawingController *shapeDrawingController;
  PKShapeDrawingController *v5;
  PKShapeDrawingController *v6;
  void *v7;
  PKShapeDrawingController *v8;
  NSTimer *v9;
  NSTimer *timer;
  _QWORD v11[4];
  PKShapeDrawingController *v12;

  -[PKShapeDrawingController beginStrokeAtPoint:]((uint64_t)self->_shapeDrawingController, a3.x, a3.y);
  shapeDrawingController = self->_shapeDrawingController;
  if (shapeDrawingController)
  {
    -[PKShapeDrawingController _checkDetectedStroke]((uint64_t)shapeDrawingController);
    v5 = self->_shapeDrawingController;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PKShapeDrawingTimerHelper_beginStrokeAtPoint___block_invoke;
  v11[3] = &unk_1E777BAB0;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v11, 0.05);
  v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v9;

}

void __48__PKShapeDrawingTimerHelper_beginStrokeAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    -[PKShapeDrawingController _checkDetectedStroke](v1);
}

- (void)addStrokePoint:(CGPoint)a3 inputPoint:(id *)a4
{
  PKShapeDrawingController *shapeDrawingController;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  PKShapeDrawingController *v10;
  _OWORD v11[8];

  shapeDrawingController = self->_shapeDrawingController;
  v6 = *(_OWORD *)&a4->var9;
  v11[4] = *(_OWORD *)&a4->var7;
  v11[5] = v6;
  v7 = *(_OWORD *)&a4->var13;
  v11[6] = *(_OWORD *)&a4->var11;
  v11[7] = v7;
  v8 = *(_OWORD *)&a4->var1;
  v11[0] = a4->var0;
  v11[1] = v8;
  v9 = *(_OWORD *)&a4->var5;
  v11[2] = *(_OWORD *)&a4->var3;
  v11[3] = v9;
  -[PKShapeDrawingController addStrokePoint:inputPoint:]((uint64_t)shapeDrawingController, v11, a3.x, a3.y);
  v10 = self->_shapeDrawingController;
  if (v10)
    -[PKShapeDrawingController _checkDetectedStroke]((uint64_t)v10);
}

- (void)teardown
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  return 0;
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  PKShape *v5;
  PKShape *v6;
  id WeakRetained;

  v5 = [PKShape alloc];
  v6 = -[PKShape initWithShapeType:strokes:originalStroke:](v5, "initWithShapeType:strokes:originalStroke:", 8, MEMORY[0x1E0C9AA60], 0);
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)self->_shapeDrawingController, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shapeGestureDetectedOnShapeDrawingTimerHelper:", self);

}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  id WeakRetained;

  -[PKShapeDrawingController setDetectedShape:]((uint64_t)self->_shapeDrawingController, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shapeGestureCancelledOnShapeDrawingTimerHelper:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
