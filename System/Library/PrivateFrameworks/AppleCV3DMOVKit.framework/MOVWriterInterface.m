@implementation MOVWriterInterface

- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5 callbackQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v57;
  objc_super v58;
  utsname v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = a3;
  NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - initWithFileURL"));
  v58.receiver = self;
  v58.super_class = (Class)MOVWriterInterface;
  v14 = -[MOVStreamWriter initWithURL:andExpectedFrameRate:](&v58, sel_initWithURL_andExpectedFrameRate_, v13, a4);

  if (v14)
  {
    objc_msgSend(v14, "setDelegate:callbackQueue:", v14, v12);
    v14[576] = 0;
    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v14 + 70);
    *((_QWORD *)v14 + 70) = v15;

    v17 = (void *)*((_QWORD *)v14 + 71);
    *((_QWORD *)v14 + 71) = 0;

    v18 = objc_opt_new();
    v19 = (void *)*((_QWORD *)v14 + 79);
    *((_QWORD *)v14 + 79) = v18;

    v20 = objc_opt_new();
    v21 = (void *)*((_QWORD *)v14 + 74);
    *((_QWORD *)v14 + 74) = v20;

    v22 = objc_opt_new();
    v23 = (void *)*((_QWORD *)v14 + 75);
    *((_QWORD *)v14 + 75) = v22;

    v24 = objc_opt_new();
    v25 = (void *)*((_QWORD *)v14 + 76);
    *((_QWORD *)v14 + 76) = v24;

    v26 = objc_opt_new();
    v27 = (void *)*((_QWORD *)v14 + 77);
    *((_QWORD *)v14 + 77) = v26;

    v28 = objc_opt_new();
    v29 = (void *)*((_QWORD *)v14 + 105);
    *((_QWORD *)v14 + 105) = v28;

    v30 = objc_opt_new();
    v31 = (void *)*((_QWORD *)v14 + 73);
    *((_QWORD *)v14 + 73) = v30;

    v32 = objc_opt_new();
    v33 = (void *)*((_QWORD *)v14 + 109);
    *((_QWORD *)v14 + 109) = v32;

    v34 = objc_opt_new();
    v35 = (void *)*((_QWORD *)v14 + 78);
    *((_QWORD *)v14 + 78) = v34;

    v36 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v14 + 648) = *MEMORY[0x24BDC0D40];
    *((_QWORD *)v14 + 83) = *(_QWORD *)(v36 + 16);
    *((_QWORD *)v14 + 107) = 0;
    v14[577] = 0;
    objc_storeStrong((id *)v14 + 95, CFSTR("com.apple.reality.kind.data.imu800"));
    objc_storeStrong((id *)v14 + 96, CFSTR("com.apple.reality.kind.data.accelerometer"));
    objc_storeStrong((id *)v14 + 97, CFSTR("com.apple.reality.kind.data.gyroscope"));
    objc_storeStrong((id *)v14 + 98, CFSTR("com.apple.reality.kind.data.motion"));
    objc_storeStrong((id *)v14 + 99, CFSTR("com.apple.reality.kind.data.devicemotion"));
    objc_storeStrong((id *)v14 + 100, CFSTR("Location"));
    objc_storeStrong((id *)v14 + 101, CFSTR("com.apple.reality.kind.data.als"));
    objc_storeStrong((id *)v14 + 102, CFSTR("com.apple.reality.kind.data.wifi"));
    objc_storeStrong((id *)v14 + 103, CFSTR("com.apple.reality.kind.data.compass"));
    objc_storeStrong((id *)v14 + 104, CFSTR("com.apple.reality.kind.data.zcam_tof_pc"));
    memset(&v59, 0, 512);
    uname(&v59);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v59.machine);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v14 + 90);
    *((_QWORD *)v14 + 90) = v37;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "infoDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKey:", CFSTR("CFBundleVersion"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)*((_QWORD *)v14 + 88);
    *((_QWORD *)v14 + 88) = v41;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bundleIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)v14 + 87);
    *((_QWORD *)v14 + 87) = v44;

    v57 = 0uLL;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      objc_msgSend(v46, "operatingSystemVersion");
    else
      v57 = 0uLL;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu.%lu.%lu"), v57, 0);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)*((_QWORD *)v14 + 93);
    *((_QWORD *)v14 + 93) = v48;

    v50 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dictionaryWithContentsOfURL:error:", v51, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@)"), *((_QWORD *)v14 + 93), v53);
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)*((_QWORD *)v14 + 93);
      *((_QWORD *)v14 + 93) = v54;

    }
    objc_storeStrong((id *)v14 + 80, a5);

  }
  return (MOVWriterInterface *)v14;
}

- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5
{
  id v8;
  id v9;
  dispatch_queue_t v10;
  MOVWriterInterface *v11;

  v8 = a5;
  v9 = a3;
  v10 = dispatch_queue_create("com.apple.vio.movwriterinterface.recordercallback", 0);
  v11 = -[MOVWriterInterface initWithFileURL:expectedFrameRate:fileSummary:callbackQueue:](self, "initWithFileURL:expectedFrameRate:fileSummary:callbackQueue:", v9, v8, v10, a4);

  return v11;
}

- (void)disableLegacyTracks
{
  self->_writeLegacyTracks = 0;
}

- (void)enableLegacyTracks
{
  self->_writeLegacyTracks = 1;
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithDictionary:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadataTrackMetadata, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  v11.receiver = self;
  v11.super_class = (Class)MOVWriterInterface;
  LOBYTE(self) = -[MOVStreamWriter setTrackMetadata:forMetadataStream:](&v11, sel_setTrackMetadata_forMetadataStream_, v8, v7);

  return (char)self;
}

- (void)registerSpuIMU:(int64_t *)a3 version:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:", a3, self->_spuIMUTrackName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);
  v7 = (void *)MEMORY[0x24BDBCED8];
  v11 = CFSTR("com.apple.AppleCV3DMOVKit.fastPathIMUVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataTrackMetadata, "setObject:forKeyedSubscript:", v10, v6);

  -[MOVWriterInterface setTrackMetadata:forMetadataStream:](self, "setTrackMetadata:forMetadataStream:", 0, v6);
}

- (void)registerSpuIMU:(int64_t *)a3
{
  MEMORY[0x24BEDD108](self, sel_registerSpuIMU_version_);
}

- (void)registerAccelerometer:(int64_t *)a3
{
  void *v5;
  id v6;

  +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", a3, self->_accelTrackName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v5);

  if (self->_writeLegacyTracks)
  {
    +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", a3, CFSTR("RawAccelerometer"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);

  }
}

- (void)registerAccelerometer
{
  MEMORY[0x24BEDD108](self, sel_registerAccelerometer_);
}

- (void)registerGyro:(int64_t *)a3
{
  void *v5;
  id v6;

  +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", a3, self->_gyroTrackName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v5);

  if (self->_writeLegacyTracks)
  {
    +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", a3, CFSTR("RawGyroscope"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);

  }
}

- (void)registerGyro
{
  MEMORY[0x24BEDD108](self, sel_registerGyro_);
}

