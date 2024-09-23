@implementation AMSUIWebJSProperties

- (AMSUIWebJSProperties)initWithContext:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AMSUIWebJSProperties *v8;
  AMSUIWebJSProperties *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebJSProperties;
  v8 = -[AMSUIWebJSProperties init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__lastConnectionReportDidChange_, *MEMORY[0x24BE07DF8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__accountStoreDidChange_, *MEMORY[0x24BDB3FB0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDE00], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BEBDDB8];
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDDB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDDF8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, v14, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDDE8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDE90], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__accessibilityPropertiesDidChange_, *MEMORY[0x24BEBDF60], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebJSProperties;
  -[AMSUIWebJSProperties dealloc](&v4, sel_dealloc);
}

- (id)generateProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE08340];
  -[AMSUIWebJSProperties _accountsProperties](self, "_accountsProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  -[AMSUIWebJSProperties _appearanceProperties](self, "_appearanceProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  -[AMSUIWebJSProperties _clientOptionsProperties](self, "_clientOptionsProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  -[AMSUIWebJSProperties _deviceProperties](self, "_deviceProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  -[AMSUIWebJSProperties _processProperties](self, "_processProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v8;
  -[AMSUIWebJSProperties _accessibilityProperties](self, "_accessibilityProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promiseWithAll:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__AMSUIWebJSProperties_generateProperties__block_invoke;
  v14[3] = &unk_24CB50D60;
  v14[4] = self;
  objc_msgSend(v11, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __42__AMSUIWebJSProperties_generateProperties__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "_pluginProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("accounts"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("appearance"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("clientData"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("device"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("process"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("accessibility"));
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5) & 1) != 0)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, &v26);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v26;
    if (-[NSObject length](v13, "length"))
    {
      v15 = (void *)MEMORY[0x24BE08340];
      -[NSObject base64EncodedStringWithOptions:](v13, "base64EncodedStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "promiseWithResult:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v24;
        _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode JS properties JSON data", buf, 0x16u);

      }
      v17 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode JS properties", buf, 0x16u);

    }
    v17 = 0;
  }

  return v17;
}

- (void)_accessibilityPropertiesDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[AMSUIWebJSProperties delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertiesDidChange:", self);

  -[AMSUIWebJSProperties context](self, "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "postEvent:options:", CFSTR("AccessibilityChange"), 0);

}

- (void)_accountStoreDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v4 = a3;
  -[AMSUIWebJSProperties context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountMediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB40B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB3ED0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_accountTypeIdentifierForMediaType:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) != 0)
  {

LABEL_10:
    -[AMSUIWebJSProperties context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reload");

    -[AMSUIWebJSProperties _accountsProperties](self, "_accountsProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __47__AMSUIWebJSProperties__accountStoreDidChange___block_invoke;
    v19[3] = &unk_24CB50B68;
    v19[4] = self;
    objc_msgSend(v18, "resultWithCompletion:", v19);

    goto LABEL_11;
  }
  v15 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE07E00]);

  if ((v15 & 1) != 0)
    goto LABEL_10;
LABEL_11:

}

void __47__AMSUIWebJSProperties__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to determine accounts properties.", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lastAccountsExport");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          objc_msgSend(*(id *)(a1 + 32), "lastAccountsExport"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isEqualToDictionary:", v5),
          v12,
          v11,
          (v13 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "propertiesDidChange:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dataProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v16, "postEvent:options:", CFSTR("AccountChange"), 0);

    }
  }

}

- (void)_lastConnectionReportDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AMSUIWebJSProperties__lastConnectionReportDidChange___block_invoke;
  block[3] = &unk_24CB4F0E8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __55__AMSUIWebJSProperties__lastConnectionReportDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesDidChange:", *(_QWORD *)(a1 + 32));

}

