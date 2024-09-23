@implementation AUV2BridgeBusArray

- (AUV2BridgeBusArray)initWithOwner:(id)a3 scope:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUV2BridgeBusArray;
  return -[AUAudioUnitBusArray initWithAudioUnit:busType:](&v5, sel_initWithAudioUnit_busType_, a3, a4);
}

- (BOOL)isCountChangeable
{
  AUV2BridgeBusArray *v2;
  void *v3;

  v2 = self;
  -[AUAudioUnitBusArray ownerAudioUnit](self, "ownerAudioUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_elementCountWritable:", -[AUAudioUnitBusArray busType](v2, "busType"));

  return (char)v2;
}

- (BOOL)setBusCount:(unint64_t)a3 error:(id *)a4
{
  void *v7;

  -[AUAudioUnitBusArray ownerAudioUnit](self, "ownerAudioUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "_setElementCount:count:error:", -[AUAudioUnitBusArray busType](self, "busType"), a3, a4);

  return (char)a4;
}

@end
