@implementation HMDLoggingEventForwarder

- (HMDLoggingEventForwarder)initWithEventForwarder:(id)a3 logEventSubmitter:(id)a4
{
  id v7;
  id v8;
  HMDLoggingEventForwarder *v9;
  HMDLoggingEventForwarder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDLoggingEventForwarder;
  v9 = -[HMDLoggingEventForwarder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventForwarder, a3);
    objc_storeStrong((id *)&v10->_logEventSubmitter, a4);
  }

  return v10;
}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  id v11;
  HMDEventRouterPostedEventLogEvent *v12;
  SEL v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v10 = a5;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v9, 8, 1), "forwardEvent:topic:completion:", v14, v8, v10);
    v11 = v8;
    v12 = -[HMDEventRouterPostedEventLogEvent initWithTopic:]([HMDEventRouterPostedEventLogEvent alloc], "initWithTopic:", v11);

    objc_msgSend(objc_getProperty(self, v13, 16, 1), "submitLogEvent:", v12);
  }
  else
  {
    objc_msgSend(0, "forwardEvent:topic:completion:", v14, v8, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
}

@end
