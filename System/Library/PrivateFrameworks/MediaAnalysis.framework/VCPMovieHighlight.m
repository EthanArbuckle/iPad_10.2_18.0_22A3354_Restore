@implementation VCPMovieHighlight

- (VCPMovieHighlight)initWithTimeRange:(id *)a3
{
  char *v4;
  VCPMovieHighlight *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPMovieHighlight;
  v4 = -[VCPMovieHighlight init](&v11, sel_init);
  v5 = (VCPMovieHighlight *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0.var0;
    v7 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v4 + 152) = v7;
    *(_OWORD *)(v4 + 136) = v6;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v4 + 104) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v4 + 120) = v8;
    v9 = v4;
  }

  return v5;
}

- (void)mergeSegment:(id)a3
{
  id v4;
  float score;
  double Seconds;
  float v7;
  float v8;
  double v9;
  double v10;
  __int128 v11;
  float v12;
  float v13;
  float v14;
  __int128 v15;
  float averageScore;
  double v17;
  float v18;
  float v19;
  float v20;
  VCPImageDescriptor *v21;
  VCPImageDescriptor *descriptor;
  float v23;
  float v24;
  void *v25;
  float v26;
  VCPVideoKeyFrame *v27;
  VCPVideoKeyFrame *keyFrame;
  CMTime v29;
  CMTime v30;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTime v33;
  CMTimeRange v34;
  CMTime duration;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  v4 = a3;
  score = self->_score;
  time = (CMTime)self->_timerange.duration;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v4, "score");
  v8 = v7;
  if (v4)
    objc_msgSend(v4, "timerange");
  else
    memset(&v34, 0, sizeof(v34));
  duration = v34.duration;
  v9 = CMTimeGetSeconds(&duration);
  if (v4)
    objc_msgSend(v4, "timerange");
  else
    memset(&v34, 0, sizeof(v34));
  lhs = (CMTime)self->_timerange.duration;
  rhs = v34.duration;
  CMTimeAdd(&v33, &lhs, &rhs);
  v10 = CMTimeGetSeconds(&v33);
  v11 = *(_OWORD *)&self->_timerange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
  *(_OWORD *)&range.start.epoch = v11;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
  if (v4)
    objc_msgSend(v4, "timerange");
  else
    memset(&otherRange, 0, sizeof(otherRange));
  CMTimeRangeGetUnion(&v34, &range, &otherRange);
  v12 = Seconds * score;
  v13 = v9 * v8;
  v14 = v10;
  v15 = *(_OWORD *)&v34.start.epoch;
  *(_OWORD *)&self->_timerange.start.value = *(_OWORD *)&v34.start.value;
  *(_OWORD *)&self->_timerange.start.epoch = v15;
  *(_OWORD *)&self->_timerange.duration.timescale = *(_OWORD *)&v34.duration.timescale;
  if (v14 <= 0.0)
  {
    self->_score = 0.0;
    v20 = 0.0;
  }
  else
  {
    self->_score = (float)(v12 + v13) / v14;
    averageScore = self->_averageScore;
    v30 = (CMTime)self->_timerange.duration;
    v17 = CMTimeGetSeconds(&v30);
    objc_msgSend(v4, "averageScore");
    v19 = v18;
    if (v4)
      objc_msgSend(v4, "timerange");
    else
      memset(&v34, 0, sizeof(v34));
    v29 = v34.duration;
    v20 = (CMTimeGetSeconds(&v29) * v19 + averageScore * v17) / v14;
  }
  self->_averageScore = v20;
  if (v12 >= v13)
  {
    v21 = self->_descriptor;
  }
  else
  {
    objc_msgSend(v4, "descriptor");
    v21 = (VCPImageDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  descriptor = self->_descriptor;
  self->_descriptor = v21;

  -[VCPVideoKeyFrame score](self->_keyFrame, "score");
  v24 = v23;
  objc_msgSend(v4, "keyFrame");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "score");
  if (v24 >= v26)
  {
    v27 = self->_keyFrame;
  }
  else
  {
    objc_msgSend(v4, "keyFrame");
    v27 = (VCPVideoKeyFrame *)objc_claimAutoreleasedReturnValue();
  }
  keyFrame = self->_keyFrame;
  self->_keyFrame = v27;

  self->_isAutoPlayable |= objc_msgSend(v4, "isAutoPlayable");
}

- (BOOL)isShort
{
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  duration = self->_timerange.duration;
  return CMTimeGetSeconds((CMTime *)&duration) <= 1.0;
}

