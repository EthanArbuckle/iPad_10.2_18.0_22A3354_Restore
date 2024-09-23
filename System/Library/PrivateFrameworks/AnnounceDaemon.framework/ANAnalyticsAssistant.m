@implementation ANAnalyticsAssistant

- (ANAnalyticsAssistantAudioData)audioDataForAnnouncement:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  ANAnalyticsAssistantAudioData result;

  -[ANAnalyticsAssistant _playerForAnnouncement:](self, "_playerForAnnouncement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "duration");
    v6 = v5;
    objc_msgSend(v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    v9 = v6;
  }
  else
  {
    v9 = 0.0;
    v8 = 0;
  }

  v10 = v8;
  v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (ANAnalyticsAssistantSenderData)senderDataForAnnouncement:(SEL)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  ANAnalyticsAssistantSenderData *result;
  id v9;

  v9 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var0 = objc_msgSend(v9, "action");
  retstr->var1 = objc_msgSend(v9, "deviceClass");
  objc_msgSend(v9, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v9, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "target");

  }
  else
  {
    v7 = 0;
  }
  retstr->var2 = v7;

  retstr->var3 = objc_msgSend(v9, "source");
  return result;
}

- (int64_t)boundGroupCount:(int64_t)a3
{
  if (a3 >= 10)
    return 10;
  else
    return a3;
}

- (int64_t)bucketFromSize:(int64_t)a3
{
  return -[ANAnalyticsAssistant _linearBucketAtInterval:value:max:](self, "_linearBucketAtInterval:value:max:", 100000.0, (double)a3, 2000000.0);
}

- (int64_t)bucketFromDuration:(double)a3
{
  return -[ANAnalyticsAssistant _linearBucketAtInterval:value:max:](self, "_linearBucketAtInterval:value:max:", 5.0, a3, 60.0);
}

- (int64_t)bucketFromReceiveTime:(double)a3
{
  return -[ANAnalyticsAssistant _linearBucketAtInterval:value:max:](self, "_linearBucketAtInterval:value:max:", 0.5, a3, 10.0);
}

- (id)_playerForAnnouncement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "fileData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
    else
      v4 = 0;

  }
  if (v4)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithData:error:", v4, 0);
  else
    v7 = 0;

  return v7;
}

- (int)_linearBucketAtInterval:(double)a3 value:(double)a4 max:(double)a5
{
  if (a4 > a5)
    return (int)(a5 / a3 + 1.0);
  if (a4 <= 0.0)
    return 1;
  return vcvtpd_s64_f64(a4 / a3);
}

@end