- (void)registerMotion:(int64_t *)a3
{
  id v4;

  +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", a3, self->_motionTrackName);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v4);

}

- (void)registerMotion
{
  MEMORY[0x24BEDD108](self, sel_registerMotion_);
}

- (void)registerDeviceMotion:(int64_t *)a3
{
  id v4;

  +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", a3, self->_deviceMotionTrackName);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v4);

}

- (void)registerDeviceMotion
{
  MEMORY[0x24BEDD108](self, sel_registerDeviceMotion_);
}

- (void)registerLocation:(int64_t *)a3
{
  id v4;

  +[CVAMetadataWrapper locationTrackName:prefix:](CVAMetadataWrapper, "locationTrackName:prefix:", a3, self->_locationTrackName);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v4);

}

- (void)registerLocation
{
  MEMORY[0x24BEDD108](self, sel_registerLocation_);
}

- (void)registerCVAUserEvent
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CVAUserEvent"));
}

- (void)registerCVATimedValue
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CVATimedValue"));
}

- (void)registerALS:(int64_t *)a3
{
  void *v5;
  id v6;

  +[CVAMetadataWrapper alsTrackName:prefix:](CVAMetadataWrapper, "alsTrackName:prefix:", a3, self->_alsTrackName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v5);

  if (self->_writeLegacyTracks)
  {
    +[CVAMetadataWrapper alsTrackName:prefix:](CVAMetadataWrapper, "alsTrackName:prefix:", a3, CFSTR("ALS"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);

  }
}

- (void)registerWiFi:(int64_t *)a3
{
  id v4;

  +[CVAMetadataWrapper wifiTrackName:prefix:](CVAMetadataWrapper, "wifiTrackName:prefix:", a3, self->_wifiTrackName);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v4);

}

- (void)registerCompass:(int64_t *)a3
{
  void *v5;
  id v6;

  +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", a3, self->_compassTrackName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v5);

  if (self->_writeLegacyTracks)
  {
    +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", a3, CFSTR("Compass"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);

  }
}

- (void)registerCompass
{
  MEMORY[0x24BEDD108](self, sel_registerCompass_);
}

- (void)registerCVAFeatureBuffer
{
  id v3;

  +[CVAFeatureBuffer streamName:](CVAFeatureBuffer, "streamName:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v3);

}

- (void)registerCVAFeatureBuffer:(id)a3 compress:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cvaFeatureBufferCompression, "setObject:forKeyedSubscript:", v7, v8);

  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v8);
}

- (void)registerCVADepthTOF
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", self->_depthTOFTrackName);
  if (self->_writeLegacyTracks)
    -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CVADepthTOF"));
}

- (void)registerCVAPRDevice
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CVAPRDevice"));
}

- (void)registerCVACameraCalibrationData
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CVACameraCalibration"));
}

- (void)registerCMData
{
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", CFSTR("CMData"));
}

- (void)registerCVADepthIR
{
  MOVWriterInterfaceStreamEncodingObject *v3;
  double v4;
  double v5;
  MOVWriterInterfaceStreamEncodingObject *v6;

  v3 = [MOVWriterInterfaceStreamEncodingObject alloc];
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  v6 = -[MOVWriterInterfaceStreamEncodingObject initWithLossless:bitrate:forceH264:expectedFPS:extraConfigs:](v3, "initWithLossless:bitrate:forceH264:expectedFPS:extraConfigs:", 1, 0, 0, v4, v5);
  -[MOVWriterInterface registerStreamID:withConfigObject:](self, "registerStreamID:withConfigObject:", CFSTR("com.apple.reality.kind.data.pcam_avdepth"), v6);

}

- (void)registerMetadataID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataAttachmentArrays, "setObject:forKeyedSubscript:", v4, v5);

  -[MOVWriterInterface setupMetadata:](self, "setupMetadata:", v5);
}

- (void)registerMetadataID:(id)a3 maxBufferSize:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MOVWriterInterface registerMetadataID:](self, "registerMetadataID:", v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataMaxBufferSize, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setupMetadata:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_addMetadataTrack_);
}

- (void)addMovieMetadataDictionary:(id)a3 value:(id)a4
{
  id v6;
  NSError *lastError;
  void *v8;
  void *v9;
  NSError *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  lastError = self->_lastError;
  self->_lastError = 0;

  if ((objc_msgSend(v11, "hasPrefix:", CFSTR("mdta/")) & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setIdentifier:", v11);
    objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0BE8]);
    objc_msgSend(v8, "setValue:", v6);
    -[NSMutableArray addObject:](self->_movMetadataArray, "addObject:", v8);
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - Added metadata item with NSDictionary %@"), v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MOVKit:MOVWriterInterface - ERROR - Invalid identifer %@"), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v8, 14);
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    v9 = self->_lastError;
    self->_lastError = v10;
  }

}

- (void)addMovieMetadataData:(id)a3 rawValue:(id)a4
{
  id v6;
  NSError *lastError;
  void *v8;
  void *v9;
  NSError *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  lastError = self->_lastError;
  self->_lastError = 0;

  if ((objc_msgSend(v11, "hasPrefix:", CFSTR("mdta/")) & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setIdentifier:", v11);
    objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C00]);
    objc_msgSend(v8, "setValue:", v6);
    -[NSMutableArray addObject:](self->_movMetadataArray, "addObject:", v8);
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - Added metadata item with NSData %@"), v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MOVKit:MOVWriterInterface - ERROR - Invalid identifer %@"), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v8, 14);
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    v9 = self->_lastError;
    self->_lastError = v10;
  }

}

- (void)addMovieMetadataItem:(id)a3
{
  NSMutableArray *movMetadataArray;
  id v4;
  id v5;

  movMetadataArray = self->_movMetadataArray;
  v4 = a3;
  -[NSMutableArray addObject:](movMetadataArray, "addObject:", v4);
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - Added metadata item %@"), v5);
}

