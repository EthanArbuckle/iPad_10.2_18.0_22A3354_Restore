@implementation VCPVideoLightFaceDetector

- (VCPVideoLightFaceDetector)initWithTransform:(CGAffineTransform *)a3 faceDominated:(BOOL)a4
{
  char *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _OWORD v14[3];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VCPVideoLightFaceDetector;
  v6 = -[VCPVideoLightFaceDetector init](&v15, sel_init);
  if (v6)
  {
    v7 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v7;
    v14[2] = *(_OWORD *)&a3->tx;
    *((_DWORD *)v6 + 2) = angleForTransform(v14);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v8;

    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v6 + 12) = *MEMORY[0x1E0CA2E28];
    *(_QWORD *)(v6 + 28) = v10;
    v11 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = 0;

    *((_DWORD *)v6 + 14) = 0;
    *((_DWORD *)v6 + 15) = 0;
    v6[64] = a4;
    v12 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = 0;

  }
  return (VCPVideoLightFaceDetector *)v6;
}

- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 frameStats:(id)a5
{
  int Width;
  int Height;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  unsigned int lastestFaceID;
  int v30;
  int numFacesLastFrame;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  double x;
  double y;
  double v40;
  double v41;
  VCPFace *v42;
  int v44;
  void *context;
  id v46;
  void *v47;
  id obj;
  id v49;
  CGAffineTransform v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[3];
  CGRect v57;
  CGRect v58;

  v56[1] = *MEMORY[0x1E0C80C00];
  v49 = a4;
  v46 = a5;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  context = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1BCCA1B2C]();
  v11 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v12 = (void *)objc_msgSend(v11, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (!v12)
  {
    v44 = -108;
    v20 = 4;
    goto LABEL_20;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setPreferBackgroundProcessing:", 1);
    objc_msgSend(v14, "setRevision:", 2);
    v56[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (self->_faceDominated)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CEDE80]);
      v18 = v17;
      if (!v17)
      {
        v19 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v17, "setPreferBackgroundProcessing:", 1);
      objc_msgSend(v18, "setRevision:", 2);
      v19 = v18;
      objc_msgSend(v16, "addObject:", v18);
    }
    else
    {
      v19 = 0;
    }
    if (objc_msgSend(v12, "performRequests:error:", v16, 0))
    {
      objc_msgSend(v14, "results");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (!v22)
      {
        objc_msgSend(v14, "results");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "addObjectsFromArray:", v23);

      }
      if (v19)
      {
        objc_msgSend(v19, "results");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24 == 0;

        if (!v25)
        {
          objc_msgSend(v19, "results");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObjectsFromArray:", v26);

        }
      }
      v20 = 0;
      v44 = 0;
      goto LABEL_18;
    }
LABEL_17:
    v44 = -18;
    v20 = 4;
LABEL_18:

    goto LABEL_19;
  }
  v44 = -18;
  v20 = 4;
LABEL_19:

LABEL_20:
  objc_autoreleasePoolPop(v10);
  if (!v20)
  {
    v27 = v47;
    if (!v47)
      v27 = obj;
    v28 = v27;

    lastestFaceID = self->_lastestFaceID;
    if (v28 && objc_msgSend(v28, "count"))
    {
      v30 = objc_msgSend(v28, "count");
      numFacesLastFrame = self->_numFacesLastFrame;
      if (numFacesLastFrame >= v30)
        numFacesLastFrame = v30;
      lastestFaceID -= numFacesLastFrame;
      self->_numFacesLastFrame = v30;
    }
    else
    {
      self->_numFacesLastFrame = 0;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v28;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v32)
    {
      v33 = (double)-Height;
      v34 = (double)Height;
      v35 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v37, "boundingBox");
          v50.b = 0.0;
          v50.c = 0.0;
          v50.a = (double)Width;
          v50.d = v33;
          v50.tx = 0.0;
          v50.ty = v34;
          v58 = CGRectApplyAffineTransform(v57, &v50);
          x = v58.origin.x;
          y = v58.origin.y;
          v40 = v58.size.width;
          v41 = v58.size.height;
          v42 = objc_alloc_init(VCPFace);
          -[VCPFace setObservation:](v42, "setObservation:", v37);
          -[VCPFace setBounds:](v42, "setBounds:", x, y, v40, v41);
          -[VCPFace setTrackID:](v42, "setTrackID:", lastestFaceID + i);
          self->_lastestFaceID = lastestFaceID + i + 1;
          objc_msgSend(v49, "addObject:", v42);

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        lastestFaceID += i;
      }
      while (v32);
    }

    v20 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (!v20)
    objc_msgSend(v46, "setFrameProcessedByFaceDetector:", 1);

  return v44;
}

