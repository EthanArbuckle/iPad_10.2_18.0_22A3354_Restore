@implementation NNMKContentAttributedStringHTMLParser

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsFound:(id *)a9
{
  return -[NNMKContentAttributedStringHTMLParser _parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:](self, "_parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:", a3, a4, a5, a7, a8, 0, a6, a9);
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9
{
  return -[NNMKContentAttributedStringHTMLParser _parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:](self, "_parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:", a3, a4, a5, a7, a8, a9, a6, 0);
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsFound:(id *)a8
{
  return -[NNMKContentAttributedStringHTMLParser _parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:](self, "_parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:", a3, a4, a5, a7, 0, 0, a6, a8);
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsForValidation:(id)a8
{
  return -[NNMKContentAttributedStringHTMLParser _parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:](self, "_parseHTMLBody:encoding:maxLength:maxImageWidth:partiallyParsed:imageAttachmentsLoaded:urlsForValidation:urlsFound:", a3, a4, a5, a7, 0, a8, a6, 0);
}

- (id)parseTextBody:(id)a3
{
  return -[NNMKContentAttributedStringHTMLParser _parsePlainTextBody:encoding:](self, "_parsePlainTextBody:encoding:", a3, 4);
}

+ (id)attachmentAttributedStringWithContentId:(id)a3 mergingAttributes:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (a4)
    v4 = a4;
  else
    v4 = (id)MEMORY[0x24BDBD1B8];
  v5 = a3;
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("NNMKInlineAttachment"));

  v7 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 65532);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v6);

  return v9;
}

+ (id)imageAttachmentAttributedStringWithContentId:(id)a3 imageSize:(CGSize)a4 mergingAttributes:(id)a5
{
  double height;
  double width;
  __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  height = a4.height;
  width = a4.width;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  if (a5)
    v9 = a5;
  else
    v9 = (id)MEMORY[0x24BDBD1B8];
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  if (v8)
    v11 = v8;
  else
    v11 = &stru_24F9F9D80;
  v18[0] = CFSTR("cid");
  v18[1] = CFSTR("size");
  v19[0] = v11;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("NNMKInlineImage"));

  v14 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 65532);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v10);

  return v16;
}

+ (id)trimAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t i;
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v5, "length"); ++i)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", i));

      if (!v8)
        break;
    }
    v9 = objc_msgSend(v5, "length");
    v10 = objc_msgSend(v5, "length");
    if (v10 > i)
    {
      v9 = v10 + 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v9 - 2;
        v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v9 - 2));

        --v9;
        if (v13)
          v14 = v12 > i;
        else
          v14 = 0;
      }
      while (v14);
    }
    objc_msgSend(v4, "attributedSubstringFromRange:", i, v9 - i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9 urlsFound:(id *)a10
{
  NSLock *lock;
  id v17;
  id v18;
  NSMutableAttributedString *v19;
  NSMutableAttributedString *parsedAttributedString;
  NSMutableDictionary *v21;
  NSMutableDictionary *imageAtachmentsDataByContentId;
  _BOOL4 v23;
  NSMutableAttributedString *v24;

  lock = self->_lock;
  v17 = a9;
  v18 = a3;
  -[NSLock lock](lock, "lock");
  v19 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x24BDD1688]);
  parsedAttributedString = self->_parsedAttributedString;
  self->_parsedAttributedString = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  imageAtachmentsDataByContentId = self->_imageAtachmentsDataByContentId;
  self->_imageAtachmentsDataByContentId = v21;

  self->_maxLength = a5;
  self->_maxImageWidth = a6;
  self->_partiallyParsed = a7;
  if (a7)
    *a7 = 0;
  -[NNMKHTMLParser parseHTMLBody:encoding:](self, "parseHTMLBody:encoding:", v18, a4);

  v23 = -[NNMKContentAttributedStringHTMLParser _validateURLsAndHTMLTagsInParsedString:urlsFound:](self, "_validateURLsAndHTMLTagsInParsedString:urlsFound:", v17, a10);
  v24 = 0;
  if (!-[NNMKHTMLParser containsBlockedElements](self, "containsBlockedElements") && v23)
  {
    -[NNMKContentAttributedStringHTMLParser _addDataDetectionAttributes:](self, "_addDataDetectionAttributes:", self->_parsedAttributedString);
    v24 = self->_parsedAttributedString;
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (a8)
    *a8 = objc_retainAutorelease(self->_imageAtachmentsDataByContentId);
  return v24;
}

