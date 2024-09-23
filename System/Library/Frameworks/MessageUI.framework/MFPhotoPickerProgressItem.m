@implementation MFPhotoPickerProgressItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFPhotoPickerProgressItem;
  -[MFPhotoPickerProgressItem description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MFPhotoPickerProgressItem progress](self, "progress");
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" progress: %f "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageRequestID: %d "), -[MFPhotoPickerProgressItem imageRequestID](self, "imageRequestID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[MFPhotoPickerProgressItem exportSession](self, "exportSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("exportSession: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v11);

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (int)imageRequestID
{
  return self->_imageRequestID;
}

- (void)setImageRequestID:(int)a3
{
  self->_imageRequestID = a3;
}

- (AVAssetExportSession)exportSession
{
  return self->_exportSession;
}

- (void)setExportSession:(id)a3
{
  objc_storeStrong((id *)&self->_exportSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSession, 0);
}

@end
