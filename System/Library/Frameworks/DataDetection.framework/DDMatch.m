@implementation DDMatch

+ (id)resultWithDDScannerResult:(id)a3
{
  return (id)objc_msgSend(a1, "resultWithDDScannerResult:originalString:", a3, 0);
}

+ (id)resultWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  __objc2_class **v9;
  __objc2_class *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    switch(objc_msgSend(v5, "category"))
    {
      case 1u:
        objc_msgSend(v5, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2B1E8]);
        v9 = off_24C0AAF98;
        if (!v8)
          v9 = off_24C0AAFA8;
        goto LABEL_15;
      case 2u:
        v10 = DDMatchPhoneNumber;
        goto LABEL_12;
      case 3u:
        v10 = DDMatchPostalAddress;
        goto LABEL_12;
      case 4u:
        v10 = DDMatchCalendarEvent;
        goto LABEL_12;
      case 5u:
        objc_msgSend(v5, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2B240]) & 1) != 0)
        {
          v9 = &off_24C0AAFC8;
LABEL_15:
          v11 = (void *)objc_msgSend(objc_alloc(*v9), "initWithDDScannerResult:", v5);

          goto LABEL_18;
        }
        if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2B1F0]))
        {
          v9 = off_24C0AAFA0;
          goto LABEL_15;
        }

        break;
      case 6u:
        v10 = DDMatchMoneyAmount;
LABEL_12:
        v11 = (void *)objc_msgSend([v10 alloc], "initWithDDScannerResult:", v5);
        goto LABEL_18;
      default:
        break;
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (void)commonInitWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *matchedString;
  id v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "urlificationRange");
  v8 = v7;
  self->_matchedRange.location = v6;
  self->_matchedRange.length = v7;
  v9 = v6 - objc_msgSend(v5, "range");
  objc_msgSend(v5, "matchedString");
  if (v9)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "substringWithRange:", v9, v8);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    matchedString = self->_matchedString;
    self->_matchedString = v12;

    v11 = (NSString *)v14;
  }
  else
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    v11 = self->_matchedString;
    self->_matchedString = v10;
  }

}

- (DDMatch)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatch *v5;
  DDMatch *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDMatch;
  v5 = -[DDMatch init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DDMatch commonInitWithDDScannerResult:originalString:](v5, "commonInitWithDDScannerResult:originalString:", v4, 0);

  return v6;
}

- (DDMatch)initWithDDScannerResult:(id)a3 originalString:(id)a4
{
  id v6;
  id v7;
  DDMatch *v8;
  DDMatch *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDMatch;
  v8 = -[DDMatch init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[DDMatch commonInitWithDDScannerResult:originalString:](v8, "commonInitWithDDScannerResult:originalString:", v6, v7);

  return v9;
}

- (NSString)matchedString
{
  return self->_matchedString;
}

- (_NSRange)matchedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_matchedRange.length;
  location = self->_matchedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedString, 0);
}

@end
