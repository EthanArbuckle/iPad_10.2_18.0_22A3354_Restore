@implementation LUILogViewerController

- (void)setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  CGAffineTransform v9;
  CGAffineTransform v10;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController setBaseView:](self, "setBaseView:", v5);

  -[LUILogViewerController baseView](self, "baseView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController _moveElementsToView:](self, "_moveElementsToView:", v6);

  CGAffineTransformMakeScale(&v10, 0.0, 0.0);
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(v7, "setTransform:", &v9);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__LUILogViewerController_setup__block_invoke;
  v8[3] = &unk_24FEBBC70;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v8, 0, 0.2, 0.0, 0.6, 1.0);
}

void __31__LUILogViewerController_setup__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "assistiveTouch");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (LUILogViewerController)init
{
  LUILogViewerController *v2;
  uint64_t v3;
  NSArray *predicates;
  uint64_t v5;
  NSMutableSet *logMinutesSet;
  uint64_t v7;
  NSMutableArray *logMinutesArray;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LUILogViewerController;
  v2 = -[LUILogViewerController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    predicates = v2->_predicates;
    v2->_predicates = (NSArray *)v3;

    v5 = objc_opt_new();
    logMinutesSet = v2->_logMinutesSet;
    v2->_logMinutesSet = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    logMinutesArray = v2->_logMinutesArray;
    v2->_logMinutesArray = (NSMutableArray *)v7;

    -[LUILogViewerController addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("predicates"), 1, 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[LUILogViewerController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("predicates"));
  v3.receiver = self;
  v3.super_class = (Class)LUILogViewerController;
  -[LUILogViewerController dealloc](&v3, sel_dealloc);
}

- (void)_grabLogAndUpdateTextView
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];

  -[LUILogViewerController logInterval](self, "logInterval");
  if (v3 > 0.0)
  {
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", 0);

    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showSpinner:", 1);

    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke;
    block[3] = &unk_24FEBBC70;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

void __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v2, "logInterval");
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(*(id *)(a1 + 32), "predicates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_getLogsFromDate:predicate:duplicateHandler:", v5, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "_getLogsFromDate:predicate:duplicateHandler:", v5, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke_2;
  v12[3] = &unk_24FEBBC98;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showSpinner:", 0);

  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

}

- (id)_getLogsFromDate:(id)a3 predicate:(id)a4 duplicateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  intptr_t (*v27)(uint64_t);
  void *v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LUILogViewerController setIsFetchingLogs:](self, "setIsFetchingLogs:", 1);
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE60C78], "localStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v13 = MEMORY[0x24BDAC760];
  v39 = 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke;
  v33[3] = &unk_24FEBBCC0;
  v33[4] = &v34;
  objc_msgSend(v12, "prepareWithCompletionHandler:", v33);
  v14 = dispatch_semaphore_create(0);
  v15 = objc_alloc(MEMORY[0x24BE60C80]);
  v16 = objc_msgSend(v15, "initWithSource:", v35[5]);
  v17 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  _getLogsFromDate_predicate_duplicateHandler__stream = v16;

  objc_msgSend((id)_getLogsFromDate_predicate_duplicateHandler__stream, "setFlags:", 21);
  objc_msgSend((id)_getLogsFromDate_predicate_duplicateHandler__stream, "setFilterPredicate:", v9);
  v18 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_2;
  v30[3] = &unk_24FEBBCE8;
  v30[4] = self;
  v19 = v10;
  v32 = v19;
  v20 = v11;
  v31 = v20;
  objc_msgSend(v18, "setEventHandler:", v30);
  v21 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  v25 = v13;
  v26 = 3221225472;
  v27 = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_3;
  v28 = &unk_24FEBBD10;
  v22 = v14;
  v29 = v22;
  objc_msgSend(v21, "setInvalidationHandler:", &v25);
  objc_msgSend((id)_getLogsFromDate_predicate_duplicateHandler__stream, "activateStreamFromDate:", v8, v25, v26, v27, v28);
  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  -[LUILogViewerController setIsFetchingLogs:](self, "setIsFetchingLogs:", 0);
  v23 = (void *)objc_msgSend(v20, "copy");

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;

  v27 = a2;
  if (objc_msgSend(v27, "type") == 1024)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstLogDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(v27, "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setFirstLogDate:", v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "_attributedLogStringFrom:fontSize:", v27, 16.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    if (!v7
      || (objc_msgSend(v5, "string"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
          v8,
          (v9 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
      objc_msgSend(v27, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLastLogDate:", v10);

      objc_msgSend(*(id *)(a1 + 32), "logMinutesSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v27, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "numberWithDouble:", floor(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "containsObject:", v15);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "logMinutesSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v27, "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceReferenceDate");
        objc_msgSend(v18, "numberWithDouble:", floor(v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v21);

        objc_msgSend(*(id *)(a1 + 32), "logMinutesArray");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v27, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        objc_msgSend(v23, "numberWithDouble:", floor(v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v26);

      }
    }

  }
}

intptr_t __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_attributedLogStringFrom:(id)a3 fontSize:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v56 = *MEMORY[0x24BDF6600];
  v7 = v56;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v8;
  v57 = *MEMORY[0x24BDF65F8];
  v9 = v57;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v56, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "logCyanColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v9;
  v55[0] = v46;
  v54[0] = v7;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x24BDD1458]);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  secondStringWithDate(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%06d   "), v16, *(unsigned int *)(objc_msgSend(v5, "unixDate") + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "initWithString:attributes:", v17, v12);

  v48 = (void *)v18;
  objc_msgSend(v6, "appendAttributedString:", v18);
  v19 = objc_alloc(MEMORY[0x24BDD1458]);
  v20 = v5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d   "), objc_msgSend(v5, "processIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "initWithString:attributes:", v21, v49);

  v47 = (void *)v22;
  objc_msgSend(v6, "appendAttributedString:", v22);
  objc_msgSend(MEMORY[0x24BDF6950], "logPurpleColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v52[1] = v9;
  v53[0] = v23;
  v52[0] = v7;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v20, "process");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v27, v25);

  objc_msgSend(v6, "appendAttributedString:", v28);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR(": ("), v49);
  v30 = v6;
  objc_msgSend(v6, "appendAttributedString:", v29);
  objc_msgSend(v20, "sender");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "logYellowColor");
    v32 = objc_claimAutoreleasedReturnValue();

    v50[1] = v9;
    v51[0] = v32;
    v50[0] = v7;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v34 = objc_claimAutoreleasedReturnValue();

    v35 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v20, "sender");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithString:attributes:", v36, v34);

    objc_msgSend(v30, "appendAttributedString:", v37);
    v25 = (void *)v34;
    v23 = (void *)v32;
  }
  v38 = v30;
  v39 = objc_alloc(MEMORY[0x24BDD1458]);
  v40 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v20, "composedMessage");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR(") %@\n\n"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v39, "initWithString:attributes:", v42, v49);

  objc_msgSend(v38, "appendAttributedString:", v43);
  v44 = (void *)objc_msgSend(v38, "copy");

  return v44;
}

