@implementation HKMedicalIDEditorEmergencyContactCell

- (HKMedicalIDEditorEmergencyContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorEmergencyContactCell *v4;
  HKMedicalIDEditorEmergencyContactCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKMedicalIDEditorEmergencyContactCell;
  v4 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKMedicalIDEditorCell inputTextField](v4, "inputTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClearButtonMode:", 0);

    -[HKMedicalIDEditorCell inputTextField](v5, "inputTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsSelection:", 1);

    -[HKMedicalIDEditorCell inputTextField](v5, "inputTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v5, sel__labelTapped_);
    -[HKMedicalIDEditorCell labelLabel](v5, "labelLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v9);

    -[HKMedicalIDEditorCell labelLabel](v5, "labelLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  }
  return v5;
}

- (void)setContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_contact, a3);
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v5, "relationship");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForLabel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMedicalIDEditorCell setLabel:](self, "setLabel:", v8);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (id)formattedValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_HKEmergencyContact name](self->_contact, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_HKEmergencyContact phoneNumber](self->_contact, "phoneNumber");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_labelTapped:(id)a3
{
  id v4;

  -[HKMedicalIDEditorCell editDelegate](self, "editDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "medicalIDEditorCellDidTapLabel:", self);

}

- (_HKEmergencyContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
