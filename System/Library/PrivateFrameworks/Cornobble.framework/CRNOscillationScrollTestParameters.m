@implementation CRNOscillationScrollTestParameters

double __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke_2(uint64_t a1, double *a2, int a3)
{
  double v6;
  double v7;
  double v8;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "amplitudeVariationPerIteration");
  if (!a3)
    v6 = -v6;
  v7 = v6 * 0.5;
  if (*(_QWORD *)(a1 + 40) == 2)
    v8 = -0.0;
  else
    v8 = v7;
  if (*(_QWORD *)(a1 + 40) != 2)
    v7 = -0.0;
  result = a2[1] + v7;
  *a2 = *a2 + v8;
  a2[1] = result;
  return result;
}

- (double)amplitudeVariationPerIteration
{
  return self->_amplitudeVariationPerIteration;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (CGPoint)initialFingerPosition
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double Midpoint;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  CGPoint result;

  -[CRNOscillationScrollTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  -[CRNOscillationScrollTestParameters initialAmplitude](self, "initialAmplitude");
  v11 = v10 * 0.5;
  v12 = CRNOppositeDirectionFrom(-[CRNOscillationScrollTestParameters realInitialDirection](self, "realInitialDirection"));
  v13 = CRNCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)finalFingerPosition
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double Midpoint;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[CRNOscillationScrollTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  -[CRNOscillationScrollTestParameters initialAmplitude](self, "initialAmplitude");
  v11 = CRNCGPointAdvanceInDirectionByAmount(-[CRNOscillationScrollTestParameters realInitialDirection](self, "realInitialDirection"), Midpoint, v9, v10 * 0.5);
  result.y = v12;
  result.x = v11;
  return result;
}

- (int64_t)realInitialDirection
{
  return self->_realInitialDirection;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (CGRect)scrollingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollingBounds.origin.x;
  y = self->_scrollingBounds.origin.y;
  width = self->_scrollingBounds.size.width;
  height = self->_scrollingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)initialAmplitude
{
  return self->_initialAmplitude;
}

- (BOOL)finishWithHalfIteration
{
  return self->_finishWithHalfIteration;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_24F13BA18;
  v3[4] = self;
  return (id)MEMORY[0x22E2B5C74](v3, a2);
}

- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v26;
  id v27;
  CRNOscillationScrollTestParameters *v28;
  uint64_t v29;
  NSString *testName;
  uint64_t v31;
  id completionHandler;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v26 = a3;
  v27 = a13;
  v37.receiver = self;
  v37.super_class = (Class)CRNOscillationScrollTestParameters;
  v28 = -[CRNOscillationScrollTestParameters init](&v37, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v26, "copy");
    testName = v28->_testName;
    v28->_testName = (NSString *)v29;

    v28->_iterations = a4;
    v28->_scrollingBounds.origin.x = x;
    v28->_scrollingBounds.origin.y = y;
    v28->_scrollingBounds.size.width = width;
    v28->_scrollingBounds.size.height = height;
    v28->_shouldFlick = a6;
    v28->_preventDismissalGestures = a7;
    v28->_amplitudeVariationPerIteration = a9;
    v28->_initialAmplitude = a8;
    v28->_initialDirection = a10;
    v28->_iterationDuration = a11;
    v28->_finishWithHalfIteration = a12;
    v31 = MEMORY[0x22E2B5C74](v27);
    completionHandler = v28->_completionHandler;
    v28->_completionHandler = (id)v31;

    if (a10 == 6 || a10 == 5)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "userInterfaceLayoutDirection");
      v35 = 1;
      if (v34)
        v35 = 2;
      v28->_realInitialDirection = v35;

    }
    else
    {
      v28->_realInitialDirection = a10;
    }
  }

  return v28;
}

