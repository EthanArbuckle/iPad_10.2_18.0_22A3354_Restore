@implementation AVAssetTrack(MediaAnalysis)

- (double)vcp_startTime
{
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(a1, "timeRange");
  result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(_QWORD *)(a2 + 16) = v5;
  return result;
}

- (CMTime)vcp_endTime
{
  CMTimeRange v4;

  objc_msgSend(a1, "timeRange");
  return CMTimeRangeGetEnd(a2, &v4);
}

- (uint64_t)vcp_orientation
{
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned int v6;
  uint64_t result;
  _QWORD *v8;
  double v9;

  objc_msgSend(a1, "naturalSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "preferredTransform");
  v6 = orientationForTransform(&v9) - 1;
  if (v3 < v5)
    result = 1;
  else
    result = 3;
  if (v6 <= 6)
  {
    v8 = &unk_1B6FBF578;
    if (v3 < v5)
      v8 = &unk_1B6FBF5B0;
    return v8[v6];
  }
  return result;
}

- (uint64_t)vcp_imageOrientation
{
  int v1;
  unint64_t v3;
  uint8_t v4[16];
  _OWORD v5[3];

  objc_msgSend(a1, "preferredTransform");
  v1 = angleForTransform(v5);
  switch(v1)
  {
    case 90:
      return 6;
    case 270:
      return 8;
    case 180:
      return 3;
  }
  HIDWORD(v3) = -1527099483 * v1 + 47721858;
  LODWORD(v3) = HIDWORD(v3);
  if ((v3 >> 1) >= 0x2D82D83
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Video track rotation angle is not multiple of 90", v4, 2u);
  }
  return 1;
}

- (double)vcp_fullFrameSize
{
  void *v1;
  void *v2;
  double v3;

  objc_msgSend(a1, "formatDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v3 = *(_OWORD *)&CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v2, 0, 0);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
  }

  return v3;
}

- (double)vcp_cleanApertureRect
{
  void *v1;
  void *v2;
  double v3;

  objc_msgSend(a1, "formatDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v3 = (unint64_t)CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v2, 1u);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
  }

  return v3;
}

- (uint64_t)vcp_sampleCountForTimeRange:()MediaAnalysis
{
  __int128 v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  CMTime v10;
  __int128 v11;
  uint64_t v12;
  CMTimeRange range;
  CMTime v14;
  CMTimeRange range2;
  CMTimeRange range1;
  CMTime time2;
  CMTime time1;

  v5 = a3[1];
  *(_OWORD *)&range1.start.value = *a3;
  *(_OWORD *)&range1.start.epoch = v5;
  *(_OWORD *)&range1.duration.timescale = a3[2];
  objc_msgSend(a1, "timeRange");
  if (CMTimeRangeEqual(&range1, &range2))
  {
    objc_msgSend(a1, "makeSampleCursorAtFirstSampleInDecodeOrder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "stepInPresentationOrderByCount:", 0x7FFFFFFFFFFFFFFFLL) + 1;
  }
  else
  {
    memset(&v14, 0, sizeof(v14));
    v8 = a3[1];
    *(_OWORD *)&range.start.value = *a3;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = a3[2];
    CMTimeRangeGetEnd(&v14, &range);
    v11 = *a3;
    v12 = *((_QWORD *)a3 + 2);
    objc_msgSend(a1, "makeSampleCursorWithPresentationTimeStamp:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    do
    {
      if (v6)
        objc_msgSend(v6, "presentationTimeStamp");
      else
        memset(&v10, 0, sizeof(v10));
      time1 = v10;
      time2 = v14;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        break;
      ++v7;
    }
    while (objc_msgSend(v6, "stepInPresentationOrderByCount:", 1) >= 1);
  }

  return v7;
}

@end
