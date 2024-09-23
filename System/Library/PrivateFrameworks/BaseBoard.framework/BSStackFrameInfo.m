@implementation BSStackFrameInfo

- (NSString)executableName
{
  return -[NSString lastPathComponent](self->_executablePath, "lastPathComponent");
}

- (NSString)className
{
  return self->_className;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSStackFrameInfo executableName](self, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_className, CFSTR("class"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_functionName, CFSTR("function"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)address
{
  return self->_address;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_realFunctionName, 0);
}

@end
