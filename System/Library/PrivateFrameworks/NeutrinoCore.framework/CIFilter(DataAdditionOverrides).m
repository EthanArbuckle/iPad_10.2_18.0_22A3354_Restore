@implementation CIFilter(DataAdditionOverrides)

+ (CGColorSpace)reductionFilterExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  uint64_t v34;
  CGColorSpace *v35;
  CGColorRef v36;
  CGColorRef v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  const __CFString *v54;
  CGColorRef v55;
  _BYTE buf[32];
  float32x4_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (v15)
      objc_msgSend(v17, "setValuesForKeysWithDictionary:", v15);
    objc_msgSend(v18, "setValue:forKey:", v13, *MEMORY[0x1E0C9E1F8]);
    v19 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v13, "extent");
    objc_msgSend(v19, "vectorWithCGRect:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v20, CFSTR("inputExtent"));

    objc_msgSend(v18, "valueForKey:", CFSTR("outputImage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      if (a8)
      {
        +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("unable to obtain outputImage"), v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
        a7 = 0;
        *a8 = v29;
        goto LABEL_35;
      }
LABEL_34:
      a7 = 0;
      goto LABEL_35;
    }
    if (!v16)
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", &unk_1E50A3548);
    v57 = 0uLL;
    if (CGColorSpaceGetType() == 1)
    {
      a7 = (CGColorSpace *)objc_msgSend(v13, "colorSpace");
      if (!a7)
      {
        a7 = (CGColorSpace *)objc_msgSend(v16, "workingColorSpace");
        if (!a7)
        {
          NUAssertLogger_16293();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("colorspace is nil, image: %@, context: %@"), v13, v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v23;
            _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

          }
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          NUAssertLogger_16293();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v26)
            {
              v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v45 = (void *)MEMORY[0x1E0CB3978];
              v46 = v44;
              objc_msgSend(v45, "callStackSymbols");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v44;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v48;
              _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            }
          }
          else if (v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v28;
            _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
          _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditionOverrides) reductionFilterExtractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 168, CFSTR("colorspace is nil, image: %@, context: %@"), v49, v50, v51, v52, (uint64_t)v13);
        }
      }
    }
    else if (!a7)
    {
      v38 = objc_alloc(MEMORY[0x1E0C9DDE8]);
      v39 = (void *)objc_msgSend(v38, "initWithBitmapData:width:height:bytesPerRow:format:", &v57, 1, 1, 16, *MEMORY[0x1E0C9E078]);
      objc_msgSend(v39, "setClamped:", 0);
      objc_msgSend(v39, "setColorSpace:", 0);
      objc_msgSend(v39, "setAlphaMode:", 0);
      objc_msgSend(v16, "startTaskToRender:fromRect:toDestination:atPoint:error:", v21, v39, a8, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {

        goto LABEL_34;
      }
      v41 = v40;
      v30 = v13;
      objc_msgSend(v40, "nu_waitUntilCompletedAndReturnError:", a8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      a7 = 0;
      if (!v42)
      {
        v13 = v30;
        goto LABEL_35;
      }
      v53 = a8;
      v31 = v16;
      v32 = 1;
      goto LABEL_21;
    }
    v53 = a8;
    v30 = v13;
    v31 = v16;
    objc_msgSend(v16, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v21, &v57, 16, *MEMORY[0x1E0C9E078], a7, 0.0, 0.0, 1.0, 1.0);
    v32 = 0;
LABEL_21:
    *(float64x2_t *)buf = vcvtq_f64_f32(*(float32x2_t *)v57.f32);
    *(float64x2_t *)&buf[16] = vcvt_hight_f64_f32(v57);
    +[NUColorSpace extendedSRGBLinearColorSpace](NUColorSpace, "extendedSRGBLinearColorSpace");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "CGColorSpace");

    v35 = a7;
    v13 = v30;
    if (v32)
    {
      v35 = (CGColorSpace *)objc_msgSend(v30, "colorSpace");
      if (!v35)
        v35 = (CGColorSpace *)v34;
    }
    v36 = CGColorCreate(v35, (const CGFloat *)buf);
    if (v36)
    {
      v37 = v36;
      v54 = CFSTR("color");
      v55 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      a7 = (CGColorSpace *)objc_claimAutoreleasedReturnValue();

      v16 = v31;
LABEL_35:

      goto LABEL_36;
    }
    v16 = v31;
    a8 = v53;
    if (v53)
    {
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("couldn't create color"), a7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_34;
  }
  if (a8)
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("unknown extractor name"), v14);
    a7 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    a7 = 0;
  }
