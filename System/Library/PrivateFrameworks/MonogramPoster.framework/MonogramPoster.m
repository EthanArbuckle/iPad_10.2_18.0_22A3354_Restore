unint64_t UIColor.monogramColorDescription.getter()
{
  void *v0;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[18];

  v6[17] = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6[0] = 0;
  v3 = 0;
  v4 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v6, &v5, &v4, &v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3968);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2422DF0D0;
  *(_QWORD *)(inited + 32) = 6579570;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = v6[0];
  *(_QWORD *)(inited + 56) = 0x6E65657267;
  *(_QWORD *)(inited + 64) = 0xE500000000000000;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 1702194274;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = 0x6168706C61;
  *(_QWORD *)(inited + 112) = 0xE500000000000000;
  *(_QWORD *)(inited + 120) = v3;
  return sub_2422DA900(inited);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A74B4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2422DA900(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3958);
  v2 = (_QWORD *)sub_2422DEDE4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2422DAC1C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
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

UIColor __swiftcall UIColor.init(monogramColorDescription:)(Swift::OpaquePointer monogramColorDescription)
{
  unint64_t v2;
  double v3;
  double v4;
  char v5;
  unint64_t v6;
  double v7;
  char v8;
  unint64_t v9;
  double v10;
  char v11;
  unint64_t v12;
  char v13;

  if (!*((_QWORD *)monogramColorDescription._rawValue + 2))
  {
    v3 = 1.0;
    v4 = 1.0;
LABEL_14:
    v7 = 1.0;
LABEL_15:
    v10 = 1.0;
    goto LABEL_16;
  }
  v2 = sub_2422DAC1C(6579570, 0xE300000000000000);
  v3 = 1.0;
  v4 = 1.0;
  if ((v5 & 1) != 0)
    v4 = *(double *)(*((_QWORD *)monogramColorDescription._rawValue + 7) + 8 * v2);
  if (!*((_QWORD *)monogramColorDescription._rawValue + 2))
    goto LABEL_14;
  v6 = sub_2422DAC1C(0x6E65657267, 0xE500000000000000);
  v7 = 1.0;
  if ((v8 & 1) != 0)
    v7 = *(double *)(*((_QWORD *)monogramColorDescription._rawValue + 7) + 8 * v6);
  if (!*((_QWORD *)monogramColorDescription._rawValue + 2))
    goto LABEL_15;
  v9 = sub_2422DAC1C(1702194274, 0xE400000000000000);
  v10 = 1.0;
  if ((v11 & 1) != 0)
    v3 = *(double *)(*((_QWORD *)monogramColorDescription._rawValue + 7) + 8 * v9);
  if (*((_QWORD *)monogramColorDescription._rawValue + 2))
  {
    v12 = sub_2422DAC1C(0x6168706C61, 0xE500000000000000);
    if ((v13 & 1) != 0)
      v10 = *(double *)(*((_QWORD *)monogramColorDescription._rawValue + 7) + 8 * v12);
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return (UIColor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, v4, v7, v3, v10);
}

uint64_t UIColor.truncatedKey.getter()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t result;
  double v6;
  double v7;
  double v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = 0.0;
  v9[0] = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  v1 = floor(v9[0] * 1000000.0) / 1000000.0;
  v2 = floor(v8 * 1000000.0) / 1000000.0;
  v3 = floor(v7 * 1000000.0) / 1000000.0;
  v4 = floor(v6 * 1000000.0) / 1000000.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC038);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2422DF0D0;
  *(double *)(result + 32) = v1;
  *(double *)(result + 40) = v2;
  *(double *)(result + 48) = v3;
  *(double *)(result + 56) = v4;
  return result;
}

unint64_t sub_2422DAC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2422DEE5C();
  sub_2422DED9C();
  v4 = sub_2422DEE80();
  return sub_2422DACD8(a1, a2, v4);
}

double sub_2422DAC80(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  sub_2422DEE5C();
  sub_2422DCE84((uint64_t)v4, a1);
  v2 = sub_2422DEE80();
  return sub_2422DADB8(a1, v2);
}

unint64_t sub_2422DACD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2422DEE44() & 1) == 0)
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
      while (!v14 && (sub_2422DEE44() & 1) == 0);
    }
  }
  return v6;
}

double sub_2422DADB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  double *v10;
  uint64_t v11;
  double *v12;
  double v13;
  double v14;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = ~v4;
    v7 = *(_QWORD *)(a1 + 16);
    while (1)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5);
      if (*(_QWORD *)(v8 + 16) == v7)
      {
        if (!v7 || v8 == a1)
          return result;
        result = *(double *)(v8 + 32);
        if (result == *(double *)(a1 + 32))
        {
          if (v7 == 1)
            return result;
          result = *(double *)(v8 + 40);
          if (result == *(double *)(a1 + 40))
            break;
        }
      }
LABEL_3:
      v5 = (v5 + 1) & v6;
      if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
        return result;
    }
    v10 = (double *)(v8 + 48);
    v11 = v7 - 2;
    v12 = (double *)(a1 + 48);
    while (v11)
    {
      v13 = *v10++;
      result = v13;
      v14 = *v12++;
      --v11;
      if (result != v14)
        goto LABEL_3;
    }
  }
  return result;
}

