@implementation SHSession

- (void)dealloc
{
  objc_super v3;

  -[SHMatcher stopRecognition](self->_matcher, "stopRecognition");
  v3.receiver = self;
  v3.super_class = (Class)SHSession;
  -[SHSession dealloc](&v3, sel_dealloc);
}

- (SHSession)init
{
  SHShazamCatalog *v3;
  SHSession *v4;

  v3 = objc_alloc_init(SHShazamCatalog);
  v4 = -[SHSession initWithCatalog:](self, "initWithCatalog:", v3);

  return v4;
}

- (SHSession)initWithCatalog:(SHCatalog *)catalog
{
  SHCatalog *v4;
  uint64_t v5;
  void *v6;
  SHSession *v7;
  id v9;

  v4 = catalog;
  -[SHCatalog _createMatcher](v4, "_createMatcher");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Could not find a valid matcher"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = (void *)v5;
  v7 = -[SHSession initWithCatalog:matcher:sessionDriver:](self, "initWithCatalog:matcher:sessionDriver:", v4, v5, 0);

  return v7;
}

- (SHSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5
{
  id v9;
  id v10;
  id v11;
  SHSession *v12;
  SHSession *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSession;
  v12 = -[SHSession init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_catalog, a3);
    objc_storeStrong((id *)&v13->_matcher, a4);
    -[SHMatcher setDelegate:](v13->_matcher, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_sessionDriver, a5);
    -[SHSessionDriver setSessionDriverDelegate:](v13->_sessionDriver, "setSessionDriverDelegate:", v13);
  }

  return v13;
}

- (BOOL)validateSignature:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "duration");
  v8 = v7;
  -[SHSession catalog](self, "catalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumQuerySignatureDuration");
  if (v8 > v10)
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "duration");
  v12 = v11;
  -[SHSession catalog](self, "catalog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimumQuerySignatureDuration");
  v15 = v14;

  if (v12 < v15)
  {
LABEL_5:
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[SHSession catalog](self, "catalog");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minimumQuerySignatureDuration");
    v20 = v19;
    -[SHSession catalog](self, "catalog");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "maximumQuerySignatureDuration");
    v23 = v22;
    objc_msgSend(v6, "duration");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("The current Catalog accepts signatures in the range %f-%f, the current signature duration is %f"), v20, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x24BDD0FF0];
    v29[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a4, 201, 0, v26);

    v16 = 0;
    goto LABEL_6;
  }
  v16 = 1;
LABEL_6:

  return v16;
}

- (void)matchSignature:(SHSignature *)signature
{
  SHSignature *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  SHSignature *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = signature;
  -[SHSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_8:
    v33 = 0;
    v18 = -[SHSession validateSignature:error:](self, "validateSignature:error:", v4, &v33);
    v15 = v33;
    if (v18)
    {
      v19 = (SHSignature *)-[SHSignature copy](v4, "copy");

      sh_log_object();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[SHSignature duration](v19, "duration");
        *(_DWORD *)buf = 134217984;
        v35 = v21;
        _os_log_impl(&dword_218BF1000, v20, OS_LOG_TYPE_DEFAULT, "Matching signature with duration %f", buf, 0xCu);
      }

      -[SHSession catalog](self, "catalog");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "installationID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHMatcherRequest requestToMatchSignature:installationID:sendNotifications:](SHMatcherRequest, "requestToMatchSignature:installationID:sendNotifications:", v19, v24, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SHSession matcher](self, "matcher");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startRecognitionForRequest:", v16);

      v4 = v19;
    }
    else
    {
      sh_log_object();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl(&dword_218BF1000, v26, OS_LOG_TYPE_DEBUG, "Failed validation for signature with error %@", buf, 0xCu);
      }

      +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", v4, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SHSession _isSessionDriverSignature:](self, "_isSessionDriverSignature:", v4))
      {
        -[SHSession sessionDriver](self, "sessionDriver");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSession matcher](self, "matcher");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "matcher:didProduceResponse:", v28, v16);

      }
      -[SHSession delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) != 0)
      {
        -[SHSession delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHError remapErrorToClientError:](SHError, "remapErrorToClientError:", v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "session:didNotFindMatchForSignature:error:", self, v4, v32);

      }
      -[SHSession handleCommonActionsForResponse:](self, "handleCommonActionsForResponse:", v16);
    }
    goto LABEL_19;
  }
  -[SHSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "session:shouldAttemptToMatchSignature:", self, v4);

  if ((v7 & 1) != 0)
    goto LABEL_8;
  if (-[SHSession _isSessionDriverSignature:](self, "_isSessionDriverSignature:", v4))
  {
    -[SHSignature duration](v4, "duration");
    v9 = v8;
    -[SHSession catalog](self, "catalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maximumQuerySignatureDuration");
    v11 = 0.0;
    if (v9 < v12)
    {
      -[SHSession catalog](self, "catalog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "maximumQuerySignatureDuration");
      v11 = v14;

    }
    +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:](SHMatcherResponse, "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:", v4, 0.0, 0.0, v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSession sessionDriver](self, "sessionDriver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSession matcher](self, "matcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "matcher:didProduceResponse:", v17, v15);

LABEL_19:
  }

}

