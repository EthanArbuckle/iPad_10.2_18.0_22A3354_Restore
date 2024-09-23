@implementation AXMActiveSound

- (AXMActiveSound)init
{
  AXMActiveSound *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMActiveSound;
  v2 = -[AXMActiveSound init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
    -[AXMActiveSound setPlayer:](v2, "setPlayer:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C89B48]);
    -[AXMActiveSound setTimePitch:](v2, "setTimePitch:", v4);

  }
  return v2;
}

- (void)connectToEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[AXMActiveSound player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachNode:", v5);

  objc_msgSend(v4, "mainMixerNode");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", 2, 44100.0);
  -[AXMActiveSound timePitch](self, "timePitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachNode:", v7);

  -[AXMActiveSound player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMActiveSound timePitch](self, "timePitch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connect:to:fromBus:toBus:format:", v8, v9, 0, 0, v6);

  -[AXMActiveSound timePitch](self, "timePitch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connect:to:fromBus:toBus:format:", v10, v11, 0, objc_msgSend(v11, "nextAvailableInputBus"), v6);

}

- (void)disconnectFromEngine:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXMActiveSound player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachNode:", v5);

  -[AXMActiveSound timePitch](self, "timePitch");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachNode:", v6);

}

- (BOOL)beginPlayback:(id)a3 withError:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C89AC0];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "processingFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPCMFormat:frameCapacity:", v9, objc_msgSend(v7, "length"));

  v11 = objc_msgSend(v7, "readIntoBuffer:error:", v10, a4);
  if (v11)
  {
    -[AXMActiveSound player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleBuffer:atTime:options:completionHandler:", v10, 0, 1, 0);

    -[AXMActiveSound player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "play");

  }
  return v11;
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAudioUnitTimePitch)timePitch
{
  return self->_timePitch;
}

- (void)setTimePitch:(id)a3
{
  objc_storeStrong((id *)&self->_timePitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePitch, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
