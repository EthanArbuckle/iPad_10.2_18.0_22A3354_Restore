@implementation AIAudiogramKeyboardToolbar

- (AIAudiogramKeyboardToolbar)initWithFrame:(CGRect)a3 target:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AIAudiogramKeyboardToolbar *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _QWORD v29[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29[7] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AIAudiogramKeyboardToolbar;
  v10 = -[AIAudiogramKeyboardToolbar initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD410], "fixedSpaceItemOfWidth:", 10.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD410], "flexibleSpaceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_keyboardDoneTapped);
    v14 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.slash.minus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithImage:style:target:action:", v15, 0, v9, sel_keyboardNegationTapped);

    aiLocString(CFSTR("AudiogramIngestionResultsNegateDecibel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityLabel:", v17);

    v18 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.up"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithImage:style:target:action:", v19, 0, v9, sel_keyboardPreviousTapped);
    -[AIAudiogramKeyboardToolbar setPreviousItemButton:](v10, "setPreviousItemButton:", v20);

    v21 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.down"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithImage:style:target:action:", v22, 0, v9, sel_keyboardNextTapped);
    -[AIAudiogramKeyboardToolbar setNextItemButton:](v10, "setNextItemButton:", v23);

    -[AIAudiogramKeyboardToolbar previousItemButton](v10, "previousItemButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    v29[1] = v11;
    -[AIAudiogramKeyboardToolbar nextItemButton](v10, "nextItemButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v25;
    v29[3] = v11;
    v29[4] = v16;
    v29[5] = v12;
    v29[6] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramKeyboardToolbar setItems:](v10, "setItems:", v26);

  }
  return v10;
}

- (UIBarButtonItem)previousItemButton
{
  return self->_previousItemButton;
}

- (void)setPreviousItemButton:(id)a3
{
  objc_storeStrong((id *)&self->_previousItemButton, a3);
}

- (UIBarButtonItem)nextItemButton
{
  return self->_nextItemButton;
}

- (void)setNextItemButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextItemButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextItemButton, 0);
  objc_storeStrong((id *)&self->_previousItemButton, 0);
}

@end