- (float)minProcessTimeIntervalInSecs
{
  return 0.16667;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  int v11;
  void *v12;
  double Seconds;
  float v14;
  int v15;
  float v16;
  __int128 v17;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  int angle;
  BOOL v21;
  int v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  VCPFace *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *activeFaces;
  void *v35;
  void *v36;
  VCPFaceDetectionRange *v37;
  NSMutableDictionary *v38;
  void *v39;
  double v40;
  id v41;
  void *v42;
  void *v43;
  VCPVideoLightFaceDetector *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  float v50;
  double v51;
  float32x2_t v52;
  float v53;
  void *v55;
  void *context;
  int v57;
  id obj;
  unint64_t *v59;
  size_t v60;
  size_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  id v65;
  id v66;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v67;
  VCPVideoLightFaceDetector *v68;
  __int128 v69;
  int64_t v70;
  __int128 v71;
  int64_t v72;
  __int128 v73;
  int64_t var3;
  _QWORD v75[3];
  __int128 v76;
  uint64_t v77;
  CGRect lhs;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CMTime time;
  CMTime rhs;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v66 = a6;
  if (self->super._results)
  {
    v11 = -18;
LABEL_3:
    v57 = v11;
    goto LABEL_54;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422)
  {
    v11 = -50;
    goto LABEL_3;
  }
  objc_msgSend(v66, "detectedFaces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  context = (void *)MEMORY[0x1BCCA1B2C](objc_msgSend(v66, "setFrameProcessedByFaceDetector:", 0));
  lhs.origin = *(CGPoint *)&a4->var0;
  *(_QWORD *)&lhs.size.width = a4->var3;
  rhs = *(CMTime *)(&self->super._angle + 1);
  CMTimeSubtract(&time, (CMTime *)&lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[VCPVideoLightFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
  if (Seconds >= v14)
  {
    v17 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&self->super._timeLastDetection.flags = a4->var3;
    *(_OWORD *)(&self->super._angle + 1) = v17;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0.0;
    v57 = -[VCPVideoLightFaceDetector detectFaces:faces:frameStats:](self, "detectFaces:faces:frameStats:", a3);
    v68 = self;
    if (v57)
    {
      v65 = 0;
      v15 = 1;
    }
    else
    {
      if (v55 && objc_msgSend(v55, "count"))
      {
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        angle = self->super._angle;
        if (angle)
          v21 = angle == 180;
        else
          v21 = 1;
        v22 = v21;
        v63 = v22;
        *a7 |= 0x20uLL;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        obj = v55;
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v64)
        {
          v60 = HeightOfPlane;
          v61 = WidthOfPlane;
          v67 = a4;
          v59 = a7;
          v65 = 0;
          v62 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v80 != v62)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "flagsForOrientation:width:height:", v63, v61, v60);
              v75[1] = 0;
              v75[2] = 0;
              memset(&lhs, 0, sizeof(lhs));
              v75[0] = 0x3FF0000000000000;
              v76 = xmmword_1B6FBCA30;
              v77 = 0x3FF0000000000000;
              objc_msgSend(v24, "faceBoundsWithTransform:height:transform:", v61, v60, v75);
              lhs.origin.x = v26;
              lhs.origin.y = v27;
              lhs.size.width = v28;
              lhs.size.height = v29;
              v30 = MediaAnalysisFacePosition(&lhs);
              v31 = objc_alloc_init(VCPFace);
              -[VCPFace setBounds:](v31, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
              objc_msgSend(v24, "observation");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPFace setObservation:](v31, "setObservation:", v32);

              objc_msgSend(v66, "detectedFaces");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v31);

              activeFaces = v68->super._activeFaces;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v24, "trackID"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](activeFaces, "objectForKey:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                v73 = *(_OWORD *)&v67->var0;
                var3 = v67->var3;
                objc_msgSend(v36, "setLast:", &v73);
                objc_msgSend(v36, "setFlags:", objc_msgSend(v36, "flags") | v25);
                objc_msgSend(v36, "setPosition:", objc_msgSend(v36, "position") | v30);
              }
              else
              {
                v37 = objc_alloc_init(VCPFaceDetectionRange);
                v71 = *(_OWORD *)&v67->var0;
                v72 = v67->var3;
                -[VCPFaceDetectionRange setStart:](v37, "setStart:", &v71);
                v69 = *(_OWORD *)&v67->var0;
                v70 = v67->var3;
                -[VCPFaceDetectionRange setLast:](v37, "setLast:", &v69);
                -[VCPFaceDetectionRange setFlags:](v37, "setFlags:", v25);
                -[VCPFaceDetectionRange setBounds:](v37, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
                -[VCPFaceDetectionRange setPosition:](v37, "setPosition:", v30);
                v38 = v68->super._activeFaces;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v24, "trackID"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v37, v39);

              }
              *v59 |= v25;
              v40 = lhs.size.height * lhs.size.width;
              if (lhs.size.height * lhs.size.width > v16)
              {
                v41 = v24;

                v16 = v40;
                v65 = v41;
              }

            }
            v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
          }
          while (v64);
        }
        else
        {
          v65 = 0;
        }

      }
      else
      {
        v65 = 0;
      }
      v15 = 0;
    }

    self = v68;
  }
  else
  {
    v65 = 0;
    v57 = 0;
    v15 = 1;
    v16 = 0.0;
  }
  objc_autoreleasePoolPop(context);
  if (!v15)
  {
    if (objc_msgSend(v66, "frameProcessedByFaceDetector") && self->_lastDominantFace && v16 > 0.2)
    {
      objc_msgSend(v65, "observation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "landmarks65");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = self;
      objc_msgSend(v43, "allPoints");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[VCPFace observation](self->_lastDominantFace, "observation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "landmarks65");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "allPoints");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45 && v48)
      {
        v49 = 0;
        v50 = 0.0;
        while (objc_msgSend(v45, "pointCount") > v49)
        {
          v52 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)(objc_msgSend(objc_retainAutorelease(v45), "normalizedPoints") + 16 * v49), *(float64x2_t *)(objc_msgSend(objc_retainAutorelease(v48), "normalizedPoints") + 16 * v49)));
          v50 = v50 + sqrtf(vaddv_f32(vmul_f32(v52, v52)));
          ++v49;
        }
        v53 = 1.0;
        if ((float)(v50 / 9.1924) < 1.0)
          v53 = v50 / 9.1924;
        LODWORD(v51) = 0;
        if ((float)(v50 / 9.1924) > 0.0)
          *(float *)&v51 = v53;
        objc_msgSend(v66, "setFrameExpressionScore:", v51);
      }

      self = v44;
    }
    objc_storeStrong((id *)&self->_lastDominantFace, v65);
    v57 = 0;
  }

