@implementation _PhotosTestingRPTGesturePerformer

- (_PhotosTestingRPTGesturePerformer)initWithTestName:(id)a3 testOptions:(id)a4
{
  id v6;
  id v7;
  _PhotosTestingRPTGesturePerformer *v8;
  NSString *v9;
  NSString *testName;
  NSDictionary *v11;
  NSDictionary *testOptions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PhotosTestingRPTGesturePerformer;
  v8 = -[_PhotosTestingRPTGesturePerformer init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    testName = v8->_testName;
    v8->_testName = v9;

    v11 = (NSDictionary *)objc_msgSend(v7, "copy");
    testOptions = v8->_testOptions;
    v8->_testOptions = v11;

  }
  return v8;
}

- (void)swipeTowardsEdge:(unint64_t)a3 touchArea:(CGRect)a4 inCoordinateSpace:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "coordinateSpace"));

  PXRectConvertFromCoordinateSpaceToCoordinateSpace(v14, v17, x, y, width, height);
  v22 = a3 - 1;
  if (a3 - 1 >= 8 || ((0x8Bu >> v22) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosTestingRPTHelper.m"), 444, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v23 = v18;
  v24 = v19;
  v25 = v20;
  v26 = v21;
  v27 = qword_100056C98[v22];
  v28 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100042554;
  v33[3] = &unk_10006D4D0;
  v34 = v15;
  v29 = v15;
  v30 = objc_msgSend(v28, "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", 0, 1, v27, v33, v23, v24, v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PXGesturePerformer swipeSpeedFactor:](PXGesturePerformer, "swipeSpeedFactor:", 1));
  objc_msgSend(v30, "setSwipeSpeedFactor:", v31);

  objc_msgSend(v30, "setShouldFlick:", 1);
  objc_msgSend(v30, "setSwipeCount:", 1);
  +[RPTTestRunner runTestWithParameters:delegate:](RPTTestRunner, "runTestWithParameters:delegate:", v30, self);

}

- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a5;
  v6 = PLPPTGetLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "RPTTest failed: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (NSString)testName
{
  return self->_testName;
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
