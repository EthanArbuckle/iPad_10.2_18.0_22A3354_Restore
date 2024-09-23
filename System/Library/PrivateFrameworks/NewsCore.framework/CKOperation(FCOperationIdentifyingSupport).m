@implementation CKOperation(FCOperationIdentifyingSupport)

- (id)shortOperationDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "operationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)longOperationDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  FCStringFromQualityOfService(objc_msgSend(a1, "qualityOfService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromQueuePriority(objc_msgSend(a1, "queuePriority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(a1, "operationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@, qos=%@, priority=%@>"), v5, v6, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
