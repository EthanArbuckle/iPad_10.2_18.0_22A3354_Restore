const __CFString *DDErrorCodeToString(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 350000:
      result = CFSTR("DDErrorCodeUnknown");
      break;
    case 350001:
      result = CFSTR("DDErrorCodeBadParameter");
      break;
    case 350002:
      result = CFSTR("DDErrorCodeUnsupported");
      break;
    case 350003:
      result = CFSTR("DDErrorCodeTimeout");
      break;
    case 350004:
      result = CFSTR("DDErrorCodeInternal");
      break;
    case 350005:
      result = CFSTR("DDErrorCodeMissingEntitlement");
      break;
    case 350006:
      result = CFSTR("DDErrorCodePermission");
      break;
    default:
      if (a1)
        result = CFSTR("?");
      else
        result = CFSTR("DDErrorCodeSuccess");
      break;
  }
  return result;
}

id DDErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v10, &a9);
  v12 = objc_alloc(MEMORY[0x24BDD1540]);
  v16 = CFSTR("cuErrorMsg");
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("DDErrorDomain"), a1, v13);

  return v14;
}

id DDNestedErrorF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void **v18;
  const __CFString **v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v12, &a9);
  v14 = v11;
  v15 = objc_alloc(MEMORY[0x24BDD1540]);
  if (v14)
  {
    v16 = *MEMORY[0x24BDD1398];
    v26[0] = CFSTR("cuErrorMsg");
    v26[1] = v16;
    v27[0] = v13;
    v27[1] = v14;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = (void **)v27;
    v19 = (const __CFString **)v26;
    v20 = 2;
  }
  else
  {
    v24 = CFSTR("cuErrorMsg");
    v25 = v13;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = &v25;
    v19 = &v24;
    v20 = 1;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("DDErrorDomain"), a2, v21);

  return v22;
}

NSString *__cdecl DDEventTypeToString(DDEventType inValue)
{
  if (inValue > DDEventTypeDeviceFound)
  {
    if (inValue != DDEventTypeDeviceLost)
    {
      if (inValue == DDEventTypeDeviceChanged)
        return (NSString *)CFSTR("DeviceChanged");
      return (NSString *)CFSTR("?");
    }
    return (NSString *)CFSTR("DeviceLost");
  }
  else
  {
    if (inValue)
    {
      if (inValue == DDEventTypeDeviceFound)
        return (NSString *)CFSTR("DeviceFound");
      return (NSString *)CFSTR("?");
    }
    return (NSString *)CFSTR("Unknown");
  }
}

NSString *__cdecl DDDeviceProtocolToString(DDDeviceProtocol inValue)
{
  const __CFString *v1;

  v1 = CFSTR("?");
  if (inValue == DDDeviceProtocolDIAL)
    v1 = CFSTR("DIAL");
  if (inValue)
    return &v1->isa;
  else
    return (NSString *)CFSTR("Invalid");
}

NSString *__cdecl DDDeviceCategoryToString(DDDeviceCategory inValue)
{
  if ((unint64_t)inValue > (DDDeviceCategoryLaptopComputer|DDDeviceCategoryTVWithMediaBox))
    return (NSString *)CFSTR("?");
  else
    return &off_24F0EE848[inValue]->isa;
}

NSString *__cdecl DDDeviceStateToString(DDDeviceState inValue)
{
  if (inValue <= 19)
  {
    if (inValue == DDDeviceStateInvalid)
      return (NSString *)CFSTR("Invalid");
    if (inValue == DDDeviceStateActivating)
      return (NSString *)CFSTR("Activating");
  }
  else
  {
    switch(inValue)
    {
      case DDDeviceStateActivated:
        return (NSString *)CFSTR("Activated");
      case DDDeviceStateAuthorized:
        return (NSString *)CFSTR("Authorized");
      case DDDeviceStateInvalidating:
        return (NSString *)CFSTR("Invalidating");
    }
  }
  return (NSString *)CFSTR("?");
}

