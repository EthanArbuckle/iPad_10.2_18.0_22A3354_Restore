@implementation ATXSharedDigestEngagementTrackingMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  ATXSharedDigestEngagementTrackingMetrics *v4;
  void *v5;

  v4 = -[ATXSharedDigestEngagementTrackingMetrics init](+[ATXSharedDigestEngagementTrackingMetrics allocWithZone:](ATXSharedDigestEngagementTrackingMetrics, "allocWithZone:", a3), "init");
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInUpcoming:](v4, "setNumEngagementsInUpcoming:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInScheduled:](v4, "setNumEngagementsInScheduled:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsAfterExpiration:](v4, "setNumEngagementsAfterExpiration:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumExpansions:](v4, "setNumExpansions:", -[ATXSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumDigestExpansions:](v4, "setNumDigestExpansions:", -[ATXSharedDigestEngagementTrackingMetrics numDigestExpansions](self, "numDigestExpansions"));
  -[ATXSharedDigestEngagementTrackingMetrics sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSharedDigestEngagementTrackingMetrics setSectionIdentifier:](v4, "setSectionIdentifier:", v5);

  -[ATXSharedDigestEngagementTrackingMetrics setSectionPosition:](v4, "setSectionPosition:", -[ATXSharedDigestEngagementTrackingMetrics sectionPosition](self, "sectionPosition"));
  -[ATXSharedDigestEngagementTrackingMetrics setSectionSize:](v4, "setSectionSize:", -[ATXSharedDigestEngagementTrackingMetrics sectionSize](self, "sectionSize"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXSharedDigestEngagementTrackingMetrics *v4;
  ATXSharedDigestEngagementTrackingMetrics *v5;
  BOOL v6;

  v4 = (ATXSharedDigestEngagementTrackingMetrics *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSharedDigestEngagementTrackingMetrics isEqualToATXSharedDigestEngagementTrackingMetrics:](self, "isEqualToATXSharedDigestEngagementTrackingMetrics:", v5);

  return v6;
}

- (BOOL)isEqualToATXSharedDigestEngagementTrackingMetrics:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSString *v12;
  NSString *v13;
  char v14;

  v4 = a3;
  v5 = -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming");
  if (v5 == objc_msgSend(v4, "numEngagementsInUpcoming")
    && (v6 = -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled"),
        v6 == objc_msgSend(v4, "numEngagementsInScheduled"))
    && (v7 = -[ATXSharedDigestEngagementTrackingMetrics numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"), v7 == objc_msgSend(v4, "numEngagementsAfterExpiration"))&& (v8 = -[ATXSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions"), v8 == objc_msgSend(v4, "numExpansions"))&& (v9 = -[ATXSharedDigestEngagementTrackingMetrics numDigestExpansions](self, "numDigestExpansions"), v9 == objc_msgSend(v4, "numDigestExpansions"))&& (v10 = -[ATXSharedDigestEngagementTrackingMetrics sectionPosition](self, "sectionPosition"), v10 == objc_msgSend(v4, "sectionPosition"))&& (v11 = -[ATXSharedDigestEngagementTrackingMetrics sectionSize](self, "sectionSize"), v11 == objc_msgSend(v4, "sectionSize")))
  {
    v12 = self->_sectionIdentifier;
    v13 = v12;
    if (v12 == (NSString *)v4[6])
      v14 = 1;
    else
      v14 = -[NSString isEqual:](v12, "isEqual:");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)addMetricsFromOtherTracker:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration")+ objc_msgSend(v4, "numEngagementsAfterExpiration"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled")+ objc_msgSend(v4, "numEngagementsInScheduled"));
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming")+ objc_msgSend(v4, "numEngagementsInUpcoming"));
  v5 = objc_msgSend(v4, "numExpansions");

  -[ATXSharedDigestEngagementTrackingMetrics setNumExpansions:](self, "setNumExpansions:", -[ATXSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions") + v5);
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
  -[ATXSharedDigestEngagementTrackingMetrics encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSharedDigestEngagementTrackingMetrics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSharedDigestEngagementTrackingMetrics *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXSharedDigestEngagementTrackingMetrics initWithProtoData:](self, "initWithProtoData:", v5);
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

  -[ATXSharedDigestEngagementTrackingMetrics proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSharedDigestEngagementTrackingMetrics)initWithProto:(id)a3
{
  id v4;
  ATXSharedDigestEngagementTrackingMetrics *v5;
  id v6;
  uint64_t v7;
  NSString *sectionIdentifier;
  uint64_t v9;
  ATXSharedDigestEngagementTrackingMetrics *v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSharedDigestEngagementTrackingMetrics;
  v5 = -[ATXSharedDigestEngagementTrackingMetrics init](&v13, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!v4)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)v5, v11);

    goto LABEL_9;
  }
  v6 = v4;
  v5->_numEngagementsInUpcoming = objc_msgSend(v6, "numEngagementsInUpcoming");
  v5->_numEngagementsInScheduled = objc_msgSend(v6, "numEngagementsInScheduled");
  v5->_numEngagementsAfterExpiration = objc_msgSend(v6, "numEngagementsAfterExpiration");
  v5->_numExpansions = objc_msgSend(v6, "numExpansions");
  objc_msgSend(v6, "sectionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  sectionIdentifier = v5->_sectionIdentifier;
  v5->_sectionIdentifier = (NSString *)v7;

  v5->_sectionPosition = objc_msgSend(v6, "sectionPosition");
  v5->_sectionSize = objc_msgSend(v6, "sectionSize");
  v9 = objc_msgSend(v6, "numDigestExpansions");

  v5->_numDigestExpansions = v9;
LABEL_5:
  v10 = v5;
LABEL_10:

  return v10;
}

- (ATXSharedDigestEngagementTrackingMetrics)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSharedDigestEngagementTrackingMetrics *v5;
  ATXSharedDigestEngagementTrackingMetrics *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSharedDigestEngagementTrackingMetrics initWithData:]([ATXPBSharedDigestEngagementTrackingMetrics alloc], "initWithData:", v4);

    self = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setNumEngagementsInUpcoming:", self->_numEngagementsInUpcoming);
  objc_msgSend(v3, "setNumEngagementsInScheduled:", self->_numEngagementsInScheduled);
  objc_msgSend(v3, "setNumEngagementsAfterExpiration:", self->_numEngagementsAfterExpiration);
  objc_msgSend(v3, "setNumExpansions:", self->_numExpansions);
  objc_msgSend(v3, "setSectionIdentifier:", self->_sectionIdentifier);
  objc_msgSend(v3, "setSectionPosition:", self->_sectionPosition);
  objc_msgSend(v3, "setSectionSize:", self->_sectionSize);
  objc_msgSend(v3, "setNumDigestExpansions:", self->_numDigestExpansions);
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXSharedDigestEngagementTrackingMetrics *v6;

  v4 = a3;
  v5 = -[ATXPBSharedDigestEngagementTrackingMetrics initFromJSON:]([ATXPBSharedDigestEngagementTrackingMetrics alloc], "initFromJSON:", v4);

  v6 = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXSharedDigestEngagementTrackingMetrics proto](self, "proto");
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
  -[ATXSharedDigestEngagementTrackingMetrics jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  self->_numEngagementsInScheduled = a3;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  self->_numEngagementsAfterExpiration = a3;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (void)setNumExpansions:(unint64_t)a3
{
  self->_numExpansions = a3;
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  self->_numDigestExpansions = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (void)setSectionPosition:(unint64_t)a3
{
  self->_sectionPosition = a3;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (void)setSectionSize:(unint64_t)a3
{
  self->_sectionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
