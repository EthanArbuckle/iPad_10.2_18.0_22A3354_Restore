@implementation VCPVideoObjectTracker

- (VCPVideoObjectTracker)initWithObjectBounds:(CGRect)a3 inFrame:(__CVBuffer *)a4 timestamp:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  char *v11;
  VCPCtrTracker *v12;
  void *v13;
  int v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  __int128 v20;
  float v21;
  float v22;
  double v23;
  float v24;
  float v25;
  double v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  VCPVideoObjectTracker *v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  void *v51;
  int v53;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  objc_super v56;
  _QWORD v57[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v57[8] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)VCPVideoObjectTracker;
  v11 = -[VCPVideoObjectTracker init](&v56, sel_init);
  if (!v11)
    goto LABEL_43;
  v12 = objc_alloc_init(VCPCtrTracker);
  v13 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v12;

  if (*((_QWORD *)v11 + 1))
  {
    v14 = CVPixelBufferGetWidth(a4);
    v15 = CVPixelBufferGetHeight(a4);
    v16 = x;
    v17 = y;
    v18 = width;
    v19 = height;
    *((double *)v11 + 10) = v16;
    *((double *)v11 + 11) = v17;
    *((double *)v11 + 12) = v18;
    *((double *)v11 + 13) = v19;
    v20 = *((_OWORD *)v11 + 6);
    *((_OWORD *)v11 + 3) = *((_OWORD *)v11 + 5);
    *((_OWORD *)v11 + 4) = v20;
    *((_DWORD *)v11 + 5) = 0;
    v21 = (float)v14 + -1.0;
    if (v21 > v16)
      v22 = x;
    else
      v22 = (float)v14 + -1.0;
    if (v16 <= 0.0)
      v22 = 0.0;
    v23 = v22;
    v24 = (float)v15 + -1.0;
    if (v24 > v17)
      v25 = y;
    else
      v25 = (float)v15 + -1.0;
    if (v17 <= 0.0)
      v25 = 0.0;
    v26 = v25;
    *(double *)v57 = v23;
    *(double *)&v57[1] = v26;
    v27 = v16 + v18;
    if (v27 < v21)
      v28 = v27;
    else
      v28 = (float)v14 + -1.0;
    if (v27 <= 0.0)
      v29 = 0.0;
    else
      v29 = v28;
    v30 = v29;
    *(double *)&v57[2] = v30;
    *(double *)&v57[3] = v26;
    v31 = v17 + v19;
    if (v31 < v24)
      v32 = v31;
    else
      v32 = (float)v15 + -1.0;
    if (v31 <= 0.0)
      v33 = 0.0;
    else
      v33 = v32;
    *(double *)&v57[6] = v23;
    *(double *)&v57[7] = v33;
    *(double *)&v57[4] = v30;
    *(double *)&v57[5] = v33;
    pixelBuffer = a4;
    unlockFlags = 1;
    if (a4)
    {
      v34 = CVPixelBufferLockBaseAddress(a4, 1uLL);
      v53 = v34;
      if ((_DWORD)v34)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a4, v34, v35, v36, v37, v38, v39, v40);
        else
          LODWORD(v34) = -50;
      }
      else
      {
        objc_msgSend(*((id *)v11 + 1), "setupTrackerWithReferenceFrame:withROI:", a4, v57);
        LODWORD(v34) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
        if (!(_DWORD)v34)
        {
          v50 = *(_OWORD *)&a5->var0;
          *((_QWORD *)v11 + 5) = a5->var3;
          *(_OWORD *)(v11 + 24) = v50;
        }
      }
    }
    else
    {
      v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v42)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);
      LODWORD(v34) = -50;
      v53 = -50;
    }
    if (pixelBuffer
      && !v53
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
    if ((_DWORD)v34)
    {
      v51 = 0;
LABEL_44:
      v41 = v51;
      goto LABEL_45;
    }
LABEL_43:
    v51 = v11;
    goto LABEL_44;
  }
  v41 = 0;
LABEL_45:

  return v41;
}

- (int)trackObjectInFrame:(__CVBuffer *)a3
{
  CVReturn v5;
  int v6;
  CGSize v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  CGPoint *v19;
  double x;
  CGPoint *v21;
  double v22;
  double y;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  float v34;
  int v35;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  __CVBuffer *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v5 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v35 = v5;
    if (!v5
      || (v6 = v5, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v39 = a3,
          v40 = 1024,
          v41 = v6,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v6 = v35) == 0))
    {
      -[VCPCtrTracker trackInFrame:](self->_correlationTracker, "trackInFrame:", a3);
      v6 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v35);
      if (!v6)
      {
        if (-[VCPCtrTracker lostTrackInd](self->_correlationTracker, "lostTrackInd"))
        {
          v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
          self->_objectBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
          self->_objectBounds.size = v7;
        }
        else
        {
          WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
          HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
          v19 = -[VCPCtrTracker box](self->_correlationTracker, "box");
          x = (float)((float)WidthOfPlane + -1.0);
          if (v19->x < x)
            x = v19->x;
          if (v19->x <= 0.0)
            x = 0.0;
          self->_objectBounds.origin.x = x;
          v21 = -[VCPCtrTracker box](self->_correlationTracker, "box");
          v22 = (float)((float)HeightOfPlane + -1.0);
          y = v21->y;
          if (y < v22)
            v22 = v21->y;
          if (y <= 0.0)
            v22 = 0.0;
          self->_objectBounds.origin.y = v22;
          v24 = (double)-[VCPCtrTracker box](self->_correlationTracker, "box")[32];
          v25 = v24 - *(double *)-[VCPCtrTracker box](self->_correlationTracker, "box");
          v26 = self->_objectBounds.origin.x;
          if ((double)WidthOfPlane - v26 < v25)
            v25 = (double)WidthOfPlane - v26;
          self->_objectBounds.size.width = v25;
          v27 = (double)-[VCPCtrTracker box](self->_correlationTracker, "box")[40];
          v28 = v27 - (double)-[VCPCtrTracker box](self->_correlationTracker, "box")[8];
          v29 = self->_objectBounds.origin.y;
          if ((double)HeightOfPlane - v29 < v28)
            v28 = (double)HeightOfPlane - v29;
          self->_objectBounds.size.height = v28;
        }
        -[VCPCtrTracker confidence](self->_correlationTracker, "confidence");
        v31 = v30 / 50.0;
        v32 = 1.0;
        if (v31 < 1.0)
          v32 = v31;
        v33 = v31 > 0.0;
        v34 = 0.0;
        if (v33)
          v34 = v32;
        self->_confidence = v34;
        v6 = 0;
        if (v34 >= 0.2)
          self->_lostCount = 0;
        else
          ++self->_lostCount;
      }
    }
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v6 = -50;
    v35 = -50;
  }
  if (pixelBuffer
    && !v35
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
  }
  return v6;
}

- (CGRect)objectBoundsInitial
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_objectBoundsInitial.origin.x;
  y = self->_objectBoundsInitial.origin.y;
  width = self->_objectBoundsInitial.size.width;
  height = self->_objectBoundsInitial.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)objectBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_objectBounds.origin.x;
  y = self->_objectBounds.origin.y;
  width = self->_objectBounds.size.width;
  height = self->_objectBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (int)lostCount
{
  return self->_lostCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationTracker, 0);
}

@end
