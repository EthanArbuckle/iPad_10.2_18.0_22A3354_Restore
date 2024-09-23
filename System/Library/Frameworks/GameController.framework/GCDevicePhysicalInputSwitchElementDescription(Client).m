@implementation GCDevicePhysicalInputSwitchElementDescription(Client)

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
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_254DE1DF0;
  v2 = objc_msgSendSuper2(&v9, sel_makeParameters);
  objc_msgSend(a1, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v4, v5, 48);

  v6 = objc_msgSend(a1, "isSequential");
  if (v2)
  {
    *((_BYTE *)v2 + 40) = v6;
    *((_BYTE *)v2 + 41) = objc_msgSend(a1, "canWrap");
    *((_QWORD *)v2 + 8) = objc_msgSend(a1, "positionRange");
    *((_QWORD *)v2 + 9) = v7;
    *((_QWORD *)v2 + 7) = objc_msgSend(a1, "eventPositionField");
  }
  else
  {
    objc_msgSend(a1, "canWrap");
    objc_msgSend(a1, "positionRange");
    objc_msgSend(a1, "eventPositionField");
  }
  return v2;
}

@end