NSString *__cdecl DDDeviceMediaPlaybackStateToString(DDDeviceMediaPlaybackState inValue)
{
  if ((unint64_t)inValue > DDDeviceMediaPlaybackStatePlaying)
    return (NSString *)CFSTR("?");
  else
    return &off_24F0EE880[inValue]->isa;
}

uint64_t DDDevice.networkEndpoint.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v4;

  if (objc_msgSend(v1, sel_networkEndpoint))
    return sub_2282B9FB8();
  v4 = sub_2282B9FAC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
}

uint64_t sub_2282B7784@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  if (objc_msgSend(*a1, sel_networkEndpoint))
    return sub_2282B9FB8();
  v4 = sub_2282B9FAC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a2, 1, 1, v4);
}

uint64_t sub_2282B77E8(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559741D8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  sub_2282B7FEC(a1, (uint64_t)&v14 - v7, &qword_2559741D8);
  v9 = *a2;
  sub_2282B7FEC((uint64_t)v8, (uint64_t)v6, &qword_2559741D8);
  v10 = sub_2282B9FAC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_2282B8030((uint64_t)v6, &qword_2559741D8);
    v12 = 0;
  }
  else
  {
    v12 = sub_2282B9FA0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  objc_msgSend(v9, sel_setNetworkEndpoint_, v12);
  swift_unknownObjectRelease();
  return sub_2282B8030((uint64_t)v8, &qword_2559741D8);
}

uint64_t DDDevice.networkEndpoint.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559741D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2282B7FEC(a1, (uint64_t)v6, &qword_2559741D8);
  v7 = sub_2282B9FAC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2282B8030((uint64_t)v6, &qword_2559741D8);
    v9 = 0;
  }
  else
  {
    v9 = sub_2282B9FA0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  objc_msgSend(v2, sel_setNetworkEndpoint_, v9);
  swift_unknownObjectRelease();
  return sub_2282B8030(a1, &qword_2559741D8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2AE9F4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void (*DDDevice.networkEndpoint.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  uint64_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559741D8) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  if (objc_msgSend(v1, sel_networkEndpoint))
  {
    sub_2282B9FB8();
  }
  else
  {
    v6 = sub_2282B9FAC();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  return sub_2282B7B3C;
}

void sub_2282B7B3C(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 16);
    sub_2282B7FEC(v3, v4, &qword_2559741D8);
    sub_2282B7FEC(v4, v5, &qword_2559741D8);
    v6 = sub_2282B9FAC();
    v7 = *(_QWORD *)(v6 - 8);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    v9 = *(_QWORD *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2282B8030(*(_QWORD *)(v2 + 8), &qword_2559741D8);
      v10 = 0;
    }
    else
    {
      v10 = sub_2282B9FA0();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v10);
    swift_unknownObjectRelease();
    sub_2282B8030((uint64_t)v19, &qword_2559741D8);
  }
  else
  {
    v11 = *(_QWORD *)(v2 + 24);
    sub_2282B7FEC(v3, v11, &qword_2559741D8);
    v12 = sub_2282B9FAC();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    v15 = *(_QWORD *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2282B8030(*(_QWORD *)(v2 + 24), &qword_2559741D8);
      v16 = 0;
    }
    else
    {
      v16 = sub_2282B9FA0();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v16);
    swift_unknownObjectRelease();
  }
  sub_2282B8030((uint64_t)v17, &qword_2559741D8);
  free(v17);
  free(v18);
  free(v19);
  free(v20);
  free((void *)v2);
}

uint64_t DDDevice.txtRecord.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(v1, sel_txtRecordData);
  if (v3)
  {
    v4 = v3;
    sub_2282B9F28();

    sub_2282B9FDC();
    v5 = sub_2282B9FD0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_2282B9FD0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_2282B7D9C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_txtRecordData);
  if (v3)
  {
    v4 = v3;
    sub_2282B9F28();

    sub_2282B9FDC();
    v5 = sub_2282B9FD0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_2282B9FD0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_2282B7E3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559741E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2282B7FEC(a1, (uint64_t)v4, &qword_2559741E0);
  return DDDevice.txtRecord.setter((uint64_t)v4);
}

