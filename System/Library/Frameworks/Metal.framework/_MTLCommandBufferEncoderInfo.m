@implementation _MTLCommandBufferEncoderInfo

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setErrorState:(int64_t)a3
{
  self->_errorState = a3;
}

- (void)setDebugSignposts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferEncoderInfo;
  -[_MTLCommandBufferEncoderInfo dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[_MTLCommandBufferEncoderInfo errorState](self, "errorState");
  if (v4 > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = (const __CFString *)*((_QWORD *)&off_1E0FE54C8 + v4);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<errorState: %@, label: %@, debugSignposts: %@>"), v5, -[_MTLCommandBufferEncoderInfo label](self, "label"), -[_MTLCommandBufferEncoderInfo debugSignposts](self, "debugSignposts"));
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setGlobalTraceObjectID:(unint64_t)a3
{
  self->_globalTraceObjectID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)debugSignposts
{
  return self->_debugSignposts;
}

- (int64_t)errorState
{
  return self->_errorState;
}

@end
