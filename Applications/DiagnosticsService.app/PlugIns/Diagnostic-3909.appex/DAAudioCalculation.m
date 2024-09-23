@implementation DAAudioCalculation

+ (id)calculateCrossCorrelation:(id)a3 error:(id *)a4
{
  id v5;
  float v6;
  int v7;
  _BYTE *v8;
  vDSP_Length v9;
  const float *v10;
  char *v11;
  id v12;
  const float *v13;
  void *v14;
  void *v15;
  vDSP_Length v17;
  float __C;

  v5 = a3;
  objc_msgSend(v5, "fileTimeInFrames");
  v7 = (int)(float)(v6 - (float)(unint64_t)objc_msgSend(v5, "maximumDelay"));
  v8 = objc_msgSend(v5, "maximumDelay");
  v9 = v8 - (_BYTE *)objc_msgSend(v5, "minimumDelay");
  v10 = (const float *)objc_msgSend(v5, "sourceSignal");
  v11 = (char *)objc_msgSend(v5, "receivedSignal");
  v12 = objc_msgSend(v5, "minimumDelay");

  v13 = (const float *)&v11[4 * (_QWORD)v12];
  v14 = malloc_type_malloc(4 * (int)v9, 0x5A72F44FuLL);
  bzero(v14, 4 * (int)v9);
  vDSP_conv(v13, 1, v10, 1, (float *)v14, 1, v9, v7);
  __C = 0.0;
  v17 = 0;
  vDSP_maxvi((const float *)v14, 1, &__C, &v17, v9);
  free(v14);
  v15 = 0;
  if (COERCE_UNSIGNED_INT(fabs(log10f(__C) * 10.0)) <= 0x7F7FFFFF)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  if (a4 && !v15)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -62, 0));
  return v15;
}

@end
