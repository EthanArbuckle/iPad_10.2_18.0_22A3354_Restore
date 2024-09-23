@implementation ViewController

- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:
{
  id v9;
  std::string *v10;
  __int128 v11;
  void *v12;
  void *v13;
  std::ios_base *v14;
  const __CFData *v15;
  std::ios_base *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  std::string v22;
  void (__cdecl **v23)(std::ofstream *__hidden);
  void *__p[2];
  std::string::size_type v25;
  _BYTE v26[384];
  void (__cdecl **v27)(std::ofstream *__hidden);

  v9 = a3;
  std::to_string(&v22, a5);
  v10 = std::string::insert(&v22, 0, "finishRun, result = ");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v25 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  -[ViewController log:](self, "log:", __p);
  if (SHIBYTE(v25) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  __p[0] = v13;
  *(void **)((char *)__p + *((_QWORD *)v13 - 3)) = v12;
  v14 = (std::ios_base *)((char *)__p + *((_QWORD *)__p[0] - 3));
  std::ios_base::init(v14, &__p[1]);
  v14[1].__vftable = 0;
  v14[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(&__p[1]);
  std::ofstream::open(__p, "/tmp/PrCL.bin", 16);
  std::ostream::write(__p, a6, 256);
  if (!std::filebuf::close(&__p[1]))
    std::ios_base::clear((std::ios_base *)((char *)__p + *((_QWORD *)__p[0] - 3)), *(_DWORD *)&v26[*((_QWORD *)__p[0] - 3)] | 4);
  v15 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a6, 256));
  v21 = ConvertDataToHexString(v15);
  v22.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  *(std::string::size_type *)((char *)v22.__r_.__value_.__r.__words + *((_QWORD *)v13 - 3)) = (std::string::size_type)v12;
  v16 = (std::ios_base *)((char *)&v22 + *(_QWORD *)(v22.__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v16, &v22.__r_.__value_.__r.__words[1]);
  v16[1].__vftable = 0;
  v16[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(&v22.__r_.__value_.__r.__words[1]);
  std::ofstream::open(__p, "/tmp/PrCL.hex", 16);
  v17 = objc_retainAutorelease(v21);
  std::ostream::write(__p, -[__CFString UTF8String](v17, "UTF8String"), -[__CFString length](v17, "length"));
  if (!std::filebuf::close(&v22.__r_.__value_.__r.__words[1]))
    std::ios_base::clear((std::ios_base *)((char *)&v22 + *(_QWORD *)(v22.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v22 + *(_QWORD *)(v22.__r_.__value_.__r.__words[0] - 24) + 32) | 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrCL:"), "stringByAppendingString:", v17));
  objc_msgSend(v9, "addObject:", v18);

  objc_msgSend(v9, "writeToFile:atomically:", CFSTR("/tmp/diagnostic.log"), 0);
  objc_msgSend(v9, "writeToFile:atomically:", CFSTR("/tmp/reduced.log"), 0);
  std::filebuf::~filebuf(&v22.__r_.__value_.__r.__words[1]);
  std::ios::~ios(&v23);

  __p[0] = v19;
  *(void **)((char *)__p + *((_QWORD *)v19 - 3)) = v20;
  std::filebuf::~filebuf(&__p[1]);
  std::ios::~ios(&v27);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ViewController;
  -[ViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)log:(const void *)a3
{
  NSMutableArray *v5;
  const void *v6;
  NSMutableArray *resultsDict;
  const void *v8;
  void *v9;
  int v10;
  const void *v11;

  v5 = self->_resultsDict;
  objc_sync_enter(v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0)
      v6 = a3;
    else
      v6 = *(const void **)a3;
    v10 = 136315138;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "JasperCalibDiag %s", (uint8_t *)&v10, 0xCu);
  }
  resultsDict = self->_resultsDict;
  if (*((char *)a3 + 23) >= 0)
    v8 = a3;
  else
    v8 = *(const void **)a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  -[NSMutableArray addObject:](resultsDict, "addObject:", v9);

  objc_sync_exit(v5);
}

- (void)addToReducedLog:(const void *)a3
{
  NSMutableArray *v5;
  const void *v6;
  NSMutableArray *reducedLog;
  const void *v8;
  void *v9;
  int v10;
  const void *v11;

  v5 = self->_reducedLog;
  objc_sync_enter(v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0)
      v6 = a3;
    else
      v6 = *(const void **)a3;
    v10 = 136315138;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "addToReducedLog %s", (uint8_t *)&v10, 0xCu);
  }
  reducedLog = self->_reducedLog;
  if (*((char *)a3 + 23) >= 0)
    v8 = a3;
  else
    v8 = *(const void **)a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  -[NSMutableArray addObject:](reducedLog, "addObject:", v9);

  objc_sync_exit(v5);
}

- (void)prepareNewIteration
{
  void *__p[2];
  char v4;

  sub_10001A19C(__p, "prepareNewIteration");
  -[ViewController log:](self, "log:", __p);
  if (v4 < 0)
    operator delete(__p[0]);
  self->_iterationTotalSuccessfullRuns = 0;
  self->_resetExtrinsics = 1;
}

- (void)prepareIterationToNewSession
{
  self->_progress = 0.0;
  self->_lastSceneError = 0;
  self->_sessionSecondsCount = 0;
  self->_consecutiveSceneError = 0;
}

- (ViewController)initWithCoder:(id)a3
{
  id v4;
  ViewController *v5;
  ViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ViewController;
  v5 = -[ViewController initWithCoder:](&v8, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_isJasper = 120;
    v5->_topTextHeight = 30;
    v5->_textMargin = 1;
    *(_DWORD *)&v5->_upperViewRendered = 5;
    v5->_sessionMaxTimeOut = 1046562734;
    -[ViewController setListener:](v5, "setListener:", v5);
    *(_DWORD *)&v6->_sensorId.__r_.var1 = 15;
    LODWORD(v6->_sensorId.var0) = 14;
  }

  return v6;
}

- (ViewController)init
{
  ViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ViewController;
  result = -[ViewController init](&v3, "init");
  if (result)
  {
    *(_DWORD *)&result->_isJasper = 120;
    result->_topTextHeight = 30;
    result->_textMargin = 1;
    *(_DWORD *)&result->_upperViewRendered = 5;
    result->_sessionMaxTimeOut = 1046562734;
    *(_DWORD *)&result->_sensorId.__r_.var1 = 15;
    LODWORD(result->_sensorId.var0) = 14;
    BYTE5(result->_sensorId.var0) = 0;
  }
  return result;
}

- (void)startUI
{
  std::string *v3;
  std::string::size_type size;
  std::string *v5;
  __int128 v6;
  void **v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  std::string *p_p;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  NSMutableArray *v15;
  NSMutableArray *resultsDict;
  NSMutableArray *v17;
  NSMutableArray *reducedLog;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *backgroundDispatchQueue;
  std::string __p;
  void *v28[2];
  unsigned __int8 v29;
  std::string v30;
  std::string v31;
  std::string v32;
  std::string v33;
  __int128 v34;
  std::string::size_type v35;

  sub_10001A19C(&v34, "start UI");
  -[ViewController log:](self, "log:", &v34);
  if (SHIBYTE(v35) < 0)
    operator delete((void *)v34);
  sub_10001A19C(&v31, "_sessionMaxTimeOut ");
  std::to_string(&v30, *(_DWORD *)&self->_isJasper);
  if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v30;
  else
    v3 = (std::string *)v30.__r_.__value_.__r.__words[0];
  if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v30.__r_.__value_.__r.__words[2]);
  else
    size = v30.__r_.__value_.__l.__size_;
  v5 = std::string::append(&v31, (const std::string::value_type *)v3, size);
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v32.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  sub_10001A19C(v28, " _consecutiveSceneErrorLimit ");
  if ((v29 & 0x80u) == 0)
    v7 = v28;
  else
    v7 = (void **)v28[0];
  if ((v29 & 0x80u) == 0)
    v8 = v29;
  else
    v8 = (std::string::size_type)v28[1];
  v9 = std::string::append(&v32, (const std::string::value_type *)v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v33.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, self->_topTextHeight);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v12 = __p.__r_.__value_.__l.__size_;
  v13 = std::string::append(&v33, (const std::string::value_type *)p_p, v12);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v35 = v13->__r_.__value_.__r.__words[2];
  v34 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  -[ViewController log:](self, "log:", &v34);
  if (SHIBYTE(v35) < 0)
    operator delete((void *)v34);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  if ((char)v29 < 0)
    operator delete(v28[0]);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  resultsDict = self->_resultsDict;
  self->_resultsDict = v15;

  v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  reducedLog = self->_reducedLog;
  self->_reducedLog = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  v21 = self->_resultsDict;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("version "), "stringByAppendingString:", v20));
  -[NSMutableArray addObject:](v21, "addObject:", v22);

  self->_calibrationResult = 1;
  self->_nextResultIndex = 0;
  self->_iterationTotalSuccessfullRunsLimit = 30;
  self->_calibUpdateEachIsfEntiresLimit = 10;
  self->_iterationsLimit = 3;
  self->_watchDogCounter = 0;
  self->_sesssionIsfCount = 1;
  self->_noMovementCounter = 0;
  self->_diagnosticCMInterface = 0;
  self->_diagnosticFinalResult = -1;
  v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.RgbJasperCalibrationQueue", v24);
  backgroundDispatchQueue = self->_backgroundDispatchQueue;
  self->_backgroundDispatchQueue = v25;

  -[ViewController loadNormalAppWindow](self, "loadNormalAppWindow");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;
  void *__p[2];
  char v6;

  sub_10001A19C(__p, "viewDidLoad");
  -[ViewController log:](self, "log:", __p);
  if (v6 < 0)
    operator delete(__p[0]);
  v4.receiver = self;
  v4.super_class = (Class)ViewController;
  -[ViewController viewDidLoad](&v4, "viewDidLoad");
  self->_diagnosticFinalResult = -1;
  self->_inResume = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "setIdleTimerDisabled:", 1);

  -[ViewController startUI](self, "startUI");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int)getJasperSensorId:(void *)a3
{
  int v5;
  const void *Value;
  id v7;
  CFDictionaryRef theDict;

  theDict = 0;
  if (DeviceCMInterface::getJasperModuleInfo(self->_diagnosticCMInterface, &theDict))
  {
    v5 = 2;
    self->_diagnosticFinalResult = 2;
    -[ViewController error:details:](self, "error:details:", CFSTR("unable to get JasperModuleInfo"), &stru_100029068);
  }
  else
  {
    Value = CFDictionaryGetValue(theDict, kFigCapturePropertyValue_ModuleSerialNumberString);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(Value));
    std::string::assign((std::string *)a3, (const std::string::value_type *)objc_msgSend(v7, "UTF8String"));
    CFRelease(theDict);

    return 0;
  }
  return v5;
}

- (void)setFadedLabel:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 240.0, 240.0, 240.0, 0.5));
  objc_msgSend(v5, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setHighlightedLabel:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAlpha:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
  objc_msgSend(v5, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)updateProgress
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000108B8;
  block[3] = &unk_100028E30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)startStreaming
{
  int result;
  void *v4;
  void *__p[2];
  char v6;

  sub_10001A19C(__p, "startStreaming started");
  -[ViewController log:](self, "log:", __p);
  if (v6 < 0)
    operator delete(__p[0]);
  if (self->_running)
    return 0;
  DeviceCMInterface::enableJasperRgbVideo(self->_diagnosticCMInterface);
  objc_storeStrong((id *)&self->_streamingClient._listener, self);
  self->_diagnosticCMInterface->var1 = (StreamingClient *)&self->_streamingClient;
  if (DeviceCMInterface::startRgbWideRgbStream(self->_diagnosticCMInterface))
  {
    self->_diagnosticFinalResult = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("return val "), "stringByAppendingString:", CFSTR("ds")));
    -[ViewController error:details:](self, "error:details:", CFSTR("unable to start wide stream"), v4);
  }
  else
  {
    result = DeviceCMInterface::startJasperStream(self->_diagnosticCMInterface);
    if (!result)
      return result;
    self->_diagnosticFinalResult = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("return val "), "stringByAppendingString:", CFSTR("ds")));
    -[ViewController error:details:](self, "error:details:", CFSTR("unable to start jasper stream"), v4);
  }

  return 2;
}

- (int)initStreaming
{
  void *v3;
  void *__p[2];
  char v6;
  JasperConfiguration v7;

  v3 = objc_autoreleasePoolPush();
  sub_10001A19C(__p, "initStreaming");
  -[ViewController log:](self, "log:", __p);
  if (v6 < 0)
    operator delete(__p[0]);
  *(_DWORD *)&v7.var0 = 65537;
  v7.var4 = 16;
  if (-[ViewController isPortTypeJasperDetected](self, "isPortTypeJasperDetected"))
    DeviceCMInterface::initAndActivateCaptureDeviceController(self->_diagnosticCMInterface);
  self->_diagnosticFinalResult = 2;
  -[ViewController error:details:](self, "error:details:", CFSTR("no JasperDevice"), &stru_100029068);
  objc_autoreleasePoolPop(v3);
  return 2;
}

