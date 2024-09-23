@implementation PBFPPTOperation

+ (id)operationToStartTest:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithBlock:](PBFPPTBlockOperation, "operationWithBlock:", &stru_10000C770));
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v4));
  objc_msgSend(v5, "setOperationName:", v8);

  v9 = objc_msgSend(v5, "markStartedTest:", v4);
  return v5;
}

+ (id)operationToFinishTest:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithBlock:](PBFPPTBlockOperation, "operationWithBlock:", &stru_10000C790));
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v4));
  objc_msgSend(v5, "setOperationName:", v8);

  v9 = objc_msgSend(v5, "markFinishedTest:", v4);
  return v5;
}

+ (id)operationToWaitForTimeInterval:(double)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000592C;
  v8[3] = &unk_10000C7B0;
  *(double *)&v8[4] = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v5, v8));

  return v6;
}

+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;

  v8 = a3;
  v9 = a4;
  v10 = NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005AB8;
  v16[3] = &unk_10000C800;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v12 = v9;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v11, v16));

  return v14;
}

+ (id)operationToSynthesizeEventsForEventActions:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005C98;
  v10[3] = &unk_10000C828;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v6, v10));

  return v8;
}

+ (id)operationToResetSwitcher
{
  void *v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005DD8;
  v9[3] = &unk_10000C540;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v5, v9));

  return v7;
}

+ (id)operationToScrollToFirstPoster:(BOOL)a3
{
  void *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005F20;
  v11[3] = &unk_10000C850;
  v12 = v5;
  v13 = a3;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v7, v11));

  return v9;
}

+ (id)operationToExitPosterSwitcher
{
  void *v3;
  NSString *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:", &stru_10000C6E0));
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setOperationName:", v5);

  return v3;
}

+ (id)operationToPushInToPosterSwitcher
{
  void *v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000060C4;
  v9[3] = &unk_10000C540;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v5, v9));

  return v7;
}

+ (id)operationToAddPosterWithProvider:(id)a3 descriptorIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "posterExtensionDataStore"));
  v13 = NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006380;
  v21[3] = &unk_10000C8A0;
  v22 = v12;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = v12;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v14, v21));

  return v19;
}

+ (id)operationToDeletePosters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "posterExtensionDataStore"));
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000065DC;
  v13[3] = &unk_10000C8C8;
  v14 = v6;
  v15 = v4;
  v9 = v6;
  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", v8, v13));

  return v11;
}

- (PBFPPTOperation)init
{
  PBFPPTOperation *v2;
  PBFPPTOperation *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  NSString *operationName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBFPPTOperation;
  v2 = -[PBFPPTOperation init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), v6, v3));
    operationName = v3->_operationName;
    v3->_operationName = (NSString *)v7;

  }
  return v3;
}

- (id)markStartedTest:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id startTestBlock;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006898;
  v9[3] = &unk_10000C8F0;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = objc_retainBlock(v9);
  startTestBlock = self->_startTestBlock;
  self->_startTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

- (id)markFinishedTest:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id finishTestBlock;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006A64;
  v9[3] = &unk_10000C8F0;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = objc_retainBlock(v9);
  finishTestBlock = self->_finishTestBlock;
  self->_finishTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

- (id)markStartSubTest:(id)a3 forTestName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id startSubTestBlock;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006C50;
  v13[3] = &unk_10000C918;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = objc_retainBlock(v13);
  startSubTestBlock = self->_startSubTestBlock;
  self->_startSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id finishSubTestBlock;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006E44;
  v13[3] = &unk_10000C918;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = objc_retainBlock(v13);
  finishSubTestBlock = self->_finishSubTestBlock;
  self->_finishSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (void)operationWillStart
{
  PBFPPTOperation *operationName;
  void (**startTestBlock)(void);
  id v5;
  void (**startSubTestBlock)(void);
  id v7;
  int v8;
  PBFPPTOperation *v9;

  self->_operationStartTime = CFAbsoluteTimeGetCurrent();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (PBFPPTOperation *)self->_operationName;
    if (!operationName)
      operationName = self;
    v8 = 138412290;
    v9 = operationName;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting", (uint8_t *)&v8, 0xCu);
  }
  startTestBlock = (void (**)(void))self->_startTestBlock;
  if (startTestBlock)
  {
    startTestBlock[2]();
    v5 = self->_startTestBlock;
    self->_startTestBlock = 0;

  }
  startSubTestBlock = (void (**)(void))self->_startSubTestBlock;
  if (startSubTestBlock)
  {
    startSubTestBlock[2]();
    v7 = self->_startSubTestBlock;
    self->_startSubTestBlock = 0;

  }
}

- (void)operationDidFinish
{
  PBFPPTOperation *operationName;
  double v4;
  void (**finishSubTestBlock)(void);
  id v6;
  void (**finishTestBlock)(void);
  id v8;
  int v9;
  PBFPPTOperation *v10;
  __int16 v11;
  double v12;

  self->_operationEndTime = CFAbsoluteTimeGetCurrent();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (PBFPPTOperation *)self->_operationName;
    if (!operationName)
      operationName = self;
    v4 = self->_operationEndTime - self->_operationStartTime;
    v9 = 138412546;
    v10 = operationName;
    v11 = 2048;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' executed in %f seconds", (uint8_t *)&v9, 0x16u);
  }
  finishSubTestBlock = (void (**)(void))self->_finishSubTestBlock;
  if (finishSubTestBlock)
  {
    finishSubTestBlock[2]();
    v6 = self->_finishSubTestBlock;
    self->_finishSubTestBlock = 0;

  }
  finishTestBlock = (void (**)(void))self->_finishTestBlock;
  if (finishTestBlock)
  {
    finishTestBlock[2]();
    v8 = self->_finishTestBlock;
    self->_finishTestBlock = 0;

  }
}

+ (void)enqueueOperations:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v3, 0);

}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong(&self->_startSubTestBlock, 0);
  objc_storeStrong(&self->_finishSubTestBlock, 0);
  objc_storeStrong(&self->_startTestBlock, 0);
  objc_storeStrong(&self->_finishTestBlock, 0);
}

@end
