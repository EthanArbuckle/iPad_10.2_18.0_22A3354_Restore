@implementation SGEvent

- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tagStrings:(id)a17 URL:(id)a18 naturalLanguageEventIdentifier:(id)a19 naturalLanguageEventAttributes:(unint64_t)a20 schemaOrg:(id)a21
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  SGEvent *v34;
  uint64_t v35;
  NSString *opaqueKey;
  uint64_t v37;
  NSString *uniqueKey;
  uint64_t v39;
  NSString *title;
  uint64_t v41;
  NSString *notes;
  uint64_t v43;
  NSDate *start;
  uint64_t v45;
  NSDate *end;
  uint64_t v47;
  NSDate *creationDate;
  uint64_t v49;
  NSDate *lastModifiedDate;
  uint64_t v51;
  NSArray *locations;
  uint64_t v53;
  NSURL *URL;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v64 = a5;
  v24 = a6;
  v62 = a7;
  v25 = a8;
  v65 = a9;
  v26 = a10;
  v27 = a11;
  v61 = a12;
  v63 = a14;
  v28 = a15;
  v29 = a16;
  v60 = a17;
  v30 = v24;
  v31 = a18;
  v32 = v27;
  v59 = a19;
  v33 = a21;
  v66.receiver = self;
  v66.super_class = (Class)SGEvent;
  v34 = -[SGObject initWithRecordId:origin:](&v66, sel_initWithRecordId_origin_, a3, a4);
  if (v34)
  {
    v35 = objc_msgSend(v30, "copy");
    opaqueKey = v34->_opaqueKey;
    v34->_opaqueKey = (NSString *)v35;

    v37 = objc_msgSend(v64, "copy");
    uniqueKey = v34->_uniqueKey;
    v34->_uniqueKey = (NSString *)v37;

    v39 = objc_msgSend(v62, "copy");
    title = v34->_title;
    v34->_title = (NSString *)v39;

    v41 = objc_msgSend(v25, "copy");
    notes = v34->_notes;
    v34->_notes = (NSString *)v41;

    v43 = objc_msgSend(v65, "copy");
    start = v34->_start;
    v34->_start = (NSDate *)v43;

    objc_storeStrong((id *)&v34->_startTimeZone, a10);
    v45 = objc_msgSend(v32, "copy");
    end = v34->_end;
    v34->_end = (NSDate *)v45;

    objc_storeStrong((id *)&v34->_endTimeZone, a12);
    v34->_isAllDay = a13;
    v47 = objc_msgSend(v63, "copy");
    creationDate = v34->_creationDate;
    v34->_creationDate = (NSDate *)v47;

    v49 = objc_msgSend(v28, "copy");
    lastModifiedDate = v34->_lastModifiedDate;
    v34->_lastModifiedDate = (NSDate *)v49;

    objc_msgSend(v29, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_8835);
    v51 = objc_claimAutoreleasedReturnValue();
    locations = v34->_locations;
    v34->_locations = (NSArray *)v51;

    objc_storeStrong((id *)&v34->_tags, a17);
    v53 = objc_msgSend(v31, "copy");
    URL = v34->_URL;
    v34->_URL = (NSURL *)v53;

    objc_storeStrong((id *)&v34->_naturalLanguageEventTypeIdentifier, a19);
    v34->_naturalLanguageEventAttributes = a20;
    objc_storeStrong((id *)&v34->_schemaOrg, a21);
  }

  return v34;
}

- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  SGEvent *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v48 = a4;
  v63 = a5;
  v62 = a6;
  v61 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v60 = a11;
  v55 = a12;
  v54 = a14;
  v26 = a15;
  v53 = a16;
  v27 = a17;
  v52 = a18;
  sgMapSelector(v27, (uint64_t)sel_name);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag naturalLanguageEvent](SGEntityTag, "naturalLanguageEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "containsObject:", v28);

  if (v29)
  {
    -[SGEvent _naturalLanguageEventTagsInTags:](self, "_naturalLanguageEventTagsInTags:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "first");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "second");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntegerValue");

  }
  else
  {
    v49 = 0;
    v32 = 0;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v33 = v27;
  v34 = (id)objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  v58 = v25;
  v59 = v24;
  v50 = v23;
  if (v34)
  {
    v47 = v32;
    v35 = *(_QWORD *)v67;
    while (2)
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v35)
          objc_enumerationMutation(v33);
        v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v37, "isSchemaOrg"))
        {
          v38 = (void *)MEMORY[0x1E0CB36D8];
          objc_msgSend(v37, "value");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "dataUsingEncoding:", 4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0;
          objc_msgSend(v38, "JSONObjectWithData:options:error:", v40, 0, &v65);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v65;

          v34 = 0;
          if (!v42)
            v34 = v41;

          goto LABEL_16;
        }
      }
      v34 = (id)objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v34)
        continue;
      break;
    }
LABEL_16:
    v43 = v64;
    v32 = v47;
    v44 = v48;
  }
  else
  {
    v43 = v64;
    v44 = v48;
  }

  LOBYTE(v46) = a13;
  v57 = -[SGEvent initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:](self, "initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:", v43, v44, v63, v62, v61, v50, v59, v58, v60, v55, v46, v54, v26, v53, v51, v52,
          v49,
          v32,
          v34);

  return v57;
}

