@implementation DEDRadarAttachment

- (DEDRadarAttachment)initWithDictionary:(id)a3
{
  id v4;
  DEDRadarAttachment *v5;
  DEDRadarAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDRadarAttachment;
  v5 = -[DEDRadarAttachment init](&v8, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileName"));
  v6 = (DEDRadarAttachment *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DEDRadarAttachment setFileName:](v5, "setFileName:", v6);

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("fileName");
  -[DEDRadarAttachment fileName](self, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@"), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