- (id)_parsePlainTextBody:(id)a3 encoding:(unint64_t)a4
{
  NSMutableAttributedString *v5;
  NSMutableAttributedString *parsedAttributedString;
  NSMutableAttributedString *v7;

  -[NSLock lock](self->_lock, "lock", a3, a4);
  v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x24BDD1688]);
  parsedAttributedString = self->_parsedAttributedString;
  self->_parsedAttributedString = v5;

  -[NNMKContentAttributedStringHTMLParser _addDataDetectionAttributes:](self, "_addDataDetectionAttributes:", self->_parsedAttributedString);
  v7 = self->_parsedAttributedString;
  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

- (NSDataDetector)dataDetector
{
  NSDataDetector *dataDetector;
  NSDataDetector *v4;
  id v5;
  NSDataDetector *v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  dataDetector = self->_dataDetector;
  if (!dataDetector)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 2096, &v10);
    v4 = (NSDataDetector *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    v6 = self->_dataDetector;
    self->_dataDetector = v4;

    if (v5)
    {
      v7 = __logCategories;
      if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
        -[NNMKContentAttributedStringHTMLParser dataDetector].cold.1((uint64_t)v5, v7, v8);
    }

    dataDetector = self->_dataDetector;
  }
  return dataDetector;
}

- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4
{
  id v5;
  void (**v6)(id, const __CFString *);
  int v7;
  void *v8;

  v5 = a3;
  v6 = (void (**)(id, const __CFString *))a4;
  LOBYTE(v7) = 1;
  if (objc_msgSend(v5, "compare:options:", CFSTR("table"), 1))
  {
    if (objc_msgSend(v5, "compare:options:", CFSTR("img"), 1))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      v6[2](v6, CFSTR("src"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "hasPrefix:", CFSTR("cid:")) & 1) != 0)
        LOBYTE(v7) = 0;
      else
        v7 = objc_msgSend(v8, "hasPrefix:", CFSTR("data:image/")) ^ 1;

    }
  }

  return v7;
}

- (BOOL)isErrorTypeBlocked:(char *)a3
{
  if (!a3)
    return 0;
  if (!strcmp(a3, "ol"))
    return 1;
  return strcmp(a3, "ul") == 0;
}

- (BOOL)isElementIgnorable:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("head"), 1))
    v4 = objc_msgSend(v3, "compare:options:", CFSTR("style"), 1) == 0;

  return v4;
}

