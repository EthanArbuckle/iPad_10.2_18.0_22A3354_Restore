_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1D829B854](a1, v6, a5);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t block_destroy_helper()
{
  return swift_release();
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

uint64_t *__swift_assign_boxed_opaque_existential_2(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      result[5] = a2[5];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t ArticlesGenerator.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77AE040(&qword_1EDA12770, (uint64_t (*)(_QWORD))MEMORY[0x1E0D2DA30], a1);
}

uint64_t sub_1D77ADBE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1D77ADC38();
  *a1 = result;
  return result;
}

uint64_t sub_1D77ADC10()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_1D77ADFC8(v0);
}

uint64_t sub_1D77ADC38()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = qword_1EDA12610;
  if (*(uint64_t *)((char *)v0 + qword_1EDA12610))
  {
    v2 = *(uint64_t *)((char *)v0 + qword_1EDA12610);
  }
  else
  {
    v2 = sub_1D77ADC9C(v0);
    *(uint64_t *)((char *)v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_1D77ADC9C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v12;

  v1 = *a1;
  sub_1D77AE830();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_allocObject();
  swift_weakInit();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = *(_QWORD *)(v1 + 80);
  v8[3] = *(_QWORD *)(v1 + 88);
  v8[4] = v7;
  v9 = MEMORY[0x1E0C95D78];
  sub_1D77AEA10(0, &qword_1EDA12578, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1D77AEA78(&qword_1EDA126C8, &qword_1EDA12578, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v9, MEMORY[0x1E0C95D90]);
  sub_1D77BDA38();
  sub_1D77AE970();
  v10 = sub_1D77BDA50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

uint64_t sub_1D77ADDE0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  _QWORD *v21;

  sub_1D77AE9B8(0, &qword_1EDA12590, (uint64_t (*)(uint64_t))sub_1D77AE8C8, MEMORY[0x1E0C96098]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v21 - v9;
  sub_1D77AEA10(0, &qword_1EDA12598, MEMORY[0x1E0C960C0]);
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v21 - v14;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v21 = (_QWORD *)Strong;
    v18 = type metadata accessor for ArticlesGenerator(0, a1, a2, v17);
    v21 = sub_1D77B2934(v18, (char *)&off_1E9C2F358);
    sub_1D77AE8C8();
    sub_1D77BDA20();
    sub_1D77AEAB8();
    v19 = sub_1D77BDA50();
    swift_release();
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_1D77AE8C8();
    sub_1D77BDA2C();
    sub_1D77AEA78(&qword_1F012D138, &qword_1EDA12598, MEMORY[0x1E0C960C0], MEMORY[0x1E0C960D0]);
    v19 = sub_1D77BDA50();
    result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *a3 = v19;
  return result;
}

uint64_t sub_1D77ADFC8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + qword_1EDA12610) = a1;
  return swift_release();
}

uint64_t (*sub_1D77ADFE0(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1D77ADC38();
  return sub_1D77AE014;
}

uint64_t sub_1D77AE014(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + qword_1EDA12610) = *a1;
  return swift_release();
}

uint64_t ArticlesGenerator.generatorContext.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77AE040(&qword_1EDA12768, (uint64_t (*)(_QWORD))MEMORY[0x1E0D2DA80], a1);
}

uint64_t sub_1D77AE040@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *a1;
  v6 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t sub_1D77AE080()
{
  return sub_1D77BD84C();
}

uint64_t sub_1D77AE0A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D77AE618(v1 + qword_1EDA12758, a1);
}

uint64_t ArticlesGenerator.managedArticles.getter()
{
  sub_1D77AE608();
  return swift_bridgeObjectRetain();
}

uint64_t ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  ArticlesGenerator.init(context:managedArticles:readArticleInfo:)(a1, a2, a3);
  return v6;
}

uint64_t ArticlesGenerator.init(context:managedArticles:readArticleInfo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];

  v4 = v3;
  *(_QWORD *)(v4 + qword_1EDA12610) = 0;
  if (qword_1EDA12728 != -1)
    swift_once();
  v8 = sub_1D77BD840();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EDA125F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4 + qword_1EDA12770, v9, v8);
  sub_1D77AE618(a3, v4 + qword_1EDA12758);
  *(_QWORD *)(v4 + qword_1EDA12750) = a2;
  v10 = v4 + qword_1EDA12768;
  v11 = sub_1D77BD870();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a1, v11);
  v13 = (void *)objc_opt_self();
  sub_1D77BD84C();
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  v14 = (void *)sub_1D77BD7F8();
  v15 = objc_msgSend(v13, sel_healthArticlesDefaultsDomainWithHealthStore_, v14);

  sub_1D77AE674(a3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *(_QWORD *)(v4 + qword_1EDA12760) = v15;
  return v4;
}

void sub_1D77AE2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[0] = a1;
  v9[1] = a2;
  v2 = sub_1D77BD6FC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D77BD948();
  v7 = sub_1D77BD93C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0D2D568], v2);
  v8 = (void *)sub_1D77BD864();
  MEMORY[0x1D829B89C](MEMORY[0x1E0D28F08], v6);
  MEMORY[0x1D829B89C](MEMORY[0x1E0D28EF8], v7);
  sub_1D77BD714();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

}

uint64_t ArticlesGenerator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + qword_1EDA12770;
  v2 = sub_1D77BD840();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  v3 = v0 + qword_1EDA12768;
  v4 = sub_1D77BD870();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D77AE674(v0 + qword_1EDA12758);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ArticlesGenerator.__deallocating_deinit()
{
  ArticlesGenerator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77AE4FC()
{
  return sub_1D77ADC38();
}

uint64_t sub_1D77AE51C@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGenerator.domain.getter(a1);
}

uint64_t sub_1D77AE53C()
{
  return sub_1D77AE080();
}

uint64_t sub_1D77AE55C@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGenerator.generatorContext.getter(a1);
}

uint64_t sub_1D77AE57C@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77AE0A8(a1);
}

uint64_t sub_1D77AE59C()
{
  sub_1D77AE608();
  return swift_bridgeObjectRetain();
}

id sub_1D77AE5BC()
{
  return (id)sub_1D77AE820();
}

uint64_t sub_1D77AE5E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 184))();
}

uint64_t sub_1D77AE608()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_1EDA12750);
}

uint64_t sub_1D77AE618(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77AE9B8(0, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77AE674(uint64_t a1)
{
  uint64_t v2;

  sub_1D77AE9B8(0, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D77AE6C8()
{
  return 16;
}

__n128 sub_1D77AE6D4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void sub_1D77AE6E4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1D77BD840();
  if (v0 <= 0x3F)
  {
    sub_1D77BD870();
    if (v1 <= 0x3F)
    {
      sub_1D77AE9B8(319, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      if (v2 <= 0x3F)
        swift_initClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for ArticlesGenerator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArticlesGenerator);
}

uint64_t method lookup function for ArticlesGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ArticlesGenerator.makeBasePluginArticleFeedItem(identifier:viewModel:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_1D77AE820()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_1EDA12760);
}

void sub_1D77AE830()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1EDA125A0)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1D77AEA10(255, &qword_1EDA12578, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1D77AEA78(&qword_1EDA126C8, &qword_1EDA12578, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v0, MEMORY[0x1E0C95D90]);
    v1 = sub_1D77BDA44();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1EDA125A0);
  }
}

void sub_1D77AE8C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA125A8)
  {
    v0 = sub_1D77BDAF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA125A8);
  }
}

uint64_t sub_1D77AE91C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D77AE940()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77AE964@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1D77ADDE0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1D77AE970()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA126E8;
  if (!qword_1EDA126E8)
  {
    sub_1D77AE830();
    result = MEMORY[0x1D829B89C](MEMORY[0x1E0C96148], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA126E8);
  }
  return result;
}

void sub_1D77AE9B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_1D77AEA10(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1D77AE8C8();
    v7 = a3(a1, v6, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1D77AEA78(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1D77AEA10(255, a2, a3);
    result = MEMORY[0x1D829B89C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1D77AEAB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA126E0;
  if (!qword_1EDA126E0)
  {
    sub_1D77AE9B8(255, &qword_1EDA12590, (uint64_t (*)(uint64_t))sub_1D77AE8C8, MEMORY[0x1E0C96098]);
    result = MEMORY[0x1D829B89C](MEMORY[0x1E0C960B0], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA126E0);
  }
  return result;
}

uint64_t static PluginFeedItem.makeArticleFeedItemWithMetadata(article:sourceProfile:pluginFeedItemConstructor:)@<X0>(_QWORD *a1@<X0>, void (*a2)(uint64_t, uint64_t, char *)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, char *);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[6];

  v65 = a2;
  v64 = a3;
  v59 = a4;
  v53 = sub_1D77BD9C0();
  v58 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v61 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1D77BD87C();
  v56 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v57 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_1D77BD888();
  v60 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v55 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1D77BD984();
  v49 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  v48 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77BD960();
  v62 = *(_QWORD *)(v9 - 8);
  v63 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_1D77BD7EC();
  v12 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v15 = sub_1D77BD930();
  v17 = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1D77BD8E8();
  sub_1D77BD954();
  v18 = v66;
  v65(v15, v17, v11);
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v62 + 8))(v11, v63);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v66 = v12;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v11, v63);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1D77BD8F4();
    sub_1D77BD78C();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1D77BD8F4();
    sub_1D77AF2E4();
    sub_1D77BDB10();
    swift_bridgeObjectRelease();
    sub_1D77BD7D4();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1D77BD8DC();
    sub_1D77BD768();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1D77BD90C();
    sub_1D77BD7BC();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1D77BD900();
    v21 = v14;
    v22 = v51;
    v23 = v52;
    v24 = v60;
    if (v20)
    {
      if (v20 != 1)
        goto LABEL_6;
      v25 = v52;
      v26 = v51;
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      v22 = v26;
      v23 = v25;
      v24 = v60;
      sub_1D77BD8F4();
      v27 = sub_1D77BDB10();
      swift_bridgeObjectRelease();
      sub_1D77AF320(v27);
      v29 = v28;
      swift_bridgeObjectRelease();
      if (v29)
      {
LABEL_6:
        v30 = v48;
        sub_1D77BD990();
        sub_1D77AFA0C(qword_1EDA12428, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2ECD0], MEMORY[0x1E0D2ECC8]);
        v31 = v50;
        sub_1D77BD738();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v30, v31);
      }
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v57, *MEMORY[0x1E0D2DE30], v23);
    v32 = v55;
    sub_1D77BD894();
    sub_1D77BD738();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v32, v22);
    v33 = v61;
    sub_1D77BD99C();
    v34 = sub_1D77BD9B4();
    v35 = sub_1D77BDB34();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v65 = 0;
      v38 = v21;
      v39 = v37;
      v68[0] = v37;
      *(_DWORD *)v36 = 136315394;
      v40 = v54;
      v67 = v54;
      sub_1D77AF9D4();
      v41 = sub_1D77BDA8C();
      v67 = sub_1D77AF39C(v41, v42, v68);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      swift_beginAccess();
      sub_1D77AFA0C(&qword_1EDA125F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], MEMORY[0x1E0D2D8D8]);
      v43 = sub_1D77BDC48();
      v68[5] = sub_1D77AF39C(v43, v44, v68);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77AB000, v34, v35, "[%s] Making article feed item: %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      v45 = v39;
      v21 = v38;
      MEMORY[0x1D829B914](v45, -1, -1);
      MEMORY[0x1D829B914](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v53);
      v46 = v59;
      v47 = v66;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v53);
      v46 = v59;
      v47 = v66;
      v40 = v54;
    }
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 16))(v46, v21, v40);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v40);
  }
}

uint64_t static PluginFeedItem.mutualExclusionTagForArticle(_:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v2 = sub_1D77BD900();
  if (!v3)
    return 0;
  if (v3 != 1)
    return v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1D77BD8F4();
  sub_1D77AF2E4();
  v4 = sub_1D77BDB10();
  swift_bridgeObjectRelease();
  v5 = sub_1D77AF320(v4);
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_1D77AF2E4()
{
  unint64_t result;

  result = qword_1EDA126F8;
  if (!qword_1EDA126F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA126F8);
  }
  return result;
}

uint64_t sub_1D77AF320(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = sub_1D77AFA4C(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_1D77AFAEC(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1D77AF39C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D77AF46C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D77AFB44((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1D77AFB44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1D77AF46C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D77BDB88();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D77AF624(a5, a6);
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
  v8 = sub_1D77BDC24();
  if (!v8)
  {
    sub_1D77BDC30();
    __break(1u);
LABEL_17:
    result = sub_1D77BDC3C();
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

uint64_t sub_1D77AF624(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D77AF6B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D77AF88C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D77AF88C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D77AF6B8(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D77AF82C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D77BDC18();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D77BDC30();
      __break(1u);
LABEL_10:
      v2 = sub_1D77BDAA4();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D77BDC3C();
    __break(1u);
LABEL_14:
    result = sub_1D77BDC30();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1D77AF82C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1D77AFB80();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D77AF88C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1D77AFB80();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1D77BDC3C();
  __break(1u);
  return result;
}

unint64_t sub_1D77AF9D4()
{
  unint64_t result;

  result = qword_1EDA124C8;
  if (!qword_1EDA124C8)
  {
    sub_1D77BD7EC();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA124C8);
  }
  return result;
}

uint64_t sub_1D77AFA0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D829B89C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D77AFA4C(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

uint64_t sub_1D77AFAEC(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1D77AFB44(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1D77AFB80()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA125E0)
  {
    v0 = sub_1D77BDC54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA125E0);
  }
}

uint64_t static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.articleActionForHighlightAlert(sourceIdentifier:dataProvider:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  id v8;
  __int128 v10[3];

  sub_1D77AFE64(a3, (uint64_t)v10);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a4;
  sub_1D77AFEDC(v10, (_OWORD *)(v7 + 40));
  swift_bridgeObjectRetain();
  v8 = a4;
  return sub_1D77BD96C();
}

uint64_t sub_1D77AFC6C(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t result;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;

  sub_1D77AFFB0();
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v24 - v14;
  static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(a2, a3, a4, (uint64_t)&v24 - v14);
  v16 = sub_1D77BD6F0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16);
  result = sub_1D77B062C((uint64_t)v15);
  if (v18 == 1)
  {
    v20 = a5[3];
    v25 = a1;
    __swift_project_boxed_opaque_existential_1(a5, v20);
    sub_1D77BD924();
    v26 = a3;
    v27 = a4;
    __swift_project_boxed_opaque_existential_1(a5, a5[3]);
    sub_1D77BD8D0();
    v21 = objc_allocWithZone((Class)sub_1D77BD8C4());
    v22 = (void *)sub_1D77BD8B8();
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B0]), sel_initWithRootViewController_, v22);
    objc_msgSend(v23, sel_setDelegate_, v22);
    objc_msgSend(v25, sel_presentViewController_animated_completion_, v23, 1, 0);
    sub_1D77BD6E4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
    _s18HealthExperienceUI42DataTypeDetailViewControllerWithLoadActionC02OnjK0V0A18ArticlesGenerationE50setArticleDateDisplayedForHighlightAlertIdentifier__11healthStoreySS_10Foundation0Q0VSgSo08HKHealthX0CtFZ_0(a2, v26, (uint64_t)v13, v27);

    return sub_1D77B062C((uint64_t)v13);
  }
  return result;
}

uint64_t sub_1D77AFE64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D77AFEA8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return swift_deallocObject();
}

_OWORD *sub_1D77AFEDC(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1D77AFEF4(void *a1)
{
  _QWORD *v1;

  return sub_1D77AFC6C(a1, v1[2], v1[3], v1[4], v1 + 5);
}

BOOL static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.shouldDisplayArticleFromHighlightAlertIdentifier(_:healthStore:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v12;

  sub_1D77AFFB0();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(a1, a2, a3, (uint64_t)v8);
  v9 = sub_1D77BD6F0();
  v10 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9) == 1;
  sub_1D77B062C((uint64_t)v8);
  return v10;
}

void sub_1D77AFFB0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA124B0)
  {
    sub_1D77BD6F0();
    v0 = sub_1D77BDB70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA124B0);
  }
}

