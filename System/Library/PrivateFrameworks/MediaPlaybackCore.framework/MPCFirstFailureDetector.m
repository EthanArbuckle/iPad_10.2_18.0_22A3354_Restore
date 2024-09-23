@implementation MPCFirstFailureDetector

- (MPCFirstFailureDetector)initWithSamplingTime:(double)a3 renderingLimit:(double)a4
{
  MPCFirstFailureDetector *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCFirstFailureDetector;
  result = -[MPCFirstFailureDetector init](&v7, sel_init);
  if (result)
  {
    result->_dT = a3;
    result->_limit = a4;
    result->_currentFailureStartSample = -1;
  }
  return result;
}

- (BOOL)processSample:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unint64_t currentSample;
  BOOL v8;
  int64_t v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  unint64_t currentFailureStartSample;
  MPCAudioFailure *v19;
  MPCAudioFailure *singleSampleFailure;
  double v21;
  MPCAudioFailure *v22;
  __int128 v24;

  v4 = a3;
  v5 = v4;
  ++self->_currentSample;
  switch(self->_state)
  {
    case 0:
      self->_state = 1;
      goto LABEL_3;
    case 1:
LABEL_3:
      objc_msgSend(v4, "time");
      if (v6 <= self->_limit)
        goto LABEL_28;
      currentSample = self->_currentSample;
      if (self->_currentFailureStartSample == -1)
        self->_currentFailureStartSample = currentSample;
      v8 = 1;
      self->_lastFailureSample = currentSample;
      self->_failureCount = 1;
      v9 = 2;
      goto LABEL_7;
    case 2:
      objc_msgSend(v4, "time");
      if (v10 >= self->_limit)
      {
        v11 = self->_currentSample;
        if (v11 - self->_lastFailureSample <= 4)
        {
          v12 = self->_failureCount + 1;
          self->_lastFailureSample = v11;
          self->_failureCount = v12;
          self->_state = 3;
          goto LABEL_14;
        }
      }
      objc_msgSend(v5, "time");
      if (v17 >= self->_limit)
        goto LABEL_28;
      currentFailureStartSample = self->_currentFailureStartSample;
      if (self->_currentSample - currentFailureStartSample < 5)
        goto LABEL_28;
      if (self->_singleSampleFailure)
        goto LABEL_26;
      +[MPCAudioFailure singleSampleFailure:duration:](MPCAudioFailure, "singleSampleFailure:duration:", self->_dT / 1000.0 * (double)currentFailureStartSample);
      v19 = (MPCAudioFailure *)objc_claimAutoreleasedReturnValue();
      singleSampleFailure = self->_singleSampleFailure;
      self->_singleSampleFailure = v19;
      goto LABEL_24;
    case 3:
      objc_msgSend(v4, "time");
      if (v13 < self->_limit || (v14 = self->_currentSample, v14 - self->_lastFailureSample > 4))
      {
        objc_msgSend(v5, "time");
        if (v21 >= self->_limit || self->_currentSample - self->_lastFailureSample < 5)
        {
LABEL_28:
          v8 = 0;
          goto LABEL_29;
        }
        if (!self->_multiSamplesFailure)
        {
          +[MPCAudioFailure multiSamplesFailure:duration:](MPCAudioFailure, "multiSamplesFailure:duration:", self->_dT / 1000.0 * (double)self->_currentFailureStartSample, self->_dT / 1000.0 * (double)self->_failureCount);
          v22 = (MPCAudioFailure *)objc_claimAutoreleasedReturnValue();
          singleSampleFailure = self->_multiSamplesFailure;
          self->_multiSamplesFailure = v22;
LABEL_24:

        }
        if (self->_singleSampleFailure)
        {
LABEL_26:
          if (self->_multiSamplesFailure)
          {
            v8 = 0;
            v9 = 4;
LABEL_7:
            self->_state = v9;
            goto LABEL_29;
          }
        }
        v8 = 0;
        self->_failureCount = 0;
        *(_QWORD *)&v24 = -1;
        *((_QWORD *)&v24 + 1) = -1;
        *(_OWORD *)&self->_currentFailureStartSample = v24;
        v9 = 1;
        goto LABEL_7;
      }
      v15 = self->_failureCount + 1;
      self->_lastFailureSample = v14;
      self->_failureCount = v15;
LABEL_14:
      v8 = 1;
LABEL_29:

      return v8;
    case 4:
      objc_msgSend(v4, "time");
      v8 = v16 > self->_limit;
      goto LABEL_29;
    default:
      goto LABEL_28;
  }
}

- (double)samplingTime
{
  return self->_dT;
}

- (MPCAudioFailure)singleSampleFailure
{
  return self->_singleSampleFailure;
}

- (MPCAudioFailure)multiSamplesFailure
{
  return self->_multiSamplesFailure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSamplesFailure, 0);
  objc_storeStrong((id *)&self->_singleSampleFailure, 0);
}

@end
