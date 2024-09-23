@implementation CinematicFramingSessionFramingParameters

- (CinematicFramingSessionFramingParameters)initWithPlist:(id)a3
{
  id v4;
  CinematicFramingSessionFramingParameters *v5;
  CinematicFramingSessionFramingParameters *v6;
  CinematicFramingSessionFramingParameters *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CinematicFramingSessionFramingParameters;
  v5 = -[CinematicFramingSessionFramingParameters init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CinematicFramingSessionFramingParameters _initializeWithPlist:](v5, "_initializeWithPlist:", v4);
    v7 = v6;
  }

  return v6;
}

- (CinematicFramingSessionFramingParameters)initWithPlistPath:(id)a3
{
  id v4;
  CinematicFramingSessionFramingParameters *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CinematicFramingSessionFramingParameters;
  v5 = -[CinematicFramingSessionFramingParameters init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CinematicFramingSessionFramingParameters initWithPlist:](v5, "initWithPlist:", v6);

  }
  return v5;
}

- (id)asDictionary
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[15];
  _QWORD v36[17];

  v36[15] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("horizontalMinAbsoluteDifferenceThreshold");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters horizontalMinAbsoluteDifferenceThreshold](self, "horizontalMinAbsoluteDifferenceThreshold");
  objc_msgSend(v3, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v34;
  v35[1] = CFSTR("horizontalMinRelativeDifferenceThreshold");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters horizontalMinRelativeDifferenceThreshold](self, "horizontalMinRelativeDifferenceThreshold");
  objc_msgSend(v4, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v33;
  v35[2] = CFSTR("widthPaddingMultiplierNoFocusTight");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters widthPaddingMultiplierNoFocusTight](self, "widthPaddingMultiplierNoFocusTight");
  objc_msgSend(v5, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v35[3] = CFSTR("widthPaddingMultiplierNoFocusRelaxed");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters widthPaddingMultiplierNoFocusRelaxed](self, "widthPaddingMultiplierNoFocusRelaxed");
  objc_msgSend(v6, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v31;
  v35[4] = CFSTR("widthPaddingAdditive");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters widthPaddingAdditive](self, "widthPaddingAdditive");
  objc_msgSend(v7, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v30;
  v35[5] = CFSTR("topMarginFractionTight");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters topMarginFractionTight](self, "topMarginFractionTight");
  objc_msgSend(v8, "numberWithFloat:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v29;
  v35[6] = CFSTR("topMarginFractionRelaxed");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters topMarginFractionRelaxed](self, "topMarginFractionRelaxed");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v10;
  v35[7] = CFSTR("minCropSize");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters minCropSize](self, "minCropSize");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v12;
  v35[8] = CFSTR("deadbandWidthMinFraction");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters deadbandWidthMinFraction](self, "deadbandWidthMinFraction");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v14;
  v35[9] = CFSTR("deadbandWidthMaxFraction");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters deadbandWidthMaxFraction](self, "deadbandWidthMaxFraction");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v16;
  v35[10] = CFSTR("deadbandWidthFractionOfScreenWidth");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self, "deadbandWidthFractionOfScreenWidth");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v18;
  v35[11] = CFSTR("deadbandHeightFractionOfScreenHeight");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self, "deadbandHeightFractionOfScreenHeight");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v20;
  v35[12] = CFSTR("deadbandTopOffsetFractionOfScreenHeight");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self, "deadbandTopOffsetFractionOfScreenHeight");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v22;
  v35[13] = CFSTR("subjectWidthPaddingMultiplier");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters subjectWidthPaddingMultiplier](self, "subjectWidthPaddingMultiplier");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v24;
  v35[14] = CFSTR("subjectHeightPaddingMultiplier");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionFramingParameters subjectHeightPaddingMultiplier](self, "subjectHeightPaddingMultiplier");
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[14] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)_initializeWithPlist:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float Float;
  double v20;

  v4 = a3;
  *(float *)&v5 = PlistReadFloat(v4, CFSTR("horizontalMinAbsoluteDifferenceThreshold"), 0.0);
  -[CinematicFramingSessionFramingParameters setHorizontalMinAbsoluteDifferenceThreshold:](self, "setHorizontalMinAbsoluteDifferenceThreshold:", v5);
  *(float *)&v6 = PlistReadFloat(v4, CFSTR("horizontalMinRelativeDifferenceThreshold"), 0.0);
  -[CinematicFramingSessionFramingParameters setHorizontalMinRelativeDifferenceThreshold:](self, "setHorizontalMinRelativeDifferenceThreshold:", v6);
  *(float *)&v7 = PlistReadFloat(v4, CFSTR("widthPaddingMultiplierNoFocusTight"), 0.0);
  -[CinematicFramingSessionFramingParameters setWidthPaddingMultiplierNoFocusTight:](self, "setWidthPaddingMultiplierNoFocusTight:", v7);
  *(float *)&v8 = PlistReadFloat(v4, CFSTR("widthPaddingMultiplierNoFocusRelaxed"), 0.0);
  -[CinematicFramingSessionFramingParameters setWidthPaddingMultiplierNoFocusRelaxed:](self, "setWidthPaddingMultiplierNoFocusRelaxed:", v8);
  *(float *)&v9 = PlistReadFloat(v4, CFSTR("widthPaddingAdditive"), 0.0);
  -[CinematicFramingSessionFramingParameters setWidthPaddingAdditive:](self, "setWidthPaddingAdditive:", v9);
  *(float *)&v10 = PlistReadFloat(v4, CFSTR("topMarginFractionTight"), 0.0);
  -[CinematicFramingSessionFramingParameters setTopMarginFractionTight:](self, "setTopMarginFractionTight:", v10);
  *(float *)&v11 = PlistReadFloat(v4, CFSTR("topMarginFractionRelaxed"), 0.0);
  -[CinematicFramingSessionFramingParameters setTopMarginFractionRelaxed:](self, "setTopMarginFractionRelaxed:", v11);
  *(float *)&v12 = PlistReadFloat(v4, CFSTR("minCropSize"), 0.0);
  -[CinematicFramingSessionFramingParameters setMinCropSize:](self, "setMinCropSize:", v12);
  *(float *)&v13 = PlistReadFloat(v4, CFSTR("deadbandWidthMinFraction"), 0.8);
  -[CinematicFramingSessionFramingParameters setDeadbandWidthMinFraction:](self, "setDeadbandWidthMinFraction:", v13);
  *(float *)&v14 = PlistReadFloat(v4, CFSTR("deadbandWidthMaxFraction"), 1.2);
  -[CinematicFramingSessionFramingParameters setDeadbandWidthMaxFraction:](self, "setDeadbandWidthMaxFraction:", v14);
  *(float *)&v15 = PlistReadFloat(v4, CFSTR("deadbandWidthFractionOfScreenWidth"), 0.7);
  -[CinematicFramingSessionFramingParameters setDeadbandWidthFractionOfScreenWidth:](self, "setDeadbandWidthFractionOfScreenWidth:", v15);
  *(float *)&v16 = PlistReadFloat(v4, CFSTR("deadbandHeightFractionOfScreenHeight"), 0.5);
  -[CinematicFramingSessionFramingParameters setDeadbandHeightFractionOfScreenHeight:](self, "setDeadbandHeightFractionOfScreenHeight:", v16);
  *(float *)&v17 = PlistReadFloat(v4, CFSTR("deadbandTopOffsetFractionOfScreenHeight"), 0.1);
  -[CinematicFramingSessionFramingParameters setDeadbandTopOffsetFractionOfScreenHeight:](self, "setDeadbandTopOffsetFractionOfScreenHeight:", v17);
  *(float *)&v18 = PlistReadFloat(v4, CFSTR("subjectWidthPaddingMultiplier"), 1.0);
  -[CinematicFramingSessionFramingParameters setSubjectWidthPaddingMultiplier:](self, "setSubjectWidthPaddingMultiplier:", v18);
  Float = PlistReadFloat(v4, CFSTR("subjectHeightPaddingMultiplier"), 1.0);

  *(float *)&v20 = Float;
  -[CinematicFramingSessionFramingParameters setSubjectHeightPaddingMultiplier:](self, "setSubjectHeightPaddingMultiplier:", v20);
}

