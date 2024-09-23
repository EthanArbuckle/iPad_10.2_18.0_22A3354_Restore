@implementation MTFVoice

- (void)privateData
{
  return -[MTFVoice voiceData](self, "voiceData") + 362;
}

- (void)dealloc
{
  int v3;
  MEOWReader *v4;
  PROWReader *v5;
  SLMMapCache *v6;
  void *v7;
  objc_super v8;

  v3 = (int)-[MTFVoice description](self, "description")[4];
  if (*(_QWORD *)-[MTFVoice wrapped](self, "wrapped"))
  {
    if (v3 == 1734437985)
    {
      v5 = *(PROWReader **)-[MTFVoice wrapped](self, "wrapped");
      if (!v5)
        goto LABEL_9;
      PROWReader::~PROWReader(v5);
      goto LABEL_8;
    }
    if (v3 == 1835364215)
    {
      v4 = *(MEOWReader **)-[MTFVoice wrapped](self, "wrapped");
      if (v4)
      {
        MEOWReader::~MEOWReader(v4);
LABEL_8:
        MEMORY[0x1D8233BA8]();
      }
    }
  }
LABEL_9:
  if (-[MTFVoice _pcmData](self, "_pcmData"))
  {
    v6 = -[MTFVoice _pcmData](self, "_pcmData");
    SLMMapCache::Unmap(v6, v7);
  }
  if (-[MTFVoice voiceData](self, "voiceData"))
    free(-[MTFVoice voiceData](self, "voiceData"));
  v8.receiver = self;
  v8.super_class = (Class)MTFVoice;
  -[MTFVoice dealloc](&v8, sel_dealloc);
}

- (NSDictionary)pitchCoeff
{
  return self->_pitchCoeff;
}

- (void)setPitchCoeff:(id)a3
{
  objc_storeStrong((id *)&self->_pitchCoeff, a3);
}

- (void)voiceData
{
  return self->_voiceData;
}

- (void)setVoiceData:(void *)a3
{
  self->_voiceData = a3;
}

- (void)_pcmData
{
  return self->__pcmData;
}

- (void)set_pcmData:(void *)a3
{
  self->__pcmData = a3;
}

- (WrappedMTVoice)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(WrappedMTVoice *)a3
{
  self->_wrapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchCoeff, 0);
}

@end