- (id)_componentsForDate:(id)a3 timeZone:(id)a4 isEnd:(BOOL)a5 calendar:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1A8583A40]();
  v13 = (void *)objc_msgSend(a6, "copy");
  v14 = v13;
  if (v11)
  {
    objc_msgSend(v13, "setTimeZone:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimeZone:", v15);

  }
  v16 = 1048604;
  if (self->_isAllDay)
    v17 = 1048604;
  else
    v17 = 1048828;
  if (!self->_isAllDay || !v7)
  {
    v16 = v17;
  }
  else
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v10, -1.0);

    v10 = (id)v19;
  }
  objc_msgSend(v14, "components:fromDate:", v16, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimeZone:", v11);
  objc_autoreleasePoolPop(v12);

  return v20;
}

- (id)startDateComponents
{
  NSDate *start;
  NSTimeZone *startTimeZone;
  void *v5;
  void *v6;

  start = self->_start;
  startTimeZone = self->_startTimeZone;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEvent _componentsForDate:timeZone:isEnd:calendar:](self, "_componentsForDate:timeZone:isEnd:calendar:", start, startTimeZone, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)endDateComponents
{
  NSDate *end;
  NSTimeZone *endTimeZone;
  void *v5;
  void *v6;

  end = self->_end;
  endTimeZone = self->_endTimeZone;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEvent _componentsForDate:timeZone:isEnd:calendar:](self, "_componentsForDate:timeZone:isEnd:calendar:", end, endTimeZone, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SGEvent end](self, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEvent start](self, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "components:fromDate:", 1048828, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTimeZone:", v6);
  objc_msgSend(v9, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isGeocodeCandidate
{
  return +[SGEventGeocode isGeocodeCandidate:](SGEventGeocode, "isGeocodeCandidate:", self);
}

- (void)geocodeWithCallback:(id)a3
{
  +[SGEventGeocode geocodeEvent:withCallback:](SGEventGeocode, "geocodeEvent:withCallback:", self, a3);
}

- (SGEvent)initWithCoder:(id)a3
{
  id v4;
  SGEvent *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueKey;
  void *v9;
  uint64_t v10;
  NSString *opaqueKey;
  void *v12;
  uint64_t v13;
  NSURL *URL;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  uint64_t v19;
  NSString *notes;
  void *v21;
  uint64_t v22;
  NSDate *start;
  void *v24;
  uint64_t v25;
  NSTimeZone *startTimeZone;
  void *v27;
  uint64_t v28;
  NSDate *end;
  void *v30;
  uint64_t v31;
  NSTimeZone *endTimeZone;
  void *v33;
  uint64_t v34;
  NSDate *creationDate;
  void *v36;
  uint64_t v37;
  NSDate *lastModifiedDate;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSArray *locations;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSArray *tags;
  void *v49;
  uint64_t v50;
  NSString *naturalLanguageEventTypeIdentifier;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSArray *schemaOrg;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SGEvent;
  v5 = -[SGObject initWithCoder:](&v59, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("uniqueKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueKey = v5->_uniqueKey;
    v5->_uniqueKey = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("opaqueKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    opaqueKey = v5->_opaqueKey;
    v5->_opaqueKey = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("URL"));
    v13 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("title"));
    v16 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("notes"));
    v19 = objc_claimAutoreleasedReturnValue();
    notes = v5->_notes;
    v5->_notes = (NSString *)v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("start"));
    v22 = objc_claimAutoreleasedReturnValue();
    start = v5->_start;
    v5->_start = (NSDate *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("startTimeZone"));
    v25 = objc_claimAutoreleasedReturnValue();
    startTimeZone = v5->_startTimeZone;
    v5->_startTimeZone = (NSTimeZone *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("end"));
    v28 = objc_claimAutoreleasedReturnValue();
    end = v5->_end;
    v5->_end = (NSDate *)v28;

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("endTimeZone"));
    v31 = objc_claimAutoreleasedReturnValue();
    endTimeZone = v5->_endTimeZone;
    v5->_endTimeZone = (NSTimeZone *)v31;

    v5->_isAllDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAllDay"));
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("creationDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v34;

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("lastModifiedDate"));
    v37 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v37;

    v39 = objc_alloc(MEMORY[0x1E0C99E60]);
    v40 = objc_opt_class();
    v41 = (void *)objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("locations"));
    v42 = objc_claimAutoreleasedReturnValue();
    locations = v5->_locations;
    v5->_locations = (NSArray *)v42;

    v44 = objc_alloc(MEMORY[0x1E0C99E60]);
    v45 = objc_opt_class();
    v46 = (void *)objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("tags"));
    v47 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSArray *)v47;

    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("naturalLanguageEventTypeIdentifier"));
    v50 = objc_claimAutoreleasedReturnValue();
    naturalLanguageEventTypeIdentifier = v5->_naturalLanguageEventTypeIdentifier;
    v5->_naturalLanguageEventTypeIdentifier = (NSString *)v50;

    v5->_naturalLanguageEventAttributes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("naturalLanguageEventAttributes"));
    v52 = objc_alloc(MEMORY[0x1E0C99E60]);
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = (void *)objc_msgSend(v52, "initWithObjects:", v53, v54, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("schemaOrg"));
    v56 = objc_claimAutoreleasedReturnValue();
    schemaOrg = v5->_schemaOrg;
    v5->_schemaOrg = (NSArray *)v56;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGEvent;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueKey, CFSTR("uniqueKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_opaqueKey, CFSTR("opaqueKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_notes, CFSTR("notes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_start, CFSTR("start"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startTimeZone, CFSTR("startTimeZone"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_end, CFSTR("end"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endTimeZone, CFSTR("endTimeZone"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isAllDay, CFSTR("isAllDay"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("lastModifiedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_locations, CFSTR("locations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tags, CFSTR("tags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_naturalLanguageEventTypeIdentifier, CFSTR("naturalLanguageEventTypeIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_naturalLanguageEventAttributes, CFSTR("naturalLanguageEventAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_schemaOrg, CFSTR("schemaOrg"));

}

- (BOOL)isEqual:(id)a3
{
  SGEvent *v4;
  SGEvent *v5;
  BOOL v6;

  v4 = (SGEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEvent isEqualToEvent:](self, "isEqualToEvent:", v5);

  return v6;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id *v4;
  NSString *title;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *notes;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSDate *start;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;
  char v19;
  NSTimeZone *startTimeZone;
  NSTimeZone *v21;
  NSTimeZone *v22;
  NSTimeZone *v23;
  char v24;
  NSDate *end;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  char v29;
  NSTimeZone *endTimeZone;
  NSTimeZone *v31;
  NSTimeZone *v32;
  NSTimeZone *v33;
  char v34;
  NSDate *creationDate;
  NSDate *v36;
  NSDate *v37;
  NSDate *v38;
  char v39;
  NSDate *lastModifiedDate;
  NSDate *v41;
  NSDate *v42;
  NSDate *v43;
  char v44;
  NSArray *locations;
  NSArray *v46;
  NSArray *v47;
  NSArray *v48;
  char v49;
  char v50;
  NSString *v52;
  NSString *v53;
  objc_super v54;

  v4 = (id *)a3;
  v54.receiver = self;
  v54.super_class = (Class)SGEvent;
  if (!-[SGObject isEqualToSuggestion:](&v54, sel_isEqualToSuggestion_, v4))
    goto LABEL_37;
  title = self->_title;
  v6 = (NSString *)v4[6];
  if (title == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = title;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_37;
  }
  notes = self->_notes;
  v11 = (NSString *)v4[7];
  if (notes == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = notes;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_37;
  }
  start = self->_start;
  v16 = (NSDate *)v4[8];
  if (start == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = start;
    v19 = -[NSDate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_37;
  }
  startTimeZone = self->_startTimeZone;
  v21 = (NSTimeZone *)v4[9];
  if (startTimeZone == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = startTimeZone;
    v24 = -[NSTimeZone isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_37;
  }
  end = self->_end;
  v26 = (NSDate *)v4[10];
  if (end == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = end;
    v29 = -[NSDate isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_37;
  }
  endTimeZone = self->_endTimeZone;
  v31 = (NSTimeZone *)v4[11];
  if (endTimeZone == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = endTimeZone;
    v34 = -[NSTimeZone isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_37;
  }
  if (self->_isAllDay != *((unsigned __int8 *)v4 + 40))
  {
LABEL_37:
    v50 = 0;
    goto LABEL_38;
  }
  creationDate = self->_creationDate;
  v36 = (NSDate *)v4[12];
  if (creationDate == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = creationDate;
    v39 = -[NSDate isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_37;
  }
  lastModifiedDate = self->_lastModifiedDate;
  v41 = (NSDate *)v4[13];
  if (lastModifiedDate == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = lastModifiedDate;
    v44 = -[NSDate isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_37;
  }
  locations = self->_locations;
  v46 = (NSArray *)v4[14];
  if (locations == v46)
  {

  }
  else
  {
    v47 = v46;
    v48 = locations;
    v49 = -[NSArray isEqual:](v48, "isEqual:", v47);

    if ((v49 & 1) == 0)
      goto LABEL_37;
  }
  v52 = self->_opaqueKey;
  v53 = v52;
  if (v52 == v4[15])
    v50 = 1;
  else
    v50 = -[NSString isEqual:](v52, "isEqual:");

LABEL_38:
  return v50;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_title, "hash");
  return -[NSString hash](self->_opaqueKey, "hash") - v3 + 32 * v3;
}

- (int64_t)ekEventAvailabilityState
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_tags;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6), (_QWORD)v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEKEventAvailabilityState"))
      {
        objc_msgSend(v7, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if ((objc_msgSend(v8, "isEqual:", CFSTR("ekEventAvailabilityStateNotsupported")) & 1) != 0)
          {
            v10 = -1;
LABEL_22:

            goto LABEL_23;
          }
          if ((objc_msgSend(v9, "isEqual:", CFSTR("ekEventAvailabilityStateBusy")) & 1) != 0)
          {
            v10 = 0;
            goto LABEL_22;
          }
          if ((objc_msgSend(v9, "isEqual:", CFSTR("ekEventAvailabilityStateFree")) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_22;
          }
          if ((objc_msgSend(v9, "isEqual:", CFSTR("ekEventAvailabilityStateTentative")) & 1) != 0)
          {
            v10 = 2;
            goto LABEL_22;
          }
          if ((objc_msgSend(v9, "isEqual:", CFSTR("ekEventAvailabilityStateUnavailable")) & 1) != 0)
          {
            v10 = 3;
            goto LABEL_22;
          }
        }

      }
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  v10 = 3;
LABEL_23:

  return v10;
}

- (id)toEKEventWithStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(SGWeakLinkClass(CFSTR("EKEvent"), 0), "eventWithEventStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEvent mergeIntoEKEvent:withStore:](self, "mergeIntoEKEvent:withStore:", v5, v4);

  return v5;
}

- (void)mergeIntoEKEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  SGWeakLinkClass(CFSTR("EKEventStore"), 0);
  v5 = (id)objc_opt_new();
  -[SGEvent mergeIntoEKEvent:withStore:](self, "mergeIntoEKEvent:withStore:", v4, v5);

}

- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4
{
  -[SGEvent mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:](self, "mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (BOOL)shouldAllowNotificationsInCalendarWithAllowListOverride:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t v15[8];
  uint64_t v16;
  uint8_t buf[16];

  v4 = a3;
  -[SGObject origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_1E4762D08))
  {
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v7, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || v16)
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1A2267000, v11, OS_LOG_TYPE_ERROR, "SGEvent-shouldAllowNotificationsInCalendar: Could not get handle for app.", v15, 2u);
      }
      v13 = 0;
    }
    else
    {
      objc_msgSend(v9, "currentState");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject endowmentNamespaces](v11, "endowmentNamespaces");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    }
    v8 = -[SGEvent shouldAllowNotificationsInCalendarForBundleId:appIsInForeground:allowListOverride:](self, "shouldAllowNotificationsInCalendarForBundleId:appIsInForeground:allowListOverride:", v6, v13, v4);

  }
  else
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v7, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendar: Not allowing notification for event without bundleid", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4
{
  return -[SGEvent shouldAllowNotificationsInCalendarForBundleId:appIsInForeground:allowListOverride:](self, "shouldAllowNotificationsInCalendarForBundleId:appIsInForeground:allowListOverride:", a3, a4, 0);
}

- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4 allowListOverride:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[16];
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[SGEvent isNaturalLanguageEvent](self, "isNaturalLanguageEvent"))
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for NL event.";
LABEL_8:
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v8 || objc_msgSend(v8, "isEqualToString:", &stru_1E4762D08))
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for event without bundleid";
      goto LABEL_8;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  if (!a4)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for app not in foreground.";
    goto LABEL_8;
  }
  objc_msgSend(CFSTR("com.apple.MobileSMS"), "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  objc_msgSend(CFSTR("com.apple.mobilemail"), "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v16 = objc_claimAutoreleasedReturnValue();

  v39 = v9;
  v40 = v8;
  if (v9)
  {
    v10 = -[NSObject mutableCopy](v16, "mutableCopy");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v22, "lowercaseString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[NSObject containsObject:](v16, "containsObject:", v23);

          if (v24)
          {
            objc_msgSend(v22, "lowercaseString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject removeObject:](v10, "removeObject:", v25);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v19);
    }

    v8 = v40;
  }
  else
  {
    v10 = v16;
  }
  objc_msgSend(v8, "lowercaseString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[NSObject containsObject:](v10, "containsObject:", v26);

  if (v27)
  {
    sgLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v28, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification from excluded bundleId.", buf, 2u);
    }
    v12 = 0;
    v9 = v39;
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[SGEvent tags](self, "tags");
    obj = objc_claimAutoreleasedReturnValue();
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v43;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(obj);
          +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGEntityTag fromSync](SGEntityTag, "fromSync");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v34, "isEqualToString:", v36);

          if (v37)
          {
            sgLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A2267000, v38, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification from synced event.", buf, 2u);
            }

            v12 = 0;
            v9 = v39;
            v8 = v40;
            v28 = obj;
            goto LABEL_44;
          }

        }
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v30)
          continue;
        break;
      }
    }

    sgLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    v12 = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v28, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Allowing notification.", buf, 2u);
    }
    v9 = v39;
    v8 = v40;
  }
