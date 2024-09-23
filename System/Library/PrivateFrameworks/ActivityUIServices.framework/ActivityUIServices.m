id _sceneComponentLogger()
{
  if (_sceneComponentLogger___once != -1)
    dispatch_once(&_sceneComponentLogger___once, &__block_literal_global);
  return (id)_sceneComponentLogger___instance;
}

void ___sceneComponentLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.activityuiservices", "sceneComponent");
  v1 = (void *)_sceneComponentLogger___instance;
  _sceneComponentLogger___instance = (uint64_t)v0;

}

void sub_22D80DE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

unint64_t activitySceneType(unint64_t result)
{
  if (result >= 4)
    return 1;
  return result;
}

unint64_t acuisSceneType(unint64_t result)
{
  if (result >= 4)
    return 1;
  return result;
}

id _logger()
{
  if (_logger___once[0] != -1)
    dispatch_once(_logger___once, &__block_literal_global_0);
  return (id)_logger___instance;
}

void ___logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.activityuiservices", "openApplicationAction");
  v1 = (void *)_logger___instance;
  _logger___instance = (uint64_t)v0;

}

void sub_22D80F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

double _CentroidOfTouches(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v2)
    goto LABEL_10;
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v18;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v1);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", 0);
      objc_msgSend(v10, "_convertPointToSceneReferenceSpace:");
      v12 = v11;
      v14 = v13;

      v6 = v6 + v12;
      v7 = v7 + v14;
    }
    v4 += v3;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v3);
  if (v4)
    v15 = v6 / (double)v4;
  else
LABEL_10:
    v15 = *MEMORY[0x24BDBEFB0];

  return v15;
}

const __CFString *NSStringFromACUISSizeDimensionRequestType(uint64_t a1)
{
  if (a1)
    return CFSTR("dynamic");
  else
    return CFSTR("fixed");
}

const __CFString *ACUISActivitySceneCommandDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_24F949A38[a1 - 1];
}

void *sub_22D812804()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  v2 = v1;
  return v1;
}

void sub_22D812888(void *a1)
{
  sub_22D813F1C(a1, (void (*)(_QWORD))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);

}

id sub_22D8128BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  *a2 = v2;
  return v2;
}

void sub_22D8128D4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_22D813F1C(v1, (void (*)(_QWORD))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);

}

void (*sub_22D812920(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D81297C;
}

void sub_22D81297C(uint64_t a1, char a2)
{
  sub_22D812E98(a1, a2, (void (*)(_QWORD))type metadata accessor for ActivityItemMetricsRequest);
}

id sub_22D812998()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
}

void sub_22D812A50(void *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v4;

}

id sub_22D812AE0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *a2 = v2;
  return v2;
}

void sub_22D812AF8(id *a1, uint64_t *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *a2;
  v3 = *a1;
  objc_msgSend(v3, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v5;

}

void (*sub_22D812B94(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D812BF0;
}

void sub_22D812BF0(uint64_t *a1, char a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v2 = *a1;
  v3 = *(void **)(*a1 + 32);
  v5 = *(_QWORD *)(*a1 + 48);
  v4 = *(_QWORD *)(*a1 + 56);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    objc_msgSend(v6, sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityItemMetricsRequest();
    swift_dynamicCast();
    v7 = *(void **)(v5 + v4);
    *(_QWORD *)(v5 + v4) = *(_QWORD *)(v2 + 40);

  }
  else
  {
    objc_msgSend(*(id *)(*a1 + 32), sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityItemMetricsRequest();
    swift_dynamicCast();
    v8 = *(void **)(v5 + v4);
    *(_QWORD *)(v5 + v4) = *(_QWORD *)(v2 + 40);

  }
  free((void *)v2);
}

void *sub_22D812D14()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  v2 = v1;
  return v1;
}

void sub_22D812D98(void *a1)
{
  sub_22D813F1C(a1, (void (*)(_QWORD))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);

}

id sub_22D812DCC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  *a2 = v2;
  return v2;
}

void sub_22D812DE4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_22D813F1C(v1, (void (*)(_QWORD))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);

}

void (*sub_22D812E30(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D812E8C;
}

void sub_22D812E8C(uint64_t a1, char a2)
{
  sub_22D812E98(a1, a2, (void (*)(_QWORD))type metadata accessor for SystemApertureMetricsRequest);
}

void sub_22D812E98(uint64_t a1, char a2, void (*a3)(_QWORD))
{
  _QWORD *v4;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      objc_msgSend(v5, sel_copy);
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      a3(0);
      v6 = swift_dynamicCast();
      v7 = v4[5];
      if (!v6)
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v11 = v4[6];
    v10 = v4[7];
    v12 = *(void **)(v11 + v10);
    *(_QWORD *)(v11 + v10) = v7;

    v13 = (void *)v4[4];
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)a1 + 32), sel_copy);
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      a3(0);
      v8 = swift_dynamicCast();
      v9 = v4[5];
      if (!v8)
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v15 = v4[6];
    v14 = v4[7];
    v13 = *(void **)(v15 + v14);
    *(_QWORD *)(v15 + v14) = v9;

  }
  free(v4);
}

id ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  objc_super v18;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v9 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  v10 = *(void **)&v7[v9];
  *(_QWORD *)&v7[v9] = a2;
  v11 = v7;
  v12 = a1;
  v13 = a2;

  v14 = *(void **)&v7[v8];
  *(_QWORD *)&v7[v8] = a3;
  v15 = a3;

  v18.receiver = v11;
  v18.super_class = v3;
  v16 = objc_msgSendSuper2(&v18, sel_init);

  return v16;
}

id ActivityMetricsRequest.init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)(void *a1, void *a2, void *a3)
{
  id v6;

  v6 = sub_22D813FBC(a1, a2, a3);

  return v6;
}

id ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:)(void *a1, void *a2)
{
  objc_class *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v7 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  v8 = *(void **)&v5[v7];
  *(_QWORD *)&v5[v7] = a2;
  v9 = v5;
  v10 = a1;
  v11 = a2;

  v12 = *(void **)&v5[v6];
  *(_QWORD *)&v5[v6] = 0;

  v15.receiver = v9;
  v15.super_class = v2;
  v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

id ActivityMetricsRequest.init(lockScreenMetrics:systemApertureMetrics:)(void *a1, void *a2)
{
  id v4;

  v4 = sub_22D81406C(a1, a2);

  return v4;
}

uint64_t sub_22D8132BC(char a1)
{
  uint64_t result;

  result = 0xD000000000000011;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000015;
    else
      return 0x4D746E6569626D61;
  }
  return result;
}

uint64_t sub_22D813358()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics), sel_hash);
  if (result >= 1)
    v2 = 1;
  else
    v2 = result;
  v3 = 23 * v2;
  if ((unsigned __int128)(v2 * (__int128)23) >> 64 != (23 * v2) >> 63)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v4 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  if (v4)
    result = (uint64_t)objc_msgSend(v4, sel_hash);
  else
    result = 1;
  v5 = v3 * result;
  if ((unsigned __int128)(v3 * (__int128)result) >> 64 != (v3 * result) >> 63)
    goto LABEL_15;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  if (v6)
    result = (uint64_t)objc_msgSend(v6, sel_hash);
  else
    result = 1;
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 == (v5 * result) >> 63)
  {
    result *= v5;
    return result;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_22D81341C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v19;
  char *v20;
  _BYTE v21[24];
  uint64_t v22;

  v2 = v1;
  sub_22D81410C(a1, (uint64_t)v21);
  if (!v22)
  {
    sub_22D814194((uint64_t)v21);
    goto LABEL_14;
  }
  type metadata accessor for ActivityMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v17 = 0;
    return v17 & 1;
  }
  sub_22D8141F4();
  v3 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics];
  v4 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  v5 = v3;
  v6 = sub_22D84B76C();

  if ((v6 & 1) == 0)
    goto LABEL_13;
  v7 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  v8 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics];
  if (!v7)
  {
    if (!v8)
      goto LABEL_10;
LABEL_13:

    goto LABEL_14;
  }
  if (!v8)
    goto LABEL_13;
  type metadata accessor for SystemApertureMetricsRequest();
  v9 = v8;
  v10 = v7;
  v11 = sub_22D84B76C();

  if ((v11 & 1) == 0)
    goto LABEL_13;
LABEL_10:
  v12 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  v13 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics];
  if (!v12)
  {
    v19 = v13;

    if (!v13)
    {
      v17 = 1;
      return v17 & 1;
    }

    goto LABEL_14;
  }
  if (!v13)
    goto LABEL_13;
  type metadata accessor for ActivityItemMetricsRequest();
  v14 = v12;
  v15 = v13;
  v16 = v14;
  v17 = sub_22D84B76C();

  return v17 & 1;
}

id sub_22D813684()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;
    v3 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
    v4 = (void *)sub_22D84B5BC();

    v5 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
    v6 = (void *)sub_22D84B5BC();

    v7 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
    v8 = (void *)sub_22D84B5BC();

    result = objc_msgSend(v2, sel_build);
    if (result)
    {
      v9 = result;
      v10 = sub_22D84B5C8();

      return (id)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id ActivityMetricsRequest.__allocating_init(xpcDictionary:)()
{
  objc_class *v0;
  id v1;
  id v2;

  v1 = objc_allocWithZone(v0);
  v2 = sub_22D814230();
  swift_unknownObjectRelease();
  return v2;
}

id ActivityMetricsRequest.init(xpcDictionary:)()
{
  id v0;

  v0 = sub_22D814230();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_22D8138EC(uint64_t result)
{
  if (result)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  return result;
}

void sub_22D8139BC(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  objc_super v20;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  v6 = (objc_class *)type metadata accessor for ActivityMetricsRequest();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v9 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v3;
  v10 = *(void **)&v7[v9];
  *(_QWORD *)&v7[v9] = v4;
  v11 = v3;
  v12 = v4;
  v13 = v11;
  v14 = v12;
  v15 = v5;
  v16 = v7;

  v17 = *(void **)&v7[v8];
  *(_QWORD *)&v7[v8] = v5;
  v18 = v15;

  v20.receiver = v16;
  v20.super_class = v6;
  v19 = objc_msgSendSuper2(&v20, sel_init);

  a1[3] = v6;
  *a1 = v19;
}

uint64_t static ActivityMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D813B38(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  v4 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)sub_22D84B5BC();
    objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);

  }
  v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  if (v8)
  {
    v9 = v8;
    v10 = (id)sub_22D84B5BC();
    objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  }
}

id ActivityMetricsRequest.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D814474(a1);

  return v4;
}

id ActivityMetricsRequest.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D814474(a1);

  return v2;
}

id ActivityMetricsRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityMetricsRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityMetricsRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_22D813E6C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_22D813E80(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_22D813E88@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_22D813E9C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_22D813ECC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_22D813EE0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_22D813EF4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_22D813F04(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_22D813F10@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_22D813F1C(void *a1, void (*a2)(_QWORD), _QWORD *a3)
{
  uint64_t v3;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    objc_msgSend(a1, sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    a2(0);
    v6 = swift_dynamicCast();
    v7 = v9;
    if (!v6)
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(void **)(v3 + *a3);
  *(_QWORD *)(v3 + *a3) = v7;

}

id sub_22D813FBC(void *a1, void *a2, void *a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  objc_super v16;

  v7 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  v9 = *(void **)&v3[v8];
  *(_QWORD *)&v3[v8] = a2;
  v10 = v3;
  v11 = a1;
  v12 = a2;

  v13 = *(void **)&v3[v7];
  *(_QWORD *)&v3[v7] = a3;
  v14 = a3;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v16, sel_init);
}

id sub_22D81406C(void *a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v5 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v6 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  v7 = *(void **)&v2[v6];
  *(_QWORD *)&v2[v6] = a2;
  v8 = v2;
  v9 = a1;
  v10 = a2;

  v11 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = 0;

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t sub_22D81410C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31817C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22D814194(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ActivityMetricsRequest()
{
  return objc_opt_self();
}

unint64_t sub_22D8141F4()
{
  unint64_t result;

  result = qword_2540C5FD0;
  if (!qword_2540C5FD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C5FD0);
  }
  return result;
}

id sub_22D814230()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[24];
  uint64_t v17;

  v1 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v2 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  v3 = v0;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  sub_22D81494C((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      v4 = v12;
      goto LABEL_9;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v16);
  }
  v4 = sub_22D844DE0();
LABEL_9:
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v4;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  sub_22D81494C((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for SystemApertureMetricsRequest();
    v5 = swift_dynamicCast();
    v6 = v12;
    if (!v5)
      v6 = 0;
  }
  else
  {
    sub_22D814194((uint64_t)v16);
    v6 = 0;
  }
  v7 = *(void **)&v0[v2];
  *(_QWORD *)&v0[v2] = v6;

  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  sub_22D81494C((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    v8 = swift_dynamicCast();
    v9 = v12;
    if (!v8)
      v9 = 0;
  }
  else
  {
    sub_22D814194((uint64_t)v16);
    v9 = 0;
  }
  v10 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = v9;

  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_22D814474(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  objc_super v16;

  v2 = v1;
  v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  v5 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  type metadata accessor for ActivityItemMetricsRequest();
  v6 = v2;
  v7 = sub_22D84B748();
  if (!v7)
  {
    sub_22D814908();
    v8 = (void *)swift_allocError();
    *v9 = 0xD000000000000013;
    v9[1] = 0x800000022D850A80;
    v10 = (void *)sub_22D84B250();

    objc_msgSend(a1, sel_failWithError_, v10);
    v7 = (uint64_t)sub_22D844DE0();
  }
  *(_QWORD *)&v6[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v7;
  type metadata accessor for SystemApertureMetricsRequest();
  v11 = sub_22D84B748();
  if (v11)
  {
    v12 = *(void **)&v2[v5];
    *(_QWORD *)&v2[v5] = v11;

  }
  v13 = sub_22D84B748();
  v14 = v6;
  if (v13)
  {
    v14 = *(char **)&v2[v4];
    *(_QWORD *)&v2[v4] = v13;

  }
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t method lookup function for ActivityMetricsRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t sub_22D814794(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_22D8147D4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22D8147F4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_22D8149A8(a1, (unint64_t *)&unk_2540C62F0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22D814840(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22D814860(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_22D8149A8(a1, &qword_2540C6218);
}

void type metadata accessor for ACUISActivitySceneCommand(uint64_t a1)
{
  sub_22D8149A8(a1, (unint64_t *)&unk_255D96DF0);
}

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
  sub_22D8149A8(a1, &qword_2540C5F88);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_22D814908()
{
  unint64_t result;

  result = qword_255D96E60;
  if (!qword_255D96E60)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityUIServicesError, &type metadata for ActivityUIServicesError);
    atomic_store(result, (unint64_t *)&qword_255D96E60);
  }
  return result;
}

uint64_t sub_22D81494C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_22D8149A8(a1, &qword_255D96E68);
}

void sub_22D8149A8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

id sub_22D814A5C()
{
  return sub_22D814DA4(type metadata accessor for ActivityAmbientSceneExtension);
}

uint64_t type metadata accessor for ActivityAmbientSceneExtension()
{
  return objc_opt_self();
}

id sub_22D814ADC()
{
  return sub_22D814DA4(type metadata accessor for ActivitySceneSpecificationBase);
}

uint64_t type metadata accessor for ActivitySceneSpecificationBase()
{
  return objc_opt_self();
}

id sub_22D814B30()
{
  return sub_22D814DA4(type metadata accessor for ActivityListItemSceneSpecification);
}

uint64_t type metadata accessor for ActivityListItemSceneSpecification()
{
  return objc_opt_self();
}

id sub_22D814B84()
{
  return sub_22D814DA4(type metadata accessor for ActivityBannerSceneSpecification);
}

uint64_t type metadata accessor for ActivityBannerSceneSpecification()
{
  return objc_opt_self();
}

id sub_22D814BD8()
{
  return sub_22D814DA4(type metadata accessor for ActivitySystemApertureSceneSpecification);
}

uint64_t type metadata accessor for ActivitySystemApertureSceneSpecification()
{
  return objc_opt_self();
}

id sub_22D814C9C()
{
  return sub_22D814DA4(type metadata accessor for ActivityAmbientSceneSpecification);
}

uint64_t type metadata accessor for ActivityAmbientSceneSpecification()
{
  return objc_opt_self();
}

id sub_22D814CE4(void *a1, uint64_t a2, uint64_t *a3, id *a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *a3;
  v6 = a1;
  if (v5 != -1)
    swift_once();
  v7 = *a4;

  return v7;
}

id sub_22D814D5C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_22D814D98()
{
  return sub_22D814DA4(type metadata accessor for ActivityAmbientCompactSceneSpecification);
}

id sub_22D814DA4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientCompactSceneSpecification()
{
  return objc_opt_self();
}

_QWORD *sub_22D814DF4()
{
  NSString *v0;
  Class v1;
  uint64_t ObjCClassMetadata;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;

  v0 = (NSString *)sub_22D84B5BC();
  v1 = NSClassFromString(v0);

  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v3 = sub_22D8312D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v5 = v3[2];
  v4 = v3[3];
  if (v5 >= v4 >> 1)
    v3 = sub_22D8312D4((_QWORD *)(v4 > 1), v5 + 1, 1, v3);
  v3[2] = v5 + 1;
  v3[v5 + 4] = ObjCClassMetadata;
  return v3;
}

uint64_t ArchivedActivityFamily.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6D756964656DLL;
  else
    return 0x6C6C616D73;
}

ActivityUIServices::ArchivedActivityFamily_optional __swiftcall ArchivedActivityFamily.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (ActivityUIServices::ArchivedActivityFamily_optional)rawValue;
}

uint64_t ArchivedActivityFamily.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_22D814F0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_22D814F28()
{
  unint64_t result;

  result = qword_255D96FA0;
  if (!qword_255D96FA0)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ArchivedActivityFamily, &type metadata for ArchivedActivityFamily);
    atomic_store(result, (unint64_t *)&qword_255D96FA0);
  }
  return result;
}

uint64_t sub_22D814F6C()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t sub_22D814FB0()
{
  return sub_22D84BA3C();
}

uint64_t sub_22D814FD8()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

_QWORD *sub_22D815018@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_22D815038(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_22D815044()
{
  sub_22D815270();
  return sub_22D84B61C();
}

uint64_t sub_22D8150A0()
{
  sub_22D815270();
  return sub_22D84B610();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArchivedActivityFamily(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ArchivedActivityFamily(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22D8151D8 + 4 * byte_22D84E255[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D81520C + 4 * asc_22D84E250[v4]))();
}

uint64_t sub_22D81520C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D815214(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D81521CLL);
  return result;
}

uint64_t sub_22D815228(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D815230);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D815234(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D81523C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D815248(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D815254(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArchivedActivityFamily()
{
  return &type metadata for ArchivedActivityFamily;
}

unint64_t sub_22D815270()
{
  unint64_t result;

  result = qword_255D96FA8;
  if (!qword_255D96FA8)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ArchivedActivityFamily, &type metadata for ArchivedActivityFamily);
    atomic_store(result, (unint64_t *)&qword_255D96FA8);
  }
  return result;
}

uint64_t AnimationDemoAttributes.ContentState.value.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AnimationDemoAttributes.ContentState.value.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AnimationDemoAttributes.ContentState.value.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::AnimationDemoAttributes::ContentState __swiftcall AnimationDemoAttributes.ContentState.init(value:)(ActivityUIServices::AnimationDemoAttributes::ContentState value)
{
  ActivityUIServices::AnimationDemoAttributes::ContentState *v1;

  v1->value = value.value;
  return value;
}

uint64_t AnimationDemoAttributes.ContentState.hash(into:)()
{
  return sub_22D84BA3C();
}

BOOL static AnimationDemoAttributes.ContentState.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D815318()
{
  return 1;
}

uint64_t sub_22D815320()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t sub_22D815360()
{
  return sub_22D84BA3C();
}

uint64_t sub_22D815384()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t sub_22D8153C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D815F50(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D8153EC()
{
  return 0;
}

void sub_22D8153F8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22D815404()
{
  sub_22D81553C();
  return sub_22D84BAC0();
}

uint64_t sub_22D81542C()
{
  sub_22D81553C();
  return sub_22D84BACC();
}

uint64_t AnimationDemoAttributes.ContentState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D96FB0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D81553C();
  sub_22D84BAA8();
  sub_22D84B958();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_22D81553C()
{
  unint64_t result;

  result = qword_255D96FB8;
  if (!qword_255D96FB8)
  {
    result = MEMORY[0x22E318194](&unk_22D84E6E8, &type metadata for AnimationDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D96FB8);
  }
  return result;
}

uint64_t AnimationDemoAttributes.ContentState.hashValue.getter()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t AnimationDemoAttributes.ContentState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D96FC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D81553C();
  sub_22D84BA9C();
  if (!v2)
  {
    v9 = sub_22D84B934();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_22D8156C8()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t sub_22D81570C()
{
  return sub_22D84BA3C();
}

uint64_t sub_22D815734()
{
  sub_22D84BA30();
  sub_22D84BA3C();
  return sub_22D84BA78();
}

uint64_t sub_22D815774@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AnimationDemoAttributes.ContentState.init(from:)(a1, a2);
}

uint64_t sub_22D815788(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D96FB0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D81553C();
  sub_22D84BAA8();
  sub_22D84B958();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_22D815874()
{
  return 0;
}

uint64_t sub_22D815880@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_22D8158AC()
{
  sub_22D8159C0();
  return sub_22D84BAC0();
}

uint64_t sub_22D8158D4()
{
  sub_22D8159C0();
  return sub_22D84BACC();
}

uint64_t AnimationDemoAttributes.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D96FC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D8159C0();
  sub_22D84BAA8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_22D8159C0()
{
  unint64_t result;

  result = qword_255D96FD0;
  if (!qword_255D96FD0)
  {
    result = MEMORY[0x22E318194](&unk_22D84E698, &type metadata for AnimationDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D96FD0);
  }
  return result;
}

uint64_t AnimationDemoAttributes.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

unint64_t sub_22D815A2C()
{
  unint64_t result;

  result = qword_255D96FD8;
  if (!qword_255D96FD8)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes.ContentState, &type metadata for AnimationDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D96FD8);
  }
  return result;
}

unint64_t sub_22D815A74()
{
  unint64_t result;

  result = qword_255D96FE0;
  if (!qword_255D96FE0)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes, &type metadata for AnimationDemoAttributes);
    atomic_store(result, (unint64_t *)&qword_255D96FE0);
  }
  return result;
}

unint64_t sub_22D815ABC()
{
  unint64_t result;

  result = qword_255D96FE8;
  if (!qword_255D96FE8)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes, &type metadata for AnimationDemoAttributes);
    atomic_store(result, (unint64_t *)&qword_255D96FE8);
  }
  return result;
}

unint64_t sub_22D815B04()
{
  unint64_t result;

  result = qword_255D96FF0;
  if (!qword_255D96FF0)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes.ContentState, &type metadata for AnimationDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D96FF0);
  }
  return result;
}

unint64_t sub_22D815B4C()
{
  unint64_t result;

  result = qword_255D96FF8;
  if (!qword_255D96FF8)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes.ContentState, &type metadata for AnimationDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D96FF8);
  }
  return result;
}

unint64_t sub_22D815B94()
{
  unint64_t result;

  result = qword_255D97000;
  if (!qword_255D97000)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for AnimationDemoAttributes.ContentState, &type metadata for AnimationDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D97000);
  }
  return result;
}

uint64_t sub_22D815BD8(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_22D815BFC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D96FC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D8159C0();
  sub_22D84BAA8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes()
{
  return &type metadata for AnimationDemoAttributes;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.ContentState()
{
  return &type metadata for AnimationDemoAttributes.ContentState;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.CodingKeys()
{
  return &type metadata for AnimationDemoAttributes.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AnimationDemoAttributes.ContentState.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for AnimationDemoAttributes.ContentState.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_22D815D84 + 4 * byte_22D84E3D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D815DA4 + 4 * byte_22D84E3D5[v4]))();
}

_BYTE *sub_22D815D84(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D815DA4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D815DAC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D815DB4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D815DBC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D815DC4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_22D815DD0()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.ContentState.CodingKeys()
{
  return &type metadata for AnimationDemoAttributes.ContentState.CodingKeys;
}

unint64_t sub_22D815DEC()
{
  unint64_t result;

  result = qword_255D97008;
  if (!qword_255D97008)
  {
    result = MEMORY[0x22E318194](&unk_22D84E620, &type metadata for AnimationDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97008);
  }
  return result;
}

unint64_t sub_22D815E34()
{
  unint64_t result;

  result = qword_255D97010;
  if (!qword_255D97010)
  {
    result = MEMORY[0x22E318194](&unk_22D84E648, &type metadata for AnimationDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97010);
  }
  return result;
}

unint64_t sub_22D815E7C()
{
  unint64_t result;

  result = qword_255D97018;
  if (!qword_255D97018)
  {
    result = MEMORY[0x22E318194](&unk_22D84E670, &type metadata for AnimationDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97018);
  }
  return result;
}

unint64_t sub_22D815EC4()
{
  unint64_t result;

  result = qword_255D97020;
  if (!qword_255D97020)
  {
    result = MEMORY[0x22E318194](&unk_22D84E590, &type metadata for AnimationDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97020);
  }
  return result;
}

unint64_t sub_22D815F0C()
{
  unint64_t result;

  result = qword_255D97028;
  if (!qword_255D97028)
  {
    result = MEMORY[0x22E318194](&unk_22D84E5B8, &type metadata for AnimationDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97028);
  }
  return result;
}

uint64_t sub_22D815F50(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D84B994();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D815FCC()
{
  return 0x65756C6176;
}

id sub_22D81604C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CancellableAssertion()
{
  return objc_opt_self();
}

uint64_t sub_22D8160B0()
{
  swift_retain();
  sub_22D84B4D8();
  return swift_release();
}

id ActivityListItemHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:)(char *a1, void *a2)
{
  objc_class *v2;
  objc_class *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  objc_class *v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  void (*v19)(char *, uint64_t);
  id v20;
  objc_super v22;

  v3 = v2;
  v6 = sub_22D84B340();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v3);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v10(v9, (uint64_t)a1, v6);
  v11 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = sub_22D84B334();
  v14 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v14 = v13;
  v14[1] = v15;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 0;
  sub_22D816680();
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v10(&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v9, v6);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v16 = &v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = a2;

  v22.receiver = v12;
  v22.super_class = v11;
  v18 = objc_msgSendSuper2(&v22, sel_init);
  v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v9, v6);
  v20 = ActivityHostViewController.init(activitySceneDescriptor:)(v18);

  v19(a1, v6);
  return v20;
}

id ActivityListItemHostViewController.init(activityDescriptor:systemMetricsRequest:)(char *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  objc_class *v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void (*v17)(char *, uint64_t);
  id v18;
  objc_super v20;

  v4 = sub_22D84B340();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, (uint64_t)a1, v4);
  v9 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = sub_22D84B334();
  v12 = (uint64_t *)&v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v12 = v11;
  v12[1] = v13;
  *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 0;
  sub_22D816680();
  *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v8(&v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v7, v4);
  *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v14 = &v10[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = a2;

  v20.receiver = v10;
  v20.super_class = v9;
  v16 = objc_msgSendSuper2(&v20, sel_init);
  v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v7, v4);
  v18 = ActivityHostViewController.init(activitySceneDescriptor:)(v16);

  v17(a1, v4);
  return v18;
}

id sub_22D81652C()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityListItemSceneSpecification()), sel_init);
}

unint64_t sub_22D816550()
{
  return 0xD000000000000014;
}

void ActivityListItemHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivityListItemHostViewController.init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityListItemHostViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityListItemHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22D816680()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2540C5E78;
  if (!qword_2540C5E78)
  {
    v1 = sub_22D84B340();
    result = MEMORY[0x22E318194](MEMORY[0x24BDB47A0], v1);
    atomic_store(result, (unint64_t *)&qword_2540C5E78);
  }
  return result;
}

uint64_t type metadata accessor for ActivityListItemHostViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActivityListItemHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityListItemHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1496))();
}

unint64_t static ActivityAlertClientError.errorDomain.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t ActivityAlertClientError.errorCode.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 1001;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

uint64_t ActivityAlertClientError.errorDescription.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 0xD000000000000012;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

uint64_t ActivityAlertClientError.init(rawValue:)()
{
  return 0;
}

unint64_t static ActivityAlertClientError._nsErrorDomain.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_22D8167D4()
{
  sub_22D84BA30();
  sub_22D84B5A4();
  return sub_22D84BA78();
}

uint64_t sub_22D816834()
{
  sub_22D817738();
  return sub_22D84B22C();
}

uint64_t sub_22D81686C()
{
  sub_22D84BA30();
  sub_22D84B5A4();
  return sub_22D84BA78();
}

_QWORD *sub_22D8168C8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 0;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

unint64_t sub_22D8168E0()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_22D8168FC()
{
  _QWORD *v0;
  uint64_t result;

  if (!*v0)
    return 1001;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

uint64_t sub_22D816940()
{
  _QWORD *v0;
  uint64_t result;

  if (!*v0)
    return 0xD000000000000012;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

uint64_t sub_22D8169A0()
{
  sub_22D817738();
  return sub_22D84B244();
}

uint64_t sub_22D8169C8()
{
  sub_22D817738();
  return sub_22D84B238();
}

unint64_t sub_22D8169F8()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_22D816A14()
{
  sub_22D817738();
  return sub_22D84B220();
}

uint64_t sub_22D816A9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  return MEMORY[0x22E31826C](v1);
}

uint64_t sub_22D816B34()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_22D816B8C(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22E31826C](v5);
  return sub_22D816BFC;
}

void sub_22D816BFC(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id ActivityAlertClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *ActivityAlertClient.init()()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  char *v4;
  void *v5;
  char *v6;
  id v7;
  objc_super v9;

  swift_unknownObjectWeakInit();
  v1 = objc_allocWithZone((Class)sub_22D84B394());
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_alertClient] = v3;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ActivityAlertClient();
  v4 = (char *)objc_msgSendSuper2(&v9, sel_init);
  v5 = *(void **)&v4[OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_alertClient];
  sub_22D816D74();
  v6 = v4;
  v7 = v5;
  sub_22D84B388();

  return v6;
}

uint64_t type metadata accessor for ActivityAlertClient()
{
  return objc_opt_self();
}

unint64_t sub_22D816D74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2540C5E80;
  if (!qword_2540C5E80)
  {
    v1 = type metadata accessor for ActivityAlertClient();
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClient, v1);
    atomic_store(result, (unint64_t *)&qword_2540C5E80);
  }
  return result;
}

id ActivityAlertClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAlertClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void ActivityAlertClient.presentAlert(activityIdentifier:payload:options:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock[9];

  v7 = v6;
  v33 = a6;
  v34 = a5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255D96C28 != -1)
    swift_once();
  v15 = sub_22D84B49C();
  __swift_project_value_buffer(v15, (uint64_t)qword_255D97570);
  swift_bridgeObjectRetain_n();
  v16 = sub_22D84B484();
  v17 = sub_22D84B6DC();
  if (os_log_type_enabled(v16, v17))
  {
    v32 = v7;
    v18 = swift_slowAlloc();
    v31[1] = a4;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136315138;
    swift_bridgeObjectRetain();
    aBlock[6] = sub_22D83157C(a1, a2, aBlock);
    v7 = v32;
    sub_22D84B79C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D80B000, v16, v17, "[Activity: %s] Presenting alert", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v20, -1, -1);
    MEMORY[0x22E318218](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v21 = (void *)sub_22D84B43C();
  v22 = sub_22D84B3E8();
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v14, a3, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, v22);
  v24 = objc_allocWithZone((Class)type metadata accessor for ActivityAlertProvider());
  v25 = sub_22D81AD34(a1, a2, 0, v21, (uint64_t)v14);

  v26 = v7 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  v27 = MEMORY[0x22E31826C](v26);
  if (v27)
  {
    v28 = (void *)v27;
    aBlock[4] = v34;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_22D827B8C;
    aBlock[3] = (uint64_t)&block_descriptor;
    v29 = _Block_copy(aBlock);
    v30 = v25;
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_activityWithAlertClient_presentAlertProvider_completion_, v7, v30, v29);
    swift_unknownObjectRelease();

    _Block_release(v29);
  }

}

Swift::Void __swiftcall ActivityAlertClient.dismissAlert(activityIdentifier:)(Swift::String activityIdentifier)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19[3];

  v2 = v1;
  object = activityIdentifier._object;
  countAndFlagsBits = activityIdentifier._countAndFlagsBits;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255D96C28 != -1)
    swift_once();
  v8 = sub_22D84B49C();
  __swift_project_value_buffer(v8, (uint64_t)qword_255D97570);
  swift_bridgeObjectRetain_n();
  v9 = sub_22D84B484();
  v10 = sub_22D84B6DC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19[0] = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    v18 = sub_22D83157C(countAndFlagsBits, (unint64_t)object, v19);
    sub_22D84B79C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D80B000, v9, v10, "[Activity: %s] Dismissing alert", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v12, -1, -1);
    MEMORY[0x22E318218](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v13 = sub_22D84B3E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  v14 = objc_allocWithZone((Class)type metadata accessor for ActivityAlertProvider());
  swift_bridgeObjectRetain();
  v15 = sub_22D81AD34(countAndFlagsBits, (uint64_t)object, (char *)1, 0, (uint64_t)v7);
  v16 = v2 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  v17 = (void *)MEMORY[0x22E31826C](v16);
  if (v17)
  {
    objc_msgSend(v17, sel_activityWithAlertClient_dismissAlertProvider_, v2, v15);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

unint64_t sub_22D817450()
{
  unint64_t result;

  result = qword_255D97050;
  if (!qword_255D97050)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97050);
  }
  return result;
}

unint64_t sub_22D817498()
{
  unint64_t result;

  result = qword_255D97058;
  if (!qword_255D97058)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97058);
  }
  return result;
}

unint64_t sub_22D8174E0()
{
  unint64_t result;

  result = qword_255D97060;
  if (!qword_255D97060)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97060);
  }
  return result;
}

unint64_t sub_22D817528()
{
  unint64_t result;

  result = qword_255D97068;
  if (!qword_255D97068)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97068);
  }
  return result;
}

unint64_t sub_22D817570()
{
  unint64_t result;

  result = qword_255D97070;
  if (!qword_255D97070)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97070);
  }
  return result;
}

unint64_t sub_22D8175B8()
{
  unint64_t result;

  result = qword_255D97078;
  if (!qword_255D97078)
  {
    result = MEMORY[0x22E318194](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255D97078);
  }
  return result;
}

uint64_t sub_22D8175FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  result = MEMORY[0x22E31826C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_22D817650()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

ValueMetadata *type metadata accessor for ActivityAlertClientError()
{
  return &type metadata for ActivityAlertClientError;
}

uint64_t method lookup function for ActivityAlertClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_22D817714(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_22D817738()
{
  unint64_t result;

  result = qword_255D97080;
  if (!qword_255D97080)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertClientError, &type metadata for ActivityAlertClientError);
    atomic_store(result, (unint64_t *)&qword_255D97080);
  }
  return result;
}

id ActivityAmbientCompactHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  objc_class *v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  void (*v23)(char *, uint64_t);
  id v24;
  _QWORD v26[2];
  objc_super v27;

  v5 = v4;
  v10 = sub_22D84B340();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = objc_allocWithZone(v5);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, (uint64_t)a1, v10);
  v15 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v16 = (char *)objc_allocWithZone(v15);
  v17 = sub_22D84B334();
  v18 = (uint64_t *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v18 = v17;
  v18[1] = v19;
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 3;
  sub_22D816680();
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v14(&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v13, v10);
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v20 = &v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v20 = a3;
  *((_QWORD *)v20 + 1) = a4;
  v21 = a2;

  v27.receiver = v16;
  v27.super_class = v15;
  v22 = objc_msgSendSuper2(&v27, sel_init);
  v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v13, v10);
  v24 = ActivityHostViewController.init(activitySceneDescriptor:)(v22);

  v23(a1, v10);
  return v24;
}

id ActivityAmbientCompactHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  objc_class *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  void (*v21)(char *, uint64_t);
  id v22;
  uint64_t v24;
  objc_super v25;

  v8 = sub_22D84B340();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, (uint64_t)a1, v8);
  v13 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = sub_22D84B334();
  v16 = (uint64_t *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v16 = v15;
  v16[1] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 3;
  sub_22D816680();
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v12(&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v11, v8);
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v18 = &v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  v19 = a2;

  v25.receiver = v14;
  v25.super_class = v13;
  v20 = objc_msgSendSuper2(&v25, sel_init);
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v22 = ActivityHostViewController.init(activitySceneDescriptor:)(v20);

  v21(a1, v8);
  return v22;
}

id sub_22D817C04()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityAmbientCompactSceneSpecification()), sel_init);
}

unint64_t sub_22D817C28()
{
  return 0xD000000000000018;
}

void ActivityAmbientCompactHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivityAmbientCompactHostViewController.init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityAmbientCompactHostViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAmbientCompactHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientCompactHostViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActivityAmbientCompactHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAmbientCompactHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1496))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ProcessResource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessResource()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ProcessResource(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ProcessResource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessResource(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessResource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessResource()
{
  return &type metadata for ProcessResource;
}

id sub_22D817EC4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  objc_class *v15;
  objc_class *v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31[2];

  if ((a1 != 0xD000000000000011 || a2 != 0x800000022D851580) && (sub_22D84B994() & 1) == 0)
  {
    v10 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    swift_bridgeObjectRetain();
    v11 = sub_22D819E88(a1, a2, 0);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v12, sel_identities);
      sub_22D819F60(0, &qword_2540C5F98);
      v14 = sub_22D84B640();

      if (v14 >> 62)
      {
        swift_bridgeObjectRetain();
        v23 = sub_22D84B8D4();
        swift_bridgeObjectRelease();
        if (v23 == 1)
        {
          swift_bridgeObjectRetain();
          v24 = sub_22D84B8D4();
          swift_bridgeObjectRelease();
          if (v24)
            goto LABEL_12;
          swift_bridgeObjectRelease();
          if (qword_255D962B0 != -1)
            swift_once();
          v25 = sub_22D84B49C();
          __swift_project_value_buffer(v25, (uint64_t)qword_255D96370);
          swift_bridgeObjectRetain_n();
          v14 = sub_22D84B484();
          v26 = sub_22D84B6D0();
          if (!os_log_type_enabled((os_log_t)v14, v26))
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
            goto LABEL_34;
          }
          v27 = (uint8_t *)swift_slowAlloc();
          v28 = (void *)swift_slowAlloc();
          v31[0] = v28;
          *(_DWORD *)v27 = 136380675;
          swift_bridgeObjectRetain();
          sub_22D83157C(a1, a2, (uint64_t *)v31);
          sub_22D84B79C();
          swift_bridgeObjectRelease_n();
          v29 = "No lsIdentity found for bundle identifier: %{private}s";
LABEL_33:
          _os_log_impl(&dword_22D80B000, (os_log_t)v14, v26, v29, v27, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E318218](v28, -1, -1);
          MEMORY[0x22E318218](v27, -1, -1);

LABEL_34:
          return 0;
        }
      }
      else if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      {
LABEL_12:
        if ((v14 & 0xC000000000000001) != 0)
        {
          v15 = (objc_class *)MEMORY[0x22E317918](0, v14);
          goto LABEL_15;
        }
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v15 = (objc_class *)*(id *)(v14 + 32);
LABEL_15:
          v16 = v15;
          swift_bridgeObjectRelease();
          v9 = objc_msgSend((id)objc_opt_self(), sel_identityForLSApplicationIdentity_LSApplicationRecord_, v16, v12);

          return v9;
        }
        __break(1u);
        goto LABEL_39;
      }
      swift_bridgeObjectRelease();
      if (qword_255D962B0 != -1)
        swift_once();
      v30 = sub_22D84B49C();
      __swift_project_value_buffer(v30, (uint64_t)qword_255D96370);
      swift_bridgeObjectRetain_n();
      v14 = sub_22D84B484();
      v26 = sub_22D84B6D0();
      if (os_log_type_enabled((os_log_t)v14, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = (void *)swift_slowAlloc();
        v31[0] = v28;
        *(_DWORD *)v27 = 136380675;
        swift_bridgeObjectRetain();
        sub_22D83157C(a1, a2, (uint64_t *)v31);
        sub_22D84B79C();
        swift_bridgeObjectRelease_n();
        v29 = "Multiple identities found with bundle identifier: %{private}s";
        goto LABEL_33;
      }

    }
    else
    {
      if (qword_255D962B0 != -1)
        swift_once();
      v18 = sub_22D84B49C();
      __swift_project_value_buffer(v18, (uint64_t)qword_255D96370);
      swift_bridgeObjectRetain_n();
      v19 = sub_22D84B484();
      v20 = sub_22D84B6D0();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = (void *)swift_slowAlloc();
        v31[0] = v22;
        *(_DWORD *)v21 = 136380675;
        swift_bridgeObjectRetain();
        sub_22D83157C(a1, a2, (uint64_t *)v31);
        sub_22D84B79C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22D80B000, v19, v20, "No application record created with bundle identifier: %{private}s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E318218](v22, -1, -1);
        MEMORY[0x22E318218](v21, -1, -1);

        return 0;
      }

    }
    swift_bridgeObjectRelease_n();
    return 0;
  }
  if (qword_255D962B0 != -1)
    swift_once();
  v4 = sub_22D84B49C();
  __swift_project_value_buffer(v4, (uint64_t)qword_255D96370);
  v5 = sub_22D84B484();
  v6 = sub_22D84B6DC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22D80B000, v5, v6, "Creating a process identity for chrono", v7, 2u);
    MEMORY[0x22E318218](v7, -1, -1);
  }

  swift_bridgeObjectRetain();
  v8 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)objc_opt_self(), sel_identityForDaemonJobLabel_, v8);

  return v9;
}

uint64_t sub_22D818844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  id v54;
  id v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int (*v80)(char *, uint64_t, uint64_t);
  int v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t result;
  unint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t, uint64_t);
  char *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  void (*v98)(uint64_t, char *, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  void (*v106)(char *, uint64_t);
  char *v107;
  void *v108;
  char v109;
  uint64_t v110;
  id v111;
  void *v112;
  unsigned __int8 v113;
  char *v114;
  char *v115;
  uint64_t v116;
  unsigned int v117;
  id v118;
  char *v119;
  void *v120;
  char *v121;
  id v122;
  void *v123;
  id v124;
  uint64_t v125;
  void (*v126)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v127;
  unsigned int (*v128)(char *, uint64_t, uint64_t);
  id v129;
  void (*v130)(unsigned int (*)(char *, uint64_t, uint64_t), uint64_t);
  uint64_t v131;
  NSObject *v132;
  os_log_type_t v133;
  uint8_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  char *v145;
  id v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  unsigned int (*v154)(char *, uint64_t, uint64_t);
  char *v155;
  char *v156;
  void (*v157)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  char *v171;
  uint64_t v172;
  char *v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178[2];

  v167 = a1;
  v168 = a2;
  v165 = a5;
  v153 = sub_22D84B28C();
  v151 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v152 = (char *)&v145 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = sub_22D84B2D4();
  v175 = *(_QWORD *)(v166 - 8);
  v8 = MEMORY[0x24BDAC7A8](v166);
  v154 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v145 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v8);
  v163 = (char *)&v145 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v171 = (char *)&v145 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v159 = (char *)&v145 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v164 = (char *)&v145 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v170 = (char *)&v145 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v169 = (char *)&v145 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v150 = (char *)&v145 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v156 = (char *)&v145 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v155 = (char *)&v145 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v162 = (char *)&v145 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v172 = (uint64_t)&v145 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v173 = (char *)&v145 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v145 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v145 - v38;
  v40 = MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)&v145 - v41;
  v43 = MEMORY[0x24BDAC7A8](v40);
  v45 = (char *)&v145 - v44;
  v46 = MEMORY[0x24BDAC7A8](v43);
  v48 = (char *)&v145 - v47;
  v49 = MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&v145 - v50;
  MEMORY[0x24BDAC7A8](v49);
  v53 = (char *)&v145 - v52;
  v54 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v158 = a3;
  v174 = a4;
  v55 = sub_22D819E88(a3, a4, 0);
  v148 = v51;
  v149 = v42;
  v160 = v39;
  v56 = v175;
  v161 = v36;
  v145 = v45;
  v147 = v53;
  if (!v55)
  {
    v67 = v166;
    v68 = v174;
    if (qword_255D962B0 != -1)
      swift_once();
    v69 = sub_22D84B49C();
    __swift_project_value_buffer(v69, (uint64_t)qword_255D96370);
    swift_bridgeObjectRetain_n();
    v70 = sub_22D84B484();
    v71 = sub_22D84B6D0();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      v73 = swift_slowAlloc();
      v178[0] = v73;
      *(_DWORD *)v72 = 136380675;
      swift_bridgeObjectRetain();
      v176 = sub_22D83157C(v158, v68, v178);
      sub_22D84B79C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D80B000, v70, v71, "No application record created with bundle identifier: %{private}s", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v73, -1, -1);
      MEMORY[0x22E318218](v72, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v165, 1, 1, v67);
  }
  v57 = v48;
  v58 = 1;
  v59 = (uint64_t)v147;
  v60 = v166;
  v157 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v175 + 56);
  v157(v147, 1, 1, v166);
  v146 = v55;
  v61 = objc_msgSend(v146, sel_dataContainerURL);
  if (v61)
  {
    v62 = v61;
    sub_22D84B2B0();

    v63 = (uint64_t)v48;
    v58 = 0;
    v64 = v164;
    v65 = (uint64_t)v173;
    v66 = v156;
  }
  else
  {
    v64 = v164;
    v65 = (uint64_t)v173;
    v66 = v156;
    v63 = (uint64_t)v57;
  }
  v74 = v58;
  v75 = v157;
  v157((char *)v63, v74, 1, v60);
  v76 = (uint64_t)v148;
  sub_22D819C1C(v167, v168, v63, (uint64_t)v148);
  sub_22D819F98(v63);
  v156 = *(char **)(v56 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v156)(v76, 1, v60) == 1)
  {
    sub_22D819F98(v76);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v66, v76, v60);
    v77 = (uint64_t)v145;
    sub_22D84B280();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v66, v60);
    v75((char *)v77, 0, 1, v60);
    sub_22D81A198(v77, v59);
  }
  v78 = (uint64_t)v162;
  v79 = (uint64_t)v149;
  sub_22D819FD8(v59, (uint64_t)v149);
  v80 = (unsigned int (*)(char *, uint64_t, uint64_t))v156;
  v81 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v156)(v79, 1, v60);
  sub_22D819F98(v79);
  if (v81 == 1)
  {
    v82 = objc_msgSend(v146, sel_groupContainerURLs);
    v83 = sub_22D84B58C();

    v84 = *(_QWORD *)(v83 + 64);
    v148 = (char *)(v83 + 64);
    v85 = 1 << *(_BYTE *)(v83 + 32);
    v86 = -1;
    if (v85 < 64)
      v86 = ~(-1 << v85);
    v87 = v86 & v84;
    v149 = (char *)((unint64_t)(v85 + 63) >> 6);
    v158 = v83;
    result = swift_bridgeObjectRetain();
    v89 = 0;
    v90 = v157;
    while (1)
    {
      v91 = v160;
      if (v87)
      {
        v92 = __clz(__rbit64(v87));
        v87 &= v87 - 1;
        v174 = v89;
        v93 = v92 | (v89 << 6);
      }
      else
      {
        v94 = v89 + 1;
        if (__OFADD__(v89, 1))
        {
          __break(1u);
          goto LABEL_70;
        }
        v78 = (uint64_t)v162;
        if (v94 >= (uint64_t)v149)
          goto LABEL_50;
        v95 = *(_QWORD *)&v148[8 * v94];
        v96 = v89 + 1;
        if (!v95)
        {
          v96 = v89 + 2;
          if ((uint64_t)(v89 + 2) >= (uint64_t)v149)
            goto LABEL_50;
          v95 = *(_QWORD *)&v148[8 * v96];
          if (!v95)
          {
            v96 = v89 + 3;
            if ((uint64_t)(v89 + 3) >= (uint64_t)v149)
              goto LABEL_50;
            v95 = *(_QWORD *)&v148[8 * v96];
            if (!v95)
            {
              v96 = v89 + 4;
              if ((uint64_t)(v89 + 4) >= (uint64_t)v149)
                goto LABEL_50;
              v95 = *(_QWORD *)&v148[8 * v96];
              if (!v95)
              {
                v97 = v89 + 5;
                if ((uint64_t)(v89 + 5) >= (uint64_t)v149)
                {
LABEL_50:
                  v90(v160, 1, 1, v60);
                  swift_release();
                  swift_bridgeObjectRelease();
                  goto LABEL_51;
                }
                v95 = *(_QWORD *)&v148[8 * v97];
                if (!v95)
                {
                  while (1)
                  {
                    v96 = v97 + 1;
                    if (__OFADD__(v97, 1))
                      break;
                    if (v96 >= (uint64_t)v149)
                      goto LABEL_50;
                    v95 = *(_QWORD *)&v148[8 * v96];
                    ++v97;
                    if (v95)
                      goto LABEL_33;
                  }
                  __break(1u);
                  return result;
                }
                v96 = v89 + 5;
              }
            }
          }
        }
LABEL_33:
        v87 = (v95 - 1) & v95;
        v174 = v96;
        v93 = __clz(__rbit64(v95)) + (v96 << 6);
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v56 + 16))(v160, *(_QWORD *)(v158 + 56) + *(_QWORD *)(v56 + 72) * v93, v60);
      v90(v91, 0, 1, v60);
      if (v80(v91, 1, v60) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        v78 = (uint64_t)v162;
LABEL_51:
        v59 = (uint64_t)v147;
        break;
      }
      v98 = *(void (**)(uint64_t, char *, uint64_t))(v56 + 32);
      v98(v65, v91, v60);
      v90((char *)v65, 0, 1, v60);
      v99 = v65;
      v100 = v172;
      sub_22D819FD8(v99, v172);
      if (v80((char *)v100, 1, v60) == 1)
      {
        v101 = v56;
        sub_22D819F98(v100);
        v102 = 1;
        v65 = (uint64_t)v173;
        goto LABEL_42;
      }
      v98((uint64_t)v169, (char *)v100, v60);
      sub_22D84B280();
      v103 = v56;
      v104 = v159;
      sub_22D84B2A4();
      sub_22D84B2A4();
      v105 = v64;
      v106 = *(void (**)(char *, uint64_t))(v103 + 8);
      v106(v104, v60);
      v106(v105, v60);
      sub_22D84B2A4();
      v107 = v163;
      sub_22D84B280();
      sub_22D84B2BC();
      v106(v107, v60);
      sub_22D84B280();
      sub_22D84B2BC();
      v106(v107, v60);
      LOBYTE(v105) = sub_22D84B604();
      swift_bridgeObjectRelease();
      if ((v105 & 1) != 0
        && (v108 = (void *)sub_22D84B5BC(), v109 = BSIsSymbolicLinkAtPath(), v108, (v109 & 1) == 0))
      {
        v111 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
        v112 = (void *)sub_22D84B5BC();
        swift_bridgeObjectRelease();
        v113 = objc_msgSend(v111, sel_fileExistsAtPath_, v112);

        v65 = (uint64_t)v173;
        if ((v113 & 1) != 0)
        {
          v114 = v171;
          sub_22D84B280();
          v106(v114, v60);
          v106(v170, v60);
          v106(v169, v60);
          v102 = 0;
          goto LABEL_41;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v65 = (uint64_t)v173;
      }
      v106(v171, v60);
      v106(v170, v60);
      v106(v169, v60);
      v102 = 1;
LABEL_41:
      v101 = v175;
      v80 = (unsigned int (*)(char *, uint64_t, uint64_t))v156;
      v90 = v157;
      v64 = v164;
LABEL_42:
      v110 = (uint64_t)v161;
      v90(v161, v102, 1, v60);
      sub_22D819F98(v65);
      if (v80((char *)v110, 1, v60) != 1)
      {
        v115 = v150;
        v98((uint64_t)v150, (char *)v110, v60);
        v116 = (uint64_t)v145;
        sub_22D84B280();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v101 + 8))(v115, v60);
        swift_release();
        v90((char *)v116, 0, 1, v60);
        v59 = (uint64_t)v147;
        sub_22D81A198(v116, (uint64_t)v147);
        v78 = (uint64_t)v162;
        break;
      }
      result = sub_22D819F98(v110);
      v56 = v101;
      v89 = v174;
    }
  }
  v87 = v59;
  sub_22D819FD8(v59, v78);
  v117 = v80((char *)v78, 1, v60);
  sub_22D819F98(v78);
  v80 = (unsigned int (*)(char *, uint64_t, uint64_t))v163;
  if (v117 == 1)
  {
    v118 = objc_msgSend(v146, sel_URL);
    v119 = v155;
    sub_22D84B2B0();

    v157(v119, 0, 1, v60);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v156)(v119, 1, v60) == 1)
    {
      v120 = 0;
    }
    else
    {
      v121 = v119;
      v120 = (void *)sub_22D84B298();
      (*(void (**)(char *, uint64_t))(v175 + 8))(v121, v60);
    }
    v122 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDC8]), sel_initWithURL_, v120);

    if (v122)
    {
      v123 = (void *)sub_22D84B5BC();
      v124 = objc_msgSend(v122, sel_pathForResource_ofType_, v123, 0);

      if (v124)
      {
        sub_22D84B5C8();

        v125 = (uint64_t)v145;
        v126 = v157;
        v157(v145, 1, 1, v60);
        (*(void (**)(char *, _QWORD, uint64_t))(v151 + 104))(v152, *MEMORY[0x24BDCD7A0], v153);
        v127 = v125;
        v128 = v154;
        sub_22D84B2C8();
        v129 = objc_msgSend(v146, sel_URL);
        sub_22D84B2B0();

        LOBYTE(v129) = sub_22D81A020();
        v130 = *(void (**)(unsigned int (*)(char *, uint64_t, uint64_t), uint64_t))(v175 + 8);
        v130(v80, v60);
        if ((v129 & 1) != 0)
        {
          sub_22D84B280();

          v130(v128, v60);
          v126((char *)v127, 0, 1, v60);
          v87 = (unint64_t)v147;
          sub_22D81A198(v127, (uint64_t)v147);
        }
        else
        {
          v130(v128, v60);

          v87 = (unint64_t)v147;
        }
      }
      else
      {

      }
    }
  }
  if (qword_255D962B0 != -1)
LABEL_70:
    swift_once();
  v131 = sub_22D84B49C();
  __swift_project_value_buffer(v131, (uint64_t)qword_255D96370);
  v132 = sub_22D84B484();
  v133 = sub_22D84B6D0();
  if (os_log_type_enabled(v132, v133))
  {
    v134 = (uint8_t *)swift_slowAlloc();
    v135 = swift_slowAlloc();
    v177 = v135;
    *(_DWORD *)v134 = 136380675;
    swift_beginAccess();
    v136 = 0;
    v137 = 0;
    if (!((unsigned int (*)(unint64_t, uint64_t, uint64_t))v156)(v87, 1, v60))
    {
      v138 = v175;
      (*(void (**)(unsigned int (*)(char *, uint64_t, uint64_t), char *, uint64_t))(v175 + 16))(v80, v147, v60);
      v136 = sub_22D84B2BC();
      v137 = v139;
      (*(void (**)(unsigned int (*)(char *, uint64_t, uint64_t), uint64_t))(v138 + 8))(v80, v60);
    }
    v178[0] = v136;
    v178[1] = v137;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D97090);
    v140 = sub_22D84B5D4();
    v178[0] = sub_22D83157C(v140, v141, &v177);
    sub_22D84B79C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v132, v133, "External sound url: %{private}s", v134, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v135, -1, -1);
    MEMORY[0x22E318218](v134, -1, -1);

    v142 = v146;
    v143 = (uint64_t)v147;
  }
  else
  {

    v144 = v146;
    v143 = v87;
  }
  swift_beginAccess();
  sub_22D819FD8(v143, v165);
  return sub_22D819F98(v143);
}

uint64_t sub_22D819C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  _QWORD v28[2];

  v28[0] = a1;
  v28[1] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22D84B2D4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v28 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v28 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v28 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v28 - v23;
  sub_22D819FD8(a3, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_22D819F98((uint64_t)v8);
LABEL_6:
    v26 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a4, v26, 1, v9);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v24, v8, v9);
  sub_22D84B280();
  sub_22D84B2A4();
  sub_22D84B2A4();
  v25 = *(void (**)(char *, uint64_t))(v10 + 8);
  v25(v16, v9);
  v25(v19, v9);
  sub_22D84B2A4();
  if ((sub_22D81A020() & 1) == 0)
  {
    v25(v13, v9);
    v25(v22, v9);
    v25(v24, v9);
    goto LABEL_6;
  }
  sub_22D84B280();
  v25(v13, v9);
  v25(v22, v9);
  v25(v24, v9);
  v26 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a4, v26, 1, v9);
}

id sub_22D819E88(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_22D84B25C();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_22D819F60(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22D819F98(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D819FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_22D81A020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  char v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v0 = sub_22D84B2D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D84B280();
  sub_22D84B2BC();
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_22D84B280();
  sub_22D84B2BC();
  v4(v3, v0);
  v5 = sub_22D84B604();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0 && (v6 = (void *)sub_22D84B5BC(), v7 = BSIsSymbolicLinkAtPath(), v6, !v7))
  {
    v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v10 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v9, sel_fileExistsAtPath_, v10);

  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_22D81A198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id ActivityAlertProvider.__allocating_init(identifier:action:presentationOptions:payload:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_22D81AD34(a1, a2, a3, a4, a5);

  return v12;
}

uint64_t sub_22D81A260()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction);
}

uint64_t sub_22D81A2BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22D81A300()
{
  return sub_22D81A788((uint64_t (*)(uint64_t))MEMORY[0x24BDB4960]);
}

uint64_t sub_22D81A318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = sub_22D84B304();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22D84B3E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_22D81B274(v12, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
  {
    sub_22D81B6C0((uint64_t)v11, &qword_255D97048);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    sub_22D81B6C0((uint64_t)v11, &qword_255D97048);
    sub_22D84B3D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = sub_22D84B2F8();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v13;
}

void *sub_22D81A4CC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D81A524(void *a1)
{
  sub_22D81A684(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
}

uint64_t (*sub_22D81A530())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_22D81A584(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_22D81A5C8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D81A620(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void sub_22D81A678(void *a1)
{
  sub_22D81A684(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
}

void sub_22D81A684(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

void sub_22D81A6D0(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void **v6;
  void *v7;
  id v8;

  v5 = *a1;
  v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;
  v8 = v5;

}

uint64_t (*sub_22D81A72C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81A77C()
{
  return sub_22D81A788(MEMORY[0x24BDB4988]);
}

uint64_t sub_22D81A788(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = sub_22D84B3E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_22D81B274(v10, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_22D81B6C0((uint64_t)v9, &qword_255D97048);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
    v12 = sub_22D81B6C0((uint64_t)v9, &qword_255D97048);
    v11 = a1(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v11;
}

uint64_t sub_22D81A8E4()
{
  return sub_22D81A788(MEMORY[0x24BDB4978]);
}

id sub_22D81A8FC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  a3();
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t sub_22D81A964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = sub_22D84B3E8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_22D81B274(v8, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    sub_22D81B6C0((uint64_t)v7, &qword_255D97048);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    sub_22D81B6C0((uint64_t)v7, &qword_255D97048);
    v10 = sub_22D84B3C4();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v12)
      return v10;
    else
      return 0;
  }
}

id ActivityAlertProvider.init(identifier:action:presentationOptions:payload:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  id v6;

  v6 = sub_22D81AD34(a1, a2, a3, a4, a5);

  return v6;
}

id ActivityAlertProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityAlertProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityAlertProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAlertProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D81AD34(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  char *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void **v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void **v53;
  char *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  id v58;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  void **v70;
  uint64_t v71;
  char *v72;
  objc_super v73;

  v71 = a2;
  v72 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97088);
  MEMORY[0x24BDAC7A8](v9);
  v63 = (uint64_t)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D84B2D4();
  v64 = *(_QWORD *)(v11 - 8);
  v65 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D84B424();
  v68 = *(_QWORD *)(v13 - 8);
  v69 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v67 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v66 = (uint64_t)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v60 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v60 - v21;
  v70 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration];
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration] = 0;
  v23 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions];
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions] = 0;
  v24 = &v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertConfiguration];
  v25 = sub_22D84B430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
  v26 = &v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload];
  v27 = sub_22D84B3E8();
  v28 = *(_QWORD *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v26, 1, 1, v27);
  v29 = &v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_activityIdentifier];
  v30 = v71;
  *(_QWORD *)v29 = a1;
  *((_QWORD *)v29 + 1) = v30;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction] = v72;
  swift_beginAccess();
  v31 = *v23;
  *v23 = a4;
  v72 = v5;
  v32 = a4;

  swift_beginAccess();
  v33 = (uint64_t)v26;
  v34 = a5;
  sub_22D81B678(a5, v33);
  swift_endAccess();
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB8CA8]), sel_initWithType_, 17);
  sub_22D81B274(a5, (uint64_t)v22);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v36(v22, 1, v27) == 1)
  {
    sub_22D81B6C0((uint64_t)v22, &qword_255D97048);
LABEL_16:
    v53 = v70;
    v52 = v72;
    goto LABEL_17;
  }
  v35 = v35;
  v37 = sub_22D84B3B8();
  v39 = v38;
  v40 = *(void (**)(char *, uint64_t))(v28 + 8);
  v40(v22, v27);
  sub_22D81B274(a5, (uint64_t)v20);
  if (v36(v20, 1, v27) == 1)
  {

    swift_bridgeObjectRelease();
    sub_22D81B6C0((uint64_t)v20, &qword_255D97048);
    v42 = v68;
    v41 = v69;
    v43 = v67;
  }
  else
  {
    v61 = v37;
    v71 = a5;
    v43 = v67;
    sub_22D84B3DC();
    v40(v20, v27);
    v44 = sub_22D84B418();
    v46 = v45;
    v42 = v68;
    v41 = v69;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v43, v69);
    if (v46)
    {
      v47 = v63;
      sub_22D818844(v44, v46, v61, v39, v63);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v49 = v64;
      v48 = v65;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v47, 1, v65) == 1)
      {

        sub_22D81B6C0(v47, &qword_255D97088);
      }
      else
      {
        v54 = v62;
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v62, v47, v48);
        v55 = (void *)sub_22D84B298();
        objc_msgSend(v35, sel_setExternalToneFileURL_, v55);

        (*(void (**)(char *, uint64_t))(v49 + 8))(v54, v48);
      }
      v34 = v71;
      goto LABEL_16;
    }

    swift_bridgeObjectRelease();
    v34 = v71;
  }
  v50 = v66;
  sub_22D81B274(v34, v66);
  if (v36((char *)v50, 1, v27) == 1)
  {
    sub_22D81B6C0(v50, &qword_255D97048);
    goto LABEL_16;
  }
  sub_22D84B3DC();
  v40((char *)v50, v27);
  v51 = sub_22D84B40C();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
  v52 = v72;
  if (v51)
  {

    v35 = (id)v51;
  }
  v53 = v70;
LABEL_17:
  swift_beginAccess();
  v56 = *v53;
  *v53 = v35;

  v57 = (objc_class *)type metadata accessor for ActivityAlertProvider();
  v73.receiver = v52;
  v73.super_class = v57;
  v58 = objc_msgSendSuper2(&v73, sel_init);
  sub_22D81B6C0(v34, &qword_255D97048);
  return v58;
}

uint64_t sub_22D81B274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ActivityAlertProvider()
{
  uint64_t result;

  result = qword_255D970C8;
  if (!qword_255D970C8)
    return swift_getSingletonMetadata();
  return result;
}

id sub_22D81B2F8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration, a2);
}

void sub_22D81B304(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81A6D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
}

id sub_22D81B320@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions, a2);
}

id keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_22D81B378(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81A6D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
}

uint64_t sub_22D81B394()
{
  return type metadata accessor for ActivityAlertProvider();
}

void sub_22D81B39C()
{
  unint64_t v0;
  unint64_t v1;

  sub_22D81B5E4(319, &qword_255D970D8, (void (*)(uint64_t))MEMORY[0x24BDB4A00]);
  if (v0 <= 0x3F)
  {
    sub_22D81B5E4(319, &qword_255D970E0, (void (*)(uint64_t))MEMORY[0x24BDB4998]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ActivityAlertProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAlertProvider.action.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityAlertProvider.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityAlertProvider.bundleIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityAlertProvider.payloadIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.title.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.body.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.deviceIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.__allocating_init(identifier:action:presentationOptions:payload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 328))();
}

void sub_22D81B5E4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_22D84B790();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_22D81B630()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D970E8;
  if (!qword_255D970E8)
  {
    v1 = sub_22D84B3E8();
    result = MEMORY[0x22E318194](MEMORY[0x24BDB4990], v1);
    atomic_store(result, (unint64_t *)&qword_255D970E8);
  }
  return result;
}

uint64_t sub_22D81B678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D81B6C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void ClientSettingDynamicLookup.subscript.getter()
{
  sub_22D84B8C8();
  __break(1u);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D970F8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D970F8 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97100);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97100, &qword_255D97100[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81B87C(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97100);
}

uint64_t sub_22D81B88C()
{
  swift_beginAccess();
  return qword_255D970F8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97110;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97110 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D81B990()
{
  qword_255D97118 = 0x6F6C6F4374786574;
  unk_255D97120 = 0xE900000000000072;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96C10, &qword_255D97118);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96C10, &qword_255D97118, &qword_255D97120);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.modify())()
{
  if (qword_255D96C10 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81BA64(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96C10, &qword_255D97118);
}

uint64_t sub_22D81BA84()
{
  swift_beginAccess();
  return qword_255D97110;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97128;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97128 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97130);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97130, &qword_255D97130[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81BBE8(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97130);
}

uint64_t sub_22D81BBF8()
{
  swift_beginAccess();
  return qword_255D97128;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97140;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97140 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97148);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97148, &qword_255D97148[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81BD5C(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97148);
}

uint64_t sub_22D81BD6C()
{
  swift_beginAccess();
  return qword_255D97140;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97158;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97158 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D81BE70()
{
  qword_255D97160 = 0x6465766C6F736572;
  *(_QWORD *)algn_255D97168 = 0xEF7363697274654DLL;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96C18, &qword_255D97160);
}

uint64_t sub_22D81BEC0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96C18, &qword_255D97160, algn_255D97168);
}

uint64_t sub_22D81BF4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  if (*a3 != -1)
    swift_once();
  swift_beginAccess();
  *a4 = a1;
  *a5 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.modify())()
{
  if (qword_255D96C18 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81C030(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96C18, &qword_255D97160);
}

uint64_t sub_22D81C050(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_22D81C0C0()
{
  swift_beginAccess();
  return qword_255D97158;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97170;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97170 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97178);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97178, &qword_255D97178[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81C224(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97178);
}

uint64_t sub_22D81C234()
{
  swift_beginAccess();
  return qword_255D97170;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97188;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97188 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97190);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97190, &qword_255D97190[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81C398(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97190);
}

uint64_t sub_22D81C3A8()
{
  swift_beginAccess();
  return qword_255D97188;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D971A0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D971A0 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D971A8);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D971A8, &qword_255D971A8[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22D81C50C(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D971A8);
}

uint64_t sub_22D81C51C()
{
  swift_beginAccess();
  return qword_255D971A0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D971B8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D971B8 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D971C0);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D971C0, &qword_255D971C0[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81C680(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D971C0);
}

uint64_t sub_22D81C690()
{
  swift_beginAccess();
  return qword_255D971B8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D971D0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D971D0 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D971D8);
}

uint64_t sub_22D81C7A4(uint64_t *a1)
{
  uint64_t v2;

  swift_beginAccess();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D971D8, &qword_255D971D8[1]);
}

uint64_t sub_22D81C804(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  swift_beginAccess();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D81C8A0(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D971D8);
}

uint64_t sub_22D81C8B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  swift_beginAccess();
  v4 = *a3;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_22D81C904()
{
  swift_beginAccess();
  return qword_255D971D0;
}

ValueMetadata *type metadata accessor for ClientSettingDynamicLookup()
{
  return &type metadata for ClientSettingDynamicLookup;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes()
{
  return &type metadata for SceneClientSettingScopes;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.TextColorKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.TextColorKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey;
}

uint64_t sub_22D81CA3C@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (AssociatedTypeWitness != sub_22D819F60(0, &qword_2540C5FA8))
  {
    if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2)))
    {
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      sub_22D81CE70(v15, &v16);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    v9 = &qword_2540C6360;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2)))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_22D81494C((uint64_t)v15, (uint64_t)&v16);
  if (*((_QWORD *)&v17 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_22D819F60(0, (unint64_t *)&unk_2540C5F60);
      v12 = sub_22D84B6E8();
      sub_22D81CE80(v13, v14);
      *(_QWORD *)&v16 = v12;
      v9 = (uint64_t *)&unk_255D971E8;
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName(v9);
      v10 = swift_dynamicCast();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a4, v10 ^ 1u, 1, AssociatedTypeWitness);
    }
  }
  else
  {
    sub_22D814194((uint64_t)&v16);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a4, 1, 1, AssociatedTypeWitness);
}

void sub_22D81CC74(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_22D81CC98(*(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), a2, a3);
}

void sub_22D81CC98(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v3;
  id v7;

  v7 = objc_msgSend(v3, sel_otherSettings);
  sub_22D81CA3C(v7, a1, a2, a3);

}

id sub_22D81CD30()
{
  return sub_22D814DA4(type metadata accessor for ActivitySceneClientSettings);
}

uint64_t type metadata accessor for ActivitySceneClientSettings()
{
  return objc_opt_self();
}

void sub_22D81CD5C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_22D81CC98(a1, a2, a3);
}

void sub_22D81CD7C(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_22D81CC74(a1, a2, a3);
}

id sub_22D81CDAC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithSettings_, a3);
}

id sub_22D81CE08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return objc_msgSend(objc_allocWithZone((Class)a4()), sel_initWithSettings_, a1);
}

id sub_22D81CE38()
{
  return sub_22D814DA4(type metadata accessor for ActivityMutableSceneClientSettings);
}

uint64_t type metadata accessor for ActivityMutableSceneClientSettings()
{
  return objc_opt_self();
}

_UNKNOWN **sub_22D81CE64()
{
  return &protocol witness table for SceneClientSettingScopes.ActivitySettings;
}

_OWORD *sub_22D81CE70(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22D81CE80(uint64_t a1, unint64_t a2)
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

uint64_t sub_22D81CF08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_22D81CF94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D81CFDC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_22D81D068()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  return *v1;
}

void sub_22D81D108(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_22D81D158(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_22D81D1B8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22D81D248()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ActivityUpdateProvider.__allocating_init(activityDescriptor:activityState:systemMetricsRequest:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_22D81D4D8(a1, a2, a3);

  return v8;
}

id ActivityUpdateProvider.init(activityDescriptor:activityState:systemMetricsRequest:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = sub_22D81D4D8(a1, a2, a3);

  return v4;
}

id ActivityUpdateProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityUpdateProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityUpdateProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityUpdateProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D81D4D8(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  objc_class *updated;
  id v18;
  objc_super v20;

  v7 = sub_22D84B340();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityDescriptor], a1, v7);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState] = a2;
  v12 = v3;
  v13 = sub_22D84B334();
  v14 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityIdentifier];
  *v14 = v13;
  v14[1] = v15;
  sub_22D81D8B4();
  v11(v10, a1, v7);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor] = sub_22D84B730();
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_systemMetricsRequest] = a3;
  v16 = a3;

  updated = (objc_class *)type metadata accessor for ActivityUpdateProvider();
  v20.receiver = v12;
  v20.super_class = updated;
  v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v18;
}

uint64_t type metadata accessor for ActivityUpdateProvider()
{
  uint64_t result;

  result = qword_255D963D8;
  if (!qword_255D963D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D81D650@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22D81D6A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

id sub_22D81D6EC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22D81D740()
{
  return type metadata accessor for ActivityUpdateProvider();
}

uint64_t sub_22D81D748()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D84B340();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ActivityUpdateProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.__allocating_init(activityDescriptor:activityState:systemMetricsRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

unint64_t sub_22D81D8B4()
{
  unint64_t result;

  result = qword_2540C5F90;
  if (!qword_2540C5F90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C5F90);
  }
  return result;
}

id *sub_22D81D8F0()
{
  id *v0;
  id v1;
  id v2;

  objc_msgSend(v0[2], sel_invalidate);
  v1 = v0[2];
  v0[2] = 0;

  objc_msgSend(v0[11], sel_invalidate);
  v2 = v0[11];
  v0[11] = 0;

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_22D81D968()
{
  sub_22D81D8F0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BackOffTimer()
{
  return objc_opt_self();
}

void sub_22D81D9A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint32_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  os_log_type_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t aBlock[6];
  uint64_t v38;

  v1 = (_QWORD *)v0;
  if (*(_QWORD *)(v0 + 16))
  {
    if (qword_2540C5EE0 != -1)
      swift_once();
    v2 = sub_22D84B49C();
    __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EC8);
    swift_retain();
    v3 = sub_22D84B484();
    v4 = sub_22D84B6DC();
    if (!os_log_type_enabled(v3, v4))
    {

      swift_release();
      return;
    }
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = v1[4];
    v8 = v1[5];
    swift_bridgeObjectRetain();
    v38 = sub_22D83157C(v7, v8, aBlock);
    sub_22D84B79C();
    swift_release();
    swift_bridgeObjectRelease();
    v9 = "[%s] Back off timer is already on";
    v10 = v3;
    v11 = v4;
    v12 = (uint8_t *)v5;
    v13 = 12;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
  v14 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 88) = 0;

  if (qword_2540C5EE0 != -1)
    swift_once();
  v15 = sub_22D84B49C();
  __swift_project_value_buffer(v15, (uint64_t)qword_2540C5EC8);
  swift_retain();
  v16 = sub_22D84B484();
  v17 = sub_22D84B6DC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315394;
    v20 = *(_QWORD *)(v0 + 32);
    v21 = *(_QWORD *)(v0 + 40);
    swift_bridgeObjectRetain();
    v38 = sub_22D83157C(v20, v21, aBlock);
    sub_22D84B79C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2048;
    v38 = *(_QWORD *)(v0 + 24);
    sub_22D84B79C();
    swift_release();
    _os_log_impl(&dword_22D80B000, v16, v17, "[%s] scheduling new backoff with base interval: %f.", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v19, -1, -1);
    MEMORY[0x22E318218](v18, -1, -1);

  }
  else
  {

    swift_release();
  }
  v22 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
  v23 = (void *)sub_22D84B5BC();
  v24 = objc_msgSend(v22, sel_initWithIdentifier_, v23);

  v25 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = v24;

  v26 = *(double *)(v0 + 24);
  if (v26 >= 0.1)
    v27 = v26 + v26;
  else
    v27 = 0.1;
  v28 = fmin(v27, 120.0);
  *(double *)(v0 + 24) = v28;
  v29 = *(void **)(v0 + 16);
  if (v29)
  {
    v30 = *(_QWORD *)(v0 + 48);
    v31 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = (uint64_t)sub_22D81E528;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_22D81E14C;
    aBlock[3] = (uint64_t)&block_descriptor_4;
    v32 = _Block_copy(aBlock);
    v33 = v29;
    swift_release();
    objc_msgSend(v33, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v30, v32, v28, 0.0);
    _Block_release(v32);

    swift_retain();
    v3 = sub_22D84B484();
    v34 = sub_22D84B6DC();
    if (os_log_type_enabled(v3, v34))
    {
      v5 = swift_slowAlloc();
      v6 = swift_slowAlloc();
      aBlock[0] = v6;
      *(_DWORD *)v5 = 136315394;
      v35 = v1[4];
      v36 = v1[5];
      swift_bridgeObjectRetain();
      v38 = sub_22D83157C(v35, v36, aBlock);
      sub_22D84B79C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v5 + 12) = 2048;
      v38 = v1[3];
      sub_22D84B79C();
      swift_release();
      v9 = "[%s] Back off timer is scheduled with fire interval: %f";
      v10 = v3;
      v11 = v34;
      v12 = (uint8_t *)v5;
      v13 = 22;
LABEL_18:
      _os_log_impl(&dword_22D80B000, v10, v11, v9, v12, v13);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v6, -1, -1);
      MEMORY[0x22E318218](v5, -1, -1);

      return;
    }

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22D81DF40(void *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = (_QWORD *)result;
    if (qword_2540C5EE0 != -1)
      swift_once();
    v4 = sub_22D84B49C();
    __swift_project_value_buffer(v4, (uint64_t)qword_2540C5EC8);
    swift_retain();
    v5 = sub_22D84B484();
    v6 = sub_22D84B6DC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v14 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = v3[4];
      v10 = v3[5];
      swift_bridgeObjectRetain();
      sub_22D83157C(v9, v10, &v14);
      sub_22D84B79C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v5, v6, "[%s] Back off timer fired", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v8, -1, -1);
      MEMORY[0x22E318218](v7, -1, -1);

    }
    else
    {

      swift_release();
    }
    v11 = (void (*)(uint64_t))v3[7];
    v12 = swift_retain();
    v11(v12);
    swift_release();
    objc_msgSend(a1, sel_invalidate);
    v13 = (void *)v3[2];
    v3[2] = 0;

    sub_22D81E19C();
    return swift_release();
  }
  return result;
}

void sub_22D81E14C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_22D81E19C()
{
  uint64_t v0;
  double v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  if ((*(_BYTE *)(v0 + 80) & 1) == 0)
  {
    v1 = *(double *)(v0 + 72);
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    v2 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v2, sel_initWithIdentifier_, v3);

    v5 = *(void **)(v0 + 88);
    *(_QWORD *)(v0 + 88) = v4;

    v6 = *(void **)(v0 + 88);
    if (v6)
    {
      v7 = *(_QWORD *)(v0 + 48);
      v8 = swift_allocObject();
      swift_weakInit();
      v11[4] = sub_22D81E508;
      v11[5] = v8;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 1107296256;
      v11[2] = sub_22D81E14C;
      v11[3] = &block_descriptor_0;
      v9 = _Block_copy(v11);
      v10 = v6;
      swift_release();
      objc_msgSend(v10, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v7, v9, v1, 0.0);
      _Block_release(v9);

    }
  }
}

uint64_t sub_22D81E2F8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_22D81E31C()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (qword_2540C5EE0 != -1)
      swift_once();
    v2 = sub_22D84B49C();
    __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EC8);
    swift_retain();
    v3 = sub_22D84B484();
    v4 = sub_22D84B6DC();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v10 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = *(_QWORD *)(v1 + 32);
      v8 = *(_QWORD *)(v1 + 40);
      swift_bridgeObjectRetain();
      sub_22D83157C(v7, v8, &v10);
      sub_22D84B79C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v3, v4, "[%s] Reset interval satiated, resetting", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v6, -1, -1);
      MEMORY[0x22E318218](v5, -1, -1);

    }
    else
    {

      swift_release();
    }
    *(_QWORD *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 88), sel_invalidate);
    v9 = *(void **)(v1 + 88);
    *(_QWORD *)(v1 + 88) = 0;
    swift_release();

  }
}

void sub_22D81E508()
{
  sub_22D81E31C();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_22D81E528(void *a1)
{
  return sub_22D81DF40(a1);
}

id sub_22D81E548()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
}

void sub_22D81E564(void *a1)
{
  sub_22D81E7D8(a1, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
}

void (*sub_22D81E570(_QWORD *a1))(uint64_t *, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D81E5CC;
}

id sub_22D81E5E0()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
}

void sub_22D81E5FC(void *a1)
{
  sub_22D81E7D8(a1, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
}

void (*sub_22D81E608(_QWORD *a1))(uint64_t *, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D81E5CC;
}

id sub_22D81E674()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
}

void sub_22D81E690(void *a1)
{
  sub_22D81E7D8(a1, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
}

void (*sub_22D81E69C(_QWORD *a1))(uint64_t *, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D81E5CC;
}

id sub_22D81E708()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
}

void sub_22D81E724(void *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a1;
  objc_msgSend(v6, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v8 = *a4;
  v9 = *(void **)&v7[*a4];
  *(_QWORD *)&v7[v8] = v10;

}

void sub_22D81E7CC(void *a1)
{
  sub_22D81E7D8(a1, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

void sub_22D81E7D8(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v5 = *a2;
  v6 = *(void **)(v2 + *a2);
  *(_QWORD *)(v2 + v5) = v7;

}

void sub_22D81E868(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = *a2;
  v7 = *a1;
  objc_msgSend(v7, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v8 = *a5;
  v9 = *(void **)(v6 + *a5);
  *(_QWORD *)(v6 + v8) = v10;

}

void (*sub_22D81E904(_QWORD *a1))(uint64_t *, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D81E5CC;
}

double sub_22D81E9A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D81EA3C(double a1, double a2)
{
  uint64_t v2;
  double *v5;
  uint64_t result;

  v5 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  result = swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_22D81EA90())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_22D81EB18()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D81EBAC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D81EBFC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id SystemApertureMetricsRequest.__allocating_init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  objc_class *v7;
  char *v15;
  double *v16;
  objc_super v18;

  v15 = (char *)objc_allocWithZone(v7);
  v16 = (double *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *v16 = a5;
  v16[1] = a6;
  *(double *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = a7;
  *(_QWORD *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = a1;
  *(_QWORD *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = a2;
  *(_QWORD *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = a3;
  *(_QWORD *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = a4;
  v18.receiver = v15;
  v18.super_class = v7;
  return objc_msgSendSuper2(&v18, sel_init);
}

id SystemApertureMetricsRequest.init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  char *v7;
  double *v8;
  objc_super v10;

  v8 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *v8 = a5;
  v8[1] = a6;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = a7;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = a1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = a2;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = a3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = a4;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for SystemApertureMetricsRequest()
{
  return objc_opt_self();
}

id SystemApertureMetricsRequest.__allocating_init(obstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  objc_class *v6;
  id v11;

  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a1, a2, a3, a4, a5, a6, 0.0);

  return v11;
}

id SystemApertureMetricsRequest.init(obstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  void *v6;
  id v11;

  v11 = objc_msgSend(v6, sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a1, a2, a3, a4, a5, a6, 0.0);

  return v11;
}

uint64_t sub_22D81EF70(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D81EFA8 + 4 * byte_22D84F060[a1]))(0xD000000000000014, 0x800000022D851D60);
}

uint64_t sub_22D81EFA8()
{
  return 0x746375727473626FLL;
}

uint64_t sub_22D81EFCC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_22D81F044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t result;
  double v11;
  double v12;
  double *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest), sel_hash);
  if (v1 >= 1)
    v2 = 1;
  else
    v2 = v1;
  v3 = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest), sel_hash);
  if (v3 >= 1)
    v4 = 1;
  else
    v4 = v3;
  v5 = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest), sel_hash);
  if (v5 >= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest), sel_hash);
  if (v7 >= 1)
    v8 = 1;
  else
    v8 = v7;
  v9 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  result = swift_beginAccess();
  if (*v9 <= 1.0)
    v11 = *v9;
  else
    v11 = 1.0;
  if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v9[1] <= 1.0)
    v12 = v9[1];
  else
    v12 = 1.0;
  if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
    goto LABEL_41;
  if (v12 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v13 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  result = swift_beginAccess();
  v14 = *v13;
  if (*v13 > 1.0)
    v14 = 1.0;
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
    goto LABEL_44;
  if (v14 <= -9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v15 = 37 * v2;
  if ((unsigned __int128)(v2 * (__int128)37) >> 64 != (37 * v2) >> 63)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v16 = v15 * v4;
  if ((unsigned __int128)(v15 * (__int128)v4) >> 64 != (v15 * v4) >> 63)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v17 = v16 * v6;
  if ((unsigned __int128)(v16 * (__int128)v6) >> 64 != (v16 * v6) >> 63)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v18 = v17 * v8;
  if ((unsigned __int128)(v17 * (__int128)v8) >> 64 != (v17 * v8) >> 63)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v19 = v18 * (uint64_t)v11;
  if ((unsigned __int128)(v18 * (__int128)(uint64_t)v11) >> 64 != v19 >> 63)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v20 = v19 * (uint64_t)v12;
  if ((unsigned __int128)(v19 * (__int128)(uint64_t)v12) >> 64 != v20 >> 63)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  result = v20 * (uint64_t)v14;
  if ((unsigned __int128)(v20 * (__int128)(uint64_t)v14) >> 64 != result >> 63)
LABEL_53:
    __break(1u);
  return result;
}

BOOL sub_22D81F2B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  CGFloat *v19;
  CGFloat v20;
  CGFloat v21;
  CGSize *v22;
  double *v23;
  double v24;
  double *v25;
  double v26;
  char *v28;
  _BYTE v29[24];
  uint64_t v30;
  CGSize v31;

  v2 = v1;
  sub_22D81410C(a1, (uint64_t)v29);
  if (v30)
  {
    type metadata accessor for SystemApertureMetricsRequest();
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_22D8141F4();
      v3 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest];
      v4 = objc_retain(*(id *)(v1
                             + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
      v5 = v3;
      v6 = sub_22D84B76C();

      if ((v6 & 1) != 0)
      {
        v7 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest];
        v8 = objc_retain(*(id *)(v1
                               + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
        v9 = v7;
        v10 = sub_22D84B76C();

        if ((v10 & 1) != 0)
        {
          v11 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest];
          v12 = objc_retain(*(id *)(v1
                                  + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
          v13 = v11;
          v14 = sub_22D84B76C();

          if ((v14 & 1) != 0)
          {
            v15 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest];
            v16 = objc_retain(*(id *)(v1
                                    + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
            v17 = v15;
            v18 = sub_22D84B76C();

            if ((v18 & 1) != 0)
            {
              v19 = (CGFloat *)(v2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
              swift_beginAccess();
              v20 = *v19;
              v21 = v19[1];
              v22 = (CGSize *)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
              swift_beginAccess();
              v31.width = v20;
              v31.height = v21;
              if (CGSizeEqualToSize(v31, *v22))
              {
                v23 = (double *)(v2
                               + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
                swift_beginAccess();
                v24 = *v23;
                v25 = (double *)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin];
                swift_beginAccess();
                v26 = *v25;

                return v24 == v26;
              }
            }
          }
        }
      }

    }
  }
  else
  {
    sub_22D814194((uint64_t)v29);
  }
  return 0;
}

id sub_22D81F5AC()
{
  uint64_t v0;
  id result;
  void *v2;
  double *v3;
  double v4;
  double v5;
  void *v6;
  double *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;
    v3 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
    swift_beginAccess();
    v4 = *v3;
    v5 = v3[1];
    v6 = (void *)sub_22D84B5BC();

    v7 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
    swift_beginAccess();
    v8 = *v7;
    v9 = (void *)sub_22D84B5BC();

    v10 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
    v11 = (void *)sub_22D84B5BC();

    v12 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
    v13 = (void *)sub_22D84B5BC();

    v14 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
    v15 = (void *)sub_22D84B5BC();

    v16 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
    v17 = (void *)sub_22D84B5BC();

    result = objc_msgSend(v2, sel_build);
    if (result)
    {
      v18 = result;
      v19 = sub_22D84B5C8();

      return (id)v19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_22D81F8A4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  char *v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id result;
  objc_super v20;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  v7 = *v6;
  v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
  v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
  v10 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
  v11 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
  v12 = (objc_class *)type metadata accessor for SystemApertureMetricsRequest();
  v13 = (char *)objc_allocWithZone(v12);
  v14 = &v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(_QWORD *)v14 = v4;
  *((_QWORD *)v14 + 1) = v5;
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v7;
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v8;
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v9;
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v10;
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v11;
  v20.receiver = v13;
  v20.super_class = v12;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  result = objc_msgSendSuper2(&v20, sel_init);
  a1[3] = v12;
  *a1 = result;
  return result;
}

id SystemApertureMetricsRequest.__allocating_init(xpcDictionary:)()
{
  objc_class *v0;
  id v1;
  id v2;

  v1 = objc_allocWithZone(v0);
  v2 = sub_22D8200B0();
  swift_unknownObjectRelease();
  return v2;
}

id SystemApertureMetricsRequest.init(xpcDictionary:)()
{
  id v0;

  v0 = sub_22D8200B0();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_22D81FAF4()
{
  swift_beginAccess();
  BSSerializeCGSizeToXPCDictionaryWithKey();
  swift_beginAccess();
  BSSerializeDoubleToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

uint64_t static SystemApertureMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D81FC5C(void *a1)
{
  uint64_t v1;
  double *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double *v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v5, v4);

  v6 = v3[1];
  v7 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v7, v6);

  v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  v9 = *v8;
  v10 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v10, v9);

  v11 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
  v12 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  v13 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
  v14 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

  v15 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
  v16 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v15, v16);

  v17 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
  v18 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v17, v18);

}

id SystemApertureMetricsRequest.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D82039C(a1);

  return v4;
}

id SystemApertureMetricsRequest.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D82039C(a1);

  return v2;
}

id SystemApertureMetricsRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SystemApertureMetricsRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SystemApertureMetricsRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D8200B0()
{
  void *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[24];
  uint64_t v16;

  v1 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  v2 = &v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(_QWORD *)v2 = v3;
  *((_QWORD *)v2 + 1) = v4;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v5;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_22D81494C((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      v6 = v11;
      goto LABEL_9;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v15);
  }
  v6 = sub_22D844DE0();
LABEL_9:
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v6;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_22D81494C((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      v7 = v11;
      goto LABEL_17;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v15);
  }
  v7 = sub_22D844DE0();
LABEL_17:
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v7;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_22D81494C((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      v8 = v11;
      goto LABEL_25;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v15);
  }
  v8 = sub_22D844DE0();
LABEL_25:
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v8;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_22D81494C((uint64_t)&v13, (uint64_t)v15);
  if (!v16)
  {
    sub_22D814194((uint64_t)v15);
    goto LABEL_32;
  }
  type metadata accessor for ActivityItemMetricsRequest();
  if (!swift_dynamicCast())
  {
LABEL_32:
    v9 = sub_22D844DE0();
    goto LABEL_33;
  }
  v9 = v11;
LABEL_33:
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v9;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_22D82039C(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  objc_super v31;

  v3 = v1;
  v4 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v4);
  v6 = v5;

  v7 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v7);
  v9 = v8;

  v10 = &v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(_QWORD *)v10 = v6;
  *((_QWORD *)v10 + 1) = v9;
  v11 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v11);
  v13 = v12;

  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v13;
  type metadata accessor for ActivityItemMetricsRequest();
  v14 = sub_22D84B748();
  if (!v14)
  {
    sub_22D814908();
    v15 = (void *)swift_allocError();
    *v16 = 0xD000000000000010;
    v16[1] = 0x800000022D852000;
    v17 = (void *)sub_22D84B250();

    objc_msgSend(a1, sel_failWithError_, v17);
    v14 = (uint64_t)sub_22D844DE0();
  }
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v14;
  v18 = sub_22D84B748();
  if (!v18)
  {
    sub_22D814908();
    v19 = (void *)swift_allocError();
    *v20 = 0x206C616D696E696DLL;
    v20[1] = 0xEF7363697274656DLL;
    v21 = (void *)sub_22D84B250();

    objc_msgSend(a1, sel_failWithError_, v21);
    v18 = (uint64_t)sub_22D844DE0();
  }
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v18;
  v22 = sub_22D84B748();
  if (!v22)
  {
    sub_22D814908();
    v23 = (void *)swift_allocError();
    *v24 = 0xD000000000000017;
    v24[1] = 0x800000022D852020;
    v25 = (void *)sub_22D84B250();

    objc_msgSend(a1, sel_failWithError_, v25);
    v22 = (uint64_t)sub_22D844DE0();
  }
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v22;
  v26 = sub_22D84B748();
  if (!v26)
  {
    sub_22D814908();
    v27 = (void *)swift_allocError();
    *v28 = 0xD000000000000018;
    v28[1] = 0x800000022D852040;
    v29 = (void *)sub_22D84B250();

    objc_msgSend(a1, sel_failWithError_, v29);
    v26 = (uint64_t)sub_22D844DE0();
  }
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v26;

  v31.receiver = v3;
  v31.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v31, sel_init);
}

id sub_22D820728@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_22D820740(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81E868(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
}

id sub_22D82075C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_22D820774(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81E868(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
}

id sub_22D820790@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_22D8207A8(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81E868(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
}

id sub_22D8207C4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_22D8207DC(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81E868(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

__n128 sub_22D8207F8@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_22D820848(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  result = swift_beginAccess();
  *v4 = v2;
  v4[1] = v3;
  return result;
}

double sub_22D82089C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_22D8208EC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for SystemApertureMetricsRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 408))();
}

id sub_22D820BB0()
{
  void *v0;
  objc_super v2;

  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated) & 1) == 0)
    objc_msgSend(v0, sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityCancelTouchAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityCancelTouchAssertion()
{
  return objc_opt_self();
}

void sub_22D820CBC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated) & 1) == 0)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_assertions);
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v3 = sub_22D84B8D4();
      if (v3)
        goto LABEL_4;
    }
    else
    {
      v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return;
        }
        for (i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0)
            v5 = (id)MEMORY[0x22E317918](i, v2);
          else
            v5 = *(id *)(v2 + 8 * i + 32);
          v6 = v5;
          objc_msgSend(v5, sel_invalidate);

        }
      }
    }
    swift_bridgeObjectRelease();
    *(_BYTE *)(v0 + v1) = 1;
  }
}

id ActivityHostViewController.init(activitySceneDescriptor:)(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  id v22;
  objc_class *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  objc_super v38;

  v3 = sub_22D84B400();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D84B3AC();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily] = 2;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated] = 0;
  v9 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v10 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  v11 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector());
  v12 = v1;
  *(_QWORD *)&v1[v10] = objc_msgSend(v11, sel_init);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReady] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks] = v9;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks] = v9;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks] = v9;
  v13 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions;
  *(_QWORD *)&v12[v13] = sub_22D8333F8(v9);
  v14 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier];
  *v14 = 0;
  v14[1] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost] = 0;
  v15 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor] = a1;
  v16 = a1;
  sub_22D84B31C();
  sub_22D84B3A0();
  sub_22D8334F0((uint64_t)v8);
  v17 = sub_22D84B3F4();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v20 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
  *v20 = v17;
  v20[1] = v19;
  swift_beginAccess();
  v21 = *(void **)(*v15 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics] = v21;
  v22 = v21;

  v23 = (objc_class *)type metadata accessor for ActivityHostViewController();
  v38.receiver = v12;
  v38.super_class = v23;
  v24 = objc_msgSendSuper2(&v38, sel_initWithNibName_bundle_, 0, 0);
  v25 = qword_2540C5F08;
  v26 = v24;
  if (v25 != -1)
    swift_once();
  v27 = sub_22D84B49C();
  __swift_project_value_buffer(v27, (uint64_t)qword_2540C5EE8);
  v28 = v26;
  v29 = sub_22D84B484();
  v30 = sub_22D84B6DC();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v37 = v32;
    *(_DWORD *)v31 = 136446210;
    v33 = sub_22D821E84();
    v36[1] = sub_22D83157C(v33, v34, &v37);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v29, v30, "[%{public}s] Created", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v32, -1, -1);
    MEMORY[0x22E318218](v31, -1, -1);

  }
  else
  {

  }
  sub_22D823FDC();

  return v28;
}

uint64_t sub_22D8212BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x22E31826C](v1);
}

uint64_t sub_22D821304()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_22D82135C(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22E31826C](v5);
  return sub_22D816BFC;
}

id sub_22D8213CC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D821410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = sub_22D84B340();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D819F60(0, (unint64_t *)&qword_2540C5F90);
  v5 = (_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, *v5 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor, v1);
  return sub_22D84B730();
}

uint64_t sub_22D8214E4()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
}

void sub_22D8214F4(unsigned int a1)
{
  BSDispatchQueueAssertMain();
  sub_22D8248E4(a1, 0);
}

void (*sub_22D82151C(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1
                                  + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
  return sub_22D821540;
}

void sub_22D821540(uint64_t a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_22D8248E4(v1, 0);
}

uint64_t sub_22D821570()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D8215B4(char a1)
{
  uint64_t v1;
  int v3;
  _BYTE *v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v3 = a1 & 1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  result = swift_beginAccess();
  v6 = *v4;
  *v4 = a1;
  if (v6 != v3)
  {
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    BSDispatchQueueAssertMain();
    v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_22D833570;
      *(_QWORD *)(v9 + 24) = v7;
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = sub_22D833588;
      *(_QWORD *)(v10 + 24) = v9;
      aBlock[4] = sub_22D833588;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D82D4B0;
      aBlock[3] = &block_descriptor_1;
      v11 = _Block_copy(aBlock);
      v12 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_performUpdate_, v11);

      _Block_release(v11);
      LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      result = swift_release();
      if ((v11 & 1) == 0)
        return result;
      __break(1u);
    }
    return swift_release();
  }
  return result;
}

void (*sub_22D821768(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  swift_beginAccess();
  *((_BYTE *)v3 + 32) = *v4;
  return sub_22D8217D4;
}

void sub_22D8217D4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  sub_22D8215B4(*(_BYTE *)(*(_QWORD *)a1 + 32));
  free(v1);
}

void *sub_22D821800()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void *sub_22D82184C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void *sub_22D821898()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

uint64_t sub_22D8218E4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled);
  swift_beginAccess();
  return *v1;
}

void *sub_22D821928(unsigned __int8 a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  uint64_t v4;
  void *result;

  v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled);
  swift_beginAccess();
  *v3 = a1;
  BSDispatchQueueAssertMain();
  v4 = v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x22E31826C](v4);
  if (result)
  {
    objc_msgSend(result, sel_activityHostViewControllerWithViewController_didSetIdleTimerDisabled_, v1, *v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22D8219C8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D821A10@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_22D821A5C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D821AA0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D821AE4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

id sub_22D821B2C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  return *v1;
}

void sub_22D821B70(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_22D821BC0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_22D821C04()
{
  uint64_t v0;
  void **v1;
  char *v2;
  char *v3;
  char *v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  char *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  char *v13;
  void **v14;
  double *v15;
  void *v16;
  char *v17;
  char *v18;
  char *v19;
  id v20;
  objc_class *v21;
  char *v22;
  void **v23;
  void *v24;
  objc_super v26;
  objc_super v27;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  v2 = (char *)*v1;
  if (*(_QWORD *)((char *)*v1 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) == 2
    && (v3 = *(char **)&v2[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest],
        (v4 = *(char **)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics]) != 0))
  {
    v5 = *(double *)(*(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest]
                   + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    v6 = (double *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
    swift_beginAccess();
    v7 = v5 * *v6;
    v8 = *v6
       * *(double *)(*(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest]
                   + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    v9 = &v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
    swift_beginAccess();
    v10 = *(_QWORD *)v9;
    v11 = *(void **)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets];
    v12 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
    v13 = (char *)objc_allocWithZone(v12);
    v14 = (void **)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
    *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
    v15 = (double *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
    *v15 = v7;
    v15[1] = v8;
    *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = v10;
    swift_beginAccess();
    v16 = *v14;
    *v14 = v11;
    v17 = v11;
    v18 = v3;
    v19 = v4;

    v26.receiver = v13;
    v26.super_class = v12;
    v20 = objc_msgSendSuper2(&v26, sel_init);

  }
  else
  {
    v21 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
    v22 = (char *)objc_allocWithZone(v21);
    v23 = (void **)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
    *(_QWORD *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
    *(_OWORD *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_22D84F130;
    *(_QWORD *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
    swift_beginAccess();
    v24 = *v23;
    *v23 = 0;
    v17 = v2;

    v27.receiver = v22;
    v27.super_class = v21;
    v20 = objc_msgSendSuper2(&v27, sel_init);
  }

  return v20;
}

uint64_t sub_22D821E84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier);
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier
                 + 8))
  {
    v2 = *v1;
  }
  else
  {
    sub_22D84B880();
    sub_22D84B5EC();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    v2 = 0;
    *v1 = 0;
    v1[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_22D821F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_22D84B700();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D84B6F4();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_22D84B568();
  MEMORY[0x24BDAC7A8](v7);
  v8 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue;
  v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue);
  if (v9)
  {
    v10 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue);
  }
  else
  {
    v19 = v2;
    v18[3] = sub_22D819F60(0, &qword_2540C5F80);
    v11 = sub_22D821E84();
    v18[1] = v12;
    v18[2] = v11;
    if (qword_2540C5EC0 != -1)
      swift_once();
    v18[0] = qword_2540C6788;
    v13 = (id)qword_2540C6788;
    sub_22D84B55C();
    v20 = MEMORY[0x24BEE4AF8];
    sub_22D83514C((unint64_t *)&unk_2540C5F70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5F48);
    sub_22D8354F8(&qword_2540C5F50, &qword_2540C5F48);
    sub_22D84B7CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v19);
    v14 = (void *)sub_22D84B724();
    v15 = *(void **)(v1 + v8);
    *(_QWORD *)(v1 + v8) = v14;
    v10 = v14;

    v9 = 0;
  }
  v16 = v9;
  return v10;
}

void sub_22D8221C8(void *a1, uint64_t a2, void *a3, double a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  char v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  char *v70;
  _QWORD *v71;
  char *v72;
  id v73;
  char v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  void (*v78)();
  int v79;
  char *v80;
  NSObject *v81;
  os_log_type_t v82;
  _BOOL4 v83;
  id v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  void *v93;
  _QWORD *v94;
  char *v95;
  _QWORD *v96;
  char *v97;
  id v98;
  char v99;
  unint64_t v100;
  unint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  char *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  NSObject *v124;
  os_log_type_t v125;
  uint8_t *v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  _QWORD *v131;
  char *v132;
  id v133;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint8_t *v140;
  uint64_t ObjectType;
  uint64_t v142;
  id v143;
  _OWORD v144[2];
  void *v145;
  __int128 aBlock;
  __int128 v147;
  void *v148;
  _QWORD *v149;

  v137 = a2;
  ObjectType = swift_getObjectType();
  v8 = sub_22D84B400();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v137 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22D84B3AC();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v137 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if (qword_2540C5F08 != -1)
    swift_once();
  v15 = sub_22D84B49C();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2540C5EE8);
  v17 = v4;
  v142 = v16;
  v18 = sub_22D84B484();
  v19 = sub_22D84B6DC();
  v20 = os_log_type_enabled(v18, v19);
  v140 = (uint8_t *)v8;
  v139 = v9;
  v143 = a3;
  v138 = a1;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v22;
    *(_DWORD *)v21 = 136446210;
    v23 = sub_22D821E84();
    *(_QWORD *)&v144[0] = sub_22D83157C(v23, v24, (uint64_t *)&aBlock);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v18, v19, "[%{public}s] Ensure content begin", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v22, -1, -1);
    MEMORY[0x22E318218](v21, -1, -1);

  }
  else
  {

  }
  v25 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  if (!*(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene])
    sub_22D8248E4(*(_DWORD *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode], 1);
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BEB8]), sel_init);
  if (qword_255D962A0 != -1)
    swift_once();
  v27 = (void *)sub_22D84B5BC();
  objc_msgSend(v26, sel_addMilestone_, v27);

  v28 = (_QWORD *)swift_allocObject();
  v29 = v138;
  v28[2] = v26;
  v28[3] = v29;
  v30 = v137;
  v28[4] = v17;
  v28[5] = v30;
  v28[6] = v143;
  v148 = sub_22D83360C;
  v149 = v28;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v147 = sub_22D829EC4;
  *((_QWORD *)&v147 + 1) = &block_descriptor_12;
  v31 = _Block_copy(&aBlock);
  v32 = v17;
  v33 = v26;
  v34 = v29;
  swift_retain();
  swift_release();
  v143 = v33;
  objc_msgSend(v33, sel_setCompletionBlock_, v31);
  _Block_release(v31);
  v35 = &v32[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
  swift_beginAccess();
  sub_22D84B31C();
  sub_22D84B3A0();
  sub_22D8334F0((uint64_t)v14);
  v36 = sub_22D84B3F4();
  v38 = v37;
  (*(void (**)(char *, uint8_t *))(v139 + 8))(v11, v140);
  if (v36 == 0xD000000000000011 && v38 == 0x800000022D851580)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v39 = sub_22D84B994();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      if (*(_QWORD *)(*(_QWORD *)v35 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) > 1uLL)
        goto LABEL_41;
      v47 = (void *)sub_22D84B5BC();
      v48 = v143;
      objc_msgSend(v143, sel_addMilestone_, v47);

      v49 = *(void **)&v17[v25];
      if (v49)
      {
        v50 = objc_msgSend(v49, sel_clientSettings);
        if (v50)
        {
          v51 = v50;
          type metadata accessor for ActivitySceneClientSettings();
          v52 = (void *)swift_dynamicCastClass();
          if (v52)
          {
            v53 = objc_msgSend(v52, sel_otherSettings);
            swift_beginAccess();
            if (objc_msgSend(v53, sel_objectForSetting_, qword_255D97158))
            {
              sub_22D84B7C0();
              swift_unknownObjectRelease();
              sub_22D81CE70(v144, &aBlock);
            }
            else
            {
              aBlock = 0u;
              v147 = 0u;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
            type metadata accessor for ActivitySceneMetrics();
            if ((swift_dynamicCast() & 1) != 0)
            {
              v115 = v145;

              if (v115)
              {

                v116 = v32;
                v117 = sub_22D84B484();
                v118 = sub_22D84B6DC();
                if (os_log_type_enabled(v117, v118))
                {
                  v119 = (uint8_t *)swift_slowAlloc();
                  v120 = swift_slowAlloc();
                  *(_QWORD *)&aBlock = v120;
                  *(_DWORD *)v119 = 136446210;
                  v140 = v119 + 4;
                  v121 = sub_22D821E84();
                  *(_QWORD *)&v144[0] = sub_22D83157C(v121, v122, (uint64_t *)&aBlock);
                  sub_22D84B79C();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_22D80B000, v117, v118, "[%{public}s] Ensure content: initial content size ready", v119, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x22E318218](v120, -1, -1);
                  MEMORY[0x22E318218](v119, -1, -1);

                }
                else
                {

                }
                v114 = (void *)sub_22D84B5BC();
                objc_msgSend(v48, sel_satisfyMilestone_, v114, v137);
                goto LABEL_59;
              }
            }
            else
            {
              v145 = 0;

            }
          }
          else
          {

          }
        }
      }
      v123 = v32;
      v124 = sub_22D84B484();
      v125 = sub_22D84B6DC();
      if (os_log_type_enabled(v124, v125))
      {
        v126 = (uint8_t *)swift_slowAlloc();
        v127 = swift_slowAlloc();
        *(_QWORD *)&aBlock = v127;
        *(_DWORD *)v126 = 136446210;
        v128 = sub_22D821E84();
        *(_QWORD *)&v144[0] = sub_22D83157C(v128, v129, (uint64_t *)&aBlock);
        v48 = v143;
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D80B000, v124, v125, "[%{public}s] Ensure content: waiting on initial content size", v126, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E318218](v127, -1, -1);
        MEMORY[0x22E318218](v126, -1, -1);

      }
      else
      {

      }
      v69 = (_QWORD *)swift_allocObject();
      v69[2] = v123;
      v69[3] = v48;
      v69[4] = ObjectType;
      v130 = &v123[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks];
      swift_beginAccess();
      v131 = *(_QWORD **)v130;
      v132 = v123;
      v133 = v48;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v130 = v131;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v131 = sub_22D8313E0(0, v131[2] + 1, 1, v131);
        *(_QWORD *)v130 = v131;
      }
      v136 = v131[2];
      v135 = v131[3];
      if (v136 >= v135 >> 1)
      {
        v131 = sub_22D8313E0((_QWORD *)(v135 > 1), v136 + 1, 1, v131);
        *(_QWORD *)v130 = v131;
      }
      v131[2] = v136 + 1;
      v77 = &v131[2 * v136];
      v78 = sub_22D83365C;
LABEL_40:
      v77[4] = v78;
      v77[5] = v69;
      swift_endAccess();
      goto LABEL_41;
    }
  }
  v40 = (void *)sub_22D84B5BC();
  v41 = v143;
  objc_msgSend(v143, sel_addMilestone_, v40);

  v42 = *(void **)&v17[v25];
  if (!v42)
    goto LABEL_32;
  v43 = objc_msgSend(v42, sel_clientSettings);
  if (!v43)
    goto LABEL_32;
  v44 = v43;
  type metadata accessor for ActivitySceneClientSettings();
  v45 = (void *)swift_dynamicCastClass();
  if (!v45)
  {

    goto LABEL_32;
  }
  v46 = objc_msgSend(v45, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v46, sel_objectForSetting_, qword_255D97128))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(v144, &aBlock);
  }
  else
  {
    aBlock = 0u;
    v147 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if ((swift_dynamicCast() & 1) == 0)
  {
    LOBYTE(v145) = 2;

    goto LABEL_32;
  }
  v54 = (char)v145;

  if ((v54 & 1) == 0)
  {
LABEL_32:
    v62 = v32;
    v63 = sub_22D84B484();
    v64 = sub_22D84B6DC();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      v66 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v66;
      *(_DWORD *)v65 = 136446210;
      v67 = sub_22D821E84();
      *(_QWORD *)&v144[0] = sub_22D83157C(v67, v68, (uint64_t *)&aBlock);
      v41 = v143;
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v63, v64, "[%{public}s] Ensure content: waiting on content ready", v65, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v66, -1, -1);
      MEMORY[0x22E318218](v65, -1, -1);

    }
    else
    {

    }
    v69 = (_QWORD *)swift_allocObject();
    v69[2] = v62;
    v69[3] = v41;
    v69[4] = ObjectType;
    v70 = &v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks];
    swift_beginAccess();
    v71 = *(_QWORD **)v70;
    v72 = v62;
    v73 = v41;
    v74 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v70 = v71;
    if ((v74 & 1) == 0)
    {
      v71 = sub_22D8313E0(0, v71[2] + 1, 1, v71);
      *(_QWORD *)v70 = v71;
    }
    v76 = v71[2];
    v75 = v71[3];
    if (v76 >= v75 >> 1)
    {
      v71 = sub_22D8313E0((_QWORD *)(v75 > 1), v76 + 1, 1, v71);
      *(_QWORD *)v70 = v71;
    }
    v71[2] = v76 + 1;
    v77 = &v71[2 * v76];
    v78 = sub_22D833698;
    goto LABEL_40;
  }
  v55 = v32;
  v56 = sub_22D84B484();
  v57 = sub_22D84B6DC();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    v59 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v59;
    *(_DWORD *)v58 = 136446210;
    v140 = v58 + 4;
    v60 = sub_22D821E84();
    *(_QWORD *)&v144[0] = sub_22D83157C(v60, v61, (uint64_t *)&aBlock);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v56, v57, "[%{public}s] Ensure content: archive content ready", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v59, -1, -1);
    MEMORY[0x22E318218](v58, -1, -1);

  }
  else
  {

  }
  v114 = (void *)sub_22D84B5BC();
  objc_msgSend(v41, sel_satisfyMilestone_, v114, v137);
LABEL_59:

LABEL_41:
  v79 = v32[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated];
  v80 = v32;
  v81 = sub_22D84B484();
  v82 = sub_22D84B6DC();
  v83 = os_log_type_enabled(v81, v82);
  if (v79 == 1)
  {
    v84 = v143;
    if (v83)
    {
      v85 = (uint8_t *)swift_slowAlloc();
      v86 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v86;
      *(_DWORD *)v85 = 136446210;
      v87 = sub_22D821E84();
      *(_QWORD *)&v144[0] = sub_22D83157C(v87, v88, (uint64_t *)&aBlock);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v81, v82, "[%{public}s] Ensure content: scene activated", v85, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v86, -1, -1);
      MEMORY[0x22E318218](v85, -1, -1);

    }
    else
    {

    }
    v93 = (void *)sub_22D84B5BC();
    objc_msgSend(v84, sel_satisfyMilestone_, v93);

  }
  else
  {
    v84 = v143;
    if (v83)
    {
      v89 = (uint8_t *)swift_slowAlloc();
      v90 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v90;
      *(_DWORD *)v89 = 136446210;
      v91 = sub_22D821E84();
      *(_QWORD *)&v144[0] = sub_22D83157C(v91, v92, (uint64_t *)&aBlock);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v81, v82, "[%{public}s] Ensure content: waiting on scene activation", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v90, -1, -1);
      MEMORY[0x22E318218](v89, -1, -1);

    }
    else
    {

    }
    v94 = (_QWORD *)swift_allocObject();
    v94[2] = v80;
    v94[3] = v84;
    v94[4] = ObjectType;
    v95 = &v80[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks];
    swift_beginAccess();
    v96 = *(_QWORD **)v95;
    v97 = v80;
    v98 = v84;
    v99 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v95 = v96;
    if ((v99 & 1) == 0)
    {
      v96 = sub_22D8313E0(0, v96[2] + 1, 1, v96);
      *(_QWORD *)v95 = v96;
    }
    v101 = v96[2];
    v100 = v96[3];
    if (v101 >= v100 >> 1)
    {
      v96 = sub_22D8313E0((_QWORD *)(v100 > 1), v101 + 1, 1, v96);
      *(_QWORD *)v95 = v96;
    }
    v96[2] = v101 + 1;
    v102 = &v96[2 * v101];
    v102[4] = sub_22D833648;
    v102[5] = v94;
    swift_endAccess();
  }
  objc_msgSend(v84, sel_begin, v137);
  v103 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer;
  objc_msgSend(*(id *)&v80[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer], sel_invalidate);
  v104 = objc_allocWithZone(MEMORY[0x24BE0BD78]);
  v105 = (void *)sub_22D84B5BC();
  v106 = objc_msgSend(v104, sel_initWithIdentifier_, v105);

  v107 = *(void **)&v80[v103];
  *(_QWORD *)&v80[v103] = v106;

  v108 = *(void **)&v80[v103];
  if (v108)
  {
    sub_22D819F60(0, &qword_2540C5F80);
    v109 = v108;
    v110 = sub_22D84B70C();
    v111 = swift_allocObject();
    *(_QWORD *)(v111 + 16) = v84;
    v148 = sub_22D833654;
    v149 = (_QWORD *)v111;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v147 = sub_22D81E14C;
    *((_QWORD *)&v147 + 1) = &block_descriptor_21;
    v112 = _Block_copy(&aBlock);
    v113 = v84;
    swift_release();
    objc_msgSend(v109, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v110, v112, a4, 0.0);

    _Block_release(v112);
    v84 = (id)v110;
  }

}

id sub_22D823478()
{
  uint64_t v0;
  id result;

  BSDispatchQueueAssertMain();
  result = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (result)
    return objc_msgSend(result, sel_backlightSceneHostEnvironment);
  return result;
}

void sub_22D8234B0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19[3];

  BSDispatchQueueAssertMain();
  v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated;
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) & 1) == 0)
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v2 = sub_22D84B49C();
    __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EE8);
    v3 = v0;
    v4 = sub_22D84B484();
    v5 = sub_22D84B6DC();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v19[0] = v7;
      *(_DWORD *)v6 = 136446210;
      v8 = sub_22D821E84();
      sub_22D83157C(v8, v9, v19);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v4, v5, "[%{public}s] Invalidated", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v7, -1, -1);
      MEMORY[0x22E318218](v6, -1, -1);

    }
    else
    {

    }
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    *((_BYTE *)v0 + v1) = 1;
    sub_22D826464();
    v10 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer;
    v11 = *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer];
    if (v11)
    {
      v12 = *(void **)(v11 + 16);
      swift_retain();
      objc_msgSend(v12, sel_invalidate);
      v13 = *(void **)(v11 + 16);
      *(_QWORD *)(v11 + 16) = 0;

      objc_msgSend(*(id *)(v11 + 88), sel_invalidate);
      v14 = *(void **)(v11 + 88);
      *(_QWORD *)(v11 + 88) = 0;
      swift_release();

    }
    *(_QWORD *)&v3[v10] = 0;
    swift_release();
    v15 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer], sel_invalidate);
    v16 = *(void **)&v3[v15];
    *(_QWORD *)&v3[v15] = 0;

    v17 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer], sel_invalidate);
    v18 = *(void **)&v3[v17];
    *(_QWORD *)&v3[v17] = 0;

  }
}

uint64_t sub_22D823748()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  return *v1;
}

void sub_22D82378C(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  *v3 = a1;
  BSDispatchQueueAssertMain();
  if (*v3 == 1)
    sub_22D8267C4();
  else
    sub_22D826F10();
}

void (*sub_22D8237F8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_22D823850;
}

void sub_22D823850(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v5 = v3[3];
    v4 = v3[4];
    BSDispatchQueueAssertMain();
    if (*(_BYTE *)(v5 + v4) == 1)
      sub_22D8267C4();
    else
      sub_22D826F10();
  }
  free(v3);
}

void sub_22D8238AC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  objc_class *v27;
  _BYTE *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  objc_super v36;
  uint64_t v37;
  __int128 aBlock;
  void (*v39)(uint64_t, void *);
  void *v40;
  void (*v41)(void *);
  uint64_t v42;

  v1 = sub_22D84B274();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v0;
  v41 = sub_22D8336D4;
  v42 = v5;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v39 = sub_22D827B8C;
  v40 = &block_descriptor_33;
  v6 = _Block_copy(&aBlock);
  v7 = v0;
  swift_release();
  v8 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  _Block_release(v6);
  v9 = objc_msgSend(v7, sel_view);
  if (!v9)
  {
    __break(1u);
    goto LABEL_20;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_window);

  if (!v11)
  {
LABEL_18:
    swift_unknownObjectRelease();
    return;
  }
  if (!v8)
  {

    return;
  }
  v12 = *(void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v12)
  {

    goto LABEL_18;
  }
  v32 = v2;
  v33 = v1;
  v13 = (void *)*MEMORY[0x24BEBDF78];
  if (!*MEMORY[0x24BEBDF78])
  {
LABEL_20:
    __break(1u);
    return;
  }
  swift_unknownObjectRetain();
  v14 = v12;
  v31 = v11;
  objc_msgSend(v13, sel__initialTouchTimestampForWindow_, v11);
  v16 = v15;
  v30 = v14;
  v17 = objc_msgSend(v14, sel_layerManager);
  v18 = objc_msgSend(v17, sel_layers);

  v37 = MEMORY[0x24BEE4AF8];
  v29 = v18;
  sub_22D84B6B8();
  sub_22D84B268();
  while (v40)
  {
    sub_22D81CE70(&aBlock, &v35);
    sub_22D819F60(0, &qword_2540C5F58);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v20 = v34;
      v21 = objc_msgSend(v34, sel_contextID);
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0B6F0]), sel_init);
      v23 = objc_msgSend((id)objc_opt_self(), sel_policyCancelingTouchesDeliveredToContextId_withInitialTouchTimestamp_, v21, v16);
      v24 = v23;
      if (v23)
      {
        v25 = v23;
        objc_msgSend(v25, sel_setAssertionEndpoint_, objc_msgSend(v22, sel_endpoint));

        swift_unknownObjectRelease();
      }
      objc_msgSend(v8, sel_ipc_addPolicy_, v24);
      v19 = v22;
      MEMORY[0x22E3176D8]();
      if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22D84B664();
      sub_22D84B670();
      sub_22D84B658();

    }
    sub_22D84B268();
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v33);
  v26 = v37;
  v27 = (objc_class *)type metadata accessor for ActivityCancelTouchAssertion();
  v28 = objc_allocWithZone(v27);
  v28[OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated] = 0;
  *(_QWORD *)&v28[OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_assertions] = v26;
  v36.receiver = v28;
  v36.super_class = v27;
  objc_msgSendSuper2(&v36, sel_init);

  swift_unknownObjectRelease_n();
}

void sub_22D823CE4()
{
  char *v0;
  id v1;
  void *v2;
  uint64_t inited;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  unint64_t v20;

  v1 = objc_msgSend(objc_allocWithZone((Class)ACUISHandleLiveActivityDoubleTapAction), sel_init);
  v2 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  v19 = v1;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6320);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22D84F140;
    *(_QWORD *)(inited + 32) = v19;
    v20 = inited;
    sub_22D84B658();
    if (v20 >> 62)
    {
      v15 = v2;
      v16 = v19;
      swift_bridgeObjectRetain();
      v17 = sub_22D84B8D4();
      swift_bridgeObjectRelease();
      if (!v17)
        goto LABEL_11;
    }
    else
    {
      v4 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      v5 = v2;
      v6 = v19;
      if (!v4)
      {
LABEL_11:
        swift_bridgeObjectRelease();
        sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
        sub_22D833C04();
        v18 = (void *)sub_22D84B688();
        swift_bridgeObjectRelease();
        objc_msgSend(v2, sel_sendActions_, v18);

        return;
      }
    }
    sub_22D8338A8(v20);
    goto LABEL_11;
  }
  if (qword_2540C5F08 != -1)
    swift_once();
  v7 = sub_22D84B49C();
  __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
  v8 = v0;
  v9 = sub_22D84B484();
  v10 = sub_22D84B6D0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v20 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_22D821E84();
    sub_22D83157C(v13, v14, (uint64_t *)&v20);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v9, v10, "[%{public}s] Did fail to send Double Tap BSAction.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v12, -1, -1);
    MEMORY[0x22E318218](v11, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_22D823FDC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t aBlock;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;

  v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector);
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v4 = qword_255D970F8;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_22D835610;
  *(_QWORD *)(v5 + 24) = v3;
  v66 = sub_22D83564C;
  v67 = v5;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_222;
  v6 = _Block_copy(&aBlock);
  v7 = v2;
  swift_retain_n();
  swift_release();
  objc_msgSend(v7, sel_observeOtherSetting_withBlock_, v4, v6);
  _Block_release(v6);

  swift_release_n();
  v8 = *(void **)(v0 + v1);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v10 = qword_255D97110;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_22D835654;
  *(_QWORD *)(v11 + 24) = v9;
  v66 = sub_22D8359E0;
  v67 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_230;
  v12 = _Block_copy(&aBlock);
  v13 = v8;
  swift_retain_n();
  swift_release();
  objc_msgSend(v13, sel_observeOtherSetting_withBlock_, v10, v12);
  _Block_release(v12);

  swift_release_n();
  v14 = *(void **)(v0 + v1);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v16 = qword_255D97128;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_22D835690;
  *(_QWORD *)(v17 + 24) = v15;
  v66 = sub_22D8359E0;
  v67 = v17;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_238;
  v18 = _Block_copy(&aBlock);
  v19 = v14;
  swift_retain_n();
  swift_release();
  objc_msgSend(v19, sel_observeOtherSetting_withBlock_, v16, v18);
  _Block_release(v18);

  swift_release_n();
  v20 = *(void **)(v0 + v1);
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v22 = qword_255D97158;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_22D83569C;
  *(_QWORD *)(v23 + 24) = v21;
  v66 = sub_22D8359E0;
  v67 = v23;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_246;
  v24 = _Block_copy(&aBlock);
  v25 = v20;
  swift_retain_n();
  swift_release();
  objc_msgSend(v25, sel_observeOtherSetting_withBlock_, v22, v24);
  _Block_release(v24);

  swift_release_n();
  v26 = *(void **)(v0 + v1);
  v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v28 = qword_255D97170;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_22D8356A8;
  *(_QWORD *)(v29 + 24) = v27;
  v66 = sub_22D8359E0;
  v67 = v29;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_254;
  v30 = _Block_copy(&aBlock);
  v31 = v26;
  swift_retain_n();
  swift_release();
  objc_msgSend(v31, sel_observeOtherSetting_withBlock_, v28, v30);
  _Block_release(v30);

  swift_release_n();
  v32 = *(void **)(v0 + v1);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v34 = qword_255D97188;
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_22D8356B4;
  *(_QWORD *)(v35 + 24) = v33;
  v66 = sub_22D8359E0;
  v67 = v35;
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_262;
  v36 = _Block_copy(&aBlock);
  v37 = v32;
  swift_retain_n();
  swift_release();
  objc_msgSend(v37, sel_observeOtherSetting_withBlock_, v34, v36);
  _Block_release(v36);

  swift_release_n();
  v38 = *(void **)(v0 + v1);
  v39 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v66 = sub_22D8356C0;
  v67 = v39;
  v40 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v63 = 1107296256;
  v64 = sub_22D829EC4;
  v65 = &block_descriptor_266;
  v41 = _Block_copy(&aBlock);
  v42 = v38;
  swift_release();
  objc_msgSend(v42, sel_observeAudioCategoriesDisablingVolumeHUDWithBlock_, v41);
  _Block_release(v41);

  v43 = *(void **)(v0 + v1);
  v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v45 = qword_255D971A0;
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = sub_22D8356C8;
  *(_QWORD *)(v46 + 24) = v44;
  v66 = sub_22D8359E0;
  v67 = v46;
  aBlock = v40;
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_274;
  v47 = _Block_copy(&aBlock);
  v48 = v43;
  swift_retain_n();
  swift_release();
  objc_msgSend(v48, sel_observeOtherSetting_withBlock_, v45, v47);
  _Block_release(v47);

  swift_release_n();
  v49 = *(void **)(v0 + v1);
  v50 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v51 = qword_255D971B8;
  v52 = swift_allocObject();
  *(_QWORD *)(v52 + 16) = sub_22D8356D4;
  *(_QWORD *)(v52 + 24) = v50;
  v66 = sub_22D8359E0;
  v67 = v52;
  aBlock = v40;
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_282;
  v53 = _Block_copy(&aBlock);
  v54 = v49;
  swift_retain_n();
  swift_release();
  objc_msgSend(v54, sel_observeOtherSetting_withBlock_, v51, v53);
  _Block_release(v53);

  swift_release_n();
  v55 = *(void **)(v0 + v1);
  v56 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v57 = qword_255D971D0;
  v58 = swift_allocObject();
  *(_QWORD *)(v58 + 16) = sub_22D8356E0;
  *(_QWORD *)(v58 + 24) = v56;
  v66 = sub_22D8359E0;
  v67 = v58;
  aBlock = v40;
  v63 = 1107296256;
  v64 = sub_22D83FA20;
  v65 = &block_descriptor_290;
  v59 = _Block_copy(&aBlock);
  v60 = v55;
  swift_retain_n();
  swift_release();
  objc_msgSend(v60, (SEL)&classRef_ACUISActivitySceneAction + 5, v57, v59);
  _Block_release(v59);

  return swift_release_n();
}

void sub_22D8248E4(unsigned int a1, int a2)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  char *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t aBlock[6];
  uint64_t v69;

  v67 = sub_22D84B550();
  v5 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22D84B568();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v66 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D84B49C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if ((v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] & 1) != 0
    || (a2 & 1) == 0
    && *(_DWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] == a1)
  {
    return;
  }
  v61 = a2;
  v62 = v9;
  v63 = v8;
  v64 = v7;
  v65 = v5;
  if (qword_2540C5F08 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)qword_2540C5EE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = v2;
  v17 = sub_22D84B484();
  v18 = sub_22D84B6DC();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    v59 = v18;
    v60 = v15;
    v19 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)v19 = 136446722;
    v20 = sub_22D821E84();
    v69 = sub_22D83157C(v20, v21, aBlock);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    if (a1 >= 3)
    {
LABEL_37:
      LODWORD(v69) = a1;
LABEL_39:
      sub_22D84B9A0();
      __break(1u);
      return;
    }
    v69 = sub_22D83157C(*(_QWORD *)&aNone[8 * a1], *(_QWORD *)&aLiveSna[8 * a1 + 8], aBlock);
    sub_22D84B79C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 1026;
    LODWORD(v69) = v61 & 1;
    sub_22D84B79C();
    _os_log_impl(&dword_22D80B000, v17, (os_log_type_t)v59, "[%{public}s] Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v19, 0x1Cu);
    v22 = v58;
    swift_arrayDestroy();
    MEMORY[0x22E318218](v22, -1, -1);
    MEMORY[0x22E318218](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v23 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode;
  *(_DWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = a1;
  if (!a1)
  {
    v33 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
    if (v33)
    {
      v34 = v33;
      v35 = (void *)sub_22D84B5BC();
      objc_msgSend(v34, sel_setText_, v35);

      v36 = objc_msgSend(v16, sel_view);
      if (!v36)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v37 = v36;
      objc_msgSend(v36, sel_setNeedsLayout);

    }
LABEL_24:
    v38 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
    if (v38)
    {
      v39 = v38;
      v40 = (void *)sub_22D84B5BC();
      objc_msgSend(v39, sel_setText_, v40);

      v41 = objc_msgSend(v16, sel_view);
      if (!v41)
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      v42 = v41;
      objc_msgSend(v41, sel_setNeedsLayout);

    }
    sub_22D827614(0, 1);
    sub_22D8252DC((char *)(a1 == 1), 0, 0);
    goto LABEL_28;
  }
  if (a1 == 1)
    goto LABEL_24;
  if (a1 != 2)
  {
    LODWORD(aBlock[0]) = a1;
    goto LABEL_39;
  }
  v24 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
  if (v24)
  {
    v25 = v24;
    v26 = (void *)sub_22D84B5BC();
    objc_msgSend(v25, sel_setText_, v26);

    v27 = objc_msgSend(v16, sel_view);
    if (!v27)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v28 = v27;
    objc_msgSend(v27, sel_setNeedsLayout);

  }
  v29 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v29)
  {
    v30 = v29;
    if (objc_msgSend(v30, sel_contentState) != (id)2)
      sub_22D8252DC((char *)1, 0, 0);
    BSDispatchQueueAssertMain();
    if (*(_DWORD *)&v16[v23] == 2)
    {
      v31 = swift_allocObject();
      *(_QWORD *)(v31 + 16) = v16;
      v32 = v16;
      sub_22D827814((uint64_t)sub_22D8355A4, v31);

      swift_release();
LABEL_28:
      v43 = sub_22D821F94();
      v44 = swift_allocObject();
      *(_QWORD *)(v44 + 16) = v16;
      *(_BYTE *)(v44 + 24) = a1 == 1;
      aBlock[4] = (uint64_t)sub_22D8355AC;
      aBlock[5] = v44;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_22D829EC0;
      aBlock[3] = (uint64_t)&block_descriptor_215;
      v45 = _Block_copy(aBlock);
      v46 = v16;
      v47 = v66;
      sub_22D84B55C();
      v69 = MEMORY[0x24BEE4AF8];
      sub_22D83514C(&qword_2540C5F18, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5F30);
      sub_22D8354F8((unint64_t *)&unk_2540C5F38, &qword_2540C5F30);
      v48 = v64;
      v49 = v67;
      sub_22D84B7CC();
      MEMORY[0x22E3177C8](0, v47, v48, v45);
      _Block_release(v45);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v48, v49);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v63);
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_34;
  }
  v50 = v16;
  v51 = sub_22D84B484();
  v52 = sub_22D84B6D0();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    aBlock[0] = v54;
    *(_DWORD *)v53 = 136446210;
    v55 = sub_22D821E84();
    v69 = sub_22D83157C(v55, v56, aBlock);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v51, v52, "[%{public}s] Snapshot failed because there is no scene found", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v54, -1, -1);
    MEMORY[0x22E318218](v53, -1, -1);

  }
  else
  {

  }
}

void sub_22D825148(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v2 = v1;
  v4 = sub_22D84B574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (id *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v7 = sub_22D821F94();
  (*(void (**)(id *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v8 = sub_22D84B580();
  (*(void (**)(id *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    v9 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion;
    v10 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion);
    if (v10)
    {
      v11 = v10;
      sub_22D84B460();

    }
    if ((a1 & 1) != 0)
    {
      swift_beginAccess();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      objc_allocWithZone((Class)sub_22D84B478());
      swift_bridgeObjectRetain();
      v12 = sub_22D84B46C();
      v13 = *(void **)(v2 + v9);
      *(_QWORD *)(v2 + v9) = v12;

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_22D8252DC(char *a1, void *a2, char *a3)
{
  uint64_t v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  char *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  char isEscapingClosureAtFileLocation;
  id v51;
  char *v52;
  uint64_t v53;
  void *v54;
  char *v55;
  char *v56;
  char *v57;
  double *v58;
  double v59;
  double *v60;
  uint64_t v61;
  double *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  char *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  int v110;
  id v111;
  id v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  id v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  uint64_t aBlock;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  _QWORD *v126;

  v7 = sub_22D84B49C();
  v8 = *(char **)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v103 - v12;
  BSDispatchQueueAssertMain();
  v14 = (char *)OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  v15 = *(void **)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v15)
  {
    v116 = v8;
    v31 = *(id *)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource);
    v8 = *(char **)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8);
    v32 = sub_22D817EC4((uint64_t)v31, (unint64_t)v8);
    if (!v32)
      goto LABEL_34;
    v33 = v32;
    v115 = v7;
    v110 = (int)a1;
    v117 = a2;
    v34 = (void *)objc_opt_self();
    v112 = v33;
    v35 = objc_msgSend(v34, sel_identityForProcessIdentity_, v33);
    if (qword_2540C5EA8 != -1)
      swift_once();
    v36 = (void *)qword_2540C5EA0;
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v3;
    *(_QWORD *)(v37 + 24) = v35;
    v38 = (char *)swift_allocObject();
    *((_QWORD *)v38 + 2) = sub_22D835398;
    *((_QWORD *)v38 + 3) = v37;
    v109 = v37;
    v125 = sub_22D833588;
    v126 = v38;
    aBlock = MEMORY[0x24BDAC760];
    v122 = 1107296256;
    v123 = sub_22D82D76C;
    v124 = &block_descriptor_149;
    v39 = _Block_copy(&aBlock);
    v40 = (uint64_t)v126;
    v41 = (char *)(id)v3;
    v111 = v35;
    swift_retain();
    swift_release();
    v42 = objc_msgSend(v36, sel_createScene_, v39);
    _Block_release(v39);
    LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v39 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v43 = *(void **)&v14[v3];
      *(_QWORD *)&v14[v3] = v42;
      v14 = (char *)v42;

      objc_msgSend(v14, sel_setDelegate_, v41);
      v44 = objc_msgSend(v14, sel_layerManager);
      objc_msgSend(v44, sel_addObserver_, v41);

      v45 = objc_msgSend(v14, sel_uiPresentationManager);
      if (!v45)
      {
        __break(1u);
        goto LABEL_48;
      }
      v46 = v45;
      v47 = (void *)sub_22D84B5BC();
      v48 = objc_msgSend(v46, sel_createPresenterWithIdentifier_, v47);

      *(_QWORD *)&v41[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = v48;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      v125 = sub_22D82D7A8;
      v126 = 0;
      v49 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v122 = 1107296256;
      v123 = sub_22D8359EC;
      v124 = &block_descriptor_152;
      v38 = (char *)_Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v48, sel_modifyPresentationContext_, v38);
      _Block_release(v38);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      v40 = v115;
      if ((isEscapingClosureAtFileLocation & 1) == 0)
      {
        objc_msgSend(v48, sel_activate);
        v108 = v48;
        v51 = objc_msgSend(v48, sel_presentationView);
        v113 = (char *)sub_22D821C04();
        v52 = &v41[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics];
        swift_beginAccess();
        v53 = *(_QWORD *)v52;
        v54 = *(void **)(*(_QWORD *)v52 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
        v55 = &v41[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
        swift_beginAccess();
        if (*(_QWORD *)(*(_QWORD *)v55 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) == 2
          && *(_QWORD *)(v53 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics))
        {
          v54 = *(void **)(v53 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
        }
        v114 = a3;
        a3 = v54;
        v56 = v113;
        v57 = &v113[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
        swift_beginAccess();
        v119 = *(_OWORD *)v57;
        v58 = (double *)&v56[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
        swift_beginAccess();
        if (*(double *)(*(_QWORD *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest]
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || *(double *)(*(_QWORD *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest]
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || (v59 = *v58,
              v60 = (double *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius],
              swift_beginAccess(),
              *v60 != 0.0))
        {
          *(_QWORD *)&v119 = sub_22D843120();
          *((_QWORD *)&v119 + 1) = v61;
          v62 = (double *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
          swift_beginAccess();
          v59 = *v62;
        }
        v63 = *(void **)&v41[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView];
        *(_QWORD *)&v41[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = v51;
        v64 = v51;

        v65 = objc_msgSend(v41, sel_view);
        if (v65)
        {
          v66 = v65;
          objc_msgSend(v65, sel_addSubview_, v64);

          v67 = objc_msgSend(v41, sel_view);
          if (v67)
          {
            v68 = v67;
            v107 = a3;
            objc_msgSend(v67, sel_setNeedsLayout);

            objc_msgSend(v64, sel_setClipsToBounds_, 1);
            v69 = objc_msgSend(v64, sel_layer);
            v70 = (void *)sub_22D84B5BC();
            objc_msgSend(v69, sel_setName_, v70);

            v106 = v64;
            objc_msgSend(v64, sel__setContinuousCornerRadius_, v59);
            objc_msgSend(v41, sel_setPreferredContentSize_, v119);
            v71 = swift_allocObject();
            *(_QWORD *)(v71 + 16) = v41;
            v72 = swift_allocObject();
            *(_QWORD *)(v72 + 16) = sub_22D8353D4;
            *(_QWORD *)(v72 + 24) = v71;
            v105 = v71;
            v125 = sub_22D8358C8;
            v126 = (_QWORD *)v72;
            aBlock = v49;
            v122 = 1107296256;
            v123 = sub_22D82DA44;
            v124 = &block_descriptor_161;
            v73 = _Block_copy(&aBlock);
            v38 = v41;
            swift_retain();
            swift_release();
            objc_msgSend(v14, sel_configureParameters_, v73);
            _Block_release(v73);
            LOBYTE(v73) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            if ((v73 & 1) == 0)
            {
              a3 = v116;
              if (qword_2540C5F08 == -1)
                goto LABEL_26;
              goto LABEL_44;
            }
LABEL_43:
            __break(1u);
LABEL_44:
            swift_once();
LABEL_26:
            v104 = v14;
            v74 = __swift_project_value_buffer(v40, (uint64_t)qword_2540C5EE8);
            (*((void (**)(char *, uint64_t, uint64_t))a3 + 2))(v11, v74, v40);
            v75 = v38;
            v76 = sub_22D84B484();
            v77 = sub_22D84B6DC();
            if (os_log_type_enabled(v76, v77))
            {
              v78 = swift_slowAlloc();
              v79 = swift_slowAlloc();
              aBlock = v79;
              *(_DWORD *)v78 = 136446466;
              v80 = sub_22D821E84();
              v118 = sub_22D83157C(v80, v81, &aBlock);
              sub_22D84B79C();

              swift_bridgeObjectRelease();
              *(_WORD *)(v78 + 12) = 2082;
              v82 = v110;
              if ((v110 & 1) != 0)
                v83 = 0x756F726765726F66;
              else
                v83 = 0x756F72676B636162;
              v118 = sub_22D83157C(v83, 0xEA0000000000646ELL, &aBlock);
              sub_22D84B79C();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_22D80B000, v76, v77, "[%{public}s] Creating activity scene to %{public}s.", (uint8_t *)v78, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x22E318218](v79, -1, -1);
              MEMORY[0x22E318218](v78, -1, -1);

              (*((void (**)(char *, uint64_t))a3 + 1))(v11, v115);
            }
            else
            {

              (*((void (**)(char *, uint64_t))a3 + 1))(v11, v40);
              v82 = v110;
            }
            v3 = swift_allocObject();
            *(_QWORD *)(v3 + 16) = &v119;
            *(_BYTE *)(v3 + 24) = v82 & 1;
            v95 = v113;
            *(_QWORD *)(v3 + 32) = v75;
            *(_QWORD *)(v3 + 40) = v95;
            v7 = swift_allocObject();
            *(_QWORD *)(v7 + 16) = sub_22D835418;
            *(_QWORD *)(v7 + 24) = v3;
            v125 = sub_22D8358C8;
            v126 = (_QWORD *)v7;
            v96 = MEMORY[0x24BDAC760];
            aBlock = MEMORY[0x24BDAC760];
            v122 = 1107296256;
            v123 = sub_22D82D4B0;
            v124 = &block_descriptor_171;
            v8 = (char *)_Block_copy(&aBlock);
            v97 = v75;
            v98 = v95;
            swift_retain();
            swift_release();
            v99 = swift_allocObject();
            v100 = (uint64_t)v117;
            v101 = v114;
            *(_QWORD *)(v99 + 16) = v117;
            *(_QWORD *)(v99 + 24) = v101;
            v125 = sub_22D83543C;
            v126 = (_QWORD *)v99;
            aBlock = v96;
            v122 = 1107296256;
            v123 = sub_22D82D504;
            v124 = &block_descriptor_177;
            v102 = _Block_copy(&aBlock);
            sub_22D835440(v100);
            swift_release();
            v31 = v104;
            objc_msgSend(v104, sel_performUpdate_withCompletion_, v8, v102);

            _Block_release(v102);
            _Block_release(v8);

            swift_unknownObjectRelease();
            LOBYTE(v98) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            if ((v98 & 1) != 0)
            {
              __break(1u);
LABEL_46:
              swift_once();
LABEL_35:
              __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
              v117 = (id)v3;
              v89 = sub_22D84B484();
              v90 = sub_22D84B6DC();
              if (os_log_type_enabled(v89, v90))
              {
                v91 = swift_slowAlloc();
                v92 = swift_slowAlloc();
                aBlock = v92;
                *(_DWORD *)v91 = 136446467;
                v93 = sub_22D821E84();
                v120 = sub_22D83157C(v93, v94, &aBlock);
                sub_22D84B79C();

                swift_bridgeObjectRelease();
                *(_WORD *)(v91 + 12) = 2081;
                swift_bridgeObjectRetain();
                v120 = sub_22D83157C((uint64_t)v31, (unint64_t)v8, &aBlock);
                sub_22D84B79C();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_22D80B000, v89, v90, "[%{public}s] Couldn't create a scene with %{private}s", (uint8_t *)v91, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x22E318218](v92, -1, -1);
                MEMORY[0x22E318218](v91, -1, -1);

              }
              else
              {

              }
              return;
            }
            return;
          }
LABEL_49:
          __break(1u);
          return;
        }
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
  v117 = a2;
  v16 = qword_2540C5F08;
  v17 = v15;
  if (v16 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
  (*((void (**)(char *, uint64_t, uint64_t))v8 + 2))(v13, v18, v7);
  v19 = (id)v3;
  v20 = sub_22D84B484();
  v21 = sub_22D84B6DC();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v113 = v17;
    v23 = v22;
    v24 = swift_slowAlloc();
    v114 = a3;
    v25 = v24;
    aBlock = v24;
    *(_DWORD *)v23 = 136446466;
    v116 = v8;
    v8 = a1;
    v26 = sub_22D821E84();
    v120 = sub_22D83157C(v26, v27, &aBlock);
    v115 = v7;
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2082;
    if ((a1 & 1) != 0)
      v28 = 0x756F726765726F66;
    else
      v28 = 0x756F72676B636162;
    v120 = sub_22D83157C(v28, 0xEA0000000000646ELL, &aBlock);
    sub_22D84B79C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v20, v21, "[%{public}s] Updating activity scene to %{public}s.", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    v29 = v25;
    a3 = v114;
    MEMORY[0x22E318218](v29, -1, -1);
    v30 = v23;
    v17 = v113;
    MEMORY[0x22E318218](v30, -1, -1);

    (*((void (**)(char *, uint64_t))v116 + 1))(v13, v115);
  }
  else
  {

    (*((void (**)(char *, uint64_t))v8 + 1))(v13, v7);
  }
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = a1 & 1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_22D835460;
  *(_QWORD *)(v7 + 24) = v3;
  v125 = sub_22D8358C8;
  v126 = (_QWORD *)v7;
  v84 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v122 = 1107296256;
  v123 = sub_22D82D4B0;
  v124 = &block_descriptor_187;
  v85 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v86 = swift_allocObject();
  v87 = (uint64_t)v117;
  *(_QWORD *)(v86 + 16) = v117;
  *(_QWORD *)(v86 + 24) = a3;
  v125 = sub_22D83543C;
  v126 = (_QWORD *)v86;
  aBlock = v84;
  v122 = 1107296256;
  v123 = sub_22D82D504;
  v124 = &block_descriptor_193;
  v88 = _Block_copy(&aBlock);
  v31 = v126;
  sub_22D835440(v87);
  swift_release();
  objc_msgSend(v17, sel_performUpdate_withCompletion_, v85, v88);

  _Block_release(v88);
  _Block_release(v85);
  LOBYTE(v85) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v85 & 1) != 0)
  {
    __break(1u);
LABEL_34:
    if (qword_2540C5F08 == -1)
      goto LABEL_35;
    goto LABEL_46;
  }
}

void sub_22D826464()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  BSDispatchQueueAssertMain();
  v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter);
  if (v2)
    objc_msgSend(v2, sel_invalidate);
  *(_QWORD *)(v0 + v1) = 0;
  swift_unknownObjectRelease();
  *(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground) = 0;
  v3 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView), sel_removeFromSuperview);
  v4 = *(void **)(v0 + v3);
  *(_QWORD *)(v0 + v3) = 0;

  v5 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (v6)
  {
    v7 = objc_msgSend(v6, sel_layerManager);
    objc_msgSend(v7, sel_remove_, v0);

    v6 = *(void **)(v0 + v5);
    if (v6)
    {
      objc_msgSend(v6, sel_setDelegate_, 0);
      v6 = *(void **)(v0 + v5);
    }
  }
  objc_msgSend(v6, sel_invalidate);
  v8 = *(void **)(v0 + v5);
  *(_QWORD *)(v0 + v5) = 0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) = 1;
}

void sub_22D82655C()
{
  char *v0;
  void **v1;
  char *v2;
  double *v3;
  double v4;
  double v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double *v12;
  uint64_t v13;
  double v14;
  char *v15;
  double v16;
  char *v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  CGSize v25;
  CGSize v26;

  BSDispatchQueueAssertMain();
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene])
  {
    v1 = (void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
    swift_beginAccess();
    v2 = (char *)*v1;
    if (*v1)
    {
      v3 = (double *)&v2[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
      swift_beginAccess();
      v5 = *v3;
      v4 = v3[1];
      v6 = &v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)v6 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) >= 2uLL)
      {
        v15 = v2;
      }
      else
      {
        v7 = &v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics];
        v8 = swift_beginAccess();
        v9 = *(_QWORD *)(*(_QWORD *)v7 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
        v10 = *(_QWORD *)(v9 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
        v11 = *(double *)(v10 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
        if (v11 != 0.0
          || *(double *)(*(_QWORD *)(v9 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest)
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || (v12 = (double *)(v9 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius),
              v8 = swift_beginAccess(),
              *v12 != 0.0))
        {
          v13 = *(_QWORD *)(v10 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
          if (v13 != 1)
          {
            if (v13)
            {
              v11 = 0.0;
            }
            else
            {
              if (v11 >= v5)
                v14 = v5;
              else
                v14 = v11;
              v11 = *(double *)(v10 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
              if (v14 > v11)
                v11 = v14;
            }
          }
          v5 = CGSizeMake(v8, v11, v4);
          v4 = v16;
        }
        v17 = v2;
        if (v4 <= 40.0)
        {
LABEL_21:

          return;
        }
      }
      v18 = objc_msgSend(v0, sel_view);
      if (!v18)
      {
        __break(1u);
        return;
      }
      v19 = v18;
      objc_msgSend(v18, sel_bounds);
      v21 = v20;
      v23 = v22;

      v25.width = v21;
      v25.height = v23;
      v26.width = v5;
      v26.height = v4;
      if (!CGSizeEqualToSize(v25, v26))
      {
        v24 = (void *)MEMORY[0x22E317CCC]();
        sub_22D82DFE8(v0, v5, v4);
        objc_autoreleasePoolPop(v24);
      }
      goto LABEL_21;
    }
  }
}

void sub_22D8267C4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  id v31;
  id v32;
  char v33;
  _QWORD *v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void *v50;
  _QWORD *v51;
  unsigned int v52;
  unint64_t v53;
  char v54;
  id v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  char *v67;
  unsigned int v68;
  char *v69;
  id v70;
  id v71;
  __int128 aBlock;
  void (*v73)(uint64_t, void *);
  void *v74;
  void (*v75)(void *);
  uint64_t v76;
  _QWORD *v77;
  __int128 v78;
  uint64_t v79;

  v1 = v0;
  v2 = sub_22D84B274();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v61 - v7;
  BSDispatchQueueAssertMain();
  v9 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v9)
    return;
  v65 = v9;
  v10 = objc_msgSend(v1, sel_view);
  if (!v10)
    goto LABEL_40;
  v11 = v10;
  v12 = objc_msgSend(v10, sel_window);

  if (!v12)
  {

    return;
  }
  v61 = v3;
  v64 = v2;
  v13 = objc_msgSend(v65, sel_layerManager);
  v14 = objc_msgSend(v13, sel_layers);

  v15 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions];
  swift_beginAccess();
  v16 = swift_bridgeObjectRetain();
  v17 = sub_22D8321C0(v16);
  swift_bridgeObjectRelease();
  sub_22D82E548(v17);
  swift_release();
  v18 = objc_allocWithZone(MEMORY[0x24BDBCEF0]);
  v19 = MEMORY[0x24BEE4AD8] + 8;
  v20 = (void *)sub_22D84B634();
  swift_bridgeObjectRelease();
  v70 = objc_msgSend(v18, sel_initWithArray_, v20);

  v63 = v12;
  v68 = objc_msgSend(v12, sel__contextId);
  v62 = v14;
  sub_22D84B6B8();
  sub_22D84B268();
  v69 = v6;
  if (!v79)
  {
LABEL_24:
    v49 = *(void (**)(char *, uint64_t))(v61 + 8);
    v49(v8, v64);
    sub_22D84B6B8();
    sub_22D84B268();
    while (v74)
    {
      sub_22D81CE70(&aBlock, &v78);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v51 = *(_QWORD **)v15;
        if (*(_QWORD *)(*(_QWORD *)v15 + 16))
        {
          v52 = v77;
          v53 = sub_22D831D3C(v77);
          if ((v54 & 1) != 0)
          {
            v55 = *(id *)(v51[7] + 8 * v53);
            objc_msgSend(v55, sel_invalidate);
            swift_beginAccess();
            v56 = sub_22D831D3C(v52);
            if ((v57 & 1) != 0)
            {
              v58 = v56;
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v60 = *(_QWORD **)v15;
              v77 = *(_QWORD **)v15;
              *(_QWORD *)v15 = 0x8000000000000000;
              if (!isUniquelyReferenced_nonNull_native)
              {
                sub_22D83EAA8();
                v60 = v77;
              }
              v50 = *(void **)(v60[7] + 8 * v58);
              sub_22D832028(v58, (uint64_t)v60);
              *(_QWORD *)v15 = v60;

              swift_bridgeObjectRelease();
              v6 = v69;
            }
            swift_endAccess();

          }
        }
      }
      sub_22D84B268();
    }
    v49(v6, v64);

    return;
  }
  v67 = v8;
  v66 = v19;
  while (1)
  {
    sub_22D81CE70(&v78, &aBlock);
    sub_22D819F60(0, &qword_2540C5F58);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_8;
    v71 = v77;
    v21 = objc_msgSend(v77, sel_contextID);
    v22 = (void *)sub_22D84BA90();
    objc_msgSend(v70, sel_removeObject_, v22);

    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0B6F0]), sel_init);
    v24 = objc_msgSend((id)objc_opt_self(), sel_policyRequiringSharingOfTouchesDeliveredToChildContextId_withHostContextId_, v21, v68);
    v25 = v24;
    if (v24)
    {
      v26 = v24;
      objc_msgSend(v26, sel_setAssertionEndpoint_, objc_msgSend(v23, sel_endpoint));

      swift_unknownObjectRelease();
    }
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v1;
    v75 = sub_22D83553C;
    v76 = v27;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v73 = sub_22D827B8C;
    v74 = &block_descriptor_200;
    v28 = _Block_copy(&aBlock);
    v29 = v1;
    v30 = v1;
    swift_release();
    v31 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    _Block_release(v28);
    swift_beginAccess();
    v32 = v23;
    v33 = swift_isUniquelyReferenced_nonNull_native();
    v77 = *(_QWORD **)v15;
    v34 = v77;
    *(_QWORD *)v15 = 0x8000000000000000;
    v36 = sub_22D831D3C(v21);
    v37 = v34[2];
    v38 = (v35 & 1) == 0;
    v39 = v37 + v38;
    if (__OFADD__(v37, v38))
      break;
    v40 = v35;
    if (v34[3] >= v39)
    {
      if ((v33 & 1) == 0)
        sub_22D83EAA8();
    }
    else
    {
      sub_22D83E4E4(v39, v33);
      v41 = sub_22D831D3C(v21);
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_41;
      v36 = v41;
    }
    v6 = v69;
    v43 = v77;
    if ((v40 & 1) != 0)
    {
      v44 = v77[7];
      v45 = 8 * v36;

      *(_QWORD *)(v44 + v45) = v32;
    }
    else
    {
      v77[(v36 >> 6) + 8] |= 1 << v36;
      *(_DWORD *)(v43[6] + 4 * v36) = (_DWORD)v21;
      *(_QWORD *)(v43[7] + 8 * v36) = v32;
      v46 = v43[2];
      v47 = __OFADD__(v46, 1);
      v48 = v46 + 1;
      if (v47)
        goto LABEL_39;
      v43[2] = v48;
    }
    *(_QWORD *)v15 = v43;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v1 = v29;
    v8 = v67;
    if (v31)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_ipc_addPolicy_, v25);

      swift_unknownObjectRelease_n();
    }
    else
    {

    }
LABEL_8:
    sub_22D84B268();
    if (!v79)
      goto LABEL_24;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  sub_22D84B9C4();
  __break(1u);
}

id sub_22D826F10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  id result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;

  BSDispatchQueueAssertMain();
  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions);
  swift_beginAccess();
  v2 = *v1;
  v3 = *v1 + 64;
  v4 = 1 << *(_BYTE *)(*v1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(*v1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = (id)swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v7)
      goto LABEL_21;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v7)
        goto LABEL_21;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v7)
          goto LABEL_21;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
          break;
      }
    }
LABEL_20:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 56) + 8 * v11), sel_invalidate);
  }
  v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_21:
    swift_release();
    *v1 = MEMORY[0x24BEE4B00];
    return (id)swift_bridgeObjectRelease();
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_21;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_22D827094()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  double *v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  BSDispatchQueueAssertMain();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v2 = objc_msgSend(v1, sel_layer);
  v3 = (void *)sub_22D84B5BC();
  objc_msgSend(v2, sel_setName_, v3);

  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v4, sel_bounds);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v1, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);
  v14 = (char *)sub_22D821C04();
  v15 = (double *)&v14[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
  swift_beginAccess();
  v16 = *v15;

  objc_msgSend(v1, sel__setContinuousCornerRadius_, v16);
  v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v18 = v17;
  objc_msgSend(v17, sel_addSubview_, v1);

  v19 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView;
  v20 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = v1;
  v21 = v1;

  BSDispatchQueueAssertMain();
  v22 = *(void **)&v0[v19];
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v23, sel_setAlpha_, 0.0);
    objc_msgSend(v23, sel_setHidden_, 1);

    v21 = v23;
  }

}

void sub_22D8272B0()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;

  v1 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v2 = (void *)sub_22D84B5BC();
  v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (v3)
  {
    v4 = (void *)sub_22D84B5BC();
    v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

    if (v5)
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
      v7 = objc_msgSend(v0, sel_view);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, sel_bounds);
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;

        objc_msgSend(v6, sel_setFrame_, v10, v12, v14, v16);
        objc_msgSend(v6, sel_setClipsToBounds_, 1);
        v17 = objc_msgSend(v6, sel_layer);
        v18 = (void *)sub_22D84B5BC();
        objc_msgSend(v17, sel_setName_, v18);

        v19 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 16.0);
        objc_msgSend(v6, sel_setFont_, v19);

        objc_msgSend(v6, sel_setTextAlignment_, 1);
        v20 = (void *)objc_opt_self();
        v21 = objc_msgSend(v20, sel_redColor);
        objc_msgSend(v6, sel_setTextColor_, v21);

        v22 = v6;
        v23 = objc_msgSend(v20, sel_whiteColor);
        v24 = objc_msgSend(v23, sel_colorWithAlphaComponent_, 0.75);

        objc_msgSend(v22, sel_setBackgroundColor_, v24);
        objc_msgSend(v22, sel_setAutoresizingMask_, 18);
        objc_msgSend(v22, sel__setContinuousCornerRadius_, 5.0);
        objc_msgSend(v22, sel_setAlpha_, 1.0);
        objc_msgSend(v22, sel_setHidden_, 0);
        v25 = objc_msgSend(v0, sel_view);
        if (v25)
        {
          v26 = v25;
          objc_msgSend(v25, sel_addSubview_, v22);

          v27 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
          *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = v22;

          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
}

void sub_22D827614(char a1, char a2)
{
  uint64_t v2;
  void *v5;
  int v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t aBlock;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id (*v22)();
  uint64_t v23;

  BSDispatchQueueAssertMain();
  v5 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
  if (!v5)
    return;
  v17 = *(id *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
  if (a1 != 2)
  {
    v6 = a1 & 1;
    v8 = v5;
    if ((a2 & 1) == 0)
      goto LABEL_4;
LABEL_8:
    v9 = (void *)objc_opt_self();
    v10 = swift_allocObject();
    *(_BYTE *)(v10 + 16) = v6;
    *(_QWORD *)(v10 + 24) = v17;
    v22 = sub_22D8352DC;
    v23 = v10;
    v11 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v19 = 1107296256;
    v20 = (uint64_t (*)(uint64_t, uint64_t))sub_22D829EC0;
    v21 = &block_descriptor_123;
    v12 = _Block_copy(&aBlock);
    v13 = v17;
    swift_release();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    *(_BYTE *)(v14 + 24) = v6;
    v22 = sub_22D835324;
    v23 = v14;
    aBlock = v11;
    v19 = 1107296256;
    v20 = sub_22D829EC4;
    v21 = &block_descriptor_129;
    v15 = _Block_copy(&aBlock);
    v16 = v13;
    swift_release();
    objc_msgSend(v9, sel_animateWithDuration_animations_completion_, v12, v15, 0.4);

    _Block_release(v15);
    _Block_release(v12);
    return;
  }
  v6 = objc_msgSend(v5, sel_isHidden);
  if ((a2 & 1) != 0)
    goto LABEL_8;
LABEL_4:
  v7 = 0.0;
  if (v6)
    v7 = 1.0;
  objc_msgSend(v17, sel_setAlpha_, v7);
  objc_msgSend(v17, sel_setHidden_, v6 ^ 1u);

}

void sub_22D827814(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  id v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  const void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v5 = sub_22D84B550();
  v26 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_22D84B568();
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v2;
  v11[3] = a1;
  v11[4] = a2;
  v12 = v2;
  swift_retain_n();
  v13 = (char *)v12;
  BSDispatchQueueAssertMain();
  v14 = *(void **)&v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter];
  if (v14 && (v15 = *(void **)&v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene]) != 0)
  {
    swift_unknownObjectRetain();
    v24 = v15;
    if (objc_msgSend(v24, sel_contentState) == (id)2)
    {
      v16 = objc_msgSend(v14, sel_newSnapshot);
      v23 = sub_22D821F94();
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = sub_22D8350BC;
      v17[3] = v11;
      v17[4] = v16;
      aBlock[4] = sub_22D8350F8;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D829EC0;
      aBlock[3] = &block_descriptor_105;
      v21 = _Block_copy(aBlock);
      swift_retain();
      v22 = v16;
      sub_22D84B55C();
      v27 = MEMORY[0x24BEE4AF8];
      v20 = sub_22D83514C(&qword_2540C5F18, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5F30);
      sub_22D8354F8((unint64_t *)&unk_2540C5F38, &qword_2540C5F30);
      sub_22D84B7CC();
      v18 = v21;
      v19 = v23;
      MEMORY[0x22E3177C8](0, v10, v7, v21);
      _Block_release(v18);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v25);
      swift_release();

      swift_release();
      swift_release();
    }
    else
    {
      sub_22D82E8F0((void *)1, 1, v13, a1, a2);
      swift_release();

      swift_release();
      swift_unknownObjectRelease();

    }
  }
  else
  {
    sub_22D82E8F0(0, 1, v13, a1, a2);
    swift_release();

    swift_release();
  }
}

void sub_22D827B8C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_22D827BE0(void *a1)
{
  sub_22D827C78(a1, &qword_255D97110);
}

void sub_22D827C2C(void *a1)
{
  sub_22D827C78(a1, &qword_255D970F8);
}

void sub_22D827C78(void *a1, _QWORD *a2)
{
  void *v2;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14[4];

  v14[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v14[0] = 0;
    v5 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v14);
    v6 = v14[0];
    if (v5)
    {
      v7 = sub_22D84B2EC();
      v9 = v8;

      v10 = objc_msgSend(v2, sel_otherSettings);
      v11 = (id)sub_22D84B2E0();
      swift_beginAccess();
      objc_msgSend(v10, sel_setObject_forSetting_, v11, *a2);
      sub_22D81CE80(v7, v9);

    }
    else
    {
      v12 = v6;
      v13 = (void *)sub_22D84B25C();

      swift_willThrow();
      v11 = a1;
    }
  }
  else
  {
    v11 = objc_msgSend(v2, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v11, sel_setObject_forSetting_, 0, *a2);
  }

}

void sub_22D827E18()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_22D84B5BC();
  v2 = objc_msgSend(v0, sel_createWorkloopNamed_, v1);

  qword_2540C6788 = (uint64_t)v2;
}

uint64_t ActivityHostViewController.PresentationMode.description.getter(unsigned int a1)
{
  uint64_t result;

  if (a1 < 3)
    return *(_QWORD *)&aNone[8 * a1];
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

unint64_t ActivityHostViewController.PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = a1;
  v2 = 2;
  if (a1 != 2)
    v2 = 0;
  v3 = a1 != 2;
  if (a1 == 1)
    v3 = 0;
  else
    v1 = v2;
  if (!a1)
  {
    v1 = 0;
    v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_22D827F38(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D827F4C()
{
  sub_22D84BA30();
  sub_22D84BA54();
  return sub_22D84BA78();
}

uint64_t sub_22D827F90()
{
  return sub_22D84BA54();
}

uint64_t sub_22D827FB8()
{
  sub_22D84BA30();
  sub_22D84BA54();
  return sub_22D84BA78();
}

int *sub_22D827FF8@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  BOOL v3;

  v2 = *result;
  v3 = *result > 2;
  if (*result > 2)
    v2 = 0;
  *(_DWORD *)a2 = v2;
  *(_BYTE *)(a2 + 4) = v3;
  return result;
}

void sub_22D828014(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_22D828020()
{
  unsigned int *v0;

  return ActivityHostViewController.PresentationMode.description.getter(*v0);
}

void sub_22D8282C4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;

  v4 = a3 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x22E31826C](v4);
  if (v5)
  {
    v6 = (void *)v5;
    type metadata accessor for ActivityMutableSceneSettings();
    v7 = swift_dynamicCastClass();
    if (v7)
    {
      v8 = (void *)v7;
      swift_beginAccess();
      v9 = a1;
      v10 = objc_msgSend(v8, sel_otherSettings);
      v11 = sub_22D84B9AC();
      swift_beginAccess();
      objc_msgSend(v10, sel_setObject_forSetting_, v11, qword_255D976D0);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_22D828540(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

  BSDispatchQueueAssertMain();
  sub_22D82655C();

}

void *sub_22D828788(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *result;

  v2 = *a1;
  v3 = *a2;
  v4 = (_QWORD *)(*a2
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *v4 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  v5 = v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x22E31826C](v5);
  if (result)
  {
    objc_msgSend(result, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22D828918(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_22D828A04()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BE38110]);
  v1 = (void *)sub_22D84B5BC();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_2540C5EA0 = (uint64_t)v2;
}

unint64_t sub_22D828A70(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D963D0);
  v2 = (_QWORD *)sub_22D84B904();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v6 = *(v4 - 1);
    v5 = *v4;
    swift_retain();
    swift_retain();
    result = sub_22D831D70(v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id ActivityHostViewController.__allocating_init(activitySceneDescriptor:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ActivityHostViewController.init(activitySceneDescriptor:)(a1);
}

id ActivityHostViewController.__deallocating_deinit()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_class *v9;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (qword_2540C5F08 != -1)
    swift_once();
  v1 = sub_22D84B49C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2540C5EE8);
  v2 = v0;
  v3 = sub_22D84B484();
  v4 = sub_22D84B6DC();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_22D821E84();
    v11 = sub_22D83157C(v7, v8, &v12);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v3, v4, "[%{public}s] Dealloc", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v6, -1, -1);
    MEMORY[0x22E318218](v5, -1, -1);

  }
  else
  {

  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_removeAllObservers, v11, v12);
  sub_22D8234B0();
  v9 = (objc_class *)type metadata accessor for ActivityHostViewController();
  v13.receiver = v2;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, sel_dealloc);
}

void sub_22D828F90()
{
  void *v0;
  objc_super v1;

  BSDispatchQueueAssertMain();
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_22D827094();
  sub_22D8272B0();
}

uint64_t sub_22D82901C(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  _QWORD v10[6];
  objc_super v11;

  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BSDispatchQueueAssertMain();
  v4 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_22D833C5C;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_22D8358C8;
    *(_QWORD *)(v6 + 24) = v5;
    v10[4] = sub_22D8358C8;
    v10[5] = v6;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_22D82D4B0;
    v10[3] = &block_descriptor_45;
    v7 = _Block_copy(v10);
    v8 = v4;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_performUpdate_, v7);

    _Block_release(v7);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    result = swift_release();
    if ((v7 & 1) == 0)
      return result;
    __break(1u);
  }
  return swift_release();
}

void sub_22D8291B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = a3 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x22E31826C](v4);
  if (v5)
  {
    v6 = (void *)v5;
    type metadata accessor for ActivityMutableSceneSettings();
    v7 = swift_dynamicCastClass();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = a1;
      v10 = objc_msgSend(v6, sel_traitCollection);
      v11 = objc_msgSend(v10, sel_userInterfaceStyle);

      objc_msgSend(v8, sel_setUserInterfaceStyle_, v11);
      v6 = v9;
    }

  }
}

void sub_22D8292D0(id a1)
{
  char *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  _QWORD aBlock[6];

  if (a1)
    v3 = objc_msgSend(a1, sel_userInterfaceStyle);
  else
    v3 = 0;
  v4 = objc_msgSend(v1, sel_traitCollection);
  v5 = objc_msgSend(v4, sel_userInterfaceStyle);

  if (!a1 || v3 != v5)
  {
    MEMORY[0x24BDAC7A8](v6);
    v12[2] = v5;
    BSDispatchQueueAssertMain();
    v7 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
    if (v7)
    {
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = sub_22D833C84;
      *(_QWORD *)(v8 + 24) = v12;
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_22D8358C8;
      *(_QWORD *)(v9 + 24) = v8;
      aBlock[4] = sub_22D8358C8;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D82D4B0;
      aBlock[3] = &block_descriptor_56;
      v10 = _Block_copy(aBlock);
      v11 = v7;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_performUpdate_, v10);

      _Block_release(v10);
      LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if ((v10 & 1) != 0)
        __break(1u);
    }
  }
}

id sub_22D82949C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  type metadata accessor for ActivityMutableSceneSettings();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setUserInterfaceStyle_, a3);
  return result;
}

void sub_22D829544(uint64_t a1, char a2)
{
  char *v2;
  char *v5;
  objc_super v6;

  BSDispatchQueueAssertMain();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  v5 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost];
  swift_beginAccess();
  if (*v5 == 1)
  {
    if (a1)
      sub_22D8267C4();
    else
      sub_22D826F10();
  }
}

void sub_22D82967C()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  CGRect v9;
  CGRect v10;

  v1 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_sizeToFit);
    v3 = v2;
    objc_msgSend(v3, sel_bounds);
    v10 = CGRectInset(v9, -4.0, -4.0);
    objc_msgSend(v3, sel_setBounds_, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);

    v4 = v3;
    v5 = objc_msgSend(v0, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);

      UIRectGetCenter();
      objc_msgSend(v4, sel_setCenter_);

      v7 = objc_msgSend(v0, sel_view);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, sel_bringSubviewToFront_, v4);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_22D829818()
{
  sub_22D84B8C8();
  __break(1u);
}

void sub_22D829870()
{
  sub_22D84B8C8();
  __break(1u);
}

void sub_22D8298C8()
{
  strcpy((char *)&qword_255D99DA0, "sceneActivated");
  algn_255D99DA8[7] = -18;
}

uint64_t sub_22D8298F8(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v23[1] = a3;
  v10 = sub_22D84B550();
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D84B568();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(a2, sel_error);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v17;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  aBlock[4] = sub_22D835598;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22D829EC0;
  aBlock[3] = &block_descriptor_206;
  v19 = _Block_copy(aBlock);
  v20 = v17;
  v21 = a4;
  swift_retain();
  sub_22D84B55C();
  v25 = MEMORY[0x24BEE4AF8];
  sub_22D83514C(&qword_2540C5F18, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5F30);
  sub_22D8354F8((unint64_t *)&unk_2540C5F38, &qword_2540C5F30);
  sub_22D84B7CC();
  MEMORY[0x22E3177C8](0, v16, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release();
}

uint64_t sub_22D829B18(void *a1, void *a2, uint64_t (*a3)(void *))
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;

  if (a1)
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v6 = sub_22D84B49C();
    __swift_project_value_buffer(v6, (uint64_t)qword_2540C5EE8);
    v7 = a2;
    v8 = a1;
    v9 = v7;
    v10 = a1;
    v11 = sub_22D84B484();
    v12 = sub_22D84B6DC();
    if (!os_log_type_enabled(v11, v12))
    {

      return a3(a1);
    }
    v13 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v28 = v27;
    *(_DWORD *)v13 = 136446466;
    v14 = sub_22D821E84();
    sub_22D83157C(v14, v15, &v28);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    swift_getErrorValue();
    v16 = sub_22D84B9E8();
    sub_22D83157C(v16, v17, &v28);
    sub_22D84B79C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D80B000, v11, v12, "[%{public}s] Ensure content failed: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v27, -1, -1);
    v18 = v13;
  }
  else
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v19 = sub_22D84B49C();
    __swift_project_value_buffer(v19, (uint64_t)qword_2540C5EE8);
    v20 = a2;
    v11 = sub_22D84B484();
    v21 = sub_22D84B6DC();
    if (!os_log_type_enabled(v11, v21))
    {

      return a3(a1);
    }
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v28 = v23;
    *(_DWORD *)v22 = 136446210;
    v24 = sub_22D821E84();
    sub_22D83157C(v24, v25, &v28);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v11, v21, "[%{public}s] Ensure content complete", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v23, -1, -1);
    v18 = (uint64_t)v22;
  }
  MEMORY[0x22E318218](v18, -1, -1);

  return a3(a1);
}

uint64_t sub_22D829EC4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_22D829F00(void *a1, void *a2, uint64_t a3, const char *a4)
{
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;

  if (qword_2540C5F08 != -1)
    swift_once();
  v7 = sub_22D84B49C();
  __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
  v8 = a1;
  v9 = sub_22D84B484();
  v10 = sub_22D84B6DC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v16 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_22D821E84();
    sub_22D83157C(v13, v14, &v16);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v9, v10, a4, v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v12, -1, -1);
    MEMORY[0x22E318218](v11, -1, -1);

  }
  else
  {

  }
  v15 = (void *)sub_22D84B5BC();
  objc_msgSend(a2, sel_satisfyMilestone_, v15);

}

void sub_22D82A0F0(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;

  if (qword_2540C5F08 != -1)
    swift_once();
  v4 = sub_22D84B49C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2540C5EE8);
  v5 = a1;
  v6 = sub_22D84B484();
  v7 = sub_22D84B6DC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = sub_22D821E84();
    sub_22D83157C(v10, v11, &v13);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v6, v7, "[%{public}s] Ensure content: scene activated", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v9, -1, -1);
    MEMORY[0x22E318218](v8, -1, -1);

  }
  else
  {

  }
  if (qword_255D962A0 != -1)
    swift_once();
  v12 = (void *)sub_22D84B5BC();
  objc_msgSend(a2, sel_satisfyMilestone_, v12);

}

id sub_22D82A2E8(void *a1, id a2)
{
  void *v4;

  if ((objc_msgSend(a2, sel_isComplete) & 1) == 0)
  {
    v4 = (void *)sub_22D84B5BC();
    objc_msgSend(a2, sel_failWithReason_, v4);

  }
  return objc_msgSend(a1, sel_invalidate);
}

void sub_22D82A3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_22D84B250();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_22D82A528()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t result;

  v1 = v0;
  sub_22D84B850();
  sub_22D84B5EC();
  if (*(_DWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode) >= 3u)
  {
    result = sub_22D84B9A0();
    __break(1u);
  }
  else
  {
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter);
    if (v2)
    {
      v3 = objc_msgSend(v2, sel_description);
      sub_22D84B5C8();

    }
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
    if (v4)
    {
      v5 = objc_msgSend(v4, sel_description);
      sub_22D84B5C8();

    }
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    v6 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
    swift_beginAccess();
    v7 = *v6;
    v8 = objc_msgSend(v7, sel_description);
    sub_22D84B5C8();

    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v9)
    {
      v10 = objc_msgSend(v9, sel_description);
      sub_22D84B5C8();

    }
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    return 0;
  }
  return result;
}

void sub_22D82A968(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  *v3 = v2;
  BSDispatchQueueAssertMain();
  if (*v3 == 1)
    sub_22D8267C4();
  else
    sub_22D826F10();
}

void sub_22D82AA08(uint64_t a1, uint64_t (*a2)(void), const char *a3, _QWORD *a4, SEL *a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  SEL *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void **v31;
  void *v32;
  char *v33;
  void *v34;
  _QWORD *v35;
  os_log_type_t v36;
  uint64_t v37;
  NSObject *log;
  void *v39;
  uint64_t v40[7];

  v40[6] = *MEMORY[0x24BDAC8D0];
  v9 = a1 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x22E31826C](v9);
  if (v10)
  {
    v11 = (id)v10;
    v12 = *(void **)(v10 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v12)
    {
      v13 = objc_msgSend(v12, sel_clientSettings);
      if (v13)
      {
        v14 = v13;
        type metadata accessor for ActivitySceneClientSettings();
        v15 = swift_dynamicCastClass();
        if (v15)
        {
          v16 = (void *)v15;
          if (qword_2540C5F08 != -1)
            swift_once();
          v17 = sub_22D84B49C();
          __swift_project_value_buffer(v17, (uint64_t)qword_2540C5EE8);
          v18 = v11;
          v19 = v14;
          v20 = (char *)v18;
          v14 = v19;
          v21 = sub_22D84B484();
          v22 = sub_22D84B6C4();
          v23 = (SEL *)&unk_24F956000;
          if (os_log_type_enabled(v21, v22))
          {
            v36 = v22;
            log = v21;
            v24 = swift_slowAlloc();
            v35 = (_QWORD *)swift_slowAlloc();
            v37 = swift_slowAlloc();
            v40[0] = v37;
            *(_DWORD *)v24 = 136446466;
            v25 = sub_22D821E84();
            sub_22D83157C(v25, v26, v40);
            sub_22D84B79C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v24 + 12) = 2114;
            v39 = v16;
            v27 = objc_msgSend(v16, sel_otherSettings);
            v28 = a2();

            sub_22D84B79C();
            *v35 = v28;

            _os_log_impl(&dword_22D80B000, log, v36, a3, (uint8_t *)v24, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5FD8);
            swift_arrayDestroy();
            MEMORY[0x22E318218](v35, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x22E318218](v37, -1, -1);
            MEMORY[0x22E318218](v24, -1, -1);

            v16 = v39;
            v23 = (SEL *)&unk_24F956000;
          }
          else
          {

          }
          v29 = objc_msgSend(v16, v23[427], v35);
          v30 = (void *)a2();

          v31 = (void **)&v20[*a4];
          swift_beginAccess();
          v32 = *v31;
          *v31 = v30;
          v11 = v30;

          BSDispatchQueueAssertMain();
          v33 = &v20[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
          swift_beginAccess();
          v34 = (void *)MEMORY[0x22E31826C](v33);
          if (v34)
          {
            objc_msgSend(v34, *a5, v20);

            swift_unknownObjectRelease();
            return;
          }

        }
      }
    }

  }
}

void sub_22D82ADEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void **v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void **v26;
  void *v27;
  id v28;
  char *v29;
  void *v30;
  id v31;
  void *v32;
  void **v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  __int128 v48;
  __int128 v49;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E31826C](v1);
  if (!v2)
    return;
  v3 = (void *)v2;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v4 || (v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
  {
LABEL_8:

    return;
  }
  v6 = v5;
  type metadata accessor for ActivitySceneClientSettings();
  v7 = (void *)swift_dynamicCastClass();
  if (!v7)
  {

    goto LABEL_8;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v9, sel_objectForSetting_, qword_255D97128))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(v46, &v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if (swift_dynamicCast())
  {
    v10 = v46[0];
  }
  else
  {
    v10 = 2;
    LOBYTE(v46[0]) = 2;
  }

  if (qword_2540C5F08 != -1)
    swift_once();
  v11 = sub_22D84B49C();
  __swift_project_value_buffer(v11, (uint64_t)qword_2540C5EE8);
  v12 = v3;
  v13 = sub_22D84B484();
  v14 = sub_22D84B6C4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_QWORD *)&v48 = v16;
    *(_DWORD *)v15 = 136446210;
    v17 = sub_22D821E84();
    *(_QWORD *)&v46[0] = sub_22D83157C(v17, v18, (uint64_t *)&v48);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v13, v14, "[%{public}s] ClientSetting[archiveContentReady] did change to YES.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v16, -1, -1);
    MEMORY[0x22E318218](v15, -1, -1);

  }
  else
  {

  }
  v19 = objc_msgSend(v8, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v19, sel_objectForSetting_, qword_255D97158))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(v46, &v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  type metadata accessor for ActivitySceneMetrics();
  if (swift_dynamicCast())
  {
    v20 = *(void **)&v46[0];
  }
  else
  {
    v20 = 0;
    *(_QWORD *)&v46[0] = 0;
  }

  v21 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
  swift_beginAccess();
  v22 = *v21;
  *v21 = v20;
  v23 = v20;

  BSDispatchQueueAssertMain();
  sub_22D82655C();

  v24 = objc_msgSend(v8, sel_otherSettings);
  v25 = (void *)sub_22D838204(v24);

  v26 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor];
  swift_beginAccess();
  v27 = *v26;
  *v26 = v25;
  v28 = v25;

  BSDispatchQueueAssertMain();
  v29 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
  swift_beginAccess();
  v30 = (void *)MEMORY[0x22E31826C](v29);
  if (v30)
  {
    objc_msgSend(v30, sel_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_, v12);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  v31 = objc_msgSend(v8, sel_otherSettings);
  v32 = (void *)sub_22D838210(v31);

  v33 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor];
  swift_beginAccess();
  v34 = *v33;
  *v33 = v32;
  v35 = v32;

  BSDispatchQueueAssertMain();
  v36 = (void *)MEMORY[0x22E31826C](v29);
  if (v36)
  {
    objc_msgSend(v36, sel_activityHostViewControllerTextColorDidChangeWithViewController_, v12);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  v37 = objc_msgSend(v8, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v37, sel_objectForSetting_, qword_255D97170))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(v46, &v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6330);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v38 = v47;

    if (v38)
    {
      v39 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects];
      swift_beginAccess();
      *(_QWORD *)v39 = v38;
      swift_bridgeObjectRelease();
    }
    if ((v10 & 1) == 0)
      goto LABEL_38;
  }
  else
  {
    v47 = 0;

    if ((v10 & 1) == 0)
    {
LABEL_38:

      return;
    }
  }
  v40 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks];
  swift_beginAccess();
  v41 = *(_QWORD *)v40;
  v42 = *(_QWORD *)(*(_QWORD *)v40 + 16);
  if (v42)
  {
    swift_bridgeObjectRetain();
    v43 = v41 + 40;
    do
    {
      v44 = *(void (**)(uint64_t))(v43 - 8);
      v45 = swift_retain();
      v44(v45);
      swift_release();
      v43 += 16;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)v40 = MEMORY[0x24BEE4AF8];

  swift_bridgeObjectRelease();
}

void sub_22D82B4BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  char *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  void **v28;
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  uint64_t v43[3];

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E31826C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v4 && (v5 = objc_msgSend(v4, sel_clientSettings)) != 0)
    {
      v6 = v5;
      type metadata accessor for ActivitySceneClientSettings();
      v7 = swift_dynamicCastClass();
      if (v7)
      {
        v8 = (void *)v7;
        if (qword_2540C5F08 != -1)
          swift_once();
        v9 = sub_22D84B49C();
        __swift_project_value_buffer(v9, (uint64_t)qword_2540C5EE8);
        v10 = v3;
        v11 = v6;
        v12 = (char *)v10;
        v13 = v11;
        v14 = sub_22D84B484();
        v15 = sub_22D84B6C4();
        if (os_log_type_enabled(v14, v15))
        {
          v38 = v13;
          v16 = swift_slowAlloc();
          v37 = swift_slowAlloc();
          v43[0] = v37;
          *(_DWORD *)v16 = 136446466;
          v17 = sub_22D821E84();
          *(_QWORD *)&v41 = sub_22D83157C(v17, v18, v43);
          sub_22D84B79C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2082;
          v19 = objc_msgSend(v8, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v19, sel_objectForSetting_, qword_255D97158))
          {
            sub_22D84B7C0();
            swift_unknownObjectRelease();
            sub_22D81CE70(v40, &v41);
          }
          else
          {
            v41 = 0u;
            v42 = 0u;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
          type metadata accessor for ActivitySceneMetrics();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v20 = v39;

            if (v39)
            {
              v21 = objc_msgSend(v39, sel_description);

              v22 = sub_22D84B5C8();
              v20 = v23;

            }
            else
            {
              v22 = 0;
            }
          }
          else
          {

            v22 = 0;
            v20 = 0;
          }
          *(_QWORD *)&v41 = v22;
          *((_QWORD *)&v41 + 1) = v20;
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D97090);
          v24 = sub_22D84B5D4();
          *(_QWORD *)&v41 = sub_22D83157C(v24, v25, v43);
          sub_22D84B79C();
          v13 = v38;

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D80B000, v14, v15, "[%{public}s] ClientSetting[resolvedMetrics] did change to %{public}s", (uint8_t *)v16, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x22E318218](v37, -1, -1);
          MEMORY[0x22E318218](v16, -1, -1);

        }
        else
        {

        }
        v26 = objc_msgSend(v8, sel_otherSettings, v37);
        swift_beginAccess();
        if (objc_msgSend(v26, sel_objectForSetting_, qword_255D97158))
        {
          sub_22D84B7C0();
          swift_unknownObjectRelease();
          sub_22D81CE70(v40, &v41);
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
        type metadata accessor for ActivitySceneMetrics();
        if (swift_dynamicCast())
        {
          v27 = *(void **)&v40[0];
        }
        else
        {
          v27 = 0;
          *(_QWORD *)&v40[0] = 0;
        }

        v28 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
        swift_beginAccess();
        v29 = *v28;
        *v28 = v27;
        v30 = v27;

        BSDispatchQueueAssertMain();
        sub_22D82655C();

        if (*v28)
        {
          v31 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks];
          swift_beginAccess();
          v32 = *(_QWORD *)v31;
          v33 = *(_QWORD *)(*(_QWORD *)v31 + 16);
          if (v33)
          {
            swift_bridgeObjectRetain();
            v34 = v32 + 40;
            do
            {
              v35 = *(void (**)(uint64_t))(v34 - 8);
              v36 = swift_retain();
              v35(v36);
              swift_release();
              v34 += 16;
              --v33;
            }
            while (v33);
            swift_bridgeObjectRelease();
          }
          *(_QWORD *)v31 = MEMORY[0x24BEE4AF8];

          swift_bridgeObjectRelease();
        }
        else
        {

        }
      }
      else
      {

      }
    }
    else
    {

    }
  }
}

void sub_22D82BA14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E31826C](v1);
  if (!v2)
    return;
  v3 = (void *)v2;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v4 || (v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
  {

    return;
  }
  v6 = v5;
  type metadata accessor for ActivitySceneClientSettings();
  v7 = (void *)swift_dynamicCastClass();
  if (!v7)
  {

    return;
  }
  v8 = objc_msgSend(v7, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v8, sel_objectForSetting_, qword_255D97170))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v26, v27);
  }
  else
  {
    memset(v27, 0, sizeof(v27));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6330);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v28 = 0;

    goto LABEL_17;
  }
  v9 = v28;

  if (!v9)
  {
LABEL_17:

    return;
  }
  if (qword_2540C5F08 != -1)
    swift_once();
  v10 = sub_22D84B49C();
  __swift_project_value_buffer(v10, (uint64_t)qword_2540C5EE8);
  v11 = v3;
  swift_bridgeObjectRetain_n();
  v12 = (char *)v11;
  v13 = sub_22D84B484();
  v14 = sub_22D84B6C4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)&v27[0] = v25;
    *(_DWORD *)v15 = 136446466;
    v16 = sub_22D821E84();
    *(_QWORD *)&v26 = sub_22D83157C(v16, v17, (uint64_t *)v27);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    type metadata accessor for CGRect(0);
    v19 = v18;
    v20 = swift_bridgeObjectRetain();
    v21 = MEMORY[0x22E3176FC](v20, v19);
    v23 = v22;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v26 = sub_22D83157C(v21, v23, (uint64_t *)v27);
    sub_22D84B79C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v13, v14, "[%{public}s] ClientSetting[touchRestrictedRects] did change to %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v25, -1, -1);
    MEMORY[0x22E318218](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v24 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects];
  swift_beginAccess();
  *(_QWORD *)v24 = v9;

  swift_bridgeObjectRelease();
}

void sub_22D82BDD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  char *v20;
  void *v21;
  __int128 v22;
  _OWORD v23[2];
  unsigned __int8 v24;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E31826C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (!v4 || (v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
    {

      return;
    }
    v6 = v5;
    type metadata accessor for ActivitySceneClientSettings();
    v7 = (void *)swift_dynamicCastClass();
    if (!v7)
    {

      return;
    }
    v8 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v8, sel_objectForSetting_, qword_255D97188))
    {
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      sub_22D81CE70(&v22, v23);
    }
    else
    {
      memset(v23, 0, sizeof(v23));
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v9 = v24;

      if (v9 != 2)
      {
        v10 = v9 & 1;
        if (qword_2540C5F08 != -1)
          swift_once();
        v11 = sub_22D84B49C();
        __swift_project_value_buffer(v11, (uint64_t)qword_2540C5EE8);
        v12 = v3;
        v13 = sub_22D84B484();
        v14 = sub_22D84B6C4();
        if (os_log_type_enabled(v13, v14))
        {
          v15 = swift_slowAlloc();
          v16 = swift_slowAlloc();
          *(_QWORD *)&v23[0] = v16;
          *(_DWORD *)v15 = 136446466;
          v17 = sub_22D821E84();
          *(_QWORD *)&v22 = sub_22D83157C(v17, v18, (uint64_t *)v23);
          sub_22D84B79C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 1026;
          LODWORD(v22) = v10;
          sub_22D84B79C();
          _os_log_impl(&dword_22D80B000, v13, v14, "[%{public}s] ClientSetting[DisableIdleTimer] did change to %{BOOL,public}d", (uint8_t *)v15, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x22E318218](v16, -1, -1);
          MEMORY[0x22E318218](v15, -1, -1);

        }
        else
        {

        }
        v19 = (unsigned __int8 *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled];
        swift_beginAccess();
        *v19 = v10;
        BSDispatchQueueAssertMain();
        v20 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
        swift_beginAccess();
        v21 = (void *)MEMORY[0x22E31826C](v20);
        if (v21)
        {
          objc_msgSend(v21, sel_activityHostViewControllerWithViewController_didSetIdleTimerDisabled_, v12, *v19);

          swift_unknownObjectRelease();
          return;
        }

        goto LABEL_18;
      }
    }
    else
    {
      v24 = 2;

    }
LABEL_18:

  }
}

void sub_22D82C160(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  void *v29;
  uint64_t v30[3];

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x22E31826C](v2);
  if (v3)
  {
    v4 = (id)v3;
    v5 = *(void **)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v5)
    {
      v6 = objc_msgSend(v5, sel_clientSettings);
      if (v6)
      {
        v7 = v6;
        type metadata accessor for ActivitySceneClientSettings();
        v8 = swift_dynamicCastClass();
        if (v8)
        {
          v9 = (void *)v8;
          if (qword_2540C5F08 != -1)
            swift_once();
          v10 = sub_22D84B49C();
          __swift_project_value_buffer(v10, (uint64_t)qword_2540C5EE8);
          v11 = v4;
          v12 = v7;
          v13 = (char *)v11;
          v4 = v12;
          v14 = sub_22D84B484();
          v15 = sub_22D84B6C4();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = swift_slowAlloc();
            v17 = swift_slowAlloc();
            v30[0] = v17;
            *(_DWORD *)v16 = 136446466;
            v18 = sub_22D821E84();
            sub_22D83157C(v18, v19, v30);
            sub_22D84B79C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v16 + 12) = 2082;
            v20 = objc_msgSend(v9, sel_audioCategoriesDisablingVolumeHUD);
            if (v20)
            {
              v21 = v20;
              sub_22D84B640();

            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D97468);
            v22 = sub_22D84B5D4();
            sub_22D83157C(v22, v23, v30);
            sub_22D84B79C();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22D80B000, v14, v15, "[%{public}s] ClientSetting[audioCategoriesDisablingVolumeHUD] did change to: %{public}s", (uint8_t *)v16, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x22E318218](v17, -1, -1);
            MEMORY[0x22E318218](v16, -1, -1);

          }
          else
          {

          }
          v24 = objc_msgSend(v9, sel_audioCategoriesDisablingVolumeHUD);
          if (v24)
          {
            v25 = v24;
            v26 = sub_22D84B640();

          }
          else
          {
            v26 = 0;
          }
          v27 = (uint64_t *)&v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD];
          swift_beginAccess();
          *v27 = v26;
          swift_bridgeObjectRelease();
          BSDispatchQueueAssertMain();
          v28 = &v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
          swift_beginAccess();
          v29 = (void *)MEMORY[0x22E31826C](v28);
          if (v29)
          {
            objc_msgSend(v29, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v13);

            swift_unknownObjectRelease();
            return;
          }

        }
        else
        {

        }
      }
    }

  }
}

void sub_22D82C4EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  os_log_t v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  _OWORD v39[2];
  uint64_t v40;
  char v41;

  v2 = sub_22D84B49C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = MEMORY[0x22E31826C](a1 + 16);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      v9 = objc_msgSend(v8, sel_clientSettings);
      if (v9)
      {
        v10 = v9;
        type metadata accessor for ActivitySceneClientSettings();
        v11 = (void *)swift_dynamicCastClass();
        if (v11)
        {
          v12 = objc_msgSend(v11, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v12, sel_objectForSetting_, qword_255D971A0))
          {
            sub_22D84B7C0();
            swift_unknownObjectRelease();
            sub_22D81CE70(&v38, v39);
          }
          else
          {
            memset(v39, 0, sizeof(v39));
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
          v13 = swift_dynamicCast();
          if ((v13 & 1) != 0)
          {
            v14 = v40;
            v41 = v13 ^ 1;

            if (v14 == 1)
              v15 = 1;
            else
              v15 = 2;
            if (v14)
              goto LABEL_17;
          }
          else
          {
            v40 = 0;
            v41 = v13 ^ 1;

          }
          v15 = 0;
LABEL_17:
          if (v13)
            LODWORD(v16) = v15;
          else
            LODWORD(v16) = 2;
          if (qword_2540C5F08 != -1)
            swift_once();
          v17 = __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EE8);
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
          v18 = v7;
          v19 = sub_22D84B484();
          v20 = sub_22D84B6C4();
          v21 = v20;
          if (os_log_type_enabled(v19, v20))
          {
            v22 = swift_slowAlloc();
            v37 = v16;
            v16 = v22;
            v36 = swift_slowAlloc();
            *(_QWORD *)&v39[0] = v36;
            *(_DWORD *)v16 = 136446466;
            v35 = v19;
            v23 = sub_22D821E84();
            *(_QWORD *)&v38 = sub_22D83157C(v23, v24, (uint64_t *)v39);
            HIDWORD(v34) = v21;
            sub_22D84B79C();

            swift_bridgeObjectRelease();
            v25 = v37;
            *(_WORD *)(v16 + 12) = 2082;
            v26 = 0xE600000000000000;
            v27 = 0x6D756964656DLL;
            if (!v25)
            {
              v27 = 0x6C6C616D73;
              v26 = 0xE500000000000000;
            }
            if (v25 == 2)
              v28 = 7104878;
            else
              v28 = v27;
            if (v25 == 2)
              v29 = 0xE300000000000000;
            else
              v29 = v26;
            *(_QWORD *)&v38 = sub_22D83157C(v28, v29, (uint64_t *)v39);
            sub_22D84B79C();
            swift_bridgeObjectRelease();
            v30 = v35;
            _os_log_impl(&dword_22D80B000, v35, BYTE4(v34), "[%{public}s] ClientSetting[ArchivedActivityFamily] did change to %{public}s", (uint8_t *)v16, 0x16u);
            v31 = v36;
            swift_arrayDestroy();
            MEMORY[0x22E318218](v31, -1, -1);
            v32 = v16;
            LOBYTE(v16) = v37;
            MEMORY[0x22E318218](v32, -1, -1);

          }
          else
          {

          }
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          v33 = &v18[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily];
          swift_beginAccess();
          *v33 = v16;
          goto LABEL_34;
        }

      }
    }
LABEL_34:

  }
}

void sub_22D82C90C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  objc_class *v30;
  _BYTE *v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  objc_super v40;
  _OWORD v41[2];

  v2 = sub_22D84B49C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = MEMORY[0x22E31826C](a1 + 16);
  if (!v6)
    return;
  v7 = (id)v6;
  v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v8 || (v9 = objc_msgSend(v8, sel_clientSettings)) == 0)
  {
LABEL_32:

    return;
  }
  v10 = v9;
  type metadata accessor for ActivitySceneClientSettings();
  v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
LABEL_31:

    goto LABEL_32;
  }
  v12 = objc_msgSend(v11, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v12, sel_objectForSetting_, qword_255D971B8))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v39, v41);
  }
  else
  {
    memset(v41, 0, sizeof(v41));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v13 = v39;
  }
  else
  {
    v13 = 2;
    LOBYTE(v39) = 2;
  }

  if (qword_2540C5F08 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
  v15 = (char *)v7;
  v16 = sub_22D84B484();
  v17 = sub_22D84B6C4();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc();
    v38 = v10;
    v20 = v19;
    v37 = swift_slowAlloc();
    *(_QWORD *)&v41[0] = v37;
    *(_DWORD *)v20 = 136446466;
    v21 = sub_22D821E84();
    *(_QWORD *)&v39 = sub_22D83157C(v21, v22, (uint64_t *)v41);
    v36 = v18;
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    v23 = 1702195828;
    if ((v13 & 1) == 0)
      v23 = 0x65736C6166;
    v24 = 0xE400000000000000;
    if ((v13 & 1) == 0)
      v24 = 0xE500000000000000;
    if (v13 == 2)
      v25 = 7104878;
    else
      v25 = v23;
    if (v13 == 2)
      v26 = 0xE300000000000000;
    else
      v26 = v24;
    *(_QWORD *)&v39 = sub_22D83157C(v25, v26, (uint64_t *)v41);
    sub_22D84B79C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v16, (os_log_type_t)v36, "[%{public}s] ClientSetting[baseContentTouchedDown] did change to %{public}s", (uint8_t *)v20, 0x16u);
    v27 = v37;
    swift_arrayDestroy();
    MEMORY[0x22E318218](v27, -1, -1);
    v28 = v20;
    v10 = v38;
    MEMORY[0x22E318218](v28, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v29 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown];
  swift_beginAccess();
  *v29 = v13 & 1;
  v30 = (objc_class *)type metadata accessor for ActivityTouchEvent();
  v31 = objc_allocWithZone(v30);
  v31[OBJC_IVAR____TtC18ActivityUIServices18ActivityTouchEvent_baseContentTouchedDown] = v13 & 1;
  v40.receiver = v31;
  v40.super_class = v30;
  v7 = objc_msgSendSuper2(&v40, sel_init);
  v32 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
  swift_beginAccess();
  v33 = (void *)MEMORY[0x22E31826C](v32);
  if (!v33)
  {

    goto LABEL_31;
  }
  v34 = v33;
  if ((objc_msgSend(v33, sel_respondsToSelector_, sel_activityHostViewControllerWithViewController_receivedTouchEvent_) & 1) != 0)objc_msgSend(v34, sel_activityHostViewControllerWithViewController_receivedTouchEvent_, v15, v7);

  swift_unknownObjectRelease();
}

void sub_22D82CD90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  os_log_t v32;
  uint64_t v33;
  int v34;
  __int128 v35;
  _OWORD v36[2];

  v2 = sub_22D84B49C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = MEMORY[0x22E31826C](a1 + 16);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      v9 = objc_msgSend(v8, sel_clientSettings);
      if (v9)
      {
        v10 = v9;
        type metadata accessor for ActivitySceneClientSettings();
        v11 = (void *)swift_dynamicCastClass();
        if (v11)
        {
          v12 = objc_msgSend(v11, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v12, sel_objectForSetting_, qword_255D971D0))
          {
            sub_22D84B7C0();
            swift_unknownObjectRelease();
            sub_22D81CE70(&v35, v36);
          }
          else
          {
            memset(v36, 0, sizeof(v36));
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
          if ((swift_dynamicCast() & 1) != 0)
          {
            LODWORD(v13) = v35;
          }
          else
          {
            LODWORD(v13) = 2;
            LOBYTE(v35) = 2;
          }

          if (qword_2540C5F08 != -1)
            swift_once();
          v14 = __swift_project_value_buffer(v2, (uint64_t)qword_2540C5EE8);
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
          v15 = v7;
          v16 = sub_22D84B484();
          v17 = sub_22D84B6C4();
          v18 = v17;
          if (os_log_type_enabled(v16, v17))
          {
            v19 = swift_slowAlloc();
            v34 = v13;
            v13 = v19;
            v33 = swift_slowAlloc();
            *(_QWORD *)&v36[0] = v33;
            *(_DWORD *)v13 = 136446466;
            v32 = v16;
            v20 = sub_22D821E84();
            *(_QWORD *)&v35 = sub_22D83157C(v20, v21, (uint64_t *)v36);
            HIDWORD(v31) = v18;
            sub_22D84B79C();

            swift_bridgeObjectRelease();
            v22 = (v34 & 1) == 0;
            *(_WORD *)(v13 + 12) = 2082;
            v23 = 1702195828;
            if (v22)
              v23 = 0x65736C6166;
            v24 = 0xE400000000000000;
            if (v22)
              v24 = 0xE500000000000000;
            if (v34 == 2)
              v25 = 7104878;
            else
              v25 = v23;
            if (v34 == 2)
              v26 = 0xE300000000000000;
            else
              v26 = v24;
            *(_QWORD *)&v35 = sub_22D83157C(v25, v26, (uint64_t *)v36);
            sub_22D84B79C();
            swift_bridgeObjectRelease();
            v27 = v32;
            _os_log_impl(&dword_22D80B000, v32, BYTE4(v31), "[%{public}s] ClientSetting[actionButtonInitiated] did change to %{public}s", (uint8_t *)v13, 0x16u);
            v28 = v33;
            swift_arrayDestroy();
            MEMORY[0x22E318218](v28, -1, -1);
            v29 = v13;
            LOBYTE(v13) = v34;
            MEMORY[0x22E318218](v29, -1, -1);

          }
          else
          {

          }
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          v30 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated];
          swift_beginAccess();
          *v30 = v13 & 1;
        }
        else
        {

        }
      }
    }

  }
}

void sub_22D82D180(unsigned __int8 a1, char *a2)
{
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    BSDispatchQueueAssertMain();
    v5 = *(void **)&a2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v6, sel_setAlpha_, 1.0);
      objc_msgSend(v6, sel_setHidden_, 0);
LABEL_11:

    }
  }
  else
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v7 = sub_22D84B49C();
    __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
    v8 = a2;
    v9 = sub_22D84B484();
    v10 = sub_22D84B6D0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = (_QWORD *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19 = v17;
      *(_DWORD *)v11 = 136446466;
      v13 = sub_22D821E84();
      sub_22D83157C(v13, v14, &v19);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2114;
      sub_22D83521C();
      swift_allocError();
      *v15 = a1;
      v18 = _swift_stdlib_bridgeErrorToNSError();
      sub_22D84B79C();
      *v12 = v18;
      _os_log_impl(&dword_22D80B000, v9, v10, "[%{public}s] Snapshot failed so backgrounding scene without updated snapshot: %{public}@", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5FD8);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v12, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v17, -1, -1);
      MEMORY[0x22E318218](v11, -1, -1);

    }
    else
    {

    }
    BSDispatchQueueAssertMain();
    v16 = *(void **)&v8[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v16)
    {
      v6 = v16;
      objc_msgSend(v6, sel_setAlpha_, 0.0);
      objc_msgSend(v6, sel_setHidden_, 1);
      goto LABEL_11;
    }
  }
  sub_22D8252DC(0, 0, 0);
}

void sub_22D82D454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  void *v5;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = (char *)MEMORY[0x22E31826C](v3);
  if (v4)
  {
    v5 = *(void **)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion];
    *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;

  }
}

void sub_22D82D4B0(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

void sub_22D82D504(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_22D82D564(void *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  sub_22D84BAB4();
  v10 = sub_22D8354AC();
  v9 = MEMORY[0x24BEE0D00];
  sub_22D84B7B4();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v6, v9, v10, v10, v10);

  v7 = objc_msgSend(a1, sel_setClientIdentity_, a3);
  v8 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *a2) + 0x4F8))(v7);
  objc_msgSend(a1, sel_setSpecification_, v8);

}

uint64_t sub_22D82D74C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_22D82D76C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_22D82D7A8(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

void sub_22D82D834(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  void **v9;
  void *v10;
  id v11;
  void **v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  _BYTE v17[24];

  v4 = sub_22D84B358();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityMutableSceneClientSettings()), sel_initWithSettings_, 0);
  v9 = (void **)(a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
  swift_beginAccess();
  v10 = *v9;
  v11 = v10;
  sub_22D827C78(v10, &qword_255D970F8);

  v12 = (void **)(a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
  swift_beginAccess();
  v13 = *v12;
  v14 = v13;
  sub_22D827C78(v13, &qword_255D97110);

  swift_beginAccess();
  sub_22D84B328();
  LOBYTE(v13) = sub_22D84B34C();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  v15 = objc_msgSend(v8, sel_otherSettings);
  v17[0] = v13 & 1;
  v16 = sub_22D84B9AC();
  swift_beginAccess();
  objc_msgSend(v15, sel_setObject_forSetting_, v16, qword_255D971D0);

  swift_unknownObjectRelease();
  objc_msgSend(a1, sel_setClientSettings_, v8);

}

void sub_22D82DA44(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_22D82DA78(void *a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, void *a6)
{
  uint64_t result;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  type metadata accessor for ActivityMutableSceneSettings();
  result = swift_dynamicCastClass();
  if (result)
  {
    v11 = (void *)result;
    v12 = a1;
    BSRectWithSize();
    objc_msgSend(v11, sel_setFrame_);
    objc_msgSend(v11, sel_setInterfaceOrientation_, 1);
    v13 = objc_msgSend((id)objc_opt_self(), sel_mainConfiguration);
    objc_msgSend(v11, sel_setDisplayConfiguration_, v13);

    objc_msgSend(v11, sel_setForeground_, a4 & 1);
    v14 = v12;
    v15 = objc_msgSend(a5, sel_traitCollection);
    v16 = objc_msgSend(v15, sel_userInterfaceStyle);

    objc_msgSend(v11, sel_setUserInterfaceStyle_, v16);
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *a5) + 0x500))();
    swift_bridgeObjectRetain();
    v17 = objc_msgSend(v11, sel_otherSettings);
    swift_bridgeObjectRetain();
    v18 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v17, sel_setObject_forSetting_, v18, qword_255D97680);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    v19 = (_QWORD *)((char *)a5
                   + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    v20 = objc_msgSend(v11, sel_otherSettings);
    swift_bridgeObjectRetain();
    v21 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v20, sel_setObject_forSetting_, v21, qword_255D97660);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    v22 = a6;
    v23 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v23, sel_setObject_forSetting_, v22, qword_255D97678);

    v24 = (id *)((char *)a5 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
    swift_beginAccess();
    v25 = *v24;
    v26 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v26, sel_setObject_forSetting_, v25, qword_255D976B0);

    v27 = objc_retain(objc_retain(*(id *)(*v19
                                        + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData)));
    v28 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v28, sel_setObject_forSetting_, v27, qword_255D97698);

    v29 = *(_QWORD *)(*v19 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID + 8);
    swift_bridgeObjectRetain_n();
    v30 = objc_msgSend(v11, sel_otherSettings);
    if (v29)
    {
      swift_bridgeObjectRetain();
      v31 = sub_22D84B9AC();
    }
    else
    {
      v31 = 0;
    }
    swift_beginAccess();
    objc_msgSend(v30, sel_setObject_forSetting_, v31, qword_255D976B8);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    swift_beginAccess();
    v32 = objc_msgSend(v11, sel_otherSettings);
    v33 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v32, sel_setObject_forSetting_, v33, qword_255D976D0);

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_22D82DFE8(char *a1, double a2, double a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id result;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  double v27;
  double v28;
  char *v29;
  uint64_t aBlock;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  uint64_t (*v34)();
  uint64_t v35;
  uint64_t v36;

  v27 = a2;
  v28 = a3;
  v29 = a1;
  BSDispatchQueueAssertMain();
  v6 = *(void **)&a1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v6)
    goto LABEL_3;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_22D835340;
  *(_QWORD *)(v7 + 24) = &v26;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_22D8358C8;
  *(_QWORD *)(v8 + 24) = v7;
  v34 = sub_22D8358C8;
  v35 = v8;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = sub_22D82D4B0;
  v33 = &block_descriptor_140;
  v9 = _Block_copy(&aBlock);
  v10 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performUpdate_, v9);

  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = (id)swift_release();
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_3:
    if (qword_2540C5F08 != -1)
      swift_once();
    v12 = sub_22D84B49C();
    __swift_project_value_buffer(v12, (uint64_t)qword_2540C5EE8);
    v13 = a1;
    v14 = sub_22D84B484();
    v15 = sub_22D84B6DC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v36 = v25;
      *(_DWORD *)v16 = 136446722;
      v17 = sub_22D821E84();
      aBlock = sub_22D83157C(v17, v18, &v36);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      aBlock = *(_QWORD *)&a2;
      v31 = *(_QWORD *)&a3;
      type metadata accessor for CGSize(0);
      v19 = sub_22D84B5D4();
      aBlock = sub_22D83157C(v19, v20, &v36);
      sub_22D84B79C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2082;
      objc_msgSend(v13, sel_preferredContentSize);
      aBlock = v21;
      v31 = v22;
      v23 = sub_22D84B5D4();
      aBlock = sub_22D83157C(v23, v24, &v36);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v14, v15, "[%{public}s] Updating preferred content size with requested size: %{public}s, current size: %{public}s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v25, -1, -1);
      MEMORY[0x22E318218](v16, -1, -1);

    }
    else
    {

    }
    return objc_msgSend(v13, sel_setPreferredContentSize_, a2, a3, v25);
  }
  return result;
}

void sub_22D82E3A8(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  type metadata accessor for ActivityMutableSceneSettings();
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = (void *)v6;
    v15 = a1;
    BSRectWithSize();
    objc_msgSend(v7, sel_setFrame_);
    v8 = objc_msgSend((id)objc_opt_self(), sel_settingsWithMass_stiffness_damping_, 1.0, 145.0, 22.0);
    objc_msgSend(a2, sel_setAnimationSettings_, v8);

    v9 = objc_msgSend(a3, sel_view);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v9, sel_window);

      if (v11)
      {
        v12 = objc_msgSend(v11, sel_windowScene);

        if (v12)
        {
          v13 = objc_msgSend(v12, sel__synchronizedDrawingFence);

          if (v13)
          {
            v14 = v13;
            objc_msgSend(a2, sel_setAnimationFence_, v14);

          }
        }
      }

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_22D82E548(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_22D8322A4(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22D8322A4(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_22D8322A4(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_22D81CE70(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_22D82E664(void *a1, void *a2, const char *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *oslog;
  uint64_t v20;

  if (a1)
  {
    v6 = a1;
    if (qword_2540C5F08 != -1)
      swift_once();
    v7 = sub_22D84B49C();
    __swift_project_value_buffer(v7, (uint64_t)qword_2540C5EE8);
    v8 = a1;
    v9 = a2;
    v10 = a1;
    v11 = v9;
    oslog = sub_22D84B484();
    v12 = sub_22D84B6DC();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v14;
      *(_DWORD *)v13 = 136446466;
      v15 = sub_22D821E84();
      sub_22D83157C(v15, v16, &v20);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      v17 = sub_22D84B9E8();
      sub_22D83157C(v17, v18, &v20);
      sub_22D84B79C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22D80B000, oslog, v12, a3, (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v14, -1, -1);
      MEMORY[0x22E318218](v13, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_22D82E8C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22D82E8F0(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t aBlock;
  uint64_t v33;
  uint64_t (*v34)();
  void *v35;
  void *v36;
  _QWORD *v37;

  if ((a2 & 1) != 0)
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v12 = sub_22D84B49C();
    __swift_project_value_buffer(v12, (uint64_t)qword_2540C5EE8);
    v13 = a3;
    v14 = sub_22D84B484();
    v15 = sub_22D84B6D0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      aBlock = v17;
      *(_DWORD *)v16 = 136446466;
      v18 = sub_22D821E84();
      sub_22D83157C(v18, v19, &aBlock);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      sub_22D83521C();
      v20 = sub_22D84B97C();
      v30 = v17;
      v31 = a4;
      if (v20)
      {
        v21 = (void *)v20;
      }
      else
      {
        v21 = (void *)swift_allocError();
        *v22 = (_BYTE)a1;
      }
      v23 = (void *)sub_22D84B250();

      v24 = objc_msgSend(v23, sel_localizedDescription);
      v25 = sub_22D84B5C8();
      v27 = v26;

      sub_22D83157C(v25, v27, &aBlock);
      sub_22D84B79C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v14, v15, "[%{public}s] Snapshot failed - %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v30, -1, -1);
      MEMORY[0x22E318218](v16, -1, -1);

      a4 = v31;
    }
    else
    {

    }
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = a4;
    *(_QWORD *)(v28 + 24) = a5;
    *(_BYTE *)(v28 + 32) = (_BYTE)a1;
    v36 = sub_22D8351F4;
    v37 = (_QWORD *)v28;
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_22D829EC0;
    v35 = &block_descriptor_111;
    v29 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v29);
  }
  else
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    v9[5] = a5;
    v36 = sub_22D835294;
    v37 = v9;
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_22D829EC0;
    v35 = &block_descriptor_117;
    v10 = _Block_copy(&aBlock);
    sub_22D8352A0(a1, 0);
    sub_22D8352A0(a1, 0);
    v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_22D8352AC(a1, 0);
  }
}

void sub_22D82ECAC(char *a1, void *a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint8_t *v14;
  id v15;
  void *v16;
  id v17;
  void (*v18)(_QWORD);
  uint64_t v19;

  if (*(_DWORD *)&a1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] == 2)
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v6 = sub_22D84B49C();
    __swift_project_value_buffer(v6, (uint64_t)qword_2540C5EE8);
    v7 = a1;
    v8 = sub_22D84B484();
    v9 = sub_22D84B6DC();
    if (os_log_type_enabled(v8, v9))
    {
      v18 = a3;
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v19 = v11;
      *(_DWORD *)v10 = 136446210;
      v12 = sub_22D821E84();
      sub_22D83157C(v12, v13, &v19);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v8, v9, "[%{public}s] Snapshot success - Updating layer.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v11, -1, -1);
      v14 = v10;
      a3 = v18;
      MEMORY[0x22E318218](v14, -1, -1);

    }
    else
    {

    }
    v15 = objc_msgSend(a2, sel_IOSurface);
    if (!v15)
      v15 = objc_msgSend(a2, sel_fallbackIOSurface);
    v16 = *(void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v16)
    {
      v17 = objc_msgSend(v16, sel_layer);
      objc_msgSend(v17, sel_setContents_, v15);

    }
    a3(3);

  }
}

unint64_t sub_22D82EEFC(char a1)
{
  unint64_t result;

  result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000025;
    else
      return 0xD000000000000021;
  }
  return result;
}

BOOL sub_22D82EF5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_22D82EF70()
{
  char *v0;

  return sub_22D82EEFC(*v0);
}

id ActivityHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ActivityHostViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivityHostViewController.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  char *v2;
  char *v3;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  id v59;
  char *v60;
  id v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t aBlock;
  unint64_t v104;
  void (*v105)(uint64_t, void *);
  void *v106;
  void (*v107)(void *);
  uint64_t v108;
  uint64_t v109;

  v3 = v2;
  v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  v6 = &unk_2540C5000;
  if (a2)
  {
    v7 = a2;
    if (qword_2540C5F08 != -1)
      swift_once();
    v8 = sub_22D84B49C();
    __swift_project_value_buffer(v8, (uint64_t)qword_2540C5EE8);
    v9 = a2;
    v10 = v2;
    v11 = a2;
    v12 = v10;
    v13 = sub_22D84B484();
    v14 = sub_22D84B6C4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v101 = swift_slowAlloc();
      aBlock = v101;
      *(_DWORD *)v15 = 136446466;
      v16 = sub_22D821E84();
      v109 = sub_22D83157C(v16, v17, &aBlock);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      swift_getErrorValue();
      v18 = sub_22D84B9E8();
      v109 = sub_22D83157C(v18, v19, &aBlock);
      v6 = (_QWORD *)&unk_2540C5000;
      sub_22D84B79C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22D80B000, v13, v14, "[%{public}s] Scene did deactivate with error: %{public}s.", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v101, -1, -1);
      MEMORY[0x22E318218](v15, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_2540C5F08 != -1)
      swift_once();
    v20 = sub_22D84B49C();
    __swift_project_value_buffer(v20, (uint64_t)qword_2540C5EE8);
    v21 = v2;
    v22 = sub_22D84B484();
    v23 = sub_22D84B6C4();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      aBlock = v25;
      *(_DWORD *)v24 = 136446210;
      v26 = sub_22D821E84();
      v109 = sub_22D83157C(v26, v27, &aBlock);
      v6 = (_QWORD *)&unk_2540C5000;
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v22, v23, "[%{public}s] Scene did deactivate.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v25, -1, -1);
      MEMORY[0x22E318218](v24, -1, -1);

    }
    else
    {

    }
  }
  v28 = *(void **)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v28)
  {
    v29 = v28;
    if ((sub_22D833EE0(a2) & 1) != 0)
    {
      v30 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout;
      if (*(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] == 10)
      {
        v31 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
        swift_beginAccess();
        v32 = (uint64_t *)(*(_QWORD *)v31
                        + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier);
        v33 = v6;
        v35 = *v32;
        v34 = v32[1];
        v36 = v33[481];
        swift_bridgeObjectRetain();
        if (v36 != -1)
          swift_once();
        v37 = sub_22D84B49C();
        __swift_project_value_buffer(v37, (uint64_t)qword_2540C5EE8);
        v38 = v3;
        swift_bridgeObjectRetain_n();
        v39 = v38;
        v40 = sub_22D84B484();
        v41 = sub_22D84B6DC();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = swift_slowAlloc();
          v99 = swift_slowAlloc();
          v109 = v99;
          *(_DWORD *)v42 = 136447234;
          v43 = sub_22D821E84();
          sub_22D83157C(v43, v44, &v109);
          sub_22D84B79C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 12) = 2082;
          v46 = *(_QWORD *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
          v45 = *(_QWORD *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8];
          swift_bridgeObjectRetain();
          sub_22D83157C(v46, v45, &v109);
          sub_22D84B79C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 22) = 2050;
          sub_22D84B79C();
          *(_WORD *)(v42 + 32) = 2050;
          sub_22D84B79C();
          *(_WORD *)(v42 + 42) = 2082;
          swift_bridgeObjectRetain();
          sub_22D83157C(v35, v34, &v109);
          sub_22D84B79C();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22D80B000, v40, v41, "[%{public}s] %{public}s exited %{public}ld times within %{public}f seconds, ending the session: %{public}s", (uint8_t *)v42, 0x34u);
          swift_arrayDestroy();
          MEMORY[0x22E318218](v99, -1, -1);
          MEMORY[0x22E318218](v42, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_22D84B37C();
        sub_22D84B370();
        sub_22D84B364();

        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
      if (v6[481] != -1)
        swift_once();
      v57 = sub_22D84B49C();
      __swift_project_value_buffer(v57, (uint64_t)qword_2540C5EE8);
      v58 = v2;
      v59 = a2;
      v60 = v58;
      v61 = a2;
      v62 = v60;
      v63 = sub_22D84B484();
      v64 = sub_22D84B6DC();
      if (os_log_type_enabled(v63, v64))
      {
        v102 = v29;
        v65 = swift_slowAlloc();
        v98 = swift_slowAlloc();
        aBlock = v98;
        *(_DWORD *)v65 = 136447234;
        v66 = sub_22D821E84();
        v109 = sub_22D83157C(v66, v67, &aBlock);
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v65 + 12) = 2082;
        v100 = a1;
        v68 = *(_QWORD *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
        v69 = *(_QWORD *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8];
        swift_bridgeObjectRetain();
        v109 = sub_22D83157C(v68, v69, &aBlock);
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v65 + 22) = 2050;
        v109 = 0x4014000000000000;
        sub_22D84B79C();
        *(_WORD *)(v65 + 32) = 2080;
        v109 = (uint64_t)a2;
        v70 = a2;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6030);
        v71 = sub_22D84B5D4();
        v109 = sub_22D83157C(v71, v72, &aBlock);
        a1 = v100;
        sub_22D84B79C();
        swift_bridgeObjectRelease();

        *(_WORD *)(v65 + 42) = 2080;
        v109 = *(_QWORD *)&v3[v30];
        v73 = sub_22D84B970();
        v109 = sub_22D83157C(v73, v74, &aBlock);
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D80B000, v63, v64, "[%{public}s] %{public}s exited within %{public}f seconds with error: %s, sceneClientExitCountWithinTimeout: %s", (uint8_t *)v65, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x22E318218](v98, -1, -1);
        v75 = v65;
        v29 = v102;
        MEMORY[0x22E318218](v75, -1, -1);

      }
      else
      {

      }
      v76 = *(_QWORD *)&v3[v30];
      v77 = __OFADD__(v76, 1);
      v78 = v76 + 1;
      if (v77)
      {
        __break(1u);
        goto LABEL_42;
      }
      *(_QWORD *)&v3[v30] = v78;
      v79 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer;
      if (!*(_QWORD *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer])
      {
        v80 = objc_allocWithZone(MEMORY[0x24BE0BD78]);
        v81 = (void *)sub_22D84B5BC();
        v82 = objc_msgSend(v80, sel_initWithIdentifier_, v81);

        v83 = *(void **)&v62[v79];
        *(_QWORD *)&v62[v79] = v82;

        v84 = *(void **)&v62[v79];
        if (v84)
        {
          sub_22D819F60(0, &qword_2540C5F80);
          v85 = v84;
          v86 = (void *)sub_22D84B70C();
          v87 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v107 = sub_22D834428;
          v108 = v87;
          aBlock = MEMORY[0x24BDAC760];
          v104 = 1107296256;
          v105 = sub_22D81E14C;
          v106 = &block_descriptor_64;
          v88 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v85, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v86, v88, 5.0, 0.0);
          _Block_release(v88);

        }
      }
    }
    sub_22D819F60(0, (unint64_t *)&qword_2540C5FD0);
    if ((sub_22D84B76C() & 1) == 0)
    {
LABEL_40:

      return;
    }
    v89 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer;
    if (*(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer])
      goto LABEL_39;
    aBlock = 0;
    v104 = 0xE000000000000000;
    sub_22D84B850();
    swift_bridgeObjectRelease();
    aBlock = 0xD00000000000001BLL;
    v104 = 0x800000022D852240;
    sub_22D821E84();
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    v90 = aBlock;
    v91 = v104;
    sub_22D819F60(0, &qword_2540C5F80);
    v92 = sub_22D84B70C();
    v93 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v94 = swift_allocObject();
    *(_QWORD *)(v94 + 16) = v93;
    *(_QWORD *)(v94 + 24) = a1;
    type metadata accessor for BackOffTimer();
    v95 = swift_allocObject();
    *(_QWORD *)(v95 + 16) = 0;
    *(_QWORD *)(v95 + 24) = 0;
    *(_BYTE *)(v95 + 80) = 1;
    *(_QWORD *)(v95 + 88) = 0;
    *(_QWORD *)(v95 + 32) = v90;
    *(_QWORD *)(v95 + 40) = v91;
    *(_QWORD *)(v95 + 48) = v92;
    *(_QWORD *)(v95 + 56) = sub_22D834420;
    *(_QWORD *)(v95 + 64) = v94;
    *(_QWORD *)(v95 + 72) = 0;
    *(_QWORD *)&v3[v89] = v95;
    v96 = a1;
    swift_release();
    v97 = *(_QWORD *)&v3[v89];
    if (v97)
    {
      *(_QWORD *)(v97 + 72) = 0x4046800000000000;
      *(_BYTE *)(v97 + 80) = 0;
      if (*(_QWORD *)&v3[v89])
      {
LABEL_39:
        swift_retain();
        sub_22D81D9A8();
        swift_release();
        goto LABEL_40;
      }
    }
LABEL_42:
    __break(1u);
    return;
  }
  if (v6[481] != -1)
    swift_once();
  v47 = sub_22D84B49C();
  __swift_project_value_buffer(v47, (uint64_t)qword_2540C5EE8);
  v48 = a1;
  v49 = sub_22D84B484();
  v50 = sub_22D84B6D0();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    aBlock = v52;
    *(_DWORD *)v51 = 136315138;
    v53 = objc_msgSend(v48, sel_identifier);
    v54 = sub_22D84B5C8();
    v56 = v55;

    v109 = sub_22D83157C(v54, v56, &aBlock);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v49, v50, "No activity scene found: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v52, -1, -1);
    MEMORY[0x22E318218](v51, -1, -1);

  }
  else
  {

  }
}

void sub_22D82FF44(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E31826C](v3);
  if (v4)
  {
    v5 = (char *)v4;
    *(_QWORD *)(v4 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout) = 0;
    objc_msgSend(a1, sel_invalidate);
    v6 = *(void **)&v5[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer];
    *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;

  }
}

void sub_22D82FFC4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E31826C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(a2, sel_settings);
    v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((_BYTE *)v5 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) & 1) == 0 && v7)
    {
      if (qword_2540C5F08 != -1)
        swift_once();
      v8 = sub_22D84B49C();
      __swift_project_value_buffer(v8, (uint64_t)qword_2540C5EE8);
      v9 = v5;
      v10 = sub_22D84B484();
      v11 = sub_22D84B6DC();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        v16 = v13;
        *(_DWORD *)v12 = 136446210;
        v14 = sub_22D821E84();
        sub_22D83157C(v14, v15, &v16);
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D80B000, v10, v11, "[%{public}s] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E318218](v13, -1, -1);
        MEMORY[0x22E318218](v12, -1, -1);

      }
      else
      {

      }
      objc_msgSend(a2, sel_activateWithTransitionContext_, 0);
    }

  }
}

void ActivityHostViewController.sceneContentStateDidChange(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;

  if (qword_2540C5F08 != -1)
    swift_once();
  v3 = sub_22D84B49C();
  __swift_project_value_buffer(v3, (uint64_t)qword_2540C5EE8);
  v4 = v1;
  v5 = a1;
  v15 = v4;
  v6 = v5;
  v7 = sub_22D84B484();
  v8 = sub_22D84B6DC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v16 = v10;
    *(_DWORD *)v9 = 136446466;
    v11 = sub_22D821E84();
    sub_22D83157C(v11, v12, &v16);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    objc_msgSend(v6, sel_contentState);
    type metadata accessor for FBSceneContentState(0);
    v13 = sub_22D84B5D4();
    sub_22D83157C(v13, v14, &v16);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v7, v8, "[%{public}s] Content state changed: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v10, -1, -1);
    MEMORY[0x22E318218](v9, -1, -1);

  }
  else
  {

  }
}

void ActivityHostViewController.scene(_:didReceive:)(uint64_t a1, int64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  id v51;
  char *v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  int64_t v70;
  unint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  char *v76;
  int64_t v77;
  void *v78;
  int64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  uint64_t v88[6];

  if (qword_2540C5F08 == -1)
    goto LABEL_2;
LABEL_90:
  swift_once();
LABEL_2:
  v4 = sub_22D84B49C();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2540C5EE8);
  v6 = v2;
  swift_bridgeObjectRetain_n();
  v7 = v6;
  v76 = (char *)v5;
  v2 = (char *)v5;
  v8 = sub_22D84B484();
  v9 = sub_22D84B6DC();
  v83 = v7;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v88[0] = v11;
    *(_DWORD *)v10 = 136446467;
    v12 = sub_22D821E84();
    v86 = sub_22D83157C(v12, v13, v88);
    v2 = (char *)v87;
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2081;
    sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    sub_22D833C04();
    swift_bridgeObjectRetain();
    v14 = sub_22D84B6A0();
    v16 = v15;
    swift_bridgeObjectRelease();
    v17 = v14;
    v7 = v83;
    v86 = sub_22D83157C(v17, v16, v88);
    sub_22D84B79C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v8, v9, "[%{public}s] Scene did receive actions: %{private}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v11, -1, -1);
    MEMORY[0x22E318218](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] & 1) != 0)
    return;
  v85 = MEMORY[0x24BEE4B08];
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22D84B7F0();
    v2 = (char *)sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    sub_22D833C04();
    sub_22D84B6AC();
    a2 = v86;
    v80 = v87[0];
    v18 = v87[1];
    v19 = v87[2];
    v20 = v87[3];
  }
  else
  {
    v21 = -1 << *(_BYTE *)(a2 + 32);
    v80 = a2 + 56;
    v22 = ~v21;
    v23 = -v21;
    if (v23 < 64)
      v24 = ~(-1 << v23);
    else
      v24 = -1;
    v20 = v24 & *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    v18 = v22;
    v19 = 0;
  }
  v79 = (unint64_t)(v18 + 64) >> 6;
  v25 = &qword_255D97000;
  v77 = a2;
  while (1)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (v20)
      {
        v82 = (v20 - 1) & v20;
        v26 = __clz(__rbit64(v20)) | (v19 << 6);
        v27 = v19;
      }
      else
      {
        v29 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_89;
        if (v29 >= v79)
          break;
        v30 = *(_QWORD *)(v80 + 8 * v29);
        v27 = v19 + 1;
        if (!v30)
        {
          v27 = v19 + 2;
          if (v19 + 2 >= v79)
            break;
          v30 = *(_QWORD *)(v80 + 8 * v27);
          if (!v30)
          {
            v27 = v19 + 3;
            if (v19 + 3 >= v79)
              break;
            v30 = *(_QWORD *)(v80 + 8 * v27);
            if (!v30)
            {
              v27 = v19 + 4;
              if (v19 + 4 >= v79)
                break;
              v30 = *(_QWORD *)(v80 + 8 * v27);
              if (!v30)
              {
                v31 = v19 + 5;
                do
                {
                  if (v79 == v31)
                    goto LABEL_86;
                  v30 = *(_QWORD *)(v80 + 8 * v31++);
                }
                while (!v30);
                v27 = v31 - 1;
              }
            }
          }
        }
        v82 = (v30 - 1) & v30;
        v26 = __clz(__rbit64(v30)) + (v27 << 6);
      }
      v28 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v26);
      if (!v28)
        break;
      goto LABEL_36;
    }
    if (!sub_22D84B814())
      break;
    sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v28 = v84;
    swift_unknownObjectRelease();
    v27 = v19;
    v82 = v20;
    if (!v28)
      break;
LABEL_36:
    v81 = v27;
    objc_opt_self();
    v32 = swift_dynamicCastObjCClass();
    if (v32 && (v2 = (char *)v32, v33 = &v7[v25[77]], swift_beginAccess(), (v34 = MEMORY[0x22E31826C](v33)) != 0))
    {
      v35 = (void *)v34;
      v36 = v28;
      v37 = objc_msgSend(v2, sel_launchActions);
      if (!v37)
      {
        objc_msgSend(v35, sel_activityHostViewControllerWithViewController_requestsLaunchWithAction_, v7, 0);
        goto LABEL_52;
      }
      v38 = v37;
      v78 = v36;
      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      sub_22D833C04();
      v39 = sub_22D84B694();

      if ((v39 & 0xC000000000000001) != 0)
      {
        sub_22D84B7F0();
        sub_22D84B6AC();
        v39 = v88[0];
        v40 = v88[1];
        v41 = v88[2];
        v42 = v88[3];
        v43 = v88[4];
      }
      else
      {
        v42 = 0;
        v63 = -1 << *(_BYTE *)(v39 + 32);
        v40 = v39 + 56;
        v41 = ~v63;
        v64 = -v63;
        if (v64 < 64)
          v65 = ~(-1 << v64);
        else
          v65 = -1;
        v43 = v65 & *(_QWORD *)(v39 + 56);
      }
      v2 = (char *)(v39 & 0x7FFFFFFFFFFFFFFFLL);
      a2 = (unint64_t)(v41 + 64) >> 6;
      if (v39 < 0)
      {
        while (sub_22D84B814())
        {
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v69 = v84;
          swift_unknownObjectRelease();
          v68 = v42;
          v66 = v43;
          if (!v69)
            break;
LABEL_81:
          objc_msgSend(v35, sel_activityHostViewControllerWithViewController_requestsLaunchWithAction_, v83, v69);

          v42 = v68;
          v43 = v66;
          if ((v39 & 0x8000000000000000) == 0)
            goto LABEL_61;
        }
      }
      else
      {
LABEL_61:
        if (v43)
        {
          v66 = (v43 - 1) & v43;
          v67 = __clz(__rbit64(v43)) | (v42 << 6);
          v68 = v42;
          goto LABEL_80;
        }
        v70 = v42 + 1;
        if (__OFADD__(v42, 1))
        {
          __break(1u);
LABEL_89:
          __break(1u);
          goto LABEL_90;
        }
        if (v70 < a2)
        {
          v71 = *(_QWORD *)(v40 + 8 * v70);
          v68 = v42 + 1;
          if (v71)
            goto LABEL_79;
          v68 = v42 + 2;
          if (v42 + 2 >= a2)
            goto LABEL_83;
          v71 = *(_QWORD *)(v40 + 8 * v68);
          if (v71)
            goto LABEL_79;
          v68 = v42 + 3;
          if (v42 + 3 >= a2)
            goto LABEL_83;
          v71 = *(_QWORD *)(v40 + 8 * v68);
          if (v71)
            goto LABEL_79;
          v68 = v42 + 4;
          if (v42 + 4 >= a2)
            goto LABEL_83;
          v71 = *(_QWORD *)(v40 + 8 * v68);
          if (v71)
          {
LABEL_79:
            v66 = (v71 - 1) & v71;
            v67 = __clz(__rbit64(v71)) + (v68 << 6);
LABEL_80:
            v69 = *(id *)(*(_QWORD *)(v39 + 48) + 8 * v67);
            if (!v69)
              goto LABEL_83;
            goto LABEL_81;
          }
          v72 = v42 + 5;
          while (a2 != v72)
          {
            v71 = *(_QWORD *)(v40 + 8 * v72++);
            if (v71)
            {
              v68 = v72 - 1;
              goto LABEL_79;
            }
          }
        }
      }
LABEL_83:
      sub_22D83555C();
      swift_unknownObjectRelease();

      v19 = v81;
      v20 = v82;
      a2 = v77;
      v7 = v83;
      v25 = &qword_255D97000;
    }
    else
    {
      objc_opt_self();
      v44 = swift_dynamicCastObjCClass();
      if (!v44)
      {
        v2 = (char *)&v85;
        sub_22D83242C(&v84, v28);

        goto LABEL_14;
      }
      v45 = (void *)v44;
      v36 = v28;
      v46 = objc_msgSend(v45, sel_command);
      if (v46 == (id)3)
      {
        v2 = &v7[v25[77]];
        swift_beginAccess();
        v48 = (char *)MEMORY[0x22E31826C](v2);
        if (v48)
        {
          v2 = v48;
          objc_msgSend(v48, sel_activityHostViewControllerSignificantUserInteractionEndedWithViewController_, v7);
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (v46 == (id)2)
      {
        v2 = &v7[v25[77]];
        swift_beginAccess();
        v49 = (char *)MEMORY[0x22E31826C](v2);
        if (v49)
        {
          v2 = v49;
          objc_msgSend(v49, sel_activityHostViewControllerSignificantUserInteractionBeganWithViewController_, v7);
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (v46 == (id)1)
      {
        v2 = &v7[v25[77]];
        swift_beginAccess();
        v47 = (char *)MEMORY[0x22E31826C](v2);
        if (v47)
        {
          v2 = v47;
          objc_msgSend(v47, sel_activityHostViewControllerHostShouldCancelTouchesWithViewController_, v7);
LABEL_52:
          swift_unknownObjectRelease();
        }
LABEL_53:

LABEL_14:
        v19 = v81;
        v20 = v82;
      }
      else
      {
        v50 = v7;
        v51 = v36;
        v52 = v50;
        v53 = v51;
        v2 = v76;
        v54 = sub_22D84B484();
        v55 = sub_22D84B6D0();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = swift_slowAlloc();
          v57 = (void *)swift_slowAlloc();
          v84 = v57;
          *(_DWORD *)v56 = 136446466;
          v58 = sub_22D821E84();
          *(_QWORD *)(v56 + 4) = sub_22D83157C(v58, v59, (uint64_t *)&v84);

          swift_bridgeObjectRelease();
          *(_WORD *)(v56 + 12) = 2080;
          objc_msgSend(v45, sel_command);
          type metadata accessor for ACUISActivitySceneCommand(0);
          v60 = sub_22D84B5D4();
          v2 = (char *)v61;
          *(_QWORD *)(v56 + 14) = sub_22D83157C(v60, v61, (uint64_t *)&v84);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D80B000, v54, v55, "[%{public}s] Unknown ACUISActivitySceneAction command: %s", (uint8_t *)v56, 0x16u);
          swift_arrayDestroy();
          v62 = v57;
          v7 = v83;
          MEMORY[0x22E318218](v62, -1, -1);
          MEMORY[0x22E318218](v56, -1, -1);

        }
        else
        {

        }
        v19 = v81;
        v20 = v82;
        v25 = &qword_255D97000;
      }
    }
  }
LABEL_86:
  sub_22D83555C();
  v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BA10]), sel_init);
  sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
  sub_22D833C04();
  v74 = (void *)sub_22D84B688();
  swift_bridgeObjectRelease();

}

id ActivityHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_22D834430(a2, a4);
}

void ActivityHostViewController.sceneLayerManagerDidUpdateLayers(_:)()
{
  sub_22D83463C(sub_22D8267C4, "[%{public}s] sceneLayerManagerDidUpdateLayers");
}

void ActivityHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)()
{
  sub_22D83463C((void (*)(void))sub_22D826F10, "[%{public}s] sceneLayerManagerDidStopTrackingLayers");
}

void ActivityHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)()
{
  sub_22D83463C(sub_22D8267C4, "[%{public}s] sceneLayerManagerDidStartTrackingLayers");
}

uint64_t sub_22D831290(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22D8312A0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *sub_22D8312D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D96F90);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22D833310(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22D8313E0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6028);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22D8337A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D8314EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22D83150C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_22D83157C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_22D84B79C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22D83157C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22D83164C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22D8355D4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_22D8355D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22D83164C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22D84B7A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22D831804(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_22D84B874();
  if (!v8)
  {
    sub_22D84B8BC();
    __break(1u);
LABEL_17:
    result = sub_22D84B910();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22D831804(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22D831898(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22D831A70(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22D831A70(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22D831898(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_22D831A0C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22D84B85C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22D84B8BC();
      __break(1u);
LABEL_10:
      v2 = sub_22D84B5F8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22D84B910();
    __break(1u);
LABEL_14:
    result = sub_22D84B8BC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22D831A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6000);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22D831A70(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6000);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22D84B910();
  __break(1u);
  return result;
}

_BYTE **sub_22D831BBC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_22D831BCC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_22D84B910();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_22D831C60@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22D831C88(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_22D84B79C();
  *a1 = v5;
  return result;
}

unint64_t sub_22D831CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22D84BA30();
  sub_22D84B5E0();
  v4 = sub_22D84BA78();
  return sub_22D831DE0(a1, a2, v4);
}

unint64_t sub_22D831D3C(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x22E317AD4](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_22D831EC0(a1, v3);
}

unint64_t sub_22D831D70(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D963C0);
  v2 = sub_22D84B598();
  return sub_22D831F5C(a1, v2);
}

unint64_t sub_22D831DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22D84B994() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22D84B994() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22D831EC0(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_22D831F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D963C0);
    do
    {
      if ((sub_22D84B5B0() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_22D832028(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  _DWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_22D84B7D8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_DWORD *)(v9 + 4 * v6);
        result = MEMORY[0x22E317AD4](*(_QWORD *)(a2 + 40), *v10, 4);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_DWORD *)(v9 + 4 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_22D8321C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6010);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 29;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * (v5 >> 2);
  v6 = sub_22D83317C(&v8, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_22D83555C();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_22D8322A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22D8322C0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22D8322C0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6018);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22D84B910();
  __break(1u);
  return result;
}

uint64_t sub_22D83242C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_22D84B808();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_22D84B7FC();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_22D8326C8(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_22D8328BC();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_22D832B58((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_22D84B760();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_22D84B76C();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_22D84B76C();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_22D832BD8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_22D8326C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FE0);
    v2 = sub_22D84B838();
    v14 = v2;
    sub_22D84B7F0();
    if (sub_22D84B814())
    {
      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_22D8328BC();
          v2 = v14;
        }
        result = sub_22D84B760();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_22D84B814());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_22D8328BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FE0);
  v3 = sub_22D84B82C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_22D84B760();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_22D832B58(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_22D84B760();
  result = sub_22D84B7E4();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_22D832BD8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_22D8328BC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_22D832D5C();
      goto LABEL_14;
    }
    sub_22D832F04();
  }
  v8 = *v3;
  v9 = sub_22D84B760();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_22D84B76C();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_22D84B9B8();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_22D84B76C();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id sub_22D832D5C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FE0);
  v2 = *v0;
  v3 = sub_22D84B820();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22D832F04()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FE0);
  v3 = sub_22D84B82C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_22D84B760();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

_QWORD *sub_22D83317C(_QWORD *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_DWORD *)(*(_QWORD *)(a4 + 48) + 4 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

char *sub_22D833310(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_22D84B910();
  __break(1u);
  return result;
}

unint64_t sub_22D8333F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned int v4;
  void *v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FF0);
  v3 = (_QWORD *)sub_22D84B904();
  v4 = *(_DWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  result = sub_22D831D3C(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    v16 = v5;
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = v8 + 2;
    v4 = *((_DWORD *)v8 - 2);
    v13 = (void *)*v8;
    v14 = v5;
    result = sub_22D831D3C(v4);
    v8 = v12;
    v5 = v13;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D8334F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22D84B3AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ActivityHostViewController()
{
  return objc_opt_self();
}

uint64_t sub_22D83354C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_22D833570(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_22D8282C4(a1, a2, v2);
}

uint64_t sub_22D833578()
{
  return swift_deallocObject();
}

uint64_t sub_22D833588()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22D8335A8()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_22D8335D0()
{
  id *v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D83360C(uint64_t a1)
{
  uint64_t v1;

  return sub_22D8298F8(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_22D83361C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D833648()
{
  uint64_t v0;

  sub_22D82A0F0(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

id sub_22D833654(void *a1)
{
  uint64_t v1;

  return sub_22D82A2E8(a1, *(id *)(v1 + 16));
}

void sub_22D83365C()
{
  uint64_t v0;

  sub_22D829F00(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), "[%{public}s] Ensure content: initial content size ready");
}

void sub_22D833698()
{
  uint64_t v0;

  sub_22D829F00(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), "[%{public}s] Ensure content: archive content ready");
}

void sub_22D8336D4(void *a1)
{
  uint64_t v1;

  sub_22D82E664(a1, *(void **)(v1 + 16), "[%{public}s] Sending cancellation touch delivery policy failed with error: %{public}s");
}

void *sub_22D8336F4(void *a1, _QWORD *a2, SEL *a3)
{
  uint64_t v3;
  void **v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *result;

  v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v8 = a1;

  BSDispatchQueueAssertMain();
  v9 = v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x22E31826C](v9);
  if (result)
  {
    objc_msgSend(result, *a3, v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22D8337A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_2540C6040);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22D84B910();
  __break(1u);
  return result;
}

void sub_22D8338A8(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_22D84B8D4();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FE0);
      v3 = sub_22D84B844();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_22D84B8D4();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x22E317918](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_22D84B760();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_22D84B76C();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_22D84B76C();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_22D84B760();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_22D84B76C();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_22D84B76C();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

unint64_t sub_22D833C04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2540C5FC0;
  if (!qword_2540C5FC0)
  {
    v1 = sub_22D819F60(255, (unint64_t *)&unk_2540C5FB0);
    result = MEMORY[0x22E318194](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2540C5FC0);
  }
  return result;
}

void sub_22D833C5C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_22D8291B8(a1, a2, v2);
}

uint64_t sub_22D833C64()
{
  return swift_deallocObject();
}

uint64_t sub_22D833C74()
{
  return swift_deallocObject();
}

id sub_22D833C84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22D82949C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_22D833C8C()
{
  return swift_deallocObject();
}

uint64_t sub_22D833C9C()
{
  return swift_deallocObject();
}

void sub_22D833CAC()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  swift_unknownObjectWeakInit();
  *(_DWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily] = 2;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated] = 0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v2 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector()), sel_init);
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReady] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks] = v1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks] = v1;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks] = v1;
  v3 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions;
  *(_QWORD *)&v0[v3] = sub_22D8333F8(v1);
  v4 = &v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier];
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost] = 0;

  sub_22D84B8C8();
  __break(1u);
}

void *sub_22D833EE0(void *result)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  id v10;

  if (result)
  {
    v1 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5E70);
    sub_22D819F60(0, &qword_2540C5FA0);
    if ((swift_dynamicCast() & 1) == 0)
      return 0;
    v2 = objc_msgSend(v10, sel_domain);
    v3 = sub_22D84B5C8();
    v5 = v4;

    if (v3 == sub_22D84B5C8() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_22D84B994();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {

        return 0;
      }
    }
    v9 = objc_msgSend(v10, sel_code);

    return (void *)(v9 == (id)4);
  }
  return result;
}

uint64_t _s18ActivityUIServices0A18HostViewControllerC16sceneDidActivateyySo7FBSceneCF_0()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v16[3];

  if (qword_2540C5F08 != -1)
    swift_once();
  v1 = sub_22D84B49C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2540C5EE8);
  v2 = v0;
  v3 = sub_22D84B484();
  v4 = sub_22D84B6C4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v16[0] = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_22D821E84();
    sub_22D83157C(v7, v8, v16);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v3, v4, "[%{public}s] Scene did activate.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v6, -1, -1);
    MEMORY[0x22E318218](v5, -1, -1);

  }
  else
  {

  }
  v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 1;
  v9 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks];
  swift_beginAccess();
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(*(_QWORD *)v9 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    v12 = v10 + 40;
    do
    {
      v13 = *(void (**)(uint64_t))(v12 - 8);
      v14 = swift_retain();
      v13(v14);
      swift_release();
      v12 += 16;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)v9 = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

void _s18ActivityUIServices0A18HostViewControllerC18sceneDidInvalidateyySo7FBSceneCF_0()
{
  _BYTE *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;

  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  if (qword_2540C5F08 != -1)
    swift_once();
  v1 = sub_22D84B49C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2540C5EE8);
  v8 = v0;
  v2 = sub_22D84B484();
  v3 = sub_22D84B6C4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136446210;
    v6 = sub_22D821E84();
    sub_22D83157C(v6, v7, &v9);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v2, v3, "[%{public}s] Scene did invalidate.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v5, -1, -1);
    MEMORY[0x22E318218](v4, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_22D8343F4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_22D834420()
{
  uint64_t v0;

  sub_22D82FFC4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_22D834428(void *a1)
{
  uint64_t v1;

  sub_22D82FF44(a1, v1);
}

id sub_22D834430(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_2540C5F08 != -1)
    swift_once();
  v5 = sub_22D84B49C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2540C5EE8);
  v6 = v2;
  v7 = sub_22D84B484();
  v8 = sub_22D84B6C4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v17 = v10;
    *(_DWORD *)v9 = 136446210;
    v11 = sub_22D821E84();
    v16 = sub_22D83157C(v11, v12, &v17);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v7, v8, "[%{public}s] Scene did receive new client settings.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v10, -1, -1);
    MEMORY[0x22E318218](v9, -1, -1);

    if (!a2)
      return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
  }
  else
  {

    if (!a2)
      return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
  }
  v13 = objc_msgSend(a2, sel_animationFence, v16, v17);
  if (v13)
  {
    v14 = v13;
    objc_msgSend((id)objc_opt_self(), sel__synchronizeDrawingWithFence_, v13);

  }
  return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
}

void sub_22D83463C(void (*a1)(void), const char *a2)
{
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  a1();
  if (qword_2540C5F08 != -1)
    swift_once();
  v4 = sub_22D84B49C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2540C5EE8);
  v11 = v2;
  v5 = sub_22D84B484();
  v6 = sub_22D84B6C4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_22D821E84();
    sub_22D83157C(v9, v10, &v12);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v5, v6, a2, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v8, -1, -1);
    MEMORY[0x22E318218](v7, -1, -1);

  }
  else
  {

  }
}

unint64_t sub_22D8347FC()
{
  unint64_t result;

  result = qword_255D97398;
  if (!qword_255D97398)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityHostViewController.PresentationMode, &type metadata for ActivityHostViewController.PresentationMode);
    atomic_store(result, (unint64_t *)&qword_255D97398);
  }
  return result;
}

uint64_t sub_22D834840@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  result = MEMORY[0x22E31826C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_22D834894()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

id sub_22D8348E8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor, a2);
}

void sub_22D8348F4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81A6D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
}

_QWORD *sub_22D834910@<X0>(_QWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
  return result;
}

void sub_22D834928(unsigned int *a1)
{
  unsigned int v1;

  v1 = *a1;
  BSDispatchQueueAssertMain();
  sub_22D8248E4(v1, 0);
}

uint64_t sub_22D834958@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents, a2);
}

uint64_t sub_22D834964(char *a1)
{
  return sub_22D8215B4(*a1);
}

id sub_22D834988@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, a2);
}

void sub_22D834994(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_22D8336F4(v1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);

}

id sub_22D8349E0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, a2);
}

void sub_22D8349EC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_22D8336F4(v1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);

}

id sub_22D834A38@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics, a2);
}

uint64_t sub_22D834A48@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled, a2);
}

void *sub_22D834A54(unsigned __int8 *a1)
{
  return sub_22D821928(*a1);
}

uint64_t sub_22D834A78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D834AD0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22D834B20(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_22D834B6C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown, a2);
}

uint64_t sub_22D834B78(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_84Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown);
}

uint64_t sub_22D834B84@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated, a2);
}

uint64_t sub_22D834B90(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_84Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated);
}

uint64_t keypath_set_84Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_22D834BE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_22D834C3C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics, a2);
}

void sub_22D834C48(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D81A6D0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
}

uint64_t sub_22D834C64@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost, a2);
}

uint64_t keypath_get_69Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t method lookup function for ActivityHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of ActivityHostViewController.activitySceneDescriptor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActivityHostViewController.acActivityDescriptor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ActivityHostViewController.backgroundTintColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ActivityHostViewController.textColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ActivityHostViewController.resolvedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of ActivityHostViewController.idleTimerDisabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of ActivityHostViewController.audioCategoriesDisablingVolumeHUD.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of ActivityHostViewController.archivedActivityFamily.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of ActivityHostViewController.baseContentTouchedDown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of ActivityHostViewController.actionButtonInitiated.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of ActivityHostViewController.activityTouchRestrictedRects.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of ActivityHostViewController.fallbackMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of ActivityHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1264))();
}

uint64_t dispatch thunk of ActivityHostViewController.ensureContent(timeout:queue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x508))();
}

uint64_t dispatch thunk of ActivityHostViewController.backlightHostEnvironment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x510))();
}

uint64_t dispatch thunk of ActivityHostViewController.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x518))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x520))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x528))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x530))();
}

uint64_t dispatch thunk of ActivityHostViewController.cancelTouchesForCurrentEventInHostedContent()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x538))();
}

uint64_t dispatch thunk of ActivityHostViewController.requestLaunch()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x540))();
}

ValueMetadata *type metadata accessor for ActivityHostViewController.PresentationMode()
{
  return &type metadata for ActivityHostViewController.PresentationMode;
}

uint64_t sub_22D835064()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22D835088(uint64_t a1)
{
  uint64_t v1;

  sub_22D82A3F8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D835090()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_22D8350BC(void *a1, char a2)
{
  uint64_t v2;

  sub_22D82E8F0(a1, a2 & 1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_22D8350CC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22D8350F8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);
  void *v2;
  unsigned int v3;
  uint64_t v4;

  v1 = *(uint64_t (**)(uint64_t, _QWORD))(v0 + 16);
  v2 = *(void **)(v0 + 32);
  v3 = objc_msgSend(v2, sel_capture);
  v4 = 2;
  if (v3)
    v4 = (uint64_t)v2;
  return v1(v4, v3 ^ 1);
}

uint64_t sub_22D83514C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E318194](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E318188](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22D8351D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8351F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_22D83521C()
{
  unint64_t result;

  result = qword_2540C5EB0;
  if (!qword_2540C5EB0)
  {
    result = MEMORY[0x22E318194](&unk_22D84F394, &type metadata for ActivityHostViewController.SceneCaptureError);
    atomic_store(result, (unint64_t *)&qword_2540C5EB0);
  }
  return result;
}

uint64_t sub_22D835260()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_22D835294()
{
  uint64_t v0;

  sub_22D82ECAC(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(_QWORD))(v0 + 32));
}

id sub_22D8352A0(id result, char a2)
{
  if ((a2 & 1) == 0)
    return result;
  return result;
}

void sub_22D8352AC(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

uint64_t sub_22D8352B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22D8352DC()
{
  uint64_t v0;
  double v1;

  v1 = 0.0;
  if (*(_BYTE *)(v0 + 16))
    v1 = 1.0;
  return objc_msgSend(*(id *)(v0 + 24), sel_setAlpha_, v1);
}

uint64_t sub_22D835300()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22D835324()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(_BYTE *)(v0 + 24) & 1) == 0);
}

void sub_22D835340(void *a1, void *a2)
{
  uint64_t v2;

  sub_22D82E3A8(a1, a2, *(void **)(v2 + 32));
}

uint64_t sub_22D83534C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83535C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83536C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D835398(void *a1)
{
  uint64_t v1;

  sub_22D82D564(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_22D8353A0()
{
  return swift_deallocObject();
}

uint64_t sub_22D8353B0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D8353D4(void *a1)
{
  uint64_t v1;

  sub_22D82D834(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D8353DC()
{
  return swift_deallocObject();
}

uint64_t sub_22D8353EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22D835418(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22D82DA78(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD **)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_22D835428()
{
  return swift_deallocObject();
}

uint64_t sub_22D835440(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_22D835450()
{
  return swift_deallocObject();
}

id sub_22D835460(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_22D835470()
{
  return swift_deallocObject();
}

uint64_t sub_22D835484()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

unint64_t sub_22D8354AC()
{
  unint64_t result;

  result = qword_2540C5F20;
  if (!qword_2540C5F20)
  {
    result = MEMORY[0x22E318194](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2540C5F20);
  }
  return result;
}

void sub_22D8354F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_22D82D454(a1, a2, v2);
}

uint64_t sub_22D8354F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E318194](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_22D83553C(void *a1)
{
  uint64_t v1;

  sub_22D82E664(a1, *(void **)(v1 + 16), "[%{public}s] Sending touch delivery policy failed with error: %{public}s");
}

uint64_t sub_22D83555C()
{
  return swift_release();
}

uint64_t sub_22D835564()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D835598()
{
  uint64_t v0;

  return sub_22D829B18(*(void **)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void *))(v0 + 32));
}

void sub_22D8355A4(unsigned __int8 a1)
{
  uint64_t v1;

  sub_22D82D180(a1, *(char **)(v1 + 16));
}

void sub_22D8355AC()
{
  uint64_t v0;

  sub_22D825148(*(_BYTE *)(v0 + 24));
}

uint64_t sub_22D8355D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_22D835610()
{
  uint64_t v0;

  sub_22D82AA08(v0, (uint64_t (*)(void))sub_22D838204, "[%{public}s] ClientSetting[backgroundTintColor] did change to: %{public}@", &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);
}

uint64_t sub_22D83564C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22D83E118(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

void sub_22D835654()
{
  uint64_t v0;

  sub_22D82AA08(v0, (uint64_t (*)(void))sub_22D838210, "[%{public}s] ClientSetting[textColor] did change to: %{public}@", &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);
}

void sub_22D835690()
{
  uint64_t v0;

  sub_22D82ADEC(v0);
}

void sub_22D83569C()
{
  uint64_t v0;

  sub_22D82B4BC(v0);
}

void sub_22D8356A8()
{
  uint64_t v0;

  sub_22D82BA14(v0);
}

void sub_22D8356B4()
{
  uint64_t v0;

  sub_22D82BDD0(v0);
}

void sub_22D8356C0(uint64_t a1)
{
  uint64_t v1;

  sub_22D82C160(a1, v1);
}

void sub_22D8356C8()
{
  uint64_t v0;

  sub_22D82C4EC(v0);
}

void sub_22D8356D4()
{
  uint64_t v0;

  sub_22D82C90C(v0);
}

void sub_22D8356E0()
{
  uint64_t v0;

  sub_22D82CD90(v0);
}

uint64_t objectdestroy_173Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t getEnumTagSinglePayload for ActivityHostViewController.SceneCaptureError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityHostViewController.SceneCaptureError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22D8357F4 + 4 * byte_22D84F155[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22D835828 + 4 * byte_22D84F150[v4]))();
}

uint64_t sub_22D835828(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D835830(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D835838);
  return result;
}

uint64_t sub_22D835844(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D83584CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22D835850(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D835858(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22D835864(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivityHostViewController.SceneCaptureError()
{
  return &type metadata for ActivityHostViewController.SceneCaptureError;
}

unint64_t sub_22D835884()
{
  unint64_t result;

  result = qword_255D97478;
  if (!qword_255D97478)
  {
    result = MEMORY[0x22E318194](&unk_22D84F36C, &type metadata for ActivityHostViewController.SceneCaptureError);
    atomic_store(result, (unint64_t *)&qword_255D97478);
  }
  return result;
}

unint64_t static ActivityUIServicesError.errorDomain.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t ActivityUIServicesError.errorCode.getter()
{
  return 1001;
}

uint64_t _s18ActivityUIServices0aB5ErrorO13failureReasonSSSgvg_0()
{
  _QWORD v1[2];

  sub_22D84B850();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Missing data: ");
  sub_22D84B5EC();
  return v1[0];
}

uint64_t sub_22D835AA0()
{
  return 1001;
}

uint64_t sub_22D835AAC()
{
  sub_22D835B0C();
  return sub_22D84B9DC();
}

uint64_t sub_22D835AD4()
{
  sub_22D835B0C();
  return sub_22D84B9D0();
}

ValueMetadata *type metadata accessor for ActivityUIServicesError()
{
  return &type metadata for ActivityUIServicesError;
}

unint64_t sub_22D835B0C()
{
  unint64_t result;

  result = qword_255D974E0;
  if (!qword_255D974E0)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityUIServicesError, &type metadata for ActivityUIServicesError);
    atomic_store(result, (unint64_t *)&qword_255D974E0);
  }
  return result;
}

id ActivityBannerHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  objc_class *v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  void (*v23)(char *, uint64_t);
  id v24;
  _QWORD v26[2];
  objc_super v27;

  v5 = v4;
  v10 = sub_22D84B340();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = objc_allocWithZone(v5);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, (uint64_t)a1, v10);
  v15 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v16 = (char *)objc_allocWithZone(v15);
  v17 = sub_22D84B334();
  v18 = (uint64_t *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v18 = v17;
  v18[1] = v19;
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 1;
  sub_22D816680();
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v14(&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v13, v10);
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v20 = &v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v20 = a3;
  *((_QWORD *)v20 + 1) = a4;
  v21 = a2;

  v27.receiver = v16;
  v27.super_class = v15;
  v22 = objc_msgSendSuper2(&v27, sel_init);
  v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v13, v10);
  v24 = ActivityHostViewController.init(activitySceneDescriptor:)(v22);

  v23(a1, v10);
  return v24;
}

id ActivityBannerHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  objc_class *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  void (*v21)(char *, uint64_t);
  id v22;
  uint64_t v24;
  objc_super v25;

  v8 = sub_22D84B340();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, (uint64_t)a1, v8);
  v13 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = sub_22D84B334();
  v16 = (uint64_t *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v16 = v15;
  v16[1] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 1;
  sub_22D816680();
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v12(&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v11, v8);
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v18 = &v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  v19 = a2;

  v25.receiver = v14;
  v25.super_class = v13;
  v20 = objc_msgSendSuper2(&v25, sel_init);
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v22 = ActivityHostViewController.init(activitySceneDescriptor:)(v20);

  v21(a1, v8);
  return v22;
}

id sub_22D835FD8()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityBannerSceneSpecification()), sel_init);
}

unint64_t sub_22D835FFC()
{
  return 0xD000000000000010;
}

void ActivityBannerHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivityBannerHostViewController.init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityBannerHostViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityBannerHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityBannerHostViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActivityBannerHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityBannerHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1496))();
}

unint64_t ActivityState.init(rawValue:)(unint64_t a1)
{
  return sub_22D8361AC(a1);
}

unint64_t sub_22D83617C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_22D8361AC(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_22D8361AC(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_22D8361C0()
{
  unint64_t result;

  result = qword_255D974E8;
  if (!qword_255D974E8)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityState, &type metadata for ActivityState);
    atomic_store(result, (unint64_t *)&qword_255D974E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityState()
{
  return &type metadata for ActivityState;
}

double sub_22D836258()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D8362EC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D83633C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_22D8363C4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D836458(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D8364A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_22D836530()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D8365C4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D836614())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_22D83669C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D836730(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D836780())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D8367C4(char a1)
{
  return qword_22D84F6B0[a1];
}

id ActivityEdgeInsets.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ActivityEdgeInsets.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ActivityEdgeInsets()
{
  return objc_opt_self();
}

char *ActivityEdgeInsets.__allocating_init(top:leading:bottom:trailing:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;
  char *v9;
  double *v10;
  double *v11;
  double *v12;
  double *v13;

  v9 = (char *)objc_msgSend(objc_allocWithZone(v4), sel_init);
  v10 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  *v10 = a1;
  v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *v11 = a2;
  v12 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *v12 = a3;
  v13 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  swift_beginAccess();
  *v13 = a4;
  return v9;
}

char *ActivityEdgeInsets.init(top:leading:bottom:trailing:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  char *v9;
  double *v10;
  double *v11;
  double *v12;
  double *v13;

  v9 = (char *)objc_msgSend(v4, sel_init);
  v10 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  *v10 = a1;
  v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *v11 = a2;
  v12 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *v12 = a3;
  v13 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  swift_beginAccess();
  *v13 = a4;
  return v9;
}

uint64_t sub_22D836BC8()
{
  uint64_t v0;
  double *v1;
  double v2;
  double v3;
  double *v4;
  double v5;
  double *v6;
  double v7;
  double *v8;
  uint64_t result;
  double v10;
  double v11;
  double v12;

  v1 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  v2 = *v1;
  v3 = *v1 * 53.0;
  v4 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  if (*v4 <= 1.0)
    v5 = *v4;
  else
    v5 = 1.0;
  v6 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  if (*v6 <= 1.0)
    v7 = *v6;
  else
    v7 = 1.0;
  v8 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  result = swift_beginAccess();
  v10 = *v8;
  if (*v8 > 1.0)
    v10 = 1.0;
  if (v2 <= 1.0)
    v11 = v3;
  else
    v11 = 53.0;
  v12 = v11 * v5 * v7 * v10;
  if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v12 < 9.22337204e18)
    return (uint64_t)v12;
LABEL_18:
  __break(1u);
  return result;
}

BOOL sub_22D836D14(uint64_t a1)
{
  uint64_t v1;
  double *v2;
  double v3;
  double *v4;
  double *v5;
  double v6;
  double *v7;
  double *v8;
  double v9;
  double *v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  char *v16;
  _BYTE v17[24];
  uint64_t v18;

  sub_22D81410C(a1, (uint64_t)v17);
  if (v18)
  {
    type metadata accessor for ActivityEdgeInsets();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v2 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
      swift_beginAccess();
      v3 = *v2;
      v4 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
      swift_beginAccess();
      if (v3 == *v4)
      {
        v5 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
        swift_beginAccess();
        v6 = *v5;
        v7 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
        swift_beginAccess();
        if (v6 == *v7)
        {
          v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
          swift_beginAccess();
          v9 = *v8;
          v10 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
          swift_beginAccess();
          if (v9 == *v10)
          {
            v11 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
            swift_beginAccess();
            v12 = *v11;
            v13 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
            swift_beginAccess();
            v14 = *v13;

            return v12 == v14;
          }
        }
      }

    }
  }
  else
  {
    sub_22D814194((uint64_t)v17);
  }
  return 0;
}

uint64_t sub_22D836F94()
{
  sub_22D84B850();
  sub_22D84B5EC();
  swift_beginAccess();
  sub_22D84B67C();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  swift_beginAccess();
  sub_22D84B67C();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  swift_beginAccess();
  sub_22D84B67C();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  swift_beginAccess();
  sub_22D84B67C();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  return 0;
}

uint64_t sub_22D837150@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t result;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  v4 = *v3;
  v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  v6 = *v5;
  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  v8 = *v7;
  v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  v10 = *v9;
  v11 = (objc_class *)type metadata accessor for ActivityEdgeInsets();
  v12 = (char *)objc_msgSend(objc_allocWithZone(v11), sel_init);
  v13 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  *(_QWORD *)v13 = v4;
  v14 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *(_QWORD *)v14 = v6;
  v15 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *(_QWORD *)v15 = v8;
  v16 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  result = swift_beginAccess();
  *(_QWORD *)v16 = v10;
  a1[3] = v11;
  *a1 = v12;
  return result;
}

uint64_t static ActivityEdgeInsets.supportsBSXPCSecureCoding.getter()
{
  return 1;
}

id ActivityEdgeInsets.__allocating_init(bsxpcCoder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D8376F8(a1);
  swift_unknownObjectRelease();
  return v4;
}

id ActivityEdgeInsets.init(bsxpcCoder:)(void *a1)
{
  id v1;

  v1 = sub_22D8376F8(a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t static ActivityEdgeInsets.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D83744C(void *a1)
{
  uint64_t v1;
  double *v3;
  double v4;
  void *v5;
  double *v6;
  double v7;
  void *v8;
  double *v9;
  double v10;
  void *v11;
  double *v12;
  double v13;
  void *v14;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v5, v4);

  v6 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  v7 = *v6;
  v8 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v8, v7);

  v9 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  v10 = *v9;
  v11 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v11, v10);

  v12 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  v13 = *v12;
  v14 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v14, v13);

}

id ActivityEdgeInsets.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D8376F8(a1);

  return v4;
}

id ActivityEdgeInsets.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D8376F8(a1);

  return v2;
}

id ActivityEdgeInsets.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D8376F8(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v3 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top] = 0;
  v4 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading] = 0;
  v5 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom] = 0;
  v6 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing] = 0;
  v7 = v1;
  v8 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v8);
  v10 = v9;

  swift_beginAccess();
  *(_QWORD *)v3 = v10;
  v11 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v11);
  v13 = v12;

  swift_beginAccess();
  *(_QWORD *)v4 = v13;
  v14 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v14);
  v16 = v15;

  swift_beginAccess();
  *(_QWORD *)v5 = v16;
  v17 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v17);
  v19 = v18;

  swift_beginAccess();
  *(_QWORD *)v6 = v19;

  v21.receiver = v7;
  v21.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v21, sel_init);
}

double sub_22D8378C8@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top, a2);
}

uint64_t sub_22D8378D4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
}

double sub_22D8378E0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading, a2);
}

uint64_t sub_22D8378EC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
}

double sub_22D8378F8@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom, a2);
}

uint64_t sub_22D837904(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
}

double sub_22D837910@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing, a2);
}

double keypath_getTm_0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_22D837968(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t method lookup function for ActivityEdgeInsets()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.encode(withBSXPCCoder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.__allocating_init(bsxpcCoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_22D837B84(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aScene_5[8 * a1] == *(_QWORD *)&aScene_5[8 * a2] && qword_22D84F820[a1] == qword_22D84F820[a2])
    v3 = 1;
  else
    v3 = sub_22D84B994();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22D837C08()
{
  sub_22D84BA30();
  sub_22D84B5E0();
  swift_bridgeObjectRelease();
  return sub_22D84BA78();
}

uint64_t sub_22D837C70()
{
  sub_22D84B5E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D837CB0()
{
  sub_22D84BA30();
  sub_22D84B5E0();
  swift_bridgeObjectRelease();
  return sub_22D84BA78();
}

uint64_t sub_22D837D14(uint64_t a1)
{
  return sub_22D837EA4(a1, qword_255D96388);
}

uint64_t static Logger.scene.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D837D94(&qword_255D963A8, (uint64_t)qword_255D96388, a1);
}

uint64_t sub_22D837D4C(uint64_t a1)
{
  return sub_22D837EA4(a1, qword_255D96370);
}

uint64_t static Logger.processResource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D837D94(&qword_255D962B0, (uint64_t)qword_255D96370, a1);
}

uint64_t sub_22D837D94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_22D84B49C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_22D837DFC(uint64_t a1)
{
  return sub_22D837EA4(a1, qword_2540C5EE8);
}

uint64_t static Logger.viewController.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D837D94(&qword_2540C5F08, (uint64_t)qword_2540C5EE8, a1);
}

uint64_t sub_22D837E44(uint64_t a1)
{
  return sub_22D837EA4(a1, qword_2540C5EC8);
}

uint64_t static Logger.backOffTimer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D837D94(&qword_2540C5EE0, (uint64_t)qword_2540C5EC8, a1);
}

uint64_t sub_22D837E88(uint64_t a1)
{
  return sub_22D837EA4(a1, qword_255D97570);
}

uint64_t sub_22D837EA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_22D84B49C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22D84B490();
}

uint64_t static Logger.alert.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D837D94(&qword_255D96C28, (uint64_t)qword_255D97570, a1);
}

unint64_t static ActivityUIServicesCategory.subsystem.getter()
{
  return 0xD00000000000001CLL;
}

ActivityUIServices::ActivityUIServicesCategory_optional __swiftcall ActivityUIServicesCategory.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ActivityUIServices::ActivityUIServicesCategory_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22D84B91C();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ActivityUIServicesCategory.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aScene_5[8 * *v0];
}

uint64_t sub_22D837FCC(char *a1, char *a2)
{
  return sub_22D837B84(*a1, *a2);
}

unint64_t sub_22D837FDC()
{
  unint64_t result;

  result = qword_255D97588;
  if (!qword_255D97588)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityUIServicesCategory, &type metadata for ActivityUIServicesCategory);
    atomic_store(result, (unint64_t *)&qword_255D97588);
  }
  return result;
}

uint64_t sub_22D838020()
{
  return sub_22D837C08();
}

uint64_t sub_22D838028()
{
  return sub_22D837C70();
}

uint64_t sub_22D838030()
{
  return sub_22D837CB0();
}

ActivityUIServices::ActivityUIServicesCategory_optional sub_22D838038(Swift::String *a1)
{
  return ActivityUIServicesCategory.init(rawValue:)(*a1);
}

uint64_t sub_22D838044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ActivityUIServicesCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityUIServicesCategory(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityUIServicesCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_22D838144 + 4 * byte_22D84F6F5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22D838178 + 4 * byte_22D84F6F0[v4]))();
}

uint64_t sub_22D838178(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D838180(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D838188);
  return result;
}

uint64_t sub_22D838194(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D83819CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22D8381A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8381A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityUIServicesCategory()
{
  return &type metadata for ActivityUIServicesCategory;
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

uint64_t sub_22D838204(void *a1)
{
  return sub_22D83821C(a1, &qword_255D970F8);
}

uint64_t sub_22D838210(void *a1)
{
  return sub_22D83821C(a1, &qword_255D97110);
}

uint64_t sub_22D83821C(void *a1, _QWORD *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  swift_beginAccess();
  if (objc_msgSend(a1, sel_objectForSetting_, *a2))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_22D81494C((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_22D814194((uint64_t)v9);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  sub_22D819F60(0, &qword_2540C5FA8);
  sub_22D819F60(0, (unint64_t *)&unk_2540C5F60);
  v4 = (void *)sub_22D84B6E8();
  sub_22D81CE80(v6, v7);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (!result)
  {

    return 0;
  }
  return result;
}

uint64_t sub_22D838390(void *a1)
{
  __int128 v3;
  _OWORD v4[2];

  swift_beginAccess();
  if (objc_msgSend(a1, sel_objectForSetting_, qword_255D971D0))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v3, v4);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if (swift_dynamicCast())
    return v3;
  else
    return 2;
}

uint64_t sub_22D838454()
{
  uint64_t result;

  result = sub_22D84B5BC();
  qword_2540C62D0 = result;
  return result;
}

id static UISceneSessionRole.activityListItem.getter()
{
  return sub_22D8385E4(qword_2540C62E0, (id *)&qword_2540C62D0);
}

uint64_t sub_22D8384A4()
{
  uint64_t result;

  result = sub_22D84B5BC();
  qword_255D96738 = result;
  return result;
}

id static UISceneSessionRole.activityBanner.getter()
{
  return sub_22D8385E4(&qword_255D966F8, (id *)&qword_255D96738);
}

uint64_t sub_22D8384F4()
{
  uint64_t result;

  result = sub_22D84B5BC();
  qword_2540C6300 = result;
  return result;
}

id static UISceneSessionRole.activitySystemAperture.getter()
{
  return sub_22D8385E4(&qword_2540C6310, (id *)&qword_2540C6300);
}

uint64_t sub_22D838544()
{
  uint64_t result;

  result = sub_22D84B5BC();
  qword_2540C6198 = result;
  return result;
}

id static UISceneSessionRole.activityAmbient.getter()
{
  return sub_22D8385E4(&qword_2540C61A8, (id *)&qword_2540C6198);
}

uint64_t sub_22D838594()
{
  uint64_t result;

  result = sub_22D84B5BC();
  qword_2540C61B0 = result;
  return result;
}

id static UISceneSessionRole.activityAmbientCompact.getter()
{
  return sub_22D8385E4(&qword_2540C61C0, (id *)&qword_2540C61B0);
}

id sub_22D8385E4(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t sub_22D83861C()
{
  uint64_t *v0;
  id v1;
  id v2;
  uint64_t result;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16[3];

  v1 = objc_msgSend(v0, sel__FBSScene);
  v2 = objc_msgSend(v1, sel_settings);

  if (v2)
  {
    type metadata accessor for ActivitySceneSettings();
    result = swift_dynamicCastClass();
    if (result)
      return result;
    v4 = v2;
    sub_22D84B850();
    swift_bridgeObjectRelease();
    v16[0] = 0xD000000000000020;
    v16[1] = 0x800000022D853380;
    swift_getObjectType();
    sub_22D84BAD8();
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B5EC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D975F0);
    sub_22D84BAD8();
    v0 = v16;
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D84B8C8();
    __break(1u);
  }
  if (qword_255D963A8 != -1)
    swift_once();
  v5 = sub_22D84B49C();
  __swift_project_value_buffer(v5, (uint64_t)qword_255D96388);
  v6 = v0;
  v7 = sub_22D84B484();
  v8 = sub_22D84B6D0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v16[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v6, sel__FBSScene);
    v12 = objc_msgSend(v11, sel_identifier);

    v13 = sub_22D84B5C8();
    v15 = v14;

    v16[2] = sub_22D83157C(v13, v15, v16);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v7, v8, "[%s] Unexpectedly encountered nil while accessing scene settings.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v10, -1, -1);
    MEMORY[0x22E318218](v9, -1, -1);

  }
  else
  {

  }
  return 0;
}

char *sub_22D83893C(void *a1, void *a2)
{
  _BYTE *v2;
  uint64_t v5;
  id v6;
  _BYTE *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v2[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate] = 0;
  v5 = OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer;
  v6 = objc_allocWithZone((Class)type metadata accessor for SettingsDiffer());
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled] = 0;
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily] = 2;
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown] = 2;

  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ActivityScene();
  v8 = (char *)objc_msgSendSuper2(&v16, sel_initWithSession_connectionOptions_, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C6320);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22D84F140;
  v10 = *(void **)&v8[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer];
  *(_QWORD *)(v9 + 32) = v10;
  sub_22D84B658();
  v11 = v8;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6318);
  v13 = (void *)sub_22D84B634();
  swift_bridgeObjectRelease();
  sub_22D819F60(0, (unint64_t *)&qword_2540C6350);
  v14 = (void *)sub_22D84B784();
  objc_msgSend(v11, sel__registerSettingsDiffActionArray_forKey_, v13, v14);

  return v11;
}

void sub_22D838B78(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  id v8;

  v5 = *a1;
  BSDispatchQueueAssertMain();
  v6 = sub_22D83861C();
  if (v6)
  {
    v8 = (id)v6;
    sub_22D840A94(*(_QWORD *)(*MEMORY[0x24BEE46A8] + v5 + 8), a2, a3);

  }
  else
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, 1, 1, AssociatedTypeWitness);
  }
}

uint64_t sub_22D838C44(uint64_t *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[8];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v3 = v2;
  v6 = *a1;
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255D962C0);
  v44 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + v6 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_22D84B790();
  v42 = v7;
  v38[7] = sub_22D83B5C8();
  v9 = sub_22D84B4C0();
  v41 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v38 - v10;
  v12 = sub_22D84B4FC();
  v13 = MEMORY[0x22E318194](MEMORY[0x24BDB96C0], v9);
  v14 = MEMORY[0x22E318194](MEMORY[0x24BDB9D08], v12);
  v45 = v9;
  v46 = v12;
  v38[4] = v13;
  v47 = v13;
  v48 = v14;
  v38[2] = v14;
  v15 = sub_22D84B4CC();
  v16 = MEMORY[0x22E318194](MEMORY[0x24BDB99F0], v15);
  v38[3] = v15;
  v38[1] = v16;
  v17 = sub_22D84B4B4();
  v38[5] = MEMORY[0x22E318194](MEMORY[0x24BDB9510], v17);
  v38[6] = v17;
  v43 = AssociatedTypeWitness;
  v18 = sub_22D84B4A8();
  v39 = *(_QWORD *)(v18 - 8);
  v40 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v38 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v38 - v22;
  BSDispatchQueueAssertMain();
  result = sub_22D83861C();
  if (result)
  {
    v25 = (void *)result;
    sub_22D840BB8(a1, a2, (uint64_t)v23);

    v38[0] = sub_22D84B508();
    v26 = *(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer];
    v27 = sub_22D83DD88(a1, a2);

    v45 = v27;
    v28 = (_QWORD *)swift_allocObject();
    v28[2] = a2;
    v28[3] = v3;
    v28[4] = a1;
    v29 = (_QWORD *)swift_allocObject();
    v30 = v3;
    v31 = v44;
    v29[2] = v44;
    v29[3] = a2;
    v29[4] = sub_22D83B640;
    v29[5] = v28;
    v32 = v30;
    swift_retain();
    sub_22D84B538();
    swift_release();
    swift_release();
    v33 = sub_22D84B544();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v9);
    v45 = v33;
    v34 = sub_22D84B514();
    swift_release();
    v45 = v34;
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = v31;
    *(_QWORD *)(v35 + 24) = a2;
    sub_22D84B52C();
    swift_release();
    swift_release();
    v36 = v40;
    MEMORY[0x22E318194](MEMORY[0x24BDB94C8], v40);
    v37 = sub_22D84B520();
    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v21, v36);
    return v37;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_22D839034(_QWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  id v7;

  v6 = sub_22D83861C();
  if (v6)
  {
    v7 = (id)v6;
    sub_22D840BB8(a1, a2, a3);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22D839098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  swift_getAssociatedTypeWitness();
  v4 = sub_22D84B790();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_22D8390FC(void (*a1)(void *, _UNKNOWN **))
{
  void *v1;
  void *v2;
  uint64_t result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  _QWORD v11[6];

  v2 = v1;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  a1(v1, &protocol witness table for ActivityScene);
  v5 = objc_msgSend(v1, sel__FBSScene);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = v2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_22D83B6A8;
  *(_QWORD *)(v7 + 24) = v6;
  v11[4] = sub_22D833588;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_22D839404;
  v11[3] = &block_descriptor_2;
  v8 = _Block_copy(v11);
  v9 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_22D839274(uint64_t (*a1)(_BYTE *, _UNKNOWN **))
{
  _BYTE *v1;
  uint64_t result;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _BYTE *v10;
  char isEscapingClosureAtFileLocation;
  _QWORD v12[6];

  result = BSDispatchQueueAssertMain();
  if ((v1[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate] & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  v4 = (void *)a1(v1, &protocol witness table for ActivityScene);
  v5 = objc_msgSend(v1, sel__FBSScene);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_22D83C408;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_22D8358C8;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_22D839404;
  v12[3] = &block_descriptor_23;
  v8 = _Block_copy(v12);
  v9 = v4;
  v10 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
LABEL_5:
    __break(1u);
  return result;
}

id sub_22D839404(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  void *v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = (void *)v2();

  return v4;
}

uint64_t sub_22D839440()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BF64;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_136;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_22D8395A8(void *a1, uint64_t a2)
{
  _BYTE *v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v3 = (_BYTE *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  LOBYTE(v3) = *v3;
  v4 = objc_msgSend(a1, sel_otherSettings);
  LOBYTE(v7) = (_BYTE)v3;
  v5 = sub_22D84B9AC();
  swift_beginAccess();
  objc_msgSend(v4, sel_setObject_forSetting_, v5, qword_255D97128, v7);

  return swift_unknownObjectRelease();
}

uint64_t sub_22D83966C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D8396B0(char a1)
{
  return sub_22D83A888(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, (uint64_t (*)(uint64_t))sub_22D839440);
}

uint64_t (*sub_22D8396C4(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83970C;
}

uint64_t sub_22D83970C(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D839440);
}

uint64_t sub_22D839718()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BF1C;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_125;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

void *sub_22D839880()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D8398CC(void *a1)
{
  sub_22D83A0C4(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, (void (*)(void))sub_22D839718);
}

uint64_t (*sub_22D8398E0(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D839928;
}

uint64_t sub_22D839928(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D839718);
}

uint64_t sub_22D839934()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BED4;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_114;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

void *sub_22D839A9C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D839AE8(void *a1)
{
  sub_22D83A0C4(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, (void (*)(void))sub_22D839934);
}

uint64_t (*sub_22D839AFC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D839B44;
}

uint64_t sub_22D839B44(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D839934);
}

uint64_t sub_22D839B50()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BE8C;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_103;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_22D839CB8(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(void *))
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a2 + *a3);
  swift_beginAccess();
  v6 = *v5;
  v7 = v6;
  a4(v6);

}

void *sub_22D839D20()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D839D6C(void *a1)
{
  sub_22D83A0C4(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, (void (*)(void))sub_22D839B50);
}

uint64_t (*sub_22D839D80(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D839DC8;
}

uint64_t sub_22D839DC8(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D839B50);
}

void sub_22D839DD4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, void (*a6)(void))
{
  void *v7;
  void **v8;
  void *v9;
  id v10;

  v7 = *a1;
  v8 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v9 = *v8;
  *v8 = v7;
  v10 = v7;

  a6();
}

uint64_t sub_22D839E4C()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BE44;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_92;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_22D839FB4(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  id *v6;
  id v7;
  id v8;

  v6 = (id *)(a2 + *a3);
  swift_beginAccess();
  v7 = *v6;
  v8 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  objc_msgSend(v8, sel_setObject_forSetting_, v7, *a4);

}

void *sub_22D83A064()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D83A0B0(void *a1)
{
  sub_22D83A0C4(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, (void (*)(void))sub_22D839E4C);
}

void sub_22D83A0C4(void *a1, _QWORD *a2, void (*a3)(void))
{
  uint64_t v3;
  void **v6;
  void *v7;
  id v8;

  v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v8 = a1;

  a3();
}

uint64_t (*sub_22D83A134(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83A17C;
}

uint64_t sub_22D83A17C(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D839E4C);
}

uint64_t sub_22D83A188(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_22D83A1F4();
}

uint64_t sub_22D83A1F4()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BE1C;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_81;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_22D83A35C(void *a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v3 = (uint64_t *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  v4 = *v3;
  swift_bridgeObjectRetain_n();
  v5 = objc_msgSend(a1, sel_otherSettings);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6330);
  v6 = sub_22D84B9AC();
  swift_beginAccess();
  objc_msgSend(v5, sel_setObject_forSetting_, v6, qword_255D97170, v4);
  swift_bridgeObjectRelease_n();

  return swift_unknownObjectRelease();
}

uint64_t sub_22D83A448()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D83A490(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  return sub_22D83A1F4();
}

uint64_t (*sub_22D83A4EC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83A534;
}

uint64_t sub_22D83A534(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D83A1F4);
}

uint64_t sub_22D83A540()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BDF4;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_70;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_22D83A6A8(void *a1, uint64_t a2)
{
  id v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t result;
  int v8;
  id v9;
  __int128 v10;
  _OWORD v11[2];

  v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_255D97188))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v10, v11);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v5 = v10;
  }
  else
  {
    v5 = 2;
    LOBYTE(v10) = 2;
  }

  v6 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled);
  result = swift_beginAccess();
  v8 = *v6;
  if (v5 == 2 || v8 != (v5 & 1))
  {
    v9 = objc_msgSend(a1, sel_otherSettings, (_QWORD)v10);
    LOBYTE(v10) = v8;
    objc_msgSend(v9, sel_setObject_forSetting_, sub_22D84B9AC(), qword_255D97188);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22D83A830()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D83A874(char a1)
{
  return sub_22D83A888(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, (uint64_t (*)(uint64_t))sub_22D83A540);
}

uint64_t sub_22D83A888(char a1, _QWORD *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  _BYTE *v6;
  uint64_t v7;

  v6 = (_BYTE *)(v3 + *a2);
  v7 = swift_beginAccess();
  *v6 = a1;
  return a3(v7);
}

uint64_t (*sub_22D83A8DC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83A924;
}

uint64_t sub_22D83A924(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D83A540);
}

uint64_t sub_22D83A930()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BDCC;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83C460;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D8358C8;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_59;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_22D83AA98(void *a1, uint64_t a2)
{
  id v4;
  int v5;
  int v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t result;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];

  v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_255D971A0))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v14, v15);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  v5 = swift_dynamicCast();
  v6 = v5;
  if (v5)
  {
    v7 = v14;
  }
  else
  {
    v7 = 0;
    *(_QWORD *)&v14 = 0;
  }
  BYTE8(v14) = v5 ^ 1;

  v8 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  result = swift_beginAccess();
  v10 = *v8;
  if (v7 < 2)
    v11 = v6;
  else
    v11 = 0;
  if (v11 == 1)
  {
    if (v10 != 2 && ((v10 & 1) == 0) != (v7 == 1))
      return result;
  }
  else if (v10 == 2)
  {
    return result;
  }
  v12 = objc_msgSend(a1, sel_otherSettings, (_QWORD)v14);
  if (v10 == 2)
  {
    v13 = 0;
  }
  else
  {
    *(_QWORD *)&v14 = v10 & 1;
    v13 = sub_22D84B9AC();
  }
  objc_msgSend(v12, sel_setObject_forSetting_, v13, qword_255D971A0);

  return swift_unknownObjectRelease();
}

uint64_t sub_22D83AC68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_22D83ACB4(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  swift_beginAccess();
  *v3 = v2;
  return sub_22D83A930();
}

uint64_t (*sub_22D83AD08(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83AD50;
}

uint64_t sub_22D83AD50(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D83A930);
}

uint64_t sub_22D83AD5C()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[6];

  BSDispatchQueueAssertMain();
  v7 = v0;
  result = BSDispatchQueueAssertMain();
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    v2 = objc_msgSend(v0, sel__FBSScene);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_22D83BD9C;
    *(_QWORD *)(v3 + 24) = &v6;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_22D83BDB4;
    *(_QWORD *)(v4 + 24) = v3;
    aBlock[4] = sub_22D833588;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22D82DA44;
    aBlock[3] = &block_descriptor_48;
    v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_22D83AEC4(void *a1, uint64_t a2)
{
  id v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t result;
  int v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  _OWORD v12[2];

  v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_255D971B8))
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v11, v12);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v5 = v11;
  }
  else
  {
    v5 = 2;
    LOBYTE(v11) = 2;
  }

  v6 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  result = swift_beginAccess();
  v8 = *v6;
  if (v5 == 2)
  {
    if (v8 == 2)
      return result;
  }
  else if (v8 != 2 && ((((v8 & 1) == 0) ^ v5) & 1) != 0)
  {
    return result;
  }
  v9 = objc_msgSend(a1, sel_otherSettings, (_QWORD)v11);
  if (v8 == 2)
  {
    v10 = 0;
  }
  else
  {
    LOBYTE(v11) = v8 & 1;
    v10 = sub_22D84B9AC();
  }
  objc_msgSend(v9, sel_setObject_forSetting_, v10, qword_255D971B8);

  return swift_unknownObjectRelease();
}

uint64_t sub_22D83B078()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22D83B0BC(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  swift_beginAccess();
  *v3 = a1;
  return sub_22D83AD5C();
}

uint64_t (*sub_22D83B110(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22D83B158;
}

uint64_t sub_22D83B158(uint64_t a1, char a2)
{
  return sub_22D83B164(a1, a2, (uint64_t (*)(uint64_t))sub_22D83AD5C);
}

uint64_t sub_22D83B164(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return a3(result);
  return result;
}

uint64_t sub_22D83B1A0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v7;
  _OWORD v8[2];

  v1 = objc_msgSend(v0, sel__FBSScene);
  v2 = objc_msgSend(v1, sel_clientSettings);

  type metadata accessor for ActivitySceneClientSettings();
  v3 = (void *)swift_dynamicCastClass();
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v4, sel_objectForSetting_, qword_255D971D0))
    {
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      sub_22D81CE70(&v7, v8);
    }
    else
    {
      memset(v8, 0, sizeof(v8));
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
    if (swift_dynamicCast())
    {
      v5 = v7;
    }
    else
    {
      v5 = 2;
      LOBYTE(v7) = 2;
    }

  }
  else
  {

    return 0;
  }
  return v5;
}

void sub_22D83B2EC(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  type metadata accessor for ActivityMutableSceneClientSettings();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    v6 = a1;
    a2(v5);

  }
}

id ActivityScene.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityScene();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22D83B40C(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  *v3 = a1;
  return sub_22D839440();
}

void sub_22D83B460(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22D83B4B0(a1, a2, a3, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, (void (*)(void))sub_22D839718);
}

void sub_22D83B474(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22D83B4B0(a1, a2, a3, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, (void (*)(void))sub_22D839934);
}

void sub_22D83B488(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22D83B4B0(a1, a2, a3, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, (void (*)(void))sub_22D839B50);
}

void sub_22D83B49C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22D83B4B0(a1, a2, a3, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, (void (*)(void))sub_22D839E4C);
}

void sub_22D83B4B0(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(void))
{
  uint64_t v5;
  void **v8;
  void *v9;
  id v10;

  v8 = (void **)(v5 + *a4);
  swift_beginAccess();
  v9 = *v8;
  *v8 = a1;
  v10 = a1;

  a5();
}

uint64_t sub_22D83B520()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel__FBSScene);
  v2 = objc_msgSend(v1, sel_clientSettings);

  type metadata accessor for ActivitySceneClientSettings();
  v3 = (void *)swift_dynamicCastClass();
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_otherSettings);
    v5 = sub_22D838390(v4);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

unint64_t sub_22D83B5C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D963B0;
  if (!qword_255D963B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255D962C0);
    result = MEMORY[0x22E318194](MEMORY[0x24BDB9CB0], v1);
    atomic_store(result, (unint64_t *)&qword_255D963B0);
  }
  return result;
}

uint64_t sub_22D83B614()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_22D83B640(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22D839034(*(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_22D83B64C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D83B670()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_22D83B690()
{
  return swift_deallocObject();
}

uint64_t sub_22D83B6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D839098(a1, a2);
}

void *sub_22D83B6A8(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = (void *)sub_22D83BF8C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  v3 = v2;
  return v2;
}

uint64_t sub_22D83B6D4()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_22D83B6FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22D83B728()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for ActivityScene()
{
  return objc_opt_self();
}

uint64_t sub_22D83B758@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, a2);
}

uint64_t sub_22D83B764(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, (uint64_t (*)(uint64_t))sub_22D839440);
}

id sub_22D83B778@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, a2);
}

void sub_22D83B784(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D839DD4(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, (void (*)(void))sub_22D839718);
}

id sub_22D83B7A8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, a2);
}

void sub_22D83B7B4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D839DD4(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, (void (*)(void))sub_22D839934);
}

id sub_22D83B7D8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, a2);
}

void sub_22D83B7E4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D839DD4(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, (void (*)(void))sub_22D839B50);
}

id sub_22D83B808@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, a2);
}

void sub_22D83B814(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_22D839DD4(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, (void (*)(void))sub_22D839E4C);
}

uint64_t sub_22D83B838@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D83B890@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, a2);
}

uint64_t sub_22D83B89C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, (uint64_t (*)(uint64_t))sub_22D83A540);
}

uint64_t keypath_setTm_0(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(uint64_t))
{
  char v7;
  _BYTE *v8;
  uint64_t v9;

  v7 = *a1;
  v8 = (_BYTE *)(*a2 + *a5);
  v9 = swift_beginAccess();
  *v8 = v7;
  return a6(v9);
}

uint64_t sub_22D83B908@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily, a2);
}

uint64_t sub_22D83B914(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily, (uint64_t (*)(uint64_t))sub_22D83A930);
}

uint64_t sub_22D83B928@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_69Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown, a2);
}

uint64_t sub_22D83B934(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown, (uint64_t (*)(uint64_t))sub_22D83AD5C);
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.actionButtonInitiated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t method lookup function for ActivityScene()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityScene.subscript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityScene.observe<A>(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityScene.updateClientSettings(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityScene.updateClientSettingsWithTransitionContext(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of ActivityScene.textColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of ActivityScene.textColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of ActivityScene.textColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActivityScene.actionButtonInitiated.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t sub_22D83BD9C(void *a1)
{
  uint64_t v1;

  return sub_22D83AEC4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D83BDA4()
{
  return swift_deallocObject();
}

void sub_22D83BDB4(void *a1)
{
  uint64_t v1;

  sub_22D83B2EC(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_22D83BDBC()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BDCC(void *a1)
{
  uint64_t v1;

  return sub_22D83AA98(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D83BDD4()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BDE4()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BDF4(void *a1)
{
  uint64_t v1;

  return sub_22D83A6A8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D83BDFC()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BE0C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BE1C(void *a1)
{
  uint64_t v1;

  return sub_22D83A35C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D83BE24()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BE34()
{
  return swift_deallocObject();
}

void sub_22D83BE44(void *a1)
{
  uint64_t v1;

  sub_22D839FB4(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, &qword_255D97158);
}

uint64_t sub_22D83BE6C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BE7C()
{
  return swift_deallocObject();
}

void sub_22D83BE8C(uint64_t a1)
{
  uint64_t v1;

  sub_22D839CB8(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, sub_22D827BE0);
}

uint64_t sub_22D83BEB4()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BEC4()
{
  return swift_deallocObject();
}

void sub_22D83BED4(uint64_t a1)
{
  uint64_t v1;

  sub_22D839CB8(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, sub_22D827C2C);
}

uint64_t sub_22D83BEFC()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BF0C()
{
  return swift_deallocObject();
}

void sub_22D83BF1C(void *a1)
{
  uint64_t v1;

  sub_22D839FB4(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, &qword_255D97140);
}

uint64_t sub_22D83BF44()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BF54()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BF64(void *a1)
{
  uint64_t v1;

  return sub_22D8395A8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D83BF6C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BF7C()
{
  return swift_deallocObject();
}

uint64_t sub_22D83BF8C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  void **v13;
  void *v14;
  id v15;
  void **v16;
  void *v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unsigned __int8 *v26;
  id v27;
  uint64_t v28;
  id v30;

  type metadata accessor for ActivityMutableSceneClientSettings();
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = (void *)v6;
    swift_beginAccess();
    v30 = a1;
    v8 = objc_msgSend(v7, sel_otherSettings);
    v9 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v8, sel_setObject_forSetting_, v9, qword_255D97128);

    swift_unknownObjectRelease();
    v10 = (id *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID);
    swift_beginAccess();
    v11 = *v10;
    v12 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v12, sel_setObject_forSetting_, v11, qword_255D97140);

    v13 = (void **)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor);
    swift_beginAccess();
    v14 = *v13;
    v15 = v14;
    sub_22D827C2C(v14);

    v16 = (void **)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor);
    swift_beginAccess();
    v17 = *v16;
    v18 = v17;
    sub_22D827BE0(v17);

    v19 = (id *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics);
    swift_beginAccess();
    v20 = *v19;
    v21 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v21, sel_setObject_forSetting_, v20, qword_255D97158);

    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    v22 = objc_msgSend(v7, sel_otherSettings);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6330);
    v23 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v22, sel_setObject_forSetting_, v23, qword_255D97170);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    swift_beginAccess();
    v24 = objc_msgSend(v7, sel_otherSettings);
    v25 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v24, sel_setObject_forSetting_, v25, qword_255D97188);

    swift_unknownObjectRelease();
    v26 = (unsigned __int8 *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
    swift_beginAccess();
    LODWORD(v25) = *v26;
    v27 = objc_msgSend(v7, sel_otherSettings);
    v28 = 0;
    if ((_DWORD)v25 != 2)
      v28 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v27, sel_setObject_forSetting_, v28, qword_255D971A0);

    swift_unknownObjectRelease();
  }
  return a2;
}

id ActivitySceneMetrics.__allocating_init(size:cornerRadius:edgeInsets:)(void *a1, double a2, double a3, double a4)
{
  objc_class *v4;
  char *v9;
  void **v10;
  double *v11;
  void *v12;
  id v13;
  id v14;
  objc_super v16;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = (void **)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *v11 = a2;
  v11[1] = a3;
  *(double *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a4;
  swift_beginAccess();
  v12 = *v10;
  *v10 = a1;
  v13 = a1;

  v16.receiver = v9;
  v16.super_class = v4;
  v14 = objc_msgSendSuper2(&v16, sel_init);

  return v14;
}

double sub_22D83C578()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D83C610(double a1, double a2)
{
  uint64_t v2;
  double *v5;
  uint64_t result;

  v5 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  result = swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_22D83C664())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_22D83C6EC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D83C780(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D83C7D0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_22D83C85C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D83C904(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_22D83C954(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_22D83C9B4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22D83C9F8(char a1)
{
  return *(_QWORD *)&aSize_4[8 * a1];
}

id ActivitySceneMetrics.__allocating_init(xpcDictionary:)()
{
  objc_class *v0;
  id v1;
  id v2;

  v1 = objc_allocWithZone(v0);
  v2 = sub_22D83D6AC();
  swift_unknownObjectRelease();
  return v2;
}

id ActivitySceneMetrics.init(xpcDictionary:)()
{
  id v0;

  v0 = sub_22D83D6AC();
  swift_unknownObjectRelease();
  return v0;
}

void sub_22D83CAC8(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (a1)
  {
    swift_beginAccess();
    BSSerializeCGSizeToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    v2 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
    swift_beginAccess();
    if (*v2)
    {
      v3 = *v2;
      v4 = objc_msgSend(v3, sel_bs_secureEncoded);
      if (v4)
      {
        v5 = sub_22D84B2EC();
        v7 = v6;

        v4 = (id)sub_22D84B2E0();
        sub_22D81CE80(v5, v7);
      }
      BSSerializeDataToXPCDictionaryWithKey();

    }
  }
}

id ActivitySceneMetrics.init(size:cornerRadius:edgeInsets:)(void *a1, double a2, double a3, double a4)
{
  char *v4;
  void **v6;
  double *v7;
  void *v8;
  id v9;
  id v10;
  objc_super v12;

  v6 = (void **)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v7 = (double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *v7 = a2;
  v7[1] = a3;
  *(double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a4;
  swift_beginAccess();
  v8 = *v6;
  *v6 = a1;
  v9 = a1;

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ActivitySceneMetrics.__allocating_init(size:cornerRadius:)(double a1, double a2, double a3)
{
  objc_class *v3;
  char *v7;
  void **v8;
  double *v9;
  void *v10;
  objc_super v12;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = (void **)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v9 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *v9 = a1;
  v9[1] = a2;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a3;
  swift_beginAccess();
  v10 = *v8;
  *v8 = 0;

  v12.receiver = v7;
  v12.super_class = v3;
  return objc_msgSendSuper2(&v12, sel_init);
}

id ActivitySceneMetrics.init(size:cornerRadius:)(double a1, double a2, double a3)
{
  char *v3;
  void **v4;
  double *v5;
  void *v6;
  objc_super v8;

  v4 = (void **)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v5 = (double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *v5 = a1;
  v5[1] = a2;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a3;
  swift_beginAccess();
  v6 = *v4;
  *v4 = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_22D83CF60(uint64_t a1)
{
  uint64_t v1;
  double *v2;
  double v3;
  double v4;
  double *v5;
  double *v6;
  double v7;
  double *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v18;
  char *v19;
  _BYTE v20[24];
  uint64_t v21;

  sub_22D81410C(a1, (uint64_t)v20);
  if (!v21)
  {
    sub_22D814194((uint64_t)v20);
    goto LABEL_11;
  }
  type metadata accessor for ActivitySceneMetrics();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    v16 = 0;
    return v16 & 1;
  }
  v2 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  v5 = (double *)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  swift_beginAccess();
  if (v4 != *v5)
    goto LABEL_10;
  if (v3 != v5[1])
    goto LABEL_10;
  v6 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  v7 = *v6;
  v8 = (double *)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
  swift_beginAccess();
  if (v7 != *v8)
    goto LABEL_10;
  v9 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v10 = *v9;
  v11 = (void **)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  swift_beginAccess();
  v12 = *v11;
  if (!v10)
  {
    v18 = v12;

    if (!v12)
    {
      v16 = 1;
      return v16 & 1;
    }

    goto LABEL_11;
  }
  if (!v12)
  {
LABEL_10:

    goto LABEL_11;
  }
  type metadata accessor for ActivityEdgeInsets();
  v13 = v10;
  v14 = v12;
  v15 = v13;
  v16 = sub_22D84B76C();

  return v16 & 1;
}

uint64_t static ActivitySceneMetrics.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D83D1C4(void *a1)
{
  uint64_t v1;
  double *v3;
  double v4;
  double v5;
  void *v6;
  double *v7;
  void *v8;
  double v9;
  id *v10;
  id v11;
  void *v12;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v6 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeCGSize_forKey_, v6, v5, v4);

  v7 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  *(float *)&v4 = *v7;
  v8 = (void *)sub_22D84B5BC();
  LODWORD(v9) = LODWORD(v4);
  objc_msgSend(a1, sel_encodeFloat_forKey_, v8, v9);

  v10 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  if (*v10)
  {
    v11 = *v10;
    v12 = (void *)sub_22D84B5BC();
    objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  }
}

id ActivitySceneMetrics.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D83D818(a1);

  return v4;
}

id ActivitySceneMetrics.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D83D818(a1);

  return v2;
}

uint64_t sub_22D83D474()
{
  uint64_t v0;
  id *v1;
  id v2;

  sub_22D84B850();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  type metadata accessor for CGSize(0);
  sub_22D84B5D4();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  swift_beginAccess();
  sub_22D84B67C();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  sub_22D84B5EC();
  v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v2 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C61E0);
  sub_22D84B5D4();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  return 0x203A657A6953;
}

id ActivitySceneMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivitySceneMetrics.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivitySceneMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D83D6AC()
{
  char *v0;
  void **v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *ObjCClassFromMetadata;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v1 = (void **)&v0[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v2 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  v3 = &v2[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *(_QWORD *)v3 = v4;
  *((_QWORD *)v3 + 1) = v5;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = v6;
  v7 = (id)BSDeserializeDataFromXPCDictionaryWithKey();
  if (v7)
  {
    v8 = v7;
    v9 = sub_22D84B2EC();
    v11 = v10;

    type metadata accessor for ActivityEdgeInsets();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v13 = (void *)sub_22D84B2E0();
    v14 = objc_msgSend(ObjCClassFromMetadata, sel_bs_secureDecodedFromData_, v13);
    sub_22D81CE80(v9, v11);

    swift_beginAccess();
    v15 = *v1;
    *v1 = v14;

  }
  else
  {

  }
  v17.receiver = v2;
  v17.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return objc_opt_self();
}

id sub_22D83D818(void *a1)
{
  char *v1;
  void **v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v3 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  v4 = v1;
  v5 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeCGSizeForKey_, v5);
  v7 = v6;
  v9 = v8;

  v10 = &v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *(_QWORD *)v10 = v7;
  *((_QWORD *)v10 + 1) = v9;
  v11 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeFloatForKey_, v11);
  LODWORD(v7) = v12;

  *(double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = *(float *)&v7;
  v13 = (void *)sub_22D84B5BC();
  v14 = objc_msgSend(a1, sel_containsValueForKey_, v13);

  if (v14)
  {
    type metadata accessor for ActivityEdgeInsets();
    v15 = sub_22D84B748();
    swift_beginAccess();
    v16 = *v3;
    *v3 = (void *)v15;

  }
  else
  {

  }
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v18, sel_init);
}

__n128 sub_22D83D9B4@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_22D83DA04(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  result = swift_beginAccess();
  *v4 = v2;
  v4[1] = v3;
  return result;
}

double sub_22D83DA58@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_22D83DAA8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

id sub_22D83DAFC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for ActivitySceneMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(size:cornerRadius:edgeInsets:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(size:cornerRadius:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t sub_22D83DCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v5 = sub_22D831D70(a1);
      if ((v6 & 1) != 0)
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  v3 = sub_22D84B8A4();
  swift_release();
  if (!v3)
    return 0;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D962C0);
  swift_dynamicCast();
  v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_22D83DD88(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = *a1;
  v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityUIServices14SettingsDiffer_subjects);
  swift_beginAccess();
  v8 = *v7;
  swift_bridgeObjectRetain();
  v9 = swift_retain();
  v10 = sub_22D83DCB0(v9, v8);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v10)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D962C0);
    swift_allocObject();
    v10 = sub_22D84B4F0();
    v11 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + v6 + 8);
    v12 = swift_allocObject();
    swift_weakInit();
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 24);
    v15 = type metadata accessor for SettingsDiffer();
    swift_retain();
    v14(v3, sub_22D83E204, v12, v15, v11, v13);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    v16 = swift_retain();
    sub_22D83E20C(v16, (uint64_t)a1);
    swift_endAccess();
    swift_release();
  }
  return v10;
}

uint64_t sub_22D83DF10()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_22D84B4E4();
    return swift_release();
  }
  return result;
}

id sub_22D83E0DC()
{
  return sub_22D814DA4(type metadata accessor for SettingsDiffer);
}

uint64_t type metadata accessor for SettingsDiffer()
{
  return objc_opt_self();
}

uint64_t sub_22D83E118(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result;

  if (a3)
    return a3();
  return result;
}

id sub_22D83E178()
{
  return sub_22D814DA4(type metadata accessor for ActivitySceneClientSettingsDiffInspector);
}

uint64_t type metadata accessor for ActivitySceneClientSettingsDiffInspector()
{
  return objc_opt_self();
}

unint64_t sub_22D83E1A4()
{
  unint64_t result;

  result = qword_2540C6350;
  if (!qword_2540C6350)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C6350);
  }
  return result;
}

uint64_t sub_22D83E1E0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22D83E204()
{
  return sub_22D83DF10();
}

uint64_t sub_22D83E20C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_22D84B7FC();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_22D83E2AC(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_22D83EDF4(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_22D83E2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D963D0);
    v2 = sub_22D84B8F8();
    v18 = v2;
    sub_22D84B88C();
    for (i = sub_22D84B8B0(); i; i = sub_22D84B8B0())
    {
      v16 = i;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D963C0);
      swift_dynamicCast();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D962C0);
      swift_dynamicCast();
      v11 = *(_QWORD *)(v2 + 16);
      if (*(_QWORD *)(v2 + 24) <= v11)
      {
        sub_22D83E790(v11 + 1, 1);
        v2 = v18;
      }
      result = sub_22D84B598();
      v5 = v2 + 64;
      v6 = -1 << *(_BYTE *)(v2 + 32);
      v7 = result & ~v6;
      v8 = v7 >> 6;
      if (((-1 << v7) & ~*(_QWORD *)(v2 + 64 + 8 * (v7 >> 6))) != 0)
      {
        v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 64 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v12 = 0;
        v13 = (unint64_t)(63 - v6) >> 6;
        do
        {
          if (++v8 == v13 && (v12 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          v14 = v8 == v13;
          if (v8 == v13)
            v8 = 0;
          v12 |= v14;
          v15 = *(_QWORD *)(v5 + 8 * v8);
        }
        while (v15 == -1);
        v9 = __clz(__rbit64(~v15)) + (v8 << 6);
      }
      *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      v10 = 8 * v9;
      *(_QWORD *)(*(_QWORD *)(v2 + 48) + v10) = v17;
      *(_QWORD *)(*(_QWORD *)(v2 + 56) + v10) = v16;
      ++*(_QWORD *)(v2 + 16);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_22D83E4E4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FF0);
  result = sub_22D84B8EC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v30 = -1 << v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v31 = 1 << *(_BYTE *)(v5 + 32);
    v32 = v3;
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v20 >= v33)
          goto LABEL_33;
        v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v33)
            goto LABEL_33;
          v21 = v9[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v32;
                goto LABEL_40;
              }
              if (v31 >= 64)
                bzero((void *)(v5 + 64), 8 * v33);
              else
                *v9 = v30;
              v3 = v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v33)
                  goto LABEL_33;
                v21 = v9[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(unsigned int *)(*(_QWORD *)(v5 + 48) + 4 * v19);
      v28 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0)
        v29 = v28;
      result = MEMORY[0x22E317AD4](*(_QWORD *)(v7 + 40), v27, 4);
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v17) = v27;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v28;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_22D83E790(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D963D0);
  v35 = a2;
  v6 = sub_22D84B8EC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v33)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v33)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = 8 * v20;
    v30 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
    if ((v35 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D963C0);
    result = sub_22D84B598();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

id sub_22D83EAA8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C5FF0);
  v2 = *v0;
  v3 = sub_22D84B8E0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 4 * v15;
    v17 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
    v18 = 8 * v15;
    v19 = *(void **)(*(_QWORD *)(v2 + 56) + v18);
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D83EC4C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D963D0);
  v2 = *v0;
  v3 = sub_22D84B8E0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_retain();
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22D83EDF4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v4 = v3;
  v8 = *v3;
  v10 = sub_22D831D70(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_22D83EC4C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_release();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v21 = 8 * v10;
    *(_QWORD *)(v16[6] + v21) = a2;
    *(_QWORD *)(v16[7] + v21) = a1;
    v22 = v16[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v16[2] = v24;
      return swift_retain();
    }
    goto LABEL_14;
  }
  sub_22D83E790(v13, a3 & 1);
  v19 = sub_22D831D70(a2);
  if ((v14 & 1) == (v20 & 1))
  {
    v10 = v19;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D963C0);
  result = sub_22D84B9C4();
  __break(1u);
  return result;
}

id ActivitySceneDescriptor.__allocating_init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  objc_class *v6;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  objc_super v22;

  v6 = v5;
  v12 = (char *)objc_allocWithZone(v6);
  v13 = sub_22D84B334();
  v14 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v14 = v13;
  v14[1] = v15;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = a1;
  v16 = sub_22D84B340();
  sub_22D816680();
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], a2, v16);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a3;
  v18 = &v12[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v18 = a4;
  *((_QWORD *)v18 + 1) = a5;
  v19 = a3;

  v22.receiver = v12;
  v22.super_class = v6;
  v20 = objc_msgSendSuper2(&v22, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a2, v16);

  return v20;
}

unint64_t ActivitySceneType.init(rawValue:)(unint64_t a1)
{
  return sub_22D8361AC(a1);
}

uint64_t ActivitySceneDescriptor.activityIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivitySceneDescriptor.activitySceneType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType);
}

id ActivitySceneDescriptor.activityDescriptorData.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData);
}

uint64_t ActivitySceneDescriptor.activityDescriptor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor;
  v4 = sub_22D84B340();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id ActivitySceneDescriptor.metricsRequest.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
}

uint64_t ActivitySceneDescriptor.payloadID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_22D83F350()
{
  objc_class *v0;
  char *v1;
  void **v2;
  void *v3;
  objc_super v5;

  v0 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
  v1 = (char *)objc_allocWithZone(v0);
  v2 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  *(_OWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_22D84F130;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
  swift_beginAccess();
  v3 = *v2;
  *v2 = 0;

  v5.receiver = v1;
  v5.super_class = v0;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ActivitySceneDescriptor.init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;

  v6 = sub_22D83F648(a1, a2, a3, a4, a5);

  return v6;
}

id ActivitySceneDescriptor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivitySceneDescriptor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivitySceneDescriptor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDescriptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D83F648(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  objc_super v21;

  v11 = v5;
  v12 = sub_22D84B334();
  v13 = (uint64_t *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v13 = v12;
  v13[1] = v14;
  *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = a1;
  v15 = sub_22D84B340();
  sub_22D816680();
  *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], a2, v15);
  *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a3;
  v17 = &v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v17 = a4;
  *((_QWORD *)v17 + 1) = a5;
  v18 = a3;

  v21.receiver = v11;
  v21.super_class = (Class)type metadata accessor for ActivitySceneDescriptor();
  v19 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a2, v15);
  return v19;
}

uint64_t type metadata accessor for ActivitySceneDescriptor()
{
  uint64_t result;

  result = qword_2540C5E88;
  if (!qword_2540C5E88)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_22D83F7A0()
{
  unint64_t result;

  result = qword_255D97640;
  if (!qword_255D97640)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivitySceneType, &type metadata for ActivitySceneType);
    atomic_store(result, (unint64_t *)&qword_255D97640);
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivitySceneType()
{
  return &type metadata for ActivitySceneType;
}

uint64_t sub_22D83F7F4()
{
  return type metadata accessor for ActivitySceneDescriptor();
}

uint64_t sub_22D83F7FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D84B340();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ActivitySceneDescriptor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivitySceneDescriptor.metrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivitySceneDescriptor.__allocating_init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

void sub_22D83F8CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  static AnySceneSetting.observe<A>(differ:call:)(a1, a2, a3, a5, a5, a6);
}

void static AnySceneSetting.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];

  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a4, a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v12[4] = sub_22D833588;
  v12[5] = v10;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_22D83FA20;
  v12[3] = &block_descriptor_3;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeOtherSetting_withBlock_, v9, v11);
  _Block_release(v11);
}

void SceneSettingDynamicLookup.subscript.getter()
{
  sub_22D84B8C8();
  __break(1u);
}

{
  sub_22D84B8C8();
  __break(1u);
}

{
  SceneSettingDynamicLookup.subscript.getter();
}

uint64_t sub_22D83FA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_22D83FA68()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97648;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97648 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D83FB70()
{
  qword_255D97650 = 0x656D617266;
  *(_QWORD *)algn_255D97658 = 0xE500000000000000;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96C38, &qword_255D97650);
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96C38, &qword_255D97650, algn_255D97658);
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.modify())()
{
  if (qword_255D96C38 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v8[4] = sub_22D833588;
  v8[5] = v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_22D829EC4;
  v8[3] = &block_descriptor_6;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeFrameWithBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_22D83FCFC(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96C38, &qword_255D97650);
}

uint64_t sub_22D83FD1C()
{
  swift_beginAccess();
  return qword_255D97648;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97660;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97660 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97668);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97668, &qword_255D97668[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D83FE88(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97668);
}

uint64_t sub_22D83FE98()
{
  swift_beginAccess();
  return qword_255D97660;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97678;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97678 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D83FF9C()
{
  qword_255D96340 = 0x7974697669746361;
  *(_QWORD *)algn_255D96348 = 0xEF7363697274654DLL;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96350, &qword_255D96340);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96350, &qword_255D96340, algn_255D96348);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.modify())()
{
  if (qword_255D96350 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22D840078(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96350, &qword_255D96340);
}

uint64_t sub_22D840098()
{
  swift_beginAccess();
  return qword_255D97678;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97680;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97680 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D97688);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D97688, &qword_255D97688[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D8401FC(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D97688);
}

uint64_t sub_22D84020C()
{
  swift_beginAccess();
  return qword_255D97680;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D97698;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D97698 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D976A0);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D976A0, &qword_255D976A0[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D840370(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D976A0);
}

uint64_t sub_22D840380()
{
  swift_beginAccess();
  return qword_255D97698;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D976B0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D976B0 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D840484()
{
  strcpy((char *)&qword_255D96358, "metricsRequest");
  unk_255D96367 = -18;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96368, &qword_255D96358);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96368, &qword_255D96358, &unk_255D96360);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.modify())()
{
  if (qword_255D96368 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D840560(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96368, &qword_255D96358);
}

uint64_t sub_22D840580()
{
  swift_beginAccess();
  return qword_255D976B0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D976B8;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D976B8 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22D840684()
{
  qword_255D976C0 = 0x4964616F6C796170;
  *(_QWORD *)algn_255D976C8 = 0xE900000000000044;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.getter()
{
  return sub_22D81BEC0(&qword_255D96C40, &qword_255D976C0);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81BF4C(a1, a2, &qword_255D96C40, &qword_255D976C0, algn_255D976C8);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.modify())()
{
  if (qword_255D96C40 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D840758(uint64_t a1, uint64_t a2)
{
  return sub_22D81C050(a1, a2, &qword_255D96C40, &qword_255D976C0);
}

uint64_t sub_22D840778()
{
  swift_beginAccess();
  return qword_255D976B8;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.getter()
{
  swift_beginAccess();
  return qword_255D976D0;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_255D976D0 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.getter()
{
  return sub_22D81C7A4((uint64_t *)&unk_255D976D8);
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_22D81C804(a1, a2, qword_255D976D8, &qword_255D976D8[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22D8408DC(uint64_t a1, uint64_t a2)
{
  return sub_22D81C8B0(a1, a2, qword_255D976D8);
}

uint64_t sub_22D8408EC()
{
  swift_beginAccess();
  return qword_255D976D0;
}

uint64_t dispatch thunk of static AnySceneSetting.keyDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static AnySceneSetting.keyIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static AnySceneSetting.observe<A>(differ:call:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

ValueMetadata *type metadata accessor for SceneSettingScopes()
{
  return &type metadata for SceneSettingScopes;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ApplicationSettings()
{
  return &type metadata for SceneSettingScopes.ApplicationSettings;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ApplicationSettings.FrameKey()
{
  return &type metadata for SceneSettingScopes.ApplicationSettings.FrameKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings()
{
  return &type metadata for SceneSettingScopes.ActivitySettings;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityMetricsKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey;
}

ValueMetadata *type metadata accessor for SceneSettingDynamicLookup()
{
  return &type metadata for SceneSettingDynamicLookup;
}

uint64_t dispatch thunk of TypedSettings.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_22D840A94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v3;
  void *v4;
  id v8;
  id v9;
  uint64_t AssociatedTypeWitness;
  int v11;
  __int128 v13;
  _OWORD v14[2];

  v4 = v3;
  v8 = objc_msgSend(v4, sel_otherSettings);
  v9 = objc_msgSend(v8, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 8) + 16))(a1));

  if (v9)
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    sub_22D81CE70(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, v11 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t sub_22D840BB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D840A94(*(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), a2, a3);
}

id sub_22D840BFC()
{
  return sub_22D814DA4(type metadata accessor for ActivitySceneSettings);
}

uint64_t type metadata accessor for ActivitySceneSettings()
{
  return objc_opt_self();
}

uint64_t sub_22D840C28@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_22D840A94(a1, a2, a3);
}

uint64_t sub_22D840C48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_22D840BB8(a1, a2, a3);
}

id sub_22D840C9C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  if (sub_22D840DA0(a3))
  {
    (*(void (**)(void))(v7 + 8))();
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)a4();
    v8 = a1;
    v9 = objc_msgSendSuper2(&v13, sel_keyDescriptionForSetting_, a3);
    if (!v9)
    {

      return 0;
    }
    v10 = v9;
    sub_22D84B5C8();

  }
  v11 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return v11;
}

id sub_22D840D68()
{
  return sub_22D814DA4(type metadata accessor for ActivityMutableSceneSettings);
}

uint64_t type metadata accessor for ActivityMutableSceneSettings()
{
  return objc_opt_self();
}

_UNKNOWN **sub_22D840D94()
{
  return &protocol witness table for SceneSettingScopes.ActivitySettings;
}

ValueMetadata *sub_22D840DA0(uint64_t a1)
{
  swift_beginAccess();
  if (qword_255D97678 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsKey;
  swift_beginAccess();
  if (qword_255D97660 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey;
  swift_beginAccess();
  if (qword_255D97680 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey;
  swift_beginAccess();
  if (qword_255D97698 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey;
  swift_beginAccess();
  if (qword_255D976B0 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey;
  swift_beginAccess();
  if (qword_255D976B8 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey;
  swift_beginAccess();
  if (qword_255D976D0 == a1)
    return &type metadata for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey;
  else
    return 0;
}

uint64_t ActivityTouchEvent.baseContentTouchedDown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityTouchEvent_baseContentTouchedDown);
}

id ActivityTouchEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityTouchEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityTouchEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityTouchEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityTouchEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActivityTouchEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t JindoDemoAttributes.ContentState.config.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JindoDemoAttributes.ContentState.config.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*JindoDemoAttributes.ContentState.config.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::JindoDemoAttributes::ContentState __swiftcall JindoDemoAttributes.ContentState.init(config:)(ActivityUIServices::JindoDemoAttributes::ContentState config)
{
  ActivityUIServices::JindoDemoAttributes::ContentState *v1;

  v1->config._rawValue = config.config._rawValue;
  return config;
}

uint64_t JindoDemoAttributes.ContentState.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_22D841B54(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t static JindoDemoAttributes.ContentState.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_22D8410F4(*a1, *a2);
}

uint64_t sub_22D8410F4(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v27)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_22D831CD8(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_22D84B994();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22D84131C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D842234(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D841344()
{
  sub_22D841D18();
  return sub_22D84BAC0();
}

uint64_t sub_22D84136C()
{
  sub_22D841D18();
  return sub_22D84BACC();
}

uint64_t JindoDemoAttributes.ContentState.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D976F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D841D18();
  sub_22D84BAA8();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D97700);
  sub_22D841D5C(&qword_255D97708, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
  sub_22D84B964();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t JindoDemoAttributes.ContentState.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D84BA30();
  swift_bridgeObjectRetain();
  sub_22D841B54((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_22D84BA78();
}

uint64_t JindoDemoAttributes.ContentState.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97710);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D841D18();
  sub_22D84BA9C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D97700);
    sub_22D841D5C(&qword_255D97718, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    sub_22D84B940();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_22D841648@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return JindoDemoAttributes.ContentState.init(from:)(a1, a2);
}

uint64_t sub_22D84165C(_QWORD *a1)
{
  return JindoDemoAttributes.ContentState.encode(to:)(a1);
}

uint64_t sub_22D841670()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D84BA30();
  swift_bridgeObjectRetain();
  sub_22D841B54((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_22D84BA78();
}

uint64_t sub_22D8416C4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_22D841B54(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8416FC()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D84BA30();
  swift_bridgeObjectRetain();
  sub_22D841B54((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_22D84BA78();
}

uint64_t sub_22D84174C(uint64_t *a1, uint64_t *a2)
{
  return sub_22D8410F4(*a1, *a2);
}

uint64_t JindoDemoAttributes.selection.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JindoDemoAttributes.selection.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JindoDemoAttributes.selection.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::JindoDemoAttributes __swiftcall JindoDemoAttributes.init(selection:)(ActivityUIServices::JindoDemoAttributes selection)
{
  ActivityUIServices::JindoDemoAttributes *v1;

  *v1 = selection;
  return selection;
}

uint64_t sub_22D8417D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8422C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D8417FC()
{
  sub_22D841DBC();
  return sub_22D84BAC0();
}

uint64_t sub_22D841824()
{
  sub_22D841DBC();
  return sub_22D84BACC();
}

uint64_t JindoDemoAttributes.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97720);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D841DBC();
  sub_22D84BAA8();
  sub_22D84B94C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t JindoDemoAttributes.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97730);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D841DBC();
  sub_22D84BA9C();
  if (!v2)
  {
    v9 = sub_22D84B928();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_22D841A54@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return JindoDemoAttributes.init(from:)(a1, a2);
}

uint64_t sub_22D841A68(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97720);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22D841DBC();
  sub_22D84BAA8();
  sub_22D84B94C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_22D841B54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      v8 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_19;
      v10 = *(_QWORD *)(v12 + 8 * v8);
      if (!v10)
        break;
    }
LABEL_18:
    v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D84B5E0();
    swift_bridgeObjectRelease();
    sub_22D84B5E0();
    swift_bridgeObjectRelease();
    result = sub_22D84BA78();
    v7 ^= result;
  }
  v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_22D84BA3C();
  }
  v10 = *(_QWORD *)(v12 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t sub_22D841D18()
{
  unint64_t result;

  result = qword_255D976F8;
  if (!qword_255D976F8)
  {
    result = MEMORY[0x22E318194](&unk_22D85025C, &type metadata for JindoDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D976F8);
  }
  return result;
}

uint64_t sub_22D841D5C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D97700);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x22E318194](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D841DBC()
{
  unint64_t result;

  result = qword_255D97728;
  if (!qword_255D97728)
  {
    result = MEMORY[0x22E318194](&unk_22D85020C, &type metadata for JindoDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97728);
  }
  return result;
}

unint64_t sub_22D841E04()
{
  unint64_t result;

  result = qword_255D97738;
  if (!qword_255D97738)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes.ContentState, &type metadata for JindoDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D97738);
  }
  return result;
}

unint64_t sub_22D841E4C()
{
  unint64_t result;

  result = qword_255D97740;
  if (!qword_255D97740)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes, &type metadata for JindoDemoAttributes);
    atomic_store(result, (unint64_t *)&qword_255D97740);
  }
  return result;
}

unint64_t sub_22D841E94()
{
  unint64_t result;

  result = qword_255D97748;
  if (!qword_255D97748)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes, &type metadata for JindoDemoAttributes);
    atomic_store(result, (unint64_t *)&qword_255D97748);
  }
  return result;
}

unint64_t sub_22D841EDC()
{
  unint64_t result;

  result = qword_255D97750;
  if (!qword_255D97750)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes.ContentState, &type metadata for JindoDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D97750);
  }
  return result;
}

unint64_t sub_22D841F24()
{
  unint64_t result;

  result = qword_255D97758;
  if (!qword_255D97758)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes.ContentState, &type metadata for JindoDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D97758);
  }
  return result;
}

unint64_t sub_22D841F6C()
{
  unint64_t result;

  result = qword_255D97760;
  if (!qword_255D97760)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for JindoDemoAttributes.ContentState, &type metadata for JindoDemoAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_255D97760);
  }
  return result;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes()
{
  return &type metadata for JindoDemoAttributes;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.ContentState()
{
  return &type metadata for JindoDemoAttributes.ContentState;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.CodingKeys()
{
  return &type metadata for JindoDemoAttributes.CodingKeys;
}

uint64_t _s18ActivityUIServices19JindoDemoAttributesV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_22D842028 + 4 * byte_22D84FEE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D842048 + 4 * byte_22D84FEE5[v4]))();
}

_BYTE *sub_22D842028(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D842048(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D842050(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D842058(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D842060(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D842068(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.ContentState.CodingKeys()
{
  return &type metadata for JindoDemoAttributes.ContentState.CodingKeys;
}

unint64_t sub_22D842088()
{
  unint64_t result;

  result = qword_255D97768;
  if (!qword_255D97768)
  {
    result = MEMORY[0x22E318194](&unk_22D85012C, &type metadata for JindoDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97768);
  }
  return result;
}

unint64_t sub_22D8420D0()
{
  unint64_t result;

  result = qword_255D97770;
  if (!qword_255D97770)
  {
    result = MEMORY[0x22E318194](&unk_22D8501E4, &type metadata for JindoDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97770);
  }
  return result;
}

unint64_t sub_22D842118()
{
  unint64_t result;

  result = qword_255D97778;
  if (!qword_255D97778)
  {
    result = MEMORY[0x22E318194](&unk_22D850154, &type metadata for JindoDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97778);
  }
  return result;
}

unint64_t sub_22D842160()
{
  unint64_t result;

  result = qword_255D97780;
  if (!qword_255D97780)
  {
    result = MEMORY[0x22E318194](&unk_22D85017C, &type metadata for JindoDemoAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97780);
  }
  return result;
}

unint64_t sub_22D8421A8()
{
  unint64_t result;

  result = qword_255D97788;
  if (!qword_255D97788)
  {
    result = MEMORY[0x22E318194](&unk_22D85009C, &type metadata for JindoDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97788);
  }
  return result;
}

unint64_t sub_22D8421F0()
{
  unint64_t result;

  result = qword_255D97790;
  if (!qword_255D97790)
  {
    result = MEMORY[0x22E318194](&unk_22D8500C4, &type metadata for JindoDemoAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D97790);
  }
  return result;
}

uint64_t sub_22D842234(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6769666E6F63 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D84B994();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D8422B0()
{
  return 0x6769666E6F63;
}

uint64_t sub_22D8422C4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6F697463656C6573 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D84B994();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D842350()
{
  return 0x6F697463656C6573;
}

BOOL ActivityAlertAction.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

_QWORD *sub_22D842394@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t ActivityAlertAction.description.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 0x746E6573657270;
  if (a1 == 1)
    return 0x7373696D736964;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

unint64_t sub_22D842434()
{
  unint64_t result;

  result = qword_255D97798;
  if (!qword_255D97798)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for ActivityAlertAction, &type metadata for ActivityAlertAction);
    atomic_store(result, (unint64_t *)&qword_255D97798);
  }
  return result;
}

uint64_t sub_22D842478()
{
  uint64_t *v0;

  return ActivityAlertAction.description.getter(*v0);
}

ValueMetadata *type metadata accessor for ActivityAlertAction()
{
  return &type metadata for ActivityAlertAction;
}

id sub_22D8424A0()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

void sub_22D8424BC(void *a1)
{
  sub_22D842608(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

uint64_t (*sub_22D8424C8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D842524;
}

id sub_22D842538()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

void sub_22D842554(void *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a1;
  objc_msgSend(v6, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  v8 = *a4;
  v9 = *(void **)&v7[*a4];
  *(_QWORD *)&v7[v8] = v10;

}

void sub_22D8425FC(void *a1)
{
  sub_22D842608(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

void sub_22D842608(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  v5 = *a2;
  v6 = *(void **)(v2 + *a2);
  *(_QWORD *)(v2 + v5) = v7;

}

void sub_22D842698(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = *a2;
  v7 = *a1;
  objc_msgSend(v7, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  v8 = *a5;
  v9 = *(void **)(v6 + *a5);
  *(_QWORD *)(v6 + v8) = v10;

}

uint64_t (*sub_22D842734(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D842524;
}

void sub_22D842790(uint64_t *a1, char a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v2 = *a1;
  v3 = *(void **)(*a1 + 32);
  v5 = *(_QWORD *)(*a1 + 48);
  v4 = *(_QWORD *)(*a1 + 56);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    objc_msgSend(v6, sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for SizeDimensionRequest();
    swift_dynamicCast();
    v7 = *(void **)(v5 + v4);
    *(_QWORD *)(v5 + v4) = *(_QWORD *)(v2 + 40);

  }
  else
  {
    objc_msgSend(*(id *)(*a1 + 32), sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for SizeDimensionRequest();
    swift_dynamicCast();
    v8 = *(void **)(v5 + v4);
    *(_QWORD *)(v5 + v4) = *(_QWORD *)(v2 + 40);

  }
  free((void *)v2);
}

double sub_22D8428E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D84297C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D8429CC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_22D842A54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D842AE8(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D842B38())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_22D842BC0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22D842C54(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22D842CA4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_22D842D30()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D842DD8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_22D842E28(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_22D842E88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_22D842EDC()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  v2 = v1;
  return v1;
}

void sub_22D842F50(void *a1)
{
  sub_22D844EE8(a1);

}

void (*sub_22D842F74(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  v3[6] = v1;
  v3[7] = v4;
  v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  v6 = v5;
  return sub_22D842FD0;
}

void sub_22D842FD0(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      objc_msgSend(v3, sel_copy);
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      type metadata accessor for ActivityEdgeInsets();
      v4 = swift_dynamicCast();
      v5 = v2[5];
      if (!v4)
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v9 = v2[6];
    v8 = v2[7];
    v10 = *(void **)(v9 + v8);
    *(_QWORD *)(v9 + v8) = v5;

    v11 = (void *)v2[4];
  }
  else
  {
    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)a1 + 32), sel_copy);
      sub_22D84B7C0();
      swift_unknownObjectRelease();
      type metadata accessor for ActivityEdgeInsets();
      v6 = swift_dynamicCast();
      v7 = v2[5];
      if (!v6)
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v13 = v2[6];
    v12 = v2[7];
    v11 = *(void **)(v13 + v12);
    *(_QWORD *)(v13 + v12) = v7;

  }
  free(v2);
}

double sub_22D843120()
{
  uint64_t v0;
  double v1;
  double *v2;

  v1 = *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v2 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return v1 * *v2;
}

double sub_22D843290()
{
  uint64_t v0;
  double v1;
  double *v2;

  v1 = *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v2 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return v1 * *v2;
}

uint64_t sub_22D84331C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D843354 + 4 * byte_22D8503C0[a1]))(0xD000000000000013, 0x800000022D8539F0);
}

uint64_t sub_22D843354()
{
  return 0x6874646977;
}

uint64_t sub_22D843368()
{
  return 0x746867696568;
}

uint64_t sub_22D84337C()
{
  return 0x615272656E726F63;
}

uint64_t sub_22D84339C()
{
  return 0x65736E4965676465;
}

uint64_t sub_22D8433BC()
{
  return 0x6772614D70696C63;
}

uint64_t sub_22D8433D8()
{
  return 0x636146656C616373;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  objc_class *v3;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v3), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, 0, a3, 0.0, 1.0);

  return v6;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  void *v3;
  id v6;

  v6 = objc_msgSend(v3, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, 0, a3, 0.0, 1.0);

  return v6;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:watchDisplayVariant:)(void *a1, void *a2, void *a3, double a4)
{
  objc_class *v4;
  id v8;

  v8 = objc_msgSend(objc_allocWithZone(v4), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, 0, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:watchDisplayVariant:)(void *a1, void *a2, void *a3, double a4)
{
  void *v4;
  id v8;

  v8 = objc_msgSend(v4, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, 0, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:)(void *a1, void *a2, void *a3, double a4)
{
  objc_class *v4;
  id v8;

  v8 = objc_msgSend(objc_allocWithZone(v4), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:)(void *a1, void *a2, void *a3, double a4)
{
  void *v4;
  id v8;

  v8 = objc_msgSend(v4, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:)(void *a1, void *a2, void *a3, double a4, double a5)
{
  objc_class *v5;
  id v9;

  v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, a5, 1.0);

  return v9;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:)(void *a1, void *a2, void *a3, double a4, double a5)
{
  void *v5;
  id v9;

  v9 = objc_msgSend(v5, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, a5, 1.0);

  return v9;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:)(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  objc_class *v6;
  id v10;

  v10 = objc_msgSend(objc_allocWithZone(v6), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, a3, 0, a4, a5, a6);

  return v10;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:)(void *a1, void *a2, void *a3)
{
  void *v3;
  id v7;

  v7 = objc_msgSend(v3, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, a3, 0);

  return v7;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  objc_class *v7;
  id v15;
  id v16;

  v15 = objc_allocWithZone(v7);
  v16 = sub_22D844F7C(a1, a2, a3, a4, a5, a6, a7);

  return v16;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  id v11;

  v11 = sub_22D844F7C(a1, a2, a3, a4, a5, a6, a7);

  return v11;
}

BOOL sub_22D843A58()
{
  uint64_t v0;
  double *v1;

  if (*(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
    || *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0)
  {
    return 1;
  }
  v1 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  return *v1 != 0.0;
}

uint64_t sub_22D843B40()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id *v6;

  v1 = v0;
  sub_22D84BA84();
  v2 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  sub_22D84B778();

  v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  sub_22D84B778();

  swift_beginAccess();
  sub_22D84BA60();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  sub_22D84BA48();
  if (v4)
  {
    v5 = v4;
    sub_22D84B778();

  }
  swift_beginAccess();
  sub_22D84BA60();
  swift_beginAccess();
  sub_22D84BA60();
  v6 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  if (*v6)
  {
    objc_msgSend(*v6, sel_integerValue);
    sub_22D84BA48();
    sub_22D84BA3C();
  }
  else
  {
    sub_22D84BA48();
  }
  return sub_22D84BA6C();
}

uint64_t sub_22D843D18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  double *v11;
  double v12;
  double *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  double *v19;
  double v20;
  double *v21;
  double *v22;
  double v23;
  double *v24;
  void **v25;
  void *v26;
  void **v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id v34;
  char *v35;
  _BYTE v36[24];
  uint64_t v37;

  v2 = v1;
  sub_22D81410C(a1, (uint64_t)v36);
  if (!v37)
  {
    sub_22D814194((uint64_t)v36);
    goto LABEL_18;
  }
  type metadata accessor for ActivityItemMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    v32 = 0;
    return v32 & 1;
  }
  sub_22D819F60(0, (unint64_t *)&qword_2540C5FD0);
  v3 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest];
  v4 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  v5 = v3;
  v6 = sub_22D84B76C();

  if ((v6 & 1) == 0)
    goto LABEL_17;
  v7 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest];
  v8 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  v9 = v7;
  v10 = sub_22D84B76C();

  if ((v10 & 1) == 0)
    goto LABEL_17;
  v11 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  v12 = *v11;
  v13 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
  swift_beginAccess();
  if (v12 != *v13)
    goto LABEL_17;
  v14 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  v15 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets];
  if (v14)
  {
    if (!v15)
      goto LABEL_17;
    type metadata accessor for ActivityEdgeInsets();
    v16 = v15;
    v17 = v14;
    v18 = sub_22D84B76C();

    if ((v18 & 1) == 0)
      goto LABEL_17;
  }
  else if (v15)
  {
LABEL_17:

    goto LABEL_18;
  }
  v19 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  v20 = *v19;
  v21 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  swift_beginAccess();
  if (v20 != *v21)
    goto LABEL_17;
  v22 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  v23 = *v22;
  v24 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  swift_beginAccess();
  if (v23 != *v24)
    goto LABEL_17;
  v25 = (void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v26 = *v25;
  v27 = (void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  swift_beginAccess();
  v28 = *v27;
  if (!v26)
  {
    v34 = v28;

    if (!v28)
    {
      v32 = 1;
      return v32 & 1;
    }

    goto LABEL_18;
  }
  if (!v28)
    goto LABEL_17;
  sub_22D819F60(0, qword_255D963E8);
  v29 = v26;
  v30 = v28;
  v31 = v29;
  v32 = sub_22D84B76C();

  return v32 & 1;
}

id sub_22D844104()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  double *v12;
  double v13;
  void *v14;
  double *v15;
  double v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;
    v3 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
    v4 = (void *)sub_22D84B5BC();

    v5 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
    v6 = (void *)sub_22D84B5BC();

    v7 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
    swift_beginAccess();
    v8 = *v7;
    v9 = (void *)sub_22D84B5BC();

    v10 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
    v11 = (void *)sub_22D84B5BC();

    v12 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
    swift_beginAccess();
    v13 = *v12;
    v14 = (void *)sub_22D84B5BC();

    v15 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
    swift_beginAccess();
    v16 = *v15;
    v17 = (void *)sub_22D84B5BC();

    v18 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
    swift_beginAccess();
    v19 = *v18;
    v20 = (void *)sub_22D84B5BC();

    result = objc_msgSend(v2, sel_build);
    if (result)
    {
      v21 = result;
      v22 = sub_22D84B5C8();

      return (id)v22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22D844464(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;

  if (a1)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v4, sel_bs_secureEncoded);
      if (v5)
      {
        v6 = sub_22D84B2EC();
        v8 = v7;

        v5 = (id)sub_22D84B2E0();
        sub_22D81CE80(v6, v8);
      }
      BSSerializeDataToXPCDictionaryWithKey();

    }
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    v9 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
    swift_beginAccess();
    if (*v9)
    {
      v10 = *v9;
      xpc_dictionary_set_int64(a1, "watchDisplayVariant", (int64_t)objc_msgSend(v10, sel_longLongValue));

    }
  }
}

id ActivityItemMetricsRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D8451D8(a1);
  swift_unknownObjectRelease();
  return v4;
}

id ActivityItemMetricsRequest.init(xpcDictionary:)(void *a1)
{
  id v1;

  v1 = sub_22D8451D8(a1);
  swift_unknownObjectRelease();
  return v1;
}

void sub_22D844748(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  double *v5;
  double v6;
  void *v7;
  double *v8;
  double v9;
  double *v10;
  double v11;
  void **v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  v5 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  v6 = *v5;
  v7 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  v9 = *v8;
  v10 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  v11 = *v10;
  v12 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v13 = *v12;
  v14 = (objc_class *)type metadata accessor for ActivityItemMetricsRequest();
  objc_allocWithZone(v14);
  v15 = v13;
  v16 = v3;
  v17 = v4;
  v18 = v7;
  v19 = sub_22D844F7C(v16, v17, v7, v13, v6, v9, v11);

  a1[3] = v14;
  *a1 = v19;
}

uint64_t static ActivityItemMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D84492C(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double *v7;
  double v8;
  void *v9;
  double *v10;
  double v11;
  void *v12;
  double *v13;
  double v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  v4 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  v5 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  v6 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  v7 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  v8 = *v7;
  v9 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v9, v8);

  v10 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  v11 = *v10;
  v12 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v12, v11);

  v13 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  v14 = *v13;
  v15 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v15, v14);

  v16 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  if (*v16)
  {
    v17 = *v16;
    v18 = (void *)sub_22D84B5BC();
    objc_msgSend(a1, sel_encodeObject_forKey_, v17, v18);

  }
  v19 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  if (v19)
  {
    v20 = v19;
    v21 = (void *)sub_22D84B5BC();
    objc_msgSend(a1, sel_encodeObject_forKey_, v20, v21);

  }
}

id ActivityItemMetricsRequest.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D8455E4(a1);

  return v4;
}

id ActivityItemMetricsRequest.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D8455E4(a1);

  return v2;
}

id ActivityItemMetricsRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityItemMetricsRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityItemMetricsRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D844DE0()
{
  objc_class *v0;
  char *v1;
  id v2;
  char *v3;
  id v4;
  id v5;
  objc_super v7;
  objc_super v8;

  v0 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v1 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v8.receiver = v1;
  v8.super_class = v0;
  v2 = objc_msgSendSuper2(&v8, sel_init);
  v3 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v7.receiver = v3;
  v7.super_class = v0;
  v4 = objc_msgSendSuper2(&v7, sel_init);
  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityItemMetricsRequest()), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, v2, v4, 0, 0, 0.0, 0.0, 1.0);

  return v5;
}

void sub_22D844EE8(void *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_msgSend(a1, sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityEdgeInsets();
    v2 = swift_dynamicCast();
    v3 = v5;
    if (!v2)
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets) = v3;

}

id sub_22D844F7C(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  char *v7;
  double *v13;
  double *v14;
  void **v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v25;
  uint64_t v26;

  v13 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  v14 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  v15 = (void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  v16 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  v17 = v7;
  objc_msgSend(a1, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v26;
  objc_msgSend(a2, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v26;
  if (a3)
  {
    objc_msgSend(a3, sel_copy);
    sub_22D84B7C0();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityEdgeInsets();
    swift_dynamicCast();
    v18 = v26;
  }
  else
  {
    v18 = 0;
  }
  v19 = *(void **)&v7[v16];
  *(_QWORD *)&v7[v16] = v18;

  *(double *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = a5;
  swift_beginAccess();
  *v13 = a6;
  swift_beginAccess();
  *v14 = a7;
  swift_beginAccess();
  v20 = *v15;
  *v15 = a4;
  v21 = a4;

  v25.receiver = v17;
  v25.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v25, sel_init);
}

uint64_t type metadata accessor for ActivityItemMetricsRequest()
{
  return objc_opt_self();
}

id sub_22D8451D8(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  objc_class *v8;
  char *v9;
  id v10;
  objc_class *v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *ObjCClassFromMetadata;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id result;
  void *v28;
  uint64_t v29;
  void **v30;
  void *v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[24];
  uint64_t v38;

  v3 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  v4 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  v30 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  v5 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  v6 = v1;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }
  sub_22D81494C((uint64_t)&v35, (uint64_t)v37);
  if (v38)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      v7 = v31;
      goto LABEL_9;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v37);
  }
  v8 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v9 = (char *)objc_allocWithZone(v8);
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v34.receiver = v9;
  v34.super_class = v8;
  v7 = objc_msgSendSuper2(&v34, sel_init);
LABEL_9:
  *(_QWORD *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v7;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }
  sub_22D81494C((uint64_t)&v35, (uint64_t)v37);
  if (v38)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      v10 = v31;
      goto LABEL_17;
    }
  }
  else
  {
    sub_22D814194((uint64_t)v37);
  }
  v11 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v33.receiver = v12;
  v33.super_class = v11;
  v10 = objc_msgSendSuper2(&v33, sel_init);
LABEL_17:
  *(_QWORD *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v10;
  v13 = (id)BSDeserializeDataFromXPCDictionaryWithKey();
  if (v13)
  {
    v14 = v13;
    v15 = sub_22D84B2EC();
    v17 = v16;

    type metadata accessor for ActivityEdgeInsets();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v19 = (void *)sub_22D84B2E0();
    v20 = objc_msgSend(ObjCClassFromMetadata, sel_bs_secureDecodedFromData_, v19);
    sub_22D81CE80(v15, v17);

    v21 = *(void **)&v1[v5];
    *(_QWORD *)&v1[v5] = v20;

  }
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = v22;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  v24 = v23;
  swift_beginAccess();
  *(_QWORD *)v3 = v24;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  v26 = v25;
  result = (id)swift_beginAccess();
  *(_QWORD *)v4 = v26;
  if (a1)
  {
    v28 = v6;
    if (xpc_dictionary_get_value(a1, "watchDisplayVariant"))
    {
      swift_unknownObjectRelease();
      xpc_dictionary_get_int64(a1, "watchDisplayVariant");
      sub_22D819F60(0, qword_255D963E8);
      v29 = sub_22D84B754();
      swift_beginAccess();
      v28 = *v30;
      *v30 = (void *)v29;

    }
    v32.receiver = v6;
    v32.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
    return objc_msgSendSuper2(&v32, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_22D8455E4(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  char *v5;
  void **v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_super v31;
  objc_super v32;
  objc_super v33;

  v2 = v1;
  v4 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  v5 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  v6 = (void **)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  v7 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  v8 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v9 = v2;
  v10 = sub_22D84B748();
  if (!v10)
  {
    v11 = (char *)objc_allocWithZone(v8);
    *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
    *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
    *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
    v33.receiver = v11;
    v33.super_class = v8;
    v10 = (uint64_t)objc_msgSendSuper2(&v33, sel_init);
  }
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v10;
  v12 = sub_22D84B748();
  if (!v12)
  {
    v13 = (char *)objc_allocWithZone(v8);
    *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
    *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
    *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
    v32.receiver = v13;
    v32.super_class = v8;
    v12 = (uint64_t)objc_msgSendSuper2(&v32, sel_init);
  }
  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v12;
  v14 = (void *)sub_22D84B5BC();
  v15 = objc_msgSend(a1, sel_containsValueForKey_, v14);

  if (v15)
  {
    type metadata accessor for ActivityEdgeInsets();
    v16 = sub_22D84B748();
    v17 = *(void **)&v2[v7];
    *(_QWORD *)&v2[v7] = v16;

  }
  v18 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v18);
  v20 = v19;

  *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = v20;
  v21 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v21);
  v23 = v22;

  swift_beginAccess();
  *(_QWORD *)v4 = v23;
  v24 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v24);
  v26 = v25;

  swift_beginAccess();
  *(_QWORD *)v5 = v26;
  v27 = (void *)sub_22D84B5BC();
  LODWORD(v21) = objc_msgSend(a1, sel_containsValueForKey_, v27);

  v28 = v9;
  if ((_DWORD)v21)
  {
    sub_22D819F60(0, qword_255D963E8);
    v29 = sub_22D84B748();
    swift_beginAccess();
    v28 = *v6;
    *v6 = (void *)v29;

  }
  v31.receiver = v9;
  v31.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v31, sel_init);
}

id sub_22D845998@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  *a2 = v2;
  return v2;
}

void sub_22D8459B0(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D842698(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

id sub_22D8459CC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  *a2 = v2;
  return v2;
}

void sub_22D8459E4(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_22D842698(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

double sub_22D845A00@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius, a2);
}

uint64_t sub_22D845A0C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
}

double sub_22D845A18@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin, a2);
}

uint64_t sub_22D845A24(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
}

double sub_22D845A30@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor, a2);
}

uint64_t sub_22D845A3C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
}

id sub_22D845A48@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22D845A9C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  *a2 = v2;
  return v2;
}

void sub_22D845AB4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_22D844EE8(v1);

}

uint64_t method lookup function for ActivityItemMetricsRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.initialSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.maximumSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.isValid()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of static ActivityItemMetricsRequest.empty()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 448))();
}

void *sub_22D845E58()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22D845F00(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id sub_22D845FA8()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  return *v1;
}

void sub_22D846048(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void sub_22D8460A8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BE38110]);
  v1 = (void *)sub_22D84B5BC();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_255D962E0 = (uint64_t)v2;
}

uint64_t sub_22D84615C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  return MEMORY[0x22E31826C](v1);
}

uint64_t sub_22D8461F4()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_22D84624C(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22E31826C](v5);
  return sub_22D816BFC;
}

char *ActivitySystemApertureSceneHandle.__allocating_init(acActivityDescritor:systemMetricsRequest:)(void *a1, void *a2)
{
  objc_class *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  char *result;
  char *v14;
  id v15;
  char *v16;
  uint64_t v17;

  v5 = sub_22D84B340();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - v10;
  v12 = objc_allocWithZone(v2);
  result = (char *)objc_msgSend(a1, sel_descriptorData);
  if (result)
  {
    v14 = result;
    sub_22D816680();
    sub_22D84B448();

    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    v15 = objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneHandle());
    v16 = sub_22D846608((uint64_t)v9, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *ActivitySystemApertureSceneHandle.init(acActivityDescritor:systemMetricsRequest:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  char *result;
  char *v14;
  id v15;
  char *v16;
  uint64_t v17;

  v5 = sub_22D84B340();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - v10;
  v12 = v2;
  result = (char *)objc_msgSend(a1, sel_descriptorData);
  if (result)
  {
    v14 = result;
    sub_22D816680();
    sub_22D84B448();

    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    v15 = objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneHandle());
    v16 = sub_22D846608((uint64_t)v9, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ActivitySystemApertureSceneHandle()
{
  uint64_t result;

  result = qword_255D96330;
  if (!qword_255D96330)
    return swift_getSingletonMetadata();
  return result;
}

char *sub_22D846608(uint64_t a1, void *a2)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  objc_class *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id *v35;
  id v36;
  id v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id aBlock;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  objc_super v61;

  v47 = sub_22D84B400();
  v5 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22D84B3AC();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene] = 0;
  v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer] = 0;
  v11 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector;
  v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector());
  v13 = v2;
  *(_QWORD *)&v2[v11] = objc_msgSend(v12, sel_init);
  swift_unknownObjectWeakInit();
  v14 = &v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0xE000000000000000;
  v15 = &v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_activityDescriptor];
  v16 = sub_22D84B340();
  v48 = *(_QWORD *)(v16 - 8);
  v49 = v16;
  (*(void (**)(char *, uint64_t))(v48 + 16))(v15, a1);
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor] = sub_22D84B310();
  *(_QWORD *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_systemMetricsRequest] = a2;
  v50 = a2;
  v17 = a1;
  sub_22D84B31C();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = v47;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v47);
    v19 = sub_22D84B3F4();
    v21 = v20;
    v10 = v7;
    v22 = v18;
  }
  else
  {
    v21 = 0x800000022D851580;
    v19 = 0xD000000000000011;
    v22 = v47;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v22);
  v23 = (unint64_t *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_processResource];
  *v23 = v19;
  v23[1] = v21;
  swift_bridgeObjectRetain();

  if (qword_255D963A8 != -1)
    swift_once();
  v24 = sub_22D84B49C();
  __swift_project_value_buffer(v24, (uint64_t)qword_255D96388);
  v25 = sub_22D84B484();
  v26 = sub_22D84B6DC();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_22D80B000, v25, v26, "System Aperture scene created", v27, 2u);
    MEMORY[0x22E318218](v27, -1, -1);
  }

  v28 = (objc_class *)type metadata accessor for ActivitySystemApertureSceneHandle();
  v61.receiver = v13;
  v61.super_class = v28;
  aBlock = objc_msgSendSuper2(&v61, sel_init);
  v29 = (char *)aBlock;
  aBlock = (id)sub_22D84BAB4();
  v52 = v30;
  v59 = 0x3030303030307830;
  v60 = 0xE900000000000030;
  v57 = 30768;
  v58 = 0xE200000000000000;
  sub_22D8354AC();
  v31 = (void *)sub_22D84B7B4();
  v33 = v32;
  swift_bridgeObjectRelease();
  v34 = (void *)sub_22D848554(v19, v21, v17, v50, (uint64_t)v31, v33);
  swift_bridgeObjectRelease();
  v35 = (id *)&v29[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
  swift_beginAccess();
  v36 = *v35;
  *v35 = v34;
  v37 = v34;

  if (*v35)
    objc_msgSend(*v35, sel_setDelegate_, v29);
  aBlock = v31;
  v52 = v33;
  sub_22D84B5EC();
  sub_22D84B334();
  sub_22D84B5EC();
  swift_bridgeObjectRelease();
  v38 = v52;
  v39 = &v29[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
  *(_QWORD *)v39 = aBlock;
  *((_QWORD *)v39 + 1) = v38;
  swift_bridgeObjectRelease();
  v40 = *(void **)&v29[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector];
  v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v42 = qword_255D97140;
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = sub_22D849928;
  *(_QWORD *)(v43 + 24) = v41;
  v55 = sub_22D83564C;
  v56 = v43;
  aBlock = (id)MEMORY[0x24BDAC760];
  v52 = 1107296256;
  v53 = sub_22D83FA20;
  v54 = &block_descriptor_4;
  v44 = _Block_copy(&aBlock);
  v45 = v40;
  swift_retain_n();
  swift_release();
  objc_msgSend(v45, sel_observeOtherSetting_withBlock_, v42, v44);
  _Block_release(v44);

  swift_release_n();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v17, v49);
  return v29;
}

id ActivitySystemApertureSceneHandle.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  sub_22D846CDC();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySystemApertureSceneHandle();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22D846CDC()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  char *v10;
  _QWORD *v11;
  void **v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char *v21;

  v1 = v0;
  result = BSDispatchQueueAssertMain();
  v3 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated;
  if ((v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] & 1) == 0)
  {
    v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] = 1;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector], sel_removeAllObservers);
    if (qword_255D963A8 != -1)
      swift_once();
    v4 = sub_22D84B49C();
    __swift_project_value_buffer(v4, (uint64_t)qword_255D96388);
    v5 = v0;
    v6 = sub_22D84B484();
    v7 = sub_22D84B6DC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v20 = v3;
      v21 = v5;
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138543362;
      v10 = v5;
      sub_22D84B79C();
      *v9 = v5;

      _os_log_impl(&dword_22D80B000, v6, v7, "%{public}@ invalidated", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5FD8);
      swift_arrayDestroy();
      v11 = v9;
      v3 = v20;
      MEMORY[0x22E318218](v11, -1, -1);
      MEMORY[0x22E318218](v8, -1, -1);

    }
    else
    {

    }
    v12 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
    swift_beginAccess();
    v13 = *v12;
    if (*v12)
    {
      objc_msgSend(v13, sel_setDelegate_, 0);
      v13 = *v12;
    }
    objc_msgSend(v13, sel_invalidate, v20, v21);
    v14 = *v12;
    *v12 = 0;

    v1[v3] = 1;
    v15 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer;
    v16 = *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer];
    if (v16)
    {
      v17 = *(void **)(v16 + 16);
      swift_retain();
      objc_msgSend(v17, sel_invalidate);
      v18 = *(void **)(v16 + 16);
      *(_QWORD *)(v16 + 16) = 0;

      objc_msgSend(*(id *)(v16 + 88), sel_invalidate);
      v19 = *(void **)(v16 + 88);
      *(_QWORD *)(v16 + 88) = 0;
      swift_release();

    }
    *(_QWORD *)&v5[v15] = 0;
    return swift_release();
  }
  return result;
}

void sub_22D846F9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  id v9;

  sub_22D84B5EC();
  sub_22D84B5EC();
  sub_22D84B5EC();
  v8 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v8);

  objc_msgSend(a1, sel_setClientIdentity_, a6);
  v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneSpecification()), sel_init);
  objc_msgSend(a1, sel_setSpecification_, v9);

}

void sub_22D8470A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  type metadata accessor for ActivityMutableSceneSettings();
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = a1;
    objc_msgSend(v8, sel_setInterfaceOrientation_, 1);
    v10 = objc_msgSend((id)objc_opt_self(), sel_mainConfiguration);
    objc_msgSend(v8, sel_setDisplayConfiguration_, v10);

    swift_bridgeObjectRetain_n();
    v11 = objc_msgSend(v8, sel_otherSettings);
    swift_bridgeObjectRetain();
    v12 = sub_22D84B9AC();
    swift_beginAccess();
    objc_msgSend(v11, sel_setObject_forSetting_, v12, qword_255D97660);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    sub_22D84B340();
    sub_22D816680();
    v13 = (id)sub_22D84B454();
    v14 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v14, sel_setObject_forSetting_, v13, qword_255D97698);

    v15 = a5;
    v16 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v16, sel_setObject_forSetting_, v15, qword_255D976B0);

  }
}

void sub_22D8472D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  SEL *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char *v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  id v27;
  char *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36[3];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E31826C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (id *)(v2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
    swift_beginAccess();
    if (*v4)
    {
      v5 = objc_msgSend(*v4, sel_clientSettings);
      if (v5)
      {
        v6 = v5;
        type metadata accessor for ActivitySceneClientSettings();
        v7 = swift_dynamicCastClass();
        if (v7)
        {
          v8 = (void *)v7;
          if (qword_2540C5F08 != -1)
            swift_once();
          v9 = sub_22D84B49C();
          __swift_project_value_buffer(v9, (uint64_t)qword_2540C5EE8);
          v10 = v6;
          v11 = v3;
          v12 = sub_22D84B484();
          v13 = sub_22D84B6C4();
          v14 = (SEL *)&unk_24F956000;
          if (!os_log_type_enabled(v12, v13))
          {

            goto LABEL_21;
          }
          v32 = v10;
          v15 = swift_slowAlloc();
          v30 = (_QWORD *)swift_slowAlloc();
          v31 = swift_slowAlloc();
          v36[0] = v31;
          *(_DWORD *)v15 = 136446466;
          v17 = *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
          v16 = *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier
                              + 8];
          swift_bridgeObjectRetain();
          *(_QWORD *)&v34 = sub_22D83157C(v17, v16, v36);
          sub_22D84B79C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 2114;
          v18 = objc_msgSend(v8, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v18, sel_objectForSetting_, qword_255D97140))
          {
            sub_22D84B7C0();
            swift_unknownObjectRelease();
            sub_22D81CE70(v33, &v34);
          }
          else
          {
            v34 = 0u;
            v35 = 0u;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
          sub_22D819F60(0, (unint64_t *)&qword_2540C6350);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v19 = v37;

            if (v19)
            {
              *(_QWORD *)&v34 = v19;
              sub_22D84B79C();
LABEL_20:
              v10 = v32;
              *v30 = v19;

              _os_log_impl(&dword_22D80B000, v12, v13, "[%{public}s] ClientSetting[contentPayloadID] did change to: %{public}@", (uint8_t *)v15, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2540C5FD8);
              swift_arrayDestroy();
              MEMORY[0x22E318218](v30, -1, -1);
              swift_arrayDestroy();
              MEMORY[0x22E318218](v31, -1, -1);
              MEMORY[0x22E318218](v15, -1, -1);

              v14 = (SEL *)&unk_24F956000;
LABEL_21:
              v20 = objc_msgSend(v8, sel_otherSettings, v30);
              swift_beginAccess();
              if (objc_msgSend(v20, v14[223], qword_255D97140))
              {
                sub_22D84B7C0();
                swift_unknownObjectRelease();
                sub_22D81CE70(v33, &v34);
              }
              else
              {
                v34 = 0u;
                v35 = 0u;
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6360);
              sub_22D819F60(0, (unint64_t *)&qword_2540C6350);
              if (swift_dynamicCast())
              {
                v21 = v37;

                v22 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                v23 = *(void **)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                if (v23)
                {
                  if (v21)
                  {
                    v24 = v21;
                    v25 = v23;
                    v26 = sub_22D84B76C();

                    if ((v26 & 1) != 0)
                    {

LABEL_37:
                      return;
                    }
                    v23 = *(void **)v22;
                  }
                }
                else
                {
                  if (!v21)
                    goto LABEL_37;
                  v23 = 0;
                }
              }
              else
              {
                v37 = 0;

                v22 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                v23 = *(void **)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                if (!v23)
                  goto LABEL_37;
                v21 = 0;
              }
              *(_QWORD *)v22 = v21;
              v27 = v21;

              v28 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate];
              swift_beginAccess();
              v29 = (void *)MEMORY[0x22E31826C](v28);
              if (v29)
              {
                objc_msgSend(v29, sel_activitySystemApertureWithSceneHandle_updatedContentPayloadID_, v11, *(_QWORD *)v22);

                swift_unknownObjectRelease();
                return;
              }

              goto LABEL_37;
            }
          }
          else
          {
            v37 = 0;

          }
          *(_QWORD *)&v34 = 0;
          sub_22D84B79C();
          v19 = 0;
          goto LABEL_20;
        }

      }
    }

  }
}

id ActivitySystemApertureSceneHandle.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivitySystemApertureSceneHandle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivitySystemApertureSceneHandle.sceneDidActivate(_:)()
{
  sub_22D848AE0("[%{public}s] Scene did activate.");
}

void ActivitySystemApertureSceneHandle.sceneDidInvalidate(_:)()
{
  sub_22D848AE0("[%{public}s] Scene did invalidate");
}

void ActivitySystemApertureSceneHandle.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  char *v2;
  char *v3;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void **v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50[3];
  uint64_t v51[3];

  v3 = v2;
  if (a2)
  {
    v6 = a2;
    if (qword_255D963A8 != -1)
      swift_once();
    v7 = sub_22D84B49C();
    __swift_project_value_buffer(v7, (uint64_t)qword_255D96388);
    v8 = a2;
    v9 = a2;
    v10 = v2;
    v11 = sub_22D84B484();
    v12 = sub_22D84B6C4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v51[0] = v14;
      *(_DWORD *)v13 = 136446466;
      v15 = a1;
      v17 = *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
      v16 = *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
      swift_bridgeObjectRetain();
      sub_22D83157C(v17, v16, v51);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      v18 = sub_22D84B9E8();
      v50[0] = sub_22D83157C(v18, v19, v51);
      a1 = v15;
      v3 = v2;
      sub_22D84B79C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22D80B000, v11, v12, "[%{public}s] Scene did deactivate with error: %{public}s.", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v14, -1, -1);
      MEMORY[0x22E318218](v13, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_255D963A8 != -1)
      swift_once();
    v20 = sub_22D84B49C();
    __swift_project_value_buffer(v20, (uint64_t)qword_255D96388);
    v21 = v2;
    v22 = sub_22D84B484();
    v23 = sub_22D84B6C4();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v51[0] = v25;
      *(_DWORD *)v24 = 136446210;
      v49 = v3;
      v26 = a1;
      v27 = *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
      v28 = *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
      swift_bridgeObjectRetain();
      v50[0] = sub_22D83157C(v27, v28, v51);
      sub_22D84B79C();

      a1 = v26;
      v3 = v49;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v22, v23, "[%{public}s] Scene did deactivate.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v25, -1, -1);
      MEMORY[0x22E318218](v24, -1, -1);

    }
    else
    {

    }
  }
  v29 = (void **)&v3[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
  swift_beginAccess();
  v30 = *v29;
  if (v30)
  {
    sub_22D819F60(0, (unint64_t *)&qword_2540C5FD0);
    v31 = v30;
    if ((sub_22D84B76C() & 1) == 0)
    {
LABEL_18:

      return;
    }
    v32 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer;
    if (*(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer])
      goto LABEL_17;
    sub_22D84B850();
    swift_bridgeObjectRelease();
    v50[0] = 0xD000000000000022;
    v50[1] = 0x800000022D853CD0;
    swift_bridgeObjectRetain();
    sub_22D84B5EC();
    swift_bridgeObjectRelease();
    sub_22D819F60(0, &qword_2540C5F80);
    v33 = sub_22D84B70C();
    v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = v34;
    *(_QWORD *)(v35 + 24) = a1;
    type metadata accessor for BackOffTimer();
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = 0;
    *(_QWORD *)(v36 + 24) = 0;
    *(_BYTE *)(v36 + 80) = 1;
    *(_QWORD *)(v36 + 88) = 0;
    *(_QWORD *)(v36 + 32) = 0xD000000000000022;
    *(_QWORD *)(v36 + 40) = 0x800000022D853CD0;
    *(_QWORD *)(v36 + 48) = v33;
    *(_QWORD *)(v36 + 56) = sub_22D848CF8;
    *(_QWORD *)(v36 + 64) = v35;
    *(_QWORD *)(v36 + 72) = 0;
    *(_QWORD *)&v3[v32] = v36;
    v37 = a1;
    swift_release();
    v38 = *(_QWORD *)&v3[v32];
    if (v38)
    {
      *(_QWORD *)(v38 + 72) = 0x4046800000000000;
      *(_BYTE *)(v38 + 80) = 0;
      if (*(_QWORD *)&v3[v32])
      {
LABEL_17:
        swift_retain();
        sub_22D81D9A8();
        swift_release();
        goto LABEL_18;
      }
    }
    __break(1u);
  }
  else
  {
    if (qword_255D963A8 != -1)
      swift_once();
    v39 = sub_22D84B49C();
    __swift_project_value_buffer(v39, (uint64_t)qword_255D96388);
    v40 = a1;
    v41 = sub_22D84B484();
    v42 = sub_22D84B6D0();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v50[0] = v44;
      *(_DWORD *)v43 = 136315138;
      v45 = objc_msgSend(v40, sel_identifier);
      v46 = sub_22D84B5C8();
      v48 = v47;

      v50[2] = sub_22D83157C(v46, v48, v50);
      sub_22D84B79C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D80B000, v41, v42, "No system aperture activity scene found: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v44, -1, -1);
      MEMORY[0x22E318218](v43, -1, -1);

    }
    else
    {

    }
  }
}

void sub_22D8480F8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E31826C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(a2, sel_settings);
    v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((_BYTE *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated) & 1) == 0
      && v7)
    {
      if (qword_255D963A8 != -1)
        swift_once();
      v8 = sub_22D84B49C();
      __swift_project_value_buffer(v8, (uint64_t)qword_255D96388);
      v9 = v5;
      v10 = sub_22D84B484();
      v11 = sub_22D84B6DC();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        v19 = v13;
        *(_DWORD *)v12 = 136315138;
        v15 = *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
        v14 = *(_QWORD *)&v9[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
        swift_bridgeObjectRetain();
        v18 = sub_22D83157C(v15, v14, &v19);
        sub_22D84B79C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D80B000, v10, v11, "[%s] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E318218](v13, -1, -1);
        MEMORY[0x22E318218](v12, -1, -1);

        objc_msgSend(a2, sel_activateWithTransitionContext_, 0, v12 + 4, v18, v19);
      }
      else
      {

        objc_msgSend(a2, sel_activateWithTransitionContext_, 0, v16, v17, v19);
      }
    }

  }
}

void ActivitySystemApertureSceneHandle.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  sub_22D848D00(a2);
}

id ActivitySystemApertureSceneHandle.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)(uint64_t a1, uint64_t a2)
{
  return sub_22D8494A0(a2);
}

void sub_22D8484A4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_22D84B79C();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_22D848554(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t aBlock;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;

  v56 = a5;
  v57 = a6;
  v10 = sub_22D84B340();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255D963A8 != -1)
    swift_once();
  v13 = sub_22D84B49C();
  __swift_project_value_buffer(v13, (uint64_t)qword_255D96388);
  v14 = sub_22D84B484();
  v15 = sub_22D84B6DC();
  v16 = os_log_type_enabled(v14, v15);
  v55 = v10;
  if (v16)
  {
    v17 = a2;
    v18 = v11;
    v19 = a4;
    v20 = v12;
    v21 = a1;
    v22 = a3;
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_22D80B000, v14, v15, "Creating activity system aperture scene", v23, 2u);
    v24 = v23;
    a3 = v22;
    a1 = v21;
    v12 = v20;
    a4 = v19;
    v11 = v18;
    a2 = v17;
    MEMORY[0x22E318218](v24, -1, -1);
  }

  v25 = sub_22D817EC4(a1, a2);
  if (!v25)
    goto LABEL_11;
  v26 = v25;
  v52 = a3;
  v53 = a4;
  v27 = sub_22D84B334();
  a1 = v28;
  v29 = (void *)objc_opt_self();
  v51 = v26;
  v30 = objc_msgSend(v29, sel_identityForProcessIdentity_, v26);
  if (qword_255D962E8 != -1)
    swift_once();
  v31 = (void *)qword_255D962E0;
  v32 = (_QWORD *)swift_allocObject();
  v32[2] = v27;
  v32[3] = a1;
  v33 = v57;
  v32[4] = v56;
  v32[5] = v33;
  v32[6] = v30;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_22D8499A8;
  *(_QWORD *)(v34 + 24) = v32;
  v62 = sub_22D8499C8;
  v63 = v34;
  aBlock = MEMORY[0x24BDAC760];
  v59 = 1107296256;
  v60 = sub_22D82D76C;
  v61 = &block_descriptor_21_0;
  v35 = _Block_copy(&aBlock);
  v56 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v36 = v30;
  swift_retain();
  swift_release();
  v37 = objc_msgSend(v31, sel_createScene_, v35);
  _Block_release(v35);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    a2 = (unint64_t)v54;
    v40 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v54, v52, v55);
    v41 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = v56;
    *(_QWORD *)(v42 + 24) = a1;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))(v42 + v41, a2, v40);
    v43 = v53;
    *(_QWORD *)(v42 + ((v12 + v41 + 7) & 0xFFFFFFFFFFFFFFF8)) = v53;
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = sub_22D849A60;
    *(_QWORD *)(v44 + 24) = v42;
    v62 = sub_22D833588;
    v63 = v44;
    aBlock = MEMORY[0x24BDAC760];
    v59 = 1107296256;
    v60 = sub_22D82DA44;
    v61 = &block_descriptor_30;
    v45 = _Block_copy(&aBlock);
    v46 = v43;
    swift_retain();
    swift_release();
    objc_msgSend(v37, sel_updateSettingsWithBlock_, v45);

    _Block_release(v45);
    LOBYTE(v45) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    swift_release();
    if ((v45 & 1) == 0)
      return (uint64_t)v37;
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain_n();
    v47 = sub_22D84B484();
    v48 = sub_22D84B6D0();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      aBlock = v50;
      *(_DWORD *)v49 = 136380675;
      swift_bridgeObjectRetain();
      v64 = sub_22D83157C(a1, a2, &aBlock);
      sub_22D84B79C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D80B000, v47, v48, "Couldn't create a system aperture scene with %{private}s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E318218](v50, -1, -1);
      MEMORY[0x22E318218](v49, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  __break(1u);
  return result;
}

void sub_22D848AE0(const char *a1)
{
  void *v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;

  if (qword_255D963A8 != -1)
    swift_once();
  v3 = sub_22D84B49C();
  __swift_project_value_buffer(v3, (uint64_t)qword_255D96388);
  v10 = v1;
  v4 = sub_22D84B484();
  v5 = sub_22D84B6C4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
    v9 = *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_22D83157C(v8, v9, &v11);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v4, v5, a1, v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v7, -1, -1);
    MEMORY[0x22E318218](v6, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_22D848CA8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22D848CCC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_22D848CF8()
{
  uint64_t v0;

  sub_22D8480F8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_22D848D00(uint64_t a1)
{
  NSObject *v1;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  int64_t v51;
  unint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68[6];

  if (qword_255D963A8 == -1)
    goto LABEL_2;
LABEL_74:
  swift_once();
LABEL_2:
  v3 = sub_22D84B49C();
  __swift_project_value_buffer(v3, (uint64_t)qword_255D96388);
  v4 = v1;
  swift_bridgeObjectRetain_n();
  v5 = v4;
  v1 = sub_22D84B484();
  v6 = sub_22D84B6DC();
  v61 = v5;
  if (os_log_type_enabled(v1, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v68[0] = v8;
    *(_DWORD *)v7 = 136446467;
    v9 = (char *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier;
    v10 = *(uint64_t *)((char *)&v5->isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier);
    v11 = *((_QWORD *)v9 + 1);
    swift_bridgeObjectRetain();
    sub_22D83157C(v10, v11, v68);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2081;
    sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    sub_22D833C04();
    swift_bridgeObjectRetain();
    v12 = sub_22D84B6A0();
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = v12;
    v5 = v61;
    v63 = sub_22D83157C(v15, v14, v68);
    sub_22D84B79C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v1, v6, "[%{public}s] Scene did receive actions: %{private}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v8, -1, -1);
    MEMORY[0x22E318218](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((*((_BYTE *)&v5->isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated) & 1) != 0)
    return;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22D84B7F0();
    v1 = sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    sub_22D833C04();
    sub_22D84B6AC();
    a1 = v63;
    v16 = v64;
    v17 = v65;
    v18 = v66;
    v19 = v67;
  }
  else
  {
    v20 = -1 << *(_BYTE *)(a1 + 32);
    v16 = a1 + 56;
    v21 = ~v20;
    v22 = -v20;
    if (v22 < 64)
      v23 = ~(-1 << v22);
    else
      v23 = -1;
    v19 = v23 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v17 = v21;
    v18 = 0;
  }
  v24 = (unint64_t)(v17 + 64) >> 6;
  v55 = v16;
  v56 = a1;
  v54 = v24;
  while ((a1 & 0x8000000000000000) == 0)
  {
    if (v19)
    {
      v1 = ((v19 - 1) & v19);
      v26 = __clz(__rbit64(v19)) | (v18 << 6);
      v27 = v18;
    }
    else
    {
      v29 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_73;
      if (v29 >= v24)
        goto LABEL_70;
      v30 = *(_QWORD *)(v16 + 8 * v29);
      v27 = v18 + 1;
      if (!v30)
      {
        v27 = v18 + 2;
        if (v18 + 2 >= v24)
          goto LABEL_70;
        v30 = *(_QWORD *)(v16 + 8 * v27);
        if (!v30)
        {
          v27 = v18 + 3;
          if (v18 + 3 >= v24)
            goto LABEL_70;
          v30 = *(_QWORD *)(v16 + 8 * v27);
          if (!v30)
          {
            v27 = v18 + 4;
            if (v18 + 4 >= v24)
              goto LABEL_70;
            v30 = *(_QWORD *)(v16 + 8 * v27);
            if (!v30)
            {
              v31 = v18 + 5;
              do
              {
                if (v24 == v31)
                  goto LABEL_70;
                v30 = *(_QWORD *)(v16 + 8 * v31++);
              }
              while (!v30);
              v27 = v31 - 1;
            }
          }
        }
      }
      v1 = ((v30 - 1) & v30);
      v26 = __clz(__rbit64(v30)) + (v27 << 6);
    }
    v28 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v26);
    if (!v28)
      goto LABEL_70;
LABEL_37:
    v59 = v27;
    objc_opt_self();
    v32 = swift_dynamicCastObjCClass();
    if (v32)
    {
      v33 = (void *)v32;
      v58 = v1;
      v34 = (char *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
      swift_beginAccess();
      v35 = v34;
      v1 = v58;
      v36 = MEMORY[0x22E31826C](v35);
      if (v36)
      {
        v37 = (void *)v36;
        v25 = v28;
        v38 = objc_msgSend(v33, sel_launchActions);
        if (v38)
        {
          v39 = v38;
          v57 = v25;
          sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
          sub_22D833C04();
          v40 = sub_22D84B694();

          if ((v40 & 0xC000000000000001) != 0)
          {
            sub_22D84B7F0();
            sub_22D84B6AC();
            v40 = v68[0];
            v60 = v68[1];
            v41 = v68[2];
            v42 = v68[3];
            v43 = v68[4];
          }
          else
          {
            v42 = 0;
            v44 = -1 << *(_BYTE *)(v40 + 32);
            v60 = v40 + 56;
            v41 = ~v44;
            v45 = -v44;
            if (v45 < 64)
              v46 = ~(-1 << v45);
            else
              v46 = -1;
            v43 = v46 & *(_QWORD *)(v40 + 56);
          }
          v1 = (v40 & 0x7FFFFFFFFFFFFFFFLL);
          v47 = (unint64_t)(v41 + 64) >> 6;
          if (v40 < 0)
            goto LABEL_50;
          while (1)
          {
            if (v43)
            {
              a1 = (v43 - 1) & v43;
              v48 = __clz(__rbit64(v43)) | (v42 << 6);
              v49 = v42;
            }
            else
            {
              v51 = v42 + 1;
              if (__OFADD__(v42, 1))
              {
                __break(1u);
LABEL_73:
                __break(1u);
                goto LABEL_74;
              }
              if (v51 >= v47)
                goto LABEL_13;
              v52 = *(_QWORD *)(v60 + 8 * v51);
              v49 = v42 + 1;
              if (!v52)
              {
                v49 = v42 + 2;
                if (v42 + 2 >= v47)
                  goto LABEL_13;
                v52 = *(_QWORD *)(v60 + 8 * v49);
                if (!v52)
                {
                  v49 = v42 + 3;
                  if (v42 + 3 >= v47)
                    goto LABEL_13;
                  v52 = *(_QWORD *)(v60 + 8 * v49);
                  if (!v52)
                  {
                    v49 = v42 + 4;
                    if (v42 + 4 >= v47)
                      goto LABEL_13;
                    v52 = *(_QWORD *)(v60 + 8 * v49);
                    if (!v52)
                    {
                      v53 = v42 + 5;
                      while (v47 != v53)
                      {
                        v52 = *(_QWORD *)(v60 + 8 * v53++);
                        if (v52)
                        {
                          v49 = v53 - 1;
                          goto LABEL_66;
                        }
                      }
LABEL_13:
                      sub_22D83555C();
                      v16 = v55;
                      a1 = v56;
                      v5 = v61;
                      v24 = v54;
                      v25 = v57;
LABEL_14:
                      swift_unknownObjectRelease();

                      v1 = v58;
                      goto LABEL_15;
                    }
                  }
                }
              }
LABEL_66:
              a1 = (v52 - 1) & v52;
              v48 = __clz(__rbit64(v52)) + (v49 << 6);
            }
            v50 = *(id *)(*(_QWORD *)(v40 + 48) + 8 * v48);
            if (!v50)
              goto LABEL_13;
            while (1)
            {
              objc_msgSend(v37, sel_activitySystemApertureWithSceneHandle_requestsLaunchWithAction_, v61, v50);

              v42 = v49;
              v43 = a1;
              if ((v40 & 0x8000000000000000) == 0)
                break;
LABEL_50:
              if (sub_22D84B814())
              {
                swift_unknownObjectRetain();
                swift_dynamicCast();
                v50 = v62;
                swift_unknownObjectRelease();
                v49 = v42;
                a1 = v43;
                if (v62)
                  continue;
              }
              goto LABEL_13;
            }
          }
        }
        objc_msgSend(v37, sel_activitySystemApertureWithSceneHandle_requestsLaunchWithAction_, v5, 0);
        goto LABEL_14;
      }
    }
LABEL_15:

    v18 = v59;
    v19 = (unint64_t)v1;
  }
  if (sub_22D84B814())
  {
    sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v28 = v62;
    swift_unknownObjectRelease();
    v27 = v18;
    v1 = v19;
    if (v62)
      goto LABEL_37;
  }
LABEL_70:
  sub_22D83555C();
}

id sub_22D8494A0(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  if (qword_255D963A8 != -1)
    swift_once();
  v3 = sub_22D84B49C();
  __swift_project_value_buffer(v3, (uint64_t)qword_255D96388);
  v4 = v1;
  v5 = sub_22D84B484();
  v6 = sub_22D84B6DC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
    v10 = *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
    swift_bridgeObjectRetain();
    v12 = sub_22D83157C(v9, v10, &v13);
    sub_22D84B79C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D80B000, v5, v6, "[%{public}s] Scene did receive new client settings.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E318218](v8, -1, -1);
    MEMORY[0x22E318218](v7, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v12, v13);
}

id sub_22D849668@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22D8496BC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22D849710@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  result = MEMORY[0x22E31826C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_22D849764()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_22D8497B8()
{
  return type metadata accessor for ActivitySystemApertureSceneHandle();
}

uint64_t sub_22D8497C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D84B340();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ActivitySystemApertureSceneHandle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.scene.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.descriptor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

void sub_22D849928()
{
  uint64_t v0;

  sub_22D8472D8(v0);
}

uint64_t sub_22D849930()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22D849974()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_22D8499A8(void *a1)
{
  uint64_t *v1;

  sub_22D846F9C(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_22D8499B8()
{
  return swift_deallocObject();
}

uint64_t sub_22D8499C8(uint64_t a1)
{
  uint64_t v1;

  return sub_22D82D74C(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_22D8499D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22D84B340();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_22D849A60(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_22D84B340() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_22D8470A0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_22D849AB4()
{
  return swift_deallocObject();
}

uint64_t SizeDimensionRequestType.description.getter(uint64_t a1)
{
  uint64_t result;

  if (a1 == 1)
    return 0x6465786966;
  if (!a1)
    return 0x63696D616E7964;
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

BOOL SizeDimensionRequestType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

double SizeDimensionRequest.minimum.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
}

double SizeDimensionRequest.maximum.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
}

uint64_t SizeDimensionRequest.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
}

uint64_t sub_22D849BC0(char a1)
{
  return *(_QWORD *)&aMinimum_3[8 * a1];
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  objc_class *v3;
  char *v7;
  double v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = 0.0;
  if (a2 > 0.0)
    v8 = a2;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v8;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = a1;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id SizeDimensionRequest.init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  char *v3;
  objc_super v5;

  if (a2 <= 0.0)
    a2 = 0.0;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = a2;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SizeDimensionRequest()
{
  return objc_opt_self();
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:)(double a1, double a2)
{
  objc_class *v2;

  return objc_msgSend(objc_allocWithZone(v2), sel_initWithMinimum_maximum_type_, 0, a1, a2);
}

id SizeDimensionRequest.init(minimum:maximum:)()
{
  void *v0;

  return objc_msgSend(v0, sel_initWithMinimum_maximum_type_, 0);
}

id sub_22D849DAC(double a1)
{
  objc_class *v2;
  char *v3;
  double v4;
  objc_super v6;

  v2 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = 0.0;
  if (a1 > 0.0)
    v4 = a1;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v4;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

double sub_22D849E2C(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  if (v2 == 1)
    return *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  result = 0.0;
  if (!v2)
  {
    result = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    if (result >= a1)
      result = a1;
    if (result <= *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum))
      return *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  }
  return result;
}

uint64_t sub_22D849EAC()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v2 = 39 * (uint64_t)v1;
  if ((unsigned __int128)((uint64_t)v1 * (__int128)39) >> 64 != v2 >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v3 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v4 = v2 * (uint64_t)v3;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)v3) >> 64 != v4 >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  if (v5 >= 1)
    v5 = 1;
  result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63)
    goto LABEL_21;
  return result;
}

BOOL sub_22D849FA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v5;
  _BYTE v6[24];
  uint64_t v7;

  sub_22D81410C(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for SizeDimensionRequest();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum) == *(double *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum]
        && *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) == *(double *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum])
      {
        v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
        v3 = *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type];

        return v2 == v3;
      }

    }
  }
  else
  {
    sub_22D814194((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_22D84A12C()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t result;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (!v1)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v2 = v1;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type) <= 1uLL)
  {
    v3 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
    v4 = (void *)sub_22D84B5BC();
    objc_msgSend(v2, sel_appendString_withName_, v3, v4);

    v5 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
    v6 = (void *)sub_22D84B5BC();

    v7 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    v8 = (void *)sub_22D84B5BC();

    v9 = objc_msgSend(v2, sel_build);
    if (v9)
    {
      v10 = v9;
      v11 = sub_22D84B5C8();

      return v11;
    }
    goto LABEL_6;
  }
LABEL_7:
  result = sub_22D84B9A0();
  __break(1u);
  return result;
}

id sub_22D84A30C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  double v8;
  id result;
  objc_super v10;

  v3 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  v6 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = 0.0;
  if (v3 > 0.0)
    v8 = v3;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v8;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v4;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  result = objc_msgSendSuper2(&v10, sel_init);
  a1[3] = v6;
  *a1 = result;
  return result;
}

uint64_t static SizeDimensionRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_22D84A424(void *a1)
{
  uint64_t v1;
  double v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  v4 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v4, v3);

  v5 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v6 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v6, v5);

  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  v8 = (id)sub_22D84B5BC();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v7, v8);

}

id SizeDimensionRequest.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D84A884(a1);

  return v4;
}

id SizeDimensionRequest.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_22D84A884(a1);

  return v2;
}

id SizeDimensionRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_22D84A9B0(a1);
  swift_unknownObjectRelease();
  return v4;
}

id SizeDimensionRequest.init(xpcDictionary:)(void *a1)
{
  id v1;

  v1 = sub_22D84A9B0(a1);
  swift_unknownObjectRelease();
  return v1;
}

void sub_22D84A6B8(void *a1)
{
  uint64_t v1;

  if (a1)
  {
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    xpc_dictionary_set_int64(a1, "type", *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type));
  }
}

id SizeDimensionRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SizeDimensionRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SizeDimensionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22D84A884(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v14;

  v3 = v1;
  v4 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v4);
  v6 = v5;

  v7 = 0.0;
  if (v6 > 0.0)
    v7 = v6;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v7;
  v8 = (void *)sub_22D84B5BC();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v8);
  v10 = v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v10;
  v11 = (void *)sub_22D84B5BC();
  v12 = objc_msgSend(a1, sel_decodeIntegerForKey_, v11);

  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = v12 != 0;
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_22D84A9B0(void *a1)
{
  void *v1;
  char *v3;
  double v4;
  id result;
  uint64_t v6;
  objc_super v7;

  v3 = v1;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  if (v4 <= 0.0)
    v4 = 0.0;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v4;
  result = (id)BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v6;
  if (a1)
  {
    *(_QWORD *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = xpc_dictionary_get_int64(a1, "type") != 0;

    v7.receiver = v3;
    v7.super_class = (Class)type metadata accessor for SizeDimensionRequest();
    return objc_msgSendSuper2(&v7, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_22D84AA74()
{
  unint64_t result;

  result = qword_255D97880;
  if (!qword_255D97880)
  {
    result = MEMORY[0x22E318194](&protocol conformance descriptor for SizeDimensionRequestType, &type metadata for SizeDimensionRequestType);
    atomic_store(result, (unint64_t *)&qword_255D97880);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeDimensionRequestType()
{
  return &type metadata for SizeDimensionRequestType;
}

uint64_t method lookup function for SizeDimensionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(minimum:maximum:type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static SizeDimensionRequest.fixed(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SizeDimensionRequest.resolveIfNecessary(intrinsicLength:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SizeDimensionRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

id ActivityAmbientHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  objc_class *v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  void (*v23)(char *, uint64_t);
  id v24;
  _QWORD v26[2];
  objc_super v27;

  v5 = v4;
  v10 = sub_22D84B340();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = objc_allocWithZone(v5);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, (uint64_t)a1, v10);
  v15 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v16 = (char *)objc_allocWithZone(v15);
  v17 = sub_22D84B334();
  v18 = (uint64_t *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v18 = v17;
  v18[1] = v19;
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 2;
  sub_22D816680();
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v14(&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v13, v10);
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v20 = &v16[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v20 = a3;
  *((_QWORD *)v20 + 1) = a4;
  v21 = a2;

  v27.receiver = v16;
  v27.super_class = v15;
  v22 = objc_msgSendSuper2(&v27, sel_init);
  v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v13, v10);
  v24 = ActivityHostViewController.init(activitySceneDescriptor:)(v22);

  v23(a1, v10);
  return v24;
}

id ActivityAmbientHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  objc_class *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  void (*v21)(char *, uint64_t);
  id v22;
  uint64_t v24;
  objc_super v25;

  v8 = sub_22D84B340();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, (uint64_t)a1, v8);
  v13 = (objc_class *)type metadata accessor for ActivitySceneDescriptor();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = sub_22D84B334();
  v16 = (uint64_t *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *v16 = v15;
  v16[1] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = 2;
  sub_22D816680();
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_22D84B454();
  v12(&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], (uint64_t)v11, v8);
  *(_QWORD *)&v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a2;
  v18 = &v14[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  v19 = a2;

  v25.receiver = v14;
  v25.super_class = v13;
  v20 = objc_msgSendSuper2(&v25, sel_init);
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v22 = ActivityHostViewController.init(activitySceneDescriptor:)(v20);

  v21(a1, v8);
  return v22;
}

id sub_22D84AFEC()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityAmbientSceneSpecification()), sel_init);
}

unint64_t sub_22D84B010()
{
  return 0xD000000000000011;
}

void ActivityAmbientHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActivityAmbientHostViewController.init(activitySceneDescriptor:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityAmbientHostViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAmbientHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientHostViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActivityAmbientHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAmbientHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1496))();
}

uint64_t sub_22D84B1F0()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_22D84B1FC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22D84B208()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22D84B214()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22D84B220()
{
  return MEMORY[0x24BDCC240]();
}

uint64_t sub_22D84B22C()
{
  return MEMORY[0x24BDCC248]();
}

uint64_t sub_22D84B238()
{
  return MEMORY[0x24BDCC250]();
}

uint64_t sub_22D84B244()
{
  return MEMORY[0x24BDCC258]();
}

uint64_t sub_22D84B250()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22D84B25C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22D84B268()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_22D84B274()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_22D84B280()
{
  return MEMORY[0x24BDCD778]();
}

uint64_t sub_22D84B28C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_22D84B298()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22D84B2A4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_22D84B2B0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22D84B2BC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_22D84B2C8()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_22D84B2D4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22D84B2E0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22D84B2EC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22D84B2F8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22D84B304()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22D84B310()
{
  return MEMORY[0x24BDB4778]();
}

uint64_t sub_22D84B31C()
{
  return MEMORY[0x24BDB4780]();
}

uint64_t sub_22D84B328()
{
  return MEMORY[0x24BDB4790]();
}

uint64_t sub_22D84B334()
{
  return MEMORY[0x24BDB4798]();
}

uint64_t sub_22D84B340()
{
  return MEMORY[0x24BDB47A8]();
}

uint64_t sub_22D84B34C()
{
  return MEMORY[0x24BDB4860]();
}

uint64_t sub_22D84B358()
{
  return MEMORY[0x24BDB4870]();
}

uint64_t sub_22D84B364()
{
  return MEMORY[0x24BDB48B0]();
}

uint64_t sub_22D84B370()
{
  return MEMORY[0x24BDB48E0]();
}

uint64_t sub_22D84B37C()
{
  return MEMORY[0x24BDB48E8]();
}

uint64_t sub_22D84B388()
{
  return MEMORY[0x24BDB4938]();
}

uint64_t sub_22D84B394()
{
  return MEMORY[0x24BDB4940]();
}

uint64_t sub_22D84B3A0()
{
  return MEMORY[0x24BDB4950]();
}

uint64_t sub_22D84B3AC()
{
  return MEMORY[0x24BDB4958]();
}

uint64_t sub_22D84B3B8()
{
  return MEMORY[0x24BDB4960]();
}

uint64_t sub_22D84B3C4()
{
  return MEMORY[0x24BDB4968]();
}

uint64_t sub_22D84B3D0()
{
  return MEMORY[0x24BDB4970]();
}

uint64_t sub_22D84B3DC()
{
  return MEMORY[0x24BDB4980]();
}

uint64_t sub_22D84B3E8()
{
  return MEMORY[0x24BDB4998]();
}

uint64_t sub_22D84B3F4()
{
  return MEMORY[0x24BDB49B0]();
}

uint64_t sub_22D84B400()
{
  return MEMORY[0x24BDB49C0]();
}

uint64_t sub_22D84B40C()
{
  return MEMORY[0x24BDB49D0]();
}

uint64_t sub_22D84B418()
{
  return MEMORY[0x24BDB49D8]();
}

uint64_t sub_22D84B424()
{
  return MEMORY[0x24BDB49F0]();
}

uint64_t sub_22D84B430()
{
  return MEMORY[0x24BDB4A00]();
}

uint64_t sub_22D84B43C()
{
  return MEMORY[0x24BDB4A10]();
}

uint64_t sub_22D84B448()
{
  return MEMORY[0x24BDB4A18]();
}

uint64_t sub_22D84B454()
{
  return MEMORY[0x24BDB4A20]();
}

uint64_t sub_22D84B460()
{
  return MEMORY[0x24BE85468]();
}

uint64_t sub_22D84B46C()
{
  return MEMORY[0x24BE85470]();
}

uint64_t sub_22D84B478()
{
  return MEMORY[0x24BE85478]();
}

uint64_t sub_22D84B484()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22D84B490()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22D84B49C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22D84B4A8()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_22D84B4B4()
{
  return MEMORY[0x24BDB9500]();
}

uint64_t sub_22D84B4C0()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_22D84B4CC()
{
  return MEMORY[0x24BDB99E0]();
}

uint64_t sub_22D84B4D8()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_22D84B4E4()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_22D84B4F0()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_22D84B4FC()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_22D84B508()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_22D84B514()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_22D84B520()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_22D84B52C()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_22D84B538()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_22D84B544()
{
  return MEMORY[0x24BDBA0C8]();
}

uint64_t sub_22D84B550()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22D84B55C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22D84B568()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22D84B574()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_22D84B580()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_22D84B58C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22D84B598()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22D84B5A4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22D84B5B0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D84B5BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D84B5C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D84B5D4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22D84B5E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D84B5EC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D84B5F8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D84B604()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_22D84B610()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_22D84B61C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_22D84B628()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22D84B634()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22D84B640()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D84B64C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22D84B658()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D84B664()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22D84B670()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22D84B67C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_22D84B688()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_22D84B694()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_22D84B6A0()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_22D84B6AC()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_22D84B6B8()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t sub_22D84B6C4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22D84B6D0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22D84B6DC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22D84B6E8()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_22D84B6F4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22D84B700()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22D84B70C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22D84B718()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22D84B724()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22D84B730()
{
  return MEMORY[0x24BDB4A28]();
}

uint64_t sub_22D84B73C()
{
  return MEMORY[0x24BDD00F0]();
}

uint64_t sub_22D84B748()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_22D84B754()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_22D84B760()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22D84B76C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D84B778()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_22D84B784()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_22D84B790()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D84B79C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22D84B7A8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22D84B7B4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22D84B7C0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22D84B7CC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22D84B7D8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22D84B7E4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_22D84B7F0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22D84B7FC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_22D84B808()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_22D84B814()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22D84B820()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22D84B82C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22D84B838()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_22D84B844()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22D84B850()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D84B85C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D84B868()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D84B874()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D84B880()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22D84B88C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_22D84B898()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_22D84B8A4()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_22D84B8B0()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_22D84B8BC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22D84B8C8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22D84B8D4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D84B8E0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22D84B8EC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22D84B8F8()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_22D84B904()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22D84B910()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22D84B91C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22D84B928()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22D84B934()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_22D84B940()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22D84B94C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22D84B958()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_22D84B964()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22D84B970()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22D84B97C()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_22D84B988()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22D84B994()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D84B9A0()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_22D84B9AC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22D84B9B8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22D84B9C4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22D84B9D0()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_22D84B9DC()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_22D84B9E8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22D84B9F4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22D84BA00()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22D84BA0C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22D84BA18()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22D84BA24()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_22D84BA30()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D84BA3C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D84BA48()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22D84BA54()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_22D84BA60()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_22D84BA6C()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_22D84BA78()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22D84BA84()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_22D84BA90()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t sub_22D84BA9C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22D84BAA8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22D84BAB4()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t sub_22D84BAC0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22D84BACC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_22D84BAD8()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x24BE0B640]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAF0]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAF8]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB08]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB10]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB18]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x24BE0BBA8]();
}

uint64_t BSIsSymbolicLinkAtPath()
{
  return MEMORY[0x24BE0BC58]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCE0]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCE8]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCF8]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BD00]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BD08]();
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x24BDBF138]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x24BDAE028](workloop, frequency);
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x24BDAE040]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

