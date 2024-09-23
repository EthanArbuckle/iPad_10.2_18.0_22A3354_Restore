@implementation NSOperation(FCOperationIdentifyingSupport)

- (uint64_t)shortOperationDescription
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), objc_opt_class());
}

- (id)longOperationDescription
{
  void *v2;
  void *v3;
  void *v4;

  FCStringFromQualityOfService(objc_msgSend(a1, "qualityOfService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromQueuePriority(objc_msgSend(a1, "queuePriority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ qos=%@, priority=%@>"), objc_opt_class(), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