LABEL_44:

LABEL_10:
  return v12;
}

- (void)_applyTimeRangeToEKEvent:(id)a3 withTZID:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSTimeZone *v12;
  NSTimeZone *v13;
  NSTimeZone *endTimeZone;
  NSDate *start;
  NSTimeZone *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = *MEMORY[0x1E0C996C8];
  v8 = a3;
  objc_msgSend(v6, "calendarWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v20, "isEqualToString:", CFSTR("floating"));
  if (!v20 || (v10 & 1) != 0)
  {
    if (!v20)
    {
      v12 = self->_startTimeZone;
      v13 = 0;
      endTimeZone = self->_endTimeZone;
      goto LABEL_8;
    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v13 = v12;
  endTimeZone = v12;
LABEL_8:
  start = self->_start;
  v16 = endTimeZone;
  -[SGEvent _componentsForDate:timeZone:isEnd:calendar:](self, "_componentsForDate:timeZone:isEnd:calendar:", start, v12, 0, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEvent _componentsForDate:timeZone:isEnd:calendar:](self, "_componentsForDate:timeZone:isEnd:calendar:", self->_end, v16, 1, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGSimpleTimeRange rangeWithGregorianStartComponents:endComponents:](SGSimpleTimeRange, "rangeWithGregorianStartComponents:endComponents:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applyToEKEvent:isAllDay:isFloating:", v8, -[SGEvent isAllDay](self, "isAllDay"), v10);

}

- (void)_mergeTagsIntoEKEvent:(id)a3 withStore:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SGEvent tags](self, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("TZID"));

        if (v14)
        {
          objc_msgSend(v12, "value");
          v15 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v15;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  -[SGEvent _applyTimeRangeToEKEvent:withTZID:](self, "_applyTimeRangeToEKEvent:withTZID:", v17, v9);
}

- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4 preservingValuesDifferentFrom:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  SGEvent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  NSString *opaqueKey;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSArray *tags;
  void *v84;
  void *v85;
  NSArray *v86;
  void *v87;
  void *v88;
  int64_t v89;
  NSObject *v90;
  void *v91;
  NSArray *schemaOrg;
  NSArray *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  NSArray *v103;
  _UNKNOWN **v104;
  void *v105;
  void *v106;
  void *v107;
  NSArray *v108;
  void *v109;
  void *v110;
  __CFString **v111;
  NSArray *v112;
  void *v113;
  void *v114;
  NSArray *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  NSString *v140;
  NSString *uniqueKey;
  void *v142;
  SGEvent *v143;
  void *v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  char v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  SGEvent *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  BOOL v164;
  void *v165;
  void *v166;
  uint64_t v167;
  id v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  SGEvent *v178;
  void *v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  uint8_t v189[128];
  uint8_t buf[4];
  int64_t v191;
  _QWORD v192[4];

  v192[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("summary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (objc_msgSend(v9, "title"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToString:", v13),
        v13,
        v14))
  {
    objc_msgSend(v9, "setTitle:", self->_title);
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15
    || (objc_msgSend(v9, "notes"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqual:", v16),
        v16,
        v17))
  {
    objc_msgSend(v9, "setNotes:", self->_notes);
  }
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

  if (self->_creationDate)
    objc_msgSend(v18, "addObject:");
  objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = objc_claimAutoreleasedReturnValue();

  v174 = (void *)v21;
  objc_msgSend(v9, "setCreationDate:", v21);
  objc_msgSend(v9, "setLastModifiedDate:", self->_lastModifiedDate);
  -[SGObject origin](self, "origin");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v15;
  v177 = v12;
  v175 = v18;
  if (objc_msgSend(v22, "type") == 1)
    goto LABEL_14;
  -[SGObject origin](self, "origin");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "type") == 4)
    goto LABEL_13;
  -[SGObject origin](self, "origin");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "type") == 6)
  {

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  -[SGObject origin](self, "origin");
  v160 = self;
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v161, "type") == 5)
  {

    self = v160;
    goto LABEL_14;
  }
  -[SGObject origin](v160, "origin");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v11;
  v163 = objc_msgSend(v162, "type");

  v164 = v163 == 7;
  v11 = v171;
  self = v160;
  if (!v164)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v160, CFSTR("SGEvent.m"), 517, CFSTR("Suggested events can only come from Mail, Messages, Safari, Interactions or schema.org"));
    goto LABEL_14;
  }