uint64_t DDDevice.txtRecord.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559741E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2282B7FEC(a1, (uint64_t)v6, &qword_2559741E0);
  v7 = sub_2282B9FD0();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2282B8030((uint64_t)v6, &qword_2559741E0);
    v9 = 0;
  }
  else
  {
    v10 = sub_2282B9FC4();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    v9 = (void *)sub_2282B9F1C();
    sub_2282B806C(v10, v12);
  }
  objc_msgSend(v2, sel_setTxtRecordData_, v9);

  return sub_2282B8030(a1, &qword_2559741E0);
}

uint64_t sub_2282B7FEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2282B8030(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2282B806C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void (*DDDevice.txtRecord.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559741E0) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  v6 = objc_msgSend(v1, sel_txtRecordData);
  if (v6)
  {
    v7 = v6;
    sub_2282B9F28();

    sub_2282B9FDC();
    v8 = sub_2282B9FD0();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  }
  else
  {
    v9 = sub_2282B9FD0();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  }
  return sub_2282B81BC;
}

void sub_2282B81BC(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 16);
    sub_2282B7FEC(v3, v4, &qword_2559741E0);
    sub_2282B7FEC(v4, v5, &qword_2559741E0);
    v6 = sub_2282B9FD0();
    v7 = *(_QWORD *)(v6 - 8);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    v9 = *(_QWORD *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2282B8030(*(_QWORD *)(v2 + 8), &qword_2559741E0);
      v10 = 0;
    }
    else
    {
      v17 = sub_2282B9FC4();
      v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
      v10 = (void *)sub_2282B9F1C();
      sub_2282B806C(v17, v19);
    }
    v21 = *(void **)(v2 + 24);
    v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v10);

    sub_2282B8030((uint64_t)v22, &qword_2559741E0);
  }
  else
  {
    v11 = *(_QWORD *)(v2 + 24);
    sub_2282B7FEC(v3, v11, &qword_2559741E0);
    v12 = sub_2282B9FD0();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    v15 = *(_QWORD *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2282B8030(*(_QWORD *)(v2 + 24), &qword_2559741E0);
      v16 = 0;
    }
    else
    {
      v24 = sub_2282B9FC4();
      v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
      v16 = (void *)sub_2282B9F1C();
      sub_2282B806C(v24, v26);
    }
    v21 = *(void **)(v2 + 24);
    v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v16);

  }
  sub_2282B8030((uint64_t)v20, &qword_2559741E0);
  free(v20);
  free(v21);
  free(v22);
  free(v23);
  free((void *)v2);
}

uint64_t sub_2282B83B4()
{
  uint64_t v0;

  v0 = sub_2282B9F94();
  __swift_allocate_value_buffer(v0, qword_255974248);
  __swift_project_value_buffer(v0, (uint64_t)qword_255974248);
  return sub_2282B9F88();
}

char *DDDiscoveryExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *result;
  uint64_t v12;

  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DDDiscoveryExtensionConfiguration(0, a1, v8, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, a1);
  v10 = swift_allocObject();
  result = DDDiscoveryExtensionConfiguration.init(discoveryExtension:)((uint64_t)v7);
  *a2 = v10;
  return result;
}

uint64_t type metadata accessor for DDDiscoveryExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DDDiscoveryExtensionConfiguration);
}

uint64_t DDDiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DDDiscoveryExtensionConfiguration.init(discoveryExtension:)(a1);
  return v2;
}

void sub_2282B8528(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  sub_2282B8558(a1);
}

void sub_2282B8558(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + qword_255974340) = a1;
  type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
}

id sub_2282B8598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_init);
}

void sub_2282B85B8()
{
  sub_2282B90AC();
}

void sub_2282B85E0(void *a1)
{
  id v1;

  v1 = a1;
  sub_2282B85B8();

}

