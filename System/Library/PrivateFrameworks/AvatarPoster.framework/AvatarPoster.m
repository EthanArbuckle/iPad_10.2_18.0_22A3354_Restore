uint64_t PRPosterBoundingShape.contactsUIBoundingShape.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256451040);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236DE1860();
  v4 = sub_236DE186C();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v3, v4);
  sub_236DDF968((uint64_t)v3);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(a1, *MEMORY[0x24BDBADC8], v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B804150]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_236DDF968(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256451040);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id AvatarPosterConfiguration.avatarRecord.getter()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v0 = sub_236DE1890();
  if (v1 >> 60 == 15)
    return 0;
  v3 = v0;
  v4 = v1;
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_236DE18B4();
  v2 = objc_msgSend(v5, sel_avatarRecordFromData_, v6);
  sub_236DDFA3C(v3, v4);

  return v2;
}

uint64_t sub_236DDFA3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_236DDFA50(a1, a2);
  return a1;
}

uint64_t sub_236DDFA50(uint64_t a1, unint64_t a2)
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

uint64_t AvatarPosterConfiguration.debugDescription.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  sub_236DE18D8();
  sub_236DE18CC();
  sub_236DE189C();
  sub_236DE18C0();
  swift_bridgeObjectRelease();
  sub_236DE18CC();
  swift_bridgeObjectRelease();
  sub_236DE18CC();
  v0 = sub_236DE1890();
  if (v1 >> 60 != 15)
  {
    v2 = v0;
    v3 = v1;
    sub_236DE18A8();
    sub_236DDFA3C(v2, v3);
  }
  sub_236DE18CC();
  swift_bridgeObjectRelease();
  sub_236DE18CC();
  v4 = sub_236DE1878();
  if (v5 >> 60 != 15)
  {
    v6 = v4;
    v7 = v5;
    sub_236DE18A8();
    sub_236DDFA3C(v6, v7);
  }
  sub_236DE18CC();
  swift_bridgeObjectRelease();
  sub_236DE18CC();
  v8 = sub_236DE1884();
  if (v9 >> 60 != 15)
  {
    v10 = v8;
    v11 = v9;
    sub_236DE18A8();
    sub_236DDFA3C(v10, v11);
  }
  sub_236DE18CC();
  swift_bridgeObjectRelease();
  return 0;
}

id AvatarPosterBackgroundColor.topColor.getter()
{
  id *v0;

  return *v0;
}

id AvatarPosterBackgroundColor.bottomColor.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

AvatarPoster::AvatarPosterBackgroundColor __swiftcall AvatarPosterBackgroundColor.init(topColor:bottomColor:)(UIColor topColor, UIColor bottomColor)
{
  UIColor *v2;
  AvatarPoster::AvatarPosterBackgroundColor result;

  v2->super.isa = topColor.super.isa;
  v2[1].super.isa = bottomColor.super.isa;
  result.bottomColor = bottomColor;
  result.topColor = topColor;
  return result;
}

id sub_236DDFCE8()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.658823529, 0.678431373, 0.729411765, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.529411765, 0.549019608, 0.588235294, 1.0);
  qword_256451078 = (uint64_t)v0;
  unk_256451080 = result;
  return result;
}

id sub_236DDFD78()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.803921569, 0.97254902, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.709803922, 0.643137255, 0.949019608, 1.0);
  qword_256451088 = (uint64_t)v0;
  unk_256451090 = result;
  return result;
}

id sub_236DDFE0C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.701960784, 0.835294118, 0.937254902, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.454901961, 0.698039216, 0.88627451, 1.0);
  qword_256451098 = (uint64_t)v0;
  unk_2564510A0 = result;
  return result;
}

id sub_236DDFE9C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.964705882, 0.721568627, 0.8, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.937254902, 0.490196078, 0.639215686, 1.0);
  qword_2564510A8 = (uint64_t)v0;
  unk_2564510B0 = result;
  return result;
}

id sub_236DDFF2C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.960784314, 0.850980392, 0.68627451, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.929411765, 0.725490196, 0.431372549, 1.0);
  qword_2564510B8 = (uint64_t)v0;
  unk_2564510C0 = result;
  return result;
}

id sub_236DDFFBC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.792156863, 0.949019608, 0.741176471, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.623529412, 0.905882353, 0.529411765, 1.0);
  qword_2564510C8 = (uint64_t)v0;
  unk_2564510D0 = result;
  return result;
}

