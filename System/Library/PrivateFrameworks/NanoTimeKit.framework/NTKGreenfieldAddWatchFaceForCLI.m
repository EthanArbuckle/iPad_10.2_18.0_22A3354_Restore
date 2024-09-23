@implementation NTKGreenfieldAddWatchFaceForCLI

- (void)addWatchFaceWithURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  NTKGreenfieldAddWatchFaceManager *addWatchFaceManager;
  NTKGreenfieldAddWatchFaceManager *v8;
  NTKGreenfieldAddWatchFaceManager *v9;
  void *v10;
  id completion;
  id v12;

  v12 = a3;
  v6 = a4;
  addWatchFaceManager = self->_addWatchFaceManager;
  if (!addWatchFaceManager)
  {
    v8 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
    v9 = self->_addWatchFaceManager;
    self->_addWatchFaceManager = v8;

    -[NTKGreenfieldAddWatchFaceManager setDelegate:](self->_addWatchFaceManager, "setDelegate:", self);
    addWatchFaceManager = self->_addWatchFaceManager;
  }
  -[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:](addWatchFaceManager, "decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:", v12, 0);
  v10 = (void *)objc_msgSend(v6, "copy");
  completion = self->_completion;
  self->_completion = v10;

}

- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void (**completion)(id, id);
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager finished with error:%@", (uint8_t *)&v10, 0x16u);

  }
  completion = (void (**)(id, id))self->_completion;
  if (completion)
    completion[2](completion, v5);

}

- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (**completion)(id, void *);
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToAddComplicationWithItemId", (uint8_t *)&v12, 0xCu);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.greenfield.cli.errordomain"), 0, 0);
  completion = (void (**)(id, void *))self->_completion;
  if (completion)
    completion[2](completion, v10);

}

- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void (**completion)(id, void *);
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToCompletedWithSkippedComplicationSlots", (uint8_t *)&v11, 0xCu);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.greenfield.cli.errordomain"), 1, 0);
  completion = (void (**)(id, void *))self->_completion;
  if (completion)
    completion[2](completion, v9);

}

- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (**completion)(id, void *);
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToComplicationsNotAvailableWithSlots", (uint8_t *)&v12, 0xCu);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.greenfield.cli.errordomain"), 2, 0);
  completion = (void (**)(id, void *))self->_completion;
  if (completion)
    completion[2](completion, v10);

}

- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (**completion)(id, void *);
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[%@] addWatchFaceManager updateStateToRevisitComplicationWithItemId", (uint8_t *)&v12, 0xCu);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.greenfield.cli.errordomain"), 3, 0);
  completion = (void (**)(id, void *))self->_completion;
  if (completion)
    completion[2](completion, v10);

}

- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] updateStateToWelcomeWithCanAddFaceDirectly canAddFaceDirectly:%@", (uint8_t *)&v10, 0x16u);

  }
  if (v4)
    -[NTKGreenfieldAddWatchFaceManager handleAddToMyFacesAction](self->_addWatchFaceManager, "handleAddToMyFacesAction");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_addWatchFaceManager, 0);
}

@end
