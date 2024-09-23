@implementation EditListCompositionState

- (void)swapTrackGroup
{
  void *v3;
  id v4;

  -[EditListCompositionState currentTrackGroup](self, "currentTrackGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EditListCompositionState alternateTrackGroup](self, "alternateTrackGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EditListCompositionState setCurrentTrackGroup:](self, "setCurrentTrackGroup:", v3);

  -[EditListCompositionState setAlternateTrackGroup:](self, "setAlternateTrackGroup:", v4);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  const __CFString *v8;
  const __CFString *v9;
  __int128 v10;
  CFStringRef v11;
  __int128 v12;
  CFStringRef v13;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("  currentTrackGroup: %@\n"), self->_currentTrackGroup);
  objc_msgSend(v6, "appendFormat:", CFSTR("  alternateTrackGroup: %@\n"), self->_alternateTrackGroup);
  WeakRetained = objc_loadWeakRetained((id *)&self->_clip);
  objc_msgSend(v6, "appendFormat:", CFSTR("  clip: %@\n"), WeakRetained);

  objc_msgSend(v6, "appendFormat:", CFSTR("  overlapLeft: %d\n"), self->_overlapLeft);
  objc_msgSend(v6, "appendFormat:", CFSTR("  overlapRight: %d\n"), self->_overlapRight);
  if (self->_isLastClip)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("  isLastClip: %@\n"), v8);
  if (self->_clipRequiresCA)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("  clipRequiresCA: %@\n"), v9);
  v10 = *(_OWORD *)&self->_videoCompTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_videoCompTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_videoCompTimeRange.duration.timescale;
  v11 = CMTimeRangeCopyDescription(0, &range);
  objc_msgSend(v6, "appendFormat:", CFSTR("  videoCompTimeRange: %@\n"), v11);
  CFRelease(v11);
  v12 = *(_OWORD *)&self->_audioCompTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_audioCompTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_audioCompTimeRange.duration.timescale;
  v13 = CMTimeRangeCopyDescription(0, &range);
  objc_msgSend(v6, "appendFormat:", CFSTR("  audioCompTimeRange: %@\n"), v13);
  CFRelease(v13);
  objc_msgSend(v6, "appendFormat:", CFSTR("  audioStartOffset: %d\n"), self->_audioStartOffset);
  objc_msgSend(v6, "appendFormat:", CFSTR("  audioEndOffset: %d\n"), self->_audioEndOffset);
  return v6;
}

- (JFXCompositionTrackGroup)currentTrackGroup
{
  return self->_currentTrackGroup;
}

- (void)setCurrentTrackGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentTrackGroup, a3);
}

- (JFXCompositionTrackGroup)alternateTrackGroup
{
  return self->_alternateTrackGroup;
}

- (void)setAlternateTrackGroup:(id)a3
{
  objc_storeStrong((id *)&self->_alternateTrackGroup, a3);
}

- (JFXPlayableElement)clip
{
  return (JFXPlayableElement *)objc_loadWeakRetained((id *)&self->_clip);
}

- (void)setClip:(id)a3
{
  objc_storeWeak((id *)&self->_clip, a3);
}

- (int)overlapLeft
{
  return self->_overlapLeft;
}

- (void)setOverlapLeft:(int)a3
{
  self->_overlapLeft = a3;
}

- (int)overlapRight
{
  return self->_overlapRight;
}

- (void)setOverlapRight:(int)a3
{
  self->_overlapRight = a3;
}

- (BOOL)isLastClip
{
  return self->_isLastClip;
}

- (void)setIsLastClip:(BOOL)a3
{
  self->_isLastClip = a3;
}

- (BOOL)clipRequiresCA
{
  return self->_clipRequiresCA;
}

- (void)setClipRequiresCA:(BOOL)a3
{
  self->_clipRequiresCA = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)videoCompTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void)setVideoCompTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_videoCompTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_videoCompTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_videoCompTimeRange.start.value = v3;
}

- ($70930193D4F448A53BB9343C0237EB5F)audioCompTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setAudioCompTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_audioCompTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_audioCompTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_audioCompTimeRange.start.value = v3;
}

- (int)audioStartOffset
{
  return self->_audioStartOffset;
}

- (void)setAudioStartOffset:(int)a3
{
  self->_audioStartOffset = a3;
}

- (int)audioEndOffset
{
  return self->_audioEndOffset;
}

- (void)setAudioEndOffset:(int)a3
{
  self->_audioEndOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clip);
  objc_storeStrong((id *)&self->_alternateTrackGroup, 0);
  objc_storeStrong((id *)&self->_currentTrackGroup, 0);
}

@end
