@implementation IPFeatureData

+ (IPFeatureData)featureDataWithType:(unint64_t)a3 value:(id)a4 matchRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  IPFeatureData *v9;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  v9 = objc_alloc_init(IPFeatureData);
  -[IPFeatureData setType:](v9, "setType:", a3);
  -[IPFeatureData setValue:](v9, "setValue:", v8);

  -[IPFeature setMatchRange:](v9, "setMatchRange:", location, length);
  return v9;
}

- (NSMutableDictionary)contextDictionary
{
  NSMutableDictionary *contextDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  contextDictionary = self->_contextDictionary;
  if (!contextDictionary)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contextDictionary;
    self->_contextDictionary = v4;

    contextDictionary = self->_contextDictionary;
  }
  return contextDictionary;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureData;
  -[IPFeature description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  humanReadableFeatureType(-[IPFeatureData type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureData value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Type:%@ - Value: <%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nGramMarker
{
  unint64_t v3;

  v3 = -[IPFeatureData type](self, "type");
  if (v3 < 0xE && ((0x30FFu >> v3) & 1) != 0)
    return off_24DAA52F8[v3];
  NSLog(CFSTR("Found unknown feature type %u!"), -[IPFeatureData type](self, "type"));
  return CFSTR("UNKNOWN_FEATURE");
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end
