@implementation ProxyTelemetryBatchRequest

void __ProxyTelemetryBatchRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *nsobject_classes;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  v13 = a2;
  v5 = a3;
  if (v13)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v13, "response", v9);

  }
  else
  {
    nsobject_classes = (void *)objc_opt_new();
    objc_msgSend(nsobject_classes, "setError:", v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, nsobject_classes);

  }
  objc_msgSend(*(id *)(a1 + 40), "completed");

}

@end
