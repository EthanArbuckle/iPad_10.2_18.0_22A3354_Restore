@implementation JTVideoMediaUtils

- (void)cacheTrackInformationWithAVAsset:(id)a3
{
  id v4;
  void *v5;
  double v6;
  __int128 v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  id v19;
  CMTime time;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id location;
  _OWORD v29[3];
  uint64_t v30;
  CMTime buf;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && !-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid"))
  {
    objc_msgSend(v4, "tracks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "duration");

      if (v30 >= 1)
      {
        -[JTVideoMediaUtils setCachedAssetInformationValid:](self, "setCachedAssetInformationValid:", 1);
        -[JTVideoMediaUtils setCachedVideoTrackCount:](self, "setCachedVideoTrackCount:", 0);
        -[JTVideoMediaUtils setCachedNaturalSize:](self, "setCachedNaturalSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
        LODWORD(v6) = 0;
        -[JTVideoMediaUtils setCachedFrameRate:](self, "setCachedFrameRate:", v6);
        v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        v29[0] = *MEMORY[0x24BDBD8B8];
        v29[1] = v7;
        v29[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        -[JTVideoMediaUtils setCachedTransform:](self, "setCachedTransform:", v29);
        JFXLog_DebugDataModel();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v4;
          LOWORD(buf.flags) = 2112;
          *(_QWORD *)((char *)&buf.flags + 2) = v4;
          _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "Movie (Video): tracksWithMediaCharacteristic assetToInsert=%p %@", (uint8_t *)&buf, 0x16u);
        }

        objc_initWeak(&location, self);
        v9 = dispatch_semaphore_create(0);
        v10 = MEMORY[0x24BDAC760];
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke;
        v25[3] = &unk_24EE58470;
        objc_copyWeak(&v27, &location);
        v11 = *MEMORY[0x24BDB1CE8];
        v12 = v9;
        v26 = v12;
        objc_msgSend(v4, "loadTracksWithMediaCharacteristic:completionHandler:", v11, v25);
        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(v4, "duration");
        v21 = v23;
        v22 = v24;
        -[JTVideoMediaUtils setCachedPreciseAssetDuration:](self, "setCachedPreciseAssetDuration:", &v21);
        -[JTVideoMediaUtils cachedPreciseAssetDuration](self, "cachedPreciseAssetDuration");
        CMTimeConvertScale(&buf, &time, 30, kCMTimeRoundingMethod_QuickTime);
        -[JTVideoMediaUtils setCachedDurationAt30fps:](self, "setCachedDurationAt30fps:", LODWORD(buf.value));
        -[JTVideoMediaUtils setCachedAudioTrackCount:](self, "setCachedAudioTrackCount:", 0);
        v13 = dispatch_semaphore_create(0);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2;
        v16[3] = &unk_24EE58498;
        objc_copyWeak(&v19, &location);
        v14 = *MEMORY[0x24BDB1C90];
        v17 = v4;
        v15 = v13;
        v18 = v15;
        objc_msgSend(v17, "loadTracksWithMediaCharacteristic:completionHandler:", v14, v16);
        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&v27);

        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }

}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  const opaqueCMFormatDescription *v13;
  CFPropertyListRef Extension;
  CFPropertyListRef v15;
  CFPropertyListRef v16;
  uint64_t v17;
  void *v18;
  CMTime v19;
  CMTime time1;
  CMTime time2;
  CMTime v22;
  CMTime rhs;
  CMTime v24;
  CMTime lhs;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  CMTime v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v10 && objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "isEnabled"))
        {
          objc_msgSend(WeakRetained, "setCachedVideoTrackCount:", objc_msgSend(WeakRetained, "cachedVideoTrackCount") + 1);
          objc_msgSend(v10, "naturalSize");
          objc_msgSend(WeakRetained, "setCachedNaturalSize:");
          objc_msgSend(v10, "nominalFrameRate");
          objc_msgSend(WeakRetained, "setCachedFrameRate:");
          objc_msgSend(v10, "preferredTransform");
          v26[0] = *(_OWORD *)&v29[0].value;
          v26[1] = *(_OWORD *)&v29[0].epoch;
          v27 = 0;
          v28 = 0;
          objc_msgSend(WeakRetained, "setCachedTransform:", v26);
          memset(v29, 0, 24);
          objc_msgSend(v10, "timeRange");
          lhs = v24;
          objc_msgSend(v10, "timeRange");
          rhs = v22;
          CMTimeAdd(v29, &lhs, &rhs);
          if (WeakRetained)
            objc_msgSend(WeakRetained, "cachedPreciseAssetDuration");
          else
            memset(&time2, 0, sizeof(time2));
          time1 = v29[0];
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            v19 = v29[0];
            objc_msgSend(WeakRetained, "setCachedPreciseAssetDuration:", &v19);
          }
          objc_msgSend(v10, "formatDescriptions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11 && objc_msgSend(v11, "count"))
          {
            v13 = (const opaqueCMFormatDescription *)objc_msgSend(v12, "objectAtIndex:", 0);
            objc_msgSend(WeakRetained, "setCachedCodec4cc:", CMFormatDescriptionGetMediaSubType(v13));
            Extension = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x24BDC5490]);
            v15 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x24BDC5510]);
            v16 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x24BDC5570]);
            if (Extension && v15)
            {
              objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:", Extension, v15, v16);
              v17 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
              v17 = objc_claimAutoreleasedReturnValue();
            }
            v18 = (void *)v17;
            objc_msgSend(WeakRetained, "setCachedColorSpace:", v17);

          }
          goto LABEL_24;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_24:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  const opaqueCMFormatDescription *v8;
  NSObject *v9;
  CMTime time;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    objc_msgSend(WeakRetained, "setCachedAudioTrackCount:", objc_msgSend(v3, "count"));
    if (objc_msgSend(WeakRetained, "cachedAudioTrackCount"))
    {
      if (!objc_msgSend(WeakRetained, "cachedVideoTrackCount"))
      {
        if (WeakRetained)
          objc_msgSend(WeakRetained, "cachedPreciseAssetDuration");
        else
          memset(&time, 0, sizeof(time));
        if (CMTimeGetSeconds(&time) > 2700.0)
        {
          objc_msgSend(v3, "objectAtIndex:", 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          if (v5)
          {
            objc_msgSend(v5, "formatDescriptions");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "count"))
            {
              v8 = (const opaqueCMFormatDescription *)objc_msgSend(v7, "objectAtIndex:", 0);
              if (v8)
              {
                objc_msgSend(WeakRetained, "setCacheWillDieDuringLoad:", CMAudioFormatDescriptionGetStreamBasicDescription(v8)->mFormatID == 778924083);
                if (objc_msgSend(WeakRetained, "cacheWillDieDuringLoad"))
                {
                  JFXLog_model();
                  v9 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
                    __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2_cold_1(a1, v9);

                }
              }
            }

          }
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)requestAVAssetAsyncWithAsset:(id)a3 needsDerivativeMedia:(BOOL)a4 frameRate:(float)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a4;
  v9 = a3;
  v10 = a6;
  if (a5 <= 105.0)
    v11 = ((unint64_t)objc_msgSend(v9, "mediaSubtypes") >> 17) & 1;
  else
    v11 = 1;
  v12 = objc_alloc_init(MEMORY[0x24BDE36B0]);
  objc_msgSend(v12, "setVersion:", v11);
  objc_msgSend(v12, "setNetworkAccessAllowed:", 0);
  objc_msgSend(v12, "setStreamingAllowed:", 0);
  if (v8)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v12, "setDeliveryMode:", v13);
  objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke;
  v18[3] = &unk_24EE584E8;
  v22 = v8;
  v19 = v9;
  v20 = v12;
  v21 = v10;
  v15 = v10;
  v16 = v12;
  v17 = v9;
  objc_msgSend(v14, "requestAVAssetForVideo:options:resultHandler:", v17, v16, v18);

}

