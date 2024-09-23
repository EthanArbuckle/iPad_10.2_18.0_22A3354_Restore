@implementation AMSUIPaymentVerificationMetrics

- (AMSUIPaymentVerificationMetrics)initWithBag:(id)a3 appID:(id)a4
{
  id v7;
  id v8;
  AMSUIPaymentVerificationMetrics *v9;
  AMSUIPaymentVerificationMetrics *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIPaymentVerificationMetrics;
  v9 = -[AMSUIPaymentVerificationMetrics init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appID, a4);
    objc_storeStrong((id *)&v10->_bag, a3);
  }

  return v10;
}

- (void)enqueueEventWithPageId:(id)a3 displayReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[AMSUIPaymentVerificationMetrics bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_metricsInstanceWithBag:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationMetrics _propertiesWithPageId:displayReason:](self, "_propertiesWithPageId:displayReason:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addPropertiesWithDictionary:", v11);
  objc_msgSend(v12, "enqueueEvent:", v10);

}

- (void)enqueueEventWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  -[AMSUIPaymentVerificationMetrics bag](self, "bag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_metricsInstanceWithBag:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationMetrics _propertiesWithTargetId:pageId:displayReason:](self, "_propertiesWithTargetId:pageId:displayReason:", v10, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addPropertiesWithDictionary:", v14);
  objc_msgSend(v15, "enqueueEvent:", v13);

}

- (void)flushEvents
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_class();
  -[AMSUIPaymentVerificationMetrics bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_metricsInstanceWithBag:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "flush");
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE08260];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), v4);

  return v5;
}

+ (id)_event
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE08268]), "initWithTopic:", CFSTR("xp_its_main"));
}

- (id)_propertiesWithPageId:(id)a3 displayReason:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[6];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (v7
    || (-[AMSUIPaymentVerificationMetrics displayReason](self, "displayReason"),
        (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = CFSTR("displayReason");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  v15[0] = CFSTR("app");
  v15[1] = CFSTR("eventType");
  v9 = *MEMORY[0x24BE07EA8];
  v16[0] = CFSTR("commerce-app");
  v16[1] = v9;
  v15[2] = CFSTR("hostApp");
  -[AMSUIPaymentVerificationMetrics appID](self, "appID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  v16[3] = v8;
  v15[3] = CFSTR("pageDetails");
  v15[4] = CFSTR("pageId");
  if (v6)
    v11 = v6;
  else
    v11 = &stru_24CB5A078;
  v15[5] = CFSTR("pageType");
  v12 = *MEMORY[0x24BE07E98];
  v16[4] = v11;
  v16[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_propertiesWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[10];
  _QWORD v20[10];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (v10
    || (-[AMSUIPaymentVerificationMetrics displayReason](self, "displayReason"),
        (v10 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = CFSTR("displayReason");
    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1B8];
  }
  v19[0] = CFSTR("actionDetails");
  v19[1] = CFSTR("actionType");
  v20[0] = v11;
  v20[1] = CFSTR("navigate");
  v19[2] = CFSTR("app");
  v19[3] = CFSTR("eventType");
  v12 = *MEMORY[0x24BE07EA0];
  v20[2] = CFSTR("commerce-app");
  v20[3] = v12;
  v19[4] = CFSTR("hostApp");
  -[AMSUIPaymentVerificationMetrics appID](self, "appID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v13;
  v20[5] = v11;
  v19[5] = CFSTR("pageDetails");
  v19[6] = CFSTR("pageId");
  if (v9)
    v14 = v9;
  else
    v14 = &stru_24CB5A078;
  v15 = *MEMORY[0x24BE07E98];
  v20[6] = v14;
  v20[7] = v15;
  v19[7] = CFSTR("pageType");
  v19[8] = CFSTR("targetId");
  if (v8)
    v16 = v8;
  else
    v16 = &stru_24CB5A078;
  v19[9] = CFSTR("targetType");
  v20[8] = v16;
  v20[9] = CFSTR("button");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)displayReason
{
  return self->_displayReason;
}

- (void)setDisplayReason:(id)a3
{
  objc_storeStrong((id *)&self->_displayReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayReason, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
