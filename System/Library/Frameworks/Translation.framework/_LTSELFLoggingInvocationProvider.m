@implementation _LTSELFLoggingInvocationProvider

+ (id)startInvocationWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 translateAppContext:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  _LTSELFLoggingInvocation *v12;
  _LTSELFLoggingInvocationOptions *v13;
  _LTSELFLoggingEventData *v14;
  void *v15;
  _LTSELFLoggingEventData *v16;

  v9 = (objc_class *)MEMORY[0x24BDD1880];
  v10 = a6;
  v11 = objc_alloc_init(v9);
  v12 = -[_LTSELFLoggingInvocation initWithInvocationId:]([_LTSELFLoggingInvocation alloc], "initWithInvocationId:", v11);
  v13 = -[_LTSELFLoggingInvocationOptions initWithTask:inputMode:invocationType:translateAppContext:]([_LTSELFLoggingInvocationOptions alloc], "initWithTask:inputMode:invocationType:translateAppContext:", a3, a4, a5, v10);

  v14 = [_LTSELFLoggingEventData alloc];
  -[_LTSELFLoggingInvocation invocationId](v12, "invocationId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_LTSELFLoggingEventData initWithType:invocationId:](v14, "initWithType:invocationId:", 1, v15);

  -[_LTSELFLoggingEventData setStartInvocationOptions:](v16, "setStartInvocationOptions:", v13);
  +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v16);

  return v12;
}

@end