- (void)copyScoresFrom:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "score");
  self->_score = v4;
  objc_msgSend(v16, "averageScore");
  self->_averageScore = v5;
  objc_msgSend(v16, "junkScore");
  self->_junkScore = v6;
  objc_msgSend(v16, "qualityScore");
  self->_qualityScore = v7;
  objc_msgSend(v16, "expressionScore");
  self->_expressionScore = v8;
  objc_msgSend(v16, "actionScore");
  self->_actionScore = v9;
  objc_msgSend(v16, "voiceScore");
  self->_voiceScore = v10;
  objc_msgSend(v16, "humanActionScore");
  self->_humanActionScore = v11;
  objc_msgSend(v16, "humanPoseScore");
  self->_humanPoseScore = v12;
  self->_isAutoPlayable = objc_msgSend(v16, "isAutoPlayable");
  self->_isSettlingOK = objc_msgSend(v16, "isSettlingOK");
  objc_msgSend(v16, "autoplayScore");
  self->_autoplayScore = v13;
  objc_msgSend(v16, "motionScore");
  self->_motionScore = v14;
  objc_msgSend(v16, "exposureChangeScore");
  self->_exposureChangeScore = v15;

}

- (void)checkAutoPlayable
{
  BOOL v3;
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  if (self->_score >= 0.4 && (self->_actionScore >= 0.4 || self->_humanActionScore >= 0.3))
  {
    duration = self->_timerange.duration;
    v3 = CMTimeGetSeconds((CMTime *)&duration) > 1.0;
  }
  else
  {
    v3 = 0;
  }
  self->_isAutoPlayable = v3;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timerange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var0;
  return self;
}

- (void)setTimerange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timerange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timerange.start.epoch = v4;
  *(_OWORD *)&self->_timerange.start.value = v3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)averageScore
{
  return self->_averageScore;
}

- (void)setAverageScore:(float)a3
{
  self->_averageScore = a3;
}

- (float)junkScore
{
  return self->_junkScore;
}

- (void)setJunkScore:(float)a3
{
  self->_junkScore = a3;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setQualityScore:(float)a3
{
  self->_qualityScore = a3;
}

- (float)expressionScore
{
  return self->_expressionScore;
}

- (void)setExpressionScore:(float)a3
{
  self->_expressionScore = a3;
}

- (float)actionScore
{
  return self->_actionScore;
}

- (void)setActionScore:(float)a3
{
  self->_actionScore = a3;
}

- (float)voiceScore
{
  return self->_voiceScore;
}

- (void)setVoiceScore:(float)a3
{
  self->_voiceScore = a3;
}

- (float)humanActionScore
{
  return self->_humanActionScore;
}

- (void)setHumanActionScore:(float)a3
{
  self->_humanActionScore = a3;
}

- (float)humanPoseScore
{
  return self->_humanPoseScore;
}

- (void)setHumanPoseScore:(float)a3
{
  self->_humanPoseScore = a3;
}

- (CGRect)bestPlaybackCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bestPlaybackCrop.origin.x;
  y = self->_bestPlaybackCrop.origin.y;
  width = self->_bestPlaybackCrop.size.width;
  height = self->_bestPlaybackCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBestPlaybackCrop:(CGRect)a3
{
  self->_bestPlaybackCrop = a3;
}

- (BOOL)isAutoPlayable
{
  return self->_isAutoPlayable;
}

- (void)setIsAutoPlayable:(BOOL)a3
{
  self->_isAutoPlayable = a3;
}

- (BOOL)isTrimmed
{
  return self->_isTrimmed;
}

- (void)setIsTrimmed:(BOOL)a3
{
  self->_isTrimmed = a3;
}

- (VCPImageDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (VCPVideoKeyFrame)keyFrame
{
  return self->_keyFrame;
}

- (void)setKeyFrame:(id)a3
{
  objc_storeStrong((id *)&self->_keyFrame, a3);
}

- (NSData)colorNormalization
{
  return self->_colorNormalization;
}

- (void)setColorNormalization:(id)a3
{
  objc_storeStrong((id *)&self->_colorNormalization, a3);
}

- (BOOL)isSettlingOK
{
  return self->_isSettlingOK;
}

- (void)setIsSettlingOK:(BOOL)a3
{
  self->_isSettlingOK = a3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (float)motionScore
{
  return self->_motionScore;
}

- (void)setMotionScore:(float)a3
{
  self->_motionScore = a3;
}

- (float)subjectScore
{
  return self->_subjectScore;
}

- (void)setSubjectScore:(float)a3
{
  self->_subjectScore = a3;
}

- (float)exposureChangeScore
{
  return self->_exposureChangeScore;
}

- (void)setExposureChangeScore:(float)a3
{
  self->_exposureChangeScore = a3;
}

- (float)zoomChangeScore
{
  return self->_zoomChangeScore;
}

- (void)setZoomChangeScore:(float)a3
{
  self->_zoomChangeScore = a3;
}

- (float)flashScore
{
  return self->_flashScore;
}

- (void)setFlashScore:(float)a3
{
  self->_flashScore = a3;
}

- (float)sharpnessScore
{
  return self->_sharpnessScore;
}

- (void)setSharpnessScore:(float)a3
{
  self->_sharpnessScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorNormalization, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