void static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  id v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[2];

  v39 = a4;
  v7 = sub_1D77BD9C0();
  v37 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v33 - v9;
  sub_1D77AFFB0();
  v35 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v33 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v33 - v18;
  v20 = objc_msgSend((id)objc_opt_self(), sel_healthArticlesDefaultsDomainWithHealthStore_, a3);
  v36 = a1;
  v21 = (void *)sub_1D77BDA74();
  v22 = HKArticlesKeyDisplayedFromHighlightAlert(v21);

  if (v22)
  {
    sub_1D77BDA80();

    sub_1D77BDB40();
    swift_bridgeObjectRelease();
    v23 = v10;
    sub_1D77BD99C();
    sub_1D77B0DBC((uint64_t)v19, (uint64_t)v17);
    swift_bridgeObjectRetain_n();
    v24 = sub_1D77BD9B4();
    v25 = sub_1D77BDB34();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v34 = v23;
      v27 = v26;
      v33 = swift_slowAlloc();
      v41[0] = v33;
      *(_DWORD *)v27 = 136446722;
      v40 = sub_1D77BD978();
      sub_1D77B0D30();
      v28 = sub_1D77BDA8C();
      v40 = sub_1D77AF39C(v28, v29, v41);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      sub_1D77B0DBC((uint64_t)v17, (uint64_t)v14);
      v30 = sub_1D77BDA8C();
      v40 = sub_1D77AF39C(v30, v31, v41);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      sub_1D77B062C((uint64_t)v17);
      *(_WORD *)(v27 + 22) = 2080;
      swift_bridgeObjectRetain();
      v40 = sub_1D77AF39C(v36, a2, v41);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D77AB000, v24, v25, "[%{public}s] Fetched last article launch from highlight alert date %s for identifier %s.", (uint8_t *)v27, 0x20u);
      v32 = v33;
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v32, -1, -1);
      MEMORY[0x1D829B914](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v38);
    }
    else
    {
      sub_1D77B062C((uint64_t)v17);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v38);
    }
    sub_1D77B0E00((uint64_t)v19, v39);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D77B062C(uint64_t a1)
{
  uint64_t v2;

  sub_1D77AFFB0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s18HealthExperienceUI42DataTypeDetailViewControllerWithLoadActionC02OnjK0V0A18ArticlesGenerationE50setArticleDateDisplayedForHighlightAlertIdentifier__11healthStoreySS_10Foundation0Q0VSgSo08HKHealthX0CtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  void *v38;
  void *v39;
  _BYTE *v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  _BYTE v53[4];
  int v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61[2];

  v59 = a1;
  v61[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = sub_1D77BD9C0();
  v57 = *(_QWORD *)(v7 - 8);
  v58 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v56 = &v53[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8);
  v11 = &v53[-v10];
  sub_1D77AFFB0();
  v55 = v12;
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = &v53[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = &v53[-v17];
  MEMORY[0x1E0C80A78](v16);
  v20 = &v53[-v19];
  v21 = objc_msgSend((id)objc_opt_self(), sel_healthArticlesDefaultsDomainWithHealthStore_, a4);
  sub_1D77B0DBC(a3, (uint64_t)v20);
  v22 = sub_1D77BD6F0();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22) != 1)
  {
    v24 = (void *)sub_1D77BD6D8();
    (*(void (**)(_BYTE *, uint64_t))(v23 + 8))(v20, v22);
  }
  v25 = (void *)sub_1D77BDA74();
  v26 = HKArticlesKeyDisplayedFromHighlightAlert(v25);

  if (!v26)
    __break(1u);
  v61[0] = 0;
  v27 = objc_msgSend(v21, sel_setDate_forKey_error_, v24, v26, v61);

  v28 = v61[0];
  if (v27)
  {
    sub_1D77BD99C();
    sub_1D77B0DBC(a3, (uint64_t)v18);
    swift_bridgeObjectRetain_n();
    v29 = sub_1D77BD9B4();
    v30 = sub_1D77BDB34();
    v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      v32 = swift_slowAlloc();
      v56 = (_BYTE *)swift_slowAlloc();
      v61[0] = v56;
      *(_DWORD *)v32 = 136446722;
      v54 = v31;
      v60 = sub_1D77BD978();
      sub_1D77B0D30();
      v33 = sub_1D77BDA8C();
      v60 = sub_1D77AF39C(v33, v34, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      sub_1D77B0DBC((uint64_t)v18, (uint64_t)v15);
      v35 = sub_1D77BDA8C();
      v60 = sub_1D77AF39C(v35, v36, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      sub_1D77B062C((uint64_t)v18);
      *(_WORD *)(v32 + 22) = 2080;
      swift_bridgeObjectRetain();
      v60 = sub_1D77AF39C(v59, a2, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D77AB000, v29, (os_log_type_t)v54, "[%{public}s] Set last article launch from highlight alert date to %s for identifier %s.", (uint8_t *)v32, 0x20u);
      v37 = v56;
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v37, -1, -1);
      MEMORY[0x1D829B914](v32, -1, -1);

    }
    else
    {
      sub_1D77B062C((uint64_t)v18);

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v57 + 8))(v11, v58);
  }
  else
  {
    v38 = v28;
    v39 = (void *)sub_1D77BD6CC();

    swift_willThrow();
    v40 = v56;
    sub_1D77BD9A8();
    swift_bridgeObjectRetain();
    v41 = v39;
    swift_bridgeObjectRetain();
    v42 = v39;
    v43 = sub_1D77BD9B4();
    v44 = sub_1D77BDB28();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = swift_slowAlloc();
      v46 = (void *)swift_slowAlloc();
      v61[0] = v46;
      *(_DWORD *)v45 = 136446722;
      v60 = sub_1D77BD978();
      sub_1D77B0D30();
      v47 = sub_1D77BDA8C();
      v60 = sub_1D77AF39C(v47, v48, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      v60 = sub_1D77AF39C(v59, a2, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 22) = 2080;
      v60 = (uint64_t)v39;
      v49 = v39;
      sub_1D77B0D68();
      v50 = sub_1D77BDA8C();
      v60 = sub_1D77AF39C(v50, v51, (uint64_t *)v61);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D77AB000, v43, v44, "[%{public}s]: Encountered error while setting article %s HKArticlesKeyDisplayedFromHighlightAlert status: %s", (uint8_t *)v45, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v46, -1, -1);
      MEMORY[0x1D829B914](v45, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v57 + 8))(v40, v58);
  }
}

id HKArticlesKeyDisplayedFromHighlightAlert(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("%@_%@"), v2, CFSTR("ArticleDisplayedFromHighlightAlert"));

  return v3;
}

unint64_t sub_1D77B0D30()
{
  unint64_t result;

  result = qword_1F012D140;
  if (!qword_1F012D140)
  {
    sub_1D77BD978();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012D140);
  }
  return result;
}

unint64_t sub_1D77B0D68()
{
  unint64_t result;

  result = qword_1F012D148;
  if (!qword_1F012D148)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012D148);
  }
  return result;
}

uint64_t sub_1D77B0DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77AFFB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77B0E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77AFFB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1D77B0E44(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id sub_1D77B0EA4()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  return *v1;
}

void sub_1D77B0EE8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1D77B0F38())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1D77B0F80(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1D77B0FE8()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1D77B1030(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1D77B1080())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

BOOL sub_1D77B10C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1D77B10DC()
{
  sub_1D77BDCA8();
  sub_1D77BDCB4();
  return sub_1D77BDCC0();
}

uint64_t sub_1D77B1120()
{
  return sub_1D77BDCB4();
}

uint64_t sub_1D77B1148()
{
  sub_1D77BDCA8();
  sub_1D77BDCB4();
  return sub_1D77BDCC0();
}

id sub_1D77B1198()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers);
  }
  else
  {
    swift_getObjectType();
    sub_1D77B2740();
    sub_1D77BDA8C();
    v4 = (id)HKLogInfrastructure();
    v5 = objc_allocWithZone(MEMORY[0x1E0CB6988]);
    v6 = (void *)sub_1D77BDA74();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v5, sel_initWithName_loggingCategory_, v6, v4);

    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id ArticleChangeDetector.__allocating_init(healthStore:)(void *a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1D77B143C();
  swift_allocObject();
  v5 = v3;
  *(_QWORD *)&v3[v4] = sub_1D77BDA08();
  *(_QWORD *)&v5[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  v6 = objc_msgSend((id)objc_opt_self(), sel_healthArticlesDefaultsDomainWithHealthStore_, a1);
  *(_QWORD *)&v5[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v6;

  v9.receiver = v5;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_1D77B1500();

  return v7;
}

id ArticleChangeDetector.init(healthStore:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1D77B143C();
  swift_allocObject();
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_1D77BDA08();
  *(_QWORD *)&v4[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_healthArticlesDefaultsDomainWithHealthStore_, a1);
  *(_QWORD *)&v4[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ArticleChangeDetector();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  sub_1D77B1500();

  return v6;
}

void sub_1D77B143C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA12580)
  {
    v0 = sub_1D77BDA14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA12580);
  }
}

void sub_1D77B14A0(uint64_t a1)
{
  sub_1D77B14B8(a1, (SEL *)&selRef_registerObserver_);
}

void sub_1D77B14AC(uint64_t a1)
{
  sub_1D77B14B8(a1, (SEL *)&selRef_unregisterObserver_);
}

void sub_1D77B14B8(uint64_t a1, SEL *a2)
{
  id v4;

  v4 = sub_1D77B1198();
  objc_msgSend(v4, *a2, a1);

}

void sub_1D77B1500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v1 = v0;
  v2 = sub_1D77BD9C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77BD99C();
  v6 = sub_1D77BD9B4();
  v7 = sub_1D77BDB34();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D77AB000, v6, v7, "ArticleChangeDetector subscribed to article status updates.", v8, 2u);
    MEMORY[0x1D829B914](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v10 = (void *)sub_1D77BDB4C();
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v1, sel_articleStatusDidChange_, v10, 0);

}

uint64_t type metadata accessor for ArticleChangeDetector()
{
  return objc_opt_self();
}

void sub_1D77B1670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint8_t *v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  unsigned __int8 v29;
  id v30;
  _BYTE *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(_BYTE *, uint64_t);
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  id v57;
  _QWORD *v58;
  void *v59;
  _BYTE v60[4];
  int v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  void *ObjectType;
  uint64_t v66;
  char *v67;
  _BYTE *v68;
  uint64_t v69[2];
  id aBlock[11];

  aBlock[9] = *(id *)MEMORY[0x1E0C80C00];
  ObjectType = (void *)swift_getObjectType();
  v66 = sub_1D77BD6F0();
  v0 = *(_QWORD *)(v66 - 8);
  v1 = MEMORY[0x1E0C80A78](v66);
  v3 = &v60[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v1);
  v68 = &v60[-v4];
  v5 = sub_1D77BD9C0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = &v60[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x1E0C80A78](v7);
  v64 = &v60[-v11];
  MEMORY[0x1E0C80A78](v10);
  v13 = &v60[-v12];
  sub_1D77BD99C();
  v14 = sub_1D77BD9B4();
  v15 = sub_1D77BDB34();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = v5;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D77AB000, v14, v15, "ArticleChangeDetector received article status update.", v17, 2u);
    v18 = v17;
    v5 = v16;
    MEMORY[0x1D829B914](v18, -1, -1);
  }

  v19 = *(_BYTE **)(v6 + 8);
  ((void (*)(_BYTE *, uint64_t))v19)(v13, v5);
  v20 = sub_1D77B23A4();
  v22 = v21;
  v63 = v5;
  v23 = v20;
  sub_1D77BD6E4();
  v24 = (id *)&v67[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain];
  swift_beginAccess();
  v25 = *v24;
  v26 = (void *)sub_1D77BD6D8();
  v62 = v23;
  v27 = (void *)sub_1D77BDA74();
  v28 = HKArticlesKeyReadState(v27);

  if (v28)
  {
    aBlock[0] = 0;
    v29 = objc_msgSend(v25, sel_setDate_forKey_error_, v26, v28, aBlock);

    if ((v29 & 1) != 0)
    {
      v30 = aBlock[0];
      v31 = v64;
      sub_1D77BD99C();
      v32 = v66;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v0 + 16))(v3, v68, v66);
      swift_bridgeObjectRetain_n();
      v33 = sub_1D77BD9B4();
      v34 = sub_1D77BDB34();
      v35 = v34;
      if (os_log_type_enabled(v33, v34))
      {
        v36 = swift_slowAlloc();
        ObjectType = (void *)swift_slowAlloc();
        aBlock[0] = ObjectType;
        *(_DWORD *)v36 = 136315394;
        sub_1D77B25B0();
        v37 = sub_1D77BDC48();
        v69[0] = sub_1D77AF39C(v37, v38, (uint64_t *)aBlock);
        v61 = v35;
        v32 = v66;
        sub_1D77BDB7C();
        swift_bridgeObjectRelease();
        v39 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
        v39(v3, v32);
        *(_WORD *)(v36 + 12) = 2080;
        swift_bridgeObjectRetain();
        v40 = v62;
        v69[0] = sub_1D77AF39C(v62, v22, (uint64_t *)aBlock);
        sub_1D77BDB7C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1D77AB000, v33, (os_log_type_t)v61, "ArticleChangeDetector set read state to %s for identifier %s.", (uint8_t *)v36, 0x16u);
        v41 = ObjectType;
        swift_arrayDestroy();
        MEMORY[0x1D829B914](v41, -1, -1);
        MEMORY[0x1D829B914](v36, -1, -1);

        ((void (*)(_BYTE *, uint64_t))v19)(v64, v63);
      }
      else
      {
        v39 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
        v39(v3, v32);

        swift_bridgeObjectRelease_n();
        ((void (*)(_BYTE *, uint64_t))v19)(v31, v63);
        v40 = v62;
      }
      v56 = v67;
      v57 = sub_1D77B1198();
      v58 = (_QWORD *)swift_allocObject();
      v58[2] = v40;
      v58[3] = v22;
      v58[4] = v56;
      aBlock[4] = sub_1D77B2560;
      aBlock[5] = v58;
      aBlock[0] = (id)MEMORY[0x1E0C809B0];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1D77B1DF8;
      aBlock[3] = &block_descriptor;
      v59 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      v56;
      swift_release();
      objc_msgSend(v57, sel_notifyObservers_, v59);
      _Block_release(v59);

      swift_beginAccess();
      v69[0] = v40;
      v69[1] = v22;
      swift_retain();
      sub_1D77BD9FC();
      swift_release();
      v39(v68, v32);
      swift_bridgeObjectRelease();
    }
    else
    {
      v42 = aBlock[0];
      swift_bridgeObjectRelease();
      v43 = (void *)sub_1D77BD6CC();

      swift_willThrow();
      (*(void (**)(_BYTE *, uint64_t))(v0 + 8))(v68, v66);
      v44 = v63;
      sub_1D77BD9A8();
      v45 = v43;
      v46 = v43;
      v47 = sub_1D77BD9B4();
      v48 = sub_1D77BDB28();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = swift_slowAlloc();
        v50 = swift_slowAlloc();
        v69[0] = v50;
        *(_DWORD *)v49 = 136315394;
        v68 = v19;
        aBlock[0] = ObjectType;
        swift_getMetatypeMetadata();
        v51 = sub_1D77BDA8C();
        aBlock[0] = (id)sub_1D77AF39C(v51, v52, v69);
        sub_1D77BDB7C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v49 + 12) = 2080;
        aBlock[0] = v43;
        v53 = v43;
        sub_1D77B0D68();
        v54 = sub_1D77BDA8C();
        aBlock[0] = (id)sub_1D77AF39C(v54, v55, v69);
        sub_1D77BDB7C();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1D77AB000, v47, v48, "[%s]: encountered error while processing notification %s", (uint8_t *)v49, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D829B914](v50, -1, -1);
        MEMORY[0x1D829B914](v49, -1, -1);

        ((void (*)(_BYTE *, uint64_t))v68)(v9, v44);
      }
      else
      {

        ((void (*)(_BYTE *, uint64_t))v19)(v9, v44);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D77B1DF8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id ArticleChangeDetector.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ArticleChangeDetector.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ArticleChangeDetector.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArticleChangeDetector();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1D77B1F84@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_1D77B1FD8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t method lookup function for ArticleChangeDetector()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ArticleChangeDetector.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ArticleChangeDetector.addObserver(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ArticleChangeDetector.removeObserver(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

unint64_t sub_1D77B216C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D77BDBC4();
  return sub_1D77B2200(a1, v2);
}

unint64_t sub_1D77B219C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77BDCA8();
  sub_1D77BDA98();
  v4 = sub_1D77BDCC0();
  return sub_1D77B22C4(a1, a2, v4);
}

unint64_t sub_1D77B2200(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1D77B2704(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D829B4A0](v9, a1);
      sub_1D77B263C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1D77B22C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D77BDC60() & 1) == 0)
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
      while (!v14 && (sub_1D77BDC60() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D77B23A4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  char *v5;
  char v6;
  uint64_t v7;
  _BYTE v8[40];
  __int128 v9;
  __int128 v10;

  v0 = sub_1D77BD690();
  if (v0)
  {
    v1 = v0;
    v7 = sub_1D77BD678();
    sub_1D77BDBDC();
    if (*(_QWORD *)(v1 + 16) && (v2 = sub_1D77B216C((uint64_t)v8), (v3 & 1) != 0))
    {
      sub_1D77AFB44(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v9);
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1D77B263C((uint64_t)v8);
    if (*((_QWORD *)&v10 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
        return v7;
    }
    else
    {
      sub_1D77B2670((uint64_t)&v9);
    }
    sub_1D77B25F8();
    swift_allocError();
    v6 = 1;
  }
  else
  {
    sub_1D77B25F8();
    swift_allocError();
    v6 = 0;
  }
  *v5 = v6;
  return swift_willThrow();
}

id HKArticlesKeyReadState(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("%@_%@"), v2, CFSTR("ArticleReadState"));

  return v3;
}

uint64_t sub_1D77B2534()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1D77B2560(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = (id)sub_1D77BDA74();
  objc_msgSend(a1, sel_readArticleWithIdentifier_detectedBy_, v4, v3);

}

unint64_t sub_1D77B25B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012D168;
  if (!qword_1F012D168)
  {
    v1 = sub_1D77BD6F0();
    result = MEMORY[0x1D829B89C](MEMORY[0x1E0CB08F0], v1);
    atomic_store(result, (unint64_t *)&qword_1F012D168);
  }
  return result;
}

unint64_t sub_1D77B25F8()
{
  unint64_t result;

  result = qword_1F012D170;
  if (!qword_1F012D170)
  {
    result = MEMORY[0x1D829B89C](&unk_1D77BE2B4, &type metadata for ArticleChangeDetector.NotificationUserInfoError);
    atomic_store(result, (unint64_t *)&qword_1F012D170);
  }
  return result;
}

uint64_t sub_1D77B263C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1D77B2670(uint64_t a1)
{
  uint64_t v2;

  sub_1D77B26AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1D77B26AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012D178)
  {
    v0 = sub_1D77BDB70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012D178);
  }
}

