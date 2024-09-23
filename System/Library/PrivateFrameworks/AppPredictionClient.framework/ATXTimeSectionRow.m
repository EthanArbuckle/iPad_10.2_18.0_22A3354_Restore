@implementation ATXTimeSectionRow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeSectionRow)initWithEvents:(id)a3 accessories:(id)a4 dateComponents:(id)a5 isCurrent:(BOOL)a6 prominence:(int64_t)a7 identifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ATXTimeSectionRow *v19;
  uint64_t v20;
  NSArray *events;
  uint64_t v22;
  NSArray *accessories;
  uint64_t v24;
  NSDateComponents *dateComponents;
  uint64_t v26;
  NSString *identifier;
  ATXTimeSectionRow *v28;
  void *v30;
  void *v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXTimeSectionRow.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("events"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXTimeSectionRow.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)ATXTimeSectionRow;
  v19 = -[ATXTimeSectionRow init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    events = v19->_events;
    v19->_events = (NSArray *)v20;

    v22 = objc_msgSend(v16, "copy");
    accessories = v19->_accessories;
    v19->_accessories = (NSArray *)v22;

    v24 = objc_msgSend(v17, "copy");
    dateComponents = v19->_dateComponents;
    v19->_dateComponents = (NSDateComponents *)v24;

    v19->_isCurrent = a6;
    v19->_prominence = a7;
    v26 = objc_msgSend(v18, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v26;

    v28 = v19;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *events;
  id v5;

  events = self->_events;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", events, CFSTR("events"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessories, CFSTR("accessories"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateComponents, CFSTR("dateComponents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrent, CFSTR("isCurrent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_prominence, CFSTR("prominence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (ATXTimeSectionRow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ATXTimeSectionRow *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("events"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("accessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrent"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("prominence"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATXTimeSectionRow initWithEvents:accessories:dateComponents:isCurrent:prominence:identifier:](self, "initWithEvents:accessories:dateComponents:isCurrent:prominence:identifier:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (int64_t)prominence
{
  return self->_prominence;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