LABEL_15:
  -[SGObject origin](self, "origin");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "type") == 1)
  {

  }
  else
  {
    -[SGObject origin](self, "origin");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "type");

    if (v27 != 4)
      goto LABEL_29;
  }
  -[SGEvent URL](self, "URL");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = self;
  if (!v28)
    goto LABEL_21;
  v30 = (void *)v28;
  -[SGEvent tags](self, "tags");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag fromCalendarAttachment](SGEntityTag, "fromCalendarAttachment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v31, "containsObject:", v33);

  if (!v34)
  {
LABEL_21:
    -[SGObject origin](v29, "origin");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    self = v29;
    if (objc_msgSend(v36, "type") == 1)
    {
      opaqueKey = v29->_opaqueKey;

      if (opaqueKey)
      {
        -[SGObject origin](v29, "origin");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "externalKey");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGEKEventConversions urlForEKEventFromMailMessageWithId:sentAt:opaqueKey:](SGEKEventConversions, "urlForEKEventFromMailMessageWithId:sentAt:opaqueKey:", v38, v29->_creationDate, v29->_opaqueKey);
        v39 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v42 = (void *)v39;
        objc_msgSend(v9, "setURL:", v39);

        goto LABEL_28;
      }
    }
    else
    {

    }
    -[SGObject origin](v29, "origin");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "type");

    if (v41 != 4)
      goto LABEL_29;
    -[SGObject origin](v29, "origin");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "externalKey");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGEKEventConversions urlForEKEventFromTextMessageWithUniqueIdentifier:](SGEKEventConversions, "urlForEKEventFromTextMessageWithUniqueIdentifier:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  -[SGEvent URL](v29, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setURL:", v35);
  self = v29;
