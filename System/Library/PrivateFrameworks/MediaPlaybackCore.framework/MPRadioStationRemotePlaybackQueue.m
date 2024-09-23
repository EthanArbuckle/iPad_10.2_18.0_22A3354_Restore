@implementation MPRadioStationRemotePlaybackQueue

uint64_t __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2;
  v3[3] = &unk_24CAB7E90;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "setRadioIdentifiersWithBlock:", v3);
}

void __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stationStringID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "stationStringID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStationStringID:", v6);

LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "stationID"))
  {
    objc_msgSend(v7, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "stationID"));
    goto LABEL_5;
  }
LABEL_6:

}

@end
