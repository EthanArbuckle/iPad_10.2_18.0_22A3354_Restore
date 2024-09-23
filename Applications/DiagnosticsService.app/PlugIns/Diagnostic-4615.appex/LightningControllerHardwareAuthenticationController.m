@implementation LightningControllerHardwareAuthenticationController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[LightningControllerHardwareAuthenticationController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  const __CFString *v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  _QWORD v62[3];

  if (-[LightningControllerHardwareAuthenticationController isCancelled](self, "isCancelled"))
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "The test is canceled", buf, 2u);
    }

    v5 = -900;
LABEL_20:
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
    objc_msgSend(v46, "setStatusCode:", v45);

    -[LightningControllerHardwareAuthenticationController setFinished:](self, "setFinished:", 1);
    return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "challenge"));

  v56 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController inputs](self, "inputs"));
  v9 = objc_msgSend(v8, "keyIndex");

  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v60 = v7;
    v61 = 1024;
    LODWORD(v62[0]) = (_DWORD)v9;
    WORD2(v62[0]) = 2048;
    *(_QWORD *)((char *)v62 + 6) = 1;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Input parameters: challenge: %@, keyIndex :%i, option: %llu", buf, 0x1Cu);
  }

  if (!v7)
  {
    v27 = DiagnosticLogHandleForCategory(3);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100002AF0(v28, v29, v30, v31, v32, v33, v34, v35);

    v5 = -1;
    goto LABEL_20;
  }
  if (!MFAAComponentAuthCreateSignature(0, v7, &v56, v9, 1) || (v12 = v56) == 0)
  {
    v36 = DiagnosticLogHandleForCategory(3);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_100002B50(v37, v38, v39, v40, v41, v42, v43, v44);

    v5 = -7;
    goto LABEL_20;
  }
  v55 = 0;
  v13 = -[LightningControllerHardwareAuthenticationController base64EncodeData:result:](self, "base64EncodeData:result:", v56, &v55);
  v14 = v55;
  v15 = v14;
  if (v13)
  {
    v16 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100002B20(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
    objc_msgSend(v26, "setStatusCode:", v25);
    goto LABEL_23;
  }
  v57 = CFSTR("response");
  v58 = v14;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
  objc_msgSend(v48, "setData:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
  objc_msgSend(v50, "setStatusCode:", v49);

  v51 = DiagnosticLogHandleForCategory(3);
  v25 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "data"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationController result](self, "result"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "statusCode"));
    *(_DWORD *)buf = 138412546;
    v60 = v52;
    v61 = 2112;
    v62[0] = v54;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Response crypto result: %@ Status: %@", buf, 0x16u);

LABEL_23:
  }

  -[LightningControllerHardwareAuthenticationController setFinished:](self, "setFinished:", 1);
}

- (int64_t)base64EncodeData:(id)a3 result:(id *)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "base64EncodedStringWithOptions:", 0));
  *a4 = v5;
  if (v5)
    return 0;
  else
    return -6;
}

- (LightningControllerHardwareAuthenticationInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
