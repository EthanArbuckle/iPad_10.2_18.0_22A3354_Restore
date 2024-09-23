@implementation GCHIDDeviceSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHIDDeviceSnapshot)init
{
  GCHIDDeviceSnapshot *v2;
  NSArray *elements;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCHIDDeviceSnapshot;
  v2 = -[GCHIDDeviceSnapshot init](&v5, sel_init);
  elements = v2->_elements;
  v2->_elements = (NSArray *)MEMORY[0x1E0C9AA60];

  return v2;
}

- (GCHIDDeviceSnapshot)initWithService:(unsigned int)a3
{
  GCHIDDeviceSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  GCHIDElementSnapshot *v27;
  void *v28;
  uint64_t v29;
  NSArray *elements;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CFMutableDictionaryRef properties;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)GCHIDDeviceSnapshot;
  v4 = -[GCHIDDeviceSnapshot init](&v39, sel_init);
  properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, 0, 0);
  if (properties)
  {
    CFDictionaryGetValue(properties, CFSTR("Transport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&v4->_transport, v6);
    CFDictionaryGetValue(properties, CFSTR("VendorID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&v4->_vendorID, v8);
    CFDictionaryGetValue(properties, CFSTR("ProductID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&v4->_productID, v10);
    CFDictionaryGetValue(properties, CFSTR("VersionNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&v4->_versionNumber, v12);
    CFDictionaryGetValue(properties, CFSTR("Manufacturer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&v4->_manufacturer, v14);
    CFDictionaryGetValue(properties, CFSTR("Product"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    objc_storeStrong((id *)&v4->_product, v16);
    CFDictionaryGetValue(properties, CFSTR("MaxInputReportSize"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = (void *)v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = (void *)v17;
    else
      v18 = 0;
    objc_storeStrong((id *)&v4->_maxInputReportSize, v18);
    CFDictionaryGetValue(properties, CFSTR("MaxOutputReportSize"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = (void *)v19;
    else
      v20 = 0;
    objc_storeStrong((id *)&v4->_maxOutputReportSize, v20);
    CFDictionaryGetValue(properties, CFSTR("MaxFeatureReportSize"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = (void *)v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = (void *)v21;
    else
      v22 = 0;
    objc_storeStrong((id *)&v4->_maxFeatureReportSize, v22);
    CFDictionaryGetValue(properties, CFSTR("Elements"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v11;
      v33 = v9;
      v34 = v7;
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      v25 = (void *)objc_opt_new();
      while (objc_msgSend(v24, "count"))
      {
        objc_msgSend(v24, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObjectAtIndex:", 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = -[GCHIDElementSnapshot initWithDictionary:]([GCHIDElementSnapshot alloc], "initWithDictionary:", v26);
          if (v27)
            objc_msgSend(v25, "addObject:", v27);
          objc_msgSend(v26, "objectForKey:", CFSTR("Elements"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v24, "addObjectsFromArray:", v28);

        }
      }
      v29 = objc_msgSend(v25, "copy");
      elements = v4->_elements;
      v4->_elements = (NSArray *)v29;

      v7 = v34;
      v11 = v32;
      v9 = v33;
    }
    else
    {
      v24 = v23;
    }
    CFRelease(properties);

  }
  return v4;
}

- (GCHIDDeviceSnapshot)initWithHIDDevice:(id)a3
{
  id v3;
  GCHIDDeviceSnapshot *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *elements;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)GCHIDDeviceSnapshot;
  v3 = a3;
  v4 = -[GCHIDDeviceSnapshot init](&v29, sel_init);
  objc_msgSend(v3, "propertyForKey:", CFSTR("Transport"));
  v5 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)v5;
  else
    v6 = 0;
  objc_storeStrong((id *)&v4->_transport, v6);
  objc_msgSend(v3, "propertyForKey:", CFSTR("VendorID"));
  v7 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (void *)v7;
  else
    v8 = 0;
  objc_storeStrong((id *)&v4->_vendorID, v8);
  objc_msgSend(v3, "propertyForKey:", CFSTR("ProductID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  objc_storeStrong((id *)&v4->_productID, v10);
  objc_msgSend(v3, "propertyForKey:", CFSTR("VersionNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  objc_storeStrong((id *)&v4->_versionNumber, v12);
  objc_msgSend(v3, "propertyForKey:", CFSTR("Manufacturer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  objc_storeStrong((id *)&v4->_manufacturer, v14);
  objc_msgSend(v3, "propertyForKey:", CFSTR("Product"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  objc_storeStrong((id *)&v4->_product, v16);
  objc_msgSend(v3, "propertyForKey:", CFSTR("MaxInputReportSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  objc_storeStrong((id *)&v4->_maxInputReportSize, v18);
  objc_msgSend(v3, "propertyForKey:", CFSTR("MaxOutputReportSize"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  objc_storeStrong((id *)&v4->_maxOutputReportSize, v20);
  objc_msgSend(v3, "propertyForKey:", CFSTR("MaxFeatureReportSize"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  objc_storeStrong((id *)&v4->_maxFeatureReportSize, v22);
  objc_msgSend(v3, "elementsMatching:", MEMORY[0x1E0C9AA70]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_9);
  v24 = objc_claimAutoreleasedReturnValue();
  elements = v4->_elements;
  v4->_elements = (NSArray *)v24;

  return v4;
}

uint64_t __41__GCHIDDeviceSnapshot_initWithHIDDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gc_snapshot");
}

- (GCHIDDeviceSnapshot)initWithCoder:(id)a3
{
  id v3;
  GCHIDDeviceSnapshot *v4;
  uint64_t v5;
  NSString *transport;
  uint64_t v7;
  NSNumber *vendorID;
  uint64_t v9;
  NSNumber *productID;
  uint64_t v11;
  NSNumber *versionNumber;
  uint64_t v13;
  NSString *manufacturer;
  uint64_t v15;
  NSString *product;
  uint64_t v17;
  NSNumber *maxInputReportSize;
  uint64_t v19;
  NSNumber *maxOutputReportSize;
  uint64_t v21;
  NSNumber *maxFeatureReportSize;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *elements;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)GCHIDDeviceSnapshot;
  v3 = a3;
  v4 = -[GCHIDDeviceSnapshot init](&v28, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Transport"));
  v5 = objc_claimAutoreleasedReturnValue();
  transport = v4->_transport;
  v4->_transport = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VendorID"));
  v7 = objc_claimAutoreleasedReturnValue();
  vendorID = v4->_vendorID;
  v4->_vendorID = (NSNumber *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductID"));
  v9 = objc_claimAutoreleasedReturnValue();
  productID = v4->_productID;
  v4->_productID = (NSNumber *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VersionNumber"));
  v11 = objc_claimAutoreleasedReturnValue();
  versionNumber = v4->_versionNumber;
  v4->_versionNumber = (NSNumber *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Manufacturer"));
  v13 = objc_claimAutoreleasedReturnValue();
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v13;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Product"));
  v15 = objc_claimAutoreleasedReturnValue();
  product = v4->_product;
  v4->_product = (NSString *)v15;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxInputReportSize"));
  v17 = objc_claimAutoreleasedReturnValue();
  maxInputReportSize = v4->_maxInputReportSize;
  v4->_maxInputReportSize = (NSNumber *)v17;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxOutputReportSize"));
  v19 = objc_claimAutoreleasedReturnValue();
  maxOutputReportSize = v4->_maxOutputReportSize;
  v4->_maxOutputReportSize = (NSNumber *)v19;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxFeatureReportSize"));
  v21 = objc_claimAutoreleasedReturnValue();
  maxFeatureReportSize = v4->_maxFeatureReportSize;
  v4->_maxFeatureReportSize = (NSNumber *)v21;

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v24, CFSTR("elements"));
  v25 = objc_claimAutoreleasedReturnValue();

  elements = v4->_elements;
  v4->_elements = (NSArray *)v25;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transport;
  id v5;
  id v6;

  transport = self->_transport;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transport, CFSTR("Transport"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorID, CFSTR("VendorID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productID, CFSTR("ProductID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionNumber, CFSTR("VersionNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturer, CFSTR("Manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_product, CFSTR("Product"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxInputReportSize, CFSTR("MaxInputReportSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxOutputReportSize, CFSTR("MaxOutputReportSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxFeatureReportSize, CFSTR("MaxFeatureReportSize"));
  -[GCHIDDeviceSnapshot elements](self, "elements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("elements"));

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)GCHIDDeviceSnapshot;
  -[GCHIDDeviceSnapshot debugDescription](&v27, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR(" {\n"));
  -[GCHIDDeviceSnapshot transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t transport = %@\n"), v5);

  -[GCHIDDeviceSnapshot vendorID](self, "vendorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t vendorID = %@\n"), v6);

  -[GCHIDDeviceSnapshot productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t productID = %@\n"), v7);

  -[GCHIDDeviceSnapshot versionNumber](self, "versionNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t versionNumber = %@\n"), v8);

  -[GCHIDDeviceSnapshot manufacturer](self, "manufacturer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t manufacturer = %@\n"), v9);

  -[GCHIDDeviceSnapshot product](self, "product");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t product = %@\n"), v10);

  -[GCHIDDeviceSnapshot maxInputReportSize](self, "maxInputReportSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t maxInputReportSize = %@\n"), v11);

  -[GCHIDDeviceSnapshot maxOutputReportSize](self, "maxOutputReportSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t maxOutputReportSize = %@\n"), v12);

  -[GCHIDDeviceSnapshot maxFeatureReportSize](self, "maxFeatureReportSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t maxFeatureReportSize = %@\n"), v13);

  -[GCHIDDeviceSnapshot elements](self, "elements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t elements (%zu) = {\n"), objc_msgSend(v14, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GCHIDDeviceSnapshot elements](self, "elements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "debugDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\t\t %@\n"), v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("\t }\n"));
  return v4;
}

- (id)valueForHIDDeviceKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  GCHIDDeviceAttributeKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCHIDDeviceSnapshot valueForKey:](self, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  GCHIDDeviceAttributeKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
  }
  v12.receiver = self;
  v12.super_class = (Class)GCHIDDeviceSnapshot;
  -[GCHIDDeviceSnapshot valueForKey:](&v12, sel_valueForKey_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)transport
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)product
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)maxInputReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)maxOutputReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)maxFeatureReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)elements
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_maxFeatureReportSize, 0);
  objc_storeStrong((id *)&self->_maxOutputReportSize, 0);
  objc_storeStrong((id *)&self->_maxInputReportSize, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
