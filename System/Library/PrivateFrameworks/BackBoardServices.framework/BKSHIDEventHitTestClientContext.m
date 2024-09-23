@implementation BKSHIDEventHitTestClientContext

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[BKSHIDEventHitTestClientContext init](+[BKSHIDEventHitTestClientContext allocWithZone:](BKSHIDEventHitTestClientContext, "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_pid;
  *((_DWORD *)result + 3) = self->_contextID;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid:%d contextID:%X"), self->_pid, self->_contextID);
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_pid == v4[2] && self->_contextID == v4[3];

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_contextID, CFSTR("contextID"));

}

- (BKSHIDEventHitTestClientContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  BKSHIDEventHitTestClientContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventHitTestClientContext;
  v5 = -[BKSHIDEventHitTestClientContext init](&v7, sel_init);
  if (v5)
  {
    v5->_pid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pid"));
    v5->_contextID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("contextID"));
  }

  return v5;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2270 != -1)
    dispatch_once(&protobufSchema_onceToken_2270, block);
  return (id)protobufSchema_schema_2271;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

void __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_2272);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_2271;
  protobufSchema_schema_2271 = v1;

}

void __49__BKSHIDEventHitTestClientContext_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_pid");
  objc_msgSend(v2, "addField:", "_contextID");

}

@end
