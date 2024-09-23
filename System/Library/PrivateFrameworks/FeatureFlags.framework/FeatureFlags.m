unint64_t isFeatureEnabled(_:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  char v6;
  char v7;
  _QWORD v8[8];
  _BYTE v9[9];

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v8[2] = a1;
  v8[6] = sub_229111C34;
  v8[7] = v8;
  if ((v6 & 1) == 0)
  {
    if (result)
    {
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        sub_229111C34(result, v9);
        v7 = v9[0];
        return v7 & 1;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(result))
    goto LABEL_11;
  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u)
    {
      v7 = sub_229111D5C(result, (void (*)(unsigned __int8 *__return_ptr, uint64_t *))sub_229111D58);
      return v7 & 1;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

unint64_t sub_229111C34@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  uint64_t v9;
  char v10;

  v5 = *(_QWORD **)(v2 + 16);
  v6 = v5[3];
  v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  if ((v10 & 1) == 0)
  {
    if (result)
    {
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        result = _swift_os_feature_enabled_impl(a1, result);
LABEL_9:
        *a2 = result & 1;
        return result;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(result))
    goto LABEL_11;
  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u)
    {
      result = sub_229111D5C(result, (void (*)(unsigned __int8 *__return_ptr, uint64_t *))sub_229111D58);
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t dispatch thunk of FeatureFlagsKey.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureFlagsKey.feature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_229111D5C(unsigned int a1, void (*a2)(unsigned __int8 *__return_ptr, uint64_t *))
{
  unsigned int v2;
  int v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  uint64_t v8;

  if (a1 > 0x7F)
  {
    v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      v2 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1))
        v2 = v6;
    }
    else
    {
      v2 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    v2 = a1 + 1;
  }
  v8 = (v2 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v2) >> 3))));
  a2(&v7, &v8);
  return v7;
}

uint64_t sub_229111E40@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = _swift_os_feature_enabled_impl(*(_QWORD *)(v2 + 16), a1);
  *a2 = result;
  return result;
}

_QWORD *sub_229111E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;

  if (a1)
  {
    if (a2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v3 + 16))(&v6);
      *a3 = v6;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return (_QWORD *)_os_feature_enabled_impl();
}

