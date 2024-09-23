@implementation NSValue(NSValueCMTimeExtensions)

+ (CMTimeAsValue)valueWithCMTime:()NSValueCMTimeExtensions
{
  __int128 v4;
  uint64_t v5;

  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  return +[CMTimeAsValue valueWithCMTime:](CMTimeAsValue, "valueWithCMTime:", &v4);
}

+ (CMTimeRangeAsValue)valueWithCMTimeRange:()NSValueCMTimeExtensions
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return +[CMTimeRangeAsValue valueWithCMTimeRange:](CMTimeRangeAsValue, "valueWithCMTimeRange:", v5);
}

- (CMTime)CMTimeValue
{
  const char *v4;
  CMTime *result;
  uint64_t v6;
  CMTimeEpoch epoch;
  Float64 v8;
  CMTime v9;
  Float64 v10;

  v4 = (const char *)objc_msgSend(a1, "objCType");
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (!strcmp("{?=qiIq}", v4))
    return (CMTime *)objc_msgSend(a1, "getValue:", a2);
  if (!strcmp("d", v4))
  {
    v10 = 0.0;
    objc_msgSend(a1, "getValue:", &v10);
    v8 = v10;
LABEL_8:
    result = CMTimeMakeWithSeconds(&v9, v8, 1000000);
    *(_OWORD *)a2 = *(_OWORD *)&v9.value;
    epoch = v9.epoch;
    goto LABEL_9;
  }
  result = (CMTime *)strcmp("f", v4);
  if (!(_DWORD)result)
  {
    LODWORD(v10) = 0;
    objc_msgSend(a1, "getValue:", &v10);
    v8 = *(float *)&v10;
    goto LABEL_8;
  }
  v6 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
  epoch = *(_QWORD *)(v6 + 16);
LABEL_9:
  a2[2] = epoch;
  return result;
}

- (uint64_t)CMTimeRangeValue
{
  const char *v4;
  uint64_t result;
  uint64_t v6;
  __int128 v7;

  v4 = (const char *)objc_msgSend(a1, "objCType");
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  result = strcmp("{?={?=qiIq}{?=qiIq}}", v4);
  if (!(_DWORD)result)
    return objc_msgSend(a1, "getValue:", a2);
  v6 = MEMORY[0x1E0CA2E40];
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *a2 = *MEMORY[0x1E0CA2E40];
  a2[1] = v7;
  a2[2] = *(_OWORD *)(v6 + 32);
  return result;
}

+ (CMTimeMappingAsValue)valueWithCMTimeMapping:()NSValueCMTimeExtensions
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[6];

  v3 = a3[3];
  v7[2] = a3[2];
  v7[3] = v3;
  v4 = a3[5];
  v7[4] = a3[4];
  v7[5] = v4;
  v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  return +[CMTimeMappingAsValue valueWithCMTimeMapping:](CMTimeMappingAsValue, "valueWithCMTimeMapping:", v7);
}

- (uint64_t)CMTimeMappingValue
{
  const char *v4;
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = (const char *)objc_msgSend(a1, "objCType");
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  result = strcmp("{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}", v4);
  if (!(_DWORD)result)
    return objc_msgSend(a1, "getValue:", a2);
  v6 = MEMORY[0x1E0CA2E40];
  v7 = *MEMORY[0x1E0CA2E40];
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *a2 = *MEMORY[0x1E0CA2E40];
  a2[1] = v8;
  v9 = *(_OWORD *)(v6 + 32);
  a2[2] = v9;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  return result;
}

@end
