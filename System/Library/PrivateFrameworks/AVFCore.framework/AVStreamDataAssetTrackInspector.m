@implementation AVStreamDataAssetTrackInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVStreamDataAssetTrackInspector;
  v7 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v10, sel__initWithAsset_trackID_trackIndex_, a3, *(_QWORD *)&a4, a5);
  v8 = v7;
  if (v7)
  {
    *((_DWORD *)v7 + 10) = a4;
    *((_QWORD *)v7 + 4) = (id)objc_msgSend(a3, "_weakReference");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAssetTrackInspector;
  -[AVAssetTrackInspector dealloc](&v3, sel_dealloc);
}

- (int)trackID
{
  return self->_trackID;
}

- (unsigned)figMediaType
{
  return AVOSTypeForString(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"));
}

- (id)mediaType
{
  return (id)objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject"), "mediaTypeForTrackID:", self->_trackID);
}

- (BOOL)isEnabled
{
  return objc_msgSend((id)objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject"), "parser"), "shouldProvideMediaDataForTrackID:", self->_trackID);
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  CMTime v4;
  CMTime start;

  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v4 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v4);
}

- (CGSize)naturalSize
{
  id v3;
  double width;
  double height;
  CGSize PresentationDimensions;
  CGSize result;

  v3 = -[AVStreamDataAssetTrackInspector formatDescriptions](self, "formatDescriptions");
  if (objc_msgSend(v3, "count")
    && objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqual:", CFSTR("vide")))
  {
    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v3, "firstObject"), 1u, 1u);
    height = PresentationDimensions.height;
    width = PresentationDimensions.width;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)dimensions
{
  id v3;
  CMVideoDimensions Dimensions;
  double width;
  double height;
  CGSize result;

  v3 = -[AVStreamDataAssetTrackInspector formatDescriptions](self, "formatDescriptions");
  if (objc_msgSend(v3, "count")
    && objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqual:", CFSTR("vide")))
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v3, "firstObject"));
    width = (double)Dimensions.width;
    height = (double)Dimensions.height;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)formatDescriptions
{
  return (id)objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject"), "formatDescriptionsForTrackID:", self->_trackID);
}

- (id)mediaCharacteristics
{
  void *v3;
  const AVMediaCharacteristic *v4;
  const __CFString *v5;
  void *v6;
  const AVMediaCharacteristic *v7;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;

  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")))
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &AVMediaCharacteristicFrameBased;
LABEL_3:
    v5 = (const __CFString *)*v4;
    v10 = 0;
    return (id)objc_msgSend(v3, "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), v5, v10, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &AVMediaCharacteristicAudible;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("text")))goto LABEL_11;
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("clcp")))
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &AVMediaCharacteristicLegible;
    goto LABEL_3;
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("sbtl")))
  {
LABEL_11:
    v3 = (void *)MEMORY[0x1E0C99D20];
    v5 = CFSTR("AVMediaCharacteristicLegible");
    v10 = CFSTR("AVMediaCharacteristicFrameBased");
    v11 = 0;
    return (id)objc_msgSend(v3, "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), v5, v10, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("tmcd")))
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &AVMediaCharacteristicVisual;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  if (objc_msgSend(-[AVStreamDataAssetTrackInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("meta")))
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &AVMediaCharacteristicFrameBased;
    return (id)objc_msgSend(v6, "arrayWithObjects:", *v7, 0, v9, v11);
  }
  return 0;
}

@end
