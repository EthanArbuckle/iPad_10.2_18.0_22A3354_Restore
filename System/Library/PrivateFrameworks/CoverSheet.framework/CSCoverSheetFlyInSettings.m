@implementation CSCoverSheetFlyInSettings

- (void)setDefaultValues
{
  uint64_t v3;
  double v4;
  double v5;

  -[CSCoverSheetFlyInSettings setCenterFollowsFinger:](self, "setCenterFollowsFinger:", 0);
  -[CSCoverSheetFlyInSettings setAnimateIconsOnPresentationToo:](self, "setAnimateIconsOnPresentationToo:", 0);
  -[CSCoverSheetFlyInSettings setIconsFlyInInteractiveResponseMin:](self, "setIconsFlyInInteractiveResponseMin:", 0.5);
  -[CSCoverSheetFlyInSettings setIconsFlyInInteractiveResponseMax:](self, "setIconsFlyInInteractiveResponseMax:", 0.86);
  -[CSCoverSheetFlyInSettings setIconsFlyInInteractiveDampingRatioMin:](self, "setIconsFlyInInteractiveDampingRatioMin:", 0.7);
  -[CSCoverSheetFlyInSettings setIconsFlyInInteractiveDampingRatioMax:](self, "setIconsFlyInInteractiveDampingRatioMax:", 0.9);
  v3 = SBFEffectiveHomeButtonType();
  v4 = 130.0;
  if (v3 == 2)
  {
    v4 = 72.0;
    v5 = 14.4;
  }
  else
  {
    v5 = 22.0;
  }
  -[CSCoverSheetFlyInSettings setIconsFlyInTension:](self, "setIconsFlyInTension:", v4);
  -[CSCoverSheetFlyInSettings setIconsFlyInFriction:](self, "setIconsFlyInFriction:", v5);
  -[CSCoverSheetFlyInSettings setSlomoRate:](self, "setSlomoRate:", 2000.0);
  -[CSCoverSheetFlyInSettings setBaselineDistance:](self, "setBaselineDistance:", 0.5);
  -[CSCoverSheetFlyInSettings setEffectMultiplier:](self, "setEffectMultiplier:", 7.7);
  -[CSCoverSheetFlyInSettings setDistanceExponent:](self, "setDistanceExponent:", 1.0);
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
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Center Follows Finger"), CFSTR("centerFollowsFinger"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animate On Presentation Too"), CFSTR("animateIconsOnPresentationToo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v33[0] = v28;
  v33[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Icons FlyIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tension"), CFSTR("iconsFlyInTension"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Friction"), CFSTR("iconsFlyInFriction"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83078];
  v32[0] = v26;
  v32[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Animated"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Response Min"), CFSTR("iconsFlyInInteractiveResponseMin"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Response Max"), CFSTR("iconsFlyInInteractiveResponseMax"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Damping Ratio Min"), CFSTR("iconsFlyInInteractiveDampingRatioMin"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Interactive Damping Ratio Max"), CFSTR("iconsFlyInInteractiveDampingRatioMax"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v31[0] = v24;
  v31[1] = v23;
  v31[2] = v22;
  v31[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v8, CFSTR("Interactive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Baseline Distance"), CFSTR("baselineDistance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Effect Multiplier"), CFSTR("effectMultiplier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Distance Exponent"), CFSTR("distanceExponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83078];
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("Animation / Curve"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v29[0] = v4;
  v29[1] = v21;
  v29[2] = v9;
  v29[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Hey"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)centerFollowsFinger
{
  return self->_centerFollowsFinger;
}

- (void)setCenterFollowsFinger:(BOOL)a3
{
  self->_centerFollowsFinger = a3;
}

- (BOOL)animateIconsOnPresentationToo
{
  return self->_animateIconsOnPresentationToo;
}

- (void)setAnimateIconsOnPresentationToo:(BOOL)a3
{
  self->_animateIconsOnPresentationToo = a3;
}

- (double)iconsFlyInInteractiveResponseMin
{
  return self->_iconsFlyInInteractiveResponseMin;
}

- (void)setIconsFlyInInteractiveResponseMin:(double)a3
{
  self->_iconsFlyInInteractiveResponseMin = a3;
}

- (double)iconsFlyInInteractiveResponseMax
{
  return self->_iconsFlyInInteractiveResponseMax;
}

- (void)setIconsFlyInInteractiveResponseMax:(double)a3
{
  self->_iconsFlyInInteractiveResponseMax = a3;
}

- (double)iconsFlyInInteractiveDampingRatioMin
{
  return self->_iconsFlyInInteractiveDampingRatioMin;
}

- (void)setIconsFlyInInteractiveDampingRatioMin:(double)a3
{
  self->_iconsFlyInInteractiveDampingRatioMin = a3;
}

- (double)iconsFlyInInteractiveDampingRatioMax
{
  return self->_iconsFlyInInteractiveDampingRatioMax;
}

- (void)setIconsFlyInInteractiveDampingRatioMax:(double)a3
{
  self->_iconsFlyInInteractiveDampingRatioMax = a3;
}

- (double)iconsFlyInTension
{
  return self->_iconsFlyInTension;
}

- (void)setIconsFlyInTension:(double)a3
{
  self->_iconsFlyInTension = a3;
}

- (double)iconsFlyInFriction
{
  return self->_iconsFlyInFriction;
}

- (void)setIconsFlyInFriction:(double)a3
{
  self->_iconsFlyInFriction = a3;
}

- (double)slomoRate
{
  return self->_slomoRate;
}

- (void)setSlomoRate:(double)a3
{
  self->_slomoRate = a3;
}

- (double)baselineDistance
{
  return self->_baselineDistance;
}

- (void)setBaselineDistance:(double)a3
{
  self->_baselineDistance = a3;
}

- (double)effectMultiplier
{
  return self->_effectMultiplier;
}

- (void)setEffectMultiplier:(double)a3
{
  self->_effectMultiplier = a3;
}

- (double)distanceExponent
{
  return self->_distanceExponent;
}

- (void)setDistanceExponent:(double)a3
{
  self->_distanceExponent = a3;
}

@end
