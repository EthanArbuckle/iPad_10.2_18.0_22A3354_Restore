@implementation CVAMetadataWrapper

+ (id)version
{
  return CFSTR("1.2.0");
}

+ (id)trackNameFromPrefix:(int64_t *)a3 prefix:(id)a4 defaultValue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    v7 = (id)objc_msgSend(v8, "copy");
    if (a3)
      goto LABEL_3;
LABEL_5:
    v10 = v7;
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%ld"), v7, *a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = v10;

  return v11;
}

+ (id)imuTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)accelerometerTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)gyroTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)motionTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)deviceMotionTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)locationTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)alsTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)wifiTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)compassTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)validTracks
{
  if (qword_254A6EF40 != -1)
    dispatch_once(&qword_254A6EF40, &unk_24CA362F8);
  return (id)qword_254A6EF38;
}

+ (BOOL)locationFromTrackName:(id)a3 location:(int64_t *)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      +[CVAMetadataWrapper validTracks](CVAMetadataWrapper, "validTracks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeLastObject");
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v9, "containsObject:", v11);
      if (v4)
        *a4 = objc_msgSend(v10, "integerValue");

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

+ (id)encodeIMUData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeMotionData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCompassData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeALSData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeWiFiData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
  id v5;
  id v6;
  CVACMDeviceMotionData *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = -[CVACMDeviceMotionData initWithCMDeviceMotion:]([CVACMDeviceMotionData alloc], "initWithCMDeviceMotion:", v6);
  -[CVACMDeviceMotionData dictionary](v7, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v8);
  +[CVAMetadataWrapper encodeClass:andAdditionalData:](CVAMetadataWrapper, "encodeClass:andAdditionalData:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)encodeDeviceMotionData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
  id v7;
  id v8;
  CVACLLocation *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a3;
  v9 = -[CVACLLocation initWithCLLocation:timestamp:]([CVACLLocation alloc], "initWithCLLocation:timestamp:", v8, a4);
  -[CVACLLocation dictionary](v9, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addEntriesFromDictionary:", v10);
  +[CVAMetadataWrapper encodeClass:andAdditionalData:](CVAMetadataWrapper, "encodeClass:andAdditionalData:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)encodePRDevice:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCMData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVAUserEvent:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVATimedValue:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVAFeatureBuffer:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVADepthTOF:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVACalibration:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeCVACameraCalibrationData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeDictionary:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a3);
}

+ (id)encodeClass:(id)a3 andAdditionalData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v8)
  {
    NSLog(CFSTR("MetadataWrapper - ERROR - data could not be KeyedArchiver serialized: %@"), v5);
    v9 = 0;
  }
  else
  {
    v14 = qword_254A6EE40;
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v10);
    +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)encodeNSCoderObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v3 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("MetadataWrapper - ERROR - data could not be KeyedArchiver serialized: %@ %@"), v7, v3);

    v8 = 0;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

+ (id)commonSet
{
  if (qword_254A6EF50 != -1)
    dispatch_once(&qword_254A6EF50, &unk_24CA36318);
  return (id)qword_254A6EF48;
}

+ (id)decodeCommon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1620];
  +[CVAMetadataWrapper commonSet](CVAMetadataWrapper, "commonSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;

  if (v7)
  {

    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 1, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v9)
    {

      v16 = 0;
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, &v17, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("MetadataWrapper - INFO - cannot deserialize data: %@"), v13);

        v14 = 0;
      }
      else
      {
        v14 = v10;
      }

    }
    else
    {
      v14 = v8;
    }

  }
  else
  {
    v14 = v6;
  }

  return v14;
}

+ (id)decodeIMU:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVASpuFastPathComboAxisData classes](CVASpuFastPathComboAxisData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeAccel:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  CVACMAccelerometerData *v7;
  void *v8;
  void *v9;
  id v11;

  v3 = a3;
  v4 = objc_opt_class();
  v11 = 0;
  +[CVAMetadataWrapper decodeClass:class:error:](CVAMetadataWrapper, "decodeClass:class:error:", v3, v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = -[CVACMAccelerometerData initWithDictionary:]([CVACMAccelerometerData alloc], "initWithDictionary:", v8);
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("MetadataWrapper - ERROR - cannot deserialize %@ data: %@"), v4, v9);

      }
      v7 = 0;
    }

  }
  return v7;
}