uint64_t static MonogramPosterUtilities.isMonogramSupported(for:)(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3850);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2422DF0F0;
  v3 = objc_msgSend(a1, sel_givenName);
  v4 = sub_2422DED90();
  v6 = v5;

  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  v7 = objc_msgSend(a1, sel_middleName);
  v8 = sub_2422DED90();
  v10 = v9;

  *(_QWORD *)(v2 + 48) = v8;
  *(_QWORD *)(v2 + 56) = v10;
  v11 = objc_msgSend(a1, sel_familyName);
  v12 = sub_2422DED90();
  v14 = v13;

  *(_QWORD *)(v2 + 64) = v12;
  *(_QWORD *)(v2 + 72) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3868);
  sub_2422DAFDC();
  v15 = sub_2422DED78();
  v17 = v16;
  swift_bridgeObjectRelease();
  LOBYTE(v2) = _s14MonogramPoster0aB9UtilitiesV02isA9Supported3forSbSS_tFZ_0(v15, v17);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

unint64_t sub_2422DAFDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543B3870;
  if (!qword_2543B3870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543B3868);
    result = MEMORY[0x2426A74CC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2543B3870);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A74C0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2422DB070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  char v22;
  BOOL v23;
  char v24;
  uint64_t v26;

  v0 = sub_2422DED60();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC040);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2422DED24();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v11 = objc_msgSend(v10, sel_preferredLocalizations);

  v12 = sub_2422DEDB4();
  if (!*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2422DED48();
  swift_bridgeObjectRelease();
  sub_2422DED18();
  sub_2422DED0C();
  sub_2422DED54();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v13 = sub_2422DED3C();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v5, 1, v13) == 1)
  {
    sub_2422DB440((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_5:
    v15 = 0;
    return v15 & 1;
  }
  v16 = sub_2422DED30();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v13);
  if (v16 == 24938 && v18 == 0xE200000000000000
    || ((v19 = sub_2422DEE44(), v16 == 28523) ? (v20 = v18 == 0xE200000000000000) : (v20 = 0),
        !v20 ? (v21 = 0) : (v21 = 1),
        (v19 & 1) != 0
     || (v21 & 1) != 0
     || ((v22 = sub_2422DEE44(), v16 == 26746) ? (v23 = v18 == 0xE200000000000000) : (v23 = 0),
         !v23 ? (v24 = 0) : (v24 = 1),
         (v22 & 1) != 0 || (v24 & 1) != 0 || (sub_2422DEE44() & 1) != 0)))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    v15 = 1;
  }
  else
  {
    if (v16 == 29281 && v18 == 0xE200000000000000)
      v15 = 1;
    else
      v15 = sub_2422DEE44();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
  }
  return v15 & 1;
}

uint64_t _s14MonogramPoster0aB9UtilitiesV02isA9Supported3forSbSS_tFZ_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
  char v4;
  char v5;
  void *v6;
  char v7;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v3 = (void *)sub_2422DED84();
    v4 = CNIsChineseJapaneseKoreanString();

    if ((v4 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v6 = (void *)sub_2422DED84();
      v7 = CNIsArabicString();

      v5 = v7 ^ 1;
    }
  }
  else
  {
    v5 = sub_2422DB070() ^ 1;
  }
  return v5 & 1;
}

ValueMetadata *type metadata accessor for MonogramPosterUtilities()
{
  return &type metadata for MonogramPosterUtilities;
}

uint64_t sub_2422DB440(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC040);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id MonogramPosterBackgroundColor.topColor.getter()
{
  id *v0;

  return *v0;
}

id MonogramPosterBackgroundColor.bottomColor.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

MonogramPoster::MonogramPosterBackgroundColor __swiftcall MonogramPosterBackgroundColor.init(topColor:bottomColor:)(UIColor topColor, UIColor bottomColor)
{
  UIColor *v2;
  MonogramPoster::MonogramPosterBackgroundColor result;

  v2->super.isa = topColor.super.isa;
  v2[1].super.isa = bottomColor.super.isa;
  result.bottomColor = bottomColor;
  result.topColor = topColor;
  return result;
}

id sub_2422DB498()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.658823529, 0.678431373, 0.729411765, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.529411765, 0.549019608, 0.588235294, 1.0);
  qword_2543B3990 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3998 = result;
  return result;
}

id sub_2422DB528()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.803921569, 0.97254902, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.709803922, 0.643137255, 0.949019608, 1.0);
  qword_2543B3A60 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A68 = result;
  return result;
}

id sub_2422DB5BC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.701960784, 0.835294118, 0.937254902, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.454901961, 0.698039216, 0.88627451, 1.0);
  qword_2543B3980 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3988 = result;
  return result;
}

id sub_2422DB64C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.964705882, 0.721568627, 0.8, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.937254902, 0.490196078, 0.639215686, 1.0);
  qword_2543B39A0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39A8 = result;
  return result;
}

id sub_2422DB6DC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.960784314, 0.850980392, 0.68627451, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.929411765, 0.725490196, 0.431372549, 1.0);
  qword_2543B3A70 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A78 = result;
  return result;
}

id sub_2422DB76C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.792156863, 0.949019608, 0.741176471, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.623529412, 0.905882353, 0.529411765, 1.0);
  qword_2543B39B0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39B8 = result;
  return result;
}

