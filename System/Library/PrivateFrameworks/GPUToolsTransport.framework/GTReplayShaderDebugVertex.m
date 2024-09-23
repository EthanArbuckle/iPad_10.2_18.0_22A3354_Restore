@implementation GTReplayShaderDebugVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugVertex)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugVertex *v5;
  uint64_t v6;
  NSArray *vertexIDs;
  GTReplayShaderDebugVertex *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugVertex;
  v5 = -[GTReplayShaderDebugRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("VertexIDs"));
    v6 = objc_claimAutoreleasedReturnValue();
    vertexIDs = v5->_vertexIDs;
    v5->_vertexIDs = (NSArray *)v6;

    v5->_instanceID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("InstanceID"));
    v5->_amplificationID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AmplificationID"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugVertex;
  v4 = a3;
  -[GTReplayShaderDebugRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vertexIDs, CFSTR("VertexIDs"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_instanceID, CFSTR("InstanceID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_amplificationID, CFSTR("AmplificationID"));

}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(unsigned int)a3
{
  self->_instanceID = a3;
}

- (unsigned)amplificationID
{
  return self->_amplificationID;
}

- (void)setAmplificationID:(unsigned int)a3
{
  self->_amplificationID = a3;
}

- (NSArray)vertexIDs
{
  return self->_vertexIDs;
}

- (void)setVertexIDs:(id)a3
{
  objc_storeStrong((id *)&self->_vertexIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexIDs, 0);
}

@end
