@implementation HKDisplayTypeContextItemTitleAccessory

+ (HKDisplayTypeContextItemTitleAccessory)titleAccessoryWithImagedNamed:(id)a3 imageColor:(id)a4
{
  NSString *v5;
  UIColor *v6;
  HKDisplayTypeContextItemTitleAccessory *v7;
  NSString *systemImageName;
  NSString *v9;
  UIColor *color;

  v5 = (NSString *)a3;
  v6 = (UIColor *)a4;
  v7 = objc_alloc_init(HKDisplayTypeContextItemTitleAccessory);
  systemImageName = v7->_systemImageName;
  v7->_systemImageName = v5;
  v9 = v5;

  color = v7->_color;
  v7->_color = v6;

  return v7;
}

- (BOOL)_isEqualToTitleAccessory:(id)a3
{
  id v4;
  NSString *systemImageName;
  void *v6;
  UIColor *color;
  UIColor *v8;
  BOOL v9;

  v4 = a3;
  systemImageName = self->_systemImageName;
  objc_msgSend(v4, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](systemImageName, "isEqualToString:", v6))
  {
    color = self->_color;
    objc_msgSend(v4, "color");
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v9 = color == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HKDisplayTypeContextItemTitleAccessory *v4;
  BOOL v5;

  v4 = (HKDisplayTypeContextItemTitleAccessory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKDisplayTypeContextItemTitleAccessory _isEqualToTitleAccessory:](self, "_isEqualToTitleAccessory:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_systemImageName, "hash");
  return -[UIColor hash](self->_color, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_systemImageName);
  objc_storeStrong(v4 + 2, self->_color);
  return v4;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end
