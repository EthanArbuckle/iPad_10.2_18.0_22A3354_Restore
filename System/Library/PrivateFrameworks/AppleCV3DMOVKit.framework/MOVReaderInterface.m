@implementation MOVReaderInterface

- (id)deviceStringFromPlatformID:(id)a3
{
  int v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_msgSend(a3, "intValue");
  v4 = CFSTR("ST2");
  if (v3 != 178)
    v4 = 0;
  if ((v3 - 82) >= 2)
    v5 = v4;
  else
    v5 = CFSTR("J420");
  if ((v3 - 80) >= 2)
    return (id)v5;
  else
    return CFSTR("J417");
}

- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  objc_super v6;

  self->_lastDepthTOFTimestamp = 0.0;
  v6.receiver = self;
  v6.super_class = (Class)MOVReaderInterface;
  v5 = *a3;
  return -[MOVStreamReader resetReaderTo:error:](&v6, sel_resetReaderTo_error_, &v5, a4);
}

- (MOVReaderInterface)initWithFileURL:(id)a3 delegate:(id)a4 error:(id *)a5
{
  MOVReaderInterface *v5;
  MOVReaderInterface *v6;
  NSError *lastError;
  uint64_t v8;
  NSMutableDictionary *streamFilters;
  void *v10;
  uint64_t v11;
  NSString *deviceName;
  uint64_t v13;
  NSString *bundleID;
  uint64_t v15;
  NSString *version;
  uint64_t v17;
  NSString *serialNumber;
  uint64_t v19;
  NSString *productConfig;
  uint64_t v21;
  NSString *productVersion;
  uint64_t v23;
  NSString *osVersion;
  uint64_t v25;
  NSString *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  NSString **p_spuIMUTrackName;
  NSString *spuIMUTrackName;
  void *v44;
  int v45;
  uint64_t v46;
  NSMutableDictionary *spuVersions;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSMutableDictionary *v58;
  void *v59;
  NSString **p_accelTrackName;
  NSString *accelTrackName;
  __CFString *v62;
  void *v63;
  char v64;
  void *v65;
  int v66;
  NSString **p_gyroTrackName;
  NSString *gyroTrackName;
  __CFString *v69;
  void *v70;
  char v71;
  void *v72;
  int v73;
  NSString **p_motionTrackName;
  NSString *motionTrackName;
  void *v76;
  int v77;
  NSString **p_deviceMotionTrackName;
  NSString *deviceMotionTrackName;
  __CFString *v80;
  void *v81;
  char v82;
  void *v83;
  int v84;
  NSString **p_locationTrackName;
  NSString *locationTrackName;
  void *v87;
  int v88;
  NSString **p_compassTrackName;
  NSString *compassTrackName;
  __CFString *v91;
  void *v92;
  char v93;
  void *v94;
  int v95;
  void *v96;
  NSString *alsTrackName;
  __CFString *v98;
  void *v99;
  char v100;
  void *v101;
  int v102;
  NSString *wifiTrackName;
  void *v104;
  int v105;
  __CFString *v106;
  NSString *depthTOFTrackName;
  void *v108;
  char v109;
  void *v110;
  char v111;
  void *v112;
  int v113;
  void *v114;
  __CFString *v115;
  void *v116;
  __CFString *v117;
  void *v118;
  __CFString *v119;
  id *p_jasperDepthPCStreamID;
  NSString *jasperDepthPCStreamID;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t m;
  void *v128;
  void *v129;
  CVAJasperDepthFrameProcessor *v130;
  uint64_t v131;
  void *v132;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id obj;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  MOVReaderInterface *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  objc_super v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _QWORD v175[20];

  v175[18] = *MEMORY[0x24BDAC8D0];
  v170.receiver = self;
  v170.super_class = (Class)MOVReaderInterface;
  v5 = -[MOVStreamReader initWithURL:delegate:error:](&v170, sel_initWithURL_delegate_error_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    lastError = v5->_lastError;
    v5->_lastError = 0;

    v8 = objc_opt_new();
    streamFilters = v6->_streamFilters;
    v6->_streamFilters = (NSMutableDictionary *)v8;

    -[MOVReaderInterface grabSummary](v6, "grabSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v11 = objc_claimAutoreleasedReturnValue();
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v11;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v13;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
    v15 = objc_claimAutoreleasedReturnValue();
    version = v6->_version;
    v6->_version = (NSString *)v15;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
    v17 = objc_claimAutoreleasedReturnValue();
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v17;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProductConfig"));
    v19 = objc_claimAutoreleasedReturnValue();
    productConfig = v6->_productConfig;
    v6->_productConfig = (NSString *)v19;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    productVersion = v6->_productVersion;
    v6->_productVersion = (NSString *)v21;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OSBuildVersion"));
    v23 = objc_claimAutoreleasedReturnValue();
    osVersion = v6->_osVersion;
    v6->_osVersion = (NSString *)v23;

    if (!v6->_osVersion)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mdta/com.apple.arkit.osversion"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v6->_osVersion;
      v6->_osVersion = (NSString *)v25;

    }
    v145 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("machTimeSince1970"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v6->_machTimeSince1970 = v28;

    v148 = (void *)objc_opt_new();
    v175[0] = CFSTR("com.apple.reality.kind.data.imu800");
    v175[1] = CFSTR("com.apple.reality.kind.data.accelerometer");
    v175[2] = CFSTR("com.apple.reality.kind.data.gyroscope");
    v175[3] = CFSTR("com.apple.reality.kind.data.compass");
    v175[4] = CFSTR("com.apple.reality.kind.data.als");
    v175[5] = CFSTR("com.apple.reality.kind.data.wifi");
    v175[6] = CFSTR("com.apple.reality.kind.data.zcam_tof_pc");
    v175[7] = CFSTR("com.apple.reality.kind.camera.xcam.pointcloud");
    v175[8] = CFSTR("RawAccelerometer");
    v175[9] = CFSTR("RawGyroscope");
    v175[10] = CFSTR("Compass");
    v175[11] = CFSTR("ALS");
    v175[12] = CFSTR("CVADepthTOF");
    v175[13] = CFSTR("CVAUserEvent");
    v175[14] = CFSTR("com.apple.reality.kind.data.user_event");
    v175[15] = CFSTR("CVAPRDevice");
    v175[16] = CFSTR("com.apple.reality.kind.data.devicemotion");
    v175[17] = CFSTR("Motion");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v175, 18);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReader getAllMetadataStreams](v6, "getAllMetadataStreams");
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v174, 16);
    v152 = v6;
    if (v29)
    {
      v30 = v29;
      v149 = *(_QWORD *)v167;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v167 != v149)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
          -[MOVStreamReader metadataTrackForStream:](v6, "metadataTrackForStream:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "totalSampleDataLength");
          v162 = 0u;
          v163 = 0u;
          v164 = 0u;
          v165 = 0u;
          v36 = v151;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v162, v173, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v163;
            do
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v163 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * j);
                if (objc_msgSend(v33, "hasPrefix:", v41))
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35 > 0);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v148, "setObject:forKeyedSubscript:", v32, v41);

                  goto LABEL_9;
                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v162, v173, 16);
            }
            while (v38);
          }
