@implementation ASVImageIOTextureConverter

- (int64_t)converterType
{
  return 1;
}

- (BOOL)canConvertTextureWithDescription:(id)a3
{
  return 1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDeltaForTextureWithDescription:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  uint64_t v62;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "originalPixelFormat");
  v7 = v6;
  if (v5 == 1)
  {
    if ((unint64_t)objc_msgSend(v4, "fileType") >= 7)
      v5 = 1;
    else
      v5 = 2;
  }
  objc_msgSend(v4, "originalSize");
  v40 = v8;
  objc_msgSend(v4, "destinationSize");
  v42 = v9;
  v10 = objc_msgSend(v4, "destinationPixelFormat");
  v12 = v11;
  v13 = +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v5, v7);
  v14 = +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v10, v12);
  v15 = objc_msgSend(v4, "generateMipmaps");
  v16 = (int)v42 * (uint64_t)SHIDWORD(v42);
  v17 = v14 * v16;
  v18 = 1.33333333;
  if (!v15)
    v18 = 1.0;
  v19 = -[ASVTextureConverter alignUp:toAlignment:](self, "alignUp:toAlignment:", (unint64_t)(v18 * (double)(v14 * v16)), getpagesize());
  v20 = (int)v40 * (uint64_t)SHIDWORD(v40);
  v21 = v13 * v20;
  if (objc_msgSend(v4, "originalPixelFormat") == 6)
  {
    if (objc_msgSend(v4, "destinationPixelFormat") == 4)
    {
LABEL_9:
      v22 = v17 + v21;
      goto LABEL_26;
    }
    if (objc_msgSend(v4, "destinationPixelFormat") == 2)
      v22 = v14 * (v16 + v20);
    else
      v22 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "fileType") == 1)
    {
      v23 = -[ASVImageIOTextureConverter maxNativeDownsamplingFactorForDownsamplingFactor:fileType:](self, "maxNativeDownsamplingFactorForDownsamplingFactor:fileType:", objc_msgSend(v4, "downsamplingFactor"), 1);
      v22 = v21 / (v23 * v23) + v17;
      goto LABEL_26;
    }
    if (objc_msgSend(v4, "fileType") == 4)
    {
      v24 = -[ASVImageIOTextureConverter maxNativeDownsamplingFactorForDownsamplingFactor:fileType:](self, "maxNativeDownsamplingFactorForDownsamplingFactor:fileType:", objc_msgSend(v4, "downsamplingFactor"), 4);
      v25 = v21 / (v24 * v24);
      v26 = 2 * v25;
      v27 = v25 + v17;
      if (v26 <= v27)
        v22 = v27;
      else
        v22 = v26;
      goto LABEL_26;
    }
    if (objc_msgSend(v4, "fileType") != 2)
    {
      if (objc_msgSend(v4, "fileType") == 5)
      {
        if (v17 + v21 <= v21 + v20)
          v22 = v21 + v20;
        else
          v22 = v17 + v21;
        goto LABEL_26;
      }
      if (objc_msgSend(v4, "fileType") != 3)
        goto LABEL_9;
    }
    if (!objc_msgSend(v4, "requiresDownsampling"))
      goto LABEL_9;
    v22 = v17 + SHIDWORD(v42) * (uint64_t)(int)v40 * v13;
  }
LABEL_26:
  if (objc_msgSend(v4, "fileType") == 1)
  {
    v22 += 35968;
  }
  else if (objc_msgSend(v4, "fileType") == 4)
  {
    v22 += 1572864;
  }
  AssetViewerLogHandleForCategory(1);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v4, "fileType");
    v30 = objc_msgSend(v4, "downsamplingFactor");
    objc_msgSend(v4, "originalSize");
    v43 = v31;
    objc_msgSend(v4, "originalSize");
    v41 = v32;
    objc_msgSend(v4, "destinationSize");
    v39 = v33;
    objc_msgSend(v4, "destinationSize");
    v38 = v34;
    objc_msgSend(v4, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220034;
    v45 = v29;
    v46 = 2048;
    v47 = v30;
    v48 = 2048;
    v49 = v22 >> 10;
    v50 = 2048;
    v51 = v19 >> 10;
    v52 = 1024;
    v53 = v43;
    v54 = 1024;
    v55 = v41;
    v56 = 1024;
    v57 = v39;
    v58 = 1024;
    v59 = v38;
    v60 = 2112;
    v61 = v35;
    _os_log_impl(&dword_1D93A7000, v28, OS_LOG_TYPE_DEFAULT, "fileType: %lu. factor: %lu,\tpeak: %lluKB,\tfootprint: %lluKB, (%d x %d) -> (%d x %d) - '%@'", buf, 0x4Cu);

  }
  v36 = v19;
  v37 = v22;
  result.var1 = v37;
  result.var0 = v36;
  return result;
}

- (int64_t)maxNativeDownsamplingFactorForDownsamplingFactor:(int64_t)a3 fileType:(int64_t)a4
{
  int64_t v4;

  if ((unint64_t)(a4 - 1) > 3)
    v4 = 1;
  else
    v4 = qword_1D94E1DE8[a4 - 1];
  if (v4 >= a3)
    return a3;
  else
    return v4;
}

@end
