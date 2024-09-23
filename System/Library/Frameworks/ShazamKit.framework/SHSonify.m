@implementation SHSonify

+ (id)audioRepresentationOfSignature:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDB1818];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 1, 48000.0);
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sampleRate");
  v14 = 0;
  +[SigSonify sonifySignature:withSampleRate:error:](SigSonify, "sonifySignature:withSampleRate:error:", v6, v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (objc_msgSend(v8, "length"))
  {
    v10 = objc_retainAutorelease(v8);
    +[SHAudioUtilities audioBufferFromData:byteSize:inFormat:](SHAudioUtilities, "audioBufferFromData:byteSize:inFormat:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sh_log_object();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_218BF1000, v12, OS_LOG_TYPE_ERROR, "Unable to generate audio representation of signature with error %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

@end