uint64_t sub_1D77B2704(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_1D77B2740()
{
  unint64_t result;

  result = qword_1F012D180;
  if (!qword_1F012D180)
  {
    type metadata accessor for ArticleChangeDetector();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012D180);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleChangeDetector.NotificationUserInfoError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleChangeDetector.NotificationUserInfoError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77B2850 + 4 * byte_1D77BE1F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D77B2884 + 4 * byte_1D77BE1F0[v4]))();
}

uint64_t sub_1D77B2884(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77B288C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77B2894);
  return result;
}

uint64_t sub_1D77B28A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77B28A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D77B28AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77B28B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77B28C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D77B28CC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArticleChangeDetector.NotificationUserInfoError()
{
  return &type metadata for ArticleChangeDetector.NotificationUserInfoError;
}

unint64_t sub_1D77B28EC()
{
  unint64_t result;

  result = qword_1F012D188;
  if (!qword_1F012D188)
  {
    result = MEMORY[0x1D829B89C](&unk_1D77BE28C, &type metadata for ArticleChangeDetector.NotificationUserInfoError);
    atomic_store(result, (unint64_t *)&qword_1F012D188);
  }
  return result;
}

_QWORD *sub_1D77B2934(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v4 = sub_1D77BD9C0();
  MEMORY[0x1E0C80A78](v4);
  sub_1D77B2D50(a1, (uint64_t)a2);
  if (v5)
  {
    v6 = v5;
    swift_bridgeObjectRetain();
    v7 = sub_1D77B8168(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v9 = v7[2];
    v8 = v7[3];
    if (v9 >= v8 >> 1)
      v7 = sub_1D77B8168((_QWORD *)(v8 > 1), v9 + 1, 1, v7);
    v7[2] = v9 + 1;
    v10 = &v7[5 * v9];
    v10[4] = v6;
    v10[5] = 0;
    v10[6] = 0;
    v10[7] = 0;
    *((_BYTE *)v10 + 64) = 32;
  }
  else
  {
    v6 = MEMORY[0x1E0DEE9D8];
    v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v11 = sub_1D77B3820(v6, a1, a2);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = sub_1D77B8168(0, v7[2] + 1, 1, v7);
  v13 = v7[2];
  v12 = v7[3];
  if (v13 >= v12 >> 1)
    v7 = sub_1D77B8168((_QWORD *)(v12 > 1), v13 + 1, 1, v7);
  v7[2] = v13 + 1;
  v14 = &v7[5 * v13];
  v14[4] = v11;
  v14[5] = 0;
  v14[6] = 0;
  v14[7] = 0;
  *((_BYTE *)v14 + 64) = 0;
  return v7;
}

uint64_t sub_1D77B2CA8()
{
  return 1;
}

uint64_t sub_1D77B2CB0()
{
  sub_1D77BDCA8();
  sub_1D77BDCB4();
  return sub_1D77BDCC0();
}

uint64_t sub_1D77B2CF0()
{
  return sub_1D77BDCB4();
}

uint64_t sub_1D77B2D14()
{
  sub_1D77BDCA8();
  sub_1D77BDCB4();
  return sub_1D77BDCC0();
}

void sub_1D77B2D50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_t v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  char *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  char v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  _QWORD *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  os_log_t v96;
  id v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120[4];

  v110 = sub_1D77BD6FC();
  v114 = *(_QWORD *)(v110 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v113 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v112 = (char *)&v94 - v7;
  v109 = sub_1D77BD7EC();
  v8 = *(_QWORD *)(v109 - 8);
  v9 = MEMORY[0x1E0C80A78](v109);
  v106 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v108 = (char *)&v94 - v12;
  MEMORY[0x1E0C80A78](v11);
  v111 = (char *)&v94 - v13;
  v14 = sub_1D77BD870();
  v105 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x1E0C80A78](v14);
  v104 = (char *)&v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1D77BD9C0();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x1E0C80A78](v20);
  v99 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v94 - v24;
  sub_1D77BD99C();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v101 = v2;
  v26(v19, v2, a1);
  v27 = sub_1D77BD9B4();
  v28 = sub_1D77BDB34();
  v103 = v28;
  v29 = os_log_type_enabled(v27, v28);
  v102 = a1;
  v107 = a2;
  if (v29)
  {
    v30 = swift_slowAlloc();
    v98 = v14;
    v31 = v30;
    v97 = (id)swift_slowAlloc();
    v120[0] = (uint64_t)v97;
    *(_DWORD *)v31 = 136446466;
    v96 = v27;
    v117 = a1;
    swift_getMetatypeMetadata();
    v32 = sub_1D77BDA8C();
    v117 = sub_1D77AF39C(v32, v33, v120);
    a2 = v107;
    v95 = v21;
    sub_1D77BDB7C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    v94 = v31 + 14;
    v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(v102, a2);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v102);
    v35 = sub_1D77BB644();
    v36 = MEMORY[0x1D829B398](v34, v35);
    v38 = v37;
    swift_bridgeObjectRelease();
    v117 = sub_1D77AF39C(v36, v38, v120);
    sub_1D77BDB7C();
    a1 = v102;
    swift_bridgeObjectRelease();
    v39 = v96;
    _os_log_impl(&dword_1D77AB000, v96, (os_log_type_t)v103, "[%{public}s]: Managed articles: %s", (uint8_t *)v31, 0x16u);
    v40 = v97;
    swift_arrayDestroy();
    MEMORY[0x1D829B914](v40, -1, -1);
    v41 = v31;
    v14 = v98;
    MEMORY[0x1D829B914](v41, -1, -1);

    v42 = *(NSObject **)(v95 + 8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a1);

    v42 = *(NSObject **)(v21 + 8);
  }
  v96 = v42;
  ((void (*)(char *, uint64_t))v42)(v25, v20);
  v43 = v20;
  v44 = v104;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v45 = (void *)sub_1D77BD864();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v44, v14);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(v120, a1, a2);
  __swift_project_boxed_opaque_existential_1(v120, v120[3]);
  v46 = v45;
  v98 = (uint64_t)v45;
  v47 = sub_1D77BD81C();
  v97 = v46;

  v48 = MEMORY[0x1E0DEE9D8];
  v119 = MEMORY[0x1E0DEE9D8];
  v49 = v109;
  v105 = *(_QWORD *)(v47 + 16);
  v100 = v43;
  if (v105)
  {
    v50 = 0;
    v103 = *MEMORY[0x1E0D2D568];
    v104 = (char *)v47;
    v51 = v110;
    while (1)
    {
      if (v50 >= *(_QWORD *)(v47 + 16))
      {
        __break(1u);
        return;
      }
      v52 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v53 = *(_QWORD *)(v8 + 72);
      v54 = v47 + v52 + v53 * v50;
      v55 = v8;
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v111, v54, v49);
      sub_1D77BD720();
      (*(void (**)(char *, _QWORD, uint64_t))(v114 + 104))(v113, v103, v51);
      sub_1D77AFA0C(&qword_1EDA125E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5D0]);
      sub_1D77BDAB0();
      sub_1D77BDAB0();
      if (v117 == v115 && v118 == v116)
        break;
      v58 = sub_1D77BDC60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v59 = *(void (**)(char *, uint64_t))(v114 + 8);
      v60 = v110;
      v59(v113, v110);
      v59(v112, v60);
      if ((v58 & 1) != 0)
        goto LABEL_13;
      v8 = v55;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v111, v49);
      v47 = (uint64_t)v104;
LABEL_7:
      ++v50;
      a2 = v107;
      if (v105 == v50)
      {
        v48 = v119;
        v43 = v100;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease_n();
    v56 = *(void (**)(char *, uint64_t))(v114 + 8);
    v57 = v110;
    v56(v113, v110);
    v56(v112, v57);
LABEL_13:
    v8 = v55;
    v61 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v61(v108, v111, v49);
    v62 = v119;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1D77BA210(0, *(_QWORD *)(v62 + 16) + 1, 1);
      v62 = v119;
    }
    v47 = (uint64_t)v104;
    v64 = *(_QWORD *)(v62 + 16);
    v63 = *(_QWORD *)(v62 + 24);
    if (v64 >= v63 >> 1)
    {
      sub_1D77BA210(v63 > 1, v64 + 1, 1);
      v62 = v119;
    }
    *(_QWORD *)(v62 + 16) = v64 + 1;
    v65 = v62 + v52 + v64 * v53;
    v49 = v109;
    v61((char *)v65, v108, v109);
    v119 = v62;
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
  v66 = *(_QWORD *)(v48 + 16);
  if (v66)
  {
    v120[0] = MEMORY[0x1E0DEE9D8];
    sub_1D77BA1F4(0, v66, 0);
    v67 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v114 = v48;
    v68 = v48 + v67;
    v69 = *(_QWORD *)(v8 + 72);
    v70 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    do
    {
      v71 = v106;
      v70(v106, v68, v49);
      v72 = sub_1D77BD774();
      v74 = v73;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v71, v49);
      v75 = v120[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1D77BA1F4(0, *(_QWORD *)(v75 + 16) + 1, 1);
        v75 = v120[0];
      }
      v77 = *(_QWORD *)(v75 + 16);
      v76 = *(_QWORD *)(v75 + 24);
      if (v77 >= v76 >> 1)
      {
        sub_1D77BA1F4(v76 > 1, v77 + 1, 1);
        v75 = v120[0];
      }
      *(_QWORD *)(v75 + 16) = v77 + 1;
      v78 = v75 + 16 * v77;
      *(_QWORD *)(v78 + 32) = v72;
      *(_QWORD *)(v78 + 40) = v74;
      v68 += v69;
      --v66;
      v49 = v109;
    }
    while (v66);
    swift_release();
    v43 = v100;
    a2 = v107;
  }
  else
  {
    swift_release();
    v75 = MEMORY[0x1E0DEE9D8];
  }
  v79 = sub_1D77BA8E0(v75);
  swift_bridgeObjectRelease();
  v80 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(v102, a2);
  v81 = v97;
  v82 = sub_1D77BACB8(v80);
  swift_bridgeObjectRelease();

  v83 = sub_1D77BA8E0(v82);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v83 + 16) <= *(_QWORD *)(v79 + 16) >> 3)
  {
    v120[0] = v79;
    sub_1D77B852C(v83);
    swift_bridgeObjectRelease();
    v84 = v120[0];
  }
  else
  {
    v84 = sub_1D77B86C0(v83, v79);
    swift_bridgeObjectRelease();
  }
  v85 = v99;
  v86 = sub_1D77B8290(v84);
  swift_bridgeObjectRelease();
  if (v86[2])
  {

  }
  else
  {
    swift_release();
    sub_1D77BD99C();
    v87 = sub_1D77BD9B4();
    v88 = sub_1D77BDB34();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      v90 = swift_slowAlloc();
      v120[0] = v90;
      *(_DWORD *)v89 = 136446210;
      v117 = v102;
      swift_getMetatypeMetadata();
      v91 = sub_1D77BDA8C();
      v117 = sub_1D77AF39C(v91, v92, v120);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77AB000, v87, v88, "[%{public}s]: No invalid feed items to purge.", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v90, -1, -1);
      MEMORY[0x1D829B914](v89, -1, -1);

      v93 = v99;
    }
    else
    {

      v93 = v85;
    }
    ((void (*)(char *, uint64_t))v96)(v93, v43);
  }
}

