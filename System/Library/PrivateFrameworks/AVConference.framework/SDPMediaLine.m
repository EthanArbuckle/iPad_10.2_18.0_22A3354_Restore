@implementation SDPMediaLine

- (SDPMediaLine)init
{
  SDPMediaLine *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)SDPMediaLine;
  v2 = -[SDPMediaLine init](&v4, sel_init);
  if (v2)
  {
    v2->_attributes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v2->_imageAttributeRules = (VCImageAttributeRules *)objc_opt_new();
    v2->_payloads = (NSMutableArray *)objc_opt_new();
  }
  return v2;
}

- (SDPMediaLine)initWithParser:(id)a3 rtpPort:(int)a4 payloads:(id)a5
{
  SDPMediaLine *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SDPMediaLine;
  v8 = -[SDPMediaLine init](&v10, sel_init);
  if (v8)
  {
    v8->_attributes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v8->_imageAttributeRules = (VCImageAttributeRules *)objc_opt_new();
    v8->_payloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a5);
    v8->_rtpPort = a4;
    -[SDPMediaLine parseMediaLine:](v8, "parseMediaLine:", a3);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)SDPMediaLine;
  -[SDPMediaLine dealloc](&v3, sel_dealloc);
}

- (void)addAttribute:(id)a3
{
  -[NSMutableArray addObject:](self->_attributes, "addObject:", a3);
}

- (void)addPayload:(int)a3 rtpMap:(id)a4 formatParameters:(id)a5
{
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(_QWORD *)&a3);
  if ((-[NSMutableArray containsObject:](self->_payloads, "containsObject:") & 1) == 0)
    -[NSMutableArray addObject:](self->_payloads, "addObject:", v8);
  if ((-[NSMutableArray containsObject:](self->_attributes, "containsObject:", a4) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_attributes, "addObject:", a4);
    -[NSMutableArray addObject:](self->_attributes, "addObject:", a5);
  }

}

- (void)addVideoImageAttr:(id)a3 ForPayload:(int)a4
{
  uint64_t v6;
  NSMutableArray *attributes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageattr:%d"), *(_QWORD *)&a4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  attributes = self->_attributes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(attributes);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", v6) & 1) != 0)
        {
          -[NSMutableArray addObject:](self->_attributes, "addObject:", objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %@"), a3));
          -[NSMutableArray removeObject:](self->_attributes, "removeObject:", v12);
          return;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v9)
        continue;
      break;
    }
  }
  -[NSMutableArray addObject:](self->_attributes, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v6, a3));
}

- (void)appendPayload:(int)a3 dimensions:(imageTag *)a4 direction:(int)a5 attributeString:(id)a6
{
  uint64_t var0;
  uint64_t v8;
  uint64_t v10;
  uint64_t var2;
  uint64_t var3;
  uint64_t var5;
  float var7;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  var0 = a4->var0;
  if (a4->var3 * (_DWORD)var0 * a4->var6)
  {
    v8 = *(_QWORD *)&a5;
    v10 = *(_QWORD *)&a3;
    var2 = a4->var2;
    if ((_DWORD)var0 == (_DWORD)var2)
      objc_msgSend(a6, "appendFormat:", CFSTR(" [x=%d,"), a4->var0, v17, v19);
    else
      objc_msgSend(a6, "appendFormat:", CFSTR(" [x=[%d:%d:%d],"), var0, a4->var1, var2);
    var3 = a4->var3;
    var5 = a4->var5;
    if ((_DWORD)var3 == (_DWORD)var5)
      objc_msgSend(a6, "appendFormat:", CFSTR("y=%d,"), a4->var3, v18, v20);
    else
      objc_msgSend(a6, "appendFormat:", CFSTR("y=[%d:%d:%d],"), var3, a4->var4, var5);
    objc_msgSend(a6, "appendFormat:", CFSTR("fps=%d"), a4->var6);
    if (a4->var8 == 1)
      objc_msgSend(a6, "appendString:", CFSTR(",i=1"));
    var7 = a4->var7;
    if (var7 == 0.5)
      objc_msgSend(a6, "appendString:", CFSTR("]"));
    else
      objc_msgSend(a6, "appendFormat:", CFSTR(",q=%.2f]"), var7);
    LODWORD(v16) = a4->var8;
    -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:](self->_imageAttributeRules, "addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:", v10, v8, a4->var2, a4->var5, a4->var6, (int)a4->var7, v16);
  }
}

