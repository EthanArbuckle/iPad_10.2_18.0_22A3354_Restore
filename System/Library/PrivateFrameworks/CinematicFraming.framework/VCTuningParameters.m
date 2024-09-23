@implementation VCTuningParameters

- (VCTuningParameters)init
{
  VCTuningParameters *v2;
  void *v3;
  void *v4;
  void *v5;
  VCTuningParameters *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCTuningParameters;
  v2 = -[VCTuningParameters init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("virtualCameraParameters"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = -[VCTuningParameters initWithDictionary:](v2, "initWithDictionary:", v5);
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VCTuningParameters)initWithDictionary:(id)a3
{
  NSDictionary *v4;
  VCTuningParameters *v5;
  NSDictionary *plist;
  NSDictionary *v7;
  NSDictionary *v8;
  double v9;
  float v10;
  NSDictionary *v11;
  double v12;
  float v13;
  void *v14;
  double v15;
  float v16;
  double v17;
  float v18;
  objc_super v20;
  char v21;

  v4 = (NSDictionary *)a3;
  v20.receiver = self;
  v20.super_class = (Class)VCTuningParameters;
  v5 = -[VCTuningParameters init](&v20, sel_init);
  plist = v5->_plist;
  v5->_plist = v4;
  v7 = v4;

  v8 = v5->_plist;
  v21 = 0;
  LODWORD(v9) = 1.0;
  -[NSDictionary cmi_floatValueForKey:defaultValue:found:](v8, "cmi_floatValueForKey:defaultValue:found:", CFSTR("OneShotFramingDuration"), &v21, v9);
  v5->_oneShotFramingDuration = v10;
  v11 = v5->_plist;
  v21 = 0;
  LODWORD(v12) = 1.0;
  -[NSDictionary cmi_floatValueForKey:defaultValue:found:](v11, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CameraResetDuration"), &v21, v12);
  v5->_cameraResetDuration = v13;
  -[NSDictionary objectForKeyedSubscript:](v5->_plist, "objectForKeyedSubscript:", CFSTR("CameraSwitchingMargin"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  LODWORD(v15) = 1008981770;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("WideToSuperWide"), &v21, v15);
  v5->_wideToSuperWideSwitchMargin = v16;
  v21 = 0;
  LODWORD(v17) = 1028443341;
  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("SuperWideToWide"), &v21, v17);
  v5->_superWideToWideSwitchMargin = v18;

  return v5;
}

- (float)oneShotFramingDuration
{
  return self->_oneShotFramingDuration;
}

- (void)setOneShotFramingDuration:(float)a3
{
  self->_oneShotFramingDuration = a3;
}

- (float)cameraResetDuration
{
  return self->_cameraResetDuration;
}

- (void)setCameraResetDuration:(float)a3
{
  self->_cameraResetDuration = a3;
}

- (float)wideToSuperWideSwitchMargin
{
  return self->_wideToSuperWideSwitchMargin;
}

- (void)setWideToSuperWideSwitchMargin:(float)a3
{
  self->_wideToSuperWideSwitchMargin = a3;
}

- (float)superWideToWideSwitchMargin
{
  return self->_superWideToWideSwitchMargin;
}

- (void)setSuperWideToWideSwitchMargin:(float)a3
{
  self->_superWideToWideSwitchMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
}

@end
