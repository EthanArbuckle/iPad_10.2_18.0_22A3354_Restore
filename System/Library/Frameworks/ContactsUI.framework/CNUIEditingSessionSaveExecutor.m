@implementation CNUIEditingSessionSaveExecutor

- (CNUIEditingSessionSaveExecutor)init
{
  id v3;
  CNUIEditingSessionSaveExecutor *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D13CA8]);
  v4 = -[CNUIEditingSessionSaveExecutor initWithEditingSession:](self, "initWithEditingSession:", v3);

  return v4;
}

- (CNUIEditingSessionSaveExecutor)initWithEditingSession:(id)a3
{
  id v5;
  CNUIEditingSessionSaveExecutor *v6;
  CNUIEditingSessionSaveExecutor *v7;
  CNUIEditingSessionSaveExecutor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIEditingSessionSaveExecutor;
  v6 = -[CNUIEditingSessionSaveExecutor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editingSession, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CNUIContactSaveResult *v10;
  void *v11;
  CNUIContactSaveResult *v12;
  void *v14;
  uint8_t buf[4];
  CNUIEditingSessionSaveExecutor *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CNUILogContactCard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v16 = self;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "[CNUIEditingSessionSaveExecutor] %{public}p will execute save…", buf, 0xCu);
  }

  -[CNUIEditingSessionSaveExecutor editingSession](self, "editingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContacts:", v9);

  v10 = [CNUIContactSaveResult alloc];
  objc_msgSend(v5, "mutableContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CNUIContactSaveResult initWithSuccess:contact:identifiersOfIssuedSaveRequests:](v10, "initWithSuccess:contact:identifiersOfIssuedSaveRequests:", 1, v11, MEMORY[0x1E0C9AA60]);
  return v12;
}

- (CNUICoreContactEditingSession)editingSession
{
  return self->_editingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingSession, 0);
}

@end
