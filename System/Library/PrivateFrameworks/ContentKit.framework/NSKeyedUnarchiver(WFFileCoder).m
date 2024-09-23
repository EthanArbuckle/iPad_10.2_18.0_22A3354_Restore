@implementation NSKeyedUnarchiver(WFFileCoder)

- (id)wf_unarchiveRootObjectAndFinishWithAllowedClasses:()WFFileCoder
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", a3, *MEMORY[0x24BDD0E88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "finishDecoding");
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFWorkflowExecutionLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(a1, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[NSKeyedUnarchiver(WFFileCoder) wf_unarchiveRootObjectAndFinishWithAllowedClasses:]";
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_FAULT, "%s Error while unarchiving object: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  return v4;
}

+ (id)wf_securelyUnarchiveObjectWithData:()WFFileCoder allowedClasses:completionHandler:
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v7)
  {
    v23 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, &v23);
    v12 = v23;
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFFileCoder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWfFileCoder:", v13);

    objc_msgSend(v11, "wfFileCoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "wfFileCoder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __102__NSKeyedUnarchiver_WFFileCoder__wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler___block_invoke;
      v19[3] = &unk_24C4E2DD0;
      v22 = v10;
      v20 = v11;
      v21 = v8;
      objc_msgSend(v15, "waitForFileAvailabilityWithCompletionHandler:", v19);

      v16 = v22;
    }
    else
    {
      objc_msgSend(v11, "wf_unarchiveRootObjectAndFinishWithAllowedClasses:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v16);
    }

    objc_msgSend(v11, "wfFileCoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v17 = 0;
  }

  return v17;
}

@end
