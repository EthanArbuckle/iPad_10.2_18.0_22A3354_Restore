@implementation ARDisplayCenterTransformForCaptureDevicePosition

void __ARDisplayCenterTransformForCaptureDevicePosition_block_invoke()
{
  void *v0;
  void *v1;
  float v2;
  void *v3;
  float v4;
  void *v5;
  float v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  float v11;
  float v12;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  float v38;
  void *v39;
  float v40;
  NSObject *v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  NSObject *v47;
  void *v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MGCopyAnswer();
  if ((unint64_t)objc_msgSend(v0, "count") < 3)
  {
    _ARLogGeneral_4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      ARDeviceString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = *(double *)&v8;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "No front camera offset value found for device: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "floatValue");
    v54 = v2 / 1000.0;
    objc_msgSend(v0, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    v53 = v4 / -1000.0;
    objc_msgSend(v0, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v52 = v6 / -1000.0;

    _ARLogGeneral_4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v56 = v54;
      v57 = 2048;
      v58 = v53;
      v59 = 2048;
      v60 = v52;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "Using front camera offset values (%f, %f, %f).", buf, 0x20u);
    }
  }

  v9 = (void *)MGCopyAnswer();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    _ARLogGeneral_4();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      ARDeviceString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = *(double *)&v27;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "No front camera rotation value found in MobileGetStalt for device: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject floatValue](v10, "floatValue");
    v12 = v11 * 3.14159265 / 180.0;
    _Q0 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, __sincosf_stret(v12 * -0.5).__sinval);
    _S2 = _Q0.i32[1];
    _S4 = _Q0.i32[2];
    __asm
    {
      FMLS            S3, S4, V0.S[2]
      FMLA            S5, S2, V0.S[1]
      FMLS            S5, S0, V0.S[0]
      FMLA            S16, S4, V0.S[1]
      FMLA            S1, S4, V0.S[2]
      FMLS            S1, S0, V0.S[0]
      FMLS            S1, S2, V0.S[1]
    }
  }

  ARMatrix4x4FromRotationAndTranslation();
  ARDisplayCenterTransformForCaptureDevicePosition_frontCameraFromDisplayCenter_0 = v28;
  ARDisplayCenterTransformForCaptureDevicePosition_frontCameraFromDisplayCenter_1 = v29;
  ARDisplayCenterTransformForCaptureDevicePosition_frontCameraFromDisplayCenter_2 = v30;
  ARDisplayCenterTransformForCaptureDevicePosition_frontCameraFromDisplayCenter_3 = v31;
  v32 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  ARDisplayCenterTransformForCaptureDevicePosition_rearCameraFromDisplayCenter = *MEMORY[0x1E0C83FF0];
  xmmword_1EF081B00 = v32;
  v33 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  xmmword_1EF081B10 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  xmmword_1EF081B20 = v33;
  v34 = (void *)MGCopyAnswer();
  if ((unint64_t)objc_msgSend(v34, "count") < 3)
  {
    _ARLogGeneral_4();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      ARDeviceString();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = *(double *)&v48;
      _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_ERROR, "No rear camera offset value found for device: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "floatValue");
    v51 = v36 / 1000.0;
    objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    v49 = v38 / -1000.0;
    objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    v50 = v40 / 1000.0;

    _ARLogGeneral_4();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v56 = v51;
      v57 = 2048;
      v58 = v49;
      v59 = 2048;
      v60 = v50;
      _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEBUG, "Using rear camera offset values (%f, %f, %f).", buf, 0x20u);
    }

    _ARLogGeneral_4();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v56 = v51;
      v57 = 2048;
      v58 = v49;
      v59 = 2048;
      v60 = v50;
      _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_DEBUG, "Using rear camera offset values (%f, %f, %f).", buf, 0x20u);
    }

    ARMatrix4x4FromRotationAndTranslation();
    ARDisplayCenterTransformForCaptureDevicePosition_rearCameraFromDisplayCenter = v43;
    xmmword_1EF081B00 = v44;
    xmmword_1EF081B10 = v45;
    xmmword_1EF081B20 = v46;
  }

}

@end
