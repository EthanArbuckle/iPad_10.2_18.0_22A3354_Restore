@implementation CNPostalAddressFormattingSpecification

- (id)localizedPlaceholderForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNPostalAddressFormattingSpecification fieldLabelMap](self, "fieldLabelMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)fieldLabelMap
{
  return self->_fieldLabelMap;
}

- (CNPostalAddressFormattingSpecification)initWithDisplayFieldArrangement:(id)a3 editingFieldArrangement:(id)a4 fieldLabelMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPostalAddressFormattingSpecification *v11;
  uint64_t v12;
  NSArray *displayFieldArrangement;
  uint64_t v14;
  NSArray *editingFieldArrangement;
  uint64_t v16;
  NSDictionary *fieldLabelMap;
  CNPostalAddressFormattingSpecification *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNPostalAddressFormattingSpecification;
  v11 = -[CNPostalAddressFormattingSpecification init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    displayFieldArrangement = v11->_displayFieldArrangement;
    v11->_displayFieldArrangement = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    editingFieldArrangement = v11->_editingFieldArrangement;
    v11->_editingFieldArrangement = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    fieldLabelMap = v11->_fieldLabelMap;
    v11->_fieldLabelMap = (NSDictionary *)v16;

    v18 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldLabelMap, 0);
  objc_storeStrong((id *)&self->_editingFieldArrangement, 0);
  objc_storeStrong((id *)&self->_displayFieldArrangement, 0);
}

- (NSArray)displayFieldArrangement
{
  return self->_displayFieldArrangement;
}

- (NSArray)editingFieldArrangement
{
  return self->_editingFieldArrangement;
}

@end