- (void)_startStreamLog
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_opt_new();
  -[LUILogViewerController setLastLogDate:](self, "setLastLogDate:", v3);

  -[LUILogViewerController setIsStreaming:](self, "setIsStreaming:", 1);
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchClearButtonTitle:", 0);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__LUILogViewerController__startStreamLog__block_invoke;
  v6[3] = &unk_24FEBBD38;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fire");

}

void __41__LUILogViewerController__startStreamLog__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isStreaming") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateLogFromLastTime");
  else
    objc_msgSend(v3, "invalidate");

}

- (void)_stopStreaming
{
  id v3;

  -[LUILogViewerController setIsStreaming:](self, "setIsStreaming:", 0);
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchClearButtonTitle:", 1);

}

- (void)_updateLogFromLastTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  BOOL v23;
  _QWORD v24[3];
  char v25;

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  v10 = v9;
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v6 >= v10 - v13 + -50.0;

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  dispatch_get_global_queue(0, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke;
  v20[3] = &unk_24FEBBDB0;
  v21 = v17;
  v22 = v24;
  v20[4] = self;
  v23 = v14;
  v19 = v17;
  dispatch_async(v18, v20);

  _Block_object_dispose(v24, 8);
}

void __48__LUILogViewerController__updateLogFromLastTime__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  char v16;
  _QWORD v17[4];
  __int128 v18;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "lastLogDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(*(id *)(a1 + 32), "predicates");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke_2;
  v17[3] = &unk_24FEBBD60;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v18 = v13;
  objc_msgSend(v3, "_getLogsFromDate:predicate:duplicateHandler:", v4, v8, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke_3;
  block[3] = &unk_24FEBBD88;
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v11;
  v16 = *(_BYTE *)(a1 + 56);
  v12 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __48__LUILogViewerController__updateLogFromLastTime__block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "containsString:", a2);
    result = 1;
    if ((v3 & 1) != 0)
      return result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return 0;
}