- (void)initFlow
{
  void *v3;
  UserMovementTracker *v4;
  UserMovementTracker *m_userMovementTracker;
  uint64_t **v6;
  void *v7;
  void *v8;
  int v9;
  void *__p[2];
  char v11;

  v3 = objc_autoreleasePoolPush();
  v4 = -[UserMovementTracker init:noMovementAttitudeChangeMinThreshold:noMovementMinTimeSeconds:startMovementTrackingNow:]([UserMovementTracker alloc], "init:noMovementAttitudeChangeMinThreshold:noMovementMinTimeSeconds:startMovementTrackingNow:", 0, 0, *(float *)&self->_sessionMaxTimeOut, 2.0);
  m_userMovementTracker = self->m_userMovementTracker;
  self->m_userMovementTracker = v4;

  self->_iterationNumber = 1;
  *(_QWORD *)self->_avgRotAngles = 0;
  *(_DWORD *)&self->_avgRotAngles[8] = 0;
  sub_10001A19C(__p, "init flow started");
  -[ViewController log:](self, "log:", __p);
  if (v11 < 0)
    operator delete(__p[0]);
  -[ViewController prepareNewIteration](self, "prepareNewIteration");
  -[ViewController prepareIterationToNewSession](self, "prepareIterationToNewSession");
  v9 = 0;
  if (self->_iterationsLimit >= 1)
  {
    do
    {
      __p[0] = &v9;
      v6 = sub_10001A260((uint64_t **)&self->_rgbjCalibrationResults, &v9, (uint64_t)&unk_100020847, (_DWORD **)__p);
      v6[6] = v6[5];
      ++v9;
    }
    while (v9 < self->_iterationsLimit);
  }
  *(_QWORD *)&self->_anon_b8[8] = *(_QWORD *)self->_anon_b8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "handleSuspend", UIApplicationDidEnterBackgroundNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "handleResume", UIApplicationWillEnterForegroundNotification, 0);

  -[ViewController handleResume](self, "handleResume");
  -[UserMovementTracker addObserver:forKeyPath:options:context:](self->m_userMovementTracker, "addObserver:forKeyPath:options:context:", self, CFSTR("movementState"), 1, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("movementState"), a4, a5, a6))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011504;
    block[3] = &unk_100028E30;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleUserNoMovement
{
  unint64_t v3;
  NSTimer *v4;
  NSTimer *m_noMovementQuitTimer;
  _QWORD v6[5];

  -[ViewController showPausedDialog](self, "showPausedDialog");
  ++self->_noMovementCounter;
  if (!self->m_noMovementQuitTimer)
  {
    LODWORD(v3) = *(_DWORD *)&self->_upperViewRendered;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011630;
    v6[3] = &unk_100028E58;
    v6[4] = self;
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, (double)v3));
    m_noMovementQuitTimer = self->m_noMovementQuitTimer;
    self->m_noMovementQuitTimer = v4;

  }
}

- (void)handleUserMovement
{
  NSTimer *m_noMovementQuitTimer;
  NSTimer *v4;

  m_noMovementQuitTimer = self->m_noMovementQuitTimer;
  if (m_noMovementQuitTimer)
  {
    -[NSTimer invalidate](m_noMovementQuitTimer, "invalidate");
    v4 = self->m_noMovementQuitTimer;
    self->m_noMovementQuitTimer = 0;

  }
  -[ViewController hideWarningWindow](self, "hideWarningWindow");
}

- (void)showPausedDialog
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Device_Is_Motionless"), &stru_100029068, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Device_Is_Motionless_Subtitle"), &stru_100029068, 0));

  -[ViewController showWarningWindow:subMessage:](self, "showWarningWindow:subMessage:", v6, v5);
}

- (int)initDiagnosticRgbjFlow
{
  const __CFString *v3;
  int v4;
  void *__p[2];
  char v7;

  sub_10001A19C(__p, "set rgbj configuration to frameSelect(1)  featureVector(5)  dilutionRate(500)");
  -[ViewController log:](self, "log:", __p);
  if (v7 < 0)
    operator delete(__p[0]);
  if (DeviceCMInterface::setRgbjConfiguration(self->_diagnosticCMInterface, 1u, 5u, 500))
  {
    v3 = CFSTR("setRgbjConfiguration failed");
  }
  else
  {
    if (!self->_resetExtrinsics)
      return 0;
    sub_10001A19C(__p, "set wide jasper extrinsics to 0");
    -[ViewController log:](self, "log:", __p);
    if (v7 < 0)
      operator delete(__p[0]);
    if (!DeviceCMInterface::setWideJasperExtrinsics(self->_diagnosticCMInterface, 0.0, 0.0, 1570.8, 0.0, 0.0, 0.0))return 0;
    v3 = CFSTR("error setting wide jasper extrinsics");
  }
  v4 = 2;
  self->_diagnosticFinalResult = 2;
  -[ViewController error:details:](self, "error:details:", v3, &stru_100029068);
  return v4;
}

- (int)getRotAnglesToPrcl:(ViewController *)self focalPoint:(SEL)a2 prcl:(Prcl *)a3
{
  __int128 v3;
  __int128 v4;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_sensorId;
  __int128 v8;
  __int128 v9;
  simd_float4x3 v10;

  v8 = v3;
  v9 = v4;
  p_sensorId = &self->_sensorId;
  if (*((char *)&self->_sensorId.__r_.__value_.var0.__l + 23) < 0)
    p_sensorId = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_sensorId->__r_.__value_.var0.__l.__data_;
  strcpy(a3->jasperSN, p_sensorId->__r_.__value_.var0.__s.__data_);
  CalcRotationMatrix(*(float *)&v8 / 1000.0, *((float *)&v8 + 1) / 1000.0, *((float *)&v8 + 2) / 1000.0, &v10);
  v10.columns[3].i32[2] = DWORD2(v9);
  v10.columns[3].i64[0] = v9;
  Simd4x3ToMatrix(&v10, a3->wideRotMatrix, a3->wideFocalPoint);
  return 0;
}

- (int)getCalibResults:(ViewController *)self focalPoint:(SEL)a2
{
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 *v5;
  int v7;
  const void *v8;
  __n128 OperationalWideToPeridotTransform;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *__p;
  unsigned __int32 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  __CFData *v26;

  v4 = v3;
  v5 = v2;
  sub_10001A19C(&__p, "getCalibResults");
  -[ViewController log:](self, "log:", &__p);
  if (SHIBYTE(v20) < 0)
    operator delete(__p);
  v26 = 0;
  if (DeviceCMInterface::getJasperCalib(self->_diagnosticCMInterface, &v26))
  {
    v7 = 2;
    self->_diagnosticFinalResult = 2;
    -[ViewController error:details:](self, "error:details:", CFSTR("unable to get JasperCalib"), &stru_100029068);
  }
  else
  {
    if (LOBYTE(self->_sensorId.__r_.var0))
    {
      v8 = (const void *)JDJasperCalibCreateWithBinaryRepresentation(v26);
      JDJasperCalibGetOperationalWideToJasperTransform(v26);
    }
    else
    {
      v8 = (const void *)PDPeridotCalibCreateWithBinaryRepresentation(v26);
      OperationalWideToPeridotTransform = PDPeridotCalibGetOperationalWideToPeridotTransform(v26);
    }
    v19 = OperationalWideToPeridotTransform.n128_u32[2];
    v21 = v11;
    v23 = v13;
    __p = (void *)OperationalWideToPeridotTransform.n128_u64[0];
    v20 = v10;
    v25 = v15;
    v22 = v12;
    v24 = v14;
    CFRelease(v8);
    v16 = v24;
    *(_DWORD *)(v4 + 8) = v25;
    *(_QWORD *)v4 = v16;
    CalcRotationAngleFromMatrix((uint64_t)&__p, v5);
    CFRelease(v26);
    return 0;
  }
  return v7;
}

- (void)loadNormalAppWindow
{
  id v3;
  id WeakRetained;
  UIView *v5;
  UIView *storyBoardView;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *mainView;
  id v26;
  id v27;
  UIView *v28;
  UIView *cameraView;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  void *v35;
  void *v36;
  UILabel *v37;
  UILabel *warningViewLabel;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIProgressView *v49;
  UIProgressView *progressView;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  UILabel *v60;
  UILabel *warningViewSubLabel;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  UILabel *v66;
  void *v67;
  UILabel *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  double v79;
  double v80;
  UILabel *v81;
  UILabel *statusLabel;
  id v83;
  id v84;
  void *v85;
  void *v86;
  UIStackView *v87;
  UIStackView *bottomView;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  UIImageView *v118;
  UIImageView *imageView;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  ViewControllerCallbacks *v129;
  ViewControllerCallbacks *listener;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *context;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  void *__p[2];
  char v150;
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[4];

  context = objc_autoreleasePoolPush();
  sub_10001A19C(__p, "loadNormalAppWindow");
  -[ViewController log:](self, "log:", __p);
  if (v150 < 0)
    operator delete(__p[0]);
  self->_progress = 0.0;
  self->_overallProgress = 0.0;
  v3 = objc_alloc((Class)UIView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(WeakRetained, "frame");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  storyBoardView = self->_storyBoardView;
  self->_storyBoardView = v5;

  v7 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(v7, "addSubview:", self->_storyBoardView);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_storyBoardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_storyBoardView, "heightAnchor"));
  v9 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:multiplier:", v10, 1.0));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_storyBoardView, "widthAnchor"));
  v13 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v14, 1.0));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_storyBoardView, "centerXAnchor"));
  v17 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_storyBoardView, "centerYAnchor"));
  v21 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (UIView *)objc_alloc_init((Class)UIView);
  mainView = self->_mainView;
  self->_mainView = v24;

  v26 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(v26, "addSubview:", self->_mainView);

  v27 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(v27, "sendSubviewToBack:", self->_mainView);

  BYTE4(self->_sensorId.var0) = 0;
  v28 = (UIView *)objc_alloc_init((Class)UIView);
  cameraView = self->_cameraView;
  self->_cameraView = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_cameraView, "layer"));
  objc_msgSend(v30, "setCornerRadius:", 10.0);

  -[UIView setAlpha:](self->_cameraView, "setAlpha:", 0.5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_cameraView, "setBackgroundColor:", v31);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_cameraView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_cameraView, "widthAnchor"));
  v33 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(v33, "frame");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToConstant:", v34 - (double)(2 * LODWORD(self->_sensorId.var0))));
  objc_msgSend(v35, "setActive:", 1);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_cameraView, "widthAnchor"));
  v37 = (UILabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 0.0));
  warningViewLabel = self->_warningViewLabel;
  self->_warningViewLabel = v37;

  -[UILabel setActive:](self->_warningViewLabel, "setActive:", 1);
  LODWORD(v39) = 1148813312;
  -[UILabel setPriority:](self->_warningViewLabel, "setPriority:", v39);
  -[UIView addSubview:](self->_storyBoardView, "addSubview:", self->_cameraView);
  -[UIView setHidden:](self->_cameraView, "setHidden:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_cameraView, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_storyBoardView, "safeAreaLayoutGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, (float)((float)LODWORD(self->_sensorId.var0) + 30.0)));
  objc_msgSend(v43, "setActive:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_cameraView, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", (double)(*(_DWORD *)&self->_sensorId.__r_.var1 + 2 * LODWORD(self->_sensorId.var0))));
  objc_msgSend(v45, "setActive:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_cameraView, "centerXAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_storyBoardView, "centerXAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
  objc_msgSend(v48, "setActive:", 1);

  v49 = (UIProgressView *)objc_alloc_init((Class)UILabel);
  progressView = self->_progressView;
  self->_progressView = v49;

  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_cameraView, "addSubview:", self->_progressView);
  -[UIProgressView setHidden:](self->_progressView, "setHidden:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIProgressView setTextColor:](self->_progressView, "setTextColor:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView topAnchor](self->_progressView, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_cameraView, "topAnchor"));
  LODWORD(v54) = self->_sensorId.var0;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, (double)v54));
  objc_msgSend(v55, "setActive:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView leadingAnchor](self->_progressView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_cameraView, "leadingAnchor"));
  LODWORD(v58) = self->_sensorId.var0;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, (double)v58));
  objc_msgSend(v59, "setActive:", 1);

  v60 = (UILabel *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  warningViewSubLabel = self->_warningViewSubLabel;
  self->_warningViewSubLabel = v60;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_warningViewSubLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setBackgroundColor:](self->_warningViewSubLabel, "setBackgroundColor:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_warningViewSubLabel, "layer"));
  objc_msgSend(v63, "setCornerRadius:", 15.0);

  v64 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  objc_msgSend(v64, "addSubview:", self->_warningViewSubLabel);

  -[UILabel addTarget:action:forControlEvents:](self->_warningViewSubLabel, "addTarget:action:forControlEvents:", self, "quitButtonTapped", 64);
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("multiply"), v143));
  v66 = self->_warningViewSubLabel;
  v139 = v65;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "imageWithRenderingMode:", 2));
  -[UILabel setImage:forState:](v66, "setImage:forState:", v67, 0);

  v68 = self->_warningViewSubLabel;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTintColor:](v68, "setTintColor:", v69);

  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_warningViewSubLabel, "topAnchor"));
  v146 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "topAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:constant:", 30.0));
  v153[0] = v141;
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_warningViewSubLabel, "trailingAnchor"));
  v70 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v71, -30.0));
  v153[1] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_warningViewSubLabel, "widthAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToConstant:", 30.0));
  v153[2] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_warningViewSubLabel, "heightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToConstant:", 30.0));
  v153[3] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v153, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v77);

  v78 = objc_alloc((Class)UIView);
  -[UIView frame](self->_storyBoardView, "frame");
  v80 = v79;
  -[UIView frame](self->_storyBoardView, "frame");
  v81 = (UILabel *)objc_msgSend(v78, "initWithFrame:", 0.0, v80 + -184.0);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v81;

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
  -[UILabel bounds](self->_statusLabel, "bounds");
  objc_msgSend(v147, "setFrame:");
  v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v152[0] = objc_msgSend(v83, "CGColor");
  v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v152[1] = objc_msgSend(v84, "CGColor");
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v152, 2));
  objc_msgSend(v147, "setColors:", v85);

  objc_msgSend(v147, "setLocations:", &off_10002C040);
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_statusLabel, "layer"));
  objc_msgSend(v86, "addSublayer:", v147);

  -[UIView addSubview:](self->_storyBoardView, "addSubview:", self->_statusLabel);
  v87 = (UIStackView *)objc_alloc_init((Class)UIProgressView);
  bottomView = self->_bottomView;
  self->_bottomView = v87;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_storyBoardView, "addSubview:", self->_bottomView);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_bottomView, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_storyBoardView, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v90, 30.0));
  objc_msgSend(v91, "setActive:", 1);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_bottomView, "trailingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_storyBoardView, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintLessThanOrEqualToAnchor:constant:", v93, -30.0));
  objc_msgSend(v94, "setActive:", 1);

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_bottomView, "leadingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_storyBoardView, "safeAreaLayoutGuide"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintGreaterThanOrEqualToAnchor:constant:", v97, 30.0));
  objc_msgSend(v98, "setActive:", 1);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_bottomView, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_storyBoardView, "safeAreaLayoutGuide"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintLessThanOrEqualToAnchor:constant:", v101, -30.0));
  objc_msgSend(v102, "setActive:", 1);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_bottomView, "widthAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToConstant:", 334.0));
  objc_msgSend(v104, "setActive:", 1);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_bottomView, "heightAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToConstant:", 4.0));
  objc_msgSend(v106, "setActive:", 1);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_bottomView, "centerXAnchor"));
  v108 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "centerXAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v109));
  objc_msgSend(v110, "setActive:", 1);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_bottomView, "bottomAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_storyBoardView, "safeAreaLayoutGuide"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113, -46.0));
  objc_msgSend(v114, "setActive:", 1);

  -[UIStackView setClipsToBounds:](self->_bottomView, "setClipsToBounds:", 1);
  -[UIStackView setProgressViewStyle:](self->_bottomView, "setProgressViewStyle:", 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIStackView setTintColor:](self->_bottomView, "setTintColor:", v115);

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIStackView setTrackTintColor:](self->_bottomView, "setTrackTintColor:", v116);

  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layer](self->_bottomView, "layer"));
  objc_msgSend(v117, "setCornerRadius:", 2.0);

  v118 = (UIImageView *)objc_alloc_init((Class)UIView);
  imageView = self->_imageView;
  self->_imageView = v118;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.5);
  -[UIView addSubview:](self->_storyBoardView, "addSubview:", self->_imageView);
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_storyBoardView, "widthAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:multiplier:", v121, 1.0));
  objc_msgSend(v122, "setActive:", 1);

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_imageView, "centerXAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_storyBoardView, "centerXAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v124));
  objc_msgSend(v125, "setActive:", 1);

  v126 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_storyBoardView, "heightAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:multiplier:", v127, 0.73));
  objc_msgSend(v128, "setActive:", 1);

  -[UIView addSubview:](self->_storyBoardView, "addSubview:", self->_middleView);
  v129 = (ViewControllerCallbacks *)objc_alloc_init((Class)UIImageView);
  listener = self->_listener;
  self->_listener = v129;

  -[UIView addSubview:](self->_mainView, "addSubview:", self->_listener);
  -[ViewControllerCallbacks setTranslatesAutoresizingMaskIntoConstraints:](self->_listener, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ViewControllerCallbacks setContentMode:](self->_listener, "setContentMode:", 2);
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[ViewControllerCallbacks heightAnchor](self->_listener, "heightAnchor"));
  v131 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "heightAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:", v132));
  v151[0] = v133;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[ViewControllerCallbacks widthAnchor](self->_listener, "widthAnchor"));
  v135 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "widthAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v136));
  v151[1] = v137;
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v151, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v138);

  self->_uiStreamType = 0;
  self->_calibrationResult = 2;
  -[ViewController showInProgressView](self, "showInProgressView");
  -[ViewController initFlow](self, "initFlow");

  objc_autoreleasePoolPop(context);
}

