@implementation MPCModelRadioPlaybackQueueStationTracksCollection

uint64_t __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendSection:", v6);
  objc_msgSend(*(id *)(a1 + 40), "appendSection:", v6);

  v10[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke_2;
  v10[3] = &unk_24CAB99B0;
  v13 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(v11 + 48);
  v14 = a3;
  v12 = v7;
  return objc_msgSend(v8, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v10);
}

void __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isExplicitItemAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "appendItem:", v8);
    v6 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "itemAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItem:", v7);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

}

uint64_t __76___MPCModelRadioPlaybackQueueStationTracksCollection_isExplicitItemAtIndex___block_invoke(uint64_t result, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = result;
    result = objc_msgSend(a3, "item");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __68___MPCModelRadioPlaybackQueueStationTracksCollection_AVItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __85___MPCModelRadioPlaybackQueueStationTracksCollection_updateWithPersonalizedResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
