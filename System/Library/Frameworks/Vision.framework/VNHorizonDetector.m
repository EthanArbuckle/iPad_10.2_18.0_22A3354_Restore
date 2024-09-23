@implementation VNHorizonDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __CVBuffer *v23;
  BOOL v24;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "width");
    v20 = objc_msgSend(v18, "height");
    v26.origin.x = x * (double)v19;
    v26.size.width = width * (double)v19;
    v26.origin.y = y * (double)v20;
    v26.size.height = height * (double)v20;
    v27 = CGRectIntegral(v26);
    if (v19 > v20)
      v21 = 256;
    else
      v21 = (unint64_t)(float)((float)((float)((float)v20 / (float)v19) * 256.0) + 0.5);
    if (v19 > v20)
      v22 = (unint64_t)(float)((float)((float)((float)v19 / (float)v20) * 256.0) + 0.5);
    else
      v22 = 256;
    v23 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", v22, v21, 1111970369, v16, a8, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    *a7 = v23;
    v24 = v23 != 0;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  float v34;
  float v35;
  float v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  float v53;
  float v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  float v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  float v75;
  int v76;
  void *BaseAddress;
  int BytesPerRow;
  int Width;
  int Height;
  float v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  float v89;
  int v90;
  float v91;
  CGFloat v92;
  VNHorizonObservation *v93;
  uint64_t v94;
  uint64_t v95;
  CGAffineTransform v96;
  CGAffineTransform v97;
  CGAffineTransform v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  float v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "imageProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("horizonDetector: props exist\n"), v16, v17, v18, v19, v20, v21, v94);
        v23 = (void *)*MEMORY[0x1E0CBCFF0];
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          v31 = objc_msgSend(v24, "intValue");
        else
          v31 = 0;
        VNValidatedLog(1, (uint64_t)CFSTR("horizonDetector: Orientation = %d\n"), v25, v26, v27, v28, v29, v30, v31);
        v37 = (void *)*MEMORY[0x1E0CBCF70];
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("8"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          VNValidatedLog(1, (uint64_t)CFSTR("  Found makerNotes\n"), v46, v47, v48, v49, v50, v51, v95);
          if (v45)
          {
            objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "floatValue");
            v54 = v53;

            objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "floatValue");
            v57 = v56;

            objc_msgSend(v45, "objectAtIndexedSubscript:", 2);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "floatValue");
            v60 = v59;

            VNValidatedLog(1, (uint64_t)CFSTR("    Found vector: %.3f,%.3f,%.3f\n"), v61, v62, v63, v64, v65, v66, COERCE__INT64(v54));
          }
          else
          {
            v54 = 0.0;
            v57 = 0.0;
            v60 = 0.0;
          }

        }
        else
        {
          v54 = 0.0;
          v57 = 0.0;
          v60 = 0.0;
        }
        VNValidatedLog(1, (uint64_t)CFSTR("acc = (%.5f, %.5f, %.5f)\n"), v39, v40, v41, v42, v43, v44, COERCE__INT64(v54));
        v67 = (float)(v57 * v57) + (float)(v54 * v54);
        v36 = atan2f(v60, sqrtf(v67));
        v34 = sqrtf(v67 + (float)(v60 * v60)) + -1.0;
        v74 = atan2f(v57, v54);
        v75 = 0.0;
        switch((int)v31)
        {
          case 1:
            v75 = flt_1A15E1A00[v74 < 0.0];
            goto LABEL_21;
          case 3:
            goto LABEL_21;
          case 6:
            v75 = 1.5708;
            goto LABEL_21;
          case 8:
            v75 = -1.5708;
LABEL_21:
            v35 = (float)((float)(v74 + v75) * -180.0) / 3.14159265;
            v33 = 1;
            VNValidatedLog(1, (uint64_t)CFSTR("accelTilt = %.3f deg, accelPitch = %.3f deg, accMagnitudeDev %.3f\n"), v68, v69, v70, v71, v72, v73, COERCE__INT64(v35));
            break;
          default:
            VNValidatedLog(1, (uint64_t)CFSTR("accelPitch = %.3f deg, accelMagnitudeDev = %.3f\n"), v68, v69, v70, v71, v72, v73, COERCE__INT64((float)(v36 * 180.0) / 3.14159265));
            v33 = 0;
            v35 = (float)((float)(v74 + 0.0) * -180.0) / 3.14159265;
            break;
        }

      }
      else
      {
        v33 = 0;
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
      }
      VNValidatedLog(1, (uint64_t)CFSTR("MaxPitch = %.3f, MaxPixelTilt = %.3f, MinPixelTilt = %.3f, MaxAccelMagDev = %.3f, MaxAccelFFTDifff = %.3f\n"), v16, v17, v18, v19, v20, v21, 0x4039000000000000);
      if (fabsf(v34) <= 0.03)
        v76 = v33;
      else
        v76 = 0;
      if (fabsf(v36) > 0.43633)
        goto LABEL_27;
      v101 = 0.0;
      BaseAddress = CVPixelBufferGetBaseAddress(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      horizonDetectionFFT((uint64_t)BaseAddress, BytesPerRow, Width, Height, &v101, 1);
      v82 = v101;
      VNValidatedLog(1, (uint64_t)CFSTR("FFT detected angle = %.3f deg\n"), v83, v84, v85, v86, v87, v88, COERCE__INT64((float)(v101 * 180.0) / 3.14159265));
      v89 = fabsf(v82);
      if (v89 < 0.017453 || v89 > 0.17453 || v76 && vabds_f32((float)(v82 * 180.0) / 3.1416, v35) > 5.0)
      {
LABEL_27:
        v32 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v90 = objc_msgSend(v15, "width");
        memset(&v100, 0, sizeof(v100));
        v91 = (float)(int)objc_msgSend(v15, "height");
        CGAffineTransformMakeTranslation(&v100, (float)((float)v90 * 0.5), (float)(v91 * 0.5));
        v98 = v100;
        v92 = v82;
        CGAffineTransformRotate(&v99, &v98, v92);
        v100 = v99;
        v97 = v99;
        CGAffineTransformTranslate(&v99, &v97, (float)((float)v90 * -0.5), (float)(v91 * -0.5));
        v100 = v99;
        v93 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNHorizonObservation alloc], "initWithOriginatingRequestSpecifier:", v13);
        v96 = v100;
        -[VNHorizonObservation setTransform:](v93, "setTransform:", &v96);
        -[VNHorizonObservation setAngle:](v93, "setAngle:", v92);
        v102[0] = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