- (void)compareResults:(float *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  float32x2_t *v11;
  float32x2_t v12;
  float v13;
  unint64_t v14;
  __int128 *v15;
  __int128 v16;
  float32x2_t v17;
  float v18;
  std::string *v19;
  std::string *v20;
  std::string::size_type size;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  __int128 v25;
  float v26;
  std::string *v27;
  std::string::size_type v28;
  std::string *v29;
  __int128 v30;
  std::string *v31;
  __int128 v32;
  std::string *v33;
  std::string::size_type v34;
  std::string *v35;
  void *v36;
  char v37;
  __int128 __val;
  float __vala;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string v43;
  std::string v44;
  std::string v45;
  std::string v46;
  std::string v47;
  void *v48;
  __int128 v49;
  _QWORD v50[2];

  sub_10001A19C(&v48, "compareResults started");
  -[ViewController log:](self, "log:", &v48);
  if (SHIBYTE(v49) < 0)
    operator delete(v48);
  v5 = *(_QWORD *)self->_anon_b8;
  v6 = *(_QWORD *)&self->_anon_b8[8];
  v7 = v6 - v5;
  if (v6 == v5)
  {
    v10 = 0uLL;
  }
  else
  {
    v8 = 0;
    v9 = v7 >> 4;
    if (v9 <= 1)
      v9 = 1;
    v10 = 0uLL;
    do
    {
      v11 = (float32x2_t *)(v5 + 16 * v8);
      v12 = *v11;
      v13 = v11[1].f32[0];
      v14 = v9;
      v15 = *(__int128 **)self->_anon_b8;
      do
      {
        v16 = *v15++;
        v17 = vabd_f32(v12, *(float32x2_t *)&v16);
        *(int8x8_t *)&v10 = vbsl_s8((int8x8_t)vcgt_f32(v17, *(float32x2_t *)&v10), (int8x8_t)v17, *(int8x8_t *)&v10);
        v18 = vabds_f32(v13, *((float *)&v16 + 2));
        if (*((float *)&v10 + 2) >= v18)
          v18 = *((float *)&v10 + 2);
        *((float *)&v10 + 2) = v18;
        --v14;
      }
      while (v14);
      ++v8;
    }
    while (v8 != v9);
  }
  __val = v10;
  v48 = 0;
  v49 = 0uLL;
  sub_10001A510((uint64_t)&v43, 0x10uLL);
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v43;
  else
    v19 = (std::string *)v43.__r_.__value_.__r.__words[0];
  strcpy((char *)v19, "maxDiff x,y,z = ");
  std::to_string(&v42, *(float *)&__val);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v42;
  else
    v20 = (std::string *)v42.__r_.__value_.__r.__words[0];
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
  else
    size = v42.__r_.__value_.__l.__size_;
  v22 = std::string::append(&v43, (const std::string::value_type *)v20, size);
  v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v23;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  v24 = std::string::append(&v44, " ");
  v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  v26 = *((float *)&__val + 1);
  std::to_string(&v41, *((float *)&__val + 1));
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v27 = &v41;
  else
    v27 = (std::string *)v41.__r_.__value_.__r.__words[0];
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v28 = HIBYTE(v41.__r_.__value_.__r.__words[2]);
  else
    v28 = v41.__r_.__value_.__l.__size_;
  v29 = std::string::append(&v45, (const std::string::value_type *)v27, v28);
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  v31 = std::string::append(&v46, " ");
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v47.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v40, *((float *)&__val + 2));
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v33 = &v40;
  else
    v33 = (std::string *)v40.__r_.__value_.__r.__words[0];
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v34 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  else
    v34 = v40.__r_.__value_.__l.__size_;
  v35 = std::string::append(&v47, (const std::string::value_type *)v33, v34);
  v36 = (void *)v35->__r_.__value_.__r.__words[0];
  v50[0] = v35->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)v50 + 7) = *(std::string::size_type *)((char *)&v35->__r_.__value_.__r.__words[1] + 7);
  v37 = HIBYTE(v35->__r_.__value_.__r.__words[2]);
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  v48 = v36;
  *(_QWORD *)((char *)&v49 + 7) = *(_QWORD *)((char *)v50 + 7);
  *(_QWORD *)&v49 = v50[0];
  HIBYTE(v49) = v37;
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  -[ViewController log:](self, "log:", &v48, (_QWORD)__val);
  if (__vala > *a3 || v26 > a3[1] || *((float *)&__val + 2) > a3[2])
    self->_diagnosticFinalResult = -3;
  else
    self->_diagnosticFinalResult = 0;
  if (SHIBYTE(v49) < 0)
    operator delete(v48);
}

