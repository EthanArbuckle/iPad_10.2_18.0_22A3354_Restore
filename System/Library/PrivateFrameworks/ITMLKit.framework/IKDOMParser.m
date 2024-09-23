@implementation IKDOMParser

- (IKDOMParser)init
{
  void *v3;
  IKDOMParser *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKDOMParser;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (id)parseFromString:(id)a3 :(id)a4
{
  id v6;
  id v7;
  IKDOMDocument *v8;
  void *v9;
  IKDOMDocument *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length")
    || objc_msgSend(v7, "length")
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("text/xml")) & 1) == 0
    && !objc_msgSend(v7, "isEqualToString:", CFSTR("application/xml")))
  {
    v12 = CFSTR("Invalid parameters");
    goto LABEL_9;
  }
  v8 = [IKDOMDocument alloc];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = -[IKDOMDocument initWithAppContext:xmlStr:error:](v8, "initWithAppContext:xmlStr:error:", v9, v6, &v17);
  v11 = v17;

  if (!v10 || v11)
  {

    objc_msgSend(v11, "description");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    -[IKJSObject appContext](self, "appContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v14, 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setException:withErrorMessage:", v15, v12);

    v10 = 0;
  }

  return v10;
}

@end
