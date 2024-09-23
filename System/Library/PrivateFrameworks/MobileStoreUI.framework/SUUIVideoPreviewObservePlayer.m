@implementation SUUIVideoPreviewObservePlayer

void __SUUIVideoPreviewObservePlayer_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a2;
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v3, "com.apple.iTunesStoreUI.MoviePlayerItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    objc_msgSend(v3, "accessLog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __SUUIVideoPreviewObservePlayer_block_invoke_2;
    v11[3] = &unk_2511F9EF0;
    v11[4] = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

    if (v13[3] >= 5.0)
    {
      objc_msgSend(v4, "longLongValue");
      v7 = (void *)SUCreatePreviewHistoryOperation();
      objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addOperation:", v7);

    }
    _Block_object_dispose(&v12, 8);
  }
  objc_getAssociatedObject(v3, "com.apple.iTunesStoreUI.MoviePlayerTrackingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("SUUIVideoPreviewDidEndNotification"), 0);

  }
}

uint64_t __SUUIVideoPreviewObservePlayer_block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "durationWatched");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

void __SUUIVideoPreviewObservePlayer_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BDB1FA8];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v2, 0, v3, *(_QWORD *)(a1 + 32));

  v5 = *MEMORY[0x24BDB1FB8];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, *(_QWORD *)(a1 + 32));

}

@end
