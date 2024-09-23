@implementation GTReplayUpdateAccelerationStructureSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateAccelerationStructureSession)initWithCoder:(id)a3
{
  id v4;
  GTReplayUpdateAccelerationStructureSession *v5;
  uint64_t v6;
  NSData *data;
  GTReplayUpdateAccelerationStructureSession *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayUpdateAccelerationStructureSession;
  v5 = -[GTReplayRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_sessionsID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sessionsID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateAccelerationStructureSession;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sessionsID, CFSTR("sessionsID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

- (unint64_t)sessionsID
{
  return self->_sessionsID;
}

- (void)setSessionsID:(unint64_t)a3
{
  self->_sessionsID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
