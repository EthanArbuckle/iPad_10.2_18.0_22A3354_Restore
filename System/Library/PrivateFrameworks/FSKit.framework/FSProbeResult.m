@implementation FSProbeResult

- (FSProbeResult)initWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  id v8;
  id v9;
  FSProbeResult *v10;
  FSProbeResult *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  FSContainerIdentifier *containerID;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FSProbeResult;
  v10 = -[FSProbeResult init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_result = a3;
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    containerID = v11->_containerID;
    v11->_containerID = (FSContainerIdentifier *)v14;

  }
  return v11;
}

+ (id)resultWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResult:name:containerID:", a3, v9, v8);

  return v10;
}

+ (id)newResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  objc_msgSend(a1, "resultWithResult:name:containerID:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *name;
  FSContainerIdentifier *containerID;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_result);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("FSProbeResult.Result"));

  name = self->_name;
  if (name)
    objc_msgSend(v8, "encodeObject:forKey:", name, CFSTR("FSProbeResult.Name"));
  containerID = self->_containerID;
  if (containerID)
    objc_msgSend(v8, "encodeObject:forKey:", containerID, CFSTR("FSProbeResult.UUID"));

}

- (FSProbeResult)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  FSContainerIdentifier *v7;
  FSContainerIdentifier *containerID;
  id v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  self->_result = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("FSProbeResult.Result"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSProbeResult.Name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSProbeResult.UUID"));
  v7 = (FSContainerIdentifier *)objc_claimAutoreleasedReturnValue();
  containerID = self->_containerID;
  self->_containerID = v7;

  return self;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = self->_result - 1;
  if (v3 > 2)
    v4 = CFSTR("NotRecognized");
  else
    v4 = off_250C32850[v3];
  if (self->_name)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" name '%@'"), self->_name);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_250C33628;
  }
  if (self->_containerID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" container %@"), self->_containerID);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_250C33628;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FSProbeResult %@%@%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)result
{
  return self->_result;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (FSContainerIdentifier)containerID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
