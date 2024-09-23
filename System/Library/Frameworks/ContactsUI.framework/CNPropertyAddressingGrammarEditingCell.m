@implementation CNPropertyAddressingGrammarEditingCell

- (BOOL)allowsCellSelection
{
  return 0;
}

- (id)valueView
{
  return 0;
}

- (void)updateWithPropertyItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAddressingGrammarEditingCell;
  v4 = a3;
  -[CNPropertyCell updateWithPropertyItem:](&v11, sel_updateWithPropertyItem_, v4);
  objc_opt_class();
  objc_msgSend(v4, "labeledValue", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "localizedShortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelLabel](self, "labelLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyAddressingGrammarEditingCell;
  -[CNContactCell updateConstraints](&v4, sel_updateConstraints);
  -[CNPropertySimpleCell labelLabel](self, "labelLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);

}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

@end
