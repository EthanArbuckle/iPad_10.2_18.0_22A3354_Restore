@implementation CTSweetgumUsagePlanMetrics

- (CTSweetgumUsagePlanMetrics)init
{
  CTSweetgumUsagePlanMetrics *v2;
  CTSweetgumUsagePlanMetrics *v3;
  NSString *planLabel;
  CTSweetgumUsagePlanItemData *dataUsage;
  CTSweetgumUsagePlanItemMessages *messages;
  CTSweetgumUsagePlanItemVoice *voice;
  NSString *remainingBalance;
  NSDate *lastUpdatedAt;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUsagePlanMetrics;
  v2 = -[CTSweetgumUsagePlanMetrics init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    planLabel = v2->_planLabel;
    v2->_planLabel = 0;

    dataUsage = v3->_dataUsage;
    v3->_planCategory = 0;
    v3->_dataUsage = 0;
    v3->_currentUsedPlan = 0;

    messages = v3->_messages;
    v3->_messages = 0;

    voice = v3->_voice;
    v3->_voice = 0;

    remainingBalance = v3->_remainingBalance;
    v3->_remainingBalance = 0;

    v3->_throttled = 0;
    lastUpdatedAt = v3->_lastUpdatedAt;
    v3->_lastUpdatedAt = 0;

  }
  return v3;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSweetgumUsagePlanMetrics planLabel](self, "planLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planLabel=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", planCategory=%s"), CTSweetgumPlanCategoryAsString(-[CTSweetgumUsagePlanMetrics planCategory](self, "planCategory")));
  objc_msgSend(v3, "appendFormat:", CFSTR(", currentUsedPlan=%d"), -[CTSweetgumUsagePlanMetrics currentUsedPlan](self, "currentUsedPlan"));
  -[CTSweetgumUsagePlanMetrics dataUsage](self, "dataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", data=%@"), v5);

  -[CTSweetgumUsagePlanMetrics messages](self, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messages=%@"), v6);

  -[CTSweetgumUsagePlanMetrics voice](self, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", voice=%@"), v7);

  -[CTSweetgumUsagePlanMetrics remainingBalance](self, "remainingBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", remainingBalance=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", throttled=%d"), -[CTSweetgumUsagePlanMetrics throttled](self, "throttled"));
  -[CTSweetgumUsagePlanMetrics lastUpdatedAt](self, "lastUpdatedAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", lastUpdatedAt=%@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTSweetgumUsagePlanMetrics *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v7 = (CTSweetgumUsagePlanMetrics *)a3;
  if (v7 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumUsagePlanMetrics planLabel](self, "planLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanMetrics planLabel](v7, "planLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[CTSweetgumUsagePlanMetrics planLabel](self, "planLabel");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics planLabel](v7, "planLabel");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          v10 = 0;
          goto LABEL_44;
        }
      }
      v11 = -[CTSweetgumUsagePlanMetrics planCategory](self, "planCategory");
      if (v11 != -[CTSweetgumUsagePlanMetrics planCategory](v7, "planCategory")
        || (v12 = -[CTSweetgumUsagePlanMetrics currentUsedPlan](self, "currentUsedPlan"),
            v12 != -[CTSweetgumUsagePlanMetrics currentUsedPlan](v7, "currentUsedPlan")))
      {
        v10 = 0;
        goto LABEL_43;
      }
      -[CTSweetgumUsagePlanMetrics dataUsage](self, "dataUsage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanMetrics dataUsage](v7, "dataUsage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v14)
      {
        -[CTSweetgumUsagePlanMetrics dataUsage](self, "dataUsage");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics dataUsage](v7, "dataUsage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v15))
        {
          v10 = 0;
          goto LABEL_41;
        }
        v53 = v15;
      }
      -[CTSweetgumUsagePlanMetrics messages](self, "messages");
      v16 = objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanMetrics messages](v7, "messages");
      v17 = objc_claimAutoreleasedReturnValue();
      v55 = v13;
      v56 = (void *)v16;
      v18 = v16 == v17;
      v19 = (void *)v17;
      if (v18)
      {
        v54 = (void *)v17;
      }
      else
      {
        v20 = v5;
        -[CTSweetgumUsagePlanMetrics messages](self, "messages");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics messages](v7, "messages");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v10 = 0;
          v24 = v19;
          v27 = v56;
LABEL_39:

LABEL_40:
          v15 = v53;
          v5 = v20;
          v13 = v55;
          if (v55 == v14)
          {
LABEL_42:

LABEL_43:
            if (v8 == v9)
            {
LABEL_45:

              goto LABEL_46;
            }
LABEL_44:

            goto LABEL_45;
          }