- (id)addDefaultSummary
{
  void *v3;
  void *v4;
  NSString *deviceName;
  NSString *deviceString;
  NSString *bundleID;
  NSString *version;
  NSString *serialNumber;
  NSString *osBuildVersion;
  NSString *productType;
  NSString *productConfig;
  NSString *productVersion;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_fileSummary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", deviceName, CFSTR("deviceName"));
  deviceString = self->_deviceString;
  if (deviceString)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", deviceString, CFSTR("hw.model"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", bundleID, CFSTR("CFBundleIdentifier"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", version, CFSTR("version"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", serialNumber, CFSTR("SerialNumber"));
  osBuildVersion = self->_osBuildVersion;
  if (osBuildVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", osBuildVersion, CFSTR("OSBuildVersion"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", productType, CFSTR("ProductType"));
  productConfig = self->_productConfig;
  if (productConfig)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", productConfig, CFSTR("ProductConfig"));
  productVersion = self->_productVersion;
  if (productVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", productVersion, CFSTR("ProductVersion"));
  +[CVAMetadataWrapper version](CVAMetadataWrapper, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("movKitVersion"));

  -[MOVWriterInterface addSWToWExtrinsics:](self, "addSWToWExtrinsics:", v4);
  -[MOVWriterInterface addJasperExtrinsics:](self, "addJasperExtrinsics:", v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CA41700, CFSTR("iOS"));
  return v4;
}

+ (BOOL)getSWToWExtrinsics:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v4 = *MEMORY[0x24BDB1D50];
  objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A50], *MEMORY[0x24BDB1D50], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A58], v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2460], "extrinsicMatrixFromDevice:toDevice:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
    if (v7)
    {
      v9 = v7;
      objc_msgSend(v7, "getBytes:length:", a3, 64);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addSWToWExtrinsics:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[14];

  v33[12] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (+[MOVWriterInterface getSWToWExtrinsics:](MOVWriterInterface, "getSWToWExtrinsics:", &v29))
  {
    LODWORD(v4) = v29;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    LODWORD(v5) = v30;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v27;
    LODWORD(v6) = v31;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v26;
    LODWORD(v7) = v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v25;
    LODWORD(v8) = DWORD1(v29);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v9;
    LODWORD(v10) = DWORD1(v30);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v11;
    LODWORD(v12) = DWORD1(v31);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[6] = v13;
    LODWORD(v14) = DWORD1(v32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[7] = v15;
    LODWORD(v16) = DWORD2(v29);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[8] = v17;
    LODWORD(v18) = DWORD2(v30);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[9] = v19;
    LODWORD(v20) = DWORD2(v31);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[10] = v21;
    LODWORD(v22) = DWORD2(v32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[11] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("extrinsicsSWToW"));
  }

}

- (void)addJasperExtrinsics:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[12];
  _QWORD v56[2];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A38], 0, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v31 = v3;
    v4 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v32 = *MEMORY[0x24BDB1A50];
    v5 = *MEMORY[0x24BDB1A50];
    v33 = *MEMORY[0x24BDB1A58];
    v56[0] = *MEMORY[0x24BDB1A58];
    v56[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v39)
    {
      v37 = *MEMORY[0x24BDB1D50];
      v38 = *(_QWORD *)v52;
      v35 = v4;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v52 != v38)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", v29, v37, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(MEMORY[0x24BDB2460], "extrinsicMatrixFromDevice:toDevice:", v28, v36);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v30;
            v46 = v28;
            if (v30)
            {
              objc_msgSend(v30, "getBytes:length:", &v47, 64);
            }
            else if (v29 == v33)
            {
              DWORD2(v47) = 987939115;
              *(_QWORD *)&v47 = 0x3F7FFC11BC281DC1;
              DWORD2(v48) = 965922039;
              *(_QWORD *)&v48 = 0xBC28198FBF7FFC87;
              DWORD2(v49) = 1065353048;
              *(_QWORD *)&v49 = 0xBAE1719F399BB6AALL;
              DWORD2(v50) = 1039292160;
              *(_QWORD *)&v50 = 0x406CDA9041468A09;
              if (v29 == v32)
                goto LABEL_17;
            }
            else if (v29 == v32)
            {
LABEL_17:
              DWORD2(v47) = -1150855277;
              *(_QWORD *)&v47 = 0x3F7FFE3BBBCEC41ELL;
              DWORD2(v48) = 991362741;
              *(_QWORD *)&v48 = 0xBBCEC41EBF7FFE09;
              DWORD2(v49) = 1065353065;
              *(_QWORD *)&v49 = 0x3B6842743B157CD4;
              DWORD2(v50) = 1035551109;
              *(_QWORD *)&v50 = 0xC1044D6041478794;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%ld"), v29, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v7) = v47;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = v43;
            LODWORD(v8) = v48;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v55[1] = v42;
            LODWORD(v9) = v49;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v55[2] = v41;
            LODWORD(v10) = v50;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v55[3] = v40;
            LODWORD(v11) = DWORD1(v47);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v55[4] = v12;
            LODWORD(v13) = DWORD1(v48);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v55[5] = v14;
            LODWORD(v15) = DWORD1(v49);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v55[6] = v16;
            LODWORD(v17) = DWORD1(v50);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v55[7] = v18;
            LODWORD(v19) = DWORD2(v47);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v55[8] = v20;
            LODWORD(v21) = DWORD2(v48);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v55[9] = v22;
            LODWORD(v23) = DWORD2(v49);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v55[10] = v24;
            LODWORD(v25) = DWORD2(v50);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v55[11] = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 12);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v35;
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v27, v44);

            v28 = v46;
          }

        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v39);
    }

    v3 = v31;
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v4, CFSTR("extrinsicsToJasper"));

  }
}

- (id)createFileMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_movMetadataArray);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.framework.state.MOVKit"));
  v5 = *MEMORY[0x24BDC0BE8];
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0BE8]);
  -[MOVWriterInterface addDefaultSummary](self, "addDefaultSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v6);

  objc_msgSend(v3, "addObject:", v4);
  if (self->_writeLegacyTracks)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIdentifier:", CFSTR("mdta/com.apple.recordingEnvironment"));
    objc_msgSend(v7, "setDataType:", v5);
    -[MOVWriterInterface addDefaultSummary](self, "addDefaultSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v8);

    objc_msgSend(v3, "addObject:", v7);
  }
  if (self->_calibration)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setIdentifier:", CFSTR("mdta/com.apple.calibration"));
    objc_msgSend(v9, "setDataType:", *MEMORY[0x24BDC0C00]);
    +[CVAMetadataWrapper encodeCVACalibration:](CVAMetadataWrapper, "encodeCVACalibration:", self->_calibration);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:", v10);

    objc_msgSend(v3, "addObject:", v9);
  }

  return v3;
}

- (void)registerStreamID:(id)a3 config:(id *)a4
{
  void *v6;
  _BOOL8 var0;
  void *v8;
  double v9;
  void *v10;
  _BOOL8 var2;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *firstSteamID;
  id v17;

  v17 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CA41718, qword_254A6ED50);
  if (a4)
    var0 = a4->var0;
  else
    var0 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, qword_254A6ED58);

  if (a4)
    *(float *)&v9 = a4->var1;
  else
    LODWORD(v9) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, qword_254A6ED60);

  if (a4)
    var2 = a4->var2;
  else
    var2 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", var2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, qword_254A6ED68);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CA41718, qword_254A6ED70);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, qword_254A6ED78);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackAddedByStream, "setObject:forKeyedSubscript:", v6, v17);
  v14 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameMetadataDictionary, "setObject:forKeyedSubscript:", v14, v17);

  if (!self->_firstSteamID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v17);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    firstSteamID = self->_firstSteamID;
    self->_firstSteamID = v15;

  }
}

