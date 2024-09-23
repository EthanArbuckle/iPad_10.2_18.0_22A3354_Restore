@implementation CLKComplicationTimelineEntry

+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate
{
  return (CLKComplicationTimelineEntry *)objc_msgSend(a1, "entryWithDate:complicationTemplate:timelineAnimationGroup:", date, complicationTemplate, 0);
}

+ (CLKComplicationTimelineEntry)entryWithDate:(NSDate *)date complicationTemplate:(CLKComplicationTemplate *)complicationTemplate timelineAnimationGroup:(NSString *)timelineAnimationGroup
{
  NSString *v8;
  CLKComplicationTemplate *v9;
  NSDate *v10;
  id v11;

  v8 = timelineAnimationGroup;
  v9 = complicationTemplate;
  v10 = date;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setDate:", v10);

  objc_msgSend(v11, "setComplicationTemplate:", v9);
  objc_msgSend(v11, "setTimelineAnimationGroup:", v8);

  return (CLKComplicationTimelineEntry *)v11;
}

- (BOOL)validateComplicationFamily:(int64_t)a3
{
  CLKComplicationTemplate **p_complicationTemplate;
  BOOL v5;
  NSObject *v6;

  p_complicationTemplate = &self->_complicationTemplate;
  v5 = -[CLKComplicationTemplate isCompatibleWithFamily:](self->_complicationTemplate, "isCompatibleWithFamily:");
  if (!v5)
  {
    CLKLoggingObjectForDomain(10);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CLKComplicationTimelineEntry validateComplicationFamily:].cold.1(a3, (id *)p_complicationTemplate, v6);

  }
  return v5;
}

- (BOOL)validateWithError:(id *)a3
{
  id *v3;
  CLKComplicationTemplate *complicationTemplate;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  if (self->_date)
  {
    complicationTemplate = self->_complicationTemplate;
    if (complicationTemplate)
    {
      LOBYTE(v3) = -[CLKComplicationTemplate validateWithError:](complicationTemplate, "validateWithError:", a3);
      v5 = 0;
      goto LABEL_13;
    }
    v6 = CFSTR("complicationTemplate");
  }
  else
  {
    v6 = CFSTR("date");
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_opt_class();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v6, v8, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_12:
    LOBYTE(v3) = 0;
    goto LABEL_13;
  }
  CLKLoggingObjectForDomain(10);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[CLKComplicationTimelineEntry validateWithError:].cold.1((uint64_t)v5, v9);

  if (v3)
  {
    if (!*v3)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0FC8];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CLKComplicationTimelineErrorDomain"), 1, v11);
      *v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
LABEL_13:

  return (char)v3;
}

- (void)finalize
{
  objc_class *v3;
  CLKComplicationTemplate *complicationTemplate;
  CLKComplicationTemplate *v5;
  CLKComplicationTemplate *v6;

  if (!self->_finalized)
  {
    v3 = -[CLKComplicationTemplate finalizedCopyClass](self->_complicationTemplate, "finalizedCopyClass");
    complicationTemplate = self->_complicationTemplate;
    if (v3)
    {
      -[CLKComplicationTemplate finalizedCopy](complicationTemplate, "finalizedCopy");
      v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
      v6 = self->_complicationTemplate;
      self->_complicationTemplate = v5;

    }
    else
    {
      -[CLKComplicationTemplate finalize](complicationTemplate, "finalize");
    }
    self->_finalized = 1;
  }
}

- (id)finalizedCopy
{
  CLKComplicationTimelineEntry *v2;

  if (self->_finalized)
  {
    v2 = self;
  }
  else
  {
    v2 = (CLKComplicationTimelineEntry *)-[CLKComplicationTimelineEntry copy](self, "copy");
    -[CLKComplicationTimelineEntry finalize](v2, "finalize");
  }
  return v2;
}

- (BOOL)tl_validate:(id *)a3
{
  BOOL v4;
  BOOL v5;

  v4 = -[CLKComplicationTimelineEntry validateWithError:](self, "validateWithError:");
  v5 = v4;
  if (a3 && !v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLKComplicationEntryError"), 400, &unk_24CC18118);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_complicationTemplate, CFSTR("tmpl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timelineAnimationGroup, CFSTR("anim"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalized, CFSTR("finalized"));

}

- (CLKComplicationTimelineEntry)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationTimelineEntry *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  CLKComplicationTemplate *complicationTemplate;
  uint64_t v10;
  NSString *timelineAnimationGroup;

  v4 = a3;
  v5 = -[CLKComplicationTimelineEntry init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tmpl"));
    v8 = objc_claimAutoreleasedReturnValue();
    complicationTemplate = v5->_complicationTemplate;
    v5->_complicationTemplate = (CLKComplicationTemplate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anim"));
    v10 = objc_claimAutoreleasedReturnValue();
    timelineAnimationGroup = v5->_timelineAnimationGroup;
    v5->_timelineAnimationGroup = (NSString *)v10;

    v5->_finalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finalized"));
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTimelineEntry;
  -[CLKComplicationTimelineEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ date = %@, template = %@, animationGroup = %@"), v4, self->_date, self->_complicationTemplate, self->_timelineAnimationGroup);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  if (self->_finalized)
    return self;
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDate:", self->_date);
  objc_msgSend(v4, "setComplicationTemplate:", self->_complicationTemplate);
  objc_msgSend(v4, "setTimelineAnimationGroup:", self->_timelineAnimationGroup);
  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
  objc_storeStrong((id *)&self->_date, date);
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void)setComplicationTemplate:(CLKComplicationTemplate *)complicationTemplate
{
  objc_setProperty_nonatomic_copy(self, a2, complicationTemplate, 24);
}

- (NSString)timelineAnimationGroup
{
  return self->_timelineAnimationGroup;
}

- (void)setTimelineAnimationGroup:(NSString *)timelineAnimationGroup
{
  objc_setProperty_nonatomic_copy(self, a2, timelineAnimationGroup, 32);
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineAnimationGroup, 0);
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)validateComplicationFamily:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CLKStringForComplicationFamily(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKStringForComplicationFamily(objc_msgSend(*a2, "compatibleFamily"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_2114F4000, a3, OS_LOG_TYPE_FAULT, "Data handler called with incompatible template for complication family. Expected template for '%@', but received one for '%@'.", (uint8_t *)&v7, 0x16u);

}

- (void)validateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

@end