void sub_2282B8614()
{
  sub_2282B8F04();
}

void sub_2282B863C(void *a1)
{
  id v1;

  v1 = a1;
  sub_2282B8614();

}

void sub_2282B867C(void *a1)
{
  sub_2282B94FC(a1);
}

void sub_2282B86A4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2282B867C(v4);

}

void sub_2282B86F8()
{
  sub_2282B9CA0();
}

void sub_2282B8718()
{
  type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
}

id sub_2282B874C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_2282B876C()
{
  return swift_release();
}

uint64_t sub_2282B877C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_2282B8784(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void sub_2282B878C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  v3 = *(void **)(v1 + v2);
  *(_QWORD *)(v1 + v2) = a1;

}

void sub_2282B87A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  v3 = *(void **)(v1 + v2);
  *(_QWORD *)(v1 + v2) = a1;

}

char *DDDiscoveryExtensionConfiguration.init(discoveryExtension:)(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = v1;
  v4 = *(_QWORD *)v1;
  *(_QWORD *)&v1[*(_QWORD *)(*(_QWORD *)v1 + 112)] = 0;
  *(_QWORD *)&v1[*(_QWORD *)(*(_QWORD *)v1 + 120)] = 0;
  if (qword_2559741D0 != -1)
    swift_once();
  v5 = sub_2282B9F94();
  __swift_project_value_buffer(v5, (uint64_t)qword_255974248);
  v6 = sub_2282B9F7C();
  v7 = sub_2282BA000();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2282B3000, v6, v7, "DD config init", v8, 2u);
    MEMORY[0x22E2AEA54](v8, -1, -1);
  }

  *((_QWORD *)v2 + 2) = -1;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 32))(&v2[*(_QWORD *)(*(_QWORD *)v2 + 104)], a1);
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_2282B88EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;

  v2 = v1;
  if (qword_2559741D0 != -1)
    swift_once();
  v4 = sub_2282B9F94();
  __swift_project_value_buffer(v4, (uint64_t)qword_255974248);
  v5 = a1;
  v6 = sub_2282B9F7C();
  v7 = sub_2282BA018();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    objc_msgSend(v5, sel_processIdentifier);
    sub_2282BA024();

    _os_log_impl(&dword_2282B3000, v6, v7, "XPC connection started: PID %d", v8, 8u);
    MEMORY[0x22E2AEA54](v8, -1, -1);

  }
  else
  {

  }
  v9 = *(void **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120));
  if (v9)
  {
    v10 = v5;
    v11 = v9;
    v12 = sub_2282B9F7C();
    v13 = sub_2282BA018();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      *(_DWORD *)v14 = 67109376;
      LODWORD(v21) = objc_msgSend(v11, sel_processIdentifier);
      sub_2282BA024();
      *(_WORD *)(v14 + 8) = 1024;
      -[NSObject processIdentifier](v10, sel_processIdentifier, v21);
      sub_2282BA024();

      _os_log_impl(&dword_2282B3000, v12, v13, "XPC connection replacing: PID %d -> PID %d", (uint8_t *)v14, 0xEu);
      MEMORY[0x22E2AEA54](v14, -1, -1);
    }
    else
    {

      v12 = v10;
    }

    objc_msgSend(v11, sel_invalidate);
    v15 = *(_QWORD *)(*(_QWORD *)v2 + 120);
    v16 = *(void **)(v2 + v15);
    *(_QWORD *)(v2 + v15) = 0;

  }
  v17 = *(_QWORD *)(*(_QWORD *)v2 + 120);
  v18 = *(void **)(v2 + v17);
  *(_QWORD *)(v2 + v17) = v5;
  v19 = v5;

  v20 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_255976698);
  objc_msgSend(v19, sel_setExportedInterface_, v20);

  type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
}

