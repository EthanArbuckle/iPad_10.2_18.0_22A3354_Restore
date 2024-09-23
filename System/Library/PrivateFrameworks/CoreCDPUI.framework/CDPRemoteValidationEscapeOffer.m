@implementation CDPRemoteValidationEscapeOffer

- (CDPRemoteValidationEscapeOffer)initWithCDPContext:(id)a3
{
  id v5;
  CDPRemoteValidationEscapeOffer *v6;
  uint64_t v7;
  NSMutableArray *escapeOptions;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPRemoteValidationEscapeOffer;
  v6 = -[CDPRemoteValidationEscapeOffer init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    escapeOptions = v6->_escapeOptions;
    v6->_escapeOptions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v6;
}

- (void)addEscapeOptionsObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:].cold.1();
  v5 = v4;
  -[NSMutableArray addObject:](self->_escapeOptions, "addObject:", v4);

}

- (id)escapeOptions
{
  return (id)-[NSMutableArray copy](self->_escapeOptions, "copy");
}

- (NSString)title
{
  NSString *title;

  title = self->_title;
  if (!title)
    title = self->_escapeOfferName;
  return title;
}

- (void)handleEscapeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CDPRemoteValidationEscapeOffer escapeOptions](self, "escapeOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {

    goto LABEL_8;
  }
  -[CDPRemoteValidationEscapeOffer escapeOptions](self, "escapeOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");

  if (v8 != 4)
  {
LABEL_8:
    v18 = (void *)MEMORY[0x24BEBD3B0];
    -[CDPRemoteValidationEscapeOffer title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer message](self, "message");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer titleTelemetryKey](self, "titleTelemetryKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer _makeEventForEscapeOptionSelectedWithKey:](self, "_makeEventForEscapeOptionSelectedWithKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendEvent:", v24);

    -[CDPRemoteValidationEscapeOffer escapeOptions](self, "escapeOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke;
    v31[3] = &unk_24C855028;
    v31[4] = self;
    v32 = v21;
    v27 = v4;
    v33 = v27;
    v10 = v21;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v31);

    -[CDPRemoteValidationEscapeOffer presentingViewController](self, "presentingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v26;
    v29[1] = 3221225472;
    v29[2] = __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke_2;
    v29[3] = &unk_24C854520;
    v29[4] = self;
    v30 = v27;
    objc_msgSend(v28, "presentViewController:animated:completion:", v10, 1, v29);

    goto LABEL_9;
  }
  -[CDPRemoteValidationEscapeOffer escapeOptions](self, "escapeOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleTelemetryKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer _makeEventForEscapeOptionSelectedWithKey:](self, "_makeEventForEscapeOptionSelectedWithKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", v13);

  objc_msgSend(v10, "escapeAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "escapeAction");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();

    objc_msgSend(v10, "titleTelemetryKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "titleTelemetryKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

    }
    -[CDPRemoteValidationEscapeOffer _sendEscapeOfferPresentedEventWithOptions:](self, "_sendEscapeOfferPresentedEventWithOptions:", v4);
  }
LABEL_9:

}

void __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t (**v4)(void);
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "canShowEscapeOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(v10, "canShowEscapeOption"),
        v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        v5 = v4[2](),
        v4,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_actionFromEscapeOption:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addAction:", v6);
    objc_msgSend(v10, "titleTelemetryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 48);
      objc_msgSend(v10, "titleTelemetryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
    if (objc_msgSend(v10, "style") == 3)
      objc_msgSend(*(id *)(a1 + 40), "setPreferredAction:", v6);

  }
}

uint64_t __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEscapeOfferPresentedEventWithOptions:", *(_QWORD *)(a1 + 40));
}

- (id)_actionFromEscapeOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPRemoteValidationEscapeOffer _styleForEscapeOption:](self, "_styleForEscapeOption:", v4);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke;
  v11[3] = &unk_24C8549E8;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke_2;
  v2[3] = &unk_24C854520;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performActionForEscapeOption:", *(_QWORD *)(a1 + 40));
}

- (void)_performActionForEscapeOption:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleTelemetryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer _makeEventForEscapeOptionSelectedWithKey:](self, "_makeEventForEscapeOptionSelectedWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v6);

  objc_msgSend(v9, "escapeAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "escapeAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
}

- (int64_t)_styleForEscapeOption:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "style");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (void)dismissOfferAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CDPRemoteValidationEscapeOffer presentingViewController](self, "presentingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v6);

}

- (void)_sendEscapeOfferPresentedEventWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A650], *MEMORY[0x24BE1A860]);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aaf_arrayAsCommaSeperatedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE1A648]);

    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", v5);

  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPRemoteValidationEscapeOffer _sendEscapeOfferPresentedEventWithOptions:].cold.1(v5);
  }

}

- (id)_makeEventForEscapeOptionSelectedWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE1A658]);

  return v6;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (NSString)escapeOfferName
{
  return self->_escapeOfferName;
}

- (void)setEscapeOfferName:(id)a3
{
  objc_storeStrong((id *)&self->_escapeOfferName, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)titleTelemetryKey
{
  return self->_titleTelemetryKey;
}

- (void)setTitleTelemetryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_titleTelemetryKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_escapeOfferName, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_escapeOptions, 0);
}

- (void)addEscapeOptionsObject:.cold.1()
{
  __assert_rtn("-[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:]", "CDPRemoteValidationEscapeOffer.m", 34, "object");
}

- (void)_sendEscapeOfferPresentedEventWithOptions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DC8F000, log, OS_LOG_TYPE_ERROR, "\"No escape options were presented.\", v1, 2u);
}

@end
