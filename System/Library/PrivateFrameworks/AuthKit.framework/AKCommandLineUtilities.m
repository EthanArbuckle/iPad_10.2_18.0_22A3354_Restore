@implementation AKCommandLineUtilities

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)createAndExecuteRequestForPath:(id)a3 requestBody:(id)a4 httpMethod:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[AKCommandLineUtilities mutableJSONRequestForPath:](self, "mutableJSONRequestForPath:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ak_setJSONBodyWithParameters:", v13);
  objc_msgSend(v17, "setHTTPMethod:", v14);
  objc_msgSend(v15, "resourceLoadDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "signRequest:", v17);

  objc_initWeak(&location, self);
  +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__AKCommandLineUtilities_createAndExecuteRequestForPath_requestBody_httpMethod_configuration_completion___block_invoke;
  v22[3] = &unk_1E2E60BA0;
  objc_copyWeak(&v24, &location);
  v20 = v16;
  v23 = v20;
  v21 = (id)objc_msgSend(v19, "beginDataTaskWithRequest:completionHandler:", v17, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __105__AKCommandLineUtilities_createAndExecuteRequestForPath_requestBody_httpMethod_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v14 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsonDictionaryForData:error:", v14, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "errorFromServerResponseBody:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v12 = v7;
    v13 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v11 = v8;
  }

}

- (id)_hostURL
{
  if (_hostURL_onceToken != -1)
    dispatch_once(&_hostURL_onceToken, &__block_literal_global_30);
  return (id)_hostURL_hostURL;
}

void __34__AKCommandLineUtilities__hostURL__block_invoke()
{
  void *v0;
  unint64_t v1;

  +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "lastKnownIDMSEnvironment");

  if (v1 <= 3)
    objc_storeStrong((id *)&_hostURL_hostURL, *off_1E2E60BC0[v1]);
}

- (id)mutableJSONRequestForPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  -[AKCommandLineUtilities _hostURL](self, "_hostURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPath:", v5);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCommandLineUtilities mutableJSONRequestForURL:](self, "mutableJSONRequestForURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableJSONRequestForURL:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[AKCommandLineUtilities mutableJSONRequestForURL:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));

  return v11;
}

- (id)errorFromServerResponseBody:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasError"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("serviceErrors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0 || objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v18 = 0;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:userInfo:", -7029, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKCommandLineUtilities errorFromServerResponseBody:].cold.3((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v35[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
        v16 = objc_claimAutoreleasedReturnValue();
        v36[0] = v16;
        v35[1] = *MEMORY[0x1E0CB2D68];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
        goto LABEL_17;
      }
      _AKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AKCommandLineUtilities errorFromServerResponseBody:].cold.2(v16, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      _AKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AKCommandLineUtilities errorFromServerResponseBody:].cold.1(v16, v19, v20, v21, v22, v23, v24, v25);
    }
    v18 = 0;
    goto LABEL_16;
  }
  v26 = 0;
LABEL_18:

  return v26;
}

- (id)jsonDictionaryForData:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v18 = v6;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v8)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
      AKPrintLine(CFSTR("Error deserializing data %@ for data %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

      v6 = v8;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)mutableJSONRequestForURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "_mutableJSONRequestForURL: %@", a5, a6, a7, a8, 2u);
}

- (void)errorFromServerResponseBody:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Server error returned with no title!", a5, a6, a7, a8, 0);
}

- (void)errorFromServerResponseBody:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Server error returned with no description!!", a5, a6, a7, a8, 0);
}

- (void)errorFromServerResponseBody:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Server response contained error: %@", a5, a6, a7, a8, 2u);
}

@end