uint64_t sub_1D77B3820(uint64_t a1, uint64_t a2, char *a3)
{
  char *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t ArticleInformation;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, unint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(char *, unint64_t, uint64_t);
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[4];

  v86 = a1;
  v6 = (_QWORD *)sub_1D77BD870();
  v84 = *(v6 - 1);
  v85 = v6;
  MEMORY[0x1E0C80A78](v6);
  v83 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77AE9B8(0, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v82 = (char *)&v78 - v10;
  v11 = sub_1D77BD7EC();
  v12 = *(_QWORD *)(v11 - 8);
  v89 = v11;
  v90 = v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v88 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v81 = (char *)&v78 - v15;
  sub_1D77AE9B8(0, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, v8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v78 - v17;
  ArticleInformation = type metadata accessor for ReadArticleInformation();
  v20 = *(_QWORD *)(ArticleInformation - 8);
  MEMORY[0x1E0C80A78](ArticleInformation);
  v22 = (uint64_t *)((char *)&v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = v3;
  v24 = (char *)a2;
  (*((void (**)(uint64_t, char *))a3 + 3))(a2, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, ArticleInformation) == 1)
  {
    sub_1D77BAEA8((uint64_t)v18, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation);
    v25 = v83;
    (*((void (**)(char *, char *))a3 + 2))(v24, a3);
    v26 = (void *)sub_1D77BD864();
    (*(void (**)(char *, id))(v84 + 8))(v25, v85);
    v84 = *((_QWORD *)a3 + 4);
    v27 = ((uint64_t (*)(char *, char *))v84)(v24, a3);
    v28 = v26;
    v29 = v87;
    v30 = sub_1D77BACB8(v27);
    v87 = v29;
    swift_bridgeObjectRelease();

    sub_1D77BA8E0(v30);
    swift_bridgeObjectRelease();
    (*((void (**)(_QWORD *__return_ptr, char *, char *))a3 + 1))(v91, v24, a3);
    __swift_project_boxed_opaque_existential_1(v91, v91[3]);
    v31 = sub_1D77BD810();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
    v32 = *(_QWORD *)(v31 + 16);
    v33 = MEMORY[0x1E0DEE9D8];
    v85 = v28;
    if (v32)
    {
      v79 = v26;
      v81 = v24;
      v82 = a3;
      v83 = v23;
      v91[0] = MEMORY[0x1E0DEE9D8];
      sub_1D77BA1F4(0, v32, 0);
      v34 = (*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80);
      v80 = v31;
      v35 = v31 + v34;
      v36 = *(_QWORD *)(v90 + 72);
      v37 = *(void (**)(char *, unint64_t, uint64_t))(v90 + 16);
      do
      {
        v38 = v88;
        v39 = v89;
        v37(v88, v35, v89);
        v40 = sub_1D77BD774();
        v42 = v41;
        (*(void (**)(char *, uint64_t))(v90 + 8))(v38, v39);
        v33 = v91[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1D77BA1F4(0, *(_QWORD *)(v33 + 16) + 1, 1);
          v33 = v91[0];
        }
        v44 = *(_QWORD *)(v33 + 16);
        v43 = *(_QWORD *)(v33 + 24);
        if (v44 >= v43 >> 1)
        {
          sub_1D77BA1F4(v43 > 1, v44 + 1, 1);
          v33 = v91[0];
        }
        *(_QWORD *)(v33 + 16) = v44 + 1;
        v45 = v33 + 16 * v44;
        *(_QWORD *)(v45 + 32) = v40;
        *(_QWORD *)(v45 + 40) = v42;
        v35 += v36;
        --v32;
      }
      while (v32);
      a3 = v82;
      v23 = v83;
      v31 = v80;
      v24 = v81;
      v26 = v79;
    }
    v48 = sub_1D77BA8E0(v33);
    swift_bridgeObjectRelease();
    v49 = sub_1D77B8B28(v86, v48);
    a2 = ((uint64_t (*)(char *, char *))v84)(v24, a3);
    MEMORY[0x1E0C80A78](a2);
    *(&v78 - 4) = (uint64_t)v24;
    *(&v78 - 3) = (uint64_t)a3;
    *(&v78 - 2) = (uint64_t)v26;
    *(&v78 - 1) = (uint64_t)v23;
    v50 = v87;
    v51 = sub_1D77B3FEC((void (*)(uint64_t, uint64_t *))sub_1D77BADE8, (uint64_t)(&v78 - 6), a2);
    v87 = v50;
    if (v50)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      v54 = v51;
      v84 = v49;
      swift_bridgeObjectRelease();
      v55 = *(_QWORD *)(v54 + 16);
      v56 = MEMORY[0x1E0DEE9D8];
      v86 = v54;
      if (v55)
      {
        v80 = v31;
        v81 = v24;
        v82 = a3;
        v83 = v23;
        v91[0] = MEMORY[0x1E0DEE9D8];
        sub_1D77BA1F4(0, v55, 0);
        v57 = v90;
        v58 = v54 + ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80));
        v59 = *(_QWORD *)(v90 + 72);
        v60 = *(void (**)(char *, unint64_t, uint64_t))(v90 + 16);
        do
        {
          v61 = v88;
          v62 = v89;
          v60(v88, v58, v89);
          v63 = sub_1D77BD774();
          v65 = v64;
          (*(void (**)(char *, uint64_t))(v57 + 8))(v61, v62);
          v56 = v91[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1D77BA1F4(0, *(_QWORD *)(v56 + 16) + 1, 1);
            v56 = v91[0];
          }
          v67 = *(_QWORD *)(v56 + 16);
          v66 = *(_QWORD *)(v56 + 24);
          if (v67 >= v66 >> 1)
          {
            sub_1D77BA1F4(v66 > 1, v67 + 1, 1);
            v56 = v91[0];
          }
          *(_QWORD *)(v56 + 16) = v67 + 1;
          v68 = v56 + 16 * v67;
          *(_QWORD *)(v68 + 32) = v63;
          *(_QWORD *)(v68 + 40) = v65;
          v58 += v59;
          --v55;
          v57 = v90;
        }
        while (v55);
        a3 = v82;
        v23 = v83;
        v31 = v80;
        v24 = v81;
      }
      v69 = v85;
      v70 = sub_1D77BA8E0(v56);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v84 + 16) <= *(_QWORD *)(v70 + 16) >> 3)
      {
        v91[0] = v70;
        sub_1D77B852C(v84);
        swift_release();
        v71 = v91[0];
      }
      else
      {
        v71 = sub_1D77B86C0(v84, v70);
        swift_release();
      }
      v75 = sub_1D77B8290(v71);
      v76 = swift_bridgeObjectRelease();
      MEMORY[0x1E0C80A78](v76);
      *(&v78 - 6) = (uint64_t)v24;
      *(&v78 - 5) = (uint64_t)a3;
      *(&v78 - 4) = v86;
      *(&v78 - 3) = v31;
      *(&v78 - 2) = (uint64_t)v23;
      a2 = sub_1D77B69E4((void (*)(_QWORD *))sub_1D77BAE08, (uint64_t)(&v78 - 8), (uint64_t)v75);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
  }
  else
  {
    sub_1D77BAE28((uint64_t)v18, (uint64_t)v22);
    v46 = v82;
    v47 = v87;
    sub_1D77B4144(v22, (_QWORD *)a2, (uint64_t)a3, v82);
    if (v47)
    {
      sub_1D77BAE6C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ReadArticleInformation);
    }
    else
    {
      v53 = v89;
      v52 = v90;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v46, 1, v89) == 1)
      {
        sub_1D77BAEA8((uint64_t)v46, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8]);
        sub_1D77BAE6C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ReadArticleInformation);
        return MEMORY[0x1E0DEE9D8];
      }
      else
      {
        v72 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
        v73 = v81;
        v72(v81, v46, v53);
        sub_1D77AE9B8(0, &qword_1EDA125C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
        v74 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
        a2 = swift_allocObject();
        *(_OWORD *)(a2 + 16) = xmmword_1D77BE310;
        v72((char *)(a2 + v74), v73, v53);
        sub_1D77BAE6C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ReadArticleInformation);
      }
    }
  }
  return a2;
}

uint64_t sub_1D77B3FEC(void (*a1)(uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v16 = a1;
  v17 = a2;
  v15 = sub_1D77BD7EC();
  v6 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = MEMORY[0x1E0DEE9D8];
  if (v9)
  {
    v19 = MEMORY[0x1E0DEE9D8];
    sub_1D77BA210(0, v9, 0);
    v10 = v19;
    for (i = a3 + 32; ; i += 48)
    {
      v16(i, &v18);
      if (v4)
        break;
      v4 = 0;
      v19 = v10;
      v13 = *(_QWORD *)(v10 + 16);
      v12 = *(_QWORD *)(v10 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1D77BA210(v12 > 1, v13 + 1, 1);
        v10 = v19;
      }
      *(_QWORD *)(v10 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v13, v8, v15);
      if (!--v9)
        return v10;
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_1D77B4144@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  int v26;
  uint64_t ArticleInformation;
  char *v28;
  uint64_t v29;
  _QWORD *v30[3];
  char *v31;
  char *v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD v39[5];
  _QWORD v40[6];
  uint64_t v41;

  v33 = a4;
  v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77AE9B8(0, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v32 = (char *)v30 - v9;
  v41 = sub_1D77BD870();
  v38 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77AE9B8(0, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], v7);
  MEMORY[0x1E0C80A78](v12);
  v37 = (char *)v30 - v13;
  v36 = sub_1D77BD7EC();
  v14 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v31 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, uint64_t))(a3 + 8))(v40, a2, a3);
  v35 = v40[4];
  v34 = __swift_project_boxed_opaque_existential_1(v40, v40[3]);
  v30[0] = a1;
  sub_1D77AFE64((uint64_t)a1, (uint64_t)v39);
  __swift_project_boxed_opaque_existential_1(v39, v39[3]);
  v16 = *(void (**)(_QWORD *, uint64_t))(a3 + 16);
  v30[1] = a2;
  v30[2] = (_QWORD *)a3;
  v16(a2, a3);
  v17 = (void *)sub_1D77BD864();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v41);
  sub_1D77BD930();

  v19 = v36;
  v18 = (uint64_t)v37;
  sub_1D77BD804();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v18, 1, v19) == 1)
  {
    sub_1D77BAEA8(v18, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8]);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1D77BAEEC();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 32);
    v22 = (uint64_t)v31;
    v21(v31, v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    v23 = (uint64_t)v32;
    sub_1D77BD7A4();
    v24 = sub_1D77BD8AC();
    v25 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
    v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v23, 1, v24);
    sub_1D77BAEA8(v23, &qword_1EDA124B8, v25);
    if (v26 == 1)
    {
      ArticleInformation = type metadata accessor for ReadArticleInformation();
      sub_1D77BAA68(v22, (uint64_t)v30[0] + *(int *)(ArticleInformation + 20), v30[0]);
      v28 = v33;
      v21(v33, v22, v19);
      v29 = 0;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v22, v19);
      v29 = 1;
      v28 = v33;
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v28, v29, 1, v19);
  }
}

uint64_t sub_1D77B44E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t result;

  v10 = sub_1D77B4574(a2, a3, a4);
  static PluginFeedItem.makeArticleFeedItemWithMetadata(article:sourceProfile:pluginFeedItemConstructor:)(a1, (void (*)(uint64_t, uint64_t, char *))v10, v11, a6);
  result = swift_release();
  if (v6)
    *a5 = v6;
  return result;
}

uint64_t (*sub_1D77B4574(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return sub_1D77BB73C;
}

uint64_t sub_1D77B4630@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t, uint64_t);
  char v63;
  void (*v64)(uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  void (*v83)(char *, unint64_t, uint64_t);
  uint64_t v84;

  v8 = v7;
  v79 = a5;
  v80 = a3;
  v14 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77AE9B8(0, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v15);
  v75 = (char *)&v68 - v16;
  sub_1D77AE9B8(0, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], v14);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v68 - v18;
  v20 = sub_1D77BD7EC();
  v21 = MEMORY[0x1E0C80A78](a2);
  v82 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v21);
  v24 = MEMORY[0x1E0C80A78](v23);
  v25 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v68 - v26;
  v28 = MEMORY[0x1E0C80A78](v25);
  v30 = (char *)&v68 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v81 = (char *)&v68 - v35;
  v36 = *(_QWORD *)(v31 + 16);
  if (!v36)
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(a7, 1, 1, v20);
  v73 = a6;
  v74 = v30;
  v68 = v34;
  v69 = v19;
  v72 = a4;
  v76 = a7;
  v77 = v8;
  v37 = *a1;
  v38 = a1[1];
  v39 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v70 = v33;
  v71 = v39;
  v40 = v31 + v39;
  v41 = *(_QWORD *)(v32 + 72);
  v84 = v32;
  v83 = *(void (**)(char *, unint64_t, uint64_t))(v32 + 16);
  v78 = v31;
  swift_bridgeObjectRetain();
  while (1)
  {
    v83(v27, v40, v20);
    if (sub_1D77BD774() == v37 && v42 == v38)
      break;
    v43 = sub_1D77BDC60();
    swift_bridgeObjectRelease();
    if ((v43 & 1) != 0)
      goto LABEL_10;
    (*(void (**)(char *, uint64_t))(v84 + 8))(v27, v20);
    v40 += v41;
    if (!--v36)
    {
      swift_bridgeObjectRelease();
      a7 = v76;
      v32 = v84;
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(a7, 1, 1, v20);
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  v45 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
  v46 = v74;
  v45(v74, v27, v20);
  v45(v81, v46, v20);
  v47 = *(_QWORD *)(v80 + 16);
  v48 = v82;
  if (v47)
  {
    v49 = v80 + v71;
    swift_bridgeObjectRetain();
    while (1)
    {
      v83(v48, v49, v20);
      if (sub_1D77BD774() == v37 && v50 == v38)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      v51 = sub_1D77BDC60();
      swift_bridgeObjectRelease();
      if ((v51 & 1) != 0)
        break;
      v48 = v82;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v82, v20);
      v49 += v41;
      if (!--v47)
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    v48 = v82;
LABEL_20:
    swift_bridgeObjectRelease();
    v54 = v68;
    v45(v68, v48, v20);
    v55 = v70;
    v45(v70, v54, v20);
    v56 = (uint64_t)v69;
    sub_1D77BD7A4();
    v57 = sub_1D77BD8AC();
    v58 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
    LODWORD(v54) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 48))(v56, 1, v57);
    sub_1D77BAEA8(v56, &qword_1EDA124B8, v58);
    v59 = (uint64_t)v81;
    if ((_DWORD)v54 == 1)
      sub_1D77B4B68((uint64_t)v81, v79, v73);
    v60 = (uint64_t)v75;
    v83(v75, (unint64_t)v55, v20);
    v61 = v84;
    v62 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
    v62((char *)v60, 0, 1, v20);
    v63 = sub_1D77B5720(v60);
    sub_1D77BAEA8(v60, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8]);
    v64 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v64((uint64_t)v55, v20);
    if ((v63 & 1) != 0)
    {
      v64(v59, v20);
      v65 = v76;
      v66 = 1;
    }
    else
    {
      v67 = v76;
      v45(v76, (char *)v59, v20);
      v65 = v67;
      v66 = 0;
    }
    return v62(v65, v66, 1, v20);
  }
  else
  {
LABEL_17:
    v52 = (uint64_t)v81;
    sub_1D77B4B68((uint64_t)v81, v79, v73);
    v53 = v76;
    v45(v76, (char *)v52, v20);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v84 + 56))(v53, 0, 1, v20);
  }
}

