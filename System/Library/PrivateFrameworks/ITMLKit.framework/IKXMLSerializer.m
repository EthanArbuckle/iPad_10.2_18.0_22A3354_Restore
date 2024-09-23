@implementation IKXMLSerializer

- (IKXMLSerializer)init
{
  void *v3;
  IKXMLSerializer *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKXMLSerializer;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (id)serializeToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = CFSTR("Invalid parameters");
    goto LABEL_6;
  }
  v14 = 0;
  objc_msgSend(v4, "toStringWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = v7;
  if (!v6 || v7)
  {

    objc_msgSend(v8, "description");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v11, 11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setException:withErrorMessage:", v12, v9);

    v6 = 0;
  }

  return v6;
}

@end
