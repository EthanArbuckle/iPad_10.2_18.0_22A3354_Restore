@implementation _NUVideoRenderResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUVideoRenderResult video](self, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoRenderResult videoComposition](self, "videoComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p video=%@ composition=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (AVAsset)video
{
  return (AVAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVideo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AVVideoComposition)videoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideoComposition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AVAudioMix)audioMix
{
  return (AVAudioMix *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAudioMix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