- (void)registerStreamID:(id)a3 withConfigObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *firstSteamID;
  id v25;

  v25 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CA41718, qword_254A6ED50);
  v8 = (void *)MEMORY[0x24BDD16E0];
  if (v6)
    v9 = objc_msgSend(v6, "lossless");
  else
    v9 = 0;
  objc_msgSend(v8, "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, qword_254A6ED58);

  v12 = (void *)MEMORY[0x24BDD16E0];
  if (v6)
    objc_msgSend(v6, "bitrate");
  else
    LODWORD(v11) = 0;
  objc_msgSend(v12, "numberWithFloat:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, qword_254A6ED60);

  v14 = (void *)MEMORY[0x24BDD16E0];
  if (v6)
    v15 = objc_msgSend(v6, "forceH264");
  else
    v15 = 0;
  objc_msgSend(v14, "numberWithInt:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, qword_254A6ED68);

  v18 = (void *)MEMORY[0x24BDD16E0];
  if (v6)
  {
    objc_msgSend(v6, "expectedFPS");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, qword_254A6ED70);

    objc_msgSend(v6, "extraConfigs");
  }
  else
  {
    LODWORD(v17) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, qword_254A6ED70);

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, qword_254A6ED78);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackAddedByStream, "setObject:forKeyedSubscript:", v7, v25);
  v22 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameMetadataDictionary, "setObject:forKeyedSubscript:", v22, v25);

  if (!self->_firstSteamID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v25);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    firstSteamID = self->_firstSteamID;
    self->_firstSteamID = v23;

  }
}

- (BOOL)addCVADepthIRTrackWithDimensions:(id)a3
{
  _BOOL4 v5;
  void *v6;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  if (CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x31332E33u, a3.var0, a3.var1, 0, &formatDescriptionOut))
  {
    NSLog(CFSTR("MOVKit:MOVWriterInterface - ERROR - failed to create video format description for the depth IR data track"));
    return 0;
  }
  else
  {
    v5 = -[MOVWriterInterface addVideoTrack:streamID:encoding:](self, "addVideoTrack:streamID:encoding:", formatDescriptionOut, CFSTR("com.apple.reality.kind.data.pcam_avdepth"), 0);
    if (v5)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_trackAddedByStream, "objectForKeyedSubscript:", CFSTR("com.apple.reality.kind.data.pcam_avdepth"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], qword_254A6ED50);

    }
    CFRelease(formatDescriptionOut);
    return v5;
  }
}

- (void)addFirstBufferForStream:(id)a3 buffer:(__CVBuffer *)a4 withTimestamp:(id *)a5
{
  id v8;
  TimedBuffer *v9;
  TimedBuffer *v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v8 = a3;
  CVPixelBufferRetain(a4);
  v9 = [TimedBuffer alloc];
  v12 = *a5;
  v10 = -[TimedBuffer initWithBuffer:atTimestamp:](v9, "initWithBuffer:atTimestamp:", a4, &v12);
  -[MOVWriterInterface clearFirstBufferForStream:](self, "clearFirstBufferForStream:", v8);
  -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

}

- (__CVBuffer)getFirstBufferForStream:(id)a3 withTimestamp:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CVBuffer *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  int64_t v17;

  v6 = a3;
  -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CVBuffer *)objc_msgSend(v10, "buffer");

    -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "timestamp");
    }
    else
    {
      v16 = 0uLL;
      v17 = 0;
    }
    *(_OWORD *)&a4->var0 = v16;
    a4->var3 = v17;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)receivedAllFramesForStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)intelligentlyAppendBuffersForStreams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  Float64 Seconds;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CMTime time;
  CMTime v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keysSortedByValueUsingComparator:", &unk_24CA360E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 == v10)
        {
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!objc_msgSend(v4, "containsObject:", v13))
            goto LABEL_7;
        }
        else
        {
          objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!objc_msgSend(v4, "containsObject:", v13))
            goto LABEL_7;
        }
        -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "buffer");

        memset(&v21, 0, sizeof(v21));
        -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
          objc_msgSend(v18, "timestamp");
        else
          memset(&v21, 0, sizeof(v21));

        time = v21;
        Seconds = CMTimeGetSeconds(&time);
        NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - Adding first frame for stream: %@ for ts: %f"), v13, *(_QWORD *)&Seconds);
        time = v21;
        -[MOVStreamWriter appendPixelBuffer:presentationTime:toStreamId:](self, "appendPixelBuffer:presentationTime:toStreamId:", v16, &time, v13);
LABEL_7:
        -[MOVWriterInterface clearFirstBufferForStream:](self, "clearFirstBufferForStream:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  -[MOVWriterInterface setFirstFrameContainer:](self, "setFirstFrameContainer:", 0);
}

- (void)clearFirstBufferForStream:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CVBuffer *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CVBuffer *)objc_msgSend(v7, "buffer");

    -[MOVWriterInterface firstFrameContainer](self, "firstFrameContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    CVPixelBufferRelease(v8);
  }

}

- (id)getSuggestedEncodingOptionsForFormat:(opaqueCMFormatDescription *)a3 streamID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  FourCharCode MediaSubType;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v27;

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackAddedByStream, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  if (MediaSubType != 825437747)
  {
    if (MediaSubType == 1278226488)
    {
      if ((v9 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE634D8], "monochrome8bitHEVCLosslessEncoderConfig");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (v11)
        objc_msgSend(MEMORY[0x24BE634D8], "monochrome8bitHEVCEncoderConfigWithBitrate:", v11);
      else
        objc_msgSend(MEMORY[0x24BE634D8], "monochrome8bitHEVCEncoderConfig");
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED68);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
      {

      }
      else
      {
        v15 = objc_msgSend(MEMORY[0x24BE634D8], "isEncoderAvailableForEncoderType:", 9);

        if ((v15 & 1) != 0)
        {
          if ((v9 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BE634D8], "colorHEVCLosslessEncoderConfig");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          if (v11)
            objc_msgSend(MEMORY[0x24BE634D8], "colorHEVCEncoderConfigWithBitrate:", v11);
          else
            objc_msgSend(MEMORY[0x24BE634D8], "colorHEVCEncoderConfig");
          goto LABEL_20;
        }
      }
      if (v11)
        objc_msgSend(MEMORY[0x24BE634D8], "colorH264EncoderConfigWithBitrate:", v11);
      else
        objc_msgSend(MEMORY[0x24BE634D8], "colorH264EncoderConfig");
    }
LABEL_20:
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Streams with 13.3 format requires lossless encoding"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  objc_msgSend(MEMORY[0x24BE634D8], "slimEncoderConfig");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v16 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24CA41718, *MEMORY[0x24BE634F8]);
  objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED70);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  if (v20 > 0.0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED70);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE634F0]);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED78);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if ((v24 & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6ED78);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v25);

  }
  return v17;
}

