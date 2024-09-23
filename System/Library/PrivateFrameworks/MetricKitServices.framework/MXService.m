@implementation MXService

- (MXService)init
{
  return -[MXService initWithSourceID:](self, "initWithSourceID:", 0);
}

- (MXService)initWithSourceID:(int64_t)a3
{
  MXService *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXService;
  result = -[MXService init](&v5, sel_init);
  if (result)
  {
    result->_isStarted = 0;
    result->_sourceID = a3;
  }
  return result;
}

- (id)getMetricsForClient:(id)a3
{
  return 0;
}

- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4
{
  return 0;
}

- (BOOL)startService
{
  _BOOL4 isStarted;

  isStarted = self->_isStarted;
  if (!self->_isStarted)
    self->_isStarted = 1;
  return !isStarted;
}

- (BOOL)stopService
{
  _BOOL4 isStarted;

  isStarted = self->_isStarted;
  if (self->_isStarted)
    self->_isStarted = 0;
  return isStarted;
}

- (BOOL)metricsSupported
{
  return 0;
}

- (BOOL)diagnosticsSupported
{
  return 0;
}

- (id)pruneSourceData:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  __int128 v7;
  unint64_t v8;
  const char *Name;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  objc_property_t *v17;
  unint64_t i;
  const char *v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v24;
  void *v25;
  id v26;
  objc_property_t *v27;
  unsigned int v28;
  unsigned int outCount;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  +[MXUtilities getServicesAllowlist](MXUtilities, "getServicesAllowlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24F33C378, "objectAtIndexedSubscript:", -[MXService sourceID](self, "sourceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  outCount = 0;
  v6 = (objc_class *)objc_opt_class();
  v27 = class_copyPropertyList(v6, &outCount);
  if (outCount)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412546;
    v24 = v7;
    do
    {
      Name = property_getName(v27[v8]);
      if (Name)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", Name, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding", v24));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if (v12)
        {
          objc_msgSend(v26, "valueForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            v28 = 0;
            v16 = (objc_class *)objc_opt_class();
            v17 = class_copyPropertyList(v16, &v28);
            if (v28)
            {
              for (i = 0; i < v28; ++i)
              {
                v19 = property_getName(v17[i]);
                if (v19)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "allKeys");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "containsObject:", v20);

                  if ((v22 & 1) == 0)
                    objc_msgSend(v13, "setValue:forKey:", 0, v20);

                }
              }
            }
            free(v17);

          }
          objc_msgSend(v26, "setValue:forKey:", v13, v10);

        }
        else
        {
          objc_msgSend(v26, "setValue:forKey:", 0, v10);
        }

      }
      ++v8;
    }
    while (v8 < outCount);
  }
  free(v27);

  return v26;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (NSString)currentClient
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentClient, 0);
}

@end
