@implementation AVAudioSessionServerFactory

+ (id)createServer
{
  return objc_alloc_init(AVAudioSessionServerPriv);
}

+ (id)createServerWithAudioControlQueue:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  AVAudioSessionServerPriv *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[AVAudioSessionServerPriv initWithAudioControlQueue:delegate:]([AVAudioSessionServerPriv alloc], "initWithAudioControlQueue:delegate:", v5, v6);

  return v7;
}

+ (id)createServerWithDelegate:(id)a3 audioControlQueue:(id)a4
{
  id v5;
  id v6;
  AVAudioSessionServerPriv *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[AVAudioSessionServerPriv initWithAudioControlQueue:delegate:]([AVAudioSessionServerPriv alloc], "initWithAudioControlQueue:delegate:", v6, v5);

  return v7;
}

@end