- (void)dogWatch:(id)a3
{
  void *v4;
  NSObject *backgroundDispatchQueue;
  int *p_iterationNumber;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t *v19;
  __int128 v20;
  uint64_t *v21;
  uint64_t *v22;
  __int128 v23;
  uint64_t **v24;
  void *v25;
  void *v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  __int128 v30;
  std::string *v31;
  std::string::size_type size;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  __int128 v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  std::string::size_type v40;
  std::string *v41;
  __int128 v42;
  std::string *v43;
  __int128 v44;
  std::string *v45;
  __int128 v46;
  std::string *v47;
  std::string::size_type v48;
  std::string *v49;
  __int128 v50;
  std::string *v51;
  __int128 v52;
  std::string *v53;
  __int128 v54;
  std::string *v55;
  std::string::size_type v56;
  std::string *v57;
  __int128 v58;
  std::string *v59;
  __int128 v60;
  std::string *v61;
  __int128 v62;
  std::string *v63;
  std::string::size_type v64;
  std::string *v65;
  __int128 v66;
  const std::string::value_type *v67;
  std::string::size_type v68;
  uint64_t **v69;
  uint64_t **v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  unint64_t v74;
  std::string *v75;
  __int128 v76;
  std::string *v77;
  __int128 v78;
  uint64_t *v79;
  _DWORD *v80;
  int v81;
  std::string *v82;
  std::string::size_type v83;
  std::string *v84;
  __int128 v85;
  std::string *v86;
  __int128 v87;
  std::string *v88;
  __int128 v89;
  uint64_t *v90;
  _DWORD *v91;
  int v92;
  std::string *v93;
  std::string::size_type v94;
  std::string *v95;
  __int128 v96;
  std::string *v97;
  __int128 v98;
  std::string *v99;
  __int128 v100;
  uint64_t *v101;
  _DWORD *v102;
  int v103;
  std::string *v104;
  std::string::size_type v105;
  std::string *v106;
  __int128 v107;
  std::string *v108;
  __int128 v109;
  std::string *v110;
  __int128 v111;
  uint64_t *v112;
  _DWORD *v113;
  int v114;
  std::string *v115;
  std::string::size_type v116;
  std::string *v117;
  __int128 v118;
  const std::string::value_type *v119;
  std::string::size_type v120;
  void *v121;
  void *v122;
  float progress;
  std::string *v124;
  __int128 v125;
  float v126;
  std::string *v127;
  __int128 v128;
  float v129;
  std::string *v130;
  __int128 v131;
  int v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  int sessionSecondsCount;
  std::string *v143;
  __int128 v144;
  std::string *v145;
  __int128 v146;
  std::string *v147;
  std::string::size_type v148;
  std::string *v149;
  __int128 v150;
  std::string *v151;
  __int128 v152;
  std::string *v153;
  std::string::size_type v154;
  std::string *v155;
  __int128 v156;
  std::string *v157;
  __int128 v158;
  std::string *v159;
  std::string::size_type v160;
  std::string *v161;
  __int128 v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  id v167;
  std::string *v168;
  std::string::size_type v169;
  std::string *v170;
  __int128 v171;
  std::string *v172;
  __int128 v173;
  std::string *v174;
  std::string::size_type v175;
  std::string *v176;
  __int128 v177;
  std::string *v178;
  __int128 v179;
  std::string *v180;
  std::string::size_type v181;
  std::string *v182;
  __int128 v183;
  std::string *v184;
  __int128 v185;
  std::string *v186;
  std::string::size_type v187;
  std::string *v188;
  __int128 v189;
  std::string *v190;
  __int128 v191;
  std::string *v192;
  std::string::size_type v193;
  std::string *v194;
  __int128 v195;
  std::string *v196;
  __int128 v197;
  std::string *v198;
  std::string::size_type v199;
  std::string *v200;
  __int128 v201;
  std::string *v202;
  __int128 v203;
  std::string *v204;
  std::string::size_type v205;
  std::string *v206;
  __int128 v207;
  std::string *v208;
  __int128 v209;
  std::string *v210;
  std::string::size_type v211;
  std::string *v212;
  __int128 v213;
  std::string *v214;
  __int128 v215;
  std::string *v216;
  std::string::size_type v217;
  std::string *v218;
  __int128 v219;
  std::string *v220;
  std::string::size_type v221;
  char v222;
  int v223;
  NSObject *v224;
  unsigned __int8 *anon_b8;
  std::string *v226;
  __int128 v227;
  std::string *v228;
  __int128 v229;
  std::string *v230;
  std::string::size_type v231;
  std::string *v232;
  __int128 v233;
  std::string *v234;
  __int128 v235;
  std::string *v236;
  std::string::size_type v237;
  std::string *v238;
  __int128 v239;
  std::string *v240;
  __int128 v241;
  std::string *v242;
  std::string::size_type v243;
  std::string *v244;
  __int128 v245;
  std::string *v252;
  NSObject *v253;
  _QWORD *v254;
  __int128 v255;
  int v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  __int128 v260;
  unsigned __int8 *avgRotAngles;
  int iterationsLimit;
  float v263;
  std::string *v264;
  __int128 v265;
  std::string *v266;
  __int128 v267;
  std::string *v268;
  std::string::size_type v269;
  std::string *v270;
  __int128 v271;
  std::string *v272;
  __int128 v273;
  std::string *v274;
  std::string::size_type v275;
  std::string *v276;
  __int128 v277;
  std::string *v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  id v288;
  _QWORD v289[5];
  _QWORD v290[5];
  _QWORD v291[5];
  _QWORD v292[5];
  std::string v293;
  std::string v294;
  std::string v295;
  std::string v296;
  std::string v297;
  std::string v298;
  std::string v299;
  uint64_t v300;
  int v301;
  __int128 v302;
  _QWORD v303[5];
  std::string v304;
  std::string v305;
  std::string v306;
  std::string v307;
  std::string v308;
  std::string v309;
  std::string v310;
  std::string v311;
  std::string v312;
  std::string v313;
  std::string v314;
  std::string v315;
  std::string v316;
  std::string v317;
  std::string v318;
  std::string v319;
  std::string v320;
  std::string v321;
  std::string v322;
  _QWORD block[5];
  __int128 __val;
  int v325[2];
  _BYTE __p[256];
  _QWORD v327[2];
  std::string v328;
  std::string v329;

  v288 = a3;
  if (!self->_running)
    goto LABEL_170;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController imageView](self, "imageView"));
  objc_msgSend(v4, "setAlpha:", 1.0);

  if (DeviceCMInterface::getRgbjReport(self->_diagnosticCMInterface, (int *)&__val, (int *)&__val + 1, (int *)&__val + 3, v325, &v325[1]))goto LABEL_170;
  if (v325[1] == 1)
  {
    sub_10001A19C(__p, "Driver reported disk is full with RgbjReport_FailedToSave");
    -[ViewController log:](self, "log:", __p);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    self->_diagnosticFinalResult = -913;
    backgroundDispatchQueue = self->_backgroundDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001647C;
    block[3] = &unk_100028E30;
    block[4] = self;
    dispatch_async(backgroundDispatchQueue, block);
  }
  DWORD2(__val) = __val - DWORD1(__val);
  self->_watchDogJasperFramesCount = self->_jasperFramesCount;
  self->_resetExtrinsics = 0;
  ++self->_watchDogCounter;
  p_iterationNumber = &self->_iterationNumber;
  *(_QWORD *)__p = &self->_iterationNumber;
  v7 = sub_10001A260((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100020847, (_DWORD **)__p);
  v8 = v7[6];
  v9 = v7[7];
  if (v8 >= v9)
  {
    v12 = v7[5];
    v13 = 0xAAAAAAAAAAAAAAABLL * (v8 - v12);
    v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_100003294();
    v15 = 0xAAAAAAAAAAAAAAABLL * (v9 - v12);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)sub_10001A594((uint64_t)(v7 + 7), v16);
    else
      v17 = 0;
    v18 = (uint64_t *)&v17[24 * v13];
    v19 = (uint64_t *)&v17[24 * v16];
    v20 = __val;
    v18[2] = *(_QWORD *)v325;
    *(_OWORD *)v18 = v20;
    v11 = v18 + 3;
    v22 = v7[5];
    v21 = v7[6];
    if (v21 != v22)
    {
      do
      {
        v23 = *(_OWORD *)(v21 - 3);
        *(v18 - 1) = *(v21 - 1);
        *(_OWORD *)(v18 - 3) = v23;
        v18 -= 3;
        v21 -= 3;
      }
      while (v21 != v22);
      v21 = v7[5];
    }
    v7[5] = v18;
    v7[6] = v11;
    v7[7] = v19;
    if (v21)
      operator delete(v21);
  }
  else
  {
    v10 = __val;
    v8[2] = *(_QWORD *)v325;
    *(_OWORD *)v8 = v10;
    v11 = v8 + 3;
  }
  v7[6] = v11;
  *(_QWORD *)__p = &self->_iterationNumber;
  v24 = sub_10001A260((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100020847, (_DWORD **)__p);
  if ((char *)v24[6] - (char *)v24[5] == 24)
  {
    -[ViewController hideInProgressView](self, "hideInProgressView");
    -[ViewController hideWarningWindow](self, "hideWarningWindow");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Pan_Slowly"), &stru_100029068, 0));
    -[ViewController setUpperViewLabelText:](self, "setUpperViewLabelText:", v26);

    goto LABEL_170;
  }
  memset(&v322, 0, sizeof(v322));
  std::to_string(&v309, __val);
  v27 = std::string::insert(&v309, 0, "newsframesReachedController ");
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v310.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v310.__r_.__value_.__l.__data_ = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  v29 = std::string::append(&v310, " framesPassedController ");
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v311.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v311.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v308, SDWORD1(__val));
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v31 = &v308;
  else
    v31 = (std::string *)v308.__r_.__value_.__r.__words[0];
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v308.__r_.__value_.__r.__words[2]);
  else
    size = v308.__r_.__value_.__l.__size_;
  v33 = std::string::append(&v311, (const std::string::value_type *)v31, size);
  v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v328.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v328.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v35 = std::string::append(&v328, " ");
  v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v329.__r_.__value_.__r.__words[2] = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  v37 = std::string::append(&v329, "IsfSuccessCount ");
  v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  v312.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v307, SHIDWORD(__val));
  if ((v307.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v39 = &v307;
  else
    v39 = (std::string *)v307.__r_.__value_.__r.__words[0];
  if ((v307.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v40 = HIBYTE(v307.__r_.__value_.__r.__words[2]);
  else
    v40 = v307.__r_.__value_.__l.__size_;
  v41 = std::string::append(&v312, (const std::string::value_type *)v39, v40);
  v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v313.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  v43 = std::string::append(&v313, " ");
  v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  v314.__r_.__value_.__r.__words[2] = v43->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  v45 = std::string::append(&v314, "IsfFailedCount ");
  v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
  v315.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v46;
  v45->__r_.__value_.__l.__size_ = 0;
  v45->__r_.__value_.__r.__words[2] = 0;
  v45->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v306, v325[0]);
  if ((v306.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v47 = &v306;
  else
    v47 = (std::string *)v306.__r_.__value_.__r.__words[0];
  if ((v306.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v48 = HIBYTE(v306.__r_.__value_.__r.__words[2]);
  else
    v48 = v306.__r_.__value_.__l.__size_;
  v49 = std::string::append(&v315, (const std::string::value_type *)v47, v48);
  v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
  v316.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v50;
  v49->__r_.__value_.__l.__size_ = 0;
  v49->__r_.__value_.__r.__words[2] = 0;
  v49->__r_.__value_.__r.__words[0] = 0;
  v51 = std::string::append(&v316, " ");
  v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  v317.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  v53 = std::string::append(&v317, "framesFailedController ");
  v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  v318.__r_.__value_.__r.__words[2] = v53->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v54;
  v53->__r_.__value_.__l.__size_ = 0;
  v53->__r_.__value_.__r.__words[2] = 0;
  v53->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v305, SDWORD2(__val));
  if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v55 = &v305;
  else
    v55 = (std::string *)v305.__r_.__value_.__r.__words[0];
  if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v56 = HIBYTE(v305.__r_.__value_.__r.__words[2]);
  else
    v56 = v305.__r_.__value_.__l.__size_;
  v57 = std::string::append(&v318, (const std::string::value_type *)v55, v56);
  v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
  v319.__r_.__value_.__r.__words[2] = v57->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v58;
  v57->__r_.__value_.__l.__size_ = 0;
  v57->__r_.__value_.__r.__words[2] = 0;
  v57->__r_.__value_.__r.__words[0] = 0;
  v59 = std::string::append(&v319, " ");
  v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v320.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  v61 = std::string::append(&v320, "RgbjReportFailedToSave ");
  v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
  v321.__r_.__value_.__r.__words[2] = v61->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v62;
  v61->__r_.__value_.__l.__size_ = 0;
  v61->__r_.__value_.__r.__words[2] = 0;
  v61->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v304, v325[1]);
  if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v63 = &v304;
  else
    v63 = (std::string *)v304.__r_.__value_.__r.__words[0];
  if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v64 = HIBYTE(v304.__r_.__value_.__r.__words[2]);
  else
    v64 = v304.__r_.__value_.__l.__size_;
  v65 = std::string::append(&v321, (const std::string::value_type *)v63, v64);
  v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
  *(_QWORD *)&__p[16] = *((_QWORD *)&v65->__r_.__value_.__l + 2);
  *(_OWORD *)__p = v66;
  v65->__r_.__value_.__l.__size_ = 0;
  v65->__r_.__value_.__r.__words[2] = 0;
  v65->__r_.__value_.__r.__words[0] = 0;
  if (__p[23] >= 0)
    v67 = __p;
  else
    v67 = *(const std::string::value_type **)__p;
  if (__p[23] >= 0)
    v68 = __p[23];
  else
    v68 = *(_QWORD *)&__p[8];
  std::string::append(&v322, v67, v68);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v304.__r_.__value_.__l.__data_);
  if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v321.__r_.__value_.__l.__data_);
  if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v320.__r_.__value_.__l.__data_);
  if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v319.__r_.__value_.__l.__data_);
  if (SHIBYTE(v305.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v305.__r_.__value_.__l.__data_);
  if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v318.__r_.__value_.__l.__data_);
  if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v317.__r_.__value_.__l.__data_);
  if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v316.__r_.__value_.__l.__data_);
  if (SHIBYTE(v306.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v306.__r_.__value_.__l.__data_);
  if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v315.__r_.__value_.__l.__data_);
  if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v314.__r_.__value_.__l.__data_);
  if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v313.__r_.__value_.__l.__data_);
  if (SHIBYTE(v307.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v307.__r_.__value_.__l.__data_);
  if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v312.__r_.__value_.__l.__data_);
  if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v329.__r_.__value_.__l.__data_);
  if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v328.__r_.__value_.__l.__data_);
  if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v308.__r_.__value_.__l.__data_);
  if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v311.__r_.__value_.__l.__data_);
  if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v310.__r_.__value_.__l.__data_);
  if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v309.__r_.__value_.__l.__data_);
  -[ViewController log:](self, "log:", &v322);
  *(_QWORD *)__p = &self->_iterationNumber;
  v69 = sub_10001A260((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100020847, (_DWORD **)__p);
  *(_QWORD *)__p = &self->_iterationNumber;
  v70 = sub_10001A260((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100020847, (_DWORD **)__p);
  v72 = v70[5];
  v71 = v70[6];
  v73 = v69[5];
  std::string::assign(&v322, "");
  v74 = 0xAAAAAAAAAAAAAAABLL * (v71 - v72) - 2;
  std::to_string(&v328, v73[3 * v74]);
  v75 = std::string::insert(&v328, 0, "lastframesReachedController ");
  v76 = *(_OWORD *)&v75->__r_.__value_.__l.__data_;
  v329.__r_.__value_.__r.__words[2] = v75->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v76;
  v75->__r_.__value_.__l.__size_ = 0;
  v75->__r_.__value_.__r.__words[2] = 0;
  v75->__r_.__value_.__r.__words[0] = 0;
  v77 = std::string::append(&v329, " framesPassedController ");
  v78 = *(_OWORD *)&v77->__r_.__value_.__l.__data_;
  v312.__r_.__value_.__r.__words[2] = v77->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v78;
  v77->__r_.__value_.__l.__size_ = 0;
  v77->__r_.__value_.__r.__words[2] = 0;
  v77->__r_.__value_.__r.__words[0] = 0;
  v79 = &v73[3 * v74];
  v81 = *((_DWORD *)v79 + 1);
  v80 = (_DWORD *)v79 + 1;
  std::to_string(&v311, v81);
  if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v82 = &v311;
  else
    v82 = (std::string *)v311.__r_.__value_.__r.__words[0];
  if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v83 = HIBYTE(v311.__r_.__value_.__r.__words[2]);
  else
    v83 = v311.__r_.__value_.__l.__size_;
  v84 = std::string::append(&v312, (const std::string::value_type *)v82, v83);
  v85 = *(_OWORD *)&v84->__r_.__value_.__l.__data_;
  v313.__r_.__value_.__r.__words[2] = v84->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v85;
  v84->__r_.__value_.__l.__size_ = 0;
  v84->__r_.__value_.__r.__words[2] = 0;
  v84->__r_.__value_.__r.__words[0] = 0;
  v86 = std::string::append(&v313, " ");
  v87 = *(_OWORD *)&v86->__r_.__value_.__l.__data_;
  v314.__r_.__value_.__r.__words[2] = v86->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v87;
  v86->__r_.__value_.__l.__size_ = 0;
  v86->__r_.__value_.__r.__words[2] = 0;
  v86->__r_.__value_.__r.__words[0] = 0;
  v88 = std::string::append(&v314, "IsfSuccessCount ");
  v89 = *(_OWORD *)&v88->__r_.__value_.__l.__data_;
  v315.__r_.__value_.__r.__words[2] = v88->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v89;
  v88->__r_.__value_.__l.__size_ = 0;
  v88->__r_.__value_.__r.__words[2] = 0;
  v88->__r_.__value_.__r.__words[0] = 0;
  v90 = &v73[3 * v74];
  v92 = *((_DWORD *)v90 + 3);
  v91 = (_DWORD *)v90 + 3;
  std::to_string(&v310, v92);
  if ((v310.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v93 = &v310;
  else
    v93 = (std::string *)v310.__r_.__value_.__r.__words[0];
  if ((v310.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v94 = HIBYTE(v310.__r_.__value_.__r.__words[2]);
  else
    v94 = v310.__r_.__value_.__l.__size_;
  v95 = std::string::append(&v315, (const std::string::value_type *)v93, v94);
  v96 = *(_OWORD *)&v95->__r_.__value_.__l.__data_;
  v316.__r_.__value_.__r.__words[2] = v95->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v96;
  v95->__r_.__value_.__l.__size_ = 0;
  v95->__r_.__value_.__r.__words[2] = 0;
  v95->__r_.__value_.__r.__words[0] = 0;
  v97 = std::string::append(&v316, " ");
  v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
  v317.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v98;
  v97->__r_.__value_.__l.__size_ = 0;
  v97->__r_.__value_.__r.__words[2] = 0;
  v97->__r_.__value_.__r.__words[0] = 0;
  v99 = std::string::append(&v317, "IsfFailedCount ");
  v100 = *(_OWORD *)&v99->__r_.__value_.__l.__data_;
  v318.__r_.__value_.__r.__words[2] = v99->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v100;
  v99->__r_.__value_.__l.__size_ = 0;
  v99->__r_.__value_.__r.__words[2] = 0;
  v99->__r_.__value_.__r.__words[0] = 0;
  v101 = &v73[3 * v74];
  v103 = *((_DWORD *)v101 + 4);
  v102 = v101 + 2;
  std::to_string(&v309, v103);
  if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v104 = &v309;
  else
    v104 = (std::string *)v309.__r_.__value_.__r.__words[0];
  if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v105 = HIBYTE(v309.__r_.__value_.__r.__words[2]);
  else
    v105 = v309.__r_.__value_.__l.__size_;
  v106 = std::string::append(&v318, (const std::string::value_type *)v104, v105);
  v107 = *(_OWORD *)&v106->__r_.__value_.__l.__data_;
  v319.__r_.__value_.__r.__words[2] = v106->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v107;
  v106->__r_.__value_.__l.__size_ = 0;
  v106->__r_.__value_.__r.__words[2] = 0;
  v106->__r_.__value_.__r.__words[0] = 0;
  v108 = std::string::append(&v319, " ");
  v109 = *(_OWORD *)&v108->__r_.__value_.__l.__data_;
  v320.__r_.__value_.__r.__words[2] = v108->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v109;
  v108->__r_.__value_.__l.__size_ = 0;
  v108->__r_.__value_.__r.__words[2] = 0;
  v108->__r_.__value_.__r.__words[0] = 0;
  v110 = std::string::append(&v320, "framesFailedController ");
  v111 = *(_OWORD *)&v110->__r_.__value_.__l.__data_;
  v321.__r_.__value_.__r.__words[2] = v110->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v111;
  v110->__r_.__value_.__l.__size_ = 0;
  v110->__r_.__value_.__r.__words[2] = 0;
  v110->__r_.__value_.__r.__words[0] = 0;
  v112 = &v73[3 * v74];
  v114 = *((_DWORD *)v112 + 2);
  v113 = v112 + 1;
  std::to_string(&v308, v114);
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v115 = &v308;
  else
    v115 = (std::string *)v308.__r_.__value_.__r.__words[0];
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v116 = HIBYTE(v308.__r_.__value_.__r.__words[2]);
  else
    v116 = v308.__r_.__value_.__l.__size_;
  v117 = std::string::append(&v321, (const std::string::value_type *)v115, v116);
  v118 = *(_OWORD *)&v117->__r_.__value_.__l.__data_;
  *(_QWORD *)&__p[16] = *((_QWORD *)&v117->__r_.__value_.__l + 2);
  *(_OWORD *)__p = v118;
  v117->__r_.__value_.__l.__size_ = 0;
  v117->__r_.__value_.__r.__words[2] = 0;
  v117->__r_.__value_.__r.__words[0] = 0;
  if (__p[23] >= 0)
    v119 = __p;
  else
    v119 = *(const std::string::value_type **)__p;
  if (__p[23] >= 0)
    v120 = __p[23];
  else
    v120 = *(_QWORD *)&__p[8];
  std::string::append(&v322, v119, v120);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v308.__r_.__value_.__l.__data_);
  if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v321.__r_.__value_.__l.__data_);
  if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v320.__r_.__value_.__l.__data_);
  if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v319.__r_.__value_.__l.__data_);
  if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v309.__r_.__value_.__l.__data_);
  if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v318.__r_.__value_.__l.__data_);
  if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v317.__r_.__value_.__l.__data_);
  if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v316.__r_.__value_.__l.__data_);
  if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v310.__r_.__value_.__l.__data_);
  if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v315.__r_.__value_.__l.__data_);
  if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v314.__r_.__value_.__l.__data_);
  if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v313.__r_.__value_.__l.__data_);
  if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v311.__r_.__value_.__l.__data_);
  if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v312.__r_.__value_.__l.__data_);
  if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v329.__r_.__value_.__l.__data_);
  if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v328.__r_.__value_.__l.__data_);
  -[ViewController log:](self, "log:", &v322);
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("Pan_Slowly"), &stru_100029068, 0));
  -[ViewController setUpperViewLabelText:](self, "setUpperViewLabelText:", v122);

  if (self->m_noMovementQuitTimer)
    goto LABEL_168;
  if (!LOBYTE(self->_sensorId.__r_.var0) && self->_lastSceneError == 2)
  {
    self->_lastSceneError = 0;
    -[ViewController hideWarningWindow](self, "hideWarningWindow");
  }
  if (SHIDWORD(__val) > *v91)
  {
    self->_consecutiveSceneError = 0;
    progress = self->_progress;
    std::to_string(&v321, progress);
    v124 = std::string::insert(&v321, 0, "currProgress ");
    v125 = *(_OWORD *)&v124->__r_.__value_.__l.__data_;
    *(_QWORD *)&__p[16] = *((_QWORD *)&v124->__r_.__value_.__l + 2);
    *(_OWORD *)__p = v125;
    v124->__r_.__value_.__l.__size_ = 0;
    v124->__r_.__value_.__r.__words[2] = 0;
    v124->__r_.__value_.__r.__words[0] = 0;
    -[ViewController log:](self, "log:", __p);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v321.__r_.__value_.__l.__data_);
    v126 = (float)SHIDWORD(__val) / (float)self->_calibUpdateEachIsfEntiresLimit;
    self->_progress = v126;
    std::to_string(&v321, v126);
    v127 = std::string::insert(&v321, 0, "New progress per cycle ");
    v128 = *(_OWORD *)&v127->__r_.__value_.__l.__data_;
    *(_QWORD *)&__p[16] = *((_QWORD *)&v127->__r_.__value_.__l + 2);
    *(_OWORD *)__p = v128;
    v127->__r_.__value_.__l.__size_ = 0;
    v127->__r_.__value_.__r.__words[2] = 0;
    v127->__r_.__value_.__r.__words[0] = 0;
    -[ViewController log:](self, "log:", __p);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v321.__r_.__value_.__l.__data_);
    v129 = self->_overallProgress + (float)((float)(self->_progress - progress) / 9.0);
    self->_overallProgress = v129;
    std::to_string(&v321, v129);
    v130 = std::string::insert(&v321, 0, "_overallProgress ");
    v131 = *(_OWORD *)&v130->__r_.__value_.__l.__data_;
    *(_QWORD *)&__p[16] = *((_QWORD *)&v130->__r_.__value_.__l + 2);
    *(_OWORD *)__p = v131;
    v130->__r_.__value_.__l.__size_ = 0;
    v130->__r_.__value_.__r.__words[2] = 0;
    v130->__r_.__value_.__r.__words[0] = 0;
    -[ViewController log:](self, "log:", __p);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v321.__r_.__value_.__l.__data_);
    self->_lastSceneError = 0;
    -[ViewController updateProgress](self, "updateProgress");
    -[ViewController hideInProgressView](self, "hideInProgressView");
    -[ViewController hideWarningWindow](self, "hideWarningWindow");
    goto LABEL_199;
  }
  if (v325[0] > *v102)
  {
    self->_lastSceneError = 2;
    v132 = self->_consecutiveSceneError + 1;
    self->_consecutiveSceneError = v132;
    if (v132 < (signed int)self->_textMargin)
      goto LABEL_199;
    v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "localizedStringForKey:value:table:", CFSTR("Bad_Scene"), &stru_100029068, 0));
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("Bad_Scene_Subtitle"), &stru_100029068, 0));
    -[ViewController showWarningWindow:subMessage:](self, "showWarningWindow:subMessage:", v134, v136);

    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "localizedStringForKey:value:table:", CFSTR("Pan_Slowly"), &stru_100029068, 0));
    -[ViewController setUpperViewLabelText:](self, "setUpperViewLabelText:", v138);
    goto LABEL_198;
  }
  if (SDWORD1(__val) <= *v80)
  {
    if (SDWORD2(__val) <= *v113)
      goto LABEL_199;
    self->_lastSceneError = 1;
    v139 = self->_consecutiveSceneError + 1;
    self->_consecutiveSceneError = v139;
    if (v139 < (signed int)self->_textMargin)
      goto LABEL_199;
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "localizedStringForKey:value:table:", CFSTR("No_Objects_Found"), &stru_100029068, 0));
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "localizedStringForKey:value:table:", CFSTR("No_Objects_Found_Subtitle"), &stru_100029068, 0));
    -[ViewController showWarningWindow:subMessage:](self, "showWarningWindow:subMessage:", v138, v141);

