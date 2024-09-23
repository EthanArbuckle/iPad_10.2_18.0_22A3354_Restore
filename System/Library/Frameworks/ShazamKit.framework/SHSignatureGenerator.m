@implementation SHSignatureGenerator

- (SHSignatureGenerator)initWithMaximumSignatureDuration:(double)a3
{
  SHSignatureGenerator *v4;
  SHMutableSignature *v5;
  SHMutableSignature *mutableSignature;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHSignatureGenerator;
  v4 = -[SHSignatureGenerator init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:]([SHMutableSignature alloc], "initWithMaximumSeconds:clipStyle:", 0, a3);
    mutableSignature = v4->_mutableSignature;
    v4->_mutableSignature = v5;

  }
  return v4;
}

- (id)initSignatureRingBufferWithDuration:(double)a3
{
  SHSignatureGenerator *v4;
  SHMutableSignature *v5;
  SHMutableSignature *mutableSignature;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHSignatureGenerator;
  v4 = -[SHSignatureGenerator init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:]([SHMutableSignature alloc], "initWithMaximumSeconds:clipStyle:", 1, a3);
    mutableSignature = v4->_mutableSignature;
    v4->_mutableSignature = v5;

  }
  return v4;
}

- (SHSignatureGenerator)init
{
  SHMutableSignature *v3;
  SHSignatureGenerator *v4;

  v3 = objc_alloc_init(SHMutableSignature);
  v4 = -[SHSignatureGenerator initWithMutableSignature:](self, "initWithMutableSignature:", v3);

  return v4;
}

- (SHSignatureGenerator)initWithMutableSignature:(id)a3
{
  id v5;
  SHSignatureGenerator *v6;
  SHSignatureGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSignatureGenerator;
  v6 = -[SHSignatureGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutableSignature, a3);

  return v7;
}

- (BOOL)appendBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time error:(NSError *)error
{
  AVAudioTime *v8;
  AVAudioPCMBuffer *v9;
  void *v10;
  char v11;

  v8 = time;
  v9 = buffer;
  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "appendBuffer:atTime:error:", v9, v8, error);

  +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
  return v11;
}

- (SHSignature)signature
{
  void *v2;
  void *v3;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (SHSignature *)v3;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)maximumDuration
{
  void *v2;
  double v3;
  double v4;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumSeconds");
  v4 = v3;

  return v4;
}

- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4
{
  void *v6;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "updateRingBufferDuration:error:", a4, a3);

  return (char)a4;
}

- (void)enableSpectralOutput
{
  SHSpectralOutputConfiguration *v2;
  id v3;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SHSpectralOutputConfiguration initWithNumberOfBins:callbackFrequency:]([SHSpectralOutputConfiguration alloc], "initWithNumberOfBins:callbackFrequency:", 8, 8);
  objc_msgSend(v3, "setSpectralOutputConfiguration:", v2);

}

- (void)disableSpectralOutput
{
  id v2;

  -[SHSignatureGenerator mutableSignature](self, "mutableSignature");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableSpectralOutput");

}

+ (void)generateSignatureFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  void *v5;
  AVAsset *v6;
  SHMutableSignature *v7;
  void *v8;
  uint64_t v9;
  SHMutableSignature *v10;
  _QWORD v11[4];
  SHMutableSignature *v12;
  id v13;
  _QWORD v14[4];
  SHMutableSignature *v15;

  v5 = completionHandler;
  if (v5)
  {
    v6 = asset;
    v7 = objc_alloc_init(SHMutableSignature);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initStandardFormatWithSampleRate:channels:", 1, 16000.0);
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke;
    v14[3] = &unk_24D9B7A40;
    v15 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke_2;
    v11[3] = &unk_24D9B7A68;
    v12 = v15;
    v13 = v5;
    v10 = v15;
    +[SHAssetUtilities mixedTracksFromAsset:format:accumulator:completionHandler:](SHAssetUtilities, "mixedTracksFromAsset:format:accumulator:completionHandler:", v6, v8, v14, v11);

  }
}

id __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v3 = objc_msgSend(v2, "appendBuffer:atTime:error:", a2, 0, &v8);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if ((v3 & 1) == 0)
    v6 = v4;

  return v6;
}

void __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, a2);
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

- (SHMutableSignature)mutableSignature
{
  return self->_mutableSignature;
}

- (void)setMutableSignature:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSignature, 0);
}

@end