LABEL_9:

          v6 = v152;
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v174, 16);
      }
      while (v30);
    }
    p_spuIMUTrackName = &v6->_spuIMUTrackName;
    spuIMUTrackName = v6->_spuIMUTrackName;
    v6->_spuIMUTrackName = 0;

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.imu800"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "BOOLValue");

    if (v45)
      objc_storeStrong((id *)&v6->_spuIMUTrackName, CFSTR("com.apple.reality.kind.data.imu800"));
    +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:", 0, *p_spuIMUTrackName);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_imuLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", &unk_254A6EF88, *p_spuIMUTrackName);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_imuLocation0 = objc_msgSend(obj, "containsObject:");
    v46 = objc_opt_new();
    spuVersions = v6->_spuVersions;
    v6->_spuVersions = (NSMutableDictionary *)v46;

    if (*p_spuIMUTrackName)
    {
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v48 = obj;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v159;
        do
        {
          for (k = 0; k != v50; ++k)
          {
            if (*(_QWORD *)v159 == v51)
            {
              v53 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * k);
              if (!objc_msgSend(v53, "hasPrefix:", CFSTR("com.apple.reality.kind.data.imu800")))
                continue;
            }
            else
            {
              objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * k);
              if (!objc_msgSend(v53, "hasPrefix:", CFSTR("com.apple.reality.kind.data.imu800")))
                continue;
            }
            v157 = 0;
            +[CVAMetadataWrapper locationFromTrackName:location:](CVAMetadataWrapper, "locationFromTrackName:location:", v53, &v157);
            -[MOVStreamReader trackMetadataForMetadataStream:](v152, "trackMetadataForMetadataStream:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("com.apple.AppleCV3DMOVKit.fastPathIMUVersion"));
            v55 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)v55;
            if (v55)
              v57 = (void *)v55;
            else
              v57 = &unk_24CA41658;
            v58 = v152->_spuVersions;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v157);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v57, v59);

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
        }
        while (v50);
      }

      v6 = v152;
    }
    p_accelTrackName = &v6->_accelTrackName;
    accelTrackName = v6->_accelTrackName;
    v6->_accelTrackName = 0;

    v62 = CFSTR("com.apple.reality.kind.data.accelerometer");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.accelerometer"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "BOOLValue");

    if ((v64 & 1) != 0
      || (v62 = CFSTR("RawAccelerometer"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("RawAccelerometer")),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v66 = objc_msgSend(v65, "BOOLValue"),
          v65,
          v66))
    {
      objc_storeStrong((id *)&v6->_accelTrackName, v62);
    }
    +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", 0, *p_accelTrackName);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_accelLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", &unk_254A6EF88, *p_accelTrackName);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_accelLocation0 = objc_msgSend(obj, "containsObject:");
    p_gyroTrackName = &v6->_gyroTrackName;
    gyroTrackName = v6->_gyroTrackName;
    v6->_gyroTrackName = 0;

    v69 = CFSTR("com.apple.reality.kind.data.gyroscope");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.gyroscope"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "BOOLValue");

    if ((v71 & 1) != 0
      || (v69 = CFSTR("RawGyroscope"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("RawGyroscope")),
          v72 = (void *)objc_claimAutoreleasedReturnValue(),
          v73 = objc_msgSend(v72, "BOOLValue"),
          v72,
          v73))
    {
      objc_storeStrong((id *)&v6->_gyroTrackName, v69);
    }
    +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", 0, *p_gyroTrackName);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_gyroLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", &unk_254A6EF88, *p_gyroTrackName);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_gyroLocation0 = objc_msgSend(obj, "containsObject:");
    p_motionTrackName = &v6->_motionTrackName;
    motionTrackName = v6->_motionTrackName;
    v6->_motionTrackName = 0;

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.motion"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "BOOLValue");

    if (v77)
      objc_storeStrong((id *)&v6->_motionTrackName, CFSTR("com.apple.reality.kind.data.motion"));
    +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", 0, *p_motionTrackName);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_motionLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", &unk_254A6EF88, *p_motionTrackName);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_motionLocation0 = objc_msgSend(obj, "containsObject:");
    p_deviceMotionTrackName = &v6->_deviceMotionTrackName;
    deviceMotionTrackName = v6->_deviceMotionTrackName;
    v6->_deviceMotionTrackName = 0;

    v80 = CFSTR("com.apple.reality.kind.data.devicemotion");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.devicemotion"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "BOOLValue");

    if ((v82 & 1) != 0
      || (v80 = CFSTR("Motion"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Motion")),
          v83 = (void *)objc_claimAutoreleasedReturnValue(),
          v84 = objc_msgSend(v83, "BOOLValue"),
          v83,
          v84))
    {
      objc_storeStrong((id *)&v6->_deviceMotionTrackName, v80);
    }
    +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", 0, *p_deviceMotionTrackName);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceMotionLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", &unk_254A6EF88, *p_deviceMotionTrackName);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceMotionLocation0 = objc_msgSend(obj, "containsObject:");
    p_locationTrackName = &v6->_locationTrackName;
    locationTrackName = v6->_locationTrackName;
    v6->_locationTrackName = 0;

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Location"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "BOOLValue");

    if (v88)
      objc_storeStrong((id *)&v6->_locationTrackName, CFSTR("Location"));
    +[CVAMetadataWrapper locationTrackName:prefix:](CVAMetadataWrapper, "locationTrackName:prefix:", 0, *p_locationTrackName);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_locationLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper locationTrackName:prefix:](CVAMetadataWrapper, "locationTrackName:prefix:", &unk_254A6EF88, *p_locationTrackName);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_locationLocation0 = objc_msgSend(obj, "containsObject:");
    p_compassTrackName = &v6->_compassTrackName;
    compassTrackName = v6->_compassTrackName;
    v6->_compassTrackName = 0;

    v91 = CFSTR("com.apple.reality.kind.data.compass");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.compass"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "BOOLValue");

    if ((v93 & 1) != 0
      || (v91 = CFSTR("Compass"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Compass")),
          v94 = (void *)objc_claimAutoreleasedReturnValue(),
          v95 = objc_msgSend(v94, "BOOLValue"),
          v94,
          v95))
    {
      objc_storeStrong((id *)&v6->_compassTrackName, v91);
    }
    +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", 0, *p_compassTrackName);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_compassLocationNil = objc_msgSend(obj, "containsObject:");
    +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", &unk_254A6EF88, *p_compassTrackName);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_compassLocation0 = objc_msgSend(obj, "containsObject:", v96);
    alsTrackName = v6->_alsTrackName;
    v6->_alsTrackName = 0;

    v98 = CFSTR("com.apple.reality.kind.data.als");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.als"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "BOOLValue");

    if ((v100 & 1) != 0
      || (v98 = CFSTR("ALS"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("ALS")),
          v101 = (void *)objc_claimAutoreleasedReturnValue(),
          v102 = objc_msgSend(v101, "BOOLValue"),
          v101,
          v102))
    {
      objc_storeStrong((id *)&v6->_alsTrackName, v98);
    }
    wifiTrackName = v6->_wifiTrackName;
    v6->_wifiTrackName = 0;

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.wifi"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "BOOLValue");

    v106 = CFSTR("com.apple.reality.kind.camera.xcam.pointcloud");
    if (v105)
      objc_storeStrong((id *)&v6->_wifiTrackName, CFSTR("com.apple.reality.kind.data.wifi"));
    depthTOFTrackName = v6->_depthTOFTrackName;
    v6->_depthTOFTrackName = 0;

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.camera.xcam.pointcloud"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "BOOLValue");

    if ((v109 & 1) != 0)
      goto LABEL_62;
    v106 = CFSTR("com.apple.reality.kind.data.zcam_tof_pc");
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.zcam_tof_pc"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "BOOLValue");

    if ((v111 & 1) != 0
      || (v106 = CFSTR("CVADepthTOF"),
          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("CVADepthTOF")),
          v112 = (void *)objc_claimAutoreleasedReturnValue(),
          v113 = objc_msgSend(v112, "BOOLValue"),
          v112,
          v113))
    {
LABEL_62:
      objc_storeStrong((id *)&v6->_depthTOFTrackName, v106);
    }
    v6->_lastDepthTOFTimestamp = 0.0;
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("CVAUserEvent"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v114, "BOOLValue"))
      v115 = CFSTR("CVAUserEvent");
    else
      v115 = 0;
    objc_storeStrong((id *)&v6->_userEventTrackName, v115);

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.user_event"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "BOOLValue"))
      v117 = CFSTR("com.apple.reality.kind.data.user_event");
    else
      v117 = 0;
    objc_storeStrong((id *)&v6->_ryfTimedValueTrackName, v117);

    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("CVAPRDevice"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "BOOLValue"))
      v119 = CFSTR("CVAPRDevice");
    else
      v119 = 0;
    objc_storeStrong((id *)&v6->_prDeviceTrackName, v119);

    p_jasperDepthPCStreamID = (id *)&v6->_jasperDepthPCStreamID;
    jasperDepthPCStreamID = v6->_jasperDepthPCStreamID;
    v6->_jasperDepthPCStreamID = 0;

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    -[MOVStreamReader getAllStreams](v6, "getAllStreams");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v153, v171, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v154;
      v126 = *MEMORY[0x24BE10590];
      while (2)
      {
        for (m = 0; m != v124; ++m)
        {
          if (*(_QWORD *)v154 != v125)
            objc_enumerationMutation(v122);
          v128 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * m);
          if ((objc_msgSend(v128, "isEqualToString:", v126) & 1) != 0
            || objc_msgSend(v128, "isEqualToString:", CFSTR("JasperCamera")))
          {
            objc_storeStrong(p_jasperDepthPCStreamID, v128);
            -[MOVReaderInterface grabMovieMetadataForKey:](v152, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.jasperl.calibdata"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (v129)
            {
              v130 = -[CVAJasperDepthFrameProcessor initWithCalibrationDict:]([CVAJasperDepthFrameProcessor alloc], "initWithCalibrationDict:", v129);
              v131 = 176;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", CFSTR("Failed to read TOF calibration"), 6);
              v130 = (CVAJasperDepthFrameProcessor *)objc_claimAutoreleasedReturnValue();
              v131 = 400;
            }
            v132 = *(Class *)((char *)&v152->super.super.isa + v131);
            *(Class *)((char *)&v152->super.super.isa + v131) = (Class)v130;

            goto LABEL_86;
          }
        }
        v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v153, v171, 16);
        if (v124)
          continue;
        break;
      }
    }
LABEL_86:

    v6 = v152;
    v152->_jasperCounter = 0;
    *(_QWORD *)v152->_jasperEnabled = 0x101010101010101;
    *(_QWORD *)&v152->_jasperEnabled[8] = 0x101010101010101;

  }
  return v6;
}

- (NSNumber)depthSourceFrameRate
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  if (!self->_depthTOFTrackName)
    return (NSNumber *)&unk_24CA41658;
  -[MOVStreamReader trackMetadataForMetadataStream:](self, "trackMetadataForMetadataStream:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Framerate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = -[NSString hasPrefix:](self->_deviceString, "hasPrefix:", CFSTR("D83"));
    if (-[NSString hasPrefix:](self->_deviceString, "hasPrefix:", CFSTR("D84")) || v5)
      v4 = &unk_24CA41688;
    else
      v4 = &unk_24CA41670;
  }

  return (NSNumber *)v4;
}

- (NSNumber)depthSourceMaxPoints
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  if (!self->_depthTOFTrackName)
    return (NSNumber *)&unk_24CA41658;
  -[MOVStreamReader trackMetadataForMetadataStream:](self, "trackMetadataForMetadataStream:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxPoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = -[NSString hasPrefix:](self->_deviceString, "hasPrefix:", CFSTR("D83"));
    if (-[NSString hasPrefix:](self->_deviceString, "hasPrefix:", CFSTR("D84")) || v5)
      v4 = &unk_24CA416B8;
    else
      v4 = &unk_24CA416A0;
  }

  return (NSNumber *)v4;
}