void sub_1D77B4B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  uint64_t v45;
  char *v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _OWORD v83[4];

  v6 = sub_1D77BD9C0();
  v76 = *(_QWORD *)(v6 - 8);
  v77 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v66 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v67 = (char *)&v66 - v12;
  MEMORY[0x1E0C80A78](v11);
  v69 = (char *)&v66 - v13;
  sub_1D77AE9B8(0, (unint64_t *)&qword_1EDA124B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v66 - v15;
  v74 = sub_1D77BD6F0();
  v73 = *(_QWORD *)(v74 - 8);
  v17 = MEMORY[0x1E0C80A78](v74);
  v68 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v71 = (uint64_t)&v66 - v19;
  v72 = sub_1D77BD774();
  v21 = v20;
  v22 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 40);
  v75 = a2;
  v70 = a3;
  v23 = (void *)v22(a2, a3);
  sub_1D77BD774();
  v24 = (void *)sub_1D77BDA74();
  swift_bridgeObjectRelease();
  v25 = HKArticlesKeyReadState(v24);

  if (!v25)
  {
    __break(1u);
    return;
  }
  sub_1D77BDA80();

  sub_1D77BDB40();
  swift_bridgeObjectRelease();
  v26 = v73;
  v27 = v74;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48))(v16, 1, v74) == 1)
  {
    sub_1D77BAEA8((uint64_t)v16, (unint64_t *)&qword_1EDA124B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1D77BD99C();
    swift_bridgeObjectRetain();
    v28 = sub_1D77BD9B4();
    v29 = sub_1D77BDB28();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      *(_QWORD *)&v83[0] = v31;
      *(_DWORD *)v30 = 136315394;
      *(_QWORD *)&v80 = v75;
      swift_getMetatypeMetadata();
      v32 = sub_1D77BDA8C();
      *(_QWORD *)&v80 = sub_1D77AF39C(v32, v33, (uint64_t *)v83);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v80 = sub_1D77AF39C(v72, v21, (uint64_t *)v83);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D77AB000, v28, v29, "[%s] Identifier %s is not in the system yet, which means it is has not been read yet", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v31, -1, -1);
      MEMORY[0x1D829B914](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v76 + 8))(v10, v77);
    return;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v71, v16, v27);
  v34 = v75;
  v35 = (*(uint64_t (**)(uint64_t))(v70 + 32))(v75);
  v36 = *(_QWORD *)(v35 + 16);
  if (v36)
  {
    v37 = v35 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1D77AFE64(v37, (uint64_t)&v78);
      __swift_project_boxed_opaque_existential_1(&v78, v79);
      v38 = (void *)sub_1D77BD744();
      v39 = sub_1D77BD930();
      v41 = v40;

      if (v39 == sub_1D77BD774() && v41 == v42)
        break;
      v44 = sub_1D77BDC60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v44 & 1) != 0)
        goto LABEL_23;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
      v37 += 48;
      if (!--v36)
      {
        swift_bridgeObjectRelease();
        v34 = v75;
        v27 = v74;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_23:
    v46 = v68;
    swift_bridgeObjectRelease();
    sub_1D77AFEDC(&v78, &v80);
    swift_bridgeObjectRelease();
    v34 = v75;
    v27 = v74;
    v45 = v73;
    if (!*((_QWORD *)&v81 + 1))
      goto LABEL_24;
LABEL_15:
    sub_1D77AFEDC(&v80, v83);
    sub_1D77BD99C();
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v46, v71, v27);
    swift_bridgeObjectRetain();
    v47 = v46;
    v48 = sub_1D77BD9B4();
    v49 = sub_1D77BDB34();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc();
      v73 = swift_slowAlloc();
      *(_QWORD *)&v80 = v73;
      *(_DWORD *)v50 = 136315650;
      *(_QWORD *)&v78 = v34;
      swift_getMetatypeMetadata();
      v51 = sub_1D77BDA8C();
      *(_QWORD *)&v78 = sub_1D77AF39C(v51, v52, (uint64_t *)&v80);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      sub_1D77AFA0C((unint64_t *)&qword_1F012D168, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
      v53 = sub_1D77BDC48();
      *(_QWORD *)&v78 = sub_1D77AF39C(v53, v54, (uint64_t *)&v80);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      v55 = *(void (**)(char *, uint64_t))(v45 + 8);
      v55(v47, v74);
      *(_WORD *)(v50 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v78 = sub_1D77AF39C(v72, v21, (uint64_t *)&v80);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D77AB000, v48, v49, "[%s] Adding read date of %s to article %s", (uint8_t *)v50, 0x20u);
      v56 = v73;
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v56, -1, -1);
      v57 = v50;
      v27 = v74;
      MEMORY[0x1D829B914](v57, -1, -1);

    }
    else
    {
      v55 = *(void (**)(char *, uint64_t))(v45 + 8);
      v55(v47, v27);

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v76 + 8))(v69, v77);
    v58 = v71;
    sub_1D77BAA68(a1, v71, v83);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
    v55((char *)v58, v27);
    return;
  }
LABEL_14:
  v81 = 0u;
  v82 = 0u;
  v80 = 0u;
  swift_bridgeObjectRelease();
  v45 = v73;
  v46 = v68;
  if (*((_QWORD *)&v81 + 1))
    goto LABEL_15;
LABEL_24:
  sub_1D77BAEA8((uint64_t)&v80, &qword_1F012D1B0, (uint64_t (*)(uint64_t))sub_1D77BB644);
  v59 = v67;
  sub_1D77BD99C();
  swift_bridgeObjectRetain();
  v60 = sub_1D77BD9B4();
  v61 = sub_1D77BDB28();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    *(_QWORD *)&v83[0] = v63;
    *(_DWORD *)v62 = 136315394;
    *(_QWORD *)&v80 = v34;
    swift_getMetatypeMetadata();
    v64 = sub_1D77BDA8C();
    *(_QWORD *)&v80 = sub_1D77AF39C(v64, v65, (uint64_t *)v83);
    sub_1D77BDB7C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v80 = sub_1D77AF39C(v72, v21, (uint64_t *)v83);
    sub_1D77BDB7C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D77AB000, v60, v61, "[%s] Identifier %s is not a managed article", (uint8_t *)v62, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D829B914](v63, -1, -1);
    MEMORY[0x1D829B914](v62, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v76 + 8))(v59, v77);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v71, v74);
}

uint64_t sub_1D77B5720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void (*v86)(char *, uint64_t);
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  void (*v104)(char *, char *, uint64_t);
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  char v114;
  char v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t);
  int v128;
  void (*v129)(char *, char *, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t);
  uint64_t v133;
  char *v134;
  uint64_t (*v135)(uint64_t);
  void (*v136)(char *, uint64_t);
  void (*v137)(char *, uint64_t);
  uint64_t v138;
  void (*v139)(char *, char *, uint64_t);
  char v140;
  void (*v141)(char *, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  char v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(char *, char *, uint64_t);
  char v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void (*v181)(char *, uint64_t, uint64_t);
  uint64_t v182;
  char *v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  char *v192;
  char *v193;
  char *v194;
  char *v195;
  char *v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;

  v197 = a1;
  v176 = sub_1D77BD6FC();
  v172 = *(_QWORD *)(v176 - 8);
  v1 = MEMORY[0x1E0C80A78](v176);
  v174 = (char *)&v168 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v175 = (char *)&v168 - v3;
  v4 = sub_1D77BD8AC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
  v177 = v4;
  v180 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v171 = (char *)&v168 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77BB0AC();
  v8 = v7;
  MEMORY[0x1E0C80A78](v7);
  v182 = (uint64_t)&v168 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77AE9B8(0, &qword_1EDA124B8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v12 = MEMORY[0x1E0C80A78](v11);
  v173 = (uint64_t)&v168 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v178 = (uint64_t)&v168 - v15;
  MEMORY[0x1E0C80A78](v14);
  v179 = (uint64_t)&v168 - v16;
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8];
  sub_1D77AE9B8(0, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], v10);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v168 - v19;
  v21 = sub_1D77BD7EC();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v168 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v23);
  v184 = (char *)&v168 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v192 = (char *)&v168 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v190 = (char *)&v168 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v191 = (char *)&v168 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v186 = (char *)&v168 - v35;
  v36 = MEMORY[0x1E0C80A78](v34);
  v187 = (char *)&v168 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v196 = (char *)&v168 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v183 = (char *)&v168 - v41;
  v42 = MEMORY[0x1E0C80A78](v40);
  v185 = (char *)&v168 - v43;
  v44 = MEMORY[0x1E0C80A78](v42);
  v194 = (char *)&v168 - v45;
  v46 = MEMORY[0x1E0C80A78](v44);
  v193 = (char *)&v168 - v47;
  v48 = MEMORY[0x1E0C80A78](v46);
  v195 = (char *)&v168 - v49;
  v50 = MEMORY[0x1E0C80A78](v48);
  v188 = (char *)&v168 - v51;
  v52 = MEMORY[0x1E0C80A78](v50);
  v189 = (char *)&v168 - v53;
  v54 = MEMORY[0x1E0C80A78](v52);
  v56 = (char *)&v168 - v55;
  v57 = MEMORY[0x1E0C80A78](v54);
  v59 = (char *)&v168 - v58;
  MEMORY[0x1E0C80A78](v57);
  v61 = (char *)&v168 - v60;
  sub_1D77BB124(v197, (uint64_t)v20, &qword_1EDA124C0, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) != 1)
  {
    v197 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v61, v20, v21);
    v63 = sub_1D77BD774();
    v65 = v64;
    v67 = v61;
    if (v63 == sub_1D77BD774() && v65 == v66)
      v68 = 1;
    else
      v68 = sub_1D77BDC60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v69 = v197;
    v70 = *(void (**)(char *, uint64_t, uint64_t))(v197 + 16);
    v70(v59, (uint64_t)v198, v21);
    v70(v56, (uint64_t)v67, v21);
    v181 = v70;
    v170 = v25;
    v169 = v8;
    if ((v68 & 1) != 0)
    {
      v71 = sub_1D77BD750();
      v168 = v67;
      v73 = v72;
      v75 = v74;
      v76 = sub_1D77BD750();
      v78 = v77;
      v80 = v79;
      v81 = MEMORY[0x1D829AFD8](v71, v73, v75, v76, v77, v79);
      v82 = v76;
      v70 = v181;
      v83 = v78;
      v69 = v197;
      sub_1D77BB62C(v82, v83, v80);
      v84 = v73;
      v67 = v168;
      sub_1D77BB62C(v71, v84, v75);
    }
    else
    {
      v81 = 0;
    }
    v85 = v196;
    v86 = *(void (**)(char *, uint64_t))(v69 + 8);
    v86(v56, v21);
    v86(v59, v21);
    v87 = v189;
    v70(v189, (uint64_t)v198, v21);
    v88 = v188;
    v70(v188, (uint64_t)v67, v21);
    if ((v81 & 1) != 0)
    {
      v89 = v67;
      v90 = sub_1D77BD7E0();
      v92 = v91;
      v94 = sub_1D77BD7E0();
      v95 = v93;
      v96 = v93 >> 60;
      if (v92 >> 60 == 15)
      {
        v86(v88, v21);
        v86(v87, v21);
        if (v96 > 0xE)
        {
          sub_1D77BB17C(v90, v92);
          v97 = (void (*)(char *, char *, uint64_t))v181;
          v181(v195, (uint64_t)v198, v21);
          v98 = v193;
          v67 = v89;
          v97(v193, v89, v21);
          v99 = v192;
LABEL_31:
          v117 = v179;
          sub_1D77BD7A4();
          v118 = v178;
          sub_1D77BD7A4();
          v119 = v182;
          v120 = v182 + *(int *)(v169 + 48);
          v121 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
          sub_1D77BB124(v117, v182, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068]);
          v197 = v120;
          v122 = v120;
          v123 = v119;
          sub_1D77BB124(v118, v122, &qword_1EDA124B8, v121);
          v124 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v180 + 48);
          v125 = v177;
          if (v124(v123, 1, v177) == 1)
          {
            v126 = v118;
            v127 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
            sub_1D77BAEA8(v126, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068]);
            sub_1D77BAEA8(v117, &qword_1EDA124B8, v127);
            v86(v98, v21);
            v86(v195, v21);
            v128 = v124(v197, 1, v125);
            v85 = v196;
            if (v128 == 1)
            {
              sub_1D77BAEA8(v182, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068]);
              v129 = (void (*)(char *, char *, uint64_t))v181;
              v181(v194, (uint64_t)v198, v21);
              v102 = v185;
              v129(v185, v67, v21);
              goto LABEL_38;
            }
          }
          else
          {
            v130 = v173;
            sub_1D77BB124(v123, v173, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068]);
            v131 = v197;
            if (v124(v197, 1, v125) != 1)
            {
              v133 = v180;
              v134 = v171;
              (*(void (**)(char *, uint64_t, uint64_t))(v180 + 32))(v171, v131, v125);
              v135 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
              sub_1D77AFA0C(&qword_1F012D1A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], MEMORY[0x1E0D2E080]);
              LODWORD(v197) = sub_1D77BDA68();
              v136 = *(void (**)(char *, uint64_t))(v133 + 8);
              v136(v134, v125);
              sub_1D77BAEA8(v178, &qword_1EDA124B8, v135);
              sub_1D77BAEA8(v179, &qword_1EDA124B8, v135);
              v86(v193, v21);
              v86(v195, v21);
              v136((char *)v130, v125);
              sub_1D77BAEA8(v182, &qword_1EDA124B8, v135);
              v103 = v194;
              v104 = (void (*)(char *, char *, uint64_t))v181;
              v181(v194, (uint64_t)v198, v21);
              v102 = v185;
              v104(v185, v67, v21);
              v85 = v196;
              if ((v197 & 1) != 0)
              {
LABEL_38:
                sub_1D77BD720();
                sub_1D77BD720();
                sub_1D77AFA0C(&qword_1EDA125E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5D0]);
                sub_1D77BDAB0();
                sub_1D77BDAB0();
                if (v201 == v199 && v202 == v200)
                {
                  swift_bridgeObjectRelease_n();
                  v137 = *(void (**)(char *, uint64_t))(v172 + 8);
                  v138 = v176;
                  v137(v174, v176);
                  v137(v175, v138);
                  v86(v102, v21);
                  v86(v194, v21);
                  v105 = v183;
                  v139 = (void (*)(char *, char *, uint64_t))v181;
                  v181(v183, (uint64_t)v198, v21);
                  v139(v85, v67, v21);
                  v106 = v184;
                  v107 = v192;
                  goto LABEL_42;
                }
                v140 = sub_1D77BDC60();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v141 = *(void (**)(char *, uint64_t))(v172 + 8);
                v142 = v176;
                v141(v174, v176);
                v141(v175, v142);
                v86(v102, v21);
                v86(v194, v21);
                v105 = v183;
                v104 = (void (*)(char *, char *, uint64_t))v181;
                v181(v183, (uint64_t)v198, v21);
                v104(v85, v67, v21);
                v106 = v184;
                v107 = v192;
                if ((v140 & 1) != 0)
                {
LABEL_42:
                  v143 = sub_1D77BD780();
                  v144 = sub_1D77BD780();
                  sub_1D77B6C74(v143, v144);
                  v146 = v145;
                  swift_bridgeObjectRelease();
                  v104 = (void (*)(char *, char *, uint64_t))v181;
                  swift_bridgeObjectRelease();
                  v86(v85, v21);
                  v86(v105, v21);
                  v108 = v187;
                  v104(v187, v198, v21);
                  v109 = v186;
                  v104(v186, v67, v21);
                  if ((v146 & 1) != 0)
                  {
                    v147 = sub_1D77BD7C8();
                    v148 = sub_1D77BD7C8();
                    v149 = sub_1D77B6F78(v147, v148);
                    swift_bridgeObjectRelease();
                    v104 = (void (*)(char *, char *, uint64_t))v181;
                    swift_bridgeObjectRelease();
                    v86(v109, v21);
                    v86(v108, v21);
                    v110 = v191;
                    v104(v191, v198, v21);
                    v111 = v190;
                    v104(v190, v67, v21);
                    if ((v149 & 1) != 0)
                    {
                      v150 = v110;
                      v151 = sub_1D77BD75C();
                      v153 = v152;
                      v154 = sub_1D77BD75C();
                      v156 = v155;
                      if (v153)
                      {
                        if (v155)
                        {
                          if (v151 == v154 && v153 == v155)
                          {
                            swift_bridgeObjectRelease();
                            v86(v190, v21);
                            v86(v191, v21);
                            swift_bridgeObjectRelease();
LABEL_51:
                            v157 = (void (*)(char *, char *, uint64_t))v181;
                            v181(v107, (uint64_t)v198, v21);
                            v157(v106, v67, v21);
LABEL_55:
                            v159 = sub_1D77BD798();
                            v161 = v160;
                            v162 = sub_1D77BD798();
                            v164 = v163;
                            if (v161)
                            {
                              if (v163)
                              {
                                if (v159 == v162 && v161 == v163)
                                {
                                  swift_bridgeObjectRelease();
                                  v86(v106, v21);
                                  v86(v107, v21);
                                  swift_bridgeObjectRelease();
LABEL_62:
                                  v112 = v170;
                                  v181(v170, (uint64_t)v198, v21);
LABEL_66:
                                  v166 = sub_1D77BD72C();
                                  v167 = sub_1D77BD72C();
                                  v62 = sub_1D77B7218(v166, v167);
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  goto LABEL_28;
                                }
                                v165 = sub_1D77BDC60();
                                swift_bridgeObjectRelease();
                                v86(v106, v21);
                                v86(v107, v21);
                                swift_bridgeObjectRelease();
                                v112 = v170;
                                v181(v170, (uint64_t)v198, v21);
                                v62 = 0;
                                if ((v165 & 1) != 0)
                                  goto LABEL_66;
LABEL_28:
                                v86(v112, v21);
                                v86(v67, v21);
                                return v62 & 1;
                              }
                              swift_bridgeObjectRetain();
                              v86(v106, v21);
                              v86(v107, v21);
                              swift_bridgeObjectRelease_n();
                            }
                            else
                            {
                              v86(v106, v21);
                              v86(v107, v21);
                              if (!v164)
                                goto LABEL_62;
                              swift_bridgeObjectRelease();
                            }
                            v104 = (void (*)(char *, char *, uint64_t))v181;
LABEL_27:
                            v112 = v170;
                            v104(v170, v198, v21);
                            v62 = 0;
                            goto LABEL_28;
                          }
                          v158 = sub_1D77BDC60();
                          swift_bridgeObjectRelease();
                          v86(v190, v21);
                          v86(v191, v21);
                          swift_bridgeObjectRelease();
                          v104 = (void (*)(char *, char *, uint64_t))v181;
                          v181(v107, (uint64_t)v198, v21);
                          v104(v106, v67, v21);
                          if ((v158 & 1) != 0)
                            goto LABEL_55;
LABEL_26:
                          v86(v106, v21);
                          v86(v107, v21);
                          goto LABEL_27;
                        }
                        swift_bridgeObjectRetain();
                        v86(v190, v21);
                        v86(v191, v21);
                        swift_bridgeObjectRelease_n();
                      }
                      else
                      {
                        v86(v111, v21);
                        v86(v150, v21);
                        if (!v156)
                          goto LABEL_51;
                        swift_bridgeObjectRelease();
                      }
                      v104 = (void (*)(char *, char *, uint64_t))v181;
                      v181(v107, (uint64_t)v198, v21);
LABEL_25:
                      v104(v106, v67, v21);
                      goto LABEL_26;
                    }
LABEL_24:
                    v86(v111, v21);
                    v86(v110, v21);
                    v104(v107, v198, v21);
                    goto LABEL_25;
                  }
LABEL_23:
                  v86(v109, v21);
                  v86(v108, v21);
                  v110 = v191;
                  v104(v191, v198, v21);
                  v111 = v190;
                  v104(v190, v67, v21);
                  goto LABEL_24;
                }
