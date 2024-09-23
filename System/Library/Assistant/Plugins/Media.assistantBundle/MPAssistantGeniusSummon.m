@implementation MPAssistantGeniusSummon

- (void)performWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  NSString *v8;
  NSString *requestAceHash;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D88228];
  v5 = (void (**)(id, void *))a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithReason:", CFSTR("Unsupported Feature"));
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGeniusSummon aceId](self, "aceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Genius Summon"), v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;

  }
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = self->_requestAceHash;
    objc_msgSend(v6, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_ERROR, "Genius Summon (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v6, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
