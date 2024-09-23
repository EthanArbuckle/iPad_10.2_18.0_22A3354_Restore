@implementation CHSTimelineEntryRelevanceBox

- (CHSTimelineEntryRelevanceBox)init
{
  void *v3;
  CHSTimelineEntryRelevanceBox *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CHSTimelineEntryRelevanceBox initWithEntries:](self, "initWithEntries:", v3);

  return v4;
}

- (CHSTimelineEntryRelevanceBox)initWithEntries:(id)a3
{
  id v5;
  CHSTimelineEntryRelevanceBox *v6;
  CHSTimelineEntryRelevanceBox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSTimelineEntryRelevanceBox;
  v6 = -[CHSTimelineEntryRelevanceBox init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timelineRelevanceEntries, a3);

  return v7;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_timelineRelevanceEntries, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[2], "isEqualToDictionary:", self->_timelineRelevanceEntries);
  else
    v5 = 0;

  return v5;
}

- (void)prepareForEncoding
{
  NSData *v3;
  NSData *archivedData;

  -[CHSTimelineEntryRelevanceBox bs_secureEncoded](self, "bs_secureEncoded");
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  archivedData = self->_archivedData;
  self->_archivedData = v3;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_timelineRelevanceEntries, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (CHSTimelineEntryRelevanceBox)initWithCoder:(id)a3
{
  id v4;
  CHSTimelineEntryRelevanceBox *v5;
  void *v6;
  id *p_isa;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHSTimelineEntryRelevanceBox;
  v5 = -[CHSTimelineEntryRelevanceBox init](&v14, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("data")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureObjectFromData:ofClass:", v6, objc_opt_class());
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v5->_timelineRelevanceEntries, p_isa[2]);
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("timelineRelevanceEntries"));
      v12 = objc_claimAutoreleasedReturnValue();
      p_isa = (id *)&v5->_timelineRelevanceEntries->super.isa;
      v5->_timelineRelevanceEntries = (NSDictionary *)v12;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *archivedData;
  id v6;

  v4 = a3;
  archivedData = self->_archivedData;
  v6 = v4;
  if (archivedData)
    objc_msgSend(v4, "encodeObject:forKey:", archivedData, CFSTR("data"));
  else
    objc_msgSend(v4, "encodeObject:forKey:", self->_timelineRelevanceEntries, CFSTR("timelineRelevanceEntries"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)timelineRelevanceEntries
{
  return self->_timelineRelevanceEntries;
}

- (void)setTimelineRelevanceEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRelevanceEntries, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end
