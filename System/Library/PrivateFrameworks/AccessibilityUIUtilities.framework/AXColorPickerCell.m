@implementation AXColorPickerCell

- (AXColorPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXColorPickerCell *v5;
  AXColorPickerCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXColorPickerCell;
  v5 = -[PSControlTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSControlTableCell control](v5, "control");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXColorPickerCell setAccessoryView:](v6, "setAccessoryView:", v7);

  }
  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXColorPickerCell;
  -[PSTableCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PSControlTableCell control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedColor:", 0);

}

- (id)newControl
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3670]), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  return v2;
}

- (BOOL)canReload
{
  return 1;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXColorPickerCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v9, sel_reloadWithSpecifier_animated_, a3, a4);
  -[AXColorPickerCell _colorValue](self, "_colorValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80568]), "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[PSControlTableCell control](self, "control");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXColorPickerCell _colorValue](self, "_colorValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedColor:", v8);

  }
}

- (id)controlValue
{
  void *v2;
  void *v3;

  -[PSControlTableCell control](self, "control");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setValue:(id)a3
{
  id v5;
  id *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80608]);
  if (*v6 != v5)
  {
    v9 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v9;
    if (!v9 || (isKindOfClass & 1) != 0)
    {
      objc_storeStrong(v6, a3);
      -[PSControlTableCell control](self, "control");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSelectedColor:", v9);

      v5 = v9;
    }
  }

}

- (id)_colorValue
{
  uint64_t v2;
  id v4;

  v2 = (int)*MEMORY[0x1E0D80608];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + v2)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v2);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXColorPickerCell;
  return *MEMORY[0x1E0DC4660] | -[AXColorPickerCell accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[AXColorPickerCell _colorValue](self, "_colorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    AXColorStringForColor(v2, 0);
  else
    AXUILocalizedStringForKey(CFSTR("NOT_SET"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