- (float)horizontalMinAbsoluteDifferenceThreshold
{
  return self->horizontalMinAbsoluteDifferenceThreshold;
}

- (void)setHorizontalMinAbsoluteDifferenceThreshold:(float)a3
{
  self->horizontalMinAbsoluteDifferenceThreshold = a3;
}

- (float)horizontalMinRelativeDifferenceThreshold
{
  return self->horizontalMinRelativeDifferenceThreshold;
}

- (void)setHorizontalMinRelativeDifferenceThreshold:(float)a3
{
  self->horizontalMinRelativeDifferenceThreshold = a3;
}

- (float)widthPaddingMultiplierNoFocusTight
{
  return self->widthPaddingMultiplierNoFocusTight;
}

- (void)setWidthPaddingMultiplierNoFocusTight:(float)a3
{
  self->widthPaddingMultiplierNoFocusTight = a3;
}

- (float)widthPaddingMultiplierNoFocusRelaxed
{
  return self->widthPaddingMultiplierNoFocusRelaxed;
}

- (void)setWidthPaddingMultiplierNoFocusRelaxed:(float)a3
{
  self->widthPaddingMultiplierNoFocusRelaxed = a3;
}

- (float)widthPaddingAdditive
{
  return self->widthPaddingAdditive;
}

- (void)setWidthPaddingAdditive:(float)a3
{
  self->widthPaddingAdditive = a3;
}

