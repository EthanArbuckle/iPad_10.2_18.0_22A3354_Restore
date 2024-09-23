@implementation MUTextFactoidViewModel

- (MUTextFactoidViewModel)initWithTitle:(id)a3 valueString:(id)a4 symbolName:(id)a5 symbolColor:(id)a6 darkSymbolColor:(id)a7 shouldReverseForRTLLayout:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  MUTextFactoidViewModel *v18;
  MUTextFactoidViewModel *v19;
  id v21;
  id v22;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v22 = a5;
  v21 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MUTextFactoidViewModel;
  v18 = -[MUTextFactoidViewModel init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titleString, a3);
    objc_storeStrong((id *)&v19->_valueString, a4);
    objc_storeStrong((id *)&v19->_symbolName, a5);
    objc_storeStrong((id *)&v19->_symbolColor, a6);
    objc_storeStrong((id *)&v19->_darkSymbolColor, a7);
    v19->_shouldReverseForRTLLayout = a8;
  }

  return v19;
}

- (id)buildSymbolWithFont:(id)a3
{
  void *v3;
  NSString *symbolName;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3870];
  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v3, "_mapsui_systemImageNamed:", symbolName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithSymbolConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)symbolName
{
  return self->_symbolName;
}

- (id)titleString
{
  return self->_titleString;
}

- (id)valueString
{
  return self->_valueString;
}

- (id)symbolColor
{
  return self->_symbolColor;
}

- (id)darkSymbolColor
{
  return self->_darkSymbolColor;
}

- (BOOL)shouldReverseForRTLLayout
{
  return self->_shouldReverseForRTLLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkSymbolColor, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