LABEL_28:

LABEL_29:
  -[SGEvent firstLocationForType:](self, "firstLocationForType:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = self;
  if (v43)
  {
    v44 = v43;

  }
  else
  {
    -[SGEvent firstLocationForType:](self, "firstLocationForType:", 2);
    v44 = (id)objc_claimAutoreleasedReturnValue();

    if (!v44)
      goto LABEL_49;
  }
  if ((objc_msgSend(v44, "isGeocoded") & 1) == 0)
  {
    objc_msgSend(v44, "handle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      objc_msgSend(v44, "label");
      v149 = objc_claimAutoreleasedReturnValue();
      if (v149)
      {
        v150 = (void *)v149;
        objc_msgSend(v44, "address");
        v151 = objc_claimAutoreleasedReturnValue();
        if (v151)
        {
          v152 = (void *)v151;
          objc_msgSend(v44, "label");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "address");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = objc_msgSend(v153, "isEqualToString:", v154);

          if ((v155 & 1) == 0)
          {
            objc_msgSend(v44, "label");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v192[0] = v156;
            objc_msgSend(v44, "address");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v192[1] = v157;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "_pas_componentsJoinedByString:", CFSTR("\n"));
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setLocation:", v159);

            self = v178;
            goto LABEL_49;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v44, "address");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v165, "length"))
      {

        self = v178;
      }
      else
      {
        objc_msgSend(v44, "label");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend(v166, "length");

        self = v178;
        if (!v167)
          goto LABEL_49;
      }
      objc_msgSend(v44, "address");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        objc_msgSend(v9, "setLocation:", v62);
        goto LABEL_48;
      }
      objc_msgSend(v44, "label");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocation:", v63);
