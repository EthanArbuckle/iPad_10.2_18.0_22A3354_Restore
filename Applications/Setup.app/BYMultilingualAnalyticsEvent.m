@implementation BYMultilingualAnalyticsEvent

- (BYMultilingualAnalyticsEvent)initWithWithEventName:(id)a3 sourcePane:(id)a4
{
  id v5;
  NSDictionary *v6;
  id v7;
  void *v8;
  BYMultilingualAnalyticsEvent *v9;
  objc_super v11;
  id v12;
  id location[2];
  id v14;
  const __CFString *v15;
  id v16;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = v14;
  v14 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BYMultilingualAnalyticsEvent;
  v14 = -[BYMultilingualAnalyticsEvent init](&v11, "init");
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)v14 + 2, location[0]);
    v15 = CFSTR("pane");
    v16 = v12;
    v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v7 = -[NSDictionary mutableCopy](v6, "mutableCopy");
    v8 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v7;

  }
  v9 = (BYMultilingualAnalyticsEvent *)v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v9;
}

- (void)recordWithAnalyticsManager:(id)a3
{
  id v3;
  NSString *v4;
  NSMutableDictionary *v5;
  id v6;
  uint64_t v7;
  id v8;
  os_log_t oslog;
  id location[2];
  BYMultilingualAnalyticsEvent *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[BYMultilingualAnalyticsEvent eventName](v11, "eventName");
  v5 = -[BYMultilingualAnalyticsEvent mutablePayload](v11, "mutablePayload");
  v6 = -[NSMutableDictionary copy](v5, "copy");
  objc_msgSend(v3, "addEvent:withPayload:persist:", v4, v6, 1);

  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[BYMultilingualAnalyticsEvent description](v11, "description");
    sub_100038C28((uint64_t)buf, (uint64_t)v8);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "recording MultilingualAnalyticsEvent %@", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

+ (void)recordMultilingualPane:(unint64_t)a3 startingData:(id)a4 modifiedData:(id)a5 analyticsManager:(id)a6
{
  BYMultilingualAnalyticsEvent *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  unint64_t v21;
  SEL v22;
  id v23;

  v23 = a1;
  v22 = a2;
  v21 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v8 = [BYMultilingualAnalyticsEvent alloc];
  v9 = objc_msgSend(v23, "stringNameForMultilingualPane:", v21);
  v17 = -[BYMultilingualAnalyticsEvent initWithWithEventName:sourcePane:](v8, "initWithWithEventName:sourcePane:", CFSTR("com.apple.setupassistant.ios.multilingual.individual"), v9);

  v16 = objc_msgSend(v23, "actionTypeForStarting:endingDataSet:", location, v19, 0);
  v10 = objc_msgSend(v17, "mutablePayload");
  v11 = objc_msgSend(v23, "identifierForAction:", v16);
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("typeValue"));

  v12 = objc_msgSend(v17, "mutablePayload");
  v13 = objc_msgSend(v23, "stringDescriptionForArray:", location);
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("startData"));

  v14 = objc_msgSend(v17, "mutablePayload");
  v15 = objc_msgSend(v23, "stringDescriptionForArray:", v19);
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("endData"));

  objc_msgSend(v17, "recordWithAnalyticsManager:", v18);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (void)recordExpressPaneShownUserCustomized:(BOOL)a3 withData:(id)a4 analyticsManager:(id)a5
{
  BYMultilingualAnalyticsEvent *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  BYMultilingualAnalyticsEvent *v10;
  id v11;
  id v12;
  id v13;
  id location;
  BOOL v15;
  SEL v16;
  id v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = objc_msgSend(v17, "stringNameForMultilingualPane:", 3);
  v11 = CFSTR("selectedDefaults");
  if (v15)
    objc_storeStrong(&v11, CFSTR("selectedCustomize"));
  v6 = [BYMultilingualAnalyticsEvent alloc];
  v10 = -[BYMultilingualAnalyticsEvent initWithWithEventName:sourcePane:](v6, "initWithWithEventName:sourcePane:", CFSTR("com.apple.setupassistant.ios.multilingual.individual"), v12);
  v7 = -[BYMultilingualAnalyticsEvent mutablePayload](v10, "mutablePayload");
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("typeValue"));

  v8 = -[BYMultilingualAnalyticsEvent mutablePayload](v10, "mutablePayload");
  v9 = objc_msgSend(v17, "stringDescriptionForNestedArray:", location);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, CFSTR("endData"));

  -[BYMultilingualAnalyticsEvent recordWithAnalyticsManager:](v10, "recordWithAnalyticsManager:", v13);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (unint64_t)actionTypeForStarting:(id)a3 endingDataSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;
  id v16;
  id location[3];
  unint64_t v18;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = objc_msgSend(v16, "count");
  if (v5 <= objc_msgSend(location[0], "count"))
  {
    v6 = objc_msgSend(v16, "count");
    if (v6 >= objc_msgSend(location[0], "count"))
    {
      v7 = objc_msgSend(v16, "count");
      if (v7 == objc_msgSend(location[0], "count"))
      {
        for (LODWORD(v15) = 0; ; LODWORD(v15) = v15 + 1)
        {
          v8 = (int)v15;
          if (v8 >= (unint64_t)objc_msgSend(location[0], "count", v15))
            break;
          v9 = objc_msgSend(v16, "objectAtIndexedSubscript:", (int)v15);
          v10 = objc_msgSend(v9, "identifier");
          v11 = objc_msgSend(location[0], "objectAtIndexedSubscript:", (int)v15);
          v12 = objc_msgSend(v11, "identifier");
          v13 = objc_msgSend(v10, "isEqualToString:", v12) ^ 1;

          if ((v13 & 1) != 0)
          {
            v18 = 2;
            goto LABEL_12;
          }
        }
      }
      v18 = 3;
    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_12:
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)description
{
  NSMutableDictionary *v2;
  id v3;

  v2 = -[BYMultilingualAnalyticsEvent mutablePayload](self, "mutablePayload", a2, self);
  v3 = -[NSMutableDictionary description](v2, "description");

  return v3;
}

+ (id)identifierForAction:(unint64_t)a3
{
  id result;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("inserted");
      break;
    case 1uLL:
      result = CFSTR("deleted");
      break;
    case 2uLL:
      result = CFSTR("rearranged");
      break;
    case 3uLL:
      v4 = CFSTR("unchanged");
      goto LABEL_6;
    default:
LABEL_6:
      result = v4;
      break;
  }
  return result;
}

+ (id)stringNameForMultilingualPane:(unint64_t)a3
{
  id result;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("Language");
      break;
    case 1uLL:
      result = CFSTR("Keyboard");
      break;
    case 2uLL:
      v4 = CFSTR("Dictation");
      goto LABEL_6;
    case 3uLL:
      result = CFSTR("MultilingualExpress");
      break;
    default:
LABEL_6:
      result = v4;
      break;
  }
  return result;
}

+ (id)stringDescriptionForArray:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "valueForKey:", CFSTR("identifier"));
  v4 = objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));

  objc_storeStrong(location, 0);
  return v4;
}

+ (id)stringDescriptionForNestedArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[2];
  id v15;
  _BYTE v16[128];

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = +[NSMutableString string](NSMutableString, "string");
  memset(v11, 0, sizeof(v11));
  v3 = location[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = v13;
        v8 = objc_msgSend(v15, "stringDescriptionForArray:", v12);
        objc_msgSend(v7, "appendString:", v8);

        objc_msgSend(v13, "appendString:", CFSTR(" | "));
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v13, "copy");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePayload, a3);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_mutablePayload, 0);
}

@end
