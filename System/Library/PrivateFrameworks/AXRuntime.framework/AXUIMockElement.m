@implementation AXUIMockElement

- (id)copyWithZone:(_NSZone *)a3
{
  AXUIMockElement *v4;
  AXUIMockElement *v5;
  uint64_t v6;
  NSMutableDictionary *attributes;
  uint64_t v8;
  NSMutableDictionary *writableAttributes;
  uint64_t v10;
  NSMutableDictionary *performActionLog;
  uint64_t v12;
  id handleActionBlock;

  v4 = objc_alloc_init(AXUIMockElement);
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableDictionary mutableCopy](v5->_attributes, "mutableCopy");
  attributes = v4->_attributes;
  v4->_attributes = (NSMutableDictionary *)v6;

  v8 = -[NSMutableDictionary mutableCopy](v5->_writableAttributes, "mutableCopy");
  writableAttributes = v4->_writableAttributes;
  v4->_writableAttributes = (NSMutableDictionary *)v8;

  v10 = -[NSMutableDictionary mutableCopy](v5->_performActionLog, "mutableCopy");
  performActionLog = v4->_performActionLog;
  v4->_performActionLog = (NSMutableDictionary *)v10;

  _Block_copy(v5->_handleActionBlock);
  v12 = objc_claimAutoreleasedReturnValue();
  handleActionBlock = v4->_handleActionBlock;
  v4->_handleActionBlock = (id)v12;

  objc_sync_exit(v5);
  return v4;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3
{
  return (id)objc_msgSend(a1, "init");
}

- (AXUIMockElement)init
{
  AXUIMockElement *v2;
  uint64_t v3;
  NSMutableDictionary *attributes;
  uint64_t v5;
  NSMutableDictionary *writableAttributes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXUIMockElement;
  v2 = -[AXUIMockElement init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
    writableAttributes = v2->_writableAttributes;
    v2->_writableAttributes = (NSMutableDictionary *)v5;

    -[AXUIMockElement setValue:forAXAttribute:](v2, "setValue:forAXAttribute:", MEMORY[0x1E0C9AAB0], 2016);
  }
  return v2;
}

- (BOOL)isMockElement
{
  return 1;
}

- (__AXUIElement)axElement
{
  return 0;
}

- (id)visibleElements
{
  return 0;
}

- (void)startLoggingActions
{
  __assert_rtn("-[AXUIMockElement startLoggingActions]", "AXUIMockElement.m", 73, "_performActionLog == nil");
}

- (id)endLoggingActions
{
  NSMutableDictionary *v3;
  NSMutableDictionary *performActionLog;

  v3 = self->_performActionLog;
  performActionLog = self->_performActionLog;
  self->_performActionLog = 0;

  return v3;
}

