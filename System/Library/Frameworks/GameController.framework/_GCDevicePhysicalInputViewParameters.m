@implementation _GCDevicePhysicalInputViewParameters

+ (Class)viewClass
{
  objc_class *v2;
  NSString *v3;
  NSString *v4;
  Class v5;
  objc_class *v6;
  NSString *v8;

  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = -[NSString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Parameters"), &stru_24D2B85A8);
  v5 = NSClassFromString(v4);
  if (!v5 || (v6 = v5, !-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class())))
  {
    v8 = +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Unknown view class '%@' for parameters class '%@'."), v4, v3);
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v8, 0));
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

@end
