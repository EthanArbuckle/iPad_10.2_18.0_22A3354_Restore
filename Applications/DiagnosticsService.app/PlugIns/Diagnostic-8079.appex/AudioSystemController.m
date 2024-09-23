@implementation AudioSystemController

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = DiagnosticLogHandleForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calculating peak dB values for result %@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v18 = objc_msgSend(v17, "isUsingDBValuesFromSystem");

  if (!v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
    v24 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AudioCrossCorrelation calculatePeakDBValueWithSourceSignalData:resultSignalData:error:](AudioCrossCorrelation, "calculatePeakDBValueWithSourceSignalData:resultSignalData:error:", v12, v20, &v24));
    v21 = v24;

    v14 = v21;
    if (v19)
      goto LABEL_5;
LABEL_7:
    v25 = NSLocalizedDescriptionKey;
    v26 = CFSTR("Failed to generate DB Value.");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -65, v22));

    -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v23);
    goto LABEL_8;
  }
  objc_msgSend(v11, "correlationValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  if (!v19)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v13, "setDbValue:", v19);
LABEL_8:

}

@end