- (void)setDepthOutputFrameRate:(id)a3
{
  NSError *lastError;
  NSNumber **p_depthOutputFrameRate;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *v13;
  id v14;

  v14 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  p_depthOutputFrameRate = &self->_depthOutputFrameRate;
  objc_storeStrong((id *)&self->_depthOutputFrameRate, a3);
  -[MOVReaderInterface depthSourceMaxPoints](self, "depthSourceMaxPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_24CA416A0);

  v9 = v14;
  if (v8)
  {
    -[MOVReaderInterface depthSourceFrameRate](self, "depthSourceFrameRate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", *p_depthOutputFrameRate) == 1)
    {
      if (objc_msgSend(v10, "isEqualToNumber:", &unk_24CA41670)
        && -[NSNumber isEqualToNumber:](*p_depthOutputFrameRate, "isEqualToNumber:", &unk_24CA41688)
        || objc_msgSend(v10, "isEqualToNumber:", &unk_24CA41688)
        && -[NSNumber isEqualToNumber:](*p_depthOutputFrameRate, "isEqualToNumber:", &unk_24CA416D0))
      {
        *(_QWORD *)&self->_jasperEnabled[1] = 0;
        *(_QWORD *)&self->_jasperEnabled[7] = 0;
        self->_jasperEnabled[0] = 1;
        self->_jasperEnabled[2] = 1;
        self->_jasperEnabled[5] = 1;
        *(_WORD *)&self->_jasperEnabled[7] = 257;
        self->_jasperEnabled[10] = 1;
        self->_jasperEnabled[13] = 1;
        self->_jasperEnabled[15] = 1;
LABEL_14:

        v9 = v14;
        goto LABEL_15;
      }
      if (objc_msgSend(v10, "isEqualToNumber:", &unk_24CA41670)
        && -[NSNumber isEqualToNumber:](*p_depthOutputFrameRate, "isEqualToNumber:", &unk_24CA416D0))
      {
        *(_QWORD *)&self->_jasperEnabled[1] = 0;
        *(_QWORD *)&self->_jasperEnabled[7] = 0;
        self->_jasperEnabled[0] = 1;
        self->_jasperEnabled[5] = 1;
        self->_jasperEnabled[10] = 1;
        self->_jasperEnabled[15] = 1;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Requested depth rate %ld is invalid"), -[NSNumber longValue](*p_depthOutputFrameRate, "longValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", v11, 7);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Requested depth rate %ld >= source rate %ld"), -[NSNumber longValue](*p_depthOutputFrameRate, "longValue"), objc_msgSend(v10, "longValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceWarningWithMessage:code:", v11, 0);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v13 = self->_lastError;
    self->_lastError = v12;

    goto LABEL_14;
  }
LABEL_15:

}

- (MOVReaderInterface)initWithFileURL:(id)a3 enforcedVideoTrackFormat:(id)a4 error:(id *)a5
{
  id v8;
  MOVReaderInterface *v9;

  objc_storeStrong((id *)&self->_enforcedVideoTrackFormat, a4);
  v8 = a3;
  v9 = -[MOVReaderInterface initWithFileURL:delegate:error:](self, "initWithFileURL:delegate:error:", v8, self, a5);

  return v9;
}

- (MOVReaderInterface)initWithFileURL:(id)a3 error:(id *)a4
{
  return -[MOVReaderInterface initWithFileURL:delegate:error:](self, "initWithFileURL:delegate:error:", a3, 0, a4);
}

- (id)grabMovieMetadataForKey:(id)a3
{
  id v4;
  NSError *lastError;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char isKindOfClass;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  MOVReaderInterface *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  -[MOVStreamReader metadataForMovie](self, "metadataForMovie");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v27 = 400;
    v28 = self;
    v9 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "identifier", v27, v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqualToString:", v12);

        if (v13)
        {
          objc_msgSend(v11, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_msgSend(v11, "value");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if ((isKindOfClass & 1) != 0)
            goto LABEL_17;
          objc_opt_class();
          v17 = objc_opt_isKindOfClass();

          if ((v17 & 1) != 0)
          {
            objc_msgSend(v11, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            v30 = 0;
            objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v18, 0, &v30, &v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v29)
            {
              v21 = (void *)MEMORY[0x24BDD1540];
              v22 = v29;
              objc_msgSend(v22, "description");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "movReaderInterfaceErrorWithMessage:code:", v23, 8);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = *(Class *)((char *)&v28->super.super.isa + v27);
              *(Class *)((char *)&v28->super.super.isa + v27) = (Class)v24;

              v16 = 0;
            }
            else
            {
              v16 = v19;
            }

            goto LABEL_17;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (id)grabMovieMetadataRawForKey:(id)a3
{
  id v4;
  NSError *lastError;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  -[MOVStreamReader metadataForMovie](self, "metadataForMovie");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v7)
  {
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = *(_QWORD *)v25;
  v10 = *MEMORY[0x24BDC0C00];
LABEL_4:
  v11 = 0;
  v23 = v8;
  while (1)
  {
    if (*(_QWORD *)v25 != v9)
      objc_enumerationMutation(v6);
    v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", v13))
      goto LABEL_6;
    objc_msgSend(v12, "dataType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", v10) & 1) != 0)
      break;

LABEL_6:
LABEL_7:
    if (v8 == ++v11)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v8)
        goto LABEL_14;
      goto LABEL_4;
    }
  }
  objc_msgSend(v12, "value");
  v15 = v9;
  v16 = v4;
  v17 = v10;
  v18 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v18;
  v10 = v17;
  v4 = v16;
  v9 = v15;
  v8 = v23;

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v12, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v21;
}

- (id)grabMovieMetadataItem:(id)a3
{
  id v4;
  NSError *lastError;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  -[MOVStreamReader metadataForMovie](self, "metadataForMovie");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)grabSummary
{
  NSError *lastError;
  void *v4;
  void *v5;
  NSString *v6;
  NSString **p_deviceString;
  NSString *deviceString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSError *v25;
  NSError *v26;
  NSString *v27;
  NSError *v28;
  NSError *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSError *v40;
  NSError *v41;
  NSString *v42;
  void *v44;

  lastError = self->_lastError;
  self->_lastError = 0;

  -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.framework.state.MOVKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.recordingEnvironment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.movieSummary"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hw.model"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  p_deviceString = &self->_deviceString;
  deviceString = self->_deviceString;
  self->_deviceString = v6;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("movKitVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "isEqualToString:", CFSTR("1.0.0")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("CFBundleIdentifier"));

        objc_msgSend(v5, "removeObjectForKey:", CFSTR("bundleID"));
      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hw.model"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceString"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("hw.model"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hw.model"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *p_deviceString;
        *p_deviceString = (NSString *)v17;

        objc_msgSend(v5, "removeObjectForKey:", CFSTR("deviceString"));
      }
    }
  }
  -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.isp.UnitInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("PlatformID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVReaderInterface deviceStringFromPlatformID:](self, "deviceStringFromPlatformID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_storeStrong((id *)&self->_deviceString, v22);

  }
  -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.isp.FirmwareVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("PlatformType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "isEqualToString:", CFSTR("SpearTooth3")))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceWarningWithMessage:code:", CFSTR("platformType is SpearTooth3; assuming device is ST3"),
      1);
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    v26 = self->_lastError;
    self->_lastError = v25;

    v27 = *p_deviceString;
    *p_deviceString = (NSString *)CFSTR("ST3");

    if (!objc_msgSend(v24, "isEqualToString:", CFSTR("SpearTooth2")))
    {
LABEL_20:
      if (*p_deviceString)
        goto LABEL_29;
      goto LABEL_24;
    }
  }
  else if (!objc_msgSend(v24, "isEqualToString:", CFSTR("SpearTooth2")))
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceWarningWithMessage:code:", CFSTR("platformType is SpearTooth2; assuming device is ST2"),
    1);
  v28 = (NSError *)objc_claimAutoreleasedReturnValue();
  v29 = self->_lastError;
  self->_lastError = v28;

  v30 = *p_deviceString;
  *p_deviceString = (NSString *)CFSTR("ST2");

  if (*p_deviceString)
    goto LABEL_29;
LABEL_24:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProductType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface mapProductToDevice:](self, "mapProductToDevice:", v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *p_deviceString;
  *p_deviceString = (NSString *)v32;

  if (!*p_deviceString)
  {
    -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.jasperl.calibdata"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("PlatformId"));
    v44 = v10;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVReaderInterface deviceStringFromPlatformID:](self, "deviceStringFromPlatformID:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *p_deviceString;
    *p_deviceString = (NSString *)v36;

    v10 = v44;
    if (!*p_deviceString)
    {
      -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.strecorder.summary"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("STRecorder Version"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceWarningWithMessage:code:", CFSTR("Metadata is missing; assuming device is ST2"),
          1);
        v40 = (NSError *)objc_claimAutoreleasedReturnValue();
        v41 = self->_lastError;
        self->_lastError = v40;

        v42 = *p_deviceString;
        *p_deviceString = (NSString *)CFSTR("ST2");

      }
      v10 = v44;
    }
  }
LABEL_29:
  objc_msgSend(v5, "setObject:forKeyedSubscript:");

  return v5;
}

- (void)addStreamFilter:(id)a3 obj:(id)a4
{
  NSMutableDictionary *streamFilters;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  streamFilters = self->_streamFilters;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](streamFilters, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamFilters, "setObject:forKeyedSubscript:", v10, v11);
    v7 = (id)v10;
  }

}

