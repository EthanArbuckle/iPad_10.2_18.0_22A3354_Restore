@implementation PKTextInputDebugLogController

- (PKTextInputDebugLogController)init
{
  PKTextInputDebugLogController *v2;
  uint64_t v3;
  NSMutableArray *logEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTextInputDebugLogController;
  v2 = -[PKTextInputDebugLogController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    logEntries = v2->__logEntries;
    v2->__logEntries = (NSMutableArray *)v3;

  }
  return v2;
}

- (PKTextInputDebugSharpenerLog)sharpenerLogWithCurrentContent
{
  if (a1)
    a1 = -[PKTextInputDebugSharpenerLog initWithLogEntries:]([PKTextInputDebugSharpenerLog alloc], "initWithLogEntries:", a1->_logEntries);
  return a1;
}

- (void)logEntryForAppliedResult:(uint64_t)a1
{
  PKTextInputDebugRecordingLogEntry *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v16 = a2;
  if (a1 && os_variant_has_internal_diagnostics())
  {
    v3 = -[PKTextInputDebugRecordingLogEntry initWithResultCommand:]([PKTextInputDebugRecordingLogEntry alloc], "initWithResultCommand:", v16);
    objc_msgSend(*(id *)(a1 + 8), "addObject:", v3);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v4 = *(id *)(a1 + 8);
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "inputTargetContentInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textInputTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputTargetIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(id *)(a1 + 8);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__PKTextInputDebugLogController__purgeOldLogEntries__block_invoke;
      v17[3] = &unk_1E7777F80;
      v10 = v8;
      v18 = v10;
      v19 = &v20;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v17);

    }
    v11 = v21[3];
    if (v11 >= 5)
      v11 = 5;
    v21[3] = v11;
    v12 = *(id *)(a1 + 8);
    v13 = objc_msgSend(v12, "count");
    v14 = v13 - v21[3];

    if (v14 >= 1)
    {
      v15 = *(id *)(a1 + 8);
      objc_msgSend(v15, "removeObjectsInRange:", 0, v14);

    }
    _Block_object_dispose(&v20, 8);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");

  }
}

void __52__PKTextInputDebugLogController__purgeOldLogEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "inputTargetContentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputTargetIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToNumber:", *(_QWORD *)(a1 + 32)))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  else
    *a4 = 1;

}

- (void)reportDebugStateDescription:(id)a3
{
  void *v4;
  void (**v5)(id, const __CFString *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, const __CFString *, void *))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (PKTextInputDebugLogController *)self->__logEntries;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PKTextInputDebugLogController_reportDebugStateDescription___block_invoke;
  v11[3] = &unk_1E7777FA8;
  v12 = v6;
  v10 = v6;
  -[PKTextInputDebugLogController enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, v11);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\n%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, CFSTR("Log Entries"), v9);
}

void __61__PKTextInputDebugLogController_reportDebugStateDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "minimalDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %ld: %@"), a3, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (BOOL)debugStateCanDisplayDetails
{
  return 1;
}

- (id)debugStateDetailViewController
{
  void *v2;
  PKTextInputDebugSharpenerLogViewController *v3;

  -[PKTextInputDebugLogController sharpenerLogWithCurrentContent]((PKTextInputDebugSharpenerLog *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKTextInputDebugSharpenerLogViewController initWithSharpenerLog:]([PKTextInputDebugSharpenerLogViewController alloc], "initWithSharpenerLog:", v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__logEntries, 0);
}

@end
