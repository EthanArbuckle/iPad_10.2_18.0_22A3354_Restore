@implementation IKDOMLSSerializer

- (id)writeToString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v11 = 0;
  objc_msgSend(a3, "toStringWithError:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
  {
    -[IKJSObject appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMLSException exceptionWithAppContext:code:](IKDOMLSException, "exceptionWithAppContext:code:", v7, 82);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setException:withErrorMessage:", v8, v9);

  }
  return v4;
}

@end
