@implementation HKMedicalIDEditorLanguageCell

- (void)beginEditing
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicalIDEditorLanguageCell;
  -[HKMedicalIDEditorCell beginEditing](&v5, sel_beginEditing);
  -[HKMedicalIDEditorLanguageCell editAction](self, "editAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKMedicalIDEditorLanguageCell editAction](self, "editAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setValueLanguageText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "localizedStringForDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[HKMedicalIDEditorCell editDelegate](self, "editDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalIDEditorCellDidChangeValue:", self);

  }
}

- (id)editAction
{
  return self->_editAction;
}

- (void)setEditAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_editAction, 0);
}

@end
