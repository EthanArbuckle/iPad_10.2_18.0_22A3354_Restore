@implementation AVCompositionTrackSegment

+ (AVCompositionTrackSegment)compositionTrackSegmentWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange
{
  uint64_t v8;
  AVCompositionTrackSegment *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[3];
  _OWORD v15[3];

  v8 = *(_QWORD *)&trackID;
  v10 = [AVCompositionTrackSegment alloc];
  v11 = *(_OWORD *)&sourceTimeRange->start.epoch;
  v15[0] = *(_OWORD *)&sourceTimeRange->start.value;
  v15[1] = v11;
  v15[2] = *(_OWORD *)&sourceTimeRange->duration.timescale;
  v12 = *(_OWORD *)&targetTimeRange->start.epoch;
  v14[0] = *(_OWORD *)&targetTimeRange->start.value;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&targetTimeRange->duration.timescale;
  return -[AVCompositionTrackSegment initWithURL:trackID:sourceTimeRange:targetTimeRange:](v10, "initWithURL:trackID:sourceTimeRange:targetTimeRange:", URL, v8, v15, v14);
}

+ (AVCompositionTrackSegment)compositionTrackSegmentWithTimeRange:(CMTimeRange *)timeRange
{
  AVCompositionTrackSegment *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = [AVCompositionTrackSegment alloc];
  v5 = *(_OWORD *)&timeRange->start.epoch;
  v7[0] = *(_OWORD *)&timeRange->start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&timeRange->duration.timescale;
  return -[AVCompositionTrackSegment initWithTimeRange:](v4, "initWithTimeRange:", v7);
}

- (AVCompositionTrackSegment)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v4[0] = *MEMORY[0x1E0CA2E40];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  return -[AVCompositionTrackSegment initWithTimeRange:](self, "initWithTimeRange:", v4);
}

- (id)_initWithTimeMapping:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackSegment;
  v3 = *(_OWORD *)&a3->var1.var0.var0;
  v7[2] = *(_OWORD *)&a3->var0.var1.var1;
  v7[3] = v3;
  v4 = *(_OWORD *)&a3->var1.var1.var1;
  v7[4] = *(_OWORD *)&a3->var1.var0.var3;
  v7[5] = v4;
  v5 = *(_OWORD *)&a3->var0.var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0.var0;
  v7[1] = v5;
  return -[AVAssetTrackSegment _initWithTimeMapping:](&v8, sel__initWithTimeMapping_, v7);
}

- (AVCompositionTrackSegment)initWithURL:(NSURL *)URL trackID:(CMPersistentTrackID)trackID sourceTimeRange:(CMTimeRange *)sourceTimeRange targetTimeRange:(CMTimeRange *)targetTimeRange
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  AVCompositionTrackSegment *v12;
  AVCompositionTrackSegmentInternal *Ivars;
  _OWORD v15[6];
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v8 = *(_OWORD *)&sourceTimeRange->start.epoch;
  v17 = *(_OWORD *)&sourceTimeRange->start.value;
  v18 = v8;
  v9 = *(_OWORD *)&targetTimeRange->start.value;
  v10 = *(_OWORD *)&targetTimeRange->start.epoch;
  v19 = *(_OWORD *)&sourceTimeRange->duration.timescale;
  v20 = v9;
  v11 = *(_OWORD *)&targetTimeRange->duration.timescale;
  v21 = v10;
  v22 = v11;
  v16.receiver = self;
  v16.super_class = (Class)AVCompositionTrackSegment;
  v15[2] = v19;
  v15[3] = v9;
  v15[4] = v10;
  v15[5] = v11;
  v15[0] = v17;
  v15[1] = v8;
  v12 = -[AVAssetTrackSegment _initWithTimeMapping:](&v16, sel__initWithTimeMapping_, v15);
  if (v12)
  {
    Ivars = AVCompositionTrackSegmentCreateIvars(URL, trackID);
    v12->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v12;
}

