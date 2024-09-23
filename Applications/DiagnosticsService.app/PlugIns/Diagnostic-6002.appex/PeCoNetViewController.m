@implementation PeCoNetViewController

- (BOOL)getCurrentUUID:(unsigned __int8 *)(a3
{
  DeviceCMInterface v4;

  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (BOOL)convertPrcl:(const Prcl *)a3 toJlex:(jlex_v102 *)a4
{
  _BOOL4 v6;
  id v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  float (*wideRotMatrix)[3];
  unsigned __int8 *v12;
  uint64_t v13;
  double v14;
  _QWORD v16[2];

  v16[0] = 0;
  v16[1] = 0;
  v6 = -[PeCoNetViewController getCurrentUUID:](self, "getCurrentUUID:", v16);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v16);
    for (i = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          !objc_msgSend(i, "compare:", v7);
          i = (void *)v9)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));

    }
    objc_msgSend(i, "getUUIDBytes:", a4->var1);
    v10 = 0;
    wideRotMatrix = a3->wideRotMatrix;
    v12 = &a4->var1[16];
    do
    {
      v13 = 0;
      v14 = a3->wideFocalPoint[v10];
      do
      {
        *(double *)&v12[8 * v13] = (*wideRotMatrix)[v13];
        *(double *)((char *)&a4->var2[v10][2] + 4) = v14;
        ++v13;
      }
      while (v13 != 3);
      ++v10;
      ++wideRotMatrix;
      v12 += 32;
    }
    while (v10 != 3);

  }
  return v6;
}

- (id)serializePatchItemDict:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 100, 0, &v7));
  v4 = v7;
  v5 = 0;
  if (!v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return v5;
}

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
  id v17;
  void *v18;
  std::string *v19;
  void *v20;
  std::string *v21;
  void *v22;
  std::string *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t *v30;
  uint8_t *v31;
  void *v32;
  std::string *v33;
  std::string *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  std::string v44;
  uint8_t v45[8];
  char v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  std::string v51;
  std::string v52;
  _QWORD v53[3];
  _QWORD v54[3];
  uint8_t buf[4];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v7 = v6;
  v9 = *(_QWORD *)&a5;
  v43 = a3;
  v12 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v56) = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun, result = %d", buf, 8u);
  }
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("pluginVersion"));
  if (!(_DWORD)v9)
  {
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v56 = 0u;
    *(_DWORD *)buf = 102;
    if (-[PeCoNetViewController convertPrcl:toJlex:](self, "convertPrcl:toJlex:", a6, buf))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun1", v45, 2u);
      }
      sub_100005D6C(v45, " ");
      v53[0] = CFSTR("x");
      std::to_string(&v52, *v7);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = &v52;
      else
        v19 = (std::string *)v52.__r_.__value_.__r.__words[0];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
      v54[0] = v20;
      v53[1] = CFSTR("y");
      std::to_string(&v51, v7[1]);
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = &v51;
      else
        v21 = (std::string *)v51.__r_.__value_.__r.__words[0];
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v21));
      v54[1] = v22;
      v53[2] = CFSTR("z");
      std::to_string(&v44, v7[2]);
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v44;
      else
        v23 = (std::string *)v44.__r_.__value_.__r.__words[0];
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23));
      v54[2] = v24;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 3));

      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);

      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);

      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
      objc_msgSend(v13, "setValue:forKey:", v42, CFSTR("rotationalAngle"));
      v25 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 116));
      v49 = CFSTR("jlex");
      v50 = v25;
      v40 = (void *)v25;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a6->jasperSN, +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("JpCl-%@"), v26));
      v47 = v27;
      v48 = v41;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PeCoNetViewController serializePatchItemDict:](self, "serializePatchItemDict:", v28));
      if (v29)
      {
        objc_msgSend(v13, "setValue:forKey:", v29, CFSTR("patchItem"));
        v9 = 0;
      }
      else
      {
        sub_100005D6C(&v52, "Failed to serialize patch item dict");
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v33 = &v52;
          if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v33 = (std::string *)v52.__r_.__value_.__r.__words[0];
          LODWORD(v51.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v51, 0xCu);
        }
        if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v34 = &v52;
        else
          v34 = (std::string *)v52.__r_.__value_.__r.__words[0];
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
        objc_msgSend(v12, "addObject:", v35);

        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v52.__r_.__value_.__l.__data_);
        v9 = 4294967286;
      }

      if (v46 < 0)
        operator delete(*(void **)v45);
    }
    else
    {
      sub_100005D6C(v45, "Failed to create JlEx");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v45;
        if (v46 < 0)
          v30 = *(uint8_t **)v45;
        LODWORD(v52.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v52.__r_.__value_.__r.__words + 4) = (std::string::size_type)v30;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v52, 0xCu);
      }
      if (v46 >= 0)
        v31 = v45;
      else
        v31 = *(uint8_t **)v45;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
      objc_msgSend(v12, "addObject:", v32);

      if (v46 < 0)
        operator delete(*(void **)v45);
      v9 = 2;
    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
  objc_msgSend(v13, "setValue:forKey:", v36, CFSTR("log"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun added reduced log string", buf, 2u);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PeCoNetViewController result](self, "result"));
  objc_msgSend(v37, "setData:", v13);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PeCoNetViewController result](self, "result"));
  objc_msgSend(v39, "setStatusCode:", v38);

  -[PeCoNetViewController setFinished:](self, "setFinished:", 1);
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  PeCoNetDKDiagnosticInputs *v5;
  PeCoNetDKDiagnosticInputs *inputs;
  uint8_t v7[16];

  v5 = (PeCoNetDKDiagnosticInputs *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController setup", v7, 2u);
  }
  inputs = self->_inputs;
  self->_inputs = v5;

}

