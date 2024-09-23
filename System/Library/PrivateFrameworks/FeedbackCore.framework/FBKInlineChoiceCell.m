@implementation FBKInlineChoiceCell

+ (id)reuseIdentifier
{
  return CFSTR("FBKInlineChoiceCell");
}

- (void)setChoice:(id)a3
{
  id v4;
  FBKQuestionChoice *v5;
  FBKQuestionChoice *choice;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[FBKInlineChoiceCell choice](self, "choice");
  v5 = (FBKQuestionChoice *)objc_claimAutoreleasedReturnValue();
  choice = self->_choice;
  self->_choice = v5;

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "title");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInlineChoiceCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

- (void)showCheckmark:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "initWithImage:", v6);
    -[FBKInlineChoiceCell setAccessoryView:](self, "setAccessoryView:", v5);

  }
  else
  {
    -[FBKInlineChoiceCell setAccessoryView:](self, "setAccessoryView:", 0);
  }
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (FBKQuestionChoice)choice
{
  return self->_choice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choice, 0);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
