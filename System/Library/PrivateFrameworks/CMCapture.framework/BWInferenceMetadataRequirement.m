@implementation BWInferenceMetadataRequirement

- (BWInferenceMetadataRequirement)initWithMetadataRequirement:(id)a3
{
  BWInferenceMetadataRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceMetadataRequirement;
  v4 = -[BWInferenceDataRequirement initWithDataRequirement:](&v6, sel_initWithDataRequirement_);
  if (v4)
  {
    v4->_metadataKeys = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "metadataKeys"), "copy");
    v4->_mappingOption = objc_msgSend(a3, "mappingOption");
  }
  return v4;
}

- (NSArray)metadataKeys
{
  return self->_metadataKeys;
}

- (signed)mappingOption
{
  return self->_mappingOption;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMetadataRequirement:", self);
}

- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3 mappingOption:(signed __int16)a4
{
  BWInferenceMetadataRequirement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceMetadataRequirement;
  v6 = -[BWInferenceDataRequirement init](&v8, sel_init);
  if (v6)
  {
    v6->_metadataKeys = (NSArray *)objc_msgSend(a3, "copy");
    v6->_mappingOption = a4;
  }
  return v6;
}

- (BWInferenceMetadataRequirement)initWithMetadataKeys:(id)a3
{
  return -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](self, "initWithMetadataKeys:mappingOption:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceMetadataRequirement;
  -[BWInferenceMetadataRequirement dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p; metadataKeys = %@; mappingOption = %d>"),
               objc_opt_class(),
               -[BWInferenceDataRequirement identifier](self, "identifier"),
               self,
               self->_metadataKeys,
               self->_mappingOption);
}

@end
