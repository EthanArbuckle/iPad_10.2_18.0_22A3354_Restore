@implementation GTReplayUpdateResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateResult)initWithCoder:(id)a3
{
  id v4;
  GTReplayUpdateResult *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *updatePipelines;
  uint64_t v12;
  NSError *error;
  GTReplayUpdateResult *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTReplayUpdateResult;
  v5 = -[GTReplayRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("updatedPipelines"));
    v10 = objc_claimAutoreleasedReturnValue();
    updatePipelines = v5->_updatePipelines;
    v5->_updatePipelines = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateResult;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatePipelines, CFSTR("updatedPipelines"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("error"));
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (NSDictionary)updatePipelines
{
  return self->_updatePipelines;
}

- (void)setUpdatePipelines:(id)a3
{
  objc_storeStrong((id *)&self->_updatePipelines, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatePipelines, 0);
}

@end
