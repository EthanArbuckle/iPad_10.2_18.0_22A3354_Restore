uint64_t sub_1BC7EEF58(uint64_t a1)
{
  uint64_t v2;

  sub_1BC745A20(0, (unint64_t *)&qword_1ED6B63C0, &qword_1ED6B7C78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BC7EEFAC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B86A0)
  {
    sub_1BC6ECA64(255, &qword_1ED6B6320, (uint64_t (*)(uint64_t))type metadata accessor for CachingSharedSummaryTransactionBuilder, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_1BC818340();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B86A0);
  }
}

uint64_t sub_1BC7EF028()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC7EF054()
{
  uint64_t v0;

  return sub_1BC7ED5C0(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_destroy_helper_27()
{
  return swift_release();
}

unint64_t sub_1BC7EF064()
{
  unint64_t result;

  result = qword_1EF45CF80;
  if (!qword_1EF45CF80)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Context.Errors, &type metadata for HealthPlatformContextProvider.Context.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45CF80);
  }
  return result;
}

uint64_t sub_1BC7EF0A8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC7EF0EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC7EF128(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int v10;

  if (a1 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v4 = sub_1BC8184E4();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v5 = 4;
      do
      {
        v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v7 = MEMORY[0x1BCCF4FB0](v5 - 4, a1);
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
            goto LABEL_13;
        }
        else
        {
          v7 = *(_QWORD *)(a1 + 8 * v5);
          swift_retain();
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(*(id *)(v7 + 16), sel_profileIdentifier);
        v10 = objc_msgSend(v9, sel_isEqual_, a2);

        if (v10)
        {
          swift_bridgeObjectRelease();
          return v7;
        }
        swift_release();
        ++v5;
      }
      while (v8 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1BC7EF278(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;

  v2 = a1;
  v24 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_29;
  for (i = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = sub_1BC8184E4())
  {
    v4 = 0;
    v21 = v2 & 0xFFFFFFFFFFFFFF8;
    v22 = v2 & 0xC000000000000001;
    v19 = v2;
    v20 = v2 + 32;
    v18 = i;
    while (1)
    {
      if (v22)
      {
        v5 = (id)MEMORY[0x1BCCF4FB0](v4, v2);
      }
      else
      {
        if (v4 >= *(_QWORD *)(v21 + 16))
          goto LABEL_27;
        v5 = *(id *)(v20 + 8 * v4);
      }
      v6 = v5;
      if (__OFADD__(v4++, 1))
        break;
      v8 = *(_QWORD *)(a2 + 16);
      if (v8 >> 62)
      {
        swift_bridgeObjectRetain_n();
        v16 = v6;
        v9 = sub_1BC8184E4();
        if (v9)
        {
LABEL_12:
          v11 = 4;
          do
          {
            v2 = v11 - 4;
            if ((v8 & 0xC000000000000001) != 0)
            {
              v12 = MEMORY[0x1BCCF4FB0](v11 - 4, v8);
              v13 = v11 - 3;
              if (__OFADD__(v2, 1))
                goto LABEL_26;
            }
            else
            {
              v12 = *(_QWORD *)(v8 + 8 * v11);
              swift_retain();
              v13 = v11 - 3;
              if (__OFADD__(v2, 1))
              {
LABEL_26:
                __break(1u);
LABEL_27:
                __break(1u);
                goto LABEL_28;
              }
            }
            v14 = objc_msgSend(*(id *)(v12 + 16), sel_profileIdentifier);
            v15 = objc_msgSend(v14, sel_isEqual_, v6);
            swift_release();

            if (v15)
            {

              swift_bridgeObjectRelease_n();
              goto LABEL_5;
            }
            ++v11;
          }
          while (v13 != v9);
        }
      }
      else
      {
        v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        v10 = v6;
        if (v9)
          goto LABEL_12;
      }

      swift_bridgeObjectRelease_n();
      sub_1BC818358();
      sub_1BC818388();
      sub_1BC818394();
      sub_1BC818364();
LABEL_5:
      v2 = v19;
      if (v4 == v18)
        return v24;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    ;
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1BC7EF4D8(unint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_37;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    v21 = v3 + 32;
    v22 = v3 & 0xC000000000000001;
    v23 = a2 & 0xC000000000000001;
    v19 = v4;
    v20 = v3;
    while (1)
    {
      if (v22)
      {
        v6 = MEMORY[0x1BCCF4FB0](v5, v3);
      }
      else
      {
        v6 = *(_QWORD *)(v21 + 8 * v5);
        swift_retain();
      }
      v7 = objc_msgSend(*(id *)(v6 + 16), sel_profileIdentifier);
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        v8 = sub_1BC8184E4();
        if (!v8)
          goto LABEL_32;
      }
      else
      {
        v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v8)
          goto LABEL_32;
      }
      v9 = v23 ? (id)MEMORY[0x1BCCF4FB0](0, a2) : *(id *)(a2 + 32);
      v10 = v9;
      sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1E0);
      v11 = sub_1BC8180D0();

      if ((v11 & 1) == 0)
        break;

      swift_bridgeObjectRelease();
LABEL_28:
      swift_release();
      if (__OFADD__(v5++, 1))
        goto LABEL_36;
      if (v5 == v4)
        return 0;
    }
    if (v8 == 1)
    {
LABEL_32:

      swift_bridgeObjectRelease();
      swift_release();
      return v5;
    }
    if (v23)
    {
      v12 = 1;
      while (1)
      {
        MEMORY[0x1BCCF4FB0](v12, a2);
        v13 = v12 + 1;
        if (__OFADD__(v12, 1))
          break;
        v3 = sub_1BC8180D0();
        swift_unknownObjectRelease();
        if ((v3 & 1) != 0)
          goto LABEL_27;
        ++v12;
        if (v13 == v8)
          goto LABEL_32;
      }
      __break(1u);
    }
    else
    {
      v3 = 5;
      while (1)
      {
        v14 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
          break;
        v15 = *(id *)(a2 + 8 * v3);
        v16 = sub_1BC8180D0();

        if ((v16 & 1) != 0)
        {
LABEL_27:

          swift_bridgeObjectRelease();
          v4 = v19;
          v3 = v20;
          goto LABEL_28;
        }
        ++v3;
        if (v14 == v8)
          goto LABEL_32;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v4 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  return 0;
}

char *sub_1BC7EF7A8(_QWORD *a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  char *v6;
  char v7;
  char v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  char v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v5 = swift_bridgeObjectRetain();
  v6 = (char *)sub_1BC7EF4D8(v5, a2);
  v8 = v7;
  v9 = v2;
  swift_bridgeObjectRelease();
  if (v2)
    return v6;
  if ((v8 & 1) == 0)
  {
    v10 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_81;
    if (*a1 >> 62)
    {
LABEL_82:
      swift_bridgeObjectRetain();
      v30 = sub_1BC8184E4();
      swift_bridgeObjectRelease();
      if (v10 != (char *)v30)
        goto LABEL_6;
    }
    else if (v10 != *(char **)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      v33 = a2 & 0xFFFFFFFFFFFFFF8;
      v34 = a1;
      v32 = v9;
      v35 = a2 & 0xC000000000000001;
      v36 = a2 >> 62;
      v38 = a2;
      while (1)
      {
        v11 = *a1;
        v37 = (unint64_t)v6;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v28 = MEMORY[0x1BCCF4FB0](v10);
        }
        else
        {
          if (((unint64_t)v10 & 0x8000000000000000) != 0)
            goto LABEL_70;
          if ((unint64_t)v10 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_71;
          v28 = *(_QWORD *)(v11 + 8 * (_QWORD)v10 + 32);
          swift_retain();
        }
        v6 = (char *)objc_msgSend(*(id *)(v28 + 16), sel_profileIdentifier);
        if (v36)
        {
          swift_bridgeObjectRetain();
          v12 = sub_1BC8184E4();
          if (!v12)
          {
LABEL_19:
            swift_release();

            swift_bridgeObjectRelease();
LABEL_35:
            v6 = (char *)v37;
            goto LABEL_57;
          }
        }
        else
        {
          v12 = *(_QWORD *)(v33 + 16);
          swift_bridgeObjectRetain();
          if (!v12)
            goto LABEL_19;
        }
        if (v35)
          v13 = (id)MEMORY[0x1BCCF4FB0](0, a2);
        else
          v13 = *(id *)(a2 + 32);
        v14 = v13;
        a1 = (_QWORD *)sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1E0);
        v15 = sub_1BC8180D0();

        if ((v15 & 1) == 0)
        {
          if (v12 != 1)
          {
            if (v35)
            {
              v16 = 1;
              while (1)
              {
                MEMORY[0x1BCCF4FB0](v16, a2);
                v9 = v16 + 1;
                if (__OFADD__(v16, 1))
                  break;
                v17 = sub_1BC8180D0();
                swift_unknownObjectRelease();
                if ((v17 & 1) != 0)
                  goto LABEL_36;
                ++v16;
                a2 = v38;
                if (v9 == v12)
                {
                  swift_release();

                  goto LABEL_33;
                }
              }
              __break(1u);
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
LABEL_72:
              __break(1u);
              goto LABEL_73;
            }
            a2 = 5;
            while (1)
            {
              v9 = a2 - 3;
              if (__OFADD__(a2 - 4, 1))
                break;
              v18 = *(id *)(v38 + 8 * a2);
              v19 = sub_1BC8180D0();

              if ((v19 & 1) != 0)
              {
LABEL_36:

                a2 = v38;
                swift_bridgeObjectRelease();
                v9 = v32;
                goto LABEL_37;
              }
              ++a2;
              if (v9 == v12)
              {
                swift_release();

                a2 = v38;
LABEL_33:
                swift_bridgeObjectRelease();
                v9 = v32;
                goto LABEL_34;
              }
            }
LABEL_73:
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }
          swift_release();

          swift_bridgeObjectRelease();
LABEL_34:
          a1 = v34;
          goto LABEL_35;
        }

        swift_bridgeObjectRelease();
LABEL_37:
        swift_release();
        v6 = (char *)v37;
        a1 = v34;
        if ((char *)v37 != v10)
          break;
LABEL_56:
        v6 = (char *)(v37 + 1);
        if (__OFADD__(v37, 1))
          goto LABEL_74;
LABEL_57:
        if (__OFADD__(v10++, 1))
          goto LABEL_72;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v27 = sub_1BC8184E4();
          swift_bridgeObjectRelease();
        }
        else
        {
          v27 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v10 == (char *)v27)
          return v6;
      }
      v20 = *v34;
      if ((*v34 & 0xC000000000000001) != 0)
      {
        v21 = MEMORY[0x1BCCF4FB0](v37, *v34);
        v20 = *v34;
        if ((*v34 & 0xC000000000000001) == 0)
        {
LABEL_42:
          if (((unint64_t)v10 & 0x8000000000000000) != 0)
            goto LABEL_77;
          if ((unint64_t)v10 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_78;
          v22 = *(_QWORD *)(v20 + 8 * (_QWORD)v10 + 32);
          swift_retain();
          goto LABEL_45;
        }
      }
      else
      {
        if ((v37 & 0x8000000000000000) != 0)
          goto LABEL_75;
        if (v37 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_76;
        v21 = *(_QWORD *)(v20 + 8 * v37 + 32);
        swift_retain();
        if ((v20 & 0xC000000000000001) == 0)
          goto LABEL_42;
      }
      v22 = MEMORY[0x1BCCF4FB0](v10, v20);
      v20 = *v34;
LABEL_45:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *v34 = v20;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v20 < 0 || (v20 & 0x4000000000000000) != 0)
        sub_1BC7523CC(v20);
      *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v37 + 0x20) = v22;
      swift_release();
      sub_1BC817C74();
      v24 = *v34;
      v25 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *v34 = v24;
      if (!v25 || v24 < 0 || (v24 & 0x4000000000000000) != 0)
        sub_1BC7523CC(v24);
      if (((unint64_t)v10 & 0x8000000000000000) != 0)
        goto LABEL_79;
      if ((unint64_t)v10 >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_80;
      *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * (_QWORD)v10 + 0x20) = v21;
      swift_release();
      sub_1BC817C74();
      goto LABEL_56;
    }
    return v6;
  }
  if (!(*a1 >> 62))
    return *(char **)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v31 = sub_1BC8184E4();
  swift_bridgeObjectRelease();
  return (char *)v31;
}

unint64_t sub_1BC7EFCC0()
{
  unint64_t result;

  result = qword_1EF45CF98;
  if (!qword_1EF45CF98)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC822C9C, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45CF98);
  }
  return result;
}

void sub_1BC7EFD04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BC7EFCC0();
    v7 = a3(a1, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BC7EFD60()
{
  unint64_t result;

  result = qword_1EF45CFB8;
  if (!qword_1EF45CFB8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Errors, &type metadata for HealthPlatformContextProvider.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45CFB8);
  }
  return result;
}

unint64_t sub_1BC7EFDA8()
{
  unint64_t result;

  result = qword_1EF45CFC0;
  if (!qword_1EF45CFC0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Errors, &type metadata for HealthPlatformContextProvider.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45CFC0);
  }
  return result;
}

unint64_t sub_1BC7EFDF0()
{
  unint64_t result;

  result = qword_1EF45CFC8;
  if (!qword_1EF45CFC8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Context.Errors, &type metadata for HealthPlatformContextProvider.Context.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45CFC8);
  }
  return result;
}

unint64_t sub_1BC7EFE38()
{
  unint64_t result;

  result = qword_1EF45CFD0;
  if (!qword_1EF45CFD0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Context.Description, &type metadata for HealthPlatformContextProvider.Context.Description);
    atomic_store(result, (unint64_t *)&qword_1EF45CFD0);
  }
  return result;
}

unint64_t sub_1BC7EFE80()
{
  unint64_t result;

  result = qword_1EF45CFD8;
  if (!qword_1EF45CFD8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Context.Description, &type metadata for HealthPlatformContextProvider.Context.Description);
    atomic_store(result, (unint64_t *)&qword_1EF45CFD8);
  }
  return result;
}

uint64_t sub_1BC7EFEC4(uint64_t a1)
{
  uint64_t result;

  result = sub_1BC6E1788((unint64_t *)&unk_1ED6B7D00, type metadata accessor for HealthPlatformContextProvider.Context, (uint64_t)&protocol conformance descriptor for HealthPlatformContextProvider.Context);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for HealthPlatformContextProvider.Context(uint64_t a1)
{
  return sub_1BC738C70(a1, qword_1ED6B7D10);
}

uint64_t sub_1BC7EFF14()
{
  return sub_1BC6E1788(&qword_1ED6B7CE8, type metadata accessor for HealthPlatformContextProvider.Context, (uint64_t)&protocol conformance descriptor for HealthPlatformContextProvider.Context);
}

uint64_t sub_1BC7EFF40(uint64_t a1)
{
  uint64_t result;

  result = sub_1BC6E1788(&qword_1ED6B7CE8, type metadata accessor for HealthPlatformContextProvider.Context, (uint64_t)&protocol conformance descriptor for HealthPlatformContextProvider.Context);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1BC7EFF7C()
{
  return sub_1BC6E1788((unint64_t *)&unk_1ED6B7CF0, type metadata accessor for HealthPlatformContextProvider.Context, (uint64_t)&protocol conformance descriptor for HealthPlatformContextProvider.Context);
}

unint64_t sub_1BC7EFFAC()
{
  unint64_t result;

  result = qword_1EF45CFE8;
  if (!qword_1EF45CFE8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthPlatformContextProvider.Context.Description, &type metadata for HealthPlatformContextProvider.Context.Description);
    atomic_store(result, (unint64_t *)&qword_1EF45CFE8);
  }
  return result;
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.feedItemStorage(for:scope:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.anchorStorage(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.notificationManager(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.sharedSummaryTransactionBuilder(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.sharingSummaryProfileTransactionBuilder(transaction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ProfileStore.add(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of ProfileStore.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ProfileStore.fetchAllProfiles(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1BC7F0060()
{
  return type metadata accessor for HealthPlatformContextProvider(0);
}

uint64_t type metadata accessor for HealthPlatformContextProvider(uint64_t a1)
{
  return sub_1BC738C70(a1, (uint64_t *)&unk_1ED6B7D28);
}

uint64_t sub_1BC7F007C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC817590();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for HealthPlatformContextProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPlatformContextProvider.__allocating_init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t storeEnumTagSinglePayload for HealthPlatformContextProvider.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC7F0180 + 4 * byte_1BC822775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BC7F01B4 + 4 * byte_1BC822770[v4]))();
}

uint64_t sub_1BC7F01B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7F01BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC7F01C4);
  return result;
}

uint64_t sub_1BC7F01D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC7F01D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BC7F01DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7F01E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Errors()
{
  return &type metadata for HealthPlatformContextProvider.Errors;
}

uint64_t sub_1BC7F0200()
{
  return type metadata accessor for HealthPlatformContextProvider.Context(0);
}

uint64_t sub_1BC7F0208()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC817590();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for HealthPlatformContextProvider.Context()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPlatformContextProvider.Context.__allocating_init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Errors()
{
  return &type metadata for HealthPlatformContextProvider.Context.Errors;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Description()
{
  return &type metadata for HealthPlatformContextProvider.Context.Description;
}

uint64_t _s14HealthPlatform29HealthPlatformContextProviderC7ContextC6ErrorsOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BC7F0320 + 4 * byte_1BC82277A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BC7F0340 + 4 * byte_1BC82277F[v4]))();
}

_BYTE *sub_1BC7F0320(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BC7F0340(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7F0348(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7F0350(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7F0358(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7F0360(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Description.CodingKeys()
{
  return &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys;
}

uint64_t destroy for HealthPlatformContextProvider.ProtectedState(uint64_t a1)
{
  uint64_t result;

  swift_unknownObjectWeakDestroy();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 48))
    return __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  return result;
}

uint64_t initializeWithCopy for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  swift_unknownObjectWeakCopyInit();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = v5;
    *(_QWORD *)(a1 + 56) = v6;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8))(a1 + 24, a2 + 24, v5);
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  }
  return a1;
}

uint64_t assignWithCopy for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)(swift_unknownObjectWeakCopyAssign() + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 48) = v4;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
      return a1;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 24);
    v6 = *(_OWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 24) = v5;
    *(_OWORD *)(a1 + 40) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

__n128 initializeWithTake for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v3 = swift_unknownObjectWeakTakeInit();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(a2 + 24);
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(v3 + 40) = result;
  *(_QWORD *)(v3 + 56) = *(_QWORD *)(a2 + 56);
  return result;
}

uint64_t assignWithTake for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  swift_unknownObjectWeakTakeAssign();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 48))
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthPlatformContextProvider.ProtectedState(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthPlatformContextProvider.ProtectedState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      *(_QWORD *)(result + 8) = 1;
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.ProtectedState()
{
  return &type metadata for HealthPlatformContextProvider.ProtectedState;
}

unint64_t sub_1BC7F0658()
{
  unint64_t result;

  result = qword_1EF45D060;
  if (!qword_1EF45D060)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC822C74, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D060);
  }
  return result;
}

unint64_t sub_1BC7F06A0()
{
  unint64_t result;

  result = qword_1EF45D068;
  if (!qword_1EF45D068)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC822BE4, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D068);
  }
  return result;
}

unint64_t sub_1BC7F06E8()
{
  unint64_t result;

  result = qword_1EF45D070;
  if (!qword_1EF45D070)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC822C0C, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D070);
  }
  return result;
}

uint64_t sub_1BC7F072C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x80000001BC826570)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1BC818694();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1BC7F07B0(uint64_t a1)
{
  _QWORD *v1;

  return sub_1BC7ECDA0(a1, v1);
}

void sub_1BC7F07C8(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_1BC7ECE8C(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_1BC7F07E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1BC7EBF44(*a1, *(_QWORD *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t sub_1BC7F0820()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC7F0854()
{
  uint64_t v0;

  return sub_1BC7EC884(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1BC7F0874(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v26 = *(_QWORD *)(a1 + 16);
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1BC6E8B44(0, v1, 0);
  v2 = v28;
  result = sub_1BC7F3648(a1);
  v5 = result;
  v7 = v26;
  v6 = a1;
  v8 = 0;
  v9 = a1 + 64;
  v10 = a1 + 80;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(v6 + 32))
  {
    v12 = (unint64_t)v5 >> 6;
    if ((*(_QWORD *)(v9 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v6 + 36) != (_DWORD)v4)
      goto LABEL_24;
    v13 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v5);
    v14 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v5);
    v16 = *(_QWORD *)(v28 + 16);
    v15 = *(_QWORD *)(v28 + 24);
    if (v16 >= v15 >> 1)
    {
      v24 = v9;
      v25 = v4;
      v23 = v10;
      result = sub_1BC6E8B44(v15 > 1, v16 + 1, 1);
      v10 = v23;
      v9 = v24;
      v4 = v25;
      v7 = v26;
      v6 = a1;
    }
    *(_QWORD *)(v28 + 16) = v16 + 1;
    v17 = v28 + 16 * v16;
    *(_QWORD *)(v17 + 32) = v13;
    *(_QWORD *)(v17 + 40) = v14;
    v11 = 1 << *(_BYTE *)(v6 + 32);
    if (v5 >= v11)
      goto LABEL_25;
    v18 = *(_QWORD *)(v9 + 8 * v12);
    if ((v18 & (1 << v5)) == 0)
      goto LABEL_26;
    if (*(_DWORD *)(v6 + 36) != (_DWORD)v4)
      goto LABEL_27;
    v19 = v18 & (-2 << (v5 & 0x3F));
    if (v19)
    {
      v11 = __clz(__rbit64(v19)) | v5 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = v12 + 1;
      v21 = (unint64_t)(v11 + 63) >> 6;
      if (v12 + 1 < v21)
      {
        v22 = *(_QWORD *)(v9 + 8 * v20);
        if (v22)
        {
LABEL_20:
          v11 = __clz(__rbit64(v22)) + (v20 << 6);
        }
        else
        {
          while (v21 - 2 != v12)
          {
            v22 = *(_QWORD *)(v10 + 8 * v12++);
            if (v22)
            {
              v20 = v12 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v8;
    v5 = v11;
    if (v8 == v7)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1BC7F0A70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, _QWORD);
  uint64_t v25;
  unint64_t v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v1 = a1;
  v26 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v2 = sub_1BC8181FC();
  else
    v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v31 = MEMORY[0x1E0DEE9D8];
    sub_1BC6E8D94(0, v2 & ~(v2 >> 63), 0);
    result = sub_1BC7F36D0(v1);
    v28 = result;
    v29 = v4;
    v30 = v5 & 1;
    if (v2 < 0)
    {
      __break(1u);
LABEL_20:
      __break(1u);
    }
    else
    {
      v25 = v1;
      do
      {
        while (1)
        {
          v12 = v28;
          v13 = v29;
          v14 = v30;
          sub_1BC7F3790(v27, v28, v29, v30, v1);
          v16 = v15;
          v17 = (void *)v27[0];
          v18 = objc_msgSend(v15, sel_code);
          v19 = objc_msgSend(v17, sel_longLongValue);

          v20 = v31;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = sub_1BC6E8D94(0, *(_QWORD *)(v20 + 16) + 1, 1);
            v20 = v31;
          }
          v22 = *(_QWORD *)(v20 + 16);
          v21 = *(_QWORD *)(v20 + 24);
          if (v22 >= v21 >> 1)
          {
            result = sub_1BC6E8D94(v21 > 1, v22 + 1, 1);
            v20 = v31;
          }
          *(_QWORD *)(v20 + 16) = v22 + 1;
          v23 = v20 + 16 * v22;
          *(_QWORD *)(v23 + 32) = v18;
          *(_QWORD *)(v23 + 40) = v19;
          if (v26)
            break;
          v1 = v25;
          sub_1BC7F349C(v12, v13, v14, v25, (unint64_t *)&qword_1ED6BB1D0, 0x1E0CB6978, (void (*)())sub_1BC706A1C);
          v7 = v6;
          v9 = v8;
          v11 = v10;
          sub_1BC6EAF90(v12, v13, v14);
          v28 = v7;
          v29 = v9;
          v30 = v11 & 1;
          if (!--v2)
            goto LABEL_17;
        }
        v1 = v25;
        if ((v14 & 1) == 0)
          goto LABEL_20;
        if (sub_1BC818424())
          swift_isUniquelyReferenced_nonNull_native();
        sub_1BC7F4894();
        v24 = (void (*)(_QWORD *, _QWORD))sub_1BC817A4C();
        sub_1BC81849C();
        v24(v27, 0);
        --v2;
      }
      while (v2);
LABEL_17:
      sub_1BC6EAF90(v28, v29, v30);
      return v31;
    }
  }
  return result;
}

uint64_t static InputSignalIdentifier.objectTypeAnchorQuery.getter()
{
  return sub_1BC8173E0();
}

uint64_t static InputSignalSet.LookupKey.objectTypeAnchorQuery.getter()
{
  uint64_t v0;

  v0 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v0);
  sub_1BC8173E0();
  type metadata accessor for ObjectTypeAnchorQueryInputSignal();
  return sub_1BC817260();
}

uint64_t type metadata accessor for ObjectTypeAnchorQueryInputSignal()
{
  return objc_opt_self();
}

_QWORD *ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return sub_1BC7F3C04(a1, a3, a4, a5, v5, ObjectType, a2);
}

_QWORD *ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:changesObserver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v13 = *(_QWORD *)(a6 + 24);
  v14 = *(_QWORD *)(a6 + 32);
  v15 = __swift_mutable_project_boxed_opaque_existential_1(a6, v13);
  v16 = sub_1BC7F41FC(a1, a2, a3, a4, a5, v15, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_0(a6);
  return v16;
}

_QWORD *ObjectTypeAnchorQueryInputSignal.init(context:observer:healthStore:changesObserver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;

  v13 = *(_QWORD *)(a6 + 24);
  v14 = *(_QWORD *)(a6 + 32);
  v15 = __swift_mutable_project_boxed_opaque_existential_1(a6, v13);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  v19 = sub_1BC7F3B20(a1, a2, a3, a4, a5, (uint64_t)v17, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_0(a6);
  return v19;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.init(anchorsByCode:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ObjectTypeAnchorQueryInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

void sub_1BC7F0FB0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t Strong;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(char *, uint64_t);
  id v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  _QWORD *v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (**v73)(char *, uint64_t);
  uint64_t v74;
  _QWORD *v75;

  v7 = sub_1BC8173EC();
  v73 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC817590();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v67 - v15;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v18 = Strong;
    if (a2)
    {
      v71 = v10;
      v72 = v11;
      swift_getObjectType();
      v19 = a2;
      sub_1BC8171E8();
      v20 = a2;
      swift_retain();
      v21 = a2;
      swift_retain();
      v22 = sub_1BC81756C();
      v23 = sub_1BC817E84();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = swift_slowAlloc();
        v70 = a4;
        v25 = v24;
        v68 = (_QWORD *)swift_slowAlloc();
        v69 = swift_slowAlloc();
        v75 = (_QWORD *)v69;
        *(_DWORD *)v25 = 136315394;
        v67 = v25 + 4;
        sub_1BC8173E0();
        sub_1BC6F0A44(&qword_1ED6B95D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D108], MEMORY[0x1E0D2D120]);
        v26 = sub_1BC818670();
        v28 = v27;
        v73[1](v9, v7);
        v74 = sub_1BC6E14D8(v26, v28, (uint64_t *)&v75);
        sub_1BC818148();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2112;
        v29 = a2;
        v30 = _swift_stdlib_bridgeErrorToNSError();
        v74 = v30;
        sub_1BC818148();
        v31 = v68;
        *v68 = v30;

        _os_log_impl(&dword_1BC6DD000, v22, v23, "[%s] Query failed: %@; attempting to restart query.",
          (uint8_t *)v25,
          0x16u);
        sub_1BC6EFA40();
        swift_arrayDestroy();
        MEMORY[0x1BCCF5BA4](v31, -1, -1);
        v32 = v69;
        swift_arrayDestroy();
        MEMORY[0x1BCCF5BA4](v32, -1, -1);
        v33 = v25;
        a4 = v70;
        MEMORY[0x1BCCF5BA4](v33, -1, -1);
      }
      else
      {
        swift_release_n();

      }
      (*(void (**)(char *, uint64_t))(v72 + 8))(v16, v71);
      if (qword_1EF45ABF8 != -1)
LABEL_37:
        swift_once();
      v54 = swift_allocObject();
      *(_QWORD *)(v54 + 16) = v18;
      *(_QWORD *)(v54 + 24) = a4;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1BC7C3EDC((uint64_t)sub_1BC7F4868, v54);
      swift_release();

      goto LABEL_24;
    }
    if (!a1)
    {
      v72 = v11;
      swift_getObjectType();
      sub_1BC8171E8();
      swift_retain_n();
      v55 = sub_1BC81756C();
      v56 = sub_1BC817E84();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = swift_slowAlloc();
        v71 = v10;
        v58 = (uint8_t *)v57;
        v69 = swift_slowAlloc();
        v75 = (_QWORD *)v69;
        v70 = a4;
        *(_DWORD *)v58 = 136315138;
        v68 = v58 + 4;
        sub_1BC8173E0();
        sub_1BC6F0A44(&qword_1ED6B95D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D108], MEMORY[0x1E0D2D120]);
        v59 = sub_1BC818670();
        v61 = v60;
        v73[1](v9, v7);
        v74 = sub_1BC6E14D8(v59, v61, (uint64_t *)&v75);
        a4 = v70;
        sub_1BC818148();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC6DD000, v55, v56, "[%s] Query failed without reporting an error (nil anchor); attempting to restart query.",
          v58,
          0xCu);
        v62 = v69;
        swift_arrayDestroy();
        MEMORY[0x1BCCF5BA4](v62, -1, -1);
        MEMORY[0x1BCCF5BA4](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v72 + 8))(v14, v71);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v14, v10);
      }
      if (qword_1EF45ABF8 != -1)
        swift_once();
      v66 = swift_allocObject();
      *(_QWORD *)(v66 + 16) = v18;
      *(_QWORD *)(v66 + 24) = a4;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1BC7C3EDC((uint64_t)sub_1BC7F483C, v66);
      swift_release();
LABEL_24:
      swift_release();
      return;
    }
    v34 = a1;
    v35 = objc_msgSend(v34, sel_anchors);
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
    sub_1BC6ED7C0(0, &qword_1ED6BA520);
    sub_1BC6EFB34((unint64_t *)&qword_1ED6B97F8, (unint64_t *)&qword_1ED6BB1D0);
    v36 = sub_1BC817A34();

    v37 = sub_1BC7F0A70(v36);
    swift_bridgeObjectRelease();
    a4 = *(_QWORD *)(v37 + 16);
    if (a4)
    {
      v72 = 0;
      v73 = v34;
      swift_bridgeObjectRetain();
      v71 = v37;
      v38 = (void **)(v37 + 40);
      v39 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      while (1)
      {
        v40 = (uint64_t)*(v38 - 1);
        a2 = *v38;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v75 = v39;
        v43 = sub_1BC7065B4(v40);
        v44 = v39[2];
        v45 = (v42 & 1) == 0;
        v46 = v44 + v45;
        if (__OFADD__(v44, v45))
        {
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        v47 = v42;
        if (v39[3] >= v46)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v39 = v75;
            if ((v42 & 1) != 0)
              goto LABEL_8;
          }
          else
          {
            sub_1BC70AD40();
            v39 = v75;
            if ((v47 & 1) != 0)
              goto LABEL_8;
          }
        }
        else
        {
          sub_1BC707784(v46, isUniquelyReferenced_nonNull_native);
          v48 = sub_1BC7065B4(v40);
          if ((v47 & 1) != (v49 & 1))
          {
            type metadata accessor for _HKDataTypeCode(0);
            sub_1BC8186E8();
            __break(1u);
            return;
          }
          v43 = v48;
          v39 = v75;
          if ((v47 & 1) != 0)
          {
LABEL_8:
            *(_QWORD *)(v39[7] + 8 * v43) = a2;
            goto LABEL_9;
          }
        }
        v39[(v43 >> 6) + 8] |= 1 << v43;
        v50 = 8 * v43;
        *(_QWORD *)(v39[6] + v50) = v40;
        *(_QWORD *)(v39[7] + v50) = a2;
        v51 = v39[2];
        v52 = __OFADD__(v51, 1);
        v53 = v51 + 1;
        if (v52)
          goto LABEL_36;
        v39[2] = v53;
LABEL_9:
        v38 += 2;
        swift_bridgeObjectRelease();
        if (!--a4)
        {
          swift_bridgeObjectRelease();
          v34 = v73;
          goto LABEL_29;
        }
      }
    }
    v39 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_29:
    swift_bridgeObjectRelease();
    v63 = *(_QWORD *)(v18 + 96);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v63 + 24));
    sub_1BC7F1C30((uint64_t *)(v63 + 16), v34, (uint64_t)v39, (uint64_t *)&v75);
    os_unfair_lock_unlock((os_unfair_lock_t)(v63 + 24));
    swift_release();
    swift_bridgeObjectRelease();
    v64 = (uint64_t)v75;
    swift_getObjectType();
    v74 = v18;
    v75 = (_QWORD *)v64;
    type metadata accessor for ObjectTypeAnchorQueryInputSignal();
    sub_1BC6F0A44(&qword_1ED6B9510, v65, (uint64_t (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal, (uint64_t)&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal);
    sub_1BC817374();
    swift_bridgeObjectRelease();
    swift_release();

  }
}

uint64_t ObjectTypeAnchorQueryInputSignal.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC7F1904(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a2;
  v34 = a4;
  v6 = sub_1BC8173EC();
  v31 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC817590();
  v32 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_1BC8171E8();
  swift_retain_n();
  v12 = sub_1BC81756C();
  v13 = sub_1BC817E9C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v30 = a3;
    v15 = (uint8_t *)v14;
    v29 = swift_slowAlloc();
    v36 = v29;
    *(_DWORD *)v15 = 136315138;
    v27 = v15 + 4;
    sub_1BC8173E0();
    sub_1BC6F0A44(&qword_1ED6B95D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D108], MEMORY[0x1E0D2D120]);
    v16 = sub_1BC818670();
    v28 = v9;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v6);
    v35 = sub_1BC6E14D8(v16, v18, &v36);
    sub_1BC818148();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v12, v13, "[%s] Device unlocked; retrying.", v15, 0xCu);
    v19 = v29;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v19, -1, -1);
    MEMORY[0x1BCCF5BA4](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v28);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
  }
  v20 = a1[10];
  v21 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v20);
  v22 = swift_allocObject();
  swift_weakInit();
  v23 = swift_allocObject();
  v24 = v33;
  *(_QWORD *)(v23 + 16) = v22;
  *(_QWORD *)(v23 + 24) = v24;
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  v25(v34, v23, v20, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_1BC7F1C30@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v45 = a4;
  v46 = a3;
  v6 = sub_1BC8173EC();
  v39 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  MEMORY[0x1E0C80A78](v6);
  v37 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC817590();
  v42 = *(_QWORD *)(v8 - 8);
  v43 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a2, sel_anchors);
  v12 = sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
  sub_1BC6ED7C0(0, &qword_1ED6BA520);
  sub_1BC6EFB34((unint64_t *)&qword_1ED6B97F8, (unint64_t *)&qword_1ED6BB1D0);
  v38 = v12;
  v13 = sub_1BC817A34();

  v14 = a2;
  v44 = a1;
  v15 = v41;
  sub_1BC7F3D98(v13, a1, v14);

  swift_getObjectType();
  sub_1BC8171E8();
  swift_retain_n();
  swift_bridgeObjectRetain();
  v16 = sub_1BC81756C();
  v17 = sub_1BC817E9C();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc();
    v41 = v15;
    v20 = v19;
    v36 = swift_slowAlloc();
    v48 = v36;
    *(_DWORD *)v20 = 136315394;
    v34 = v20 + 4;
    v21 = v37;
    sub_1BC8173E0();
    sub_1BC6F0A44(&qword_1ED6B95D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D108], MEMORY[0x1E0D2D120]);
    v35 = v18;
    v22 = v40;
    v23 = sub_1BC818670();
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v21, v22);
    v47 = sub_1BC6E14D8(v23, v25, &v48);
    sub_1BC818148();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    v26 = swift_bridgeObjectRetain();
    v27 = MEMORY[0x1BCCF4914](v26, v38);
    v29 = v28;
    swift_bridgeObjectRelease();
    v47 = sub_1BC6E14D8(v27, v29, &v48);
    sub_1BC818148();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v16, (os_log_type_t)v35, "[%s] Types changed: %s", (uint8_t *)v20, 0x16u);
    v30 = v36;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v30, -1, -1);
    MEMORY[0x1BCCF5BA4](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v43);
  v31 = v44;
  v32 = v46;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *v31 = v32;
  *v45 = v32;
  return swift_bridgeObjectRetain();
}

void sub_1BC7F2030(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  if (*a1)
    objc_msgSend(*(id *)(a2 + 24), sel_stopQuery_);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v9 = objc_allocWithZone(MEMORY[0x1E0CB6FF8]);
  v14[4] = sub_1BC7F4808;
  v14[5] = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1BC75771C;
  v14[3] = &block_descriptor_27;
  v10 = _Block_copy(v14);
  swift_retain();
  v11 = objc_msgSend(v9, sel_initWithUpdateHandler_, v10);
  _Block_release(v10);
  swift_release();
  v12 = *a1;
  v13 = v11;

  *a1 = v11;
  objc_msgSend(*(id *)(a2 + 24), sel_executeQuery_, v13);

}

void sub_1BC7F215C()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  void **v2;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)v0 + 16);
  v2 = (void **)&v1[4];
  v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1BC7F47C8(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.modify())()
{
  return nullsub_1;
}

void ObjectTypeAnchorQueryInputSignal.Anchor.hasDifference(from:for:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  int v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  if ((*a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BC8181C0();
    sub_1BC6ED7C0(0, &qword_1ED6B6360);
    sub_1BC6EFB34(&qword_1ED6B6368, &qword_1ED6B6360);
    sub_1BC817DB8();
    v4 = v33;
    v30 = v34;
    v6 = v35;
    v7 = v36;
    v8 = v37;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(v4 + 32);
    v30 = v4 + 56;
    v6 = ~v9;
    v10 = -v9;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v8 = v11 & *(_QWORD *)(v4 + 56);
    swift_bridgeObjectRetain();
    v7 = 0;
  }
  v29 = (unint64_t)(v6 + 64) >> 6;
  v31 = v5;
  while (1)
  {
    v12 = v7;
    if (v4 < 0)
    {
      if (!sub_1BC81822C())
        goto LABEL_41;
      sub_1BC6ED7C0(0, &qword_1ED6B6360);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v32;
      swift_unknownObjectRelease();
      if (!v32)
        goto LABEL_41;
      goto LABEL_30;
    }
    if (!v8)
      break;
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v14 = v13 | (v7 << 6);
LABEL_29:
    v15 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    if (!v15)
      goto LABEL_41;
LABEL_30:
    v19 = objc_msgSend(v15, sel_code);
    if (*(_QWORD *)(v5 + 16) && (v20 = sub_1BC7065B4(v19), (v21 & 1) != 0))
    {
      v22 = 0;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if (!v3)
        goto LABEL_8;
LABEL_35:
      v24 = objc_msgSend(v15, sel_code);
      if (!*(_QWORD *)(v3 + 16))
        goto LABEL_8;
      v25 = sub_1BC7065B4(v24);
      if ((v26 & 1) == 0)
        goto LABEL_8;
      v27 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v25);

      if (v23 == v27)
        v28 = v22;
      else
        v28 = 1;
      v5 = v31;
      if (v28 == 1)
        goto LABEL_41;
    }
    else
    {
      v23 = 0;
      v22 = 1;
      if (v3)
        goto LABEL_35;
LABEL_8:

      v5 = v31;
      if ((v22 & 1) == 0)
        goto LABEL_41;
    }
  }
  v16 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v16 >= v29)
      goto LABEL_41;
    v17 = *(_QWORD *)(v30 + 8 * v16);
    ++v7;
    if (!v17)
    {
      v7 = v12 + 2;
      if (v12 + 2 >= v29)
        goto LABEL_41;
      v17 = *(_QWORD *)(v30 + 8 * v7);
      if (!v17)
      {
        v7 = v12 + 3;
        if (v12 + 3 >= v29)
          goto LABEL_41;
        v17 = *(_QWORD *)(v30 + 8 * v7);
        if (!v17)
        {
          v7 = v12 + 4;
          if (v12 + 4 >= v29)
            goto LABEL_41;
          v17 = *(_QWORD *)(v30 + 8 * v7);
          if (!v17)
          {
            v18 = v12 + 5;
            while (v29 != v18)
            {
              v17 = *(_QWORD *)(v30 + 8 * v18++);
              if (v17)
              {
                v7 = v18 - 1;
                goto LABEL_28;
              }
            }
LABEL_41:
            sub_1BC6ECC4C();
            return;
          }
        }
      }
    }
LABEL_28:
    v8 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v7 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.merged(with:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *v1;
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  result = sub_1BC7F25A8(v4, v3);
  *a1 = result;
  return result;
}

uint64_t sub_1BC7F25A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_1BC7F31CC(a1, (uint64_t)sub_1BC7F3BF8, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC7F2640()
{
  return 0x4273726F68636E61;
}

uint64_t sub_1BC7F2664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x4273726F68636E61 && a2 == 0xED000065646F4379)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1BC818694();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BC7F271C()
{
  sub_1BC7F42DC();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F2744()
{
  sub_1BC7F42DC();
  return sub_1BC818808();
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  char *v35;
  _QWORD *v36;

  sub_1BC7F4320(0, &qword_1ED6B9750, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v30 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F42DC();
  sub_1BC8187E4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  sub_1BC70E9BC();
  sub_1BC70EA7C(&qword_1ED6B83B8, MEMORY[0x1E0DEB448], MEMORY[0x1E0DEDC90], MEMORY[0x1E0DEA0D8]);
  sub_1BC8185C8();
  v35 = v9;
  v10 = sub_1BC6FF34C((uint64_t)v36);
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_19:
    (*(void (**)(char *, uint64_t))(v7 + 8))(v35, v6);
    swift_bridgeObjectRelease();
    *a2 = v13;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  v31 = v7;
  v32 = v6;
  v33 = a2;
  v34 = a1;
  swift_bridgeObjectRetain();
  v30 = v10;
  v12 = (uint64_t *)(v10 + 40);
  v13 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v15 = *(v12 - 1);
    v14 = *v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v36 = v13;
    v18 = sub_1BC7065B4(v15);
    v19 = v13[2];
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
      break;
    v22 = v17;
    if (v13[3] >= v21)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v13 = v36;
        if ((v17 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_1BC70AD40();
        v13 = v36;
        if ((v22 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_1BC707784(v21, isUniquelyReferenced_nonNull_native);
      v23 = sub_1BC7065B4(v15);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_23;
      v18 = v23;
      v13 = v36;
      if ((v22 & 1) != 0)
      {
LABEL_4:
        *(_QWORD *)(v13[7] + 8 * v18) = v14;
        goto LABEL_5;
      }
    }
    v13[(v18 >> 6) + 8] |= 1 << v18;
    v25 = 8 * v18;
    *(_QWORD *)(v13[6] + v25) = v15;
    *(_QWORD *)(v13[7] + v25) = v14;
    v26 = v13[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_22;
    v13[2] = v28;
LABEL_5:
    v12 += 2;
    swift_bridgeObjectRelease();
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      a2 = v33;
      a1 = v34;
      v7 = v31;
      v6 = v32;
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  type metadata accessor for _HKDataTypeCode(0);
  result = sub_1BC8186E8();
  __break(1u);
  return result;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  char *v28;
  uint64_t result;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;

  sub_1BC7F4320(0, &qword_1ED6B8EF0, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v30 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F42DC();
  v33 = v7;
  sub_1BC8187F0();
  v8 = swift_bridgeObjectRetain();
  v9 = sub_1BC7F0874(v8);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10)
  {
    v12 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_18:
    swift_bridgeObjectRelease();
    v34 = v12;
    sub_1BC70E9BC();
    sub_1BC70EA7C(&qword_1ED6B83B0, MEMORY[0x1E0DEB420], MEMORY[0x1E0DEDC68], MEMORY[0x1E0DEA0B8]);
    v28 = v33;
    sub_1BC818634();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v28, v4);
    return swift_bridgeObjectRelease();
  }
  v30[1] = v1;
  v31 = v5;
  v32 = v4;
  swift_bridgeObjectRetain();
  v30[0] = v9;
  v11 = (uint64_t *)(v9 + 40);
  v12 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v14 = *(v11 - 1);
    v13 = *v11;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = v12;
    v17 = sub_1BC7067D8(v14);
    v18 = v12[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
      break;
    v21 = v16;
    if (v12[3] >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v12 = v34;
        if ((v16 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_1BC70AEC8();
        v12 = v34;
        if ((v21 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_1BC707A4C(v20, isUniquelyReferenced_nonNull_native);
      v22 = sub_1BC7067D8(v14);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_21;
      v17 = v22;
      v12 = v34;
      if ((v21 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v12[7] + 8 * v17) = v13;
        goto LABEL_4;
      }
    }
    v12[(v17 >> 6) + 8] |= 1 << v17;
    v24 = 8 * v17;
    *(_QWORD *)(v12[6] + v24) = v14;
    *(_QWORD *)(v12[7] + v24) = v13;
    v25 = v12[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_20;
    v12[2] = v27;
LABEL_4:
    v11 += 2;
    swift_bridgeObjectRelease();
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      v5 = v31;
      v4 = v32;
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_1BC8186E8();
  __break(1u);
  return result;
}

unint64_t static ObjectTypeAnchorQueryInputSignal.Anchor.== infix(_:_:)(unint64_t *a1, uint64_t *a2)
{
  return sub_1BC701118(*a1, *a2);
}

uint64_t sub_1BC7F2D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *v1;
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  result = sub_1BC7F25A8(v4, v3);
  *a1 = result;
  return result;
}

uint64_t sub_1BC7F2D8C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return ObjectTypeAnchorQueryInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_1BC7F2DA0(_QWORD *a1)
{
  return ObjectTypeAnchorQueryInputSignal.Anchor.encode(to:)(a1);
}

unint64_t sub_1BC7F2DB4(unint64_t *a1, uint64_t *a2)
{
  return sub_1BC701118(*a1, *a2);
}

uint64_t (*ObjectTypeAnchorQueryInputSignal.Configuration.types.modify())()
{
  return nullsub_1;
}

void static ObjectTypeAnchorQueryInputSignal.Configuration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  sub_1BC7039B4(*a1, *a2);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Configuration.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_1BC70CF88(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t ObjectTypeAnchorQueryInputSignal.Configuration.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1BC81873C();
  sub_1BC70CF88((uint64_t)v3, v1);
  return sub_1BC818778();
}

void sub_1BC7F2E58(uint64_t *a1, uint64_t *a2)
{
  sub_1BC7039B4(*a1, *a2);
}

uint64_t sub_1BC7F2E64()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1BC81873C();
  sub_1BC70CF88((uint64_t)v3, v1);
  return sub_1BC818778();
}

void sub_1BC7F2EA8(uint64_t a1)
{
  uint64_t *v1;

  sub_1BC70CF88(a1, *v1);
}

uint64_t sub_1BC7F2EB0()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1BC81873C();
  sub_1BC70CF88((uint64_t)v3, v1);
  return sub_1BC818778();
}

uint64_t ObjectTypeAnchorQueryInputSignal.beginObservation(from:configurations:)(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void (*)(void *, void *), uint64_t, uint64_t, uint64_t);
  uint64_t v21;

  v3 = v2;
  v5 = *a1;
  v6 = v2 + 7;
  v7 = v2[10];
  v8 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
  v9 = MEMORY[0x1E0DEE9E8];
  v21 = MEMORY[0x1E0DEE9E8];
  v10 = *(_QWORD *)(a2 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v10; ++i)
    {
      v12 = swift_bridgeObjectRetain();
      sub_1BC7053EC(v12);
    }
    swift_bridgeObjectRelease();
    v9 = v21;
  }
  if (v5)
  {
    v13 = v3[12];
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 24));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v13 + 16) = v5;
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 24));
  }
  v14 = sub_1BC7060BC(v9);
  swift_bridgeObjectRelease();
  v15 = v3[10];
  v16 = v3[11];
  __swift_project_boxed_opaque_existential_1(v6, v15);
  v17 = swift_allocObject();
  swift_weakInit();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = v14;
  v19 = *(void (**)(void (*)(void *, void *), uint64_t, uint64_t, uint64_t))(v16 + 8);
  swift_retain();
  swift_retain();
  v19(sub_1BC7F43A4, v18, v15, v16);
  swift_release();
  swift_release();
  return swift_release();
}

Swift::Void __swiftcall ObjectTypeAnchorQueryInputSignal.stopObservation()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[10];
  v2 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t ObjectTypeAnchorQueryInputSignal.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_release();
  return v0;
}

uint64_t ObjectTypeAnchorQueryInputSignal.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BC7F3150()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC7F316C(uint64_t *a1, uint64_t a2)
{
  return ObjectTypeAnchorQueryInputSignal.beginObservation(from:configurations:)(a1, a2);
}

uint64_t sub_1BC7F318C(uint64_t a1, uint64_t a2)
{
  sub_1BC6F0A44(&qword_1ED6B9510, a2, (uint64_t (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal, (uint64_t)&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal);
  return sub_1BC8171AC();
}

unint64_t sub_1BC7F31CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  BOOL v17;
  uint64_t v18;
  char v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD *v35;
  char v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_1BC7F39BC();
  if ((v9 & 1) != 0)
    goto LABEL_26;
  v10 = v7;
  v11 = v8;
  v12 = (_QWORD *)*a5;
  result = sub_1BC7065B4(v7);
  v15 = v12[2];
  v16 = (v14 & 1) == 0;
  v17 = __OFADD__(v15, v16);
  v18 = v15 + v16;
  if (v17)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v19 = v14;
  if (v12[3] < v18)
  {
    sub_1BC707784(v18, a4 & 1);
    result = sub_1BC7065B4(v10);
    if ((v19 & 1) == (v20 & 1))
      goto LABEL_7;
LABEL_5:
    type metadata accessor for _HKDataTypeCode(0);
    result = sub_1BC8186E8();
    __break(1u);
  }
  if ((a4 & 1) == 0)
  {
    v24 = result;
    sub_1BC70AD40();
    result = v24;
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
      goto LABEL_8;
    goto LABEL_12;
  }
LABEL_7:
  v21 = (_QWORD *)*a5;
  if ((v19 & 1) != 0)
  {
LABEL_8:
    v22 = v21[7];
    v23 = *(_QWORD *)(v22 + 8 * result);
    if (v11 < v23)
      v23 = v11;
    *(_QWORD *)(v22 + 8 * result) = v23;
LABEL_14:
    v28 = sub_1BC7F39BC();
    if ((v30 & 1) == 0)
    {
      v10 = v28;
      v11 = v29;
      v19 = 1;
      do
      {
        v35 = (_QWORD *)*a5;
        result = sub_1BC7065B4(v10);
        v37 = v35[2];
        v38 = (v36 & 1) == 0;
        v17 = __OFADD__(v37, v38);
        v39 = v37 + v38;
        if (v17)
          goto LABEL_27;
        a4 = v36;
        if (v35[3] < v39)
        {
          sub_1BC707784(v39, 1);
          result = sub_1BC7065B4(v10);
          if ((a4 & 1) != (v40 & 1))
            goto LABEL_5;
        }
        v41 = (_QWORD *)*a5;
        if ((a4 & 1) != 0)
        {
          v31 = v41[7];
          v32 = *(_QWORD *)(v31 + 8 * result);
          if (v11 < v32)
            v32 = v11;
          *(_QWORD *)(v31 + 8 * result) = v32;
        }
        else
        {
          v41[(result >> 6) + 8] |= 1 << result;
          *(_QWORD *)(v41[6] + 8 * result) = v10;
          *(_QWORD *)(v41[7] + 8 * result) = v11;
          v42 = v41[2];
          v17 = __OFADD__(v42, 1);
          v43 = v42 + 1;
          if (v17)
            goto LABEL_28;
          v41[2] = v43;
        }
        v10 = sub_1BC7F39BC();
        v11 = v33;
      }
      while ((v34 & 1) == 0);
    }
LABEL_26:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1BC6ECC4C();
    return swift_release();
  }
LABEL_12:
  v21[(result >> 6) + 8] |= 1 << result;
  v25 = 8 * result;
  *(_QWORD *)(v21[6] + v25) = v10;
  *(_QWORD *)(v21[7] + v25) = v11;
  v26 = v21[2];
  v17 = __OFADD__(v26, 1);
  v27 = v26 + 1;
  if (!v17)
  {
    v21[2] = v27;
    goto LABEL_14;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1BC7F3480(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1BC7F349C(a1, a2, a3, a4, &qword_1ED6B6360, 0x1E0CB6B00, (void (*)())sub_1BC7065BC);
}

void sub_1BC7F349C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)())
{
  char v11;
  char v12;
  void *v13;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_1BC81819C();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_1BC818430() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_1BC81843C();
  sub_1BC7F494C(a1, a2, 1);
  sub_1BC6ED7C0(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  a7();
  v12 = v11;

  if ((v12 & 1) != 0)
  {
    sub_1BC818418();
    sub_1BC818454();
    sub_1BC6EAF90(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1BC7F3648(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1BC7F36D0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
    return sub_1BC8183F4();
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v3 = 64;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

void sub_1BC7F3790(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_1BC818460();
      sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_1BC6ED7C0(0, &qword_1ED6BA520);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if ((a4 & 1) != 0)
  {
LABEL_10:
    if (sub_1BC818430() == *(_DWORD *)(a5 + 36))
    {
      sub_1BC81843C();
      sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      v6 = sub_1BC706A1C((uint64_t)v13);
      v9 = v8;

      if ((v9 & 1) != 0)
        goto LABEL_12;
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  v10 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * v6);
  v11 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  v12 = v11;
}

uint64_t sub_1BC7F39BC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = 8 * v6;
    v8 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v9 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + v7);
    v0[3] = v4;
    v0[4] = v5;
    v10 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v19[0] = v8;
    v19[1] = v9;
    v10(&v18, v19);
    return v18;
  }
  v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      v14 = v0[1];
      v15 = *(_QWORD *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        v5 = (v15 - 1) & v15;
        v6 = __clz(__rbit64(v15)) + (v12 << 6);
        v4 = v12;
        goto LABEL_3;
      }
      v16 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        v15 = *(_QWORD *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          v12 = v16;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          v15 = *(_QWORD *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            v12 = v3 + 3;
            goto LABEL_7;
          }
          v16 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            v15 = *(_QWORD *)(v14 + 8 * v16);
            if (v15)
              goto LABEL_10;
            v12 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              v15 = *(_QWORD *)(v14 + 8 * v12);
              if (v15)
                goto LABEL_7;
              v4 = v13 - 1;
              v17 = v3 + 6;
              while (v13 != v17)
              {
                v15 = *(_QWORD *)(v14 + 8 * v17++);
                if (v15)
                {
                  v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

_QWORD *sub_1BC7F3B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t *boxed_opaque_existential_1;
  unint64_t v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v22 = a8;
  v23 = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(boxed_opaque_existential_1, a6, a8);
  v18 = sub_1BC714914(MEMORY[0x1E0DEE9D8]);
  sub_1BC7100F4(0, &qword_1ED6B9700);
  v19 = swift_allocObject();
  *(_DWORD *)(v19 + 24) = 0;
  *(_QWORD *)(v19 + 16) = v18;
  a7[12] = v19;
  sub_1BC6FC848(&v21, (uint64_t)(a7 + 7));
  a7[2] = a5;
  a7[3] = a1;
  a7[4] = a2;
  a7[5] = a3;
  a7[6] = a4;
  return a7;
}

__n128 sub_1BC7F3BF8@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_QWORD *sub_1BC7F3C04(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;

  type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver();
  v13 = swift_allocObject();
  sub_1BC7100F4(0, &qword_1ED6B96F8);
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v13 + 16) = v14;
  *(_QWORD *)(v13 + 24) = a4;
  v15 = (_QWORD *)swift_allocObject();
  v16 = sub_1BC7F3CD4(a1, a2, a3, (uint64_t)a4, v13, v15, a6, a7);
  v17 = a4;
  return v16;
}

_QWORD *sub_1BC7F3CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t Input;
  _UNKNOWN **v20;

  Input = type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver();
  v20 = &off_1E75235F8;
  *(_QWORD *)&v18 = a5;
  v15 = sub_1BC714914(MEMORY[0x1E0DEE9D8]);
  sub_1BC7100F4(0, &qword_1ED6B9700);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 16) = v15;
  a6[12] = v16;
  sub_1BC6FC848(&v18, (uint64_t)(a6 + 7));
  a6[2] = a4;
  a6[3] = a1;
  a6[4] = a8;
  a6[5] = a2;
  a6[6] = a3;
  return a6;
}

void sub_1BC7F3D98(unint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  unint64_t v28;
  char v29;
  id v30;
  char v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v38;
  void *v39;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v4 = sub_1BC818400();
    v34 = 0;
    v5 = 0;
    v6 = 0;
    v3 = v4 | 0x8000000000000000;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v34 = a1 + 64;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 64);
    v5 = v8;
  }
  v11 = 0;
  v32 = v5;
  v33 = (unint64_t)(v5 + 64) >> 6;
  v35 = v3;
  while ((v3 & 0x8000000000000000) != 0)
  {
    if (!sub_1BC818490())
      goto LABEL_53;
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v39;
    swift_unknownObjectRelease();
    v14 = v11;
    v12 = v6;
    if (!v39)
      goto LABEL_53;
LABEL_33:
    v19 = objc_msgSend(v15, sel_code, v32);
    v20 = *a2;
    if (*(_QWORD *)(*a2 + 16) && (v21 = sub_1BC7065B4(v19), (v22 & 1) != 0))
    {
      v23 = 0;
      v38 = *(id *)(*(_QWORD *)(v20 + 56) + 8 * v21);
    }
    else
    {
      v38 = 0;
      v23 = 1;
    }
    v24 = objc_msgSend(a3, sel_anchors);
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
    sub_1BC6ED7C0(0, &qword_1ED6BA520);
    sub_1BC6EFB34((unint64_t *)&qword_1ED6B97F8, (unint64_t *)&qword_1ED6BB1D0);
    v25 = sub_1BC817A34();

    if ((v25 & 0xC000000000000001) != 0)
    {
      v26 = v15;
      if (!sub_1BC81846C())
        goto LABEL_49;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v27 = v39;
      swift_unknownObjectRelease();
    }
    else
    {
      if (!*(_QWORD *)(v25 + 16))
        goto LABEL_50;
      v26 = v15;
      v28 = sub_1BC706A1C((uint64_t)v26);
      if ((v29 & 1) == 0)
      {
LABEL_49:

LABEL_50:
        swift_bridgeObjectRelease();
LABEL_51:
        if ((v23 & 1) != 0)
          goto LABEL_8;
        goto LABEL_52;
      }
      v27 = *(id *)(*(_QWORD *)(v25 + 56) + 8 * v28);
    }

    swift_bridgeObjectRelease();
    if (!v27)
      goto LABEL_51;
    v30 = objc_msgSend(v27, sel_longLongValue);

    if (v38 == v30)
      v31 = v23;
    else
      v31 = 1;
    if ((v31 & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
LABEL_52:
    sub_1BC818358();
    sub_1BC818388();
    sub_1BC818394();
    sub_1BC818364();
LABEL_9:
    v11 = v14;
    v6 = v12;
    v3 = v35;
  }
  if (v6)
  {
    v12 = (v6 - 1) & v6;
    v13 = __clz(__rbit64(v6)) | (v11 << 6);
    v14 = v11;
LABEL_32:
    v15 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    if (!v15)
      goto LABEL_53;
    goto LABEL_33;
  }
  v16 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    if (v16 >= v33)
      goto LABEL_53;
    v17 = *(_QWORD *)(v34 + 8 * v16);
    v14 = v11 + 1;
    if (!v17)
    {
      v14 = v11 + 2;
      if (v11 + 2 >= v33)
        goto LABEL_53;
      v17 = *(_QWORD *)(v34 + 8 * v14);
      if (!v17)
      {
        v14 = v11 + 3;
        if (v11 + 3 >= v33)
          goto LABEL_53;
        v17 = *(_QWORD *)(v34 + 8 * v14);
        if (!v17)
        {
          v14 = v11 + 4;
          if (v11 + 4 >= v33)
            goto LABEL_53;
          v17 = *(_QWORD *)(v34 + 8 * v14);
          if (!v17)
          {
            v14 = v11 + 5;
            if (v11 + 5 >= v33)
              goto LABEL_53;
            v17 = *(_QWORD *)(v34 + 8 * v14);
            if (!v17)
            {
              v18 = v11 + 6;
              while (v33 != v18)
              {
                v17 = *(_QWORD *)(v34 + 8 * v18++);
                if (v17)
                {
                  v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
LABEL_53:
              sub_1BC6ECC4C();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

_QWORD *sub_1BC7F41FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a5;
  v15 = *(_QWORD *)(a8 - 8);
  MEMORY[0x1E0C80A78](a1);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (_QWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a6, a8);
  return sub_1BC7F3B20(a1, a2, a3, a4, v21, (uint64_t)v17, v18, a8, a9);
}

unint64_t sub_1BC7F42DC()
{
  unint64_t result;

  result = qword_1ED6B94D0;
  if (!qword_1ED6B94D0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8230A4, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B94D0);
  }
  return result;
}

void sub_1BC7F4320(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BC7F42DC();
    v7 = a3(a1, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BC7F437C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1BC7F43A4(void *a1, void *a2)
{
  uint64_t v2;

  sub_1BC7F0FB0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

unint64_t sub_1BC7F43B0()
{
  unint64_t result;

  result = qword_1ED6B8E78;
  if (!qword_1ED6B8E78)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Anchor, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_1ED6B8E78);
  }
  return result;
}

unint64_t sub_1BC7F43F8()
{
  unint64_t result;

  result = qword_1ED6B94F0;
  if (!qword_1ED6B94F0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Anchor, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_1ED6B94F0);
  }
  return result;
}

unint64_t sub_1BC7F4440()
{
  unint64_t result;

  result = qword_1ED6B94F8;
  if (!qword_1ED6B94F8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Anchor, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_1ED6B94F8);
  }
  return result;
}

unint64_t sub_1BC7F4488()
{
  unint64_t result;

  result = qword_1EF45D088;
  if (!qword_1EF45D088)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Configuration, &type metadata for ObjectTypeAnchorQueryInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_1EF45D088);
  }
  return result;
}

unint64_t sub_1BC7F44D0()
{
  unint64_t result;

  result = qword_1ED6B9500;
  if (!qword_1ED6B9500)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Configuration, &type metadata for ObjectTypeAnchorQueryInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_1ED6B9500);
  }
  return result;
}

unint64_t sub_1BC7F4518()
{
  unint64_t result;

  result = qword_1ED6B9508;
  if (!qword_1ED6B9508)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Configuration, &type metadata for ObjectTypeAnchorQueryInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_1ED6B9508);
  }
  return result;
}

uint64_t sub_1BC7F455C(uint64_t a1, uint64_t a2)
{
  return sub_1BC6F0A44(&qword_1ED6B9518, a2, (uint64_t (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal, (uint64_t)&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal);
}

unint64_t sub_1BC7F458C()
{
  unint64_t result;

  result = qword_1ED6B94E8;
  if (!qword_1ED6B94E8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal.Anchor, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_1ED6B94E8);
  }
  return result;
}

uint64_t dispatch thunk of ObjectTypeAnchorObserver.startObserving(resultsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ObjectTypeAnchorObserver.stopObserving()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for ObjectTypeAnchorQueryInputSignal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:changesObserver:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Anchor()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Configuration()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Configuration;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver.State()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.QueryObserver.State;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.State()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.State;
}

uint64_t storeEnumTagSinglePayload for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BC7F4694 + 4 * byte_1BC822CF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BC7F46B4 + 4 * byte_1BC822CF5[v4]))();
}

_BYTE *sub_1BC7F4694(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BC7F46B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7F46BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7F46C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7F46CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7F46D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys;
}

unint64_t sub_1BC7F46F4()
{
  unint64_t result;

  result = qword_1EF45D090;
  if (!qword_1EF45D090)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82306C, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D090);
  }
  return result;
}

unint64_t sub_1BC7F473C()
{
  unint64_t result;

  result = qword_1ED6B94E0;
  if (!qword_1ED6B94E0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC822FDC, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B94E0);
  }
  return result;
}

unint64_t sub_1BC7F4784()
{
  unint64_t result;

  result = qword_1ED6B94D8;
  if (!qword_1ED6B94D8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823004, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B94D8);
  }
  return result;
}

void sub_1BC7F47C8(void **a1)
{
  uint64_t *v1;

  sub_1BC7F2030(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1BC7F47E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC7F4808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a2, a3);
}

uint64_t block_destroy_helper_28()
{
  return swift_release();
}

uint64_t sub_1BC7F483C()
{
  uint64_t v0;

  return sub_1BC7F1904(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_1E75236E8, (uint64_t)sub_1BC7F4968);
}

uint64_t sub_1BC7F4868()
{
  uint64_t v0;

  return sub_1BC7F1904(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_1E75236C0, (uint64_t)sub_1BC7F4968);
}

void sub_1BC7F4894()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B9630)
  {
    sub_1BC6ED7C0(255, (unint64_t *)&qword_1ED6BB1D0);
    sub_1BC6ED7C0(255, &qword_1ED6BA520);
    sub_1BC6EFB34((unint64_t *)&qword_1ED6B97F8, (unint64_t *)&qword_1ED6BB1D0);
    v0 = sub_1BC817A58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B9630);
  }
}

uint64_t sub_1BC7F494C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t static InputSignalIdentifier.cloudSyncStatus.getter()
{
  return sub_1BC8173E0();
}

uint64_t static InputSignalSet.LookupKey.cloudSyncStatus.getter()
{
  uint64_t v0;

  v0 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v0);
  sub_1BC8173E0();
  type metadata accessor for CloudSyncStatusInputSignal();
  return sub_1BC817260();
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal()
{
  return objc_opt_self();
}

uint64_t SyncError.init(error:)()
{
  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
  return sub_1BC817A10();
}

uint64_t static SyncError.== infix(_:_:)()
{
  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
  sub_1BC7F4BF8((unint64_t *)&unk_1EF45D098, MEMORY[0x1E0DEFD00]);
  return sub_1BC8179F8();
}

uint64_t SyncError.hash(into:)()
{
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  return sub_1BC817A7C();
}

void sub_1BC7F4B24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6BA820)
  {
    sub_1BC6ED7C0(255, (unint64_t *)&qword_1ED6BA830);
    v0 = sub_1BC817A04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6BA820);
  }
}

unint64_t sub_1BC7F4B88()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1EF45D0A8;
  if (!qword_1EF45D0A8)
  {
    sub_1BC7F4B24();
    v2 = v1;
    v3 = sub_1BC7F4BF8(&qword_1EF45D0B0, MEMORY[0x1E0DEFCF8]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0CB4360], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1EF45D0A8);
  }
  return result;
}

uint64_t sub_1BC7F4BF8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1BC6ED7C0(255, (unint64_t *)&qword_1ED6BA830);
    result = MEMORY[0x1BCCF5AB4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC7F4C48()
{
  return 0x726F727265;
}

uint64_t sub_1BC7F4C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1BC818694();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BC7F4CE8()
{
  sub_1BC7F4E6C();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F4D10()
{
  sub_1BC7F4E6C();
  return sub_1BC818808();
}

uint64_t SyncError.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BC788E10(0, &qword_1EF45D0B8, (uint64_t (*)(void))sub_1BC7F4E6C, (uint64_t)&type metadata for SyncError.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F4E6C();
  sub_1BC8187F0();
  sub_1BC7F4B24();
  sub_1BC6F0A44(&qword_1EF45D0C8, 255, (uint64_t (*)(uint64_t))sub_1BC7F4B24, MEMORY[0x1E0CB4358]);
  sub_1BC818634();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BC7F4E6C()
{
  unint64_t result;

  result = qword_1EF45D0C0;
  if (!qword_1EF45D0C0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823B04, &type metadata for SyncError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D0C0);
  }
  return result;
}

uint64_t SyncError.hashValue.getter()
{
  sub_1BC81873C();
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  sub_1BC817A7C();
  return sub_1BC818778();
}

uint64_t SyncError.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v18 = a2;
  sub_1BC7F4B24();
  v20 = v3;
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v19 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC788E10(0, &qword_1EF45D0D0, (uint64_t (*)(void))sub_1BC7F4E6C, (uint64_t)&type metadata for SyncError.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v21 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - v8;
  v10 = type metadata accessor for SyncError(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F4E6C();
  v13 = v22;
  sub_1BC8187E4();
  if (!v13)
  {
    v14 = (uint64_t)v12;
    sub_1BC6F0A44(&qword_1EF45D0D8, 255, (uint64_t (*)(uint64_t))sub_1BC7F4B24, MEMORY[0x1E0CB4370]);
    v16 = v19;
    v15 = v20;
    sub_1BC8185C8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v14, v16, v15);
    sub_1BC6ECBA4(v14, v18, type metadata accessor for SyncError);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1BC7F5100@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncError.init(from:)(a1, a2);
}

uint64_t sub_1BC7F5114(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BC788E10(0, &qword_1EF45D0B8, (uint64_t (*)(void))sub_1BC7F4E6C, (uint64_t)&type metadata for SyncError.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F4E6C();
  sub_1BC8187F0();
  sub_1BC7F4B24();
  sub_1BC6F0A44(&qword_1EF45D0C8, 255, (uint64_t (*)(uint64_t))sub_1BC7F4B24, MEMORY[0x1E0CB4358]);
  sub_1BC818634();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1BC7F5248()
{
  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
  sub_1BC7F4BF8((unint64_t *)&unk_1EF45D098, MEMORY[0x1E0DEFD00]);
  return sub_1BC8179F8();
}

uint64_t sub_1BC7F52B0()
{
  sub_1BC81873C();
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  sub_1BC817A7C();
  return sub_1BC818778();
}

uint64_t sub_1BC7F5304()
{
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  return sub_1BC817A7C();
}

uint64_t sub_1BC7F5344()
{
  sub_1BC81873C();
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  sub_1BC817A7C();
  return sub_1BC818778();
}

uint64_t type metadata accessor for SyncError(uint64_t a1)
{
  return sub_1BC738C70(a1, (uint64_t *)&unk_1ED6BA9F0);
}

uint64_t ActiveSyncState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t active;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v10;

  v1 = type metadata accessor for SyncError(0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC6ECB08(v0, (uint64_t)v7, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 2, v1))
    return sub_1BC818748();
  sub_1BC6ECBA4((uint64_t)v7, (uint64_t)v4, type metadata accessor for SyncError);
  sub_1BC818748();
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  sub_1BC817A7C();
  return sub_1BC6ED784((uint64_t)v4, type metadata accessor for SyncError);
}

uint64_t sub_1BC7F54E4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6574656C706D6F63;
  if (*v0 != 1)
    v1 = 0x64656C696166;
  if (*v0)
    return v1;
  else
    return 0x6572676F72506E69;
}

uint64_t sub_1BC7F5544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BC7FA34C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BC7F5568()
{
  sub_1BC7F9F04();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F5590()
{
  sub_1BC7F9F04();
  return sub_1BC818808();
}

uint64_t sub_1BC7F55B8()
{
  sub_1BC7F9E7C();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F55E0()
{
  sub_1BC7F9E7C();
  return sub_1BC818808();
}

uint64_t sub_1BC7F5608()
{
  sub_1BC7F9E38();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F5630()
{
  sub_1BC7F9E38();
  return sub_1BC818808();
}

uint64_t sub_1BC7F5658()
{
  sub_1BC7F9EC0();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F5680()
{
  sub_1BC7F9EC0();
  return sub_1BC818808();
}

uint64_t ActiveSyncState.encode(to:)(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t active;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170];
  sub_1BC788E10(0, &qword_1EF45D0E0, (uint64_t (*)(void))sub_1BC7F9E38, (uint64_t)&type metadata for ActiveSyncState.FailedCodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v38 = v3;
  v35 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v37 = (char *)&v29 - v4;
  v5 = type metadata accessor for SyncError(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v36 = (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC788E10(0, &qword_1EF45D0F0, (uint64_t (*)(void))sub_1BC7F9E7C, (uint64_t)&type metadata for ActiveSyncState.CompletedCodingKeys, v2);
  v33 = *(_QWORD *)(v8 - 8);
  v34 = v8;
  MEMORY[0x1E0C80A78](v8);
  v32 = (char *)&v29 - v9;
  sub_1BC788E10(0, &qword_1EF45D100, (uint64_t (*)(void))sub_1BC7F9EC0, (uint64_t)&type metadata for ActiveSyncState.InProgressCodingKeys, v2);
  v30 = *(_QWORD *)(v10 - 8);
  v31 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v29 - v11;
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC788E10(0, &qword_1EF45D110, (uint64_t (*)(void))sub_1BC7F9F04, (uint64_t)&type metadata for ActiveSyncState.CodingKeys, v2);
  v17 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v41 = v17;
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v29 - v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F9F04();
  sub_1BC8187F0();
  sub_1BC6ECB08(v39, (uint64_t)v15, type metadata accessor for ActiveSyncState);
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v15, 2, v5);
  if (v20)
  {
    if (v20 == 1)
    {
      v42 = 0;
      sub_1BC7F9EC0();
      v21 = v40;
      sub_1BC8185EC();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v31);
    }
    else
    {
      v43 = 1;
      sub_1BC7F9E7C();
      v28 = v32;
      v21 = v40;
      sub_1BC8185EC();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v34);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v19, v21);
  }
  else
  {
    v22 = v35;
    v23 = v36;
    sub_1BC6ECBA4((uint64_t)v15, v36, type metadata accessor for SyncError);
    v44 = 2;
    sub_1BC7F9E38();
    v24 = v37;
    v25 = v40;
    sub_1BC8185EC();
    sub_1BC6F0A44(&qword_1EF45D120, 255, type metadata accessor for SyncError, (uint64_t)&protocol conformance descriptor for SyncError);
    v26 = v38;
    sub_1BC818634();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v26);
    sub_1BC6ED784(v23, type metadata accessor for SyncError);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v19, v25);
  }
}

uint64_t ActiveSyncState.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t active;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = type metadata accessor for SyncError(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC81873C();
  sub_1BC6ECB08(v1, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 2, v2))
  {
    sub_1BC818748();
  }
  else
  {
    sub_1BC6ECBA4((uint64_t)v8, (uint64_t)v5, type metadata accessor for SyncError);
    sub_1BC818748();
    sub_1BC7F4B24();
    sub_1BC7F4B88();
    sub_1BC817A7C();
    sub_1BC6ED784((uint64_t)v5, type metadata accessor for SyncError);
  }
  return sub_1BC818778();
}

uint64_t ActiveSyncState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t active;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  char *v32;
  uint64_t v33;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  _QWORD *v54;
  char v55;
  char v56;
  char v57;

  v48 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048];
  sub_1BC788E10(0, &qword_1EF45D128, (uint64_t (*)(void))sub_1BC7F9E38, (uint64_t)&type metadata for ActiveSyncState.FailedCodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v5 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v47 = v5;
  MEMORY[0x1E0C80A78](v4);
  v52 = (char *)&v41 - v6;
  sub_1BC788E10(0, &qword_1EF45D130, (uint64_t (*)(void))sub_1BC7F9E7C, (uint64_t)&type metadata for ActiveSyncState.CompletedCodingKeys, v3);
  v44 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  MEMORY[0x1E0C80A78](v7);
  v49 = (char *)&v41 - v8;
  sub_1BC788E10(0, &qword_1EF45D138, (uint64_t (*)(void))sub_1BC7F9EC0, (uint64_t)&type metadata for ActiveSyncState.InProgressCodingKeys, v3);
  v42 = *(_QWORD *)(v9 - 8);
  v43 = v9;
  MEMORY[0x1E0C80A78](v9);
  v51 = (char *)&v41 - v10;
  sub_1BC788E10(0, (unint64_t *)&unk_1EF45D140, (uint64_t (*)(void))sub_1BC7F9F04, (uint64_t)&type metadata for ActiveSyncState.CodingKeys, v3);
  v12 = v11;
  v50 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v41 - v13;
  active = type metadata accessor for ActiveSyncState(0);
  v16 = MEMORY[0x1E0C80A78](active);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v41 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7F9F04();
  v53 = v14;
  v21 = v54;
  sub_1BC8187E4();
  if (v21)
    goto LABEL_8;
  v41 = v18;
  v23 = v51;
  v22 = v52;
  v54 = a1;
  v24 = sub_1BC8185D4();
  v25 = v12;
  if (*(_QWORD *)(v24 + 16) != 1)
  {
    v29 = sub_1BC818334();
    swift_allocError();
    v31 = v30;
    sub_1BC7A3EF4();
    *v31 = active;
    v32 = v53;
    sub_1BC818580();
    sub_1BC81831C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v31, *MEMORY[0x1E0DEC450], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v25);
    a1 = v54;
LABEL_8:
    v33 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v33);
  }
  v26 = v53;
  if (*(_BYTE *)(v24 + 32))
  {
    if (*(_BYTE *)(v24 + 32) == 1)
    {
      v56 = 1;
      sub_1BC7F9E7C();
      v27 = v49;
      sub_1BC818574();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v27, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v26, v12);
      v28 = type metadata accessor for SyncError(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v20, 2, 2, v28);
    }
    else
    {
      v57 = 2;
      sub_1BC7F9E38();
      v35 = v26;
      sub_1BC818574();
      v36 = v22;
      v37 = type metadata accessor for SyncError(0);
      sub_1BC6F0A44(&qword_1EF45D158, 255, type metadata accessor for SyncError, (uint64_t)&protocol conformance descriptor for SyncError);
      v38 = (uint64_t)v41;
      v39 = v46;
      sub_1BC8185C8();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v12);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v38, 0, 2, v37);
      sub_1BC6ECBA4(v38, (uint64_t)v20, type metadata accessor for ActiveSyncState);
    }
  }
  else
  {
    v55 = 0;
    sub_1BC7F9EC0();
    sub_1BC818574();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v43);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v26, v12);
    v40 = type metadata accessor for SyncError(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v20, 1, 2, v40);
  }
  sub_1BC6ECBA4((uint64_t)v20, v48, type metadata accessor for ActiveSyncState);
  v33 = (uint64_t)v54;
  return __swift_destroy_boxed_opaque_existential_0(v33);
}

uint64_t sub_1BC7F6194@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ActiveSyncState.init(from:)(a1, a2);
}

uint64_t sub_1BC7F61A8(_QWORD *a1)
{
  return ActiveSyncState.encode(to:)(a1);
}

uint64_t sub_1BC7F61C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = type metadata accessor for SyncError(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC6ECB08(v0, (uint64_t)v7, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 2, v1))
    return sub_1BC818748();
  sub_1BC6ECBA4((uint64_t)v7, (uint64_t)v5, type metadata accessor for SyncError);
  sub_1BC818748();
  sub_1BC7F4B24();
  sub_1BC7F4B88();
  sub_1BC817A7C();
  return sub_1BC6ED784((uint64_t)v5, type metadata accessor for SyncError);
}

uint64_t sub_1BC7F62F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = type metadata accessor for SyncError(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC81873C();
  sub_1BC6ECB08(v1, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 2, v2))
  {
    sub_1BC818748();
  }
  else
  {
    sub_1BC6ECBA4((uint64_t)v8, (uint64_t)v6, type metadata accessor for SyncError);
    sub_1BC818748();
    sub_1BC7F4B24();
    sub_1BC7F4B88();
    sub_1BC817A7C();
    sub_1BC6ED784((uint64_t)v6, type metadata accessor for SyncError);
  }
  return sub_1BC818778();
}

id CloudSyncStatusInputSignal.__allocating_init(observer:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  uint64_t v7;
  id v8;

  type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = 0;
  v8 = sub_1BC7FA4B0(a1, a2, v7, (char *)objc_allocWithZone(v3));
  swift_unknownObjectRelease();
  return v8;
}

id CloudSyncStatusInputSignal.__allocating_init(observer:shim:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  v10 = sub_1BC7FA824(a1, a2, v9, v3, v7, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v10;
}

id CloudSyncStatusInputSignal.init(observer:shim:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v7 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = sub_1BC7FA65C(a1, a2, (uint64_t)v11, v3, v7, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v13;
}

uint64_t CloudSyncStatusInputSignal.didUpdate(status:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void **v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v11;

  swift_getObjectType();
  v3 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v7 = (void **)(v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16));
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v8);
  sub_1BC7F6754(v7, a1, v5);
  os_unfair_lock_unlock(v8);
  swift_getObjectType();
  v11 = v1;
  sub_1BC6F0A44(&qword_1ED6B7EF0, v9, (uint64_t (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal);
  sub_1BC817374();
  return sub_1BC6ED784((uint64_t)v5, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1BC7F6754@<X0>(void **a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t active;
  id v14;
  uint64_t v16;

  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - v7;
  v9 = *a1;
  v10 = a2;

  *a1 = a2;
  v11 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  sub_1BC77A368((uint64_t)a1 + *(int *)(v11 + 20), (uint64_t)v8, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v12 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56))(v12, 1, 1, active);
  *a3 = a2;
  v14 = v10;
  return sub_1BC7FA8E8((uint64_t)v8, v12);
}

uint64_t CloudSyncStatusInputSignal.Anchor.init(status:activeSyncState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t active;

  v6 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56))(v6, 1, 1, active);
  *a3 = a1;
  return sub_1BC7FA8E8(a2, v6);
}

uint64_t CloudSyncStatusInputSignal.didUpdate(activeSyncState:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void **v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v11;

  swift_getObjectType();
  v3 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v7 = (void **)(v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16));
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v8);
  sub_1BC7F6A20(v7, a1, v5);
  os_unfair_lock_unlock(v8);
  swift_getObjectType();
  v11 = v1;
  sub_1BC6F0A44(&qword_1ED6B7EF0, v9, (uint64_t (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal);
  sub_1BC817374();
  return sub_1BC6ED784((uint64_t)v5, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1BC7F6A20@<X0>(void **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t active;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - v7;
  v9 = (uint64_t)a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 20);
  sub_1BC754350(v9, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC6ECB08(a2, v9, type metadata accessor for ActiveSyncState);
  active = type metadata accessor for ActiveSyncState(0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56);
  v11(v9, 0, 1, active);
  v12 = *a1;
  sub_1BC6ECB08(a2, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  v11((uint64_t)v8, 0, 1, active);
  v13 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  v11(v13, 1, 1, active);
  *a3 = v12;
  v14 = v12;
  return sub_1BC7FA8E8((uint64_t)v8, v13);
}

id sub_1BC7F6B70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id result;
  uint64_t v13;

  v2 = v1;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6400]), sel_initWithHealthStore_delegate_, *(_QWORD *)(v1 + 16), a1);
  v4 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = v3;

  if (qword_1ED6B8030 != -1)
    swift_once();
  v5 = sub_1BC817590();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED6B8018);
  v6 = sub_1BC81756C();
  v7 = sub_1BC817E9C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_1BC818814();
    sub_1BC6E14D8(v10, v11, &v13);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v6, v7, "[%s] observing sync status and requests", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v9, -1, -1);
    MEMORY[0x1BCCF5BA4](v8, -1, -1);
  }

  objc_msgSend(*(id *)(v2 + 24), sel_startObservingSyncStatus);
  result = *(id *)(v2 + 24);
  if (result)
    return objc_msgSend(result, sel_startObservingSyncRequestsMatchingFilter_, 31);
  return result;
}

uint64_t sub_1BC7F6D44()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_1BC7F6D70(uint64_t a1)
{
  return sub_1BC7F6B70(a1);
}

void sub_1BC7F6D90()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 24);
  if (v2)
  {
    objc_msgSend(v2, sel_setDelegate_, 0);
    v2 = *(void **)(v1 + 24);
  }
  *(_QWORD *)(v1 + 24) = 0;

}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncDidStartWith:)(uint64_t a1, void *a2)
{
  return sub_1BC7FA93C(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncFailedWithError:)(uint64_t a1, void *a2)
{
  return sub_1BC7FABE0(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserverStatusUpdated(_:status:)(uint64_t a1, void *a2)
{
  return sub_1BC7FB0EC(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncStartedFor:with:)(uint64_t a1, void *a2, void *a3)
{
  return sub_1BC7FB328(a2, a3);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncFailedFor:error:)(uint64_t a1, void *a2, void *a3)
{
  return sub_1BC7FB678(a2, a3);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncCompletedFor:)(uint64_t a1, void *a2)
{
  return sub_1BC7FBA2C(a2);
}

id CloudSyncStatusInputSignal.Anchor.status.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void CloudSyncStatusInputSignal.Anchor.status.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CloudSyncStatusInputSignal.Anchor.status.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Anchor.activeSyncState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  return sub_1BC77A368(v1 + *(int *)(v3 + 20), a1, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
}

uint64_t CloudSyncStatusInputSignal.Anchor.activeSyncState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  return sub_1BC7FA8E8(a1, v3);
}

uint64_t (*CloudSyncStatusInputSignal.Anchor.activeSyncState.modify())()
{
  type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  return nullsub_1;
}

BOOL CloudSyncStatusInputSignal.Anchor.hasDifference(from:for:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t active;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int (*v93)(uint64_t, uint64_t, uint64_t);
  unint64_t *v94;
  unint64_t *v95;
  void (*v96)(uint64_t);
  uint64_t v97;
  uint64_t v99;
  char v100;
  uint64_t v101;
  id *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int (*v106)(id *, uint64_t, uint64_t);
  id *v107;
  id v108;
  id v109;
  uint64_t v110;
  unsigned __int8 v111;
  unsigned int v112;
  id *v113;
  id v114;
  id v115;
  unsigned int v116;
  id v117;
  void *v118;
  uint64_t v119;
  void (*v120)(uint64_t, uint64_t, uint64_t, uint64_t);
  id *v121;
  uint64_t v122;
  id v123;
  id v124;
  uint64_t v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(uint64_t);
  unsigned int (*v133)(uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  void (*v135)(uint64_t);
  char *v136;
  void (*v137)(uint64_t);
  char v138;
  void (*v139)(char *, uint64_t);
  id v140;
  id *v141;
  void *v142;
  uint64_t v143;
  void (*v144)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(uint64_t);
  uint64_t v154;
  int *v155;
  uint64_t v156;
  unsigned int v157;
  void (*v158)(uint64_t);
  char *v159;
  void (*v160)(uint64_t);
  char v161;
  void (*v162)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v163)(char *, uint64_t);
  id v164;
  uint64_t v165;
  id *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t (*v177)(void);
  uint64_t v178;
  void (*v179)(uint64_t);
  uint64_t v180;
  unsigned int (*v181)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v182)(void);
  void (*v183)(uint64_t);
  uint64_t v184;
  uint64_t v185;
  void (*v186)(uint64_t);
  char *v187;
  void (*v188)(uint64_t);
  char v189;
  void (*v190)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v191)(char *, uint64_t);
  id v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  id *v197;
  id v198;
  id v199;
  uint64_t v200;
  id v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void (*v207)(uint64_t);
  uint64_t v208;
  unsigned int (*v209)(uint64_t, uint64_t, uint64_t);
  uint64_t v210;
  void (*v211)(uint64_t);
  char *v212;
  void (*v213)(uint64_t);
  char v214;
  uint64_t v215;
  void (*v216)(char *, uint64_t);
  id v217;
  id v218;
  id v219;
  void *v220;
  id *v221;
  id *v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  void *v229;
  unsigned __int8 v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  id *v234;
  char *v235;
  id *v236;
  char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  char *v241;
  char *v242;
  uint64_t v243;
  id *v244;
  id *v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  char *v251;
  char *v252;
  uint64_t v253;
  id *v254;
  int v255;
  uint64_t v256;
  id *v257;
  uint64_t v258;
  uint64_t v259;
  int v260;
  id *v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  uint64_t v266;
  id *v267;
  uint64_t v268;
  int v269;
  char *v270;
  uint64_t v271;
  uint64_t v272;
  unsigned int (*v273)(char *, uint64_t, uint64_t);
  uint64_t v274;
  int *v275;
  void **v276;
  uint64_t v277;
  void *v278;
  id v279;

  v277 = a1;
  v3 = sub_1BC816EF4();
  v4 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  v5 = *(_QWORD *)(v3 - 8);
  v271 = v3;
  v272 = v5;
  MEMORY[0x1E0C80A78](v3);
  v251 = (char *)&v231 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC78DBBC(0, &qword_1ED6B62E0, (unint64_t *)&qword_1ED6B9BE8, v4);
  v265 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v238 = (uint64_t)&v231 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v256 = (uint64_t)&v231 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v259 = (uint64_t)&v231 - v13;
  MEMORY[0x1E0C80A78](v12);
  v270 = (char *)&v231 - v14;
  sub_1BC6E1440(0, (unint64_t *)&qword_1ED6B9BE8, v4);
  v16 = MEMORY[0x1E0C80A78](v15);
  v232 = (uint64_t)&v231 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v237 = (char *)&v231 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v240 = (uint64_t)&v231 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v233 = (char *)&v231 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v243 = (uint64_t)&v231 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v239 = (uint64_t)&v231 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v235 = (char *)&v231 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v248 = (uint64_t)&v231 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v241 = (char *)&v231 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v253 = (uint64_t)&v231 - v35;
  v36 = MEMORY[0x1E0C80A78](v34);
  v247 = (uint64_t)&v231 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v242 = (char *)&v231 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v258 = (uint64_t)&v231 - v41;
  v42 = MEMORY[0x1E0C80A78](v40);
  v249 = (char *)&v231 - v43;
  v44 = MEMORY[0x1E0C80A78](v42);
  v263 = (uint64_t)&v231 - v45;
  v46 = MEMORY[0x1E0C80A78](v44);
  v250 = (uint64_t)&v231 - v47;
  v48 = MEMORY[0x1E0C80A78](v46);
  v246 = (char *)&v231 - v49;
  v50 = MEMORY[0x1E0C80A78](v48);
  v262 = (uint64_t)&v231 - v51;
  v52 = MEMORY[0x1E0C80A78](v50);
  v252 = (char *)&v231 - v53;
  MEMORY[0x1E0C80A78](v52);
  v266 = (uint64_t)&v231 - v54;
  active = type metadata accessor for ActiveSyncState(0);
  v56 = *(_QWORD *)(active - 8);
  MEMORY[0x1E0C80A78](active);
  v268 = (uint64_t)&v231 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC78DBBC(0, qword_1ED6B8DF0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v275 = v58;
  MEMORY[0x1E0C80A78](v58);
  v60 = (char *)&v231 - v59;
  sub_1BC6E1440(0, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  v62 = MEMORY[0x1E0C80A78](v61);
  v245 = (id *)((char *)&v231 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0));
  v64 = MEMORY[0x1E0C80A78](v62);
  v234 = (id *)((char *)&v231 - v65);
  v66 = MEMORY[0x1E0C80A78](v64);
  v236 = (id *)((char *)&v231 - v67);
  v68 = MEMORY[0x1E0C80A78](v66);
  v244 = (id *)((char *)&v231 - v69);
  v70 = MEMORY[0x1E0C80A78](v68);
  v254 = (id *)((char *)&v231 - v71);
  v72 = MEMORY[0x1E0C80A78](v70);
  v257 = (id *)((char *)&v231 - v73);
  v74 = MEMORY[0x1E0C80A78](v72);
  v261 = (id *)((char *)&v231 - v75);
  v76 = MEMORY[0x1E0C80A78](v74);
  v267 = (id *)((char *)&v231 - v77);
  MEMORY[0x1E0C80A78](v76);
  v79 = (char *)&v231 - v78;
  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v81 = MEMORY[0x1E0C80A78](v80);
  v83 = (char *)&v231 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = MEMORY[0x1E0C80A78](v81);
  v86 = (char *)&v231 - v85;
  MEMORY[0x1E0C80A78](v84);
  v88 = (char *)&v231 - v87;
  v269 = *a2;
  v264 = a2[1];
  v260 = a2[2];
  v255 = a2[3];
  v89 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  sub_1BC77A368((uint64_t)v276 + *(int *)(v89 + 20), (uint64_t)v88, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC77A368(v277, (uint64_t)v79, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  v273 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 48);
  v90 = v273(v79, 1, v89);
  v274 = v89;
  if (v90 == 1)
  {
    sub_1BC754350((uint64_t)v79, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v86, 1, 1, active);
  }
  else
  {
    sub_1BC77A368((uint64_t)&v79[*(int *)(v89 + 20)], (uint64_t)v86, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC6ED784((uint64_t)v79, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  v91 = v56;
  v92 = (uint64_t)&v60[v275[12]];
  sub_1BC77A368((uint64_t)v88, (uint64_t)v60, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC77A368((uint64_t)v86, v92, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v93 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48);
  if (v93((uint64_t)v60, 1, active) == 1)
  {
    sub_1BC754350((uint64_t)v86, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC754350((uint64_t)v88, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    if (v93(v92, 1, active) == 1)
    {
      sub_1BC754350((uint64_t)v60, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      goto LABEL_14;
    }
LABEL_9:
    v94 = qword_1ED6B8DF0;
    v95 = &qword_1ED6B9398;
    v96 = (void (*)(uint64_t))type metadata accessor for ActiveSyncState;
LABEL_10:
    v97 = (uint64_t)v60;
LABEL_11:
    sub_1BC78DC1C(v97, v94, v95, v96);
    return 1;
  }
  sub_1BC77A368((uint64_t)v60, (uint64_t)v83, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v93(v92, 1, active) == 1)
  {
    sub_1BC754350((uint64_t)v86, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC754350((uint64_t)v88, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC6ED784((uint64_t)v83, type metadata accessor for ActiveSyncState);
    goto LABEL_9;
  }
  v99 = v268;
  sub_1BC6ECBA4(v92, v268, type metadata accessor for ActiveSyncState);
  v100 = _s14HealthPlatform15ActiveSyncStateO2eeoiySbAC_ACtFZ_0((uint64_t)v83, v99);
  sub_1BC6ED784(v99, type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v86, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v88, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC6ED784((uint64_t)v83, type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v60, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if ((v100 & 1) == 0)
    return 1;
LABEL_14:
  v102 = v276;
  v101 = v277;
  v103 = *v276;
  v105 = v271;
  v104 = v272;
  v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
  v60 = v270;
  if (!*v276)
    goto LABEL_21;
  v107 = v267;
  sub_1BC77A368(v277, (uint64_t)v267, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v107, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v107, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  else
  {
    v108 = *v107;
    v109 = *v107;
    sub_1BC6ED784((uint64_t)v107, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v108)
    {
      v279 = v109;
      sub_1BC6ED7C0(0, &qword_1ED6B85B0);
      v110 = sub_1BC818688();

      goto LABEL_20;
    }
  }
  v110 = 0;
LABEL_20:
  v111 = objc_msgSend(v103, sel_isEqual_, v110);
  swift_unknownObjectRelease();
  if ((v111 & 1) != 0)
    return 0;
LABEL_21:
  if (!v269)
    goto LABEL_34;
  if (*v102)
    v112 = objc_msgSend(*v102, sel_syncEnabled);
  else
    v112 = 2;
  v113 = v261;
  sub_1BC77A368(v101, (uint64_t)v261, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v113, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v113, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  else
  {
    v114 = *v113;
    v115 = *v113;
    sub_1BC6ED784((uint64_t)v113, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v114)
    {
      v116 = objc_msgSend(v115, sel_syncEnabled);

      if (v112 == 2)
        goto LABEL_33;
LABEL_29:
      if (v116 == 2 || (v116 == 0) == (v112 != 0))
        return 1;
      goto LABEL_34;
    }
  }
  v116 = 2;
  if (v112 != 2)
    goto LABEL_29;
LABEL_33:
  if (v116 != 2)
    return 1;
LABEL_34:
  if (!v264)
    goto LABEL_56;
  if (*v102)
  {
    v117 = objc_msgSend(*v102, sel_restoreCompletionDate);
    if (v117)
    {
      v118 = v117;
      v119 = (uint64_t)v252;
      sub_1BC816ED0();

      v120 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
      v120(v119, 0, 1, v105);
    }
    else
    {
      v120 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
      v119 = (uint64_t)v252;
      v120((uint64_t)v252, 1, 1, v105);
    }
    v121 = v257;
    sub_1BC7FBCC8(v119, v266);
  }
  else
  {
    v120 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
    v120(v266, 1, 1, v105);
    v121 = v257;
  }
  sub_1BC77A368(v101, (uint64_t)v121, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v121, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v121, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    v122 = v262;
LABEL_46:
    v120(v122, 1, 1, v105);
    goto LABEL_49;
  }
  v123 = *v121;
  v124 = *v121;
  v125 = (uint64_t)v121;
  v126 = v124;
  sub_1BC6ED784(v125, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  v122 = v262;
  if (!v123)
    goto LABEL_46;
  v127 = objc_msgSend(v126, sel_restoreCompletionDate);

  if (v127)
  {
    v128 = (uint64_t)v246;
    sub_1BC816ED0();

    v129 = 0;
  }
  else
  {
    v129 = 1;
    v128 = (uint64_t)v246;
  }
  v120(v128, v129, 1, v105);
  sub_1BC7FBCC8(v128, v122);
LABEL_49:
  v130 = v266;
  v131 = (uint64_t)&v60[*(int *)(v265 + 48)];
  v132 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  sub_1BC77A368(v266, (uint64_t)v60, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1BC77A368(v122, v131, (unint64_t *)&qword_1ED6B9BE8, v132);
  v133 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v104 + 48);
  if (v133((uint64_t)v60, 1, v105) == 1)
  {
    sub_1BC754350(v122, (unint64_t *)&qword_1ED6B9BE8, v132);
    sub_1BC754350(v130, (unint64_t *)&qword_1ED6B9BE8, v132);
    if (v133(v131, 1, v105) == 1)
    {
      sub_1BC754350((uint64_t)v60, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
      v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
      v101 = v277;
      goto LABEL_56;
    }
    goto LABEL_54;
  }
  v134 = v250;
  sub_1BC77A368((uint64_t)v60, v250, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  if (v133(v131, 1, v105) == 1)
  {
    v135 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    sub_1BC754350(v262, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1BC754350(v266, (unint64_t *)&qword_1ED6B9BE8, v135);
    (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v134, v105);
LABEL_54:
    v94 = &qword_1ED6B62E0;
    v95 = (unint64_t *)&qword_1ED6B9BE8;
    v96 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    goto LABEL_10;
  }
  v136 = v251;
  (*(void (**)(char *, uint64_t, uint64_t))(v104 + 32))(v251, v131, v105);
  v137 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  sub_1BC6F0A44((unint64_t *)&unk_1EF45D178, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v138 = sub_1BC817AB8();
  v139 = *(void (**)(char *, uint64_t))(v104 + 8);
  v139(v136, v105);
  sub_1BC754350(v262, (unint64_t *)&qword_1ED6B9BE8, v137);
  sub_1BC754350(v266, (unint64_t *)&qword_1ED6B9BE8, v137);
  v139((char *)v134, v105);
  sub_1BC754350((uint64_t)v60, (unint64_t *)&qword_1ED6B9BE8, v137);
  v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
  v101 = v277;
  if ((v138 & 1) == 0)
    return 1;
LABEL_56:
  if (!v260)
    goto LABEL_122;
  if (*v102)
  {
    v140 = objc_msgSend(*v102, sel_lastPullDate);
    v141 = v254;
    if (v140)
    {
      v142 = v140;
      v143 = (uint64_t)v249;
      sub_1BC816ED0();

      v144 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
      v144(v143, 0, 1, v105);
    }
    else
    {
      v144 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
      v143 = (uint64_t)v249;
      v144((uint64_t)v249, 1, 1, v105);
    }
    sub_1BC7FBCC8(v143, v263);
  }
  else
  {
    v144 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
    v144(v263, 1, 1, v105);
    v141 = v254;
  }
  sub_1BC77A368(v101, (uint64_t)v141, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v141, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v141, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_68:
    v151 = v258;
    v144(v258, 1, 1, v105);
    v150 = v259;
    goto LABEL_71;
  }
  v145 = *v141;
  v146 = *v141;
  sub_1BC6ED784((uint64_t)v141, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v145)
    goto LABEL_68;
  v147 = objc_msgSend(v146, sel_lastPullDate);

  if (v147)
  {
    v148 = (uint64_t)v242;
    sub_1BC816ED0();

    v149 = 0;
    v150 = v259;
    v151 = v258;
  }
  else
  {
    v149 = 1;
    v150 = v259;
    v151 = v258;
    v148 = (uint64_t)v242;
  }
  v144(v148, v149, 1, v105);
  sub_1BC7FBCC8(v148, v151);
LABEL_71:
  v152 = v150 + *(int *)(v265 + 48);
  v153 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  v154 = v263;
  sub_1BC77A368(v263, v150, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1BC77A368(v151, v152, (unint64_t *)&qword_1ED6B9BE8, v153);
  v155 = *(int **)(v104 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v155)(v150, 1, v105) == 1)
  {
    v275 = v155;
    sub_1BC754350(v151, (unint64_t *)&qword_1ED6B9BE8, v153);
    sub_1BC754350(v154, (unint64_t *)&qword_1ED6B9BE8, v153);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v275)(v152, 1, v105) == 1)
    {
      sub_1BC754350(v259, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
      v102 = v276;
      goto LABEL_78;
    }
    goto LABEL_76;
  }
  v156 = v247;
  sub_1BC77A368(v150, v247, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v157 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v155)(v152, 1, v105);
  v102 = v276;
  if (v157 == 1)
  {
    v158 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    sub_1BC754350(v258, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1BC754350(v263, (unint64_t *)&qword_1ED6B9BE8, v158);
    (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v156, v105);
LABEL_76:
    v94 = &qword_1ED6B62E0;
    v95 = (unint64_t *)&qword_1ED6B9BE8;
    v96 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    v97 = v259;
    goto LABEL_11;
  }
  v275 = v155;
  v159 = v251;
  (*(void (**)(char *, uint64_t, uint64_t))(v104 + 32))(v251, v152, v105);
  v160 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  sub_1BC6F0A44((unint64_t *)&unk_1EF45D178, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v161 = sub_1BC817AB8();
  v162 = v144;
  v163 = *(void (**)(char *, uint64_t))(v104 + 8);
  v163(v159, v105);
  sub_1BC754350(v258, (unint64_t *)&qword_1ED6B9BE8, v160);
  sub_1BC754350(v263, (unint64_t *)&qword_1ED6B9BE8, v160);
  v163((char *)v156, v105);
  v144 = v162;
  v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
  sub_1BC754350(v150, (unint64_t *)&qword_1ED6B9BE8, v160);
  if ((v161 & 1) == 0)
    return 1;
LABEL_78:
  if (*v102)
  {
    v164 = objc_msgSend(*v102, sel_lastPushDate);
    v165 = v256;
    v166 = v244;
    v101 = v277;
    if (v164)
    {
      v167 = v164;
      v168 = (uint64_t)v241;
      sub_1BC816ED0();

      v169 = 0;
    }
    else
    {
      v169 = 1;
      v168 = (uint64_t)v241;
    }
    v144(v168, v169, 1, v105);
    sub_1BC7FBCC8(v168, v253);
  }
  else
  {
    v144(v253, 1, 1, v105);
    v165 = v256;
    v166 = v244;
    v101 = v277;
  }
  sub_1BC77A368(v101, (uint64_t)v166, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v166, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v166, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_89:
    v175 = v248;
    v144(v248, 1, 1, v105);
    goto LABEL_92;
  }
  v170 = *v166;
  v171 = *v166;
  sub_1BC6ED784((uint64_t)v166, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v170)
    goto LABEL_89;
  v172 = objc_msgSend(v171, sel_lastPushDate);

  if (v172)
  {
    v173 = (uint64_t)v235;
    sub_1BC816ED0();

    v174 = 0;
    v175 = v248;
  }
  else
  {
    v174 = 1;
    v175 = v248;
    v173 = (uint64_t)v235;
  }
  v144(v173, v174, 1, v105);
  sub_1BC7FBCC8(v173, v175);
LABEL_92:
  v176 = v165 + *(int *)(v265 + 48);
  v177 = MEMORY[0x1E0CB0870];
  v178 = v253;
  sub_1BC77A368(v253, v256, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v179 = (void (*)(uint64_t))v177;
  v180 = v256;
  sub_1BC77A368(v175, v176, (unint64_t *)&qword_1ED6B9BE8, v179);
  v181 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v275;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v275)(v180, 1, v105) == 1)
  {
    v182 = MEMORY[0x1E0CB0870];
    sub_1BC754350(v175, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    v183 = (void (*)(uint64_t))v182;
    v180 = v256;
    sub_1BC754350(v178, (unint64_t *)&qword_1ED6B9BE8, v183);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v275)(v176, 1, v105) == 1)
    {
      sub_1BC754350(v180, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
      v184 = v272;
      goto LABEL_99;
    }
    goto LABEL_97;
  }
  v185 = v239;
  sub_1BC77A368(v180, v239, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  if (v181(v176, 1, v105) == 1)
  {
    v186 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    sub_1BC754350(v248, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1BC754350(v253, (unint64_t *)&qword_1ED6B9BE8, v186);
    (*(void (**)(uint64_t, uint64_t))(v272 + 8))(v185, v105);
LABEL_97:
    v94 = &qword_1ED6B62E0;
    v95 = (unint64_t *)&qword_1ED6B9BE8;
    v96 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    v97 = v180;
    goto LABEL_11;
  }
  v184 = v272;
  v187 = v251;
  (*(void (**)(char *, uint64_t, uint64_t))(v272 + 32))(v251, v176, v105);
  v188 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  sub_1BC6F0A44((unint64_t *)&unk_1EF45D178, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v189 = sub_1BC817AB8();
  v190 = v144;
  v191 = *(void (**)(char *, uint64_t))(v184 + 8);
  v191(v187, v105);
  sub_1BC754350(v248, (unint64_t *)&qword_1ED6B9BE8, v188);
  sub_1BC754350(v253, (unint64_t *)&qword_1ED6B9BE8, v188);
  v191((char *)v185, v105);
  v144 = v190;
  v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
  sub_1BC754350(v256, (unint64_t *)&qword_1ED6B9BE8, v188);
  if ((v189 & 1) == 0)
    return 1;
LABEL_99:
  if (*v102)
  {
    v192 = objc_msgSend(*v102, sel_lastPulledUpdateDate);
    v193 = (uint64_t)v237;
    if (v192)
    {
      v194 = v192;
      v195 = (uint64_t)v233;
      sub_1BC816ED0();

      v196 = 0;
    }
    else
    {
      v196 = 1;
      v195 = (uint64_t)v233;
    }
    v197 = v236;
    v144(v195, v196, 1, v105);
    sub_1BC7FBCC8(v195, v243);
  }
  else
  {
    v144(v243, 1, 1, v105);
    v193 = (uint64_t)v237;
    v197 = v236;
  }
  sub_1BC77A368(v101, (uint64_t)v197, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v197, 1, v274) == 1)
  {
    sub_1BC754350((uint64_t)v197, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_110:
    v204 = v240;
    v144(v240, 1, 1, v105);
    goto LABEL_113;
  }
  v198 = *v197;
  v199 = *v197;
  v200 = (uint64_t)v197;
  v201 = v199;
  sub_1BC6ED784(v200, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v198)
    goto LABEL_110;
  v202 = objc_msgSend(v201, sel_lastPulledUpdateDate);

  if (v202)
  {
    sub_1BC816ED0();

    v203 = 0;
  }
  else
  {
    v203 = 1;
  }
  v204 = v240;
  v144(v193, v203, 1, v105);
  sub_1BC7FBCC8(v193, v204);
LABEL_113:
  v205 = v238;
  v206 = v238 + *(int *)(v265 + 48);
  v207 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  v208 = v243;
  sub_1BC77A368(v243, v238, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1BC77A368(v204, v206, (unint64_t *)&qword_1ED6B9BE8, v207);
  v209 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v275;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v275)(v205, 1, v105) != 1)
  {
    v210 = v232;
    sub_1BC77A368(v205, v232, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    if (v209(v206, 1, v105) != 1)
    {
      v212 = v251;
      (*(void (**)(char *, uint64_t, uint64_t))(v184 + 32))(v251, v206, v105);
      v213 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
      sub_1BC6F0A44((unint64_t *)&unk_1EF45D178, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
      v214 = sub_1BC817AB8();
      v215 = v205;
      v216 = *(void (**)(char *, uint64_t))(v184 + 8);
      v216(v212, v105);
      sub_1BC754350(v240, (unint64_t *)&qword_1ED6B9BE8, v213);
      sub_1BC754350(v243, (unint64_t *)&qword_1ED6B9BE8, v213);
      v216((char *)v210, v105);
      sub_1BC754350(v215, (unint64_t *)&qword_1ED6B9BE8, v213);
      if ((v214 & 1) == 0)
        return 1;
      goto LABEL_120;
    }
    v211 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    sub_1BC754350(v240, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1BC754350(v243, (unint64_t *)&qword_1ED6B9BE8, v211);
    (*(void (**)(uint64_t, uint64_t))(v184 + 8))(v210, v105);
    goto LABEL_118;
  }
  sub_1BC754350(v204, (unint64_t *)&qword_1ED6B9BE8, v207);
  sub_1BC754350(v208, (unint64_t *)&qword_1ED6B9BE8, v207);
  if (v209(v206, 1, v105) != 1)
  {
LABEL_118:
    v94 = &qword_1ED6B62E0;
    v95 = (unint64_t *)&qword_1ED6B9BE8;
    v96 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
    v97 = v205;
    goto LABEL_11;
  }
  sub_1BC754350(v205, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
LABEL_120:
  v217 = *v102;
  v106 = (unsigned int (*)(id *, uint64_t, uint64_t))v273;
  if (*v102)
  {
    v218 = objc_msgSend(*v102, sel_dataUploadRequestStatus);
    if (v218 != objc_msgSend(v217, sel_dataUploadRequestStatus))
      return 1;
  }
LABEL_122:
  if (!v255)
    return 0;
  if (!*v102
    || (v219 = objc_msgSend(*v102, sel_errorRequiringUserAction)) == 0
    || (v279 = v219,
        sub_1BC6E1878(),
        sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830),
        (swift_dynamicCast() & 1) == 0))
  {
    v222 = v245;
    sub_1BC77A368(v101, (uint64_t)v245, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v106(v222, 1, v274) == 1)
    {
      sub_1BC754350((uint64_t)v222, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    }
    else
    {
      v223 = *v222;
      v224 = *v222;
      sub_1BC6ED784((uint64_t)v222, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
      if (v223)
      {
        v225 = objc_msgSend(v224, sel_errorRequiringUserAction);

        if (v225)
        {

          return 1;
        }
      }
    }
    return 0;
  }
  v220 = v278;
  v221 = v234;
  sub_1BC77A368(v101, (uint64_t)v234, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v106(v221, 1, v274) == 1)
  {

    sub_1BC754350((uint64_t)v221, &qword_1ED6B7EE8, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    return 1;
  }
  v226 = *v221;
  v227 = *v221;
  sub_1BC6ED784((uint64_t)v221, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v226
    || (v228 = objc_msgSend(v227, sel_errorRequiringUserAction),
        v227,
        !v228)
    || (v279 = v228, (swift_dynamicCast() & 1) == 0))
  {

    return 1;
  }
  v229 = v278;
  v230 = objc_msgSend(v220, sel_isEqual_, v278);

  return (v230 & 1) == 0;
}

uint64_t CloudSyncStatusInputSignal.Anchor.merged(with:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC6ECB08(v1, a1, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t CloudSyncStatusInputSignal.Anchor.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC7F8F3C()
{
  return 0x737574617473;
}

uint64_t sub_1BC7F8F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1BC818694();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BC7F8FDC()
{
  sub_1BC7FBD1C();
  return sub_1BC8187FC();
}

uint64_t sub_1BC7F9004()
{
  sub_1BC7FBD1C();
  return sub_1BC818808();
}

uint64_t CloudSyncStatusInputSignal.Anchor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  char *v12;
  uint64_t active;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v23 = a2;
  sub_1BC788E10(0, &qword_1ED6B86D8, (uint64_t (*)(void))sub_1BC7FBD1C, (uint64_t)&type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - v6;
  v8 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (id *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = 0;
  v12 = (char *)v11 + *(int *)(v9 + 20);
  active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56))(v12, 1, 1, active);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7FBD1C();
  v14 = v26;
  sub_1BC8187E4();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    v17 = (uint64_t)v11;
  }
  else
  {
    v15 = v5;
    v16 = v23;
    sub_1BC7FBD60();
    sub_1BC7FBDB4();
    sub_1BC8185C8();
    v19 = v25;
    if (v25 >> 60 == 15)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
      v20 = 0;
    }
    else
    {
      v21 = v24;
      v26 = sub_1BC6ED7C0(0, &qword_1ED6BB3A0);
      sub_1BC6ED7C0(0, &qword_1ED6B85B0);
      v22 = v21;
      v20 = sub_1BC817F38();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
      sub_1BC6ECB4C(v22, v19);
    }

    *v11 = (id)v20;
    sub_1BC6ECB08((uint64_t)v11, v16, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    v17 = (uint64_t)v11;
  }
  return sub_1BC6ED784(v17, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t CloudSyncStatusInputSignal.Anchor.encode(to:)(_QWORD *a1)
{
  void **v1;
  void **v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v20[3];

  v2 = v1;
  v20[2] = *(id *)MEMORY[0x1E0C80C00];
  sub_1BC788E10(0, &qword_1ED6B86E8, (uint64_t (*)(void))sub_1BC7FBD1C, (uint64_t)&type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v20[-1] - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC7FBD1C();
  sub_1BC8187F0();
  v9 = *v2;
  if (v9)
  {
    v10 = (void *)objc_opt_self();
    v20[0] = 0;
    v11 = v9;
    v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, v20);
    v13 = v20[0];
    if (v12)
    {
      v14 = (void *)sub_1BC816E64();
      v16 = v15;

      v20[0] = v14;
      v20[1] = v16;
      sub_1BC70EADC();
      sub_1BC818634();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

      return sub_1BC6ECB60((uint64_t)v14, (unint64_t)v16);
    }
    v18 = v13;
    sub_1BC816D5C();

    swift_willThrow();
  }
  else
  {
    sub_1BC818640();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BC7F94E4()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC7F9500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC6ECB08(v1, a1, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1BC7F9528@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CloudSyncStatusInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_1BC7F953C(_QWORD *a1)
{
  return CloudSyncStatusInputSignal.Anchor.encode(to:)(a1);
}

uint64_t CloudSyncStatusInputSignal.Configuration.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeFirstRestore.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeFirstRestore.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeFirstRestore.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncDates.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncDates.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeSyncDates.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 3) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.modify())()
{
  return nullsub_1;
}

HealthPlatform::CloudSyncStatusInputSignal::Configuration __swiftcall CloudSyncStatusInputSignal.Configuration.init(observeSyncEnabled:observeFirstRestore:observeSyncDates:observeErrorRequiringUserAction:)(Swift::Bool observeSyncEnabled, Swift::Bool observeFirstRestore, Swift::Bool observeSyncDates, Swift::Bool observeErrorRequiringUserAction)
{
  Swift::Bool *v4;
  HealthPlatform::CloudSyncStatusInputSignal::Configuration result;

  *v4 = observeSyncEnabled;
  v4[1] = observeFirstRestore;
  v4[2] = observeSyncDates;
  v4[3] = observeErrorRequiringUserAction;
  result.observeSyncEnabled = observeSyncEnabled;
  return result;
}

uint64_t CloudSyncStatusInputSignal.Configuration.hash(into:)()
{
  sub_1BC818754();
  sub_1BC818754();
  sub_1BC818754();
  return sub_1BC818754();
}

uint64_t CloudSyncStatusInputSignal.Configuration.hashValue.getter()
{
  sub_1BC81873C();
  sub_1BC818754();
  sub_1BC818754();
  sub_1BC818754();
  sub_1BC818754();
  return sub_1BC818778();
}

uint64_t sub_1BC7F96F4()
{
  sub_1BC81873C();
  sub_1BC818754();
  sub_1BC818754();
  sub_1BC818754();
  sub_1BC818754();
  return sub_1BC818778();
}

uint64_t CloudSyncStatusInputSignal.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t CloudSyncStatusInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

void CloudSyncStatusInputSignal.beginObservation(from:configurations:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v2 = v1 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v1 + 16);
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(_QWORD *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1BC7F983C(v2, v0);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_1BC7F983C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (_QWORD *)(a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 24));
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, v6, v7);
}

Swift::Void __swiftcall CloudSyncStatusInputSignal.stopObservation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v2 = *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v1 + 16);
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(_QWORD *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  v4 = (_QWORD *)(v1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 24) + v2);
  v5 = v4[3];
  v6 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_1BC7F9964(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 24));
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
}

id CloudSyncStatusInputSignal.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CloudSyncStatusInputSignal.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CloudSyncStatusInputSignal.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC7F9AA4()
{
  return swift_unknownObjectRetain();
}

void sub_1BC7F9AD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v2 = v1 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v1 + 16);
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(_QWORD *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1BC7FE5F4(v2);
  os_unfair_lock_unlock(v3);
}

void sub_1BC7F9B5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  v2 = v1 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v1 + 16);
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(_QWORD *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1BC7F9964(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t _s14HealthPlatform15ActiveSyncStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t active;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  char v18;
  uint64_t (*v19)(_QWORD);
  uint64_t v21;

  v4 = type metadata accessor for SyncError(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC7FE670();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_1BC6ECB08(a1, (uint64_t)v14, type metadata accessor for ActiveSyncState);
  sub_1BC6ECB08(a2, v15, type metadata accessor for ActiveSyncState);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v17 = v16(v14, 2, v4);
  if (v17)
  {
    if (v17 == 1)
    {
      if (v16((char *)v15, 2, v4) != 1)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (v16((char *)v15, 2, v4) == 2)
    {
LABEL_8:
      v18 = 1;
LABEL_11:
      v19 = type metadata accessor for ActiveSyncState;
      goto LABEL_12;
    }
  }
  else
  {
    sub_1BC6ECB08((uint64_t)v14, (uint64_t)v10, type metadata accessor for ActiveSyncState);
    if (!v16((char *)v15, 2, v4))
    {
      sub_1BC6ECBA4(v15, (uint64_t)v7, type metadata accessor for SyncError);
      sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
      sub_1BC7F4BF8((unint64_t *)&unk_1EF45D098, MEMORY[0x1E0DEFD00]);
      v18 = sub_1BC8179F8();
      sub_1BC6ED784((uint64_t)v7, type metadata accessor for SyncError);
      sub_1BC6ED784((uint64_t)v10, type metadata accessor for SyncError);
      goto LABEL_11;
    }
    sub_1BC6ED784((uint64_t)v10, type metadata accessor for SyncError);
  }
LABEL_9:
  v18 = 0;
  v19 = (uint64_t (*)(_QWORD))sub_1BC7FE670;
LABEL_12:
  sub_1BC6ED784((uint64_t)v14, v19);
  return v18 & 1;
}

uint64_t type metadata accessor for ActiveSyncState(uint64_t a1)
{
  return sub_1BC738C70(a1, (uint64_t *)&unk_1ED6BA918);
}

unint64_t sub_1BC7F9E38()
{
  unint64_t result;

  result = qword_1EF45D0E8;
  if (!qword_1EF45D0E8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823AB4, &type metadata for ActiveSyncState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D0E8);
  }
  return result;
}

unint64_t sub_1BC7F9E7C()
{
  unint64_t result;

  result = qword_1EF45D0F8;
  if (!qword_1EF45D0F8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823A64, &type metadata for ActiveSyncState.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D0F8);
  }
  return result;
}

unint64_t sub_1BC7F9EC0()
{
  unint64_t result;

  result = qword_1EF45D108;
  if (!qword_1EF45D108)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823A14, &type metadata for ActiveSyncState.InProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D108);
  }
  return result;
}

unint64_t sub_1BC7F9F04()
{
  unint64_t result;

  result = qword_1EF45D118;
  if (!qword_1EF45D118)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8239C4, &type metadata for ActiveSyncState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D118);
  }
  return result;
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal.ObserverShim()
{
  return objc_opt_self();
}

BOOL _s14HealthPlatform26CloudSyncStatusInputSignalC13ConfigurationV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a1[1] ^ a2[1] | a1[2] ^ a2[2] | a2[3] ^ a1[3]) & 1) == 0;
}

unint64_t _s14HealthPlatform26CloudSyncStatusInputSignalC6AnchorV2eeoiySbAE_AEtFZ_0(id *a1, _QWORD *a2)
{
  uint64_t active;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t result;
  uint64_t v27;
  id *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  active = type metadata accessor for ActiveSyncState(0);
  v32 = *(_QWORD *)(active - 8);
  MEMORY[0x1E0C80A78](active);
  v30 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC78DBBC(0, qword_1ED6B8DF0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v7 = v6;
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - v8;
  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v11 = MEMORY[0x1E0C80A78](v10);
  v31 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v27 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v27 - v16;
  v18 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  v19 = *(int *)(v18 + 20);
  v28 = a1;
  sub_1BC77A368((uint64_t)a1 + v19, (uint64_t)v17, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v20 = *(int *)(v18 + 20);
  v29 = a2;
  sub_1BC77A368((uint64_t)a2 + v20, (uint64_t)v15, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v21 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_1BC77A368((uint64_t)v17, (uint64_t)v9, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC77A368((uint64_t)v15, v21, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  if (v22((uint64_t)v9, 1, active) == 1)
  {
    sub_1BC754350((uint64_t)v15, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC754350((uint64_t)v17, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    if (v22(v21, 1, active) == 1)
    {
      sub_1BC754350((uint64_t)v9, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v23 = (uint64_t)v30;
  v24 = v31;
  sub_1BC77A368((uint64_t)v9, v31, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v22(v21, 1, active) == 1)
  {
    sub_1BC754350((uint64_t)v15, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC754350((uint64_t)v17, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1BC6ED784(v24, type metadata accessor for ActiveSyncState);
LABEL_6:
    sub_1BC78DC1C((uint64_t)v9, qword_1ED6B8DF0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    return 0;
  }
  sub_1BC6ECBA4(v21, v23, type metadata accessor for ActiveSyncState);
  v25 = _s14HealthPlatform15ActiveSyncStateO2eeoiySbAC_ACtFZ_0(v24, v23);
  sub_1BC6ED784(v23, type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v15, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v17, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1BC6ED784(v24, type metadata accessor for ActiveSyncState);
  sub_1BC754350((uint64_t)v9, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if ((v25 & 1) == 0)
    return 0;
LABEL_8:
  result = ((unint64_t)*v28 | *v29) == 0;
  if (*v28)
  {
    if (*v29)
      return (unint64_t)objc_msgSend(*v28, sel_isEqual_);
  }
  return result;
}

uint64_t sub_1BC7FA34C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6572676F72506E69 && a2 == 0xEA00000000007373;
  if (v2 || (sub_1BC818694() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE900000000000064 || (sub_1BC818694() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1BC818694();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

id sub_1BC7FA4B0(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  uint64_t active;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v19;
  objc_super v20;
  _QWORD v21[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21[3] = type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
  v21[4] = &off_1E7523B98;
  v21[0] = a3;
  v12 = &a4[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_observer];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = (char *)v11 + *(int *)(v9 + 20);
  active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56))(v13, 1, 1, active);
  sub_1BC6FC700((uint64_t)v21, (uint64_t)v11 + *(int *)(v9 + 24));
  *v11 = 0;
  sub_1BC7FE60C();
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + ((*(unsigned int *)(*(_QWORD *)v15 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1BC6ECB08((uint64_t)v11, v15 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v15 + 16), type metadata accessor for CloudSyncStatusInputSignal.State);
  v16 = a4;
  swift_unknownObjectRetain();
  sub_1BC6ED784((uint64_t)v11, type metadata accessor for CloudSyncStatusInputSignal.State);
  *(_QWORD *)&v16[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState] = v15;

  v20.receiver = v16;
  v20.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v20, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  return v17;
}

id sub_1BC7FA65C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  objc_class *ObjectType;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *boxed_opaque_existential_1;
  char *v17;
  char *v18;
  uint64_t active;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v24;
  objc_super v25;
  uint64_t v26[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v13 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (uint64_t *)((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26[3] = a5;
  v26[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  v17 = &a4[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_observer];
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;
  v18 = (char *)v15 + *(int *)(v13 + 20);
  active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 56))(v18, 1, 1, active);
  sub_1BC6FC700((uint64_t)v26, (uint64_t)v15 + *(int *)(v13 + 24));
  *v15 = 0;
  sub_1BC7FE60C();
  v20 = swift_allocObject();
  *(_DWORD *)(v20 + ((*(unsigned int *)(*(_QWORD *)v20 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1BC6ECB08((uint64_t)v15, v20 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v20 + 16), type metadata accessor for CloudSyncStatusInputSignal.State);
  v21 = a4;
  swift_unknownObjectRetain();
  sub_1BC6ED784((uint64_t)v15, type metadata accessor for CloudSyncStatusInputSignal.State);
  *(_QWORD *)&v21[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState] = v20;

  v25.receiver = v21;
  v25.super_class = ObjectType;
  v22 = objc_msgSendSuper2(&v25, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  return v22;
}

id sub_1BC7FA824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  Class v14;
  char *v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)objc_allocWithZone(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a3, a5);
  return sub_1BC7FA65C(a1, a2, (uint64_t)v13, v15, a5, a6);
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal.Anchor(uint64_t a1)
{
  return sub_1BC738C70(a1, (uint64_t *)&unk_1ED6B6308);
}

uint64_t sub_1BC7FA8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC7FA93C(void *a1)
{
  uint64_t active;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v5 = sub_1BC817590();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED6B8018);
  v6 = a1;
  v7 = sub_1BC81756C();
  v8 = sub_1BC817E9C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v23 = v21;
    *(_DWORD *)v9 = 136315394;
    v10 = sub_1BC818814();
    v22 = sub_1BC6E14D8(v10, v11, &v23);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v20 = v9 + 14;
    v12 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = sub_1BC817AE8();
    v16 = v15;

    v22 = sub_1BC6E14D8(v14, v16, &v23);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v7, v8, "[%s] cloudSyncObserver syncDidStartWith progress:%s", (uint8_t *)v9, 0x16u);
    v17 = v21;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v17, -1, -1);
    MEMORY[0x1BCCF5BA4](v9, -1, -1);

  }
  else
  {

  }
  v18 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 1, 2, v18);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);
  return sub_1BC6ED784((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1BC7FABE0(void *a1)
{
  uint64_t active;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v5 = sub_1BC817590();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED6B8018);
  v6 = a1;
  v7 = a1;
  v8 = sub_1BC81756C();
  v9 = sub_1BC817E9C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v22 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = sub_1BC818814();
    v21 = sub_1BC6E14D8(v12, v13, &v22);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    v21 = (uint64_t)a1;
    v14 = a1;
    sub_1BC6E1440(0, (unint64_t *)&qword_1EF45D080, (void (*)(uint64_t))sub_1BC6E1878);
    v15 = sub_1BC817AF4();
    v21 = sub_1BC6E14D8(v15, v16, &v22);
    sub_1BC818148();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC6DD000, v8, v9, "[%s] cloudSyncObserver syncFailed with error: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v11, -1, -1);
    MEMORY[0x1BCCF5BA4](v10, -1, -1);
  }
  else
  {

  }
  v17 = a1;
  if (!a1)
    v17 = objc_msgSend((id)objc_opt_self(), sel_hk_error_userInfo_, 0, 0);
  v18 = a1;
  sub_1BC816D50();
  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
  sub_1BC817A10();
  v19 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 2, v19);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);

  return sub_1BC6ED784((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t _s14HealthPlatform26CloudSyncStatusInputSignalC05cloudd8ObserverD9CompletedyySo07HKClouddI0CF_0()
{
  uint64_t active;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v3 = sub_1BC817590();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED6B8018);
  v4 = sub_1BC81756C();
  v5 = sub_1BC817E9C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v13 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = sub_1BC818814();
    v12 = sub_1BC6E14D8(v8, v9, &v13);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v4, v5, "[%s] cloudSyncObserverSyncCompleted", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v7, -1, -1);
    MEMORY[0x1BCCF5BA4](v6, -1, -1);
  }

  v10 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v2, 2, 2, v10);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v2);
  return sub_1BC6ED784((uint64_t)v2, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1BC7FB0EC(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  swift_getObjectType();
  if (qword_1ED6B8030 != -1)
    swift_once();
  v2 = sub_1BC817590();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED6B8018);
  v3 = a1;
  v4 = sub_1BC81756C();
  v5 = sub_1BC817E9C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v16 = v15;
    *(_DWORD *)v6 = 136315394;
    v7 = sub_1BC818814();
    sub_1BC6E14D8(v7, v8, &v16);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    v9 = v3;
    v10 = objc_msgSend(v9, sel_description);
    v11 = sub_1BC817AE8();
    v13 = v12;

    sub_1BC6E14D8(v11, v13, &v16);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC6DD000, v4, v5, "[%s] cloudSyncObserverStatusUpdated with status: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v15, -1, -1);
    MEMORY[0x1BCCF5BA4](v6, -1, -1);

  }
  else
  {

  }
  return CloudSyncStatusInputSignal.didUpdate(status:)(v3);
}

uint64_t sub_1BC7FB328(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t active;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v9 = sub_1BC817590();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED6B8018);
  v10 = a1;
  v11 = a2;
  v12 = v10;
  v13 = v11;
  v14 = sub_1BC81756C();
  v15 = sub_1BC817E9C();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v39 = v36;
    *(_DWORD *)v17 = 136315650;
    v18 = sub_1BC818814();
    v35 = v16;
    v38 = sub_1BC6E14D8(v18, v19, &v39);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v20 = objc_msgSend(v12, sel_description);
    v21 = sub_1BC817AE8();
    v37 = v3;
    v23 = v22;

    v38 = sub_1BC6E14D8(v21, v23, &v39);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    v24 = v13;
    v25 = objc_msgSend(v24, sel_description);
    v26 = sub_1BC817AE8();
    v28 = v27;

    v38 = sub_1BC6E14D8(v26, v28, &v39);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v29, -1, -1);
    MEMORY[0x1BCCF5BA4](v17, -1, -1);

  }
  else
  {

  }
  v30 = objc_msgSend(v13, sel_isFinished);
  v31 = type metadata accessor for SyncError(0);
  if (v30)
    v32 = 2;
  else
    v32 = 1;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v8, v32, 2, v31);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v8);
  return sub_1BC6ED784((uint64_t)v8, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1BC7FB678(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t active;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = v2;
  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v9 = sub_1BC817590();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED6B8018);
  v10 = a1;
  v11 = a2;
  v12 = v10;
  v13 = a2;
  v14 = sub_1BC81756C();
  v15 = sub_1BC817E9C();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    v37 = v34;
    *(_DWORD *)v17 = 136315650;
    v18 = sub_1BC818814();
    v36 = sub_1BC6E14D8(v18, v19, &v37);
    v33 = v16;
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v20 = objc_msgSend(v12, sel_description);
    v21 = sub_1BC817AE8();
    v35 = v3;
    v23 = v22;

    v36 = sub_1BC6E14D8(v21, v23, &v37);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    v36 = (uint64_t)a2;
    v24 = a2;
    sub_1BC6E1440(0, (unint64_t *)&qword_1EF45D080, (void (*)(uint64_t))sub_1BC6E1878);
    v25 = sub_1BC817AF4();
    v36 = sub_1BC6E14D8(v25, v26, &v37);
    sub_1BC818148();
    swift_bridgeObjectRelease();

    v27 = v34;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v27, -1, -1);
    MEMORY[0x1BCCF5BA4](v17, -1, -1);
  }
  else
  {

  }
  v28 = a2;
  if (!a2)
    v28 = objc_msgSend((id)objc_opt_self(), sel_hk_error_userInfo_, 0, 0);
  v29 = a2;
  sub_1BC816D50();
  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA830);
  sub_1BC817A10();
  v30 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v8, 0, 2, v30);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v8);

  return sub_1BC6ED784((uint64_t)v8, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1BC7FBA2C(void *a1)
{
  uint64_t active;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  swift_getObjectType();
  active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1E0C80A78](active);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED6B8030 != -1)
    swift_once();
  v5 = sub_1BC817590();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED6B8018);
  v6 = a1;
  v7 = sub_1BC81756C();
  v8 = sub_1BC817E9C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v22 = v20;
    *(_DWORD *)v9 = 136315394;
    v10 = sub_1BC818814();
    v21 = sub_1BC6E14D8(v10, v11, &v22);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v12 = objc_msgSend(v6, sel_description, v9 + 14);
    v13 = sub_1BC817AE8();
    v15 = v14;

    v21 = sub_1BC6E14D8(v13, v15, &v22);
    sub_1BC818148();

    swift_bridgeObjectRelease();
    v16 = v20;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v16, -1, -1);
    MEMORY[0x1BCCF5BA4](v9, -1, -1);

  }
  else
  {

  }
  v17 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 2, 2, v17);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);
  return sub_1BC6ED784((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1BC7FBCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6E1440(0, (unint64_t *)&qword_1ED6B9BE8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BC7FBD1C()
{
  unint64_t result;

  result = qword_1ED6B7E90;
  if (!qword_1ED6B7E90)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823974, &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B7E90);
  }
  return result;
}

void sub_1BC7FBD60()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B7C18)
  {
    v0 = sub_1BC818130();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B7C18);
  }
}

unint64_t sub_1BC7FBDB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_1ED6B7C20;
  if (!qword_1ED6B7C20)
  {
    sub_1BC7FBD60();
    v2 = v1;
    v3 = sub_1BC70E978();
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0DEE9A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1ED6B7C20);
  }
  return result;
}

uint64_t sub_1BC7FBE14()
{
  return sub_1BC6F0A44(&qword_1EF45D188, 255, type metadata accessor for SyncError, (uint64_t)&protocol conformance descriptor for SyncError);
}

uint64_t sub_1BC7FBE44()
{
  return sub_1BC6F0A44((unint64_t *)&unk_1EF45D190, 255, type metadata accessor for ActiveSyncState, (uint64_t)&protocol conformance descriptor for ActiveSyncState);
}

uint64_t sub_1BC7FBE74()
{
  return sub_1BC6F0A44((unint64_t *)&unk_1ED6B7ED8, 255, type metadata accessor for CloudSyncStatusInputSignal.Anchor, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1BC7FBEA4()
{
  return sub_1BC6F0A44(&qword_1ED6B7EC0, 255, type metadata accessor for CloudSyncStatusInputSignal.Anchor, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1BC7FBED4()
{
  return sub_1BC6F0A44((unint64_t *)&unk_1ED6B7EC8, 255, type metadata accessor for CloudSyncStatusInputSignal.Anchor, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal.Anchor);
}

unint64_t sub_1BC7FBF08()
{
  unint64_t result;

  result = qword_1EF45D1A0[0];
  if (!qword_1EF45D1A0[0])
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for CloudSyncStatusInputSignal.Configuration, &type metadata for CloudSyncStatusInputSignal.Configuration);
    atomic_store(result, qword_1EF45D1A0);
  }
  return result;
}

unint64_t sub_1BC7FBF50()
{
  unint64_t result;

  result = qword_1ED6B7E68;
  if (!qword_1ED6B7E68)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for CloudSyncStatusInputSignal.Configuration, &type metadata for CloudSyncStatusInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_1ED6B7E68);
  }
  return result;
}

unint64_t sub_1BC7FBF98()
{
  unint64_t result;

  result = qword_1ED6B7E70;
  if (!qword_1ED6B7E70)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for CloudSyncStatusInputSignal.Configuration, &type metadata for CloudSyncStatusInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_1ED6B7E70);
  }
  return result;
}

uint64_t sub_1BC7FBFDC(uint64_t a1, uint64_t a2)
{
  return sub_1BC6F0A44(&qword_1ED6B9488, a2, (uint64_t (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal, MEMORY[0x1E0CB2120]);
}

uint64_t sub_1BC7FC008()
{
  return sub_1BC6F0A44((unint64_t *)&unk_1ED6B7EB0, 255, type metadata accessor for CloudSyncStatusInputSignal.Anchor, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t dispatch thunk of CloudSyncStatusObserverShim.startObserving(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of CloudSyncStatusObserverShim.stopObserving()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for SyncError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for SyncError(uint64_t a1)
{
  uint64_t v2;

  sub_1BC7F4B24();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SyncError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SyncError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SyncError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SyncError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncError()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FC1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SyncError()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FC21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC7F4B24();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_1BC7FC25C()
{
  unint64_t v0;

  sub_1BC7F4B24();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for ActiveSyncState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for SyncError(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      sub_1BC7F4B24();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for ActiveSyncState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = type metadata accessor for SyncError(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    sub_1BC7F4B24();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *initializeWithCopy for ActiveSyncState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for SyncError(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithCopy for ActiveSyncState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for SyncError(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      sub_1BC7F4B24();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_1BC6ED784((uint64_t)a1, type metadata accessor for SyncError);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  sub_1BC7F4B24();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *initializeWithTake for ActiveSyncState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for SyncError(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithTake for ActiveSyncState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for SyncError(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      sub_1BC7F4B24();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_1BC6ED784((uint64_t)a1, type metadata accessor for SyncError);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  sub_1BC7F4B24();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActiveSyncState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FC778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for SyncError(0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ActiveSyncState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FC7D0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = type metadata accessor for SyncError(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_1BC7FC824(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SyncError(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
}

uint64_t sub_1BC7FC85C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SyncError(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 2, v4);
}

void sub_1BC7FC89C()
{
  unint64_t v0;

  sub_1BC7F4B24();
  if (v0 <= 0x3F)
    swift_initEnumMetadataSinglePayload();
}

uint64_t method lookup function for CloudSyncStatusInputSignal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CloudSyncStatusInputSignal.__allocating_init(observer:shim:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void **initializeBufferWithCopyOfBuffer for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t active;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    active = type metadata accessor for ActiveSyncState(0);
    v10 = *(_QWORD *)(active - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    v12 = v4;
    if (v11(v8, 1, active))
    {
      sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v14 = type metadata accessor for SyncError(0);
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 2, v14))
      {
        memcpy(v7, v8, *(_QWORD *)(v10 + 64));
      }
      else
      {
        sub_1BC7F4B24();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v7, v8, v16);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 2, v14);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, active);
    }
  }
  return v5;
}

uint64_t destroy for CloudSyncStatusInputSignal.Anchor(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t active;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  active = type metadata accessor for ActiveSyncState(0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 48))(v4, 1, active);
  if (!(_DWORD)result)
  {
    v7 = type metadata accessor for SyncError(0);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v4, 2, v7);
    if (!(_DWORD)result)
    {
      sub_1BC7F4B24();
      return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v4, v8);
    }
  }
  return result;
}

void **initializeWithCopy for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t active;
  uint64_t v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  active = type metadata accessor for ActiveSyncState(0);
  v9 = *(_QWORD *)(active - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v11 = v4;
  if (v10(v7, 1, active))
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = type metadata accessor for SyncError(0);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 2, v13))
    {
      memcpy(v6, v7, *(_QWORD *)(v9 + 64));
    }
    else
    {
      sub_1BC7F4B24();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v6, v7, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v6, 0, 2, v13);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, active);
  }
  return a1;
}

void **assignWithCopy for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t active;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  v8 = v7;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  active = type metadata accessor for ActiveSyncState(0);
  v13 = *(_QWORD *)(active - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, active);
  v16 = v14(v11, 1, active);
  if (!v15)
  {
    if (!v16)
    {
      v21 = type metadata accessor for SyncError(0);
      v22 = *(_QWORD *)(v21 - 8);
      v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
      v24 = v23(v10, 2, v21);
      v25 = v23(v11, 2, v21);
      if (v24)
      {
        if (!v25)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v10, v11, v26);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v10, 0, 2, v21);
          return a1;
        }
      }
      else
      {
        if (!v25)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v10, v11, v29);
          return a1;
        }
        sub_1BC6ED784((uint64_t)v10, type metadata accessor for SyncError);
      }
      v18 = *(_QWORD *)(v13 + 64);
      goto LABEL_7;
    }
    sub_1BC6ED784((uint64_t)v10, type metadata accessor for ActiveSyncState);
LABEL_6:
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    v18 = *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64);
LABEL_7:
    memcpy(v10, v11, v18);
    return a1;
  }
  if (v16)
    goto LABEL_6;
  v19 = type metadata accessor for SyncError(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 2, v19))
  {
    memcpy(v10, v11, *(_QWORD *)(v13 + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v10, v11, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v10, 0, 2, v19);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, active);
  return a1;
}

_QWORD *initializeWithTake for CloudSyncStatusInputSignal.Anchor(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t active;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  active = type metadata accessor for ActiveSyncState(0);
  v8 = *(_QWORD *)(active - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, active))
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = type metadata accessor for SyncError(0);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 2, v10))
    {
      memcpy(v5, v6, *(_QWORD *)(v8 + 64));
    }
    else
    {
      sub_1BC7F4B24();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v5, v6, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 2, v10);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, active);
  }
  return a1;
}

void **assignWithTake for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t active;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  active = type metadata accessor for ActiveSyncState(0);
  v11 = *(_QWORD *)(active - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, active);
  v14 = v12(v9, 1, active);
  if (!v13)
  {
    if (!v14)
    {
      v19 = type metadata accessor for SyncError(0);
      v20 = *(_QWORD *)(v19 - 8);
      v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
      v22 = v21(v8, 2, v19);
      v23 = v21(v9, 2, v19);
      if (v22)
      {
        if (!v23)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v8, v9, v24);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v8, 0, 2, v19);
          return a1;
        }
      }
      else
      {
        if (!v23)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 40))(v8, v9, v27);
          return a1;
        }
        sub_1BC6ED784((uint64_t)v8, type metadata accessor for SyncError);
      }
      v16 = *(_QWORD *)(v11 + 64);
      goto LABEL_7;
    }
    sub_1BC6ED784((uint64_t)v8, type metadata accessor for ActiveSyncState);
LABEL_6:
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    v16 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
LABEL_7:
    memcpy(v8, v9, v16);
    return a1;
  }
  if (v14)
    goto LABEL_6;
  v17 = type metadata accessor for SyncError(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 2, v17))
  {
    memcpy(v8, v9, *(_QWORD *)(v11 + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v8, v9, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v8, 0, 2, v17);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudSyncStatusInputSignal.Anchor()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FD1E0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for CloudSyncStatusInputSignal.Anchor()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1BC7FD284(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_1BC7FD308()
{
  unint64_t v0;

  sub_1BC6E1440(319, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CloudSyncStatusInputSignal.Configuration(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[4])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudSyncStatusInputSignal.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 4) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudSyncStatusInputSignal.Configuration()
{
  return &type metadata for CloudSyncStatusInputSignal.Configuration;
}

void **sub_1BC7FD43C(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t active;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    active = type metadata accessor for ActiveSyncState(0);
    v12 = *(_QWORD *)(active - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, active))
    {
      sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v16 = type metadata accessor for SyncError(0);
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 2, v16))
      {
        memcpy(v9, v10, *(_QWORD *)(v12 + 64));
      }
      else
      {
        sub_1BC7F4B24();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v9, v10, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v9, 0, 2, v16);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, active);
    }
    v19 = *(int *)(a3 + 24);
    v20 = *(_OWORD *)((char *)a2 + v19 + 24);
    *(_OWORD *)((char *)v7 + v19 + 24) = v20;
    (**(void (***)(void))(v20 - 8))();
  }
  return v7;
}

uint64_t sub_1BC7FD5CC(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t active;
  uint64_t v6;
  uint64_t v7;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  active = type metadata accessor for ActiveSyncState(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 48))(v4, 1, active))
  {
    v6 = type metadata accessor for SyncError(0);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 2, v6))
    {
      sub_1BC7F4B24();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + *(int *)(a2 + 24));
}

void **sub_1BC7FD670(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t active;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  active = type metadata accessor for ActiveSyncState(0);
  v11 = *(_QWORD *)(active - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, active))
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = type metadata accessor for SyncError(0);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 2, v15))
    {
      memcpy(v8, v9, *(_QWORD *)(v11 + 64));
    }
    else
    {
      sub_1BC7F4B24();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v8, v9, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v8, 0, 2, v15);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
  }
  v18 = *(int *)(a3 + 24);
  v19 = *(_OWORD *)((char *)a2 + v18 + 24);
  *(_OWORD *)((char *)a1 + v18 + 24) = v19;
  (**(void (***)(void))(v19 - 8))();
  return a1;
}

void **sub_1BC7FD7D8(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t active;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  v8 = v7;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  active = type metadata accessor for ActiveSyncState(0);
  v13 = *(_QWORD *)(active - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, active);
  v16 = v14(v11, 1, active);
  if (!v15)
  {
    if (!v16)
    {
      v21 = type metadata accessor for SyncError(0);
      v22 = *(_QWORD *)(v21 - 8);
      v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
      v24 = v23(v10, 2, v21);
      v25 = v23(v11, 2, v21);
      if (v24)
      {
        if (!v25)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v10, v11, v26);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v10, 0, 2, v21);
          goto LABEL_15;
        }
      }
      else
      {
        if (!v25)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v10, v11, v29);
          goto LABEL_15;
        }
        sub_1BC6ED784((uint64_t)v10, type metadata accessor for SyncError);
      }
      v18 = *(_QWORD *)(v13 + 64);
      goto LABEL_7;
    }
    sub_1BC6ED784((uint64_t)v10, type metadata accessor for ActiveSyncState);
LABEL_6:
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    v18 = *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64);
LABEL_7:
    memcpy(v10, v11, v18);
    goto LABEL_15;
  }
  if (v16)
    goto LABEL_6;
  v19 = type metadata accessor for SyncError(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 2, v19))
  {
    memcpy(v10, v11, *(_QWORD *)(v13 + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v10, v11, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v10, 0, 2, v19);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, active);
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + *(int *)(a3 + 24)), (uint64_t *)((char *)a2 + *(int *)(a3 + 24)));
  return a1;
}

_QWORD *sub_1BC7FDA2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t active;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  active = type metadata accessor for ActiveSyncState(0);
  v10 = *(_QWORD *)(active - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, active))
  {
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = type metadata accessor for SyncError(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 2, v12))
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      sub_1BC7F4B24();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v7, v8, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v7, 0, 2, v12);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, active);
  }
  v15 = *(int *)(a3 + 24);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((_QWORD *)v16 + 4) = *((_QWORD *)v17 + 4);
  return a1;
}

void **sub_1BC7FDB88(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t active;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 v29;
  uint64_t v31;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  active = type metadata accessor for ActiveSyncState(0);
  v11 = *(_QWORD *)(active - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, active);
  v14 = v12(v9, 1, active);
  if (!v13)
  {
    if (!v14)
    {
      v19 = type metadata accessor for SyncError(0);
      v20 = *(_QWORD *)(v19 - 8);
      v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
      v22 = v21(v8, 2, v19);
      v23 = v21(v9, 2, v19);
      if (v22)
      {
        if (!v23)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v8, v9, v24);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v8, 0, 2, v19);
          goto LABEL_15;
        }
      }
      else
      {
        if (!v23)
        {
          sub_1BC7F4B24();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v8, v9, v31);
          goto LABEL_15;
        }
        sub_1BC6ED784((uint64_t)v8, type metadata accessor for SyncError);
      }
      v16 = *(_QWORD *)(v11 + 64);
      goto LABEL_7;
    }
    sub_1BC6ED784((uint64_t)v8, type metadata accessor for ActiveSyncState);
LABEL_6:
    sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    v16 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
LABEL_7:
    memcpy(v8, v9, v16);
    goto LABEL_15;
  }
  if (v14)
    goto LABEL_6;
  v17 = type metadata accessor for SyncError(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 2, v17))
  {
    memcpy(v8, v9, *(_QWORD *)(v11 + 64));
  }
  else
  {
    sub_1BC7F4B24();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v8, v9, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v8, 0, 2, v17);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
LABEL_15:
  v26 = *(int *)(a3 + 24);
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + v26);
  v29 = *((_OWORD *)v28 + 1);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *((_OWORD *)v27 + 1) = v29;
  *((_QWORD *)v27 + 4) = *((_QWORD *)v28 + 4);
  return a1;
}

uint64_t sub_1BC7FDDEC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC7FDDF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1BC7FDE8C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1BC7FDE98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  sub_1BC6E1440(0, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal.State(uint64_t a1)
{
  return sub_1BC738C70(a1, qword_1ED6B7E78);
}

void sub_1BC7FDF3C()
{
  unint64_t v0;

  sub_1BC6E1440(319, &qword_1ED6B9398, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for CloudSyncStatusInputSignal.Anchor.CodingKeys()
{
  return &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ActiveSyncState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC7FE028 + 4 * byte_1BC823105[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BC7FE05C + 4 * byte_1BC823100[v4]))();
}

uint64_t sub_1BC7FE05C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FE064(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC7FE06CLL);
  return result;
}

uint64_t sub_1BC7FE078(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC7FE080);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BC7FE084(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FE08C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActiveSyncState.CodingKeys()
{
  return &type metadata for ActiveSyncState.CodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.InProgressCodingKeys()
{
  return &type metadata for ActiveSyncState.InProgressCodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.CompletedCodingKeys()
{
  return &type metadata for ActiveSyncState.CompletedCodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.FailedCodingKeys()
{
  return &type metadata for ActiveSyncState.FailedCodingKeys;
}

uint64_t _s14HealthPlatform26CloudSyncStatusInputSignalC6AnchorV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BC7FE118 + 4 * byte_1BC82310A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BC7FE138 + 4 * byte_1BC82310F[v4]))();
}

_BYTE *sub_1BC7FE118(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BC7FE138(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7FE140(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7FE148(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC7FE150(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC7FE158(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SyncError.CodingKeys()
{
  return &type metadata for SyncError.CodingKeys;
}

unint64_t sub_1BC7FE178()
{
  unint64_t result;

  result = qword_1EF45D248;
  if (!qword_1EF45D248)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823674, &type metadata for SyncError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D248);
  }
  return result;
}

unint64_t sub_1BC7FE1C0()
{
  unint64_t result;

  result = qword_1EF45D250;
  if (!qword_1EF45D250)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82372C, &type metadata for ActiveSyncState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D250);
  }
  return result;
}

unint64_t sub_1BC7FE208()
{
  unint64_t result;

  result = qword_1EF45D258;
  if (!qword_1EF45D258)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823884, &type metadata for ActiveSyncState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D258);
  }
  return result;
}

unint64_t sub_1BC7FE250()
{
  unint64_t result;

  result = qword_1EF45D260;
  if (!qword_1EF45D260)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82393C, &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D260);
  }
  return result;
}

unint64_t sub_1BC7FE298()
{
  unint64_t result;

  result = qword_1ED6B7EA8;
  if (!qword_1ED6B7EA8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8238AC, &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B7EA8);
  }
  return result;
}

unint64_t sub_1BC7FE2E0()
{
  unint64_t result;

  result = qword_1ED6B7EA0;
  if (!qword_1ED6B7EA0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8238D4, &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6B7EA0);
  }
  return result;
}

unint64_t sub_1BC7FE328()
{
  unint64_t result;

  result = qword_1EF45D268;
  if (!qword_1EF45D268)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8237F4, &type metadata for ActiveSyncState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D268);
  }
  return result;
}

unint64_t sub_1BC7FE370()
{
  unint64_t result;

  result = qword_1EF45D270;
  if (!qword_1EF45D270)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82381C, &type metadata for ActiveSyncState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D270);
  }
  return result;
}

unint64_t sub_1BC7FE3B8()
{
  unint64_t result;

  result = qword_1EF45D278;
  if (!qword_1EF45D278)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8237A4, &type metadata for ActiveSyncState.InProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D278);
  }
  return result;
}

unint64_t sub_1BC7FE400()
{
  unint64_t result;

  result = qword_1EF45D280;
  if (!qword_1EF45D280)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8237CC, &type metadata for ActiveSyncState.InProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D280);
  }
  return result;
}

unint64_t sub_1BC7FE448()
{
  unint64_t result;

  result = qword_1EF45D288;
  if (!qword_1EF45D288)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC823754, &type metadata for ActiveSyncState.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D288);
  }
  return result;
}

unint64_t sub_1BC7FE490()
{
  unint64_t result;

  result = qword_1EF45D290;
  if (!qword_1EF45D290)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82377C, &type metadata for ActiveSyncState.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D290);
  }
  return result;
}

unint64_t sub_1BC7FE4D8()
{
  unint64_t result;

  result = qword_1EF45D298;
  if (!qword_1EF45D298)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82369C, &type metadata for ActiveSyncState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D298);
  }
  return result;
}

unint64_t sub_1BC7FE520()
{
  unint64_t result;

  result = qword_1EF45D2A0;
  if (!qword_1EF45D2A0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8236C4, &type metadata for ActiveSyncState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D2A0);
  }
  return result;
}

unint64_t sub_1BC7FE568()
{
  unint64_t result;

  result = qword_1EF45D2A8;
  if (!qword_1EF45D2A8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8235E4, &type metadata for SyncError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D2A8);
  }
  return result;
}

unint64_t sub_1BC7FE5B0()
{
  unint64_t result;

  result = qword_1EF45D2B0;
  if (!qword_1EF45D2B0)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC82360C, &type metadata for SyncError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D2B0);
  }
  return result;
}

uint64_t sub_1BC7FE5F4(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC7F983C(a1, *(_QWORD *)(v1 + 16));
}

void sub_1BC7FE60C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8660)
  {
    type metadata accessor for CloudSyncStatusInputSignal.State(255);
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_1BC818340();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8660);
  }
}

void sub_1BC7FE670()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF45D2B8)
  {
    type metadata accessor for ActiveSyncState(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF45D2B8);
  }
}

uint64_t SearchSection.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL static SearchMode.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t SearchMode.hash(into:)()
{
  return sub_1BC818748();
}

uint64_t SearchMode.hashValue.getter()
{
  sub_1BC81873C();
  sub_1BC818748();
  return sub_1BC818778();
}

uint64_t sub_1BC7FE754()
{
  sub_1BC81873C();
  sub_1BC818760();
  return sub_1BC818778();
}

uint64_t sub_1BC7FE798()
{
  return sub_1BC818760();
}

uint64_t sub_1BC7FE7C0()
{
  sub_1BC81873C();
  sub_1BC818760();
  return sub_1BC818778();
}

uint64_t sub_1BC7FE800@<X0>(unsigned __int16 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s14HealthPlatform13SearchSectionO8rawValueACSgs5Int16V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1BC7FE828(_WORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t _s14HealthPlatform13SearchSectionO8rawValueACSgs5Int16V_tcfC_0(uint64_t result)
{
  if ((unsigned __int16)result >= 0xDu)
    return 13;
  else
    return (unsigned __int16)result;
}

unint64_t sub_1BC7FE84C()
{
  unint64_t result;

  result = qword_1EF45D2C0;
  if (!qword_1EF45D2C0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for SearchMode, &type metadata for SearchMode);
    atomic_store(result, (unint64_t *)&qword_1EF45D2C0);
  }
  return result;
}

unint64_t sub_1BC7FE894()
{
  unint64_t result;

  result = qword_1EF45D2C8;
  if (!qword_1EF45D2C8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for SearchSection, &type metadata for SearchSection);
    atomic_store(result, (unint64_t *)&qword_1EF45D2C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SearchMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC7FE924 + 4 * byte_1BC823B59[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BC7FE958 + 4 * byte_1BC823B54[v4]))();
}

uint64_t sub_1BC7FE958(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FE960(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC7FE968);
  return result;
}

uint64_t sub_1BC7FE974(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC7FE97CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BC7FE980(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FE988(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchMode()
{
  return &type metadata for SearchMode;
}

uint64_t getEnumTagSinglePayload for SearchSection(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchSection(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1BC7FEA80 + 4 * byte_1BC823B63[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BC7FEAB4 + 4 * byte_1BC823B5E[v4]))();
}

uint64_t sub_1BC7FEAB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FEABC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC7FEAC4);
  return result;
}

uint64_t sub_1BC7FEAD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC7FEAD8);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BC7FEADC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC7FEAE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchSection()
{
  return &type metadata for SearchSection;
}

uint64_t AddSharedSummariesExecutor.run(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void (*)(void *, char), char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t ObjectType;
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  v26 = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)&v23 - v12;
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  v23 = v14;
  ObjectType = swift_getObjectType();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, AssociatedTypeWitness);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = (v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a4;
  *((_QWORD *)v17 + 3) = a5;
  *((_QWORD *)v17 + 4) = v5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v15], v13, AssociatedTypeWitness);
  v18 = &v17[v16];
  v19 = v26;
  *(_QWORD *)v18 = v25;
  *((_QWORD *)v18 + 1) = v19;
  v20 = v23;
  v21 = *(void (**)(void (*)(void *, char), char *, uint64_t, uint64_t))(v23 + 40);
  swift_unknownObjectRetain();
  swift_retain();
  v21(sub_1BC7FF0A8, v17, ObjectType, v20);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1BC7FECB8(id a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v14;
  void (*v15)(uint64_t, void (*)(void *, char), _QWORD *, uint64_t, uint64_t);
  char v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(id);
  void (*v31)(id);
  void *v32;
  uint64_t v33;
  uint64_t v34;

  if ((a2 & 1) != 0)
  {
    v17 = a1;
    if (qword_1ED6B8030 != -1)
      swift_once();
    v18 = sub_1BC817590();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED6B8018);
    v19 = a1;
    v20 = a1;
    v21 = sub_1BC81756C();
    v22 = sub_1BC817E84();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v34 = v24;
      *(_DWORD *)v23 = 136446466;
      v25 = sub_1BC818814();
      sub_1BC6E14D8(v25, v26, &v34);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      v27 = a1;
      sub_1BC6E1878();
      v28 = sub_1BC817AF4();
      sub_1BC6E14D8(v28, v29, &v34);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      v30 = (void (*)(id))MEMORY[0x1E0DEEE30];
      sub_1BC7FF57C(a1, 1, (void (*)(id))MEMORY[0x1E0DEEE30]);
      sub_1BC7FF57C(a1, 1, v30);
      _os_log_impl(&dword_1BC6DD000, v21, v22, "[%{public}s] Failed to create shared summary transaction builder: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v24, -1, -1);
      MEMORY[0x1BCCF5BA4](v23, -1, -1);
    }
    else
    {
      v31 = (void (*)(id))MEMORY[0x1E0DEEE30];
      sub_1BC7FF57C(a1, 1, (void (*)(id))MEMORY[0x1E0DEEE30]);
      sub_1BC7FF57C(a1, 1, v31);
    }

    v32 = (void *)sub_1BC816D50();
    a5(v32, v33);

    v16 = 1;
  }
  else
  {
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a7;
    v14[3] = a8;
    v14[4] = a1;
    v14[5] = a5;
    v14[6] = a6;
    v15 = *(void (**)(uint64_t, void (*)(void *, char), _QWORD *, uint64_t, uint64_t))(a8 + 24);
    sub_1BC74D1E0(a1, 0);
    sub_1BC74D1E0(a1, 0);
    swift_retain();
    v15(a4, sub_1BC7FF568, v14, a7, a8);
    swift_release();
    v16 = 0;
  }
  sub_1BC7FF57C(a1, v16, (void (*)(id))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1BC7FEFB0()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  swift_release();
  return swift_deallocObject();
}

void sub_1BC7FF0A8(void *a1, char a2)
{
  _QWORD *v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;

  v4 = a2 & 1;
  v5 = v2[2];
  v6 = v2[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (char *)v2 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  sub_1BC7FECB8(a1, v4, v2[4], (uint64_t)v2 + v8, *(void (**)(void *, uint64_t))v9, *((_QWORD *)v9 + 1), v5, v6);
}

uint64_t dispatch thunk of AddSharedSummariesExecutor.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AddSharedSummariesExecutor.makeSharedSummaries(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

void sub_1BC7FF19C(id a1, char a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;

  if ((a2 & 1) != 0)
  {
    v16 = a1;
    v17 = (void *)sub_1BC816D50();
    a4();

    sub_1BC7FF57C(a1, 1, (void (*)(id))MEMORY[0x1E0DEEB08]);
  }
  else
  {
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = a6;
    v13[3] = a7;
    v13[4] = a4;
    v13[5] = a5;
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a3;
    v14[3] = a1;
    v14[4] = sub_1BC7FF5AC;
    v14[5] = v13;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_1BC7FF5AC;
    *(_QWORD *)(v15 + 24) = v13;
    swift_retain_n();
    swift_retain();
    swift_retain();
    sub_1BC79DD74(a1, 0);
    sub_1BC6F4C60((uint64_t)sub_1BC79DEFC, (uint64_t)v14, (uint64_t)sub_1BC79D448, v15);
    swift_release();
    swift_release();
    swift_release();
  }
}

void sub_1BC7FF2F0(id a1, void (*a2)(id))
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v3 = a1;
  if (a1)
  {
    v4 = a1;
    if (qword_1ED6BB338 != -1)
      swift_once();
    v5 = sub_1BC817590();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED6BB320);
    v6 = v3;
    v7 = v3;
    v8 = sub_1BC81756C();
    v9 = sub_1BC817E84();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v17 = v11;
      *(_DWORD *)v10 = 136446466;
      v12 = sub_1BC818814();
      sub_1BC6E14D8(v12, v13, &v17);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      v14 = v3;
      sub_1BC6E1878();
      v15 = sub_1BC817AF4();
      sub_1BC6E14D8(v15, v16, &v17);
      sub_1BC818148();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BC6DD000, v8, v9, "[%{public}s] Failed to add shared summaries: %{public}s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v11, -1, -1);
      MEMORY[0x1BCCF5BA4](v10, -1, -1);

    }
    else
    {

    }
    v3 = (id)sub_1BC816D50();
  }
  a2(v3);

}

uint64_t sub_1BC7FF53C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1BC7FF568(void *a1, char a2)
{
  uint64_t v2;

  sub_1BC7FF19C(a1, a2 & 1, *(_QWORD *)(v2 + 32), *(void (**)(void))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_1BC7FF57C(id a1, char a2, void (*a3)(id))
{
  if ((a2 & 1) != 0)

  else
    a3(a1);
}

uint64_t sub_1BC7FF588()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BC7FF5AC(void *a1)
{
  uint64_t v1;

  sub_1BC7FF2F0(a1, *(void (**)(id))(v1 + 32));
}

uint64_t sub_1BC7FF5B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC7FF5EC()
{
  swift_release();
  return swift_deallocObject();
}

id sub_1BC7FF614(uint64_t a1, void *a2)
{
  uint64_t v3;
  id result;
  void **v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  result = (id)MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    sub_1BC81837C();
    v6 = (void **)(a1 + 32);
    while (1)
    {
      v9 = *v6++;
      v8 = v9;
      if (v9)
      {
        sub_1BC6FCD7C();
        v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_1BC81A0E0;
        *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v10 + 64) = sub_1BC6ED740();
        *(_QWORD *)(v10 + 32) = 0x73656C69666F7270;
        *(_QWORD *)(v10 + 40) = 0xE800000000000000;
        v11 = v8;
        result = objc_msgSend(v11, sel_identifier);
        if (!result)
        {
          __break(1u);
          return result;
        }
        v12 = result;
        sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
        *(_QWORD *)(v10 + 96) = sub_1BC6ED7C0(0, &qword_1ED6BA508);
        *(_QWORD *)(v10 + 104) = sub_1BC76B65C();
        *(_QWORD *)(v10 + 72) = v12;
        sub_1BC817E3C();

      }
      else
      {
        v7 = a2;
      }
      sub_1BC818358();
      sub_1BC818388();
      sub_1BC818394();
      sub_1BC818364();
      if (!--v3)
        return (id)v13;
    }
  }
  return result;
}

id _s14HealthPlatform8FeedItemC9predicate11matchingAnySo11NSPredicateCSayAA13SourceProfileOG_tFZ_0(uint64_t a1)
{
  uint64_t v2;
  id result;
  void *v4;
  void *v5;
  id v6;

  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
  sub_1BC6FCD7C();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BC81A0F0;
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BC6ED740();
  *(_QWORD *)(v2 + 32) = 0x73656C69666F7270;
  *(_QWORD *)(v2 + 40) = 0xE800000000000000;
  result = (id)sub_1BC817E3C();
  v4 = result;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_1BC7FF614(a1, result);
    v5 = (void *)sub_1BC817C50();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend((id)objc_opt_self(), sel_orPredicateWithSubpredicates_, v5);

    return v6;
  }
  return result;
}

uint64_t AnchorStorage.allStoredAnchors(availableSignals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_1BC7FF92C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v3 + 32) = v1;
  *(_QWORD *)(v3 + 40) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  sub_1BC7FFB90();
  *v4 = v0;
  v4[1] = sub_1BC7FF9E4;
  return sub_1BC8186C4();
}

uint64_t sub_1BC7FF9E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BC7FFA50()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BC7FFA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  sub_1BC80110C();
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  (*(void (**)(uint64_t, uint64_t (*)(void *, char), uint64_t, uint64_t, uint64_t))(a5 + 8))(a3, sub_1BC801194, v14, a4, a5);
  return swift_release();
}

uint64_t sub_1BC7FFB84(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BC7FFA84(a1, v1[4], v1[5], v1[2], v1[3]);
}

void sub_1BC7FFB90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D2D8)
  {
    sub_1BC817200();
    sub_1BC8173B0();
    sub_1BC7FFC08();
    v0 = sub_1BC817A64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D2D8);
  }
}

unint64_t sub_1BC7FFC08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6B9550;
  if (!qword_1ED6B9550)
  {
    v1 = sub_1BC817200();
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0D2CF30], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6B9550);
  }
  return result;
}

uint64_t sub_1BC7FFC50(id a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    sub_1BC80110C();
    return sub_1BC817D28();
  }
  else
  {
    sub_1BC80110C();
    swift_bridgeObjectRetain();
    return sub_1BC817D34();
  }
}

uint64_t AnchorStorage.store(anchor:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1BC7FFCEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_1BC7FFD90;
  return sub_1BC8186C4();
}

uint64_t sub_1BC7FFD90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BC7FFDFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v18 = a5;
  sub_1BC76B518();
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(a6 + 16))(a3, a4, sub_1BC8010D0, v15, v18, a6);
  return swift_release();
}

uint64_t sub_1BC7FFF08(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BC7FFDFC(a1, v1[4], v1[5], v1[6], v1[2], v1[3]);
}

uint64_t dispatch thunk of AnchorStorage.allStoredAnchors(availableSignals:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of AnchorStorage.store(anchor:for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t destroy for PluginAnchorStorage(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PluginAnchorStorage(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = v3;
  v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PluginAnchorStorage(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PluginAnchorStorage(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PluginAnchorStorage()
{
  return &type metadata for PluginAnchorStorage;
}

void sub_1BC8000B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  char *v12;
  __int128 v13;
  char *v14;
  void *v15;
  void *v16;
  __int128 v17;
  id v18;
  id v19;
  _QWORD aBlock[6];
  __int128 v21;
  __int128 v22;

  v7 = sub_1BC81726C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = *(void **)v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = (char *)swift_allocObject();
  v13 = *(_OWORD *)(v3 + 16);
  *((_OWORD *)v12 + 1) = *(_OWORD *)v3;
  *((_OWORD *)v12 + 2) = v13;
  *((_OWORD *)v12 + 3) = *(_OWORD *)(v3 + 32);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v12[v11], (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v14 = &v12[(v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(_QWORD *)v14 = a2;
  *((_QWORD *)v14 + 1) = a3;
  aBlock[4] = sub_1BC801064;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC719640;
  aBlock[3] = &block_descriptor_10_1;
  v15 = _Block_copy(aBlock);
  v16 = *(void **)(v3 + 8);
  v17 = *(_OWORD *)(v3 + 16);
  v21 = *(_OWORD *)(v3 + 32);
  v22 = v17;
  v18 = v10;
  v19 = v16;
  sub_1BC772410((uint64_t)&v22);
  sub_1BC772410((uint64_t)&v21);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v15);
  _Block_release(v15);
}

uint64_t sub_1BC80024C(_QWORD *a1, uint64_t a2, void (*a3)(void *, _QWORD), uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  _QWORD v28[2];
  void (*v29)(void *, _QWORD);

  v28[1] = a4;
  v29 = a3;
  v28[0] = a2;
  v5 = sub_1BC816F3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC6FCD40();
  sub_1BC6FCD7C();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1BC81A110;
  v10 = a1[2];
  v11 = a1[3];
  v12 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEA968];
  v13 = sub_1BC6ED740();
  *(_QWORD *)(v9 + 64) = v13;
  *(_QWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 40) = v11;
  v14 = (void *)a1[1];
  swift_bridgeObjectRetain();
  v15 = objc_msgSend(v14, sel_identifier);
  sub_1BC816F24();

  v16 = sub_1BC816F00();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)(v9 + 96) = v12;
  *(_QWORD *)(v9 + 104) = v13;
  *(_QWORD *)(v9 + 72) = v16;
  *(_QWORD *)(v9 + 80) = v18;
  v20 = a1[4];
  v19 = a1[5];
  *(_QWORD *)(v9 + 136) = v12;
  *(_QWORD *)(v9 + 144) = v13;
  *(_QWORD *)(v9 + 112) = v20;
  *(_QWORD *)(v9 + 120) = v19;
  swift_bridgeObjectRetain();
  v21 = (void *)sub_1BC817E3C();
  v22 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v23 = (void *)sub_1BC817AC4();
  v24 = objc_msgSend(v22, sel_initWithEntityName_, v23);

  objc_msgSend(v24, sel_setPredicate_, v21);
  type metadata accessor for OrchestrationAnchor();
  v25 = sub_1BC8180AC();
  MEMORY[0x1E0C80A78](v25);
  v28[-2] = v28[0];
  v26 = sub_1BC75BF30(MEMORY[0x1E0DEE9E0], (void (*)(void **, id *))sub_1BC8010AC, (uint64_t)&v28[-4], v25);
  swift_bridgeObjectRelease();
  v29(v26, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC8004F4(uint64_t *a1, void **a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char isUniquelyReferenced_nonNull_native;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a3;
  v27 = a1;
  v4 = sub_1BC81726C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC817200();
  v30 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v26 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v25 - v11;
  v13 = *a2;
  v14 = objc_msgSend(v13, sel_criteria);
  sub_1BC817AE8();

  sub_1BC81720C();
  sub_1BC8173B0();
  v15 = objc_msgSend(v13, sel_encodedAnchorSet);
  sub_1BC816E64();

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v28, v4);
  v16 = v29;
  v17 = sub_1BC817398();
  if (v16)
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v12, v8);
  v19 = v17;
  v20 = v30;
  v21 = (uint64_t)v26;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v26, v12, v8);
  swift_retain();
  v22 = v27;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v31 = *v22;
  *v22 = 0x8000000000000000;
  sub_1BC7200F4(v19, v21, isUniquelyReferenced_nonNull_native);
  *v22 = v31;
  swift_bridgeObjectRelease();
  v24 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v24(v21, v8);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v24)(v12, v8);
}

void sub_1BC80072C(uint64_t a1, uint64_t a2, void **a3, void (*a4)(void *), uint64_t a5)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void (*v19)(void *);
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  char *v37;
  char *v38;
  void *v39;
  void *v40;
  void *v41;
  void (*v42)(char *, uint64_t);
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v68[2];
  void **v69;
  uint64_t v70;
  void (*v71)(void *);
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  __int128 v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  id v95[3];

  v71 = a4;
  v69 = a3;
  v70 = a2;
  v95[2] = *(id *)MEMORY[0x1E0C80C00];
  v90 = sub_1BC816F3C();
  v81 = *(_QWORD *)(v90 - 8);
  MEMORY[0x1E0C80A78](v90);
  v7 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC817200();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v68 - v13;
  v15 = sub_1BC8173A4();
  v17 = a5;
  v18 = 0;
  v19 = v71;
  v21 = v15;
  v22 = v16;
  v88 = v12;
  v89 = v7;
  v79 = v14;
  v80 = v9;
  v94 = v8;
  v23 = v70;
  v24 = *(_QWORD *)(v70 + 16);
  v25 = v69;
  if (v24)
  {
    v68[1] = v17;
    v78 = sub_1BC6FCD40();
    v26 = v25[2];
    v86 = v25[3];
    v87 = v26;
    v27 = v25[4];
    v84 = v25[5];
    v85 = v27;
    v28 = v25[1];
    v82 = *v25;
    v83 = v28;
    v29 = v23 + ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80));
    v72 = *(_QWORD *)(v80 + 72);
    v93 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 16);
    swift_bridgeObjectRetain();
    v77 = xmmword_1BC81AB00;
    v76 = 0x80000001BC82BE60;
    v75 = 0x80000001BC826510;
    v30 = v94;
    v31 = v79;
    v74 = v21;
    v73 = v22;
    while (1)
    {
      v92 = v24;
      v93(v31, v29, v30);
      sub_1BC6FCD7C();
      v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = v77;
      v45 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v44 + 56) = MEMORY[0x1E0DEA968];
      v46 = sub_1BC6ED740();
      *(_QWORD *)(v44 + 64) = v46;
      v47 = v86;
      *(_QWORD *)(v44 + 32) = v87;
      *(_QWORD *)(v44 + 40) = v47;
      swift_bridgeObjectRetain();
      v48 = objc_msgSend(v83, sel_identifier);
      v49 = v89;
      sub_1BC816F24();

      v50 = sub_1BC816F00();
      v52 = v51;
      v53 = *(void (**)(char *, uint64_t))(v81 + 8);
      v53(v49, v90);
      *(_QWORD *)(v44 + 96) = v45;
      *(_QWORD *)(v44 + 104) = v46;
      *(_QWORD *)(v44 + 72) = v50;
      *(_QWORD *)(v44 + 80) = v52;
      *(_QWORD *)(v44 + 136) = v45;
      *(_QWORD *)(v44 + 144) = v46;
      v54 = v84;
      *(_QWORD *)(v44 + 112) = v85;
      *(_QWORD *)(v44 + 120) = v54;
      swift_bridgeObjectRetain();
      v55 = sub_1BC8171F4();
      *(_QWORD *)(v44 + 176) = v45;
      *(_QWORD *)(v44 + 184) = v46;
      *(_QWORD *)(v44 + 152) = v55;
      *(_QWORD *)(v44 + 160) = v56;
      v57 = (void *)sub_1BC817E3C();
      v58 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
      v59 = (void *)sub_1BC817AC4();
      v60 = objc_msgSend(v58, sel_initWithEntityName_, v59);

      objc_msgSend(v60, sel_setPredicate_, v57);
      type metadata accessor for OrchestrationAnchor();
      v61 = sub_1BC8180AC();
      if (v18)
      {

        sub_1BC6ECB60(v74, v73);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v31, v94);
        swift_bridgeObjectRelease();
        v19 = v71;
        goto LABEL_2;
      }
      v62 = v61;
      if (v61 >> 62)
      {
        swift_bridgeObjectRetain();
        v63 = sub_1BC8184E4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v63 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v38 = v88;
      v91 = 0;
      if (v63)
      {
        if ((v62 & 0xC000000000000001) != 0)
        {
          v64 = (id)MEMORY[0x1BCCF4FB0](0, v62);
        }
        else
        {
          if (!*(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10))
            __break(1u);
          v64 = *(id *)(v62 + 32);
        }
        v34 = v64;
        swift_bridgeObjectRelease();
        v93(v38, (uint64_t)v31, v94);
        v32 = v80;
        if (v34)
          goto LABEL_7;
      }
      else
      {
        swift_bridgeObjectRelease();
        v93(v38, (uint64_t)v31, v94);
        v32 = v80;
      }
      v33 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v34 = objc_msgSend(v33, sel_initWithContext_, v82);
      v35 = (void *)sub_1BC817AC4();
      objc_msgSend(v34, sel_setPluginPackage_, v35);

      v36 = objc_msgSend(v83, sel_identifier);
      v37 = v89;
      sub_1BC816F24();

      sub_1BC816F00();
      v53(v37, v90);
      v38 = v88;
      v39 = (void *)sub_1BC817AC4();
      swift_bridgeObjectRelease();
      objc_msgSend(v34, sel_setProfileIdentifier_, v39);

      v40 = (void *)sub_1BC817AC4();
      objc_msgSend(v34, sel_setPlanner_, v40);

      sub_1BC8171F4();
      v41 = (void *)sub_1BC817AC4();
      swift_bridgeObjectRelease();
      objc_msgSend(v34, sel_setCriteria_, v41);

LABEL_7:
      v42 = *(void (**)(char *, uint64_t))(v32 + 8);
      v30 = v94;
      v42(v38, v94);
      v21 = v74;
      v22 = v73;
      v43 = (void *)sub_1BC816E58();
      objc_msgSend(v34, sel_setEncodedAnchorSet_, v43);

      v31 = v79;
      v42(v79, v30);
      v29 += v72;
      v18 = v91;
      v24 = v92 - 1;
      if (v92 == 1)
      {
        swift_bridgeObjectRelease();
        v19 = v71;
        v25 = v69;
        break;
      }
    }
  }
  v65 = *v25;
  v95[0] = 0;
  if ((objc_msgSend(v65, sel_save_, v95) & 1) != 0)
  {
    v66 = v95[0];
    v19(0);
    sub_1BC6ECB60(v21, v22);
  }
  else
  {
    v67 = v95[0];
    v18 = (void *)sub_1BC816D5C();

    swift_willThrow();
    sub_1BC6ECB60(v21, v22);
LABEL_2:
    v20 = v18;
    v19(v18);

  }
}

void sub_1BC800E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  id v15;
  id v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;

  v10 = *(void **)v4;
  v9 = *(void **)(v4 + 8);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_QWORD *)(v11 + 32) = v10;
  *(_QWORD *)(v11 + 40) = v9;
  v12 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v11 + 64) = v12;
  *(_QWORD *)(v11 + 80) = a3;
  *(_QWORD *)(v11 + 88) = a4;
  v17[4] = sub_1BC800FA0;
  v17[5] = v11;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1BC719640;
  v17[3] = &block_descriptor_28;
  v13 = _Block_copy(v17);
  v14 = *(_OWORD *)(v4 + 32);
  v18 = *(_OWORD *)(v4 + 16);
  v19 = v14;
  swift_retain();
  swift_bridgeObjectRetain();
  v15 = v10;
  v16 = v9;
  sub_1BC772410((uint64_t)&v18);
  sub_1BC772410((uint64_t)&v19);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_performBlock_, v13);
  _Block_release(v13);
}

uint64_t sub_1BC800F4C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1BC800FA0()
{
  uint64_t v0;

  sub_1BC80072C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (void **)(v0 + 32), *(void (**)(void *))(v0 + 80), *(_QWORD *)(v0 + 88));
}

uint64_t block_destroy_helper_29()
{
  return swift_release();
}

uint64_t sub_1BC800FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1BC81726C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC801064()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(sub_1BC81726C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1BC80024C((_QWORD *)(v0 + 16), v0 + v2, *(void (**)(void *, _QWORD))v3, *(_QWORD *)(v3 + 8));
}

uint64_t sub_1BC8010AC(uint64_t *a1, void **a2)
{
  uint64_t v2;

  return sub_1BC8004F4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1BC8010C4()
{
  return objectdestroy_65Tm_0((uint64_t (*)(_QWORD))sub_1BC76B518);
}

uint64_t sub_1BC8010D0(void *a1)
{
  sub_1BC76B518();
  return sub_1BC76554C(a1);
}

void sub_1BC80110C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D2E8)
  {
    sub_1BC7FFB90();
    sub_1BC6FD528(255, (unint64_t *)&qword_1ED6B87B0);
    v0 = sub_1BC817D40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D2E8);
  }
}

uint64_t sub_1BC801188()
{
  return objectdestroy_65Tm_0((uint64_t (*)(_QWORD))sub_1BC80110C);
}

uint64_t sub_1BC801194(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  sub_1BC80110C();
  return sub_1BC7FFC50(a1, v3);
}

uint64_t UnfairLock.__allocating_init()()
{
  uint64_t v0;
  _DWORD *v1;

  v0 = swift_allocObject();
  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

uint64_t UnfairLock.init()()
{
  uint64_t v0;
  _DWORD *v1;

  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

uint64_t UnfairLock.deinit()
{
  uint64_t v0;

  MEMORY[0x1BCCF5BA4](*(_QWORD *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t UnfairLock.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x1BCCF5BA4](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

void sub_1BC8012A4()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + 16));
}

void sub_1BC8012AC()
{
  uint64_t v0;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + 16));
}

BOOL sub_1BC8012B4()
{
  uint64_t v0;

  return os_unfair_lock_trylock(*(os_unfair_lock_t *)(v0 + 16));
}

void sub_1BC8012CC()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(*(_QWORD *)v0 + 16));
}

void sub_1BC8012D8()
{
  uint64_t v0;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(_QWORD *)v0 + 16));
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

uint64_t method lookup function for UnfairLock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UnfairLock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of UnfairLock.lock()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of UnfairLock.unlock()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of UnfairLock.assertOwner()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of UnfairLock.trylock()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

id PluginData.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PluginData.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PluginData();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PluginData()
{
  return objc_opt_self();
}

id PluginData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PluginData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UNUserNotificationCenter.scheduleNotification(_:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t (*v25)(void);
  id v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  ObjectType = swift_getObjectType();
  sub_1BC801818();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC8023EC(0, &qword_1EF45D2F8, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960C0]);
  v11 = v10;
  v30 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v29 - v12;
  v14 = objc_msgSend(a1, sel_content);
  v15 = objc_msgSend(v14, sel_badge);

  if (v15)
  {
    if (qword_1ED6BB5B0 != -1)
      swift_once();
    v16 = sub_1BC817590();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED6BB5D0);
    v17 = sub_1BC81756C();
    v18 = sub_1BC817E90();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v32 = v20;
      *(_DWORD *)v19 = 136315138;
      v21 = sub_1BC818814();
      v31 = sub_1BC6E14D8(v21, v22, &v32);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC6DD000, v17, v18, "[%s] The Health app does not currently support app badging among all Health processes and clients.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v20, -1, -1);
      MEMORY[0x1BCCF5BA4](v19, -1, -1);
    }

    sub_1BC8018B0();
    sub_1BC6E1878();
    sub_1BC8177E8();
    sub_1BC801D38(&qword_1EF45D308, &qword_1EF45D2F8, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960C0], MEMORY[0x1E0C960D0]);
    v23 = sub_1BC817854();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
  }
  else
  {
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = v2;
    v24[3] = a1;
    v24[4] = ObjectType;
    v25 = MEMORY[0x1E0C95D78];
    sub_1BC8023EC(0, (unint64_t *)&qword_1ED6B82A0, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC801D38(&qword_1ED6B8298, (unint64_t *)&qword_1ED6B82A0, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))v25, MEMORY[0x1E0C95D90]);
    v26 = v2;
    v27 = a1;
    sub_1BC817824();
    sub_1BC801CF0();
    v23 = sub_1BC817854();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v23;
}

void sub_1BC801818()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1EF45D2F0)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC8023EC(255, (unint64_t *)&qword_1ED6B82A0, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC801D38(&qword_1ED6B8298, (unint64_t *)&qword_1ED6B82A0, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))v0, MEMORY[0x1E0C95D90]);
    v1 = sub_1BC817830();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1EF45D2F0);
  }
}

unint64_t sub_1BC8018B0()
{
  unint64_t result;

  result = qword_1ED6B85A0;
  if (!qword_1ED6B85A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6B85A0);
  }
  return result;
}

uint64_t UNNotification.requestContentURL.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, _QWORD, uint64_t, uint64_t);
  _BYTE v19[24];
  uint64_t v20;
  _OWORD v21[2];

  sub_1BC71A0E8();
  MEMORY[0x1E0C80A78](v3);
  v5 = v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v6 = objc_msgSend(v1, sel_request);
  v7 = objc_msgSend(v6, sel_content);

  v8 = objc_msgSend(v7, sel_userInfo);
  v9 = sub_1BC817A34();

  *(_QWORD *)&v21[0] = sub_1BC817AE8();
  *((_QWORD *)&v21[0] + 1) = v10;
  sub_1BC818274();
  if (*(_QWORD *)(v9 + 16) && (v11 = sub_1BC7066B8((uint64_t)v19), (v12 & 1) != 0))
    sub_1BC6E1A84(*(_QWORD *)(v9 + 56) + 32 * v11, (uint64_t)v21);
  else
    memset(v21, 0, sizeof(v21));
  swift_bridgeObjectRelease();
  sub_1BC6EF788((uint64_t)v19);
  sub_1BC80239C((uint64_t)v21, (uint64_t)v19);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_1BC816E1C();
      swift_bridgeObjectRelease();
      return sub_1BC6ED784((uint64_t)v21, (uint64_t (*)(_QWORD))sub_1BC6EF7F8);
    }
  }
  else
  {
    sub_1BC6ED784((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1BC6EF7F8);
  }
  sub_1BC7AFD7C((uint64_t)v21, (uint64_t)v19);
  if (v20)
  {
    v14 = sub_1BC816E40();
    v15 = swift_dynamicCast();
    v16 = *(_QWORD *)(v14 - 8);
    v17 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56);
    v17((uint64_t)v5, v15 ^ 1u, 1, v14);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v14) != 1)
    {
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v16 + 32))(a1, v5, v14);
      return v17(a1, 0, 1, v14);
    }
  }
  else
  {
    sub_1BC6ED784((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1BC6EF7F8);
    v14 = sub_1BC816E40();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 1, 1, v14);
  }
  sub_1BC6ED784((uint64_t)v5, (uint64_t (*)(_QWORD))sub_1BC71A0E8);
  sub_1BC816E40();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
}

uint64_t sub_1BC801BC0@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v8;
  uint64_t (*v9)(void);
  id v10;
  id v11;
  uint64_t v12;
  uint64_t result;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v9 = MEMORY[0x1E0C960D8];
  sub_1BC8023EC(0, &qword_1EF45D310, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v10 = a1;
  v11 = a2;
  sub_1BC81780C();
  sub_1BC801D38(&qword_1EF45D318, &qword_1EF45D310, (uint64_t (*)(uint64_t, unint64_t, unint64_t, _QWORD))v9, MEMORY[0x1E0C96108]);
  v12 = sub_1BC817854();
  result = swift_release();
  *a4 = v12;
  return result;
}

uint64_t sub_1BC801CB8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC801CE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1BC801BC0(*(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

unint64_t sub_1BC801CF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF45D300;
  if (!qword_1EF45D300)
  {
    sub_1BC801818();
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C96148], v1);
    atomic_store(result, (unint64_t *)&qword_1EF45D300);
  }
  return result;
}

uint64_t sub_1BC801D38(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1BC8023EC(255, a2, a3);
    result = MEMORY[0x1BCCF5AB4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BC801D78(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = sub_1BC74D098;
  v11[4] = v10;
  v11[5] = a5;
  v14[4] = sub_1BC8024AC;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1BC802348;
  v14[3] = &block_descriptor_29;
  v12 = _Block_copy(v14);
  swift_retain();
  v13 = a4;
  swift_release();
  objc_msgSend(a3, sel_addNotificationRequest_withCompletionHandler_, v13, v12);
  _Block_release(v12);
}

void sub_1BC801E7C(void *a1, void *a2, void (*a3)(void *, uint64_t))
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  if (a1)
  {
    v6 = a1;
    if (qword_1ED6BB5B0 != -1)
      swift_once();
    v7 = sub_1BC817590();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ED6BB5D0);
    v8 = a2;
    v9 = a1;
    v10 = v8;
    v11 = a1;
    v12 = sub_1BC81756C();
    v13 = sub_1BC817E84();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v38 = v37;
      *(_DWORD *)v14 = 136315650;
      v15 = sub_1BC818814();
      sub_1BC6E14D8(v15, v16, &v38);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      v17 = objc_msgSend(v10, sel_identifier);
      v18 = sub_1BC817AE8();
      v20 = v19;

      sub_1BC6E14D8(v18, v20, &v38);
      sub_1BC818148();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2080;
      v21 = a1;
      sub_1BC6E1878();
      v22 = sub_1BC817B00();
      sub_1BC6E14D8(v22, v23, &v38);
      sub_1BC818148();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BC6DD000, v12, v13, "[%s] Notification %s Error: %s", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v37, -1, -1);
      MEMORY[0x1BCCF5BA4](v14, -1, -1);
    }
    else
    {

    }
    v36 = a1;
    a3(a1, 1);

  }
  else
  {
    if (qword_1ED6BB5B0 != -1)
      swift_once();
    v24 = sub_1BC817590();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED6BB5D0);
    v25 = a2;
    v26 = sub_1BC81756C();
    v27 = sub_1BC817E9C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v38 = v29;
      *(_DWORD *)v28 = 136315394;
      v30 = sub_1BC818814();
      sub_1BC6E14D8(v30, v31, &v38);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      v32 = objc_msgSend(v25, sel_identifier);
      v33 = sub_1BC817AE8();
      v35 = v34;

      sub_1BC6E14D8(v33, v35, &v38);
      sub_1BC818148();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC6DD000, v26, v27, "[%s] Notification Request Added %s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v29, -1, -1);
      MEMORY[0x1BCCF5BA4](v28, -1, -1);

      a3(v25, 0);
    }
    else
    {

      a3(v25, 0);
    }
  }
}

void sub_1BC802348(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_1BC80239C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6EF7F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC8023E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC801D78(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
}

void sub_1BC8023EC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t, _QWORD))
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = sub_1BC8018B0();
    v7 = sub_1BC6E1878();
    v8 = a3(a1, v6, v7, MEMORY[0x1E0DEDB38]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1BC80245C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC802480()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1BC8024AC(void *a1)
{
  uint64_t v1;

  sub_1BC801E7C(a1, *(void **)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24));
}

uint64_t block_destroy_helper_30()
{
  return swift_release();
}

uint64_t static GeneratorContext.generatorPipelineBufferSize.getter()
{
  return 1;
}

uint64_t Publishers.CombineLatest.bufferForCombineLatestForGeneratorPipeline(size:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v3 = sub_1BC817608();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - v5;
  v7 = sub_1BC8175FC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0C958B8], v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0C958E8], v3);
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95698], a2);
  sub_1BC8178B4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t Publishers.CombineLatest3.bufferForCombineLatestForGeneratorPipeline(size:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v3 = sub_1BC817608();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - v5;
  v7 = sub_1BC8175FC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0C958B8], v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0C958E8], v3);
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C956B8], a2);
  sub_1BC8178B4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t Publishers.CombineLatest4.bufferForCombineLatestForGeneratorPipeline(size:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v3 = sub_1BC817608();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - v5;
  v7 = sub_1BC8175FC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0C958B8], v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0C958E8], v3);
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C956D8], a2);
  sub_1BC8178B4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t HKTypesFeatureTag.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HKTypesFeatureTag.value.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*HKTypesFeatureTag.value.modify())()
{
  return nullsub_1;
}

uint64_t HKTypesFeatureTag.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1BC8029B8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_1ED6B7DA8 = result;
  return result;
}

uint64_t static HKTypesFeatureTag.keyPath.getter()
{
  if (qword_1ED6B7DA0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static HKTypesFeatureTag.keyPath.setter(uint64_t a1)
{
  if (qword_1ED6B7DA0 != -1)
    swift_once();
  swift_beginAccess();
  qword_1ED6B7DA8 = a1;
  return swift_release();
}

uint64_t (*static HKTypesFeatureTag.keyPath.modify())()
{
  if (qword_1ED6B7DA0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BC802B28()
{
  if (qword_1ED6B7DA0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

ValueMetadata *type metadata accessor for HKTypesFeatureTag()
{
  return &type metadata for HKTypesFeatureTag;
}

uint64_t HealthPluginPlanner.fetchCriteria(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(char *, void (*)(void *, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v27 = a1;
  v28 = a2;
  v7 = sub_1BC817590();
  v24 = *(_QWORD *)(v7 - 8);
  v25 = v7;
  MEMORY[0x1E0C80A78](v7);
  v26 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = sub_1BC81726C();
  v9 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  v14 = v13;
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 24))(v29, v4, *(_QWORD *)(a4 + 8), ObjectType, v14);
  swift_unknownObjectRelease();
  v16 = v30;
  v17 = v31;
  v26 = __swift_project_boxed_opaque_existential_1(v29, v30);
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v19 = v27;
  v18[4] = v12;
  v18[5] = v19;
  v18[6] = v28;
  v18[7] = v4;
  v20 = *(void (**)(char *, void (*)(void *, char), _QWORD *, uint64_t, uint64_t))(v17 + 8);
  swift_retain();
  swift_unknownObjectRetain();
  v20(v11, sub_1BC8045F8, v18, v16, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
}

void sub_1BC802FDC(void *a1, char a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v16 = sub_1BC817590();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v38 = v18;
    v39 = a3;
    v22 = *(void (**)(uint64_t, uint64_t))(a8 + 16);
    v23 = a1;
    v22(a7, a8);
    swift_getObjectType();
    sub_1BC8171E8();
    swift_unknownObjectRelease();
    sub_1BC79DD74(a1, 1);
    swift_unknownObjectRetain();
    sub_1BC79DD74(a1, 1);
    swift_unknownObjectRetain();
    v24 = sub_1BC81756C();
    v25 = sub_1BC817E84();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v36 = a5;
      v27 = v26;
      v34 = (_QWORD *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v40 = a6;
      v41 = v35;
      *(_DWORD *)v27 = 136315394;
      swift_unknownObjectRetain();
      v37 = a4;
      v28 = sub_1BC817AF4();
      v40 = sub_1BC6E14D8(v28, v29, &v41);
      sub_1BC818148();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2112;
      v30 = a1;
      v31 = _swift_stdlib_bridgeErrorToNSError();
      v40 = v31;
      a4 = v37;
      sub_1BC818148();
      v32 = v34;
      *v34 = v31;
      sub_1BC79DBA4(a1, 1);
      sub_1BC79DBA4(a1, 1);
      _os_log_impl(&dword_1BC6DD000, v24, v25, "%s: Failed to load previously stored anchors: %@", (uint8_t *)v27, 0x16u);
      sub_1BC6ECA64(0, (unint64_t *)&qword_1ED6BA800, (uint64_t (*)(uint64_t))sub_1BC6E1404, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v32, -1, -1);
      v33 = v35;
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v33, -1, -1);
      MEMORY[0x1BCCF5BA4](v27, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();
      sub_1BC79DBA4(a1, 1);
      sub_1BC79DBA4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v38);
    a4(v39);
    sub_1BC79DBA4(a1, 1);
  }
  else
  {
    sub_1BC79DD74(a1, 0);
    v21 = sub_1BC804694(a3, (uint64_t)a1);
    sub_1BC79DBA4(a1, 0);
    a4(v21);
    swift_bridgeObjectRelease();
  }
}

uint64_t HealthPluginPlanner.workPlan(_:didFail:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  _QWORD *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v38 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11);
  v14 = &v34[-v13];
  v15 = sub_1BC817590();
  v41 = *(_QWORD *)(v15 - 8);
  v42 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = &v34[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  swift_getObjectType();
  sub_1BC8171E8();
  swift_unknownObjectRelease();
  v39 = v10;
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16);
  v18(v14, a1, AssociatedTypeWitness);
  swift_unknownObjectRetain();
  v19 = a2;
  swift_unknownObjectRetain();
  v20 = a2;
  v40 = v17;
  v21 = sub_1BC81756C();
  v22 = sub_1BC817E84();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc();
    v36 = (_QWORD *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v43 = v4;
    v44 = v37;
    *(_DWORD *)v24 = 136315650;
    swift_unknownObjectRetain();
    v25 = sub_1BC817AF4();
    v35 = v23;
    v43 = sub_1BC6E14D8(v25, v26, &v44);
    sub_1BC818148();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v18(v38, (uint64_t)v14, AssociatedTypeWitness);
    v27 = sub_1BC817AF4();
    v43 = sub_1BC6E14D8(v27, v28, &v44);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v14, AssociatedTypeWitness);
    *(_WORD *)(v24 + 22) = 2112;
    v29 = a2;
    v30 = _swift_stdlib_bridgeErrorToNSError();
    v43 = v30;
    sub_1BC818148();
    v31 = v36;
    *v36 = v30;

    _os_log_impl(&dword_1BC6DD000, v21, (os_log_type_t)v35, "%s: Work plan %s failed: %@", (uint8_t *)v24, 0x20u);
    sub_1BC6ECA64(0, (unint64_t *)&qword_1ED6BA800, (uint64_t (*)(uint64_t))sub_1BC6E1404, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v31, -1, -1);
    v32 = v37;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v32, -1, -1);
    MEMORY[0x1BCCF5BA4](v24, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
    (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v14, AssociatedTypeWitness);

  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v41 + 8))(v40, v42);
}

uint64_t HealthPluginPlanner.store(anchor:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t);
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v9 = sub_1BC817590();
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  v11 = v10;
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 24))(v18, v4, *(_QWORD *)(a4 + 8), ObjectType, v11);
  swift_unknownObjectRelease();
  v13 = v19;
  v14 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = v4;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t))(v14 + 16);
  swift_unknownObjectRetain();
  v16(a1, a2, sub_1BC804630, v15, v13, v14);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
}

uint64_t _s14HealthPlatform0A13PluginPlannerPAAE6update6anchor3fory0A13Orchestration20InputSignalAnchorSetC_AG12WorkCriteriaCtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  sub_1BC6ECA64(0, &qword_1ED6B8EF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2CF20], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  sub_1BC817200();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BC81A0F0;
  sub_1BC817230();
  HealthPluginPlanner.store(anchor:for:)(a1, v7, a3, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC803B70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, uint64_t);
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = sub_1BC817590();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
    v14 = a1;
    v13(a3, a4);
    swift_getObjectType();
    sub_1BC8171E8();
    swift_unknownObjectRelease();
    v15 = a1;
    swift_unknownObjectRetain();
    v16 = a1;
    swift_unknownObjectRetain();
    v17 = sub_1BC81756C();
    v18 = sub_1BC817E84();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v30 = v9;
      v21 = (_QWORD *)v20;
      v28 = swift_slowAlloc();
      v31 = a2;
      v32 = v28;
      *(_DWORD *)v19 = 136315394;
      v29 = v8;
      swift_unknownObjectRetain();
      v22 = sub_1BC817AF4();
      v31 = sub_1BC6E14D8(v22, v23, &v32);
      sub_1BC818148();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2112;
      v24 = a1;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v31 = v25;
      sub_1BC818148();
      *v21 = v25;

      _os_log_impl(&dword_1BC6DD000, v17, v18, "%s: Failed to update anchor: %@", (uint8_t *)v19, 0x16u);
      sub_1BC6ECA64(0, (unint64_t *)&qword_1ED6BA800, (uint64_t (*)(uint64_t))sub_1BC6E1404, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v21, -1, -1);
      v26 = v28;
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v26, -1, -1);
      MEMORY[0x1BCCF5BA4](v19, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v12, v29);
    }
    else
    {

      swift_unknownObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return result;
}

uint64_t HealthPluginPlanner.allStoredAnchors(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  _QWORD *v17;
  void (*v18)(char *, void (*)(void *, char), _QWORD *, char *, uint64_t);
  _QWORD v20[3];
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[3];
  char *v26;
  uint64_t v27;

  v22 = a1;
  v23 = a2;
  v7 = sub_1BC817590();
  v20[2] = *(_QWORD *)(v7 - 8);
  v21 = (_QWORD *)v7;
  MEMORY[0x1E0C80A78](v7);
  v24 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC81726C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  v14 = v13;
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 24))(v25, v4, *(_QWORD *)(a4 + 8), ObjectType, v14);
  swift_unknownObjectRelease();
  v16 = v27;
  v24 = v26;
  v21 = __swift_project_boxed_opaque_existential_1(v25, (uint64_t)v26);
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = v22;
  v17[5] = v23;
  v17[6] = v4;
  v18 = *(void (**)(char *, void (*)(void *, char), _QWORD *, char *, uint64_t))(v16 + 8);
  swift_retain();
  swift_unknownObjectRetain();
  v18(v12, sub_1BC804668, v17, v24, v16);
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
}

void sub_1BC804280(void *a1, char a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(uint64_t, uint64_t);
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  os_log_t v33;
  uint64_t v34;
  void (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v13 = sub_1BC817590();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v36 = v15;
    v18 = *(void (**)(uint64_t, uint64_t))(a7 + 16);
    v19 = a1;
    v18(a6, a7);
    swift_getObjectType();
    sub_1BC8171E8();
    swift_unknownObjectRelease();
    sub_1BC79DD74(a1, 1);
    swift_unknownObjectRetain();
    sub_1BC79DD74(a1, 1);
    swift_unknownObjectRetain();
    v20 = sub_1BC81756C();
    v21 = sub_1BC817E84();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v35 = a3;
      v23 = v22;
      v32 = (_QWORD *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v37 = a5;
      v38 = v34;
      *(_DWORD *)v23 = 136315394;
      v33 = v20;
      swift_unknownObjectRetain();
      v24 = sub_1BC817AF4();
      v37 = sub_1BC6E14D8(v24, v25, &v38);
      sub_1BC818148();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2112;
      v26 = a1;
      v27 = _swift_stdlib_bridgeErrorToNSError();
      v37 = v27;
      sub_1BC818148();
      v28 = v32;
      *v32 = v27;
      sub_1BC79DBA4(a1, 1);
      sub_1BC79DBA4(a1, 1);
      v20 = v33;
      _os_log_impl(&dword_1BC6DD000, v33, v21, "%s: Failed to retrieve stored anchors; starting criteria from nil anchors: %@",
        (uint8_t *)v23,
        0x16u);
      sub_1BC6ECA64(0, (unint64_t *)&qword_1ED6BA800, (uint64_t (*)(uint64_t))sub_1BC6E1404, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v28, -1, -1);
      v29 = v34;
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v29, -1, -1);
      v30 = v23;
      a3 = v35;
      MEMORY[0x1BCCF5BA4](v30, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();
      sub_1BC79DBA4(a1, 1);
      sub_1BC79DBA4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v36);
    sub_1BC710FA4(MEMORY[0x1E0DEE9D8]);
    a3();
    swift_bridgeObjectRelease();
    sub_1BC79DBA4(a1, 1);
  }
  else
  {
    ((void (*)(void *))a3)(a1);
  }
}

uint64_t sub_1BC8045C4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1BC8045F8(void *a1, char a2)
{
  uint64_t v2;

  sub_1BC802FDC(a1, a2 & 1, *(_QWORD *)(v2 + 32), *(void (**)(_QWORD))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1BC80460C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC804630(void *a1)
{
  uint64_t *v1;

  return sub_1BC803B70(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_1BC80463C()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1BC804668(void *a1, char a2)
{
  uint64_t v2;

  sub_1BC804280(a1, a2 & 1, *(void (**)(void))(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t dispatch thunk of HealthPluginPlanner.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthPluginPlanner.signals.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthPluginPlanner.unanchoredCriteria.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1BC804694(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = sub_1BC817200();
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  if (a1 >> 62)
    goto LABEL_17;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v10)
      break;
    v19 = MEMORY[0x1E0DEE9D8];
    result = sub_1BC81837C();
    if (v10 < 0)
    {
      __break(1u);
      return result;
    }
    v12 = 0;
    v15 = v3;
    v16 = a1 & 0xC000000000000001;
    v13 = a1;
    while (v10 != v12)
    {
      if (v16)
        MEMORY[0x1BCCF4FB0](v12, a1);
      else
        swift_retain();
      sub_1BC817230();
      sub_1BC817230();
      if (*(_QWORD *)(a2 + 16))
      {
        sub_1BC70692C((uint64_t)v9);
        if ((v14 & 1) != 0)
          swift_retain();
      }
      ++v12;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v18);
      sub_1BC81723C();
      sub_1BC817248();
      swift_allocObject();
      sub_1BC817218();
      swift_release();
      sub_1BC818358();
      v3 = *(_QWORD *)(v19 + 16);
      sub_1BC818388();
      sub_1BC818394();
      sub_1BC818364();
      a1 = v13;
      if (v10 == v12)
        return v19;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v10 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  return result;
}

HealthPlatform::ProminenceFeatureTag __swiftcall ProminenceFeatureTag.init(_:)(HealthPlatform::ProminenceFeatureTag result)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)result.value;
  return result;
}

HealthPlatform::FeedItemProminence_optional __swiftcall FeedItemProminence.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  if (rawValue == 10)
    v2 = 2;
  else
    v2 = 3;
  if (rawValue == 5)
    v3 = 1;
  else
    v3 = v2;
  if (!rawValue)
    v3 = 0;
  *v1 = v3;
  return (HealthPlatform::FeedItemProminence_optional)rawValue;
}

uint64_t FeedItemProminence.rawValue.getter()
{
  unsigned __int8 *v0;

  return 5 * *v0;
}

uint64_t sub_1BC804900()
{
  sub_1BC81873C();
  sub_1BC818748();
  return sub_1BC818778();
}

uint64_t sub_1BC804944()
{
  return sub_1BC818748();
}

uint64_t sub_1BC804970()
{
  sub_1BC81873C();
  sub_1BC818748();
  return sub_1BC818778();
}

HealthPlatform::FeedItemProminence_optional sub_1BC8049B0(Swift::Int *a1)
{
  return FeedItemProminence.init(rawValue:)(*a1);
}

void sub_1BC8049B8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = 5 * *v1;
}

uint64_t sub_1BC8049C8()
{
  sub_1BC804BA8();
  return sub_1BC817C38();
}

uint64_t sub_1BC804A24()
{
  sub_1BC804BA8();
  return sub_1BC817C20();
}

void ProminenceFeatureTag.value.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

unint64_t sub_1BC804A80()
{
  unint64_t result;

  result = qword_1EF45D320;
  if (!qword_1EF45D320)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for FeedItemProminence, &type metadata for FeedItemProminence);
    atomic_store(result, (unint64_t *)&qword_1EF45D320);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedItemProminence()
{
  return &type metadata for FeedItemProminence;
}

uint64_t _s14HealthPlatform18FeedItemProminenceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC804B28 + 4 * byte_1BC823E15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BC804B5C + 4 * asc_1BC823E10[v4]))();
}

uint64_t sub_1BC804B5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC804B64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC804B6CLL);
  return result;
}

uint64_t sub_1BC804B78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC804B80);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BC804B84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC804B8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProminenceFeatureTag()
{
  return &type metadata for ProminenceFeatureTag;
}

unint64_t sub_1BC804BA8()
{
  unint64_t result;

  result = qword_1ED6BB048;
  if (!qword_1ED6BB048)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for FeedItemProminence, &type metadata for FeedItemProminence);
    atomic_store(result, (unint64_t *)&qword_1ED6BB048);
  }
  return result;
}

id static DataType.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1BC817AC4();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_codeRaw()
{
  return sel_codeRaw;
}

id sub_1BC804C5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_codeRaw);
  *a2 = result;
  return result;
}

id sub_1BC804C8C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCodeRaw_, *a1);
}

uint64_t sub_1BC804CA8(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x1E0C80A78](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v24 - v16;
  v18 = sub_1BC817DDC();
  if (!v18)
    return sub_1BC817CA4();
  v19 = v18;
  v25 = v15;
  v39 = sub_1BC817A1C();
  v32 = sub_1BC8183B8();
  sub_1BC818370();
  v36 = v17;
  result = sub_1BC817DD0();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))sub_1BC817E00();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      sub_1BC8183A0();
      sub_1BC817DE8();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

uint64_t Collection<>.asProfiles(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v10[2] = a1;
  v5 = (char *)type metadata accessor for Profile();
  v7 = sub_1BC804CA8((void (*)(char *, char *))sub_1BC8053CC, (uint64_t)v10, a2, v5, MEMORY[0x1E0DEDCE8], a3, MEMORY[0x1E0DEDD18], v6);
  v8 = sub_1BC6EBA40(v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t SourceProfile.userProfiles.getter(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  if (!a1)
    return MEMORY[0x1E0DEE9E8];
  sub_1BC805434(0, &qword_1ED6BA570, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v2 = type metadata accessor for UserProfile();
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BC81A0F0;
  v6 = a1;
  v7 = objc_msgSend(v6, sel_identifier);
  sub_1BC816F24();

  *(_QWORD *)(v5 + v4 + *(int *)(v2 + 20)) = v6;
  v8 = sub_1BC730FC0(v5);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();

  return v8;
}

uint64_t Collection<>.sourceProfile.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t result;
  uint64_t v6;

  sub_1BC805434(0, qword_1ED6BA340, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - v1;
  if (sub_1BC817DDC() > 1)
  {
    result = sub_1BC8184B4();
    __break(1u);
  }
  else
  {
    sub_1BC817DF4();
    v3 = type metadata accessor for UserProfile();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1, v3) == 1)
    {
      sub_1BC76AB48((uint64_t)v2);
      return 0;
    }
    else
    {
      v4 = *(id *)&v2[*(int *)(v3 + 20)];
      sub_1BC73229C((uint64_t)v2);
    }
    return (uint64_t)v4;
  }
  return result;
}

void SourceProfile.fetchProfiles(in:)(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  unint64_t v15;

  if (a2)
  {
    sub_1BC805434(0, &qword_1ED6BA570, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v5 = type metadata accessor for UserProfile();
    v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
    v7 = (v6 + 32) & ~v6;
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1BC81A0F0;
    v9 = v8 + v7;
    v10 = a2;
    v11 = objc_msgSend(v10, sel_identifier);
    sub_1BC816F24();

    *(_QWORD *)(v9 + *(int *)(v5 + 20)) = v10;
    v12 = sub_1BC730FC0(v8);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();

  }
  else
  {
    v12 = MEMORY[0x1E0DEE9E8];
  }
  v13 = a2;
  v14 = a1;
  v15 = sub_1BC76A504(v12, v14, a2);
  swift_bridgeObjectRelease();

  if (!v2)
  {
    sub_1BC6EBA40(v15);
    swift_bridgeObjectRelease();
  }
}

id sub_1BC8053CC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  id result;

  v5 = *(_QWORD *)(v2 + 16);
  type metadata accessor for Profile();
  v6 = type metadata accessor for UserProfile();
  result = static Profile.findOrCreate(_:in:)(*(void **)(a1 + *(int *)(v6 + 20)), v5);
  *a2 = result;
  return result;
}

void sub_1BC805434(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for UserProfile();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

id DataType.hkObjectType.getter()
{
  void *v0;

  return objc_msgSend((id)objc_opt_self(), sel_dataTypeWithCode_, objc_msgSend(v0, sel_codeRaw));
}

void *static DataType.findOrCreate(objectType:in:)(void *a1, void *a2)
{
  return sub_1BC805800(a1, a2, 1);
}

id sub_1BC8055C0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_dataTypeWithCode_, objc_msgSend(*a1, sel_codeRaw));
  *a2 = result;
  return result;
}

void sub_1BC805618(id *a1, void **a2)
{
  void *v2;
  id v3;

  if (*a1)
  {
    v2 = *a2;
    v3 = *a1;
    objc_msgSend(v2, sel_setCodeRaw_, objc_msgSend(v3, sel_code));

  }
}

void DataType.hkObjectType.setter(void *a1)
{
  void *v1;

  if (a1)
  {
    objc_msgSend(v1, sel_setCodeRaw_, objc_msgSend(a1, sel_code));

  }
}

void (*DataType.hkObjectType.modify(_QWORD *a1))(id *a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend((id)objc_opt_self(), sel_dataTypeWithCode_, objc_msgSend(v1, sel_codeRaw));
  return sub_1BC805738;
}

void sub_1BC805738(id *a1, char a2)
{
  id v2;
  id v3;
  id v4;

  v2 = *a1;
  if ((a2 & 1) == 0)
  {
    if (!v2)
      return;
    v4 = *a1;
    objc_msgSend(a1[1], sel_setCodeRaw_, objc_msgSend(*a1, sel_code));
    goto LABEL_6;
  }
  if (v2)
  {
    v3 = a1[1];
    v4 = v2;
    objc_msgSend(v3, sel_setCodeRaw_, objc_msgSend(v4, sel_code));

LABEL_6:
    return;
  }

}

uint64_t static DataType.entityName.getter()
{
  return 0x6570795461746144;
}

void *sub_1BC805800(void *a1, void *a2, char a3)
{
  void *v3;
  void *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = v3;
  v7 = objc_msgSend(a1, sel_code);
  sub_1BC6FCD40();
  sub_1BC6FCD7C();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BC81A0E0;
  v9 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v8 + 64) = v9;
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 96) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 104) = sub_1BC6ED740();
  *(_QWORD *)(v8 + 72) = 0x77615265646F63;
  *(_QWORD *)(v8 + 80) = 0xE700000000000000;
  v10 = (void *)sub_1BC817E3C();
  v11 = sub_1BC6FD448(a2, (uint64_t)v10, a3);
  if (v3)
  {

  }
  else
  {
    v4 = (void *)v11;
    if (v11)
    {

    }
    else
    {
      v12 = (void *)objc_opt_self();
      v13 = (void *)sub_1BC817AC4();
      v14 = objc_msgSend(v12, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v13, a2);

      type metadata accessor for DataType();
      v4 = (void *)swift_dynamicCastClassUnconditional();
    }
    objc_msgSend(v4, sel_setCodeRaw_, v7);
  }
  return v4;
}

uint64_t sub_1BC8059B4()
{
  return 0x6570795461746144;
}

uint64_t static DataType.predicate(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_1BC6FCD40();
  sub_1BC6FCD7C();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BC81A0E0;
  v5 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
  v6 = sub_1BC6ED740();
  *(_QWORD *)(v4 + 32) = 0x6D65744964656566;
  *(_QWORD *)(v4 + 40) = 0xE900000000000073;
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 72) = a1;
  *(_QWORD *)(v4 + 80) = a2;
  swift_bridgeObjectRetain();
  return sub_1BC817E3C();
}

uint64_t static DataType.predicate(for:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1BC6FCD40();
  sub_1BC6FCD7C();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BC81A0E0;
  v1 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 56) = MEMORY[0x1E0DEA968];
  v2 = sub_1BC6ED740();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 32) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 40) = 0x80000001BC82C080;
  v3 = ContentKind.rawValue.getter();
  *(_QWORD *)(v0 + 96) = v1;
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = v4;
  return sub_1BC817E3C();
}

uint64_t static DataType.predicate(isOneOfDataType:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_1BC6FCD7C();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BC81A0E0;
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BC6ED740();
  *(_QWORD *)(v2 + 32) = 0x77615265646F63;
  *(_QWORD *)(v2 + 40) = 0xE700000000000000;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = MEMORY[0x1E0DEE9D8];
  if (!v3)
  {
LABEL_13:
    sub_1BC6FCD40();
    sub_1BC805D34();
    *(_QWORD *)(v2 + 96) = v12;
    *(_QWORD *)(v2 + 104) = sub_1BC805D88();
    *(_QWORD *)(v2 + 72) = v4;
    return sub_1BC817E3C();
  }
  v14 = MEMORY[0x1E0DEE9D8];
  result = sub_1BC6E8DB0(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v13 = v2;
    v6 = 0;
    v4 = v14;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1BCCF4FB0](v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_code, v13);

      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_1BC6E8DB0(v10 > 1, v11 + 1, 1);
      ++v6;
      *(_QWORD *)(v14 + 16) = v11 + 1;
      *(_QWORD *)(v14 + 8 * v11 + 32) = v9;
    }
    while (v3 != v6);
    v2 = v13;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1BC805D34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D350)
  {
    v0 = sub_1BC817D04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D350);
  }
}

unint64_t sub_1BC805D88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF45D358;
  if (!qword_1EF45D358)
  {
    sub_1BC805D34();
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0CB1B18], v1);
    atomic_store(result, (unint64_t *)&qword_1EF45D358);
  }
  return result;
}

id Keyword.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Keyword.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for Keyword();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for Keyword()
{
  return objc_opt_self();
}

id Keyword.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Keyword();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC805F30(uint64_t a1, uint64_t a2)
{
  return sub_1BC805F54(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC6FD4B8, 0x6E6967756C50, 0xE600000000000000, (void (*)(_QWORD))type metadata accessor for Plugin);
}

uint64_t sub_1BC805F54(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, void (*a6)(_QWORD))
{
  uint64_t result;
  void *v9;
  void *v10;
  id v11;

  result = a3(a1, a2, 1);
  if (!result)
  {
    v9 = (void *)objc_opt_self();
    v10 = (void *)sub_1BC817AC4();
    v11 = objc_msgSend(v9, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v10, a1);

    a6(0);
    return swift_dynamicCastClassUnconditional();
  }
  return result;
}

uint64_t sub_1BC8060D8(uint64_t a1, uint64_t a2)
{
  return sub_1BC805F54(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC6FD4EC, 0x61446E6967756C50, 0xEA00000000006174, (void (*)(_QWORD))type metadata accessor for PluginData);
}

uint64_t sub_1BC806104(uint64_t a1, uint64_t a2)
{
  return sub_1BC805F54(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC6FD574, 0x656C69666F7250, 0xE700000000000000, (void (*)(_QWORD))type metadata accessor for Profile);
}

unint64_t sub_1BC80612C(void *a1, uint64_t a2)
{
  unint64_t result;
  void *v4;
  void *v5;
  id v6;

  result = sub_1BC6FDA78(a1, a2, 1);
  if (!result)
  {
    v4 = (void *)objc_opt_self();
    v5 = (void *)sub_1BC817AC4();
    v6 = objc_msgSend(v4, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v5, a1);

    type metadata accessor for FeedSection();
    return swift_dynamicCastClassUnconditional();
  }
  return result;
}

void *static Keyword.findOrCreate(_:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  sub_1BC6FCD40();
  sub_1BC6FCD7C();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1BC81A0F0;
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 64) = sub_1BC6ED740();
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_1BC817E3C();
  v8 = (void *)sub_1BC805F54(a3, (uint64_t)v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC6FD480, 0x64726F7779654BLL, 0xE700000000000000, (void (*)(_QWORD))type metadata accessor for Keyword);

  v9 = (void *)sub_1BC817AC4();
  objc_msgSend(v8, sel_setIdentifier_, v9);

  return v8;
}

uint64_t static Keyword.makePredicateForKeywordsWithFeedItems()()
{
  sub_1BC6FCD40();
  return sub_1BC817E3C();
}

uint64_t Keyword.__allocating_init(context:identifier:)(void *a1)
{
  objc_class *v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t result;

  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_1BC817AC4();
  v5 = objc_msgSend(v3, sel_entityForName_inManagedObjectContext_, v4, a1);

  if (v5)
  {
    v6 = objc_msgSend(objc_allocWithZone(v1), sel_initWithEntity_insertIntoManagedObjectContext_, v5, a1);
    v7 = (void *)sub_1BC817AC4();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setIdentifier_, v7);

    return (uint64_t)v6;
  }
  else
  {
    result = sub_1BC8184B4();
    __break(1u);
  }
  return result;
}

uint64_t static Keyword.entityName.getter()
{
  return 0x64726F7779654BLL;
}

uint64_t sub_1BC806564()
{
  return 0x64726F7779654BLL;
}

uint64_t sub_1BC80657C(uint64_t a1)
{
  return sub_1BC806588(a1, (void (*)(_QWORD))type metadata accessor for FeedItem);
}

uint64_t sub_1BC806588(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[4];

  sub_1BC6E1A84(a1, (uint64_t)v6);
  a2(0);
  if (swift_dynamicCast())
    return v5;
  sub_1BC6E1A84(a1, (uint64_t)v6);
  sub_1BC8182C8();
  sub_1BC817B48();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  swift_getDynamicType();
  sub_1BC818814();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  result = sub_1BC8184B4();
  __break(1u);
  return result;
}

uint64_t sub_1BC8066A0(uint64_t result)
{
  int64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  int64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;

  v4 = v2;
  v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    result = sub_1BC8181FC();
    v6 = result;
  }
  else
  {
    v6 = *(_QWORD *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_1BC8184E4();
    result = swift_bridgeObjectRelease();
    v8 = v20 + v6;
    if (!__OFADD__(v20, v6))
      goto LABEL_6;
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v7 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v6;
  if (__OFADD__(v7, v6))
    goto LABEL_24;
LABEL_6:
  v9 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v9;
  v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v12 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v11 = 1;
  }
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13 <= v8)
    v13 = v8;
  swift_bridgeObjectRetain();
  v14 = MEMORY[0x1BCCF4FBC](v11, v13, 1, v9);
  swift_bridgeObjectRelease();
  *v4 = v14;
  v12 = v14 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (*(_QWORD *)(v12 + 24) >> 1) - v15;
  result = (uint64_t)sub_1BC70DBD4(&v44, (_QWORD *)(v12 + 8 * v15 + 32), v16, v5);
  if (result < v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result >= 1)
  {
    v17 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v18 = __OFADD__(v17, result);
    v19 = v17 + result;
    if (v18)
    {
      __break(1u);
LABEL_33:
      if (!sub_1BC81822C())
        goto LABEL_21;
      sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v24 = v43;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24)
          goto LABEL_21;
        while (1)
        {
          v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(_QWORD *)(v26 + 0x18) >> 1)
          {
            sub_1BC817C98();
            v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          v27 = *(_QWORD *)(v26 + 24) >> 1;
          if (v3 < v27)
            break;
LABEL_37:
          *(_QWORD *)(v26 + 16) = v3;
        }
        v28 = v26 + 32;
        while (1)
        {
          *(_QWORD *)(v28 + 8 * v3++) = v24;
          v29 = v47;
          if (v44 < 0)
          {
            if (!sub_1BC81822C())
              goto LABEL_74;
            sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BB1D0);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v24 = v43;
            swift_unknownObjectRelease();
            goto LABEL_49;
          }
          if (!v48)
            break;
          v30 = (v48 - 1) & v48;
          v31 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_45:
          v24 = *(void **)(*(_QWORD *)(v44 + 48) + 8 * v31);
          v32 = v24;
LABEL_46:
          v47 = v29;
          v48 = v30;
LABEL_49:
          if (!v24)
          {
LABEL_74:
            *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_21;
          }
          if (v3 >= v27)
          {
            v26 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_37;
          }
        }
        v33 = v47 + 1;
        if (__OFADD__(v47, 1))
        {
          __break(1u);
LABEL_98:
          v24 = 0;
          v22 = 0;
          v21 = v1;
LABEL_30:
          v47 = v21;
          v48 = v22;
          continue;
        }
        break;
      }
      v34 = (unint64_t)(v46 + 64) >> 6;
      if (v33 >= v34)
      {
        v24 = 0;
        v30 = 0;
        goto LABEL_46;
      }
      v35 = *(_QWORD *)(v45 + 8 * v33);
      if (!v35)
      {
        v36 = v47 + 2;
        if (v47 + 2 >= v34)
          goto LABEL_71;
        v35 = *(_QWORD *)(v45 + 8 * v36);
        if (!v35)
        {
          v1 = v47 + 3;
          if (v47 + 3 >= v34)
            goto LABEL_72;
          v35 = *(_QWORD *)(v45 + 8 * v1);
          if (v35)
          {
            v33 = v47 + 3;
            goto LABEL_55;
          }
          v36 = v47 + 4;
          if (v47 + 4 >= v34)
          {
            v24 = 0;
            v30 = 0;
            v29 = v47 + 3;
            goto LABEL_46;
          }
          v35 = *(_QWORD *)(v45 + 8 * v36);
          if (!v35)
          {
            v33 = v47 + 5;
            if (v47 + 5 >= v34)
            {
LABEL_72:
              v24 = 0;
              v30 = 0;
              v29 = v36;
              goto LABEL_46;
            }
            v35 = *(_QWORD *)(v45 + 8 * v33);
            if (!v35)
            {
              v33 = v34 - 1;
              v37 = v47 + 6;
              while (v34 != v37)
              {
                v35 = *(_QWORD *)(v45 + 8 * v37++);
                if (v35)
                {
                  v33 = v37 - 1;
                  goto LABEL_55;
                }
              }
LABEL_71:
              v24 = 0;
              v30 = 0;
              v29 = v33;
              goto LABEL_46;
            }
            goto LABEL_55;
          }
        }
        v33 = v36;
      }
LABEL_55:
      v30 = (v35 - 1) & v35;
      v31 = __clz(__rbit64(v35)) + (v33 << 6);
      v29 = v33;
      goto LABEL_45;
    }
    *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
  }
  if (result != v16)
  {
LABEL_21:
    sub_1BC6ECC4C();
    return sub_1BC817C74();
  }
LABEL_26:
  v3 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v21 = v47;
  if (v44 < 0)
    goto LABEL_33;
  if (v48)
  {
    v22 = (v48 - 1) & v48;
    v23 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_29:
    v24 = *(void **)(*(_QWORD *)(v44 + 48) + 8 * v23);
    v25 = v24;
    goto LABEL_30;
  }
  v38 = v47 + 1;
  if (!__OFADD__(v47, 1))
  {
    v39 = (unint64_t)(v46 + 64) >> 6;
    if (v38 >= v39)
    {
      v24 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    v40 = *(_QWORD *)(v45 + 8 * v38);
    if (v40)
      goto LABEL_79;
    v41 = v47 + 2;
    if (v47 + 2 >= v39)
    {
LABEL_95:
      v24 = 0;
      v22 = 0;
      v21 = v38;
      goto LABEL_30;
    }
    v40 = *(_QWORD *)(v45 + 8 * v41);
    if (v40)
      goto LABEL_83;
    v1 = v47 + 3;
    if (v47 + 3 < v39)
    {
      v40 = *(_QWORD *)(v45 + 8 * v1);
      if (v40)
      {
        v38 = v47 + 3;
        goto LABEL_79;
      }
      v41 = v47 + 4;
      if (v47 + 4 >= v39)
        goto LABEL_98;
      v40 = *(_QWORD *)(v45 + 8 * v41);
      if (v40)
      {
LABEL_83:
        v38 = v41;
LABEL_79:
        v22 = (v40 - 1) & v40;
        v23 = __clz(__rbit64(v40)) + (v38 << 6);
        v21 = v38;
        goto LABEL_29;
      }
      v38 = v47 + 5;
      if (v47 + 5 < v39)
      {
        v40 = *(_QWORD *)(v45 + 8 * v38);
        if (!v40)
        {
          v38 = v39 - 1;
          v42 = v47 + 6;
          do
          {
            if (v39 == v42)
              goto LABEL_95;
            v40 = *(_QWORD *)(v45 + 8 * v42++);
          }
          while (!v40);
          v38 = v42 - 1;
        }
        goto LABEL_79;
      }
    }
    v24 = 0;
    v22 = 0;
    v21 = v41;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC806C9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BC725568(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC806DEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BC725B18(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[6 * v8 + 4];
  if (a1 + 32 < v9 + 48 * v2 && v9 < a1 + 32 + 48 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC806F44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BC725C5C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC80709C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_1BC725DA4(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for ProtectedNotificationContentState(0);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC807204(uint64_t a1)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_20;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if ((_DWORD)isUniquelyReferenced_nonNull_native)
  {
    v8 = *(_QWORD *)(v3 + 24) >> 1;
    if (v8 >= v5)
    {
      v9 = *(_QWORD *)(a1 + 16);
      if (v9)
        goto LABEL_5;
LABEL_17:
      if (!v2)
        goto LABEL_18;
      goto LABEL_20;
    }
  }
  if (v4 <= v5)
    v4 += v2;
  swift_bridgeObjectRetain();
  v3 = MEMORY[0x1BCCF4FBC](isUniquelyReferenced_nonNull_native, v4, 1, v3);
  swift_bridgeObjectRelease();
  *v1 = v3;
  v8 = *(_QWORD *)(v3 + 24) >> 1;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_17;
LABEL_5:
  v10 = *(_QWORD *)(v3 + 16);
  if (v8 - v10 < (uint64_t)v9)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v11 = v3 + 8 * v10 + 32;
  if (a1 + 32 < v11 + 8 * v9 && v11 < a1 + 32 + 8 * v9)
    goto LABEL_23;
  sub_1BC80A020();
  swift_arrayInitWithCopy();
  if (v9 < v2)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v13 = *(_QWORD *)(*v1 + 16);
  v14 = __OFADD__(v13, v9);
  v15 = v13 + v9;
  if (!v14)
  {
    *(_QWORD *)(*v1 + 16) = v15;
LABEL_18:
    swift_bridgeObjectRelease();
    return sub_1BC817C74();
  }
LABEL_22:
  __break(1u);
LABEL_23:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC807398(unint64_t a1)
{
  return sub_1BC8073A4(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_1BC809964);
}

uint64_t sub_1BC8073A4(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x1BCCF4FBC](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1BC817C74();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC807560(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BC7263E0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2)
    goto LABEL_24;
  sub_1BC6FD528(0, &qword_1ED6B7F98);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t static Feed.entityName.getter()
{
  return 1684366662;
}

uint64_t sub_1BC8076E4()
{
  return 1684366662;
}

uint64_t Feed.addSection(identifier:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t result;

  v5 = objc_msgSend(v2, sel_managedObjectContext);
  if (v5)
  {
    v6 = v5;
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
    sub_1BC6FCD7C();
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1BC81A0E0;
    *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v7 + 64) = sub_1BC6ED740();
    *(_QWORD *)(v7 + 32) = a1;
    *(_QWORD *)(v7 + 40) = a2;
    *(_QWORD *)(v7 + 96) = type metadata accessor for Feed();
    *(_QWORD *)(v7 + 104) = sub_1BC6E1788(&qword_1EF45D360, (uint64_t (*)(uint64_t))type metadata accessor for Feed, MEMORY[0x1E0DEFD08]);
    *(_QWORD *)(v7 + 72) = v2;
    swift_bridgeObjectRetain();
    v8 = v2;
    v9 = (void *)sub_1BC817E3C();
    v10 = (void *)sub_1BC80612C(v6, (uint64_t)v9);
    v11 = (void *)sub_1BC817AC4();
    objc_msgSend(v10, sel_setIdentifier_, v11);

    objc_msgSend(v10, sel_setFeed_, v8);
    return (uint64_t)v10;
  }
  else
  {
    result = sub_1BC8184B4();
    __break(1u);
  }
  return result;
}

void Feed.__allocating_init(context:kind:associatedProfileIdentifier:dateUpdated:)(uint64_t a1, char a2)
{
  objc_class *v2;
  objc_class *v3;
  void *v6;
  void *v7;
  id v8;

  v3 = v2;
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_1BC817AC4();
  v8 = objc_msgSend(v6, sel_entityForName_inManagedObjectContext_, v7, a1);

  if (v8)
  {
    objc_msgSend(objc_allocWithZone(v3), sel_initWithEntity_insertIntoManagedObjectContext_, v8, a1);
    __asm { BR              X10 }
  }
  sub_1BC8184B4();
  __break(1u);
  JUMPOUT(0x1BC807B44);
}

void Feed.kind.setter(char a1)
{
  __asm { BR              X10 }
}

void sub_1BC807BAC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;

  v15 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setKindRawValue_, v15);

}

id static Feed.predicate(kind:associatedProfileIdentifier:feedPrefixKeyPath:)(char a1, void *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  void *v7;
  void *v8;
  id v9;
  id result;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v4 = a4;
  sub_1BC807FAC(a3, a4, a1);
  v8 = v7;
  if (!a2)
  {
    sub_1BC6FCD7C();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1BC81A0F0;
    if (v4)
    {
      v25 = v4;
      swift_bridgeObjectRetain();
      sub_1BC817B48();
      v4 = a3;
      v15 = v25;
    }
    else
    {
      v15 = 0xE000000000000000;
    }
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
    swift_bridgeObjectRetain();
    sub_1BC817B48();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = sub_1BC6ED740();
    *(_QWORD *)(v14 + 32) = v4;
    *(_QWORD *)(v14 + 40) = v15;
    v17 = (void *)sub_1BC817E3C();
    goto LABEL_11;
  }
  v9 = a2;
  result = objc_msgSend(v9, sel_identifier);
  if (result)
  {
    v11 = result;
    sub_1BC6FCD7C();
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1BC81A0E0;
    if (v4)
    {
      v24 = v4;
      swift_bridgeObjectRetain();
      sub_1BC817B48();
      v4 = a3;
      v13 = v24;
    }
    else
    {
      v13 = 0xE000000000000000;
    }
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
    swift_bridgeObjectRetain();
    sub_1BC817B48();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v12 + 64) = sub_1BC6ED740();
    *(_QWORD *)(v12 + 32) = v4;
    *(_QWORD *)(v12 + 40) = v13;
    *(_QWORD *)(v12 + 96) = sub_1BC6ED7C0(0, &qword_1ED6BA508);
    *(_QWORD *)(v12 + 104) = sub_1BC76B65C();
    *(_QWORD *)(v12 + 72) = v11;
    v16 = v11;
    v17 = (void *)sub_1BC817E3C();

LABEL_11:
    sub_1BC6E1E98(0, (unint64_t *)&qword_1ED6BA580, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1BC81D180;
    *(_QWORD *)(v18 + 32) = v8;
    *(_QWORD *)(v18 + 40) = v17;
    v23 = v18;
    sub_1BC817C74();
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
    v19 = v8;
    v20 = v17;
    v21 = (void *)sub_1BC817C50();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v21, v23);

    return v22;
  }
  __break(1u);
  return result;
}

void sub_1BC807FAC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  sub_1BC6FCD7C();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1BC81A0E0;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1BC817B48();
    v7 = a1;
    v8 = a2;
  }
  else
  {
    v7 = 0;
    v8 = 0xE000000000000000;
  }
  v9 = v7;
  swift_bridgeObjectRetain();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 64) = sub_1BC6ED740();
  *(_QWORD *)(v6 + 32) = v9;
  *(_QWORD *)(v6 + 40) = v8;
  __asm { BR              X10 }
}

uint64_t sub_1BC8080AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6BA460);
  *(_QWORD *)(v0 + 96) = v2;
  *(_QWORD *)(v0 + 104) = v1;
  strcpy((char *)(v0 + 72), "appsForHealth");
  *(_WORD *)(v0 + 86) = -4864;
  return sub_1BC817E3C();
}

uint64_t static Feed.feedKeyPathString(feedPrefixKeyPath:feedPropertyKeyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1BC817B48();
    v2 = a1;
  }
  else
  {
    v2 = 0;
  }
  v5 = v2;
  swift_bridgeObjectRetain();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t Feed.Kind.contentKinds.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(void *))((char *)sub_1BC80823C + 4 * byte_1BC823FD4[a1]))(&unk_1E7516810);
}

void *sub_1BC80823C()
{
  return &unk_1E7516888;
}

void *sub_1BC808248()
{
  return &unk_1E7516838;
}

uint64_t sub_1BC808254()
{
  if (qword_1ED6BACB0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void *static Feed.Kind.allCases.getter()
{
  return &unk_1E75168D8;
}

void *static Feed.Kind.summaryTabRankedFeeds.getter()
{
  return &unk_1E7516900;
}

void *static Feed.Kind.liveFeeds.getter()
{
  return &unk_1E7516928;
}

void *static Feed.Kind.relevanceRankedFeeds.getter()
{
  return &unk_1E7516950;
}

uint64_t Feed.Kind.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BC808348 + 4 * byte_1BC823FDA[a1]))(0x48726F4673707061, 0xED000068746C6165);
}

unint64_t sub_1BC808348()
{
  return 0xD000000000000011;
}

uint64_t sub_1BC808364()
{
  return 0x6867696C68676968;
}

uint64_t sub_1BC808380()
{
  return 0x73656369746F6ELL;
}

uint64_t sub_1BC808398()
{
  return 0x73656C6369747261;
}

uint64_t sub_1BC8083B0()
{
  return 0x73646E657274;
}

void Feed.Kind.description.getter(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1BC808428()
{
  uint64_t v1;

  sub_1BC817B48();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_1BC8084CC(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BC80853C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1BC8085CC + 4 * byte_1BC823FEC[a1]))(0xD000000000000011);
}

uint64_t sub_1BC8085CC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000011 && v1 == 0x80000001BC825310)
    v2 = 1;
  else
    v2 = sub_1BC818694();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1BC8086B4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1BC81873C();
  __asm { BR              X9 }
}

uint64_t sub_1BC80870C()
{
  sub_1BC817B30();
  swift_bridgeObjectRelease();
  return sub_1BC818778();
}

void sub_1BC8087B0()
{
  __asm { BR              X10 }
}

uint64_t sub_1BC8087F8()
{
  sub_1BC817B30();
  return swift_bridgeObjectRelease();
}

void sub_1BC808888()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1BC81873C();
  __asm { BR              X9 }
}

uint64_t sub_1BC8088DC()
{
  sub_1BC817B30();
  swift_bridgeObjectRelease();
  return sub_1BC818778();
}

uint64_t sub_1BC808980@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1BC8089AC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1BC8089E8 + 4 * byte_1BC824004[*v0]))();
}

void sub_1BC8089E8(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001BC825310;
}

void sub_1BC808A08(_QWORD *a1@<X8>)
{
  *a1 = 0x6867696C68676968;
  a1[1] = 0xEA00000000007374;
}

void sub_1BC808A28(_QWORD *a1@<X8>)
{
  *a1 = 0x73656369746F6ELL;
  a1[1] = 0xE700000000000000;
}

void sub_1BC808A44(_QWORD *a1@<X8>)
{
  *a1 = 0x73656C6369747261;
  a1[1] = 0xE800000000000000;
}

void sub_1BC808A60(_QWORD *a1@<X8>)
{
  *a1 = 0x73646E657274;
  a1[1] = 0xE600000000000000;
}

void sub_1BC808A78(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E75168D8;
}

uint64_t sub_1BC808A88()
{
  sub_1BC80A094();
  return sub_1BC817C2C();
}

uint64_t sub_1BC808AE4()
{
  sub_1BC80A094();
  return sub_1BC817C14();
}

void sub_1BC808B30()
{
  char *v0;

  Feed.Kind.description.getter(*v0);
}

uint64_t Feed.kind.getter()
{
  void *v0;
  id v1;
  uint64_t result;

  v1 = objc_msgSend(v0, sel_kindRawValue);
  sub_1BC817AE8();

  result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (result == 6)
  {
    result = sub_1BC8184B4();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC808BF0@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_kindRawValue);
  sub_1BC817AE8();

  result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (result == 6)
  {
    result = sub_1BC8184B4();
    __break(1u);
  }
  else
  {
    *a2 = result;
  }
  return result;
}

void sub_1BC808CB0(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_1BC808D00(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;

  v15 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setKindRawValue_, v15);

}

void (*Feed.kind.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  void *v1;
  _BYTE *v2;
  id v3;
  char v4;
  void (*result)(uint64_t, char);

  *a1 = v1;
  v2 = a1 + 1;
  v3 = objc_msgSend(v1, sel_kindRawValue);
  sub_1BC817AE8();

  v4 = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (v4 == 6)
  {
    result = (void (*)(uint64_t, char))sub_1BC8184B4();
    __break(1u);
  }
  else
  {
    *v2 = v4;
    return sub_1BC808E84;
  }
  return result;
}

void sub_1BC808E84(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(unsigned __int8 *)(a1 + 8);
  if ((a2 & 1) != 0)
    __asm { BR              X11 }
  __asm { BR              X11 }
}

void sub_1BC808EF0(void **a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;

  v14 = *a1;
  v15 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setKindRawValue_, v15);

}

uint64_t Feed.allFeedItems.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v1 = objc_msgSend(v0, sel_sections);
  sub_1BC7DCBCC(v1, (uint64_t)sub_1BC809D9C, 0);
  v3 = v2;

  if ((v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
  {
    v4 = *(_QWORD *)(v3 + 16);
    if (v4)
      goto LABEL_4;
LABEL_17:
    swift_release();
    v7 = MEMORY[0x1E0DEE9D8];
    v15 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    if (v15)
    {
LABEL_13:
      swift_bridgeObjectRetain();
      v16 = 0;
      v17 = MEMORY[0x1E0DEE9D8];
      do
      {
        v18 = *(_QWORD *)(v7 + 8 * v16++ + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1BC8073A4(v18, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_1BC809B80);
        swift_bridgeObjectRelease();
      }
      while (v15 != v16);
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_18:
    v17 = MEMORY[0x1E0DEE9D8];
LABEL_19:
    swift_bridgeObjectRelease();
    return v17;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1BC8184E4();
  swift_release();
  if (!v4)
    goto LABEL_17;
LABEL_4:
  v19 = MEMORY[0x1E0DEE9D8];
  result = sub_1BC6E8DCC(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v19;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x1BCCF4FB0](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_feedItems);
      sub_1BC7DCBB8(v10, (uint64_t)sub_1BC7DCFBC, 0);
      v12 = v11;

      v14 = *(_QWORD *)(v19 + 16);
      v13 = *(_QWORD *)(v19 + 24);
      if (v14 >= v13 >> 1)
        sub_1BC6E8DCC(v13 > 1, v14 + 1, 1);
      ++v6;
      *(_QWORD *)(v19 + 16) = v14 + 1;
      *(_QWORD *)(v19 + 8 * v14 + 32) = v12;
    }
    while (v4 != v6);
    swift_release();
    v15 = *(_QWORD *)(v19 + 16);
    if (v15)
      goto LABEL_13;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t Feed.diagnosticDescription.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  uint64_t result;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  unint64_t v31;

  v1 = v0;
  v2 = sub_1BC816EF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC816E40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = 0;
  v31 = 0xE000000000000000;
  sub_1BC8182C8();
  sub_1BC817B48();
  v10 = objc_msgSend(v0, sel_objectID);
  v11 = objc_msgSend(v10, sel_URIRepresentation);

  sub_1BC816DF8();
  sub_1BC816D8C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  sub_1BC817B48();
  v12 = objc_msgSend(v1, sel_kindRawValue);
  sub_1BC817AE8();

  v13 = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (v13 == 6)
    goto LABEL_17;
  Feed.Kind.description.getter(v13);
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  sub_1BC817B48();
  v14 = objc_msgSend(v1, sel_dateUpdated);
  sub_1BC816ED0();

  sub_1BC6E1788(&qword_1ED6B7C30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
  sub_1BC818670();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1BC817B48();
  v15 = objc_msgSend(v1, sel_kindRawValue);
  sub_1BC817AE8();

  v16 = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (v16 == 6)
    goto LABEL_17;
  Feed.Kind.description.getter(v16);
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  sub_1BC817B48();
  v17 = objc_msgSend(v1, sel_sections);
  v18 = objc_msgSend(v17, sel_count);

  v29[0] = v18;
  sub_1BC818670();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  sub_1BC817B48();
  v19 = v30;
  v20 = objc_msgSend(v1, sel_sections);
  sub_1BC7DCBCC(v20, (uint64_t)sub_1BC809D9C, 0);
  v22 = v21;

  if (v22 < 0 || (v22 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v23 = sub_1BC8184E4();
    swift_release();
    if (v23)
      goto LABEL_6;
LABEL_14:
    swift_release();
    return v19;
  }
  v23 = *(_QWORD *)(v22 + 16);
  if (!v23)
    goto LABEL_14;
LABEL_6:
  if (v23 >= 1)
  {
    for (i = 0; i != v23; ++i)
    {
      if ((v22 & 0xC000000000000001) != 0)
        v25 = (id)MEMORY[0x1BCCF4FB0](i, v22);
      else
        v25 = *(id *)(v22 + 8 * i + 32);
      v26 = v25;
      v29[0] = 0;
      v29[1] = 0xE000000000000000;
      sub_1BC8182C8();
      swift_bridgeObjectRelease();
      strcpy((char *)v29, "FeedSection ");
      BYTE5(v29[1]) = 0;
      HIWORD(v29[1]) = -5120;
      v28[1] = i;
      sub_1BC818670();
      sub_1BC817B48();
      swift_bridgeObjectRelease();
      sub_1BC817B48();
      sub_1BC817B48();
      swift_bridgeObjectRelease();
      FeedSection.diagnosticDescription.getter();
      sub_1BC817B48();

      swift_bridgeObjectRelease();
    }
    swift_release();
    return v30;
  }
  __break(1u);
LABEL_17:
  result = sub_1BC8184B4();
  __break(1u);
  return result;
}

uint64_t sub_1BC809748(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1BC79756C();
        sub_1BC6E1788(&qword_1EF45D398, (uint64_t (*)(uint64_t))sub_1BC79756C, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_1BC76A2E4(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1BC6ED7C0(0, (unint64_t *)&qword_1ED6B84C8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC809964(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1BC6F72FC(0, &qword_1EF45D388, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        sub_1BC80A0D8(&qword_1EF45D390, &qword_1EF45D388, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_1BC76A338(v16, i, a3);
          v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for HealthPlatformContextProvider.Context(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC809B80(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1BC8184E4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1BC6F72FC(0, &qword_1EF45AF88, (void (*)(uint64_t))type metadata accessor for FeedItem);
        sub_1BC80A0D8(&qword_1EF45D380, &qword_1EF45AF88, (void (*)(uint64_t))type metadata accessor for FeedItem);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_1BC76A28C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for FeedItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1BC818538();
  __break(1u);
  return result;
}

uint64_t sub_1BC809D9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_1BC806588(a1, (void (*)(_QWORD))type metadata accessor for FeedSection);
  *a2 = result;
  return result;
}

uint64_t _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_1BC818568();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

unint64_t sub_1BC809E14()
{
  unint64_t result;

  result = qword_1ED6B7F80;
  if (!qword_1ED6B7F80)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for Feed.Kind, &type metadata for Feed.Kind);
    atomic_store(result, (unint64_t *)&qword_1ED6B7F80);
  }
  return result;
}

unint64_t sub_1BC809E5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF45D368;
  if (!qword_1EF45D368)
  {
    sub_1BC6E1E98(255, &qword_1EF45D370, (uint64_t)&type metadata for Feed.Kind, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF45D368);
  }
  return result;
}

uint64_t _s4KindOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s4KindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1BC809FA0 + 4 * byte_1BC824021[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BC809FD4 + 4 * byte_1BC82401C[v4]))();
}

uint64_t sub_1BC809FD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC809FDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC809FE4);
  return result;
}

uint64_t sub_1BC809FF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC809FF8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BC809FFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC80A004(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Feed.Kind()
{
  return &type metadata for Feed.Kind;
}

void sub_1BC80A020()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8218)
  {
    sub_1BC6FD528(255, (unint64_t *)&qword_1ED6B87B0);
    v0 = sub_1BC81771C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8218);
  }
}

unint64_t sub_1BC80A094()
{
  unint64_t result;

  result = qword_1EF45D378;
  if (!qword_1EF45D378)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for Feed.Kind, &type metadata for Feed.Kind);
    atomic_store(result, (unint64_t *)&qword_1EF45D378);
  }
  return result;
}

uint64_t sub_1BC80A0D8(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BC6F72FC(255, a2, a3);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0DEAF50], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Publisher.firstIfNecessary(for:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = sub_1BC817644();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - v4;
  v6 = (_QWORD *)(a1 + *(int *)(type metadata accessor for GeneratorContext() + 28));
  v7 = v6[3];
  v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8) & 1) != 0)
    return sub_1BC817854();
  sub_1BC8178A8();
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95A38], v2);
  v9 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

uint64_t sub_1BC80A244()
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
  uint64_t v11;
  char *v12;
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  sub_1BC771408(0, &qword_1ED6B8C28, (uint64_t (*)(uint64_t))sub_1BC80B8C0, sub_1BC80B914, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C95A28]);
  v35 = *(_QWORD *)(v1 - 8);
  v36 = v1;
  MEMORY[0x1E0C80A78](v1);
  v34 = (char *)&v33 - v2;
  v37 = type metadata accessor for GeneratorContext();
  MEMORY[0x1E0C80A78](v37);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC80B8C0(0);
  v10 = v9;
  v41 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC80B930();
  v43 = *(_QWORD *)(v13 - 8);
  v44 = v13;
  MEMORY[0x1E0C80A78](v13);
  v42 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC6ECB08(v0, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  v15 = *(unsigned __int8 *)(v6 + 80);
  v16 = (v15 + 16) & ~v15;
  v38 = v15 | 7;
  v39 = v16 + v7;
  v17 = swift_allocObject();
  sub_1BC6ECBA4((uint64_t)v8, v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  sub_1BC80B8E4(0);
  v19 = v18;
  sub_1BC80B8F8();
  v40 = v19;
  sub_1BC817824();
  v20 = *(int *)(v5 + 20);
  v45 = v0;
  sub_1BC6ECB08(v0 + v20, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for GeneratorContext);
  v21 = &v4[*(int *)(v37 + 28)];
  v22 = *((_QWORD *)v21 + 3);
  v23 = *((_QWORD *)v21 + 4);
  __swift_project_boxed_opaque_existential_1(v21, v22);
  LOBYTE(v22) = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
  sub_1BC80B914();
  if ((v22 & 1) != 0)
  {
    v26 = sub_1BC817854();
  }
  else
  {
    v24 = v34;
    sub_1BC8178A8();
    sub_1BC80C160(&qword_1ED6B8D60, &qword_1ED6B8C28, (uint64_t (*)(uint64_t))sub_1BC80B8C0, sub_1BC80B914);
    v25 = v36;
    v26 = sub_1BC817854();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
  }
  sub_1BC80AD20((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v10);
  v46 = v26;
  sub_1BC6ECB08(v45, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  v27 = swift_allocObject();
  sub_1BC6ECBA4((uint64_t)v8, v27 + v16, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_1BC80BB44;
  *(_QWORD *)(v28 + 24) = v27;
  sub_1BC7545B0();
  v29 = v42;
  sub_1BC81786C();
  swift_release();
  swift_release();
  sub_1BC6E1788(&qword_1ED6B8BB8, (uint64_t (*)(uint64_t))sub_1BC80B930, MEMORY[0x1E0C95950]);
  v30 = v44;
  v31 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v30);
  return v31;
}

uint64_t ChangePublisherFeedItemGeneratorPipeline.publisher.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[3];
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  uint64_t AssociatedConformanceWitness;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v38 = a2;
  v4 = type metadata accessor for GeneratorContext();
  v5 = MEMORY[0x1E0C80A78](v4);
  v44 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v5);
  v36 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = sub_1BC817830();
  v40 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v34 - v10;
  swift_getAssociatedTypeWitness();
  v12 = sub_1BC81771C();
  v43 = v12;
  v41 = sub_1BC7545B0();
  v42 = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95D90], v12);
  v13 = sub_1BC817614();
  v14 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  v46 = v14;
  MEMORY[0x1E0C80A78](v13);
  v39 = (char *)v34 - v15;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16 = v36;
  v35(v36, v2, a1);
  v17 = *(unsigned __int8 *)(v7 + 80);
  v18 = (v17 + 32) & ~v17;
  v34[1] = v17 | 7;
  v34[2] = v18 + v8;
  v19 = swift_allocObject();
  v20 = v38;
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = v20;
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v21(v19 + v18, v16, a1);
  sub_1BC817824();
  v22 = v20;
  v23 = *(void (**)(uint64_t))(v20 + 48);
  v24 = (uint64_t)v44;
  v25 = v2;
  v26 = v22;
  v23(a1);
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C96148], v9);
  v27 = Publisher.firstIfNecessary(for:)(v24);
  sub_1BC80AD20(v24);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v9);
  v47 = v27;
  v35(v16, v25, a1);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = a1;
  *(_QWORD *)(v28 + 24) = v26;
  v21(v28 + v18, v16, a1);
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = a1;
  v29[3] = v26;
  v29[4] = sub_1BC80B408;
  v29[5] = v28;
  v30 = v39;
  sub_1BC81786C();
  swift_release();
  swift_release();
  v31 = v45;
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95950], v45);
  v32 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v31);
  return v32;
}

uint64_t sub_1BC80A9D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, void *a6@<X5>, void *a7@<X6>, void *a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  void *v53;
  uint64_t v54;

  v53 = a8;
  v54 = a1;
  v41 = a7;
  v49 = a3;
  v50 = a4;
  v48 = a2;
  v43 = a11;
  v51 = a5;
  v52 = a10;
  v15 = type metadata accessor for GeneratorContext();
  v42 = *(_QWORD *)(v15 - 8);
  v16 = *(_QWORD *)(v42 + 64);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC771408(0, &qword_1ED6B8C38, (uint64_t (*)(uint64_t))sub_1BC80BC64, sub_1BC80BF78, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C95A28]);
  v44 = v18;
  v46 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v40 - v19;
  sub_1BC80BF94();
  v45 = v21;
  v47 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC7158A4(a6, a7, a8, a10);
  sub_1BC80BC64(0);
  v25 = v24;
  sub_1BC80BF78();
  sub_1BC8178A8();
  sub_1BC6ECB08(v54, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for GeneratorContext);
  v26 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v27 = (v16 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = swift_allocObject();
  sub_1BC6ECBA4((uint64_t)v17, v28 + v26, (uint64_t (*)(_QWORD))type metadata accessor for GeneratorContext);
  v29 = v28 + v27;
  v30 = a6;
  *(_QWORD *)v29 = a6;
  v31 = v41;
  v32 = v53;
  *(_QWORD *)(v29 + 8) = v41;
  *(_QWORD *)(v29 + 16) = v32;
  v33 = v52;
  *(_BYTE *)(v29 + 24) = v52;
  sub_1BC7158A4(v30, v31, v32, v33);
  sub_1BC74D608();
  sub_1BC80C160(&qword_1ED6B8C30, &qword_1ED6B8C38, (uint64_t (*)(uint64_t))sub_1BC80BC64, sub_1BC80BF78);
  v34 = v44;
  sub_1BC81786C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v34);
  sub_1BC6E1788(&qword_1ED6B8BE8, (uint64_t (*)(uint64_t))sub_1BC80BF94, MEMORY[0x1E0C95950]);
  v35 = v45;
  v36 = sub_1BC817854();
  v37 = v53;
  LOBYTE(v34) = v52;
  sub_1BC716CC8(v30, v31, v53, v52);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v43, v25);
  sub_1BC80AD20(v54);
  result = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v23, v35);
  v39 = v49;
  *(_QWORD *)a9 = v48;
  *(_QWORD *)(a9 + 8) = v39;
  *(_QWORD *)(a9 + 16) = v50;
  *(_BYTE *)(a9 + 24) = v51;
  *(_QWORD *)(a9 + 32) = v36;
  *(_QWORD *)(a9 + 40) = v30;
  *(_QWORD *)(a9 + 48) = v31;
  *(_QWORD *)(a9 + 56) = v37;
  *(_BYTE *)(a9 + 64) = v34;
  return result;
}

uint64_t sub_1BC80ACE8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 64))();
}

uint64_t sub_1BC80AD20(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GeneratorContext();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC80AD5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v37 = a1;
  v41 = a3;
  v4 = type metadata accessor for GeneratorContext();
  MEMORY[0x1E0C80A78](v4);
  v40 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC817050();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC80BC64(0);
  v39 = v14;
  v43 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x1E0C80A78](v14);
  v38 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v42 = (char *)&v36 - v17;
  sub_1BC6ECB08(a2, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v37, v6);
  v18 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (v12 + *(unsigned __int8 *)(v7 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v20 = swift_allocObject();
  sub_1BC6ECBA4((uint64_t)v13, v20 + v18, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v19, v9, v6);
  sub_1BC80BC88(0);
  sub_1BC80BCF8();
  v21 = v42;
  sub_1BC817824();
  v22 = v40;
  sub_1BC6ECB08(a2 + *(int *)(v10 + 20), v40, (uint64_t (*)(_QWORD))type metadata accessor for GeneratorContext);
  v23 = *(void **)a2;
  v24 = *(_QWORD *)(a2 + 8);
  v25 = *(_QWORD *)(a2 + 16);
  v26 = a2 + *(int *)(v10 + 24);
  v27 = *(void **)v26;
  v28 = *(void **)(v26 + 8);
  v29 = *(void **)(v26 + 16);
  v30 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  LOBYTE(v7) = *(_BYTE *)(v26 + 24);
  LODWORD(v37) = *(unsigned __int8 *)(a2 + 24);
  v31 = (uint64_t)v38;
  v32 = v21;
  v33 = v39;
  v30(v38, v32, v39);
  v34 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC7158A4(v27, v28, v29, v7);
  sub_1BC80A9D0(v22, (uint64_t)v23, v24, v25, v37, v27, v28, v29, v41, v7, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v33);
}

uint64_t sub_1BC80B038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t AssociatedConformanceWitness;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  char v49;
  uint64_t v50;
  __int128 v51;
  char v52;

  v45 = a5;
  v46 = a2;
  v43 = a1;
  v7 = type metadata accessor for GeneratorContext();
  MEMORY[0x1E0C80A78](v7);
  v44 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v36 = AssociatedTypeWitness;
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)&v36 - v12;
  v37 = (char *)&v36 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v17 = sub_1BC817830();
  v42 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x1E0C80A78](v17);
  v41 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v38 = (char *)&v36 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v46, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v43, AssociatedTypeWitness);
  v21 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v22 = (v15 + v21 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a3;
  *(_QWORD *)(v23 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v23 + v21, v16, a3);
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v23 + v22, v37, v36);
  v24 = v38;
  sub_1BC817824();
  v25 = (uint64_t)v44;
  (*(void (**)(uint64_t, uint64_t))(a4 + 48))(a3, a4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)(a4 + 8) + 16))(&v50, a3);
  v47 = v50;
  v48 = v51;
  v49 = v52;
  v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v28 = v27;
  v30 = v29;
  LODWORD(a4) = v31;
  v33 = (uint64_t)v41;
  v32 = v42;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v41, v24, v17);
  MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C96148], v17);
  v34 = FeedItemGenerator.init<A>(context:domain:feedItemPredicate:feedItemsPublisher:)(v25, (uint64_t)&v47, v26, v28, v30, a4, v33, v17, v45);
  return (*(uint64_t (**)(char *, uint64_t, double))(v32 + 8))(v24, v17, v34);
}

uint64_t objectdestroyTm_5()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1BC80B408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return sub_1BC80B038(a1, v2 + ((v4 + 32) & ~v4), v3, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1BC80B424()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC80B448@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v4 = *(uint64_t (**)(uint64_t))(v2 + 32);
  a2[3] = (uint64_t)&type metadata for FeedItemGenerator;
  a2[4] = (uint64_t)&protocol witness table for FeedItemGenerator;
  *a2 = swift_allocObject();
  return v4(a1);
}

uint64_t SynchronousChangePublisherFeedItemGeneratorPipeline.makeFeedItemsPublisher(change:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v12 = (char *)v21 - v11;
  v13 = *(_QWORD *)(a2 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v10);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v5, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, AssociatedTypeWitness);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = (v14 + v16 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v18 = swift_allocObject();
  v19 = v21[0];
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v18 + v16, v15, a2);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, AssociatedTypeWitness);
  sub_1BC6ECA64(0, &qword_1ED6B8CD0, (uint64_t (*)(uint64_t))sub_1BC7C13E0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96098]);
  sub_1BC7C1F18();
  return sub_1BC817824();
}

uint64_t sub_1BC80B68C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_1BC80B790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16))(v0 + ((v3 + v4) & ~v4), v1, v2);
  sub_1BC7C13E0(0);
  return sub_1BC8177DC();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.feedItemPredicate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.changePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.makeFeedItemsPublisher(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SynchronousChangePublisherFeedItemGeneratorPipeline.makeFeedItems(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void sub_1BC80B8C0(uint64_t a1)
{
  sub_1BC771408(a1, &qword_1ED6B8CE8, (uint64_t (*)(uint64_t))sub_1BC80B8E4, sub_1BC80B8F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C96138]);
}

void sub_1BC80B8E4(uint64_t a1)
{
  sub_1BC80BC9C(a1, &qword_1ED6B8C98, (void (*)(uint64_t))MEMORY[0x1E0D2BD30]);
}

uint64_t sub_1BC80B8F8()
{
  return sub_1BC6E1788(&qword_1ED6B8C90, (uint64_t (*)(uint64_t))sub_1BC80B8E4, MEMORY[0x1E0C95D90]);
}

uint64_t sub_1BC80B914()
{
  return sub_1BC6E1788(&qword_1ED6B8CE0, (uint64_t (*)(uint64_t))sub_1BC80B8C0, MEMORY[0x1E0C96148]);
}

void sub_1BC80B930()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8BC0)
  {
    sub_1BC80B8E4(255);
    sub_1BC7545B0();
    sub_1BC80B8F8();
    v0 = sub_1BC817614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8BC0);
  }
}

uint64_t sub_1BC80B9AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  result = sub_1BC71590C();
  *a1 = result;
  return result;
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id *v4;
  int *v5;
  id *v6;
  char *v7;
  uint64_t v8;

  v1 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (id *)((char *)v3 + *(int *)(v1 + 20));

  v5 = (int *)type metadata accessor for GeneratorContext();
  v6 = (id *)((char *)v4 + v5[5]);
  sub_1BC716020();
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (char *)v6 + *(int *)(type metadata accessor for CountryRetrievalRecord() + 24);
    v8 = sub_1BC816EF4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4 + v5[7]);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4 + v5[8]);
  sub_1BC716CC8(*(id *)((char *)v3 + *(int *)(v1 + 24)), *(id *)((char *)v3 + *(int *)(v1 + 24) + 8), *(id *)((char *)v3 + *(int *)(v1 + 24) + 16), *((_BYTE *)v3 + *(int *)(v1 + 24) + 24));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC80BB44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FeatureStatusFeedItemGeneratorPipeline() - 8) + 80);
  return sub_1BC80AD5C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_1BC80BB90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC80BBB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v4 = *(uint64_t (**)(uint64_t))(v2 + 16);
  a2[3] = (uint64_t)&type metadata for FeedItemGenerator;
  a2[4] = (uint64_t)&protocol witness table for FeedItemGenerator;
  *a2 = swift_allocObject();
  return v4(a1);
}

uint64_t sub_1BC80BC18()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1BC716CC8(*(void **)(v0 + 56), *(void **)(v0 + 64), *(void **)(v0 + 72), *(_BYTE *)(v0 + 80));
  return swift_deallocObject();
}

void sub_1BC80BC64(uint64_t a1)
{
  sub_1BC771408(a1, &qword_1ED6B8CF8, (uint64_t (*)(uint64_t))sub_1BC80BC88, sub_1BC80BCF8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C96138]);
}

void sub_1BC80BC88(uint64_t a1)
{
  sub_1BC80BC9C(a1, &qword_1ED6B8CA8, sub_1BC7C13E0);
}

void sub_1BC80BC9C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BC81771C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1BC80BCF8()
{
  return sub_1BC6E1788(&qword_1ED6B8CA0, (uint64_t (*)(uint64_t))sub_1BC80BC88, MEMORY[0x1E0C95D90]);
}

uint64_t sub_1BC80BD14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;

  v19 = a1;
  v20 = a2;
  v22 = a3;
  v3 = sub_1BC817050();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC771408(0, (unint64_t *)&qword_1ED6B8378, (uint64_t (*)(uint64_t))sub_1BC716A40, sub_1BC80C1A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C96138]);
  v11 = v10;
  v21 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v19 - v12;
  sub_1BC6ECB08(v19, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v3);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = (v8 + *(unsigned __int8 *)(v4 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = swift_allocObject();
  sub_1BC6ECBA4((uint64_t)v9, v16 + v14, (uint64_t (*)(_QWORD))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  sub_1BC716A40();
  sub_1BC80C1A8();
  sub_1BC817824();
  sub_1BC80C1C8();
  v17 = sub_1BC817854();
  result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v13, v11);
  *v22 = v17;
  return result;
}

uint64_t sub_1BC80BF10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for FeatureStatusFeedItemGeneratorPipeline() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BC817050() - 8) + 80);
  return sub_1BC80BD14(v1 + v4, v1 + ((v4 + v5 + v6) & ~v6), a1);
}

uint64_t sub_1BC80BF78()
{
  return sub_1BC6E1788(&qword_1ED6B8CF0, (uint64_t (*)(uint64_t))sub_1BC80BC64, MEMORY[0x1E0C96148]);
}

void sub_1BC80BF94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8BF0)
  {
    sub_1BC771408(255, &qword_1ED6B8C38, (uint64_t (*)(uint64_t))sub_1BC80BC64, sub_1BC80BF78, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C95A28]);
    sub_1BC74D608();
    sub_1BC80C160(&qword_1ED6B8C30, &qword_1ED6B8C38, (uint64_t (*)(uint64_t))sub_1BC80BC64, sub_1BC80BF78);
    v0 = sub_1BC817614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8BF0);
  }
}

uint64_t sub_1BC80C054()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  char *v7;
  uint64_t v8;

  v1 = (int *)type metadata accessor for GeneratorContext();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = v0 + v3;

  v6 = (id *)(v0 + v3 + v1[5]);
  sub_1BC716020();
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (char *)v6 + *(int *)(type metadata accessor for CountryRetrievalRecord() + 24);
    v8 = sub_1BC816EF4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  __swift_destroy_boxed_opaque_existential_0(v5 + v1[7]);
  __swift_destroy_boxed_opaque_existential_0(v5 + v1[8]);
  sub_1BC716CC8(*(void **)(v0 + ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v0 + ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(void **)(v0 + ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16), *(_BYTE *)(v0 + ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 24));
  return swift_deallocObject();
}

uint64_t sub_1BC80C160(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_1BC771408(255, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C95A28]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95A38], v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC80C1A8()
{
  return sub_1BC6E1788(&qword_1ED6B8128, (uint64_t (*)(uint64_t))sub_1BC716A40, MEMORY[0x1E0C95B60]);
}

unint64_t sub_1BC80C1C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6B8370;
  if (!qword_1ED6B8370)
  {
    sub_1BC771408(255, (unint64_t *)&qword_1ED6B8378, (uint64_t (*)(uint64_t))sub_1BC716A40, sub_1BC80C1A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C96138]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C96148], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6B8370);
  }
  return result;
}

uint64_t sub_1BC80C230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_1BC80C338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v2 + 72))(v0 + ((v3 + v4) & ~v4), v1, v2);
}

void sub_1BC80C41C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  unsigned int v26;
  void (*v27)(char *, uint64_t);
  id v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  id v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54[2];

  v1 = v0;
  v54[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1BC6E1440(0, (unint64_t *)&qword_1ED6BA290, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v51 - v3;
  v5 = sub_1BC816E40();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v51 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v51 - v13;
  v15 = objc_msgSend(v1, sel_URL);
  if (v15)
  {
    v16 = v15;
    sub_1BC816DF8();

    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v17(v4, v12, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v17(v14, v4, v5);
      if (qword_1ED6BB5B0 != -1)
        swift_once();
      v18 = sub_1BC817590();
      __swift_project_value_buffer(v18, (uint64_t)qword_1ED6BB5D0);
      v19 = sub_1BC81756C();
      v20 = sub_1BC817E6C();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1BC6DD000, v19, v20, "Destroying Core Data persistent store", v21, 2u);
        MEMORY[0x1BCCF5BA4](v21, -1, -1);
      }

      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97B98]), sel_init);
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97C00]), sel_initWithManagedObjectModel_, v22);

      v24 = (void *)sub_1BC816DBC();
      v25 = objc_msgSend(v1, sel_type);
      if (!v25)
      {
        sub_1BC817AE8();
        v25 = (id)sub_1BC817AC4();
        swift_bridgeObjectRelease();
      }
      v54[0] = 0;
      v26 = objc_msgSend(v23, sel_destroyPersistentStoreAtURL_withType_options_error_, v24, v25, 0, v54);

      if (v26)
      {
        v27 = *(void (**)(char *, uint64_t))(v6 + 8);
        v28 = v54[0];
        v27(v14, v5);

      }
      else
      {
        v36 = v54[0];
        v37 = (void *)sub_1BC816D5C();

        swift_willThrow();
        (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
        v38 = v37;
        v39 = v37;
        v40 = sub_1BC81756C();
        v41 = sub_1BC817E84();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = swift_slowAlloc();
          v52 = (void *)swift_slowAlloc();
          v54[0] = v52;
          *(_DWORD *)v42 = 136315394;
          v43 = sub_1BC816D8C();
          v53 = sub_1BC6E14D8(v43, v44, (uint64_t *)v54);
          sub_1BC818148();
          swift_bridgeObjectRelease();
          v45 = *(void (**)(char *, uint64_t))(v6 + 8);
          v45(v9, v5);
          *(_WORD *)(v42 + 12) = 2080;
          v53 = (uint64_t)v37;
          v46 = v37;
          sub_1BC6E1878();
          v47 = sub_1BC817AF4();
          v53 = sub_1BC6E14D8(v47, v48, (uint64_t *)v54);
          sub_1BC818148();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_1BC6DD000, v40, v41, "Could not destroy Core Data persistent store at %s Error: %s", (uint8_t *)v42, 0x16u);
          v49 = v52;
          swift_arrayDestroy();
          MEMORY[0x1BCCF5BA4](v49, -1, -1);
          MEMORY[0x1BCCF5BA4](v42, -1, -1);

          v45(v14, v5);
        }
        else
        {

          v50 = *(void (**)(char *, uint64_t))(v6 + 8);
          v50(v9, v5);

          v50(v14, v5);
        }
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_1BC71A180((uint64_t)v4);
  if (qword_1ED6BB5B0 != -1)
    swift_once();
  v29 = sub_1BC817590();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED6BB5D0);
  v30 = v1;
  v31 = sub_1BC81756C();
  v32 = sub_1BC817E84();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v33 = 138412290;
    v54[0] = v30;
    v35 = v30;
    sub_1BC818148();
    *v34 = v30;

    _os_log_impl(&dword_1BC6DD000, v31, v32, "Can't destroy store at description because description has no URL: %@", v33, 0xCu);
    sub_1BC6E1440(0, (unint64_t *)&qword_1ED6BA800, (void (*)(uint64_t))sub_1BC6E1404);
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v34, -1, -1);
    MEMORY[0x1BCCF5BA4](v33, -1, -1);

  }
  else
  {

  }
}

uint64_t SharableModelContext.sharableModelChangePublisher(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  if (*(_QWORD *)(a1 + 16))
  {
    v5 = a1;
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = 0;
  }
  v8[0] = v5;
  v8[1] = 0;
  v6 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a3 + 48))(v8, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!sub_1BC8181FC())
    goto LABEL_5;
LABEL_3:
  swift_bridgeObjectRetain();
LABEL_6:
  v8[0] = 0;
  v8[1] = v5;
  v6 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a3 + 48))(v8, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t PluginSharableModelQueryPredicate.init(identifiers:objectTypes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t PluginSharableModelQueryPredicate.identifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PluginSharableModelQueryPredicate.objectTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void static PluginSharableModelQueryPredicate.unspecified.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t dispatch thunk of SharableModelContext.sourceProfile.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SharableModelContext.summarySharingEntryStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SharableModelContext.previousSharableModelPublisher(predicate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SharableModelContext.previousSharableModelPublisher(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SharableModelContext.sharableModelChangePublisher(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

_QWORD *assignWithCopy for PluginSharableModelQueryPredicate(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginSharableModelQueryPredicate(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PluginSharableModelQueryPredicate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PluginSharableModelQueryPredicate()
{
  return &type metadata for PluginSharableModelQueryPredicate;
}

uint64_t HealthKitProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HealthKitProvider.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t HealthKitProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HealthKitProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t HealthKitProvider.environmentalStateComponents(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_1BC817944();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BC6ED238(0, &qword_1ED6B8768, &qword_1ED6B6338);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BC81A0F0;
  *v6 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF4A0], v3);
  type metadata accessor for SummaryPinnedContentStateComponent();
  swift_allocObject();
  v8 = swift_unknownObjectRetain();
  v9 = sub_1BC775154(v8, a2, (_QWORD *(*)(_QWORD *__return_ptr, uint64_t))sub_1BC7750CC, 0, (uint64_t (*)(_QWORD *))sub_1BC775150, 0, (uint64_t)v6);
  v10 = sub_1BC6E1788((unint64_t *)&unk_1ED6B7F60, (uint64_t (*)(uint64_t))type metadata accessor for SummaryPinnedContentStateComponent, (uint64_t)&protocol conformance descriptor for SummaryPinnedContentStateComponent);
  *(_QWORD *)(v7 + 32) = v9;
  *(_QWORD *)(v7 + 40) = v10;
  return v7;
}

uint64_t sub_1BC80CEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_1BC817944();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BC6ED238(0, &qword_1ED6B8768, &qword_1ED6B6338);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BC81A0F0;
  *v6 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF4A0], v3);
  type metadata accessor for SummaryPinnedContentStateComponent();
  swift_allocObject();
  v8 = swift_unknownObjectRetain();
  v9 = sub_1BC775154(v8, a2, (_QWORD *(*)(_QWORD *__return_ptr, uint64_t))sub_1BC7750CC, 0, (uint64_t (*)(_QWORD *))sub_1BC775150, 0, (uint64_t)v6);
  v10 = sub_1BC6E1788((unint64_t *)&unk_1ED6B7F60, (uint64_t (*)(uint64_t))type metadata accessor for SummaryPinnedContentStateComponent, (uint64_t)&protocol conformance descriptor for SummaryPinnedContentStateComponent);
  *(_QWORD *)(v7 + 32) = v9;
  *(_QWORD *)(v7 + 40) = v10;
  return v7;
}

_QWORD *_s14HealthPlatform0A11KitProviderC12inputSignals3for8observerSay0A13Orchestration11InputSignal_pGAG11WorkContext_p_AG0jK8Observer_ptF_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t ObjectType;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t InputSignal;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  id v54;
  _QWORD *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  objc_class *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v85 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v6 = sub_1BC817590();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  v10 = swift_conformsToProtocol2();
  if (v10)
    v11 = v10;
  else
    v11 = 0;
  if (v10)
    v12 = a1;
  else
    v12 = 0;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v12)
  {
    v82 = v9;
    v79 = v7;
    v80 = v6;
    v86 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    ObjectType = swift_getObjectType();
    v15 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 16);
    swift_unknownObjectRetain();
    v84 = ObjectType;
    v16 = v15(ObjectType, v11);
    if (v16)
    {
      v17 = (void *)v16;
      sub_1BC6ED238(0, &qword_1ED6B8748, &qword_1ED6B7F98);
      v78 = v18;
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1BC8242B0;
      type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v17;
      *(_QWORD *)(v20 + 24) = 0;
      v21 = (objc_class *)type metadata accessor for CloudSyncStatusInputSignal();
      v83 = a1;
      v22 = v21;
      v23 = (char *)objc_allocWithZone(v21);
      swift_unknownObjectRetain();
      v24 = v17;
      v25 = v11;
      v81 = v11;
      v26 = v85;
      v27 = sub_1BC7FA4B0(a3, v85, v20, v23);
      swift_unknownObjectRelease();
      *(_QWORD *)(inited + 56) = v22;
      *(_QWORD *)(inited + 64) = sub_1BC6E1788(&qword_1ED6B7EF0, (uint64_t (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal, (uint64_t)&protocol conformance descriptor for CloudSyncStatusInputSignal);
      *(_QWORD *)(inited + 32) = v27;
      InputSignal = type metadata accessor for DatabaseChangesQueryInputSignal();
      v29 = *(_QWORD *)(v25 + 8);
      v30 = v84;
      v31 = sub_1BC70E698((uint64_t)v12, a3, v26, v24, InputSignal, v84, v29);
      *(_QWORD *)(inited + 96) = InputSignal;
      *(_QWORD *)(inited + 104) = sub_1BC6E1788(&qword_1ED6B7F58, (uint64_t (*)(uint64_t))type metadata accessor for DatabaseChangesQueryInputSignal, (uint64_t)&protocol conformance descriptor for DatabaseChangesQueryInputSignal);
      *(_QWORD *)(inited + 72) = v31;
      v32 = type metadata accessor for FeatureStatusInputSignal();
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain_n();
      v33 = v24;
      v34 = sub_1BC71407C((uint64_t)v12, a3, v26, (uint64_t)v33, v32, v30, v29);
      *(_QWORD *)(inited + 136) = v32;
      *(_QWORD *)(inited + 144) = sub_1BC6E1788(&qword_1ED6B7DF8, (uint64_t (*)(uint64_t))type metadata accessor for FeatureStatusInputSignal, (uint64_t)&protocol conformance descriptor for FeatureStatusInputSignal);
      *(_QWORD *)(inited + 112) = v34;
      v35 = type metadata accessor for HealthKitUnitPreferencesInputSignal();
      v36 = v26;
      v37 = v26;
      v38 = v29;
      v76 = v29;
      v39 = sub_1BC782AC0((uint64_t)v12, a3, v36, (uint64_t)v33, v35, v30, v29);
      *(_QWORD *)(inited + 176) = v35;
      *(_QWORD *)(inited + 184) = sub_1BC6E1788(&qword_1ED6B7CC8, (uint64_t (*)(uint64_t))type metadata accessor for HealthKitUnitPreferencesInputSignal, (uint64_t)&protocol conformance descriptor for HealthKitUnitPreferencesInputSignal);
      *(_QWORD *)(inited + 152) = v39;
      v40 = type metadata accessor for ObjectTypeAnchorQueryInputSignal();
      v41 = sub_1BC7F3C04((uint64_t)v12, a3, v37, v33, v40, v30, v38);
      *(_QWORD *)(inited + 216) = v40;
      *(_QWORD *)(inited + 224) = sub_1BC6E1788(&qword_1ED6B9510, (uint64_t (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal, (uint64_t)&protocol conformance descriptor for ObjectTypeAnchorQueryInputSignal);
      *(_QWORD *)(inited + 192) = v41;
      v42 = type metadata accessor for SummarySharingInputSignal();
      v43 = a3;
      v44 = v81;
      v45 = *(uint64_t (**)(uint64_t, uint64_t))(v81 + 24);
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain_n();
      v77 = v33;
      v46 = v44;
      v47 = v43;
      v48 = v45(v30, v46);
      v49 = v43;
      v50 = v85;
      v51 = v76;
      v52 = sub_1BC7451D8((uint64_t)v12, v49, v85, v48, v42, v30, v76);
      *(_QWORD *)(inited + 256) = v42;
      *(_QWORD *)(inited + 264) = sub_1BC6E1788((unint64_t *)&unk_1ED6B7E58, (uint64_t (*)(uint64_t))type metadata accessor for SummarySharingInputSignal, (uint64_t)&protocol conformance descriptor for SummarySharingInputSignal);
      *(_QWORD *)(inited + 232) = v52;
      v53 = type metadata accessor for SummaryTransactionInputSignal();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v54 = v77;
      v77 = v12;
      v55 = sub_1BC7C984C((uint64_t)v12, v47, v50, (uint64_t)v54, v53, v30, v51);
      *(_QWORD *)(inited + 296) = v53;
      *(_QWORD *)(inited + 304) = sub_1BC6E1788(&qword_1ED6B7F10, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTransactionInputSignal, (uint64_t)&protocol conformance descriptor for SummaryTransactionInputSignal);
      *(_QWORD *)(inited + 272) = v55;
      sub_1BC807560(inited);
      v56 = objc_msgSend(v54, sel_profileIdentifier);
      v57 = objc_msgSend(v56, sel_type);

      if (v57 == (id)2)
      {
        v58 = swift_initStackObject();
        *(_OWORD *)(v58 + 16) = xmmword_1BC81A0F0;
        v59 = type metadata accessor for SummarySharingProfileDisplayNameInputSignal();
        swift_allocObject();
        swift_unknownObjectRetain();
        v60 = v54;
        SummarySharingProfileDisplayNameInputSignal.init(observer:healthStore:)(v47, v85, v60);
        v62 = v61;
        *(_QWORD *)(v58 + 56) = v59;
        *(_QWORD *)(v58 + 64) = sub_1BC6E1788(&qword_1EF45CC80, (uint64_t (*)(uint64_t))type metadata accessor for SummarySharingProfileDisplayNameInputSignal, (uint64_t)&protocol conformance descriptor for SummarySharingProfileDisplayNameInputSignal);
        *(_QWORD *)(v58 + 32) = v62;
        sub_1BC807560(v58);
      }
      v63 = objc_msgSend(v54, sel_profileIdentifier);
      v64 = objc_msgSend(v63, sel_type);

      if (v64 == (id)1)
      {
        v65 = swift_initStackObject();
        *(_OWORD *)(v65 + 16) = xmmword_1BC81A0F0;
        v66 = (objc_class *)type metadata accessor for PregnancyStateInputSignal();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        v67 = v54;
        v68 = sub_1BC7577A4((uint64_t)v77, v47, v85, (uint64_t)v67, v66, v84, v51);
        *(_QWORD *)(v65 + 56) = v66;
        *(_QWORD *)(v65 + 64) = sub_1BC6E1788(&qword_1ED6B7E40, (uint64_t (*)(uint64_t))type metadata accessor for PregnancyStateInputSignal, (uint64_t)&protocol conformance descriptor for PregnancyStateInputSignal);
        *(_QWORD *)(v65 + 32) = v68;
        v69 = swift_bridgeObjectRetain();
        sub_1BC807560(v69);

        swift_setDeallocating();
        sub_1BC6ED814(0, &qword_1ED6B7F98);
        swift_arrayDestroy();
      }
      else
      {

      }
    }
    v70 = type metadata accessor for HealthAppBuddyCompleteInputSignal();
    swift_allocObject();
    v71 = swift_unknownObjectRetain();
    v72 = HealthAppBuddyCompleteInputSignal.init(observer:)(v71, v85);
    v13 = v86;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_1BC7263E0(0, v13[2] + 1, 1, v13);
    v74 = v13[2];
    v73 = v13[3];
    if (v74 >= v73 >> 1)
      v13 = sub_1BC7263E0((_QWORD *)(v73 > 1), v74 + 1, 1, v13);
    v88 = v70;
    v89 = sub_1BC6E1788(&qword_1ED6B7C98, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal, (uint64_t)&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal);
    *(_QWORD *)&v87 = v72;
    v13[2] = v74 + 1;
    sub_1BC6FC848(&v87, (uint64_t)&v13[5 * v74 + 4]);
    swift_unknownObjectRelease();
    swift_release();
  }
  return v13;
}

uint64_t dispatch thunk of HealthStoreContext.optionalHealthStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthStoreContext.primaryProfileHealthStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for HealthKitProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthKitProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthKitProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t UserProfile.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t result;

  v4 = (void *)Profile.hkProfileIdentifier.getter();
  v5 = objc_msgSend(v4, sel_identifier);
  sub_1BC816F24();

  result = type metadata accessor for UserProfile();
  *(_QWORD *)(a2 + *(int *)(result + 20)) = v4;
  return result;
}

uint64_t sub_1BC80D9D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unsigned __int8 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(_BYTE *, _QWORD);
  _QWORD v27[2];
  uint64_t v28;
  unint64_t v29;
  _BYTE v30[32];
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;

  v28 = type metadata accessor for UserProfile();
  v2 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v5 = sub_1BC8181FC();
  else
    v5 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v34 = MEMORY[0x1E0DEE9D8];
    sub_1BC6E8AC4(0, v5 & ~(v5 >> 63), 0);
    if (v29)
    {
      result = sub_1BC8181B4();
      v8 = 1;
    }
    else
    {
      result = sub_1BC6EACF8(a1);
      v8 = v9 & 1;
    }
    v31 = result;
    v32 = v7;
    v33 = v8;
    if (v5 < 0)
    {
      __break(1u);
LABEL_25:
      __break(1u);
    }
    else
    {
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
      if (a1 < 0)
        v10 = a1;
      v27[1] = v10;
      do
      {
        while (1)
        {
          v17 = v31;
          v16 = v32;
          v18 = v33;
          sub_1BC6EAA08(v31, v32, v33, a1);
          v20 = v19;
          v21 = (void *)Profile.hkProfileIdentifier.getter();
          v22 = objc_msgSend(v21, sel_identifier);
          sub_1BC816F24();

          *(_QWORD *)&v4[*(int *)(v28 + 20)] = v21;
          v23 = v34;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1BC6E8AC4(0, *(_QWORD *)(v23 + 16) + 1, 1);
            v23 = v34;
          }
          v25 = *(_QWORD *)(v23 + 16);
          v24 = *(_QWORD *)(v23 + 24);
          if (v25 >= v24 >> 1)
          {
            sub_1BC6E8AC4(v24 > 1, v25 + 1, 1);
            v23 = v34;
          }
          *(_QWORD *)(v23 + 16) = v25 + 1;
          result = sub_1BC7322D8((uint64_t)v4, v23+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v25);
          if (v29)
            break;
          v11 = sub_1BC6EA6C0(v17, v16, v18, a1);
          v13 = v12;
          v15 = v14;
          sub_1BC6EAF90(v17, v16, v18);
          v31 = v11;
          v32 = v13;
          v33 = v15 & 1;
          if (!--v5)
            goto LABEL_22;
        }
        if ((v18 & 1) == 0)
          goto LABEL_25;
        if (sub_1BC8181CC())
          swift_isUniquelyReferenced_nonNull_native();
        sub_1BC80DE90();
        v26 = (void (*)(_BYTE *, _QWORD))sub_1BC817DA0();
        sub_1BC818250();
        v26(v30, 0);
        --v5;
      }
      while (v5);
LABEL_22:
      sub_1BC6EAF90(v31, v32, v33);
      return v34;
    }
  }
  return result;
}

uint64_t PluginStorage.init(_:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t result;
  uint64_t v24;

  v4 = objc_msgSend(a1, sel_uniqueIdentifier);
  v24 = sub_1BC817AE8();
  v6 = v5;

  v7 = objc_msgSend(a1, sel_profiles);
  type metadata accessor for Profile();
  sub_1BC6EC424();
  v8 = sub_1BC817D7C();

  v9 = sub_1BC80D9D4(v8);
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1BC769E4C(v9);
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(a1, sel_data);
  if (v11)
  {
    v12 = v11;
    v13 = sub_1BC816E64();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  v16 = v10;
  swift_bridgeObjectRetain();
  sub_1BC6F7DC4(v13, v15);
  v17 = objc_msgSend(a1, sel_plugin);
  v18 = objc_msgSend(v17, sel_package);

  v19 = sub_1BC817AE8();
  v21 = v20;

  swift_bridgeObjectRetain();
  v22 = v16;
  sub_1BC6F7DC4(v13, v15);
  swift_bridgeObjectRetain();
  sub_1BC6ECB4C(v13, v15);
  swift_bridgeObjectRelease_n();

  sub_1BC6ECB4C(v13, v15);
  result = swift_bridgeObjectRelease();
  *a2 = v24;
  a2[1] = v6;
  a2[2] = (uint64_t)v10;
  a2[3] = v13;
  a2[4] = v15;
  a2[5] = v19;
  a2[6] = v21;
  return result;
}

void sub_1BC80DE90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6BA450)
  {
    type metadata accessor for Profile();
    sub_1BC6EC424();
    v0 = sub_1BC817DAC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6BA450);
  }
}

HealthPlatform::FeedItemTimeScope_optional __swiftcall FeedItemTimeScope.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthPlatform::FeedItemTimeScope_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BC818568();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static FeedItemTimeScope.allCases.getter()
{
  return &unk_1E7516AC0;
}

uint64_t FeedItemTimeScope.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BC80DF7C + 4 * byte_1BC824360[*v0]))(1920298856, 0xE400000000000000);
}

uint64_t sub_1BC80DF7C()
{
  return 7954788;
}

uint64_t sub_1BC80DF8C()
{
  return 1801807223;
}

uint64_t sub_1BC80DF98()
{
  return 0x68746E6F6DLL;
}

uint64_t sub_1BC80DFAC()
{
  return 1918985593;
}

void sub_1BC80DFB8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1BC81873C();
  __asm { BR              X9 }
}

uint64_t sub_1BC80DFFC()
{
  sub_1BC817B30();
  swift_bridgeObjectRelease();
  return sub_1BC818778();
}

void sub_1BC80E060()
{
  __asm { BR              X10 }
}

uint64_t sub_1BC80E094()
{
  sub_1BC817B30();
  return swift_bridgeObjectRelease();
}

void sub_1BC80E0E4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1BC81873C();
  __asm { BR              X9 }
}

uint64_t sub_1BC80E124()
{
  sub_1BC817B30();
  swift_bridgeObjectRelease();
  return sub_1BC818778();
}

HealthPlatform::FeedItemTimeScope_optional sub_1BC80E188(Swift::String *a1)
{
  return FeedItemTimeScope.init(rawValue:)(*a1);
}

uint64_t sub_1BC80E194()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1BC80E1BC + 4 * byte_1BC824374[*v0]))();
}

void sub_1BC80E1BC(_QWORD *a1@<X8>)
{
  *a1 = 7954788;
  a1[1] = 0xE300000000000000;
}

void sub_1BC80E1D0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1801807223;
  a1[1] = v1;
}

void sub_1BC80E1E0(_QWORD *a1@<X8>)
{
  *a1 = 0x68746E6F6DLL;
  a1[1] = 0xE500000000000000;
}

void sub_1BC80E1F8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1918985593;
  a1[1] = v1;
}

uint64_t sub_1BC80E208()
{
  sub_1BC80E4B0();
  return sub_1BC817C2C();
}

uint64_t sub_1BC80E264()
{
  sub_1BC80E4B0();
  return sub_1BC817C14();
}

void sub_1BC80E2B0(char *a1)
{
  sub_1BC7E08AC(*a1);
}

void sub_1BC80E2BC(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E7516AE8;
}

void TimeScopeFeatureTag.value.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

HealthPlatform::TimeScopeFeatureTag __swiftcall TimeScopeFeatureTag.init(_:)(HealthPlatform::TimeScopeFeatureTag result)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)result.value;
  return result;
}

unint64_t sub_1BC80E2E8()
{
  unint64_t result;

  result = qword_1EF45D3A0;
  if (!qword_1EF45D3A0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for FeedItemTimeScope, &type metadata for FeedItemTimeScope);
    atomic_store(result, (unint64_t *)&qword_1EF45D3A0);
  }
  return result;
}

unint64_t sub_1BC80E330()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF45D3A8;
  if (!qword_1EF45D3A8)
  {
    sub_1BC80E378();
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF45D3A8);
  }
  return result;
}

void sub_1BC80E378()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D3B0)
  {
    v0 = sub_1BC817D04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D3B0);
  }
}

ValueMetadata *type metadata accessor for FeedItemTimeScope()
{
  return &type metadata for FeedItemTimeScope;
}

uint64_t _s14HealthPlatform17FeedItemTimeScopeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC80E430 + 4 * byte_1BC82437E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1BC80E464 + 4 * byte_1BC824379[v4]))();
}

uint64_t sub_1BC80E464(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC80E46C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC80E474);
  return result;
}

uint64_t sub_1BC80E480(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC80E488);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1BC80E48C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC80E494(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimeScopeFeatureTag()
{
  return &type metadata for TimeScopeFeatureTag;
}

unint64_t sub_1BC80E4B0()
{
  unint64_t result;

  result = qword_1ED6BAB28;
  if (!qword_1ED6BAB28)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for FeedItemTimeScope, &type metadata for FeedItemTimeScope);
    atomic_store(result, (unint64_t *)&qword_1ED6BAB28);
  }
  return result;
}

uint64_t RelevantDateInterval.init(interval:rampUpTime:rampDownTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t result;

  v8 = sub_1BC816C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a2, a1, v8);
  result = type metadata accessor for RelevantDateInterval();
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  *(double *)(a2 + *(int *)(result + 24)) = a4;
  return result;
}

uint64_t type metadata accessor for RelevantDateInterval()
{
  uint64_t result;

  result = qword_1ED6BB480;
  if (!qword_1ED6BB480)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RelevantDateInterval.init(interval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v4 = sub_1BC816C9C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RelevantDateInterval();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4) == 1)
  {
    sub_1BC6ED784(a1, (uint64_t (*)(_QWORD))sub_1BC6ECAEC);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, 1, 1, v8);
  }
  else
  {
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    v13(v7, a1, v4);
    v13(v11, (uint64_t)v7, v4);
    *(_QWORD *)&v11[*(int *)(v8 + 20)] = 0;
    *(_QWORD *)&v11[*(int *)(v8 + 24)] = 0;
    sub_1BC722C3C((uint64_t)v11, a2);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
}

uint64_t RelevantDateInterval.interval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BC816C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t RelevantDateInterval.interval.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BC816C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*RelevantDateInterval.interval.modify())()
{
  return nullsub_1;
}

double RelevantDateInterval.rampUpTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RelevantDateInterval() + 20));
}

uint64_t RelevantDateInterval.rampUpTime.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RelevantDateInterval();
  *(double *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RelevantDateInterval.rampUpTime.modify())()
{
  type metadata accessor for RelevantDateInterval();
  return nullsub_1;
}

double RelevantDateInterval.rampDownTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RelevantDateInterval() + 24));
}

uint64_t RelevantDateInterval.rampDownTime.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RelevantDateInterval();
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*RelevantDateInterval.rampDownTime.modify())()
{
  type metadata accessor for RelevantDateInterval();
  return nullsub_1;
}

uint64_t RelevantDateInterval.dateOfInitialRelevance.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BC816EF4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC816C90();
  type metadata accessor for RelevantDateInterval();
  sub_1BC816EA0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t RelevantDateInterval.dateOfFinalRelevance.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BC816EF4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC816C78();
  type metadata accessor for RelevantDateInterval();
  sub_1BC816EA0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t RelevantDateInterval.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v17;

  v4 = sub_1BC816EF4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v17 - v9;
  v11 = sub_1BC816C9C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v10, a1, v4);
  v15(v8, a1, v4);
  sub_1BC816C84();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v14, v11);
  result = type metadata accessor for RelevantDateInterval();
  *(_QWORD *)(a2 + *(int *)(result + 20)) = 0;
  *(_QWORD *)(a2 + *(int *)(result + 24)) = 0;
  return result;
}

BOOL static RelevantDateInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_1BC816C6C() & 1) != 0
    && (v4 = type metadata accessor for RelevantDateInterval(),
        *(double *)(a1 + *(int *)(v4 + 20)) == *(double *)(a2 + *(int *)(v4 + 20))))
  {
    return *(double *)(a1 + *(int *)(v4 + 24)) == *(double *)(a2 + *(int *)(v4 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t RelevantDateInterval.hash(into:)()
{
  sub_1BC816C9C();
  sub_1BC6E1788(&qword_1ED6B87E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE5F0]);
  sub_1BC817A7C();
  type metadata accessor for RelevantDateInterval();
  sub_1BC81876C();
  return sub_1BC81876C();
}

uint64_t sub_1BC80EBD4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x69547055706D6172;
  if (*v0 != 1)
    v1 = 0x6E776F44706D6172;
  if (*v0)
    return v1;
  else
    return 0x6C61767265746E69;
}

uint64_t sub_1BC80EC3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BC80F980(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BC80EC60()
{
  sub_1BC80EE38();
  return sub_1BC8187FC();
}

uint64_t sub_1BC80EC88()
{
  sub_1BC80EE38();
  return sub_1BC818808();
}

uint64_t RelevantDateInterval.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  sub_1BC80F3AC(0, &qword_1ED6B8D48, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC80EE38();
  sub_1BC8187F0();
  v9[15] = 0;
  sub_1BC816C9C();
  sub_1BC6E1788(&qword_1ED6B87D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE5E8]);
  sub_1BC818634();
  if (!v1)
  {
    type metadata accessor for RelevantDateInterval();
    v9[14] = 1;
    sub_1BC81861C();
    v9[13] = 2;
    sub_1BC81861C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BC80EE38()
{
  unint64_t result;

  result = qword_1ED6BA710;
  if (!qword_1ED6BA710)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8246F8, &type metadata for RelevantDateInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6BA710);
  }
  return result;
}

uint64_t RelevantDateInterval.hashValue.getter()
{
  sub_1BC81873C();
  sub_1BC816C9C();
  sub_1BC6E1788(&qword_1ED6B87E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE5F0]);
  sub_1BC817A7C();
  type metadata accessor for RelevantDateInterval();
  sub_1BC81876C();
  sub_1BC81876C();
  return sub_1BC818778();
}

uint64_t RelevantDateInterval.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;

  v23 = a2;
  v24 = sub_1BC816C9C();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v25 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC80F3AC(0, &qword_1ED6B6510, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v26 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - v7;
  v9 = type metadata accessor for RelevantDateInterval();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC80EE38();
  v27 = v8;
  v12 = v28;
  sub_1BC8187E4();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v28 = v9;
  v13 = v6;
  v14 = (uint64_t)v11;
  v31 = 0;
  sub_1BC6E1788(&qword_1ED6B6508, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE600]);
  v16 = v24;
  v15 = v25;
  v17 = v26;
  sub_1BC8185C8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v14, v15, v16);
  v30 = 1;
  sub_1BC8185B0();
  *(_QWORD *)(v14 + *(int *)(v28 + 20)) = v18;
  v29 = 2;
  sub_1BC8185B0();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v27, v17);
  *(_QWORD *)(v14 + *(int *)(v28 + 24)) = v20;
  sub_1BC80F408(v14, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1BC6ED784(v14, (uint64_t (*)(_QWORD))type metadata accessor for RelevantDateInterval);
}

uint64_t sub_1BC80F1DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RelevantDateInterval.init(from:)(a1, a2);
}

uint64_t sub_1BC80F1F0(_QWORD *a1)
{
  return RelevantDateInterval.encode(to:)(a1);
}

BOOL sub_1BC80F204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_1BC816C6C() & 1) != 0
      && *(double *)(a1 + *(int *)(a3 + 20)) == *(double *)(a2 + *(int *)(a3 + 20))
      && *(double *)(a1 + *(int *)(a3 + 24)) == *(double *)(a2 + *(int *)(a3 + 24));
}

uint64_t sub_1BC80F26C()
{
  sub_1BC816C9C();
  sub_1BC6E1788(&qword_1ED6B87E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE5F0]);
  sub_1BC817A7C();
  sub_1BC81876C();
  return sub_1BC81876C();
}

uint64_t sub_1BC80F304()
{
  sub_1BC81873C();
  sub_1BC816C9C();
  sub_1BC6E1788(&qword_1ED6B87E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], MEMORY[0x1E0CAE5F0]);
  sub_1BC817A7C();
  sub_1BC81876C();
  sub_1BC81876C();
  return sub_1BC818778();
}

void sub_1BC80F3AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BC80EE38();
    v7 = a3(a1, &type metadata for RelevantDateInterval.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BC80F408(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RelevantDateInterval();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC80F44C()
{
  return sub_1BC6E1788(&qword_1EF45D3E0, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval, (uint64_t)&protocol conformance descriptor for RelevantDateInterval);
}

uint64_t *initializeBufferWithCopyOfBuffer for RelevantDateInterval(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BC816C9C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for RelevantDateInterval(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BC816C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BC816C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1BC816C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BC816C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BC816C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for RelevantDateInterval()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC80F6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BC816C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RelevantDateInterval()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC80F724(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BC816C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1BC80F764()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC816C9C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RelevantDateInterval.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC80F828 + 4 * byte_1BC824545[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BC80F85C + 4 * asc_1BC824540[v4]))();
}

uint64_t sub_1BC80F85C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC80F864(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC80F86CLL);
  return result;
}

uint64_t sub_1BC80F878(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC80F880);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BC80F884(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC80F88C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RelevantDateInterval.CodingKeys()
{
  return &type metadata for RelevantDateInterval.CodingKeys;
}

unint64_t sub_1BC80F8AC()
{
  unint64_t result;

  result = qword_1EF45D3E8;
  if (!qword_1EF45D3E8)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC8246D0, &type metadata for RelevantDateInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF45D3E8);
  }
  return result;
}

unint64_t sub_1BC80F8F4()
{
  unint64_t result;

  result = qword_1ED6BA720;
  if (!qword_1ED6BA720)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC824640, &type metadata for RelevantDateInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6BA720);
  }
  return result;
}

unint64_t sub_1BC80F93C()
{
  unint64_t result;

  result = qword_1ED6BA718;
  if (!qword_1ED6BA718)
  {
    result = MEMORY[0x1BCCF5AB4](&unk_1BC824668, &type metadata for RelevantDateInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6BA718);
  }
  return result;
}

uint64_t sub_1BC80F980(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_1BC818694() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69547055706D6172 && a2 == 0xEA0000000000656DLL || (sub_1BC818694() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F44706D6172 && a2 == 0xEC000000656D6954)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1BC818694();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t HealthAppBuddyCompleteInputSignal.__allocating_init(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  HealthAppBuddyCompleteInputSignal.init(observer:)(a1, a2);
  return v4;
}

uint64_t static InputSignalIdentifier.healthAppBuddyComplete.getter()
{
  return sub_1BC8173E0();
}

uint64_t static InputSignalSet.LookupKey.healthAppBuddyComplete.getter()
{
  uint64_t v0;

  v0 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v0);
  sub_1BC8173E0();
  type metadata accessor for HealthAppBuddyCompleteInputSignal();
  return sub_1BC817260();
}

uint64_t sub_1BC80FBF4(void *a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = a1;
  v2 = sub_1BC80FC64(MEMORY[0x1E0CB75E8]);

  return v2 & 1;
}

uint64_t sub_1BC80FC2C(void *a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = a1;
  v2 = sub_1BC80FC64(MEMORY[0x1E0CB75E0]);

  return v2 & 1;
}

id sub_1BC80FC64(_QWORD *a1)
{
  void *v1;
  id v2;
  id v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  if (objc_msgSend(v1, sel_valueForKey_, *a1))
  {
    sub_1BC818178();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1BC7AFD7C((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_1BC6EF7BC((uint64_t)v6);
    return 0;
  }
  sub_1BC6ED7C0(0, &qword_1ED6BA520);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v2 = objc_msgSend(v4, sel_BOOLValue);

  return v2;
}

uint64_t sub_1BC80FD44(void *a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = a1;
  v2 = sub_1BC80FC64(MEMORY[0x1E0CB75F8]);

  return v2 & 1;
}

uint64_t HealthAppBuddyCompleteInputSignal.identifier.getter()
{
  return sub_1BC8173E0();
}

uint64_t HealthAppBuddyCompleteInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t static HealthAppBuddyCompleteInputSignal.Errors.== infix(_:_:)()
{
  return 1;
}

uint64_t HealthAppBuddyCompleteInputSignal.Errors.hash(into:)()
{
  return sub_1BC818748();
}

uint64_t HealthAppBuddyCompleteInputSignal.Errors.hashValue.getter()
{
  sub_1BC81873C();
  sub_1BC818748();
  return sub_1BC818778();
}

uint64_t *HealthAppBuddyCompleteInputSignal.init(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v15 = a2;
  v16 = a1;
  v14 = *v2;
  sub_1BC810014();
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC810078();
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  v2[4] = v8;
  sub_1BC817AE8();
  v9 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v10 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithSuiteName_, v10, v14);

  if (v11)
  {
    v12 = v15;
    v2[2] = v16;
    v2[3] = v12;
    v17 = v11;
    sub_1BC6ED7C0(0, &qword_1ED6B84C0);
    sub_1BC8172CC();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v2 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults, v7, v4);
  }
  else
  {
    sub_1BC8100D4();
    swift_allocError();
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_release();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

uint64_t type metadata accessor for HealthAppBuddyCompleteInputSignal()
{
  uint64_t result;

  result = qword_1ED6B7CA0;
  if (!qword_1ED6B7CA0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC810014()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B7FB8)
  {
    sub_1BC6ED7C0(255, &qword_1ED6B84C0);
    v0 = sub_1BC8172C0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B7FB8);
  }
}

void sub_1BC810078()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8618)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_1BC818340();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8618);
  }
}

unint64_t sub_1BC8100D4()
{
  unint64_t result;

  result = qword_1EF45D3F0;
  if (!qword_1EF45D3F0)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal.Errors, &type metadata for HealthAppBuddyCompleteInputSignal.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45D3F0);
  }
  return result;
}

void sub_1BC81011C(void **a1)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  void *v14;

  v2 = (objc_class *)type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer();
  v3 = objc_allocWithZone(v2);
  swift_weakInit();
  swift_weakAssign();
  v13.receiver = v3;
  v13.super_class = v2;
  v4 = objc_msgSendSuper2(&v13, sel_init);
  v5 = *a1;
  v6 = v4;

  *a1 = v4;
  sub_1BC817AE8();
  sub_1BC817AE8();
  sub_1BC817AE8();
  sub_1BC810014();
  swift_bridgeObjectRetain();
  sub_1BC8172B4();
  v7 = v14;
  v8 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_addObserver_forKeyPath_options_context_, v6, v8, 0, 0);

  swift_bridgeObjectRetain();
  sub_1BC8172B4();
  v9 = v14;
  v10 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_addObserver_forKeyPath_options_context_, v6, v10, 0, 0);

  swift_bridgeObjectRetain();
  sub_1BC8172B4();
  v11 = v14;
  v12 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_addObserver_forKeyPath_options_context_, v6, v12, 0, 0);

  swift_arrayDestroy();
}

Swift::Void __swiftcall HealthAppBuddyCompleteInputSignal.stopObservation()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  void **v2;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(v0 + 32);
  v2 = (void **)&v1[4];
  v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1BC8103A0(v2);
  os_unfair_lock_unlock(v3);
}

void sub_1BC8103A0(void **a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    sub_1BC817AE8();
    sub_1BC817AE8();
    sub_1BC817AE8();
    sub_1BC810014();
    sub_1BC8172B4();
    v2 = (void *)sub_1BC817AC4();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v2);

    swift_bridgeObjectRetain();
    sub_1BC8172B4();
    v3 = (void *)sub_1BC817AC4();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v3);

    swift_bridgeObjectRetain();
    sub_1BC8172B4();
    v4 = (void *)sub_1BC817AC4();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v4);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_1BC81054C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  unsigned __int8 v9;

  v1 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v1);
  sub_1BC810C8C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_1BC8173E0();
  v9 = objc_msgSend((id)objc_opt_self(), sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E0CB75F0]);
  sub_1BC8171D0();
  v8 = v0;
  sub_1BC6E1788(&qword_1ED6B7C98, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal, (uint64_t)&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal);
  sub_1BC817374();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t HealthAppBuddyCompleteInputSignal.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_1BC8103A0((void **)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  swift_release();
  swift_unknownObjectRelease();
  v2 = v0 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults;
  sub_1BC810014();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t HealthAppBuddyCompleteInputSignal.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_1BC8103A0((void **)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  swift_release();
  swift_unknownObjectRelease();
  v2 = v0 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults;
  sub_1BC810014();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocClassInstance();
}

id sub_1BC810958()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC810998()
{
  return sub_1BC8173E0();
}

uint64_t sub_1BC8109B4()
{
  return _s14HealthPlatform0A27AppBuddyCompleteInputSignalC16beginObservation4from14configurationsy0A13Orchestration11ValueAnchorVySbGSg_SayAG21IdentityConfigurationVGtF_0();
}

void sub_1BC8109D4()
{
  HealthAppBuddyCompleteInputSignal.stopObservation()();
}

uint64_t sub_1BC8109F4()
{
  sub_1BC6E1788(&qword_1ED6B7C98, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal, (uint64_t)&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal);
  return sub_1BC8171AC();
}

uint64_t _s14HealthPlatform0A27AppBuddyCompleteInputSignalC16beginObservation4from14configurationsy0A13Orchestration11ValueAnchorVySbGSg_SayAG21IdentityConfigurationVGtF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_unfair_lock_s *v7;
  void **v8;
  os_unfair_lock_s *v9;
  uint64_t v11;

  v1 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v1);
  sub_1BC810C8C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(os_unfair_lock_s **)(v0 + 32);
  v8 = (void **)&v7[4];
  v9 = v7 + 6;
  os_unfair_lock_lock(v7 + 6);
  sub_1BC81011C(v8);
  os_unfair_lock_unlock(v9);
  swift_getObjectType();
  sub_1BC8173E0();
  LOBYTE(v11) = objc_msgSend((id)objc_opt_self(), sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E0CB75F0]);
  sub_1BC8171D0();
  v11 = v0;
  sub_1BC6E1788(&qword_1ED6B7C98, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal, (uint64_t)&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal);
  sub_1BC817374();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BC810BF0()
{
  unint64_t result;

  result = qword_1EF45D3F8;
  if (!qword_1EF45D3F8)
  {
    result = MEMORY[0x1BCCF5AB4](&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal.Errors, &type metadata for HealthAppBuddyCompleteInputSignal.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF45D3F8);
  }
  return result;
}

uint64_t sub_1BC810C34()
{
  return sub_1BC6E1788(&qword_1ED6B9340, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal, (uint64_t)&protocol conformance descriptor for HealthAppBuddyCompleteInputSignal);
}

uint64_t sub_1BC810C60()
{
  return sub_1BC6E1788(&qword_1EF45D400, (uint64_t (*)(uint64_t))sub_1BC810C8C, MEMORY[0x1E0D2CF00]);
}

void sub_1BC810C8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D408)
  {
    v0 = sub_1BC8171DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D408);
  }
}

uint64_t sub_1BC810D00()
{
  return type metadata accessor for HealthAppBuddyCompleteInputSignal();
}

void sub_1BC810D08()
{
  unint64_t v0;

  sub_1BC810014();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for HealthAppBuddyCompleteInputSignal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthAppBuddyCompleteInputSignal.__allocating_init(observer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t storeEnumTagSinglePayload for HealthAppBuddyCompleteInputSignal.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BC810DF0 + 4 * byte_1BC824750[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BC810E10 + 4 * byte_1BC824755[v4]))();
}

_BYTE *sub_1BC810DF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BC810E10(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC810E18(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC810E20(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BC810E28(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BC810E30(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HealthAppBuddyCompleteInputSignal.Errors()
{
  return &type metadata for HealthAppBuddyCompleteInputSignal.Errors;
}

uint64_t type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for HealthAppBuddyCompleteInputSignal.State()
{
  return &type metadata for HealthAppBuddyCompleteInputSignal.State;
}

uint64_t sub_1BC810E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t result;
  _BYTE v7[16];

  v0 = sub_1BC8173EC();
  MEMORY[0x1E0C80A78](v0);
  sub_1BC810C8C();
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BC8173E0();
    v7[15] = objc_msgSend((id)objc_opt_self(), sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E0CB75F0]);
    sub_1BC8171D0();
    sub_1BC81054C();
    swift_release();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ContentStateManager.getContentState(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of ContentStateManager.setContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ContentStateManager.removeContentState(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of NotificationContentStateManager.setProtectedContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NotificationContentStateManager.setUnprotectedContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of NotificationContentStateManager.migrateContentStateIfNecessary(with:notificationIdentifier:keyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t DateRangeFeatureTag.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC76ABCC(v1, a1);
}

uint64_t DateRangeFeatureTag.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BC811024(a1, a2);
}

uint64_t sub_1BC811024(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6ECA48(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC811068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC76ABCC(v1, a1);
}

uint64_t sub_1BC811074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BC811024(a1, a2);
}

uint64_t sub_1BC81107C()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_1ED6B7DD0 = result;
  return result;
}

uint64_t static DateRangeFeatureTag.keyPath.getter()
{
  if (qword_1ED6B7DC8 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static DateRangeFeatureTag.keyPath.setter(uint64_t a1)
{
  if (qword_1ED6B7DC8 != -1)
    swift_once();
  swift_beginAccess();
  qword_1ED6B7DD0 = a1;
  return swift_release();
}

uint64_t (*static DateRangeFeatureTag.keyPath.modify())()
{
  if (qword_1ED6B7DC8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BC8111EC()
{
  if (qword_1ED6B7DC8 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t *initializeBufferWithCopyOfBuffer for DateRangeFeatureTag(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1BC6ECA48(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for RelevantDateInterval();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_1BC816C9C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 20));
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DateRangeFeatureTag(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = type metadata accessor for RelevantDateInterval();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_1BC816C9C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

char *initializeWithCopy for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for RelevantDateInterval();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_1BC6ECA48(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_1BC816C9C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
    *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

char *assignWithCopy for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for RelevantDateInterval();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      v12 = sub_1BC816C9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(a1, a2, v12);
      *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
      *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
      return a1;
    }
    sub_1BC8115A0((uint64_t)a1);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1BC6ECA48(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    return a1;
  }
  v9 = sub_1BC816C9C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
  *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_1BC8115A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RelevantDateInterval();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for RelevantDateInterval();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_1BC6ECA48(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_1BC816C9C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
    *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

char *assignWithTake for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for RelevantDateInterval();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      v12 = sub_1BC816C9C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(a1, a2, v12);
      *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
      *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
      return a1;
    }
    sub_1BC8115A0((uint64_t)a1);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1BC6ECA48(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    return a1;
  }
  v9 = sub_1BC816C9C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  *(_QWORD *)&a1[*(int *)(v4 + 20)] = *(_QWORD *)&a2[*(int *)(v4 + 20)];
  *(_QWORD *)&a1[*(int *)(v4 + 24)] = *(_QWORD *)&a2[*(int *)(v4 + 24)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DateRangeFeatureTag()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC8117D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6ECA48(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DateRangeFeatureTag()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC811820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC6ECA48(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DateRangeFeatureTag()
{
  uint64_t result;

  result = qword_1ED6BB058;
  if (!qword_1ED6BB058)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC81189C()
{
  unint64_t v0;

  sub_1BC6ECA48(319);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_1BC81190C()
{
  uint64_t inited;
  void *v1;
  unsigned __int8 v2;
  unint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;

  sub_1BC811DCC();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BC81A0E0;
  *(_QWORD *)(inited + 32) = 0xD000000000000032;
  *(_QWORD *)(inited + 40) = 0x80000001BC8275D0;
  *(_QWORD *)(inited + 72) = sub_1BC816EF4();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 48));
  sub_1BC816EE8();
  *(_QWORD *)(inited + 80) = 0xD000000000000038;
  *(_QWORD *)(inited + 88) = 0x80000001BC827690;
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_hasPairedWatch);
  *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 96) = v2;
  v3 = sub_1BC710164(inited);
  v4 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v5 = objc_msgSend(v4, sel_infoDictionary);

  if (v5)
  {
    v6 = sub_1BC817A34();

    result = *MEMORY[0x1E0C9AE90];
    if (!*MEMORY[0x1E0C9AE90])
    {
      __break(1u);
      return result;
    }
    v8 = sub_1BC817AE8();
    if (*(_QWORD *)(v6 + 16) && (v10 = sub_1BC706608(v8, v9), (v11 & 1) != 0))
    {
      sub_1BC6E1A84(*(_QWORD *)(v6 + 56) + 32 * v10, (uint64_t)&v30);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v31 + 1))
    {
      v12 = MEMORY[0x1E0DEA968];
      if ((swift_dynamicCast() & 1) != 0)
      {
        v13 = v29[0];
        if (v29[0] == __PAIR128__(0xE400000000000000, 960051513) || (sub_1BC818694() & 1) != 0)
        {
          if (qword_1ED6BB338 != -1)
            swift_once();
          v14 = sub_1BC817590();
          __swift_project_value_buffer(v14, (uint64_t)qword_1ED6BB320);
          swift_bridgeObjectRetain();
          v15 = sub_1BC81756C();
          v16 = sub_1BC817E9C();
          if (os_log_type_enabled(v15, v16))
          {
            v17 = swift_slowAlloc();
            v28 = swift_slowAlloc();
            *(_QWORD *)&v30 = v28;
            *(_DWORD *)v17 = 136315394;
            v18 = sub_1BC818814();
            sub_1BC6E14D8(v18, v19, (uint64_t *)&v30);
            sub_1BC818148();
            swift_bridgeObjectRelease();
            *(_WORD *)(v17 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v29[0] = sub_1BC6E14D8(v13, *((unint64_t *)&v13 + 1), (uint64_t *)&v30);
            sub_1BC818148();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1BC6DD000, v15, v16, "[%s] Skipping adding bundle version because it doesn't seem sane: %s", (uint8_t *)v17, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1BCCF5BA4](v28, -1, -1);
            MEMORY[0x1BCCF5BA4](v17, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
        }
        else
        {
          *((_QWORD *)&v31 + 1) = v12;
          v30 = v29[0];
          sub_1BC6EFBDC(&v30, v29);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          sub_1BC71F4FC(v29, 0xD000000000000032, 0x80000001BC827610, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
        }
      }
      goto LABEL_17;
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  sub_1BC6EF7BC((uint64_t)&v30);
LABEL_17:
  v20 = objc_msgSend(v1, sel_currentOSBuild);
  if (v20)
  {
    v21 = v20;
    v22 = MEMORY[0x1E0DEA968];
    v23 = sub_1BC817AE8();
    v25 = v24;

    *((_QWORD *)&v31 + 1) = v22;
    *(_QWORD *)&v30 = v23;
    *((_QWORD *)&v30 + 1) = v25;
    sub_1BC6EFBDC(&v30, v29);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_1BC71F4FC(v29, 0xD000000000000031, 0x80000001BC827650, v26);
    swift_bridgeObjectRelease();
  }
  return v3;
}

void sub_1BC811DCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6BA578)
  {
    sub_1BC6EF850();
    v0 = sub_1BC81867C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6BA578);
  }
}

uint64_t sub_1BC811E20(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unsigned int v7;

  v2 = *a1;
  v4 = 1;
  switch(*a1)
  {
    case 4:
      if ((sub_1BC7C9F44(0xD000000000000028, 0x80000001BC8250A0, a2) & 1) != 0)
      {
        v4 = 5;
      }
      else if ((sub_1BC7C9F44(0xD00000000000002CLL, 0x80000001BC824EF0, a2) & 1) != 0)
      {
        v4 = 5;
      }
      else
      {
        v4 = 4;
      }
      break;
    case 5:
      v4 = 2;
      if ((sub_1BC7C9F44(0xD000000000000028, 0x80000001BC8250A0, a2) & 1) == 0)
      {
        if ((sub_1BC7C9F44(0xD00000000000002CLL, 0x80000001BC824EF0, a2) & 1) != 0)
          v4 = 2;
        else
          v4 = 0;
      }
      break;
    case 0xC:
      goto LABEL_11;
    case 0x13:
      return v4;
    default:
      if (qword_1ED6BB2C8 != -1)
        swift_once();
      swift_beginAccess();
      v5 = qword_1ED6BB268;
      swift_bridgeObjectRetain();
      v6 = sub_1BC6E83B4(v2, v5);
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0)
      {
LABEL_11:
        v4 = 3;
      }
      else
      {
        if ((_DWORD)v2 == 3)
          v7 = 11;
        else
          v7 = 12;
        if ((_DWORD)v2 == 14)
          v4 = 9;
        else
          v4 = v7;
      }
      break;
  }
  return v4;
}

_QWORD *HealthAppPluginNotificationManager.__allocating_init(healthStore:bundleIdentifier:notificationManager:primaryHealthStore:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v10;

  swift_allocObject();
  v10 = sub_1BC815A78(a1, a2, a3, a4);

  swift_release();
  return v10;
}

_QWORD *HealthAppPluginNotificationManager.init(healthStore:bundleIdentifier:notificationManager:primaryHealthStore:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v7;

  v7 = sub_1BC815A78(a1, a2, a3, a4);

  swift_release();
  return v7;
}

uint64_t sub_1BC812084(void *a1)
{
  return UNUserNotificationCenter.scheduleNotification(_:)(a1);
}

BOOL sub_1BC8120A8(uint64_t a1, char a2, uint64_t a3)
{
  return sub_1BC76CD08(a1, a2 & 1, a3);
}

uint64_t sub_1BC8120D0(__n128 *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  __n128 v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __n128 v36;
  __n128 v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v49[2];
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  __n128 v68;
  __n128 v69;
  __n128 v70;
  __n128 v71;
  __n128 v72;
  __n128 v73;
  __n128 v74;
  __n128 v75;
  _QWORD v76[3];
  __n128 v77;
  unint64_t v78;
  uint64_t v79;
  __n128 v80;
  __n128 v81;

  v58 = *v1;
  sub_1BC6E1E98(0, &qword_1EF45BBC0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96098]);
  v4 = v3;
  v50 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v49 - v5;
  sub_1BC762F40(0, &qword_1EF45BBC8, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C964B8]);
  v53 = v7;
  v52 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v49[0] = (char *)v49 - v8;
  sub_1BC815B8C();
  v57 = v9;
  v56 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v67 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC815D40();
  v62 = v11;
  v61 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v60 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC815F24();
  v65 = v13;
  v64 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v63 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[1];
  v72 = *a1;
  v73 = v15;
  v16 = a1[3];
  v74 = a1[2];
  v75 = v16;
  v18 = v15.n128_i64[1];
  v17 = v15.n128_u64[0];
  v19 = (void *)v1[2];
  swift_bridgeObjectRetain();
  v20 = objc_msgSend(v19, sel_profileIdentifier);
  v21 = v1[4];
  v22 = v1[5];
  v23 = v1;
  v59 = v20;
  v76[0] = v20;
  v76[1] = v21;
  v76[2] = v22;
  v24 = v72.n128_u64[1];
  v77 = v72;
  v78 = v17;
  v51 = v17;
  v79 = v18;
  sub_1BC816048(&v75, &v80);
  sub_1BC816048(&v80, &v81);
  v25 = v81.n128_u64[1];
  if (v81.n128_u64[1])
  {
    if (v81.n128_u64[1] == 1)
    {
      v25 = 0xEB00000000796C6ELL;
      v26 = 0x4F656D6954656E6FLL;
    }
    else
    {
      v26 = v81.n128_u64[0];
    }
  }
  else
  {
    v25 = 0xE400000000000000;
    v26 = 1701736302;
  }
  v66 = v26;
  v68 = v72;
  v69 = v73;
  v70 = v74;
  v71 = v75;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v55 = v24;
  swift_bridgeObjectRetain();
  sub_1BC816084((uint64_t)&v80);
  sub_1BC77B6B0((uint64_t)&v72);
  v27 = sub_1BC8177DC();
  v54 = v22;
  MEMORY[0x1E0C80A78](v27);
  v49[-4] = v1;
  v49[-3] = v76;
  v28 = v58;
  v49[-2] = v58;
  v29 = v49[0];
  sub_1BC8177C4();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v4);
  v30 = (_QWORD *)swift_allocObject();
  v31 = v66;
  v30[2] = v1;
  v30[3] = v31;
  v30[4] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1BC817710();
  sub_1BC815C48();
  v49[1] = v18;
  v32 = v29;
  v33 = v28;
  sub_1BC815CE0();
  sub_1BC6E1788(&qword_1EF45D478, (uint64_t (*)(uint64_t))sub_1BC815C48, MEMORY[0x1E0C95950]);
  v34 = v53;
  sub_1BC8178E4();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v32, v34);
  v35 = swift_allocObject();
  v36 = v73;
  *(__n128 *)(v35 + 16) = v72;
  *(__n128 *)(v35 + 32) = v36;
  v37 = v75;
  *(__n128 *)(v35 + 48) = v74;
  *(__n128 *)(v35 + 64) = v37;
  *(_QWORD *)(v35 + 80) = v51;
  *(_QWORD *)(v35 + 88) = v18;
  *(_QWORD *)(v35 + 96) = v66;
  *(_QWORD *)(v35 + 104) = v25;
  *(_QWORD *)(v35 + 112) = v23;
  *(_QWORD *)(v35 + 120) = v33;
  sub_1BC77B6B0((uint64_t)&v72);
  swift_retain();
  sub_1BC817710();
  sub_1BC815E80();
  sub_1BC815E14(0, &qword_1EF45D488, (void (*)(uint64_t))sub_1BC815E80);
  v38 = MEMORY[0x1E0C95B78];
  sub_1BC6E1788(&qword_1EF45D4A0, (uint64_t (*)(uint64_t))sub_1BC815B8C, MEMORY[0x1E0C95B78]);
  sub_1BC815EE4(&qword_1EF45D498, &qword_1EF45D488, (void (*)(uint64_t))sub_1BC815E80);
  v39 = v60;
  v40 = v57;
  v41 = v67;
  sub_1BC8178E4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v40);
  v42 = swift_allocObject();
  *(_QWORD *)(v42 + 16) = v23;
  *(_QWORD *)(v42 + 24) = v33;
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = sub_1BC816174;
  *(_QWORD *)(v43 + 24) = v42;
  swift_retain();
  sub_1BC817710();
  sub_1BC762F40(0, &qword_1EF45D4B0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC6E1788(&qword_1EF45D4C0, (uint64_t (*)(uint64_t))sub_1BC815D40, v38);
  sub_1BC816000(&qword_1EF45D4B8, &qword_1EF45D4B0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest);
  v44 = v63;
  v45 = v62;
  sub_1BC8178E4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v39, v45);
  sub_1BC6E1788(&qword_1EF45D4C8, (uint64_t (*)(uint64_t))sub_1BC815F24, v38);
  v46 = v65;
  v47 = sub_1BC817854();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v64 + 8))(v44, v46);
  return v47;
}

void sub_1BC81280C(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _OWORD v55[2];
  uint64_t v56;
  uint64_t v57;

  v46 = a4;
  v48 = a5;
  v9 = sub_1BC817590();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v47 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = *a1;
  v12 = a1[2];
  v57 = a1[1];
  v13 = *(_OWORD *)(a1 + 3);
  v15 = a1[5];
  v14 = a1[6];
  v16 = a1[7];
  v17 = *(_QWORD *)(a2 + 48);
  v18 = *(_QWORD *)(v17 + 56);
  v19 = *(_OWORD *)(v17 + 40);
  v55[0] = *(_OWORD *)(v17 + 24);
  v55[1] = v19;
  v56 = v18;
  v20 = *(_OWORD *)a3;
  v21 = *(_OWORD *)(a3 + 16);
  v50 = v13;
  v51 = v20;
  v22 = *(_OWORD *)(a3 + 32);
  v52 = v21;
  v53 = v22;
  v54 = *(_QWORD *)(a3 + 48);
  FeedItemNotificationManagerStore.addOrUpdate(_:)(&v51);
  if (!v5)
  {
    v41 = v10;
    v42 = v12;
    v43 = v9;
    v44 = v15;
    v45 = v14;
    v23 = v47;
    sub_1BC817560();
    sub_1BC6ED3E8((id *)a3);
    sub_1BC6ED3E8((id *)a3);
    v24 = sub_1BC81756C();
    v25 = sub_1BC817E6C();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v40 = v16;
      v27 = v26;
      v28 = swift_slowAlloc();
      *(_QWORD *)&v55[0] = v28;
      *(_DWORD *)v27 = 136446467;
      v29 = sub_1BC818814();
      *(_QWORD *)&v51 = sub_1BC6E14D8(v29, v30, (uint64_t *)v55);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2081;
      v31 = *(_OWORD *)(a3 + 16);
      v51 = *(_OWORD *)a3;
      v52 = v31;
      v53 = *(_OWORD *)(a3 + 32);
      v54 = *(_QWORD *)(a3 + 48);
      v32 = PluginFeedItem.NotificationIdentifier.description.getter();
      *(_QWORD *)&v51 = sub_1BC6E14D8(v32, v33, (uint64_t *)v55);
      sub_1BC818148();
      swift_bridgeObjectRelease();
      sub_1BC732138((void **)a3);
      sub_1BC732138((void **)a3);
      _os_log_impl(&dword_1BC6DD000, v24, v25, "%{public}s Updated plugin notification request metadata: %{private}s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v28, -1, -1);
      v34 = v27;
      v16 = v40;
      MEMORY[0x1BCCF5BA4](v34, -1, -1);
    }
    else
    {
      sub_1BC732138((void **)a3);
      sub_1BC732138((void **)a3);
    }

    (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v43);
    v35 = v44;
    v36 = v45;
    v37 = v57;
    v38 = v48;
    v39 = v42;
    *v48 = v49;
    v38[1] = v37;
    v38[2] = v39;
    *(_OWORD *)(v38 + 3) = v50;
    v38[5] = v35;
    v38[6] = v36;
    v38[7] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1BC77B710(v36, v16);
  }
}

uint64_t sub_1BC812B30(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  v6 = *((_QWORD *)a1 + 2);
  v7 = *((_QWORD *)a1 + 5);
  v10 = *a1;
  v11 = v6;
  v12 = *(__int128 *)((char *)a1 + 24);
  v13 = v7;
  v14 = a1[3];
  *(_QWORD *)&v10 = sub_1BC815518((uint64_t)&v10);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  sub_1BC815E14(0, &qword_1ED6B8228, sub_1BC77A824);
  sub_1BC815EE4((unint64_t *)&qword_1ED6B8220, &qword_1ED6B8228, sub_1BC77A824);
  swift_bridgeObjectRetain();
  sub_1BC81786C();
  swift_release();
  return swift_release();
}

uint64_t sub_1BC812C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(_QWORD);
  int *v12;
  uint64_t result;
  char v14;
  char *v15;
  BOOL v16;
  char v17;
  uint64_t v18;

  sub_1BC77A824(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC6ECB08(a1, (uint64_t)v10, v11);
  v12 = (int *)type metadata accessor for NotificationContentState(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v12 - 1) + 48))(v10, 1, v12) == 1)
  {
    result = sub_1BC6ED784((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1BC77A824);
    v14 = 1;
  }
  else
  {
    v15 = &v10[v12[6]];
    v16 = *(_QWORD *)v15 == a2 && *((_QWORD *)v15 + 1) == a3;
    if (v16 || (sub_1BC818694() & 1) != 0)
    {
      if ((v10[v12[8]] & 1) != 0)
        v17 = 0;
      else
        v17 = v10[v12[7]] ^ 1;
    }
    else
    {
      v17 = 1;
    }
    result = sub_1BC6ED784((uint64_t)v10, type metadata accessor for NotificationContentState);
    v14 = v17 & 1;
  }
  *a4 = v14;
  return result;
}

uint64_t sub_1BC812D74@<X0>(char *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  void *v71;
  char *v72;
  NSObject *v73;
  os_log_type_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  char isUniquelyReferenced_nonNull_native;
  void *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  char *v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t result;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  _OWORD *v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  _OWORD *v145;
  __int128 v146;
  __int128 v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void (**v173)(char *, uint64_t);
  uint64_t *v174;
  uint64_t v175;
  _QWORD *v176;
  uint64_t v177;
  _OWORD v178[2];
  __int128 v179;
  uint64_t v180;
  _QWORD *v181;
  uint64_t v182;
  uint64_t v183;

  v172 = a8;
  v165 = a7;
  v168 = a6;
  v167 = a5;
  v175 = a3;
  v176 = a2;
  sub_1BC81662C();
  v156 = v12;
  v155 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC816690();
  v158 = v15;
  v157 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v150 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC816734();
  v154 = v18;
  v153 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v152 = (char *)&v150 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC8167E8();
  v163 = v20;
  v162 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v161 = (char *)&v150 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (int *)type metadata accessor for NotificationContentState(0);
  v169 = *((_QWORD *)v22 - 1);
  v23 = MEMORY[0x1E0C80A78](v22);
  v166 = (char *)&v150 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = v24;
  MEMORY[0x1E0C80A78](v23);
  v26 = (uint64_t *)((char *)&v150 - v25);
  v27 = sub_1BC817590();
  v173 = *(void (***)(char *, uint64_t))(v27 - 8);
  v28 = MEMORY[0x1E0C80A78](v27);
  v30 = (char *)&v150 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x1E0C80A78](v28);
  v159 = (char *)&v150 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v164 = (char *)&v150 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v160 = (char *)&v150 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v150 - v38;
  v40 = *a1;
  v174 = a9;
  v171 = v37;
  if ((v40 & 1) == 0)
  {
    v41 = v26;
    v42 = v176[6];
    v43 = v176[7];
    if (v43)
    {
      sub_1BC77B710(v176[6], v176[7]);
      sub_1BC784250(v42, v43);
      sub_1BC784250(0, 0);
      sub_1BC817560();
      v44 = a4;
      swift_bridgeObjectRetain_n();
      v45 = sub_1BC81756C();
      v46 = sub_1BC817E9C();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = swift_slowAlloc();
        v48 = swift_slowAlloc();
        v181 = (_QWORD *)v48;
        *(_DWORD *)v47 = 136446466;
        v176 = (_QWORD *)(v47 + 4);
        v49 = sub_1BC818814();
        *(_QWORD *)&v179 = sub_1BC6E14D8(v49, v50, (uint64_t *)&v181);
        sub_1BC818148();
        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v179 = sub_1BC6E14D8(v175, v44, (uint64_t *)&v181);
        sub_1BC818148();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1BC6DD000, v45, v46, "%{public}s Not proceeding with %s", (uint8_t *)v47, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1BCCF5BA4](v48, -1, -1);
        MEMORY[0x1BCCF5BA4](v47, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v173[1](v30, v171);
      v119 = v174;
      v120 = v158;
      v121 = v157;
      v122 = v156;
      v123 = v155;
      sub_1BC815E80();
      sub_1BC8177E8();
      sub_1BC6E1878();
      sub_1BC6E1788(&qword_1EF45D4F0, (uint64_t (*)(uint64_t))sub_1BC81662C, MEMORY[0x1E0C960D0]);
      sub_1BC817920();
      (*(void (**)(char *, uint64_t))(v123 + 8))(v14, v122);
      sub_1BC6E1788(&qword_1EF45D508, (uint64_t (*)(uint64_t))sub_1BC816690, MEMORY[0x1E0C95850]);
      v124 = sub_1BC817854();
      result = (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v17, v120);
      goto LABEL_27;
    }
    sub_1BC784250(v176[6], 0);
    sub_1BC784250(0, 0);
    v26 = v41;
    v27 = v171;
  }
  sub_1BC817560();
  swift_bridgeObjectRetain_n();
  v51 = sub_1BC81756C();
  v52 = sub_1BC817E9C();
  v53 = v52;
  if (os_log_type_enabled(v51, v52))
  {
    v54 = swift_slowAlloc();
    LODWORD(v157) = v53;
    v55 = v54;
    v158 = swift_slowAlloc();
    v181 = (_QWORD *)v158;
    *(_DWORD *)v55 = 136446466;
    v56 = sub_1BC818814();
    *(_QWORD *)&v179 = sub_1BC6E14D8(v56, v57, (uint64_t *)&v181);
    sub_1BC818148();
    v58 = v26;
    v59 = v27;
    swift_bridgeObjectRelease();
    *(_WORD *)(v55 + 12) = 2080;
    swift_bridgeObjectRetain();
    v60 = v175;
    *(_QWORD *)&v179 = sub_1BC6E14D8(v175, a4, (uint64_t *)&v181);
    v61 = v60;
    v27 = v59;
    v26 = v58;
    sub_1BC818148();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BC6DD000, v51, (os_log_type_t)v157, "%{public}s Proceeding with %s", (uint8_t *)v55, 0x16u);
    v62 = v158;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v62, -1, -1);
    MEMORY[0x1BCCF5BA4](v55, -1, -1);

    v63 = (void (**)(char *, uint64_t))v173[1];
    ((void (*)(char *, uint64_t))v63)(v39, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v63 = (void (**)(char *, uint64_t))v173[1];
    ((void (*)(char *, uint64_t))v63)(v39, v27);
    v61 = v175;
  }
  v64 = (uint64_t)v176;
  v65 = v168;
  v66 = v167;
  v67 = (uint64_t)v26 + v22[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68 = sub_1BC816F30();
  *v26 = v61;
  v26[1] = a4;
  v69 = (uint64_t *)((char *)v26 + v22[6]);
  *v69 = v66;
  v69[1] = v65;
  *((_BYTE *)v26 + v22[7]) = 1;
  *((_BYTE *)v26 + v22[8]) = 0;
  v70 = (*(uint64_t (**)(uint64_t))(v64 + 32))(v68);
  if (v70)
  {
    v71 = (void *)v70;
    v175 = v67;
    v72 = v164;
    sub_1BC817560();
    swift_bridgeObjectRetain_n();
    v73 = sub_1BC81756C();
    v74 = sub_1BC817E9C();
    v75 = os_log_type_enabled(v73, v74);
    v151 = v26;
    if (v75)
    {
      v76 = swift_slowAlloc();
      v77 = swift_slowAlloc();
      v173 = v63;
      v78 = v77;
      v181 = (_QWORD *)v77;
      *(_DWORD *)v76 = 136446466;
      v79 = sub_1BC818814();
      *(_QWORD *)&v179 = sub_1BC6E14D8(v79, v80, (uint64_t *)&v181);
      sub_1BC818148();
      v64 = (uint64_t)v176;
      swift_bridgeObjectRelease();
      *(_WORD *)(v76 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v179 = sub_1BC6E14D8(v61, a4, (uint64_t *)&v181);
      sub_1BC818148();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BC6DD000, v73, v74, "%{public}s Scheduling %s", (uint8_t *)v76, 0x16u);
      swift_arrayDestroy();
      v81 = v78;
      v63 = v173;
      MEMORY[0x1BCCF5BA4](v81, -1, -1);
      MEMORY[0x1BCCF5BA4](v76, -1, -1);

      v82 = v164;
      v83 = v171;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v82 = v72;
      v83 = v27;
    }
    ((void (*)(char *, uint64_t))v63)(v82, v83);
    v94 = v71;
    v95 = objc_msgSend(v94, sel_content);
    objc_msgSend(v95, sel_mutableCopy);

    sub_1BC818178();
    swift_unknownObjectRelease();
    sub_1BC6ED7C0(0, &qword_1EF45D518);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v96 = (void *)v179;
      *(_QWORD *)&v179 = sub_1BC817AE8();
      *((_QWORD *)&v179 + 1) = v97;
      v98 = MEMORY[0x1E0DEA968];
      sub_1BC818274();
      v99 = sub_1BC816F00();
      v180 = v98;
      *(_QWORD *)&v179 = v99;
      *((_QWORD *)&v179 + 1) = v100;
      v101 = objc_msgSend(v96, sel_userInfo);
      v102 = sub_1BC817A34();

      sub_1BC6EFBDC(&v179, v178);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v177 = v102;
      sub_1BC720250(v178, (uint64_t)&v181, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_1BC6EF788((uint64_t)&v181);
      v104 = (void *)sub_1BC817A28();
      swift_bridgeObjectRelease();
      objc_msgSend(v96, sel_setUserInfo_, v104);

      v105 = objc_msgSend(v94, sel_identifier);
      sub_1BC817AE8();

      v106 = v96;
      v107 = objc_msgSend(v94, sel_trigger);
      v108 = (void *)sub_1BC817AC4();
      swift_bridgeObjectRelease();
      v109 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v108, v106, v107);

    }
    else
    {
      v110 = v159;
      sub_1BC817560();
      sub_1BC77B6B0(v64);
      sub_1BC77B6B0(v64);
      v111 = sub_1BC81756C();
      v112 = sub_1BC817E90();
      if (os_log_type_enabled(v111, v112))
      {
        v113 = swift_slowAlloc();
        v114 = swift_slowAlloc();
        v181 = (_QWORD *)v114;
        *(_DWORD *)v113 = 136446466;
        v115 = sub_1BC818814();
        v173 = v63;
        *(_QWORD *)&v179 = sub_1BC6E14D8(v115, v116, (uint64_t *)&v181);
        sub_1BC818148();
        swift_bridgeObjectRelease();
        *(_WORD *)(v113 + 12) = 2080;
        v117 = *(_QWORD *)(v64 + 16);
        v118 = v176[3];
        swift_bridgeObjectRetain();
        *(_QWORD *)&v179 = sub_1BC6E14D8(v117, v118, (uint64_t *)&v181);
        sub_1BC818148();
        v64 = (uint64_t)v176;
        swift_bridgeObjectRelease();
        sub_1BC8168C8(v64);
        sub_1BC8168C8(v64);
        _os_log_impl(&dword_1BC6DD000, v111, v112, "%{public}s Unable to create mutable content copy of notification %s", (uint8_t *)v113, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1BCCF5BA4](v114, -1, -1);
        MEMORY[0x1BCCF5BA4](v113, -1, -1);

        ((void (*)(char *, uint64_t))v173)(v159, v171);
      }
      else
      {
        sub_1BC8168C8(v64);
        sub_1BC8168C8(v64);

        ((void (*)(char *, uint64_t))v63)(v110, v171);
      }
      v109 = v94;
    }
    v142 = (uint64_t)v166;
    v181 = (_QWORD *)UNUserNotificationCenter.scheduleNotification(_:)(v109);
    v143 = (uint64_t)v151;
    sub_1BC6ECB08((uint64_t)v151, v142, type metadata accessor for NotificationContentState);
    v144 = (*(unsigned __int8 *)(v169 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v169 + 80);
    v145 = (_OWORD *)swift_allocObject();
    v146 = *(_OWORD *)(v64 + 16);
    v145[1] = *(_OWORD *)v64;
    v145[2] = v146;
    v147 = *(_OWORD *)(v64 + 48);
    v145[3] = *(_OWORD *)(v64 + 32);
    v145[4] = v147;
    sub_1BC816880(v142, (uint64_t)v145 + v144);
    sub_1BC77B6B0(v64);
    sub_1BC771160();
    sub_1BC815E80();
    sub_1BC6E1788(&qword_1ED6B8298, (uint64_t (*)(uint64_t))sub_1BC771160, MEMORY[0x1E0C95D90]);
    v148 = v161;
    sub_1BC81786C();
    swift_release();
    swift_release();
    sub_1BC6E1788(&qword_1EF45D520, (uint64_t (*)(uint64_t))sub_1BC8167E8, MEMORY[0x1E0C95950]);
    v149 = v163;
    v124 = sub_1BC817854();

    (*(void (**)(char *, uint64_t))(v162 + 8))(v148, v149);
    v141 = v143;
  }
  else
  {
    v84 = v160;
    sub_1BC817560();
    swift_bridgeObjectRetain_n();
    v85 = sub_1BC81756C();
    v86 = sub_1BC817E9C();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = swift_slowAlloc();
      v176 = (_QWORD *)swift_slowAlloc();
      v181 = v176;
      *(_DWORD *)v87 = 136446466;
      v88 = sub_1BC818814();
      v173 = v63;
      *(_QWORD *)&v179 = sub_1BC6E14D8(v88, v89, (uint64_t *)&v181);
      v90 = a4;
      sub_1BC818148();
      swift_bridgeObjectRelease();
      *(_WORD *)(v87 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v179 = sub_1BC6E14D8(v175, a4, (uint64_t *)&v181);
      v61 = v175;
      sub_1BC818148();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BC6DD000, v85, v86, "%{public}s Removing %s", (uint8_t *)v87, 0x16u);
      v91 = v176;
      swift_arrayDestroy();
      MEMORY[0x1BCCF5BA4](v91, -1, -1);
      MEMORY[0x1BCCF5BA4](v87, -1, -1);

      ((void (*)(char *, uint64_t))v173)(v160, v27);
      v92 = (uint64_t)v166;
      v93 = v165;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v63)(v84, v27);
      v92 = (uint64_t)v166;
      v93 = v165;
      v90 = a4;
    }
    v126 = *(_QWORD *)(v93 + 48);
    sub_1BC6E1E98(0, (unint64_t *)&qword_1ED6BB1F0, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v127 = swift_allocObject();
    *(_OWORD *)(v127 + 16) = xmmword_1BC81A0F0;
    *(_QWORD *)(v127 + 32) = v61;
    *(_QWORD *)(v127 + 40) = v90;
    v128 = *(void **)(v126 + 16);
    swift_bridgeObjectRetain();
    v129 = v61;
    v130 = (void *)sub_1BC817C50();
    objc_msgSend(v128, sel_removePendingNotificationRequestsWithIdentifiers_, v130);

    v131 = (void *)sub_1BC817C50();
    objc_msgSend(v128, sel_removeDeliveredNotificationsWithIdentifiers_, v131);
    swift_bridgeObjectRelease();

    swift_beginAccess();
    sub_1BC6FC700(v93 + 56, (uint64_t)&v181);
    v132 = v182;
    v133 = v183;
    __swift_project_boxed_opaque_existential_1(&v181, v182);
    *(_QWORD *)&v178[0] = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v133 + 8) + 72))(v129, v90, v132);
    sub_1BC6ECB08((uint64_t)v26, v92, type metadata accessor for NotificationContentState);
    v134 = (*(unsigned __int8 *)(v169 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v169 + 80);
    v135 = (_OWORD *)swift_allocObject();
    v136 = *(_OWORD *)(v64 + 16);
    v135[1] = *(_OWORD *)v64;
    v135[2] = v136;
    v137 = *(_OWORD *)(v64 + 48);
    v135[3] = *(_OWORD *)(v64 + 32);
    v135[4] = v137;
    sub_1BC816880(v92, (uint64_t)v135 + v134);
    sub_1BC77B6B0(v64);
    v138 = MEMORY[0x1E0DEE9C0] + 8;
    sub_1BC762F40(0, &qword_1ED6B82B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC815E80();
    sub_1BC816000(&qword_1ED6B82A8, &qword_1ED6B82B0, v138);
    v139 = v152;
    sub_1BC81786C();
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v181);
    sub_1BC6E1788(&qword_1EF45D510, (uint64_t (*)(uint64_t))sub_1BC816734, MEMORY[0x1E0C95950]);
    v140 = v154;
    v124 = sub_1BC817854();
    (*(void (**)(char *, uint64_t))(v153 + 8))(v139, v140);
    v141 = (uint64_t)v26;
  }
  result = sub_1BC6ED784(v141, type metadata accessor for NotificationContentState);
  v119 = v174;
LABEL_27:
  *v119 = v124;
  return result;
}

uint64_t sub_1BC814068(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[3];
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v43 = a4;
  sub_1BC816544();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v46 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for NotificationContentState(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC817590();
  v44 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[1];
  v52 = *a1;
  v53 = v17;
  v18 = a1[3];
  v54 = a1[2];
  v55 = v18;
  sub_1BC817560();
  v45 = a2;
  sub_1BC6ECB08(a2, (uint64_t)v13, type metadata accessor for NotificationContentState);
  v19 = sub_1BC81756C();
  v20 = sub_1BC817E9C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v42 = v8;
    v22 = v21;
    v23 = swift_slowAlloc();
    v41 = v9;
    v24 = v23;
    v49[0] = v23;
    *(_DWORD *)v22 = 136446466;
    v25 = sub_1BC818814();
    v48 = sub_1BC6E14D8(v25, v26, v49);
    v43 = v14;
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v27 = NotificationContentState.description.getter();
    v48 = sub_1BC6E14D8(v27, v28, v49);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    sub_1BC6ED784((uint64_t)v13, type metadata accessor for NotificationContentState);
    _os_log_impl(&dword_1BC6DD000, v19, v20, "%{public}s Updating content state %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    v29 = v24;
    v9 = v41;
    MEMORY[0x1BCCF5BA4](v29, -1, -1);
    v30 = v22;
    v8 = v42;
    MEMORY[0x1BCCF5BA4](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v43);
  }
  else
  {
    sub_1BC6ED784((uint64_t)v13, type metadata accessor for NotificationContentState);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v14);
  }
  swift_beginAccess();
  sub_1BC6FC700(a3 + 56, (uint64_t)v49);
  v31 = v50;
  v32 = v51;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  v47 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v32 + 8) + 64))(v45, v31);
  v33 = (_OWORD *)swift_allocObject();
  v34 = v53;
  v33[1] = v52;
  v33[2] = v34;
  v35 = v55;
  v33[3] = v54;
  v33[4] = v35;
  sub_1BC77B6B0((uint64_t)&v52);
  v36 = MEMORY[0x1E0DEE9C0] + 8;
  sub_1BC762F40(0, &qword_1ED6B82B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC816000(&qword_1ED6B82A8, &qword_1ED6B82B0, v36);
  v37 = v46;
  sub_1BC81786C();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v49);
  sub_1BC6E1788(&qword_1EF45D4D8, (uint64_t (*)(uint64_t))sub_1BC816544, MEMORY[0x1E0C95950]);
  v38 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v8);
  return v38;
}

uint64_t sub_1BC8144A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BC8161E8(0);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_1BC816204;
  v10[3] = v8;
  v10[4] = sub_1BC816230;
  v10[5] = v9;
  sub_1BC771478();
  sub_1BC6E1788(&qword_1EF45BAE8, (uint64_t (*)(uint64_t))sub_1BC771478, MEMORY[0x1E0C95950]);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC817824();
  sub_1BC6E1788((unint64_t *)&qword_1EF45BAF0, (uint64_t (*)(uint64_t))sub_1BC8161E8, MEMORY[0x1E0C96148]);
  v11 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_1BC814628(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BC81623C(0);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_1BC8162D8;
  v10[3] = v8;
  v10[4] = sub_1BC8162E0;
  v10[5] = v9;
  sub_1BC7716E4();
  sub_1BC6E1788(&qword_1EF45BB20, (uint64_t (*)(uint64_t))sub_1BC7716E4, MEMORY[0x1E0C95950]);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC817824();
  sub_1BC6E1788((unint64_t *)&qword_1EF45BB28, (uint64_t (*)(uint64_t))sub_1BC81623C, MEMORY[0x1E0C96148]);
  v11 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

void sub_1BC8147AC(uint64_t a1)
{
  sub_1BC8147C4(a1, (SEL *)&selRef_removePendingNotificationRequestsWithIdentifiers_);
}

void sub_1BC8147B8(uint64_t a1)
{
  sub_1BC8147C4(a1, (SEL *)&selRef_removeDeliveredNotificationsWithIdentifiers_);
}

void sub_1BC8147C4(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(v2 + 48) + 16);
  v5 = (id)sub_1BC817C50();
  objc_msgSend(v4, *a2, v5);

}

uint64_t sub_1BC814814()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32[16];
  uint64_t (*v33)(uint64_t);
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v1 = v0;
  v28 = *v0;
  sub_1BC8162EC();
  v3 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  v31 = v3;
  MEMORY[0x1E0C80A78](v2);
  v29 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_QWORD *)v0[6];
  v6 = (void *)v0[2];
  v35 = 0;
  v36 = 0xE000000000000000;
  swift_retain();
  sub_1BC8182C8();
  swift_bridgeObjectRelease();
  v35 = 0xD00000000000002FLL;
  v36 = 0x80000001BC828A30;
  sub_1BC817B48();
  v26 = v36;
  v27 = v35;
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_1BC8182C8();
  sub_1BC817B48();
  sub_1BC817B48();
  v24 = v36;
  v25 = v35;
  v7 = v5[4];
  v9 = v5[5];
  v8 = (void *)v5[6];
  v10 = (void *)v5[7];
  v35 = v5[3];
  v36 = v7;
  v37 = v9;
  v38 = v8;
  v39 = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  v11 = v8;
  v12 = v10;
  v13 = v6;
  v14 = objc_msgSend(v6, sel_profileIdentifier);
  v15 = sub_1BC75517C(v14);

  swift_release();
  swift_release();
  swift_release();

  v33 = sub_1BC816370;
  v34 = v1;
  sub_1BC75C290((uint64_t (*)(_QWORD *))sub_1BC816378, (uint64_t)v32, v15);
  v17 = sub_1BC76F74C(v16, v13, v27, v26, v25, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = v17;
  v18 = swift_allocObject();
  v19 = v28;
  *(_QWORD *)(v18 + 16) = v1;
  *(_QWORD *)(v18 + 24) = v19;
  sub_1BC771AFC();
  sub_1BC6E1788(&qword_1ED6B8248, (uint64_t (*)(uint64_t))sub_1BC771AFC, MEMORY[0x1E0C95D90]);
  swift_retain();
  v20 = v29;
  sub_1BC81786C();
  swift_release();
  swift_release();
  sub_1BC6E1788(&qword_1ED6B8078, (uint64_t (*)(uint64_t))sub_1BC8162EC, MEMORY[0x1E0C95950]);
  v21 = v30;
  v22 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v21);
  return v22;
}

uint64_t sub_1BC814B20(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 32) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 40))
    return 1;
  else
    return sub_1BC818694();
}

uint64_t sub_1BC814B50(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35[16];
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;

  v2 = v1;
  v31 = *v2;
  sub_1BC8162EC();
  v5 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  v34 = v5;
  MEMORY[0x1E0C80A78](v4);
  v32 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)v2[6];
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = a1;
  v27 = (id)v2[2];
  v38 = 0;
  v39 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_1BC8182C8();
  swift_bridgeObjectRelease();
  v38 = 0xD00000000000002FLL;
  v39 = 0x80000001BC828A30;
  sub_1BC817B48();
  v28 = v39;
  v29 = v38;
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_1BC8182C8();
  sub_1BC817B48();
  sub_1BC817B48();
  v25 = v39;
  v26 = v38;
  v8 = v7[4];
  v10 = v7[5];
  v9 = (void *)v7[6];
  v11 = (void *)v7[7];
  v38 = v7[3];
  v39 = v8;
  v40 = v10;
  v41 = v9;
  v42 = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  v12 = v9;
  v13 = v11;
  v14 = v27;
  v15 = objc_msgSend(v27, sel_profileIdentifier);
  v16 = sub_1BC75517C(v15);

  swift_release();
  swift_release();
  swift_release();

  v36 = sub_1BC8163D8;
  v37 = v30;
  sub_1BC75C290((uint64_t (*)(_QWORD *))sub_1BC816AC0, (uint64_t)v35, v16);
  v18 = sub_1BC76F74C(v17, v14, v29, v28, v26, v25);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v38 = v18;
  v19 = swift_allocObject();
  v20 = v31;
  *(_QWORD *)(v19 + 16) = v2;
  *(_QWORD *)(v19 + 24) = v20;
  sub_1BC771AFC();
  sub_1BC6E1788(&qword_1ED6B8248, (uint64_t (*)(uint64_t))sub_1BC771AFC, MEMORY[0x1E0C95D90]);
  swift_retain();
  v21 = v32;
  sub_1BC81786C();
  swift_release();
  swift_release();
  sub_1BC6E1788(&qword_1ED6B8078, (uint64_t (*)(uint64_t))sub_1BC8162EC, MEMORY[0x1E0C95950]);
  v22 = v33;
  v23 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v22);
  return v23;
}

uint64_t sub_1BC814E84(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD *v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;

  v2 = a2[2];
  if (!v2)
    return 0;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2[4];
  v7 = a2[5];
  if (v6 == v4 && v7 == v5)
    return 1;
  result = sub_1BC818694();
  if ((result & 1) != 0)
    return 1;
  if (v2 == 1)
    return 0;
  v10 = a2 + 7;
  for (i = 1; ; ++i)
  {
    v12 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v13 = *(v10 - 1) == v4 && *v10 == v5;
    if (v13 || (sub_1BC818694() & 1) != 0)
      return 1;
    result = 0;
    v10 += 2;
    if (v12 == v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC814F44(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;

  v39 = sub_1BC816F3C();
  v6 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC817590();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC817560();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v13 = sub_1BC81756C();
  v14 = sub_1BC817E9C();
  v40 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v38 = v10;
    v16 = v15;
    v37 = swift_slowAlloc();
    v42 = v37;
    *(_DWORD *)v16 = 136315906;
    v36 = v13;
    v17 = sub_1BC818814();
    v35 = a4;
    v41 = sub_1BC6E14D8(v17, v18, &v42);
    sub_1BC818148();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    v33 = v16 + 14;
    v19 = objc_msgSend(*(id *)(a2 + 16), sel_profileIdentifier, v16 + 14);
    v20 = objc_msgSend(v19, sel_identifier);
    sub_1BC816F24();

    v21 = sub_1BC816F00();
    v34 = v9;
    v23 = v22;

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v39);
    v41 = sub_1BC6E14D8(v21, v23, &v42);
    sub_1BC818148();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 22) = 2080;
    v24 = *(_QWORD *)(a2 + 32);
    v25 = *(_QWORD *)(a2 + 40);
    swift_bridgeObjectRetain();
    v41 = sub_1BC6E14D8(v24, v25, &v42);
    sub_1BC818148();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 32) = 2080;
    v26 = swift_bridgeObjectRetain();
    v27 = MEMORY[0x1BCCF4914](v26, &type metadata for PluginFeedItem.NotificationIdentifier);
    v29 = v28;
    swift_bridgeObjectRelease();
    v41 = sub_1BC6E14D8(v27, v29, &v42);
    sub_1BC818148();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v30 = v36;
    _os_log_impl(&dword_1BC6DD000, v36, (os_log_type_t)v40, v35, (uint8_t *)v16, 0x2Au);
    v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x1BCCF5BA4](v31, -1, -1);
    MEMORY[0x1BCCF5BA4](v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v12, v34);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_1BC8152E4(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  __int128 v5[2];

  sub_1BC6FC700(a1, (uint64_t)v5);
  v3 = *a2 + 56;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_1BC6FC848(v5, v3);
  return swift_endAccess();
}

uint64_t sub_1BC815348@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_1BC6FC700(v1 + 56, a1);
}

uint64_t sub_1BC815390(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 56;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_1BC6FC848(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1BC8153E8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_1BC815424()
{
  sub_1BC8182C8();
  swift_bridgeObjectRelease();
  sub_1BC817B48();
  return 0xD00000000000002FLL;
}

uint64_t sub_1BC81549C()
{
  sub_1BC8182C8();
  sub_1BC817B48();
  sub_1BC817B48();
  return 0;
}

uint64_t sub_1BC815518(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  sub_1BC8182C8();
  swift_bridgeObjectRelease();
  v14[0] = 0xD00000000000002FLL;
  v14[1] = 0x80000001BC828A30;
  sub_1BC817B48();
  v5 = *(void **)(v1 + 16);
  v6 = objc_allocWithZone(MEMORY[0x1E0CB67F0]);
  v7 = v5;
  v8 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithCategory_domainName_healthStore_, 1, v8, v7);

  swift_beginAccess();
  sub_1BC6FC700(v2 + 56, (uint64_t)v14);
  v10 = v15;
  v11 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v12 = NotificationContentStateManager.getContentState(for:legacyStringIdentifier:legacyKeyValueDomain:)(v3, v4, v3, v4, (uint64_t)v9, v10, v11);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  return v12;
}

uint64_t HealthAppPluginNotificationManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  return v0;
}

uint64_t HealthAppPluginNotificationManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_1BC8156F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BC8161E8(0);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_1BC816204;
  v10[3] = v8;
  v10[4] = sub_1BC816AA4;
  v10[5] = v9;
  sub_1BC771478();
  sub_1BC6E1788(&qword_1EF45BAE8, (uint64_t (*)(uint64_t))sub_1BC771478, MEMORY[0x1E0C95950]);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC817824();
  sub_1BC6E1788((unint64_t *)&qword_1EF45BAF0, (uint64_t (*)(uint64_t))sub_1BC8161E8, MEMORY[0x1E0C96148]);
  v11 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_1BC815878(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BC81623C(0);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_1BC8162D8;
  v10[3] = v8;
  v10[4] = sub_1BC816AA0;
  v10[5] = v9;
  sub_1BC7716E4();
  sub_1BC6E1788(&qword_1EF45BB20, (uint64_t (*)(uint64_t))sub_1BC7716E4, MEMORY[0x1E0C95950]);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC817824();
  sub_1BC6E1788((unint64_t *)&qword_1EF45BB28, (uint64_t (*)(uint64_t))sub_1BC81623C, MEMORY[0x1E0C96148]);
  v11 = sub_1BC817854();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

void sub_1BC8159FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BC815A14(a1, a2, a3, (SEL *)&selRef_removePendingNotificationRequestsWithIdentifiers_);
}

void sub_1BC815A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BC815A14(a1, a2, a3, (SEL *)&selRef_removeDeliveredNotificationsWithIdentifiers_);
}

void sub_1BC815A14(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  void *v6;
  id v7;

  v6 = *(void **)(*(_QWORD *)(v4 + 48) + 16);
  v7 = (id)sub_1BC817C50();
  objc_msgSend(v6, *a4, v7);

}

BOOL sub_1BC815A68(uint64_t a1, char a2, uint64_t a3)
{
  return sub_1BC8120A8(a1, a2 & 1, a3);
}

_QWORD *sub_1BC815A78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (_QWORD *)v4;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *(_QWORD *)(v4 + 48) = a4;
  v6 = a1;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC8182C8();
  sub_1BC817B48();
  sub_1BC817B48();
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for HealthAppNotificationContentStateManager();
  v8 = HealthAppNotificationContentStateManager.__allocating_init(healthStore:domain:)(*(id *)(v4 + 24), 0, 0xE000000000000000);
  v5[10] = v7;
  v5[11] = sub_1BC6E1788(&qword_1ED6B7CD0, (uint64_t (*)(uint64_t))type metadata accessor for HealthAppNotificationContentStateManager, (uint64_t)&protocol conformance descriptor for HealthAppNotificationContentStateManager);
  v5[7] = v8;
  return v5;
}

void sub_1BC815B8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D468)
  {
    sub_1BC815C48();
    sub_1BC762F40(255, &qword_1EF45BBC8, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C964B8]);
    sub_1BC6E1788(&qword_1EF45D478, (uint64_t (*)(uint64_t))sub_1BC815C48, MEMORY[0x1E0C95950]);
    sub_1BC815CE0();
    v0 = sub_1BC817674();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D468);
  }
}

void sub_1BC815C48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D470)
  {
    sub_1BC815E14(255, &qword_1ED6B8228, sub_1BC77A824);
    sub_1BC815EE4((unint64_t *)&qword_1ED6B8220, &qword_1ED6B8228, sub_1BC77A824);
    v0 = sub_1BC817614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D470);
  }
}

unint64_t sub_1BC815CE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF45BBD8;
  if (!qword_1EF45BBD8)
  {
    sub_1BC762F40(255, &qword_1EF45BBC8, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C964B8]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C964C8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF45BBD8);
  }
  return result;
}

void sub_1BC815D40()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D480)
  {
    sub_1BC815E14(255, &qword_1EF45D488, (void (*)(uint64_t))sub_1BC815E80);
    sub_1BC815B8C();
    sub_1BC815EE4(&qword_1EF45D498, &qword_1EF45D488, (void (*)(uint64_t))sub_1BC815E80);
    sub_1BC6E1788(&qword_1EF45D4A0, (uint64_t (*)(uint64_t))sub_1BC815B8C, MEMORY[0x1E0C95B78]);
    v0 = sub_1BC817674();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D480);
  }
}

void sub_1BC815E14(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    sub_1BC6E1878();
    v4 = sub_1BC81771C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1BC815E80()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF45D490)
  {
    type metadata accessor for NotificationContentState(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF45D490);
  }
}

uint64_t sub_1BC815EE4(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BC815E14(255, a2, a3);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95D90], v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BC815F24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D4A8)
  {
    sub_1BC762F40(255, &qword_1EF45D4B0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC815D40();
    sub_1BC816000(&qword_1EF45D4B8, &qword_1EF45D4B0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest);
    sub_1BC6E1788(&qword_1EF45D4C0, (uint64_t (*)(uint64_t))sub_1BC815D40, MEMORY[0x1E0C95B78]);
    v0 = sub_1BC817674();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D4A8);
  }
}

uint64_t sub_1BC816000(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BC762F40(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCF5AB4](MEMORY[0x1E0C95D90], v5);
    atomic_store(result, a1);
  }
  return result;
}

__n128 *sub_1BC816048(__n128 *a1, __n128 *a2)
{
  __swift_memcpy16_8(a2, a1);
  return a2;
}

uint64_t sub_1BC816084(uint64_t a1)
{
  sub_1BC77B710(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

void sub_1BC8160B0(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  sub_1BC81280C(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_1BC8160CC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC8160F8(__int128 *a1)
{
  uint64_t *v1;

  return sub_1BC812B30(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1BC816104()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC816160@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;

  return sub_1BC812D74(a1, v2 + 2, v2[10], v2[11], v2[12], v2[13], v2[14], v2[15], a2);
}

uint64_t sub_1BC816174(__int128 *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1BC814068(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1BC81617C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC8161A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t result;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  sub_1BC815E80();
  result = v5(a1, a1 + *(int *)(v6 + 48));
  *a2 = result;
  return result;
}

void sub_1BC8161E8(uint64_t a1)
{
  sub_1BC816258(a1, &qword_1EF45BAC0, (uint64_t (*)(uint64_t))sub_1BC771478, &qword_1EF45BAE8);
}

void sub_1BC816204(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC76D980(a1, a2, v2);
}

uint64_t sub_1BC81620C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC816230(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC76D9B0(a1, *(_QWORD *)(v1 + 16));
}

void sub_1BC81623C(uint64_t a1)
{
  sub_1BC816258(a1, &qword_1EF45BAF8, (uint64_t (*)(uint64_t))sub_1BC7716E4, &qword_1EF45BB20);
}

void sub_1BC816258(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4)
{
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    a3(255);
    sub_1BC6E1788(a4, a3, MEMORY[0x1E0C95950]);
    v7 = sub_1BC817830();
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_1BC8162D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC76DB24(a1, a2, v2);
}

uint64_t sub_1BC8162E0(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC76DC4C(a1, *(_QWORD *)(v1 + 16));
}

void sub_1BC8162EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B8080)
  {
    sub_1BC771AFC();
    sub_1BC6E1788(&qword_1ED6B8248, (uint64_t (*)(uint64_t))sub_1BC771AFC, MEMORY[0x1E0C95D90]);
    v0 = sub_1BC817614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B8080);
  }
}

uint64_t sub_1BC816370(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC814B20(a1, v1);
}

uint64_t sub_1BC816378(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC76F6F0(a1, *(uint64_t (**)(_OWORD *))(v1 + 16)) & 1;
}

uint64_t sub_1BC816394()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC8163B8(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC814F44(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), "%s Removed all notification requests for profile %s plugin %s. Identifiers: %s");
}

uint64_t sub_1BC8163D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC814E84(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_1BC8163E0(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC814F44(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), "%s Removed plugin feed item notifications for profile %s plugin %s. Identifiers: %s");
}

uint64_t sub_1BC816400@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + 56;
  swift_beginAccess();
  return sub_1BC6FC700(v3, a2);
}

uint64_t type metadata accessor for HealthAppPluginNotificationManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthAppPluginNotificationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.__allocating_init(healthStore:bundleIdentifier:notificationManager:primaryHealthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.scheduleUserNotification(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.scheduleCoalescingNotification<A>(for:environment:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 136))(a1, a2 & 1);
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.schedulePluginFeedItemNotification(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getPendingNotifications(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getDeliveredNotifications(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removePendingNotifications(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removeDeliveredNotifications(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removeAllPluginFeedItemNotifications()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removePluginFeedItemNotifications(feedItemIdentifiers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.legacyContentStateDomain()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.notificationContentStateDomain()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getContentState(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

void sub_1BC816544()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  if (!qword_1EF45D4D0)
  {
    v0 = MEMORY[0x1E0DEE9C0] + 8;
    sub_1BC762F40(255, &qword_1ED6B82B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC816000(&qword_1ED6B82A8, &qword_1ED6B82B0, v0);
    v1 = sub_1BC817614();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1EF45D4D0);
  }
}

uint64_t sub_1BC8165E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1BC81662C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D4E0)
  {
    sub_1BC815E80();
    v0 = sub_1BC8177F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D4E0);
  }
}

void sub_1BC816690()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D4E8)
  {
    sub_1BC81662C();
    sub_1BC6E1878();
    sub_1BC6E1788(&qword_1EF45D4F0, (uint64_t (*)(uint64_t))sub_1BC81662C, MEMORY[0x1E0C960D0]);
    v0 = sub_1BC8175F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D4E8);
  }
}

void sub_1BC816734()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  if (!qword_1EF45D4F8)
  {
    v0 = MEMORY[0x1E0DEE9C0] + 8;
    sub_1BC762F40(255, &qword_1ED6B82B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC815E80();
    sub_1BC816000(&qword_1ED6B82A8, &qword_1ED6B82B0, v0);
    v1 = sub_1BC817614();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1EF45D4F8);
  }
}

void sub_1BC8167E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF45D500)
  {
    sub_1BC771160();
    sub_1BC815E80();
    sub_1BC6E1788(&qword_1ED6B8298, (uint64_t (*)(uint64_t))sub_1BC771160, MEMORY[0x1E0C95D90]);
    v0 = sub_1BC817614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF45D500);
  }
}

uint64_t sub_1BC816880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotificationContentState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC8168C8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC784250(v2, v3);
  return a1;
}

uint64_t objectdestroy_54Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for NotificationContentState(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 72) >= 2uLL)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 80) & ~v2) + *(int *)(v1 + 20);
  v4 = sub_1BC816F3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC8169F0@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NotificationContentState(0) - 8) + 80);
  v4 = (uint64_t)v1 + ((v3 + 80) & ~v3);
  sub_1BC815E80();
  v6 = (uint64_t)a1 + *(int *)(v5 + 48);
  v7 = v1[2];
  *a1 = v1[1];
  a1[1] = v7;
  v8 = v1[4];
  a1[2] = v1[3];
  a1[3] = v8;
  sub_1BC6ECB08(v4, v6, type metadata accessor for NotificationContentState);
  return sub_1BC77B6B0((uint64_t)(v1 + 1));
}

uint64_t sub_1BC816A74()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC816A98@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC812C3C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1BC816AC0(uint64_t a1)
{
  return sub_1BC816378(a1) & 1;
}

void NoveltyFeatureTag.init(for:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(a1, sel_uniqueIdentifier);
  v5 = sub_1BC817AE8();
  v7 = v6;

  *a2 = v5;
  a2[1] = v7;
}

uint64_t NoveltyFeatureTag.value.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

HealthPlatform::NoveltyFeatureTag __swiftcall NoveltyFeatureTag.init(_:)(HealthPlatform::NoveltyFeatureTag result)
{
  HealthPlatform::NoveltyFeatureTag *v1;

  *v1 = result;
  return result;
}

uint64_t sub_1BC816B6C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *sub_1BC816B78@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

ValueMetadata *type metadata accessor for NoveltyFeatureTag()
{
  return &type metadata for NoveltyFeatureTag;
}

uint64_t sub_1BC816B94()
{
  return MEMORY[0x1E0D289E8]();
}

uint64_t sub_1BC816BA0()
{
  return MEMORY[0x1E0D289F0]();
}

uint64_t sub_1BC816BAC()
{
  return MEMORY[0x1E0D28A08]();
}

uint64_t sub_1BC816BB8()
{
  return MEMORY[0x1E0D28A18]();
}

uint64_t sub_1BC816BC4()
{
  return MEMORY[0x1E0D28A20]();
}

uint64_t sub_1BC816BD0()
{
  return MEMORY[0x1E0D28A28]();
}

uint64_t sub_1BC816BDC()
{
  return MEMORY[0x1E0D28A40]();
}

uint64_t sub_1BC816BE8()
{
  return MEMORY[0x1E0D28A48]();
}

uint64_t sub_1BC816BF4()
{
  return MEMORY[0x1E0D28A50]();
}

uint64_t sub_1BC816C00()
{
  return MEMORY[0x1E0D28A58]();
}

uint64_t sub_1BC816C0C()
{
  return MEMORY[0x1E0D28A60]();
}

uint64_t sub_1BC816C18()
{
  return MEMORY[0x1E0D28A68]();
}

uint64_t sub_1BC816C24()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1BC816C30()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1BC816C3C()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1BC816C48()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BC816C54()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BC816C60()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BC816C6C()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_1BC816C78()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1BC816C84()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1BC816C90()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1BC816C9C()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1BC816CA8()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1BC816CB4()
{
  return MEMORY[0x1E0CAE620]();
}

uint64_t sub_1BC816CC0()
{
  return MEMORY[0x1E0CAE628]();
}

uint64_t sub_1BC816CCC()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_1BC816CD8()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1BC816CE4()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1BC816CF0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1BC816CFC()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1BC816D08()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1BC816D14()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1BC816D20()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1BC816D2C()
{
  return MEMORY[0x1E0CAEFB8]();
}

uint64_t sub_1BC816D38()
{
  return MEMORY[0x1E0CAEFC0]();
}

uint64_t sub_1BC816D44()
{
  return MEMORY[0x1E0CAF2F0]();
}

uint64_t sub_1BC816D50()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BC816D5C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BC816D68()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1BC816D74()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1BC816D80()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_1BC816D8C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1BC816D98()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1BC816DA4()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1BC816DB0()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1BC816DBC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BC816DC8()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1BC816DD4()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1BC816DE0()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1BC816DEC()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1BC816DF8()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BC816E04()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1BC816E10()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1BC816E1C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1BC816E28()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1BC816E34()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1BC816E40()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BC816E4C()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1BC816E58()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BC816E64()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BC816E70()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_1BC816E7C()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1BC816E88()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1BC816E94()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1BC816EA0()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1BC816EAC()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BC816EB8()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BC816EC4()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1BC816ED0()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BC816EDC()
{
  return MEMORY[0x1E0CB0830]();
}

uint64_t sub_1BC816EE8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BC816EF4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BC816F00()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BC816F0C()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1BC816F18()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1BC816F24()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1BC816F30()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BC816F3C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BC816F48()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1BC816F54()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1BC816F60()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1BC816F6C()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1BC816F78()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1BC816F84()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1BC816F90()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1BC816F9C()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1BC816FA8()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1BC816FB4()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1BC816FC0()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1BC816FCC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1BC816FD8()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1BC816FE4()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1BC816FF0()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1BC816FFC()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1BC817008()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1BC817014()
{
  return MEMORY[0x1E0CB1400]();
}

uint64_t sub_1BC817020()
{
  return MEMORY[0x1E0CB1408]();
}

uint64_t sub_1BC81702C()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1BC817038()
{
  return MEMORY[0x1E0D28D10]();
}

uint64_t sub_1BC817044()
{
  return MEMORY[0x1E0D28D18]();
}

uint64_t sub_1BC817050()
{
  return MEMORY[0x1E0D2BD30]();
}

uint64_t sub_1BC81705C()
{
  return MEMORY[0x1E0D2BD48]();
}

uint64_t sub_1BC817068()
{
  return MEMORY[0x1E0D2BD60]();
}

uint64_t sub_1BC817074()
{
  return MEMORY[0x1E0D2BD68]();
}

uint64_t sub_1BC817080()
{
  return MEMORY[0x1E0D2BD70]();
}

uint64_t sub_1BC81708C()
{
  return MEMORY[0x1E0D2BD78]();
}

uint64_t sub_1BC817098()
{
  return MEMORY[0x1E0D2BDB0]();
}

uint64_t sub_1BC8170A4()
{
  return MEMORY[0x1E0D2BDB8]();
}

uint64_t sub_1BC8170B0()
{
  return MEMORY[0x1E0D2BE40]();
}

uint64_t sub_1BC8170BC()
{
  return MEMORY[0x1E0D2BE48]();
}

uint64_t sub_1BC8170C8()
{
  return MEMORY[0x1E0D2BE60]();
}

uint64_t sub_1BC8170D4()
{
  return MEMORY[0x1E0D2BE68]();
}

uint64_t sub_1BC8170E0()
{
  return MEMORY[0x1E0D2BE70]();
}

uint64_t sub_1BC8170EC()
{
  return MEMORY[0x1E0D2BE78]();
}

uint64_t sub_1BC8170F8()
{
  return MEMORY[0x1E0D2BE80]();
}

uint64_t sub_1BC817104()
{
  return MEMORY[0x1E0D2BE88]();
}

uint64_t sub_1BC817110()
{
  return MEMORY[0x1E0D2BE90]();
}

uint64_t sub_1BC81711C()
{
  return MEMORY[0x1E0D2BE98]();
}

uint64_t sub_1BC817128()
{
  return MEMORY[0x1E0D2BEA0]();
}

uint64_t sub_1BC817134()
{
  return MEMORY[0x1E0D2BEA8]();
}

uint64_t sub_1BC817140()
{
  return MEMORY[0x1E0D2BEC0]();
}

uint64_t sub_1BC81714C()
{
  return MEMORY[0x1E0D2BEF8]();
}

uint64_t sub_1BC817158()
{
  return MEMORY[0x1E0D2BF18]();
}

uint64_t sub_1BC817164()
{
  return MEMORY[0x1E0D2BF20]();
}

uint64_t sub_1BC817170()
{
  return MEMORY[0x1E0D2BF30]();
}

uint64_t sub_1BC81717C()
{
  return MEMORY[0x1E0D2BF40]();
}

uint64_t sub_1BC817188()
{
  return MEMORY[0x1E0D2CEA8]();
}

uint64_t sub_1BC817194()
{
  return MEMORY[0x1E0D2CEB0]();
}

uint64_t sub_1BC8171A0()
{
  return MEMORY[0x1E0D2CEB8]();
}

uint64_t sub_1BC8171AC()
{
  return MEMORY[0x1E0D2CED0]();
}

uint64_t sub_1BC8171B8()
{
  return MEMORY[0x1E0D2CED8]();
}

uint64_t sub_1BC8171C4()
{
  return MEMORY[0x1E0D2CEE0]();
}

uint64_t sub_1BC8171D0()
{
  return MEMORY[0x1E0D2CEE8]();
}

uint64_t sub_1BC8171DC()
{
  return MEMORY[0x1E0D2CEF0]();
}

uint64_t sub_1BC8171E8()
{
  return MEMORY[0x1E0D2CF10]();
}

uint64_t sub_1BC8171F4()
{
  return MEMORY[0x1E0D2CF18]();
}

uint64_t sub_1BC817200()
{
  return MEMORY[0x1E0D2CF20]();
}

uint64_t sub_1BC81720C()
{
  return MEMORY[0x1E0D2CF40]();
}

uint64_t sub_1BC817218()
{
  return MEMORY[0x1E0D2CF48]();
}

uint64_t sub_1BC817224()
{
  return MEMORY[0x1E0D2CF50]();
}

uint64_t sub_1BC817230()
{
  return MEMORY[0x1E0D2CF58]();
}

uint64_t sub_1BC81723C()
{
  return MEMORY[0x1E0D2CF60]();
}

uint64_t sub_1BC817248()
{
  return MEMORY[0x1E0D2CF68]();
}

uint64_t sub_1BC817254()
{
  return MEMORY[0x1E0D2CF80]();
}

uint64_t sub_1BC817260()
{
  return MEMORY[0x1E0D2CF88]();
}

uint64_t sub_1BC81726C()
{
  return MEMORY[0x1E0D2CF98]();
}

uint64_t sub_1BC817278()
{
  return MEMORY[0x1E0D2CFC0]();
}

uint64_t sub_1BC817284()
{
  return MEMORY[0x1E0D2CFC8]();
}

uint64_t sub_1BC817290()
{
  return MEMORY[0x1E0D2CFD0]();
}

uint64_t sub_1BC81729C()
{
  return MEMORY[0x1E0D2CFD8]();
}

uint64_t sub_1BC8172A8()
{
  return MEMORY[0x1E0D2CFE0]();
}

uint64_t sub_1BC8172B4()
{
  return MEMORY[0x1E0D2CFE8]();
}

uint64_t sub_1BC8172C0()
{
  return MEMORY[0x1E0D2CFF0]();
}

uint64_t sub_1BC8172CC()
{
  return MEMORY[0x1E0D2D000]();
}

uint64_t sub_1BC8172D8()
{
  return MEMORY[0x1E0D2D008]();
}

uint64_t sub_1BC8172E4()
{
  return MEMORY[0x1E0D2D010]();
}

uint64_t sub_1BC8172F0()
{
  return MEMORY[0x1E0D2D018]();
}

uint64_t sub_1BC8172FC()
{
  return MEMORY[0x1E0D2D020]();
}

uint64_t sub_1BC817308()
{
  return MEMORY[0x1E0D2D028]();
}

uint64_t sub_1BC817314()
{
  return MEMORY[0x1E0D2D038]();
}

uint64_t sub_1BC817320()
{
  return MEMORY[0x1E0D2D040]();
}

uint64_t sub_1BC81732C()
{
  return MEMORY[0x1E0D2D048]();
}

uint64_t sub_1BC817338()
{
  return MEMORY[0x1E0D2D050]();
}

uint64_t sub_1BC817344()
{
  return MEMORY[0x1E0D2D060]();
}

uint64_t sub_1BC817350()
{
  return MEMORY[0x1E0D2D068]();
}

uint64_t sub_1BC81735C()
{
  return MEMORY[0x1E0D2D070]();
}

uint64_t sub_1BC817368()
{
  return MEMORY[0x1E0D2D078]();
}

uint64_t sub_1BC817374()
{
  return MEMORY[0x1E0D2D090]();
}

uint64_t sub_1BC817380()
{
  return MEMORY[0x1E0D2D098]();
}

uint64_t sub_1BC81738C()
{
  return MEMORY[0x1E0D2D0A0]();
}

uint64_t sub_1BC817398()
{
  return MEMORY[0x1E0D2D0B8]();
}

uint64_t sub_1BC8173A4()
{
  return MEMORY[0x1E0D2D0C0]();
}

uint64_t sub_1BC8173B0()
{
  return MEMORY[0x1E0D2D0C8]();
}

uint64_t sub_1BC8173BC()
{
  return MEMORY[0x1E0D2D0D8]();
}

uint64_t sub_1BC8173C8()
{
  return MEMORY[0x1E0D2D0E0]();
}

uint64_t sub_1BC8173D4()
{
  return MEMORY[0x1E0D2D0F0]();
}

uint64_t sub_1BC8173E0()
{
  return MEMORY[0x1E0D2D100]();
}

uint64_t sub_1BC8173EC()
{
  return MEMORY[0x1E0D2D108]();
}

uint64_t sub_1BC8173F8()
{
  return MEMORY[0x1E0D2D118]();
}

uint64_t sub_1BC817404()
{
  return MEMORY[0x1E0D2D130]();
}

uint64_t sub_1BC817410()
{
  return MEMORY[0x1E0D2D138]();
}

uint64_t sub_1BC81741C()
{
  return MEMORY[0x1E0D2D140]();
}

uint64_t sub_1BC817428()
{
  return MEMORY[0x1E0D2D160]();
}

uint64_t sub_1BC817434()
{
  return MEMORY[0x1E0D2D168]();
}

uint64_t sub_1BC817440()
{
  return MEMORY[0x1E0D2D170]();
}

uint64_t sub_1BC81744C()
{
  return MEMORY[0x1E0D2D188]();
}

uint64_t sub_1BC817458()
{
  return MEMORY[0x1E0D2D190]();
}

uint64_t sub_1BC817464()
{
  return MEMORY[0x1E0D2D198]();
}

uint64_t sub_1BC817470()
{
  return MEMORY[0x1E0D2D1B0]();
}

uint64_t sub_1BC81747C()
{
  return MEMORY[0x1E0D2D1B8]();
}

uint64_t sub_1BC817488()
{
  return MEMORY[0x1E0D2D1C0]();
}

uint64_t sub_1BC817494()
{
  return MEMORY[0x1E0D2D1C8]();
}

uint64_t sub_1BC8174A0()
{
  return MEMORY[0x1E0D2D1D0]();
}

uint64_t sub_1BC8174AC()
{
  return MEMORY[0x1E0D2D1D8]();
}

uint64_t sub_1BC8174B8()
{
  return MEMORY[0x1E0D2D1E0]();
}

uint64_t sub_1BC8174C4()
{
  return MEMORY[0x1E0D2D1F8]();
}

uint64_t sub_1BC8174D0()
{
  return MEMORY[0x1E0D2D200]();
}

uint64_t sub_1BC8174DC()
{
  return MEMORY[0x1E0D2D208]();
}

uint64_t sub_1BC8174E8()
{
  return MEMORY[0x1E0D2D210]();
}

uint64_t sub_1BC8174F4()
{
  return MEMORY[0x1E0D2D218]();
}

uint64_t sub_1BC817500()
{
  return MEMORY[0x1E0D2D230]();
}

uint64_t sub_1BC81750C()
{
  return MEMORY[0x1E0D2D240]();
}

uint64_t sub_1BC817518()
{
  return MEMORY[0x1E0D2D258]();
}

uint64_t sub_1BC817524()
{
  return MEMORY[0x1E0D2D278]();
}

uint64_t sub_1BC817530()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1BC81753C()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1BC817548()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1BC817554()
{
  return MEMORY[0x1E0D28A78]();
}

uint64_t sub_1BC817560()
{
  return MEMORY[0x1E0D2BF98]();
}

uint64_t sub_1BC81756C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BC817578()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BC817584()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1BC817590()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BC81759C()
{
  return MEMORY[0x1E0DEF398]();
}

uint64_t sub_1BC8175A8()
{
  return MEMORY[0x1E0DF2058]();
}

uint64_t sub_1BC8175B4()
{
  return MEMORY[0x1E0C95640]();
}

uint64_t sub_1BC8175C0()
{
  return MEMORY[0x1E0C95680]();
}

uint64_t sub_1BC8175CC()
{
  return MEMORY[0x1E0C95690]();
}

uint64_t sub_1BC8175D8()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1BC8175E4()
{
  return MEMORY[0x1E0C95778]();
}

uint64_t sub_1BC8175F0()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t sub_1BC8175FC()
{
  return MEMORY[0x1E0C958C0]();
}

uint64_t sub_1BC817608()
{
  return MEMORY[0x1E0C958F8]();
}

uint64_t sub_1BC817614()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1BC817620()
{
  return MEMORY[0x1E0C959A8]();
}

uint64_t sub_1BC81762C()
{
  return MEMORY[0x1E0C959E8]();
}

uint64_t sub_1BC817638()
{
  return MEMORY[0x1E0C95A10]();
}

uint64_t sub_1BC817644()
{
  return MEMORY[0x1E0C95A28]();
}

uint64_t sub_1BC817650()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t sub_1BC81765C()
{
  return MEMORY[0x1E0C95B38]();
}

uint64_t sub_1BC817668()
{
  return MEMORY[0x1E0C95B50]();
}

uint64_t sub_1BC817674()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t sub_1BC817680()
{
  return MEMORY[0x1E0C95BA0]();
}

uint64_t sub_1BC81768C()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t sub_1BC817698()
{
  return MEMORY[0x1E0C95C60]();
}

uint64_t sub_1BC8176A4()
{
  return MEMORY[0x1E0C95C70]();
}

uint64_t sub_1BC8176B0()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1BC8176BC()
{
  return MEMORY[0x1E0C95CD8]();
}

uint64_t sub_1BC8176C8()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t sub_1BC8176D4()
{
  return MEMORY[0x1E0C95CE8]();
}

uint64_t sub_1BC8176E0()
{
  return MEMORY[0x1E0C95D08]();
}

uint64_t sub_1BC8176EC()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t sub_1BC8176F8()
{
  return MEMORY[0x1E0C95D40]();
}

uint64_t sub_1BC817704()
{
  return MEMORY[0x1E0C95D48]();
}

uint64_t sub_1BC817710()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1BC81771C()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BC817728()
{
  return MEMORY[0x1E0C95DB0]();
}

uint64_t sub_1BC817734()
{
  return MEMORY[0x1E0C95DD0]();
}

uint64_t sub_1BC817740()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1BC81774C()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1BC817758()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1BC817764()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1BC817770()
{
  return MEMORY[0x1E0C95F78]();
}

uint64_t sub_1BC81777C()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1BC817788()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1BC817794()
{
  return MEMORY[0x1E0C96048]();
}

uint64_t sub_1BC8177A0()
{
  return MEMORY[0x1E0C96050]();
}

uint64_t sub_1BC8177AC()
{
  return MEMORY[0x1E0C96058]();
}

uint64_t sub_1BC8177B8()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1BC8177C4()
{
  return MEMORY[0x1E0C96090]();
}

uint64_t sub_1BC8177D0()
{
  return MEMORY[0x1E0C96098]();
}

uint64_t sub_1BC8177DC()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1BC8177E8()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1BC8177F4()
{
  return MEMORY[0x1E0C960C0]();
}

uint64_t sub_1BC817800()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1BC81780C()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1BC817818()
{
  return MEMORY[0x1E0C96128]();
}

uint64_t sub_1BC817824()
{
  return MEMORY[0x1E0C96130]();
}

uint64_t sub_1BC817830()
{
  return MEMORY[0x1E0C96138]();
}

uint64_t sub_1BC81783C()
{
  return MEMORY[0x1E0D2BFA0]();
}

uint64_t sub_1BC817848()
{
  return MEMORY[0x1E0D2BFA8]();
}

uint64_t sub_1BC817854()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BC817860()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1BC81786C()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1BC817878()
{
  return MEMORY[0x1E0C96288]();
}

uint64_t sub_1BC817884()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1BC817890()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1BC81789C()
{
  return MEMORY[0x1E0C962A8]();
}

uint64_t sub_1BC8178A8()
{
  return MEMORY[0x1E0C962B8]();
}

uint64_t sub_1BC8178B4()
{
  return MEMORY[0x1E0C96300]();
}

uint64_t sub_1BC8178C0()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1BC8178CC()
{
  return MEMORY[0x1E0C96328]();
}

uint64_t sub_1BC8178D8()
{
  return MEMORY[0x1E0C96338]();
}

uint64_t sub_1BC8178E4()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1BC8178F0()
{
  return MEMORY[0x1E0C96360]();
}

uint64_t sub_1BC8178FC()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1BC817908()
{
  return MEMORY[0x1E0C96388]();
}

uint64_t sub_1BC817914()
{
  return MEMORY[0x1E0C963D8]();
}

uint64_t sub_1BC817920()
{
  return MEMORY[0x1E0C96400]();
}

uint64_t sub_1BC81792C()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BC817938()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t sub_1BC817944()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1BC817950()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC81795C()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BC817968()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC817974()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC817980()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BC81798C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BC817998()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1BC8179A4()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1BC8179B0()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1BC8179BC()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1BC8179C8()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1BC8179D4()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1BC8179E0()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1BC8179EC()
{
  return MEMORY[0x1E0CB4328]();
}

uint64_t sub_1BC8179F8()
{
  return MEMORY[0x1E0CB4338]();
}

uint64_t sub_1BC817A04()
{
  return MEMORY[0x1E0CB4340]();
}

uint64_t sub_1BC817A10()
{
  return MEMORY[0x1E0CB4350]();
}

uint64_t sub_1BC817A1C()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1BC817A28()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BC817A34()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BC817A40()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1BC817A4C()
{
  return MEMORY[0x1E0DE9F18]();
}

uint64_t sub_1BC817A58()
{
  return MEMORY[0x1E0DE9F20]();
}

uint64_t sub_1BC817A64()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BC817A70()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BC817A7C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1BC817A88()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BC817A94()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1BC817AA0()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1BC817AAC()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1BC817AB8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BC817AC4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC817AD0()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BC817ADC()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BC817AE8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC817AF4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC817B00()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BC817B0C()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1BC817B18()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1BC817B24()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1BC817B30()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BC817B3C()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1BC817B48()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC817B54()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC817B60()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1BC817B6C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1BC817B78()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1BC817B84()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1BC817B90()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1BC817B9C()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1BC817BA8()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1BC817BB4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BC817BC0()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1BC817BCC()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1BC817BD8()
{
  return MEMORY[0x1E0DEAB08]();
}

uint64_t sub_1BC817BE4()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1BC817BF0()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1BC817BFC()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1BC817C08()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1BC817C14()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1BC817C20()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1BC817C2C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1BC817C38()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1BC817C44()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC817C50()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC817C5C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC817C68()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1BC817C74()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC817C80()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1BC817C8C()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1BC817C98()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC817CA4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BC817CB0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1BC817CBC()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1BC817CC8()
{
  return MEMORY[0x1E0DEAE40]();
}

uint64_t sub_1BC817CD4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC817CE0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1BC817CEC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1BC817CF8()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1BC817D04()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC817D10()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1BC817D1C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BC817D28()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1BC817D34()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1BC817D40()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1BC817D4C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BC817D58()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BC817D64()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1BC817D70()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1BC817D7C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1BC817D88()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1BC817D94()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BC817DA0()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1BC817DAC()
{
  return MEMORY[0x1E0DEB2B0]();
}

uint64_t sub_1BC817DB8()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1BC817DC4()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1BC817DD0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BC817DDC()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BC817DE8()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BC817DF4()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1BC817E00()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BC817E0C()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t sub_1BC817E18()
{
  return MEMORY[0x1E0DEB788]();
}

uint64_t sub_1BC817E24()
{
  return MEMORY[0x1E0DEB818]();
}

uint64_t sub_1BC817E30()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1BC817E3C()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t _sSo12HKObjectTypeC14HealthPlatformE23pinnedContentIdentifierSSvg_0()
{
  return MEMORY[0x1E0CB4520]();
}

uint64_t sub_1BC817E54()
{
  return MEMORY[0x1E0CB1D20]();
}

uint64_t sub_1BC817E60()
{
  return MEMORY[0x1E0CB4528]();
}

uint64_t sub_1BC817E6C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BC817E78()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BC817E84()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC817E90()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BC817E9C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC817EA8()
{
  return MEMORY[0x1E0D2C0B0]();
}

uint64_t sub_1BC817EB4()
{
  return MEMORY[0x1E0D2C0B8]();
}

uint64_t sub_1BC817EC0()
{
  return MEMORY[0x1E0D2C0C0]();
}

uint64_t sub_1BC817ECC()
{
  return MEMORY[0x1E0D2C0C8]();
}

uint64_t sub_1BC817ED8()
{
  return MEMORY[0x1E0D2C0D0]();
}

uint64_t sub_1BC817EE4()
{
  return MEMORY[0x1E0D2C0D8]();
}

uint64_t sub_1BC817EF0()
{
  return MEMORY[0x1E0D2C0E0]();
}

uint64_t sub_1BC817EFC()
{
  return MEMORY[0x1E0D2C0E8]();
}

uint64_t sub_1BC817F08()
{
  return MEMORY[0x1E0D2C0F0]();
}

uint64_t sub_1BC817F14()
{
  return MEMORY[0x1E0D2C108]();
}

uint64_t sub_1BC817F20()
{
  return MEMORY[0x1E0D2C118]();
}

uint64_t sub_1BC817F2C()
{
  return MEMORY[0x1E0CB4580]();
}

uint64_t sub_1BC817F38()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1BC817F44()
{
  return MEMORY[0x1E0CB1E80]();
}

uint64_t sub_1BC817F50()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1BC817F5C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BC817F68()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1BC817F74()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1BC817F80()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1BC817F8C()
{
  return MEMORY[0x1E0DEF878]();
}

uint64_t sub_1BC817F98()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1BC817FA4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BC817FB0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1BC817FBC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BC817FC8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BC817FD4()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BC817FE0()
{
  return MEMORY[0x1E0D2C188]();
}

uint64_t sub_1BC817FEC()
{
  return MEMORY[0x1E0DEF958]();
}

uint64_t sub_1BC817FF8()
{
  return MEMORY[0x1E0DEF960]();
}

uint64_t sub_1BC818004()
{
  return MEMORY[0x1E0DEF968]();
}

uint64_t sub_1BC818010()
{
  return MEMORY[0x1E0DEF988]();
}

uint64_t sub_1BC81801C()
{
  return MEMORY[0x1E0DEF9E0]();
}

uint64_t sub_1BC818028()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1BC818034()
{
  return MEMORY[0x1E0DEFA00]();
}

uint64_t sub_1BC818040()
{
  return MEMORY[0x1E0DEFA10]();
}

uint64_t sub_1BC81804C()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1BC818058()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1BC818064()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1BC818070()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1BC81807C()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1BC818088()
{
  return MEMORY[0x1E0D2C1C8]();
}

uint64_t sub_1BC818094()
{
  return MEMORY[0x1E0D2C1D0]();
}

uint64_t sub_1BC8180A0()
{
  return MEMORY[0x1E0D2C1D8]();
}

uint64_t sub_1BC8180AC()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1BC8180B8()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1BC8180C4()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BC8180D0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BC8180DC()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1BC8180E8()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_1BC8180F4()
{
  return MEMORY[0x1E0CB2318]();
}

uint64_t sub_1BC818100()
{
  return MEMORY[0x1E0CB2328]();
}

uint64_t sub_1BC81810C()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1BC818118()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1BC818124()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1BC818130()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC81813C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1BC818148()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC818154()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC818160()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1BC81816C()
{
  return MEMORY[0x1E0CB2568]();
}

uint64_t sub_1BC818178()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BC818184()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC818190()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BC81819C()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1BC8181A8()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1BC8181B4()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BC8181C0()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BC8181CC()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1BC8181D8()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1BC8181E4()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BC8181F0()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BC8181FC()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BC818208()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1BC818214()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BC818220()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1BC81822C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BC818238()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1BC818244()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1BC818250()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1BC81825C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1BC818268()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1BC818274()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1BC818280()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BC81828C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BC818298()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1BC8182A4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BC8182B0()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BC8182BC()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1BC8182C8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC8182D4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC8182E0()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_1BC8182EC()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_1BC8182F8()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1BC818304()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC818310()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BC81831C()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1BC818328()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1BC818334()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1BC818340()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1BC81834C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC818358()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BC818364()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BC818370()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1BC81837C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BC818388()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BC818394()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BC8183A0()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1BC8183AC()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1BC8183B8()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1BC8183C4()
{
  return MEMORY[0x1E0DEC7F8]();
}

uint64_t sub_1BC8183D0()
{
  return MEMORY[0x1E0DEC808]();
}

uint64_t sub_1BC8183DC()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1BC8183E8()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BC8183F4()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t sub_1BC818400()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1BC81840C()
{
  return MEMORY[0x1E0DECB48]();
}

uint64_t sub_1BC818418()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t sub_1BC818424()
{
  return MEMORY[0x1E0DECB58]();
}

uint64_t sub_1BC818430()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t sub_1BC81843C()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t sub_1BC818448()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1BC818454()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t sub_1BC818460()
{
  return MEMORY[0x1E0DECBA0]();
}

uint64_t sub_1BC81846C()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1BC818478()
{
  return MEMORY[0x1E0DECBB0]();
}

uint64_t sub_1BC818484()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1BC818490()
{
  return MEMORY[0x1E0DECBC0]();
}

uint64_t sub_1BC81849C()
{
  return MEMORY[0x1E0DECBD8]();
}

uint64_t sub_1BC8184A8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC8184B4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC8184C0()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t sub_1BC8184CC()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1BC8184D8()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_1BC8184E4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC8184F0()
{
  return MEMORY[0x1E0DECD28]();
}

uint64_t sub_1BC8184FC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BC818508()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BC818514()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1BC818520()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BC81852C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BC818538()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC818544()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1BC818550()
{
  return MEMORY[0x1E0DECE28]();
}

uint64_t sub_1BC81855C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BC818568()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BC818574()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1BC818580()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1BC81858C()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BC818598()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BC8185A4()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1BC8185B0()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1BC8185BC()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BC8185C8()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BC8185D4()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1BC8185E0()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1BC8185EC()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1BC8185F8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1BC818604()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BC818610()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1BC81861C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1BC818628()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BC818634()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BC818640()
{
  return MEMORY[0x1E0DED168]();
}

uint64_t sub_1BC81864C()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1BC818658()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1BC818664()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1BC818670()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BC81867C()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC818688()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1BC818694()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BC8186A0()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1BC8186AC()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1BC8186B8()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1BC8186C4()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1BC8186D0()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1BC8186DC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BC8186E8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BC8186F4()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BC818700()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BC81870C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BC818718()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BC818724()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BC818730()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BC81873C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BC818748()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BC818754()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1BC818760()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1BC81876C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1BC818778()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BC818784()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1BC818790()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_1BC81879C()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t sub_1BC8187A8()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1BC8187B4()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1BC8187C0()
{
  return MEMORY[0x1E0DEE020]();
}

uint64_t sub_1BC8187CC()
{
  return MEMORY[0x1E0C964B8]();
}

uint64_t sub_1BC8187D8()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1BC8187E4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BC8187F0()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BC8187FC()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BC818808()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BC818814()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

uint64_t HKFeatureFlagBloodOxygenSaturationEnabled()
{
  return MEMORY[0x1E0CB4FE8]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x1E0CB5240]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1E0CB5E90]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x1E0CB6010]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C83948](a1, *(_QWORD *)&a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1E0C849C0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1E0DEECA0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1E0DEEE10]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