uint64_t sub_2282B8D0C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2282B8D38(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t result;

  v2 = v1;
  v4 = *v2;
  if (qword_2559741D0 != -1)
    swift_once();
  v5 = sub_2282B9F94();
  __swift_project_value_buffer(v5, (uint64_t)qword_255974248);
  v6 = a1;
  v7 = sub_2282B9F7C();
  v8 = sub_2282BA018();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    objc_msgSend(v6, sel_processIdentifier);
    sub_2282BA024();

    _os_log_impl(&dword_2282B3000, v7, v8, "XPC connection ended: PID %d", v9, 8u);
    MEMORY[0x22E2AEA54](v9, -1, -1);

  }
  else
  {

  }
  v10 = *(_QWORD *)(*v2 + 112);
  v11 = *(void **)((char *)v2 + v10);
  if (v11)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(v4 + 88) + 24);
    v13 = v11;
    v12();
    objc_msgSend(v13, sel_invalidate);

    v10 = *(_QWORD *)(*v2 + 112);
    v11 = *(void **)((char *)v2 + v10);
  }
  *(_QWORD *)((char *)v2 + v10) = 0;

  v14 = *(_QWORD *)(*v2 + 120);
  v15 = *(void **)((char *)v2 + v14);
  *(_QWORD *)((char *)v2 + v14) = 0;

  result = v2[2];
  if (result != -1)
    return sandbox_extension_release();
  return result;
}

void sub_2282B8F04()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  const char *v8;
  NSObject *oslog;

  if (qword_2559741D0 != -1)
    swift_once();
  v1 = sub_2282B9F94();
  __swift_project_value_buffer(v1, (uint64_t)qword_255974248);
  v2 = sub_2282B9F7C();
  v3 = sub_2282BA018();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2282B3000, v2, v3, "XPC consume sandbox extension token", v4, 2u);
    MEMORY[0x22E2AEA54](v4, -1, -1);
  }

  v5 = sandbox_extension_consume();
  *(_QWORD *)(v0 + 16) = v5;
  oslog = sub_2282B9F7C();
  if (v5 == -1)
  {
    v6 = sub_2282BA00C();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      v8 = "XPC consume sandbox token failed";
      goto LABEL_10;
    }
  }
  else
  {
    v6 = sub_2282BA018();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      v8 = "XPC consume sandbox token success";
LABEL_10:
      _os_log_impl(&dword_2282B3000, oslog, v6, v8, v7, 2u);
      MEMORY[0x22E2AEA54](v7, -1, -1);
    }
  }

}

void sub_2282B90AC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[6];

  v1 = v0;
  v2 = *v0;
  if (qword_2559741D0 != -1)
    swift_once();
  v3 = sub_2282B9F94();
  __swift_project_value_buffer(v3, (uint64_t)qword_255974248);
  v4 = sub_2282B9F7C();
  v5 = sub_2282BA018();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2282B3000, v4, v5, "XPC start discovery", v6, 2u);
    MEMORY[0x22E2AEA54](v6, -1, -1);
  }

  objc_msgSend(*(id *)((char *)v1 + *(_QWORD *)(*v1 + 112)), sel_invalidate);
  v7 = objc_msgSend(objc_allocWithZone((Class)DDDiscoverySession), sel_init);
  v8 = *(_QWORD *)(*v1 + 112);
  v9 = *(void **)((char *)v1 + v8);
  *(_QWORD *)((char *)v1 + v8) = v7;
  v10 = v7;

  v12[4] = sub_2282B9EA0;
  v12[5] = v1;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_2282B94AC;
  v12[3] = &block_descriptor_5;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setEventHandler_, v11);
  _Block_release(v11);
  (*(void (**)(id, _QWORD))(*(_QWORD *)(v2 + 88) + 16))(v10, *(_QWORD *)(v2 + 80));

}