- (void)addImageAttributeRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 direction:(int)a6 attributeString:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  int v19;
  float v20;
  _QWORD v21[3];
  uint64_t v22;
  int v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v29 = *MEMORY[0x1E0C80C00];
  memset(v21, 170, sizeof(v21));
  v22 = -1431655766;
  if (a4 == 1)
    v12 = 2;
  else
    v12 = 1;
  v23 = v12;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(a3);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        LODWORD(v21[1]) = objc_msgSend(v17, "iWidth");
        LODWORD(v21[0]) = v21[1];
        v18 = objc_msgSend(v17, "iHeight");
        LODWORD(v21[2]) = 0;
        HIDWORD(v21[2]) = v18;
        HIDWORD(v21[1]) = v18;
        HIDWORD(v21[0]) = 0;
        objc_msgSend(v17, "fPref");
        HIDWORD(v22) = v19;
        objc_msgSend(v17, "fRate");
        LODWORD(v22) = (int)v20;
        -[SDPMediaLine appendPayload:dimensions:direction:attributeString:](self, "appendPayload:dimensions:direction:attributeString:", v9, v21, v8, a7);
      }
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v14);
  }
}

- (void)addWifiRules:(id)a3 cellularRules:(id)a4 payload:(int)a5 direction:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  const __CFString *v12;
  id v13;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  if (a3 && objc_msgSend(a3, "count") || a4 && objc_msgSend(a4, "count"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
    if ((_DWORD)v6)
      v12 = CFSTR("recv");
    else
      v12 = CFSTR("send");
    v13 = (id)objc_msgSend(v11, "initWithString:", v12);
    if (a3 && objc_msgSend(a3, "count"))
      -[SDPMediaLine addImageAttributeRules:transportType:payload:direction:attributeString:](self, "addImageAttributeRules:transportType:payload:direction:attributeString:", a3, 1, v7, v6, v13);
    if (a4)
    {
      if (objc_msgSend(a4, "count"))
        -[SDPMediaLine addImageAttributeRules:transportType:payload:direction:attributeString:](self, "addImageAttributeRules:transportType:payload:direction:attributeString:", a4, 2, v7, v6, v13);
    }
    -[SDPMediaLine addVideoImageAttr:ForPayload:](self, "addVideoImageAttr:ForPayload:", v13, v7);

  }
}

- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6
{
  uint64_t v6;
  imageTag *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v11;
  uint64_t v12;

  if (a5)
  {
    LODWORD(v6) = a6;
    if (a6 >= 1)
    {
      v7 = a5;
      v8 = *(_QWORD *)&a4;
      v9 = *(_QWORD *)&a3;
      v11 = "recv";
      if (!a4)
        v11 = "send";
      v12 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%s"), v11);
      v6 = v6;
      do
      {
        -[SDPMediaLine appendPayload:dimensions:direction:attributeString:](self, "appendPayload:dimensions:direction:attributeString:", v9, v7++, v8, v12);
        --v6;
      }
      while (v6);
      -[SDPMediaLine addVideoImageAttr:ForPayload:](self, "addVideoImageAttr:ForPayload:", v12, v9);
    }
  }
}