LABEL_198:
    goto LABEL_199;
  }
  if (self->_lastSceneError != 2)
  {
    -[ViewController hideWarningWindow](self, "hideWarningWindow");
    self->_lastSceneError = 0;
  }
  -[ViewController hideInProgressView](self, "hideInProgressView");
LABEL_199:
  if (SHIDWORD(__val) < self->_calibUpdateEachIsfEntiresLimit)
  {
    sessionSecondsCount = self->_sessionSecondsCount;
    self->_sessionSecondsCount = sessionSecondsCount + 1;
    if (sessionSecondsCount >= *(_DWORD *)&self->_isJasper
      || self->_consecutiveSceneError > (signed int)self->_topTextHeight)
    {
      std::to_string(&v315, sessionSecondsCount + 1);
      v143 = std::string::insert(&v315, 0, "sessionTimeOutTimer timeout _sessionSecondsCount");
      v144 = *(_OWORD *)&v143->__r_.__value_.__l.__data_;
      v316.__r_.__value_.__r.__words[2] = v143->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v144;
      v143->__r_.__value_.__l.__size_ = 0;
      v143->__r_.__value_.__r.__words[2] = 0;
      v143->__r_.__value_.__r.__words[0] = 0;
      v145 = std::string::append(&v316, " _consecutiveSceneError ");
      v146 = *(_OWORD *)&v145->__r_.__value_.__l.__data_;
      v317.__r_.__value_.__r.__words[2] = v145->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v146;
      v145->__r_.__value_.__l.__size_ = 0;
      v145->__r_.__value_.__r.__words[2] = 0;
      v145->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v314, self->_consecutiveSceneError);
      if ((v314.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v147 = &v314;
      else
        v147 = (std::string *)v314.__r_.__value_.__r.__words[0];
      if ((v314.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v148 = HIBYTE(v314.__r_.__value_.__r.__words[2]);
      else
        v148 = v314.__r_.__value_.__l.__size_;
      v149 = std::string::append(&v317, (const std::string::value_type *)v147, v148);
      v150 = *(_OWORD *)&v149->__r_.__value_.__l.__data_;
      v318.__r_.__value_.__r.__words[2] = v149->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v150;
      v149->__r_.__value_.__l.__size_ = 0;
      v149->__r_.__value_.__r.__words[2] = 0;
      v149->__r_.__value_.__r.__words[0] = 0;
      v151 = std::string::append(&v318, " _sessionMaxTimeOut ");
      v152 = *(_OWORD *)&v151->__r_.__value_.__l.__data_;
      v319.__r_.__value_.__r.__words[2] = v151->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v152;
      v151->__r_.__value_.__l.__size_ = 0;
      v151->__r_.__value_.__r.__words[2] = 0;
      v151->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v313, *(_DWORD *)&self->_isJasper);
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v153 = &v313;
      else
        v153 = (std::string *)v313.__r_.__value_.__r.__words[0];
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v154 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
      else
        v154 = v313.__r_.__value_.__l.__size_;
      v155 = std::string::append(&v319, (const std::string::value_type *)v153, v154);
      v156 = *(_OWORD *)&v155->__r_.__value_.__l.__data_;
      v320.__r_.__value_.__r.__words[2] = v155->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v156;
      v155->__r_.__value_.__l.__size_ = 0;
      v155->__r_.__value_.__r.__words[2] = 0;
      v155->__r_.__value_.__r.__words[0] = 0;
      v157 = std::string::append(&v320, " _consecutiveSceneErrorLimit ");
      v158 = *(_OWORD *)&v157->__r_.__value_.__l.__data_;
      v321.__r_.__value_.__r.__words[2] = v157->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v158;
      v157->__r_.__value_.__l.__size_ = 0;
      v157->__r_.__value_.__r.__words[2] = 0;
      v157->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v312, self->_topTextHeight);
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v159 = &v312;
      else
        v159 = (std::string *)v312.__r_.__value_.__r.__words[0];
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v160 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
      else
        v160 = v312.__r_.__value_.__l.__size_;
      v161 = std::string::append(&v321, (const std::string::value_type *)v159, v160);
      v162 = *(_OWORD *)&v161->__r_.__value_.__l.__data_;
      *(_QWORD *)&__p[16] = *((_QWORD *)&v161->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v162;
      v161->__r_.__value_.__l.__size_ = 0;
      v161->__r_.__value_.__r.__words[2] = 0;
      v161->__r_.__value_.__r.__words[0] = 0;
      -[ViewController log:](self, "log:", __p);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v312.__r_.__value_.__l.__data_);
      if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v321.__r_.__value_.__l.__data_);
      if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v320.__r_.__value_.__l.__data_);
      if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v313.__r_.__value_.__l.__data_);
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v319.__r_.__value_.__l.__data_);
      if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v318.__r_.__value_.__l.__data_);
      if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v314.__r_.__value_.__l.__data_);
      if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v317.__r_.__value_.__l.__data_);
      if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v316.__r_.__value_.__l.__data_);
      if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v315.__r_.__value_.__l.__data_);
      -[ViewController handleSuspend](self, "handleSuspend");
      v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "localizedStringForKey:value:table:", CFSTR("Timed_Out"), &stru_100029068, 0));
      -[ViewController showWarningWindow:subMessage:](self, "showWarningWindow:subMessage:", v164, &stru_100029068);

      v165 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController upperView](self, "upperView"));
      objc_msgSend(v165, "setHidden:", 1);

      v166 = self->_backgroundDispatchQueue;
      v289[0] = _NSConcreteStackBlock;
      v289[1] = 3221225472;
      v289[2] = sub_100016704;
      v289[3] = &unk_100028E30;
      v289[4] = self;
      dispatch_async(v166, v289);
    }
    goto LABEL_168;
  }
  sub_10001A19C(__p, "dogWatch finishing sub iteration");
  -[ViewController log:](self, "log:", __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  ++self->_sesssionIsfCount;
  self->_running = 0;
  v167 = &_dispatch_main_q;
  v303[0] = _NSConcreteStackBlock;
  v303[1] = 3221225472;
  v303[2] = sub_100016484;
  v303[3] = &unk_100028E30;
  v303[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v303);

  if (DeviceCMInterface::forceSaveWideJasperCalib(self->_diagnosticCMInterface))
  {
    -[ViewController error:details:](self, "error:details:", CFSTR("failed to forceSaveWideJasperCalib"), &stru_100029068);
    goto LABEL_168;
  }
  DWORD2(v302) = 0;
  *(_QWORD *)&v302 = 0;
  v301 = 0;
  v300 = 0;
  if (!-[ViewController getCalibResults:focalPoint:](self, "getCalibResults:focalPoint:", &v302, &v300))
  {
    memset(&v321, 0, sizeof(v321));
    sub_100013560("iteration ", (const void **)&v321.__r_.__value_.__l.__data_, (void **)&v306.__r_.__value_.__l.__data_);
    std::to_string(&v305, *p_iterationNumber);
    if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v168 = &v305;
    else
      v168 = (std::string *)v305.__r_.__value_.__r.__words[0];
    if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v169 = HIBYTE(v305.__r_.__value_.__r.__words[2]);
    else
      v169 = v305.__r_.__value_.__l.__size_;
    v170 = std::string::append(&v306, (const std::string::value_type *)v168, v169);
    v171 = *(_OWORD *)&v170->__r_.__value_.__l.__data_;
    v307.__r_.__value_.__r.__words[2] = v170->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v307.__r_.__value_.__l.__data_ = v171;
    v170->__r_.__value_.__l.__size_ = 0;
    v170->__r_.__value_.__r.__words[2] = 0;
    v170->__r_.__value_.__r.__words[0] = 0;
    v172 = std::string::append(&v307, " Iteration Total Successfull Runs ");
    v173 = *(_OWORD *)&v172->__r_.__value_.__l.__data_;
    v308.__r_.__value_.__r.__words[2] = v172->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v308.__r_.__value_.__l.__data_ = v173;
    v172->__r_.__value_.__l.__size_ = 0;
    v172->__r_.__value_.__r.__words[2] = 0;
    v172->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v304, self->_iterationTotalSuccessfullRuns);
    if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v174 = &v304;
    else
      v174 = (std::string *)v304.__r_.__value_.__r.__words[0];
    if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v175 = HIBYTE(v304.__r_.__value_.__r.__words[2]);
    else
      v175 = v304.__r_.__value_.__l.__size_;
    v176 = std::string::append(&v308, (const std::string::value_type *)v174, v175);
    v177 = *(_OWORD *)&v176->__r_.__value_.__l.__data_;
    v309.__r_.__value_.__r.__words[2] = v176->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v309.__r_.__value_.__l.__data_ = v177;
    v176->__r_.__value_.__l.__size_ = 0;
    v176->__r_.__value_.__r.__words[2] = 0;
    v176->__r_.__value_.__r.__words[0] = 0;
    v178 = std::string::append(&v309, " ISF Entries successfull ");
    v179 = *(_OWORD *)&v178->__r_.__value_.__l.__data_;
    v310.__r_.__value_.__r.__words[2] = v178->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v310.__r_.__value_.__l.__data_ = v179;
    v178->__r_.__value_.__l.__size_ = 0;
    v178->__r_.__value_.__r.__words[2] = 0;
    v178->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v299, SHIDWORD(__val));
    if ((v299.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v180 = &v299;
    else
      v180 = (std::string *)v299.__r_.__value_.__r.__words[0];
    if ((v299.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v181 = HIBYTE(v299.__r_.__value_.__r.__words[2]);
    else
      v181 = v299.__r_.__value_.__l.__size_;
    v182 = std::string::append(&v310, (const std::string::value_type *)v180, v181);
    v183 = *(_OWORD *)&v182->__r_.__value_.__l.__data_;
    v311.__r_.__value_.__r.__words[2] = v182->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v311.__r_.__value_.__l.__data_ = v183;
    v182->__r_.__value_.__l.__size_ = 0;
    v182->__r_.__value_.__r.__words[2] = 0;
    v182->__r_.__value_.__r.__words[0] = 0;
    v184 = std::string::append(&v311, " ISF Entries Failed ");
    v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
    v328.__r_.__value_.__r.__words[2] = v184->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v328.__r_.__value_.__l.__data_ = v185;
    v184->__r_.__value_.__l.__size_ = 0;
    v184->__r_.__value_.__r.__words[2] = 0;
    v184->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v298, v325[0]);
    if ((v298.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v186 = &v298;
    else
      v186 = (std::string *)v298.__r_.__value_.__r.__words[0];
    if ((v298.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v187 = HIBYTE(v298.__r_.__value_.__r.__words[2]);
    else
      v187 = v298.__r_.__value_.__l.__size_;
    v188 = std::string::append(&v328, (const std::string::value_type *)v186, v187);
    v189 = *(_OWORD *)&v188->__r_.__value_.__l.__data_;
    v329.__r_.__value_.__r.__words[2] = v188->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v189;
    v188->__r_.__value_.__l.__size_ = 0;
    v188->__r_.__value_.__r.__words[2] = 0;
    v188->__r_.__value_.__r.__words[0] = 0;
    v190 = std::string::append(&v329, " ISF Passed Controller ");
    v191 = *(_OWORD *)&v190->__r_.__value_.__l.__data_;
    v312.__r_.__value_.__r.__words[2] = v190->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v191;
    v190->__r_.__value_.__l.__size_ = 0;
    v190->__r_.__value_.__r.__words[2] = 0;
    v190->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v297, SDWORD1(__val));
    if ((v297.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v192 = &v297;
    else
      v192 = (std::string *)v297.__r_.__value_.__r.__words[0];
    if ((v297.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v193 = HIBYTE(v297.__r_.__value_.__r.__words[2]);
    else
      v193 = v297.__r_.__value_.__l.__size_;
    v194 = std::string::append(&v312, (const std::string::value_type *)v192, v193);
    v195 = *(_OWORD *)&v194->__r_.__value_.__l.__data_;
    v313.__r_.__value_.__r.__words[2] = v194->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v195;
    v194->__r_.__value_.__l.__size_ = 0;
    v194->__r_.__value_.__r.__words[2] = 0;
    v194->__r_.__value_.__r.__words[0] = 0;
    v196 = std::string::append(&v313, " ISF Faild Controller ");
    v197 = *(_OWORD *)&v196->__r_.__value_.__l.__data_;
    v314.__r_.__value_.__r.__words[2] = v196->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v197;
    v196->__r_.__value_.__l.__size_ = 0;
    v196->__r_.__value_.__r.__words[2] = 0;
    v196->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v296, SDWORD2(__val));
    if ((v296.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v198 = &v296;
    else
      v198 = (std::string *)v296.__r_.__value_.__r.__words[0];
    if ((v296.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v199 = HIBYTE(v296.__r_.__value_.__r.__words[2]);
    else
      v199 = v296.__r_.__value_.__l.__size_;
    v200 = std::string::append(&v314, (const std::string::value_type *)v198, v199);
    v201 = *(_OWORD *)&v200->__r_.__value_.__l.__data_;
    v315.__r_.__value_.__r.__words[2] = v200->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v201;
    v200->__r_.__value_.__l.__size_ = 0;
    v200->__r_.__value_.__r.__words[2] = 0;
    v200->__r_.__value_.__r.__words[0] = 0;
    v202 = std::string::append(&v315, " Angles (x,y,z,) = (");
    v203 = *(_OWORD *)&v202->__r_.__value_.__l.__data_;
    v316.__r_.__value_.__r.__words[2] = v202->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v203;
    v202->__r_.__value_.__l.__size_ = 0;
    v202->__r_.__value_.__r.__words[2] = 0;
    v202->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v295, *(float *)&v302);
    if ((v295.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v204 = &v295;
    else
      v204 = (std::string *)v295.__r_.__value_.__r.__words[0];
    if ((v295.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v205 = HIBYTE(v295.__r_.__value_.__r.__words[2]);
    else
      v205 = v295.__r_.__value_.__l.__size_;
    v206 = std::string::append(&v316, (const std::string::value_type *)v204, v205);
    v207 = *(_OWORD *)&v206->__r_.__value_.__l.__data_;
    v317.__r_.__value_.__r.__words[2] = v206->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v207;
    v206->__r_.__value_.__l.__size_ = 0;
    v206->__r_.__value_.__r.__words[2] = 0;
    v206->__r_.__value_.__r.__words[0] = 0;
    v208 = std::string::append(&v317, ", ");
    v209 = *(_OWORD *)&v208->__r_.__value_.__l.__data_;
    v318.__r_.__value_.__r.__words[2] = v208->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v209;
    v208->__r_.__value_.__l.__size_ = 0;
    v208->__r_.__value_.__r.__words[2] = 0;
    v208->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v294, *((float *)&v302 + 1));
    if ((v294.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v210 = &v294;
    else
      v210 = (std::string *)v294.__r_.__value_.__r.__words[0];
    if ((v294.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v211 = HIBYTE(v294.__r_.__value_.__r.__words[2]);
    else
      v211 = v294.__r_.__value_.__l.__size_;
    v212 = std::string::append(&v318, (const std::string::value_type *)v210, v211);
    v213 = *(_OWORD *)&v212->__r_.__value_.__l.__data_;
    v319.__r_.__value_.__r.__words[2] = v212->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v213;
    v212->__r_.__value_.__l.__size_ = 0;
    v212->__r_.__value_.__r.__words[2] = 0;
    v212->__r_.__value_.__r.__words[0] = 0;
    v214 = std::string::append(&v319, " ,");
    v215 = *(_OWORD *)&v214->__r_.__value_.__l.__data_;
    v320.__r_.__value_.__r.__words[2] = v214->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v215;
    v214->__r_.__value_.__l.__size_ = 0;
    v214->__r_.__value_.__r.__words[2] = 0;
    v214->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v293, *((float *)&v302 + 2));
    if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v216 = &v293;
    else
      v216 = (std::string *)v293.__r_.__value_.__r.__words[0];
    if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v217 = HIBYTE(v293.__r_.__value_.__r.__words[2]);
    else
      v217 = v293.__r_.__value_.__l.__size_;
    v218 = std::string::append(&v320, (const std::string::value_type *)v216, v217);
    v219 = *(_OWORD *)&v218->__r_.__value_.__l.__data_;
    *(_QWORD *)&__p[16] = *((_QWORD *)&v218->__r_.__value_.__l + 2);
    *(_OWORD *)__p = v219;
    v218->__r_.__value_.__l.__size_ = 0;
    v218->__r_.__value_.__r.__words[2] = 0;
    v218->__r_.__value_.__r.__words[0] = 0;
    v220 = std::string::append((std::string *)__p, ")");
    v221 = v220->__r_.__value_.__r.__words[0];
    v327[0] = v220->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v327 + 7) = *(std::string::size_type *)((char *)&v220->__r_.__value_.__r.__words[1] + 7);
    v222 = HIBYTE(v220->__r_.__value_.__r.__words[2]);
    v220->__r_.__value_.__l.__size_ = 0;
    v220->__r_.__value_.__r.__words[2] = 0;
    v220->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v321.__r_.__value_.__l.__data_);
    v321.__r_.__value_.__r.__words[0] = v221;
    v321.__r_.__value_.__l.__size_ = v327[0];
    *(std::string::size_type *)((char *)&v321.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v327 + 7);
    *((_BYTE *)&v321.__r_.__value_.__s + 23) = v222;
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v293.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v293.__r_.__value_.__l.__data_);
    if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v320.__r_.__value_.__l.__data_);
    if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v319.__r_.__value_.__l.__data_);
    if (SHIBYTE(v294.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v294.__r_.__value_.__l.__data_);
    if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v318.__r_.__value_.__l.__data_);
    if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v317.__r_.__value_.__l.__data_);
    if (SHIBYTE(v295.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v295.__r_.__value_.__l.__data_);
    if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v316.__r_.__value_.__l.__data_);
    if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v315.__r_.__value_.__l.__data_);
    if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v296.__r_.__value_.__l.__data_);
    if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v314.__r_.__value_.__l.__data_);
    if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v313.__r_.__value_.__l.__data_);
    if (SHIBYTE(v297.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v297.__r_.__value_.__l.__data_);
    if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v312.__r_.__value_.__l.__data_);
    if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v329.__r_.__value_.__l.__data_);
    if (SHIBYTE(v298.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v298.__r_.__value_.__l.__data_);
    if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v328.__r_.__value_.__l.__data_);
    if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v311.__r_.__value_.__l.__data_);
    if (SHIBYTE(v299.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v299.__r_.__value_.__l.__data_);
    if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v310.__r_.__value_.__l.__data_);
    if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v309.__r_.__value_.__l.__data_);
    if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v304.__r_.__value_.__l.__data_);
    if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v308.__r_.__value_.__l.__data_);
    if (SHIBYTE(v307.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v307.__r_.__value_.__l.__data_);
    if (SHIBYTE(v305.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v305.__r_.__value_.__l.__data_);
    if (SHIBYTE(v306.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v306.__r_.__value_.__l.__data_);
    -[ViewController log:](self, "log:", &v321);
    -[ViewController handleSuspend](self, "handleSuspend");
    v223 = self->_iterationTotalSuccessfullRuns + self->_calibUpdateEachIsfEntiresLimit;
    self->_iterationTotalSuccessfullRuns = v223;
    if (v223 < self->_iterationTotalSuccessfullRunsLimit)
      goto LABEL_359;
    sub_10001A19C(__p, "dogWatch finishing iteration");
    -[ViewController log:](self, "log:", __p);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    anon_b8 = self->_anon_b8;
    sub_1000164D0((void **)self->_anon_b8, &v302);
    std::to_string(&v314, *p_iterationNumber);
    v226 = std::string::insert(&v314, 0, "iteration ");
    v227 = *(_OWORD *)&v226->__r_.__value_.__l.__data_;
    v315.__r_.__value_.__r.__words[2] = v226->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v227;
    v226->__r_.__value_.__l.__size_ = 0;
    v226->__r_.__value_.__r.__words[2] = 0;
    v226->__r_.__value_.__r.__words[0] = 0;
    v228 = std::string::append(&v315, " ");
    v229 = *(_OWORD *)&v228->__r_.__value_.__l.__data_;
    v316.__r_.__value_.__r.__words[2] = v228->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v229;
    v228->__r_.__value_.__l.__size_ = 0;
    v228->__r_.__value_.__r.__words[2] = 0;
    v228->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v313, *(float *)&v302);
    if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v230 = &v313;
    else
      v230 = (std::string *)v313.__r_.__value_.__r.__words[0];
    if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v231 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
    else
      v231 = v313.__r_.__value_.__l.__size_;
    v232 = std::string::append(&v316, (const std::string::value_type *)v230, v231);
    v233 = *(_OWORD *)&v232->__r_.__value_.__l.__data_;
    v317.__r_.__value_.__r.__words[2] = v232->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v233;
    v232->__r_.__value_.__l.__size_ = 0;
    v232->__r_.__value_.__r.__words[2] = 0;
    v232->__r_.__value_.__r.__words[0] = 0;
    v234 = std::string::append(&v317, " ");
    v235 = *(_OWORD *)&v234->__r_.__value_.__l.__data_;
    v318.__r_.__value_.__r.__words[2] = v234->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v235;
    v234->__r_.__value_.__l.__size_ = 0;
    v234->__r_.__value_.__r.__words[2] = 0;
    v234->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v312, *((float *)&v302 + 1));
    if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v236 = &v312;
    else
      v236 = (std::string *)v312.__r_.__value_.__r.__words[0];
    if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v237 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
    else
      v237 = v312.__r_.__value_.__l.__size_;
    v238 = std::string::append(&v318, (const std::string::value_type *)v236, v237);
    v239 = *(_OWORD *)&v238->__r_.__value_.__l.__data_;
    v319.__r_.__value_.__r.__words[2] = v238->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v239;
    v238->__r_.__value_.__l.__size_ = 0;
    v238->__r_.__value_.__r.__words[2] = 0;
    v238->__r_.__value_.__r.__words[0] = 0;
    v240 = std::string::append(&v319, " ");
    v241 = *(_OWORD *)&v240->__r_.__value_.__l.__data_;
    *(_QWORD *)&__p[16] = *((_QWORD *)&v240->__r_.__value_.__l + 2);
    *(_OWORD *)__p = v241;
    v240->__r_.__value_.__l.__size_ = 0;
    v240->__r_.__value_.__r.__words[2] = 0;
    v240->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v329, *((float *)&v302 + 2));
    if ((v329.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v242 = &v329;
    else
      v242 = (std::string *)v329.__r_.__value_.__r.__words[0];
    if ((v329.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v243 = HIBYTE(v329.__r_.__value_.__r.__words[2]);
    else
      v243 = v329.__r_.__value_.__l.__size_;
    v244 = std::string::append((std::string *)__p, (const std::string::value_type *)v242, v243);
    v245 = *(_OWORD *)&v244->__r_.__value_.__l.__data_;
    v320.__r_.__value_.__r.__words[2] = v244->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v245;
    v244->__r_.__value_.__l.__size_ = 0;
    v244->__r_.__value_.__r.__words[2] = 0;
    v244->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v329.__r_.__value_.__l.__data_);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v319.__r_.__value_.__l.__data_);
    if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v312.__r_.__value_.__l.__data_);
    if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v318.__r_.__value_.__l.__data_);
    if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v317.__r_.__value_.__l.__data_);
    if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v313.__r_.__value_.__l.__data_);
    if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v316.__r_.__value_.__l.__data_);
    if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v315.__r_.__value_.__l.__data_);
    if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v314.__r_.__value_.__l.__data_);
    LODWORD(v329.__r_.__value_.__r.__words[1]) = 1084227584;
    v329.__r_.__value_.__r.__words[0] = 0x4000000040000000;
    v328.__r_.__value_.__r.__words[0] = 0x4090000040900000;
    LODWORD(v328.__r_.__value_.__r.__words[1]) = 1091567616;
    if (!LOBYTE(self->_sensorId.__r_.var0))
    {
      __asm { FMOV            V0.2S, #3.0 }
      v329.__r_.__value_.__r.__words[0] = _D0;
      LODWORD(v329.__r_.__value_.__r.__words[1]) = 1086324736;
      __asm { FMOV            V0.2S, #6.0 }
      v328.__r_.__value_.__r.__words[0] = _D0;
      LODWORD(v328.__r_.__value_.__r.__words[1]) = 1091567616;
    }
    -[ViewController addToReducedLog:](self, "addToReducedLog:", &v320);
    if (*p_iterationNumber >= 3)
      v252 = &v328;
    else
      v252 = &v329;
    -[ViewController compareResults:](self, "compareResults:", &v328);
    if (self->_diagnosticFinalResult == -3)
    {
      v253 = self->_backgroundDispatchQueue;
      v292[0] = _NSConcreteStackBlock;
      v292[1] = 3221225472;
      v292[2] = sub_1000165AC;
      v292[3] = &unk_100028E30;
      v292[4] = self;
      v254 = v292;
    }
    else
    {
      -[ViewController compareResults:](self, "compareResults:", v252);
      if (self->_diagnosticFinalResult == -3)
        v256 = 3;
      else
        v256 = 2;
      self->_iterationsLimit = v256;
      if (*p_iterationNumber < v256)
      {
        ++*p_iterationNumber;
        -[ViewController prepareNewIteration](self, "prepareNewIteration");
        if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v320.__r_.__value_.__l.__data_);
LABEL_359:
        -[ViewController handleResume](self, "handleResume");
        v224 = self->_backgroundDispatchQueue;
        v290[0] = _NSConcreteStackBlock;
        v290[1] = 3221225472;
        v290[2] = sub_1000165F8;
        v290[3] = &unk_100028E30;
        v290[4] = self;
        dispatch_async(v224, v290);
LABEL_450:
        if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v321.__r_.__value_.__l.__data_);
        goto LABEL_168;
      }
      v257 = *(_QWORD *)anon_b8;
      if (*(_QWORD *)&self->_anon_b8[8] != *(_QWORD *)anon_b8)
      {
        v258 = 0;
        v259 = 0;
        v260 = *(_OWORD *)self->_avgRotAngles;
        avgRotAngles = self->_avgRotAngles;
        do
        {
          *(float *)&v255 = (float)(*(float *)(v257 + v258) / (float)self->_iterationsLimit) + *(float *)&v260;
          *(_DWORD *)avgRotAngles = v255;
          iterationsLimit = self->_iterationsLimit;
          v263 = *(float *)(*(_QWORD *)anon_b8 + v258 + 4);
          *(_DWORD *)&self->_avgRotAngles[8] = DWORD2(v260);
          LODWORD(v260) = v255;
          *((float *)&v260 + 1) = *((float *)&v260 + 1) + (float)(v263 / (float)iterationsLimit);
          *(_QWORD *)avgRotAngles = v260;
          DWORD1(v255) = DWORD1(v260);
          *((float *)&v255 + 2) = *((float *)&v260 + 2)
                                + (float)(*(float *)(*(_QWORD *)anon_b8 + v258 + 8) / (float)self->_iterationsLimit);
          *(_QWORD *)avgRotAngles = v260;
          *(float *)&self->_avgRotAngles[8] = *((float *)&v255 + 2);
          ++v259;
          v257 = *(_QWORD *)anon_b8;
          v258 += 16;
          v260 = v255;
        }
        while (v259 < (uint64_t)(*(_QWORD *)&self->_anon_b8[8] - *(_QWORD *)self->_anon_b8) >> 4);
      }
      std::to_string(&v314, *(float *)self->_avgRotAngles);
      v264 = std::string::insert(&v314, 0, "Average Angles (x,y,z,) = (");
      v265 = *(_OWORD *)&v264->__r_.__value_.__l.__data_;
      v315.__r_.__value_.__r.__words[2] = v264->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v265;
      v264->__r_.__value_.__l.__size_ = 0;
      v264->__r_.__value_.__r.__words[2] = 0;
      v264->__r_.__value_.__r.__words[0] = 0;
      v266 = std::string::append(&v315, ", ");
      v267 = *(_OWORD *)&v266->__r_.__value_.__l.__data_;
      v316.__r_.__value_.__r.__words[2] = v266->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v267;
      v266->__r_.__value_.__l.__size_ = 0;
      v266->__r_.__value_.__r.__words[2] = 0;
      v266->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v313, *(float *)&self->_avgRotAngles[4]);
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v268 = &v313;
      else
        v268 = (std::string *)v313.__r_.__value_.__r.__words[0];
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v269 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
      else
        v269 = v313.__r_.__value_.__l.__size_;
      v270 = std::string::append(&v316, (const std::string::value_type *)v268, v269);
      v271 = *(_OWORD *)&v270->__r_.__value_.__l.__data_;
      v317.__r_.__value_.__r.__words[2] = v270->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v271;
      v270->__r_.__value_.__l.__size_ = 0;
      v270->__r_.__value_.__r.__words[2] = 0;
      v270->__r_.__value_.__r.__words[0] = 0;
      v272 = std::string::append(&v317, " ,");
      v273 = *(_OWORD *)&v272->__r_.__value_.__l.__data_;
      v318.__r_.__value_.__r.__words[2] = v272->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v273;
      v272->__r_.__value_.__l.__size_ = 0;
      v272->__r_.__value_.__r.__words[2] = 0;
      v272->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v312, *(float *)&self->_avgRotAngles[8]);
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v274 = &v312;
      else
        v274 = (std::string *)v312.__r_.__value_.__r.__words[0];
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v275 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
      else
        v275 = v312.__r_.__value_.__l.__size_;
      v276 = std::string::append(&v318, (const std::string::value_type *)v274, v275);
      v277 = *(_OWORD *)&v276->__r_.__value_.__l.__data_;
      v319.__r_.__value_.__r.__words[2] = v276->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v277;
      v276->__r_.__value_.__l.__size_ = 0;
      v276->__r_.__value_.__r.__words[2] = 0;
      v276->__r_.__value_.__r.__words[0] = 0;
      v278 = std::string::append(&v319, ")");
      v279 = *(_OWORD *)&v278->__r_.__value_.__l.__data_;
      *(_QWORD *)&__p[16] = *((_QWORD *)&v278->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v279;
      v278->__r_.__value_.__l.__size_ = 0;
      v278->__r_.__value_.__r.__words[2] = 0;
      v278->__r_.__value_.__r.__words[0] = 0;
      -[ViewController log:](self, "log:", __p);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v319.__r_.__value_.__l.__data_);
      if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v312.__r_.__value_.__l.__data_);
      if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v318.__r_.__value_.__l.__data_);
      if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v317.__r_.__value_.__l.__data_);
      if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v313.__r_.__value_.__l.__data_);
      if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v316.__r_.__value_.__l.__data_);
      if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v315.__r_.__value_.__l.__data_);
      if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v314.__r_.__value_.__l.__data_);
      memset(&__p[4], 0, 252);
      *(_DWORD *)__p = 2;
      if (-[ViewController getRotAnglesToPrcl:focalPoint:prcl:](self, "getRotAnglesToPrcl:focalPoint:prcl:", __p, *(double *)self->_avgRotAngles, *(double *)self->_focalPoint))
      {
LABEL_448:
        if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v320.__r_.__value_.__l.__data_);
        goto LABEL_450;
      }
      v280 = *(_OWORD *)&__p[208];
      *(_OWORD *)&self->_prclResult.reserved[26] = *(_OWORD *)&__p[192];
      *(_OWORD *)&self->_prclResult.reserved[42] = v280;
      v281 = *(_OWORD *)&__p[240];
      *(_OWORD *)&self->_prclResult.reserved[58] = *(_OWORD *)&__p[224];
      *(_OWORD *)&self->_prclResult.reserved[74] = v281;
      v282 = *(_OWORD *)&__p[144];
      *(_OWORD *)&self->_prclResult.teleRotMatrix[2][1] = *(_OWORD *)&__p[128];
      *(_OWORD *)&self->_prclResult.teleFocalPoint[2] = v282;
      v283 = *(_OWORD *)&__p[176];
      *(_OWORD *)&self->_prclResult.jasperSN[12] = *(_OWORD *)&__p[160];
      *(_OWORD *)&self->_prclResult.reserved[10] = v283;
      v284 = *(_OWORD *)&__p[80];
      *(_OWORD *)&self->_prclResult.wideRotMatrix[1][0] = *(_OWORD *)&__p[64];
      *(_OWORD *)&self->_prclResult.wideRotMatrix[2][1] = v284;
      v285 = *(_OWORD *)&__p[112];
      *(_OWORD *)&self->_prclResult.wideFocalPoint[2] = *(_OWORD *)&__p[96];
      *(_OWORD *)&self->_prclResult.teleRotMatrix[1][0] = v285;
      v286 = *(_OWORD *)&__p[16];
      *(_OWORD *)&self->_prclResult.version = *(_OWORD *)__p;
      *(_OWORD *)&self->_prclResult.swideRotMatrix[1][0] = v286;
      v287 = *(_OWORD *)&__p[48];
      *(_OWORD *)&self->_prclResult.swideRotMatrix[2][1] = *(_OWORD *)&__p[32];
      *(_OWORD *)&self->_prclResult.swideFocalPoint[2] = v287;
      sub_10001A19C(&v319, "dogWatch finishing all iterations");
      -[ViewController log:](self, "log:", &v319);
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v319.__r_.__value_.__l.__data_);
      v253 = self->_backgroundDispatchQueue;
      v291[0] = _NSConcreteStackBlock;
      v291[1] = 3221225472;
      v291[2] = sub_1000165F0;
      v291[3] = &unk_100028E30;
      v291[4] = self;
      v254 = v291;
    }
    dispatch_async(v253, v254);
    self->_running = 0;
    goto LABEL_448;
  }