void sub_2282B9270(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  if (qword_2559741D0 != -1)
    swift_once();
  v4 = sub_2282B9F94();
  __swift_project_value_buffer(v4, (uint64_t)qword_255974248);
  v5 = a1;
  v6 = sub_2282B9F7C();
  v7 = sub_2282BA018();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_2282BA024();
    *v9 = v5;

    _os_log_impl(&dword_2282B3000, v6, v7, "XPC report event: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559743C8);
    swift_arrayDestroy();
    MEMORY[0x22E2AEA54](v9, -1, -1);
    MEMORY[0x22E2AEA54](v8, -1, -1);

  }
  else
  {

  }
  v11 = *(void **)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 120));
  if (v11)
  {
    v12 = objc_msgSend(v11, sel_remoteObjectProxy);
    sub_2282BA030();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559743D8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v13 = objc_msgSend(v5, sel_createDADeviceEvent);
      objc_msgSend(v14, sel_reportEvent_, v13);
      swift_unknownObjectRelease();

    }
  }
}

void sub_2282B94AC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_2282B94FC(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;

  v3 = *v1;
  if (qword_2559741D0 != -1)
    swift_once();
  v4 = sub_2282B9F94();
  __swift_project_value_buffer(v4, (uint64_t)qword_255974248);
  v5 = a1;
  v6 = sub_2282B9F7C();
  v7 = sub_2282BA018();
  v20 = v3;
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_2282BA024();
    *v9 = v5;

    _os_log_impl(&dword_2282B3000, v6, v7, "XPC didReceiveDeviceChangedEvent %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559743C8);
    swift_arrayDestroy();
    MEMORY[0x22E2AEA54](v9, -1, -1);
    MEMORY[0x22E2AEA54](v8, -1, -1);

  }
  else
  {

  }
  v11 = objc_msgSend(v5, sel_device);
  v12 = sub_2282B98B8(v11);

  if (v12)
  {
    v13 = objc_msgSend(objc_allocWithZone((Class)DDDeviceEvent), sel_initWithEventType_device_, 42, v12);

    if (v13)
    {
      v14 = v5;
      v15 = sub_2282B9F7C();
      v16 = sub_2282BA018();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        v18 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v17 = 138412290;
        v19 = v14;
        sub_2282BA024();
        *v18 = v14;

        _os_log_impl(&dword_2282B3000, v15, v16, "XPC didReceiveDeviceChangedEvent converted to DDEvent %@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2559743C8);
        swift_arrayDestroy();
        MEMORY[0x22E2AEA54](v18, -1, -1);
        MEMORY[0x22E2AEA54](v17, -1, -1);
      }
      else
      {

        v15 = v14;
      }

      (*(void (**)(id, _QWORD))(*(_QWORD *)(v20 + 88) + 32))(v13, *(_QWORD *)(v20 + 80));
    }
  }
}

uint64_t DDDiscoveryExtensionConfiguration.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));

  return v0;
}

uint64_t DDDiscoveryExtensionConfiguration.__deallocating_deinit()
{
  DDDiscoveryExtensionConfiguration.deinit();
  return swift_deallocClassInstance();
}

void sub_2282B9894(void *a1)
{
  sub_2282B88EC(a1);
}

uint64_t sub_2282B98A8()
{
  return 1;
}

