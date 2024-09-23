@implementation QLWaveformScrubberViewProvider

- (id)createFilmstripViewForVideoScrubberView:(id)a3
{
  QLWaveformView *v3;

  v3 = [QLWaveformView alloc];
  return -[QLWaveformView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (void)generateWaveformForWidth:(double)a3 asset:(id)a4 updateHandler:(id)a5
{
  id v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  unint64_t v21;
  uint8_t buf[8];
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;

  v7 = a4;
  v8 = a5;
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  v11 = a3 / 3.0;
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_DEFAULT, "Generating waveforms... #Waveform", buf, 2u);
  }
  if ((unint64_t)v11)
  {
    v12 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __79__QLWaveformScrubberViewProvider_generateWaveformForWidth_asset_updateHandler___block_invoke;
    v19 = &unk_24C725DA0;
    v21 = (unint64_t)v11;
    v20 = v8;
    v13 = v7;
    v14 = &v16;
    v15 = *MEMORY[0x24BDB1CF0];
    *(_QWORD *)buf = v12;
    v23 = 3221225472;
    v24 = __QLWaveformDeterminePowerLevelsForAsset_block_invoke;
    v25 = &unk_24C725DF0;
    v27 = v14;
    v28 = (unint64_t)v11;
    v26 = v13;
    objc_msgSend(v13, "loadTracksWithMediaType:completionHandler:", v15, buf, v16, v17, v18, v19);

  }
}

void __79__QLWaveformScrubberViewProvider_generateWaveformForWidth_asset_updateHandler___block_invoke(uint64_t a1, uint64_t a2, void *__src)
{
  uint64_t v4;
  BOOL v5;
  char *v6;
  unint64_t v7;
  double *v8;
  unint64_t v9;
  double *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(0x2FC962FC962FC963 * a2) < 0x369D0369D0369D1 || (v5 = v4 == a2, v4 = a2, v5))
  {
    v6 = (char *)v14 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      memcpy(v6, __src, 8 * v7);
      v8 = (double *)v6;
      v9 = v7;
      do
      {
        *v8 = fmax(*v8 + -30.0, 0.0);
        ++v8;
        --v9;
      }
      while (v9);
      v10 = (double *)v6;
      v11 = v7;
      do
      {
        *v10 = *v10 / 10000.0;
        ++v10;
        --v11;
      }
      while (v11);
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor", __src);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    QLWaveformWithPowerLevels((uint64_t)v6, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