- (id)performBlockWhileLoggingPerformedActions:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[AXUIMockElement startLoggingActions](self, "startLoggingActions");
  v4[2](v4);

  return -[AXUIMockElement endLoggingActions](self, "endLoggingActions");
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMockElement rectWithAXAttribute:](self, "rectWithAXAttribute:", 2003);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[AXUIMockElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 2004);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsignedLongLongValue");
  v14 = (void *)_AXTraitsAsString();

  -[AXUIMockElement pointWithAXAttribute:](self, "pointWithAXAttribute:", 2007);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<AXUIMockElement %p>{Text: %@, Value: %@, Frame: {%.0f,%.0f,%.0f,%.0f} CP: %.0f %.0f} : Traits: %@"), self, v3, v4, v6, v8, v10, v12, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_valueForAttribute:(int64_t)a3
{
  AXUIMockElement *v4;
  NSMutableDictionary *attributes;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  attributes = v4->_attributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](attributes, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    || (v6 = (void *)objc_opt_class(), (objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    || (v7 = (void *)objc_opt_class(), objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class())))
  {
    v8 = -[AXUIMockElement hash](self, "hash");
    v9 = v8 == objc_msgSend(v4, "hash");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setWritable:(BOOL)a3 forAXAttribute:(int64_t)a4
{
  _BOOL4 v5;
  NSMutableDictionary *writableAttributes;
  void *v7;
  uint64_t v8;
  AXUIMockElement *obj;

  v5 = a3;
  obj = self;
  objc_sync_enter(obj);
  writableAttributes = obj->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = MEMORY[0x1E0C9AAA0];
  -[NSMutableDictionary setObject:forKey:](writableAttributes, "setObject:forKey:", v8, v7);

  objc_sync_exit(obj);
}

- (BOOL)canSetAXAttribute:(int64_t)a3
{
  return 1;
}

- (id)uiElementWithAXAttribute:(int64_t)a3
{
  void *v3;
  id v4;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString((NSString *)CFSTR("AXUIElement"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)canPerformAXAction:(int)a3
{
  return 1;
}

- (void)setValue:(id)a3 forAXAttribute:(int64_t)a4
{
  AXUIMockElement *v6;
  NSMutableDictionary *attributes;
  void *v8;
  id v9;

  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  attributes = v6->_attributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", v9, v8);
  else
    -[NSMutableDictionary removeObjectForKey:](attributes, "removeObjectForKey:", v8);

  objc_sync_exit(v6);
}

- (void)setValue:(id)a3 forAXParameterizedAttribute:(int64_t)a4
{
  AXUIMockElement *v6;
  NSMutableDictionary *attributes;
  void *v8;
  id v9;

  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  attributes = v6->_attributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", v9, v8);
  else
    -[NSMutableDictionary removeObjectForKey:](attributes, "removeObjectForKey:", v8);

  objc_sync_exit(v6);
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXUIMockElement usesCarriageReturnAsLinesSeparator](self, "usesCarriageReturnAsLinesSeparator"))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_1E691BCF0);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  void *v3;
  char v4;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (float)floatWithAXAttribute:(int64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int64_t)longWithAXAttribute:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;

  if ((unint64_t)(a3 - 4001) > 1)
  {
    -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[AXUIMockElement rangeWithAXAttribute:](self, "rangeWithAXAttribute:", 2005);
    v9 = xmmword_1B54F0210;
    AXValueGetValue((AXValueRef)-[AXUIMockElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", 94009, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5)), kAXValueTypeCFRange, &v9);
    v6 = *((_QWORD *)&v9 + 1);
    if (a3 == 4001)
      v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v9 + v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)sizeWithAXAttribute:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  __int128 v9;
  _NSRange result;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a3 == 2005 && (isKindOfClass & 1) != 0)
    {
      v9 = 0uLL;
      AXValueGetValue((AXValueRef)objc_msgSend(v4, "firstObject"), kAXValueTypeCFRange, &v9);
    }
    else
    {
      *(_QWORD *)&v9 = objc_msgSend(v4, "rangeValue");
      *((_QWORD *)&v9 + 1) = v6;
    }
  }
  else
  {
    v9 = xmmword_1B54F0210;
  }

  v8 = *((_QWORD *)&v9 + 1);
  v7 = v9;
  result.length = v8;
  result.location = v7;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  return 0;
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)arrayCountWithAXAttribute:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSRange v18;
  NSRange v19;
  uint64_t v20;
  NSRange v21;
  NSRange v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  AXValueRef v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 valuePtr;
  NSRange v40;
  NSRange v41;

  v6 = 0;
  if (a3 > 94008)
  {
    switch(a3)
    {
      case 95225:
        v14 = 95225;
        goto LABEL_35;
      case 95226:
      case 95229:
      case 95233:
      case 95234:
      case 95235:
      case 95236:
      case 95237:
      case 95238:
      case 95245:
      case 95246:
      case 95247:
      case 95248:
      case 95249:
      case 95250:
      case 95251:
      case 95252:
        return v6;
      case 95227:
      case 95228:
      case 95230:
      case 95231:
      case 95232:
      case 95253:
LABEL_8:
        -[AXUIMockElement objectWithAXAttribute:](self, "objectWithAXAttribute:");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      case 95239:
        v14 = 95239;
        goto LABEL_35;
      case 95240:
        v14 = 95240;
        goto LABEL_35;
      case 95241:
        v14 = 95241;
        goto LABEL_35;
      case 95242:
        v14 = 95242;
        goto LABEL_35;
      case 95243:
        v14 = 95243;
        goto LABEL_35;
      case 95244:
        v14 = 95244;
        goto LABEL_35;
      default:
        if (a3 == 94009)
        {
          v24 = objc_msgSend(a4, "unsignedIntegerValue");
          -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v8, "length");
          valuePtr = xmmword_1B54F0210;
          v26 = v25 - v24;
          if (v25 > v24)
          {
            v27 = v25;
            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v28, 4, 0, v24);

            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v30, 0, v24, v26);

            if (v29 == 0x7FFFFFFFFFFFFFFFLL)
              v32 = 0;
            else
              v32 = v29;
            if (v31 == 0x7FFFFFFFFFFFFFFFLL)
              v33 = v27;
            else
              v33 = v31;
            *(_QWORD *)&valuePtr = v32;
            *((_QWORD *)&valuePtr + 1) = v33 - v32;
          }
          v20 = (uint64_t)AXValueCreate(kAXValueTypeCFRange, &valuePtr);
LABEL_53:
          v6 = (void *)v20;
          goto LABEL_61;
        }
        if (a3 == 94500)
        {
          v14 = 94500;
LABEL_35:
          -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", v14);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_36:
          v6 = (void *)v13;
        }
        break;
    }
  }
  else if (a3 <= 92502)
  {
    switch(a3)
    {
      case 2702:
        v14 = 2702;
        goto LABEL_35;
      case 2703:
        v14 = 2703;
        goto LABEL_35;
      case 2704:
        v14 = 2704;
        goto LABEL_35;
      case 2705:
        v14 = 2705;
        goto LABEL_35;
      case 2706:
        v14 = 2706;
        goto LABEL_35;
      default:
        if (a3 == 3000)
          goto LABEL_8;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 92503:
        if (!-[AXUIMockElement usesCarriageReturnAsLinesSeparator](self, "usesCarriageReturnAsLinesSeparator"))
          return 0;
        valuePtr = *MEMORY[0x1E0C9D538];
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCGPoint, &valuePtr);
        v7 = -[AXUIMockElement _lineNumberForPoint:](self, "_lineNumberForPoint:", valuePtr);
        -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 2006);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\r"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 >= objc_msgSend(v9, "count"))
        {
          v6 = 0;
        }
        else
        {
          v10 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("lineNumber"), v12, CFSTR("lineColumn"), 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_60;
      case 92504:
        if (!-[AXUIMockElement usesCarriageReturnAsLinesSeparator](self, "usesCarriageReturnAsLinesSeparator"))
          return 0;
        objc_msgSend(a4, "objectForKey:", CFSTR("lineNumber"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 2006);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\r"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        valuePtr = xmmword_1B54F0210;
        if (v16 < objc_msgSend(v9, "count"))
        {
          if (v16)
          {
            objc_msgSend(v9, "subarrayWithRange:", 0, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = 0;
          }
          objc_msgSend(v17, "componentsJoinedByString:", &stru_1E691BCF0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length");
          objc_msgSend(v9, "objectAtIndex:", v16);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&valuePtr = v37;
          *((_QWORD *)&valuePtr + 1) = objc_msgSend(v38, "length");

        }
        v35 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
        goto LABEL_59;
      case 92505:
        valuePtr = 0uLL;
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCFRange, &valuePtr);
        -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (NSRange)valuePtr;
        v40.length = objc_msgSend(v8, "length");
        v40.location = 0;
        v19 = NSIntersectionRange(v18, v40);
        objc_msgSend(v8, "substringWithRange:", v19.location, v19.length);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      case 92506:
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      case 92507:
      case 92511:
      case 92512:
      case 92513:
      case 92514:
      case 92515:
      case 92516:
        return v6;
      case 92508:
        valuePtr = 0uLL;
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCFRange, &valuePtr);
        -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (NSRange)valuePtr;
        v41.length = objc_msgSend(v8, "length");
        v41.location = 0;
        v22 = NSIntersectionRange(v21, v41);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "attributedSubstringFromRange:", v22.location, v22.length);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        v34 = objc_allocWithZone((Class)AXAttributedString);
        objc_msgSend(v8, "substringWithRange:", v22.location, v22.length);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (AXValueRef)objc_msgSend(v34, "initWithString:", v9);
LABEL_59:
        v6 = v35;
LABEL_60:

        break;
      case 92509:
      case 92510:
        goto LABEL_8;
      case 92517:
        v14 = 92517;
        goto LABEL_35;
      default:
        if (a3 == 92702)
          goto LABEL_8;
        if (a3 != 92704)
          return v6;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 67, 14);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
    }
