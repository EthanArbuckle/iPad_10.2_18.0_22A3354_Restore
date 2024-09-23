@implementation AXSSMotionTrackingHIDInput

+ (id)motionTrackingHIDInputWithDevice:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  AXSSMotionTrackingHIDInput *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke;
  v21[3] = &unk_1E5F98FA8;
  v5 = v3;
  v22 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF9920](v21);
  v16 = v4;
  v17 = 3221225472;
  v18 = __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke_2;
  v19 = &unk_1E5F98FD0;
  v7 = v5;
  v20 = v7;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF9920](&v16);
  ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("PhysicalDeviceUniqueID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("ProductID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("VendorID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("Product"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[AXSSMotionTrackingUtilities axss_HIDDeviceIsMFiAuthenticated:](AXSSMotionTrackingUtilities, "axss_HIDDeviceIsMFiAuthenticated:", v7, v16, v17, v18, v19);
  if (objc_msgSend(v9, "length") || v10 || v11 || objc_msgSend(v12, "length"))
    v14 = -[AXSSMotionTrackingHIDInput initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:]([AXSSMotionTrackingHIDInput alloc], "initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:", v9, v10, v11, v12, v13);
  else
    v14 = 0;

  return v14;
}

id __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (AXSSMotionTrackingHIDInput)initWithDeviceUniqueID:(id)a3 productID:(id)a4 vendorID:(id)a5 deviceName:(id)a6 mfiAuthenticated:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  AXSSMotionTrackingHIDInput *v17;
  uint64_t v18;
  NSString *deviceUniqueID;
  uint64_t v20;
  NSNumber *productID;
  uint64_t v22;
  NSNumber *vendorID;
  uint64_t v24;
  NSString *deviceName;
  AXSSMotionTrackingHIDInput *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v12, "length");
  if (v13 || v14 || v16 || objc_msgSend(v15, "length"))
  {
    v28.receiver = self;
    v28.super_class = (Class)AXSSMotionTrackingHIDInput;
    v17 = -[AXSSMotionTrackingInput init](&v28, sel_init);
    if (v17)
    {
      v18 = objc_msgSend(v12, "copy");
      deviceUniqueID = v17->_deviceUniqueID;
      v17->_deviceUniqueID = (NSString *)v18;

      v20 = objc_msgSend(v13, "copy");
      productID = v17->_productID;
      v17->_productID = (NSNumber *)v20;

      v22 = objc_msgSend(v14, "copy");
      vendorID = v17->_vendorID;
      v17->_vendorID = (NSNumber *)v22;

      v24 = objc_msgSend(v15, "copy");
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v24;

      v17->_mfiAuthenticated = a7;
    }
    self = v17;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)uniqueIdentifier
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingHIDInput productID](self, "productID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[AXSSMotionTrackingHIDInput productID](self, "productID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("-"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSDictionary)hidMatchingDictionary
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke;
  v20[3] = &unk_1E5F98FF8;
  v5 = v3;
  v21 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5DF9920](v20);
  v15 = v4;
  v16 = 3221225472;
  v17 = __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke_2;
  v18 = &unk_1E5F99020;
  v19 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5DF9920](&v15);
  -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID", v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, const char *))v6)[2](v6, v9, "PhysicalDeviceUniqueID");

  -[AXSSMotionTrackingHIDInput productID](self, "productID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, const char *))v8)[2](v8, v10, "ProductID");

  -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, const char *))v8)[2](v8, v11, "VendorID");

  -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, const char *))v6)[2](v6, v12, "Product");

  v13 = (void *)objc_msgSend(v7, "copy");
  return (NSDictionary *)v13;
}

void __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v10 = v5;
    v7 = objc_msgSend(v5, "length");
    v6 = v10;
    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

      v6 = v10;
    }
  }

}

void __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a2;
    objc_msgSend(v5, "stringWithUTF8String:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deviceUniqueID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v5, v6);

  }
  -[AXSSMotionTrackingHIDInput productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXSSMotionTrackingHIDInput productID](self, "productID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_productID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v8, v9);

  }
  -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_vendorID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v11, v12);

  }
  -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deviceName);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v14, v15);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mfiAuthenticated);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, v17);

}

- (AXSSMotionTrackingHIDInput)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  AXSSMotionTrackingHIDInput *v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_deviceUniqueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_productID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_vendorID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_deviceName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  NSStringFromSelector(sel_mfiAuthenticated);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "BOOLValue");
  v21 = -[AXSSMotionTrackingHIDInput initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:](self, "initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:", v7, v10, v13, v16, v20);

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)AXSSMotionTrackingHIDInput;
  -[AXSSMotionTrackingHIDInput description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingHIDInput productID](self, "productID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <deviceUniqueID: %@, productID: %@, vendorID: %@, deviceName: %@, MFi authenticated: %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)plistDictionary
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)AXSSMotionTrackingHIDInput;
  -[AXSSMotionTrackingInput plistDictionary](&v21, sel_plistDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXSSMotionTrackingHIDInput deviceUniqueID](self, "deviceUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deviceUniqueID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  -[AXSSMotionTrackingHIDInput productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXSSMotionTrackingHIDInput productID](self, "productID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_productID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  }
  -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXSSMotionTrackingHIDInput vendorID](self, "vendorID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_vendorID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

  }
  -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AXSSMotionTrackingHIDInput deviceName](self, "deviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deviceName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mfiAuthenticated);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

  v19 = (void *)objc_msgSend(v3, "copy");
  return v19;
}

- (AXSSMotionTrackingHIDInput)initWithPlistDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  AXSSMotionTrackingHIDInput *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke;
  v24[3] = &unk_1E5F98FA8;
  v5 = v3;
  v25 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF9920](v24);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke_2;
  v22[3] = &unk_1E5F98FD0;
  v23 = v5;
  v21 = v5;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF9920](v22);
  NSStringFromSelector(sel_deviceUniqueID);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_productID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_vendorID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mfiAuthenticated);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AXSSMotionTrackingHIDInput initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:](self, "initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:", v8, v9, v11, v13, objc_msgSend(v15, "BOOLValue"));

  return v20;
}

id __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)trackingType
{
  return 2;
}

- (BOOL)supportsExpressions
{
  return 0;
}

- (BOOL)isHIDDevice
{
  return 1;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)mfiAuthenticated
{
  return self->_mfiAuthenticated;
}

- (void)setMfiAuthenticated:(BOOL)a3
{
  self->_mfiAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
}

@end
