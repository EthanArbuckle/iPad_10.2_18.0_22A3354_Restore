@implementation AXPiOSElementData

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_opt_new();
  v5 = -[AXPiOSElementData uid](self, "uid");
  objc_msgSend(v4, "setUid:", v5, v6);
  objc_msgSend(v4, "setPid:", -[AXPiOSElementData pid](self, "pid"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "pid");
    if (v6 == -[AXPiOSElementData pid](self, "pid")
      && (objc_msgSend(v5, "uid"), v8 = v7, -[AXPiOSElementData uid](self, "uid"), v8 == v9))
    {
      v10 = objc_msgSend(v5, "uid");
      v11 = v10 == -[AXPiOSElementData uid](self, "uid");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[AXPiOSElementData uid](self, "uid");
  v4 = -[AXPiOSElementData uid](self, "uid") ^ v3;
  return v4 ^ -[AXPiOSElementData pid](self, "pid");
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AXPiOSElementData;
  -[AXPiOSElementData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPiOSElementData uid](self, "uid");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: hash: %llu, elementID: %llu, pid: %d"), v4, v5, -[AXPiOSElementData uid](self, "uid"), -[AXPiOSElementData pid](self, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)uid
{
  unint64_t v2;
  unint64_t v3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v2 = *(unint64_t *)((char *)&self->_uid.elementOrHash + 4);
  v3 = *(_QWORD *)(&self->_pid + 1);
  result.var1 = v2;
  result.var0 = v3;
  return result;
}

- (void)setUid:(id)a3
{
  *(_QWORD *)(&self->_pid + 1) = a3.var0;
  *(unint64_t *)((char *)&self->_uid.elementOrHash + 4) = a3.var1;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

@end
