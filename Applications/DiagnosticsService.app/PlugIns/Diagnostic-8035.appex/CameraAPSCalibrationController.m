@implementation CameraAPSCalibrationController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cameras"));
  -[CameraAPSCalibrationController setCameras:](self, "setCameras:", v5);

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-8035.cameraCalibrationQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002724;
  block[3] = &unk_100004158;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)calibrateCameraType:(id)a3 position:(int64_t)a4 statusCode:(int64_t *)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t buf[4];
  id v39;

  v7 = a3;
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calibrating %@...", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", v7, AVMediaTypeVideo, a4));
  v11 = v10;
  if (v10)
  {
    v12 = AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration;
    if (objc_msgSend(v10, "isDiagnosticsTestSupported:", AVCaptureDeviceDiagnosticsTestTypeAutoFocusPositionSensorCalibration))
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "runDiagnosticsWithTestType:", v12));
      v14 = DiagnosticLogHandleForCategory(3);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_100003278();

      if (v13)
      {
        v16 = AVCaptureDeviceDiagnosticsResult;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", AVCaptureDeviceDiagnosticsResult));

        if (v17)
        {
          v18 = AVCaptureDeviceDiagnosticsStatusCode;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", AVCaptureDeviceDiagnosticsStatusCode));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18));
            v21 = objc_msgSend(v20, "intValue");

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18));
              *a5 = (int64_t)objc_msgSend(v22, "integerValue");

              v23 = DiagnosticLogHandleForCategory(3);
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                sub_1000031FC();

              if ((unint64_t)*a5 >> 31)
              {
                *a5 = -100;
                v25 = DiagnosticLogHandleForCategory(3);
                v26 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  sub_10000319C();

              }
            }
            v37[0] = v7;
            v27 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18, CFSTR("camera"), CFSTR("statusCode")));
            v37[1] = v27;
            v36[2] = CFSTR("passed");
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v16));
            v37[2] = v28;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));

            goto LABEL_30;
          }
          *a5 = -105;
          v34 = DiagnosticLogHandleForCategory(3);
          v27 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_10000313C();
        }
        else
        {
          *a5 = -104;
          v33 = DiagnosticLogHandleForCategory(3);
          v27 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_1000030DC();
        }
      }
      else
      {
        *a5 = -103;
        v32 = DiagnosticLogHandleForCategory(3);
        v27 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10000307C();
      }
      v29 = 0;
LABEL_30:

      goto LABEL_31;
    }
    *a5 = -102;
    v31 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000032E4();
  }
  else
  {
    *a5 = -101;
    v30 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000301C();
  }
  v29 = 0;
LABEL_31:

  return v29;
}

- (NSArray)cameras
{
  return self->_cameras;
}

- (void)setCameras:(id)a3
{
  objc_storeStrong((id *)&self->_cameras, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameras, 0);
}

@end