- (id)applyFlip:(id)a3 f:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("flip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (objc_msgSend(v6, "containsString:", CFSTR("H")))
  {
    objc_msgSend(v5, "imageByApplyingCGOrientation:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "containsString:", CFSTR("V")))
  {
    objc_msgSend(v7, "imageByApplyingCGOrientation:", 4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (void)addStreamFilters:(id)a3
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *lastError;
  void *v11;
  NSError *v12;
  NSError *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  SEL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  double v51;
  unint64_t v52;
  void *v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSError *v59;
  NSError *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSError *v70;
  NSError *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSError *v77;
  NSError *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  id obj;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t j;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  unsigned int v104;
  uint64_t v105;
  id v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v89 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v89);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v88, 1, &v126);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v126;
    v85 = v5;
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "localizedDescription");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Filter file can't be parsed: %@"), obj);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "movReaderInterfaceErrorWithMessage:code:", v8, 13);
      v9 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v9;

      goto LABEL_4;
    }
    v11 = v86;
    if (v86)
    {
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      obj = v86;
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
      if (!v83)
        goto LABEL_4;
      v82 = *(_QWORD *)v123;
      v104 = *MEMORY[0x24BDBF878];
      v103 = *MEMORY[0x24BDBF870];
      v101 = *MEMORY[0x24BDBF988];
      v102 = *MEMORY[0x24BDBF960];
      v100 = *MEMORY[0x24BDBF920];
      while (1)
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v123 != v82)
            objc_enumerationMutation(obj);
          v105 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          v90 = v14;
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
          if (v92)
          {
            v91 = *(_QWORD *)v119;
            do
            {
              for (j = 0; j != v92; ++j)
              {
                if (*(_QWORD *)v119 != v91)
                  objc_enumerationMutation(v90);
                v99 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
                objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("filterName"));
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                if (v98)
                {
                  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", v98);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v15)
                  {
                    v57 = (void *)MEMORY[0x24BDD1540];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Filter name not found: %@"), v98);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "movReaderInterfaceErrorWithMessage:code:", v58, 13);
                    v59 = (NSError *)objc_claimAutoreleasedReturnValue();
                    v60 = self->_lastError;
                    self->_lastError = v59;

                    v61 = (void *)MEMORY[0x24BDBCE88];
                    -[NSError localizedDescription](self->_lastError, "localizedDescription");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "exceptionWithName:reason:userInfo:", CFSTR("AppleCV3DMOVKitErrorFilterFileFailed"), v62, 0);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_exception_throw(objc_retainAutorelease(v63));
                  }
                  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("params"));
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v116 = 0u;
                  v117 = 0u;
                  v114 = 0u;
                  v115 = 0u;
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
                  if (v17)
                  {
                    v18 = *(_QWORD *)v115;
                    do
                    {
                      for (k = 0; k != v17; ++k)
                      {
                        if (*(_QWORD *)v115 != v18)
                          objc_enumerationMutation(v16);
                        v20 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * k);
                        objc_msgSend(v16, "objectForKeyedSubscript:", v20);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v15, "setValue:forKey:", v21, v20);

                      }
                      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
                    }
                    while (v17);
                  }
                  objc_msgSend(v99, "setObject:forKeyedSubscript:", v15, CFSTR("filter"));
                  -[MOVReaderInterface addStreamFilter:obj:](self, "addStreamFilter:obj:", v105, v99);

                }
                objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("filterImage"));
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                if (v97)
                {
                  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v97);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBF660], "imageWithContentsOfURL:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v23)
                  {
                    v75 = (void *)MEMORY[0x24BDD1540];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Filter image not found: %@"), v97);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "movReaderInterfaceErrorWithMessage:code:", v76, 13);
                    v77 = (NSError *)objc_claimAutoreleasedReturnValue();
                    v78 = self->_lastError;
                    self->_lastError = v77;

                    v79 = (void *)MEMORY[0x24BDBCE88];
                    -[NSError localizedDescription](self->_lastError, "localizedDescription");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "exceptionWithName:reason:userInfo:", CFSTR("AppleCV3DMOVKitErrorFilterFileFailed"), v80, 0);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_exception_throw(objc_retainAutorelease(v81));
                  }
                  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("selector"));
                  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v25 = NSSelectorFromString(v24);

                  objc_msgSend(MEMORY[0x24BDBF630], "performSelector:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "setObject:forKeyedSubscript:", v26, CFSTR("filter"));
                  -[MOVReaderInterface applyFlip:f:](self, "applyFlip:f:", v23, v99);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "setObject:forKeyedSubscript:", v27, CFSTR("background_img"));

                  -[MOVReaderInterface addStreamFilter:obj:](self, "addStreamFilter:obj:", v105, v99);
                }
                objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("filterKernel"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = v28;
                if (v28)
                {
                  v29 = (void *)MEMORY[0x24BDBCE50];
                  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("path"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "dataWithContentsOfFile:", v30);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();

                  v31 = (void *)MEMORY[0x24BDBF668];
                  objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("name"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v113 = 0;
                  objc_msgSend(v31, "kernelWithFunctionName:fromMetalLibraryData:error:", v32, v93, &v113);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = v113;

                  if (!v94 || v33)
                  {
                    v64 = (void *)MEMORY[0x24BDD1540];
                    v65 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("path"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("name"));
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "localizedDescription");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "stringWithFormat:", CFSTR("Filter Kernel failed: %@, %@, %@"), v66, v67, v68);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "movReaderInterfaceErrorWithMessage:code:", v69, 13);
                    v70 = (NSError *)objc_claimAutoreleasedReturnValue();
                    v71 = self->_lastError;
                    self->_lastError = v70;

                    v72 = (void *)MEMORY[0x24BDBCE88];
                    -[NSError localizedDescription](self->_lastError, "localizedDescription");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "exceptionWithName:reason:userInfo:", CFSTR("AppleCV3DMOVKitErrorFilterFileFailed"), v73, 0);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_exception_throw(objc_retainAutorelease(v74));
                  }
                  objc_msgSend(v99, "setObject:forKeyedSubscript:", v94, CFSTR("filter"));
                  v34 = (void *)MEMORY[0x24BDBCE30];
                  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("params"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "arrayWithArray:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  v108 = (void *)objc_opt_new();
                  v111 = 0u;
                  v112 = 0u;
                  v109 = 0u;
                  v110 = 0u;
                  v107 = v36;
                  v37 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
                  if (v37)
                  {
                    v38 = *(_QWORD *)v110;
                    do
                    {
                      for (m = 0; m != v37; ++m)
                      {
                        if (*(_QWORD *)v110 != v38)
                          objc_enumerationMutation(v107);
                        v40 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * m);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("path"));
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v41)
                          {
                            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v41);
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v42)
                            {
                              objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("dim"));
                              v43 = (void *)objc_claimAutoreleasedReturnValue();
                              v44 = objc_msgSend(v43, "longValue");

                              if (objc_msgSend(v41, "hasSuffix:", CFSTR("png")))
                              {
                                objc_msgSend(MEMORY[0x24BDBF660], "imageWithData:", v42);
                                v45 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v45 = 0;
                              }
                              if (objc_msgSend(v41, "hasSuffix:", CFSTR("sraw")))
                              {
                                objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("bpp"));
                                v46 = (void *)objc_claimAutoreleasedReturnValue();
                                v47 = objc_msgSend(v46, "intValue") == 16;

                                if (v47)
                                  v48 = v103;
                                else
                                  v48 = v104;
                                objc_msgSend(MEMORY[0x24BDBF660], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v42, v44 << v47, v48, 0, (double)v44, (double)v44);
                                v49 = objc_claimAutoreleasedReturnValue();

                                v45 = (void *)v49;
                              }
                              if (v45)
                              {
                                -[MOVReaderInterface applyFlip:f:](self, "applyFlip:f:", v45, v40);
                                v50 = (void *)objc_claimAutoreleasedReturnValue();

                                -[MOVStreamReader getOutputSizeForStream:](self, "getOutputSizeForStream:", v105);
                                v52 = (unint64_t)v51;
                                if (v44 != (unint64_t)v51)
                                {
                                  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CILanczosScaleTransform"));
                                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v53, "setValue:forKey:", v50, v102);
                                  *(float *)&v54 = (float)v52 / (float)v44;
                                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v53, "setValue:forKey:", v55, v101);

                                  objc_msgSend(v53, "setValue:forKey:", &unk_24CA41730, v100);
                                  objc_msgSend(v53, "outputImage");
                                  v56 = objc_claimAutoreleasedReturnValue();

                                  v50 = (void *)v56;
                                }
                                if (v50)
                                  objc_msgSend(v40, "setObject:forKeyedSubscript:", v50, CFSTR("img"));
                                goto LABEL_58;
                              }
                            }
                          }
                          else
                          {
                            v42 = 0;
                          }
                          v50 = 0;
LABEL_58:

                        }
                        objc_msgSend(v108, "addObject:", v40);
                      }
                      v37 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
                    }
                    while (v37);
                  }

                  objc_msgSend(v99, "setObject:forKeyedSubscript:", v108, CFSTR("params"));
                  -[MOVReaderInterface addStreamFilter:obj:](self, "addStreamFilter:obj:", v105, v99);

                  v28 = v96;
                }

              }
              v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
            }
            while (v92);
          }

        }
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
        if (!v83)
        {
LABEL_4:

          v11 = v86;
          break;
        }
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", CFSTR("Filter file is missing"), 13);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lastError;
    self->_lastError = v12;

  }
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  id v8;
  NSError *lastError;
  __CVBuffer *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  CIContext *v15;
  CIContext *filterContext;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  CIContext *v53;
  void *v54;
  CIContext *v55;
  void *v57;
  void *v58;
  id v59;
  __CVBuffer *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  MOVReaderInterface *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  v81.receiver = self;
  v81.super_class = (Class)MOVReaderInterface;
  v10 = -[MOVStreamReader copyNextFrameForStream:timestamp:error:](&v81, sel_copyNextFrameForStream_timestamp_error_, v8, a4, a5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_streamFilters, "objectForKeyedSubscript:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v59 = v8;
    v60 = v10;
    -[MOVReaderInterface filterContext](self, "filterContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v15 = (CIContext *)objc_claimAutoreleasedReturnValue();
      filterContext = self->_filterContext;
      self->_filterContext = v15;

    }
    v66 = self;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVImageBuffer:", v60);
    v70 = v17;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:");
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v58 = v12;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v19)
    {
      v20 = v19;
      v21 = CFSTR("src");
      v22 = *(_QWORD *)v78;
      v65 = *MEMORY[0x24BDBF960];
      v61 = *(_QWORD *)v78;
      v62 = v18;
      do
      {
        v23 = 0;
        v63 = v20;
        do
        {
          if (*(_QWORD *)v78 != v22)
            objc_enumerationMutation(v18);
          v29 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v23);
          objc_msgSend(v29, "objectForKeyedSubscript:", v21);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v29, "objectForKeyedSubscript:", v21);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v28, "isEqual:", &unk_24CA416E8) & 1) != 0)
              goto LABEL_19;
          }
          else
          {
            v28 = &unk_24CA416E8;

            if ((objc_msgSend(&unk_24CA416E8, "isEqual:", &unk_24CA416E8) & 1) != 0)
            {
LABEL_19:
              objc_msgSend(v70, "lastObject");
              v31 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
          }
          objc_msgSend(v70, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
          v31 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v69 = (void *)v31;
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("filter"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = v28;
            v68 = v23;
            v24 = v32;
            -[MOVReaderInterface applyFlip:f:](v66, "applyFlip:f:", v69, v29);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setValue:forKey:", v25, v65);
            objc_msgSend(v24, "outputImage");
            v26 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v27 = (void *)v26;

            objc_msgSend(v70, "addObject:", v27);
LABEL_13:

            v28 = v67;
            v23 = v68;
            goto LABEL_14;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = v28;
            v68 = v23;
            v24 = v32;
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("background_img"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "applyWithForeground:background:", v69, v25);
            v26 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = v28;
            v68 = v23;
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v69);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("mult"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("mult"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = &unk_24CA41730;
            }

            v64 = v35;
            objc_msgSend(v33, "addObject:", v35);
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("params"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            obj = v36;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v74;
              v71 = *(_QWORD *)v74;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  while (1)
                  {
                    if (*(_QWORD *)v74 != v39)
                      objc_enumerationMutation(obj);
                    v41 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      break;
                    objc_msgSend(v33, "addObject:", v41);
                    if (v38 == ++i)
                      goto LABEL_31;
                  }
                  v42 = v32;
                  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("mult"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v43)
                  {
                    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("mult"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v44 = &unk_24CA41730;
                  }

                  objc_msgSend(v41, "objectForKeyedSubscript:", v21);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v45)
                  {
                    v46 = v21;
                    objc_msgSend(v41, "objectForKeyedSubscript:", v21);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v47, "isEqual:", &unk_24CA416E8) & 1) != 0)
                      objc_msgSend(v70, "lastObject");
                    else
                      objc_msgSend(v70, "objectAtIndexedSubscript:", (int)objc_msgSend(v47, "intValue"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "addObject:", v48);
                    objc_msgSend(v33, "addObject:", v44);

                    v21 = v46;
                  }
                  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("img"));
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v49)
                  {
                    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("img"));
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "addObject:", v50);

                    objc_msgSend(v33, "addObject:", v44);
                  }

                  v32 = v42;
                  v39 = v71;
                }