- (id)videoImageAttributes:(int)a3
{
  uint64_t v4;
  id v5;
  NSMutableArray *attributes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageattr:%d"), *(_QWORD *)&a3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  attributes = self->_attributes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(attributes);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v4))
        {
          v12 = (void *)objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
          if ((int)objc_msgSend(v12, "count") >= 2)
          {
            v13 = 1;
            do
              objc_msgSend(v5, "addObject:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13++));
            while (v13 < (int)objc_msgSend(v12, "count"));
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)getVideoSendImages:(id)a3
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)objc_msgSend(a3, "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v6 = (void *)v4;
    v7 = 0;
    *(_QWORD *)&v5 = 136315650;
    v15 = v5;
    do
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("send"), v15))
      {
        if (v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v17 = v12;
              v18 = 2080;
              v19 = "-[SDPMediaLine getVideoSendImages:]";
              v20 = 1024;
              v21 = 228;
              _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d multiple send markers found!", buf, 0x1Cu);
            }
          }
        }
        else
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        }
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("recv")))
      {
        if (v7)
          return v7;
      }
      else if (v7
             && objc_msgSend(v6, "hasPrefix:", CFSTR("["))
             && (objc_msgSend(v6, "hasSuffix:", CFSTR("]")) & 1) != 0)
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1), "substringFromIndex:", 1);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = (void *)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
        if ((int)objc_msgSend(v10, "count") >= 1)
        {
          v11 = 0;
          do
            objc_msgSend(v9, "addObject:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11++));
          while (v11 < (int)objc_msgSend(v10, "count"));
        }
        objc_msgSend(v7, "addObject:", v9);

      }
      v6 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getVideoRecvImages:(id)a3
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)objc_msgSend(a3, "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v6 = (void *)v4;
    v7 = 0;
    *(_QWORD *)&v5 = 136315650;
    v15 = v5;
    do
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("recv"), v15))
      {
        if (v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v17 = v12;
              v18 = 2080;
              v19 = "-[SDPMediaLine getVideoRecvImages:]";
              v20 = 1024;
              v21 = 271;
              _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d multiple recv markers found!", buf, 0x1Cu);
            }
          }
        }
        else
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        }
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("send")))
      {
        if (v7)
          return v7;
      }
      else if (v7
             && objc_msgSend(v6, "hasPrefix:", CFSTR("["))
             && (objc_msgSend(v6, "hasSuffix:", CFSTR("]")) & 1) != 0)
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1), "substringFromIndex:", 1);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = (void *)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
        if ((int)objc_msgSend(v10, "count") >= 1)
        {
          v11 = 0;
          do
            objc_msgSend(v9, "addObject:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11++));
          while (v11 < (int)objc_msgSend(v10, "count"));
        }
        objc_msgSend(v7, "addObject:", v9);

      }
      v6 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (void)fillImageStructWithDictionary:(id)a3 forInterface:(int)a4 imageStruct:(imageTag *)a5
{
  int v8;
  int v9;
  float v10;

  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("width"))
    && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("height"))
    && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("frameRate")))
  {
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("priority")))
    {
      v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("width")), "intValue");
      a5->var0 = v8;
      a5->var1 = 0;
      a5->var2 = v8;
      v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("height")), "intValue");
      a5->var3 = v9;
      a5->var4 = 0;
      a5->var5 = v9;
      a5->var6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("frameRate")), "intValue");
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("priority")), "floatValue");
      a5->var7 = v10;
      a5->var8 = a4;
    }
  }
}

+ (void)fillImageStruct:(id)a3 imageStruct:(imageTag *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  float v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *(_QWORD *)&a4->var7 = 0x23F000000;
    v5 = (void *)objc_msgSend(a3, "objectEnumerator");
    v6 = objc_msgSend(v5, "nextObject");
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        if (objc_msgSend(v7, "hasPrefix:", CFSTR("x=[")))
        {
          v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1), "substringFromIndex:", 3), "componentsSeparatedByString:", CFSTR(":"));
          if (objc_msgSend(v8, "count") == 3)
          {
            a4->var0 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "intValue");
            a4->var1 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue");
            v9 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 2), "intValue");
LABEL_9:
            a4->var2 = v9;
          }
        }
        else
        {
          if (objc_msgSend(v7, "hasPrefix:", CFSTR("x=")))
          {
            v9 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
            *(_QWORD *)&a4->var0 = v9;
            goto LABEL_9;
          }
          if (!objc_msgSend(v7, "hasPrefix:", CFSTR("y=[")))
          {
            if (!objc_msgSend(v7, "hasPrefix:", CFSTR("y=")))
            {
              if (objc_msgSend(v7, "hasPrefix:", CFSTR("fps=")))
              {
                a4->var6 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 4), "intValue");
              }
              else if (objc_msgSend(v7, "hasPrefix:", CFSTR("q=")))
              {
                objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "floatValue");
                a4->var7 = v12;
              }
              else if (objc_msgSend(v7, "hasPrefix:", CFSTR("i=")))
              {
                a4->var8 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                v17 = VRTraceErrorLogLevelToCSTR();
                v13 = *MEMORY[0x1E0CF2758];
                v14 = *MEMORY[0x1E0CF2758];
                if (*MEMORY[0x1E0CF2748])
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    v15 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
                    *(_DWORD *)buf = 136315906;
                    v19 = v17;
                    v20 = 2080;
                    v21 = "+[SDPMediaLine fillImageStruct:imageStruct:]";
                    v22 = 1024;
                    v23 = 369;
                    v24 = 2080;
                    v25 = v15;
                    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                {
                  v16 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
                  *(_DWORD *)buf = 136315906;
                  v19 = v17;
                  v20 = 2080;
                  v21 = "+[SDPMediaLine fillImageStruct:imageStruct:]";
                  v22 = 1024;
                  v23 = 369;
                  v24 = 2080;
                  v25 = v16;
                  _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                }
              }
              goto LABEL_10;
            }
            v11 = objc_msgSend((id)objc_msgSend(v7, "substringFromIndex:", 2), "intValue");
            *(_QWORD *)&a4->var3 = v11;
            goto LABEL_17;
          }
          v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1), "substringFromIndex:", 3), "componentsSeparatedByString:", CFSTR(":"));
          if (objc_msgSend(v10, "count") == 3)
          {
            a4->var3 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "intValue");
            a4->var4 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue");
            v11 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 2), "intValue");
