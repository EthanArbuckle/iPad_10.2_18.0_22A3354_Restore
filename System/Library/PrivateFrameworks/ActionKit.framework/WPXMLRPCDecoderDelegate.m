@implementation WPXMLRPCDecoderDelegate

- (WPXMLRPCDecoderDelegate)initWithParent:(id)a3
{
  id v4;
  WPXMLRPCDecoderDelegate *v5;
  WPXMLRPCDecoderDelegate *v6;
  uint64_t v7;
  NSMutableArray *myChildren;
  NSString *myElementKey;
  id v10;
  id myElementValue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WPXMLRPCDecoderDelegate;
  v5 = -[WPXMLRPCDecoderDelegate init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->myParent, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    myChildren = v6->myChildren;
    v6->myChildren = (NSMutableArray *)v7;

    v6->myElementType = 7;
    myElementKey = v6->myElementKey;
    v6->myElementKey = 0;

    v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    myElementValue = v6->myElementValue;
    v6->myElementValue = v10;

  }
  return v6;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->myParent, a3);
}

- (id)parent
{
  return objc_loadWeakRetained((id *)&self->myParent);
}

- (void)setElementType:(int)a3
{
  self->myElementType = a3;
}

- (int)elementType
{
  return self->myElementType;
}

- (void)setElementKey:(id)a3
{
  objc_storeStrong((id *)&self->myElementKey, a3);
}

- (id)elementKey
{
  return self->myElementKey;
}

- (void)setElementValue:(id)a3
{
  objc_storeStrong(&self->myElementValue, a3);
}

- (id)elementValue
{
  return self->myElementValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->myElementValue, 0);
  objc_storeStrong((id *)&self->myElementKey, 0);
  objc_storeStrong((id *)&self->myChildren, 0);
  objc_destroyWeak((id *)&self->myParent);
}

- (BOOL)isDictionaryElementType:(int)a3
{
  return (self->myElementType - 1) < 2;
}

- (void)addElementValueToParent
{
  WPXMLRPCDecoderDelegate **p_myParent;
  id WeakRetained;
  id v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  int myElementType;
  id v11;
  void *v12;
  id myElementValue;
  id v14;

  p_myParent = &self->myParent;
  WeakRetained = objc_loadWeakRetained((id *)&self->myParent);
  objc_msgSend(WeakRetained, "elementValue");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_myParent);
  v6 = objc_msgSend(v5, "elementType");

  if (v6 == 2)
  {
    myElementType = self->myElementType;
    v11 = objc_loadWeakRetained((id *)p_myParent);
    v12 = v11;
    myElementValue = self->myElementValue;
    if (myElementType == 3)
      objc_msgSend(v11, "setElementKey:", myElementValue);
    else
      objc_msgSend(v11, "setElementValue:", myElementValue);

    goto LABEL_12;
  }
  if (v6 == 1)
  {
    v8 = self->myElementValue;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

    if ((_DWORD)v8)
      objc_msgSend(v14, "removeObjectForKey:", self->myElementKey);
    else
      objc_msgSend(v14, "setObject:forKey:", self->myElementValue, self->myElementKey);
    goto LABEL_12;
  }
  v7 = v14;
  if (!v6)
  {
    objc_msgSend(v14, "addObject:", self->myElementValue);
LABEL_12:
    v7 = v14;
  }

}

- (id)parseDateString:(id)a3 withFormat:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x24BDBCEA0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v9, "setLocale:", v8);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "setDateFormat:", v6);
  objc_msgSend(v9, "dateFromString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)parseInteger:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "integerValue"));
}

- (id)parseDouble:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

