@implementation PearlErrorDataController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[PearlErrorDataController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController findRequestedHardwareDiagnostic:](self, "findRequestedHardwareDiagnostic:", &v16));
  v4 = v16;
  v5 = v4;
  if (!v3)
  {
    v7 = v4;
LABEL_9:
    -[PearlErrorDataController finishWithError:](self, "finishWithError:", v5);
    goto LABEL_10;
  }
  v15 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController runRequestedHardwareDiagnostic:error:](self, "runRequestedHardwareDiagnostic:error:", v3, &v15));
  v7 = v15;

  if (!v6)
  {
    v5 = v7;
    goto LABEL_9;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController processResultsForReport:](self, "processResultsForReport:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
      objc_msgSend(v13, "setData:", v12);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  -[PearlErrorDataController finishWithError:](self, "finishWithError:", v14);

LABEL_10:
}

- (id)processResultsForReport:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  NSMutableArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  NSMutableArray *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];

  v3 = a3;
  v23 = objc_opt_new(NSMutableArray);
  v20 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("results")));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v22 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v8);
        v30[0] = CFSTR("name");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
        v11 = stringOrNull(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v30[1] = CFSTR("value");
        v31[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("measurement")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value")));
        v15 = numberOrNull(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v31[1] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
        -[NSMutableArray addObject:](v23, "addObject:", v17);

        v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

  v28 = CFSTR("results");
  v29 = v23;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));

  return v18;
}

- (void)finishWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  _UNKNOWN **v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];

  v4 = a3;
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100002DBC((uint64_t)v4, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8068.errorDomain"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
      objc_msgSend(v10, "setStatusCode:", v9);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      v13 = objc_msgSend(v12, "isEqualToString:", HDErrorDomain);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
        v9 = v14;
        v15 = &off_100004440;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
        v17 = objc_msgSend(v16, "isEqualToString:", HDIOReportErrorDomain);

        if (v17)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
          v9 = v14;
          v15 = &off_100004458;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
          v19 = objc_msgSend(v18, "isEqualToString:", HDCapturePlugInErrorDomain);

          if (v19)
          {
            v20 = objc_msgSend(v4, "code");
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
            v9 = v14;
            if (v20 == (id)213)
              v15 = &off_100004470;
            else
              v15 = &off_100004488;
          }
          else
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
            v9 = v14;
            v15 = &off_1000044A0;
          }
        }
      }
      objc_msgSend(v14, "setStatusCode:", v15);
    }

    v28[0] = CFSTR("code");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
    v29[0] = v21;
    v28[1] = CFSTR("domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v29[1] = v22;
    v28[2] = CFSTR("description");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v29[2] = v23;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "data"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v25));

    objc_msgSend(v26, "setObject:forKeyedSubscript:", v11, CFSTR("error"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
    objc_msgSend(v27, "setData:", v26);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_1000044B8);
  }

  -[PearlErrorDataController setFinished:](self, "setFinished:", 1);
}

- (id)findRequestedHardwareDiagnostic:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HDLab defaultLab](HDLab, "defaultLab"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testType"));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 == (id)1)
    v9 = CFSTR("PearlFaultDiagnostic");
  else
    v9 = CFSTR("PearlIOReportDiagnostic");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "availableDiagnostics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  if (a3 && !v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not find requested hardware diagnostic (%@)."), v9, NSLocalizedDescriptionKey));
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8068.errorDomain"), -1, v13));

  }
  return v11;
}

- (id)runRequestedHardwareDiagnostic:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "testType"));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 == (id)1)
  {
    v29[0] = HDDiagnosticAnalysisParametersKey;
    v27 = CFSTR("frameCount");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController inputs](self, "inputs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "frameCount"));
    v28 = v21;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v30[0] = v10;
    v29[1] = HDDiagnosticExperimentParametersKey;
    v25[0] = CFSTR("frameCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "frameCount"));
    v25[1] = CFSTR("timeout");
    v26[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PearlErrorDataController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeout"));
    v26[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v30[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));

  }
  else
  {
    v16 = &__NSDictionary0__struct;
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "runWithParameters:host:error:", v16, self, a4));
  v18 = (void *)v17;
  if (a4 && !v17)
  {
    v23 = NSLocalizedDescriptionKey;
    v24 = CFSTR("No report, nor error were retrieved.");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8068.errorDomain"), -3, v19));

  }
  return v18;
}

- (id)retrieveAssetByName:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)workingDirectory
{
  NSString *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8068")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  return v5;
}

- (PearlErrorDataInputs)inputs
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
