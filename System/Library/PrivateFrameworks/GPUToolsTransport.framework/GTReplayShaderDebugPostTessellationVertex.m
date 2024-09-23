@implementation GTReplayShaderDebugPostTessellationVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugPostTessellationVertex)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugPostTessellationVertex *v5;
  uint64_t v6;
  NSArray *patchIDs;
  GTReplayShaderDebugPostTessellationVertex *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugPostTessellationVertex;
  v5 = -[GTReplayShaderDebugRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PatchIDs"));
    v6 = objc_claimAutoreleasedReturnValue();
    patchIDs = v5->_patchIDs;
    v5->_patchIDs = (NSArray *)v6;

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
  v5.super_class = (Class)GTReplayShaderDebugPostTessellationVertex;
  v4 = a3;
  -[GTReplayShaderDebugRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_patchIDs, CFSTR("PatchIDs"), v5.receiver, v5.super_class);
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

- (NSArray)patchIDs
{
  return self->_patchIDs;
}

- (void)setPatchIDs:(id)a3
{
  objc_storeStrong((id *)&self->_patchIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patchIDs, 0);
}

@end
