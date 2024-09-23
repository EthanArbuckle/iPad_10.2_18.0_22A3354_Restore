@implementation ICNoteEditorBaseViewController

- (ICNote)note
{
  return self->_note;
}

- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4 nibName:(id)a5 bundle:(id)a6
{
  ICNoteEditorBaseViewController *v8;
  signed int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICNoteEditorBaseViewController;
  v8 = -[ICNoteEditorBaseViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a5, a6);
  if (v8)
  {
    if (a3 >= 10)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier < ICNoteEditorDynamicIdentifiers", "-[ICNoteEditorBaseViewController initWithIdentifier:options:nibName:bundle:]", 1, 0, CFSTR("Identifiers in the dynamic range (>=%ld) cannot be passed explicitly: pass ICNoteEditorGenerateNewIdentifier to generate a new dynamic identifier."), 10);
    }
    else if (a3 < 0)
    {
      do
        v9 = __ldaxr((unsigned int *)&ICNoteEditorControllerGenerateIdentifier_sequenceNumber);
      while (__stlxr(v9 + 1, (unsigned int *)&ICNoteEditorControllerGenerateIdentifier_sequenceNumber));
      a3 = v9;
    }
    v8->_editorIdentifier = a3;
    v8->_options = a4;
    v8->_viewAppearanceState = 0;
  }
  return v8;
}

- (void)noteWillAppear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("note");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ICNoteEditorNoteWillAppear"), self, v7);
}

- (void)noteDidAppear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("note");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ICNoteEditorNoteDidAppear"), self, v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  -[ICNoteEditorBaseViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ICNoteEditorBaseViewController setViewAppearanceState:](self, "setViewAppearanceState:", 2);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  -[ICNoteEditorBaseViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ICNoteEditorBaseViewController setViewAppearanceState:](self, "setViewAppearanceState:", 3);
}

- (int64_t)viewAppearanceState
{
  return self->_viewAppearanceState;
}

- (void)setViewAppearanceState:(int64_t)a3
{
  self->_viewAppearanceState = a3;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isEditingOnSystemPaper
{
  return (-[ICNoteEditorBaseViewController options](self, "options") >> 1) & 1;
}

- (BOOL)isEditingOnSecureScreen
{
  return (-[ICNoteEditorBaseViewController options](self, "options") >> 2) & 1;
}

- (ICNoteEditorBaseViewController)initWithCoder:(id)a3
{
  ICNoteEditorBaseViewController *result;
  signed int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorBaseViewController;
  result = -[ICNoteEditorBaseViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  if (result)
  {
    do
      v4 = __ldaxr((unsigned int *)&ICNoteEditorControllerGenerateIdentifier_sequenceNumber);
    while (__stlxr(v4 + 1, (unsigned int *)&ICNoteEditorControllerGenerateIdentifier_sequenceNumber));
    result->_editorIdentifier = v4;
    result->_options = 0;
    result->_viewAppearanceState = 0;
  }
  return result;
}

- (ICNoteEditorBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ICNoteEditorBaseViewController initWithIdentifier:options:nibName:bundle:](self, "initWithIdentifier:options:nibName:bundle:", -1, 0, a3, a4);
}

- (ICNoteEditorBaseViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  return -[ICNoteEditorBaseViewController initWithIdentifier:options:nibName:bundle:](self, "initWithIdentifier:options:nibName:bundle:", a3, a4, 0, 0);
}

- (BOOL)isAuxiliaryEditor
{
  return -[ICNoteEditorBaseViewController options](self, "options") & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController identifierDescription](self, "identifierDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifierDescription
{
  return (NSString *)ICNoteEditorIdentifierString(-[ICNoteEditorBaseViewController editorIdentifier](self, "editorIdentifier"), -[ICNoteEditorBaseViewController options](self, "options"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  -[ICScrollViewDelegateViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[ICNoteEditorBaseViewController setViewAppearanceState:](self, "setViewAppearanceState:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorBaseViewController;
  -[ICNoteEditorBaseViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[ICNoteEditorBaseViewController setViewAppearanceState:](self, "setViewAppearanceState:", 0);
}

- (int64_t)editorIdentifier
{
  return self->_editorIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

- (void)noteWillDisappear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("note");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ICNoteEditorNoteWillDisappear"), self, v7);
}

- (void)noteDidDisappear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("note");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ICNoteEditorNoteDidDisappear"), self, v7);
}

@end