- (void)start
{
  ViewController *v3;
  ViewController *mainAppViewController;
  void *v5;
  PeCoNetDKDiagnosticInputs *inputs;
  float v7;
  uint8_t v8[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController start new", v8, 2u);
  }
  v3 = objc_alloc_init(ViewController);
  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeCoNetViewController view](self, "view"));
  -[ViewController setStoryBoardView:](self->_mainAppViewController, "setStoryBoardView:", v5);

  -[ViewController setListener:](self->_mainAppViewController, "setListener:", self);
  inputs = self->_inputs;
  if (inputs)
  {
    if (-[PeCoNetDKDiagnosticInputs sessionTimeOut](inputs, "sessionTimeOut"))
      -[ViewController setSessionMaxTimeOut:](self->_mainAppViewController, "setSessionMaxTimeOut:", -[PeCoNetDKDiagnosticInputs sessionTimeOut](self->_inputs, "sessionTimeOut"));
    if (-[PeCoNetDKDiagnosticInputs sceneErrorTimeOut](self->_inputs, "sceneErrorTimeOut"))
      -[ViewController setConsecutiveSceneErrorLimit:](self->_mainAppViewController, "setConsecutiveSceneErrorLimit:", -[PeCoNetDKDiagnosticInputs sceneErrorTimeOut](self->_inputs, "sceneErrorTimeOut"));
    if (-[PeCoNetDKDiagnosticInputs sceneErrorWarningThreshold](self->_inputs, "sceneErrorWarningThreshold"))
      -[ViewController setConsecutiveSceneErrorWarningLimit:](self->_mainAppViewController, "setConsecutiveSceneErrorWarningLimit:", -[PeCoNetDKDiagnosticInputs sceneErrorWarningThreshold](self->_inputs, "sceneErrorWarningThreshold"));
    if (-[PeCoNetDKDiagnosticInputs userNotMovingTimeout](self->_inputs, "userNotMovingTimeout"))
      -[ViewController setUserNotMovingTimeout:](self->_mainAppViewController, "setUserNotMovingTimeout:", -[PeCoNetDKDiagnosticInputs userNotMovingTimeout](self->_inputs, "userNotMovingTimeout"));
    -[PeCoNetDKDiagnosticInputs noMovementAttitudeChangeMinThreshold](self->_inputs, "noMovementAttitudeChangeMinThreshold");
    if (v7 != 0.0)
    {
      -[PeCoNetDKDiagnosticInputs noMovementAttitudeChangeMinThreshold](self->_inputs, "noMovementAttitudeChangeMinThreshold");
      -[ViewController setNoMovementAttitudeChangeMinThreshold:](self->_mainAppViewController, "setNoMovementAttitudeChangeMinThreshold:");
    }
    if (-[PeCoNetDKDiagnosticInputs skipSummaryScreen](self->_inputs, "skipSummaryScreen"))
      -[ViewController setSkipSummaryScreen:](self->_mainAppViewController, "setSkipSummaryScreen:", -[PeCoNetDKDiagnosticInputs skipSummaryScreen](self->_inputs, "skipSummaryScreen"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PeCoNetViewController result](self, "result"));
  objc_msgSend(v4, "setStatusCode:", v3);

  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = 0;

  -[PeCoNetViewController setFinished:](self, "setFinished:", 1);
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
