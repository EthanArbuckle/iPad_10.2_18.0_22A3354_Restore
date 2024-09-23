@implementation FBAChoiceCell

- (void)updateWithChoice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[FBAChoiceCell setChoice:](self, "setChoice:", v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
  objc_msgSend(v9, "setTextAlignment:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell choice](self, "choice"));
  LODWORD(v8) = objc_msgSend(v10, "canSelect");

  if ((_DWORD)v8)
  {
    -[FBAChoiceCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  else
  {
    -[FBAChoiceCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
  objc_msgSend(v13, "setTextColor:", v12);

  v14 = objc_opt_class(FBKAppQuestionChoice);
  if ((objc_opt_isKindOfClass(v18, v14) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell appIconForChoice:](self, "appIconForChoice:", v18));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell imageView](self, "imageView"));
    objc_msgSend(v16, "setImage:", v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  -[FBAChoiceCell setBackgroundColor:](self, "setBackgroundColor:", v17);

}

- (void)evaluateSelectionWithValue:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell choice](self, "choice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
    v7 = 3;
  else
    v7 = 0;
  -[FBAChoiceCell setAccessoryType:](self, "setAccessoryType:", v7);

}

- (void)evaluateSelectionWithValues:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell choice](self, "choice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
    v7 = 3;
  else
    v7 = 0;
  -[FBAChoiceCell setAccessoryType:](self, "setAccessoryType:", v7);

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
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "app"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    v8 = v7;

    v9 = objc_alloc((Class)ISIcon);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "app"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = objc_msgSend(v9, "initWithBundleIdentifier:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAChoiceCell textLabel](self, "textLabel"));
    objc_msgSend(v13, "frame");
    v15 = v14 * 0.6;

    v16 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", v15, v15, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForImageDescriptor:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v17, "CGImage"), 0, v8));

  }
  else
  {
    v18 = 0;
  }

  return v18;
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
