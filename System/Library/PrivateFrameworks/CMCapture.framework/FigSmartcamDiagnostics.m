@implementation FigSmartcamDiagnostics

- (FigSmartcamDiagnostics)init
{
  FigSmartcamDiagnostics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *metadata;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigSmartcamDiagnostics;
  v2 = -[FigSmartcamDiagnostics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metadata = v2->_metadata;
    v2->_metadata = v3;

  }
  return v2;
}

- (void)addSceneConfidences:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("SceneConfidencesForFirmware"));

}

- (void)addPAMDecisionPreliminary:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PeopleAndMotionDecisionPreliminary"));

}

- (BOOL)addClassifierVersionMajor:(unsigned __int16)a3 minor:(unsigned __int16)a4 patch:(unsigned __int16)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d"), a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v6, CFSTR("ClassifierVersion"));

  return 1;
}

- (BOOL)addMotionStats:(id *)a3
{
  double v3;
  double v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("crossCorrelationMaximum");
  *(float *)&v3 = a3->var0[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  *(float *)&v5 = a3->var0[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v27[1] = CFSTR("maxCorrelationShift");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1[1]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  v27[2] = CFSTR("frameRingBufferCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v6;
  v27[3] = CFSTR("frameRingBufferDistance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v7;
  v27[4] = CFSTR("isMotionDetected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v8;
  v27[5] = CFSTR("normalizedROI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.origin.x);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.origin.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.size.width);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var4.size.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v13;
  v27[6] = CFSTR("valid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v15, CFSTR("MotionStats"));
  else
    FigDebugAssert3();

  return v15 != 0;
}

- (id)metadata
{
  return (id)-[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
