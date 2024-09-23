@implementation _OSDH9Camera

- (_OSDH9Camera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  _OSDH9Camera *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_OSDH9Camera;
  v5 = -[_OSDHxCamera initWithCaptureDevice:cameraSource:error:](&v13, "initWithCaptureDevice:cameraSource:error:", a3, a4, a5);
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v10 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.H9Camera.workQueue", v9);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_OSDH9Camera;
  if (!-[_OSDHxCamera getDeviceAndStreams:](&v10, "getDeviceAndStreams:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v6 = -[_OSDH9Camera _enableMultiVideoOutput:error:](self, "_enableMultiVideoOutput:error:", v5, a3);

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v8 = -[_OSDH9Camera _setStreamHandlers:error:](self, "_setStreamHandlers:error:", v7, a3);

  return v8;
}

- (BOOL)_enableMultiVideoOutput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "setProperty:BOOLean:error:", kFigCaptureStreamProperty_MultipleOutputSupportEnabled, 1, a4))
  {
    v9 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
    v10 = &__kCFBooleanTrue;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v7 = objc_msgSend(v5, "setProperty:value:error:", kFigCaptureStreamProperty_VideoOutputsEnabled, v6, a4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_setStreamHandlers:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v6 = a3;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009B74;
  v16[3] = &unk_1000105D8;
  objc_copyWeak(&v17, &location);
  v7 = objc_retainBlock(v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009BD0;
  v14[3] = &unk_100010600;
  objc_copyWeak(&v15, &location);
  v8 = objc_retainBlock(v14);
  v21[0] = kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler;
  v9 = objc_retainBlock(v7);
  v22[0] = v9;
  v21[1] = kFigCaptureStreamVideoOutputHandlerKey_EventHandler;
  v10 = objc_retainBlock(v8);
  v22[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

  v19 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v20 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  LOBYTE(a4) = objc_msgSend(v6, "setProperty:value:error:", kFigCaptureStreamProperty_VideoOutputHandlers, v12, a4);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)setFormatIndex:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v8 = objc_msgSend(v7, "setProperty:number:error:", kFigCaptureStreamProperty_FormatIndex, v6, a4);

  if (v8)
    -[_OSDH9Camera setFormatIndex:](self, "setFormatIndex:", v6);

  return v8;
}

- (id)errorCountForType:(unint64_t)a3 error:(id *)a4
{
  const __CFString **v4;
  id result;
  const __CFString *v6;

  switch(a3)
  {
    case 1uLL:
      v4 = (const __CFString **)&kFigCaptureStreamPropertyValue_MIPIErrorCount;
      goto LABEL_5;
    case 2uLL:
      v4 = (const __CFString **)&kFigCaptureStreamPropertyValue_I2CErrorCount;
LABEL_5:
      v6 = *v4;
      goto LABEL_9;
    case 3uLL:
      v6 = CFSTR("SIFErrorCount");
      goto LABEL_9;
    case 4uLL:
      v6 = CFSTR("UARTErrorCount");
      goto LABEL_9;
    case 5uLL:
      v6 = CFSTR("LPDPErrorCount");
LABEL_9:
      result = (id)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera _getStreamErrorFor:error:](self, "_getStreamErrorFor:error:", v6, a4));
      break;
    default:
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> Camera has no error for type %lu"), self, a3);
      result = 0;
      break;
  }
  return result;
}

- (id)supportedFormats:(id *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v5 = objc_msgSend(v4, "copyProperty:error:", kFigCaptureStreamProperty_SupportedFormatsArray, a3);

  return v5;
}

- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
  LOBYTE(a4) = objc_msgSend(v6, "setProperty:BOOLean:error:", CFSTR("SensorAgileClockingEnable"), v5, a4);

  return (char)a4;
}

