@implementation CVADepthTOF

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EED0 != -1)
    dispatch_once(&qword_254A6EED0, &unk_24CA35FC0);
  return (id)qword_254A6EEC8;
}

- (CVADepthTOF)initWithCoder:(id)a3
{
  id v4;
  CVADepthTOF *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[CVADepthTOF init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVADepthTOF setTimestamp:](v5, "setTimestamp:");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("p")))
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("p"));
    else
      v7 = 0;
    -[CVADepthTOF setProjectorMode:](v5, "setProjectorMode:", v7);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("m"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVADepthTOF setMetadata:](v5, "setMetadata:", v8);

    -[CVADepthTOF setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVADepthTOF setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("d"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE05F70]), "initWithDictionaryRepresentation:", v9);
      -[CVADepthTOF setPointCloud:](v5, "setPointCloud:", v10);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVADepthTOF data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("d"));

  -[CVADepthTOF timestamp](self, "timestamp");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[CVADepthTOF projectorMode](self, "projectorMode"), CFSTR("p"));
  -[CVADepthTOF metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("m"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[CVADepthTOF syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[CVADepthTOF frameId](self, "frameId"), CFSTR("fi"));
  objc_autoreleasePoolPop(v4);

}

- (void)reset
{
  id v2;

  -[CVADepthTOF pointCloud](self, "pointCloud");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (CVADepthTOF)initWithADJasperPointCloud:(id)a3 timestamp:(double)a4
{
  id v6;
  CVADepthTOF *v7;
  CVADepthTOF *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVADepthTOF;
  v7 = -[CVADepthTOF init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CVADepthTOF setTimestamp:](v7, "setTimestamp:", a4);
    -[CVADepthTOF setPointCloud:](v8, "setPointCloud:", v6);
    -[CVADepthTOF setProjectorMode:](v8, "setProjectorMode:", 0);
    -[CVADepthTOF pointCloud](v8, "pointCloud");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVADepthTOF setData:](v8, "setData:", v10);

  }
  return v8;
}

- (CVADepthTOF)initWithAVPointCloudData:(id)a3 timestamp:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  CVADepthTOF *v10;
  SEL v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BE05F70];
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "makeWithDataBuffer:", objc_msgSend(v8, "pointCloudDataBuffer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CVADepthTOF initWithADJasperPointCloud:timestamp:](self, "initWithADJasperPointCloud:timestamp:", v9, a4);
  v11 = NSSelectorFromString(CFSTR("projectorMode"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E8]), "initWithTarget:selector:object:", v8, v11, 0);
    objc_msgSend(v12, "start");
    v15 = 0;
    objc_msgSend(v12, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getValue:", &v15);

    -[CVADepthTOF setProjectorMode:](v10, "setProjectorMode:", v15);
  }

  return v10;
}

- (CVADepthTOF)initWithCVDataBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 projectorMode:(int64_t)a5
{
  void *v8;
  CVADepthTOF *v9;

  objc_msgSend(MEMORY[0x24BE05F70], "makeWithDataBuffer:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CVADepthTOF initWithADJasperPointCloud:timestamp:](self, "initWithADJasperPointCloud:timestamp:", v8, a4);
  -[CVADepthTOF setProjectorMode:](v9, "setProjectorMode:", a5);

  return v9;
}

- (CVADepthTOF)initWithJasperDepth:(id)a3 timestamp:(double)a4 projectorMode:(int64_t)a5
{
  void *v8;
  void *v9;
  CVADepthTOF *v10;

  objc_msgSend(a3, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE05F70]), "initWithDictionaryRepresentation:", v8);
  v10 = -[CVADepthTOF initWithADJasperPointCloud:timestamp:](self, "initWithADJasperPointCloud:timestamp:", v9, a4);
  -[CVADepthTOF setProjectorMode:](v10, "setProjectorMode:", a5);

  return v10;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)projectorMode
{
  return self->_projectorMode;
}

- (void)setProjectorMode:(int64_t)a3
{
  self->_projectorMode = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (ADJasperPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (void)setPointCloud:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloud, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