LABEL_31:
                v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
              }
              while (v38);
            }
            v51 = v32;
            objc_msgSend(v69, "extent");
            objc_msgSend(v51, "applyWithExtent:roiCallback:arguments:", &unk_24CA360A0, v33);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v70, "addObject:", v52);
            v25 = v33;
            v18 = v62;
            v20 = v63;
            v22 = v61;
            v27 = v64;
            goto LABEL_13;
          }
LABEL_14:

          ++v23;
        }
        while (v23 != v20);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v20);
    }

    v53 = v66->_filterContext;
    objc_msgSend(v70, "lastObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v53;
    v10 = v60;
    -[CIContext render:toCVPixelBuffer:](v55, "render:toCVPixelBuffer:", v54, v60);

    v12 = v58;
    v8 = v59;
  }

  return v10;
}

- (id)resolvedCalibration:(int64_t *)a3
{
  NSError *lastError;
  __CFString *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  NSError *v20;
  int64_t v21;
  __CFString *v22;
  __CFString *v23;
  MOVReaderInterface *v25;
  int64_t *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  lastError = self->_lastError;
  self->_lastError = 0;

  v6 = CFSTR("mdta/com.apple.calibration");
  v7 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.0"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReader metadataForMovie](self, "metadataForMovie");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v25 = self;
    v26 = a3;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = -[__CFString isEqualToString:](v6, "isEqualToString:", v16);

        v11 |= v17;
        objc_msgSend(v15, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v8, "isEqualToString:", v18);

        v12 |= v16;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
    if ((v11 & v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceWarningWithMessage:code:", CFSTR("Location nil and 0 are both present. This is unexpected!!"), 2);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v25->_lastError;
      v25->_lastError = (NSError *)v19;

    }
    if (!v26)
    {
      if ((v11 & 1) != 0)
        goto LABEL_19;
      goto LABEL_17;
    }
    v21 = *v26;
    v7 = 0x24BDD1000;
    if (!*v26)
    {
LABEL_17:
      if ((v12 & 1) != 0)
      {
        v22 = v8;
        goto LABEL_20;
      }
LABEL_19:
      v22 = v6;
      goto LABEL_20;
    }
  }
  else
  {
    if (!a3)
      goto LABEL_19;
    v21 = *a3;
    if (!*a3)
      goto LABEL_19;
  }
  objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("%@.%ld"), v6, v21);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v23 = v22;

  return v23;
}

- (id)grabCalibration:(int64_t *)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedCalibration:](self, "resolvedCalibration:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReader metadataForMovie](self, "metadataForMovie");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CVAMetadataWrapper decodeCVACalibration:](CVAMetadataWrapper, "decodeCVACalibration:", v12);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)grabCalibration
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabCalibration_);
}

+ (BOOL)grabSWToWExtrinsics:(id *)a3 summary:(id)a4 backExtrinsics:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  id v32;
  int v33;
  BOOL v34;
  void *v35;
  void *v36;
  float32x2_t *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  simd_float4x4 v54;
  simd_float4x4 v55;

  v7 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("extrinsicsSWToW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)a3 = v11;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    *((_DWORD *)a3 + 4) = v13;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    *((_DWORD *)a3 + 8) = v15;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    *((_DWORD *)a3 + 12) = v17;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    *((_DWORD *)a3 + 1) = v19;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    *((_DWORD *)a3 + 5) = v21;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    *((_DWORD *)a3 + 9) = v23;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    *((_DWORD *)a3 + 13) = v25;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    *((_DWORD *)a3 + 2) = v27;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    *((_DWORD *)a3 + 6) = v29;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    *((_DWORD *)a3 + 10) = v31;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 11);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    *((_DWORD *)a3 + 14) = v33;
  }
  else
  {
    if (!v7
      || (objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE10598]),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BE10580]),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          v35,
          !v36))
    {
      v34 = 0;
      goto LABEL_8;
    }
    v32 = objc_retainAutorelease(v36);
    v37 = (float32x2_t *)objc_msgSend(v32, "bytes");
    v38 = *(float32x4_t *)v37[2].f32;
    v39 = *(float32x4_t *)v37[4].f32;
    v40 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32);
    v41 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
    v42 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
    v42.i32[1] = -1.0;
    v43 = *(float32x4_t *)MEMORY[0x24BDAEE00];
    v43.i32[0] = -1.0;
    v44 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(_OWORD *)v37->f32)), v42, v38.f32[0]), v40, v39.f32[0]), (float32x4_t)0, v41);
    v45 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v43, *v37, 1), v42, *(float32x2_t *)v38.f32, 1), v40, *(float32x2_t *)v39.f32, 1), (float32x4_t)0, v41);
    v46 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v43, *(float32x4_t *)v37->f32, 2), v42, v38, 2), v40, v39, 2), (float32x4_t)0, v41);
    v47 = vaddq_f32(v41, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v43, *(float32x4_t *)v37->f32, 3), v42, v38, 3), v40, v39, 3));
    v54.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v44), v45, *MEMORY[0x24BDAEE00], 1), v46, *MEMORY[0x24BDAEE00], 2), v47, *MEMORY[0x24BDAEE00], 3);
    __asm { FMOV            V2.4S, #-1.0 }
    v54.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x24BDAEE00] + 16))), _Q2, v45), v46, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16), 2), v47, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16), 3);
    v54.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, v40.f32[0]), v45, *(float32x2_t *)v40.f32, 1), v46, v40, 2), v47, v40, 3);
    v54.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, v41.f32[0]), v45, *(float32x2_t *)v41.f32, 1), v46, v41, 2), v47, v41, 3);
    v55 = __invert_f4(v54);
    *((_DWORD *)a3 + 2) = v55.columns[0].i32[2];
    *(_QWORD *)a3 = v55.columns[0].i64[0];
    *((_DWORD *)a3 + 6) = v55.columns[1].i32[2];
    *((_DWORD *)a3 + 10) = v55.columns[2].i32[2];
    *((_QWORD *)a3 + 2) = v55.columns[1].i64[0];
    *((_QWORD *)a3 + 4) = v55.columns[2].i64[0];
    *((_DWORD *)a3 + 14) = v55.columns[3].i32[2];
    *((_QWORD *)a3 + 6) = v55.columns[3].i64[0];
  }

  v34 = 1;
LABEL_8:

  return v34;
}

