@implementation FCEditorialTopicEventMappingProperty

- (FCEditorialTopicEventMappingProperty)initWithDictionary:(id)a3
{
  id v4;
  FCEditorialTopicEventMappingProperty *v5;
  uint64_t v6;
  NSString *mappingType;
  FCEditorialTopicEventMappingProperty *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCEditorialTopicEventMappingProperty;
  v5 = -[FCEditorialTopicEventMappingProperty init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mappingType"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    mappingType = v5->_mappingType;
    v5->_mappingType = (NSString *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (NSString)mappingType
{
  return self->_mappingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingType, 0);
}

@end