id sub_2422DB7FC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.882352941, 0.776470588, 0.764705882, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.788235294, 0.592156863, 0.57254902, 1.0);
  qword_2543B3970 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3978 = result;
  return result;
}

id sub_2422DB894()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.764705882, 0.662745098, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.894117647, 0.568627451, 0.388235294, 1.0);
  qword_2543B3A50 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A58 = result;
  return result;
}

id sub_2422DB92C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.807843137, 0.870588235, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.705882353, 0.647058824, 0.764705882, 1.0);
  qword_2543B3A10 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A18 = result;
  return result;
}

id sub_2422DB9C0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.780392157, 0.843137255, 0.905882353, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.603921569, 0.717647059, 0.82745098, 1.0);
  qword_2543B39E0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39E8 = result;
  return result;
}

id sub_2422DBA50()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.815686275, 0.909803922, 0.917647059, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.835294118, 0.847058824, 1.0);
  qword_2543B39F0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39F8 = result;
  return result;
}

id sub_2422DBAE4()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.717647059, 0.925490196, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.890196078, 0.48627451, 0.866666667, 1.0);
  qword_2543B3A40 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A48 = result;
  return result;
}

id sub_2422DBB80()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.941176471, 0.949019608, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.396078431, 0.894117647, 0.905882353, 1.0);
  qword_2543B39C0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39C8 = result;
  return result;
}

id sub_2422DBC18()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.694117647, 0.956862745, 0.764705882, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.443137255, 0.921568627, 0.568627451, 1.0);
  qword_2543B39D0 = (uint64_t)v0;
  *(_QWORD *)algn_2543B39D8 = result;
  return result;
}

id sub_2422DBCAC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.850980392, 0.831372549, 0.811764706, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.725490196, 0.694117647, 0.654901961, 1.0);
  qword_2543B3A20 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A28 = result;
  return result;
}

id sub_2422DBD3C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.901960784, 0.839215686, 0.749019608, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.819607843, 0.705882353, 0.541176471, 1.0);
  qword_2543B3A30 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A38 = result;
  return result;
}

id sub_2422DBDCC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.831372549, 0.866666667, 0.815686275, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.690196078, 0.760784314, 0.666666667, 1.0);
  qword_2543B3A00 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A08 = result;
  return result;
}

id sub_2422DBE60()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.560784314, 0.560784314, 0.560784314, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.2, 0.2, 0.2, 1.0);
  qword_2543B3A80 = (uint64_t)v0;
  *(_QWORD *)algn_2543B3A88 = result;
  return result;
}