LABEL_22:
                v86(v85, v21);
                v86(v105, v21);
                v108 = v187;
                v104(v187, v198, v21);
                v109 = v186;
                v104(v186, v67, v21);
                goto LABEL_23;
              }
LABEL_21:
              v86(v102, v21);
              v86(v103, v21);
              v105 = v183;
              v104(v183, v198, v21);
              v104(v85, v67, v21);
              v106 = v184;
              v107 = v99;
              goto LABEL_22;
            }
            v132 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068];
            sub_1D77BAEA8(v178, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068]);
            sub_1D77BAEA8(v179, &qword_1EDA124B8, v132);
            v86(v193, v21);
            v86(v195, v21);
            (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v130, v125);
            v85 = v196;
          }
          sub_1D77BAE6C(v182, (uint64_t (*)(_QWORD))sub_1D77BB0AC);
          v70 = v181;
          v101 = v194;
          v181(v194, (uint64_t)v198, v21);
LABEL_20:
          v102 = v185;
          v70(v185, (uint64_t)v67, v21);
          v103 = v101;
          v104 = (void (*)(char *, char *, uint64_t))v70;
          goto LABEL_21;
        }
      }
      else
      {
        if (v93 >> 60 != 15)
        {
          sub_1D77BB618(v90, v92);
          sub_1D77BB3A0(v90, v92);
          v115 = v114;
          sub_1D77BB17C(v94, v95);
          sub_1D77BB17C(v90, v92);
          v86(v88, v21);
          v86(v87, v21);
          sub_1D77BB17C(v90, v92);
          v116 = v195;
          v70 = v181;
          v181(v195, (uint64_t)v198, v21);
          v98 = v193;
          v67 = v89;
          v100 = v116;
          v70(v193, (uint64_t)v67, v21);
          v99 = v192;
          v85 = v196;
          v101 = v194;
          if ((v115 & 1) != 0)
            goto LABEL_31;
LABEL_19:
          v86(v98, v21);
          v86(v100, v21);
          v70(v101, (uint64_t)v198, v21);
          goto LABEL_20;
        }
        sub_1D77BB1D4(v90, v92);
        v86(v88, v21);
        v86(v87, v21);
        sub_1D77BB17C(v90, v92);
      }
      sub_1D77BB17C(v90, v92);
      sub_1D77BB17C(v94, v95);
      v67 = v89;
      v70 = v181;
      v85 = v196;
    }
    else
    {
      v86(v88, v21);
      v86(v87, v21);
    }
    v98 = v193;
    v100 = v195;
    v70(v195, (uint64_t)v198, v21);
    v70(v98, (uint64_t)v67, v21);
    v99 = v192;
    v101 = v194;
    goto LABEL_19;
  }
  sub_1D77BAEA8((uint64_t)v20, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8]);
  v62 = 0;
  return v62 & 1;
}

unint64_t sub_1D77B69E4(void (*a1)(_QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _QWORD v31[2];
  uint64_t v32;

  sub_1D77AE9B8(0, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v26 - v8;
  v10 = sub_1D77BD7EC();
  v32 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v30 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v29 = (char *)v26 - v13;
  v14 = *(_QWORD *)(a3 + 16);
  if (!v14)
    return MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  v26[1] = a3;
  v15 = (uint64_t *)(a3 + 40);
  v16 = MEMORY[0x1E0DEE9D8];
  v27 = v10;
  v28 = a2;
  do
  {
    v17 = *v15;
    v31[0] = *(v15 - 1);
    v31[1] = v17;
    swift_bridgeObjectRetain();
    a1(v31);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16;
    }
    swift_bridgeObjectRelease();
    v18 = v32;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v9, 1, v10) == 1)
    {
      sub_1D77BAEA8((uint64_t)v9, &qword_1EDA124C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8]);
    }
    else
    {
      v19 = a1;
      v20 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      v21 = v29;
      v20(v29, v9, v10);
      v20(v30, v21, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_1D77B7F4C(0, *(_QWORD *)(v16 + 16) + 1, 1, v16);
      v23 = *(_QWORD *)(v16 + 16);
      v22 = *(_QWORD *)(v16 + 24);
      if (v23 >= v22 >> 1)
        v16 = sub_1D77B7F4C(v22 > 1, v23 + 1, 1, v16);
      *(_QWORD *)(v16 + 16) = v23 + 1;
      v24 = v16
          + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))
          + *(_QWORD *)(v32 + 72) * v23;
      v10 = v27;
      v20((char *)v24, v30, v27);
      a1 = v19;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v16;
}

void sub_1D77B6C74(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_1D77BDBAC();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_1D77BA594(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_1D77AF2E4();
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_1D77BDB58();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_1D77BDB64();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_1D77BDB64();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

uint64_t sub_1D77B6F78(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_1D77BDCA8();
    swift_bridgeObjectRetain();
    sub_1D77BDA98();
    v18 = sub_1D77BDCC0();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_1D77BDC60() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_1D77BDC60() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1D77B7218(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  int64_t v21;

  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = 1 << *(_BYTE *)(a1 + 32);
    v5 = -1;
    if (v4 < 64)
      v5 = ~(-1 << v4);
    v21 = (unint64_t)(v4 + 63) >> 6;
    if ((v5 & v3) != 0)
    {
      v6 = __clz(__rbit64(v5 & v3));
LABEL_22:
      v10 = 16 * v6;
      v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v10);
      v12 = *v11;
      v13 = v11[1];
      v14 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v10);
      v16 = *v14;
      v15 = v14[1];
      swift_bridgeObjectRetain();
      sub_1D77BB1D4(v16, v15);
      v17 = sub_1D77B219C(v12, v13);
      v19 = v18;
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        __asm { BR              X8 }
      sub_1D77BB190(v16, v15);
      return 0;
    }
    if ((unint64_t)(v4 + 63) >> 6 > 1)
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = 1;
      if (v7)
        goto LABEL_21;
      v8 = 2;
      if (v21 <= 2)
        return 1;
      v7 = *(_QWORD *)(a1 + 80);
      if (v7)
        goto LABEL_21;
      v8 = 3;
      if (v21 <= 3)
        return 1;
      v7 = *(_QWORD *)(a1 + 88);
      if (v7)
        goto LABEL_21;
      v8 = 4;
      if (v21 <= 4)
        return 1;
      v7 = *(_QWORD *)(a1 + 96);
      if (v7)
      {
LABEL_21:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
        goto LABEL_22;
      }
      v9 = 5;
      if (v21 > 5)
      {
        v7 = *(_QWORD *)(a1 + 104);
        if (v7)
        {
          v8 = 5;
          goto LABEL_21;
        }
        while (1)
        {
          v8 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            JUMPOUT(0x1D77B7C30);
          }
          if (v8 >= v21)
            break;
          v7 = *(_QWORD *)(a1 + 64 + 8 * v8);
          ++v9;
          if (v7)
            goto LABEL_21;
        }
      }
    }
    return 1;
  }
  return 0;
}

void sub_1D77B7CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1D77B7D44(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1D77B7F28);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_1D77B7F4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1D77AE9B8(0, &qword_1EDA125C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = *(_QWORD *)(sub_1D77BD7EC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1D77BDC30();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1D77BD7EC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1D77BAF94(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_1D77B8168(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      sub_1D77BB6A0(0, &qword_1EDA125C8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1D77BA974(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1D77B8290(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1D77BB6A0(0, &qword_1EDA125D8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1D77BA6E4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1D77BAF30();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1D77B8380(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1D77BDCA8();
  swift_bridgeObjectRetain();
  sub_1D77BDA98();
  v8 = sub_1D77BDCC0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1D77BDC60() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1D77BDC60() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1D77BA05C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1D77B852C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1D77B8E34(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1D77B86C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  char v28;
  unint64_t v29;
  size_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;

  v2 = a2;
  v42 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v36 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v34 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v35 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v35)
          goto LABEL_47;
        v13 = *(_QWORD *)(v36 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v35)
            goto LABEL_47;
          v13 = *(_QWORD *)(v36 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v35)
              goto LABEL_47;
            v13 = *(_QWORD *)(v36 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v35)
                goto LABEL_47;
              v13 = *(_QWORD *)(v36 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v35)
                {
LABEL_47:
                  sub_1D77BAF30();
                  return v2;
                }
                v13 = *(_QWORD *)(v36 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v35)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v36 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1D77BDCA8();
      swift_bridgeObjectRetain();
      sub_1D77BDA98();
      v19 = sub_1D77BDCC0();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1D77BDC60() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v37 = a1;
      v38 = v36;
      v39 = v34;
      v40 = v9;
      v41 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1D77BDC60() & 1) == 0);
      v37 = a1;
      v38 = v36;
      v39 = v34;
      v40 = v9;
      v41 = v7;
      swift_bridgeObjectRelease();
    }
    v28 = *(_BYTE *)(v2 + 32);
    v29 = (unint64_t)((1 << v28) + 63) >> 6;
    v30 = 8 * v29;
    if ((v28 & 0x3Fu) < 0xE || swift_stdlib_isStackAllocationSafe())
    {
      MEMORY[0x1E0C80A78]();
      memcpy((char *)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v30);
      v31 = sub_1D77B9298((uint64_t)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), v29, v2, v21, &v37);
      swift_release();
      sub_1D77BAF30();
    }
    else
    {
      v32 = (void *)swift_slowAlloc();
      memcpy(v32, (const void *)(v2 + 56), v30);
      v31 = sub_1D77B9298((uint64_t)v32, v29, v2, v21, &v37);
      swift_release();
      sub_1D77BAF30();
      MEMORY[0x1D829B914](v32, -1, -1);
    }
    return v31;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1D77B8B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t isStackAllocationSafe;
  char v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v26 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v25[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_1D77BDCA8();
      swift_bridgeObjectRetain();
      sub_1D77BDA98();
      v9 = sub_1D77BDCC0();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1D77BDC60() & 1) != 0)
        {
          isStackAllocationSafe = swift_bridgeObjectRelease();
          v27 = v5;
LABEL_19:
          v19 = *(_BYTE *)(v2 + 32);
          v20 = (unint64_t)((1 << v19) + 63) >> 6;
          v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
          {
            MEMORY[0x1E0C80A78](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            v22 = sub_1D77B958C((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            v22 = sub_1D77B958C((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1D829B914](v23, -1, -1);
          }
          return v22;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1D77BDC60() & 1) != 0)
          {
            v27 = v5;
            isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1D77B8E34(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1D77BDCA8();
  swift_bridgeObjectRetain();
  sub_1D77BDA98();
  v6 = sub_1D77BDCC0();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1D77BDC60() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1D77BDC60() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1D77B9A44();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1D77B9E98(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1D77B8FC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_1D77BAF38();
  v3 = sub_1D77BDBF4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1D77BDCA8();
      sub_1D77BDA98();
      result = sub_1D77BDCC0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1D77B9298(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1D77B97B4(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1D77BDCA8();
        swift_bridgeObjectRetain();
        sub_1D77BDA98();
        v22 = sub_1D77BDCC0();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1D77BDC60() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1D77BDC60() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1D77B958C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1D77B97B4(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_29;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1D77BDCA8();
    swift_bridgeObjectRetain();
    sub_1D77BDA98();
    v14 = sub_1D77BDCC0();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_4;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1D77BDC60() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1D77BDC60() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    result = swift_bridgeObjectRelease();
LABEL_15:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_30;
      --v31;
      if (!v23)
        return MEMORY[0x1E0DEE9E8];
    }
LABEL_5:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1D77B97B4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_1D77BAF38();
  result = sub_1D77BDC00();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_1D77BDCA8();
    swift_bridgeObjectRetain();
    sub_1D77BDA98();
    result = sub_1D77BDCC0();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_1D77B9A44()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1D77BAF38();
  v2 = *v0;
  v3 = sub_1D77BDBE8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1D77B9BF0()
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
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_1D77BAF38();
  v3 = sub_1D77BDBF4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1D77BDCA8();
    swift_bridgeObjectRetain();
    sub_1D77BDA98();
    result = sub_1D77BDCC0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1D77B9E98(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1D77BDB94();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1D77BDCA8();
        swift_bridgeObjectRetain();
        sub_1D77BDA98();
        v10 = sub_1D77BDCC0();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1D77BA05C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1D77B8FC0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1D77B9A44();
      goto LABEL_22;
    }
    sub_1D77B9BF0();
  }
  v11 = *v4;
  sub_1D77BDCA8();
  sub_1D77BDA98();
  result = sub_1D77BDCC0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1D77BDC60(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1D77BDC6C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1D77BDC60();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_1D77BA1F4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1D77BA22C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1D77BA210(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1D77BA3A0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1D77BA22C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1D77BB6A0(0, &qword_1EDA125D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1D77BDC3C();
  __break(1u);
  return result;
}

uint64_t sub_1D77BA3A0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1D77AE9B8(0, &qword_1EDA125C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D8C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = *(_QWORD *)(sub_1D77BD7EC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1D77BD7EC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1D77BDC3C();
  __break(1u);
  return result;
}

void sub_1D77BA594(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_1D77BDBA0())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_1D77BDBB8();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1D77BA6E4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1D77BA8E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1D77BDB04();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1D77B8380(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1D77BA974(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1D77BDC3C();
  __break(1u);
  return result;
}

uint64_t sub_1D77BAA68(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a2;
  v21 = a1;
  v4 = sub_1D77BD6F0();
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D77BD66C();
  MEMORY[0x1E0C80A78](v7);
  sub_1D77AE9B8(0, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - v9;
  v11 = sub_1D77BD87C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1D77BD888();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0D2DE28], v11);
  sub_1D77BD894();
  sub_1D77BD738();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v6, v24, v23);
  sub_1D77BD660();
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  sub_1D77BD918();
  sub_1D77BD8A0();
  v19 = sub_1D77BD8AC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v10, 0, 1, v19);
  return sub_1D77BD7B0();
}

uint64_t sub_1D77BACB8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1D77BA1F4(0, v1, 0);
    v2 = v12;
    v4 = a1 + 72;
    do
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 - 40), *(_QWORD *)(v4 - 16));
      v5 = sub_1D77BD930();
      v7 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_1D77BA1F4(0, *(_QWORD *)(v12 + 16) + 1, 1);
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_1D77BA1F4(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v7;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1D77BADE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  return sub_1D77B44E4(a1, v3[5], v3[2], v3[3], a2, a3);
}

uint64_t sub_1D77BAE08@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_1D77B4630(a1, v2[4], v2[5], v2[6], v2[2], v2[3], a2);
}

uint64_t sub_1D77BAE28(uint64_t a1, uint64_t a2)
{
  uint64_t ArticleInformation;

  ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ArticleInformation - 8) + 32))(a2, a1, ArticleInformation);
  return a2;
}

uint64_t sub_1D77BAE6C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D77BAEA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1D77AE9B8(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1D77BAEEC()
{
  unint64_t result;

  result = qword_1F012D190;
  if (!qword_1F012D190)
  {
    result = MEMORY[0x1D829B89C](&unk_1D77BE3C4, &type metadata for GenerationError);
    atomic_store(result, (unint64_t *)&qword_1F012D190);
  }
  return result;
}

uint64_t sub_1D77BAF30()
{
  return swift_release();
}

void sub_1D77BAF38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012D198)
  {
    v0 = sub_1D77BDC0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012D198);
  }
}

uint64_t sub_1D77BAF94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1D77BD7EC() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1D77BDC3C();
  __break(1u);
  return result;
}

void sub_1D77BB0AC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F012D1A0)
  {
    sub_1D77AE9B8(255, &qword_1EDA124B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F012D1A0);
  }
}

uint64_t sub_1D77BB124(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D77AE9B8(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1D77BB17C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1D77BB190(a1, a2);
  return a1;
}

uint64_t sub_1D77BB190(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D77BB1D4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1D77BB218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1D77B7CE4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1D77BB2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1D77BD6A8();
  v11 = result;
  if (result)
  {
    result = sub_1D77BD6C0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1D77BD6B4();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1D77B7CE4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1D77BB3A0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1D77BB3EC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1D77BB420 + *((int *)qword_1D77BB5F8 + (v0 >> 62))))();
}

uint64_t sub_1D77BB430@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_1D77BB618(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1D77BB1D4(a1, a2);
  return a1;
}

uint64_t sub_1D77BB62C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 5u)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_1D77BB644()
{
  unint64_t result;

  result = qword_1EDA124D8[0];
  if (!qword_1EDA124D8[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EDA124D8);
  }
  return result;
}

