@implementation WFDateContentItem

- (id)richListTitle
{
  void *v2;
  void *v3;

  -[WFDateContentItem date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifiedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
    v4[2](v4, v6);

  return v6 != 0;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WFLocalizedStringWithKey(CFSTR("Date Property - Time"), CFSTR("Time"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_15877, v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeUnits:", 2097376);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "comparableUnits:", 2097376);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Date"), CFSTR("Date"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Dates"), CFSTR("Dates"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Dates"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 4;
}

void __37__WFDateContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v6 = a4;
  objc_msgSend(a2, "timeDateComponents");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a4)[2](v6, v7);

}

- (NSDate)date
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (NSDateComponents)dateComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  objc_class *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if ((Class)objc_opt_class() == a3)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[WFDateContentItem date](self, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%.0f seconds since 1970"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDateContentItem date](self, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v12, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    return v9;
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  if (v7 == a3)
  {
    -[WFContentItem objectForClass:](self, "objectForClass:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateFromComponents:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    goto LABEL_13;
  }
  if (v8 == a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDateContentItem date](self, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "components:fromDate:", -1, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
    if (v22)
    {
      objc_msgSend(v22, "wfName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFDateContentItem date](self, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "wfName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  v9 = 0;
  return v9;
}

- (id)timeDateComponents
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[WFDateContentItem dateComponents](self, "dateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v2, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v4);

  objc_msgSend(v2, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v5);

  objc_msgSend(v3, "setHour:", objc_msgSend(v2, "hour"));
  objc_msgSend(v3, "setMinute:", objc_msgSend(v2, "minute"));
  objc_msgSend(v3, "setSecond:", objc_msgSend(v2, "second"));
  objc_msgSend(v3, "setNanosecond:", objc_msgSend(v2, "nanosecond"));

  return v3;
}

@end
