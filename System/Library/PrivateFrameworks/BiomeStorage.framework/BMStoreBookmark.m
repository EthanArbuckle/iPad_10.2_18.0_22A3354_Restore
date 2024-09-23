@implementation BMStoreBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMStoreBookmark encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMStoreBookmark proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setStreamId:", self->_streamId);
  objc_msgSend(v3, "setSegmentName:", self->_segmentName);
  objc_msgSend(v3, "setIterationStartTime:", self->_iterationStartTime);
  objc_msgSend(v3, "setOffset:", LODWORD(self->_offset));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BMStoreBookmark *v4;
  BMStoreBookmark *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = (BMStoreBookmark *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BMStoreBookmark streamId](v5, "streamId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreBookmark streamId](self, "streamId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[BMStoreBookmark segmentName](v5, "segmentName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMStoreBookmark segmentName](self, "segmentName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = -[BMStoreBookmark offset](v5, "offset");
          v11 = v10 == -[BMStoreBookmark offset](self, "offset");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BMStoreBookmark)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  BMStoreBookmark *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    self = -[BMStoreBookmark initWithProtoData:](self, "initWithProtoData:", v7);
    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BMStoreBookmark checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v9, CFSTR("streamId"), v4, v6, -1))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segmentName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[BMStoreBookmark checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v10, CFSTR("segmentName"), v4, v6, -1)|| (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("iterationStartTime")), v12 = v11, -[BMStoreBookmark checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("iterationStartTime"), v4, v6, -1)))
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offset"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[BMStoreBookmark checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v13, CFSTR("offset"), v4, v6, -1))
        {
          v8 = 0;
        }
        else
        {
          self = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:](self, "initWithStream:segment:iterationStartTime:offset:", v9, v10, objc_msgSend(v13, "unsignedIntValue"), v12);
          v8 = self;
        }

      }
    }

  }
  return v8;
}

- (BMStoreBookmark)initWithProtoData:(id)a3
{
  id v4;
  BMPBStoreBookmark *v5;
  BMStoreBookmark *v6;

  v4 = a3;
  v5 = -[BMPBStoreBookmark initWithData:]([BMPBStoreBookmark alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[BMStoreBookmark initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMStoreBookmark)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unsigned int v10;
  BMStoreBookmark *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "streamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segmentName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iterationStartTime");
    v9 = v8;
    v10 = objc_msgSend(v5, "offset");

    self = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:](self, "initWithStream:segment:iterationStartTime:offset:", v6, v7, v10, v9);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BMStoreBookmark)initWithStream:(id)a3 segment:(id)a4 iterationStartTime:(double)a5 offset:(unint64_t)a6
{
  id v11;
  id v12;
  BMStoreBookmark *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *segmentName;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BMStoreBookmark;
  v13 = -[BMStoreBookmark init](&v24, sel_init);
  if (!v13)
    goto LABEL_12;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BMStoreBookmark.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("streamId != nil"));

  }
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BMStoreBookmark.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[streamId length] != 0"));

    if (v12)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BMStoreBookmark.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segmentName != nil"));

    goto LABEL_6;
  }
  if (!v12)
    goto LABEL_14;
LABEL_6:
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BMStoreBookmark.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[segmentName length] != 0"));

  }
  BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v11;
  objc_storeStrong((id *)&v13->_streamId, v16);

  v17 = objc_msgSend(v12, "copy");
  segmentName = v13->_segmentName;
  v13->_segmentName = (NSString *)v17;

  v13->_iterationStartTime = a5;
  v13->_offset = a6;
LABEL_12:

  return v13;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (double)iterationStartTime
{
  return self->_iterationStartTime;
}

- (id)_descriptionDict
{
  unint64_t offset;
  __CFString *v4;
  NSString *segmentName;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  offset = self->_offset;
  if (offset == 0xFFFFFFFF)
  {
    v4 = CFSTR("Start of segment");
  }
  else if (offset == 4294967294)
  {
    v4 = CFSTR("End of frames");
  }
  else
  {
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%zu"), self->_offset);
  }
  v9[0] = CFSTR("streamId");
  v9[1] = CFSTR("segmentName");
  segmentName = self->_segmentName;
  v10[0] = self->_streamId;
  v10[1] = segmentName;
  v9[2] = CFSTR("iterationStartTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_iterationStartTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = CFSTR("offset");
  v10[2] = v6;
  v10[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreBookmark _descriptionDict](self, "_descriptionDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[BMStoreBookmark streamId](self, "streamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMStoreBookmark segmentName](self, "segmentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BMStoreBookmark offset](self, "offset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

@end
