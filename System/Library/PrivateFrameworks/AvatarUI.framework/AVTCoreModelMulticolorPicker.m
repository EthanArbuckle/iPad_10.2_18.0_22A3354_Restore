@implementation AVTCoreModelMulticolorPicker

- (AVTCoreModelMulticolorPicker)initWithTitle:(id)a3 subpickers:(id)a4 subtitles:(id)a5 nestedPresetPickers:(id)a6 auxiliaryPicker:(id)a7 initialState:(int64_t)a8 allowsRemoval:(BOOL)a9 options:(id)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  AVTCoreModelMulticolorPicker *v25;
  uint64_t v27;

  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a10;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v16, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a9;
  v25 = -[AVTCoreModelMulticolorPicker initWithIdentifier:title:subpickers:subtitles:nestedPresetPickers:auxiliaryPicker:initialState:allowsRemoval:options:](self, "initWithIdentifier:title:subpickers:subtitles:nestedPresetPickers:auxiliaryPicker:initialState:allowsRemoval:options:", v24, v22, v21, v20, v19, v18, a8, v27, v17);

  return v25;
}

- (AVTCoreModelMulticolorPicker)initWithIdentifier:(id)a3 title:(id)a4 subpickers:(id)a5 subtitles:(id)a6 nestedPresetPickers:(id)a7 auxiliaryPicker:(id)a8 initialState:(int64_t)a9 allowsRemoval:(BOOL)a10 options:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  AVTCoreModelMulticolorPicker *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *title;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v17 = a4;
  v18 = a5;
  v28 = a6;
  v27 = a7;
  v19 = a8;
  v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)AVTCoreModelMulticolorPicker;
  v21 = -[AVTCoreModelMulticolorPicker init](&v30, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v29, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v24;

    objc_storeStrong((id *)&v21->_options, a11);
    objc_storeStrong((id *)&v21->_subpickers, a5);
    objc_storeStrong((id *)&v21->_subtitles, a6);
    objc_storeStrong((id *)&v21->_nestedPresetPickers, a7);
    objc_storeStrong((id *)&v21->_auxiliaryPicker, a8);
    v21->_initialState = a9;
    v21->_allowsRemoval = a10;
  }

  return v21;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVTCoreModelMulticolorPicker;
  -[AVTCoreModelMulticolorPicker description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelMulticolorPicker identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@"), v5);

  -[AVTCoreModelMulticolorPicker title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" title: %@"), v6);

  -[AVTCoreModelMulticolorPicker subpickers](self, "subpickers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avt_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" subpickers: %@"), v8);

  -[AVTCoreModelMulticolorPicker subtitles](self, "subtitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avt_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" subtitles: %@"), v10);

  -[AVTCoreModelMulticolorPicker nestedPresetPickers](self, "nestedPresetPickers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" nestedPresetPickers: %@"), v11);

  -[AVTCoreModelMulticolorPicker auxiliaryPicker](self, "auxiliaryPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" auxiliaryPicker: %@"), v12);

  objc_msgSend(v4, "appendFormat:", CFSTR(" initialState: %lu"), -[AVTCoreModelMulticolorPicker initialState](self, "initialState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVTCoreModelMulticolorPicker allowsRemoval](self, "allowsRemoval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" allowsRemoval: %@"), v13);

  v14 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (AVTCoreModelMulticolorAuxiliaryPicker)auxiliaryPicker
{
  return self->_auxiliaryPicker;
}

- (NSArray)subpickers
{
  return self->_subpickers;
}

- (NSArray)subtitles
{
  return self->_subtitles;
}

- (NSDictionary)nestedPresetPickers
{
  return self->_nestedPresetPickers;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (BOOL)allowsRemoval
{
  return self->_allowsRemoval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedPresetPickers, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_subpickers, 0);
  objc_storeStrong((id *)&self->_auxiliaryPicker, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
