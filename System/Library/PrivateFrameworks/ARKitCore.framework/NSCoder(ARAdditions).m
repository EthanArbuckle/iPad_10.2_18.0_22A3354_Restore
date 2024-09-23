@implementation NSCoder(ARAdditions)

- (id)_ar_decodeDataNoCopyForKey:()ARAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;

  v4 = a3;
  v8 = 0;
  v5 = (void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", v4, &v8);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    v5 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:freeWhenDone:", v5, v8, 0);
  }

  return v5;
}

- (id)_ar_decodeDataNoCopyWithFallbackForKey:()ARAdditions
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "decodingFailurePolicy"))
  {
    objc_msgSend(a1, "_ar_decodeDataNoCopyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        _ARLogGeneral_17();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "error");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138544130;
          v13 = v9;
          v14 = 2048;
          v15 = a1;
          v16 = 2114;
          v17 = v4;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Failed to decode bytes for key %{public}@ and decoder is not configured to raise exceptions, error = %@", (uint8_t *)&v12, 0x2Au);

        }
      }
    }
  }
  else
  {
    objc_msgSend(a1, "_ar_decodeDataNoCopyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ar_encodeVector2:()ARAdditions forKey:
{
  double v5;

  v5 = a2;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 8, a4);
}

- (double)ar_decodeVector2ForKey:()ARAdditions
{
  void *v1;
  double v2;

  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = ARVector2FromNSData(v1);

  return v2;
}

- (uint64_t)ar_encodeVector3:()ARAdditions forKey:
{
  __n128 v5;

  v5 = a2;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 16, a4);
}

- (__n128)ar_decodeVector3ForKey:()ARAdditions
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v2 = ARVector3FromNSData(v1);
  v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeMatrix3x3:()ARAdditions forKey:
{
  _OWORD v7[3];

  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v7, 48, a6);
}

- (__n128)ar_decodeMatrix3x3ForKey:()ARAdditions
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v2 = ARMatrix3x3FromNSData(v1);
  v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeMatrix4x4:()ARAdditions forKey:
{
  _OWORD v8[4];

  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v8, 64, a7);
}

- (__n128)ar_decodeMatrix4x4ForKey:()ARAdditions
{
  id v4;
  void *v5;
  __int128 v6;
  __int128 v8;

  v4 = a3;
  if (objc_msgSend(a1, "containsValueForKey:", v4))
  {
    objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v6 = ARMatrix4x4FromNSData(v5);
    v8 = v6;

  }
  else
  {
    v8 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v8;
}

- (uint64_t)ar_encodeMatrix4x3:()ARAdditions forKey:
{
  _OWORD v8[4];

  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v8, 64, a7);
}

- (__n128)ar_decodeMatrix4x3ForKey:()ARAdditions
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v2 = ARMatrix4x3FromNSData(v1);
  v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeCMRotationMatrix:()ARAdditions forKey:
{
  return objc_msgSend(a1, "encodeBytes:length:forKey:", a3, 72, a4);
}

- (void)ar_decodeCMRotationMatrixForKey:()ARAdditions
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  id v6;

  *(_QWORD *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") == 72)
  {
    v3 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v4 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(a2 + 48) = v4;
    *(_QWORD *)(a2 + 64) = *(_QWORD *)(v3 + 64);
    v5 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v3;
    *(_OWORD *)(a2 + 16) = v5;
  }

}

@end