- (id)_accessibilityProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[18];
  _QWORD v25[20];

  v25[18] = *MEMORY[0x24BDAC8D0];
  v19 = (void *)MEMORY[0x24BE08340];
  v24[0] = CFSTR("buttonShapesEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper buttonShapesEnabled](AMSUIAccessibilityWrapper, "buttonShapesEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v24[1] = CFSTR("isBoldTextEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isBoldTextEnabled](AMSUIAccessibilityWrapper, "isBoldTextEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v22;
  v24[2] = CFSTR("isClosedCaptioningEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isClosedCaptioningEnabled](AMSUIAccessibilityWrapper, "isClosedCaptioningEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  v24[3] = CFSTR("isDarkerSystemColorsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isDarkerSystemColorsEnabled](AMSUIAccessibilityWrapper, "isDarkerSystemColorsEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v20;
  v24[4] = CFSTR("isGrayscaleEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isGrayscaleEnabled](AMSUIAccessibilityWrapper, "isGrayscaleEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v18;
  v24[5] = CFSTR("isInvertColorsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isInvertColorsEnabled](AMSUIAccessibilityWrapper, "isInvertColorsEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v17;
  v24[6] = CFSTR("isMonoAudioEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isMonoAudioEnabled](AMSUIAccessibilityWrapper, "isMonoAudioEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v16;
  v24[7] = CFSTR("isOnOffSwitchLabelsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isOnOffSwitchLabelsEnabled](AMSUIAccessibilityWrapper, "isOnOffSwitchLabelsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v15;
  v24[8] = CFSTR("isReduceMotionEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isReduceMotionEnabled](AMSUIAccessibilityWrapper, "isReduceMotionEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v14;
  v24[9] = CFSTR("isReduceTransparencyEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isReduceTransparencyEnabled](AMSUIAccessibilityWrapper, "isReduceTransparencyEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v13;
  v24[10] = CFSTR("isShakeToUndoEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isShakeToUndoEnabled](AMSUIAccessibilityWrapper, "isShakeToUndoEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v2;
  v24[11] = CFSTR("isSpeakScreenEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isSpeakScreenEnabled](AMSUIAccessibilityWrapper, "isSpeakScreenEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v3;
  v24[12] = CFSTR("isSpeakSelectionEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isSpeakSelectionEnabled](AMSUIAccessibilityWrapper, "isSpeakSelectionEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v4;
  v24[13] = CFSTR("isSwitchControlRunning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isSwitchControlRunning](AMSUIAccessibilityWrapper, "isSwitchControlRunning"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[13] = v5;
  v24[14] = CFSTR("isVideoAutoplayEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isVideoAutoplayEnabled](AMSUIAccessibilityWrapper, "isVideoAutoplayEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[14] = v6;
  v24[15] = CFSTR("isVoiceOverRunning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isVoiceOverRunning](AMSUIAccessibilityWrapper, "isVoiceOverRunning"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[15] = v7;
  v24[16] = CFSTR("prefersCrossFadeTransitions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper prefersCrossFadeTransitions](AMSUIAccessibilityWrapper, "prefersCrossFadeTransitions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[16] = v8;
  v24[17] = CFSTR("shouldDifferentiateWithoutColor");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper shouldDifferentiateWithoutColor](AMSUIAccessibilityWrapper, "shouldDifferentiateWithoutColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[17] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "promiseWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accountsProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
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
  void *v26;
  void *v27;
  void *v28;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDB4398];
  -[AMSUIWebJSProperties context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountMediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_sharedAccountStoreForMediaType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ams_activeiCloudAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_activeiTunesAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebJSProperties context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v8, "ams_localiTunesAccount");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  -[AMSUIWebJSProperties context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "JSAccountFromAccount:store:", v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("activeiCloud"));

  -[AMSUIWebJSProperties context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "JSAccountFromAccount:store:", v10, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("activeiTunes"));

  -[AMSUIWebJSProperties context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "JSAccountFromAccount:store:", v15, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("current"));

  objc_msgSend(v9, "ams_DSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v10, "ams_DSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v9, "ams_DSID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ams_DSID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v24, "isEqualToNumber:", v25);

    }
    else
    {
      v22 = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isCombinedAccount"));

  v27 = (void *)objc_msgSend(v3, "copy");
  -[AMSUIWebJSProperties setLastAccountsExport:](self, "setLastAccountsExport:", v27);

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_appearanceProperties
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  AMSUIWebJSProperties *v8;

  v3 = objc_alloc_init(MEMORY[0x24BE08340]);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[AMSUIWebJSProperties _appearancePropertiesDictionary](self, "_appearancePropertiesDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v4);

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__AMSUIWebJSProperties__appearanceProperties__block_invoke;
    v6[3] = &unk_24CB4F4C0;
    v7 = v3;
    v8 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
  return v3;
}

void __45__AMSUIWebJSProperties__appearanceProperties__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appearancePropertiesDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:", v2);

}

- (id)_appearancePropertiesDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSProperties context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v14 = CFSTR("tintColor");
  -[AMSUIWebJSProperties _hexStringFromColor:](self, "_hexStringFromColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_clientOptionsProperties
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSProperties context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientOptions");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BDBD1B8];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot serialize client options", (uint8_t *)&v13, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

- (id)_deviceProperties
{
  int has_internal_content;
  const __CFString *v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  const __CFString *v10;

  has_internal_content = os_variant_has_internal_content();
  v3 = CFSTR("customer");
  if (has_internal_content)
    v3 = CFSTR("internal");
  v4 = (void *)MEMORY[0x24BE08340];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AMSUIWebJSProperties__deviceProperties__block_invoke;
  block[3] = &unk_24CB4F0E8;
  v10 = v3;
  if (_deviceProperties_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_deviceProperties_ams_once_token___COUNTER__, block);
  v5 = (__CFString *)v10;
  v6 = (id)_deviceProperties_ams_once_object___COUNTER__;

  objc_msgSend(v4, "promiseWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __41__AMSUIWebJSProperties__deviceProperties__block_invoke(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  Class (*v46)(uint64_t);
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[20];
  _QWORD v54[22];

  v54[20] = *MEMORY[0x24BDAC8D0];
  v54[0] = *(_QWORD *)(a1 + 32);
  v53[0] = CFSTR("buildType");
  v53[1] = CFSTR("buildVersion");
  objc_msgSend(MEMORY[0x24BE08118], "buildVersion");
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v1 = v43;
  if (!v43)
    v1 = &stru_24CB5A078;
  v54[1] = v1;
  v53[2] = CFSTR("isPassLibraryAvailable");
  v2 = (void *)MEMORY[0x24BDD16E0];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v3 = (void *)getPKPassLibraryClass_softClass_0;
  v52 = getPKPassLibraryClass_softClass_0;
  if (!getPKPassLibraryClass_softClass_0)
  {
    v44 = MEMORY[0x24BDAC760];
    v45 = 3221225472;
    v46 = __getPKPassLibraryClass_block_invoke_0;
    v47 = &unk_24CB4F3E8;
    v48 = &v49;
    __getPKPassLibraryClass_block_invoke_0((uint64_t)&v44);
    v3 = (void *)v50[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v49, 8);
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "isPassLibraryAvailable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v42;
  v53[3] = CFSTR("guid");
  objc_msgSend(MEMORY[0x24BE08118], "deviceGUID");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v41;
  if (!v41)
    v5 = &stru_24CB5A078;
  v54[3] = v5;
  v53[4] = CFSTR("isApplePayAvailable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE08118], "isSecureElementAvailable"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v40;
  v53[5] = CFSTR("isBundle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE08118], "deviceIsBundle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v39;
  v53[6] = CFSTR("isCameraSupported");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BE27E40], "supportedCameraCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v54[6] = v38;
  v53[7] = CFSTR("videoAuthorizationStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(MEMORY[0x24BDB2460], "authorizationStatusForMediaType:", *MEMORY[0x24BDB1D50]));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v54[7] = v37;
  v53[8] = CFSTR("isDiagnosticsSubmissionAllowed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE08260], "diagnosticsSubmissionAllowed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v54[8] = v36;
  v53[9] = CFSTR("canMakePayments");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v7 = (void *)getPKPaymentAuthorizationControllerClass_softClass_0;
  v52 = getPKPaymentAuthorizationControllerClass_softClass_0;
  if (!getPKPaymentAuthorizationControllerClass_softClass_0)
  {
    v44 = MEMORY[0x24BDAC760];
    v45 = 3221225472;
    v46 = __getPKPaymentAuthorizationControllerClass_block_invoke_0;
    v47 = &unk_24CB4F3E8;
    v48 = &v49;
    __getPKPaymentAuthorizationControllerClass_block_invoke_0((uint64_t)&v44);
    v7 = (void *)v50[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v49, 8);
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "canMakePayments"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v54[9] = v35;
  v53[10] = CFSTR("isGreenTea");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54[10] = v34;
  v53[11] = CFSTR("isScreenReaderRunning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AMSUIAccessibilityWrapper isVoiceOverRunning](AMSUIAccessibilityWrapper, "isVoiceOverRunning"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54[11] = v9;
  v53[12] = CFSTR("isWalletBiometricsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE08118], "isWalletBiometricsEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[12] = v10;
  v53[13] = CFSTR("language");
  objc_msgSend(MEMORY[0x24BE08118], "language");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_24CB5A078;
  if (v11)
    v13 = (const __CFString *)v11;
  v54[13] = v13;
  v53[14] = CFSTR("os");
  objc_msgSend(MEMORY[0x24BE08118], "operatingSystem");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_24CB5A078;
  if (v14)
    v16 = (const __CFString *)v14;
  v54[14] = v16;
  v53[15] = CFSTR("osVersion");
  objc_msgSend(MEMORY[0x24BE08118], "productVersion");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = &stru_24CB5A078;
  if (v17)
    v19 = (const __CFString *)v17;
  v54[15] = v19;
  v53[16] = CFSTR("productType");
  objc_msgSend(MEMORY[0x24BE08118], "productType");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = &stru_24CB5A078;
  if (v20)
    v22 = (const __CFString *)v20;
  v54[16] = v22;
  v53[17] = CFSTR("regionCode");
  objc_msgSend(MEMORY[0x24BE08118], "regionCode");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = &stru_24CB5A078;
  if (v23)
    v25 = (const __CFString *)v23;
  v54[17] = v25;
  v53[18] = CFSTR("secureElementID");
  objc_msgSend(MEMORY[0x24BE08118], "secureElementID");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = &stru_24CB5A078;
  if (v26)
    v28 = (const __CFString *)v26;
  v54[18] = v28;
  v53[19] = CFSTR("serial");
  objc_msgSend(MEMORY[0x24BE08118], "serialNumber");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = &stru_24CB5A078;
  if (v29)
    v31 = (const __CFString *)v29;
  v54[19] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 20);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_deviceProperties_ams_once_object___COUNTER__;
  _deviceProperties_ams_once_object___COUNTER__ = v32;

}

- (id)_pluginProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  AMSUIWebJSProperties *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v29 = self;
  -[AMSUIWebJSProperties context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedPlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v33;
    v11 = 0x24BE08000uLL;
    *(_QWORD *)&v8 = 138543874;
    v28 = v8;
    do
    {
      v12 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        objc_msgSend(v13, "globalName", v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(*(id *)(v11 + 472), "sharedWebUIConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(*(id *)(v11 + 472), "sharedConfig");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "OSLogObject");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = v3;
            v20 = v10;
            v21 = v11;
            v22 = objc_opt_class();
            -[AMSUIWebJSProperties context](v29, "context");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logKey");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "globalName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v37 = v22;
            v38 = 2114;
            v39 = v24;
            v40 = 2114;
            v41 = v25;
            _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Skipping plugin with duplicate global name: %{public}@", buf, 0x20u);

            v11 = v21;
            v10 = v20;
            v3 = v19;
            v9 = v30;
          }
        }
        else
        {
          objc_msgSend(v13, "generateGlobalProperties");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "globalName");
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSObject lowercaseString](v18, "lowercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v26);

        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)_processProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE08340];
  v12[0] = CFSTR("client");
  -[AMSUIWebJSProperties context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebJSProperties _propertiesForClientInfo:](self, "_propertiesForClientInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("current");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebJSProperties _propertiesForClientInfo:](self, "_propertiesForClientInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_propertiesForClientInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("accountMediaType");
  v3 = a3;
  objc_msgSend(v3, "accountMediaType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24CB5A078;
  v21[0] = v6;
  v20[1] = CFSTR("bundleIdentifier");
  objc_msgSend(v3, "bundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CB5A078;
  v21[1] = v9;
  v20[2] = CFSTR("bundleVersion");
  objc_msgSend(v3, "clientVersion");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_24CB5A078;
  v21[2] = v12;
  v20[3] = CFSTR("executableName");
  objc_msgSend(v3, "executableName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_24CB5A078;
  v21[3] = v15;
  v20[4] = CFSTR("proxyApp");
  objc_msgSend(v3, "proxyAppBundleID");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = &stru_24CB5A078;
  v21[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_hexStringFromColor:(id)a3
{
  float v3;
  unint64_t v4;
  float v5;
  unint64_t v6;
  float v7;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  if (!a3)
    return &stru_24CB5A078;
  v11 = 0.0;
  v12 = 0.0;
  v10 = 0.0;
  v9 = 0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v3 = v12 * 255.0;
  v4 = llroundf(v3);
  v5 = v11 * 255.0;
  v6 = llroundf(v5);
  v7 = v10 * 255.0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX"), v4, v6, llroundf(v7));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AMSUIWebJSPropertiesDelegate)delegate
{
  return (AMSUIWebJSPropertiesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSDictionary)lastAccountsExport
{
  return self->_lastAccountsExport;
}

- (void)setLastAccountsExport:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccountsExport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccountsExport, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