void __48__LUILogViewerController__updateLogFromLastTime__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendAttributedString:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollRangeToVisible:", objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4) - 1, 0);

  }
}

- (void)_cleanupLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[LUILogViewerController setLogInterval:](self, "setLogInterval:", 0.0);
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearScreenshots");

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetSearchResultLabel");

  -[LUILogViewerController setHighlightRanges:](self, "setHighlightRanges:", MEMORY[0x24BDBD1A8]);
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", -1);
  -[LUILogViewerController setFirstLogDate:](self, "setFirstLogDate:", 0);
  -[LUILogViewerController setLastLogDate:](self, "setLastLogDate:", 0);
  -[LUILogViewerController logMinutesSet](self, "logMinutesSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  CGRect v30;

  v29 = a3;
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;

  if (v6 != 0.0)
  {
    -[LUILogViewerController setOutsideKeyboardIsShowing:](self, "setOutsideKeyboardIsShowing:", 1);
    objc_msgSend(v29, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "CGRectValue");
      v11 = v10;
      -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v30.origin.x = v14;
      v30.origin.y = v16;
      v30.size.width = v18;
      v30.size.height = v20;
      v21 = v11 + CGRectGetMaxY(v30);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;

      if (v21 > v24)
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bounds");
        v27 = v26 - v11 - v20;

        -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFrame:", v14, v27, v18, v20);

      }
    }

  }
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  double v5;
  BOOL v6;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  if (v5 == 0.0)
  {
    v6 = -[LUILogViewerController outsideKeyboardIsShowing](self, "outsideKeyboardIsShowing");

    if (!v6)
      return;
  }
  else
  {

  }
  -[LUILogViewerController setOutsideKeyboardIsShowing:](self, "setOutsideKeyboardIsShowing:", 0);
}

- (void)_presentLogViewerView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[9];

  v3 = -[LUILogViewerController outsideKeyboardIsShowing](self, "outsideKeyboardIsShowing") ^ 1;
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    -[LUILogViewerController baseView](self, "baseView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogViewerController logViewerView](self, "logViewerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v29);

  }
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", 1.0);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("cornerRadius"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BDD16E0];
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "cornerRadius");
  objc_msgSend(v32, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFromValue:", v35);

  objc_msgSend(v31, "setToValue:", &unk_24FEC1CA8);
  objc_msgSend(v31, "setDuration:", 0.200000003);
  -[LUILogViewerController logViewerView](self, "logViewerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v31, 0);

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __47__LUILogViewerController__presentLogViewerView__block_invoke;
  v39[3] = &unk_24FEBBDD8;
  v39[4] = self;
  v39[5] = v9;
  v39[6] = v11;
  v39[7] = v13;
  v39[8] = v15;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __47__LUILogViewerController__presentLogViewerView__block_invoke_2;
  v38[3] = &unk_24FEBBE00;
  v38[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v39, v38, 0.200000003, 0.0, 0.8, 1.0);

}

void __47__LUILogViewerController__presentLogViewerView__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "logViewerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __47__LUILogViewerController__presentLogViewerView__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logViewerControllerDidOpenLogViewer:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_dismissLogViewerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  LUILogViewerController *v27;

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v4, "setFrame:");

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerRadius");
  v11 = v10;
  objc_msgSend(v4, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  -[LUILogViewerController baseView](self, "baseView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v4);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("cornerRadius"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFromValue:", &unk_24FEC1CA8);
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cornerRadius");
  objc_msgSend(v15, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setToValue:", v18);

  objc_msgSend(v14, "setDuration:", 0.200000003);
  objc_msgSend(v4, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v14, 0);

  v20 = (void *)MEMORY[0x24BDF6F90];
  v21 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __47__LUILogViewerController__dismissLogViewerView__block_invoke;
  v25[3] = &unk_24FEBBC98;
  v26 = v4;
  v27 = self;
  v23[0] = v21;
  v23[1] = 3221225472;
  v23[2] = __47__LUILogViewerController__dismissLogViewerView__block_invoke_2;
  v23[3] = &unk_24FEBBE28;
  v23[4] = self;
  v24 = v26;
  v22 = v26;
  objc_msgSend(v20, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v25, v23, 0.200000003, 0.0, 0.8, 1.0);

}

void __47__LUILogViewerController__dismissLogViewerView__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "assistiveTouch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

}

