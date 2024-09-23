@implementation VCPCoreMLFeatureProviderGestureVideo

- (VCPCoreMLFeatureProviderGestureVideo)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  VCPCoreMLFeatureProviderGestureVideo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPCoreMLFeatureProviderGestureVideo;
  v2 = -[VCPCoreMLFeatureProviderGestureVideo init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    *((_WORD *)v2 + 14) = 0;
    *((_DWORD *)v2 + 8) = 0;
    *(_QWORD *)(v2 + 20) = -4294967291;
  }
  if (*((_QWORD *)v2 + 1))
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)addLeftHand:(id)a3 andRightHand:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *observationsPersons;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t channels;
  id v21;

  v21 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("leftHand"));
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("rightHand"));
  observationsPersons = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observationsPersons, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_observationsPersons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "addObject:", v7);
  v14 = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  channels = self->_channels;

  if (v19 > channels)
    objc_msgSend(v13, "removeObjectAtIndex:", 0);

}

- (void)setCurrentGroupID:(int)a3
{
  self->_currentGroupID = a3;
}

- (id)existingGroupIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_observationsPersons, "allKeys");
}

- (BOOL)ready
{
  VCPCoreMLFeatureProviderGestureVideo *v2;
  NSMutableDictionary *observationsPersons;
  void *v4;
  void *v5;

  v2 = self;
  observationsPersons = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observationsPersons, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "count") >= (unint64_t)v2->_channels;

  return (char)v2;
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_observationsPersons, "removeAllObjects");
}

- (id)observationsForCurrentGroup
{
  NSMutableDictionary *observationsPersons;
  void *v3;
  void *v4;

  observationsPersons = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observationsPersons, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B769C8);
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *observationsPersons;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  float *v36;
  float v37;
  float v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float v58;
  float v59;
  void *v60;
  void *v61;
  int v62;
  float v63;
  BOOL v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  double v73;
  double v74;
  double *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  float v84;
  double v85;
  float v86;
  double v87;
  double v88;
  float v89;
  float v90;
  float v91;
  NSObject *v92;
  os_log_type_t v93;
  int v94;
  double v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  double *v99;
  uint64_t i;
  float *v101;
  float v102;
  float v103;
  float v104;
  float v105;
  void *v106;
  _BYTE v108[4];
  int v109;
  _BYTE *v110;
  float v111;
  float v112;
  _BYTE *v113;
  id v114;
  const __CFString *v115;
  uint8_t buf[4];
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  double v127;
  _QWORD v128[5];
  CGPoint v129;
  CGPoint v130;

  v110 = v108;
  v128[3] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78]((_QWORD *)self->_channels, self, a2, a3);
  v113 = &v108[-16 * v4];
  v5 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_channels);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v6;
  v128[1] = &unk_1E6B74D50;
  v128[2] = &unk_1E6B74D68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (id)objc_msgSend(v5, "initWithShape:dataType:error:", v7, 65568, 0);

  observationsPersons = self->_observationsPersons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observationsPersons, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "count") == self->_channels;

  if (!(_DWORD)v7)
  {
    v106 = 0;
    goto LABEL_90;
  }
  if (self->_channels < 1)
    goto LABEL_88;
  v13 = 0;
  v115 = CFSTR("leftHand");
  v109 = 2;
  v111 = 0.3;
  v112 = 0.0;
  do
  {
    v14 = self->_observationsPersons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v115);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_observationsPersons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("rightHand"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_lrFlip)
    {
      v24 = self->_observationsPersons;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("rightHand"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = self->_observationsPersons;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentGroupID);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v115);
      v33 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v33;
    }
    else
    {
      v28 = v18;
    }
    v34 = objc_retainAutorelease(v114);
    v35 = 0;
    v36 = (float *)(objc_msgSend(v34, "dataPointer") + 504 * (_DWORD)v13 + 252);
    v37 = 0.0;
    v38 = 1.0;
    v39 = 1.0;
    v40 = 0.0;
    do
    {
      if (v28)
      {
        objc_msgSend(v28, "keypoints");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "location");
        transformLocation(v129, self->_lrFlip, self->_rotationInDegrees);
        v44 = v43;
        v46 = v45;

        v47 = v44;
        *(v36 - 63) = v47;
        v48 = v46;
        *(v36 - 21) = v48;
        objc_msgSend(v28, "keypoints");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v35);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "confidence");
        *((_DWORD *)v36 + 21) = v51;

        if (v44 <= v38)
          v38 = v44;
        if (v46 <= v39)
          v39 = v46;
        if (v44 > v37)
          v37 = v44;
        if (v46 > v40)
          v40 = v46;
        if (!v23)
        {
LABEL_28:
          *(v36 - 42) = 0.0;
          *v36 = 0.0;
          v36[42] = 0.0;
          goto LABEL_29;
        }
      }
      else
      {
        *(v36 - 63) = 0.0;
        *(v36 - 21) = 0.0;
        v36[21] = 0.0;
        if (!v23)
          goto LABEL_28;
      }
      objc_msgSend(v23, "keypoints");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", v35);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "location");
      transformLocation(v130, self->_lrFlip, self->_rotationInDegrees);
      v55 = v54;
      v57 = v56;

      v58 = v55;
      *(v36 - 42) = v58;
      v59 = v57;
      *v36 = v59;
      objc_msgSend(v23, "keypoints");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", v35);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "confidence");
      *((_DWORD *)v36 + 42) = v62;

      if (v55 <= v38)
        v38 = v55;
      if (v57 <= v39)
        v39 = v57;
      if (v55 > v37)
        v37 = v55;
      if (v57 > v40)
        v40 = v57;