id sub_2422DBEE0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v90;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3960);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2422DF360;
  if (qword_2543B38D0 != -1)
    swift_once();
  v1 = (void *)qword_2543B3990;
  v2 = *(void **)algn_2543B3998;
  *(_QWORD *)(v0 + 32) = qword_2543B3990;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = qword_2543B38D8;
  v4 = v1;
  v5 = v2;
  if (v3 != -1)
    swift_once();
  v6 = (void *)qword_2543B39A0;
  v7 = *(void **)algn_2543B39A8;
  *(_QWORD *)(v0 + 48) = qword_2543B39A0;
  *(_QWORD *)(v0 + 56) = v7;
  v8 = qword_2543B38C0;
  v9 = v6;
  v10 = v7;
  if (v8 != -1)
    swift_once();
  v11 = (void *)qword_2543B3970;
  v12 = *(void **)algn_2543B3978;
  *(_QWORD *)(v0 + 64) = qword_2543B3970;
  *(_QWORD *)(v0 + 72) = v12;
  v13 = qword_2543B3930;
  v14 = v11;
  v15 = v12;
  if (v13 != -1)
    swift_once();
  v16 = (void *)qword_2543B3A50;
  v17 = *(void **)algn_2543B3A58;
  *(_QWORD *)(v0 + 80) = qword_2543B3A50;
  *(_QWORD *)(v0 + 88) = v17;
  v18 = qword_2543B3940;
  v19 = v16;
  v20 = v17;
  if (v18 != -1)
    swift_once();
  v21 = (void *)qword_2543B3A70;
  v22 = *(void **)algn_2543B3A78;
  *(_QWORD *)(v0 + 96) = qword_2543B3A70;
  *(_QWORD *)(v0 + 104) = v22;
  v23 = qword_2543B38E0;
  v24 = v21;
  v25 = v22;
  if (v23 != -1)
    swift_once();
  v26 = (void *)qword_2543B39B0;
  v27 = *(void **)algn_2543B39B8;
  *(_QWORD *)(v0 + 112) = qword_2543B39B0;
  *(_QWORD *)(v0 + 120) = v27;
  v28 = qword_2543B38C8;
  v29 = v26;
  v30 = v27;
  if (v28 != -1)
    swift_once();
  v31 = (void *)qword_2543B3980;
  v32 = *(void **)algn_2543B3988;
  *(_QWORD *)(v0 + 128) = qword_2543B3980;
  *(_QWORD *)(v0 + 136) = v32;
  v33 = qword_2543B3938;
  v34 = v31;
  v35 = v32;
  if (v33 != -1)
    swift_once();
  v36 = (void *)qword_2543B3A60;
  v37 = *(void **)algn_2543B3A68;
  *(_QWORD *)(v0 + 144) = qword_2543B3A60;
  *(_QWORD *)(v0 + 152) = v37;
  v38 = qword_2543B3910;
  v39 = v36;
  v40 = v37;
  if (v38 != -1)
    swift_once();
  v41 = (void *)qword_2543B3A10;
  v42 = *(void **)algn_2543B3A18;
  *(_QWORD *)(v0 + 160) = qword_2543B3A10;
  *(_QWORD *)(v0 + 168) = v42;
  v43 = qword_2543B38F8;
  v44 = v41;
  v45 = v42;
  if (v43 != -1)
    swift_once();
  v46 = (void *)qword_2543B39E0;
  v47 = *(void **)algn_2543B39E8;
  *(_QWORD *)(v0 + 176) = qword_2543B39E0;
  *(_QWORD *)(v0 + 184) = v47;
  v48 = qword_2543B3900;
  v49 = v46;
  v50 = v47;
  if (v48 != -1)
    swift_once();
  v51 = (void *)qword_2543B39F0;
  v52 = *(void **)algn_2543B39F8;
  *(_QWORD *)(v0 + 192) = qword_2543B39F0;
  *(_QWORD *)(v0 + 200) = v52;
  v53 = qword_2543B3928;
  v54 = v51;
  v55 = v52;
  if (v53 != -1)
    swift_once();
  v56 = (void *)qword_2543B3A40;
  v57 = *(void **)algn_2543B3A48;
  *(_QWORD *)(v0 + 208) = qword_2543B3A40;
  *(_QWORD *)(v0 + 216) = v57;
  v58 = qword_2543B38E8;
  v59 = v56;
  v60 = v57;
  if (v58 != -1)
    swift_once();
  v61 = (void *)qword_2543B39C0;
  v62 = *(void **)algn_2543B39C8;
  *(_QWORD *)(v0 + 224) = qword_2543B39C0;
  *(_QWORD *)(v0 + 232) = v62;
  v63 = qword_2543B38F0;
  v64 = v61;
  v65 = v62;
  if (v63 != -1)
    swift_once();
  v66 = (void *)qword_2543B39D0;
  v67 = *(void **)algn_2543B39D8;
  *(_QWORD *)(v0 + 240) = qword_2543B39D0;
  *(_QWORD *)(v0 + 248) = v67;
  v68 = qword_2543B3918;
  v69 = v66;
  v70 = v67;
  if (v68 != -1)
    swift_once();
  v71 = (void *)qword_2543B3A20;
  v72 = *(void **)algn_2543B3A28;
  *(_QWORD *)(v0 + 256) = qword_2543B3A20;
  *(_QWORD *)(v0 + 264) = v72;
  v73 = qword_2543B3920;
  v74 = v71;
  v75 = v72;
  if (v73 != -1)
    swift_once();
  v76 = (void *)qword_2543B3A30;
  v77 = *(void **)algn_2543B3A38;
  *(_QWORD *)(v0 + 272) = qword_2543B3A30;
  *(_QWORD *)(v0 + 280) = v77;
  v78 = qword_2543B3908;
  v79 = v76;
  v80 = v77;
  if (v78 != -1)
    swift_once();
  v81 = (void *)qword_2543B3A00;
  v82 = *(void **)algn_2543B3A08;
  *(_QWORD *)(v0 + 288) = qword_2543B3A00;
  *(_QWORD *)(v0 + 296) = v82;
  v83 = qword_2543B3948;
  v84 = v81;
  v85 = v82;
  if (v83 != -1)
    swift_once();
  v87 = (void *)qword_2543B3A80;
  v86 = *(_QWORD *)algn_2543B3A88;
  v90 = *(id *)algn_2543B3A88;
  *(_QWORD *)(v0 + 304) = qword_2543B3A80;
  *(_QWORD *)(v0 + 312) = v86;
  off_2543B38B8 = (_UNKNOWN *)v0;
  v88 = v87;
  return v90;
}

