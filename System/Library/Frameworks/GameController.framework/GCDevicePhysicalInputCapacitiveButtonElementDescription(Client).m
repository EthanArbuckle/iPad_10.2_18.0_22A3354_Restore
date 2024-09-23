@implementation GCDevicePhysicalInputCapacitiveButtonElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (_QWORD)makeParameters
{
  _QWORD *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_254DE3698;
  v2 = objc_msgSendSuper2(&v5, sel_makeParameters);
  v3 = objc_msgSend(a1, "eventTouchedValueField");
  if (v2)
    v2[8] = v3;
  return v2;
}

@end
