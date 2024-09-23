@implementation GTTelemetryDeviceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryDeviceObject)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryDeviceObject *v5;
  uint64_t v6;
  GTTelemetryRecordObject *gpuTime;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryDeviceObject;
  v5 = -[GTTelemetryDeviceObject init](&v9, sel_init);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_commits = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("commits"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gpuTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    gpuTime = v5->_gpuTime;
    v5->_gpuTime = (GTTelemetryRecordObject *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef;
  id v5;

  streamRef = self->_streamRef;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", streamRef, CFSTR("streamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_commits, CFSTR("commits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gpuTime, CFSTR("gpuTime"));

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTelemetryDeviceObject;
  -[GTTelemetryDeviceObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (GTTelemetryRecordObject)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(id)a3
{
  objc_storeStrong((id *)&self->_gpuTime, a3);
}

- (unint64_t)commits
{
  return self->_commits;
}

- (void)setCommits:(unint64_t)a3
{
  self->_commits = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuTime, 0);
}

@end