uint64_t MonogramPosterBackgroundColors.getter()
{
  if (qword_2543B3898 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2422DC3FC()
{
  uint64_t result;

  result = sub_2422DC418();
  qword_2571FC048 = result;
  return result;
}

uint64_t sub_2422DC418()
{
  uint64_t v0;
  void **v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  char isUniquelyReferenced_nonNull_native;
  char v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  double v30;
  double v31;
  double v32;
  double v33[2];

  v33[1] = *(double *)MEMORY[0x24BDAC8D0];
  if (qword_2543B3898 != -1)
LABEL_22:
    swift_once();
  v0 = *((_QWORD *)off_2543B38B8 + 2);
  if (v0)
  {
    v1 = (void **)(swift_bridgeObjectRetain() + 40);
    v2 = MEMORY[0x24BEE4B00];
    while (1)
    {
      v5 = *(v1 - 1);
      v6 = *v1;
      v32 = 0.0;
      v33[0] = 0.0;
      v30 = 0.0;
      v31 = 0.0;
      v7 = v5;
      v8 = v6;
      objc_msgSend(v8, sel_getRed_green_blue_alpha_, v33, &v32, &v31, &v30);
      v9 = floor(v33[0] * 1000000.0) / 1000000.0;
      v10 = floor(v32 * 1000000.0) / 1000000.0;
      v11 = floor(v31 * 1000000.0) / 1000000.0;
      v12 = floor(v30 * 1000000.0) / 1000000.0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC038);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2422DF0D0;
      *(double *)(v13 + 32) = v9;
      *(double *)(v13 + 40) = v10;
      *(double *)(v13 + 48) = v11;
      *(double *)(v13 + 56) = v12;
      v14 = v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33[0] = v2;
      sub_2422DAC80(v13);
      v18 = v17;
      v19 = *(_QWORD *)(*(_QWORD *)&v2 + 16);
      v20 = (v16 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      v22 = v16;
      if (*(_QWORD *)(*(_QWORD *)&v2 + 24) >= v21)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v2 = v33[0];
          if ((v16 & 1) != 0)
            goto LABEL_4;
        }
        else
        {
          sub_2422DCCE0();
          v2 = v33[0];
          if ((v22 & 1) != 0)
            goto LABEL_4;
        }
      }
      else
      {
        sub_2422DC9D4(v21, isUniquelyReferenced_nonNull_native);
        sub_2422DAC80(v13);
        if ((v22 & 1) != (v24 & 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC050);
          result = sub_2422DEE50();
          __break(1u);
          return result;
        }
        v18 = v23;
        v2 = v33[0];
        if ((v22 & 1) != 0)
        {
LABEL_4:
          v3 = *(_QWORD *)(*(_QWORD *)&v2 + 56);
          v4 = 8 * v18;

          *(_QWORD *)(v3 + v4) = v14;
          goto LABEL_5;
        }
      }
      *(_QWORD *)(*(_QWORD *)&v2 + 8 * (v18 >> 6) + 64) |= 1 << v18;
      v25 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v2 + 48) + v25) = v13;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v2 + 56) + v25) = v14;
      v26 = *(_QWORD *)(*(_QWORD *)&v2 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_21;
      *(_QWORD *)(*(_QWORD *)&v2 + 16) = v28;
      swift_bridgeObjectRetain();
LABEL_5:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v1 += 2;
      if (!--v0)
      {
        swift_bridgeObjectRelease();
        return *(_QWORD *)&v2;
      }
    }
  }
  v2 = MEMORY[0x24BEE4B00];
  return *(_QWORD *)&v2;
}