- (float)topMarginFractionTight
{
  return self->topMarginFractionTight;
}

- (void)setTopMarginFractionTight:(float)a3
{
  self->topMarginFractionTight = a3;
}

- (float)topMarginFractionRelaxed
{
  return self->topMarginFractionRelaxed;
}

- (void)setTopMarginFractionRelaxed:(float)a3
{
  self->topMarginFractionRelaxed = a3;
}

- (float)minCropSize
{
  return self->minCropSize;
}

- (void)setMinCropSize:(float)a3
{
  self->minCropSize = a3;
}

- (float)deadbandWidthMinFraction
{
  return self->deadbandWidthMinFraction;
}

- (void)setDeadbandWidthMinFraction:(float)a3
{
  self->deadbandWidthMinFraction = a3;
}

- (float)deadbandWidthMaxFraction
{
  return self->deadbandWidthMaxFraction;
}

- (void)setDeadbandWidthMaxFraction:(float)a3
{
  self->deadbandWidthMaxFraction = a3;
}

- (float)deadbandWidthFractionOfScreenWidth
{
  return self->deadbandWidthFractionOfScreenWidth;
}

- (void)setDeadbandWidthFractionOfScreenWidth:(float)a3
{
  self->deadbandWidthFractionOfScreenWidth = a3;
}

- (float)deadbandHeightFractionOfScreenHeight
{
  return self->deadbandHeightFractionOfScreenHeight;
}

- (void)setDeadbandHeightFractionOfScreenHeight:(float)a3
{
  self->deadbandHeightFractionOfScreenHeight = a3;
}

- (float)deadbandTopOffsetFractionOfScreenHeight
{
  return self->deadbandTopOffsetFractionOfScreenHeight;
}

- (void)setDeadbandTopOffsetFractionOfScreenHeight:(float)a3
{
  self->deadbandTopOffsetFractionOfScreenHeight = a3;
}

- (float)subjectWidthPaddingMultiplier
{
  return self->subjectWidthPaddingMultiplier;
}

- (void)setSubjectWidthPaddingMultiplier:(float)a3
{
  self->subjectWidthPaddingMultiplier = a3;
}

- (float)subjectHeightPaddingMultiplier
{
  return self->subjectHeightPaddingMultiplier;
}

- (void)setSubjectHeightPaddingMultiplier:(float)a3
{
  self->subjectHeightPaddingMultiplier = a3;
}

@end
