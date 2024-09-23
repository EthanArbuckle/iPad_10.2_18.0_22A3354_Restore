@implementation GCDevicePhysicalInputCapacitiveDirectionPadElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (_QWORD)makeParameters
{
  _QWORD *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_254DE3F90;
  v2 = objc_msgSendSuper2(&v8, sel_makeParameters);
  objc_msgSend(a1, "touchedSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v4, v5, 152);

  v6 = objc_msgSend(a1, "eventTouchedValueField");
  if (v2)
    v2[20] = v6;
  return v2;
}

@end