void __47__LUILogViewerController__dismissLogViewerView__block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "assistiveTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logViewerControllerDidCloseLogViewer:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)showLogFilterPage
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
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[LUILogViewerController pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController logFilterViewController](self, "logFilterViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[LUILogViewerController pageViewController](self, "pageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    objc_initWeak(&location, self);
    -[LUILogViewerController pageViewController](self, "pageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogViewerController logFilterViewController](self, "logFilterViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__LUILogViewerController_showLogFilterPage__block_invoke;
    v12[3] = &unk_24FEBBE50;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "setViewControllers:direction:animated:completion:", v11, 0, 1, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__LUILogViewerController_showLogFilterPage__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  if (a2)
  {
    objc_msgSend(WeakRetained, "logViewerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightFilterButton:", 1);

    objc_msgSend(WeakRetained, "logViewerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highlightLogButton:", 0);

  }
}

- (void)showLogContentPage
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
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[LUILogViewerController pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[LUILogViewerController pageViewController](self, "pageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    objc_initWeak(&location, self);
    -[LUILogViewerController pageViewController](self, "pageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__LUILogViewerController_showLogContentPage__block_invoke;
    v12[3] = &unk_24FEBBE50;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "setViewControllers:direction:animated:completion:", v11, 1, 1, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __44__LUILogViewerController_showLogContentPage__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  if (a2)
  {
    objc_msgSend(WeakRetained, "logViewerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightFilterButton:", 0);

    objc_msgSend(WeakRetained, "logViewerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highlightLogButton:", 1);

  }
}

- (void)_moveElementsToView:(id)a3
{
  id v4;
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

  v4 = a3;
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController panGesture](self, "panGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", v7);

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[LUILogViewerView superview](self->_logViewerView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[LUILogViewerController logViewerView](self, "logViewerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v11);

    -[LUILogViewerController panGesture](self, "panGesture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v12);

    -[LUILogViewerController logViewerView](self, "logViewerView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:");
  }
  else
  {
    -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v13);

    -[LUILogViewerController panGesture](self, "panGesture");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:");
  }

}

- (void)_increaseCurrentHighlightIndex
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1;
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", v3 % objc_msgSend(v4, "count"));

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSearchResultLabelWithTotalResult:currentIndex:", objc_msgSend(v5, "count"), -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1);

}

- (void)_decreaseCurrentHighlightIndex
{
  int64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex");
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 + objc_msgSend(v4, "count") - 1;
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", v5 % objc_msgSend(v6, "count"));

  -[LUILogViewerController logViewerView](self, "logViewerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSearchResultLabelWithTotalResult:currentIndex:", objc_msgSend(v7, "count"), -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1);

}

- (BOOL)_performSearch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[LUILogViewerController _cleanupHighlight](self, "_cleanupHighlight");
  v5 = (void *)objc_opt_new();
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "rangeOfString:", v10);
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    do
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);

      v13 = objc_msgSend(v9, "rangeOfString:options:range:locale:", v10, 0, v13 + v14, objc_msgSend(v9, "length") - (v13 + v14), 0);
      v14 = v16;
    }
    while (v16);
  }
  v17 = objc_msgSend(v5, "count");
  if (v17)
  {
    v18 = (void *)objc_msgSend(v5, "copy");
    -[LUILogViewerController setHighlightRanges:](self, "setHighlightRanges:", v18);

    -[LUILogViewerController _increaseCurrentHighlightIndex](self, "_increaseCurrentHighlightIndex");
    -[LUILogViewerController _setupInitialHighlight](self, "_setupInitialHighlight");
  }

  return v17 != 0;
}

- (void)_setupInitialHighlight
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");

  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __48__LUILogViewerController__setupInitialHighlight__block_invoke;
  v21[3] = &unk_24FEBBE78;
  v21[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endEditing");

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "becomeFirstResponder");

  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rangeValue");
  v16 = v15;

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectedRange:", v14, v16);

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scrollRangeToVisible:", v14, v16);

}

void __48__LUILogViewerController__setupInitialHighlight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_msgSend(a2, "rangeValue");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF65C8];
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v8, v10, v3, v5);

}

- (void)_updateHighlight
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeValue");
  v7 = v6;

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "becomeFirstResponder");

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedRange:", v5, v7);

  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrollRangeToVisible:", v5, v7);

}