id sub_2282B98B8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  id v28;
  id v29;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  uint64_t v36;

  v2 = sub_2282B9F4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559743D0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2282B9F70();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(a1, sel_name);
  if (v13)
  {
    v35 = v5;
    v36 = sub_2282B9FF4();

    v14 = objc_msgSend(a1, sel_type);
    v15 = objc_msgSend(a1, sel_identifier);
    if (v15)
    {
      v16 = v15;
      v31 = v8;
      v32 = v3;
      v33 = v2;
      sub_2282B9FF4();
      v34 = v14;

      v17 = objc_msgSend(a1, sel_protocolType);
      sub_2282B9F64();

      v18 = objc_allocWithZone((Class)DDDevice);
      v19 = (void *)sub_2282B9FE8();
      swift_bridgeObjectRelease();
      v20 = (void *)sub_2282B9F58();
      v21 = (void *)sub_2282B9FE8();
      swift_bridgeObjectRelease();
      v13 = objc_msgSend(v18, sel_initWithDisplayName_category_protocolType_identifier_, v19, v34, v20, v21);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      v22 = objc_msgSend(a1, sel_bluetoothIdentifier);
      if (v22)
      {
        v23 = v35;
        sub_2282B9F40();

        v25 = v31;
        v24 = v32;
        v26 = v23;
        v27 = v33;
        (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v31, v26, v33);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v27);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v25, 1, v27) == 1)
        {
          v22 = 0;
        }
        else
        {
          v22 = (id)sub_2282B9F34();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v27);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v31, 1, 1, v33);
      }
      objc_msgSend(v13, sel_setBluetoothIdentifier_, v22);

      objc_msgSend(v13, sel_setState_, objc_msgSend(a1, sel_state));
      objc_msgSend(v13, sel_setSupportsGrouping_, objc_msgSend(a1, sel_supportsGrouping));
      objc_msgSend(v13, sel_setMediaPlaybackState_, objc_msgSend(a1, sel_mediaPlaybackState));
      v28 = objc_msgSend(a1, sel_mediaContentTitle);
      objc_msgSend(v13, sel_setMediaContentTitle_, v28);

      v29 = objc_msgSend(a1, sel_mediaContentArtistName);
      objc_msgSend(v13, sel_setMediaContentSubtitle_, v29);

    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v13;
}

void sub_2282B9CA0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject()
{
  JUMPOUT(0x22E2AE9E8);
}

uint64_t sub_2282B9CD8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2282B9D04()
{
  uint64_t v0;

  return sub_2282B8D38(*(void **)(v0 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2282B9D40(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2AEA00](&protocol conformance descriptor for DDDiscoveryExtensionConfiguration<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of DDDiscoveryExtension.startDiscovery(session:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DDDiscoveryExtension.stopDiscovery(session:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DDDiscoveryExtension.didReceiveEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_2282B9D88()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DDDiscoveryExtensionConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DDDiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of DDDiscoveryExtensionConfiguration.accept(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_2282B9E34()
{
  return swift_initClassMetadata2();
}

void sub_2282B9E78(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for DDDiscoveryExtensionConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x22E2AEA00);
}

void sub_2282B9EA0(void *a1)
{
  uint64_t v1;

  sub_2282B9270(a1, v1);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2AE9E8](a1, v6, a5);
}

uint64_t sub_2282B9F1C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2282B9F28()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2282B9F34()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2282B9F40()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2282B9F4C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2282B9F58()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_2282B9F64()
{
  return MEMORY[0x24BEE6260]();
}

uint64_t sub_2282B9F70()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2282B9F7C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2282B9F88()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2282B9F94()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2282B9FA0()
{
  return MEMORY[0x24BDDFEB8]();
}

uint64_t sub_2282B9FAC()
{
  return MEMORY[0x24BDDFF68]();
}

uint64_t sub_2282B9FB8()
{
  return MEMORY[0x24BDDFF80]();
}

uint64_t sub_2282B9FC4()
{
  return MEMORY[0x24BDE0128]();
}

uint64_t sub_2282B9FD0()
{
  return MEMORY[0x24BDE0130]();
}

uint64_t sub_2282B9FDC()
{
  return MEMORY[0x24BDE0140]();
}

uint64_t sub_2282B9FE8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2282B9FF4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2282BA000()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2282BA00C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2282BA018()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2282BA024()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2282BA030()
{
  return MEMORY[0x24BEE20A8]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CUAppendF()
{
  return MEMORY[0x24BE29110]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x24BE291B8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x24BE291F0]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x24BE29210]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x24BE29238]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x24BE29248]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x24BE29258]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x24BE29260]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x24BE29268]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x24BE29270]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x24BE29278]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x24BE29298]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x24BE292A0]();
}

uint64_t DAErrorF()
{
  return MEMORY[0x24BE2BEC0]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x24BE29680]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x24BDE0E38]();
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return MEMORY[0x24BDE0E80]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

