@implementation NSData(Nvi)

- (void)splitAudioDataToReachSampleCount:()Nvi currSampleCount:numBytesPerSample:completionHandler:
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a3 - a4;
  if ((uint64_t)(a3 - a4) <= 0)
  {
    v18 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315650;
      v20 = "-[NSData(Nvi) splitAudioDataToReachSampleCount:currSampleCount:numBytesPerSample:completionHandler:]";
      v21 = 2050;
      v22 = a4;
      v23 = 2050;
      v24 = a3;
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s RequiredSampleCount reached: currSampleCount=%{public}lu, endingSampleCount=%{public}lu", (uint8_t *)&v19, 0x20u);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v10 + 2))(v10, 0, 0, 0, 0, 1);
  }
  else
  {
    v12 = objc_msgSend(a1, "length");
    v13 = v12 / a5;
    if (v12 / a5 >= v11)
      v14 = a3 - a4;
    else
      v14 = v12 / a5;
    v15 = v13 - v14;
    if (v13 <= v11)
    {
      v16 = a1;
      v17 = 0;
    }
    else
    {
      objc_msgSend(a1, "subdataWithRange:", 0, v14 * a5);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "subdataWithRange:", v14 * a5, v15 * a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, id, unint64_t, void *, unint64_t, BOOL))v10 + 2))(v10, v16, v14, v17, v15, v14 + a4 >= a3);

  }
}

- (uint64_t)rawMicChannelsDataWithNumSamplesPerChannel:()Nvi
{
  return objc_msgSend(a1, "subdataWithRange:", +[NviConstants nviDirectionalityStartingChannelId](NviConstants, "nviDirectionalityStartingChannelId")* a3* +[NviConstants inputRecordingSampleByteDepth](NviConstants, "inputRecordingSampleByteDepth"), +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality")* a3* +[NviConstants inputRecordingSampleByteDepth](NviConstants, "inputRecordingSampleByteDepth"));
}

- (id)strRepForFloatData
{
  void *v2;
  id v3;
  float *v4;
  unint64_t v5;
  unint64_t v6;
  float v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[ "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (float *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 4)
  {
    v6 = v5 >> 2;
    do
    {
      v7 = *v4++;
      objc_msgSend(v2, "appendFormat:", CFSTR("%f "), v7);
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));
  return v2;
}

@end