LABEL_168:
  if (SHIBYTE(v322.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v322.__r_.__value_.__l.__data_);
LABEL_170:

}

- (void)primaryScalerHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4 streamType:(int)a5
{
  size_t Width;
  size_t Height;
  CGImage *v10;
  void *v11;
  CGImageRef imageOut;
  CGRect v13;

  if (self->_running)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    imageOut = 0;
    VTCreateCGImageFromCVPixelBuffer(a3, 0, &imageOut);
    v13.size.height = (double)Height;
    v13.size.width = (double)Width;
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    v10 = CGImageCreateWithImageInRect(imageOut, v13);
    if (v10)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 3, 1.0));
    else
      v11 = 0;
    CGImageRelease(imageOut);
    CGImageRelease(v10);
    if (a5 == 1)
    {
      if (self->_uiStreamType != 1)
      {
LABEL_11:

        return;
      }
    }
    else if (a5 || self->_uiStreamType)
    {
      goto LABEL_11;
    }
    -[ViewControllerCallbacks performSelectorOnMainThread:withObject:waitUntilDone:](self->_listener, "performSelectorOnMainThread:withObject:waitUntilDone:", "setImage:", v11, 0);
    goto LABEL_11;
  }
}

- (void)primaryScalerHxISPFrameAvailableCallbackW:(__CVBuffer *)a3 pts:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[ViewController primaryScalerHxISPFrameAvailableCallback:pts:streamType:](self, "primaryScalerHxISPFrameAvailableCallback:pts:streamType:", a3, &v4, 0);
}