- (void)appendImageWithSource:(id)a3 width:(double)a4 height:(double)a5 stringAttributes:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v10 = a6;
  if (objc_msgSend(v26, "hasPrefix:", CFSTR("cid:")))
  {
    objc_msgSend(v26, "substringFromIndex:", objc_msgSend(CFSTR("cid:"), "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v26, "hasPrefix:", CFSTR("data:")))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v26, "rangeOfString:", CFSTR(";base64,"));
    objc_msgSend(v26, "substringFromIndex:", v13 + v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
    if (v16)
    {
      -[NNMKContentAttributedStringHTMLParser imageAtachmentsDataByContentId](self, "imageAtachmentsDataByContentId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v11);

    }
  }
  else
  {
    v11 = 0;
  }
  v18 = (void *)objc_opt_class();
  -[NNMKContentAttributedStringHTMLParser maxImageWidth](self, "maxImageWidth");
  objc_msgSend(v18, "_scaledDownSize:maxWidth:", a4, a5, v19);
  v21 = v20;
  v23 = v22;
  if (self->_maxLength == 0x7FFFFFFFFFFFFFFFLL
    || -[NSMutableAttributedString length](self->_parsedAttributedString, "length") < self->_maxLength)
  {
    objc_msgSend((id)objc_opt_class(), "imageAttachmentAttributedStringWithContentId:imageSize:mergingAttributes:", v11, v10, v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKContentAttributedStringHTMLParser parsedAttributedString](self, "parsedAttributedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendAttributedString:", v24);

  }
  else
  {
    *self->_partiallyParsed = 1;
    -[NNMKHTMLParser setCancelled:](self, "setCancelled:", 1);
  }

}

- (void)appendString:(id)a3 stringAttributes:(id)a4
{
  id v6;
  unint64_t maxLength;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  maxLength = self->_maxLength;
  if (maxLength != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = maxLength - -[NSMutableAttributedString length](self->_parsedAttributedString, "length");
    if (objc_msgSend(v11, "length") > v8)
    {
      objc_msgSend(v11, "substringToIndex:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      *self->_partiallyParsed = 1;
      -[NNMKHTMLParser setCancelled:](self, "setCancelled:", 1);
      v11 = (id)v9;
    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v6);
  -[NSMutableAttributedString appendAttributedString:](self->_parsedAttributedString, "appendAttributedString:", v10);

}

- (void)_addDataDetectionAttributes:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int Category;
  uint64_t Range;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CFTypeRef cf;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = 0;
  v4 = DDScannerCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend(v3, "string");
    if (DDScannerScanString())
    {
      cf = v5;
      v22 = v3;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = (id)DDScannerCopyResultsWithOptions();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v24;
        v11 = *MEMORY[0x24BE2B258];
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v6);
            v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            Category = DDResultGetCategory();
            Range = DDResultGetRange();
            if ((Category - 1) <= 2)
            {
              v17 = Range;
              v18 = v16;
              objc_msgSend(MEMORY[0x24BE2B368], "resultFromCoreResult:", v13, cf);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addAttribute:value:range:", v11, v19, v17, v18);

              v9 = 1;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      CFRelease(cf);
      v3 = v22;
      if ((v9 & 1) != 0)
        objc_msgSend(v22, "dd_replaceResultAttributesWithSimpleLinksForTypes:context:", 7, 0);
    }
    else
    {
      CFRelease(v5);
    }
  }
  else
  {
    v20 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
      -[NNMKContentAttributedStringHTMLParser _addDataDetectionAttributes:].cold.1(v20, v27);

  }
}

- (void)_appendComponentWithKey:(id)a3 from:(id)a4 to:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v8, "appendFormat:", CFSTR(", %@"), v7);
    else
      objc_msgSend(v8, "appendString:", v7);
  }

}

+ (id)_scaleAndPrepareImageForClient:(id)a3 maxWidth:(double)a4 screenScale:(double)a5
{
  void *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDBCEC8];
  v8 = (UIImage *)a3;
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v8, 0.9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = a4 * a5;
  *(float *)&v11 = a4 * a5;
  +[NNMKImageUtility scaleImageFromData:destinationData:maxWidth:](NNMKImageUtility, "scaleImageFromData:destinationData:maxWidth:", v10, v9, v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v9);
  return v12;
}

+ (CGSize)_scaledDownSize:(CGSize)result maxWidth:(double)a4
{
  double v4;

  if (result.width > a4)
  {
    v4 = a4 / result.width;
    result.width = result.width * v4;
    result.height = result.height * v4;
  }
  return result;
}