LABEL_41:

          goto LABEL_42;
        }
        v54 = v19;
        v5 = v20;
      }
      -[CTSweetgumUsagePlanMetrics voice](self, "voice");
      v22 = objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanMetrics voice](v7, "voice");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v22;
      v48 = v14;
      if (v22 != v49)
      {
        -[CTSweetgumUsagePlanMetrics voice](self, "voice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics voice](v7, "voice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v20 = v5;
          v24 = v54;
          v10 = 0;
          v25 = (void *)v49;
          v26 = v50;
LABEL_37:

LABEL_38:
          v27 = v56;
          v14 = v48;
          if (v56 == v24)
            goto LABEL_40;
          goto LABEL_39;
        }
      }
      -[CTSweetgumUsagePlanMetrics remainingBalance](self, "remainingBalance");
      v28 = objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanMetrics remainingBalance](v7, "remainingBalance");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v28;
      if (v28 == v46)
      {
        v43 = v5;
      }
      else
      {
        -[CTSweetgumUsagePlanMetrics remainingBalance](self, "remainingBalance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics remainingBalance](v7, "remainingBalance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v29;
        v30 = objc_msgSend(v29, "isEqualToString:");
        v31 = v54;
        if (!v30)
        {
          v20 = v5;
          v10 = 0;
          v39 = (void *)v46;
          v38 = v47;
          goto LABEL_34;
        }
        v43 = v5;
      }
      v32 = -[CTSweetgumUsagePlanMetrics throttled](self, "throttled");
      if (v32 == -[CTSweetgumUsagePlanMetrics throttled](v7, "throttled"))
      {
        -[CTSweetgumUsagePlanMetrics lastUpdatedAt](self, "lastUpdatedAt");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanMetrics lastUpdatedAt](v7, "lastUpdatedAt");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

          v10 = 1;
        }
        else
        {
          v35 = (void *)v34;
          -[CTSweetgumUsagePlanMetrics lastUpdatedAt](self, "lastUpdatedAt");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSweetgumUsagePlanMetrics lastUpdatedAt](v7, "lastUpdatedAt");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v36, "isEqualToDate:", v37);

        }
      }
      else
      {
        v10 = 0;
      }
      v39 = (void *)v46;
      v38 = v47;
      v20 = v43;
      v31 = v54;
      if (v47 == (void *)v46)
      {
        v24 = v54;
LABEL_36:

        v25 = (void *)v49;
        v26 = v50;
        if (v50 == (void *)v49)
          goto LABEL_38;
        goto LABEL_37;
      }
LABEL_34:
      v24 = v31;

      goto LABEL_36;
    }
    v10 = 0;
  }
LABEL_46:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *planLabel;
  id v5;

  planLabel = self->_planLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", planLabel, CFSTR("planLabel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_planCategory, CFSTR("planCategory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_currentUsedPlan, CFSTR("currentUsedPlan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataUsage, CFSTR("dataUsage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messages, CFSTR("messages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voice, CFSTR("voice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remainingBalance, CFSTR("remainingBalance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_throttled, CFSTR("throttled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedAt, CFSTR("lastUpdatedAt"));

}

- (CTSweetgumUsagePlanMetrics)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumUsagePlanMetrics *v5;
  uint64_t v6;
  NSString *planLabel;
  uint64_t v8;
  CTSweetgumUsagePlanItemData *dataUsage;
  uint64_t v10;
  CTSweetgumUsagePlanItemMessages *messages;
  uint64_t v12;
  CTSweetgumUsagePlanItemVoice *voice;
  uint64_t v14;
  NSString *remainingBalance;
  uint64_t v16;
  NSDate *lastUpdatedAt;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTSweetgumUsagePlanMetrics;
  v5 = -[CTSweetgumUsagePlanMetrics init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    planLabel = v5->_planLabel;
    v5->_planLabel = (NSString *)v6;

    v5->_planCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planCategory"));
    v5->_currentUsedPlan = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("currentUsedPlan"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataUsage"));
    v8 = objc_claimAutoreleasedReturnValue();
    dataUsage = v5->_dataUsage;
    v5->_dataUsage = (CTSweetgumUsagePlanItemData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messages"));
    v10 = objc_claimAutoreleasedReturnValue();
    messages = v5->_messages;
    v5->_messages = (CTSweetgumUsagePlanItemMessages *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voice"));
    v12 = objc_claimAutoreleasedReturnValue();
    voice = v5->_voice;
    v5->_voice = (CTSweetgumUsagePlanItemVoice *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    remainingBalance = v5->_remainingBalance;
    v5->_remainingBalance = (NSString *)v14;

    v5->_throttled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("throttled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedAt"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastUpdatedAt = v5->_lastUpdatedAt;
    v5->_lastUpdatedAt = (NSDate *)v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
  objc_storeStrong((id *)&self->_planLabel, a3);
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_planCategory = a3;
}

- (BOOL)currentUsedPlan
{
  return self->_currentUsedPlan;
}

- (void)setCurrentUsedPlan:(BOOL)a3
{
  self->_currentUsedPlan = a3;
}

- (CTSweetgumUsagePlanItemData)dataUsage
{
  return self->_dataUsage;
}

- (void)setDataUsage:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsage, a3);
}

- (CTSweetgumUsagePlanItemMessages)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (CTSweetgumUsagePlanItemVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (NSString)remainingBalance
{
  return self->_remainingBalance;
}

- (void)setRemainingBalance:(id)a3
{
  objc_storeStrong((id *)&self->_remainingBalance, a3);
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (NSDate)lastUpdatedAt
{
  return self->_lastUpdatedAt;
}

- (void)setLastUpdatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_remainingBalance, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_dataUsage, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
}

@end
