@implementation CAMPanoramaOutput

- (CAMPanoramaOutput)initWithEngine:(id)a3
{
  id v4;
  CAMPanoramaOutput *v5;
  CAMPanoramaOutput *v6;
  CAMPanoramaOutput *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMPanoramaOutput;
  v5 = -[AVCaptureVideoDataOutput init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__engine, v4);
    v7 = v6;
  }

  return v6;
}

- (void)changeToDirection:(int64_t)a3
{
  id v4;

  -[CAMPanoramaOutput _engine](self, "_engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeToPanoramaDirection:", a3);

}

- (void)changeToEncodingBehavior:(int64_t)a3
{
  id v4;

  self->_photoEncodingBehavior = a3;
  -[CAMPanoramaOutput _engine](self, "_engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changePanoramaEncodingBehaviorIfNeeded:", a3);

}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (CAMCaptureEngine)_engine
{
  return (CAMCaptureEngine *)objc_loadWeakRetained((id *)&self->__engine);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__engine);
}

@end