LABEL_29:
      ++v35;
      ++v36;
    }
    while (v35 != 21);
    if (self->_scaleUpSmallHandGroup)
    {
      if (v38 < 1.0)
        v63 = v38;
      else
        v63 = 1.0;
      v64 = v38 > 0.0;
      v65 = 0.0;
      if (v64)
        v66 = v63;
      else
        v66 = 0.0;
      if (v39 < 1.0)
        v67 = v39;
      else
        v67 = 1.0;
      if (v39 <= 0.0)
        v68 = 0.0;
      else
        v68 = v67;
      if (v37 < 1.0)
        v69 = v37;
      else
        v69 = 1.0;
      if (v37 <= 0.0)
        v70 = 0.0;
      else
        v70 = v69;
      if (v40 < 1.0)
        v71 = v40;
      else
        v71 = 1.0;
      if (v40 <= 0.0)
        v72 = 0.0;
      else
        v72 = v71;
      v73 = (float)(v70 + v66) * 0.5;
      v74 = (float)(v72 + v68) * 0.5;
      v75 = (double *)&v113[16 * v13];
      *v75 = v73;
      v75[1] = v74;
      if (v28)
      {
        objc_msgSend(v28, "bounds");
        v77 = v76;
        objc_msgSend(v28, "bounds");
        v65 = fmax((v77 + v78) * 0.5, 0.0);
      }
      if (v23)
      {
        objc_msgSend(v23, "bounds");
        v80 = v79;
        objc_msgSend(v23, "bounds");
        v82 = (v80 + v81) * 0.5;
        if (v82 > v65)
        {
          v83 = v82;
          v65 = v83;
        }
      }
      if (v65 > 0.0)
      {
        v84 = v111 / v65;
        if (v112 >= (float)(v111 / v65))
          v84 = v112;
        v85 = v73 / (v73 - v66);
        if (v85 >= v74 / (v74 - v68))
          v85 = v74 / (v74 - v68);
        v86 = v85;
        v87 = (1.0 - v73) / (v70 - v73);
        v88 = v72 - v74;
        if (v87 >= (1.0 - v74) / v88)
          v87 = (1.0 - v74) / v88;
        v89 = v87;
        if (v86 >= v89)
          v90 = v87;
        else
          v90 = v86;
        if (v84 < v90)
          v90 = v84;
        v64 = v84 > 0.0;
        v91 = 0.0;
        if (v64)
          v91 = v90;
        v112 = v91;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v92 = MEMORY[0x1E0C81028];
          v93 = v109;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], (os_log_type_t)v109))
          {
            *(_DWORD *)buf = 134219264;
            v117 = v112;
            v118 = 2048;
            v119 = v73;
            v120 = 2048;
            v121 = (float)(v72 + v68) * 0.5;
            v122 = 2048;
            v123 = v65;
            v124 = 2048;
            v125 = v86;
            v126 = 2048;
            v127 = v89;
            _os_log_impl(&dword_1B6C4A000, v92, v93, "Adjusted scaleF %.2f, groupCenter [%.2f,%.2f], refHandSize %.2f, upperBounds:%.2f,%.2f", buf, 0x3Eu);
          }
        }
      }
    }

    ++v13;
  }
  while (v13 < self->_channels);
  if (self->_scaleUpSmallHandGroup)
  {
    LODWORD(v11) = 1.0;
    *(float *)&v12 = v112;
    if (v112 > 1.0)
    {
      v94 = MediaAnalysisLogLevel();
      *(float *)&v11 = v112;
      v95 = v112;
      v96 = v109;
      if (v94 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], (os_log_type_t)v109))
      {
        *(_DWORD *)buf = 134217984;
        v117 = v95;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], v96, "VCPCoreMLFeatureProviderGestureVideo: scaling up small hands, scale factor %.2f", buf, 0xCu);
      }
      if (self->_channels >= 1)
      {
        v97 = 0;
        do
        {
          v98 = objc_msgSend(objc_retainAutorelease(v34), "dataPointer") + ((0x7E00000000 * v97) >> 30);
          v99 = (double *)&v113[16 * v97];
          v11 = *v99;
          v12 = v99[1];
          for (i = 84; i != 168; i += 4)
          {
            v101 = (float *)(v98 + i);
            v102 = v11 + v95 * (*(float *)(v98 + i - 84) - v11);
            v103 = v12 + v95 * (*(float *)(v98 + i + 84) - v12);
            v104 = v11 + v95 * (*(float *)(v98 + i) - v11);
            v105 = v12 + v95 * (*(float *)(v98 + i + 168) - v12);
            *(v101 - 21) = v102;
            v101[21] = v103;
            *v101 = v104;
            v101[42] = v105;
          }
          ++v97;
        }
        while (v97 < self->_channels);
      }
    }
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v114, v11, v12);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_90:

  return v106;
}

- (BOOL)lrFlip
{
  return self->_lrFlip;
}

- (void)setLrFlip:(BOOL)a3
{
  self->_lrFlip = a3;
}

- (BOOL)scaleUpSmallHandGroup
{
  return self->_scaleUpSmallHandGroup;
}

- (void)setScaleUpSmallHandGroup:(BOOL)a3
{
  self->_scaleUpSmallHandGroup = a3;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_rotationInDegrees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsPersons, 0);
}

@end
