@implementation GTReplayUpdateTermination

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateTermination)initWithCoder:(id)a3
{
  GTReplayUpdateTermination *v3;
  GTReplayUpdateTermination *v4;
  GTReplayUpdateTermination *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTReplayUpdateTermination;
  v3 = -[GTReplayRequest initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTReplayUpdateTermination;
  -[GTReplayRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (OS_xpc_object)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