- (BOOL)addVideoTrack:(opaqueCMFormatDescription *)a3 streamID:(id)a4 encoding:(id)a5
{
  id v8;
  id v9;
  NSError *lastError;

  v8 = a4;
  v9 = a5;
  lastError = self->_lastError;
  self->_lastError = 0;

  if (!v9)
  {
    -[MOVWriterInterface getSuggestedEncodingOptionsForFormat:streamID:](self, "getSuggestedEncodingOptionsForFormat:streamID:", a3, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MOVStreamWriter addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:](self, "addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:", v8, a3, v9);
  NSLog(CFSTR("MOVKit:MOVWriterInterface - Added track %@"), v8);

  return 1;
}

- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 beforeAppend:(id)a5 streamID:(id)a6
{
  MOVWriterInterface *v8;
  NSError *lastError;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  const void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t i;
  void *v26;
  void *v27;
  char v28;
  id *p_isa;
  NSMutableDictionary *firstFrameContainer;
  void *v31;
  MOVWriterInterface *v32;
  MOVWriterInterface *v33;
  Float64 Seconds;
  void *v35;
  _BOOL4 v36;
  void *v37;
  BOOL v38;
  void (**v42)(id, __CVBuffer *);
  id v43;
  MOVWriterInterface *obj;
  CMTime time;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v42 = (void (**)(id, __CVBuffer *))a5;
  v43 = a6;
  v8 = self;
  objc_sync_enter(v8);
  lastError = v8->_lastError;
  v8->_lastError = 0;

  -[NSMutableDictionary valueForKey:](v8->_trackAddedByStream, "valueForKey:", v8->_firstSteamID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_trackAddedByStream, "objectForKeyedSubscript:", v8->_firstSteamID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", qword_254A6ED50);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

  }
  else
  {
    v13 = 0;
  }
  if ((objc_msgSend(v43, "isEqualToString:", v8->_firstSteamID) | v13) != 1)
  {
    objc_sync_exit(v8);

    goto LABEL_36;
  }
  -[NSMutableDictionary valueForKey:](v8->_trackAddedByStream, "valueForKey:", v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  if (!v14
    || (-[NSMutableDictionary objectForKeyedSubscript:](v8->_trackAddedByStream, "objectForKeyedSubscript:", v43),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "objectForKeyedSubscript:", qword_254A6ED50),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "BOOLValue"),
        v16,
        v15,
        (v17 & 1) == 0))
  {
    v18 = (const void *)objc_msgSend(MEMORY[0x24BE634D8], "formatForPixelBuffer:", a3);
    if (-[MOVWriterInterface addVideoTrack:streamID:encoding:](v8, "addVideoTrack:streamID:encoding:", v18, v43, 0))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v8->_trackAddedByStream, "objectForKeyedSubscript:", v43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, qword_254A6ED50);

    }
    CFRelease(v18);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[NSMutableDictionary allKeys](v8->_trackAddedByStream, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v22)
  {

    p_isa = (id *)&v8->super.super.isa;
    if (v8->_prepared)
      goto LABEL_25;
    goto LABEL_22;
  }
  v23 = *(_QWORD *)v47;
  v24 = 1;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v47 != v23)
        objc_enumerationMutation(v21);
      -[NSMutableDictionary objectForKeyedSubscript:](obj->_trackAddedByStream, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", qword_254A6ED50);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      v24 &= v28;
    }
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v22);

  p_isa = (id *)&obj->super.super.isa;
  if ((v24 & 1) != 0 && !obj->_prepared)
  {
LABEL_22:
    if (objc_msgSend(p_isa[70], "count") == 1)
    {
      firstFrameContainer = obj->_firstFrameContainer;
      obj->_firstFrameContainer = 0;

    }
    -[MOVWriterInterface createFileMetadata](obj, "createFileMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter prepareToRecordWithMovieMetadata:](obj, "prepareToRecordWithMovieMetadata:", v31);
    obj->_prepared = 1;

    p_isa = (id *)&obj->super.super.isa;
  }
LABEL_25:
  objc_sync_exit(p_isa);

  v32 = obj;
  if (!obj->_isReady)
    goto LABEL_36;
  if (v42)
  {
    v42[2](v42, a3);
    v32 = obj;
  }
  -[MOVWriterInterface setMetadataAttachmentTo:streamID:](v32, "setMetadataAttachmentTo:streamID:", a3, v43);
  v33 = obj;
  if (obj->_firstFrameContainer)
  {
    time = (CMTime)*a4;
    Seconds = CMTimeGetSeconds(&time);
    NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - First frame received for: %@ at ts: %f"), v43, *(_QWORD *)&Seconds);
    time = (CMTime)*a4;
    -[MOVWriterInterface addFirstBufferForStream:buffer:withTimestamp:](obj, "addFirstBufferForStream:buffer:withTimestamp:", v43, a3, &time);
    -[NSMutableDictionary allKeys](obj->_trackAddedByStream, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[MOVWriterInterface receivedAllFramesForStreams:](obj, "receivedAllFramesForStreams:", v35);

    if (v36)
    {
      NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - All first being written"));
      -[NSMutableDictionary allKeys](obj->_trackAddedByStream, "allKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVWriterInterface intelligentlyAppendBuffersForStreams:](obj, "intelligentlyAppendBuffersForStreams:", v37);

      v33 = obj;
      goto LABEL_32;
    }
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
  time = (CMTime)*a4;
  -[MOVStreamWriter appendPixelBuffer:presentationTime:toStreamId:](obj, "appendPixelBuffer:presentationTime:toStreamId:", a3, &time, v43);
LABEL_32:
  if (-[NSString isEqualToString:](v33->_firstSteamID, "isEqualToString:", v43)
    && obj->_writeMetadataTimeInterval <= 0.0)
  {
    time = (CMTime)*a4;
    -[MOVWriterInterface appendAllMetadataWithTimeStamp:](obj, "appendAllMetadataWithTimeStamp:", &time);
  }
  v38 = 1;
LABEL_37:

  return v38;
}

- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 intrinsics:(id *)a5 exposureTime:(double)a6 streamID:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  _QWORD v9[7];

  v9[1] = 3221225472;
  v9[2] = sub_210646C54;
  v9[3] = &unk_24CA36108;
  v9[4] = self;
  v9[5] = a5;
  *(double *)&v9[6] = a6;
  v8 = *a4;
  v9[0] = MEMORY[0x24BDAC760];
  return -[MOVWriterInterface processPixelBuffer:withTimeStamp:beforeAppend:streamID:](self, "processPixelBuffer:withTimeStamp:beforeAppend:streamID:", a3, &v8, v9, a7);
}

- (BOOL)processCVADepthIR:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  _BYTE v9[24];
  OSType PixelFormatType;

  v4 = a3;
  PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v4, "dataBuffer"));
  if (PixelFormatType == 825437747)
  {
    v5 = objc_msgSend(v4, "dataBuffer");
    objc_msgSend(v4, "timestamp");
    +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:");
    v6 = -[MOVWriterInterface processPixelBuffer:withTimeStamp:beforeAppend:streamID:](self, "processPixelBuffer:withTimeStamp:beforeAppend:streamID:", v5, v9, 0, CFSTR("com.apple.reality.kind.data.pcam_avdepth"));
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", &PixelFormatType, 4, 1, 0);
    NSLog(CFSTR("MOVKit:MOVWriterInterface - ERROR - pixel format type for depth IR data should be kCVPixelFormatType_FixedPointUnsigned13_3, but received pixel buffer with format '%@'"), v7);

    v6 = 0;
  }

  return v6;
}

