@implementation HPSHomeKitSettingHelper

+ (id)fixUpTapAssistanceSelection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  HPSConstrainedNumberSetting *v13;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(MEMORY[0x24BE006C0], "hps_tapActivationMethodFromString:", v6);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDBCAB0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ value should not be a %@"), v4, v9);
    v8 = v6;
    goto LABEL_5;
  }
LABEL_6:
  v13 = -[HPSConstrainedNumberSetting initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:]([HPSConstrainedNumberSetting alloc], "initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:", v4, v8, &unk_24F9C44E0, &unk_24F9C44F8, &unk_24F9C4510);

  return v13;
}

+ (id)fixUpSpeakingRate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  HPSConstrainedNumberSetting *v9;
  void *v10;
  HPSConstrainedNumberSetting *v11;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ should not be a %@"), v4, v8);

  }
  v9 = [HPSConstrainedNumberSetting alloc];
  objc_msgSend(v3, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HPSConstrainedNumberSetting initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:](v9, "initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:", v4, v10, &unk_24F9C4528, &unk_24F9C4510, &unk_24F9C4570);

  return v11;
}

+ (id)fixUpTimeoutInterval:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  HPSConstrainedNumberSetting *v9;
  void *v10;
  HPSConstrainedNumberSetting *v11;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ should not be a %@"), v4, v8);

  }
  v9 = [HPSConstrainedNumberSetting alloc];
  objc_msgSend(v3, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HPSConstrainedNumberSetting initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:](v9, "initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:", v4, v10, &unk_24F9C4580, &unk_24F9C4590, &unk_24F9C45A0);

  return v11;
}

+ (id)fixUpIgnoreRepeat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  HPSConstrainedNumberSetting *v9;
  void *v10;
  HPSConstrainedNumberSetting *v11;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ should not be a %@"), v4, v8);

  }
  v9 = [HPSConstrainedNumberSetting alloc];
  objc_msgSend(v3, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HPSConstrainedNumberSetting initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:](v9, "initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:", v4, v10, &unk_24F9C45B0, &unk_24F9C4540, &unk_24F9C45B0);

  return v11;
}

+ (id)fixUpHoldDuration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  HPSConstrainedNumberSetting *v9;
  void *v10;
  HPSConstrainedNumberSetting *v11;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ should not be a %@"), v4, v8);

  }
  v9 = [HPSConstrainedNumberSetting alloc];
  objc_msgSend(v3, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HPSConstrainedNumberSetting initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:](v9, "initWithKeyPath:numberValue:minimumValue:maximumValue:stepValue:", v4, v10, &unk_24F9C45B0, &unk_24F9C4540, &unk_24F9C45B0);

  return v11;
}

+ (id)fixUpAutoAdjustSiriVolumeEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ should not be a %@"), v4, v8);

  }
  +[HPSBooleanSetting settingWithKeyPath:BOOLeanValue:](HPSBooleanSetting, "settingWithKeyPath:BOOLeanValue:", v4, objc_msgSend(v3, "BOOLeanValue") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)compatibleReadSetting:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  SEL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id location;
  _BYTE buf[12];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = v4;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[؋ objectForKey:](&unk_24F9C4648, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (v8 = NSSelectorFromString(v6), (objc_opt_respondsToSelector() & 1) != 0))
  {
    _HPSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[HPSHomeKitSettingHelper compatibleReadSetting:]";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_22DF16000, v9, OS_LOG_TYPE_INFO, "%s fixing up %@", buf, 0x16u);
    }

    v10 = (void *)MEMORY[0x24BDBCE98];
    objc_msgSend(a1, "methodSignatureForSelector:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invocationWithMethodSignature:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setTarget:", a1);
    objc_msgSend(v12, "setSelector:", v8);
    objc_msgSend(v12, "setArgument:atIndex:", &location, 2);
    objc_msgSend(v12, "invoke");
    *(_QWORD *)buf = 0;
    objc_msgSend(v12, "getReturnValue:", buf);
    objc_storeStrong(&location, *(id *)buf);
    v13 = location;

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

+ (id)compatibleWriteSetting:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  SEL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id location;
  _BYTE buf[12];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = v4;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[؋ objectForKey:](&unk_24F9C4670, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (v8 = NSSelectorFromString(v6), (objc_opt_respondsToSelector() & 1) != 0))
  {
    _HPSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[HPSHomeKitSettingHelper compatibleWriteSetting:]";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_22DF16000, v9, OS_LOG_TYPE_INFO, "%s fixing up %@", buf, 0x16u);
    }

    v10 = (void *)MEMORY[0x24BDBCE98];
    objc_msgSend(a1, "methodSignatureForSelector:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invocationWithMethodSignature:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setTarget:", a1);
    objc_msgSend(v12, "setSelector:", v8);
    objc_msgSend(v12, "setArgument:atIndex:", &location, 2);
    objc_msgSend(v12, "invoke");
    *(_QWORD *)buf = 0;
    objc_msgSend(v12, "getReturnValue:", buf);
    objc_storeStrong(&location, *(id *)buf);
    v13 = location;

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

+ (id)compatibleReadResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HPSResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "compatibleReadSetting:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v6)
    {
      v7 = [HPSResult alloc];
      objc_msgSend(v4, "accessoryIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HPSResult initWithSetting:accessoryIdentifier:error:result:](v7, "initWithSetting:accessoryIdentifier:error:result:", v6, v8, v9, objc_msgSend(v4, "isSuccess"));

      v4 = (id)v10;
    }

  }
  return v4;
}

+ (id)compatibleReadResults:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HPSHomeKitSettingHelper_compatibleReadResults___block_invoke;
  v9[3] = &unk_24F9AF478;
  v11 = &v13;
  v12 = a1;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v6 = (void *)v14[5];
  if (!v6)
    v6 = v5;
  v7 = v6;

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__HPSHomeKitSettingHelper_compatibleReadResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "compatibleReadResult:", v6);
  v12 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v12;
  if ((id)v12 != v6)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v12);
    v7 = (void *)v12;
  }

}

@end
