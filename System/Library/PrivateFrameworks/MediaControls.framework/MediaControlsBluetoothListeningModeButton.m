@implementation MediaControlsBluetoothListeningModeButton

- (MediaControlsBluetoothListeningModeButton)initWithFrame:(CGRect)a3
{
  MediaControlsBluetoothListeningModeButton *v3;
  void *v4;
  uint64_t v5;
  UIColor *offColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MediaControlsBluetoothListeningModeButton;
  v3 = -[MediaControlsExpandableButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[MRUStringsProvider listeningModeTitle](MRUStringsProvider, "listeningModeTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsExpandableButton setTitle:](v3, "setTitle:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v5 = objc_claimAutoreleasedReturnValue();
    offColor = v3->_offColor;
    v3->_offColor = (UIColor *)v5;

    -[MediaControlsExpandableButton setButtonImageSize:](v3, "setButtonImageSize:", 54.0, 54.0);
  }
  return v3;
}

- (id)initForControlCenter
{
  _QWORD *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsBluetoothListeningModeButton;
  v2 = -[MediaControlsExpandableButton initForControlCenter](&v6, sel_initForControlCenter);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)v2[80];
    v2[80] = 0;

  }
  return v3;
}

- (void)setAvailableListeningModes:(id)a3
{
  void *v5;
  uint64_t v6;
  MediaControlsExpandableButtonOption *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MediaControlsExpandableButtonOption *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MediaControlsExpandableButtonOption *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MediaControlsExpandableButtonOption *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  if (!-[NSSet isEqualToSet:](self->_availableListeningModes, "isEqualToSet:"))
  {
    objc_storeStrong((id *)&self->_availableListeningModes, a3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v29, "count"));
    v6 = *MEMORY[0x1E0C8AB70];
    if (objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C8AB70]))
    {
      v7 = objc_alloc_init(MediaControlsExpandableButtonOption);
      -[MediaControlsExpandableButtonOption setIdentifier:](v7, "setIdentifier:", v6);
      +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeAuto"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setAsset:](v7, "setAsset:", v8);

      +[MRUStringsProvider listeningModeAutomatic](MRUStringsProvider, "listeningModeAutomatic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setTitle:](v7, "setTitle:", v9);

      -[MediaControlsExpandableButtonOption setSelectedState:](v7, "setSelectedState:", CFSTR("on"));
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setSelectedBackgroundColor:](v7, "setSelectedBackgroundColor:", v10);

      objc_msgSend(v5, "addObject:", v7);
    }
    v11 = *MEMORY[0x1E0C8AB68];
    if (objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C8AB68]))
    {
      v12 = objc_alloc_init(MediaControlsExpandableButtonOption);
      -[MediaControlsExpandableButtonOption setIdentifier:](v12, "setIdentifier:", v11);
      +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeTransparency"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setAsset:](v12, "setAsset:", v13);

      +[MRUStringsProvider listeningModeTransparency](MRUStringsProvider, "listeningModeTransparency");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setTitle:](v12, "setTitle:", v14);

      -[MediaControlsExpandableButtonOption setSelectedState:](v12, "setSelectedState:", CFSTR("on"));
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setSelectedBackgroundColor:](v12, "setSelectedBackgroundColor:", v15);

      objc_msgSend(v5, "addObject:", v12);
    }
    v16 = *MEMORY[0x1E0C8AB78];
    if (objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C8AB78]))
    {
      v17 = objc_alloc_init(MediaControlsExpandableButtonOption);
      -[MediaControlsExpandableButtonOption setIdentifier:](v17, "setIdentifier:", v16);
      +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeOff"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setAsset:](v17, "setAsset:", v18);

      +[MRUStringsProvider listeningModeOff](MRUStringsProvider, "listeningModeOff");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setTitle:](v17, "setTitle:", v19);

      -[MediaControlsExpandableButtonOption setSelectedState:](v17, "setSelectedState:", CFSTR("on"));
      -[MediaControlsExpandableButtonOption setSelectedBackgroundColor:](v17, "setSelectedBackgroundColor:", self->_offColor);
      objc_msgSend(v5, "addObject:", v17);

    }
    v20 = *MEMORY[0x1E0C8AB60];
    if (objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0C8AB60]))
    {
      v21 = objc_alloc_init(MediaControlsExpandableButtonOption);
      -[MediaControlsExpandableButtonOption setIdentifier:](v21, "setIdentifier:", v20);
      +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", CFSTR("ListeningModeNoiseCancellation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setAsset:](v21, "setAsset:", v22);

      +[MRUStringsProvider listeningModeNoiseCancellation](MRUStringsProvider, "listeningModeNoiseCancellation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setTitle:](v21, "setTitle:", v23);

      -[MediaControlsExpandableButtonOption setSelectedState:](v21, "setSelectedState:", CFSTR("on"));
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButtonOption setSelectedBackgroundColor:](v21, "setSelectedBackgroundColor:", v24);

      objc_msgSend(v5, "addObject:", v21);
    }
    -[MediaControlsBluetoothListeningModeButton traitCollection](self, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "layoutDirection");

    if (v26 == 1)
    {
      objc_msgSend(v5, "reverseObjectEnumerator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsExpandableButton setOptions:](self, "setOptions:", v28);

    }
    else
    {
      v27 = (void *)objc_msgSend(v5, "copy");
      -[MediaControlsExpandableButton setOptions:](self, "setOptions:", v27);
    }

  }
}

- (NSString)selectedListeningMode
{
  void *v2;
  void *v3;

  -[MediaControlsExpandableButton selectedOption](self, "selectedOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSelectedListeningMode:(id)a3
{
  -[MediaControlsBluetoothListeningModeButton setSelectedListeningMode:animated:](self, "setSelectedListeningMode:animated:", a3, 0);
}

- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  -[MediaControlsExpandableButton options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__MediaControlsBluetoothListeningModeButton_setSelectedListeningMode_animated___block_invoke;
  v10[3] = &unk_1E581ACD0;
  v11 = v6;
  v9 = v6;
  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v10);

  -[MediaControlsExpandableButton setSelectedOptionIndex:animated:](self, "setSelectedOptionIndex:animated:", v8, v4);
}

uint64_t __79__MediaControlsBluetoothListeningModeButton_setSelectedListeningMode_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)playRequiresBothBudsInEarErrorHaptic
{
  id v3;

  +[MRUStringsProvider listeningModeErrorMessage](MRUStringsProvider, "listeningModeErrorMessage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButton playFailedValueChangedEventHapticWithMessage:](self, "playFailedValueChangedEventHapticWithMessage:", v3);

}

- (NSSet)availableListeningModes
{
  return self->_availableListeningModes;
}

- (UIColor)offColor
{
  return self->_offColor;
}

- (void)setOffColor:(id)a3
{
  objc_storeStrong((id *)&self->_offColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offColor, 0);
  objc_storeStrong((id *)&self->_availableListeningModes, 0);
}

@end