- (id)arrayFrom3x3Matrix:(id *)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 9);
  LODWORD(v5) = *(_DWORD *)a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  LODWORD(v7) = *((_DWORD *)a3 + 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  LODWORD(v9) = *((_DWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  LODWORD(v11) = *((_DWORD *)a3 + 4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  LODWORD(v13) = *((_DWORD *)a3 + 5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  LODWORD(v15) = *((_DWORD *)a3 + 6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  LODWORD(v17) = *((_DWORD *)a3 + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v18);

  LODWORD(v19) = *((_DWORD *)a3 + 9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

  LODWORD(v21) = *((_DWORD *)a3 + 10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  return v4;
}

- (void)setMetadataAttachmentTo:(__CVBuffer *)a3 streamID:(id)a4
{
  id v6;
  MOVWriterInterface *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_frameMetadataDictionary, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          CVBufferSetAttachment(a3, *(CFStringRef *)(*((_QWORD *)&v14 + 1) + 8 * v13), (CFTypeRef)objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), (_QWORD)v14), kCVAttachmentMode_ShouldPropagate);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    objc_msgSend(v10, "removeAllObjects");
  }

  objc_sync_exit(v7);
}

- (void)finishWriting:(id *)a3
{
  MOVWriterInterface *v5;
  __int128 v6;
  uint64_t v7;

  NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - finishWriting"), a2);
  v5 = self;
  objc_sync_enter(v5);
  v5->_isReady = 0;
  objc_sync_exit(v5);

  if (a3)
    *a3 = 0;
  v6 = *MEMORY[0x24BDC0D30];
  v7 = *(_QWORD *)(MEMORY[0x24BDC0D30] + 16);
  -[MOVWriterInterface appendAllMetadataWithTimeStamp:](v5, "appendAllMetadataWithTimeStamp:", &v6);
  -[MOVStreamWriter finishRecording](v5, "finishRecording");
}

- (void)streamWriterDidFinishPreparing
{
  MOVWriterInterface *v3;
  id *p_interface_delegate;
  id WeakRetained;
  char v6;
  id v7;

  NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - streamWriterDidFinishPreparing"), a2);
  v3 = self;
  objc_sync_enter(v3);
  v3->_isReady = 1;
  objc_sync_exit(v3);

  p_interface_delegate = (id *)&v3->_interface_delegate;
  WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(p_interface_delegate);
    objc_msgSend(v7, "isReadyToRecord");

  }
}

- (void)streamWriterDidFailWithError:(id)a3
{
  MOVWriterInterface *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSError *lastError;
  id *p_interface_delegate;
  id WeakRetained;
  id v12;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("StreamWriter failure: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v7, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  lastError = v4->_lastError;
  v4->_lastError = (NSError *)v8;

  v4->_isReady = 0;
  objc_sync_exit(v4);

  p_interface_delegate = (id *)&v4->_interface_delegate;
  WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v12 = objc_loadWeakRetained(p_interface_delegate);
    objc_msgSend(v12, "didFailWithError:", v13);

  }
}

- (void)streamWriterDidFinishRecording
{
  MOVWriterInterface *v3;
  id *p_interface_delegate;
  id WeakRetained;
  char v6;
  id v7;

  NSLog(CFSTR("MOVKit:MOVWriterInterface - INFO - streamWriterDidFinishRecording"), a2);
  v3 = self;
  objc_sync_enter(v3);
  v3->_isReady = 0;
  objc_sync_exit(v3);

  p_interface_delegate = (id *)&v3->_interface_delegate;
  WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(p_interface_delegate);
    objc_msgSend(v7, "didFinishRecording");

  }
}

- (void)streamWriterEncounteredAnError:(id)a3
{
  MOVWriterInterface *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSError *lastError;
  id *p_interface_delegate;
  id WeakRetained;
  id v12;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("StreamWriter error: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v7, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  lastError = v4->_lastError;
  v4->_lastError = (NSError *)v8;

  objc_sync_exit(v4);
  p_interface_delegate = (id *)&v4->_interface_delegate;
  WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v12 = objc_loadWeakRetained(p_interface_delegate);
    objc_msgSend(v12, "didEncounterError:", v13);

  }
}

- (void)streamWriter:(id)a3 stream:(id)a4 preparedTrackInputs:(id)a5 mediaType:(int64_t)a6
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  NSLog(CFSTR("MOVWriterInterface - INFO - StreamWriter prepared track inputs for %@"), v7);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.reality.kind.data.pcam_avdepth")))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      v13 = *MEMORY[0x24BDB19F8];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setMediaDataLocation:", v13);
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)addFrameMetadata:(id)a3 value:(id)a4 streamID:(id)a5
{
  id v8;
  id v9;
  MOVWriterInterface *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_frameMetadataDictionary, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v13);

  objc_sync_exit(v10);
}

- (void)addFrameMetadata:(id)a3 streamID:(id)a4
{
  id v6;
  MOVWriterInterface *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_frameMetadataDictionary, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  objc_sync_exit(v7);
}

- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4
{
  id v6;
  double v7;
  id v8;

  if (a3)
  {
    v6 = objc_retainAutorelease(a3);
    v7 = *(double *)(objc_msgSend(v6, "bytes") + 8);
    +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:", a4, self->_spuIMUTrackName);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v8, v7);

  }
}

- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4 metadataID:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;

  if (a3)
  {
    v8 = a5;
    v9 = a3;
    +[CVASpuFastPathComboAxisData getTimestamp:](CVASpuFastPathComboAxisData, "getTimestamp:", v9);
    v11 = v10;
    +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:", a4, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v9, v12, v11);
  }
}

- (void)processSpuIMUData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CVAMetadataWrapper encodeIMUData:](CVAMetadataWrapper, "encodeIMUData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:", a4, self->_spuIMUTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

  }
}

- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[CVAMetadataWrapper encodeAccelerometerData:andAdditionalData:](CVAMetadataWrapper, "encodeAccelerometerData:andAdditionalData:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", a5, self->_accelTrackName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);

    if (self->_writeLegacyTracks)
    {
      +[CVAMetadataWrapper accelerometerTrackName:prefix:](CVAMetadataWrapper, "accelerometerTrackName:prefix:", a5, CFSTR("RawAccelerometer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamp");
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v9);

    }
  }

}

- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_processAccelerometerData_andAdditionalData_location_);
}

- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[CVAMetadataWrapper encodeGyroscopeData:andAdditionalData:](CVAMetadataWrapper, "encodeGyroscopeData:andAdditionalData:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", a5, self->_gyroTrackName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);

    if (self->_writeLegacyTracks)
    {
      +[CVAMetadataWrapper gyroTrackName:prefix:](CVAMetadataWrapper, "gyroTrackName:prefix:", a5, CFSTR("RawGyroscope"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamp");
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v9);

    }
  }

}

- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_processGyroscopeData_andAdditionalData_location_);
}

- (void)processMotionData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CVAMetadataWrapper encodeMotionData:](CVAMetadataWrapper, "encodeMotionData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper motionTrackName:prefix:](CVAMetadataWrapper, "motionTrackName:prefix:", a4, self->_motionTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

  }
}

- (void)processMotionData:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_processMotionData_location_);
}

