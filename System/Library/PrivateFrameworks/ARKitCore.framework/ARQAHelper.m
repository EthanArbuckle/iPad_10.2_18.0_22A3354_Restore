@implementation ARQAHelper

+ (id)arrayWithVector2:(id)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  float v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7 = *((float *)&v2 + 1);
  ARFloat(*(float *)&v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  ARFloat(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)arrayWithVector3:(id)a1
{
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8 = v2;
  ARFloat(*(float *)&v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  ARFloat(*((float *)&v8 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  ARFloat(*((float *)&v8 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)arrayWithVector4:(id)a1
{
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9 = v2;
  ARFloat(*(float *)&v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  ARFloat(*((float *)&v9 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  ARFloat(*((float *)&v9 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  ARFloat(*((float *)&v9 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayWithMatrix4x4:(__n128)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __n128 v21;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  ARFloat(a1.n128_f32[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v20;
  ARFloat(v21.n128_f32[1]);
  v26 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v26;
  ARFloat(v21.n128_f32[2]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  ARFloat(v21.n128_f32[3]);
  v21.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  v28 = v21.n128_u64[0];
  ARFloat(a2.n128_f32[0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v17;
  ARFloat(a2.n128_f32[1]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v16;
  ARFloat(a2.n128_f32[2]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v15;
  ARFloat(a2.n128_f32[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  ARFloat(a3.n128_f32[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  ARFloat(a3.n128_f32[1]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  ARFloat(a3.n128_f32[2]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  ARFloat(a3.n128_f32[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  ARFloat(a4.n128_f32[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v9;
  ARFloat(a4.n128_f32[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  ARFloat(a4.n128_f32[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  ARFloat(a4.n128_f32[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)arrayWithMatrix3x3:(__n128)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  ARFloat(a1.n128_f32[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  ARFloat(a1.n128_f32[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  ARFloat(a1.n128_f32[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  ARFloat(a2.n128_f32[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  ARFloat(a2.n128_f32[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  ARFloat(a2.n128_f32[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  ARFloat(a3.n128_f32[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  ARFloat(a3.n128_f32[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  ARFloat(a3.n128_f32[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)arrayOf2dPoints:(id)a1 count:(SEL)a2
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  void *i;
  void *v7;

  v4 = v3;
  v5 = v2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    +[ARQAHelper arrayWithVector2:](ARQAHelper, "arrayWithVector2:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v7);

    ++v5;
  }
  return i;
}

+ (id)arrayOf3dPoints:(id)a1 count:(SEL)a2
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  void *i;
  void *v7;

  v4 = v3;
  v5 = v2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v7);

    v5 += 2;
  }
  return i;
}

+ (id)arrayOfUUIDSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "UUIDString", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)generateTagsForConfiguration:(id)a3 replaySensor:(id)a4 technique:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  ARDeviceString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("device"));

  objc_msgSend((id)objc_opt_class(), "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("configuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isAutoFocusEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("isAutoFocusEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isLightEstimationEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("isLightEstimationEnabled"));

  NSStringFromARWorldAlignment(objc_msgSend(v7, "worldAlignment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("worldAlignment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "providesAudioData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("providesAudioData"));

  if (objc_msgSend(v7, "frameSemantics"))
  {
    NSStringFromARFrameSemantics(objc_msgSend(v7, "frameSemantics"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("frameSemantics"));

  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "videoFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageResolution");
  v21 = v20;
  objc_msgSend(v7, "videoFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageResolution");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%.0f,%.0f"), v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("videoResolution"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "videoFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithLong:", objc_msgSend(v26, "framesPerSecond"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("videoFramesPerSecond"));

  if (v8)
  {
    objc_msgSend(v8, "sequenceURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("replayURL"));

    objc_msgSend(v8, "deviceModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("replayDeviceModel"));

    objc_msgSend(v8, "osVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, CFSTR("replayOSVersion"));

    objc_msgSend(v8, "arkitVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, CFSTR("replayARKitVersion"));

    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "imageResolution");
    v35 = v34;
    objc_msgSend(v8, "imageResolution");
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%.0fx%.0f"), v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v37, CFSTR("replayVideoResolution"));

    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "nominalFrameRate");
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%.02ffps"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v40, CFSTR("replayNominalFramerate"));

    NSStringFromARReplayMode(objc_msgSend(v8, "replayMode"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v41, CFSTR("replaySensorMode"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = v7;
    NSStringFromARPlaneDetection(objc_msgSend(v42, "planeDetection"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, CFSTR("planeDetection"));

    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v42, "initialWorldMap");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberWithBool:", v45 != 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, CFSTR("isInitialWorldMapSet"));

    v47 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v42, "detectionImages");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v49, CFSTR("numberOfDetectionImages"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v42, "maximumNumberOfTrackedImages"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v50, CFSTR("maximumNumberOfTrackedImages"));

    v51 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v42, "detectionObjects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v53, CFSTR("numberOfDetectionObjects"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v42, "isMLModelEnabled"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v54, CFSTR("isMLModelEnabled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v42, "isLowQosSchedulingEnabled"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v55, CFSTR("isLowQosSchedulingEnabled"));
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v7;
    v57 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v56, "trackingImages");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v58, "count"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v59, CFSTR("numberOfTrackingImages"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "maximumNumberOfTrackedImages"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v55, CFSTR("maximumNumberOfTrackedImages"));
    goto LABEL_9;
  }
LABEL_10:
  v60 = (void *)objc_opt_new();
  +[ARQAHelper techniquesArray:array:](ARQAHelper, "techniquesArray:array:", v9, v60);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v60, CFSTR("techniques"));
  v61 = (void *)objc_opt_new();
  v62 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke;
  v68[3] = &unk_1E66743A0;
  v63 = v61;
  v69 = v63;
  +[ARQAHelper traverseTechniques:withBlock:](ARQAHelper, "traverseTechniques:withBlock:", v9, v68);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v63, CFSTR("networkVersion"));
  v66[0] = v62;
  v66[1] = 3221225472;
  v66[2] = __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke_2;
  v66[3] = &unk_1E66743A0;
  v64 = (id)objc_opt_new();
  v67 = v64;
  +[ARQAHelper traverseTechniques:withBlock:](ARQAHelper, "traverseTechniques:withBlock:", v9, v66);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v64, CFSTR("activeRemoteTechniqueConnections"));

  return v10;
}

void __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "networkVersionString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

    }
  }

}

void __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "numberOfActiveConnections"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

    }
  }

}

+ (void)traverseTechniques:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  objc_msgSend(v6, "splitTechniques");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "splitTechniques");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "traverseTechniques:withBlock:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12++), v7);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "techniques", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "traverseTechniques:withBlock:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v7);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

+ (void)techniquesArray:(id)a3 array:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "techniques", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(a1, "techniquesArray:array:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), v7);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v7, "addObject:", v13);

  }
}

+ (id)headerInformationWithConfiguration:(id)a3 technique:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v5 = a3;
  v30 = a4;
  v29 = (void *)objc_opt_new();
  ARFrameworkVersions();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __59__ARQAHelper_headerInformationWithConfiguration_technique___block_invoke;
  v31[3] = &unk_1E66743C8;
  v7 = v29;
  v32 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v31);
  ARDeviceString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("device"));

  AROSVersionString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("deviceOSVersion"));

  if ((objc_msgSend(v5, "frameSemantics") & 1) != 0)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("segmentation.mov"), CFSTR("segmentationFilename"));
  v10 = (void *)objc_opt_new();
  objc_msgSend(v5, "replaySensor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "templateConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v13 = v12;
    if (v14)
    {
      v13 = v14;

    }
  }
  objc_msgSend((id)objc_opt_class(), "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("configuration"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v13;
    if (objc_msgSend(v17, "planeDetection"))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v18);

    }
    objc_msgSend(v17, "detectionImages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v21);

    }
    objc_msgSend(v17, "detectionObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v24);

    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);
LABEL_17:

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("expectedAnchors"));
  +[ARQAHelper generateTagsForConfiguration:replaySensor:technique:](ARQAHelper, "generateTagsForConfiguration:replaySensor:technique:", v13, v11, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("tags"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomainARKitDefaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("userDefaults"));
  v27 = v7;

  return v27;
}

void __59__ARQAHelper_headerInformationWithConfiguration_technique___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "stringByAppendingString:", CFSTR("Version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)dictionaryFromPlaneExtent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rotationOnYAxis");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("rotationOnYAxis"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "width");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("width"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "height");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("height"));

  return v4;
}

+ (id)dictionaryFromVertices:(id)a1 vertexCount:(SEL)a2 textureCoordinates:textureCoordinateCount:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  +[ARQAHelper arrayOf3dPoints:count:](ARQAHelper, "arrayOf3dPoints:count:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("vertices"));

  +[ARQAHelper arrayOf2dPoints:count:](ARQAHelper, "arrayOf2dPoints:count:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("textureCoordinates"));

  return v10;
}

+ (id)dictionaryFromMeshGeometry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "vertices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("vertexCount"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "faces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("faceCount"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "normals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("normalCount"));

  return v4;
}

+ (id)dictionaryFromPatchGrid:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "size"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  for (i = 0; i < objc_msgSend(v3, "size", v19); ++i)
  {
    v6 = objc_msgSend(v3, "patches");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)(v6 + v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    LODWORD(v8) = *(_DWORD *)(v6 + v4 + 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)(v6 + v4 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v10;
    LODWORD(v11) = *(_DWORD *)(v6 + v4 + 12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:atIndexedSubscript:", v13, i);

    v4 += 16;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "size"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("size"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "pivot");
  objc_msgSend(v16, "numberWithFloat:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("pivot"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("patches"));
  return v14;
}

+ (id)extractAnchorDataForFrame:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  unint64_t i;
  void *v57;
  BOOL v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t j;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t k;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v90;
  void *v91;
  id obj;
  void *v93;
  __int128 v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v96 = (id)objc_opt_new();
  objc_msgSend(v90, "anchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
  if (v5)
  {
    v95 = *(_QWORD *)v99;
    do
    {
      v6 = 0;
      v97 = v5;
      do
      {
        if (*(_QWORD *)v99 != v95)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)objc_opt_class(), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

        objc_msgSend(v7, "transform");
        +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("transform"));

        objc_msgSend(v7, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = v11 == 0;

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v7, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isTracked"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("isTracked"));

        }
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v16, v90);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("identifier"));

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "dictionaryFromPlaneAnchor:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addEntriesFromDictionary:", v18);
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v7;
          objc_msgSend(v19, "blendShapes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("blendShapes"));

          objc_msgSend(v19, "leftEyeTransform");
          +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("leftEyeTransform"));

          objc_msgSend(v19, "rightEyeTransform");
          +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("rightEyeTransform"));

          objc_msgSend(v19, "lookAtPoint");
          +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("lookAtPoint"));
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v7;
          objc_msgSend(v23, "referenceImage");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("referenceImageName"));

          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "referenceImage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "physicalSize");
          *(float *)&v28 = v28;
          objc_msgSend(v26, "numberWithFloat:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v102[0] = v29;
          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "referenceImage");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "physicalSize");
          *(float *)&v33 = v32;
          objc_msgSend(v30, "numberWithFloat:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v102[1] = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("referenceImageSize"));

          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "estimatedScaleFactor");
          *(float *)&v37 = v37;
          objc_msgSend(v36, "numberWithFloat:", v37);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("estimatedScaleFactor"));
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = v7;
          objc_msgSend(v38, "referenceObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "name");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("referenceObjectName"));

          objc_msgSend(v38, "referenceObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "center");
          +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v42, CFSTR("referenceObjectCenter"));

          objc_msgSend(v38, "referenceObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "extent");
          +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v43 = v7;
          objc_msgSend(v43, "url");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "absoluteString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, CFSTR("url"));

          objc_msgSend(v43, "instanceID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v46, CFSTR("instanceID"));

          v47 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v43, "radius");
          objc_msgSend(v47, "numberWithFloat:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("radius"));

          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v43, "confidence");
          objc_msgSend(v49, "numberWithFloat:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("confidence"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v43, "urlDecodingState"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("urlDecodingState"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v43, "urlDecodingStateInternal"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("urlDecodingStateInternal"));
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v52 = v7;
          v53 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v52, "skeleton");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "arrayWithCapacity:", objc_msgSend(v54, "jointCount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = 0;
          for (i = 0; ; ++i)
          {
            objc_msgSend(v52, "skeleton");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "jointCount") > i;

            if (!v58)
              break;
            objc_msgSend(v52, "skeleton");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "jointModelTransforms");
            +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:", *(double *)(v60 + v55), *(double *)(v60 + v55 + 16), *(double *)(v60 + v55 + 32), *(double *)(v60 + v55 + 48));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v61);

            v55 += 64;
          }
          v64 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v52, "referenceBody");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "skeleton");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "arrayWithCapacity:", objc_msgSend(v66, "jointCount"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          for (j = 0; ; ++j)
          {
            objc_msgSend(v52, "referenceBody");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "skeleton");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "jointCount") > j;

            if (!v70)
              break;
            objc_msgSend(v52, "referenceBody");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "skeleton");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            +[ARQAHelper arrayWithVector2:](ARQAHelper, "arrayWithVector2:", *(double *)(objc_msgSend(v72, "jointLandmarks") + 8 * j));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v73);

          }
          v74 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v52, "skeleton");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "coreRESkeleton");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "liftedSkeletonData");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "arrayWithCapacity:", objc_msgSend(v77, "jointCount"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          for (k = 0; ; ++k)
          {
            objc_msgSend(v52, "skeleton");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "coreRESkeleton");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "liftedSkeletonData");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "jointCount") > k;

            if (!v82)
              break;
            objc_msgSend(v52, "skeleton");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "coreRESkeleton");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "liftedSkeletonData");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = *(_OWORD *)(objc_msgSend(v85, "joints") + 16 * k);

            +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:", *(double *)&v94);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v86);

          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("jointModelTransforms"));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v93, CFSTR("referenceBodyLandmarks"));
          v87 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v52, "estimatedScaleFactor");
          objc_msgSend(v87, "numberWithDouble:");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v88, CFSTR("estimatedScaleFactor"));

          objc_msgSend(v8, "setObject:forKeyedSubscript:", v91, CFSTR("liftedJoints"));
LABEL_18:

LABEL_21:
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = v7;
          objc_msgSend(v62, "geometry");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          +[ARQAHelper dictionaryFromMeshGeometry:](ARQAHelper, "dictionaryFromMeshGeometry:", v63);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("geometry"));
          objc_msgSend(v62, "extent");
          +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
          goto LABEL_18;
        }
LABEL_22:
        objc_msgSend(v96, "addObject:", v8);

        ++v6;
      }
      while (v6 != v97);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    }
    while (v5);
  }

  return v96;
}

uint64_t __40__ARQAHelper_extractAnchorDataForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "area");
    objc_msgSend(v6, "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "area");
    objc_msgSend(v9, "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "compare:", v11);
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "caseInsensitiveCompare:", v14);

  }
  return v12;
}

+ (id)extractDetectedBodiesForFrame:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t i;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v20 = (id)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v18, "detectedBodies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v22 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        v7 = (void *)objc_opt_new();
        v8 = (void *)objc_opt_new();
        for (i = 0; ; ++i)
        {
          objc_msgSend(v6, "skeleton", v18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "jointCount") > i;

          if (!v11)
            break;
          objc_msgSend(v6, "skeleton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[ARQAHelper arrayWithVector2:](ARQAHelper, "arrayWithVector2:", *(double *)(objc_msgSend(v12, "jointLandmarks") + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "skeleton");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isJointTracked:", i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        objc_msgSend(v23, "addObject:", v7);
        objc_msgSend(v24, "addObject:", v8);

        ++v5;
      }
      while (v5 != v4);
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v23, "count"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("bodies"));
  if (objc_msgSend(v24, "count", v18))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("trackingStates"));

  return v20;
}

+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "traceFrameData:withFrameIndex:writeOBJ:", v5, a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4 writeOBJ:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CVBuffer *v48;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  unsigned __int8 *BaseAddress;
  uint64_t v53;
  int v54;
  size_t v55;
  unsigned __int8 *i;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  char isKindOfClass;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  float v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  id v84;
  float v85;
  float v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  BOOL v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  BOOL v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  BOOL v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  NSObject *v159;
  objc_class *v160;
  id v161;
  void *v162;
  void *v163;
  NSObject *v164;
  objc_class *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  NSObject *v173;
  objc_class *v174;
  id v175;
  void *v176;
  void *v177;
  NSObject *v178;
  objc_class *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  _BOOL4 v186;
  _BOOL4 v187;
  void *v188;
  void *v189;
  int v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  NSObject *v195;
  objc_class *v196;
  id v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t k;
  void *v202;
  void *v203;
  double v204;
  double v205;
  double v206;
  void *v207;
  void *v208;
  void *v209;
  NSObject *v210;
  objc_class *v211;
  id v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  size_t v217;
  void *v218;
  void *v219;
  void *v220;
  NSObject *v221;
  objc_class *v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  size_t v227;
  void *v228;
  id v229;
  id v230;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  id v241;
  _BOOL4 v243;
  void *v244;
  unint64_t v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  id v250;
  id v251;
  id v252;
  id v253;
  float64x2_t v254[8];
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  uint8_t v259[128];
  _BYTE buf[24];
  id v261;
  _BYTE v262[128];
  _QWORD v263[2];
  _QWORD v264[5];

  v243 = a5;
  v264[2] = *MEMORY[0x1E0C80C00];
  v241 = a3;
  v240 = (id)objc_opt_new();
  v245 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v6, CFSTR("frame"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "timestamp");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  objc_msgSend(v241, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transform");
  +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v10, CFSTR("cameraTransform"));

  objc_msgSend(v241, "referenceOriginTransform");
  +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v11, CFSTR("referenceOriginTransform"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "camera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "trackingState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v14, CFSTR("trackingState"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "camera");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "trackingStateReason"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v17, CFSTR("trackingStateReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v241, "worldMappingStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v18, CFSTR("worldMappingStatus"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "cameraGrainIntensity");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v20, CFSTR("cameraGrainIntensity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v241, "deviceOrientation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v21, CFSTR("deviceOrientation"));

  objc_msgSend(v241, "resultDatas");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filteredArrayUsingPredicate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v233 = v24;
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v24, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "visionCameraTransform");
    +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v27, CFSTR("visionCameraTransform"));

  }
  objc_msgSend(v241, "worldTrackingState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "majorRelocalization");

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v30, CFSTR("majorRelocalization"));

  }
  objc_msgSend(v241, "worldTrackingState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "minorRelocalization");

  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v33, CFSTR("minorRelocalization"));

  }
  objc_msgSend(v241, "worldTrackingState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "poseGraphUpdated");

  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v36, CFSTR("poseGraphUpdated"));

  }
  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "worldTrackingState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "vioTrackingState"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v39, CFSTR("vioTrackingState"));

  objc_msgSend(v241, "worldTrackingErrorData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v263[0] = CFSTR("Timestamp");
    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v241, "worldTrackingErrorData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timestamp");
    objc_msgSend(v41, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v263[1] = CFSTR("ErrorCode");
    v264[0] = v43;
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v241, "worldTrackingErrorData");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v45, "errorCode"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v264[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, v263, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v47, CFSTR("worldTrackingError"));

  }
  if (objc_msgSend(v241, "segmentationBuffer"))
  {
    v48 = (__CVBuffer *)objc_msgSend(v241, "segmentationBuffer");
    CVPixelBufferLockBaseAddress(v48, 0);
    Width = CVPixelBufferGetWidth(v48);
    Height = CVPixelBufferGetHeight(v48);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v48);
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(v48);
    if (Height)
    {
      v53 = 0;
      v54 = 0;
      do
      {
        v55 = Width;
        for (i = BaseAddress; v55; --v55)
        {
          if (!*i++)
            ++v54;
        }
        ++v53;
        BaseAddress += BytesPerRow;
      }
      while (v53 != Height);
    }
    else
    {
      v54 = 0;
    }
    CVPixelBufferUnlockBaseAddress(v48, 0);
    v58 = 100.0 - (float)v54 * 100.0 / (float)(Height * Width);
    *(float *)&v58 = v58;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v59, CFSTR("segmentationPixelsPercentage"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "resultDatas");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "filteredArrayUsingPredicate:", v234);
  v236 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v236, "firstObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v236, "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_opt_new();
    v257 = 0u;
    v258 = 0u;
    v255 = 0u;
    v256 = 0u;
    objc_msgSend(v63, "detectedObjects");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v255, v262, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v256;
      do
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v256 != v67)
            objc_enumerationMutation(v65);
          v69 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * j);
          v70 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v69, "boundingBox");
          v72 = v71;
          objc_msgSend(v69, "boundingBox");
          v74 = v73;
          objc_msgSend(v69, "boundingBox");
          v76 = v75;
          objc_msgSend(v69, "boundingBox");
          objc_msgSend(v70, "stringWithFormat:", CFSTR("{x:%f, y:%f, width: %f, height: %f}"), v72, v74, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v78);

        }
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v255, v262, 16);
      }
      while (v66);
    }

    objc_msgSend(v240, "setObject:forKeyedSubscript:", v64, CFSTR("personDetectionBoundingBoxes"));
  }
  if (objc_msgSend(v241, "segmentationBuffer") && objc_msgSend(v241, "estimatedDepthData"))
  {
    objc_msgSend((id)objc_opt_class(), "_meanDepthValueOfDepthBuffer:consideringSegmentation:ofSegmentationBuffer:", objc_msgSend(v241, "estimatedDepthData"), 1, objc_msgSend(v241, "segmentationBuffer"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.4f"), v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v80, CFSTR("averageDepth"));

  }
  objc_msgSend(v241, "capturedDepthData");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81 == 0;

  if (!v82)
  {
    v83 = (void *)objc_opt_class();
    objc_msgSend(v241, "capturedDepthData");
    v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v83, "_meanDepthValueOfDepthBuffer:consideringSegmentation:ofSegmentationBuffer:", objc_msgSend(v84, "depthDataMap"), 0, 0);
    v86 = v85;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.4f"), v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v87, CFSTR("averageCapturedDepth"));

  }
  objc_msgSend(v241, "featurePoints");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "count") == 0;

  if (!v89)
  {
    objc_msgSend(v241, "featurePoints");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "points");
    objc_msgSend(v241, "featurePoints");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARQAHelper arrayOf3dPoints:count:](ARQAHelper, "arrayOf3dPoints:count:", v91, objc_msgSend(v92, "count"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v93, CFSTR("featurePoints"));

  }
  objc_msgSend(v241, "location");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94 == 0;

  if (!v95)
  {
    objc_msgSend(v241, "location");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARQAHelper dictionaryFromCLLocation:](ARQAHelper, "dictionaryFromCLLocation:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v97, CFSTR("location"));

  }
  objc_msgSend(v241, "rawLocation");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98 == 0;

  if (!v99)
  {
    objc_msgSend(v241, "rawLocation");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARQAHelper dictionaryFromRawCLLocation:](ARQAHelper, "dictionaryFromRawCLLocation:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v101, CFSTR("rawLocation"));

  }
  v102 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "heading");
  objc_msgSend(v102, "numberWithDouble:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v103, CFSTR("heading"));

  v104 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "rawHeading");
  objc_msgSend(v104, "numberWithDouble:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v105, CFSTR("rawHeading"));

  v106 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "vlState");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "fusedReplayHeading");
  objc_msgSend(v106, "numberWithDouble:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v108, CFSTR("fusedHeading"));

  v109 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "vlState");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "fusedReplayHeadingTimestamp");
  objc_msgSend(v109, "numberWithDouble:");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v111, CFSTR("fusedHeadingTimestamp"));

  v112 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "rawLocationTimestamp");
  objc_msgSend(v112, "numberWithDouble:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v113, CFSTR("rawLocationTimestamp"));

  objc_msgSend(v241, "undulation");
  v114 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v241, "undulation");
  objc_msgSend(v114, "numberWithDouble:");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setObject:forKeyedSubscript:", v115, CFSTR("undulation"));

  objc_msgSend(v241, "resultDatas");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_260);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "filteredArrayUsingPredicate:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "firstObject");
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  if (v239)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v239, "errorCode"));
    v119 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v119, CFSTR("vlErrorCode"));

    objc_msgSend(v239, "localizationResult");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v119) = v120 == 0;

    if ((v119 & 1) == 0)
    {
      v121 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v239, "localizationResult");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "inputTimestamp");
      objc_msgSend(v121, "numberWithDouble:");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "setObject:forKeyedSubscript:", v123, CFSTR("vlInputTimestamp"));

      objc_msgSend(v239, "localizationResult");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v124;
      if (v124)
        objc_msgSend(v124, "transform");
      else
        memset(v254, 0, sizeof(v254));
      +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:", ARMatrix4x4DoubleToFloat(v254));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "setObject:forKeyedSubscript:", v126, CFSTR("vlTransform"));

      objc_msgSend(v239, "location");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARQAHelper dictionaryFromCLLocation:](ARQAHelper, "dictionaryFromCLLocation:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "setObject:forKeyedSubscript:", v128, CFSTR("vlLocation"));

      v129 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v239, "heading");
      objc_msgSend(v129, "numberWithDouble:");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "setObject:forKeyedSubscript:", v130, CFSTR("vlHeading"));

    }
    objc_msgSend(v239, "debugInfo");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "inputParameters");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v132, CFSTR("vlDebugInputParameters"));

    objc_msgSend(v239, "debugInfo");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "results");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v134, CFSTR("vlDebugResults"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v239, "algorithmVersion"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v135, CFSTR("vlAlgorithmVersion"));

  }
  objc_msgSend(v241, "geoTrackingStatus");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v136 == 0;

  if (!v137)
  {
    objc_msgSend(v241, "geoTrackingStatus");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARGeoTrackingState(objc_msgSend(v138, "state"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v139, CFSTR("geoTrackingStatus.state"));

    objc_msgSend(v241, "geoTrackingStatus");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARGeoTrackingAccuracy(objc_msgSend(v140, "accuracy"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v141, CFSTR("geoTrackingStatus.accuracy"));

    objc_msgSend(v241, "geoTrackingStatus");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARGeoTrackingStateReason(objc_msgSend(v142, "stateReason"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v143, CFSTR("geoTrackingStatus.stateReason"));

    v144 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v241, "geoTrackingStatus");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "numberWithInteger:", objc_msgSend(v145, "failureReasons"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v146, CFSTR("geoTrackingStatus.failureReasons"));

  }
  +[ARQAHelper extractAnchorDataForFrame:](ARQAHelper, "extractAnchorDataForFrame:", v241);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v232, "count"))
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v232, CFSTR("anchors"));
  +[ARQAHelper extractDetectedBodiesForFrame:](ARQAHelper, "extractDetectedBodiesForFrame:", v241);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v235, "count"))
  {
    objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("bodies"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v147, CFSTR("detectedBodies"));

    objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("trackingStates"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v148, CFSTR("detectedBodiesTrackingStates"));

  }
  objc_msgSend(v241, "currentlyActiveVideoFormat");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v149 == 0;

  if (!v150)
  {
    objc_msgSend(v241, "currentlyActiveVideoFormat");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "captureDeviceType");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v152, CFSTR("currentlyActiveCameraForVIO"));

  }
  if (v243)
  {
    objc_msgSend(v241, "anchors");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "filteredArrayUsingPredicate:", v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v155, "count"))
    {
      v253 = 0;
      ARCreateOBJStringForMeshAnchors(v155, &v253, 1.0);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = v253;
      if (v157)
      {
        v158 = v157;
        _ARLogGeneral();
        v159 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          v160 = (objc_class *)objc_opt_class();
          NSStringFromClass(v160);
          v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v161;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a1;
          *(_WORD *)&buf[22] = 2112;
          v261 = v158;
          _os_log_impl(&dword_1B3A68000, v159, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create obj for mesh anchors due to error: %@", buf, 0x20u);

        }
      }
      else
      {
        +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("meshAnchors_%lu.obj"), v245);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "stringByAppendingPathComponent:", v163);
        v159 = objc_claimAutoreleasedReturnValue();

        v252 = 0;
        objc_msgSend(v156, "writeToFile:atomically:encoding:error:", v159, 1, 4, &v252);
        v158 = v252;
        if (v158)
        {
          _ARLogGeneral();
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          {
            v165 = (objc_class *)objc_opt_class();
            NSStringFromClass(v165);
            v166 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v166;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2112;
            v261 = v158;
            _os_log_impl(&dword_1B3A68000, v164, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save obj for mesh anchors due to error: %@", buf, 0x20u);

          }
          objc_msgSend(v240, "setObject:forKeyedSubscript:", v158, CFSTR("meshAnchorsObjFileError"));
        }
        else
        {
          objc_msgSend(v240, "setObject:forKeyedSubscript:", v159, CFSTR("meshAnchorsObjFile"));
        }
      }

    }
    objc_msgSend(v241, "anchors");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "filteredArrayUsingPredicate:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v169, "count"))
    {
      v251 = 0;
      ARCreateOBJStringForPlaneAnchors(v169, &v251, 1.0);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = v251;
      if (v171)
      {
        v172 = v171;
        _ARLogGeneral();
        v173 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
        {
          v174 = (objc_class *)objc_opt_class();
          NSStringFromClass(v174);
          v175 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v175;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a1;
          *(_WORD *)&buf[22] = 2112;
          v261 = v172;
          _os_log_impl(&dword_1B3A68000, v173, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create obj for mesh anchors due to error: %@", buf, 0x20u);

        }
      }
      else
      {
        +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("planeAnchors_%lu.obj"), v245);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "stringByAppendingPathComponent:", v177);
        v173 = objc_claimAutoreleasedReturnValue();

        v250 = 0;
        objc_msgSend(v170, "writeToFile:atomically:encoding:error:", v173, 1, 4, &v250);
        v172 = v250;
        if (v172)
        {
          _ARLogGeneral();
          v178 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
          {
            v179 = (objc_class *)objc_opt_class();
            NSStringFromClass(v179);
            v180 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v180;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2112;
            v261 = v172;
            _os_log_impl(&dword_1B3A68000, v178, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save obj for mesh anchors due to error: %@", buf, 0x20u);

          }
          objc_msgSend(v240, "setObject:forKeyedSubscript:", v172, CFSTR("planeAnchorsObjFileError"));
        }
        else
        {
          objc_msgSend(v240, "setObject:forKeyedSubscript:", v173, CFSTR("planeAnchorsObjFile"));
        }
      }

    }
  }
  objc_msgSend(v241, "resultDatas");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_308);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "filteredArrayUsingPredicate:", v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "firstObject");
  v237 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v237, "resultDataOfClass:", objc_opt_class());
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "firstObject");
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v237, "resultDataOfClass:", objc_opt_class());
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "firstObject");
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v186 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.qatracing.dumpSemanticSegmantationData"));
  if (v238)
    v187 = v186;
  else
    v187 = 0;
  if (v187 && objc_msgSend(v238, "source") == 2)
  {
    objc_msgSend(v238, "sourceImageData");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "cameraType");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = objc_msgSend(v189, "isEqualToString:", *MEMORY[0x1E0C89F98]);

    if (v190)
    {
      +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
      v191 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ultraWideImage_%lu.png"), v245);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v191, "stringByAppendingPathComponent:", v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v238, "sourceImageData");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v191) = ARSavePixelBufferPNG((__CVBuffer *)objc_msgSend(v194, "pixelBuffer"), v193) == 0;

      if ((v191 & 1) == 0)
      {
        _ARLogGeneral();
        v195 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
        {
          v196 = (objc_class *)objc_opt_class();
          NSStringFromClass(v196);
          v197 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v197;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a1;
          _os_log_impl(&dword_1B3A68000, v195, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save ultrawide image to file", buf, 0x16u);

        }
      }
      objc_msgSend(v240, "setObject:forKeyedSubscript:", v193, CFSTR("semanticSegmentationUndistoredUltraWideImage"));

    }
    if (v244)
    {
      v248 = 0u;
      v249 = 0u;
      v246 = 0u;
      v247 = 0u;
      objc_msgSend(v244, "downScalingResults");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v246, v259, 16);
      if (v199)
      {
        v200 = *(_QWORD *)v247;
        do
        {
          for (k = 0; k != v199; ++k)
          {
            if (*(_QWORD *)v247 != v200)
              objc_enumerationMutation(v198);
            v202 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * k);
            if (objc_msgSend(v202, "pixelBuffer"))
            {
              v203 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v202, "imageResolution");
              v205 = v204;
              objc_msgSend(v202, "imageResolution");
              objc_msgSend(v203, "stringWithFormat:", CFSTR("mlImage%dx%d_%lu.png"), (int)v205, (int)v206, v245);
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v208, "stringByAppendingPathComponent:", v207);
              v209 = (void *)objc_claimAutoreleasedReturnValue();

              if (ARSavePixelBufferPNG((__CVBuffer *)objc_msgSend(v202, "pixelBuffer"), v209))
              {
                _ARLogGeneral();
                v210 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
                {
                  v211 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v211);
                  v212 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v212;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = a1;
                  _os_log_impl(&dword_1B3A68000, v210, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save ml image to file", buf, 0x16u);

                }
              }

            }
            objc_msgSend(v244, "latestResizedUltraWideImageData");
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "downScalingResults");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "firstObject");
            v215 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v215, "undistortedPixelBuffer"))
            {
              v216 = (void *)MEMORY[0x1E0CB3940];
              v217 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v215, "undistortedPixelBuffer"));
              objc_msgSend(v216, "stringWithFormat:", CFSTR("undistortedPixelBuffer%dx%d_%lu.png"), v217, CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v215, "undistortedPixelBuffer")), v245);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v219, "stringByAppendingPathComponent:", v218);
              v220 = (void *)objc_claimAutoreleasedReturnValue();

              if (ARSavePixelBufferPNG((__CVBuffer *)objc_msgSend(v215, "undistortedPixelBuffer"), v220))
              {
                _ARLogGeneral();
                v221 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
                {
                  v222 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v222);
                  v223 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v223;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = a1;
                  _os_log_impl(&dword_1B3A68000, v221, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save undistored image to file", buf, 0x16u);

                }
              }

            }
          }
          v199 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v246, v259, 16);
        }
        while (v199);
      }

    }
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"), 0);
    +[ARQATracer traceOutputDirectory](ARQATracer, "traceOutputDirectory");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("semanticSegmentation_%lu.png"), v245);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "stringByAppendingPathComponent:", v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v224) = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"));
    LODWORD(v225) = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"));
    v227 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"));
    v228 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = v224 | ((unint64_t)v225 << 32);
    *(_QWORD *)&buf[16] = (v227 << 32) | 1;
    v261 = v228;
    v229 = objc_retainAutorelease(v226);
    objc_msgSend(v229, "UTF8String");
    cva::imwrite<unsigned char>();
    objc_msgSend(v240, "setObject:forKeyedSubscript:", v229, CFSTR("semanticSegmentationLabelsFile"));
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v238, "segmentationBuffer"), 0);

  }
  v230 = v240;

  return v230;
}