LABEL_36:

  return a7;
}

+ (id)perspectiveExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];
  _QWORD v44[11];

  v44[9] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v40 = v7;
  v41 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "autoPerspectiveResultWithOptions:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("filter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("confidence"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (NUIsAppleInternal_onceToken != -1)
      dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_14);
    if (NUIsAppleInternal_isAppleInternal)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("debugImage"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pitchCorrectionAreaCoverage"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("yawCorrectionAreaCoverage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pitchFailureReason"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("yawFailureReason"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_12:
      objc_msgSend(v9, "valueForKey:", CFSTR("inputPitch"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v17 = v20 * 57.2957795;

      objc_msgSend(v9, "valueForKey:", CFSTR("inputYaw"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v16 = v22 * 57.2957795;

      objc_msgSend(v9, "valueForKey:", CFSTR("inputRoll"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v15 = v24 * 57.2957795;

      goto LABEL_13;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v14 = 0;
      v13 = 0;
      v42 = 0;
      v18 = 0;
      v11 = 0;
      v10 = 0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      goto LABEL_14;
    }
    objc_msgSend(v6, "autoPerspectiveFilterWithOptions:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v42 = 0;
    v13 = 0;
    v14 = 0;
    if (v9)
      goto LABEL_12;
  }
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
LABEL_13:
  v18 = (void *)v12;
LABEL_14:
  v43[0] = CFSTR("pitchExpandTopDegrees");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  v43[1] = CFSTR("yawExpandLeftDegrees");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v37;
  v43[2] = CFSTR("rollAngleInDegreesCW");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v36;
  v43[3] = CFSTR("confidence");
  v25 = (void *)v10;
  v39 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44[3] = v25;
  v43[4] = CFSTR("debugImage");
  v26 = (void *)v11;
  v27 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44[4] = v26;
  v43[5] = CFSTR("pitchCorrectionAreaCoverage");
  v28 = (void *)v13;
  v29 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44[5] = v28;
  v43[6] = CFSTR("yawCorrectionAreaCoverage");
  v30 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v18;
  if (v18)
    v32 = v18;
  else
    v32 = &unk_1E50A28F8;
  v44[6] = v30;
  v44[7] = v32;
  v43[7] = CFSTR("ciPitchError");
  v43[8] = CFSTR("ciYawError");
  v33 = v42;
  if (!v42)
    v33 = &unk_1E50A28F8;
  v44[8] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v29)
      goto LABEL_29;
LABEL_34:

    if (v27)
      goto LABEL_30;
    goto LABEL_35;
  }

  if (!v29)
    goto LABEL_34;
LABEL_29:
  if (v27)
    goto LABEL_30;
LABEL_35:

LABEL_30:
  if (!v39)

  return v34;
}

+ (id)straightenExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  uint64_t v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  float64x2_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  float64x2_t v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id obj;
  uint64_t v77;
  id v78[2];
  void *v79;
  float64x2_t v80;
  float64x2_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  float64x2_t v91;
  float64x2_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  const __CFString *v100;
  void *v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v11)
    v17 = (id)objc_msgSend(v11, "mutableCopy");
  else
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = v17;
  v19 = *MEMORY[0x1E0C9E0D0];
  objc_msgSend(v17, "valueForKey:", *MEMORY[0x1E0C9E0D0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v19);
  v21 = *MEMORY[0x1E0C9E0B8];
  objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0C9E0B8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v21);
  v23 = *MEMORY[0x1E0C9E0C0];
  objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0C9E0C0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v23);
  v25 = *MEMORY[0x1E0C9E0F0];
  objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0C9E0F0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v25);
  v27 = *MEMORY[0x1E0C9E0C8];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E0C8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = v10;
  v75 = v9;
  v72 = v12;
  v73 = v11;
  v71 = v18;
  if (v28)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "extent");
      v77 = v32;
      v70 = v33;
      v34 = (void *)objc_opt_new();
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      objc_msgSend(v18, "objectForKeyedSubscript:", v27);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      if (v35)
      {
        v36 = v35;
        *(_QWORD *)&v37 = v77;
        *((_QWORD *)&v37 + 1) = v70;
        *(_OWORD *)v78 = v37;
        v38 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v88 != v38)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("bounds"), v70);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
            v91 = *(float64x2_t *)MEMORY[0x1E0C9D648];
            v92 = v41;
            objc_msgSend(v40, "getValue:", &v91);
            v80 = vmulq_f64(*(float64x2_t *)v78, v91);
            v81 = vmulq_f64(*(float64x2_t *)v78, v92);
            v100 = CFSTR("bounds");
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v80, "{CGRect={CGPoint=dd}{CGSize=dd}}");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v42;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "addObject:", v43);
          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
        }
        while (v36);
      }

      objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, v27);
      v10 = v74;
      v12 = v72;
      v11 = v73;
    }
  }
  objc_msgSend(v9, "autoAdjustmentFiltersWithOptions:", v18, v70);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v79 = v44;
  v45 = (void *)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
  if (!v45)
  {
    v47 = 0;
    v60 = 0.0;
    goto LABEL_45;
  }
  v46 = 0;
  v47 = 0;
  v48 = *(_QWORD *)v84;
  v49 = *MEMORY[0x1E0C9DE38];
  do
  {
    for (j = 0; j != v45; j = (char *)j + 1)
    {
      if (*(_QWORD *)v84 != v48)
        objc_enumerationMutation(v79);
      v51 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
      objc_msgSend(v51, "attributes");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKey:", v49);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v53, "isEqualToString:", CFSTR("CIAffineTransform")) & 1) != 0)
      {
        v54 = v46;
        v46 = v51;
        v55 = v47;
LABEL_31:
        v56 = v51;

        v47 = v55;
        goto LABEL_32;
      }
      if (v53)
      {
        v54 = v47;
        v55 = v51;
        if (objc_msgSend(v53, "isEqualToString:", CFSTR("CICrop")))
          goto LABEL_31;
      }
LABEL_32:

    }
    v45 = (void *)objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
  }
  while (v45);
  v45 = v46;
  if (v46)
  {
    objc_msgSend(v46, "valueForKey:", CFSTR("inputTransform"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
    v80 = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
    v81 = v58;
    v82 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v57, "getValue:", &v80);
    v91 = v80;
    v92 = v81;
    v96 = 0;
    v95 = 0u;
    v93 = v82;
    v94 = 0u;
    NUDecomposeAffineTransform((__n128 *)&v91, (uint64_t)&v94);
    v59 = *(double *)&v95 * 180.0 / 3.14159265;
    if (v59 < 0.0)
      v59 = v59 + 360.0;
    if (v59 <= 180.0)
      v60 = v59;
    else
      v60 = v59 + -360.0;

  }
  else
  {
    v60 = 0.0;
  }
  v10 = v74;
  v9 = v75;
  v12 = v72;
  v11 = v73;
  v18 = v71;
  if (v47)
  {
    objc_msgSend(v47, "valueForKey:", CFSTR("inputRectangle"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "CGRectValue");
    v13 = v62;
    v14 = v63;
    v15 = v64;
    v16 = v65;

  }
LABEL_45:
  v97[0] = CFSTR("straightenAngleInDegreesCCW");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = CFSTR("autoCrop");
  v98[0] = v66;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v13, v14, v15, v16);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v67;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  return v68;
}

