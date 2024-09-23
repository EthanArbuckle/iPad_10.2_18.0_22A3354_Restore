@implementation GTCaptureProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgress)initWithCoder:(id)a3
{
  id v4;
  GTCaptureProgress *v5;
  uint64_t v6;
  GTCaptureDescriptor *descriptor;
  uint64_t v8;
  GTCaptureProgressStatistics *stats;
  uint64_t v10;
  GTCaptureCompletionState *completionState;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTCaptureProgress;
  v5 = -[GTCaptureProgress init](&v15, sel_init);
  if (v5)
  {
    v5->_captureState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("captureState"));
    v5->_capturedCommandsBuffers = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("capturedCommandsBuffers"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (GTCaptureDescriptor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stats"));
    v8 = objc_claimAutoreleasedReturnValue();
    stats = v5->_stats;
    v5->_stats = (GTCaptureProgressStatistics *)v8;

    v10 = objc_opt_new();
    completionState = v5->_completionState;
    v5->_completionState = (GTCaptureCompletionState *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionState.archiveURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GTCaptureCompletionState setArchiveURL:](v5->_completionState, "setArchiveURL:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionState.error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GTCaptureCompletionState setError:](v5->_completionState, "setError:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t captureState;
  id v5;
  void *v6;
  id v7;

  captureState = self->_captureState;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", captureState, CFSTR("captureState"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_capturedCommandsBuffers, CFSTR("capturedCommandsBuffers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stats, CFSTR("stats"));
  -[GTCaptureCompletionState archiveURL](self->_completionState, "archiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("completionState.archiveURL"));

  -[GTCaptureCompletionState error](self->_completionState, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("completionState.error"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)GTCaptureProgress;
  -[GTCaptureProgress description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)captureState
{
  return self->_captureState;
}

- (void)setCaptureState:(unint64_t)a3
{
  self->_captureState = a3;
}

- (GTCaptureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (GTCaptureCompletionState)completionState
{
  return self->_completionState;
}

- (void)setCompletionState:(id)a3
{
  objc_storeStrong((id *)&self->_completionState, a3);
}

- (unint64_t)capturedCommandsBuffers
{
  return self->_capturedCommandsBuffers;
}

- (void)setCapturedCommandsBuffers:(unint64_t)a3
{
  self->_capturedCommandsBuffers = a3;
}

- (GTCaptureProgressStatistics)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_completionState, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