- (void)_cleanupHighlight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[LUILogViewerController highlightRanges](self, "highlightRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginEditing");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[LUILogViewerController highlightRanges](self, "highlightRanges");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x24BDF65C8];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(obj);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "rangeValue");
          v14 = v13;
          -[LUILogViewerController logContentViewController](self, "logContentViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "textView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "textStorage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeAttribute:range:", v10, v12, v14);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endEditing");

    -[LUILogViewerController setHighlightRanges:](self, "setHighlightRanges:", 0);
    -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", -1);
    -[LUILogViewerController logViewerView](self, "logViewerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resetSearchResultLabel");

  }
}

- (_NSRange)_searchRangeForDate:(id)a3 inText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  _NSRange result;

  v6 = a3;
  v7 = a4;
  secondStringWithDate(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfString:", v8);
  v11 = v10;

  if (!v11)
  {
    -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 2)
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v15 = v14;
      -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") - 1;

      if (v17 < 2)
      {
        v18 = 0;
LABEL_13:
        -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        if (v26 >= v15)
        {
          v31 = (void *)MEMORY[0x24BDBCE60];
          -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v34 = v31;
        }
        else
        {
          -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v29;

          if (v30 < v15)
          {
            v9 = objc_msgSend(v7, "length") - 1;
            v11 = 1;
            goto LABEL_21;
          }
          v36 = (void *)MEMORY[0x24BDBCE60];
          -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", v17);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v34 = v36;
        }
        objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        secondStringWithDate(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "rangeOfString:", v38);
        v11 = v39;

      }
      else
      {
        v18 = 0;
        while (1)
        {
          -[LUILogViewerController logMinutesArray](self, "logMinutesArray");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v18 + ((v17 - v18) >> 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          if (v15 == v22)
            break;
          if (v22 > v15)
            v17 = v18 + ((v17 - v18) >> 1);
          else
            v18 += (v17 - v18) >> 1;
          if (v18 + 1 >= v17)
            goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        secondStringWithDate(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "rangeOfString:", v33);
        v11 = v35;
      }

      goto LABEL_21;
    }
    v9 = 0;
    v11 = 0;
  }
LABEL_21:

  v40 = v9;
  v41 = v11;
  result.length = v41;
  result.location = v40;
  return result;
}