- (BOOL)grabSWToWExtrinsics:(id *)a3
{
  void *v5;
  void *v6;

  -[MOVReaderInterface grabSummary](self, "grabSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.isp.BackExtrinsics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[MOVReaderInterface grabSWToWExtrinsics:summary:backExtrinsics:](MOVReaderInterface, "grabSWToWExtrinsics:summary:backExtrinsics:", a3, v5, v6);

  return (char)a3;
}

+ (id)grabJasperExtrinsics:(id)a3 backExtrinsics:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  float32x2_t *v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  void *v61;
  float32x2_t *v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  void *v70;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  id v82;
  float32x4_t v83;
  _QWORD v84[8];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;
  simd_float4x4 v95;
  simd_float4x4 v96;

  v94 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("extrinsicsToJasper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    if (v9)
    {
      v10 = v9;
      v82 = v5;
      v11 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v90 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "floatValue");
          LODWORD(v85) = v16;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          LODWORD(v86) = v18;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          LODWORD(v87) = v20;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "floatValue");
          LODWORD(v88) = v22;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          DWORD1(v85) = v24;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          DWORD1(v86) = v26;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          DWORD1(v87) = v28;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 7);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "floatValue");
          DWORD1(v88) = v30;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 8);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "floatValue");
          DWORD2(v85) = v32;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "floatValue");
          DWORD2(v86) = v34;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 10);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          DWORD2(v87) = v36;

          objc_msgSend(v14, "objectAtIndexedSubscript:", 11);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          DWORD2(v88) = v38;

          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v85, 64);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
      }
      while (v10);
      v5 = v82;
    }
    goto LABEL_19;
  }
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE10590]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x24BE10580];
    objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE10580]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = *MEMORY[0x24BE10598];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE10598]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      _ZF = v44 == 0;
    else
      _ZF = 1;
    if (_ZF)
    {
      v7 = 0;
    }
    else
    {
      v7 = (void *)objc_opt_new();
      v46 = (float32x2_t *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      v47 = *(float32x4_t *)v46[2].f32;
      v48 = *(float32x4_t *)v46[4].f32;
      v50 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32);
      v49 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
      v51 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
      v51.i32[1] = -1.0;
      v52 = *(float32x4_t *)MEMORY[0x24BDAEE00];
      v52.i32[0] = -1.0;
      v74 = v52;
      v75 = v51;
      v53 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(_OWORD *)v46->f32)), v51, v47.f32[0]), v50, v48.f32[0]), (float32x4_t)0, v49);
      v54 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v52, *v46, 1), v51, *(float32x2_t *)v47.f32, 1), v50, *(float32x2_t *)v48.f32, 1), (float32x4_t)0, v49);
      v55 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v52, *(float32x4_t *)v46->f32, 2), v51, v47, 2), v50, v48, 2), (float32x4_t)0, v49);
      v56 = vaddq_f32(v49, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v52, *(float32x4_t *)v46->f32, 3), v51, v47, 3), v50, v48, 3));
      v79 = *(float32x4_t *)MEMORY[0x24BDAEE00];
      v76 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
      __asm { FMOV            V2.4S, #-1.0 }
      v80 = _Q2;
      v72 = v49;
      v73 = v50;
      v81 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v53), v54, *MEMORY[0x24BDAEE00], 1), v55, *MEMORY[0x24BDAEE00], 2), v56, *MEMORY[0x24BDAEE00], 3);
      v83 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v53, v76.f32[0]), _Q2, v54), v55, v76, 2), v56, v76, 3);
      *((_QWORD *)&v85 + 1) = v81.u32[2];
      *((_QWORD *)&v86 + 1) = v83.u32[2];
      *(_QWORD *)&v85 = v81.i64[0];
      *(_QWORD *)&v86 = v83.i64[0];
      v77 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, v50.f32[0]), v54, *(float32x2_t *)v50.f32, 1), v55, v50, 2), v56, v50, 3);
      v78 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, v49.f32[0]), v54, *(float32x2_t *)v49.f32, 1), v55, v49, 2), v56, v49, 3);
      *((_QWORD *)&v87 + 1) = v77.u32[2];
      *((_QWORD *)&v88 + 1) = v78.u32[2];
      *(_QWORD *)&v87 = v77.i64[0];
      *(_QWORD *)&v88 = v78.i64[0];
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v85, 64);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, v41);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera.1"));
      v62 = (float32x2_t *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
      v63 = *(float32x4_t *)v62[2].f32;
      v64 = *(float32x4_t *)v62[4].f32;
      v65 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v74, COERCE_FLOAT(*(_OWORD *)v62->f32)), v75, v63.f32[0]), v73, v64.f32[0]), (float32x4_t)0, v72);
      v66 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v74, *v62, 1), v75, *(float32x2_t *)v63.f32, 1), v73, *(float32x2_t *)v64.f32, 1), (float32x4_t)0, v72);
      v67 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v74, *(float32x4_t *)v62->f32, 2), v75, v63, 2), v73, v64, 2), (float32x4_t)0, v72);
      v68 = vaddq_f32(v72, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v74, *(float32x4_t *)v62->f32, 3), v75, v63, 3), v73, v64, 3));
      v95.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v65), v66, *(float32x2_t *)v79.f32, 1), v67, v79, 2), v68, v79, 3);
      v95.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v65, v76.f32[0]), v80, v66), v67, v76, 2), v68, v76, 3);
      v95.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, v73.f32[0]), v66, *(float32x2_t *)v73.f32, 1), v67, v73, 2), v68, v73, 3);
      v95.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, v72.f32[0]), v66, *(float32x2_t *)v72.f32, 1), v67, v72, 2), v68, v72, 3);
      v96 = __invert_f4(v95);
      v69 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v96.columns[0].f32[0]), v83, *(float32x2_t *)v96.columns[0].f32, 1), v77, (float32x4_t)v96.columns[0], 2), v78, (float32x4_t)v96.columns[0], 3);
      v96.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v96.columns[1].f32[0]), v83, *(float32x2_t *)v96.columns[1].f32, 1), v77, (float32x4_t)v96.columns[1], 2), v78, (float32x4_t)v96.columns[1], 3);
      v96.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v96.columns[2].f32[0]), v83, *(float32x2_t *)v96.columns[2].f32, 1), v77, (float32x4_t)v96.columns[2], 2), v78, (float32x4_t)v96.columns[2], 3);
      v84[1] = v69.u32[2];
      v84[3] = v96.columns[0].u32[2];
      v96.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v96.columns[3].f32[0]), v83, *(float32x2_t *)v96.columns[3].f32, 1), v77, (float32x4_t)v96.columns[3], 2), v78, (float32x4_t)v96.columns[3], 3);
      v84[0] = v69.i64[0];
      v84[2] = v96.columns[0].i64[0];
      v84[5] = v96.columns[1].u32[2];
      v84[7] = v96.columns[2].u32[2];
      v84[4] = v96.columns[1].i64[0];
      v84[6] = v96.columns[2].i64[0];
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v84, 64);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, v42);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera.1"));

    }
LABEL_19:

    goto LABEL_20;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

- (id)grabJasperExtrinsics
{
  void *v3;
  void *v4;
  void *v5;

  -[MOVReaderInterface grabSummary](self, "grabSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabMovieMetadataForKey:](self, "grabMovieMetadataForKey:", CFSTR("mdta/com.apple.isp.BackExtrinsics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOVReaderInterface grabJasperExtrinsics:backExtrinsics:](MOVReaderInterface, "grabJasperExtrinsics:backExtrinsics:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)grabNextStreamData:(id)a3 timeRange:(id *)a4
{
  id v6;
  NSError *lastError;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSError *v14;
  NSError *v15;
  id v16;
  id v18;

  v6 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  v18 = 0;
  -[MOVStreamReader grabNextMetadataOfStream:timeRange:error:](self, "grabNextMetadataOfStream:timeRange:error:", v6, a4, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@"), v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", v13, 9);
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    v15 = self->_lastError;
    self->_lastError = v14;

    v16 = 0;
  }
  else
  {
    v16 = v8;
  }

  return v16;
}

- (id)grabNextFastPathData:(id)a3
{
  return -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a3, 0);
}

- (id)resolvedIMUStreamName:(int64_t *)a3 metadataID:(id)a4
{
  return +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:");
}

- (id)grabNextFastPathControlData:(id)a3
{
  return -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a3, 0);
}

- (id)grabNextFastPathMUData:(int64_t *)a3 metadataID:(id)a4
{
  void *v5;
  void *v6;

  -[MOVReaderInterface resolvedIMUStreamName:metadataID:](self, "resolvedIMUStreamName:metadataID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)grabNextFastPathMUData:(int64_t *)a3
{
  void *v4;
  void *v5;

  -[MOVReaderInterface resolvedSpuIMUStreamName:](self, "resolvedSpuIMUStreamName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)grabNextSpuIMUData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextSpuIMUData_location_);
}

- (id)resolvedSpuIMUStreamName:(int64_t *)a3
{
  return -[MOVReaderInterface resolvedIMUStreamName:metadataID:](self, "resolvedIMUStreamName:metadataID:", a3, self->_spuIMUTrackName);
}

- (id)grabNextSpuIMUData:(id *)a3 location:(int64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  CVASpuFastPathComboAxisData *v20;
  CVASpuFastPathComboAxisData *v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedSpuIMUStreamName:](self, "resolvedSpuIMUStreamName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v10 = *a4;
  else
    v10 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_spuVersions, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    if (v13)
    {
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v20 = [CVASpuFastPathComboAxisData alloc];
          v21 = -[CVASpuFastPathComboAxisData initWithFastPathIMUData:](v20, "initWithFastPathIMUData:", v19, (_QWORD)v25);
          if (v21)
            objc_msgSend(v9, "addObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }
    else
    {
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          +[CVAMetadataWrapper decodeIMU:](CVAMetadataWrapper, "decodeIMU:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v9, "addObject:", v23);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }
  }

  return v9;
}

- (id)grabNextRawAccelData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawAccelData_location_);
}

- (id)grabNextRawAccelData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawAccelData_location_);
}

- (id)resolvedAccelStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_accelLocationNil)
      a3 = 0;
  }
  else if (self->_accelLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", a3, self->_accelTrackName);
}

- (id)grabNextRawAccelData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedAccelStreamName:](self, "resolvedAccelStreamName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeAccel:](CVAMetadataWrapper, "decodeAccel:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawGyroData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawGyroData_location_);
}

- (id)grabNextRawGyroData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawGyroData_location_);
}

- (id)resolvedGyroStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_gyroLocationNil)
      a3 = 0;
  }
  else if (self->_gyroLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", a3, self->_gyroTrackName);
}

- (id)grabNextRawGyroData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedGyroStreamName:](self, "resolvedGyroStreamName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeGyro:](CVAMetadataWrapper, "decodeGyro:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextMotionData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextMotionData_location_);
}

- (id)grabNextMotionData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextMotionData_location_);
}

- (id)resolvedMotionStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_motionLocationNil)
      a3 = 0;
  }
  else if (self->_motionLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", a3, self->_motionTrackName);
}

- (id)grabNextMotionData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedMotionStreamName:](self, "resolvedMotionStreamName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeMotion:](CVAMetadataWrapper, "decodeMotion:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawCompassData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawCompassData_);
}

- (id)grabNextRawCompassData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawCompassData_location_);
}

- (id)resolvedCompassStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_compassLocationNil)
      a3 = 0;
  }
  else if (self->_compassLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", a3, self->_compassTrackName);
}

- (id)grabNextRawCompassData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedCompassStreamName:](self, "resolvedCompassStreamName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeCompass:](CVAMetadataWrapper, "decodeCompass:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawALSData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawALSData_location_);
}

- (id)grabNextRawALSData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[CVAMetadataWrapper alsTrackName:prefix:](CVAMetadataWrapper, "alsTrackName:prefix:", a4, self->_alsTrackName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeALS:](CVAMetadataWrapper, "decodeALS:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawWiFiData:(int64_t *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextRawWiFiData_location_);
}

- (id)grabNextRawWiFiData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[CVAMetadataWrapper wifiTrackName:prefix:](CVAMetadataWrapper, "wifiTrackName:prefix:", a4, self->_wifiTrackName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeWiFi:](CVAMetadataWrapper, "decodeWiFi:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextDeviceMotionData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDeviceMotionData_location_);
}

- (id)grabNextDeviceMotionData:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDeviceMotionData_location_);
}

- (id)resolvedDeviceMotionStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_deviceMotionLocationNil)
      a3 = 0;
  }
  else if (self->_deviceMotionLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", a3, self->_deviceMotionTrackName);
}

- (id)grabNextDeviceMotionData:(id *)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedDeviceMotionStreamName:](self, "resolvedDeviceMotionStreamName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[CVAMetadataWrapper decodeDeviceMotion:](CVAMetadataWrapper, "decodeDeviceMotion:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextCLLocation
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextCLLocation_location_timestamps_);
}

