@implementation MRGetNowPlayingInfo

void ___MRGetNowPlayingInfo_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MRNowPlayingArtworkImage *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  MRNowPlayingArtworkImage *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  MRNowPlayingArtworkImage *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v3 = a2;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__21;
  v30 = __Block_byref_object_dispose__21;
  v31 = 0;
  objc_msgSend(v3, "resolvedPlayerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "nowPlayingInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "mutableCopy");
      v8 = (void *)v27[5];
      v27[5] = v7;

      objc_msgSend(v3, "contentItemWithOffset:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "artwork");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "artworkMIMEType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v14 = MRNowPlayingArtworkCreateWithImageData((uint64_t)v11, (uint64_t)v13);
      else
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workerQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___MRGetNowPlayingInfo_block_invoke_22;
  v20[3] = &unk_1E30CA8F0;
  v18 = v4;
  v21 = v18;
  v25 = &v26;
  v22 = *(id *)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v19 = v14;
  v23 = v19;
  +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:](MRDeviceInfoRequest, "deviceInfoForOrigin:queue:completion:", v17, v16, v20);

  _Block_object_dispose(&v26, 8);
}

uint64_t ___MRGetNowPlayingInfo_block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

void ___MRGetNowPlayingInfo_block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isResolved")
    && objc_msgSend(*(id *)(a1 + 32), "isSystemMediaApplication"))
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMRMediaRemoteNowPlayingInfoIsMusicApp"));
  }
  if (objc_msgSend(v3, "isGroupLeader") && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", v10, CFSTR("kMRMediaRemoteNowPlayingInfoClientPropertiesData"));

    }
  }
  v11 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MRGetNowPlayingInfo_block_invoke_2;
  block[3] = &unk_1E30CA8C8;
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v16 = v12;
  v17 = v13;
  v15 = *(id *)(a1 + 48);
  dispatch_async(v11, block);

}

@end
