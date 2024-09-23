@implementation CRNPagingScrollTestParameters

- (CRNPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  CRNPagingScrollTestParameters *v23;
  uint64_t v24;
  NSString *testName;
  uint64_t v26;
  id completionHandler;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v21 = a3;
  v22 = a10;
  v32.receiver = self;
  v32.super_class = (Class)CRNPagingScrollTestParameters;
  v23 = -[CRNPagingScrollTestParameters init](&v32, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v21, "copy");
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_iterations = a4;
    v23->_scrollingBounds.origin.x = x;
    v23->_scrollingBounds.origin.y = y;
    v23->_scrollingBounds.size.width = width;
    v23->_scrollingBounds.size.height = height;
    v23->_amplitude = a6;
    v23->_useFlicks = a9;
    v23->_direction = a7;
    v23->_iterationDuration = a8;
    v26 = MEMORY[0x22E2B5C74](v22);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = (id)v26;

    if (a7 == 6 || a7 == 5)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceLayoutDirection");
      v30 = 1;
      if (v29)
        v30 = 2;
      v23->_realDirection = v30;

    }
    else
    {
      v23->_realDirection = a7;
    }
  }

  return v23;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__CRNPagingScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_24F13BA18;
  v3[4] = self;
  return (id)MEMORY[0x22E2B5C74](v3, a2);
}

void __46__CRNPagingScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
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
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
  Midpoint = CRNCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  switch(objc_msgSend(*(id *)(a1 + 32), "realDirection"))
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
      v10 = CGRectGetMinX(v21) + 1.5;
      objc_msgSend(*(id *)(a1 + 32), "amplitude");
      Midpoint = v10 + v12;
      goto LABEL_4;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
      v13 = CGRectGetMaxY(v22) + -1.5;
      objc_msgSend(*(id *)(a1 + 32), "amplitude");
      v9 = v13 - v14;
      goto LABEL_7;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
      v13 = CGRectGetMinY(v23) + 1.5;
      objc_msgSend(*(id *)(a1 + 32), "amplitude");
      v9 = v13 + v15;
LABEL_7:
      v10 = Midpoint;
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
      v10 = CGRectGetMaxX(v20) + -1.5;
      objc_msgSend(*(id *)(a1 + 32), "amplitude");
      Midpoint = v10 - v11;
LABEL_4:
      v13 = v9;
      break;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "iterations"))
  {
    v16 = 1;
    do
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "iterationDuration");
      objc_msgSend(v17, "scrollWithComposer:fromPoint:toPoint:duration:", v19, v10, v13, Midpoint, v9, v18);
      ++v16;
    }
    while (v16 <= objc_msgSend(*(id *)(a1 + 32), "iterations"));
  }

}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  if (-[CRNPagingScrollTestParameters useFlicks](self, "useFlicks"))
  {
    objc_msgSend(v12, "sendFlickWithStartPoint:endPoint:duration:", v10, v9, x, y, 0.5);
    objc_msgSend(v12, "advanceTime:", a6 + -0.5);
  }
  else
  {
    objc_msgSend(v12, "dragWithStartPoint:endPoint:duration:", v10, v9, x, y, a6);
  }

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
  if (!RecapLibraryCore_frameworkLibrary_2)
  {
    v12 = xmmword_24F13BA70;
    v13 = 0;
    RecapLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!RecapLibraryCore_frameworkLibrary_2)
    return (RCPSyntheticEventStream *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getRCPSyntheticEventStreamClass_softClass_2;
  v11 = getRCPSyntheticEventStreamClass_softClass_2;
  if (!getRCPSyntheticEventStreamClass_softClass_2)
  {
    *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __getRCPSyntheticEventStreamClass_block_invoke_2;
    v14 = &unk_24F13B9F0;
    v15 = &v8;
    __getRCPSyntheticEventStreamClass_block_invoke_2((uint64_t)&v12);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  -[CRNPagingScrollTestParameters composerBlock](self, "composerBlock", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStreamWithEventActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RCPSyntheticEventStream *)v6;
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

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
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

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (BOOL)useFlicks
{
  return self->_useFlicks;
}

- (void)setUseFlicks:(BOOL)a3
{
  self->_useFlicks = a3;
}

- (int64_t)realDirection
{
  return self->_realDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
