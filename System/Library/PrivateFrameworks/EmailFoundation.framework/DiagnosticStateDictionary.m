@implementation DiagnosticStateDictionary

id ___DiagnosticStateDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@:%p> (%s)"), v7, v3, dispatch_queue_get_label(v4));

  return v8;
}

@end
