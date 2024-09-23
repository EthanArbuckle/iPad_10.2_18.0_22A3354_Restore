@implementation PCPrinter

- (PCPrinter)initWithPrinterInfo:(id)a3
{
  id v3;
  PCPrinter *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCPrinter;
  v3 = a3;
  v4 = -[PCPrinter init](&v7, "init");
  -[PCPrinter setPrinterInfo:](v4, "setPrinterInfo:", v3, v7.receiver, v7.super_class);

  v5 = +[PKDefaults iCloudPrinters](PKDefaults, "iCloudPrinters");
  return v4;
}

- (PCPrinter)initWithPKPrinter:(id)a3
{
  void *v4;
  PCPrinter *v5;
  objc_super v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "browseInfo"));
  v7.receiver = self;
  v7.super_class = (Class)PCPrinter;
  v5 = (PCPrinter *)-[PCPrinter initPKPrinterWithBrowseInfo:](&v7, "initPKPrinterWithBrowseInfo:", v4);

  -[PCPrinter setPrinterInfo:](v5, "setPrinterInfo:", 0);
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PCPrinter;
  -[PCPrinter dealloc](&v2, "dealloc");
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("printer-name")));

    return (NSString *)v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PCPrinter;
    v7 = -[PCPrinter name](&v8, "name");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (NSURL)printerURL
{
  void *v3;
  void *v4;
  void *v5;
  NSURL *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerURI](self, "printerURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

    return (NSURL *)v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PCPrinter;
    v7 = -[PCPrinter printerURL](&v8, "printerURL");
    return (NSURL *)(id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (id)printerURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("printer-uri-supported")));

  return v3;
}

- (id)deviceURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("device-uri")));

  return v3;
}

- (NSString)uuid
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter _uuid](self, "_uuid"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter deviceURI](self, "deviceURI"));
      v6 = (char *)objc_msgSend(v5, "rangeOfString:", CFSTR("uuid="));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", &v6[v7]));

        if (v8)
        {
LABEL_8:
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));
          -[PCPrinter set_uuid:](self, "set_uuid:", v10);

          return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[PCPrinter _uuid](self, "_uuid"));
        }
      }
      else
      {

      }
    }
    v12.receiver = self;
    v12.super_class = (Class)PCPrinter;
    v9 = -[PCPrinter uuid](&v12, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    goto LABEL_8;
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[PCPrinter _uuid](self, "_uuid"));
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("printer-info")));

    return (NSString *)v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PCPrinter;
    v7 = -[PCPrinter displayName](&v8, "displayName");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (NSString)location
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  NSString *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("printer-location")));

    v6 = &stru_10001DD30;
    if (v5)
      v6 = v5;
    v7 = v6;

    return (NSString *)v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PCPrinter;
    v9 = -[PCPrinter location](&v10, "location");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(v9);
  }
}

- (NSAttributedString)displayNameWithLocation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = objc_alloc((Class)NSMutableAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter displayName](self, "displayName"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter location](self, "location"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter displayName](self, "displayName"));
    v8 = objc_msgSend(v7, "containsString:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (%@)"), v6));
      v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v9);
      v15[0] = NSFontAttributeName;
      +[UIFont smallSystemFontSize](UIFont, "smallSystemFontSize");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
      v16[0] = v11;
      v15[1] = NSForegroundColorAttributeName;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v16[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

      objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));
      objc_msgSend(v5, "appendAttributedString:", v10);

    }
  }

  return (NSAttributedString *)v5;
}

- (NSString)makeAndModel
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  NSString *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("printer-make-and-model")));

    v6 = &stru_10001DD30;
    if (v5)
      v6 = v5;
    v7 = v6;

    return (NSString *)v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PCPrinter;
    v9 = -[PCPrinter makeAndModel](&v10, "makeAndModel");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(v9);
  }
}

- (NSString)version
{
  return (NSString *)CFSTR("0.0");
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)isAirPrint
{
  return 1;
}

- (BOOL)isNearby
{
  return 1;
}

- (BOOL)isBonjour
{
  return 0;
}

- (BOOL)isiCloudPrinter
{
  return 1;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isDirectConnect
{
  return 0;
}

- (BOOL)isOffline
{
  return 0;
}

- (int64_t)state
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));

  if (!v3)
    return 3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("printer-state")));
  v6 = objc_msgSend(v5, "integerValue");

  return (int64_t)v6;
}

- (NSString)printerStateMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("printer-state-message")));

  return (NSString *)v3;
}

- (NSArray)printerStateReasons
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("printer-state-reasons")));

  return (NSArray *)v3;
}

- (NSArray)classMembers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("member-names")));

  return (NSArray *)v3;
}

- (id)printerLocalizedStateReason:(id)a3
{
  return 0;
}

- (unint64_t)jobTypesSupported
{
  return 0;
}

- (int64_t)jobAccountIDSupport
{
  return 0;
}

- (int64_t)kind
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter deviceURI](self, "deviceURI"));
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("usb:")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("ippusb:")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("bluetooth:")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "hasPrefix:", CFSTR("mdns:")) & 1) != 0
         || (objc_msgSend(v2, "hasPrefix:", CFSTR("dnssd:")) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v2, "hasPrefix:", CFSTR("smb:")))
  {
    v3 = 6;
  }
  else
  {
    v3 = 5;
  }

  return v3;
}

- (int64_t)category
{
  return 1;
}

- (int64_t)displayCategory
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)((uint64_t (*)(void))objc_opt_class)();
  if (objc_msgSend(v5, "isEqual:", objc_opt_class(self)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter name](self, "name"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToPCPrinter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter name](self, "name"));
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter uuid](self, "uuid"));
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceURI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter deviceURI](self, "deviceURI"));
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = objc_msgSend(v4, "category");
        v12 = v11 == (id)-[PCPrinter category](self, "category");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToPKPrinter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter uuid](self, "uuid"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqualToiCloudPrinter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter deviceURI](self, "deviceURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "printerURLs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@%@"), v9, v10, v11));

  if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", v5))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uppercaseString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter uuid](self, "uuid"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)update
{
  return 0;
}

- (int64_t)remove
{
  return 0;
}

- (int64_t)pause
{
  return 0;
}

- (int64_t)resume
{
  return 0;
}

+ (id)printers
{
  return +[NSArray array](NSArray, "array");
}

- (NSArray)supportedMimeTypes
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("document-format-supported")));

  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v5 = v4;

  return (NSArray *)v5;
}

- (BOOL)supportsJobAccountID
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("job-account-id-supported")));
  v4 = v3 != 0;

  return v4;
}

- (id)authInfoRequired
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter printerInfo](self, "printerInfo"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("auth-info-required")));

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("none");
  return v4;
}

- (BOOL)requiresAuthentication
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCPrinter authInfoRequired](self, "authInfoRequired"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("none")) ^ 1;

  return v3;
}

- (NSArray)ppdStateReasons
{
  return 0;
}

- (NSDictionary)printerInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrinterInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)helpBookURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)adminURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)thumbnailData
{
  return self->_thumbnailData;
}

- (void)setThumbnailData:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailData, a3);
}

- (NSString)_uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_uuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_adminURL, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_printerInfo, 0);
}

@end
