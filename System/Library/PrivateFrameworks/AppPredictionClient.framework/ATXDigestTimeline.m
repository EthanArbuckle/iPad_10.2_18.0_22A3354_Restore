@implementation ATXDigestTimeline

- (void)setFirstUpcomingViewTimestamp:(id)a3
{
  id v4;
  NSDate *firstUpcomingViewTimestamp;
  NSDate *v6;
  NSDate *v7;
  id v8;

  v4 = a3;
  firstUpcomingViewTimestamp = self->_firstUpcomingViewTimestamp;
  v8 = v4;
  if (firstUpcomingViewTimestamp)
  {
    -[NSDate earlierDate:](firstUpcomingViewTimestamp, "earlierDate:", v4);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstUpcomingViewTimestamp;
  self->_firstUpcomingViewTimestamp = v6;

}

- (void)setFirstCollapsedViewTimestamp:(id)a3
{
  id v4;
  NSDate *firstCollapsedViewTimestamp;
  NSDate *v6;
  NSDate *v7;
  id v8;

  v4 = a3;
  firstCollapsedViewTimestamp = self->_firstCollapsedViewTimestamp;
  v8 = v4;
  if (firstCollapsedViewTimestamp)
  {
    -[NSDate earlierDate:](firstCollapsedViewTimestamp, "earlierDate:", v4);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstCollapsedViewTimestamp;
  self->_firstCollapsedViewTimestamp = v6;

}

- (void)setFirstScheduledViewTimestamp:(id)a3
{
  id v4;
  NSDate *firstScheduledViewTimestamp;
  NSDate *v6;
  NSDate *v7;
  id v8;

  v4 = a3;
  firstScheduledViewTimestamp = self->_firstScheduledViewTimestamp;
  v8 = v4;
  if (firstScheduledViewTimestamp)
  {
    -[NSDate earlierDate:](firstScheduledViewTimestamp, "earlierDate:", v4);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstScheduledViewTimestamp;
  self->_firstScheduledViewTimestamp = v6;

}

- (void)setDigestRemovedTimestamp:(id)a3
{
  id v4;
  NSDate *digestRemovedTimestamp;
  NSDate *v6;
  NSDate *v7;
  id v8;

  v4 = a3;
  digestRemovedTimestamp = self->_digestRemovedTimestamp;
  v8 = v4;
  if (digestRemovedTimestamp)
  {
    -[NSDate earlierDate:](digestRemovedTimestamp, "earlierDate:", v4);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_digestRemovedTimestamp;
  self->_digestRemovedTimestamp = v6;

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXDigestTimeline *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[ATXDigestTimeline init](+[ATXDigestTimeline allocWithZone:](ATXDigestTimeline, "allocWithZone:", a3), "init");
  -[ATXDigestTimeline firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestTimeline setFirstUpcomingViewTimestamp:](v4, "setFirstUpcomingViewTimestamp:", v5);

  -[ATXDigestTimeline firstCollapsedViewTimestamp](self, "firstCollapsedViewTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestTimeline setFirstCollapsedViewTimestamp:](v4, "setFirstCollapsedViewTimestamp:", v6);

  -[ATXDigestTimeline firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestTimeline setFirstScheduledViewTimestamp:](v4, "setFirstScheduledViewTimestamp:", v7);

  -[ATXDigestTimeline digestRemovedTimestamp](self, "digestRemovedTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestTimeline setDigestRemovedTimestamp:](v4, "setDigestRemovedTimestamp:", v8);

  return v4;
}

- (BOOL)_timelineFieldsAreEqual:(id)a3 otherField:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  double v9;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  v8 = (v5 | v6) == 0;
  if (v5 && v6)
  {
    objc_msgSend((id)v5, "timeIntervalSinceDate:", v6);
    if (v9 < 0.0)
      v9 = -v9;
    v8 = v9 < 0.001;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXDigestTimeline *v4;
  ATXDigestTimeline *v5;
  BOOL v6;

  v4 = (ATXDigestTimeline *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXDigestTimeline isEqualToATXDigestTimeline:](self, "isEqualToATXDigestTimeline:", v5);

  return v6;
}

- (BOOL)isEqualToATXDigestTimeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  -[ATXDigestTimeline firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstUpcomingViewTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXDigestTimeline _timelineFieldsAreEqual:otherField:](self, "_timelineFieldsAreEqual:otherField:", v5, v6);

  if (!v7)
    goto LABEL_5;
  -[ATXDigestTimeline firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstScheduledViewTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXDigestTimeline _timelineFieldsAreEqual:otherField:](self, "_timelineFieldsAreEqual:otherField:", v8, v9);

  if (!v10)
    goto LABEL_5;
  -[ATXDigestTimeline firstCollapsedViewTimestamp](self, "firstCollapsedViewTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstCollapsedViewTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXDigestTimeline _timelineFieldsAreEqual:otherField:](self, "_timelineFieldsAreEqual:otherField:", v11, v12);

  if (v13)
  {
    -[ATXDigestTimeline digestRemovedTimestamp](self, "digestRemovedTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "digestRemovedTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ATXDigestTimeline _timelineFieldsAreEqual:otherField:](self, "_timelineFieldsAreEqual:otherField:", v14, v15);

  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXDigestTimeline encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXDigestTimeline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXDigestTimeline *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXDigestTimeline initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXDigestTimeline proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXDigestTimeline)initWithProto:(id)a3
{
  id v4;
  ATXDigestTimeline *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXDigestTimeline *v15;
  NSObject *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXDigestTimeline;
  v5 = -[ATXDigestTimeline init](&v18, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v4;
        if (objc_msgSend(v6, "hasFirstUpcomingViewTimestamp"))
        {
          v7 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "firstUpcomingViewTimestamp");
          objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:", v8);

        }
        if (objc_msgSend(v6, "hasFirstCollapsedViewTimestamp"))
        {
          v9 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "firstCollapsedViewTimestamp");
          objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXDigestTimeline setFirstCollapsedViewTimestamp:](v5, "setFirstCollapsedViewTimestamp:", v10);

        }
        if (objc_msgSend(v6, "hasFirstScheduledViewTimestamp"))
        {
          v11 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "firstScheduledViewTimestamp");
          objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXDigestTimeline setFirstScheduledViewTimestamp:](v5, "setFirstScheduledViewTimestamp:", v12);

        }
        if (objc_msgSend(v6, "hasDigestRemovedTimestamp"))
        {
          v13 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "digestRemovedTimestamp");
          objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXDigestTimeline setDigestRemovedTimestamp:](v5, "setDigestRemovedTimestamp:", v14);

        }
        goto LABEL_13;
      }
      __atxlog_handle_notification_management();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)v5, v16);

    }
    v15 = 0;
    goto LABEL_18;
  }
