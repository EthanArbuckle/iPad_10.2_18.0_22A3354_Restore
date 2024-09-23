@implementation MXAppExitMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXForegroundExitData *foregroundExitData;
  id v5;

  foregroundExitData = self->_foregroundExitData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", foregroundExitData, CFSTR("foregroundExitData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundExitData, CFSTR("backgroundExitData"));

}

- (MXAppExitMetric)initWithCoder:(id)a3
{
  id v4;
  MXAppExitMetric *v5;
  uint64_t v6;
  MXForegroundExitData *foregroundExitData;
  uint64_t v8;
  MXBackgroundExitData *backgroundExitData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXAppExitMetric;
  v5 = -[MXMetric init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundExitData"));
    v6 = objc_claimAutoreleasedReturnValue();
    foregroundExitData = v5->_foregroundExitData;
    v5->_foregroundExitData = (MXForegroundExitData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundExitData"));
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundExitData = v5->_backgroundExitData;
    v5->_backgroundExitData = (MXBackgroundExitData *)v8;

  }
  return v5;
}

- (MXAppExitMetric)initWithForegroundExitData:(id)a3 backgroundExitData:(id)a4
{
  id v7;
  id v8;
  MXAppExitMetric *v9;
  id *p_isa;
  MXAppExitMetric *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MXAppExitMetric;
  v9 = -[MXMetric init](&v13, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_foregroundExitData, a3);
    objc_storeStrong(p_isa + 3, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (id)toDictionary
{
  id v3;
  MXForegroundExitData *foregroundExitData;
  void *v5;
  MXBackgroundExitData *backgroundExitData;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  foregroundExitData = self->_foregroundExitData;
  if (foregroundExitData)
  {
    -[MXForegroundExitData toDictionary](foregroundExitData, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("foregroundExitData"));

  }
  backgroundExitData = self->_backgroundExitData;
  if (backgroundExitData)
  {
    -[MXBackgroundExitData toDictionary](backgroundExitData, "toDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("backgroundExitData"));

  }
  return v3;
}

- (MXForegroundExitData)foregroundExitData
{
  return (MXForegroundExitData *)objc_getProperty(self, a2, 16, 1);
}

- (MXBackgroundExitData)backgroundExitData
{
  return (MXBackgroundExitData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundExitData, 0);
  objc_storeStrong((id *)&self->_foregroundExitData, 0);
}

@end
