@implementation MusicKit_SoftLinking(MusicKit_SoftLinking_MPCPlayerPath)

+ (uint64_t)deviceActivePlayerPath
{
  return objc_msgSend(getMPCPlayerPathClass(), "deviceActivePlayerPath");
}

+ (id)systemMusicPathWithRoute:()MusicKit_SoftLinking_MPCPlayerPath playerID:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (!v7)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v9 = (void *)getMPAVRoutingControllerClass_softClass;
    v17 = getMPAVRoutingControllerClass_softClass;
    if (!getMPAVRoutingControllerClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getMPAVRoutingControllerClass_block_invoke;
      v13[3] = &unk_1E9C05688;
      v13[4] = &v14;
      __getMPAVRoutingControllerClass_block_invoke((uint64_t)v13);
      v9 = (void *)v15[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v10, "systemRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(getMPCPlayerPathClass(), "systemMusicPathWithRoute:playerID:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)playerPathWithUnderlyingPlayerPath:()MusicKit_SoftLinking_MPCPlayerPath
{
  return a3;
}

@end