void sub_1D77BB6A0(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1D77BDC54();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1D77BB6E4()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1D77BB73C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 48))();
}

uint64_t getEnumTagSinglePayload for GenerationError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GenerationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D77BB804 + 4 * byte_1D77BE320[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D77BB824 + 4 * byte_1D77BE325[v4]))();
}

_BYTE *sub_1D77BB804(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D77BB824(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77BB82C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77BB834(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77BB83C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77BB844(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1D77BB850()
{
  return 0;
}

ValueMetadata *type metadata accessor for GenerationError()
{
  return &type metadata for GenerationError;
}

unint64_t sub_1D77BB86C()
{
  unint64_t result;

  result = qword_1F012D1B8;
  if (!qword_1F012D1B8)
  {
    result = MEMORY[0x1D829B89C](&unk_1D77BE39C, &type metadata for GenerationError);
    atomic_store(result, (unint64_t *)&qword_1F012D1B8);
  }
  return result;
}

uint64_t sub_1D77BB8B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = sub_1D77BD828();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D77BD840();
  __swift_allocate_value_buffer(v4, qword_1EDA125F8);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EDA125F8);
  sub_1D77AE9B8(0, &qword_1EDA125B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v5 = sub_1D77BD6FC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1D77BE310;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v6 + 104))(v8 + v7, *MEMORY[0x1E0D2D568], v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0D2D9D8], v0);
  return sub_1D77BD834();
}

uint64_t static GeneratorDomain.articles.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EDA12728 != -1)
    swift_once();
  v2 = sub_1D77BD840();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EDA125F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t ArticlesGeneratorPipeline.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_1EDA12740;
  v4 = sub_1D77BD840();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1D77BBAB4()
{
  sub_1D77BCC34();
  return swift_retain();
}

uint64_t sub_1D77BBAC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + qword_1EDA12748);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1D77BBB18())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ArticlesGeneratorPipeline.managedArticles.getter()
{
  return swift_bridgeObjectRetain();
}

id ArticlesGeneratorPipeline.articleChangeDetector.getter()
{
  uint64_t v0;

  return *(id *)(v0 + qword_1EDA12738);
}

uint64_t ArticlesGeneratorPipeline.__allocating_init(context:managedArticles:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  ArticlesGeneratorPipeline.init(context:managedArticles:)(a1, a2);
  return v4;
}

uint64_t ArticlesGeneratorPipeline.init(context:managedArticles:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_class *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ArticleInformation;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(unint64_t, uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t result;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  char *v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  objc_super v103;
  _QWORD v104[3];
  uint64_t v105;
  uint64_t v106;

  v98 = a1;
  v4 = *v2;
  sub_1D77BCC78();
  v95 = *(_QWORD *)(v5 - 8);
  v96 = v5;
  MEMORY[0x1E0C80A78](v5);
  v94 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77BCDA8();
  v85 = v7;
  v84 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v83 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77AE9B8(0, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v87 = (char *)&v77 - v10;
  v11 = sub_1D77BD870();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v82 = v13;
  v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77AE9B8(0, &qword_1EDA12588, (uint64_t (*)(uint64_t))sub_1D77BCD54, MEMORY[0x1E0C96098]);
  v89 = *(_QWORD *)(v15 - 8);
  v90 = v15;
  MEMORY[0x1E0C80A78](v15);
  v88 = (char *)&v77 - v16;
  v17 = sub_1D77BD9C0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77BD99C();
  v21 = sub_1D77BD9B4();
  v22 = sub_1D77BDB34();
  v23 = os_log_type_enabled(v21, v22);
  v97 = v11;
  v100 = v12;
  v92 = v4;
  v93 = a2;
  v91 = v14;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = v4;
    v27 = v25;
    v102 = v25;
    *(_DWORD *)v24 = 136446210;
    v104[0] = v26;
    swift_getMetatypeMetadata();
    v28 = sub_1D77BDA8C();
    v104[0] = sub_1D77AF39C(v28, v29, &v102);
    sub_1D77BDB7C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77AB000, v21, v22, "[%{public}s]: Initializing ArticlesGeneratorPipeline", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D829B914](v27, -1, -1);
    MEMORY[0x1D829B914](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (qword_1EDA12728 != -1)
    swift_once();
  v30 = sub_1D77BD840();
  v31 = __swift_project_value_buffer(v30, (uint64_t)qword_1EDA125F8);
  v32 = v99;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v99 + qword_1EDA12740, v31, v30);
  v33 = v98;
  sub_1D77BD84C();
  __swift_project_boxed_opaque_existential_1(v104, v105);
  v34 = (void *)sub_1D77BD7F8();
  v35 = (objc_class *)type metadata accessor for ArticleChangeDetector();
  v36 = (char *)objc_allocWithZone(v35);
  v37 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1D77B143C();
  v81 = v38;
  swift_allocObject();
  v39 = v36;
  *(_QWORD *)&v36[v37] = sub_1D77BDA08();
  *(_QWORD *)&v39[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  v40 = objc_msgSend((id)objc_opt_self(), sel_healthArticlesDefaultsDomainWithHealthStore_, v34);
  *(_QWORD *)&v39[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v40;

  v103.receiver = v39;
  v103.super_class = v35;
  v41 = objc_msgSendSuper2(&v103, sel_init);
  sub_1D77B1500();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  *(_QWORD *)(v32 + qword_1EDA12738) = v41;
  v42 = v93;
  *(_QWORD *)(v32 + qword_1EDA12730) = v93;
  sub_1D77AE9B8(0, &qword_1EDA125D0, (uint64_t (*)(uint64_t))sub_1D77BCCF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1D77BE310;
  v44 = v92;
  v45 = *(_QWORD *)(v92 + 88);
  v80 = *(_QWORD *)(v92 + 80);
  v79 = v45;
  v47 = type metadata accessor for ArticlesGenerator(0, v80, v45, v46);
  v48 = (uint64_t)v91;
  v49 = v33;
  v78 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
  v78(v91, v33, v97);
  ArticleInformation = type metadata accessor for ReadArticleInformation();
  v51 = (uint64_t)v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ArticleInformation - 8) + 56))(v87, 1, 1, ArticleInformation);
  swift_bridgeObjectRetain_n();
  v52 = (char *)v41;
  v53 = ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(v48, v42, v51);
  v105 = v47;
  v106 = MEMORY[0x1D829B89C](&protocol conformance descriptor for ArticlesGenerator<A>, v47);
  v104[0] = v53;
  v54 = sub_1D77BCD54();
  v55 = v88;
  sub_1D77BDA20();
  sub_1D77BCE3C();
  v56 = v90;
  v57 = sub_1D77BDA50();
  (*(void (**)(char *, unint64_t))(v89 + 8))(v55, v56);
  *(_QWORD *)(v43 + 32) = v57;
  v104[0] = v43;
  sub_1D77BDAD4();
  v58 = v104[0];
  v102 = v104[0];
  v59 = sub_1D77BD858();
  v86 = v52;
  if ((v59 & 1) != 0)
  {
    v62 = (uint64_t *)&v52[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher];
    swift_beginAccess();
    v101 = *v62;
    v90 = v54;
    v63 = v97;
    ((void (*)(uint64_t, uint64_t))v78)(v48, v49);
    v64 = v100;
    v65 = (*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80);
    v66 = (v82 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
    v67 = swift_allocObject();
    v68 = v79;
    *(_QWORD *)(v67 + 16) = v80;
    *(_QWORD *)(v67 + 24) = v68;
    v69 = *(void (**)(unint64_t, uint64_t, uint64_t))(v64 + 32);
    v60 = v63;
    v69(v67 + v65, v48, v63);
    *(_QWORD *)(v67 + v66) = v42;
    *(_QWORD *)(v67 + ((v66 + 15) & 0xFFFFFFFFFFFFFFF8)) = v44;
    sub_1D77AFA0C(&qword_1EDA126D0, (uint64_t (*)(uint64_t))sub_1D77B143C, MEMORY[0x1E0C95F48]);
    swift_retain();
    v70 = v83;
    sub_1D77BDA5C();
    swift_release();
    swift_release();
    sub_1D77AFA0C(&qword_1EDA126B0, (uint64_t (*)(uint64_t))sub_1D77BCDA8, MEMORY[0x1E0C95708]);
    v71 = v85;
    sub_1D77BDA50();
    v72 = (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v70, v71);
    MEMORY[0x1D829B38C](v72);
    v61 = v100;
    if (*(_QWORD *)(v102 + 16) >= *(_QWORD *)(v102 + 24) >> 1)
      sub_1D77BDAE0();
    sub_1D77BDAEC();
    sub_1D77BDAD4();
    v58 = v102;
  }
  else
  {
    swift_bridgeObjectRelease();
    v60 = v97;
    v61 = v100;
  }
  v101 = v58;
  sub_1D77BCCF0();
  sub_1D77AE9B8(0, &qword_1EDA125B0, (uint64_t (*)(uint64_t))sub_1D77BCCF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77AFA0C(&qword_1EDA126C0, (uint64_t (*)(uint64_t))sub_1D77BCCF0, MEMORY[0x1E0C95D90]);
  sub_1D77BCF88();
  v73 = v94;
  sub_1D77BD9E4();
  sub_1D77AFA0C(&qword_1EDA126B8, (uint64_t (*)(uint64_t))sub_1D77BCC78, MEMORY[0x1E0C95C80]);
  v74 = v96;
  v75 = sub_1D77BDA50();

  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v98, v60);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v73, v74);
  result = v99;
  *(_QWORD *)(v99 + qword_1EDA12748) = v75;
  return result;
}

uint64_t sub_1D77BC49C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t result;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t ArticleInformation;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69[3];
  _OWORD v70[3];

  v6 = v5;
  v66 = a4;
  v61 = a3;
  sub_1D77AE9B8(0, &qword_1EDA12650, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v52 - v11;
  v58 = sub_1D77BD870();
  v56 = *(_QWORD *)(v58 - 8);
  MEMORY[0x1E0C80A78](v58);
  v59 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArticleInformation = type metadata accessor for ReadArticleInformation();
  v55 = *(_QWORD *)(ArticleInformation - 8);
  MEMORY[0x1E0C80A78](ArticleInformation);
  v60 = (uint64_t)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1D77BD9C0();
  v65 = *(void (**)(char *, uint64_t))(v15 - 8);
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v52 - v19;
  sub_1D77BD99C();
  swift_bridgeObjectRetain_n();
  v21 = sub_1D77BD9B4();
  v22 = sub_1D77BDB1C();
  v23 = os_log_type_enabled(v21, v22);
  v64 = v18;
  v62 = v12;
  if (v23)
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v63 = v15;
    v53 = v25;
    *(_QWORD *)&v69[0] = v25;
    *(_DWORD *)v24 = 136446466;
    *(_QWORD *)&v70[0] = v6;
    swift_getMetatypeMetadata();
    v54 = a5;
    v26 = sub_1D77BDA8C();
    *(_QWORD *)&v70[0] = sub_1D77AF39C(v26, v27, (uint64_t *)v69);
    sub_1D77BDB7C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v70[0] = sub_1D77AF39C(a1, a2, (uint64_t *)v69);
    a5 = v54;
    sub_1D77BDB7C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D77AB000, v21, v22, "[%{public}s]: received read article update: %s", (uint8_t *)v24, 0x16u);
    v28 = v53;
    swift_arrayDestroy();
    v15 = v63;
    MEMORY[0x1D829B914](v28, -1, -1);
    MEMORY[0x1D829B914](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v29 = (void (*)(char *, uint64_t))*((_QWORD *)v65 + 1);
  v29(v20, v15);
  v30 = *(_QWORD *)(v66 + 16);
  if (v30)
  {
    v65 = v29;
    v31 = v66 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1D77AFE64(v31, (uint64_t)&v67);
      __swift_project_boxed_opaque_existential_1(&v67, v68);
      if (sub_1D77BD8E8() == a1 && v32 == a2)
      {
        v44 = v66;
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      v34 = sub_1D77BDC60();
      swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
      v31 += 48;
      if (!--v30)
      {
        swift_bridgeObjectRelease();
        v29 = v65;
        goto LABEL_13;
      }
    }
    v44 = v66;
LABEL_19:
    swift_bridgeObjectRelease();
    sub_1D77AFEDC(&v67, v69);
    sub_1D77AFEDC(v69, v70);
    v45 = v60;
    sub_1D77AFE64((uint64_t)v70, v60);
    v46 = ArticleInformation;
    sub_1D77BD6E4();
    v48 = type metadata accessor for ArticlesGenerator(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v47);
    v49 = (uint64_t)v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v59, v61, v58);
    v50 = (uint64_t)v62;
    sub_1D77BCFE8(v45, (uint64_t)v62);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v55 + 56))(v50, 0, 1, v46);
    swift_bridgeObjectRetain();
    v51 = ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(v49, v44, v50);
    *(_QWORD *)(a5 + 24) = v48;
    *(_QWORD *)(a5 + 32) = MEMORY[0x1D829B89C](&protocol conformance descriptor for ArticlesGenerator<A>, v48);
    *(_QWORD *)a5 = v51;
    sub_1D77BD02C(v45);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
  }
  else
  {
LABEL_13:
    v35 = v64;
    sub_1D77BD99C();
    swift_bridgeObjectRetain_n();
    v36 = sub_1D77BD9B4();
    v37 = sub_1D77BDB28();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v65 = v29;
      v40 = v39;
      *(_QWORD *)&v69[0] = v39;
      *(_DWORD *)v38 = 136446466;
      *(_QWORD *)&v70[0] = v6;
      swift_getMetatypeMetadata();
      v63 = v15;
      v41 = sub_1D77BDA8C();
      *(_QWORD *)&v70[0] = sub_1D77AF39C(v41, v42, (uint64_t *)v69);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v70[0] = sub_1D77AF39C(a1, a2, (uint64_t *)v69);
      sub_1D77BDB7C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D77AB000, v36, v37, "[%{public}s]: received read article identifier for nonexistent article: %s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D829B914](v40, -1, -1);
      MEMORY[0x1D829B914](v38, -1, -1);

      result = ((uint64_t (*)(char *, uint64_t))v65)(v64, v63);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      result = ((uint64_t (*)(char *, uint64_t))v29)(v35, v15);
    }
    *(_QWORD *)(a5 + 32) = 0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t ArticlesGeneratorPipeline.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_1EDA12740;
  v2 = sub_1D77BD840();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ArticlesGeneratorPipeline.__deallocating_deinit()
{
  ArticlesGeneratorPipeline.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77BCBF4()
{
  sub_1D77BCC34();
  return swift_retain();
}

uint64_t sub_1D77BCC14@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGeneratorPipeline.domain.getter(a1);
}