- (LUILogViewerAssistiveTouch)assistiveTouch
{
  LUILogViewerAssistiveTouch *assistiveTouch;
  LUILogViewerAssistiveTouch *v4;
  void *v5;
  CGFloat v6;
  void *v7;
  LUILogViewerAssistiveTouch *v8;
  LUILogViewerAssistiveTouch *v9;
  void *v10;
  CGRect v12;
  CGRect v13;

  assistiveTouch = self->_assistiveTouch;
  if (!assistiveTouch)
  {
    v4 = [LUILogViewerAssistiveTouch alloc];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = CGRectGetWidth(v12) + -70.0;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = -[LUILogViewerAssistiveTouch initWithFrame:](v4, "initWithFrame:", v6, CGRectGetHeight(v13) + -70.0, 70.0, 70.0);
    v9 = self->_assistiveTouch;
    self->_assistiveTouch = v8;

    -[LUILogViewerAssistiveTouch layer](self->_assistiveTouch, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZPosition:", 3.40282347e38);

    -[LUILogViewerAssistiveTouch setAutoresizingMask:](self->_assistiveTouch, "setAutoresizingMask:", 9);
    -[LUILogViewerAssistiveTouch addTarget:action:forControlEvents:](self->_assistiveTouch, "addTarget:action:forControlEvents:", self, sel_assistiveTouchButtonTapped_, 64);
    assistiveTouch = self->_assistiveTouch;
  }
  return assistiveTouch;
}

- (LUILogViewerView)logViewerView
{
  LUILogViewerView *logViewerView;
  void *v4;
  double Height;
  LUILogViewerView *v6;
  void *v7;
  CGFloat v8;
  void *v9;
  LUILogViewerView *v10;
  LUILogViewerView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  logViewerView = self->_logViewerView;
  if (!logViewerView)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    Height = CGRectGetHeight(v19);

    if (Height > 650.0)
      Height = 650.0;
    v6 = [LUILogViewerView alloc];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = CGRectGetHeight(v20) - Height;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = -[LUILogViewerView initWithFrame:](v6, "initWithFrame:", 0.0, v8, CGRectGetWidth(v21), Height);
    v11 = self->_logViewerView;
    self->_logViewerView = v10;

    -[LUILogViewerView layer](self->_logViewerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZPosition:", 3.40282347e38);

    -[LUILogViewerView setAutoresizingMask:](self->_logViewerView, "setAutoresizingMask:", 10);
    -[LUILogViewerView setDelegate:](self->_logViewerView, "setDelegate:", self);
    -[LUILogViewerController pageViewController](self, "pageViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[LUILogViewerView contentHolderView](self->_logViewerView, "contentHolderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v14, "setFrame:");

    -[LUILogViewerView contentHolderView](self->_logViewerView, "contentHolderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v14);

    objc_msgSend(v14, "setAutoresizingMask:", 18);
    -[LUILogViewerView searchBar](self->_logViewerView, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[LUILogViewerView highlightLogButton:](self->_logViewerView, "highlightLogButton:", 1);
    logViewerView = self->_logViewerView;
  }
  return logViewerView;
}

- (UIPageViewController)pageViewController
{
  UIPageViewController *pageViewController;
  LUILogViewerPageViewController *v4;
  UIPageViewController *v5;
  UIPageViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  pageViewController = self->_pageViewController;
  if (!pageViewController)
  {
    v4 = -[LUILogViewerPageViewController initWithTransitionStyle:navigationOrientation:options:]([LUILogViewerPageViewController alloc], "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
    v5 = self->_pageViewController;
    self->_pageViewController = &v4->super;

    -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", self);
    -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", self);
    v6 = self->_pageViewController;
    -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setViewControllers:direction:animated:completion:](v6, "setViewControllers:direction:animated:completion:", v9, 0, 0, 0);

    pageViewController = self->_pageViewController;
  }
  return pageViewController;
}

- (LUILogContentViewController)logContentViewController
{
  LUILogContentViewController *logContentViewController;
  LUILogContentViewController *v4;
  LUILogContentViewController *v5;

  logContentViewController = self->_logContentViewController;
  if (!logContentViewController)
  {
    v4 = (LUILogContentViewController *)objc_opt_new();
    v5 = self->_logContentViewController;
    self->_logContentViewController = v4;

    -[LUILogContentViewController setDelegate:](self->_logContentViewController, "setDelegate:", self);
    logContentViewController = self->_logContentViewController;
  }
  return logContentViewController;
}

- (LUILogFilterViewController)logFilterViewController
{
  LUILogFilterViewController *logFilterViewController;
  LUILogFilterViewController *v4;
  LUILogFilterViewController *v5;

  logFilterViewController = self->_logFilterViewController;
  if (!logFilterViewController)
  {
    v4 = (LUILogFilterViewController *)objc_opt_new();
    v5 = self->_logFilterViewController;
    self->_logFilterViewController = v4;

    -[LUILogFilterViewController setDelegate:](self->_logFilterViewController, "setDelegate:", self);
    logFilterViewController = self->_logFilterViewController;
  }
  return logFilterViewController;
}

- (UIPanGestureRecognizer)panGesture
{
  UIPanGestureRecognizer *panGesture;
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;

  panGesture = self->_panGesture;
  if (!panGesture)
  {
    v4 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_handlePan_);
    v5 = self->_panGesture;
    self->_panGesture = v4;

    -[UIPanGestureRecognizer setDelegate:](self->_panGesture, "setDelegate:", self);
    panGesture = self->_panGesture;
  }
  return panGesture;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("predicates"), a4, a5, a6))
  {
    -[LUILogViewerController predicates](self, "predicates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enableTimeConsumingOptions:", v8 != 0);

  }
}

- (void)handlePan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double Width;
  void *v17;
  double Height;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  _QWORD v34[7];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  if (v10 == 2)
  {
    v13 = v7 + *(double *)&handlePan__originCenter_0;
    v14 = v9 + *(double *)&handlePan__originCenter_1;
    -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCenter:", v13, v14);
    goto LABEL_5;
  }
  if (v10 == 1)
  {
    -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "center");
    handlePan__originCenter_0 = v11;
    handlePan__originCenter_1 = v12;
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  Width = CGRectGetWidth(v35);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  Height = CGRectGetHeight(v36);

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "center");
  v21 = v20;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "center");
  v24 = v23;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v26 = CGRectGetWidth(v37) * 0.5;
  if (v24 >= Width * 0.5)
    v27 = Width - v26;
  else
    v27 = v26;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v29 = CGRectGetHeight(v38) * 0.5;

  if (v29 >= v21)
    v21 = v29;
  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v31 = Height - CGRectGetHeight(v39) * 0.5;

  if (v31 >= v21)
    v32 = v21;
  else
    v32 = v31;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __36__LUILogViewerController_handlePan___block_invoke;
  v34[3] = &unk_24FEBBEA0;
  v34[4] = self;
  *(double *)&v34[5] = v27;
  *(double *)&v34[6] = v32;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v34, 0, 0.200000003, 0.0, 0.8, 1.0);
}