+ (uint64_t)smartToneExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "smartToneStatistics");
}

+ (uint64_t)localLightExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "localLightStatisticsNoProxy");
}

+ (uint64_t)smartColorExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "smartColorStatistics");
}

+ (uint64_t)smartToneHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "smartToneHDRStatistics");
}

+ (uint64_t)localLightHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "localLightHDRStatisticsNoProxy");
}

+ (uint64_t)smartColorHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return objc_msgSend(a3, "smartColorHDRStatistics");
}

+ (id)autoRedEyeExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];
  void *v61;
  _QWORD v62[2];
  _QWORD v63[4];

  v63[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C9E0D0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9E0B8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9E0C0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9E0F0]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationX"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationY"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("touchDiameter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v6, "extent");
        v16 = v15;
        v18 = v17;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationX"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v16 * v20;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationY"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v18 * v23;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("touchDiameter"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", v21, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = CFSTR("leftEye");
        v62[1] = CFSTR("leftEyeTouchSize");
        v63[0] = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0C9E0C8]);

        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E50A2910, *MEMORY[0x1E0C9DD20]);
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("orientation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0C9DD20]);

LABEL_7:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fullSizeImage"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("fullSizeImage"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("properties"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("properties"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageBySettingProperties:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v36;
  }
  objc_msgSend(v6, "autoAdjustmentFiltersWithOptions:", v8);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v38)
  {
    v39 = v38;
    v51 = v33;
    v52 = v7;
    v53 = v6;
    v40 = *(_QWORD *)v55;
    v41 = *MEMORY[0x1E0C9DE38];
LABEL_13:
    v42 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v40)
        objc_enumerationMutation(v37);
      v43 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v42);
      objc_msgSend(v43, "attributes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKey:", v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v45, "isEqualToString:", CFSTR("CIRedEyeCorrections")) & 1) != 0)
        break;

      if (v39 == ++v42)
      {
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v39)
          goto LABEL_13;
        v46 = 0;
        v47 = v37;
        v7 = v52;
        v6 = v53;
        v33 = v51;
        v48 = (void *)MEMORY[0x1E0C9AA70];
        goto LABEL_25;
      }
    }
    objc_msgSend(v43, "valueForKey:", CFSTR("inputCorrectionInfo"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "valueForKey:", CFSTR("inputCameraModel"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      v48 = (void *)MEMORY[0x1E0C9AA70];
      v7 = v52;
      v6 = v53;
      v33 = v51;
      goto LABEL_27;
    }
    v58[0] = CFSTR("inputCorrectionInfo");
    v58[1] = CFSTR("inputCameraModel");
    v49 = CFSTR("undefined");
    if (v46)
      v49 = v46;
    v59[0] = v47;
    v59[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v52;
    v6 = v53;
    v33 = v51;
  }
  else
  {
    v46 = 0;
    v48 = (void *)MEMORY[0x1E0C9AA70];
    v47 = v37;
  }
LABEL_25:

LABEL_27:
  return v48;
}

+ (id)faceBalanceExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  float v47;
  double v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
    v13 = (id)objc_msgSend(v11, "mutableCopy");
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;
  v15 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C9E0D0]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9E0B8]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9E0C0]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9E0F0]);
  objc_msgSend(v9, "autoAdjustmentFiltersWithOptions:", v14);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (!v17)
  {
    v21 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_31;
  }
  v18 = v17;
  v55 = v14;
  v56 = v12;
  v57 = v11;
  v58 = v10;
  v59 = v9;
  v19 = *(_QWORD *)v61;
  v20 = *MEMORY[0x1E0C9DE38];
  v21 = (id)MEMORY[0x1E0C9AA70];
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v61 != v19)
        objc_enumerationMutation(v16);
      v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      objc_msgSend(v23, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "isEqualToString:", CFSTR("CIFaceBalance")))
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v23, "valueForKey:", CFSTR("inputOrigI"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("OrigI"));
        objc_msgSend(v23, "valueForKey:", CFSTR("inputOrigQ"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v59;
        v11 = v57;
        if (v27)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("OrigQ"));
        objc_msgSend(v23, "valueForKey:", CFSTR("inputStrength"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("Strength"));
        objc_msgSend(v23, "valueForKey:", CFSTR("inputWarmth"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E50A3768, CFSTR("Warmth"));
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OrigI"));
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_29;
        v31 = (void *)v30;
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OrigQ"));
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Strength"));
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Warmth"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Warmth"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "floatValue");
              v39 = v38;

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OrigI"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "floatValue");
              v42 = (1.0 - v39) * 0.07451 + v39 * 0.1333 - v41;
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Strength"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "floatValue");
              v45 = v42 * v44;

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OrigQ"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "floatValue");
              v48 = (1.0 - v39) * 0.02745 + v39 * 0.007843 - v47;
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Strength"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "floatValue");
              v51 = v48 * v50;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v45 + v51 * -0.2) * 4.0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v52, CFSTR("WarmTemp"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v45 + v51 * 5.0) * 4.0);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v53, CFSTR("WarmTint"));

              objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WarmFace"));
            }
            goto LABEL_29;
          }

        }
LABEL_29:

        v10 = v58;
        goto LABEL_30;
      }

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v18)
      continue;
    break;
  }
  v10 = v58;
  v9 = v59;
  v11 = v57;
LABEL_30:
  v14 = v55;
  v12 = v56;
LABEL_31:

  return v21;
}

@end
