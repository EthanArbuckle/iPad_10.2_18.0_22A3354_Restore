@implementation GTTelemetryLayerObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryLayerObject)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryLayerObject *v5;
  uint64_t v6;
  GTTelemetryRecordObject *fps;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryLayerObject;
  v5 = -[GTTelemetryLayerObject init](&v9, sel_init);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_frames = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("frames"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fps"));
    v6 = objc_claimAutoreleasedReturnValue();
    fps = v5->_fps;
    v5->_fps = (GTTelemetryRecordObject *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef;
  id v5;

  streamRef = self->_streamRef;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", streamRef, CFSTR("streamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_frames, CFSTR("frames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fps, CFSTR("fps"));

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTelemetryLayerObject;
  -[GTTelemetryLayerObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unint64_t)frames
{
  return self->_frames;
}

- (void)setFrames:(unint64_t)a3
{
  self->_frames = a3;
}

- (GTTelemetryRecordObject)fps
{
  return self->_fps;
}

- (void)setFps:(id)a3
{
  objc_storeStrong((id *)&self->_fps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fps, 0);
}

@end
