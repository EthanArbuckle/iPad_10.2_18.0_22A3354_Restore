@implementation JFXFaceTrackingPlaybackUtilities

+ (void)arDataForPlaybackElement:(id)a3 atPlaybackTime:(id *)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v7 = a3;
  v8 = a5;
  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__JFXFaceTrackingPlaybackUtilities_arDataForPlaybackElement_atPlaybackTime_completion___block_invoke;
  block[3] = &unk_24EE58028;
  v13 = v7;
  v14 = v8;
  v15 = *a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __87__JFXFaceTrackingPlaybackUtilities_arDataForPlaybackElement_atPlaybackTime_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int32_t v7;
  void *v8;
  void *v9;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange lhs;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime rhs;
  CMTime v17;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("arDataForPlaybackElement"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createARMetadataReaderWithCreationAttributesProvider:name:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  v7 = +[JFXMediaSettings timeScale](JFXMediaSettings, "timeScale");
  memset(&v17, 0, sizeof(v17));
  CMTimeFromFrameTime(objc_msgSend(*(id *)(a1 + 32), "presentationTime"), v7, &rhs);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)(a1 + 48);
  lhs.start.epoch = *(_QWORD *)(a1 + 64);
  CMTimeSubtract(&v17, &lhs.start, &rhs);
  memset(&v15, 0, sizeof(v15));
  CMTimeFromFrameTime(objc_msgSend(*(id *)(a1 + 32), "mediaStartOffset"), v7, &v14);
  lhs.start = v17;
  CMTimeAdd(&v15, &lhs.start, &v14);
  memset(&v13, 0, sizeof(v13));
  CMTimeMake(&v13, 1, v7);
  objc_msgSend(v6, "setIsScrubbing:", 1);
  memset(&lhs, 0, sizeof(lhs));
  start.start = v15;
  duration = v13;
  CMTimeRangeMake(&lhs, &start.start, &duration);
  start = lhs;
  if ((objc_msgSend(v6, "beginReadingAtTimeRange:", &start) & 1) != 0)
  {
    start.start = v15;
    objc_msgSend(v6, "arMetadataItemForTime:", &start);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_4:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
