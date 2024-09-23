@implementation FBKChoiceCell

- (void)updateWithChoice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[FBKChoiceCell setChoice:](self, "setChoice:", v16);
  -[FBKChoiceCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  objc_msgSend(v16, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKChoiceCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKChoiceCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  -[FBKChoiceCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 0);

  -[FBKChoiceCell choice](self, "choice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "canSelect");

  if ((_DWORD)v8)
  {
    -[FBKChoiceCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  }
  else
  {
    -[FBKChoiceCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKChoiceCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FBKChoiceCell appIconForChoice:](self, "appIconForChoice:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKChoiceCell imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKChoiceCell setBackgroundColor:](self, "setBackgroundColor:", v15);

}

- (void)evaluateSelectionWithValue:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[FBKChoiceCell choice](self, "choice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
    v7 = 3;
  else
    v7 = 0;
  -[FBKChoiceCell setAccessoryType:](self, "setAccessoryType:", v7);

}

- (void)evaluateSelectionWithValues:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[FBKChoiceCell choice](self, "choice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
    v7 = 3;
  else
    v7 = 0;
  -[FBKChoiceCell setAccessoryType:](self, "setAccessoryType:", v7);

}

- (id)appIconForChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    v9 = objc_alloc(MEMORY[0x24BE51A90]);
    objc_msgSend(v4, "app");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:", v11);

    -[FBKChoiceCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14 * 0.6;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", v15, v15, v8);
    objc_msgSend(v12, "imageForImageDescriptor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "CGImage");
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v18, 0, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (FBKQuestionChoice)choice
{
  return (FBKQuestionChoice *)objc_loadWeakRetained((id *)&self->_choice);
}

- (void)setChoice:(id)a3
{
  objc_storeWeak((id *)&self->_choice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_choice);
}

@end
