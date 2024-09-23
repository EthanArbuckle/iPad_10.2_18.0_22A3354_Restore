@implementation MUPlaceActionControlledItemViewModel

- (MUPlaceActionControlledItemViewModel)initWithPlaceActionController:(id)a3
{
  id v5;
  MUPlaceActionControlledItemViewModel *v6;
  MUPlaceActionControlledItemViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceActionControlledItemViewModel;
  v6 = -[MUActionRowItemViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_actionButtonController, a3);

  return v7;
}

- (id)titleText
{
  return (id)-[_MKPlaceActionButtonController buttonTitle](self->_actionButtonController, "buttonTitle");
}

- (id)symbolName
{
  return (id)-[_MKPlaceActionButtonController symbolName](self->_actionButtonController, "symbolName");
}

- (BOOL)isEnabled
{
  return -[_MKPlaceActionButtonController disabled](self->_actionButtonController, "disabled") ^ 1;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MUPlaceActionControlledItemViewModel titleText](self, "titleText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s"), &stru_1E2E05448, 1024, 0, objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performWithPresentationOptions:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[_MKPlaceActionButtonController buttonSelectedBlock](self->_actionButtonController, "buttonSelectedBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MKPlaceActionButtonController buttonSelectedBlock](self->_actionButtonController, "buttonSelectedBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

- (id)analyticsButtonValues
{
  id v3;
  id *v4;
  void *v5;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[_MKPlaceActionButtonController analyticsAction](self->_actionButtonController, "analyticsAction") == 403)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D27458]);
    objc_msgSend(v3, "setType:", 57);
    v8[0] = v3;
    v4 = (id *)v8;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  if (-[_MKPlaceActionButtonController analyticsAction](self->_actionButtonController, "analyticsAction") == 405)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D27458]);
    objc_msgSend(v3, "setType:", 58);
    v7 = v3;
    v4 = &v7;
    goto LABEL_5;
  }
  return MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonController, 0);
}

@end