LABEL_47:

LABEL_48:
      goto LABEL_49;
    }
  }
  objc_msgSend(v44, "label");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(v9, "setLocation:", v46);
  }
  else
  {
    objc_msgSend(v44, "address");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocation:", v47);

  }
  v48 = SGWeakLinkClass(CFSTR("EKStructuredLocation"), 0);
  objc_msgSend(v44, "label");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (!v49)
  {
    objc_msgSend(v44, "address");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v48, "locationWithTitle:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStructuredLocation:", v51);

  if (!v49)
  objc_msgSend(v44, "address");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v44, "address");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "structuredLocation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAddress:", v53);

  }
  if (objc_msgSend(v44, "isGeocoded"))
  {
    v55 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v44, "latitude");
    v57 = v56;
    objc_msgSend(v44, "longitude");
    v59 = (void *)objc_msgSend(v55, "initWithLatitude:longitude:", v57, v58);
    objc_msgSend(v9, "structuredLocation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setGeoLocation:", v59);

  }
  objc_msgSend(v44, "handle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v44, "handle");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "structuredLocation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setMapKitHandle:", v62);
    goto LABEL_47;
  }
LABEL_49:
  -[SGEvent firstLocationForType:](self, "firstLocationForType:", 3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
  {
    if ((objc_msgSend(v64, "isGeocoded") & 1) != 0
      || (objc_msgSend(v65, "handle"), v66 = (void *)objc_claimAutoreleasedReturnValue(), v66, v66))
    {
      v67 = SGWeakLinkClass(CFSTR("EKStructuredLocation"), 0);
      objc_msgSend(v65, "label");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (!v68)
      {
        objc_msgSend(v65, "address");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v67, "locationWithTitle:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEndLocation:", v70);

      if (!v68)
      objc_msgSend(v65, "address");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v65, "address");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endLocation");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setAddress:", v72);

      }
      if (objc_msgSend(v65, "isGeocoded"))
      {
        v74 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v65, "latitude");
        v76 = v75;
        objc_msgSend(v65, "longitude");
        v78 = (void *)objc_msgSend(v74, "initWithLatitude:longitude:", v76, v77);
        objc_msgSend(v9, "endLocation");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setGeoLocation:", v78);

      }
      objc_msgSend(v65, "handle");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v80)
      {
        objc_msgSend(v65, "handle");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endLocation");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setMapKitHandle:", v81);

      }
    }
  }
  v173 = v44;
  tags = self->_tags;
  +[SGEntityTag extractedFlight](SGEntityTag, "extractedFlight");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "name");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(tags) = -[NSArray containsObject:](tags, "containsObject:", v85);

  if ((_DWORD)tags)
    objc_msgSend(v9, "setTravelAdvisoryBehavior:", 2);
  v86 = self->_tags;
  +[SGEntityTag fromSync](SGEntityTag, "fromSync");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "name");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v86) = -[NSArray containsObject:](v86, "containsObject:", v88);

  if ((_DWORD)v86)
    objc_msgSend(v9, "setLocalCustomObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("EKEventSuggestedEventSavedFromSyncKey"));
  v89 = -[SGEvent ekEventAvailabilityState](self, "ekEventAvailabilityState");
  sgLogHandle();
  v90 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v191 = v89;
    _os_log_debug_impl(&dword_1A2267000, v90, OS_LOG_TYPE_DEBUG, "EKEvent Availability: \"%ld\", buf, 0xCu);
  }
  v172 = v65;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v89);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalCustomObject:forKey:", v91, CFSTR("EKEventAvailabilityState"));

  schemaOrg = self->_schemaOrg;
  if (schemaOrg)
    objc_msgSend(v9, "setCustomObject:forKey:", schemaOrg, CFSTR("SuggestionsSchemaOrg"));
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v93 = self->_tags;
  v94 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v185;
    while (2)
    {
      for (i = 0; i != v95; ++i)
      {
        if (*(_QWORD *)v185 != v96)
          objc_enumerationMutation(v93);
        +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * i));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v98, "isEventMetadata"))
        {
          objc_msgSend(v98, "eventMetadata");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (v99)
            objc_msgSend(v9, "setCustomObject:forKey:", v99, CFSTR("SGEventMetadataKey"));

          self = v178;
          goto LABEL_82;
        }

      }
      v95 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
      self = v178;
      if (v95)
        continue;
      break;
    }
  }