LABEL_61:

  }
  return v6;
}

- (id)cachedAttributes
{
  AXUIMockElement *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_attributes, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)copyCachedAttributes
{
  AXUIMockElement *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary ax_deepMutableCopy](v2->_attributes, "ax_deepMutableCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)performAXAction:(int)a3
{
  uint64_t v3;
  void *v5;
  NSMutableDictionary *performActionLog;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  performActionLog = self->_performActionLog;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](performActionLog, "setObject:forKeyedSubscript:", v5, v7);

  -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = v9[2](v9, v3, 0);

  return v10;
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  NSString *v9;
  NSRange v10;
  void *v11;
  void *v12;
  NSMutableDictionary *performActionLog;
  void *v14;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD);
  char v17;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((_DWORD)v4 == 2505)
  {
    -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 2006);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("range"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSRangeFromString(v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("replacement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v10.location, v10.length, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v12, 2006);

  }
  performActionLog = self->_performActionLog;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](performActionLog, "setObject:forKeyedSubscript:", v6, v14);

  -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
    v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17 = ((uint64_t (**)(_QWORD, uint64_t, id))v16)[2](v16, v4, v6);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXUIMockElement handleActionBlock](self, "handleActionBlock");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, uint64_t, id))v9)[2](v9, v5, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  -[AXUIMockElement updateCache:](self, "updateCache:", 92502);
  return -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 92502);
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  -[AXUIMockElement updateCache:](self, "updateCache:", 92501);
  return -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 92501);
}

