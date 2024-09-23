@implementation HIDElement(GC)

- (uint64_t)usageType
{
  void *v1;
  uint64_t v2;

  IOHIDElementGetProperty(a1, CFSTR("UsageType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)usageTypeIndex
{
  void *v1;
  uint64_t v2;

  IOHIDElementGetProperty(a1, CFSTR("UsageTypeIndex"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = -1;

  return v2;
}

- (uint64_t)setName:()GC
{
  return IOHIDElementSetProperty(a1, CFSTR("Name"), a3);
}

- (id)calibrationMin
{
  id Property;
  void *v2;
  CFTypeID v3;

  Property = (id)IOHIDElementGetProperty(a1, CFSTR("CalibrationMin"));
  if (Property)
  {
    v2 = Property;
    v3 = CFGetTypeID(Property);
    if (v3 == CFNumberGetTypeID())
      Property = v2;
    else
      Property = 0;
  }
  return Property;
}

- (uint64_t)setCalibrationMin:()GC
{
  return IOHIDElementSetProperty(a1, CFSTR("CalibrationMin"), a3);
}

- (id)calibrationMax
{
  id Property;
  void *v2;
  CFTypeID v3;

  Property = (id)IOHIDElementGetProperty(a1, CFSTR("CalibrationMax"));
  if (Property)
  {
    v2 = Property;
    v3 = CFGetTypeID(Property);
    if (v3 == CFNumberGetTypeID())
      Property = v2;
    else
      Property = 0;
  }
  return Property;
}

- (uint64_t)setCalibrationMax:()GC
{
  return IOHIDElementSetProperty(a1, CFSTR("CalibrationMax"), a3);
}

- (id)valueForElementKey:()GC
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  GCHIDElementAttributeKeys();
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
    objc_msgSend(a1, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForKey:()GC
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
  GCHIDElementAttributeKeys();
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
  v12.receiver = a1;
  v12.super_class = (Class)&off_1F03A6E38;
  objc_msgSendSuper2(&v12, sel_valueForKey_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_1F03A6E38;
  objc_msgSendSuper2(&v8, sel_debugDescription);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "elementCookie");
  v4 = objc_msgSend(a1, "type");
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ {\n\t elementCookie = %u\n\t type = %zi\n\t name = %@\n\t usageType = %zd\n\t usageTypeIndex = %zd\n\t usage = %zd\n\t usagePage = %zd\n}"), v2, v3, v4, v5, objc_msgSend(a1, "usageType"), objc_msgSend(a1, "usageTypeIndex"), objc_msgSend(a1, "usage"), objc_msgSend(a1, "usagePage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
