@implementation WFMakeImageFromPDFPageColorspaceParameter

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id WeakRetained;
  id v6;
  id obj;

  p_action = &self->_action;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  v6 = objc_storeWeak((id *)p_action, obj);
  objc_msgSend(obj, "addEventObserver:", self);

}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFMakeImageFromPDFPageColorspaceParameter;
  -[WFMakeImageFromPDFPageColorspaceParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFMakeImageFromPDFPageColorspaceParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFMakeImageFromPDFPageColorspaceParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFMakeImageFromPDFPageColorspaceParameter action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterStateForKey:", CFSTR("WFMakeImageFromPDFPageImageFormat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v11 = 0;
      return v11;
    }
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)CGImageDestinationCopyImageFormats();

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(v7, "containsObject:", CFSTR("kCGImageDestinationCanRGB")))
      objc_msgSend(v8, "addObject:", CFSTR("RGB"));
    if (objc_msgSend(v7, "containsObject:", CFSTR("kCGImageDestinationCanCMYK")))
      objc_msgSend(v8, "addObject:", CFSTR("CMYK"));
    if (objc_msgSend(v7, "containsObject:", CFSTR("kCGImageDestinationCanGray")))
      objc_msgSend(v8, "addObject:", CFSTR("Gray"));
    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_28006);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  v11 = possibleStates;
  return v11;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("WFMakeImageFromPDFPageImageFormat")))
    -[WFMakeImageFromPDFPageColorspaceParameter possibleStatesDidChange](self, "possibleStatesDidChange");
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __59__WFMakeImageFromPDFPageColorspaceParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end
