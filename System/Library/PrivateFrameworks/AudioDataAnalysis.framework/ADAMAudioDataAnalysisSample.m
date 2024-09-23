@implementation ADAMAudioDataAnalysisSample

- (id)initAudioSampleWithType:(unsigned int)a3 data:(id)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  ADAMAudioDataAnalysisSample *v14;
  ADAMAudioDataAnalysisSample *v15;
  uint64_t v16;
  NSDictionary *metadata;
  uint64_t v18;
  NSUUID *uuid;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ADAMAudioDataAnalysisSample;
  v14 = -[ADAMAudioDataAnalysisSample init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->type = a3;
    objc_storeStrong((id *)&v14->data, a4);
    objc_storeStrong((id *)&v15->dateInterval, a5);
    v16 = objc_msgSend(v13, "copy");
    metadata = v15->metadata;
    v15->metadata = (NSDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uuid = v15->uuid;
    v15->uuid = (NSUUID *)v18;

  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ADAMAudioDataAnalysisSample type](self, "type"), CFSTR("kADAMAudioDataAnalysisType"));
  -[ADAMAudioDataAnalysisSample data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kADAMAudioDataAnalysisData"));

  -[ADAMAudioDataAnalysisSample dateInterval](self, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kADAMAudioDataAnalysisSampleDateInterval"));

  -[ADAMAudioDataAnalysisSample metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kADAMAudioDataAnalysisSampleMetadata"));

  -[ADAMAudioDataAnalysisSample uuid](self, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kADAMAudioDataAnalysisSampleUUID"));

}

- (ADAMAudioDataAnalysisSample)initWithCoder:(id)a3
{
  id v4;
  ADAMAudioDataAnalysisSample *v5;
  void *v6;
  uint64_t v7;
  NSNumber *data;
  uint64_t v9;
  NSDateInterval *dateInterval;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *metadata;
  uint64_t v18;
  NSUUID *uuid;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ADAMAudioDataAnalysisSample;
  v5 = -[ADAMAudioDataAnalysisSample init](&v21, sel_init);
  if (v5)
  {
    v5->type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kADAMAudioDataAnalysisType"));
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kADAMAudioDataAnalysisData"));
    objc_msgSend(v6, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();
    data = v5->data;
    v5->data = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kADAMAudioDataAnalysisSampleDateInterval"));
    v9 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->dateInterval;
    v5->dateInterval = (NSDateInterval *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kADAMAudioDataAnalysisSampleMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    metadata = v5->metadata;
    v5->metadata = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kADAMAudioDataAnalysisSampleUUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v18;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[ADAMAudioDataAnalysisSample type](self, "type");
  -[ADAMAudioDataAnalysisSample data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADAMAudioDataAnalysisSample dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ADAMAudioDataAnalysisSample metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = (void *)objc_msgSend(v5, "initAudioSampleWithType:data:dateInterval:metadata:", v6, v7, v9, v11);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ADAMAudioDataAnalysisSample uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADAMAudioDataAnalysisSample data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", -[ADAMAudioDataAnalysisSample type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADAMAudioDataAnalysisSample dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADAMAudioDataAnalysisSample metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ADAMAudioDataAnalysisSample: uuid = %@, data = %@, type = %@, date= %@, metadata= %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)data
{
  return self->data;
}

- (NSDateInterval)dateInterval
{
  return self->dateInterval;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (unsigned)type
{
  return self->type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->dateInterval, 0);
  objc_storeStrong((id *)&self->data, 0);
}

@end
