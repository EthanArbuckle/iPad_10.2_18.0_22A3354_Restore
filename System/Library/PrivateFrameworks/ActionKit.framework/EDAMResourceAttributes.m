@implementation EDAMResourceAttributes

+ (id)structName
{
  return CFSTR("ResourceAttributes");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1132;
  if (!structFields_structFields_1132)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("sourceURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 1, CFSTR("timestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 4, 1, CFSTR("latitude"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 4, 1, CFSTR("longitude"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 4, 1, CFSTR("altitude"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("cameraMake"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("cameraModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[6] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("clientWillIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[7] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("recoType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[8] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 11, 1, CFSTR("fileName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[9] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("attachment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[10] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 12, 12, 1, CFSTR("applicationData"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[11] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 12);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_1132;
    structFields_structFields_1132 = v12;

    v2 = (void *)structFields_structFields_1132;
  }
  return v2;
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_altitude, a3);
}

- (NSString)cameraMake
{
  return self->_cameraMake;
}

- (void)setCameraMake:(id)a3
{
  objc_storeStrong((id *)&self->_cameraMake, a3);
}

- (NSString)cameraModel
{
  return self->_cameraModel;
}

- (void)setCameraModel:(id)a3
{
  objc_storeStrong((id *)&self->_cameraModel, a3);
}

- (NSNumber)clientWillIndex
{
  return self->_clientWillIndex;
}

- (void)setClientWillIndex:(id)a3
{
  objc_storeStrong((id *)&self->_clientWillIndex, a3);
}

- (NSString)recoType
{
  return self->_recoType;
}

- (void)setRecoType:(id)a3
{
  objc_storeStrong((id *)&self->_recoType, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSNumber)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (EDAMLazyMap)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_recoType, 0);
  objc_storeStrong((id *)&self->_clientWillIndex, 0);
  objc_storeStrong((id *)&self->_cameraModel, 0);
  objc_storeStrong((id *)&self->_cameraMake, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
