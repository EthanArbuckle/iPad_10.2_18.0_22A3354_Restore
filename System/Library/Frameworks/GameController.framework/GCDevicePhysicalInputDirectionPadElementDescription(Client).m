@implementation GCDevicePhysicalInputDirectionPadElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  void *v1;
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  char v25;
  objc_super v27;

  v27.receiver = a1;
  v27.super_class = (Class)&off_254DE25E8;
  v3 = objc_msgSendSuper2(&v27, sel_makeParameters);
  objc_msgSend(a1, "xySources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "xySources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  if (v3)
LABEL_3:
    objc_setProperty_nonatomic_copy(v3, v4, v6, 48);
LABEL_4:
  if (v5)
  {

  }
  objc_msgSend(a1, "xSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "xSources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v9 = 0;
  if (v3)
LABEL_8:
    objc_setProperty_nonatomic_copy(v3, v7, v9, 56);
LABEL_9:
  if (v8)
  {

  }
  objc_msgSend(a1, "ySources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "ySources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = 0;
  if (v3)
LABEL_13:
    objc_setProperty_nonatomic_copy(v3, v10, v12, 64);
LABEL_14:
  if (v11)
  {

  }
  objc_msgSend(a1, "upSources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "upSources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_19;
    goto LABEL_18;
  }
  v15 = 0;
  if (v3)
LABEL_18:
    objc_setProperty_nonatomic_copy(v3, v13, v15, 72);
LABEL_19:
  if (v14)
  {

  }
  objc_msgSend(a1, "rightSources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(a1, "rightSources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_24;
    goto LABEL_23;
  }
  v18 = 0;
  if (v3)
LABEL_23:
    objc_setProperty_nonatomic_copy(v3, v16, v18, 96);
LABEL_24:
  if (v17)
  {

  }
  objc_msgSend(a1, "downSources");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(a1, "downSources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_29;
    goto LABEL_28;
  }
  v21 = 0;
  if (v3)
LABEL_28:
    objc_setProperty_nonatomic_copy(v3, v19, v21, 88);
LABEL_29:
  if (v20)
  {

  }
  objc_msgSend(a1, "leftSources");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(a1, "leftSources");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_34;
    goto LABEL_33;
  }
  v24 = 0;
  if (v3)
LABEL_33:
    objc_setProperty_nonatomic_copy(v3, v22, v24, 80);
LABEL_34:
  if (v23)
  {

  }
  v25 = objc_msgSend(a1, "isAnalog");
  if (v3)
  {
    *((_BYTE *)v3 + 40) = v25;
    *((_QWORD *)v3 + 13) = objc_msgSend(a1, "eventUpValueField");
    *((_QWORD *)v3 + 16) = objc_msgSend(a1, "eventRightValueField");
    *((_QWORD *)v3 + 14) = objc_msgSend(a1, "eventDownValueField");
    *((_QWORD *)v3 + 15) = objc_msgSend(a1, "eventLeftValueField");
  }
  else
  {
    objc_msgSend(a1, "eventUpValueField");
    objc_msgSend(a1, "eventRightValueField");
    objc_msgSend(a1, "eventDownValueField");
    objc_msgSend(a1, "eventLeftValueField");
  }
  return v3;
}

@end
