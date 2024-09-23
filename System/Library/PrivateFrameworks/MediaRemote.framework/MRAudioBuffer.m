@implementation MRAudioBuffer

- (MRAudioBuffer)initWithFormatSettings:(id)a3 packetCapacity:(unint64_t)a4 maximumPacketSize:(unint64_t)a5
{
  id v8;
  MRAudioBuffer *v9;
  uint64_t v10;
  NSDictionary *formatSettings;
  void *v12;
  uint64_t v13;
  AVAudioCompressedBuffer *buffer;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRAudioBuffer;
  v9 = -[MRAudioBuffer init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    formatSettings = v9->_formatSettings;
    v9->_formatSettings = (NSDictionary *)v10;

    v12 = (void *)objc_msgSend(objc_alloc((Class)MSVWeakLinkClass()), "initWithSettings:", v8);
    v13 = objc_msgSend(objc_alloc((Class)MSVWeakLinkClass()), "initWithFormat:packetCapacity:maximumPacketSize:", v12, a4, a5);
    buffer = v9->_buffer;
    v9->_buffer = (AVAudioCompressedBuffer *)v13;

  }
  return v9;
}

- (AVAudioCompressedBuffer)buffer
{
  return self->_buffer;
}

- (NSDictionary)formatSettings
{
  return self->_formatSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatSettings, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