- (void)pointCloudHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4
{
  ++self->_jasperFramesCount;
}

- (void)error:(id)a3 details:(id)a4
{
  id v5;
  void *__p[2];
  char v7;

  v5 = objc_retainAutorelease(a3);
  sub_10001A19C(__p, (char *)objc_msgSend(v5, "UTF8String"));
  -[ViewController log:](self, "log:", __p);
  if (v7 < 0)
    operator delete(__p[0]);
  -[ViewController endTest](self, "endTest");

}

- (BOOL)isPortTypeJasperDetected
{
  DeviceCMInterface v3;

  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (void)handleResume
{
  void *v3;
  NSObject *backgroundDispatchQueue;
  _QWORD v5[5];
  void *__p[2];
  char v7;

  v3 = objc_autoreleasePoolPush();
  if (!*(_QWORD *)&self->_running)
  {
    self->_inResume = 1;
    sub_10001A19C(__p, "handleResume");
    -[ViewController log:](self, "log:", __p);
    if (v7 < 0)
      operator delete(__p[0]);
    backgroundDispatchQueue = self->_backgroundDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100016BE4;
    v5[3] = &unk_100028E30;
    v5[4] = self;
    dispatch_async(backgroundDispatchQueue, v5);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)handleSuspend
{
  void *v3;
  ViewController *v4;
  UserMovementTracker *m_userMovementTracker;
  NSObject *backgroundDispatchQueue;
  _QWORD v7[5];
  void *__p[2];
  char v9;

  v3 = objc_autoreleasePoolPush();
  v4 = self;
  objc_sync_enter(v4);
  sub_10001A19C(__p, "handleSuspend");
  -[ViewController log:](v4, "log:", __p);
  if (v9 < 0)
    operator delete(__p[0]);
  v4->_running = 0;
  m_userMovementTracker = v4->m_userMovementTracker;
  if (m_userMovementTracker)
    -[UserMovementTracker stopDeviceMotionTracking](m_userMovementTracker, "stopDeviceMotionTracking");
  if (v4->_diagnosticCMInterface)
  {
    -[NSTimer invalidate](v4->_watchDogTimer, "invalidate");
    backgroundDispatchQueue = v4->_backgroundDispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017990;
    v7[3] = &unk_100028E30;
    v7[4] = v4;
    dispatch_async(backgroundDispatchQueue, v7);
  }
  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

- (void)endTest
{
  NSTimer *watchDogTimer;
  std::string *v4;
  __int128 v5;
  void *v6;
  std::string v7;
  void *__p[2];
  std::string::size_type v9;

  self->_running = 0;
  watchDogTimer = self->_watchDogTimer;
  if (watchDogTimer)
    -[NSTimer invalidate](watchDogTimer, "invalidate");
  sub_10001A19C(__p, "endTest");
  -[ViewController log:](self, "log:", __p);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);
  std::to_string(&v7, self->_noMovementCounter);
  v4 = std::string::insert(&v7, 0, "noMovementCount ");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v9 = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  -[ViewController addToReducedLog:](self, "addToReducedLog:", __p);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
  if (BYTE5(self->_sensorId.var0))
  {
    sub_10001A19C(__p, "_skipSummaryScreen is true");
    -[ViewController log:](self, "log:", __p);
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController listener](self, "listener"));
    objc_msgSend(v6, "finishRun:reducedLog:result:prcl:angles:", self->_resultsDict, self->_reducedLog, self->_diagnosticFinalResult, &self->_prclResult, self->_avgRotAngles);

    exit(0);
  }
  sub_10001A19C(__p, "_skipSummaryScreen is false");
  -[ViewController log:](self, "log:", __p);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);
  -[ViewController showSummaryScreen:](self, "showSummaryScreen:", self->_diagnosticFinalResult == 0);
}

