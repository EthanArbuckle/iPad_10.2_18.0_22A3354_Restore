@implementation CSHorizontalScrollFailureRecognizerSettings

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[CSHorizontalScrollFailureRecognizerSettings setEnabled:](self, "setEnabled:", 1);
  -[CSHorizontalScrollFailureRecognizerSettings setViewDebugArea:](self, "setViewDebugArea:", 0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 130;
  else
    v5 = 15;
  -[CSHorizontalScrollFailureRecognizerSettings setMaxAllowableVerticalOffset:](self, "setMaxAllowableVerticalOffset:", v5);
  -[CSHorizontalScrollFailureRecognizerSettings setTopAngle:](self, "setTopAngle:", 34.0);
  -[CSHorizontalScrollFailureRecognizerSettings setBottomAngle:](self, "setBottomAngle:", 34.0);
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
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Failure Recognizer Enabled?"), CFSTR("enabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("View Debug Area"), CFSTR("viewDebugArea"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Vertical Offset"), CFSTR("maxAllowableVerticalOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 480.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Top Angle"), CFSTR("topAngle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 90.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Bottom Angle"), CFSTR("bottomAngle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 90.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  v22[0] = v19;
  v22[1] = v2;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v21[0] = v6;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v20[0] = v11;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Slide To Unlock Failure Recognizer Settings"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)viewDebugArea
{
  return self->_viewDebugArea;
}

- (void)setViewDebugArea:(BOOL)a3
{
  self->_viewDebugArea = a3;
}

- (unint64_t)maxAllowableVerticalOffset
{
  return self->_maxAllowableVerticalOffset;
}

- (void)setMaxAllowableVerticalOffset:(unint64_t)a3
{
  self->_maxAllowableVerticalOffset = a3;
}

- (double)topAngle
{
  return self->_topAngle;
}

- (void)setTopAngle:(double)a3
{
  self->_topAngle = a3;
}

- (double)bottomAngle
{
  return self->_bottomAngle;
}

- (void)setBottomAngle:(double)a3
{
  self->_bottomAngle = a3;
}

@end