- (id)grabNextCLLocation:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextCLLocation_location_timestamps_);
}

- (id)resolvedLocationStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_locationLocationNil)
      a3 = 0;
  }
  else if (self->_locationLocation0)
  {
    a3 = (int64_t *)&unk_254A6EF88;
  }
  return +[CVAMetadataWrapper locationTrackName:prefix:](CVAMetadataWrapper, "locationTrackName:prefix:", a3, self->_locationTrackName);
}

- (id)grabNextCLLocation:(id *)a3 location:(int64_t *)a4 timestamps:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedLocationStreamName:](self, "resolvedLocationStreamName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v27 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0.0;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = v9;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          +[CVAMetadataWrapper decodeCLLocation:timestamp:](CVAMetadataWrapper, "decodeCLLocation:timestamp:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), &v36);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v10, "addObject:", v17);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v14);
    }

    v19 = objc_retainAutorelease(v11);
    v9 = v26;
    *a5 = v19;
    v8 = v27;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v9;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v19);
          +[CVAMetadataWrapper decodeCLLocation:](CVAMetadataWrapper, "decodeCLLocation:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v10, "addObject:", v25);

        }
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v22);
    }
  }

  return v10;
}

- (id)grabNextCMDeviceMotion
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextCMDeviceMotion_);
}

- (id)grabNextCMDeviceMotion:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface resolvedDeviceMotionStreamName:](self, "resolvedDeviceMotionStreamName:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[CVAMetadataWrapper decodeCMDeviceMotion:](CVAMetadataWrapper, "decodeCMDeviceMotion:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)grabNextCMData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextCMData_);
}

- (id)grabNextCMData:(id *)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", CFSTR("CMData"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CVAMetadataWrapper decodeCMData:](CVAMetadataWrapper, "decodeCMData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextUserEvent
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextUserEvent_);
}

- (id)grabNextUserEvent:(id *)a3
{
  NSString *userEventTrackName;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  userEventTrackName = self->_userEventTrackName;
  if (userEventTrackName)
  {
    -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", userEventTrackName, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          +[CVAMetadataWrapper decodeCVAUserEvent:](CVAMetadataWrapper, "decodeCVAUserEvent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)grabNextTimedValue
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextTimedValue_);
}

- (id)grabNextTimedValue:(id *)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", CFSTR("CVATimedValue"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CVAMetadataWrapper decodeCVATimedValue:](CVAMetadataWrapper, "decodeCVATimedValue:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextPRDevice
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextPRDevice_);
}

- (id)grabNextPRDevice:(id *)a3
{
  NSString *prDeviceTrackName;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  prDeviceTrackName = self->_prDeviceTrackName;
  if (prDeviceTrackName)
  {
    -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", prDeviceTrackName, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          +[CVAMetadataWrapper decodePRDevice:](CVAMetadataWrapper, "decodePRDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)grabNextFeatureBuffer
{
  void *v3;
  void *v4;

  +[CVAFeatureBuffer streamName:](CVAFeatureBuffer, "streamName:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextFeatureBuffer:streamName:](self, "grabNextFeatureBuffer:streamName:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)grabNextFeatureBuffer:(id)a3
{
  return -[MOVReaderInterface grabNextFeatureBuffer:streamName:](self, "grabNextFeatureBuffer:streamName:", 0, a3);
}

- (id)grabNextFeatureBuffer:(id *)a3 streamName:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        +[CVAMetadataWrapper decodeCVAFeatureBuffer:](CVAMetadataWrapper, "decodeCVAFeatureBuffer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)grabNextDepthTOF
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDepthTOF_sampleDropped_);
}

- (id)grabNextDepthTOF:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDepthTOF_sampleDropped_);
}

- (id)grabNextDepthTOF:(id *)a3 sampleDropped:(BOOL *)a4
{
  void *v6;
  NSError *lastError;
  __CVBuffer *v8;
  id v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *v13;
  id v14;
  __CFString *depthTOFTrackName;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSError *v26;
  NSError *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSError *v35;
  NSError *v36;
  int v37;
  int v38;
  BOOL v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  const __CFDictionary *v45;
  const __CFDictionary *v46;
  double Seconds;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  CVADepthTOF *v53;
  uint64_t jasperCounter;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  char *v65;
  NSString *osVersion;
  uint64_t v67;
  id v68;
  id v70;
  int v71;
  int v72;
  int v73;
  __CFString *v74;
  void *v75;
  BOOL *v76;
  BOOL *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CMTime time;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_new();
  if (a4)
    *a4 = 0;
  lastError = self->_lastError;
  self->_lastError = 0;

  if (self->_jasperDepthPCStreamID)
  {
    if (!self->_jdfp)
      goto LABEL_35;
    v90 = 0;
    v91 = 0;
    v92 = 0;
    v89 = 0;
    v8 = -[MOVReaderInterface copyNextFrameForStream:timestamp:error:](self, "copyNextFrameForStream:timestamp:error:");
    v9 = 0;
    if (v9)
    {
      v10 = v9;
      CVPixelBufferRelease(v8);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), self->_jasperDepthPCStreamID, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", v11, 10);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      v13 = self->_lastError;
      self->_lastError = v12;

      v14 = v6;
      goto LABEL_57;
    }
    CVBufferGetAttachments(v8, kCVAttachmentMode_ShouldPropagate);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
LABEL_35:
      v55 = v6;
      goto LABEL_57;
    }
    v44 = v43;
    objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x24BE63510]);
    v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      v70 = v6;

      goto LABEL_57;
    }
    v46 = v45;
    v75 = v6;
    v77 = a4;
    CMTimeMakeFromDictionary(&time, v45);
    Seconds = CMTimeGetSeconds(&time);
    -[CVAJasperDepthFrameProcessor process:](self->_jdfp, "process:", v8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x24BE10E38];
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE10E38]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50
      || (objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE10810]),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v51, "objectForKeyedSubscript:", v49),
          v50 = (void *)objc_claimAutoreleasedReturnValue(),
          v51,
          v50))
    {
      v52 = objc_msgSend(v50, "integerValue");

    }
    else
    {
      v52 = 0;
    }
    v53 = -[CVADepthTOF initWithJasperDepth:timestamp:projectorMode:]([CVADepthTOF alloc], "initWithJasperDepth:timestamp:projectorMode:", v48, v52, Seconds);
    CVPixelBufferRelease(v8);
    jasperCounter = self->_jasperCounter;
    if (self->_jasperEnabled[jasperCounter])
    {
      objc_msgSend(v6, "addObject:", v53);
      LODWORD(jasperCounter) = self->_jasperCounter;
    }
    else if (v77)
    {
      *v77 = 1;
    }
    v71 = jasperCounter + 1;
    v39 = -v71 < 0;
    v72 = -v71 & 0xF;
    v73 = v71 & 0xF;
    if (!v39)
      v73 = -v72;
    self->_jasperCounter = v73;

    v18 = 0;
  }
  else
  {
    v75 = v6;
    depthTOFTrackName = (__CFString *)self->_depthTOFTrackName;
    if (!depthTOFTrackName)
      depthTOFTrackName = CFSTR("com.apple.reality.kind.camera.xcam.pointcloud");
    v74 = depthTOFTrackName;
    -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:");
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    if (v16)
    {
      v17 = v16;
      v76 = a4;
      v18 = 0;
      v19 = *(_QWORD *)v85;
      do
      {
        v20 = 0;
        v21 = v18;
        do
        {
          while (1)
          {
            if (*(_QWORD *)v85 != v19)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v20);
            v83 = v21;
            objc_msgSend(v22, "decompressedDataUsingAlgorithm:error:", 1, &v83);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v83;

            if (!v18)
              break;
            v24 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v18, "description");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "movReaderInterfaceErrorWithMessage:code:", v25, 11);
            v26 = (NSError *)objc_claimAutoreleasedReturnValue();
            v27 = self->_lastError;
            self->_lastError = v26;

            ++v20;
            v21 = v18;
            if (v17 == v20)
              goto LABEL_11;
          }
          +[CVAMetadataWrapper decodeCVADepthTOF:](CVAMetadataWrapper, "decodeCVADepthTOF:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (self->_jasperEnabled[self->_jasperCounter])
          {
            objc_msgSend(v28, "timestamp");
            if (v30 <= self->_lastDepthTOFTimestamp)
            {
              v32 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v29, "timestamp");
              objc_msgSend(v32, "stringWithFormat:", CFSTR("TOF timestamp is old %lf : %lf"), v33, *(_QWORD *)&self->_lastDepthTOFTimestamp);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", v34, 0);
              v35 = (NSError *)objc_claimAutoreleasedReturnValue();
              v36 = self->_lastError;
              self->_lastError = v35;

            }
            else
            {
              objc_msgSend(v6, "addObject:", v29);
              objc_msgSend(v29, "timestamp");
              self->_lastDepthTOFTimestamp = v31;
            }
          }
          else if (v76)
          {
            *v76 = 1;
          }
          v37 = self->_jasperCounter + 1;
          v38 = v37 & 0xF;
          v40 = -v37;
          v39 = v40 < 0;
          v41 = v40 & 0xF;
          if (v39)
            v42 = v38;
          else
            v42 = -v41;
          self->_jasperCounter = v42;

          ++v20;
          v21 = 0;
        }
        while (v17 != v20);
LABEL_11:
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v56 = v75;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v80 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (!objc_msgSend(v61, "projectorMode"))
        {
          objc_msgSend(v61, "pointCloud");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            objc_msgSend(v61, "pointCloud");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = *(unsigned __int8 *)objc_msgSend(v63, "bankIds");

            if (self->_jdfp)
            {
              v65 = (char *)&unk_210652E08 + 8 * v64;
            }
            else
            {
              osVersion = self->_osVersion;
              if (osVersion)
              {
                v67 = -[NSString compare:](osVersion, "compare:", CFSTR("18A253"));
                v65 = (char *)&unk_210652E28 + 8 * v64;
                if (v67 == -1)
                  v65 = (char *)&unk_210652E08 + 8 * v64;
              }
              else
              {
                v65 = (char *)&unk_210652E28 + 8 * v64;
                if (self->_machTimeSince1970 < 1584430000.0)
                  v65 = (char *)&unk_210652E08 + 8 * v64;
              }
            }
            objc_msgSend(v61, "setProjectorMode:", *(_QWORD *)v65);
          }
        }
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v58);
  }

  v68 = v56;
  v6 = v75;