id sub_236DE004C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.882352941, 0.776470588, 0.764705882, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.788235294, 0.592156863, 0.57254902, 1.0);
  qword_2564510D8 = (uint64_t)v0;
  unk_2564510E0 = result;
  return result;
}

id sub_236DE00E4()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.764705882, 0.662745098, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.894117647, 0.568627451, 0.388235294, 1.0);
  qword_2564510E8 = (uint64_t)v0;
  unk_2564510F0 = result;
  return result;
}

id sub_236DE017C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.807843137, 0.870588235, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.705882353, 0.647058824, 0.764705882, 1.0);
  qword_2564510F8 = (uint64_t)v0;
  unk_256451100 = result;
  return result;
}

id sub_236DE0210()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.780392157, 0.843137255, 0.905882353, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.603921569, 0.717647059, 0.82745098, 1.0);
  qword_256451108 = (uint64_t)v0;
  unk_256451110 = result;
  return result;
}

id sub_236DE02A0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.815686275, 0.909803922, 0.917647059, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.835294118, 0.847058824, 1.0);
  qword_256451118 = (uint64_t)v0;
  unk_256451120 = result;
  return result;
}

id sub_236DE0334()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.717647059, 0.925490196, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.890196078, 0.48627451, 0.866666667, 1.0);
  qword_256451128 = (uint64_t)v0;
  unk_256451130 = result;
  return result;
}

id sub_236DE03D0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.941176471, 0.949019608, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.396078431, 0.894117647, 0.905882353, 1.0);
  qword_256451138 = (uint64_t)v0;
  unk_256451140 = result;
  return result;
}

id sub_236DE0468()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.694117647, 0.956862745, 0.764705882, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.443137255, 0.921568627, 0.568627451, 1.0);
  qword_256451148 = (uint64_t)v0;
  unk_256451150 = result;
  return result;
}

id sub_236DE04FC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.850980392, 0.831372549, 0.811764706, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.725490196, 0.694117647, 0.654901961, 1.0);
  qword_256451158 = (uint64_t)v0;
  unk_256451160 = result;
  return result;
}

id sub_236DE058C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.901960784, 0.839215686, 0.749019608, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.819607843, 0.705882353, 0.541176471, 1.0);
  qword_256451168 = (uint64_t)v0;
  unk_256451170 = result;
  return result;
}

id sub_236DE061C()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.831372549, 0.866666667, 0.815686275, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.690196078, 0.760784314, 0.666666667, 1.0);
  qword_256451178 = (uint64_t)v0;
  unk_256451180 = result;
  return result;
}

id sub_236DE06B0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.560784314, 0.560784314, 0.560784314, 1.0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.2, 0.2, 0.2, 1.0);
  qword_256451188 = (uint64_t)v0;
  unk_256451190 = result;
  return result;
}