uint64_t __53__ARQAHelper_traceFrameData_withFrameIndex_writeOBJ___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __53__ARQAHelper_traceFrameData_withFrameIndex_writeOBJ___block_invoke_307(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)dictionaryFromCLLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("latitude");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "coordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v17[1] = CFSTR("longitude");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "coordinate");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("altitude");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "altitude");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  v17[3] = CFSTR("horizontalAccuracy");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "horizontalAccuracy");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = CFSTR("verticalAccuracy");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "verticalAccuracy");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)dictionaryFromRawCLLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
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
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[20];
  _QWORD v53[22];

  v53[20] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_groundAltitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v51 = v4;
  if (!v4 || objc_msgSend(v4, "undulationModel") == -1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "uncertainty");
    objc_msgSend(v5, "uncertainty");
    v7 = v6 > 0.0;
  }
  if (objc_msgSend(v3, "isAltitudeWgs84Available"))
  {
    objc_msgSend(v3, "altitudeWgs84");
    v9 = v8;
    objc_msgSend(v3, "altitude");
    v11 = v9 - v10;
  }
  else
  {
    v11 = NAN;
  }
  v52[0] = CFSTR("latitude");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "coordinate");
  objc_msgSend(v12, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v50;
  v52[1] = CFSTR("longitude");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "coordinate");
  objc_msgSend(v13, "numberWithDouble:", v14);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v49;
  v52[2] = CFSTR("altitude");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "altitude");
  objc_msgSend(v15, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v48;
  v52[3] = CFSTR("course");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "course");
  objc_msgSend(v16, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v47;
  v52[4] = CFSTR("horizontalAccuracy");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "horizontalAccuracy");
  objc_msgSend(v17, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v46;
  v52[5] = CFSTR("verticalAccuracy");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "verticalAccuracy");
  objc_msgSend(v18, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v45;
  v52[6] = CFSTR("courseAccuracy");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "courseAccuracy");
  objc_msgSend(v19, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v44;
  v52[7] = CFSTR("rawLatitude");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawCoordinate");
  objc_msgSend(v20, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v43;
  v52[8] = CFSTR("rawLongitude");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawCoordinate");
  objc_msgSend(v21, "numberWithDouble:", v22);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v42;
  v52[9] = CFSTR("rawAltitude");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawAltitude");
  objc_msgSend(v23, "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v41;
  v52[10] = CFSTR("rawCourse");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawCourse");
  objc_msgSend(v24, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v40;
  v52[11] = CFSTR("rawHorizontalAccuracy");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawHorizontalAccuracy");
  objc_msgSend(v25, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v39;
  v52[12] = CFSTR("rawVerticalAccuracy");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawVerticalAccuracy");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v27;
  v52[13] = CFSTR("rawCourseAccuracy");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rawCourseAccuracy");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v29;
  v52[14] = CFSTR("undulation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v30;
  v52[15] = CFSTR("isGroundAltitudeValid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v31;
  v52[16] = CFSTR("isAltitudeWgs84Available");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAltitudeWgs84Available"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v32;
  v52[17] = CFSTR("isCoordinateFused");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isCoordinateFused"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v33;
  v52[18] = CFSTR("isCoordinateFusedWithVL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isCoordinateFusedWithVL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v34;
  v52[19] = CFSTR("ellipsoidalAltitude");
  objc_msgSend(v3, "ellipsoidalAltitude");
  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "ellipsoidalAltitude");
  objc_msgSend(v35, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 20);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)dictionaryFromRaycastQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = CFSTR("origin");
  objc_msgSend(v4, "origin");
  objc_msgSend(a1, "arrayWithVector3:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("direction");
  objc_msgSend(v4, "direction");
  objc_msgSend(a1, "arrayWithVector3:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("description");
  objc_msgSend(v4, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)arrayFromRaycastResults:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v13;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16, v13);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v19[0] = CFSTR("transform");
        objc_msgSend(v8, "worldTransform");
        objc_msgSend(a1, "arrayWithMatrix4x4:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = CFSTR("description");
        v20[0] = v9;
        objc_msgSend(v8, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  return v4;
}

+ (float)_meanDepthValueOfDepthBuffer:(__CVBuffer *)a3 consideringSegmentation:(BOOL)a4 ofSegmentationBuffer:(__CVBuffer *)a5
{
  _BOOL4 v6;
  float result;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  size_t v12;
  size_t v13;
  size_t v14;
  float *BaseAddress;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  float v19;
  size_t v20;
  _BYTE *v21;
  float *i;

  if (!a3)
    return NAN;
  v6 = a4;
  if (!a5 && a4)
    return NAN;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (v6)
  {
    v12 = CVPixelBufferGetBytesPerRow(a5);
    v13 = CVPixelBufferGetWidth(a5);
    v14 = CVPixelBufferGetHeight(a5);
    result = NAN;
    if (Width != v13 || Height != v14)
      return result;
  }
  else
  {
    v12 = 0;
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  v16 = 0;
  if (v6)
  {
    CVPixelBufferLockBaseAddress(a5, 0);
    v16 = CVPixelBufferGetBaseAddress(a5);
  }
  if (Height)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0.0;
    do
    {
      v20 = Width;
      v21 = v16;
      for (i = BaseAddress; v20; --v20)
      {
        if (!v6 || *v21)
        {
          v19 = v19 + *i;
          ++v18;
        }
        ++i;
        ++v21;
      }
      ++v17;
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      v16 += v12;
    }
    while (v17 != Height);
  }
  else
  {
    v18 = 0;
    v19 = 0.0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (a5)
    CVPixelBufferUnlockBaseAddress(a5, 0);
  return v19 / (float)v18;
}

+ (id)formatDescriptionForAnchor
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Anchor identifier"), CFSTR("identifier"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Anchor transformation"), CFSTR("transform"));
  return v2;
}

+ (id)dictionaryFromAnchor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

  objc_msgSend(v3, "transform");
  +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("transform"));

  return v4;
}

+ (id)formatDescriptionForPlaneAnchor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "formatDescriptionForAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Alignment. horizontal or vertical"), CFSTR("alignment"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Center of plane"), CFSTR("center"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Plane's extent"), CFSTR("extent"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("The plane's geometry"), CFSTR("geometry"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("The plane's area"), CFSTR("area"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("The plane's classification"), CFSTR("planeClassification"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Classification status"), CFSTR("planeClassificationStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Classification label"), CFSTR("classificationLabel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Extend of plane's grid"), CFSTR("gridExtent"));
  return v3;
}

+ (id)dictionaryFromPlaneAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(a1, "dictionaryFromAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "alignment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("alignment"));

  objc_msgSend(v4, "center");
  +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("center"));

  objc_msgSend(v4, "extent");
  +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("extent"));

  objc_msgSend(v4, "planeExtent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARQAHelper dictionaryFromPlaneExtent:](ARQAHelper, "dictionaryFromPlaneExtent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("planeExtent"));

  objc_msgSend(v4, "geometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "vertices");
  objc_msgSend(v4, "geometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "vertexCount");
  objc_msgSend(v4, "geometry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "textureCoordinates");
  objc_msgSend(v4, "geometry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARQAHelper dictionaryFromVertices:vertexCount:textureCoordinates:textureCoordinateCount:](ARQAHelper, "dictionaryFromVertices:vertexCount:textureCoordinates:textureCoordinateCount:", v13, v15, v17, objc_msgSend(v18, "textureCoordinateCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("geometry"));
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "area");
  objc_msgSend(v20, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("area"));

  NSStringFromARPlaneClassification(objc_msgSend(v4, "classification"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("planeClassification"));

  NSStringFromARPlaneClassificationStatus(objc_msgSend(v4, "classificationStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("planeClassificationStatus"));

  objc_msgSend(v4, "classificationLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("classificationLabel"));

  objc_msgSend(v4, "gridExtent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "gridExtent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARQAHelper dictionaryFromPatchGrid:](ARQAHelper, "dictionaryFromPatchGrid:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("gridExtent"));

  }
  return v6;
}

+ (id)dictionaryFromMeshAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "dictionaryFromAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARQAHelper dictionaryFromMeshGeometry:](ARQAHelper, "dictionaryFromMeshGeometry:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("geometry"));
  return v6;
}

@end
