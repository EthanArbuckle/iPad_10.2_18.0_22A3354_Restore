@implementation _SWCollaborationOption

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  _SWCollaborationOption *v19;
  objc_super v21;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  if (v14)
  {
    v17 = (__CFString *)objc_msgSend(v14, "copy");
    if (v16)
    {
LABEL_3:
      v18 = (void *)objc_msgSend(v16, "copy");
      goto LABEL_6;
    }
  }
  else
  {
    v17 = &stru_1E217B478;
    if (v15)
      goto LABEL_3;
  }
  v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)_SWCollaborationOption;
  v19 = -[SWCollaborationOption initWithTitle:identifier:subtitle:selected:requiredOptionsIdentifiers:](&v21, sel_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_, v12, v13, v17, v8, v18);
  if (v16)

  if (v14)
  return v19;
}

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 selected:(BOOL)a5
{
  return -[_SWCollaborationOption initWithTitle:identifier:subtitle:selected:requiredOptionsIdentifiers:](self, "initWithTitle:identifier:subtitle:selected:requiredOptionsIdentifiers:", a3, a4, &stru_1E217B478, a5, MEMORY[0x1E0C9AA60]);
}

- (_SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 requiredOptionsIdentifiers:(id)a6
{
  return -[_SWCollaborationOption initWithTitle:identifier:subtitle:selected:requiredOptionsIdentifiers:](self, "initWithTitle:identifier:subtitle:selected:requiredOptionsIdentifiers:", a3, a4, a5, 0, a6);
}

@end