- (id)parseBoolean:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("1"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)parseDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WPXMLRPCDecoderDelegate parseDateString:withFormat:](self, "parseDateString:withFormat:", v4, CFSTR("yyyyMMdd'T'HH:mm:ss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[WPXMLRPCDecoderDelegate parseDateString:withFormat:](self, "parseDateString:withFormat:", v4, CFSTR("yyyy'-'MM'-'dd'T'HH:mm:ss"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)parseData:(id)a3
{
  return +[WPBase64Utils decodeString:](WPBase64Utils, "decodeString:", a3);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  WPXMLRPCDecoderDelegate *v10;
  uint64_t v11;
  WPXMLRPCDecoderDelegate *v12;
  uint64_t v13;
  WPXMLRPCDecoderDelegate *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("value")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("member")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("name")))
  {
    v10 = -[WPXMLRPCDecoderDelegate initWithParent:]([WPXMLRPCDecoderDelegate alloc], "initWithParent:", self);
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("member")) & 1) != 0)
    {
      v11 = 2;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("name")))
      {
LABEL_9:
        -[NSMutableArray addObject:](self->myChildren, "addObject:", v10);
        objc_msgSend(v16, "setDelegate:", v10);
LABEL_10:

        goto LABEL_11;
      }
      v11 = 3;
    }
    -[WPXMLRPCDecoderDelegate setElementType:](v10, "setElementType:", v11);
    goto LABEL_9;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("array")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("params")))
  {
    v10 = (WPXMLRPCDecoderDelegate *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[WPXMLRPCDecoderDelegate setElementValue:](self, "setElementValue:", v10);
    v12 = self;
    v13 = 0;
LABEL_15:
    -[WPXMLRPCDecoderDelegate setElementType:](v12, "setElementType:", v13);
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("struct")))
  {
    v10 = (WPXMLRPCDecoderDelegate *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[WPXMLRPCDecoderDelegate setElementValue:](self, "setElementValue:", v10);
    v12 = self;
    v13 = 1;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("int")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("i4")))
  {
    v14 = self;
    v15 = 4;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("double")))
  {
    v14 = self;
    v15 = 5;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("BOOLean")))
  {
    v14 = self;
    v15 = 6;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("string")))
  {
    v14 = self;
    v15 = 7;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("dateTime.iso8601")))
  {
    v14 = self;
    v15 = 8;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("base64")))
      goto LABEL_11;
    v14 = self;
    v15 = 9;
  }
  -[WPXMLRPCDecoderDelegate setElementType:](v14, "setElementType:", v15);
LABEL_11:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v8;
  void *v9;
  id myElementValue;
  id v11;
  id v12;
  id WeakRetained;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("value")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("member")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("name")))
  {
    if (self->myElementType)
    {
      if (-[WPXMLRPCDecoderDelegate isDictionaryElementType:](self, "isDictionaryElementType:"))
      {
        v9 = 0;
      }
      else
      {
        -[WPXMLRPCDecoderDelegate parseString:](self, "parseString:", self->myElementValue);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        myElementValue = self->myElementValue;
        self->myElementValue = 0;

      }
      switch(self->myElementType)
      {
        case 3:
        case 7:
          v11 = v9;
          goto LABEL_16;
        case 4:
          -[WPXMLRPCDecoderDelegate parseInteger:](self, "parseInteger:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 5:
          -[WPXMLRPCDecoderDelegate parseDouble:](self, "parseDouble:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 6:
          -[WPXMLRPCDecoderDelegate parseBoolean:](self, "parseBoolean:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 8:
          -[WPXMLRPCDecoderDelegate parseDate:](self, "parseDate:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 9:
          -[WPXMLRPCDecoderDelegate parseData:](self, "parseData:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
          v12 = self->myElementValue;
          self->myElementValue = v11;

          break;
        default:
          break;
      }
    }
    else
    {
      v9 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->myParent);
    if (WeakRetained)
    {
      v14 = self->myElementValue;

      if (v14)
        -[WPXMLRPCDecoderDelegate addElementValueToParent](self, "addElementValueToParent");
    }
    v15 = objc_loadWeakRetained((id *)&self->myParent);
    objc_msgSend(v16, "setDelegate:", v15);

  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;
  id myElementValue;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->myElementType && !-[WPXMLRPCDecoderDelegate isDictionaryElementType:](self, "isDictionaryElementType:"))
  {
    myElementValue = self->myElementValue;
    if (myElementValue)
    {
      objc_msgSend(myElementValue, "appendString:", v6);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v6);
      v9 = self->myElementValue;
      self->myElementValue = v8;

    }
  }

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  objc_msgSend(a3, "abortParsing");
}

@end
