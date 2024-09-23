@implementation SHStreamingSessionDriver

- (SHStreamingSessionDriver)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5
{
  SHSignatureBuffer *v6;
  SHStreamingSessionDriver *v7;

  v6 = -[SHSignatureBuffer initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:]([SHSignatureBuffer alloc], "initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:", a3, a4, a5);
  v7 = -[SHStreamingSessionDriver initWithSignatureBuffer:](self, "initWithSignatureBuffer:", v6);

  return v7;
}

- (SHStreamingSessionDriver)initWithSignatureBuffer:(id)a3
{
  id v5;
  SHStreamingSessionDriver *v6;
  SHStreamingSessionDriver *v7;
  double v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHStreamingSessionDriver;
  v6 = -[SHStreamingSessionDriver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signatureBuffer, a3);
    objc_msgSend(v5, "minimumSignatureDuration");
    v7->_currentRequiredDuration = v8;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)flow:(id)a3 time:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[SHStreamingSessionDriver sessionDriverDelegate](self, "sessionDriverDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHStreamingSessionDriver sessionDriverDelegate](self, "sessionDriverDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldGenerateSpectralOutput");
    -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldGenerateSpectralOutput:", v10);

  }
  os_unfair_lock_lock(&self->_lock);
  -[SHStreamingSessionDriver intermissionDeadline](self, "intermissionDeadline");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHStreamingSessionDriver intermissionDeadline](self, "intermissionDeadline");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "laterDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHStreamingSessionDriver intermissionDeadline](self, "intermissionDeadline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
      goto LABEL_8;
  }
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "flow:time:", v22, v6);

  if (!-[SHStreamingSessionDriver canPerformMatch](self, "canPerformMatch"))
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[SHStreamingSessionDriver signatureForMatching](self, "signatureForMatching");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_ID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHStreamingSessionDriver setMatchingSignatureID:](self, "setMatchingSignatureID:", v20);

    os_unfair_lock_unlock(&self->_lock);
    if (v19)
    {
      -[SHStreamingSessionDriver sessionDriverDelegate](self, "sessionDriverDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "matchSignature:", v19);

    }
  }

}

- (void)receivedSignature:(id)a3 retry:(double)a4 offset:(double)a5 intermission:(double)a6 dropCurrentSignature:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  NSObject *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v7 = a7;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  sh_log_object();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v29 = 134218496;
    v30 = a4;
    v31 = 2048;
    v32 = a5;
    v33 = 2048;
    v34 = a6;
    _os_log_impl(&dword_218BF1000, v13, OS_LOG_TYPE_DEBUG, "Asked to retry with %f at offset %f and intermission %f", (uint8_t *)&v29, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SHStreamingSessionDriver matchingSignatureID](self, "matchingSignatureID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_ID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) == 0)
  {
    sh_log_object();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "_ID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHStreamingSessionDriver matchingSignatureID](self, "matchingSignatureID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = *(double *)&v24;
      v31 = 2112;
      v32 = *(double *)&v25;
      _os_log_impl(&dword_218BF1000, v23, OS_LOG_TYPE_ERROR, "StreamingSessionDriver received a response for signature %@ it was not expecting, it was expecting %@", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_14;
  }
  if (v7)
  {
    -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHStreamingSessionDriver matchingSignatureID](self, "matchingSignatureID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "discardSignatureWithID:", v19);

  }
  -[SHStreamingSessionDriver setMatchingSignatureID:](self, "setMatchingSignatureID:", 0);
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSignatureOffset:", a5);

  -[SHStreamingSessionDriver setCurrentRequiredDuration:](self, "setCurrentRequiredDuration:", a4);
  if (a6 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHStreamingSessionDriver setIntermissionDeadline:](self, "setIntermissionDeadline:", v21);

    -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reset");

LABEL_14:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_15;
  }
  if (!-[SHStreamingSessionDriver canPerformMatch](self, "canPerformMatch"))
    goto LABEL_14;
  -[SHStreamingSessionDriver setIntermissionDeadline:](self, "setIntermissionDeadline:", 0);
  -[SHStreamingSessionDriver signatureForMatching](self, "signatureForMatching");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_ID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHStreamingSessionDriver setMatchingSignatureID:](self, "setMatchingSignatureID:", v27);

  os_unfair_lock_unlock(&self->_lock);
  if (v26)
  {
    -[SHStreamingSessionDriver sessionDriverDelegate](self, "sessionDriverDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "matchSignature:", v26);

  }
LABEL_15:

}