LABEL_13:
  v15 = v5;
LABEL_18:

  return v15;
}

- (ATXDigestTimeline)initWithProtoData:(id)a3
{
  id v4;
  ATXPBDigestTimeline *v5;
  ATXDigestTimeline *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBDigestTimeline initWithData:]([ATXPBDigestTimeline alloc], "initWithData:", v4);

    self = -[ATXDigestTimeline initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
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

  v3 = (void *)objc_opt_new();
  -[ATXDigestTimeline firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ATXDigestTimeline firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setFirstUpcomingViewTimestamp:");

  }
  -[ATXDigestTimeline firstCollapsedViewTimestamp](self, "firstCollapsedViewTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ATXDigestTimeline firstCollapsedViewTimestamp](self, "firstCollapsedViewTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setFirstCollapsedViewTimestamp:");

  }
  -[ATXDigestTimeline firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ATXDigestTimeline firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setFirstScheduledViewTimestamp:");

  }
  -[ATXDigestTimeline digestRemovedTimestamp](self, "digestRemovedTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ATXDigestTimeline digestRemovedTimestamp](self, "digestRemovedTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setDigestRemovedTimestamp:");

  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXDigestTimeline *v6;

  v4 = a3;
  v5 = -[ATXPBDigestTimeline initFromJSON:]([ATXPBDigestTimeline alloc], "initFromJSON:", v4);

  v6 = -[ATXDigestTimeline initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXDigestTimeline proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXDigestTimeline jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (NSDate)firstCollapsedViewTimestamp
{
  return self->_firstCollapsedViewTimestamp;
}

- (NSDate)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (NSDate)digestRemovedTimestamp
{
  return self->_digestRemovedTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestRemovedTimestamp, 0);
  objc_storeStrong((id *)&self->_firstScheduledViewTimestamp, 0);
  objc_storeStrong((id *)&self->_firstCollapsedViewTimestamp, 0);
  objc_storeStrong((id *)&self->_firstUpcomingViewTimestamp, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end
