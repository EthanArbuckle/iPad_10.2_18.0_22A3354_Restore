@implementation AXMVisionEngineNode

+ (BOOL)isSupported
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    +[AXMVisionEngineNode isSupported].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (NSString)title
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    +[AXMVisionEngineNode isSupported].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return (NSString *)CFSTR("Unknown");
}

- (AXMVisionEngineNode)initWithIdentifier:(id)a3
{
  id v4;
  AXMVisionEngineNode *v5;
  uint64_t v6;
  NSString *identifier;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *nodeQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMVisionEngineNode;
  v5 = -[AXMVisionEngineNode init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("NodeQueue", v8);
    nodeQueue = v5->_nodeQueue;
    v5->_nodeQueue = (OS_dispatch_queue *)v9;

    v5->_enabled = 1;
    -[AXMVisionEngineNode nodeInitialize](v5, "nodeInitialize");
  }

  return v5;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionEngineNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AXMVisionEngineNode *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMNodeCodingKeyIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXMVisionEngineNode initWithIdentifier:](self, "initWithIdentifier:", v5);
  if (v6)
    v6->_enabled = objc_msgSend(v4, "decodeBoolForKey:", AXMNodeCodingKeyEnabled);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  -[AXMVisionEngineNode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, AXMNodeCodingKeyIdentifier);

  v5 = -[AXMVisionEngineNode isEnabled](self, "isEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", v5, AXMNodeCodingKeyEnabled);

}

- (void)connect:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[AXMVisionEngineNode isConnected](self, "isConnected"))
  {
    -[AXMVisionEngineNode setDelegate:](self, "setDelegate:", v4);
    -[AXMVisionEngineNode setConnected:](self, "setConnected:", 1);
  }

}

- (void)disconnect
{
  -[AXMVisionEngineNode setDelegate:](self, "setDelegate:", 0);
  -[AXMVisionEngineNode setConnected:](self, "setConnected:", 0);
}

- (BOOL)areDiagnosticsEnabled
{
  AXMVisionEngineNode *v2;
  void *v3;

  v2 = self;
  -[AXMVisionEngineNode delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "diagnosticsEnabled:", v2);

  return (char)v2;
}

- (id)axmDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionEngineNode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "isSupported"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (-[AXMVisionEngineNode requiresVisionFramework](self, "requiresVisionFramework"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (-[AXMVisionEngineNode isEnabled](self, "isEnabled"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  if (-[AXMVisionEngineNode isConnected](self, "isConnected"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: ID:'%@' title:'%@' supported:%@ needsVisionKit:%@ enabled:%@ connected:%@"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  objc_msgSend(v6, "axmIndentationString:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMVisionEngineNode axmDescription](self, "axmDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@%@\n"), v9, v8);

}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (AXMVisionEngineNodeConnectionDelegate)delegate
{
  return (AXMVisionEngineNodeConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)nodeQueue
{
  return self->_nodeQueue;
}

- (void)setNodeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nodeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)isSupported
{
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, a1, a3, "Subclass should override", a5, a6, a7, a8, 0);
}

@end
