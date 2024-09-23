@implementation PKPaletteSelectingToolView

- (PKPaletteSelectingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  PKPaletteSelectingToolView *v9;
  PKPaletteInkingToolView *v10;
  PKPaletteInkingTool *inkTool;
  objc_super v13;

  v7 = a3;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteSelectingToolView;
  v9 = -[PKPaletteToolView initWithToolIdentifier:variant:configuration:](&v13, sel_initWithToolIdentifier_variant_configuration_, v7, 0, v8);
  if (v9)
  {
    v10 = -[PKPaletteInkingToolView initWithToolIdentifier:variant:configuration:]([PKPaletteInkingToolView alloc], "initWithToolIdentifier:variant:configuration:", v7, 0, v8);
    inkTool = v9->_inkTool;
    v9->_inkTool = (PKPaletteInkingTool *)v10;

  }
  return v9;
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaletteSelectingToolView;
  -[PKPaletteToolView setSelected:](&v5, sel_setSelected_, a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteSelectingToolView setInkColor:](self, "setInkColor:", v4);

}

- (PKInk)ink
{
  void *v2;
  void *v3;

  -[PKPaletteSelectingToolView inkTool](self, "inkTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInk *)v3;
}

- (void)setInkColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaletteSelectingToolView inkTool](self, "inkTool");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInkColor:", v4);

}

- (void)setInkWeight:(double)a3
{
  id v4;

  -[PKPaletteSelectingToolView inkTool](self, "inkTool");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInkWeight:", a3);

}

- (id)attributeViewController
{
  return 0;
}

- (PKPaletteInkingTool)inkTool
{
  return self->_inkTool;
}

- (void)setInkTool:(id)a3
{
  objc_storeStrong((id *)&self->_inkTool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inkTool, 0);
}

@end