void __36__LUILogViewerController_handlePan___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "assistiveTouch");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGPoint v12;
  CGRect v13;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[LUILogViewerController assistiveTouch](self, "assistiveTouch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12.x = v7;
  v12.y = v9;
  LOBYTE(v4) = CGRectContainsPoint(v13, v12);

  return (char)v4;
}

- (void)logViewerViewClearButtontapped:(id)a3
{
  id v4;

  if (-[LUILogViewerController isStreaming](self, "isStreaming", a3))
  {
    -[LUILogViewerController _stopStreaming](self, "_stopStreaming");
  }
  else if (!-[LUILogViewerController isFetchingLogs](self, "isFetchingLogs"))
  {
    -[LUILogViewerController _cleanupLogs](self, "_cleanupLogs");
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showLogOptionsView");

  }
}

- (void)logViewerLeftCaretButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;

  -[LUILogViewerController highlightRanges](self, "highlightRanges", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[LUILogViewerController _decreaseCurrentHighlightIndex](self, "_decreaseCurrentHighlightIndex");
    -[LUILogViewerController _updateHighlight](self, "_updateHighlight");
  }
}

- (void)logViewerRightCaretButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;

  -[LUILogViewerController highlightRanges](self, "highlightRanges", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[LUILogViewerController _increaseCurrentHighlightIndex](self, "_increaseCurrentHighlightIndex");
    -[LUILogViewerController _updateHighlight](self, "_updateHighlight");
  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (a4 && a6)
  {
    objc_msgSend(a3, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[LUILogViewerController logViewerView](self, "logViewerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 == v9)
    {
      objc_msgSend(v10, "highlightFilterButton:", 0);

      -[LUILogViewerController logViewerView](self, "logViewerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v13 = 1;
    }
    else
    {
      objc_msgSend(v10, "highlightFilterButton:", 1);

      -[LUILogViewerController logViewerView](self, "logViewerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v13 = 0;
    }
    objc_msgSend(v12, "highlightLogButton:", v13);

  }
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 1;

  if (v7 >= v9)
  {
    v11 = 0;
  }
  else
  {
    -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7)
  {
    -[LUILogViewerController orderedViewControllers](self, "orderedViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)orderedViewControllers
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__LUILogViewerController_orderedViewControllers__block_invoke;
  block[3] = &unk_24FEBBC70;
  block[4] = self;
  if (orderedViewControllers_onceToken != -1)
    dispatch_once(&orderedViewControllers_onceToken, block);
  return (id)orderedViewControllers_result;
}

void __48__LUILogViewerController_orderedViewControllers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "logFilterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)orderedViewControllers_result;
  orderedViewControllers_result = v4;

}

- (void)logFilterViewController:(id)a3 didAddPredicates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[LUILogViewerController predicates](self, "predicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[LUILogViewerController setPredicates:](self, "setPredicates:", v10);
  objc_msgSend(v7, "predicateDataUpdated");

}

uint64_t __67__LUILogViewerController_logFilterViewController_didAddPredicates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "predicateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)logFilterViewController:(id)a3 didDeletePredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[LUILogViewerController predicates](self, "predicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v6);
  v9 = (void *)objc_msgSend(v10, "copy");
  -[LUILogViewerController setPredicates:](self, "setPredicates:", v9);

  objc_msgSend(v7, "predicateDataUpdated");
}

- (void)logFilterViewControllerApplyButtonTapped:(id)a3
{
  double v4;
  unint64_t v5;
  id v6;

  -[LUILogViewerController showLogContentPage](self, "showLogContentPage", a3);
  -[LUILogViewerController _stopStreaming](self, "_stopStreaming");
  -[LUILogViewerController logInterval](self, "logInterval");
  v5 = (unint64_t)v4;
  -[LUILogViewerController _cleanupLogs](self, "_cleanupLogs");
  if (v5)
  {
    -[LUILogViewerController setLogInterval:](self, "setLogInterval:", (double)v5);
    -[LUILogViewerController _grabLogAndUpdateTextView](self, "_grabLogAndUpdateTextView");
  }
  else
  {
    -[LUILogViewerController logContentViewController](self, "logContentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showLogOptionsView");

  }
}

- (BOOL)logFilterViewControllerShouldAllowTextEditing:(id)a3
{
  return !-[LUILogViewerController outsideKeyboardIsShowing](self, "outsideKeyboardIsShowing", a3);
}

- (void)logContentViewController:(id)a3 didSelectLogOptionWithTimeInterval:(double)a4
{
  void *v6;

  -[LUILogViewerController setLogInterval:](self, "setLogInterval:", a3);
  -[LUILogViewerController logContentViewController](self, "logContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showLogTextView");

  if (a4 <= 0.0)
    -[LUILogViewerController _startStreamLog](self, "_startStreamLog");
  else
    -[LUILogViewerController _grabLogAndUpdateTextView](self, "_grabLogAndUpdateTextView");
}

- (void)logContentViewController:(id)a3 didSelectDateForLog:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[LUILogViewerController firstLogDate](self, "firstLogDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LUILogViewerController lastLogDate](self, "lastLogDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v16, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[LUILogViewerController _searchRangeForDate:inText:](self, "_searchRangeForDate:inText:", v6, v11);
      v14 = v13;

      if (v14)
      {
        objc_msgSend(v16, "textView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scrollRangeToVisible:", v12, v14);

      }
    }
  }

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") != -1)
  {
    -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1);
    -[LUILogViewerController _updateHighlight](self, "_updateHighlight");
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LUILogViewerController _performSearch:](self, "_performSearch:", v4);

  v6 = v7;
  if (v5)
  {
    objc_msgSend(v7, "endEditing:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", -1, a4);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  LUILogViewerController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = self;
  -[LUILogViewerController pageViewController](self, "pageViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerController logContentViewController](v3, "logContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 == v7;

  return (char)v3;
}

- (LUILogViewerControllerDelegate)delegate
{
  return (LUILogViewerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLogViewerView:(id)a3
{
  objc_storeStrong((id *)&self->_logViewerView, a3);
}

- (void)setAssistiveTouch:(id)a3
{
  objc_storeStrong((id *)&self->_assistiveTouch, a3);
}

- (UIView)baseView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_baseView);
}

- (void)setBaseView:(id)a3
{
  objc_storeWeak((id *)&self->_baseView, a3);
}

- (void)setLogContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_logContentViewController, a3);
}

