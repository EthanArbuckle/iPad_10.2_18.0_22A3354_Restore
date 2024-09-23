@implementation PFVideoAVObjectBuilder(CMTimerange)

- (CMTimeRange)vcp_convertToOriginalTimerangeFromScaledTimerange:()CMTimerange
{
  __int128 v6;
  CMTime v8;
  CMTime end;
  __int128 v10;
  uint64_t v11;
  CMTime start;
  CMTimeRange range;
  CMTime v14;

  memset(&v14, 0, sizeof(v14));
  v6 = a2[1];
  *(_OWORD *)&range.start.value = *a2;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = a2[2];
  CMTimeRangeGetEnd(&v14, &range);
  v10 = *a2;
  v11 = *((_QWORD *)a2 + 2);
  objc_msgSend(a1, "convertToOriginalTimeFromScaledTime:forExport:", &v10, 1);
  v8 = v14;
  objc_msgSend(a1, "convertToOriginalTimeFromScaledTime:forExport:", &v8, 1);
  return CMTimeRangeFromTimeToTime(a3, &start, &end);
}

@end
