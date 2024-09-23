@implementation GCDevicePhysicalInputButtonElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  id v2;
  void *v3;
  const char *v4;
  void *v5;
  char v6;
  int v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_254DE3590;
  v2 = objc_msgSendSuper2(&v9, sel_makeParameters);
  objc_msgSend(a1, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v4, v5, 48);

  v6 = objc_msgSend(a1, "isAnalog");
  if (v2)
  {
    *((_BYTE *)v2 + 40) = v6;
    objc_msgSend(a1, "pressedThreshold");
    *((_DWORD *)v2 + 11) = v7;
    *((_QWORD *)v2 + 7) = objc_msgSend(a1, "eventPressedValueField");
  }
  else
  {
    objc_msgSend(a1, "pressedThreshold");
    objc_msgSend(a1, "eventPressedValueField");
  }
  return v2;
}

@end
