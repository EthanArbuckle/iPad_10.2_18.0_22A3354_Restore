@implementation CSDashBoardNotificationVersusPagingScrollSettings

- (void)setDefaultValues
{
  -[CSDashBoardNotificationVersusPagingScrollSettings setColorsBackground:](self, "setColorsBackground:", 0);
  -[CSDashBoardNotificationVersusPagingScrollSettings setLeadingInset:](self, "setLeadingInset:", 24.0);
  -[CSDashBoardNotificationVersusPagingScrollSettings setTrailingInset:](self, "setTrailingInset:", 24.0);
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Colors Background"), CFSTR("colorsBackground"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v19[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading"), CFSTR("leadingInset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 256.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing"), CFSTR("trailingInset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 256.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v7;
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Portrait Phone Values"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v5;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Dismiss Gesture Settings"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)colorsBackground
{
  return self->_colorsBackground;
}

- (void)setColorsBackground:(BOOL)a3
{
  self->_colorsBackground = a3;
}

- (double)leadingInset
{
  return self->_leadingInset;
}

- (void)setLeadingInset:(double)a3
{
  self->_leadingInset = a3;
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (void)setTrailingInset:(double)a3
{
  self->_trailingInset = a3;
}

@end
