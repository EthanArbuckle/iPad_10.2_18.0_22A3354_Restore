@implementation HMDAudioStreamConfig

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)HMDAudioStreamConfig;
  -[HMDMediaStreamConfig addToDescription:](&v22, sel_addToDescription_, v3);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  -[AVCMediaStreamConfig audio](self, "audio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "codecType");
  -[AVCMediaStreamConfig audio](self, "audio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "codecType");
  if (v7 > 0xB)
    v8 = CFSTR("Unknown AVC Audio codec");
  else
    v8 = off_24E785580[v7];
  v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.codecType       = %tu, %@\n"), v5, v9);

  -[AVCMediaStreamConfig audio](self, "audio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.dtmfPayloadType = %tu\n"), objc_msgSend(v10, "dtmfPayloadType"));

  -[AVCMediaStreamConfig audio](self, "audio");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isOctectAligned");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.octetAligned    = %@\n"), v12);

  -[AVCMediaStreamConfig audio](self, "audio");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "isDTXEnabled");
  HMFEnabledStatusToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.dtxEnabled      = %@\n"), v14);

  -[AVCMediaStreamConfig audio](self, "audio");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.audioStreamMode = %tu\n"), objc_msgSend(v15, "audioStreamMode"));

  -[AVCMediaStreamConfig audio](self, "audio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "isCNEnabled");
  HMFEnabledStatusToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.cnEnabled       = %@\n"), v17);

  -[AVCMediaStreamConfig audio](self, "audio");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.cnPayloadType   = %tu\n"), objc_msgSend(v18, "cnPayloadType"));

  -[AVCMediaStreamConfig audio](self, "audio");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("audio.ptime           = %tu ms\n"), objc_msgSend(v19, "ptime"));

  v20 = (void *)objc_msgSend(v3, "copy");
  return v20;
}

@end
