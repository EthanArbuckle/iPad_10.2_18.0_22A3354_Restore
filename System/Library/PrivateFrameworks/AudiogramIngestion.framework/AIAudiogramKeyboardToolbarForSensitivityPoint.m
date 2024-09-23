@implementation AIAudiogramKeyboardToolbarForSensitivityPoint

- (AIAudiogramKeyboardToolbarForSensitivityPoint)initWithFrame:(CGRect)a3 target:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AIAudiogramKeyboardToolbarForSensitivityPoint *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20[4] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AIAudiogramKeyboardToolbarForSensitivityPoint;
  v10 = -[AIAudiogramKeyboardToolbarForSensitivityPoint initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
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

    v20[0] = v11;
    v20[1] = v16;
    v20[2] = v12;
    v20[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramKeyboardToolbarForSensitivityPoint setItems:](v10, "setItems:", v17);

  }
  return v10;
}

@end
