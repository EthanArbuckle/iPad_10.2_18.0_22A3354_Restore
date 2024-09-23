@implementation RgbJasperCalibrationViewController

- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:
{
  float *v6;
  float *v7;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  std::string *v20;
  void *v21;
  std::string *v22;
  void *v23;
  std::string *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFData *v30;
  __CFString *v31;
  id v32;
  std::string v33;
  std::string v34;
  std::string v35;
  uint8_t buf[8];
  char v37;
  _QWORD v38[3];
  _QWORD v39[3];

  v7 = v6;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v32 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun", buf, 2u);
  }
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", ")));
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("log"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  objc_msgSend(v13, "setValue:forKey:", v19, CFSTR("pluginVersion"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun added reduced log string", buf, 2u);
  }
  if (!(_DWORD)v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun1", buf, 2u);
    }
    v30 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a6, 256));
    v31 = ConvertDataToHexString(v30);
    sub_10001A19C(buf, " ");
    v38[0] = CFSTR("x");
    std::to_string(&v35, *v7);
    if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v35;
    else
      v20 = (std::string *)v35.__r_.__value_.__r.__words[0];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
    v39[0] = v21;
    v38[1] = CFSTR("y");
    std::to_string(&v34, v7[1]);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v34;
    else
      v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
    v39[1] = v23;
    v38[2] = CFSTR("z");
    std::to_string(&v33, v7[2]);
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v24 = &v33;
    else
      v24 = (std::string *)v33.__r_.__value_.__r.__words[0];
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24));
    v39[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));

    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);

    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__r_.__value_.__l.__data_);

    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
    objc_msgSend(v13, "setValue:forKey:", v26, CFSTR("rotationalAngle"));
    objc_msgSend(v13, "setValue:forKey:", v31, CFSTR("PrCL"));

    if (v37 < 0)
      operator delete(*(void **)buf);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RgbJasperCalibrationViewController result](self, "result"));
  objc_msgSend(v27, "setData:", v13);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RgbJasperCalibrationViewController result](self, "result"));
  objc_msgSend(v29, "setStatusCode:", v28);

  -[RgbJasperCalibrationViewController setFinished:](self, "setFinished:", 1);
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  RGBJDKDiagnosticInputs *v5;
  RGBJDKDiagnosticInputs *inputs;
  uint8_t v7[16];

  v5 = (RGBJDKDiagnosticInputs *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController setup", v7, 2u);
  }
  inputs = self->_inputs;
  self->_inputs = v5;

}

- (void)start
{
  ViewController *v3;
  ViewController *mainAppViewController;
  void *v5;
  RGBJDKDiagnosticInputs *inputs;
  float v7;
  uint8_t v8[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController start new", v8, 2u);
  }
  v3 = objc_alloc_init(ViewController);
  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RgbJasperCalibrationViewController view](self, "view"));
  -[ViewController setStoryBoardView:](self->_mainAppViewController, "setStoryBoardView:", v5);

  -[ViewController setListener:](self->_mainAppViewController, "setListener:", self);
  inputs = self->_inputs;
  if (inputs)
  {
    if (-[RGBJDKDiagnosticInputs sessionTimeOut](inputs, "sessionTimeOut"))
      -[ViewController setSessionMaxTimeOut:](self->_mainAppViewController, "setSessionMaxTimeOut:", -[RGBJDKDiagnosticInputs sessionTimeOut](self->_inputs, "sessionTimeOut"));
    if (-[RGBJDKDiagnosticInputs sceneErrorTimeOut](self->_inputs, "sceneErrorTimeOut"))
      -[ViewController setConsecutiveSceneErrorLimit:](self->_mainAppViewController, "setConsecutiveSceneErrorLimit:", -[RGBJDKDiagnosticInputs sceneErrorTimeOut](self->_inputs, "sceneErrorTimeOut"));
    if (-[RGBJDKDiagnosticInputs userNotMovingTimeout](self->_inputs, "userNotMovingTimeout"))
      -[ViewController setUserNotMovingTimeout:](self->_mainAppViewController, "setUserNotMovingTimeout:", -[RGBJDKDiagnosticInputs userNotMovingTimeout](self->_inputs, "userNotMovingTimeout"));
    -[RGBJDKDiagnosticInputs noMovementAttitudeChangeMinThreshold](self->_inputs, "noMovementAttitudeChangeMinThreshold");
    if (v7 != 0.0)
    {
      -[RGBJDKDiagnosticInputs noMovementAttitudeChangeMinThreshold](self->_inputs, "noMovementAttitudeChangeMinThreshold");
      -[ViewController setNoMovementAttitudeChangeMinThreshold:](self->_mainAppViewController, "setNoMovementAttitudeChangeMinThreshold:");
    }
    if (-[RGBJDKDiagnosticInputs skipSummaryScreen](self->_inputs, "skipSummaryScreen"))
      -[ViewController setSkipSummaryScreen:](self->_mainAppViewController, "setSkipSummaryScreen:", -[RGBJDKDiagnosticInputs skipSummaryScreen](self->_inputs, "skipSummaryScreen"));
  }
  -[ViewController startUI](self->_mainAppViewController, "startUI");
}

- (void)cancel
{
  void *v3;
  void *v4;
  ViewController *mainAppViewController;

  -[ViewController cancel](self->_mainAppViewController, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[ViewController getCurrentResult](self->_mainAppViewController, "getCurrentResult")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RgbJasperCalibrationViewController result](self, "result"));
  objc_msgSend(v4, "setStatusCode:", v3);

  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = 0;

  -[RgbJasperCalibrationViewController setFinished:](self, "setFinished:", 1);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_mainAppViewController, 0);
}

@end