- (id)useMaxAvailableDataRate:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v6 = objc_msgSend(v5, "copyProperty:error:", CFSTR("SupportedLinkFrequencies"), a3);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v28 = v9;
    v29 = 2112;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu available lane frequencies: %@", buf, 0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A08C;
  v18[3] = &unk_100010628;
  v18[4] = &v19;
  v18[5] = &v23;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)v24[3];
    *(_DWORD *)buf = 134217984;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Greatest index is %lu", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v24[3]));
  v15 = objc_msgSend(v13, "setProperty:number:error:", CFSTR("LinkFrequencyIndex"), v14, a3);

  if ((v15 & 1) != 0)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20[3]));
  else
    v16 = 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (BOOL)syncSlave:(id)a3 skipFrames:(BOOL)a4 enableOutput:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v26[0] = objc_msgSend(v11, "streamRef");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "captureStream"));
  v26[1] = objc_msgSend(v12, "streamRef");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
  LODWORD(v12) = objc_msgSend(v14, "setProperty:value:error:", kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v13, a6);

  if ((_DWORD)v12
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice")),
        v16 = kFigCaptureSynchronizedStreamsGroupProperty_MasterConfiguration,
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream")),
        LODWORD(v16) = objc_msgSend(v15, "setProperty:value:error:", v16, objc_msgSend(v17, "streamRef"), a6), v17, v15, (_DWORD)v16))
  {
    v18 = &__kCFBooleanFalse;
    v24[0] = kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled;
    v24[1] = kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled;
    if (v8)
      v19 = &__kCFBooleanTrue;
    else
      v19 = &__kCFBooleanFalse;
    if (v7)
      v18 = &__kCFBooleanTrue;
    v25[0] = v19;
    v25[1] = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "captureStream"));
    v22 = objc_msgSend(v21, "setProperty:value:error:", kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, v20, a6);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  unsigned __int8 v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v7 = v6;
  if (v5)
    v8 = CFSTR("TestPatternPN9");
  else
    v8 = CFSTR("TestPatternNone");
  v9 = objc_msgSend(v6, "setProperty:value:error:", CFSTR("TestPattern"), v8, a4);

  return v9;
}

- (void)_receivedEvent:(int)a3 timestamp:(id *)a4 info:(int64_t)a5
{
  NSObject *v6;

  if (-[_OSDHxCamera isStreaming](self, "isStreaming", *(_QWORD *)&a3, a4, a5))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_OSDH9Camera workQueue](self, "workQueue"));
    dispatch_async(v6, &stru_100010648);

  }
}

- (void)_receivedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4
{
  NSObject *v6;
  _QWORD v7[6];

  if (-[_OSDHxCamera isStreaming](self, "isStreaming", a3, a4))
  {
    CVPixelBufferRetain(a3);
    v6 = objc_claimAutoreleasedReturnValue(-[_OSDH9Camera workQueue](self, "workQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A44C;
    v7[3] = &unk_100010670;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(v6, v7);

  }
}

- (void)_processBuffer:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  OSDCameraFrame *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  -[_OSDHxCamera set_frameCounter:](self, "set_frameCounter:", -[_OSDHxCamera _frameCounter](self, "_frameCounter") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera previewLayer](self, "previewLayer"));

  if (v5)
    -[_OSDHxCamera _showFrameOnPreviewLayer:](self, "_showFrameOnPreviewLayer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera frameHandler](self, "frameHandler"));

  if (v6)
  {
    v9 = (id)CVBufferCopyAttachment(a3, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    v7 = objc_opt_new(OSDCameraFrame);
    -[OSDCameraFrame setBuffer:](v7, "setBuffer:", a3);
    -[OSDCameraFrame setMetadata:](v7, "setMetadata:", v9);
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_OSDHxCamera frameHandler](self, "frameHandler"));
    ((void (**)(_QWORD, OSDCameraFrame *))v8)[2](v8, v7);

  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSNumber)formatIndex
{
  return self->_formatIndex;
}

- (void)setFormatIndex:(id)a3
{
  self->_formatIndex = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
