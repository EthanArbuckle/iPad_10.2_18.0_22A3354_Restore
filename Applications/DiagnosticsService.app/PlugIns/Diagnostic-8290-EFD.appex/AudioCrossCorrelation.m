@implementation AudioCrossCorrelation

+ (id)calculatePeakDBValueWithSourceSignalData:(id)a3 resultSignalData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const float *v17;
  vDSP_Length v18;
  unint64_t v19;
  void *v20;
  vDSP_Length v22;
  float __C;

  v7 = a4;
  v8 = a3;
  v9 = (unint64_t)objc_msgSend(v7, "length") >> 2;
  v10 = v9 + ((unint64_t)objc_msgSend(v8, "length") >> 2) - 1;
  v11 = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  bzero(v11, 4 * v10);
  v12 = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  bzero(v12, v10);
  v13 = objc_retainAutorelease(v7);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  memcpy(v12, v14, (size_t)v15);
  v16 = objc_retainAutorelease(v8);
  v17 = (const float *)objc_msgSend(v16, "bytes");
  v18 = (unint64_t)objc_msgSend(v16, "length") >> 2;
  v19 = (unint64_t)objc_msgSend(v16, "length");

  vDSP_conv((const float *)v12, 1, v17, 1, (float *)v11, 1, v18, v19 >> 2);
  __C = 0.0;
  v22 = 0;
  vDSP_maxvi((const float *)v11, 1, &__C, &v22, v10);
  free(v11);
  free(v12);
  v20 = 0;
  if (COERCE_UNSIGNED_INT(fabs(log10f(__C) * 10.0)) <= 0x7F7FFFFF)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  if (a5 && !v20)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -62, 0));
  return v20;
}

+ (id)convertWAVtoNSDataWithFileStringURL:(id)a3 withSampleRate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  NSObject *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v8);

  v10 = objc_msgSend(objc_alloc((Class)AVAudioFile), "initForReading:error:", v9, a5);
  v11 = objc_alloc((Class)AVAudioPCMBuffer);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processingFormat"));
  v13 = objc_msgSend(v11, "initWithPCMFormat:frameCapacity:", v12, objc_msgSend(v10, "length"));

  objc_msgSend(v10, "readIntoBuffer:error:", v13, a5);
  v14 = *a5;
  v15 = DiagnosticLogHandleForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a5, "localizedDescription"));
      v36 = 138412290;
      v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "WAV Audio could not be loaded into PCM buffer. Error : %@", (uint8_t *)&v36, 0xCu);

    }
    v19 = -66;
LABEL_14:
    v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), v19, 0));
    goto LABEL_15;
  }
  if (v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "format"));
    objc_msgSend(v20, "sampleRate");
    v36 = 134218242;
    v37 = v21;
    v38 = 2112;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Source WAV file sample rate: %f. Desired sample rate: %@", (uint8_t *)&v36, 0x16u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "format"));
  objc_msgSend(v22, "sampleRate");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v24 = objc_msgSend(v7, "isEqualToNumber:", v23);

  if ((v24 & 1) == 0)
  {
    v28 = DiagnosticLogHandleForCategory(3);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "format"));
      objc_msgSend(v31, "sampleRate");
      v36 = 138412802;
      v37 = v30;
      v38 = 2048;
      v39 = v32;
      v40 = 2112;
      v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "The WAV file %@ has sample rate %f, which does not match the required sample rate %@.", (uint8_t *)&v36, 0x20u);

    }
    v19 = -70;
    goto LABEL_14;
  }
  v25 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *(_QWORD *)objc_msgSend(v13, "floatChannelData"), (int)(4 * objc_msgSend(v13, "frameLength")));
  v26 = v25;
  if (v25 && objc_msgSend(v25, "length"))
  {
    v27 = v26;
  }
  else
  {
    v34 = DiagnosticLogHandleForCategory(3);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "WAV Audio was loaded into PCM buffer but data is empty.", (uint8_t *)&v36, 2u);
    }

    v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -66, 0));
  }

LABEL_15:
  return v27;
}

+ (BOOL)convertNSDataToWAV:(id)a3 atURL:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v22;
  id v23;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)AVAudioFormat), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, 1, 0, 48000.0);
  v11 = objc_msgSend(v9, "length") >> 2;
  v12 = objc_msgSend(objc_alloc((Class)AVAudioPCMBuffer), "initWithPCMFormat:frameCapacity:", v10, v11);
  objc_msgSend(v12, "setFrameLength:", v11);
  v13 = (void *)*((_QWORD *)objc_msgSend(v12, "mutableAudioBufferList") + 2);
  v14 = objc_retainAutorelease(v9);
  v15 = objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");

  memcpy(v13, v15, (size_t)v16);
  v17 = objc_alloc((Class)AVAudioFile);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "settings"));
  v23 = v7;
  v19 = objc_msgSend(v17, "initForWriting:settings:error:", v8, v18, &v23);

  v20 = v23;
  if (!v20)
  {
    v22 = 0;
    objc_msgSend(v19, "writeFromBuffer:error:", v12, &v22);
    v20 = v22;
  }

  return 0;
}

@end
