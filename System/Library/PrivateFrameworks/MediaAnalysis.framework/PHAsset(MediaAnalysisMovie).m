@implementation PHAsset(MediaAnalysisMovie)

- (unint64_t)vcp_isVideoSlowmo
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 17) & 1;
}

- (unint64_t)vcp_isVideoTimelapse
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 18) & 1;
}

- (uint64_t)vcp_isShortMovie
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "isVideo");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "duration");
    return v3 < (float)(unint64_t)objc_msgSend((id)objc_opt_class(), "vcp_shortMovieDurationThreshold");
  }
  return result;
}

@end
