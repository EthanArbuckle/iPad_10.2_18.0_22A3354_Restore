@implementation CameraSyncController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[CameraSyncController setInputs:](self, "setInputs:", a3, a4);
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSErrorUserInfoKey v23;
  void *v24;

  v22 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController findRequestedHardwareDiagnostic:](self, "findRequestedHardwareDiagnostic:", &v22));
  v4 = v22;
  v5 = v4;
  if (!v3)
  {
    v7 = v4;
LABEL_11:
    -[CameraSyncController finishWithError:](self, "finishWithError:", v5);
    goto LABEL_14;
  }
  v21 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController runRequestedHardwareDiagnostic:error:](self, "runRequestedHardwareDiagnostic:error:", v3, &v21));
  v7 = v21;

  if (!v6)
  {
    v5 = v7;
    goto LABEL_11;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results")),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController processResultsForReport:](self, "processResultsForReport:", v6));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("results")));
    if (v13
      && (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("errorCounters"))),
          v15,
          v14,
          v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
      objc_msgSend(v16, "setData:", v12);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      -[CameraSyncController finishWithError:](self, "finishWithError:", v17);

    }
    else
    {
      v23 = NSLocalizedDescriptionKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Camera Sync report is incomplete. Processed result: %@"), v12));
      v24 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"), -9, v19));

      -[CameraSyncController finishWithError:](self, "finishWithError:", v20);
      v7 = (id)v20;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    -[CameraSyncController finishWithError:](self, "finishWithError:", v12);
  }

LABEL_14:
}

- (id)processResultsForReport:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id obj;
  uint64_t v34;
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  NSMutableArray *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v35 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("results")));

  if (v6)
  {
    v32 = v3;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("results")));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v7)
    {
      v8 = v7;
      v34 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v34)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v44[0] = CFSTR("name");
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name")));
          v12 = stringOrNull(v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v44[1] = CFSTR("value");
          v45[0] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("measurement")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value")));
          v16 = numberOrNull(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v45[1] = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
          -[NSMutableArray addObject:](v35, "addObject:", v18);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v8);
    }
    v42 = CFSTR("results");
    v43 = v35;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
    -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v19);

    v3 = v32;
  }
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryData"));
  if (v20)
  {
    v21 = (NSMutableArray *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryData"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "valueForKey:", CFSTR("experiment")));
    if (!v23)
    {
LABEL_14:

      goto LABEL_15;
    }
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("experiment")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("ErrorCounters")));

    if (v27)
    {
      v21 = objc_opt_new(NSMutableArray);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("experiment")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ErrorCounters")));

      -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", v22);
      v40 = CFSTR("errorCounters");
      v41 = v22;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
      -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v30);

      goto LABEL_14;
    }
  }
LABEL_15:

  return v4;
}

- (void)finishWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v4 = a3;
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100002CD8((uint64_t)v4, v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
      objc_msgSend(v11, "setStatusCode:", v10);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      v14 = objc_msgSend(v13, "isEqualToString:", HDErrorDomain);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
        v10 = v15;
        v16 = &off_100004488;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
        v18 = objc_msgSend(v17, "isEqualToString:", HDIOReportErrorDomain);

        if (v18)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
          v10 = v15;
          v16 = &off_1000044A0;
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
          v20 = objc_msgSend(v19, "isEqualToString:", HDCapturePlugInErrorDomain);

          if (v20)
          {
            v21 = objc_msgSend(v4, "code");
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
            v10 = v15;
            if (v21 == (id)213)
              v16 = &off_1000044B8;
            else
              v16 = &off_1000044D0;
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
            v10 = v15;
            v16 = &off_1000044E8;
          }
        }
      }
      objc_msgSend(v15, "setStatusCode:", v16);
    }

    v29[0] = CFSTR("code");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
    v30[0] = v22;
    v29[1] = CFSTR("domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v30[1] = v23;
    v29[2] = CFSTR("description");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v30[2] = v24;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "data"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v26));

    objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, CFSTR("error"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
    objc_msgSend(v28, "setData:", v27);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", &off_100004500);
  }

  -[CameraSyncController setFinished:](self, "setFinished:", 1);
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
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HDLab defaultLab](HDLab, "defaultLab"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8)
  {
    if (v8 != (id)1)
    {
      v14 = DiagnosticLogHandleForCategory(3);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100002D44(self, v15);

      v21 = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController inputs](self, "inputs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized camera sync group with type (%@)."), v13));
      v22 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"), -10, v17));

      goto LABEL_11;
    }
    v9 = CFSTR("CameraSyncDiagnostic.Back");
  }
  else
  {
    v9 = CFSTR("CameraSyncDiagnostic.Front");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "availableDiagnostics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  if (a3 && !v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not find requested hardware diagnostic (%@)."), v9, NSLocalizedDescriptionKey));
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"), -1, v13));
LABEL_11:

    v11 = 0;
  }

  return v11;
}

- (id)runRequestedHardwareDiagnostic:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v18 = HDDiagnosticExperimentParametersKey;
  v16 = CFSTR("duration");
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSyncController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "duration"));
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "runWithParameters:host:error:", v10, self, a4));
  if (a4 && !v11)
  {
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("No report, nor error were retrieved.");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8217.errorDomain"), -3, v12));

  }
  return v11;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("com.apple.DiagnosticsService-8217")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  return v5;
}

- (CameraSyncInputs)inputs
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
