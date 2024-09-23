@implementation EARAudioResult

- (EARAudioResult)initWithAudioResultMat:(id)a3 vectorSize:(unint64_t)a4 numVectors:(unint64_t)a5
{
  id v8;
  EARAudioResult *v9;
  uint64_t v10;
  NSData *audioResultMat;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARAudioResult;
  v9 = -[EARAudioResult init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    audioResultMat = v9->_audioResultMat;
    v9->_audioResultMat = (NSData *)v10;

    v9->_audioResultsNumVectors = a5;
    v9->_audioResultsVectorSize = a4;
  }

  return v9;
}

- (NSData)audioResultMat
{
  return self->_audioResultMat;
}

- (void)setAudioResultMat:(id)a3
{
  objc_storeStrong((id *)&self->_audioResultMat, a3);
}

- (unint64_t)audioResultsNumVectors
{
  return self->_audioResultsNumVectors;
}

- (void)setAudioResultsNumVectors:(unint64_t)a3
{
  self->_audioResultsNumVectors = a3;
}

- (unint64_t)audioResultsVectorSize
{
  return self->_audioResultsVectorSize;
}

- (void)setAudioResultsVectorSize:(unint64_t)a3
{
  self->_audioResultsVectorSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioResultMat, 0);
}

@end