- (id)nextElementsWithParameters:(id)a3
{
  -[AXUIMockElement updateCache:](self, "updateCache:", 92501);
  return -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 92501);
}

- (id)previousElementsWithParameters:(id)a3
{
  -[AXUIMockElement updateCache:](self, "updateCache:", 92502);
  return -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:", 92502);
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isValidForApplication:(id)a3
{
  return 1;
}

- (int)pid
{
  return 0;
}

- (void)updateCache:(int64_t)a3
{
  void *v5;
  void (**v6)(id, AXUIMockElement *, int64_t);

  -[AXUIMockElement cacheUpdatedCallback](self, "cacheUpdatedCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXUIMockElement cacheUpdatedCallback](self, "cacheUpdatedCallback");
    v6 = (void (**)(id, AXUIMockElement *, int64_t))objc_claimAutoreleasedReturnValue();
    v6[2](v6, self, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableDictionary *writableAttributes;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a4;
  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v11, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  NSMutableDictionary *writableAttributes;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v10, a3);

}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  NSMutableDictionary *writableAttributes;
  void *v8;
  void *v9;
  int v10;
  id v11;

  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v11, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  NSMutableDictionary *writableAttributes;
  void *v8;
  void *v9;
  int v10;
  double v11;
  id v12;

  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    *(float *)&v11 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v12, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  NSMutableDictionary *writableAttributes;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v10, a3);

}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  double y;
  double x;
  NSMutableDictionary *writableAttributes;
  void *v9;
  void *v10;
  int v11;
  id v12;

  y = a4.y;
  x = a4.x;
  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", x, y);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v12, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  NSMutableDictionary *writableAttributes;
  void *v9;
  void *v10;
  int v11;
  id v12;

  height = a4.height;
  width = a4.width;
  writableAttributes = self->_writableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](writableAttributes, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", width, height);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v12, a3);

  }
}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4.location, a4.length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v6, a3);

}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6;

  v6 = a4;
  if (-[AXUIMockElement canSetAXAttribute:](self, "canSetAXAttribute:", a3))
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v6, a3);

}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6;

  v6 = a4;
  if (-[AXUIMockElement canSetAXAttribute:](self, "canSetAXAttribute:", a3))
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v6, a3);

}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6;

  v6 = a4;
  if (-[AXUIMockElement canSetAXAttribute:](self, "canSetAXAttribute:", a3))
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v6, a3);

}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
  id v6;

  v6 = a4;
  if (-[AXUIMockElement canSetAXAttribute:](self, "canSetAXAttribute:", a3))
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v6, a3);

}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  id v7;

  v7 = a4;
  if (-[AXUIMockElement canSetAXAttribute:](self, "canSetAXAttribute:", a3))
    -[AXUIMockElement setValue:forAXAttribute:](self, "setValue:forAXAttribute:", v7, a3);

}

- (CGPoint)pointForLineNumber:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = (double)a3 * 20.0;
  v4 = 100.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (unint64_t)_lineNumberForPoint:(CGPoint)a3
{
  return vcvtpd_u64_f64(a3.y / 20.0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXUIMockElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)usesCarriageReturnAsLinesSeparator
{
  return self->_usesCarriageReturnAsLinesSeparator;
}

- (void)setUsesCarriageReturnAsLinesSeparator:(BOOL)a3
{
  self->_usesCarriageReturnAsLinesSeparator = a3;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (void)setIsApplication:(BOOL)a3
{
  self->_isApplication = a3;
}

- (id)handleActionBlock
{
  return self->_handleActionBlock;
}

- (void)setHandleActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)cacheUpdatedCallback
{
  return self->_cacheUpdatedCallback;
}

- (void)setCacheUpdatedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cacheUpdatedCallback, 0);
  objc_storeStrong(&self->_handleActionBlock, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_performActionLog, 0);
  objc_storeStrong((id *)&self->_writableAttributes, 0);
}

@end