uint64_t sub_1D77BCC34()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_1EDA12748;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void sub_1D77BCC78()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA12568)
  {
    sub_1D77BCCF0();
    sub_1D77AFA0C(&qword_1EDA126C0, (uint64_t (*)(uint64_t))sub_1D77BCCF0, MEMORY[0x1E0C95D90]);
    v0 = sub_1D77BD9D8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA12568);
  }
}

void sub_1D77BCCF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA12570)
  {
    sub_1D77BCD54();
    v0 = sub_1D77BD9F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA12570);
  }
}

unint64_t sub_1D77BCD54()
{
  unint64_t result;

  result = qword_1EDA124D0;
  if (!qword_1EDA124D0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA124D0);
  }
  return result;
}

void sub_1D77BCDA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA12560)
  {
    sub_1D77B143C();
    sub_1D77BCD54();
    sub_1D77AFA0C(&qword_1EDA126D0, (uint64_t (*)(uint64_t))sub_1D77B143C, MEMORY[0x1E0C95F48]);
    v0 = sub_1D77BD9CC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA12560);
  }
}

unint64_t sub_1D77BCE3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA126D8;
  if (!qword_1EDA126D8)
  {
    sub_1D77AE9B8(255, &qword_1EDA12588, (uint64_t (*)(uint64_t))sub_1D77BCD54, MEMORY[0x1E0C96098]);
    result = MEMORY[0x1D829B89C](MEMORY[0x1E0C960B0], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA126D8);
  }
  return result;
}

uint64_t sub_1D77BCE9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1D77BD870();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D77BCF18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_1D77BD870() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_1D77BC49C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

unint64_t sub_1D77BCF88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA126F0;
  if (!qword_1EDA126F0)
  {
    sub_1D77AE9B8(255, &qword_1EDA125B0, (uint64_t (*)(uint64_t))sub_1D77BCCF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D829B89C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA126F0);
  }
  return result;
}

uint64_t sub_1D77BCFE8(uint64_t a1, uint64_t a2)
{
  uint64_t ArticleInformation;

  ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ArticleInformation - 8) + 16))(a2, a1, ArticleInformation);
  return a2;
}

uint64_t sub_1D77BD02C(uint64_t a1)
{
  uint64_t ArticleInformation;

  ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(ArticleInformation - 8) + 8))(a1, ArticleInformation);
  return a1;
}

uint64_t sub_1D77BD068@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1D77BCC34();
  return swift_retain();
}

uint64_t sub_1D77BD090()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_1D77BBAC8(v0);
}

uint64_t sub_1D77BD0B8()
{
  return 16;
}

__n128 sub_1D77BD0C4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1D77BD0D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D77BD840();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ArticlesGeneratorPipeline(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArticlesGeneratorPipeline);
}

uint64_t method lookup function for ArticlesGeneratorPipeline()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.__allocating_init(context:managedArticles:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static ArticlesGeneratorPipeline.makeGenerator(for:context:managedArticles:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t ReadArticleInformation.init(article:readDate:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  char *v5;
  uint64_t v6;

  sub_1D77AFEDC(a1, a3);
  v5 = (char *)a3 + *(int *)(type metadata accessor for ReadArticleInformation() + 20);
  v6 = sub_1D77BD6F0();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
}

uint64_t type metadata accessor for ReadArticleInformation()
{
  uint64_t result;

  result = qword_1EDA12618;
  if (!qword_1EDA12618)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ReadArticleInformation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[5];
    v8 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v8;
    *(_QWORD *)(a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v8 - 8))(a1, a2);
    v9 = *(int *)(a3 + 20);
    v10 = (char *)v4 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = sub_1D77BD6F0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return v4;
}

uint64_t destroy for ReadArticleInformation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1D77BD6F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ReadArticleInformation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 40) = v6;
  (**(void (***)(void))(v7 - 8))();
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1D77BD6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t *assignWithCopy for ReadArticleInformation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  __swift_assign_boxed_opaque_existential_2(a1, a2);
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1D77BD6F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ReadArticleInformation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1D77BD6F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_OWORD *assignWithTake for ReadArticleInformation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1D77BD6F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadArticleInformation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D77BD4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1D77BD6F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ReadArticleInformation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D77BD578(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_1D77BD6F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1D77BD5EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D77BD6F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1D77BD660()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t sub_1D77BD66C()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1D77BD678()
{
  return MEMORY[0x1E0D28E78]();
}

uint64_t sub_1D77BD684()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D77BD690()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1D77BD69C()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D77BD6A8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1D77BD6B4()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1D77BD6C0()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1D77BD6CC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D77BD6D8()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D77BD6E4()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1D77BD6F0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D77BD6FC()
{
  return MEMORY[0x1E0D2D5B0]();
}

uint64_t sub_1D77BD708()
{
  return MEMORY[0x1E0D2D720]();
}

uint64_t sub_1D77BD714()
{
  return MEMORY[0x1E0D2A828]();
}

uint64_t sub_1D77BD720()
{
  return MEMORY[0x1E0D2D788]();
}

uint64_t sub_1D77BD72C()
{
  return MEMORY[0x1E0D2D790]();
}

uint64_t sub_1D77BD738()
{
  return MEMORY[0x1E0D2D7B0]();
}

uint64_t sub_1D77BD744()
{
  return MEMORY[0x1E0D2D7C0]();
}

uint64_t sub_1D77BD750()
{
  return MEMORY[0x1E0D2D7C8]();
}

uint64_t sub_1D77BD75C()
{
  return MEMORY[0x1E0D2D7E8]();
}

uint64_t sub_1D77BD768()
{
  return MEMORY[0x1E0D2D7F0]();
}

uint64_t sub_1D77BD774()
{
  return MEMORY[0x1E0D2D800]();
}

uint64_t sub_1D77BD780()
{
  return MEMORY[0x1E0D2D808]();
}

uint64_t sub_1D77BD78C()
{
  return MEMORY[0x1E0D2D810]();
}

uint64_t sub_1D77BD798()
{
  return MEMORY[0x1E0D2D818]();
}

uint64_t sub_1D77BD7A4()
{
  return MEMORY[0x1E0D2D820]();
}

uint64_t sub_1D77BD7B0()
{
  return MEMORY[0x1E0D2D828]();
}

uint64_t sub_1D77BD7BC()
{
  return MEMORY[0x1E0D2D898]();
}

uint64_t sub_1D77BD7C8()
{
  return MEMORY[0x1E0D2D8A8]();
}

uint64_t sub_1D77BD7D4()
{
  return MEMORY[0x1E0D2D8B0]();
}

uint64_t sub_1D77BD7E0()
{
  return MEMORY[0x1E0D2D8C0]();
}

uint64_t sub_1D77BD7EC()
{
  return MEMORY[0x1E0D2D8C8]();
}

uint64_t sub_1D77BD7F8()
{
  return MEMORY[0x1E0D2D930]();
}

uint64_t sub_1D77BD804()
{
  return MEMORY[0x1E0D2D980]();
}

uint64_t sub_1D77BD810()
{
  return MEMORY[0x1E0D2D988]();
}

uint64_t sub_1D77BD81C()
{
  return MEMORY[0x1E0D2D990]();
}

uint64_t sub_1D77BD828()
{
  return MEMORY[0x1E0D2D9F0]();
}

uint64_t sub_1D77BD834()
{
  return MEMORY[0x1E0D2DA10]();
}

uint64_t sub_1D77BD840()
{
  return MEMORY[0x1E0D2DA30]();
}

uint64_t sub_1D77BD84C()
{
  return MEMORY[0x1E0D2DA48]();
}

uint64_t sub_1D77BD858()
{
  return MEMORY[0x1E0D2DA50]();
}

uint64_t sub_1D77BD864()
{
  return MEMORY[0x1E0D2DA68]();
}

uint64_t sub_1D77BD870()
{
  return MEMORY[0x1E0D2DA80]();
}

uint64_t sub_1D77BD87C()
{
  return MEMORY[0x1E0D2DE38]();
}

uint64_t sub_1D77BD888()
{
  return MEMORY[0x1E0D2E018]();
}

uint64_t sub_1D77BD894()
{
  return MEMORY[0x1E0D2E028]();
}

uint64_t sub_1D77BD8A0()
{
  return MEMORY[0x1E0D2E058]();
}

uint64_t sub_1D77BD8AC()
{
  return MEMORY[0x1E0D2E068]();
}

uint64_t sub_1D77BD8B8()
{
  return MEMORY[0x1E0D28E80]();
}

uint64_t sub_1D77BD8C4()
{
  return MEMORY[0x1E0D28E88]();
}

uint64_t sub_1D77BD8D0()
{
  return MEMORY[0x1E0D28E98]();
}

uint64_t sub_1D77BD8DC()
{
  return MEMORY[0x1E0D28EA8]();
}

uint64_t sub_1D77BD8E8()
{
  return MEMORY[0x1E0D28EB0]();
}

uint64_t sub_1D77BD8F4()
{
  return MEMORY[0x1E0D28EB8]();
}

uint64_t sub_1D77BD900()
{
  return MEMORY[0x1E0D28EC0]();
}

uint64_t sub_1D77BD90C()
{
  return MEMORY[0x1E0D28EC8]();
}

uint64_t sub_1D77BD918()
{
  return MEMORY[0x1E0D28ED0]();
}

uint64_t sub_1D77BD924()
{
  return MEMORY[0x1E0D28ED8]();
}

uint64_t sub_1D77BD930()
{
  return MEMORY[0x1E0D28EE0]();
}

uint64_t sub_1D77BD93C()
{
  return MEMORY[0x1E0D28EF0]();
}

uint64_t sub_1D77BD948()
{
  return MEMORY[0x1E0D28F00]();
}

uint64_t sub_1D77BD954()
{
  return MEMORY[0x1E0D28F10]();
}

uint64_t sub_1D77BD960()
{
  return MEMORY[0x1E0D28F18]();
}

uint64_t sub_1D77BD96C()
{
  return MEMORY[0x1E0D2B9E0]();
}

uint64_t sub_1D77BD978()
{
  return MEMORY[0x1E0D2B9E8]();
}

uint64_t sub_1D77BD984()
{
  return MEMORY[0x1E0D2ECD0]();
}

uint64_t sub_1D77BD990()
{
  return MEMORY[0x1E0D2ECD8]();
}

uint64_t sub_1D77BD99C()
{
  return MEMORY[0x1E0D2E748]();
}

uint64_t sub_1D77BD9A8()
{
  return MEMORY[0x1E0D2E7A8]();
}

uint64_t sub_1D77BD9B4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D77BD9C0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D77BD9CC()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1D77BD9D8()
{
  return MEMORY[0x1E0C95C60]();
}

uint64_t sub_1D77BD9E4()
{
  return MEMORY[0x1E0C95C70]();
}

uint64_t sub_1D77BD9F0()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1D77BD9FC()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t sub_1D77BDA08()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1D77BDA14()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1D77BDA20()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1D77BDA2C()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1D77BDA38()
{
  return MEMORY[0x1E0C96130]();
}

uint64_t sub_1D77BDA44()
{
  return MEMORY[0x1E0C96138]();
}

uint64_t sub_1D77BDA50()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1D77BDA5C()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1D77BDA68()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D77BDA74()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D77BDA80()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D77BDA8C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D77BDA98()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D77BDAA4()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D77BDAB0()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1D77BDABC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D77BDAC8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1D77BDAD4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D77BDAE0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D77BDAEC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D77BDAF8()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D77BDB04()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1D77BDB10()
{
  return MEMORY[0x1E0D2ED40]();
}

uint64_t sub_1D77BDB1C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1D77BDB28()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D77BDB34()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D77BDB40()
{
  return MEMORY[0x1E0CB4588]();
}

uint64_t sub_1D77BDB4C()
{
  return MEMORY[0x1E0D28F20]();
}

uint64_t sub_1D77BDB58()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1D77BDB64()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D77BDB70()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D77BDB7C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D77BDB88()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D77BDB94()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D77BDBA0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1D77BDBAC()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1D77BDBB8()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1D77BDBC4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D77BDBD0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D77BDBDC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D77BDBE8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D77BDBF4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D77BDC00()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1D77BDC0C()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1D77BDC18()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D77BDC24()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D77BDC30()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D77BDC3C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D77BDC48()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D77BDC54()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1D77BDC60()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D77BDC6C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D77BDC78()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D77BDC84()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D77BDC90()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D77BDC9C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D77BDCA8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D77BDCB4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D77BDCC0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x1E0CB52F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