LABEL_57:

  return v6;
}

- (id)grabNextDepthIR
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDepthIR_);
}

- (id)grabNextDepthIR:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDepthIR_timeRange_);
}

- (id)grabNextDepthIR:(id)a3 timeRange:(id *)a4
{
  id v5;
  void *v6;
  NSError *lastError;
  __CVBuffer *v8;
  id v9;
  void *v10;
  NSError *v11;
  NSError *v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  CVADepthIR *v17;
  id v18;
  id v19;
  id v20;
  CMTime time;
  id v23;
  _QWORD v24[3];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  lastError = self->_lastError;
  self->_lastError = 0;

  memset(v24, 0, sizeof(v24));
  v23 = 0;
  v8 = -[MOVReaderInterface copyNextFrameForStream:timestamp:error:](self, "copyNextFrameForStream:timestamp:error:", v5, v24, &v23);
  v9 = v23;
  if (v9)
  {
    CVPixelBufferRelease(v8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "movReaderInterfaceErrorWithMessage:code:", v10, 10);
    v11 = (NSError *)objc_claimAutoreleasedReturnValue();
    v12 = self->_lastError;
    self->_lastError = v11;

    v13 = v6;
  }
  else
  {
    CVBufferGetAttachments(v8, kCVAttachmentMode_ShouldPropagate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE63510]);
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        CMTimeMakeFromDictionary(&time, v15);
        v17 = -[CVADepthIR initWithPixelBufferRef:timestamp:]([CVADepthIR alloc], "initWithPixelBufferRef:timestamp:", v8, CMTimeGetSeconds(&time));
        CVPixelBufferRelease(v8);
        objc_msgSend(v6, "addObject:", v17);
        v18 = v6;

      }
      else
      {
        CVPixelBufferRelease(v8);
        v20 = v6;
      }

    }
    else
    {
      CVPixelBufferRelease(v8);
      v19 = v6;
    }
  }

  return v6;
}

- (id)grabNextCVACameraCalibrationData
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextCVACameraCalibrationData_);
}

- (id)grabNextCVACameraCalibrationData:(id *)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", CFSTR("CVACameraCalibration"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CVAMetadataWrapper decodeCVACameraCalibrationData:](CVAMetadataWrapper, "decodeCVACameraCalibrationData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextDictionary:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextDictionary_timeRange_);
}

- (id)grabNextDictionary:(id)a3 timeRange:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = 0x24CA35000uLL;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(v10 + 2592), "decodeDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v6;
              v22 = 0u;
              v23 = 0u;
              v20 = 0u;
              v21 = 0u;
              v14 = v12;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v21;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v21 != v17)
                      objc_enumerationMutation(v14);
                    objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                }
                while (v16);
              }

              v6 = v13;
              v10 = 0x24CA35000;
            }
          }
        }

        ++v11;
      }
      while (v11 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)grabNextClass:(id)a3 class:(Class)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_grabNextClass_class_timeRange_);
}

- (id)grabNextClass:(id)a3 class:(Class)a4 timeRange:(id *)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[CVAMetadataWrapper decodeClass:class:](CVAMetadataWrapper, "decodeClass:class:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  Class v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v12 = a4;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextNSCoderObject:classes:timeRange:](self, "grabNextNSCoderObject:classes:timeRange:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4 timeRange:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  Class v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v14 = a4;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v10, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVReaderInterface grabNextNSCoderObject:classes:timeRange:](self, "grabNextNSCoderObject:classes:timeRange:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4
{
  return -[MOVReaderInterface grabNextNSCoderObject:classes:timeRange:](self, "grabNextNSCoderObject:classes:timeRange:", a3, a4, 0);
}

- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4 timeRange:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v8, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)mapProductToDevice:(id)a3
{
  return (id)objc_msgSend(&unk_24CA41A60, "objectForKeyedSubscript:", a3);
}

+ (BOOL)isSuperWideStream:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v7;

  v3 = *MEMORY[0x24BDB1A50];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInSuperWideAngleCamera")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("BackColorSuperWide")) & 1) != 0)
  {

    return 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE10598]);

    return v7;
  }
}

- (unsigned)reader:(id)a3 pixelFormatForStream:(id)a4 suggestedFormat:(unsigned int)a5
{
  NSDictionary *enforcedVideoTrackFormat;
  void *v7;
  void *v8;

  enforcedVideoTrackFormat = self->_enforcedVideoTrackFormat;
  if (enforcedVideoTrackFormat)
  {
    -[NSDictionary objectForKeyedSubscript:](enforcedVideoTrackFormat, "objectForKeyedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      a5 = objc_msgSend(v7, "unsignedIntValue");

  }
  return a5;
}

+ (id)grabCMSessionID:(id)a3
{
  id v3;
  void *v4;
  MOVReaderInterface *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  v26 = 0;
  v5 = -[MOVReaderInterface initWithFileURL:delegate:error:]([MOVReaderInterface alloc], "initWithFileURL:delegate:error:", v3, 0, &v26);
  v6 = v26;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "movReaderInterfaceErrorWithMessage:code:", v9, 12);
    v11 = 0;
  }
  else
  {
    -[MOVReaderInterface grabNextUserEvent](v5, "grabNextUserEvent");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v11 = 0;
      goto LABEL_4;
    }
    v9 = (void *)v13;
    v11 = 0;
    do
    {
      if (!objc_msgSend(v9, "count"))
        break;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v21, "eventType") == 7)
            {
              objc_msgSend(v21, "sessionID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "copy");

              v11 = (void *)v15;
              goto LABEL_8;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v18);
      }
LABEL_8:

      -[MOVReaderInterface grabNextUserEvent](v5, "grabNextUserEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v9);
  }

LABEL_4:
  objc_autoreleasePoolPop(v4);

  return v11;
}

- (NSDictionary)enforcedVideoTrackFormat
{
  return self->_enforcedVideoTrackFormat;
}

- (void)setEnforcedVideoTrackFormat:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedVideoTrackFormat, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceString
{
  return self->_deviceString;
}

- (void)setDeviceString:(id)a3
{
  objc_storeStrong((id *)&self->_deviceString, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)productConfig
{
  return self->_productConfig;
}

- (void)setProductConfig:(id)a3
{
  objc_storeStrong((id *)&self->_productConfig, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)spuIMUTrackName
{
  return self->_spuIMUTrackName;
}

- (void)setSpuIMUTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_spuIMUTrackName, a3);
}

- (NSString)accelTrackName
{
  return self->_accelTrackName;
}

- (void)setAccelTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_accelTrackName, a3);
}

- (NSString)gyroTrackName
{
  return self->_gyroTrackName;
}

- (void)setGyroTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_gyroTrackName, a3);
}

- (NSString)motionTrackName
{
  return self->_motionTrackName;
}

- (void)setMotionTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_motionTrackName, a3);
}

- (NSString)deviceMotionTrackName
{
  return self->_deviceMotionTrackName;
}

- (void)setDeviceMotionTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMotionTrackName, a3);
}

- (NSString)locationTrackName
{
  return self->_locationTrackName;
}

- (void)setLocationTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_locationTrackName, a3);
}

- (NSString)alsTrackName
{
  return self->_alsTrackName;
}

- (void)setAlsTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_alsTrackName, a3);
}

- (NSString)wifiTrackName
{
  return self->_wifiTrackName;
}

- (void)setWifiTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_wifiTrackName, a3);
}

- (NSString)compassTrackName
{
  return self->_compassTrackName;
}

- (void)setCompassTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_compassTrackName, a3);
}

- (NSString)depthTOFTrackName
{
  return self->_depthTOFTrackName;
}

- (void)setDepthTOFTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_depthTOFTrackName, a3);
}

- (NSString)userEventTrackName
{
  return self->_userEventTrackName;
}

- (void)setUserEventTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_userEventTrackName, a3);
}

- (NSString)ryfTimedValueTrackName
{
  return self->_ryfTimedValueTrackName;
}

- (void)setRyfTimedValueTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_ryfTimedValueTrackName, a3);
}

- (NSString)prDeviceTrackName
{
  return self->_prDeviceTrackName;
}

- (void)setPrDeviceTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_prDeviceTrackName, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (NSNumber)depthOutputFrameRate
{
  return self->_depthOutputFrameRate;
}

- (NSMutableDictionary)streamFilters
{
  return self->_streamFilters;
}

- (void)setStreamFilters:(id)a3
{
  objc_storeStrong((id *)&self->_streamFilters, a3);
}

- (CIContext)filterContext
{
  return self->_filterContext;
}

- (void)setFilterContext:(id)a3
{
  objc_storeStrong((id *)&self->_filterContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterContext, 0);
  objc_storeStrong((id *)&self->_streamFilters, 0);
  objc_storeStrong((id *)&self->_depthOutputFrameRate, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_prDeviceTrackName, 0);
  objc_storeStrong((id *)&self->_ryfTimedValueTrackName, 0);
  objc_storeStrong((id *)&self->_userEventTrackName, 0);
  objc_storeStrong((id *)&self->_depthTOFTrackName, 0);
  objc_storeStrong((id *)&self->_compassTrackName, 0);
  objc_storeStrong((id *)&self->_wifiTrackName, 0);
  objc_storeStrong((id *)&self->_alsTrackName, 0);
  objc_storeStrong((id *)&self->_locationTrackName, 0);
  objc_storeStrong((id *)&self->_deviceMotionTrackName, 0);
  objc_storeStrong((id *)&self->_motionTrackName, 0);
  objc_storeStrong((id *)&self->_gyroTrackName, 0);
  objc_storeStrong((id *)&self->_accelTrackName, 0);
  objc_storeStrong((id *)&self->_spuIMUTrackName, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productConfig, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_enforcedVideoTrackFormat, 0);
  objc_storeStrong((id *)&self->_spuVersions, 0);
  objc_storeStrong((id *)&self->_jasperDepthPCStreamID, 0);
  objc_storeStrong((id *)&self->_jdfp, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
}

@end