- (AVCompositionTrackSegment)initWithTimeRange:(CMTimeRange *)timeRange
{
  __int128 v4;
  __int128 v5;
  AVCompositionTrackSegment *v6;
  AVCompositionTrackSegmentInternal *Ivars;
  CMTimeRange v9[2];
  objc_super v10;
  CMTimeRange target;
  CMTimeMapping v12;

  memset(&v12, 0, sizeof(v12));
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v9[0].start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v9[0].start.epoch = v4;
  *(_OWORD *)&v9[0].duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v5 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&target.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&target.start.epoch = v5;
  *(_OWORD *)&target.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  CMTimeMappingMake(&v12, v9, &target);
  v10.receiver = self;
  v10.super_class = (Class)AVCompositionTrackSegment;
  v9[0] = v12.source;
  v9[1] = v12.target;
  v6 = -[AVAssetTrackSegment _initWithTimeMapping:](&v10, sel__initWithTimeMapping_, v9);
  if (v6)
  {
    Ivars = AVCompositionTrackSegmentCreateIvars(0, 0);
    v6->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVCompositionTrackSegmentInternal *priv;
  AVCompositionTrackSegmentInternal *v4;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {

    self->_priv->editAssetURL = 0;
    v4 = self->_priv;
    if (v4)
    {
      CFRelease(v4);
      self->_priv = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackSegment;
  -[AVCompositionTrackSegment dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  Float64 Seconds;
  void *v7;
  AVCompositionTrackSegmentInternal *priv;
  NSURL *editAssetURL;
  uint64_t editAssetTrackID;
  Float64 v11;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
    *(_OWORD *)&time.value = v26;
    time.epoch = v27;
    Seconds = CMTimeGetSeconds(&time);
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    memset(v21, 0, sizeof(v21));
  }
  v22 = *(CMTime *)((char *)v21 + 8);
  v7 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p timeRange [%.3f,+%.3f] "), v5, self, *(_QWORD *)&Seconds, CMTimeGetSeconds(&v22));
  if (-[AVCompositionTrackSegment isEmpty](self, "isEmpty"))
  {
    objc_msgSend(v7, "appendString:", CFSTR("is empty"));
  }
  else
  {
    priv = self->_priv;
    editAssetURL = priv->editAssetURL;
    editAssetTrackID = priv->editAssetTrackID;
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
    v16 = v15;
    v11 = CMTimeGetSeconds(&v16);
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
    v14 = v13;
    objc_msgSend(v7, "appendFormat:", CFSTR("from trackID %d of asset %@ sourceTimeRange [%.3f,+%.3f]"), editAssetTrackID, editAssetURL, *(_QWORD *)&v11, CMTimeGetSeconds(&v14));
  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (BOOL)isEmpty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCompositionTrackSegment;
  return -[AVAssetTrackSegment isEmpty](&v3, sel_isEmpty);
}

- (NSURL)sourceURL
{
  return self->_priv->editAssetURL;
}

- (CMPersistentTrackID)sourceTrackID
{
  return self->_priv->editAssetTrackID;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  CMPersistentTrackID v6;
  NSURL *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCompositionTrackSegment;
  v5 = -[AVAssetTrackSegment isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    v6 = -[AVCompositionTrackSegment sourceTrackID](self, "sourceTrackID");
    if (v6 == objc_msgSend(a3, "sourceTrackID"))
    {
      v7 = -[AVCompositionTrackSegment sourceURL](self, "sourceURL");
      if (v7 == (NSURL *)objc_msgSend(a3, "sourceURL"))
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = -[NSURL isEqual:](-[AVCompositionTrackSegment sourceURL](self, "sourceURL"), "isEqual:", objc_msgSend(a3, "sourceURL"));
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCompositionTrackSegment;
  v3 = -[AVAssetTrackSegment hash](&v6, sel_hash);
  v4 = -[NSURL hash](-[AVCompositionTrackSegment sourceURL](self, "sourceURL"), "hash");
  return v4 ^ -[AVCompositionTrackSegment sourceTrackID](self, "sourceTrackID") ^ v3;
}

- (AVCompositionTrackSegment)initWithCoder:(id)a3
{
  AVCompositionTrackSegment *v4;
  void *v5;
  AVCompositionTrackSegmentInternal *Ivars;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackSegment;
  v4 = -[AVAssetTrackSegment initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceURL"));
    Ivars = AVCompositionTrackSegmentCreateIvars(v5, objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sourceTrackID")));
    v4->_priv = Ivars;
    if (!Ivars)
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackSegment;
  -[AVAssetTrackSegment encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCompositionTrackSegment sourceURL](self, "sourceURL"), CFSTR("sourceURL"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[AVCompositionTrackSegment sourceTrackID](self, "sourceTrackID"), CFSTR("sourceTrackID"));
}

@end
