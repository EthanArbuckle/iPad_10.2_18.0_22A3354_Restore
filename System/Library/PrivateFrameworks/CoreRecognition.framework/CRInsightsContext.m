@implementation CRInsightsContext

- (CRInsightsContext)init
{
  CRInsightsContext *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRInsightsContext;
  v2 = -[CRInsightsContext init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRInsightsContext setInfo:](v2, "setInfo:", v3);

  }
  return v2;
}

- (CRInsightsContext)initWithContext:(id)a3
{
  id v4;
  CRInsightsContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRInsightsContext;
  v5 = -[CRInsightsContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cameraReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRInsightsContext setCameraReader:](v5, "setCameraReader:", v6);

    v7 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v4, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRInsightsContext setInfo:](v5, "setInfo:", v9);

  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRInsightsContext info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CRInsightsContext info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRInsightsContext cameraReader](self, "cameraReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRInsightsContext info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CRInsightsContext %p\r{\rCamera reader: %p\rKey-value pairs:\r%@\r}"), self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (CRCameraReader)cameraReader
{
  return (CRCameraReader *)objc_loadWeakRetained((id *)&self->_cameraReader);
}

- (void)setCameraReader:(id)a3
{
  objc_storeWeak((id *)&self->_cameraReader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraReader);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