void __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  char v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = +[CFXVideoSettings canDecodeHEVC2160P](CFXVideoSettings, "canDecodeHEVC2160P");
  if (v3 || *(_BYTE *)(a1 + 56))
    goto LABEL_3;
  v5 = v4;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight") <= 0x86F)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelWidth") < 0x870)
      v6 = 1;
    else
      v6 = v5;
    if ((v6 & 1) != 0)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(*(id *)(a1 + 40), "setDeliveryMode:", 2);
    objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke_2;
    v10[3] = &unk_24EE584C0;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "requestAVAssetForVideo:options:resultHandler:", v8, v9, v10);

    goto LABEL_4;
  }
  if ((v5 & 1) == 0)
    goto LABEL_12;
LABEL_3:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_4:

}

uint64_t __92__JTVideoMediaUtils_requestAVAssetAsyncWithAsset_needsDerivativeMedia_frameRate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (float)frameRate
{
  float result;

  if (!-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid"))
    return (float)+[JFXMediaSettings frameRate](JFXMediaSettings, "frameRate");
  -[JTVideoMediaUtils cachedFrameRate](self, "cachedFrameRate");
  return result;
}

- (int)durationAt30fpsWithAssetDuration:(double)a3
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMTime v14;

  if (-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid"))
    return -[JTVideoMediaUtils cachedDurationAt30fps](self, "cachedDurationAt30fps");
  JFXLog_model();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[JTVideoMediaUtils durationAt30fpsWithAssetDuration:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  CMTimeMakeWithSeconds(&v14, a3, 30);
  return v14.value;
}

- (BOOL)isOriginalHEVC4k
{
  double v3;
  BOOL result;

  result = 0;
  if (-[JTVideoMediaUtils cachedCodec4cc](self, "cachedCodec4cc") == 1752589105)
  {
    -[JTVideoMediaUtils cachedNaturalSize](self, "cachedNaturalSize");
    if (v3 >= 2160.0)
      return 1;
  }
  return result;
}

- (BOOL)isProRes
{
  unsigned int v2;

  v2 = -[JTVideoMediaUtils cachedCodec4cc](self, "cachedCodec4cc");
  return v2 - 1634755432 <= 0xB && ((1 << (v2 - 104)) & 0x8C1) != 0 || v2 == 1634743416 || v2 == 1634743400;
}

- (BOOL)hasAudibleCharacteristicWithIsMissing:(BOOL)a3
{
  unint64_t v4;

  v4 = -[JTVideoMediaUtils cachedAudioTrackCount](self, "cachedAudioTrackCount", a3);
  if (v4)
    LOBYTE(v4) = !-[JTVideoMediaUtils isUnsupportedAudio](self, "isUnsupportedAudio");
  return v4;
}

- (CGSize)naturalSizeWithIsMissing:(BOOL)a3 asset:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  CGSize result;

  v6 = a4;
  if (-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid"))
  {
    -[JTVideoMediaUtils cachedNaturalSize](self, "cachedNaturalSize");
    v8 = v7;
    v10 = v9;
  }
  else if (v6)
  {
    v8 = (double)(unint64_t)objc_msgSend(v6, "pixelWidth");
    v10 = (double)(unint64_t)objc_msgSend(v6, "pixelHeight");
  }
  else
  {
    v10 = 1080.0;
    if (!a3)
    {
      JFXLog_model();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[JTVideoMediaUtils naturalSizeWithIsMissing:asset:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    v8 = 1920.0;
  }

  v19 = v8;
  v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;

  result = (CGAffineTransform *)-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid");
  if ((_DWORD)result)
    return -[JTVideoMediaUtils cachedTransform](self, "cachedTransform");
  v6 = MEMORY[0x24BDBD8B8];
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  return result;
}

- (id)colorSpace
{
  void *v3;

  if (-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid"))
  {
    -[JTVideoMediaUtils cachedColorSpace](self, "cachedColorSpace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasVideoTracks
{
  return !-[JTVideoMediaUtils cachedAssetInformationValid](self, "cachedAssetInformationValid")
      || -[JTVideoMediaUtils cachedVideoTrackCount](self, "cachedVideoTrackCount") != 0;
}

- (BOOL)hasAudioTracks
{
  return -[JTVideoMediaUtils cachedAudioTrackCount](self, "cachedAudioTrackCount") != 0;
}

- (void)invalidateCachedAssetInformation
{
  -[JTVideoMediaUtils setCachedAssetInformationValid:](self, "setCachedAssetInformationValid:", 0);
}

- (BOOL)cachedAssetInformationValid
{
  return self->_cachedAssetInformationValid;
}

- (void)setCachedAssetInformationValid:(BOOL)a3
{
  self->_cachedAssetInformationValid = a3;
}

- (CGSize)cachedNaturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedNaturalSize.width;
  height = self->_cachedNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedNaturalSize:(CGSize)a3
{
  self->_cachedNaturalSize = a3;
}

- (float)cachedFrameRate
{
  return self->_cachedFrameRate;
}

- (void)setCachedFrameRate:(float)a3
{
  self->_cachedFrameRate = a3;
}

- (CGAffineTransform)cachedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].d;
  return self;
}

- (void)setCachedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_cachedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cachedTransform.c = v4;
  *(_OWORD *)&self->_cachedTransform.a = v3;
}

- (unsigned)cachedCodec4cc
{
  return self->_cachedCodec4cc;
}

- (void)setCachedCodec4cc:(unsigned int)a3
{
  self->_cachedCodec4cc = a3;
}

- (PVColorSpace)cachedColorSpace
{
  return self->_cachedColorSpace;
}

- (void)setCachedColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_cachedColorSpace, a3);
}

- (int)cachedDurationAt30fps
{
  return self->_cachedDurationAt30fps;
}

- (void)setCachedDurationAt30fps:(int)a3
{
  self->_cachedDurationAt30fps = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedPreciseAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setCachedPreciseAssetDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_cachedPreciseAssetDuration.epoch = a3->var3;
  *(_OWORD *)&self->_cachedPreciseAssetDuration.value = v3;
}

- (unint64_t)cachedVideoTrackCount
{
  return self->_cachedVideoTrackCount;
}

- (void)setCachedVideoTrackCount:(unint64_t)a3
{
  self->_cachedVideoTrackCount = a3;
}

- (unint64_t)cachedAudioTrackCount
{
  return self->_cachedAudioTrackCount;
}

- (void)setCachedAudioTrackCount:(unint64_t)a3
{
  self->_cachedAudioTrackCount = a3;
}

- (BOOL)cacheWillDieDuringLoad
{
  return self->_cacheWillDieDuringLoad;
}

- (void)setCacheWillDieDuringLoad:(BOOL)a3
{
  self->_cacheWillDieDuringLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColorSpace, 0);
}

void __54__JTVideoMediaUtils_cacheTrackInformationWithAVAsset___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "disable too long mp3 audio file: %@", (uint8_t *)&v3, 0xCu);
}

- (void)durationAt30fpsWithAssetDuration:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "durationAt30fps called before witout valid cached duration -> fix me please", a5, a6, a7, a8, 0);
}

- (void)naturalSizeWithIsMissing:(uint64_t)a3 asset:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "no natural size for Video...", a5, a6, a7, a8, 0);
}

@end
