@implementation LPFetcherAudioResponse

+ (id)audioPropertiesForFetcher:(id)a3
{
  return objc_alloc_init(LPAudioProperties);
}

- (LPFetcherAudioResponse)initWithAudio:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherAudioResponse *v8;
  LPFetcherAudioResponse *v9;
  LPFetcherAudioResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherAudioResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audio, a3);
    v10 = v9;
  }

  return v9;
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
}

@end