LABEL_82:

  if (-[SGEvent isNaturalLanguageEvent](self, "isNaturalLanguageEvent"))
  {
    v169 = v9;
    v170 = v11;
    v168 = v10;
    v179 = (void *)objc_opt_new();
    v100 = (void *)objc_opt_new();
    objc_msgSend(v100, "setObject:forKeyedSubscript:", self->_naturalLanguageEventTypeIdentifier, CFSTR("SuggestionsNLEventDictionaryEventTypeKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_naturalLanguageEventAttributes);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setObject:forKeyedSubscript:", v101, CFSTR("SuggestionsNLEventDictionaryEventAttributesKey"));

    v102 = (void *)MEMORY[0x1E0CB37E8];
    v103 = self->_tags;
    v104 = &off_1E475F000;
    +[SGEntityTag significantSender](SGEntityTag, "significantSender");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "name");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "numberWithBool:", -[NSArray containsObject:](v103, "containsObject:", v106));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setObject:forKeyedSubscript:", v107, CFSTR("SuggestionsNLEventDictionaryEventSignificantSenderKey"));

    v108 = v178->_tags;
    +[SGEntityTag titleGeneratedFromTemplate](SGEntityTag, "titleGeneratedFromTemplate");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "name");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v108) = -[NSArray containsObject:](v108, "containsObject:", v110);

    if ((v108 & 1) != 0)
    {
      v111 = kSuggestionsEkEventNLEventDictionaryEventTitleSourceTemplateValue;
    }
    else
    {
      v112 = v178->_tags;
      +[SGEntityTag titleGeneratedFromSubject](SGEntityTag, "titleGeneratedFromSubject");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "name");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v112) = -[NSArray containsObject:](v112, "containsObject:", v114);

      if (!(_DWORD)v112)
      {
LABEL_88:
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v115 = v178->_tags;
        v116 = -[NSArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
        if (!v116)
          goto LABEL_111;
        v117 = v116;
        v118 = *(_QWORD *)v181;
        while (1)
        {
          for (j = 0; j != v117; ++j)
          {
            if (*(_QWORD *)v181 != v118)
              objc_enumerationMutation(v115);
            objc_msgSend(v104[122], "resolveName:", *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * j), v168);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v120, "isConfidenceScore"))
            {
              v121 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v120, "value");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "doubleValue");
              objc_msgSend(v121, "numberWithDouble:");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = v100;
              v125 = v123;
              v126 = CFSTR("SuggestionsNLEventDictionaryEventConfidenceScoreKey");
LABEL_107:
              objc_msgSend(v124, "setObject:forKeyedSubscript:", v125, v126);

              v104 = &off_1E475F000;
              goto LABEL_108;
            }
            if (objc_msgSend(v120, "isParticipantCount"))
            {
              v127 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v120, "value");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = v100;
              v125 = v123;
              v126 = CFSTR("SuggestionsNLEventDictionaryEventParticipantCountKey");
              goto LABEL_107;
            }
            if (!objc_msgSend(v120, "isNaturalLanguageEventLanguageID"))
            {
              if (objc_msgSend(v120, "isCalendarAppUsageLevel"))
              {
                v128 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v120, "value");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "floatValue");
                objc_msgSend(v128, "numberWithFloat:");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v179;
                v125 = v123;
                v126 = CFSTR("SuggestionsNLEventDictionaryCalendarAppUsageLevelKey");
              }
              else if (objc_msgSend(v120, "isMailAppUsageLevel"))
              {
                v129 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v120, "value");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v179;
                v125 = v123;
                v126 = CFSTR("SuggestionsNLEventDictionaryMailAppUsageLevelKey");
              }
              else if (objc_msgSend(v120, "isMessagesAppUsageLevel"))
              {
                v130 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v120, "value");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v179;
                v125 = v123;
                v126 = CFSTR("SuggestionsNLEventDictionaryMessagesAppUsageLevelKey");
              }
              else
              {
                if (!objc_msgSend(v120, "isUsedBubblesCount"))
                  goto LABEL_109;
                v131 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v120, "value");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v179;
                v125 = v123;
                v126 = CFSTR("SuggestionsNLEventDictionaryEventUsedBubblesCountKey");
              }
              goto LABEL_107;
            }
            objc_msgSend(v120, "value");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setObject:forKeyedSubscript:", v122, CFSTR("SuggestionsNLEventDictionaryEventLanguageIDKey"));
LABEL_108:

LABEL_109:
          }
          v117 = -[NSArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
          if (!v117)
          {
LABEL_111:

            v132 = (void *)objc_msgSend(v179, "copy");
            v9 = v169;
            objc_msgSend(v169, "setLocalCustomObject:forKey:", v132, CFSTR("SuggestionsNLEventDictionaryKey"));

            v133 = (void *)objc_msgSend(v100, "copy");
            objc_msgSend(v169, "setCustomObject:forKey:", v133, CFSTR("SuggestionsNLEventDictionaryKey"));

            v10 = v168;
            v11 = v170;
            self = v178;
            goto LABEL_112;
          }
        }
      }
      v111 = kSuggestionsEkEventNLEventDictionaryEventTitleSourceSubjectValue;
    }
    objc_msgSend(v100, "setObject:forKeyedSubscript:", *v111, CFSTR("SuggestionsNLEventDictionaryEventTitleSourceKey"), v10);
    goto LABEL_88;
  }
LABEL_112:
  -[SGObject origin](self, "origin", v168);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "bundleId");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalCustomObject:forKey:", v135, CFSTR("SuggestionsOriginBundleId"));

  -[SGObject origin](self, "origin");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "fromPerson");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "displayName");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalCustomObject:forKey:", v138, CFSTR("SuggestionsOriginDisplayName"));

  v139 = objc_alloc((Class)SGWeakLinkClass(CFSTR("EKSuggestedEventInfo"), 0));
  v140 = self->_opaqueKey;
  uniqueKey = self->_uniqueKey;
  -[SGObject origin](self, "origin");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "externalKey");
  v143 = self;
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)objc_msgSend(v139, "initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:", v10, v140, uniqueKey, v144);

  objc_msgSend(v9, "setSuggestionInfo:", v145);
  -[NSDate timeIntervalSince1970](v143->_creationDate, "timeIntervalSince1970");
  v147 = v146;
  objc_msgSend(v9, "suggestionInfo");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setTimestamp:", v147);

  -[SGEvent _mergeTagsIntoEKEvent:withStore:](v143, "_mergeTagsIntoEKEvent:withStore:", v9, v10);
}

