@implementation AUAudioUnitBusArray_XPC

- (AUAudioUnitBusArray_XPC)initWithOwner:(id)a3 scope:(unsigned int)a4 busses:(id)a5 countWritable:(BOOL)a6
{
  id v10;
  id v11;
  AUAudioUnitBusArray_XPC *v12;
  AUAudioUnitBusArray_XPC *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitBusArray_XPC;
  v12 = -[AUAudioUnitBusArray initWithAudioUnit:busType:](&v15, sel_initWithAudioUnit_busType_, v10, a4);
  v13 = v12;
  if (v12)
  {
    -[AUAudioUnitBusArray replaceBusses:](v12, "replaceBusses:", v11);
    v13->_countWritable = a6;
  }

  return v13;
}

- (BOOL)setBusCount:(unint64_t)a3 error:(id *)a4
{
  void *v7;

  -[AUAudioUnitBusArray ownerAudioUnit](self, "ownerAudioUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "_setBusCount:scope:error:", a3, -[AUAudioUnitBusArray busType](self, "busType"), a4);

  return (char)a4;
}

- (BOOL)isCountChangeable
{
  return self->_countWritable;
}

@end