- (CRNOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12
{
  return -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:", a3, a4, a6, a7, a10, a12, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, a11, 0);
}

void __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  _QWORD v18[6];
  double v19;
  double v20;
  double v21;
  double v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "iterationDuration");
  v5 = v4;
  v6 = CRNAxisFromScrollDirection(objc_msgSend(*(id *)(a1 + 32), "realInitialDirection"));
  objc_msgSend(*(id *)(a1 + 32), "initialFingerPosition");
  v8 = v7;
  v10 = v9;
  v21 = v7;
  v22 = v9;
  objc_msgSend(*(id *)(a1 + 32), "finalFingerPosition");
  v19 = v11;
  v20 = v12;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__CRNOscillationScrollTestParameters_composerBlock__block_invoke_2;
  v18[3] = &unk_24F13BAA8;
  v18[4] = *(_QWORD *)(a1 + 32);
  v18[5] = v6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2B5C74](v18);
  if (objc_msgSend(*(id *)(a1 + 32), "preventDismissalGestures"))
  {
    v14 = CRNCGPointAdvanceInDirectionByAmount(objc_msgSend(*(id *)(a1 + 32), "realInitialDirection"), v8, v10, 75.0);
    objc_msgSend(v3, "dragWithStartPoint:endPoint:duration:", v8, v10, v14, v15, 0.3);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldFlick") & 1) == 0)
    objc_msgSend(v3, "touchDown:", v8, v10);
  v16 = v5 * 0.5;
  if (objc_msgSend(*(id *)(a1 + 32), "iterations"))
  {
    v17 = 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v21, v22, v19, v20, v16);
      ((void (**)(_QWORD, double *, _QWORD))v13)[2](v13, &v21, 0);
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v19, v20, v21, v22, v16);
      ((void (**)(_QWORD, double *, uint64_t))v13)[2](v13, &v19, 1);
      ++v17;
    }
    while (v17 <= objc_msgSend(*(id *)(a1 + 32), "iterations"));
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "finishWithHalfIteration") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v3, v21, v22, v19, v20, v16);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldFlick") & 1) == 0)
    objc_msgSend(v3, "liftUp:", v21, v22);

}

- (RCPSyntheticEventStream)eventStream
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!RecapLibraryCore_frameworkLibrary_4)
  {
    v12 = xmmword_24F13BAC8;
    v13 = 0;
    RecapLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!RecapLibraryCore_frameworkLibrary_4)
    return (RCPSyntheticEventStream *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getRCPSyntheticEventStreamClass_softClass_4;
  v11 = getRCPSyntheticEventStreamClass_softClass_4;
  if (!getRCPSyntheticEventStreamClass_softClass_4)
  {
    *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __getRCPSyntheticEventStreamClass_block_invoke_4;
    v14 = &unk_24F13B9F0;
    v15 = &v8;
    __getRCPSyntheticEventStreamClass_block_invoke_4((uint64_t)&v12);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  -[CRNOscillationScrollTestParameters composerBlock](self, "composerBlock", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStreamWithEventActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RCPSyntheticEventStream *)v6;
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  double v12;
  double v13;
  void *v14;
  id v15;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v15 = a3;
  if (-[CRNOscillationScrollTestParameters shouldFlick](self, "shouldFlick"))
  {
    v12 = a6 + -0.5;
    objc_msgSend(v15, "sendFlickWithStartPoint:endPoint:duration:", v10, v9, x, y, 0.5);
    if (v12 >= 0.0)
    {
      v14 = v15;
      v13 = v12;
    }
    else
    {
      v13 = 0.3;
      v14 = v15;
    }
    objc_msgSend(v14, "advanceTime:", v13);
  }
  else
  {
    objc_msgSend(v15, "moveToPoint:duration:", x, y, a6);
  }

}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (void)setFinishWithHalfIteration:(BOOL)a3
{
  self->_finishWithHalfIteration = a3;
}

- (void)setAmplitudeVariationPerIteration:(double)a3
{
  self->_amplitudeVariationPerIteration = a3;
}

- (void)setInitialAmplitude:(double)a3
{
  self->_initialAmplitude = a3;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_initialDirection = a3;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
