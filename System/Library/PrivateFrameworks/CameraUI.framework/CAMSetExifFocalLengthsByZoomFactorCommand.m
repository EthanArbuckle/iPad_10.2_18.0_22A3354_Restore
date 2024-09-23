@implementation CAMSetExifFocalLengthsByZoomFactorCommand

- (CAMSetExifFocalLengthsByZoomFactorCommand)initWithExifFocalLengthsByZoomFactor:(id)a3
{
  id v5;
  CAMSetExifFocalLengthsByZoomFactorCommand *v6;
  CAMSetExifFocalLengthsByZoomFactorCommand *v7;
  CAMSetExifFocalLengthsByZoomFactorCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSetExifFocalLengthsByZoomFactorCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__exifFocalLengthsByZoomFactor, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSetExifFocalLengthsByZoomFactorCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMSetExifFocalLengthsByZoomFactorCommand _exifFocalLengthsByZoomFactor](self, "_exifFocalLengthsByZoomFactor");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExifFocalLengthsByZoomFactor:", self->__exifFocalLengthsByZoomFactor);

}

- (NSDictionary)_exifFocalLengthsByZoomFactor
{
  return self->__exifFocalLengthsByZoomFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__exifFocalLengthsByZoomFactor, 0);
}

@end
