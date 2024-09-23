@implementation PHImageDecoderAsyncDecodeRequestHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDecoder, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PHImageDecoderAsyncDecodeRequestHandle setFigDecompressionContainer:](self, "setFigDecompressionContainer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  -[PHImageDecoderAsyncDecodeRequestHandle dealloc](&v3, sel_dealloc);
}

- (PHImageDecoderAsyncDecodeRequestHandle)initWithFigRequestID:(unint64_t)a3 container:(CMPhotoDecompressionContainer *)a4 figDecoder:(id)a5
{
  id v9;
  PHImageDecoderAsyncDecodeRequestHandle *v10;
  PHImageDecoderAsyncDecodeRequestHandle *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  v10 = -[PHImageDecoderAsyncDecodeRequestHandle init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_initialDecoder, a5);
    v11->_figRequestID = a3;
    v11->_figGainMapRequestID = 0;
    if (a4)
      -[PHImageDecoderAsyncDecodeRequestHandle setFigDecompressionContainer:](v11, "setFigDecompressionContainer:", a4);
  }

  return v11;
}

- (void)setFigDecompressionContainer:(CMPhotoDecompressionContainer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)figRequestID
{
  return self->_figRequestID;
}

- (PHImageDecoderAsyncDecodeRequestHandle)initWithImageIODecoder:(id)a3
{
  id v5;
  PHImageDecoderAsyncDecodeRequestHandle *v6;
  PHImageDecoderAsyncDecodeRequestHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  v6 = -[PHImageDecoderAsyncDecodeRequestHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initialDecoder, a3);
    v7->_figRequestID = 0;
  }

  return v7;
}

- (void)cancel
{
  atomic_flag *p_cancelFlag;
  unsigned __int8 v4;
  id v5;

  p_cancelFlag = &self->_cancelFlag;
  do
    v4 = __ldaxr((unsigned __int8 *)p_cancelFlag);
  while (__stlxr(1u, (unsigned __int8 *)p_cancelFlag));
  if ((v4 & 1) == 0)
  {
    self->_cancelRequested = 1;
    -[PHImageDecoderAsyncDecodeRequestHandle initialDecoder](self, "initialDecoder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelInFlightAsyncDecodeForRequestHandle:", self);

  }
}

- (BOOL)cancelRequested
{
  return self->_cancelRequested;
}

- (PHImageDecoder)initialDecoder
{
  return self->_initialDecoder;
}

- (void)setFigRequestID:(unint64_t)a3
{
  self->_figRequestID = a3;
}

- (unint64_t)figGainMapRequestID
{
  return self->_figGainMapRequestID;
}

- (void)setFigGainMapRequestID:(unint64_t)a3
{
  self->_figGainMapRequestID = a3;
}

- (CMPhotoDecompressionContainer)c
{
  return self->_c;
}

- (void)setC:(CMPhotoDecompressionContainer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CMPhotoDecompressionContainer)figDecompressionContainer
{
  return self->_figDecompressionContainer;
}

@end
