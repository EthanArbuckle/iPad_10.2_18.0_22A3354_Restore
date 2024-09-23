@implementation AWDHomeKitVendorInformation

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasFirmwareVersion
{
  return self->_firmwareVersion != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasProductData
{
  return self->_productData != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitVendorInformation;
  -[AWDHomeKitVendorInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitVendorInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *manufacturer;
  NSString *model;
  NSString *firmwareVersion;
  NSString *name;
  NSString *productData;
  NSString *category;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  manufacturer = self->_manufacturer;
  if (manufacturer)
    objc_msgSend(v3, "setObject:forKey:", manufacturer, CFSTR("manufacturer"));
  model = self->_model;
  if (model)
    objc_msgSend(v4, "setObject:forKey:", model, CFSTR("model"));
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
    objc_msgSend(v4, "setObject:forKey:", firmwareVersion, CFSTR("firmwareVersion"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  productData = self->_productData;
  if (productData)
    objc_msgSend(v4, "setObject:forKey:", productData, CFSTR("productData"));
  category = self->_category;
  if (category)
    objc_msgSend(v4, "setObject:forKey:", category, CFSTR("category"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitVendorInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_manufacturer)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_productData)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_manufacturer)
  {
    objc_msgSend(v4, "setManufacturer:");
    v4 = v5;
  }
  if (self->_model)
  {
    objc_msgSend(v5, "setModel:");
    v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    objc_msgSend(v5, "setFirmwareVersion:");
    v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_productData)
  {
    objc_msgSend(v5, "setProductData:");
    v4 = v5;
  }
  if (self->_category)
  {
    objc_msgSend(v5, "setCategory:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_manufacturer, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_firmwareVersion, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_productData, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v16 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *manufacturer;
  NSString *model;
  NSString *firmwareVersion;
  NSString *name;
  NSString *productData;
  NSString *category;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((manufacturer = self->_manufacturer, !((unint64_t)manufacturer | v4[3]))
     || -[NSString isEqual:](manufacturer, "isEqual:"))
    && ((model = self->_model, !((unint64_t)model | v4[4]))
     || -[NSString isEqual:](model, "isEqual:"))
    && ((firmwareVersion = self->_firmwareVersion, !((unint64_t)firmwareVersion | v4[2]))
     || -[NSString isEqual:](firmwareVersion, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[5])) || -[NSString isEqual:](name, "isEqual:"))
    && ((productData = self->_productData, !((unint64_t)productData | v4[6]))
     || -[NSString isEqual:](productData, "isEqual:")))
  {
    category = self->_category;
    if ((unint64_t)category | v4[1])
      v11 = -[NSString isEqual:](category, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_manufacturer, "hash");
  v4 = -[NSString hash](self->_model, "hash") ^ v3;
  v5 = -[NSString hash](self->_firmwareVersion, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_name, "hash");
  v7 = -[NSString hash](self->_productData, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_category, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[AWDHomeKitVendorInformation setManufacturer:](self, "setManufacturer:");
  if (v4[4])
    -[AWDHomeKitVendorInformation setModel:](self, "setModel:");
  if (v4[2])
    -[AWDHomeKitVendorInformation setFirmwareVersion:](self, "setFirmwareVersion:");
  if (v4[5])
    -[AWDHomeKitVendorInformation setName:](self, "setName:");
  if (v4[6])
    -[AWDHomeKitVendorInformation setProductData:](self, "setProductData:");
  if (v4[1])
    -[AWDHomeKitVendorInformation setCategory:](self, "setCategory:");

}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_storeStrong((id *)&self->_productData, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