- (void)setLogFilterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_logFilterViewController, a3);
}

- (void)setPageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewController, a3);
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (double)logInterval
{
  return self->_logInterval;
}

- (void)setLogInterval:(double)a3
{
  self->_logInterval = a3;
}

- (NSDate)lastLogDate
{
  return self->_lastLogDate;
}

- (void)setLastLogDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLogDate, a3);
}

- (NSDate)firstLogDate
{
  return self->_firstLogDate;
}

- (void)setFirstLogDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstLogDate, a3);
}

- (NSMutableSet)logMinutesSet
{
  return self->_logMinutesSet;
}

- (void)setLogMinutesSet:(id)a3
{
  objc_storeStrong((id *)&self->_logMinutesSet, a3);
}

- (NSMutableArray)logMinutesArray
{
  return self->_logMinutesArray;
}

- (void)setLogMinutesArray:(id)a3
{
  objc_storeStrong((id *)&self->_logMinutesArray, a3);
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
  objc_storeStrong((id *)&self->_highlightRanges, a3);
}

- (int64_t)currentHighlightIndex
{
  return self->_currentHighlightIndex;
}

- (void)setCurrentHighlightIndex:(int64_t)a3
{
  self->_currentHighlightIndex = a3;
}

- (BOOL)isFetchingLogs
{
  return self->_isFetchingLogs;
}

- (void)setIsFetchingLogs:(BOOL)a3
{
  self->_isFetchingLogs = a3;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (BOOL)outsideKeyboardIsShowing
{
  return self->_outsideKeyboardIsShowing;
}

- (void)setOutsideKeyboardIsShowing:(BOOL)a3
{
  self->_outsideKeyboardIsShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_storeStrong((id *)&self->_logMinutesArray, 0);
  objc_storeStrong((id *)&self->_logMinutesSet, 0);
  objc_storeStrong((id *)&self->_firstLogDate, 0);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_logFilterViewController, 0);
  objc_storeStrong((id *)&self->_logContentViewController, 0);
  objc_destroyWeak((id *)&self->_baseView);
  objc_storeStrong((id *)&self->_assistiveTouch, 0);
  objc_storeStrong((id *)&self->_logViewerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
