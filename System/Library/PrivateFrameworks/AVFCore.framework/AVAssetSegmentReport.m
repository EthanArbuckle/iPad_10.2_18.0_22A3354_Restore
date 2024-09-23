@implementation AVAssetSegmentReport

- (AVAssetSegmentReport)initWithFigSegmentReportDictionary:(id)a3
{
  AVAssetSegmentReport *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetSegmentTrackReport *v11;
  AVAssetSegmentReport *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v14 = self;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v15, v16, v17, v18, v19, (uint64_t)"figSegmentReportDict != nil"), 0);
    objc_exception_throw(v20);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVAssetSegmentReport;
  v5 = -[AVAssetSegmentReport init](&v25, sel_init);
  if (v5)
  {
    v5->_segmentType = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3B98]), "integerValue");
    v6 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BA0]);
    v5->_trackReports = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = -[AVAssetSegmentTrackReport initWithFigSegmentTrackReportDictionary:]([AVAssetSegmentTrackReport alloc], "initWithFigSegmentTrackReportDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
          -[NSMutableArray addObject:](v5->_trackReports, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetSegmentReport;
  -[AVAssetSegmentReport dealloc](&v3, sel_dealloc);
}

- (AVAssetSegmentType)segmentType
{
  return self->_segmentType;
}

- (NSArray)trackReports
{
  return &self->_trackReports->super;
}

@end
