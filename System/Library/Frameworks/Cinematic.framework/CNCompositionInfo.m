@implementation CNCompositionInfo

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofCinematicAssetInfo:(CNAssetInfo *)assetInfo atTime:(CMTime *)startTime error:(NSError *)outError
{
  CNAssetInfo *v10;
  void *v11;
  void *v12;
  __int128 v13;
  NSError *v14;
  BOOL v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  __int128 v21;
  void *v22;
  __int128 v23;
  void *v24;
  __int128 v25;
  id v27;
  id v28;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;

  v10 = assetInfo;
  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAssetInfo cinematicVideoTrack](v10, "cinematicVideoTrack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v13 = *(_OWORD *)&timeRange->start.epoch;
  v30 = *(_OWORD *)&timeRange->start.value;
  v31 = v13;
  v32 = *(_OWORD *)&timeRange->duration.timescale;
  v29 = *startTime;
  objc_msgSend(v11, "insertTimeRange:ofTrack:atTime:error:", &v30, v12, &v29, &v33);
  v14 = (NSError *)v33;

  if (!v14)
  {
    -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAssetInfo cinematicDisparityTrack](v10, "cinematicDisparityTrack");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v18 = *(_OWORD *)&timeRange->start.epoch;
    v30 = *(_OWORD *)&timeRange->start.value;
    v31 = v18;
    v32 = *(_OWORD *)&timeRange->duration.timescale;
    v29 = *startTime;
    objc_msgSend(v16, "insertTimeRange:ofTrack:atTime:error:", &v30, v17, &v29, &v28);
    v14 = (NSError *)v28;

    if (!v14)
    {
      -[CNAssetInfo cinematicMetadataTrack](self, "cinematicMetadataTrack");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAssetInfo cinematicMetadataTrack](v10, "cinematicMetadataTrack");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v21 = *(_OWORD *)&timeRange->start.epoch;
      v30 = *(_OWORD *)&timeRange->start.value;
      v31 = v21;
      v32 = *(_OWORD *)&timeRange->duration.timescale;
      v29 = *startTime;
      objc_msgSend(v19, "insertTimeRange:ofTrack:atTime:error:", &v30, v20, &v29, &v27);
      v14 = (NSError *)v27;

      if (!v14)
      {
        v15 = 1;
        goto LABEL_9;
      }
      -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_OWORD *)&timeRange->start.epoch;
      v30 = *(_OWORD *)&timeRange->start.value;
      v31 = v23;
      v32 = *(_OWORD *)&timeRange->duration.timescale;
      objc_msgSend(v22, "removeTimeRange:", &v30);

    }
    -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_OWORD *)&timeRange->start.epoch;
    v30 = *(_OWORD *)&timeRange->start.value;
    v31 = v25;
    v32 = *(_OWORD *)&timeRange->duration.timescale;
    objc_msgSend(v24, "removeTimeRange:", &v30);

    if (outError)
      goto LABEL_3;
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  if (!outError)
    goto LABEL_8;
LABEL_3:
  v14 = objc_retainAutorelease(v14);
  v15 = 0;
  *outError = v14;
LABEL_9:

  return v15;
}

@end