id sub_236DE0730()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_256451070);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_236DE1D20;
  if (qword_256450FA0 != -1)
    swift_once();
  v1 = (void *)qword_256451078;
  v2 = (void *)unk_256451080;
  *(_QWORD *)(v0 + 32) = qword_256451078;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = qword_256450FB8;
  v4 = v1;
  v5 = v2;
  if (v3 != -1)
    swift_once();
  v6 = (void *)qword_2564510A8;
  v7 = (void *)unk_2564510B0;
  *(_QWORD *)(v0 + 48) = qword_2564510A8;
  *(_QWORD *)(v0 + 56) = v7;
  v8 = qword_256450FD0;
  v9 = v6;
  v10 = v7;
  if (v8 != -1)
    swift_once();
  v11 = (void *)qword_2564510D8;
  v12 = (void *)unk_2564510E0;
  *(_QWORD *)(v0 + 64) = qword_2564510D8;
  *(_QWORD *)(v0 + 72) = v12;
  v13 = qword_256450FD8;
  v14 = v11;
  v15 = v12;
  if (v13 != -1)
    swift_once();
  v16 = (void *)qword_2564510E8;
  v17 = (void *)unk_2564510F0;
  *(_QWORD *)(v0 + 80) = qword_2564510E8;
  *(_QWORD *)(v0 + 88) = v17;
  v18 = qword_256450FC0;
  v19 = v16;
  v20 = v17;
  if (v18 != -1)
    swift_once();
  v21 = (void *)qword_2564510B8;
  v22 = (void *)unk_2564510C0;
  *(_QWORD *)(v0 + 96) = qword_2564510B8;
  *(_QWORD *)(v0 + 104) = v22;
  v23 = qword_256450FC8;
  v24 = v21;
  v25 = v22;
  if (v23 != -1)
    swift_once();
  v26 = (void *)qword_2564510C8;
  v27 = (void *)unk_2564510D0;
  *(_QWORD *)(v0 + 112) = qword_2564510C8;
  *(_QWORD *)(v0 + 120) = v27;
  v28 = qword_256450FB0;
  v29 = v26;
  v30 = v27;
  if (v28 != -1)
    swift_once();
  v31 = (void *)qword_256451098;
  v32 = (void *)unk_2564510A0;
  *(_QWORD *)(v0 + 128) = qword_256451098;
  *(_QWORD *)(v0 + 136) = v32;
  v33 = qword_256450FA8;
  v34 = v31;
  v35 = v32;
  if (v33 != -1)
    swift_once();
  v36 = (void *)qword_256451088;
  v37 = (void *)unk_256451090;
  *(_QWORD *)(v0 + 144) = qword_256451088;
  *(_QWORD *)(v0 + 152) = v37;
  v38 = qword_256450FE0;
  v39 = v36;
  v40 = v37;
  if (v38 != -1)
    swift_once();
  v41 = (void *)qword_2564510F8;
  v42 = (void *)unk_256451100;
  *(_QWORD *)(v0 + 160) = qword_2564510F8;
  *(_QWORD *)(v0 + 168) = v42;
  v43 = qword_256450FE8;
  v44 = v41;
  v45 = v42;
  if (v43 != -1)
    swift_once();
  v46 = (void *)qword_256451108;
  v47 = (void *)unk_256451110;
  *(_QWORD *)(v0 + 176) = qword_256451108;
  *(_QWORD *)(v0 + 184) = v47;
  v48 = qword_256450FF0;
  v49 = v46;
  v50 = v47;
  if (v48 != -1)
    swift_once();
  v51 = (void *)qword_256451118;
  v52 = (void *)unk_256451120;
  *(_QWORD *)(v0 + 192) = qword_256451118;
  *(_QWORD *)(v0 + 200) = v52;
  v53 = qword_256450FF8;
  v54 = v51;
  v55 = v52;
  if (v53 != -1)
    swift_once();
  v56 = (void *)qword_256451128;
  v57 = (void *)unk_256451130;
  *(_QWORD *)(v0 + 208) = qword_256451128;
  *(_QWORD *)(v0 + 216) = v57;
  v58 = qword_256451000;
  v59 = v56;
  v60 = v57;
  if (v58 != -1)
    swift_once();
  v61 = (void *)qword_256451138;
  v62 = (void *)unk_256451140;
  *(_QWORD *)(v0 + 224) = qword_256451138;
  *(_QWORD *)(v0 + 232) = v62;
  v63 = qword_256451008;
  v64 = v61;
  v65 = v62;
  if (v63 != -1)
    swift_once();
  v66 = (void *)qword_256451148;
  v67 = (void *)unk_256451150;
  *(_QWORD *)(v0 + 240) = qword_256451148;
  *(_QWORD *)(v0 + 248) = v67;
  v68 = qword_256451010;
  v69 = v66;
  v70 = v67;
  if (v68 != -1)
    swift_once();
  v71 = (void *)qword_256451158;
  v72 = (void *)unk_256451160;
  *(_QWORD *)(v0 + 256) = qword_256451158;
  *(_QWORD *)(v0 + 264) = v72;
  v73 = qword_256451018;
  v74 = v71;
  v75 = v72;
  if (v73 != -1)
    swift_once();
  v76 = (void *)qword_256451168;
  v77 = (void *)unk_256451170;
  *(_QWORD *)(v0 + 272) = qword_256451168;
  *(_QWORD *)(v0 + 280) = v77;
  v78 = qword_256451020;
  v79 = v76;
  v80 = v77;
  if (v78 != -1)
    swift_once();
  v81 = (void *)qword_256451178;
  v82 = (void *)unk_256451180;
  *(_QWORD *)(v0 + 288) = qword_256451178;
  *(_QWORD *)(v0 + 296) = v82;
  v83 = qword_256451028;
  v84 = v81;
  v85 = v82;
  if (v83 != -1)
    swift_once();
  v87 = (void *)qword_256451188;
  v86 = unk_256451190;
  v90 = (id)unk_256451190;
  *(_QWORD *)(v0 + 304) = qword_256451188;
  *(_QWORD *)(v0 + 312) = v86;
  off_256451048 = (_UNKNOWN *)v0;
  v88 = v87;
  return v90;
}