- (void)showSummaryScreen:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017D68;
  v3[3] = &unk_100028E80;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)buttonClicked:(id)a3
{
  void *__p[2];
  char v5;

  sub_10001A19C(__p, "button clicked");
  -[ViewController log:](self, "log:", __p);
  if (v5 < 0)
    operator delete(__p[0]);
}

- (void)setUpperViewLabelText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  void *__p[2];
  char v9;
  void *v10[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  sub_10001A19C(v10, (char *)objc_msgSend(v4, "UTF8String"));
  std::operator+<char>(__p, "setUpperViewLabelText: ", v10);
  -[ViewController log:](self, "log:", __p);
  if (v9 < 0)
    operator delete(__p[0]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018270;
  v6[3] = &unk_100028EA8;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  if (v11 < 0)
    operator delete(v10[0]);

}

- (void)duplicatPixelBuffer:(__CVBuffer *)a3 newBuffer:(__CVBuffer *)a4
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  __CVBuffer *v9;
  void *BaseAddressOfPlane;
  void *v11;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  void *v14;
  void *v15;
  size_t v16;
  size_t v17;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (!CVPixelBufferCreate(kCFAllocatorDefault, Width, Height, PixelFormatType, 0, a4))
  {
    v9 = *a4;
    CVPixelBufferLockBaseAddress(v9, 0);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v9, 0);
    v11 = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    memcpy(BaseAddressOfPlane, v11, HeightOfPlane * BytesPerRowOfPlane);
    v14 = CVPixelBufferGetBaseAddressOfPlane(v9, 1uLL);
    v15 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    v16 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    v17 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
    memcpy(v14, v15, v17 * v16);
    CVPixelBufferUnlockBaseAddress(v9, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
}

- (void)cancel
{
  void *__p[2];
  char v4;

  sub_10001A19C(__p, "cancel");
  -[ViewController log:](self, "log:", __p);
  if (v4 < 0)
    operator delete(__p[0]);
  self->_diagnosticFinalResult = -4;
  -[ViewController handleSuspend](self, "handleSuspend");
}

- (id)getCurrentLog
{
  return self->_resultsDict;
}

- (int)getCurrentResult
{
  return self->_diagnosticFinalResult;
}

- (void)hideInProgressView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018614;
  block[3] = &unk_100028E30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)showInProgressView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000186BC;
  block[3] = &unk_100028E30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideWarningWindow
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018B24;
  block[3] = &unk_100028E30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showWarningWindow:(id)a3 subMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018C10;
  block[3] = &unk_100028ED0;
  block[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)quitButtonTapped
{
  void *__p[2];
  char v4;

  sub_10001A19C(__p, "Quit button tapped!");
  -[ViewController log:](self, "log:", __p);
  if (v4 < 0)
    operator delete(__p[0]);
  -[ViewController endTest](self, "endTest");
}

- (void)continueButtonPressed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  NSLog(CFSTR("Continue button pressed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ViewController listener](self, "listener"));
  objc_msgSend(v5, "finishRun:reducedLog:result:prcl:angles:", self->_resultsDict, self->_reducedLog, self->_diagnosticFinalResult, &self->_prclResult, self->_avgRotAngles);

  exit(0);
}

- (UIView)storyBoardView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
}

- (void)setStoryBoardView:(id)a3
{
  objc_storeWeak((id *)&self->_consecutiveSceneErrorWarningLimit, a3);
}

- (ViewControllerCallbacks)listener
{
  return (ViewControllerCallbacks *)objc_loadWeakRetained((id *)&self->_noMovementAttitudeChangeMinThreshold);
}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_noMovementAttitudeChangeMinThreshold, a3);
}

- (int)sessionMaxTimeOut
{
  return *(_DWORD *)&self->_isJasper;
}

- (void)setSessionMaxTimeOut:(int)a3
{
  *(_DWORD *)&self->_isJasper = a3;
}

- (int)consecutiveSceneErrorLimit
{
  return self->_topTextHeight;
}

- (void)setConsecutiveSceneErrorLimit:(int)a3
{
  self->_topTextHeight = a3;
}

- (int)consecutiveSceneErrorWarningLimit
{
  return self->_textMargin;
}

- (void)setConsecutiveSceneErrorWarningLimit:(int)a3
{
  self->_textMargin = a3;
}

- (unsigned)userNotMovingTimeout
{
  return *(_DWORD *)&self->_upperViewRendered;
}

- (void)setUserNotMovingTimeout:(unsigned int)a3
{
  *(_DWORD *)&self->_upperViewRendered = a3;
}

- (float)noMovementAttitudeChangeMinThreshold
{
  return *(float *)&self->_sessionMaxTimeOut;
}

- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3
{
  *(float *)&self->_sessionMaxTimeOut = a3;
}

- (BOOL)skipSummaryScreen
{
  return BYTE5(self->_sensorId.var0);
}

- (void)setSkipSummaryScreen:(BOOL)a3
{
  BYTE5(self->_sensorId.var0) = a3;
}

- (UIView)mainView
{
  return self->_storyBoardView;
}

- (void)setMainView:(id)a3
{
  objc_storeStrong((id *)&self->_storyBoardView, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)self->_listener;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (UIView)cameraView
{
  return self->_mainView;
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_mainView, a3);
}

- (UIView)middleView
{
  return &self->_imageView->super;
}

- (void)setMiddleView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)upperView
{
  return self->_cameraView;
}

- (void)setUpperView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (UIStackView)bottomView
{
  return (UIStackView *)self->_middleView;
}

- (void)setBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_middleView, a3);
}

- (UILabel)statusLabel
{
  return (UILabel *)self->_upperView;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_upperView, a3);
}

- (UIProgressView)progressView
{
  return (UIProgressView *)self->_bottomView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomView, a3);
}

- (UIView)gradientView
{
  return &self->_statusLabel->super;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UILabel)upperViewLabel
{
  return (UILabel *)self->_progressView;
}

- (void)setUpperViewLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UITextView)textView
{
  return (UITextView *)self->_gradientView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)self->_upperViewLabel;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_upperViewLabel, a3);
}

- (UIView)activityIndicatorBackgroundView
{
  return &self->_textView->super.super;
}

- (void)setActivityIndicatorBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIImageView)warningImageView
{
  return (UIImageView *)self->_activityIndicatorView;
}

- (void)setWarningImageView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UIView)warningImageViewBackground
{
  return self->_activityIndicatorBackgroundView;
}

- (void)setWarningImageViewBackground:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorBackgroundView, a3);
}

- (UILabel)warningViewLabel
{
  return (UILabel *)self->_warningImageView;
}

- (void)setWarningViewLabel:(id)a3
{
  objc_storeStrong((id *)&self->_warningImageView, a3);
}

- (UILabel)warningViewSubLabel
{
  return (UILabel *)self->_warningImageViewBackground;
}

- (void)setWarningViewSubLabel:(id)a3
{
  objc_storeStrong((id *)&self->_warningImageViewBackground, a3);
}

- (NSLayoutConstraint)upperTextWidthConstraint
{
  return (NSLayoutConstraint *)self->_warningViewLabel;
}

- (void)setUpperTextWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_warningViewLabel, a3);
}

- (UIButton)quitButton
{
  return (UIButton *)self->_warningViewSubLabel;
}

- (void)setQuitButton:(id)a3
{
  objc_storeStrong((id *)&self->_warningViewSubLabel, a3);
}

- (OBWelcomeController)contentViewController
{
  return (OBWelcomeController *)self->_upperTextWidthConstraint;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_upperTextWidthConstraint, a3);
}

- (void).cxx_destruct
{
  void *v3;

  objc_storeStrong((id *)&self->_upperTextWidthConstraint, 0);
  objc_storeStrong((id *)&self->_warningViewSubLabel, 0);
  objc_storeStrong((id *)&self->_warningViewLabel, 0);
  objc_storeStrong((id *)&self->_warningImageViewBackground, 0);
  objc_storeStrong((id *)&self->_warningImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_upperViewLabel, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_upperView, 0);
  objc_storeStrong((id *)&self->_middleView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_storyBoardView, 0);
  objc_destroyWeak((id *)&self->_noMovementAttitudeChangeMinThreshold);
  objc_destroyWeak((id *)&self->_consecutiveSceneErrorWarningLimit);
  if (*((char *)&self->_sensorId.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_sensorId.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->m_noMovementQuitTimer, 0);
  objc_storeStrong((id *)&self->m_userMovementTracker, 0);
  objc_storeStrong((id *)&self->_backgroundDispatchQueue, 0);
  v3 = *(void **)self->_anon_b8;
  if (v3)
  {
    *(_QWORD *)&self->_anon_b8[8] = v3;
    operator delete(v3);
  }
  sub_10001A60C((uint64_t)&self->_rgbjCalibrationResults, (_QWORD *)self->_rgbjCalibrationResults.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_warningFont, 0);
  objc_storeStrong((id *)&self->_reducedLog, 0);
  objc_storeStrong((id *)&self->_resultsDict, 0);
  objc_storeStrong((id *)&self->_watchDogTimer, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = off_100028F00;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 20) = (char *)self + 168;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = 0;
  *(_OWORD *)((char *)self + 488) = 0u;
  *(_OWORD *)((char *)self + 476) = 0u;
  *(_OWORD *)((char *)self + 460) = 0u;
  *(_OWORD *)((char *)self + 444) = 0u;
  *(_OWORD *)((char *)self + 428) = 0u;
  *(_OWORD *)((char *)self + 412) = 0u;
  *(_OWORD *)((char *)self + 396) = 0u;
  *(_OWORD *)((char *)self + 380) = 0u;
  *(_OWORD *)((char *)self + 364) = 0u;
  *(_OWORD *)((char *)self + 348) = 0u;
  *(_OWORD *)((char *)self + 332) = 0u;
  *(_OWORD *)((char *)self + 316) = 0u;
  *(_OWORD *)((char *)self + 300) = 0u;
  *(_OWORD *)((char *)self + 284) = 0u;
  *(_OWORD *)((char *)self + 268) = 0u;
  *(_OWORD *)((char *)self + 252) = 0u;
  *((_DWORD *)self + 62) = 2;
  *((_OWORD *)self + 34) = 0uLL;
  *((_QWORD *)self + 67) = 0;
  return self;
}

@end
