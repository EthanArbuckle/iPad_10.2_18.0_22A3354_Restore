@implementation FSFCurareInteractionSELFStream

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("SELF stream does not support insertion"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (id)retrieve:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve___block_invoke;
  v9[3] = &unk_24CDD2008;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[FSFCurareInteractionSELFStream retrieveWithCompletionHandler:](self, "retrieveWithCompletionHandler:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve_completionHandler___block_invoke;
  v7[3] = &unk_24CDD2030;
  v8 = v5;
  v6 = v5;
  -[FSFCurareInteractionSELFStream retrieveWithCompletionHandler:](self, "retrieveWithCompletionHandler:", v7);

}

uint64_t __83__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (FSFCurareInteractionSELFStream)initWithFilter:(id)a3
{
  FSFCurareInteractionSELFStream *result;

  CurareInteractionSELFStream.init(filter:)(a3);
  OUTLINED_FUNCTION_20_1();
  return result;
}

- (void)retrieveWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  FSFCurareInteractionSELFStream *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve(), v5);
}

- (FSFCurareInteractionSELFStream)init
{
  CurareInteractionSELFStream.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___FSFCurareInteractionSELFStream_logger;
  v4 = OUTLINED_FUNCTION_10_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)self + OBJC_IVAR___FSFCurareInteractionSELFStream_provider, &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
}

@end
