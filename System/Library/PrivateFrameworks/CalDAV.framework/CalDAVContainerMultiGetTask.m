@implementation CalDAVContainerMultiGetTask

- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6 appSpecificCalendarItemClass:(Class)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  CalDAVContainerMultiGetTask *v14;
  CalDAVContainerMultiGetTask *v15;
  objc_super v17;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  if (!a7)
    a7 = (Class)objc_opt_class();
  v17.receiver = self;
  v17.super_class = (Class)CalDAVContainerMultiGetTask;
  v14 = -[CoreDAVContainerMultiGetTask initWithURLs:atContainerURL:appSpecificDataItemClass:](&v17, sel_initWithURLs_atContainerURL_appSpecificDataItemClass_, v12, v13, a7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)((char *)&v14->super.super.super.isa + (int)*MEMORY[0x24BE1AC10]), (id)*MEMORY[0x24BE1ACF8]);
    objc_storeStrong((id *)((char *)&v15->super.super.super.isa + (int)*MEMORY[0x24BE1AC08]), (id)*MEMORY[0x24BE1ACB8]);
    objc_storeStrong((id *)((char *)&v15->super.super.super.isa + (int)*MEMORY[0x24BE1AC00]), CFSTR("calendar-data"));
    -[CalDAVContainerMultiGetTask setGetScheduleTags:](v15, "setGetScheduleTags:", v9);
    -[CalDAVContainerMultiGetTask setGetScheduleChanges:](v15, "setGetScheduleChanges:", v8);
    -[CoreDAVContainerMultiGetTask setShouldIgnoreResponseErrors:](v15, "setShouldIgnoreResponseErrors:", 1);
  }

  return v15;
}

- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  CalDAVContainerMultiGetTask *v12;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[CalDAVContainerMultiGetTask initWithURLs:atContainerURL:getScheduleTags:getScheduleChanges:appSpecificCalendarItemClass:](self, "initWithURLs:atContainerURL:getScheduleTags:getScheduleChanges:appSpecificCalendarItemClass:", v11, v10, v7, v6, objc_opt_class());

  return v12;
}

- (id)copyAdditionalPropElements
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = (void *)objc_opt_new();
  if (-[CalDAVContainerMultiGetTask getScheduleTags](self, "getScheduleTags"))
    objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], CFSTR("schedule-tag"), objc_opt_class());
  v4 = -[CalDAVContainerMultiGetTask getScheduleChanges](self, "getScheduleChanges");
  v5 = *MEMORY[0x24BE1ADC8];
  if (v4)
    objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("schedule-changes"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("created-by"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("updated-by"), objc_opt_class());
  return v3;
}

- (void)setAdditionalProperties:(id)a3 onDataItem:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v5 = *MEMORY[0x24BE1ACF8];
  v6 = a3;
  objc_msgSend(v6, "CDVObjectForKeyWithNameSpace:andName:", v5, CFSTR("schedule-tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payloadAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setScheduleTag:", v8);
  v9 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v6, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("schedule-changes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScheduleChanges:", v10);
  objc_msgSend(v6, "CDVObjectForKeyWithNameSpace:andName:", v9, CFSTR("created-by"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCreatedBy:", v11);

  objc_msgSend(v6, "CDVObjectForKeyWithNameSpace:andName:", v9, CFSTR("updated-by"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setUpdatedBy:", v12);
}

- (BOOL)getScheduleTags
{
  return self->_getScheduleTags;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_getScheduleTags = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_getScheduleChanges;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_getScheduleChanges = a3;
}

@end