- (void)processALSData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[CVAMetadataWrapper encodeALSData:](CVAMetadataWrapper, "encodeALSData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper alsTrackName:prefix:](CVAMetadataWrapper, "alsTrackName:prefix:", a4, self->_alsTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

    if (self->_writeLegacyTracks)
    {
      +[CVAMetadataWrapper alsTrackName:prefix:](CVAMetadataWrapper, "alsTrackName:prefix:", a4, CFSTR("ALS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v8);

    }
  }

}

- (void)processWiFiData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CVAMetadataWrapper encodeWiFiData:](CVAMetadataWrapper, "encodeWiFiData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper wifiTrackName:prefix:](CVAMetadataWrapper, "wifiTrackName:prefix:", a4, self->_wifiTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

  }
}

- (void)processCompassData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[CVAMetadataWrapper encodeCompassData:](CVAMetadataWrapper, "encodeCompassData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", a4, self->_compassTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

    if (self->_writeLegacyTracks)
    {
      +[CVAMetadataWrapper compassTrackName:prefix:](CVAMetadataWrapper, "compassTrackName:prefix:", a4, CFSTR("Compass"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v8);

    }
  }

}

- (void)processCompassData:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_processCompassData_location_);
}

- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[CVAMetadataWrapper encodeDeviceMotionData:andAdditionalData:](CVAMetadataWrapper, "encodeDeviceMotionData:andAdditionalData:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", a5, self->_deviceMotionTrackName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);

  }
}

- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_processDeviceMotionData_andAdditionalData_location_);
}

- (void)processDeviceMotionData:(id)a3 location:(int64_t *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CVAMetadataWrapper encodeDeviceMotionData:](CVAMetadataWrapper, "encodeDeviceMotionData:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CVAMetadataWrapper deviceMotionTrackName:prefix:](CVAMetadataWrapper, "deviceMotionTrackName:prefix:", a4, self->_deviceMotionTrackName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

  }
}

- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5 location:(int64_t *)a6
{
  void *v9;
  id v10;

  +[CVAMetadataWrapper encodeCoreLocationData:timestamp:andAdditionalData:](CVAMetadataWrapper, "encodeCoreLocationData:timestamp:andAdditionalData:", a3, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[CVAMetadataWrapper locationTrackName:prefix:](CVAMetadataWrapper, "locationTrackName:prefix:", a6, self->_locationTrackName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v10, v9, a4);

  }
}

- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_processCoreLocationData_timestamp_andAdditionalData_location_);
}

- (void)processCMData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CVAMetadataWrapper encodeCMData:](CVAMetadataWrapper, "encodeCMData:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, CFSTR("CMData"));
  }

}

- (void)processCVAUserEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CVAMetadataWrapper encodeCVAUserEvent:](CVAMetadataWrapper, "encodeCVAUserEvent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, CFSTR("CVAUserEvent"));
  }

}

- (void)processCVATimedValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CVAMetadataWrapper encodeCVATimedValue:](CVAMetadataWrapper, "encodeCVATimedValue:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, CFSTR("CVATimedValue"));
  }

}

- (void)processCVAPRDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CVAMetadataWrapper encodePRDevice:](CVAMetadataWrapper, "encodePRDevice:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, CFSTR("CVAPRDevice"));
  }

}

- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 frameId:(unint64_t)a6 streamName:(id)a7
{
  void *v12;
  uint64_t v13;
  CVAFeatureBuffer *v14;
  void *v15;
  id v16;

  v16 = a7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cvaFeatureBufferCompression, "objectForKeyedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = -[CVAFeatureBuffer initWithPixelBufferRef:timestamp:streamID:reduce:compress:]([CVAFeatureBuffer alloc], "initWithPixelBufferRef:timestamp:streamID:reduce:compress:", a3, 0, 0, v13, a4);
  -[CVAFeatureBuffer setSyncTimestamp:](v14, "setSyncTimestamp:", a5);
  -[CVAFeatureBuffer setFrameId:](v14, "setFrameId:", a6);
  +[CVAMetadataWrapper encodeCVAFeatureBuffer:](CVAMetadataWrapper, "encodeCVAFeatureBuffer:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v15, v16, a4);

}

- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 streamName:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_processCVAFeatureBuffer_timestamp_syncTimestamp_frameId_streamName_);
}

- (void)processCVAFeatureBuffer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[CVAMetadataWrapper encodeCVAFeatureBuffer:](CVAMetadataWrapper, "encodeCVAFeatureBuffer:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CVAFeatureBuffer streamName:](CVAFeatureBuffer, "streamName:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, v5);

  }
}

- (void)processCVADepthTOF:(id)a3
{
  id v4;
  void *v5;
  NSError *lastError;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *v13;
  NSString *depthTOFTrackName;
  id v15;

  v4 = a3;
  +[CVAMetadataWrapper encodeCVADepthTOF:](CVAMetadataWrapper, "encodeCVADepthTOF:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lastError = self->_lastError;
  self->_lastError = 0;

  if (v5)
  {
    v15 = 0;
    objc_msgSend(v5, "compressedDataUsingAlgorithm:error:", 1, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v8, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "movWriterInterfaceErrorWithMessage:code:", v11, 1);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      v13 = self->_lastError;
      self->_lastError = v12;

    }
    else
    {
      depthTOFTrackName = self->_depthTOFTrackName;
      objc_msgSend(v4, "timestamp");
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, depthTOFTrackName);

      if (self->_writeLegacyTracks)
      {
        objc_msgSend(v4, "timestamp");
        -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, CFSTR("CVADepthTOF"));
      }
    }

  }
}

- (void)processCVACameraCalibrationData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CVAMetadataWrapper encodeCVACameraCalibrationData:](CVAMetadataWrapper, "encodeCVACameraCalibrationData:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "timestamp");
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:enforceMonotonicity:](self, "appendMetadata:metadataID:timestamp:enforceMonotonicity:", v4, CFSTR("CVACameraCalibration"), 0);
  }

}

- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  +[CVAMetadataWrapper encodeClass:andAdditionalData:](CVAMetadataWrapper, "encodeClass:andAdditionalData:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[MOVWriterInterface appendMetadata:metadataID:](self, "appendMetadata:metadataID:", v8, v9);

}

- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5 timestamp:(double)a6
{
  void *v10;
  id v11;

  v11 = a5;
  +[CVAMetadataWrapper encodeClass:andAdditionalData:](CVAMetadataWrapper, "encodeClass:andAdditionalData:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v10, v11, a6);

}

- (void)processNSCoderObject:(id)a3 metadataID:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[MOVWriterInterface appendMetadata:metadataID:](self, "appendMetadata:metadataID:", v6, v7);

}

- (void)processNSCoderObject:(id)a3 metadataID:(id)a4 timestamp:(double)a5
{
  void *v8;
  id v9;

  v9 = a4;
  +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v8, v9, a5);

}

- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5
{
  -[MOVWriterInterface appendMetadata:metadataID:timestamp:enforceMonotonicity:](self, "appendMetadata:metadataID:timestamp:enforceMonotonicity:", a3, a4, 1, a5);
}

- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5 enforceMonotonicity:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  MOVWriterInterface *v12;
  NSError *lastError;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  NSError *v27;
  _BYTE v28[24];
  CMTime time2;
  CMTime time1;
  objc_super v31;
  CMTime v32;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  if (v6)
  {
    lastError = v12->_lastError;
    v12->_lastError = 0;

    -[NSMutableDictionary objectForKeyedSubscript:](v12->_metadataLastTimestamp, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      if (v16 > a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ timestamp %.6f is older than %.6f"), v11, *(_QWORD *)&a5, *(_QWORD *)&v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "movWriterInterfaceErrorWithMessage:code:", v19, 0);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v12->_lastError;
        v12->_lastError = (NSError *)v26;

LABEL_19:
        goto LABEL_20;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_metadataLastTimestamp, "setObject:forKeyedSubscript:", v17, v11);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](v12->_metadataAttachmentArrays, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v10);
  if (a5 >= 0.0 && v12->_isReady)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_metadataMaxBufferSize, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "unsignedIntValue");
      if (objc_msgSend(v15, "count") > (unint64_t)v20 && (v12->_lastAppendMetadata.flags & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeAllObjects");
        memset(&v32, 0, sizeof(v32));
        +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:", a5);
        v31.receiver = v12;
        v31.super_class = (Class)MOVWriterInterface;
        time1 = v32;
        -[MOVStreamWriter appendMetadata:withTimeStamp:toStream:](&v31, sel_appendMetadata_withTimeStamp_toStream_, v21, &time1, v11);
        v22 = *(_OWORD *)&v32.value;
        v12->_lastAppendMetadata.epoch = v32.epoch;
        *(_OWORD *)&v12->_lastAppendMetadata.value = v22;

      }
    }
    if (v12->_writeMetadataTimeInterval > 0.0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v12->_metadataAttachmentArraysTimestamp, "objectForKeyedSubscript:", v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_metadataAttachmentArraysTimestamp, "setObject:forKeyedSubscript:", v24, v11);

      }
      memset(&v32, 0, sizeof(v32));
      +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:", a5 - v12->_writeMetadataTimeInterval);
      if ((v12->_lastAppendMetadata.flags & 1) == 0
        || (time1 = v32,
            v25 = *(_OWORD *)&v12->_lastAppendMetadata.value,
            time2.epoch = v12->_lastAppendMetadata.epoch,
            *(_OWORD *)&time2.value = v25,
            CMTimeCompare(&time1, &time2) >= 1))
      {
        +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:", a5);
        -[MOVWriterInterface appendAllMetadataWithTimeStamp:](v12, "appendAllMetadataWithTimeStamp:", v28);
      }

    }
    goto LABEL_19;
  }
LABEL_20:

  objc_sync_exit(v12);
}

- (void)appendMetadata:(id)a3 metadataID:(id)a4
{
  -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", a3, a4, -1.0);
}

- (void)clearAllMetadataBuffers
{
  MOVWriterInterface *v2;
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2->_metadataAttachmentArrays;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_metadataAttachmentArrays, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeAllObjects");

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)appendAllMetadataWithTimeStamp:(id *)a3
{
  MOVWriterInterface *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v17;
  id obj;
  objc_super v19;
  __int128 v20;
  int64_t v21;
  objc_super v22;
  __int128 v23;
  int64_t var3;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](v3->_metadataAttachmentArrays, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3->_writeMetadataTimeInterval > 0.0)
  {
    -[NSMutableDictionary allKeys](v3->_metadataAttachmentArrays, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_21064929C;
    v29[3] = &unk_24CA36130;
    v29[4] = v3;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v29);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      v17 = v7;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKeyedSubscript:](v3->_metadataAttachmentArrays, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeAllObjects");
        if (objc_msgSend(v12, "count"))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v3->_metadataAttachmentArraysTimestamp, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v23 = 0uLL;
            var3 = 0;
            objc_msgSend(v13, "doubleValue");
            +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:");
            v22.receiver = v3;
            v22.super_class = (Class)MOVWriterInterface;
            v20 = v23;
            v21 = var3;
            -[MOVStreamWriter appendMetadata:withTimeStamp:toStream:](&v22, sel_appendMetadata_withTimeStamp_toStream_, v12, &v20, v10);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_metadataAttachmentArraysTimestamp, "setObject:forKeyedSubscript:", 0, v10);
            v7 = v17;
          }
          else
          {
            v19.receiver = v3;
            v19.super_class = (Class)MOVWriterInterface;
            v23 = *(_OWORD *)&a3->var0;
            var3 = a3->var3;
            -[MOVStreamWriter appendMetadata:withTimeStamp:toStream:](&v19, sel_appendMetadata_withTimeStamp_toStream_, v12, &v23, v10);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v15 = a3->var3;
  *(_OWORD *)&v3->_lastAppendMetadata.value = *(_OWORD *)&a3->var0;
  v3->_lastAppendMetadata.epoch = v15;

  objc_sync_exit(v3);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromTimestamp:(SEL)a3
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, 1000000000);
}

+ (id)makeDeviceString
{
  return +[MOVWriterInterfaceUtil makeDeviceString](MOVWriterInterfaceUtil, "makeDeviceString");
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

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
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

- (NSString)osBuildVersion
{
  return self->_osBuildVersion;
}

- (void)setOsBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osBuildVersion, a3);
}

- (CVACalibration)calibration
{
  return self->_calibration;
}

- (void)setCalibration:(id)a3
{
  objc_storeStrong((id *)&self->_calibration, a3);
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

- (NSMutableArray)movMetadataArray
{
  return self->_movMetadataArray;
}

- (void)setMovMetadataArray:(id)a3
{
  objc_storeStrong((id *)&self->_movMetadataArray, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (double)writeMetadataTimeInterval
{
  return self->_writeMetadataTimeInterval;
}

- (void)setWriteMetadataTimeInterval:(double)a3
{
  self->_writeMetadataTimeInterval = a3;
}

- (MOVWriterInterfaceDelegate)interface_delegate
{
  return (MOVWriterInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_interface_delegate);
}

- (void)setInterface_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_interface_delegate, a3);
}

- (NSMutableDictionary)firstFrameContainer
{
  return self->_firstFrameContainer;
}

- (void)setFirstFrameContainer:(id)a3
{
  objc_storeStrong((id *)&self->_firstFrameContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFrameContainer, 0);
  objc_destroyWeak((id *)&self->_interface_delegate);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_movMetadataArray, 0);
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
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_osBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productConfig, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_fileSummary, 0);
  objc_storeStrong((id *)&self->_metadataTrackMetadata, 0);
  objc_storeStrong((id *)&self->_cvaFeatureBufferCompression, 0);
  objc_storeStrong((id *)&self->_metadataMaxBufferSize, 0);
  objc_storeStrong((id *)&self->_metadataLastTimestamp, 0);
  objc_storeStrong((id *)&self->_metadataAttachmentArraysTimestamp, 0);
  objc_storeStrong((id *)&self->_metadataAttachmentArrays, 0);
  objc_storeStrong((id *)&self->_frameMetadataDictionary, 0);
  objc_storeStrong((id *)&self->_firstSteamID, 0);
  objc_storeStrong((id *)&self->_trackAddedByStream, 0);
}

@end
