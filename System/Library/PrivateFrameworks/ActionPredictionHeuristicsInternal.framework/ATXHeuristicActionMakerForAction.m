@implementation ATXHeuristicActionMakerForAction

- (ATXHeuristicActionMakerForAction)initWithAction:(id)a3
{
  id v5;
  ATXHeuristicActionMakerForAction *v6;
  ATXHeuristicActionMakerForAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicActionMakerForAction;
  v6 = -[ATXHeuristicActionMakerForAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_action, a3);

  return v7;
}

- (id)_makeAction
{
  return self->_action;
}

- (id)actionTypeName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  -[ATXAction intent](self->_action, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[ATXAction userActivity](self->_action, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("unknown");
    if (v8)
      v10 = (__CFString *)v8;
    v6 = v10;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicActionMakerForAction)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicActionMakerForAction *v5;
  uint64_t v6;
  ATXAction *action;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXHeuristicActionMakerForAction;
  v5 = -[ATXHeuristicActionMaker initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (ATXAction *)v6;

    if (!v5->_action)
    {
      __atxlog_handle_heuristic();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicActionMakerForAction initWithCoder:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicActionMakerForAction;
  v4 = a3;
  -[ATXHeuristicActionMaker encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, CFSTR("action"), v5.receiver, v5.super_class);

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<Lazy: %@>"), self->_action);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXHeuristicActionMakerForAction: no action after decoding", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

@end