- (BOOL)canPerformMatch
{
  void *v3;
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[SHStreamingSessionDriver matchingSignatureID](self, "matchingSignatureID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentSignatureDuration");
    v7 = v6;
    -[SHStreamingSessionDriver currentRequiredDuration](self, "currentRequiredDuration");
    v4 = v7 >= v8;

  }
  return v4;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  id v32;

  v32 = a4;
  v5 = objc_msgSend(v32, "result");
  switch(v5)
  {
    case 1:
      objc_msgSend(v32, "retrySeconds");
      if (v9 == 0.0)
      {
        v8 = 1;
        goto LABEL_18;
      }
      objc_msgSend(v32, "retrySeconds");
      v11 = v10;
      break;
    case 2:
      objc_msgSend(v32, "retrySeconds");
      v13 = v12;
      objc_msgSend(v32, "recordingSignatureOffset");
      v11 = v13 - v14;
      break;
    case 3:
      objc_msgSend(v32, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "sh_isSignatureInvalid") & 1) == 0)
      {
        objc_msgSend(v32, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "sh_isSignatureDurationInvalid") & 1) != 0)
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v32, "error");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v19, "sh_isMatchAttemptFailed");

        }
        goto LABEL_16;
      }
      goto LABEL_11;
    default:
      v8 = 0;
      goto LABEL_18;
  }
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumSignatureDuration");
  if (v11 <= v15)
  {
    objc_msgSend(v32, "retrySeconds");
    v17 = v16;
    -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimumSignatureDuration");
    v8 = v17 < v18;
LABEL_16:

    goto LABEL_17;
  }
LABEL_11:
  v8 = 1;
LABEL_17:

LABEL_18:
  objc_msgSend(v32, "recordingSignatureOffset");
  if (v20 >= 0.0)
    v21 = v20;
  else
    v21 = 0.0;
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minimumSignatureDuration");
  v24 = v23;

  objc_msgSend(v32, "retrySeconds");
  if (v24 >= v25)
    v26 = v24;
  else
    v26 = v25;
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "maximumSignatureDuration");
  v29 = v28;

  if (v26 < v29)
    v29 = v26;
  objc_msgSend(v32, "signature");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "recordingIntermission");
  -[SHStreamingSessionDriver receivedSignature:retry:offset:intermission:dropCurrentSignature:](self, "receivedSignature:retry:offset:intermission:dropCurrentSignature:", v30, v8, v29, v21, v31);

}

- (id)signatureForMatching
{
  void *v3;
  void *v4;
  SHSignatureMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  SHSignatureMetrics *v9;

  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateCurrentSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [SHSignatureMetrics alloc];
  -[SHStreamingSessionDriver metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHStreamingSessionDriver signatureBuffer](self, "signatureBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signatureOffset");
  v9 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v5, "initWithSessionStartDate:signatureRecordingOffset:", v7);
  objc_msgSend(v4, "setMetrics:", v9);

  return v4;
}

- (SHSignatureMetrics)metrics
{
  SHSignatureMetrics *metrics;
  SHSignatureMetrics *v4;
  void *v5;
  SHSignatureMetrics *v6;
  SHSignatureMetrics *v7;

  metrics = self->_metrics;
  if (!metrics)
  {
    v4 = [SHSignatureMetrics alloc];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v4, "initWithSessionStartDate:signatureRecordingOffset:", v5, 0.0);
    v7 = self->_metrics;
    self->_metrics = v6;

    metrics = self->_metrics;
  }
  return metrics;
}

- (SHSessionDriverDelegate)sessionDriverDelegate
{
  return (SHSessionDriverDelegate *)objc_loadWeakRetained((id *)&self->_sessionDriverDelegate);
}

- (void)setSessionDriverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDriverDelegate, a3);
}

- (NSDate)intermissionDeadline
{
  return self->_intermissionDeadline;
}

- (void)setIntermissionDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_intermissionDeadline, a3);
}

- (double)currentRequiredDuration
{
  return self->_currentRequiredDuration;
}

- (void)setCurrentRequiredDuration:(double)a3
{
  self->_currentRequiredDuration = a3;
}

- (SHSignatureBuffer)signatureBuffer
{
  return self->_signatureBuffer;
}

- (void)setSignatureBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_signatureBuffer, a3);
}

- (NSUUID)matchingSignatureID
{
  return self->_matchingSignatureID;
}

- (void)setMatchingSignatureID:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSignatureID, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingSignatureID, 0);
  objc_storeStrong((id *)&self->_signatureBuffer, 0);
  objc_storeStrong((id *)&self->_intermissionDeadline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_sessionDriverDelegate);
}

@end