- (void)matchStreamingBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time
{
  AVAudioTime *v6;
  AVAudioPCMBuffer *v7;
  id v8;

  v6 = time;
  v7 = buffer;
  -[SHSession sessionDriver](self, "sessionDriver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flow:time:", v7, v6);

}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SHSession _isSessionDriverSignature:](self, "_isSessionDriverSignature:", v8);

  if (!v9
    || (-[SHSession sessionDriver](self, "sessionDriver"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "matcher:didProduceResponse:", v6, v7),
        v10,
        objc_msgSend(v7, "result") != 2)
    || (objc_msgSend(v7, "retrySeconds"), v11 <= 0.0))
  {
    v12 = objc_msgSend(v7, "result");
    switch(v12)
    {
      case 1:
        objc_msgSend(v7, "match");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        sh_log_object();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "mediaItems");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "valueForProperty:", CFSTR("sh_title"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v24;
          _os_log_impl(&dword_218BF1000, v21, OS_LOG_TYPE_DEFAULT, "SHSession: Match found %@", (uint8_t *)&v29, 0xCu);

        }
        -[SHSession delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) == 0)
          goto LABEL_17;
        -[SHSession delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "session:didFindMatch:", self, v17);
        break;
      case 2:
        -[SHSession delegate](self, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) == 0)
        {
LABEL_18:
          -[SHSession handleCommonActionsForResponse:](self, "handleCommonActionsForResponse:", v7);
          goto LABEL_19;
        }
        -[SHSession delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "signature");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "session:didNotFindMatchForSignature:error:", self, v18, 0);
        break;
      case 3:
        objc_msgSend(v7, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "sh_isMatchAttemptCancelledError");

        if ((v14 & 1) != 0)
          goto LABEL_18;
        -[SHSession delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0)
          goto LABEL_18;
        -[SHSession delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "signature");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "error");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHError remapErrorToClientError:](SHError, "remapErrorToClientError:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "session:didNotFindMatchForSignature:error:", self, v18, v20);

        break;
      default:
        goto LABEL_18;
    }

LABEL_17:
    goto LABEL_18;
  }
LABEL_19:

}

- (void)handleCommonActionsForResponse:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  -[SHSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SHSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:didProduceResponse:", self, v4);

  }
  if ((objc_msgSend(v4, "isStillRunningAssociatedRequest") & 1) == 0)
  {
    -[SHSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      sh_log_object();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_218BF1000, v10, OS_LOG_TYPE_DEBUG, "Returned all responses for request", v19, 2u);
      }

      -[SHSession delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishedSession:", self);

    }
  }
  objc_msgSend(v4, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sh_isMatchAttemptCancelledError");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("error"));

    objc_msgSend(v4, "match");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("match"));

    objc_msgSend(v4, "signature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v17, CFSTR("signature"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SHNotificationNameSessionResult"), self, v14);

  }
}

- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4
{
  void *v5;
  id v6;

  +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSession matcher](self, "matcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSession matcher:didProduceResponse:](self, "matcher:didProduceResponse:", v5, v6);

}

- (BOOL)shouldGenerateSpectralOutput
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SHSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SHSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldGenerateSpectralOutput");

  return v6;
}

- (BOOL)_isSessionDriverSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_sessionDriver)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "_ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSession sessionDriver](self, "sessionDriver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchingSignatureID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    if (self->_sessionDriver)
    {
      -[SHSession sessionDriver](self, "sessionDriver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "matchingSignatureID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        sh_log_object();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "_ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SHSession sessionDriver](self, "sessionDriver");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "matchingSignatureID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v14;
          v20 = 2112;
          v21 = v16;
          _os_log_impl(&dword_218BF1000, v13, OS_LOG_TYPE_DEBUG, "Session received a response for non streaming session signature %@, session is waiting for %@", (uint8_t *)&v18, 0x16u);

        }
      }
    }
    goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (SHSessionDriver)sessionDriver
{
  SHSessionDriver *sessionDriver;
  void *v4;
  SHSessionDriver *v5;
  SHSessionDriver *v6;

  sessionDriver = self->_sessionDriver;
  if (!sessionDriver)
  {
    -[SHSession catalog](self, "catalog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_createSessionDriver");
    v5 = (SHSessionDriver *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sessionDriver;
    self->_sessionDriver = v5;

    -[SHSessionDriver setSessionDriverDelegate:](self->_sessionDriver, "setSessionDriverDelegate:", self);
    sessionDriver = self->_sessionDriver;
  }
  return sessionDriver;
}

- (void)didCalculateSpectralData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SHSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SHSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCalculateSpectralData:", v7);

  }
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (SHCatalog)catalog
{
  return self->_catalog;
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