LABEL_17:
            a4->var5 = v11;
          }
        }
LABEL_10:
        v7 = (void *)objc_msgSend(v5, "nextObject");
      }
      while (v7);
    }
  }
}

+ (void)fillImageArray:(id)a3 imageArray:(imageTag *)a4
{
  uint64_t v7;

  if (a3 && (int)objc_msgSend(a3, "count") >= 1)
  {
    v7 = 0;
    do
      objc_msgSend(a1, "fillImageStruct:imageStruct:", objc_msgSend(a3, "objectAtIndexedSubscript:", v7++), a4++);
    while (v7 < (int)objc_msgSend(a3, "count"));
  }
}

- (BOOL)supportImage:(id)a3 width:(int)a4 height:(int)a5 rate:(int)a6
{
  _BOOL4 v9;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", a3, &v14);
  v9 = 0;
  if (a4 >= (int)v14 && SDWORD2(v14) >= a4)
  {
    if (DWORD1(v14))
      v9 = (a4 - (int)v14) % SDWORD1(v14) == 0;
    else
      v9 = 1;
  }
  if (a5 < SHIDWORD(v14) || SDWORD1(v15) < a5)
  {
    v12 = 0;
    if (v9)
      return SDWORD2(v15) >= a6 && v12;
    return 0;
  }
  if ((_DWORD)v15)
  {
    v12 = (a5 - HIDWORD(v14)) % (int)v15 == 0;
    if (v9)
      return SDWORD2(v15) >= a6 && v12;
    return 0;
  }
  v12 = 1;
  if (!v9)
    return 0;
  return SDWORD2(v15) >= a6 && v12;
}

- (BOOL)videoDisplayAttribute:(int *)a3 withHeight:(int *)a4
{
  uint64_t v6;
  NSMutableArray *attributes;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  NSMutableArray *v27;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ftdisplayattr:resolution"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  attributes = self->_attributes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (!v8)
    return 0;
  v10 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v39;
  *(_QWORD *)&v9 = 136315906;
  v26 = v9;
  v27 = attributes;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v39 != v12)
        objc_enumerationMutation(attributes);
      v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if (objc_msgSend(v14, "hasPrefix:", v6, v26))
      {
        v15 = (void *)objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("["));
        if (objc_msgSend(v15, "count") == 2)
        {
          v16 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
          if (objc_msgSend(v16, "hasSuffix:", CFSTR("]")))
          {
            v17 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1), "componentsSeparatedByString:", CFSTR(",")), "objectEnumerator");
            v18 = objc_msgSend(v17, "nextObject");
            if (v18)
            {
              v19 = (void *)v18;
              do
              {
                if (objc_msgSend(v19, "hasPrefix:", CFSTR("x=")))
                {
                  *a3 = objc_msgSend((id)objc_msgSend(v19, "substringFromIndex:", 2), "intValue");
                }
                else if (objc_msgSend(v19, "hasPrefix:", CFSTR("y=")))
                {
                  *a4 = objc_msgSend((id)objc_msgSend(v19, "substringFromIndex:", 2), "intValue");
                }
                else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
                {
                  v20 = VRTraceErrorLogLevelToCSTR();
                  v21 = *MEMORY[0x1E0CF2758];
                  v22 = *MEMORY[0x1E0CF2758];
                  if (*MEMORY[0x1E0CF2748])
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      v23 = objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String");
                      *(_DWORD *)buf = v26;
                      v30 = v20;
                      v31 = 2080;
                      v32 = "-[SDPMediaLine videoDisplayAttribute:withHeight:]";
                      v33 = 1024;
                      v34 = 433;
                      v35 = 2080;
                      v36 = v23;
                      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  {
                    v24 = objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String");
                    *(_DWORD *)buf = v26;
                    v30 = v20;
                    v31 = 2080;
                    v32 = "-[SDPMediaLine videoDisplayAttribute:withHeight:]";
                    v33 = 1024;
                    v34 = 433;
                    v35 = 2080;
                    v36 = v24;
                    _os_log_debug_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Parameter %s is not supported", buf, 0x26u);
                  }
                }
                v19 = (void *)objc_msgSend(v17, "nextObject");
              }
              while (v19);
            }
            v11 = 1;
            attributes = v27;
          }
        }
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  }
  while (v10);
  return v11;
}