uint64_t MonogramPosterBackgroundColorBottomToTop.getter()
{
  if (qword_2571FC030 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterBackgroundColorBottomToTop.setter(uint64_t a1)
{
  if (qword_2571FC030 != -1)
    swift_once();
  swift_beginAccess();
  qword_2571FC048 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MonogramPosterBackgroundColorBottomToTop.modify())()
{
  if (qword_2571FC030 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *initializeBufferWithCopyOfBuffer for MonogramPosterBackgroundColor(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for MonogramPosterBackgroundColor(id *a1)
{

}

uint64_t assignWithCopy for MonogramPosterBackgroundColor(uint64_t a1, uint64_t a2)
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

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MonogramPosterBackgroundColor(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MonogramPosterBackgroundColor(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MonogramPosterBackgroundColor(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterBackgroundColor()
{
  return &type metadata for MonogramPosterBackgroundColor;
}

uint64_t sub_2422DC9D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC058);
  v36 = a2;
  result = sub_2422DEDD8();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v35 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v34)
          goto LABEL_36;
        v18 = v35[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v34)
            goto LABEL_36;
          v18 = v35[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v34)
            {
LABEL_36:
              if ((v36 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_43;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v35 = -1 << v33;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_45;
                if (v8 >= v34)
                  goto LABEL_36;
                v18 = v35[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = 8 * v16;
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v20);
      v22 = *(void **)(*(_QWORD *)(v5 + 56) + v20);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        v23 = v22;
      }
      sub_2422DEE5C();
      sub_2422DEE68();
      v24 = *(_QWORD *)(v21 + 16);
      if (v24)
      {
        v25 = v21 + 32;
        do
        {
          v25 += 8;
          sub_2422DEE74();
          --v24;
        }
        while (v24);
      }
      result = sub_2422DEE80();
      v26 = -1 << *(_BYTE *)(v7 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        v13 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = 8 * v13;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v14) = v21;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v14) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_43:
  *v3 = v7;
  return result;
}

id sub_2422DCCE0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571FC058);
  v2 = *v0;
  v3 = sub_2422DEDCC();
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
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain();
    result = v17;
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

uint64_t sub_2422DCE84(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_2422DEE68();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 8;
      result = sub_2422DEE74();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t MonogramPosterConfiguration.topBackgroundColorDescription.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterConfiguration.topBackgroundColorDescription.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*MonogramPosterConfiguration.topBackgroundColorDescription.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.backgroundColorDescription.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterConfiguration.backgroundColorDescription.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*MonogramPosterConfiguration.backgroundColorDescription.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.initials.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MonogramPosterConfiguration.initials.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MonogramPosterConfiguration.initials.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.monogramSupportedForName.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t MonogramPosterConfiguration.monogramSupportedForName.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*MonogramPosterConfiguration.monogramSupportedForName.modify())()
{
  return nullsub_1;
}

void MonogramPosterConfiguration.init(backgroundColor:initials:supportedForName:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v9 = *(void **)a1;
  v10 = *(void **)(a1 + 8);
  v11 = UIColor.monogramColorDescription.getter();
  v12 = UIColor.monogramColorDescription.getter();

  *(_QWORD *)a5 = v12;
  *(_QWORD *)(a5 + 8) = v11;
  *(_QWORD *)(a5 + 16) = a2;
  *(_QWORD *)(a5 + 24) = a3;
  *(_BYTE *)(a5 + 32) = a4;
}

uint64_t MonogramPosterConfiguration.debugDescription.getter()
{
  sub_2422DEDC0();
  sub_2422DEDA8();
  swift_bridgeObjectRetain();
  sub_2422DEDA8();
  swift_bridgeObjectRelease();
  sub_2422DEDA8();
  sub_2422DEDA8();
  swift_bridgeObjectRelease();
  sub_2422DEDA8();
  sub_2422DED6C();
  sub_2422DEDA8();
  swift_bridgeObjectRelease();
  sub_2422DEDA8();
  sub_2422DED6C();
  sub_2422DEDA8();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2422DD208(uint64_t result, uint64_t a2)
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
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  char v20;
  char v21;

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
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v9)
        return 1;
      v13 = *(_QWORD *)(v5 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v9)
          return 1;
        v13 = *(_QWORD *)(v5 + 8 * v4);
        if (!v13)
        {
          v4 = v12 + 3;
          if (v12 + 3 >= v9)
            return 1;
          v13 = *(_QWORD *)(v5 + 8 * v4);
          if (!v13)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(double *)(*(_QWORD *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    v19 = sub_2422DAC1C(v16, v17);
    v21 = v20;
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(double *)(*(_QWORD *)(a2 + 56) + 8 * v19) != v18)
      return 0;
  }
  v14 = v12 + 4;
  if (v14 >= v9)
    return 1;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2422DD3B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2422DD3F8 + 4 * byte_2422DF3A0[a1]))(0xD00000000000001DLL, 0x80000002422DF870);
}

uint64_t sub_2422DD3F8()
{
  uint64_t v0;

  return v0 + 2;
}

uint64_t sub_2422DD410()
{
  return 0x736C616974696E69;
}

unint64_t sub_2422DD428()
{
  return 0xD000000000000018;
}

BOOL sub_2422DD444(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2422DD458()
{
  sub_2422DEE5C();
  sub_2422DEE68();
  return sub_2422DEE80();
}

uint64_t sub_2422DD49C()
{
  return sub_2422DEE68();
}

uint64_t sub_2422DD4C4()
{
  sub_2422DEE5C();
  sub_2422DEE68();
  return sub_2422DEE80();
}

uint64_t sub_2422DD504()
{
  unsigned __int8 *v0;

  return sub_2422DD3B8(*v0);
}

uint64_t sub_2422DD50C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2422DE14C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2422DD530()
{
  return 0;
}

void sub_2422DD53C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2422DD548()
{
  sub_2422DDB5C();
  return sub_2422DEEA4();
}

uint64_t sub_2422DD570()
{
  sub_2422DDB5C();
  return sub_2422DEEB0();
}

uint64_t MonogramPosterConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD v11[4];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3878);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v13 = v1[2];
  v14 = v8;
  v12 = v1[3];
  v11[3] = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2422DDB5C();
  sub_2422DEE98();
  v16 = v9;
  v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3950);
  sub_2422DDC04(&qword_2543B3860, (uint64_t (*)(void))sub_2422DDBA0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
  sub_2422DEE38();
  if (!v2)
  {
    v16 = v14;
    v15 = 1;
    sub_2422DEE38();
    LOBYTE(v16) = 2;
    sub_2422DEE20();
    LOBYTE(v16) = 3;
    sub_2422DEE2C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t MonogramPosterConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3890);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2422DDB5C();
  sub_2422DEE8C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543B3950);
  v20 = 0;
  sub_2422DDC04(&qword_2543B3888, (uint64_t (*)(void))sub_2422DDC78, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  sub_2422DEE14();
  v9 = v21;
  v20 = 1;
  swift_bridgeObjectRetain();
  sub_2422DEE14();
  v10 = v21;
  LOBYTE(v21) = 2;
  swift_bridgeObjectRetain();
  v17 = sub_2422DEDFC();
  v18 = v11;
  LOBYTE(v21) = 3;
  swift_bridgeObjectRetain();
  v13 = sub_2422DEE08();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = v13 & 1;
  v16 = v18;
  v15 = v19;
  *v19 = v9;
  v15[1] = v10;
  v15[2] = v17;
  v15[3] = v16;
  *((_BYTE *)v15 + 32) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2422DDA60@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return MonogramPosterConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2422DDA74(_QWORD *a1)
{
  return MonogramPosterConfiguration.encode(to:)(a1);
}

uint64_t _s14MonogramPoster0aB13ConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v11;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int8 *)(a1 + 32);
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(unsigned __int8 *)(a2 + 32);
  if ((sub_2422DD208(*(_QWORD *)a1, *(_QWORD *)a2) & 1) == 0 || (sub_2422DD208(v2, v6) & 1) == 0)
    return 0;
  if (v3 == v7 && v4 == v8)
    return v5 ^ v9 ^ 1u;
  v11 = sub_2422DEE44();
  result = 0;
  if ((v11 & 1) != 0)
    return v5 ^ v9 ^ 1u;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2422DDB5C()
{
  unint64_t result;

  result = qword_2543B38A0;
  if (!qword_2543B38A0)
  {
    result = MEMORY[0x2426A74CC](&unk_2422DF550, &type metadata for MonogramPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543B38A0);
  }
  return result;
}

unint64_t sub_2422DDBA0()
{
  unint64_t result;

  result = qword_2543B3858;
  if (!qword_2543B3858)
  {
    result = MEMORY[0x2426A74CC](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2543B3858);
  }
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

uint64_t sub_2422DDC04(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543B3950);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x2426A74CC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2422DDC78()
{
  unint64_t result;

  result = qword_2543B3880;
  if (!qword_2543B3880)
  {
    result = MEMORY[0x2426A74CC](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2543B3880);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MonogramPosterConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MonogramPosterConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MonogramPosterConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MonogramPosterConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterConfiguration()
{
  return &type metadata for MonogramPosterConfiguration;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MonogramPosterConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MonogramPosterConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2422DDFE4 + 4 * byte_2422DF3A9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2422DE018 + 4 * byte_2422DF3A4[v4]))();
}

uint64_t sub_2422DE018(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DE020(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2422DE028);
  return result;
}

uint64_t sub_2422DE034(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2422DE03CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2422DE040(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DE048(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DE054(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2422DE05C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterConfiguration.CodingKeys()
{
  return &type metadata for MonogramPosterConfiguration.CodingKeys;
}

unint64_t sub_2422DE078()
{
  unint64_t result;

  result = qword_2571FC060;
  if (!qword_2571FC060)
  {
    result = MEMORY[0x2426A74CC](&unk_2422DF528, &type metadata for MonogramPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571FC060);
  }
  return result;
}

unint64_t sub_2422DE0C0()
{
  unint64_t result;

  result = qword_2543B38B0;
  if (!qword_2543B38B0)
  {
    result = MEMORY[0x2426A74CC](&unk_2422DF498, &type metadata for MonogramPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543B38B0);
  }
  return result;
}

unint64_t sub_2422DE108()
{
  unint64_t result;

  result = qword_2543B38A8;
  if (!qword_2543B38A8)
  {
    result = MEMORY[0x2426A74CC](&unk_2422DF4C0, &type metadata for MonogramPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543B38A8);
  }
  return result;
}

uint64_t sub_2422DE14C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001DLL && a2 == 0x80000002422DF870 || (sub_2422DEE44() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002422DF780 || (sub_2422DEE44() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736C616974696E69 && a2 == 0xE800000000000000 || (sub_2422DEE44() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002422DF890)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_2422DEE44();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t MonogramPosterColorDescriptionKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2422DE31C + 4 * byte_2422DF5B0[*v0]))(6579570, 0xE300000000000000);
}

uint64_t sub_2422DE31C()
{
  return 0x6E65657267;
}

uint64_t sub_2422DE330()
{
  return 1702194274;
}

uint64_t sub_2422DE340()
{
  return 0x6168706C61;
}

MonogramPoster::MonogramPosterUserInfoKey_optional __swiftcall MonogramPosterUserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  MonogramPoster::MonogramPosterUserInfoKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2422DEDF0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

unint64_t MonogramPosterUserInfoKey.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0xD00000000000001ALL;
}

uint64_t sub_2422DE3F4(char *a1, char *a2)
{
  return sub_2422DE52C(*a1, *a2);
}

void sub_2422DE400(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2422DE440(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2422DE494 + 4 * byte_2422DF5B8[a2]))(0x6E65657267);
}

uint64_t sub_2422DE494(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6E65657267 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_2422DEE44();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2422DE52C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000012;
  else
    v3 = 0xD00000000000001ALL;
  if (v2)
    v4 = 0x80000002422DF780;
  else
    v4 = 0x80000002422DF7A0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000012;
  else
    v5 = 0xD00000000000001ALL;
  if ((a2 & 1) != 0)
    v6 = 0x80000002422DF7A0;
  else
    v6 = 0x80000002422DF780;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2422DEE44();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2422DE5D4()
{
  return sub_2422DE5DC();
}

uint64_t sub_2422DE5DC()
{
  sub_2422DEE5C();
  sub_2422DED9C();
  swift_bridgeObjectRelease();
  return sub_2422DEE80();
}

uint64_t sub_2422DE660()
{
  sub_2422DED9C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2422DE6C0()
{
  return sub_2422DE6C8();
}

uint64_t sub_2422DE6C8()
{
  sub_2422DEE5C();
  sub_2422DED9C();
  swift_bridgeObjectRelease();
  return sub_2422DEE80();
}

MonogramPoster::MonogramPosterUserInfoKey_optional sub_2422DE748(Swift::String *a1)
{
  return MonogramPosterUserInfoKey.init(rawValue:)(*a1);
}

void sub_2422DE754(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000012;
  else
    v2 = 0xD00000000000001ALL;
  v3 = 0x80000002422DF780;
  if (*v1)
    v3 = 0x80000002422DF7A0;
  *a1 = v2;
  a1[1] = v3;
}

MonogramPoster::MonogramPosterColorDescriptionKey_optional __swiftcall MonogramPosterColorDescriptionKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MonogramPoster::MonogramPosterColorDescriptionKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2422DEDF0();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_2422DE7F0(char *a1)
{
  sub_2422DE400(*a1);
}

void sub_2422DE7FC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2422DEE5C();
  __asm { BR              X9 }
}

uint64_t sub_2422DE840()
{
  sub_2422DED9C();
  swift_bridgeObjectRelease();
  return sub_2422DEE80();
}

void sub_2422DE8A0()
{
  __asm { BR              X10 }
}

uint64_t sub_2422DE8D4()
{
  sub_2422DED9C();
  return swift_bridgeObjectRelease();
}

void sub_2422DE920()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2422DEE5C();
  __asm { BR              X9 }
}

uint64_t sub_2422DE960()
{
  sub_2422DED9C();
  swift_bridgeObjectRelease();
  return sub_2422DEE80();
}

MonogramPoster::MonogramPosterColorDescriptionKey_optional sub_2422DE9C0(Swift::String *a1)
{
  return MonogramPosterColorDescriptionKey.init(rawValue:)(*a1);
}

uint64_t sub_2422DE9CC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2422DE9F4 + 4 * byte_2422DF5C8[*v0]))();
}

void sub_2422DE9F4(_QWORD *a1@<X8>)
{
  *a1 = 0x6E65657267;
  a1[1] = 0xE500000000000000;
}

void sub_2422DEA0C(_QWORD *a1@<X8>)
{
  *a1 = 1702194274;
  a1[1] = 0xE400000000000000;
}

void sub_2422DEA20(_QWORD *a1@<X8>)
{
  *a1 = 0x6168706C61;
  a1[1] = 0xE500000000000000;
}

float MonogramPosterOffset.getter()
{
  return 0.445;
}

unint64_t sub_2422DEA4C()
{
  unint64_t result;

  result = qword_2571FC068;
  if (!qword_2571FC068)
  {
    result = MEMORY[0x2426A74CC](&protocol conformance descriptor for MonogramPosterUserInfoKey, &type metadata for MonogramPosterUserInfoKey);
    atomic_store(result, (unint64_t *)&qword_2571FC068);
  }
  return result;
}

unint64_t sub_2422DEA94()
{
  unint64_t result;

  result = qword_2571FC070;
  if (!qword_2571FC070)
  {
    result = MEMORY[0x2426A74CC](&protocol conformance descriptor for MonogramPosterColorDescriptionKey, &type metadata for MonogramPosterColorDescriptionKey);
    atomic_store(result, (unint64_t *)&qword_2571FC070);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MonogramPosterUserInfoKey(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MonogramPosterUserInfoKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2422DEBB4 + 4 * byte_2422DF5D1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2422DEBE8 + 4 * byte_2422DF5CC[v4]))();
}

uint64_t sub_2422DEBE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DEBF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2422DEBF8);
  return result;
}

