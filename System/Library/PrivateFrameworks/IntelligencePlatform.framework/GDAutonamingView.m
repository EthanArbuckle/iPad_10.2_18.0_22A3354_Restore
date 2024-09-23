@implementation GDAutonamingView

- (GDAutonamingView)initWithInner:(id)a3
{
  id v5;
  GDAutonamingView *v6;
  GDAutonamingView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAutonamingView;
  v6 = -[GDAutonamingView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inner, a3);

  return v7;
}

- (GDAutonamingView)initWithViewName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  GDAutonamingView *v13;

  v6 = a3;
  objc_msgSend_clientService(GDSwiftViewService, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autonamingViewWithViewName_error_(v9, v10, (uint64_t)v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self = (GDAutonamingView *)(id)objc_msgSend_initWithInner_(self, v12, (uint64_t)v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)personForIdentifier:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_inner, sel_objCPersonFor_, a3);
}

- (id)personForIdentifier:(id)a3 ofType:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->_inner, sel_objCPersonFor_, a3);
}

- (void)didUpdateUserFeedback
{
  ((void (*)(GDAutonamingViewInner *, char *))MEMORY[0x1E0DE7D20])(self->_inner, sel_didUpdateUserFeedback);
}

- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_confirmWithIdentifier_person_confirmationType_, a3);
}

- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_confirmWithIdentifier_person_confirmationType_, a3);
}

- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_confirmWithIdentifier_person_confirmationType_, a3);
}

- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_rejectWithIdentifier_person_confirmationType_, a3);
}

- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_rejectWithIdentifier_person_confirmationType_, a3);
}

- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5
{
  MEMORY[0x1E0DE7D20](self->_inner, sel_rejectWithIdentifier_person_confirmationType_, a3);
}

- (void)reset
{
  ((void (*)(GDAutonamingViewInner *, char *))MEMORY[0x1E0DE7D20])(self->_inner, sel__reset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