- (void)parseImageAttributeRules:(id)a3
{
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  VCImageAttributeRules *imageAttributeRules;
  uint64_t v9;
  id v10;
  uint64_t v11;
  VCImageAttributeRules *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *obj;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  int v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_payloads;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v6 = -[SDPMediaLine getVideoSendImages:](self, "getVideoSendImages:", -[SDPMediaLine videoImageAttributes:](self, "videoImageAttributes:", objc_msgSend(v5, "intValue")));
        if ((int)objc_msgSend(v6, "count") >= 1)
        {
          v7 = 0;
          do
          {
            memset(v18, 170, sizeof(v18));
            v19 = -1431655766;
            v20 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", objc_msgSend(v6, "objectAtIndexedSubscript:", v7), v18);
            imageAttributeRules = self->_imageAttributeRules;
            v9 = objc_msgSend(v5, "intValue");
            LODWORD(v14) = v20;
            -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:](imageAttributeRules, "addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:", v9, 0, LODWORD(v18[1]), HIDWORD(v18[2]), v19, (int)*((float *)&v19 + 1), v14);
            ++v7;
          }
          while (v7 < (int)objc_msgSend(v6, "count"));
        }
        v10 = -[SDPMediaLine getVideoRecvImages:](self, "getVideoRecvImages:", -[SDPMediaLine videoImageAttributes:](self, "videoImageAttributes:", objc_msgSend(v5, "intValue")));
        if ((int)objc_msgSend(v10, "count") >= 1)
        {
          v11 = 0;
          do
          {
            memset(v18, 170, sizeof(v18));
            v19 = -1431655766;
            v20 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11), v18);
            v12 = self->_imageAttributeRules;
            v13 = objc_msgSend(v5, "intValue");
            LODWORD(v14) = v20;
            -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:](v12, "addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:", v13, 1, LODWORD(v18[1]), HIDWORD(v18[2]), v19, (int)*((float *)&v19 + 1), v14);
            ++v11;
          }
          while (v11 < (int)objc_msgSend(v10, "count"));
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v17);
  }
}

- (void)parseAttribute:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":")), "objectAtIndexedSubscript:", 0);
        v11 = v10;
        if (self->_allowRTCPFB || !objc_msgSend(v10, "isEqualToString:", CFSTR("rtcp-fb")))
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("rtpID")))
          {
            self->_rtpId = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":")), "objectAtIndex:", 1), "longLongValue");
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("rtcp")))
          {
            self->_rtcpPort = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":")), "objectAtIndex:", 1), "intValue");
          }
          else
          {
            v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("imageattr"));
            -[NSMutableArray addObject:](self->_attributes, "addObject:", v9);
            if (v12)
              -[SDPMediaLine parseImageAttributeRules:](self, "parseImageAttributeRules:", v9);
          }
        }
        else
        {
          self->_allowRTCPFB = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
}

- (void)parseMediaLine:(id)a3
{
  char v5;
  int v6;

  v5 = 0;
  while ((objc_msgSend(a3, "parsingDone") & 1) == 0)
  {
    v6 = objc_msgSend(a3, "fieldType");
    if ((v6 - 1) >= 4)
    {
      if (v6 != 5)
        return;
      -[SDPMediaLine parseAttribute:](self, "parseAttribute:", objc_msgSend(a3, "fieldValue"));
      v5 = 1;
    }
    else
    {
      if ((v5 & 1) != 0)
        return;
      v5 = 0;
    }
    objc_msgSend(a3, "nextLine");
  }
}

- (NSString)string
{
  void *v3;
  void *v4;
  NSMutableArray *attributes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 256);
  v4 = v3;
  if (self->_rtpId)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@:%u%@"), CFSTR("a"), CFSTR("rtpID"), self->_rtpId, CFSTR("\r\n"));
  if (self->_rtcpPort)
    objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@:%@%@"), CFSTR("a"), CFSTR("rtcp"), CFSTR("%VRTCP-PORT%"), CFSTR("\r\n"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  attributes = self->_attributes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(attributes);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@%@"), CFSTR("a"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), CFSTR("\r\n"));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  return (NSString *)v4;
}

- (unsigned)rtpId
{
  return self->_rtpId;
}

- (void)setRtpId:(unsigned int)a3
{
  self->_rtpId = a3;
}

- (int)rtpPort
{
  return self->_rtpPort;
}

- (int)rtcpPort
{
  return self->_rtcpPort;
}

- (NSArray)attributes
{
  return &self->_attributes->super;
}

- (NSArray)payloads
{
  return &self->_payloads->super;
}

- (VCImageAttributeRules)imageAttributeRules
{
  return self->_imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

@end
