@implementation DASignalData

- (DASignalData)initWithSourceSignal:(float *)a3 receivedSignal:(float *)a4 minimumDelay:(unint64_t)a5 maximumDelay:(unint64_t)a6 fileTimeInFrames:(float)a7 outputID:(unint64_t)a8 inputID:(unint64_t)a9 fileName:(id)a10
{
  id v18;
  DASignalData *v19;
  DASignalData *v20;
  double v21;
  objc_super v23;

  v18 = a10;
  v23.receiver = self;
  v23.super_class = (Class)DASignalData;
  v19 = -[DASignalData init](&v23, "init");
  v20 = v19;
  if (v19)
  {
    -[DASignalData setMinimumDelay:](v19, "setMinimumDelay:", a5);
    -[DASignalData setMaximumDelay:](v20, "setMaximumDelay:", a6);
    *(float *)&v21 = a7;
    -[DASignalData setFileTimeInFrames:](v20, "setFileTimeInFrames:", v21);
    -[DASignalData setSourceSignal:](v20, "setSourceSignal:", a3);
    -[DASignalData setReceivedSignal:](v20, "setReceivedSignal:", a4);
    -[DASignalData setInputID:](v20, "setInputID:", a9);
    -[DASignalData setOutputID:](v20, "setOutputID:", a8);
    -[DASignalData setFileName:](v20, "setFileName:", v18);
  }

  return v20;
}

- (void)freeSourceData
{
  free(-[DASignalData sourceSignal](self, "sourceSignal"));
}

- (void)freeReceivedData
{
  free(-[DASignalData receivedSignal](self, "receivedSignal"));
}

- (unint64_t)minimumDelay
{
  return self->_minimumDelay;
}

- (void)setMinimumDelay:(unint64_t)a3
{
  self->_minimumDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (float)fileTimeInFrames
{
  return self->_fileTimeInFrames;
}

- (void)setFileTimeInFrames:(float)a3
{
  self->_fileTimeInFrames = a3;
}

- (float)sourceSignal
{
  return self->_sourceSignal;
}

- (void)setSourceSignal:(float *)a3
{
  self->_sourceSignal = a3;
}

- (float)receivedSignal
{
  return self->_receivedSignal;
}

- (void)setReceivedSignal:(float *)a3
{
  self->_receivedSignal = a3;
}

- (unint64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(unint64_t)a3
{
  self->_outputID = a3;
}

- (unint64_t)inputID
{
  return self->_inputID;
}

- (void)setInputID:(unint64_t)a3
{
  self->_inputID = a3;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