- (BOOL)_validateURLsAndHTMLTagsInParsedString:(id)a3 urlsFound:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableAttributedString *parsedAttributedString;
  void *v23;
  BOOL v24;
  id *v26;
  void *v27;
  id v28;
  NNMKContentAttributedStringHTMLParser *v29;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  -[NSMutableAttributedString string](self->_parsedAttributedString, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    v24 = 1;
    if (!a4)
      goto LABEL_28;
    goto LABEL_27;
  }
  v26 = a4;
  v27 = v7;
  v9 = 0;
  v28 = v6;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v10, 0, v9, objc_msgSend(v8, "length") - v9);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = objc_msgSend(v8, "length");
    objc_msgSend(v8, "substringWithRange:", v9, v11 - v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6)
    {
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("<b>")) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", CFSTR("<i>")) & 1) != 0
        || (objc_msgSend(v13, "hasPrefix:", CFSTR("<br")) & 1) != 0
        || (objc_msgSend(v13, "hasPrefix:", CFSTR("<img")) & 1) != 0
        || (objc_msgSend(v13, "hasPrefix:", CFSTR("<div")) & 1) != 0
        || (objc_msgSend(v13, "hasPrefix:", CFSTR("<span")) & 1) != 0
        || (objc_msgSend(v13, "hasPrefix:", CFSTR("<p")) & 1) != 0
        || objc_msgSend(v13, "hasPrefix:", CFSTR("<font")))
      {
        break;
      }
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "removeCharactersInString:", CFSTR("?/}&"));
    objc_msgSend(v15, "addCharactersInString:", CFSTR("<>"));
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "hasPrefix:", CFSTR("http:")) & 1) != 0
      || (objc_msgSend(v16, "hasPrefix:", CFSTR("https:")) & 1) != 0
      || (objc_msgSend(v16, "hasPrefix:", CFSTR("mailto:")) & 1) != 0
      || (objc_msgSend(v16, "hasPrefix:", CFSTR("ftp:")) & 1) != 0
      || -[NNMKContentAttributedStringHTMLParser isWebLink:](v29, "isWebLink:", v16))
    {
      if (v6)
      {
        v17 = objc_msgSend(v6, "containsObject:", v16) ^ 1;
      }
      else
      {
        objc_msgSend(v27, "addObject:", v16);
        v17 = 0;
      }
      v18 = objc_msgSend(v13, "rangeOfString:", v16);
      v20 = v19;
      v21 = v18 + v9;
      parsedAttributedString = v29->_parsedAttributedString;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableAttributedString addAttribute:value:range:](parsedAttributedString, "addAttribute:value:range:", CFSTR("NNMKCollapsableURL"), v23, v21, v20);

      v6 = v28;
    }
    v9 = v11 + 1;

    if (v11 + 1 >= (unint64_t)objc_msgSend(v8, "length"))
    {
      v24 = 1;
      goto LABEL_26;
    }
  }

  v24 = 0;
LABEL_26:
  a4 = v26;
  v7 = v27;
  if (v26)
LABEL_27:
    *a4 = objc_retainAutorelease(v7);
LABEL_28:

  return v24;
}

- (BOOL)isWebLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NNMKContentAttributedStringHTMLParser dataDetector](self, "dataDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "resultType", (_QWORD)v12) == 32)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableAttributedString)parsedAttributedString
{
  return self->_parsedAttributedString;
}

- (void)setParsedAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_parsedAttributedString, a3);
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (double)maxImageWidth
{
  return self->_maxImageWidth;
}

- (void)setMaxImageWidth:(double)a3
{
  self->_maxImageWidth = a3;
}

- (BOOL)partiallyParsed
{
  return self->_partiallyParsed;
}

- (void)setPartiallyParsed:(BOOL *)a3
{
  self->_partiallyParsed = a3;
}

- (NSMutableDictionary)imageAtachmentsDataByContentId
{
  return self->_imageAtachmentsDataByContentId;
}

- (void)setImageAtachmentsDataByContentId:(id)a3
{
  objc_storeStrong((id *)&self->_imageAtachmentsDataByContentId, a3);
}

- (void)setDataDetector:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetector, 0);
  objc_storeStrong((id *)&self->_imageAtachmentsDataByContentId, 0);
  objc_storeStrong((id *)&self->_parsedAttributedString, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)dataDetector
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "Error instantiating NSDataDetector: %{public}@", (uint8_t *)&v3);
}

- (void)_addDataDetectionAttributes:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v3, v5, "Unable to create DDScanner: %@", (uint8_t *)&v6);

}

@end
