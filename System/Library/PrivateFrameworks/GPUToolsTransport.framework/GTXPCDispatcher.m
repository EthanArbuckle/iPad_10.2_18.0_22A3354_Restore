@implementation GTXPCDispatcher

- (GTXPCDispatcher)initWithProtocolMethods:(id)a3
{
  id v4;
  GTXPCDispatcher *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSSet *protocolMethods;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTXPCDispatcher;
  v5 = -[GTXPCDispatcher init](&v11, sel_init);
  if (v5)
  {
    v6 = os_log_create("com.apple.gputools.transport", "GTXPCDispatcher");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSSet *)v8;

  }
  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  const char *string;
  void *v9;
  void *v10;
  NSString *v11;
  NSObject *log;

  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "_cmd");
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSet containsObject:](self->_protocolMethods, "containsObject:", v9))
    {
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("_"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR(":replyConnection:"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();

      -[GTXPCDispatcher performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", NSSelectorFromString(v11), v6, v7);
    }

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[GTXPCDispatcher dispatchMessage:replyConnection:].cold.1(log);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolMethods, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)dispatchMessage:(os_log_t)log replyConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D095000, log, OS_LOG_TYPE_DEBUG, "Malformed message: missing selector", v1, 2u);
}

@end
