@implementation VCPVideoPixelStabilizer

- (VCPVideoPixelStabilizer)init
{
  VCPVideoPixelStabilizer *v2;
  VCPVideoPixelStabilizer *v3;
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  VCPVideoPixelStabilizer *v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VCPVideoPixelStabilizer;
  v2 = -[VCPVideoStabilizer init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCPVideoStabilizer setGyroStabilization:](v2, "setGyroStabilization:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
    if ((v5 & 1) != 0)
    {
      v6 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
      if ((v6 & 1) != 0 && !*(_QWORD *)(MEMORY[0x1E0CA2E40] + 40))
      {
        v7 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
        if ((v7 & 0x8000000000000000) == 0)
        {
          v8 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
          v9 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
          v19 = *MEMORY[0x1E0CA2E40];
          v20 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
          v21 = v5;
          v22 = v8;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D3AA60]);

          v15 = v7;
          v16 = v9;
          v17 = v6;
          v18 = 0;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D3AA58]);

        }
      }
    }
    v12 = ICAnalysisInit();
    v3->_analysisSessionRef = (void *)v12;
    if (v12)
      v13 = v3;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_analysisSessionRef)
  {
    ICDestroyResult();
    self->_analysisSessionRef = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPVideoPixelStabilizer;
  -[VCPVideoStabilizer dealloc](&v3, sel_dealloc);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  ICAnalysisAddFrame();
  return 0;
}

- (int)convertAnalysisResult
{
  uint64_t v3;
  id v4;
  float v5;
  int v6;

  v3 = ICAnalysisStopAndGetResult();
  v4 = 0;
  -[VCPVideoStabilizer setAnalysisResultRef:](self, "setAnalysisResultRef:", v3);
  if (self->_analysisSessionRef)
  {
    ICDestroyResult();
    self->_analysisSessionRef = 0;
  }
  if (-[VCPVideoStabilizer analysisResultRef](self, "analysisResultRef"))
  {
    -[VCPVideoStabilizer analysisResultRef](self, "analysisResultRef");
    ICGetAnalysisConfidence();
    -[VCPVideoStabilizer setAnalysisConfidence:](self, "setAnalysisConfidence:");
    -[VCPVideoStabilizer analysisConfidence](self, "analysisConfidence");
    if (v5 < 0.85)
      -[VCPVideoStabilizer setValidStabilization:](self, "setValidStabilization:", 0);
    v6 = 0;
  }
  else
  {
    v6 = -18;
  }

  return v6;
}

@end
