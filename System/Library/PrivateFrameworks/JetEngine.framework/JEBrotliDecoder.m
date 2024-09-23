@implementation JEBrotliDecoder

- (JEBrotliDecoder)init
{
  JEBrotliDecoder *v2;
  BrotliDecoderStateStruct *Instance;
  JEBrotliDecoder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JEBrotliDecoder;
  v2 = -[JEBrotliDecoder init](&v6, sel_init);
  if (v2
    && (Instance = (BrotliDecoderStateStruct *)BrotliDecoderCreateInstance(0, 0, 0),
        (v2->_decoder = Instance) == 0))
  {
    v4 = 0;
  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  BrotliDecoderDestroyInstance((uint64_t)-[JEBrotliDecoder decoder](self, "decoder"));
  v3.receiver = self;
  v3.super_class = (Class)JEBrotliDecoder;
  -[JEBrotliDecoder dealloc](&v3, sel_dealloc);
}

- (int64_t)decompressStreamWithAvailableIn:(unint64_t *)a3 nextIn:(const char *)a4 availableOut:(unint64_t *)a5 nextOut:(char *)a6
{
  return BrotliDecoderDecompressStream((uint64_t)-[JEBrotliDecoder decoder](self, "decoder"), (uint64_t *)a3, (uint64_t *)a4, a5, (void **)a6, 0);
}

- (BrotliDecoderStateStruct)decoder
{
  return self->_decoder;
}

@end
