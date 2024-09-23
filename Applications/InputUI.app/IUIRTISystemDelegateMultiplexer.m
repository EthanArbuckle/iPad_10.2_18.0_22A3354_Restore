@implementation IUIRTISystemDelegateMultiplexer

- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[IUIRTISystemDelegateMultiplexer contextDelegate](self, "contextDelegate"));
  objc_msgSend(v11, "inputSystemService:prepareForInputSession:options:", v10, v9, v8);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTISystemDelegateMultiplexer primaryDelegate](self, "primaryDelegate"));
  LOBYTE(a3) = objc_opt_respondsToSelector(v4, a3);

  return a3 & 1;
}

- (RTIInputSystemDelegate)primaryDelegate
{
  return self->_primaryDelegate;
}

- (void)setPrimaryDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDelegate, a3);
}

- (IUIStagingRTISystemDelegate)contextDelegate
{
  return self->_contextDelegate;
}

- (void)setContextDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_contextDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDelegate, 0);
  objc_storeStrong((id *)&self->_primaryDelegate, 0);
}

@end
