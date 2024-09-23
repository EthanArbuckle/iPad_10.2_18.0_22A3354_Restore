@implementation CSQuickActionsConfiguration

- (CSQuickActionsConfiguration)initWithPosterActionsConfiguration:(id)a3
{
  id v4;
  CSQuickActionsConfiguration *v5;
  void *v6;
  void *v7;
  CSQuickActionsConfiguration *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  CSQuickActionControl *v11;
  uint64_t v12;
  CSQuickActionControl *v13;
  void *v14;
  uint64_t v15;
  CSQuickActionControl *v16;
  uint64_t v17;
  CSQuickActionControl *v18;
  void *v19;
  uint64_t v20;
  NSArray *controls;
  uint64_t v23;
  uint64_t v24;
  CSQuickActionSystemControl *(*v25)(uint64_t, void *, uint64_t);
  void *v26;
  CSQuickActionsConfiguration *v27;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSQuickActionsConfiguration;
  v5 = -[CSQuickActionsConfiguration init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "leadingControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __66__CSQuickActionsConfiguration_initWithPosterActionsConfiguration___block_invoke;
    v26 = &unk_1E8E302E8;
    v8 = v5;
    v27 = v8;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E1614](&v23);
    if (v6)
    {
      if (objc_msgSend(v6, "category", v23, v24, v25, v26) == 3)
      {
        ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v6, 1);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v13 = [CSQuickActionControl alloc];
      v12 = -[CSQuickActionsConfiguration _categoryFromPosterCategory:](v8, "_categoryFromPosterCategory:", objc_msgSend(v6, "category"));
      v11 = v13;
    }
    else
    {
      v11 = [CSQuickActionControl alloc];
      v12 = 1;
    }
    v10 = -[CSQuickActionControl initWithCategory:position:](v11, "initWithCategory:position:", v12, 1, v23, v24, v25, v26);
LABEL_8:
    v14 = (void *)v10;
    if (v7)
    {
      if (objc_msgSend(v7, "category") == 3)
      {
        ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v7, 2);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v19 = (void *)v15;
        v29[0] = v14;
        v29[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v20 = objc_claimAutoreleasedReturnValue();
        controls = v8->_controls;
        v8->_controls = (NSArray *)v20;

        goto LABEL_15;
      }
      v18 = [CSQuickActionControl alloc];
      v17 = -[CSQuickActionsConfiguration _categoryFromPosterCategory:](v8, "_categoryFromPosterCategory:", objc_msgSend(v7, "category"));
      v16 = v18;
    }
    else
    {
      v16 = [CSQuickActionControl alloc];
      v17 = 2;
    }
    v15 = -[CSQuickActionControl initWithCategory:position:](v16, "initWithCategory:position:", v17, 2);
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

CSQuickActionSystemControl *__66__CSQuickActionsConfiguration_initWithPosterActionsConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CSQuickActionSystemControl *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CSQuickActionSystemControl *v10;

  v5 = a2;
  v6 = [CSQuickActionSystemControl alloc];
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v5, "type");

  v10 = -[CSQuickActionSystemControl initWithControlIdentity:type:position:](v6, "initWithControlIdentity:type:position:", v7, objc_msgSend(v8, "_typeFromControlType:", v9), a3);
  return v10;
}

- (int64_t)_categoryFromPosterCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int64_t)_typeFromControlType:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return a3;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)setControls:(id)a3
{
  objc_storeStrong((id *)&self->_controls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controls, 0);
}

@end