- (id)firstLocationForType:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_locations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "locationType", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)geocodingMode
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_tags;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v3)
  {
    v14 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  v5 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v17 != v5)
        objc_enumerationMutation(v2);
      +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGEntityTag geocodingModeAddressOnly](SGEntityTag, "geocodingModeAddressOnly");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToEntityTag:", v8);

      if ((v9 & 1) != 0)
      {
        v14 = 1;
LABEL_15:

        goto LABEL_17;
      }
      +[SGEntityTag geocodingModePOIOnly](SGEntityTag, "geocodingModePOIOnly");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isEqualToEntityTag:", v10);

      if (v11)
      {
        v14 = 2;
        goto LABEL_15;
      }
      +[SGEntityTag geocodingModeAddressThenPOI](SGEntityTag, "geocodingModeAddressThenPOI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqualToEntityTag:", v12);

      if ((v13 & 1) != 0)
      {
        v14 = 3;
        goto LABEL_17;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v14 = 0;
    if (v4)
      continue;
    break;
  }
LABEL_17:

  return v14;
}

- (id)poiFilters
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_tags;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isPOIFilters") & 1) != 0)
        {
          objc_msgSend(v6, "value");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7
{
  id v12;
  uint64_t v13;
  NSString *title;
  NSString *notes;
  NSDate *creationDate;
  NSDate *lastModifiedDate;
  NSArray *tags;
  void *v19;
  SGEvent *v20;
  uint64_t v22;
  NSString *opaqueKey;
  NSString *uniqueKey;
  void *v25;
  void *v26;
  SGEvent *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v31 = a7;
  v12 = a6;
  v30 = a5;
  v29 = a4;
  v28 = a3;
  v27 = [SGEvent alloc];
  -[SGObject recordId](self, "recordId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGObject origin](self, "origin");
  v13 = objc_claimAutoreleasedReturnValue();
  uniqueKey = self->_uniqueKey;
  v25 = (void *)v13;
  opaqueKey = self->_opaqueKey;
  title = self->_title;
  notes = self->_notes;
  LOBYTE(a4) = self->_isAllDay;
  creationDate = self->_creationDate;
  lastModifiedDate = self->_lastModifiedDate;
  tags = self->_tags;
  -[SGEvent URL](self, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = (_BYTE)a4;
  v20 = -[SGEvent initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:](v27, "initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:", v26, v25, uniqueKey, opaqueKey, title, notes, v28, v29, v30, v12, v22, creationDate, lastModifiedDate, v31, tags, v19,
          self->_naturalLanguageEventTypeIdentifier,
          self->_naturalLanguageEventAttributes,
          self->_schemaOrg);

  return v20;
}

- (BOOL)isNaturalLanguageEvent
{
  NSArray *tags;
  void *v3;
  void *v4;

  tags = self->_tags;
  +[SGEntityTag naturalLanguageEvent](SGEntityTag, "naturalLanguageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(tags) = -[NSArray containsObject:](tags, "containsObject:", v4);

  return (char)tags;
}

- (id)_naturalLanguageEventTagsInTags:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isNaturalLanguageEventTypeIdentifier"))
        {
          objc_msgSend(v10, "value");
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }
        if (objc_msgSend(v10, "isNaturalLanguageEventAttributes"))
        {
          objc_msgSend(v10, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v12, "longLongValue");

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v13 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tupleWithFirst:second:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)loggingIdentifier
{
  NSString **p_opaqueKey;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  p_opaqueKey = &self->_opaqueKey;
  if (self->_opaqueKey || (p_opaqueKey = &self->_uniqueKey, self->_uniqueKey))
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), -[NSString hash](*p_opaqueKey, "hash"));
  else
    v3 = &stru_1E4762D08;
  if ((unint64_t)-[__CFString length](v3, "length") > 0xC)
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 12);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)notes
{
  return self->_notes;
}

- (NSDate)start
{
  return self->_start;
}

- (NSTimeZone)startTimeZone
{
  return self->_startTimeZone;
}

- (NSDate)end
{
  return self->_end;
}

- (NSTimeZone)endTimeZone
{
  return self->_endTimeZone;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)naturalLanguageEventTypeIdentifier
{
  return self->_naturalLanguageEventTypeIdentifier;
}

- (unint64_t)naturalLanguageEventAttributes
{
  return self->_naturalLanguageEventAttributes;
}

- (NSArray)schemaOrg
{
  return self->_schemaOrg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_naturalLanguageEventTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_geocoded, 0);
  objc_storeStrong((id *)&self->_geocodeQueue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SGEvent)eventWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18
{
  id v19;
  id v20;
  id v21;
  SGEvent *v22;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v30;
  id v31;
  id v33;
  id v34;
  id v36;
  id v39;
  id v40;
  id v41;

  v36 = a18;
  v34 = a17;
  v31 = a16;
  v28 = a15;
  v25 = a14;
  v27 = a12;
  v41 = a11;
  v40 = a10;
  v39 = a9;
  v26 = a8;
  v30 = a7;
  v33 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  LOBYTE(v24) = a13;
  v22 = -[SGEvent initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tags:URL:]([SGEvent alloc], "initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tags:URL:", v21, v20, v19, v33, v30, v26, v39, v40, v41, v27, v24, v25, v28, v31, v34, v36);

  return v22;
}

@end
