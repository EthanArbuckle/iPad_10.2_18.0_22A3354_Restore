@implementation AVPlayerVideoOutputConfiguration

- (AVPlayerVideoOutputConfiguration)initWithSourcePlayerItem:(id)a3 dataChannelDescriptions:(id)a4 transform:(CGAffineTransform *)a5 activationTime:(id *)a6
{
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVPlayerVideoOutputConfiguration;
  v10 = -[AVPlayerVideoOutputConfiguration init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a6->var0;
    *((_QWORD *)v10 + 5) = a6->var3;
    *(_OWORD *)(v10 + 24) = v12;
    *((_QWORD *)v10 + 2) = objc_msgSend(a4, "copy");
    v14 = *(_OWORD *)&a5->c;
    v13 = *(_OWORD *)&a5->tx;
    *((_OWORD *)v11 + 3) = *(_OWORD *)&a5->a;
    *((_OWORD *)v11 + 4) = v14;
    *((_OWORD *)v11 + 5) = v13;
    objc_storeWeak((id *)v11 + 1, a3);
  }
  return (AVPlayerVideoOutputConfiguration *)v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerVideoOutputConfiguration;
  -[AVPlayerVideoOutputConfiguration dealloc](&v3, sel_dealloc);
}

- (AVPlayerItem)sourcePlayerItem
{
  return (AVPlayerItem *)objc_loadWeak((id *)&self->_sourcePlayerItem);
}

- (void)setSourcePlayerItem:(id)a3
{
  objc_storeWeak((id *)&self->_sourcePlayerItem, a3);
}

- (NSArray)dataChannelDescriptions
{
  return self->_dataChannelDescriptions;
}

- (void)setDataChannelDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGAffineTransform)preferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setActivationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_activationTime.epoch = a3->var3;
  *(_OWORD *)&self->_activationTime.value = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourcePlayerItem);
}

@end
