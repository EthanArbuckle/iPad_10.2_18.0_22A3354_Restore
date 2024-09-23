@implementation IDSAWDLogger

+ (id)logger
{
  return objc_alloc_init((Class)a1);
}

- (void)logMetric:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  id v17;

  v3 = a3;
  objc_msgSend_sharedInstance(IDSAWDLogging, v4, v5, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_awdRepresentation(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_awdIdentifier(v3, v11, v12, v13);

  objc_msgSend_submitMetric_withIdentifier_(v17, v15, (uint64_t)v10, v16, v14);
}

@end