uint64_t AvatarPosterBackgroundColors.getter()
{
  if (qword_256451030 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_236DE0C4C()
{
  uint64_t result;

  result = sub_236DE0C68();
  qword_256451050 = result;
  return result;
}

uint64_t sub_236DE0C68()
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
  if (qword_256451030 != -1)
LABEL_22:
    swift_once();
  v0 = *((_QWORD *)off_256451048 + 2);
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256451058);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_236DE1D30;
      *(double *)(v13 + 32) = v9;
      *(double *)(v13 + 40) = v10;
      *(double *)(v13 + 48) = v11;
      *(double *)(v13 + 56) = v12;
      v14 = v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33[0] = v2;
      sub_236DE1224(v13);
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
          sub_236DE1664();
          v2 = v33[0];
          if ((v22 & 1) != 0)
            goto LABEL_4;
        }
      }
      else
      {
        sub_236DE127C(v21, isUniquelyReferenced_nonNull_native);
        sub_236DE1224(v13);
        if ((v22 & 1) != (v24 & 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256451060);
          result = sub_236DE18FC();
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

uint64_t AvatarPosterBackgroundColorBottomToTop.getter()
{
  if (qword_256451038 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AvatarPosterBackgroundColorBottomToTop.setter(uint64_t a1)
{
  if (qword_256451038 != -1)
    swift_once();
  swift_beginAccess();
  qword_256451050 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*AvatarPosterBackgroundColorBottomToTop.modify())()
{
  if (qword_256451038 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *initializeBufferWithCopyOfBuffer for AvatarPosterBackgroundColor(_QWORD *a1, uint64_t a2)
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

void destroy for AvatarPosterBackgroundColor(id *a1)
{

}

uint64_t assignWithCopy for AvatarPosterBackgroundColor(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AvatarPosterBackgroundColor(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarPosterBackgroundColor(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AvatarPosterBackgroundColor(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AvatarPosterBackgroundColor()
{
  return &type metadata for AvatarPosterBackgroundColor;
}

double sub_236DE1224(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  sub_236DE1908();
  sub_236DE1808((uint64_t)v4, a1);
  v2 = sub_236DE192C();
  return sub_236DE1588(a1, v2);
}

uint64_t sub_236DE127C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256451068);
  v36 = a2;
  result = sub_236DE18F0();
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
      sub_236DE1908();
      sub_236DE1914();
      v24 = *(_QWORD *)(v21 + 16);
      if (v24)
      {
        v25 = v21 + 32;
        do
        {
          v25 += 8;
          sub_236DE1920();
          --v24;
        }
        while (v24);
      }
      result = sub_236DE192C();
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

double sub_236DE1588(uint64_t a1, uint64_t a2)
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

id sub_236DE1664()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256451068);
  v2 = *v0;
  v3 = sub_236DE18E4();
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

uint64_t sub_236DE1808(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_236DE1914();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 8;
      result = sub_236DE1920();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_236DE1860()
{
  return MEMORY[0x24BDBADD0]();
}

uint64_t sub_236DE186C()
{
  return MEMORY[0x24BDBADD8]();
}

uint64_t sub_236DE1878()
{
  return MEMORY[0x24BDBADE8]();
}

uint64_t sub_236DE1884()
{
  return MEMORY[0x24BDBADF0]();
}

uint64_t sub_236DE1890()
{
  return MEMORY[0x24BDBADF8]();
}

uint64_t sub_236DE189C()
{
  return MEMORY[0x24BDBAE00]();
}

uint64_t sub_236DE18A8()
{
  return MEMORY[0x24BDCDC90]();
}

uint64_t sub_236DE18B4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_236DE18C0()
{
  return MEMORY[0x24BEE02A8]();
}

uint64_t sub_236DE18CC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236DE18D8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236DE18E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_236DE18F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_236DE18FC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_236DE1908()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_236DE1914()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_236DE1920()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_236DE192C()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