+ (id)decodeGyro:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  CVACMGyroData *v7;
  void *v8;
  void *v9;
  id v11;

  v3 = a3;
  v4 = objc_opt_class();
  v11 = 0;
  +[CVAMetadataWrapper decodeClass:class:error:](CVAMetadataWrapper, "decodeClass:class:error:", v3, v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = -[CVACMGyroData initWithDictionary:]([CVACMGyroData alloc], "initWithDictionary:", v8);
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("MetadataWrapper - ERROR - cannot deserialize %@ data: %@"), v4, v9);

      }
      v7 = 0;
    }

  }
  return v7;
}

+ (id)decodeCompass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACMCompassData classes](CVACMCompassData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeMotion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACMMotionData classes](CVACMMotionData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeALS:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACMALSData classes](CVACMALSData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeWiFi:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACMWiFiData classes](CVACMWiFiData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeDeviceMotion:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  CVACMDeviceMotionData *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_opt_class();
  +[CVACMDeviceMotionData classes](CVACMDeviceMotionData, "classes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[CVAMetadataWrapper decodeNSCoderObject:classes:error:](CVAMetadataWrapper, "decodeNSCoderObject:classes:error:", v3, v5, &v14);
  v6 = (CVACMDeviceMotionData *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v13 = v7;
    +[CVAMetadataWrapper decodeClass:class:error:](CVAMetadataWrapper, "decodeClass:class:error:", v3, v4, &v13);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v13;

    if (v9)
    {
      v6 = (CVACMDeviceMotionData *)v9;
    }
    else
    {
      +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v6 = -[CVACMDeviceMotionData initWithDictionary:]([CVACMDeviceMotionData alloc], "initWithDictionary:", v10);
      }
      else
      {
        if (v8)
        {
          objc_msgSend(v8, "localizedDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("MetadataWrapper - ERROR - cannot deserialize %@ data: %@"), v4, v11);

        }
        v6 = 0;
      }

    }
  }

  return v6;
}

+ (id)decodeCMDeviceMotion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[CVAMetadataWrapper decodeClass:class:](CVAMetadataWrapper, "decodeClass:class:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)decodeDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", qword_254A6EE40);

    return v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;

      return v5;
    }
    else
    {

      return 0;
    }
  }
}

+ (id)decodeClass:(id)a3 class:(Class)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", qword_254A6EE40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", qword_254A6EE40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CVAMetadataWrapper decodeNSCoderObject:class:](CVAMetadataWrapper, "decodeNSCoderObject:class:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)decodeClass:(id)a3 class:(Class)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", qword_254A6EE40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", qword_254A6EE40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CVAMetadataWrapper decodeNSCoderObject:class:error:](CVAMetadataWrapper, "decodeNSCoderObject:class:error:", v9, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)decodeLocationDict:(id)a3
{
  void *v3;
  CVACLLocation *v4;
  void *v5;

  +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CVACLLocation initWithDictionary:]([CVACLLocation alloc], "initWithDictionary:", v3);
  -[CVACLLocation dictionary](v4, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeCLLocation:(id)a3
{
  return +[CVAMetadataWrapper decodeCLLocation:timestamp:](CVAMetadataWrapper, "decodeCLLocation:timestamp:", a3, 0);
}

+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4
{
  id v5;
  void *v6;
  CVACLLocation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a4)
  {
    +[CVAMetadataWrapper decodeCommon:](CVAMetadataWrapper, "decodeCommon:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CVACLLocation initWithDictionary:]([CVACLLocation alloc], "initWithDictionary:", v6);
    -[CVACLLocation timestamp](v7, "timestamp");
    *(_QWORD *)a4 = v8;

  }
  +[CVAMetadataWrapper decodeClass:class:](CVAMetadataWrapper, "decodeClass:class:", v5, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (id)decodePRDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVAPRDevice classes](CVAPRDevice, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCMData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CMData classes](CMData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVAUserEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVAUserEvent classes](CVAUserEvent, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVATimedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVATimedValue classes](CVATimedValue, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVAFeatureBuffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVAFeatureBuffer classes](CVAFeatureBuffer, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVADepthTOF:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVADepthTOF classes](CVADepthTOF, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVACalibration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACalibration classes](CVACalibration, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeCVACameraCalibrationData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  +[CVACameraCalibrationData classes](CVACameraCalibrationData, "classes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v5 = a4;
  v12 = 0;
  +[CVAMetadataWrapper decodeNSCoderObject:classes:error:](CVAMetadataWrapper, "decodeNSCoderObject:classes:error:", a3, v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("MetadataWrapper - INFO - cannot deserialize %@ data: %@"), v5, v9);

    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", a4, a3, a5);
}

+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  Class v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v11 = a4;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v13 = a4;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v9, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAMetadataWrapper decodeNSCoderObject:classes:error:](CVAMetadataWrapper, "decodeNSCoderObject:classes:error:", v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
