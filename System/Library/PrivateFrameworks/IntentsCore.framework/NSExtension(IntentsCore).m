@implementation NSExtension(IntentsCore)

- (void)_intents_startExtensionConnectionWithExtensionInputItems:()IntentsCore intent:queue:completion:
{
  id v10;
  id v11;
  id v12;
  id v13;
  __int16 v14;
  os_log_t *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(a1, "_plugIn");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v42, "userElection");
  v15 = (os_log_t *)MEMORY[0x1E0CBD670];
  v43 = v11;
  if ((v14 & 0x100) != 0)
  {
    v19 = *MEMORY[0x1E0CBD670];
    v17 = v10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      v55 = 2112;
      v56 = a1;
      _os_log_impl(&dword_1B727D000, v19, OS_LOG_TYPE_INFO, "%s Extension loading timeout disabled for %@ for debugging.", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0CBDD00]);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke;
    v48[3] = &unk_1E6BC4AB8;
    v17 = v10;
    v49 = v10;
    v50 = v12;
    v18 = (void *)objc_msgSend(v16, "initWithTimeoutInterval:onQueue:timeoutHandler:", v11, v48, 10.0);

  }
  objc_msgSend(v18, "start");
  v20 = os_signpost_id_generate(*v15);
  v21 = *v15;
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    objc_msgSend(a1, "identifier");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v23;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "INSignpostExtensionLaunch", "%@", buf, 0xCu);

  }
  v47 = 0;
  objc_msgSend(a1, "beginExtensionRequestWithOptions:inputItems:error:", 1, v13, &v47);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v47;
  v26 = *v15;
  v27 = v26;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    objc_msgSend(a1, "identifier");
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v28;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v27, OS_SIGNPOST_INTERVAL_END, v20, "INSignpostExtensionLaunch", "%@", buf, 0xCu);

  }
  objc_msgSend(v18, "cancel");
  if (!v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_22;
    v34 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      v55 = 2114;
      v56 = v24;
      _os_log_error_impl(&dword_1B727D000, v34, OS_LOG_TYPE_ERROR, "%s UNEXPECTED: requestIdentifier should be of class NSUUID: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD458], 5001, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_22;
LABEL_21:
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v33);
    goto LABEL_30;
  }
  v29 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
    v55 = 2114;
    v56 = v25;
    _os_log_error_impl(&dword_1B727D000, v29, OS_LOG_TYPE_ERROR, "%s Error with extension request %{public}@", buf, 0x16u);
  }
  v30 = (void *)MEMORY[0x1E0CB35C8];
  v31 = *MEMORY[0x1E0CBD458];
  v51 = *MEMORY[0x1E0CB3388];
  v52 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 5001, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    goto LABEL_21;
LABEL_22:
  v35 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
    v55 = 2112;
    v56 = v24;
    _os_log_impl(&dword_1B727D000, v35, OS_LOG_TYPE_INFO, "%s Extension successfully brought up with request identifier %@", buf, 0x16u);
  }
  objc_msgSend(a1, "_extensionContextForUUID:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "_auxiliaryConnection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "remoteObjectProxy");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke_4;
    v44[3] = &unk_1E6BC4AB8;
    v46 = v12;
    v45 = v24;
    objc_msgSend(v39, "beginTransactionWithIntentIdentifier:completion:", v40, v44);

    v33 = 0;
  }
  else
  {
    v41 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      v55 = 2114;
      v56 = v24;
      _os_log_error_impl(&dword_1B727D000, v41, OS_LOG_TYPE_ERROR, "%s UNEXPECTED: extension context host is nil: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD458], 5001, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v33);
  }

LABEL_30:
}

@end
