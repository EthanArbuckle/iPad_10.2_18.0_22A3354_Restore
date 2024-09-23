@implementation HUQuickControlSensorSectionLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUQuickControlSensorSectionLayoutOptions;
  objc_msgSendSuper2(&v8, sel_defaultOptionsForViewSize_, a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewSizeSubclass");
  v11[0] = &unk_1E7041068;
  v11[1] = &unk_1E7041080;
  v12[0] = &unk_1E70435A8;
  v12[1] = &unk_1E70435B8;
  v11[2] = &unk_1E7041098;
  v12[2] = &unk_1E70435C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumNavBarToControlsSpacing:", HUConstantFloatForViewSizeSubclass(v4, v5));

  objc_msgSend(v3, "setRowSpacing:", 48.0);
  v9[0] = &unk_1E7041068;
  v9[1] = &unk_1E7041080;
  v10[0] = &unk_1E70410B0;
  v10[1] = &unk_1E70410C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThermostatSectionSpacingOverride:", HUConstantFloatForViewSizeSubclass(v4, v6));

  objc_msgSend(v3, "setInteritemSpacingForExtraSmallControlSize:", 30.0);
  objc_msgSend(v3, "setInteritemSpacingForSmallControlSize:", 30.0);
  objc_msgSend(v3, "setInteritemSpacingForRegularControlSize:", 30.0);
  objc_msgSend(v3, "setInteritemSpacingForLargeControlSize:", 30.0);
  return v3;
}

@end