uint64_t sub_2422DEC04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2422DEC0CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2422DEC10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DEC18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2422DEC24(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterUserInfoKey()
{
  return &type metadata for MonogramPosterUserInfoKey;
}

uint64_t storeEnumTagSinglePayload for MonogramPosterColorDescriptionKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2422DEC8C + 4 * byte_2422DF5DB[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2422DECC0 + 4 * byte_2422DF5D6[v4]))();
}

uint64_t sub_2422DECC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DECC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2422DECD0);
  return result;
}

uint64_t sub_2422DECDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2422DECE4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2422DECE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422DECF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterColorDescriptionKey()
{
  return &type metadata for MonogramPosterColorDescriptionKey;
}

uint64_t sub_2422DED0C()
{
  return MEMORY[0x24BDCEAD0]();
}

uint64_t sub_2422DED18()
{
  return MEMORY[0x24BDCEAE0]();
}

uint64_t sub_2422DED24()
{
  return MEMORY[0x24BDCEAF8]();
}

uint64_t sub_2422DED30()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_2422DED3C()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_2422DED48()
{
  return MEMORY[0x24BDCECD0]();
}

uint64_t sub_2422DED54()
{
  return MEMORY[0x24BDCEDB8]();
}

uint64_t sub_2422DED60()
{
  return MEMORY[0x24BDCEDC8]();
}

uint64_t sub_2422DED6C()
{
  return MEMORY[0x24BEE02A8]();
}

uint64_t sub_2422DED78()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2422DED84()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2422DED90()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2422DED9C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2422DEDA8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2422DEDB4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2422DEDC0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2422DEDCC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2422DEDD8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2422DEDE4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2422DEDF0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2422DEDFC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2422DEE08()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2422DEE14()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2422DEE20()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2422DEE2C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2422DEE38()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2422DEE44()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2422DEE50()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2422DEE5C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2422DEE68()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2422DEE74()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2422DEE80()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2422DEE8C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2422DEE98()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2422DEEA4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2422DEEB0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t CNIsArabicString()
{
  return MEMORY[0x24BE191B8]();
}

uint64_t CNIsChineseJapaneseKoreanString()
{
  return MEMORY[0x24BE191C8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

