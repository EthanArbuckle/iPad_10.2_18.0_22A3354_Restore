@implementation GCHIDDevice

- (GCHIDDevice)initWithService:(unsigned int)a3
{
  GCHIDDevice *v3;
  objc_class *v4;
  CFArrayRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *(*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)GCHIDDevice;
  v3 = -[GCHIDDevice initWithService:](&v22, sel_initWithService_, *(_QWORD *)&a3);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    v5 = IOHIDDeviceCopyMatchingElements((IOHIDDeviceRef)v3, 0, 0);
    if (v5)
    {
      v6 = (void *)objc_opt_new();
      v7 = (void *)objc_opt_new();
      v8 = (void *)objc_opt_new();
      v9 = (void *)objc_opt_new();
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__5;
      v37 = __Block_byref_object_dispose__5;
      v38 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __ProcessHIDElements_block_invoke;
      aBlock[3] = &unk_1EA4D3D58;
      v10 = v9;
      v28 = v10;
      v11 = v7;
      v29 = v11;
      v12 = v8;
      v30 = v12;
      v13 = v6;
      v31 = v13;
      v32 = &v33;
      v14 = _Block_copy(aBlock);
      v15 = _Block_copy(v14);
      v16 = (void *)v34[5];
      v34[5] = (uint64_t)v15;

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v5;
      v18 = -[__CFArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v17);
            (*((void (**)(void *, _QWORD))v14 + 2))(v14, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++));
          }
          while (v18 != v20);
          v18 = -[__CFArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        }
        while (v18);
      }

      objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_10);
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_66);
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_69);

      _Block_object_dispose(&v33, 8);
      CFRelease(v17);
    }
  }
  return v3;
}

- (GCHIDDevice)init
{
  -[GCHIDDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
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
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GCHIDDevice;
  -[GCHIDDevice debugDescription](&v15, sel_debugDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice vendorID](self, "vendorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice productID](self, "productID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice versionNumber](self, "versionNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice manufacturer](self, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice product](self, "product");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice maxInputReportSize](self, "maxInputReportSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice maxOutputReportSize](self, "maxOutputReportSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDDevice maxFeatureReportSize](self, "maxFeatureReportSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ {\n\t transport = %@\n\t vendorID = %@\n\t productID = %@\n\t versionNumber = %@\n\t manufacturer = %@\n\t product = %@\n\t maxInputReportSize = %@\n\t maxOutputReportSize = %@\n\t maxFeatureReportSize = %@\n}"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)transport
{
  void *v2;
  void *v3;
  NSString *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("Transport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)vendorID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("VendorID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)productID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("ProductID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)versionNumber
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("VersionNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)manufacturer
{
  void *v2;
  void *v3;
  NSString *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("Manufacturer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)product
{
  void *v2;
  void *v3;
  NSString *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("Product"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)maxInputReportSize
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("MaxInputReportSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)maxOutputReportSize
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("MaxOutputReportSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)maxFeatureReportSize
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[GCHIDDevice propertyForKey:](self, "propertyForKey:", CFSTR("MaxFeatureReportSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSArray)elements
{
  return (NSArray *)IOHIDDeviceCopyMatchingElements((IOHIDDeviceRef)self, 0, 0);
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
    -[GCHIDDevice valueForKey:](self, "valueForKey:", v9);
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
  v12.super_class = (Class)GCHIDDevice;
  -[GCHIDDevice valueForKey:](&v12, sel_valueForKey_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
