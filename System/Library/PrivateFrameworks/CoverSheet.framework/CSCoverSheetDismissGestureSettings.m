@implementation CSCoverSheetDismissGestureSettings

- (BOOL)extendSwipeUpRegion
{
  return self->_extendSwipeUpRegion;
}

- (void)setDefaultValues
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (SBFEffectiveHomeButtonType() == 2 && !MGGetBoolAnswer())
  {
    v7 = 16.0;
    v4 = 1.0;
    v3 = 1;
    v5 = 64.0;
    v6 = 33.75;
  }
  else
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 33.75;
    v6 = 72.0;
    v7 = 0.0;
  }
  -[CSCoverSheetDismissGestureSettings setEdgeRegionSize:](self, "setEdgeRegionSize:", v6);
  -[CSCoverSheetDismissGestureSettings setUsesGrapeFlags:](self, "setUsesGrapeFlags:", v3);
  -[CSCoverSheetDismissGestureSettings setRecognizeAlongEdge:](self, "setRecognizeAlongEdge:", v4);
  -[CSCoverSheetDismissGestureSettings setExtendSwipeUpRegion:](self, "setExtendSwipeUpRegion:", v3);
  -[CSCoverSheetDismissGestureSettings setExtendedEdgeRegionSize:](self, "setExtendedEdgeRegionSize:", v5);
  -[CSCoverSheetDismissGestureSettings setExtendedRegionInsetX:](self, "setExtendedRegionInsetX:", v7);
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
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Edge Region Size"), CFSTR("edgeRegionSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 10.0, 512.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Grape Flags"), CFSTR("usesGrapeFlags"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Recognizes Along Edge"), CFSTR("recognizeAlongEdge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v23[0] = v20;
  v23[1] = v19;
  v23[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Extend Edge Region"), CFSTR("extendSwipeUpRegion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Extended Region Size"), CFSTR("extendedEdgeRegionSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 30.0, 800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Extended Region Inset X"), CFSTR("extendedRegionInsetX"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 150.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v22[0] = v7;
  v22[1] = v9;
  v22[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v21[0] = v6;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Dismiss Gesture Settings"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)usesGrapeFlags
{
  return self->_usesGrapeFlags;
}

- (void)setUsesGrapeFlags:(BOOL)a3
{
  self->_usesGrapeFlags = a3;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (double)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(double)a3
{
  self->_recognizeAlongEdge = a3;
}

- (void)setExtendSwipeUpRegion:(BOOL)a3
{
  self->_extendSwipeUpRegion = a3;
}

- (double)extendedEdgeRegionSize
{
  return self->_extendedEdgeRegionSize;
}

- (void)setExtendedEdgeRegionSize:(double)a3
{
  self->_extendedEdgeRegionSize = a3;
}

- (double)extendedRegionInsetX
{
  return self->_extendedRegionInsetX;
}

- (void)setExtendedRegionInsetX:(double)a3
{
  self->_extendedRegionInsetX = a3;
}

@end