LABEL_54:
  return v57;
}

- (int)finishAnalysisPass:(id *)a3
{
  float v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  float v9;
  int32_t v10;
  CMTime *v11;
  __int128 v12;
  int32_t v13;
  CMTime *v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *results;
  NSMutableDictionary *obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  CMTime v30;
  CMTimeRange range;
  CMTime v32;
  CMTime v33;
  _BYTE v34[64];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTime v39;
  CMTime rhs;
  CMTime lhs;
  const __CFString *v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;
  NSRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->super._results)
    return -18;
  memset(&v39, 0, sizeof(v39));
  -[VCPVideoLightFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
  CMTimeMakeWithSeconds(&v39, (float)(v4 * 0.5), 100);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->super._activeFaces;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v5)
  {
    v26 = *(_QWORD *)v36;
    do
    {
      v28 = v5;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->super._activeFaces, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        memset(&v34[32], 0, 24);
        if (v7)
        {
          objc_msgSend(v7, "start");
          memset(v34, 0, 24);
          objc_msgSend(v8, "last");
        }
        else
        {
          memset(v34, 0, 24);
        }
        -[VCPVideoLightFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
        if (v9 > 0.0)
        {
          lhs = *(CMTime *)&v34[32];
          rhs = v39;
          CMTimeSubtract(&v33, &lhs, &rhs);
          lhs = v33;
          rhs = (CMTime)a3->var0;
          v10 = CMTimeCompare(&lhs, &rhs);
          v11 = &v33;
          if (v10 < 0)
            v11 = (CMTime *)a3;
          *(CMTime *)&v34[32] = *v11;
          lhs = *(CMTime *)v34;
          rhs = v39;
          CMTimeAdd(&v33, &lhs, &rhs);
          v12 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v12;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetEnd(&v32, &range);
          lhs = v32;
          rhs = v33;
          v13 = CMTimeCompare(&lhs, &rhs);
          v14 = &v33;
          if (v13 < 0)
            v14 = &v32;
          *(CMTime *)v34 = *v14;
        }
        v46[0] = CFSTR("start");
        lhs = *(CMTime *)&v34[32];
        v15 = CMTimeCopyAsDictionary(&lhs, 0);
        v47[0] = v15;
        v46[1] = CFSTR("duration");
        lhs = *(CMTime *)v34;
        rhs = *(CMTime *)&v34[32];
        CMTimeSubtract(&v30, &lhs, &rhs);
        lhs = v30;
        v16 = CMTimeCopyAsDictionary(&lhs, 0);
        v47[1] = v16;
        v46[2] = CFSTR("flags");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "flags"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2] = v17;
        v46[3] = CFSTR("attributes");
        v44[0] = CFSTR("facePosition");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = CFSTR("faceBounds");
        v45[0] = v18;
        objc_msgSend(v8, "bounds");
        NSStringFromRect(v50);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v47[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v21);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v5);
  }

  v42 = CFSTR("FaceResults");
  v43 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  results = self->super._results;
  self->super._results = v22;

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDominantFace, 0);
}

@end
