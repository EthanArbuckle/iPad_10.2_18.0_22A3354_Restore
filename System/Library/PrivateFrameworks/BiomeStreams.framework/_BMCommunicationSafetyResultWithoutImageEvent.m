@implementation _BMCommunicationSafetyResultWithoutImageEvent

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v7 = (objc_class *)_BMCommunicationSafetyResultWithoutImageEvent_v2;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
    goto LABEL_9;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[BMCommunicationSafetyResultEvent eventWithData:dataVersion:].cold.1();

  v8 = 0;
LABEL_9:

  return v8;
}

- (_BMCommunicationSafetyResultWithoutImageEvent)initWithProtoData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_BMCommunicationSafetyResultWithoutImageEvent;
  return -[BMCommunicationSafetyResultEvent initWithProtoData:skipImage:](&v4, sel_initWithProtoData_skipImage_, a3, 1);
}

@end
