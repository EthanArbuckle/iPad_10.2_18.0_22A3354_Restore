@implementation HMDVideoStreamConfig

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)HMDVideoStreamConfig;
  -[HMDMediaStreamConfig addToDescription:](&v27, sel_addToDescription_, v3);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  -[AVCMediaStreamConfig video](self, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "txCodecType");
  -[AVCMediaStreamConfig video](self, "video");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "txCodecType");
  if (v7 == 1)
    v8 = CFSTR("kAVCCodecTypeHEVC");
  else
    v8 = CFSTR("Unknown AVC Video codec");
  if (!v7)
    v8 = CFSTR("kAVCCodecTypeH264");
  v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("video.txCodecType     = %tu, %@\n"), v5, v9);

  -[AVCMediaStreamConfig video](self, "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rxCodecType");
  -[AVCMediaStreamConfig video](self, "video");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "txCodecType");
  if (v13 == 1)
    v14 = CFSTR("kAVCCodecTypeHEVC");
  else
    v14 = CFSTR("Unknown AVC Video codec");
  if (!v13)
    v14 = CFSTR("kAVCCodecTypeH264");
  v15 = v14;
  objc_msgSend(v3, "appendFormat:", CFSTR("video.rxCodecType     = %tu, %@\n"), v11, v15);

  -[AVCMediaStreamConfig video](self, "video");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "videoResolution");
  -[AVCMediaStreamConfig video](self, "video");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "videoResolution");
  if (v19 > 0xE)
    v20 = CFSTR("Unknown AVC Video resolution");
  else
    v20 = off_24E7855E0[v19];
  v21 = v20;
  objc_msgSend(v3, "appendFormat:", CFSTR("video.videoResolution = %tu, %@\n"), v17, v21);

  -[AVCMediaStreamConfig video](self, "video");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("video.framerate       = %tu\n"), objc_msgSend(v22, "framerate"));

  -[AVCMediaStreamConfig video](self, "video");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("video.rxMaxBitrate    = %tu\n"), objc_msgSend(v23, "rxMaxBitrate"));

  -[AVCMediaStreamConfig video](self, "video");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("video.rxMinBitrate    = %tu\n"), objc_msgSend(v24, "rxMinBitrate"));

  v25 = (void *)objc_msgSend(v3, "copy");
  return v25;
}

@end
