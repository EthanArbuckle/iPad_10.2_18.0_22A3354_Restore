BOOL _s19HealthVisualization20DiagramConfigurationO14LinePropertiesV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _BOOL8 result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  uint64_t v55;
  __int16 v56;
  char v57;
  uint64_t v58;
  __int16 v59;
  char v60;

  v2 = *(_BYTE *)(a1 + 1);
  v3 = *(_BYTE *)(a1 + 2);
  v4 = *(_BYTE *)(a1 + 3);
  v5 = *(_BYTE *)(a1 + 4);
  v53 = *(_BYTE *)(a1 + 6);
  v54 = *(_BYTE *)(a1 + 5);
  v6 = *(_QWORD *)(a1 + 16);
  v46 = *(unsigned __int8 *)(a1 + 26);
  v45 = *(unsigned __int16 *)(a1 + 24);
  v7 = *(_BYTE *)(a2 + 1);
  v8 = *(_BYTE *)(a2 + 2);
  v51 = *(_BYTE *)(a1 + 7);
  v52 = *(_BYTE *)(a2 + 6);
  v50 = *(_BYTE *)(a1 + 8);
  v48 = *(unsigned __int8 *)(a1 + 9);
  v49 = *(_BYTE *)(a2 + 8);
  v47 = *(unsigned __int8 *)(a2 + 9);
  v42 = *(_QWORD *)(a2 + 16);
  v43 = *(unsigned __int16 *)(a2 + 24);
  v44 = *(unsigned __int8 *)(a2 + 26);
  sub_1BC999BD0(*(_BYTE *)a1);
  if ((v9 & 1) == 0)
    return 0;
  v41 = v6;
  LOBYTE(v58) = v2;
  LOBYTE(v55) = v7;
  v10 = DiagramConfiguration.Color.rawValue.getter();
  v12 = v11;
  if (v10 == DiagramConfiguration.Color.rawValue.getter() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v14 & 1) == 0)
      return result;
  }
  LOBYTE(v58) = v3;
  LOBYTE(v55) = v8;
  v16 = DiagramConfiguration.Color.rawValue.getter();
  v18 = v17;
  if (v16 == DiagramConfiguration.Color.rawValue.getter() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v20 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v20 & 1) == 0)
      return result;
  }
  sub_1BC99A63C(v4);
  if ((v21 & 1) == 0)
    return 0;
  sub_1BC99A63C(v5);
  if ((v22 & 1) == 0)
    return 0;
  sub_1BC99A3B0(v54);
  if ((v23 & 1) == 0)
    return 0;
  LOBYTE(v58) = v53;
  LOBYTE(v55) = v52;
  v24 = DiagramConfiguration.Color.rawValue.getter();
  v26 = v25;
  if (v24 == DiagramConfiguration.Color.rawValue.getter() && v26 == v27)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v28 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v28 & 1) == 0)
      return result;
  }
  sub_1BC999BD0(v51);
  if ((v29 & 1) == 0)
    return 0;
  LOBYTE(v58) = v50;
  LOBYTE(v55) = v49;
  v30 = DiagramConfiguration.TextAttributes.rawValue.getter();
  v32 = v31;
  if (v30 == DiagramConfiguration.TextAttributes.rawValue.getter() && v32 == v33)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v34 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v34 & 1) == 0)
      return result;
  }
  v35 = 0x746E65746E6F43;
  if (v48)
  {
    if (v48 == 1)
    {
      v36 = 0x80000001BCACD8D0;
      v37 = 0xD000000000000012;
    }
    else
    {
      v37 = 0x636E657265666552;
      v36 = 0xED0000656E694C65;
    }
  }
  else
  {
    v36 = 0xE700000000000000;
    v37 = 0x746E65746E6F43;
  }
  if (v47)
  {
    if (v47 == 1)
    {
      v38 = 0x80000001BCACD8D0;
      v35 = 0xD000000000000012;
    }
    else
    {
      v35 = 0x636E657265666552;
      v38 = 0xED0000656E694C65;
    }
  }
  else
  {
    v38 = 0xE700000000000000;
  }
  if (v37 == v35 && v36 == v38)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v39 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v39 & 1) == 0)
      return result;
  }
  v40 = v43 | (v44 << 16);
  if ((~(v45 | (v46 << 16)) & 0xFEE0E0) != 0)
  {
    v58 = v41;
    v59 = v45;
    v60 = (v45 | (v46 << 16)) >> 16;
    if ((~v40 & 0xFEE0E0) == 0)
      return 0;
    v55 = v42;
    v56 = v43;
    v57 = (v43 | (v44 << 16)) >> 16;
    return (_s19HealthVisualization20DiagramConfigurationO010PointLabelD0O2eeoiySbAE_AEtFZ_0(&v58, &v55) & 1) != 0;
  }
  return (~v40 & 0xFEE0E0) == 0;
}

void _s19HealthVisualization20DiagramConfigurationO17HeartRateRecoveryV2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v1 = *(_BYTE *)(a1 + 1);
  v2 = *(_BYTE *)(a1 + 3);
  v3 = DiagramConfiguration.Color.rawValue.getter();
  v5 = v4;
  if (v3 == DiagramConfiguration.Color.rawValue.getter() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v7 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
      return;
  }
  sub_1BC99A63C(v1);
  if ((v8 & 1) != 0)
  {
    v9 = DiagramConfiguration.Color.rawValue.getter();
    v11 = v10;
    if (v9 == DiagramConfiguration.Color.rawValue.getter() && v11 == v12)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v13 = sub_1BCAB67C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
        return;
    }
    sub_1BC999BD0(v2);
  }
}

void _s19HealthVisualization20DiagramConfigurationO3BarV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  int v4;
  int v5;
  double v6;
  char v7;
  char v8;
  int v9;
  int v10;
  char v11;
  double v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  unsigned int v71;
  __int16 v72;
  char v73;
  int v74;
  __int16 v75;
  char v76;
  uint64_t v77;
  int v78;
  __int16 v79;

  v2 = *(_BYTE *)(a1 + 1);
  v3 = *(_BYTE *)(a1 + 2);
  v4 = *(unsigned __int8 *)(a1 + 3);
  v5 = *(unsigned __int8 *)(a1 + 4);
  v69 = *(_BYTE *)(a1 + 6);
  v70 = *(_BYTE *)(a1 + 5);
  v6 = *(double *)(a1 + 16);
  v61 = *(_QWORD *)(a1 + 24);
  v60 = *(unsigned __int16 *)(a1 + 36);
  v59 = *(unsigned int *)(a1 + 32);
  v58 = *(_BYTE *)(a1 + 38);
  v7 = *(_BYTE *)(a2 + 1);
  v8 = *(_BYTE *)(a2 + 2);
  v9 = *(unsigned __int8 *)(a2 + 3);
  v10 = *(unsigned __int8 *)(a2 + 4);
  v11 = *(_BYTE *)(a2 + 5);
  v67 = *(_BYTE *)(a1 + 7);
  v68 = *(_BYTE *)(a2 + 6);
  v65 = *(_BYTE *)(a1 + 8);
  v66 = *(_BYTE *)(a2 + 7);
  v64 = *(_BYTE *)(a1 + 9);
  v63 = *(_BYTE *)(a2 + 9);
  v12 = *(double *)(a2 + 16);
  v62 = *(_QWORD *)(a2 + 24);
  v57 = *(unsigned __int16 *)(a2 + 36);
  v56 = *(unsigned int *)(a2 + 32);
  sub_1BC999F10(*(_BYTE *)a1);
  if ((v13 & 1) == 0)
    return;
  LOBYTE(v77) = v2;
  LOBYTE(v71) = v7;
  v14 = DiagramConfiguration.Color.rawValue.getter();
  v16 = v15;
  if (v14 == DiagramConfiguration.Color.rawValue.getter() && v16 == v17)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
      return;
  }
  LOBYTE(v77) = v3;
  LOBYTE(v71) = v8;
  v19 = DiagramConfiguration.Color.rawValue.getter();
  v21 = v20;
  if (v19 == DiagramConfiguration.Color.rawValue.getter() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v23 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
      return;
  }
  v24 = 0x80000001BCACDFA0;
  v25 = 0xD000000000000011;
  if (v4)
  {
    if (v4 == 1)
    {
      v26 = 0x6E726F436F72657ALL;
      v27 = 0xEE00657A69537265;
      if (!v9)
        goto LABEL_19;
    }
    else
    {
      v26 = 0xD000000000000012;
      v27 = 0x80000001BCACDFD0;
      if (!v9)
        goto LABEL_19;
    }
  }
  else
  {
    v26 = 0xD000000000000011;
    v27 = 0x80000001BCACDFA0;
    if (!v9)
    {
LABEL_19:
      if (v26 != v25)
        goto LABEL_24;
      goto LABEL_22;
    }
  }
  if (v9 == 1)
  {
    v25 = 0x6E726F436F72657ALL;
    v24 = 0xEE00657A69537265;
    goto LABEL_19;
  }
  v24 = 0x80000001BCACDFD0;
  if (v26 != 0xD000000000000012)
    goto LABEL_24;
LABEL_22:
  if (v27 == v24)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_25;
  }
LABEL_24:
  v28 = sub_1BCAB67C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
    return;
LABEL_25:
  if (v5 == 35)
  {
    if (v10 != 35)
      return;
  }
  else
  {
    if (v10 == 35)
      return;
    LOBYTE(v77) = v5;
    LOBYTE(v71) = v10;
    v29 = DiagramConfiguration.Color.rawValue.getter();
    v31 = v30;
    if (v29 == DiagramConfiguration.Color.rawValue.getter() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v33 = sub_1BCAB67C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
        return;
    }
  }
  LOBYTE(v77) = v70;
  LOBYTE(v71) = v11;
  v34 = DiagramConfiguration.Color.rawValue.getter();
  v36 = v35;
  if (v34 == DiagramConfiguration.Color.rawValue.getter() && v36 == v37)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v38 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v38 & 1) == 0)
      return;
  }
  LOBYTE(v77) = v69;
  LOBYTE(v71) = v68;
  v39 = DiagramConfiguration.Color.rawValue.getter();
  v41 = v40;
  if (v39 == DiagramConfiguration.Color.rawValue.getter() && v41 == v42)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v43 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
      return;
  }
  LOBYTE(v77) = v67;
  LOBYTE(v71) = v66;
  v44 = DiagramConfiguration.TextAttributes.rawValue.getter();
  v46 = v45;
  if (v44 == DiagramConfiguration.TextAttributes.rawValue.getter() && v46 == v47)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v48 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v48 & 1) == 0)
      return;
  }
  sub_1BC99A3B0(v65);
  if ((v49 & 1) != 0)
  {
    LOBYTE(v77) = v64;
    LOBYTE(v71) = v63;
    v50 = DiagramConfiguration.TextAttributes.rawValue.getter();
    v52 = v51;
    if (v50 == DiagramConfiguration.TextAttributes.rawValue.getter() && v52 == v53)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v54 = sub_1BCAB67C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v54 & 1) == 0)
        return;
    }
    if (v6 == v12)
    {
      if ((v61 & 0xFF00000000) == 0x300000000)
      {
        if ((v62 & 0xFF00000000) != 0x300000000)
          return;
LABEL_56:
        sub_1BC99A088(v58);
        return;
      }
      v77 = v61;
      v78 = v59;
      v79 = (v59 | (unint64_t)(v60 << 32)) >> 32;
      if ((v62 & 0xFF00000000) != 0x300000000)
      {
        v71 = v62;
        v73 = BYTE6(v62);
        *((_QWORD *)&v55 + 1) = v56 | (v57 << 32);
        *(_QWORD *)&v55 = v62;
        v72 = WORD2(v62);
        v74 = v55 >> 56;
        v76 = (unint64_t)(v55 >> 56) >> 48;
        v75 = (unint64_t)(v55 >> 56) >> 32;
        if ((_s19HealthVisualization20DiagramConfigurationO4AxisV2eeoiySbAE_AEtFZ_0((unsigned int *)&v77, &v71) & 1) != 0)
          goto LABEL_56;
      }
    }
  }
}

void _s19HealthVisualization20DiagramConfigurationO4LineV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  int v13;
  char v14;
  char v15;
  char v16;
  unsigned int v17;
  __int16 v18;
  char v19;
  int v20;
  __int16 v21;
  char v22;
  uint64_t v23;
  int v24;
  __int16 v25;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned __int16 *)(a1 + 20);
  v4 = *(unsigned int *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(unsigned __int8 *)(a1 + 32);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(unsigned __int16 *)(a2 + 20);
  v9 = *(unsigned int *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(unsigned __int8 *)(a2 + 32);
  v16 = *(_BYTE *)(a1 + 33);
  if (!sub_1BC9A8DB8(*(_QWORD *)a1, *(_QWORD *)a2))
    return;
  if ((v2 & 0xFF00000000) == 0x300000000)
  {
    if ((v7 & 0xFF00000000) != 0x300000000)
      return;
  }
  else
  {
    v23 = v2;
    v24 = v4;
    v25 = (v4 | (unint64_t)(v3 << 32)) >> 32;
    if ((v7 & 0xFF00000000) == 0x300000000)
      return;
    v17 = v7;
    v19 = BYTE6(v7);
    *((_QWORD *)&v12 + 1) = v9 | (v8 << 32);
    *(_QWORD *)&v12 = v7;
    v18 = WORD2(v7);
    v20 = v12 >> 56;
    v22 = (unint64_t)(v12 >> 56) >> 48;
    v21 = (unint64_t)(v12 >> 56) >> 32;
    if ((_s19HealthVisualization20DiagramConfigurationO4AxisV2eeoiySbAE_AEtFZ_0((unsigned int *)&v23, &v17) & 1) == 0)
      return;
  }
  if (v6)
  {
    if (v5)
    {
      if (v10)
        v13 = v11;
      else
        v13 = 0;
      if (v13 != 1)
        return;
LABEL_18:
      sub_1BC99A088(v16);
      return;
    }
    if (v10)
      v15 = 0;
    else
      v15 = v11;
    if ((v15 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
    if (v5 == v10)
      v14 = v11;
    else
      v14 = 1;
    if ((v14 & 1) == 0)
      goto LABEL_18;
  }
}

uint64_t _s19HealthVisualization20DiagramConfigurationO6BannerV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (v3 = 0, (sub_1BCAB67C8() & 1) != 0))
  {
    v4 = DiagramConfiguration.TextAttributes.rawValue.getter();
    v6 = v5;
    if (v4 == DiagramConfiguration.TextAttributes.rawValue.getter() && v6 == v7)
      v3 = 1;
    else
      v3 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v3 & 1;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO8AxisOnlyV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  int v19;
  __int16 v20;
  char v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  int v41;
  int v42;
  unsigned int v43;
  __int16 v44;
  char v45;
  int v46;
  __int16 v47;
  char v48;
  unsigned int v49;
  __int16 v50;
  char v51;
  int v52;
  __int16 v53;
  char v54;

  v2 = *(_DWORD *)a1;
  v3 = *(unsigned __int8 *)(a1 + 14);
  v4 = *(unsigned __int8 *)(a1 + 15);
  v5 = *(unsigned __int8 *)(a1 + 16);
  v6 = *(unsigned __int8 *)(a1 + 17);
  v7 = *(unsigned __int8 *)(a1 + 18);
  v8 = *(_WORD *)(a1 + 4);
  v9 = *(_DWORD *)(a1 + 7);
  v10 = *(_WORD *)(a1 + 11);
  v11 = *(_DWORD *)a2;
  v12 = *(unsigned __int8 *)(a2 + 14);
  v13 = *(unsigned __int8 *)(a2 + 15);
  v14 = *(unsigned __int8 *)(a2 + 16);
  v15 = *(unsigned __int8 *)(a2 + 17);
  v16 = *(unsigned __int8 *)(a2 + 18);
  v17 = *(_WORD *)(a2 + 4);
  v18 = a2 + 7;
  v19 = *(_DWORD *)(a2 + 7);
  v20 = *(_WORD *)(a2 + 11);
  v21 = *(_BYTE *)(a1 + 13);
  v22 = *(_BYTE *)(a2 + 6);
  LOBYTE(v18) = *(_BYTE *)(v18 + 6);
  v51 = *(_BYTE *)(a1 + 6);
  v50 = v8;
  v49 = v2;
  v54 = v21;
  v53 = v10;
  v52 = v9;
  v45 = v22;
  v44 = v17;
  v43 = v11;
  v48 = v18;
  v47 = v20;
  v46 = v19;
  if ((_s19HealthVisualization20DiagramConfigurationO4AxisV2eeoiySbAE_AEtFZ_0(&v49, &v43) & 1) == 0)
    return 0;
  v42 = v7;
  v23 = 0xEC0000007465736ELL;
  if (!v3)
  {
    v24 = 0x49746C7561666564;
    v25 = 0xEC0000007465736ELL;
    if (v12)
      goto LABEL_8;
    goto LABEL_11;
  }
  if (v3 != 1)
  {
    v25 = 0xE700000000000000;
    v24 = 0x7465736E496F6ELL;
    if (v12)
      goto LABEL_8;
LABEL_11:
    v27 = 0x49746C7561666564;
    v28 = 0xEC0000007465736ELL;
    goto LABEL_13;
  }
  v24 = 0x65736E4965646977;
  v25 = 0xE900000000000074;
  if (!v12)
    goto LABEL_11;
LABEL_8:
  if (v12 == 1)
  {
    v27 = 0x65736E4965646977;
    v28 = 0xE900000000000074;
  }
  else
  {
    v28 = 0xE700000000000000;
    v27 = 0x7465736E496F6ELL;
  }
LABEL_13:
  v41 = v16;
  if (v24 == v27 && v25 == v28)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v29 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v29 & 1) == 0)
      return result;
  }
  if (v4)
  {
    if (v4 == 1)
    {
      v30 = 0x65736E4965646977;
      v31 = 0xE900000000000074;
      if (!v13)
      {
LABEL_26:
        v32 = 0xEC0000007465736ELL;
        if (v30 != 0x49746C7561666564)
          goto LABEL_31;
        goto LABEL_29;
      }
    }
    else
    {
      v31 = 0xE700000000000000;
      v30 = 0x7465736E496F6ELL;
      if (!v13)
        goto LABEL_26;
    }
  }
  else
  {
    v30 = 0x49746C7561666564;
    v31 = 0xEC0000007465736ELL;
    if (!v13)
      goto LABEL_26;
  }
  if (v13 == 1)
  {
    v32 = 0xE900000000000074;
    if (v30 != 0x65736E4965646977)
      goto LABEL_31;
  }
  else
  {
    v32 = 0xE700000000000000;
    if (v30 != 0x7465736E496F6ELL)
      goto LABEL_31;
  }
LABEL_29:
  if (v31 == v32)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_32;
  }
LABEL_31:
  v33 = sub_1BCAB67C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v33 & 1) == 0)
    return result;
LABEL_32:
  if (v5)
  {
    if (v5 == 1)
    {
      v34 = 0x65736E4965646977;
      v35 = 0xE900000000000074;
      if (!v14)
      {
LABEL_41:
        v36 = 0xEC0000007465736ELL;
        if (v34 != 0x49746C7561666564)
          goto LABEL_46;
        goto LABEL_44;
      }
    }
    else
    {
      v35 = 0xE700000000000000;
      v34 = 0x7465736E496F6ELL;
      if (!v14)
        goto LABEL_41;
    }
  }
  else
  {
    v34 = 0x49746C7561666564;
    v35 = 0xEC0000007465736ELL;
    if (!v14)
      goto LABEL_41;
  }
  if (v14 == 1)
  {
    v36 = 0xE900000000000074;
    if (v34 != 0x65736E4965646977)
      goto LABEL_46;
  }
  else
  {
    v36 = 0xE700000000000000;
    if (v34 != 0x7465736E496F6ELL)
      goto LABEL_46;
  }
LABEL_44:
  if (v35 == v36)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_47;
  }
LABEL_46:
  v37 = sub_1BCAB67C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v37 & 1) == 0)
    return result;
LABEL_47:
  if (!v6)
  {
    v38 = 0x49746C7561666564;
    v39 = 0xEC0000007465736ELL;
    if (!v15)
      goto LABEL_56;
    goto LABEL_52;
  }
  if (v6 != 1)
  {
    v39 = 0xE700000000000000;
    v38 = 0x7465736E496F6ELL;
    if (!v15)
      goto LABEL_56;
LABEL_52:
    if (v15 == 1)
    {
      v23 = 0xE900000000000074;
      if (v38 != 0x65736E4965646977)
        goto LABEL_61;
    }
    else
    {
      v23 = 0xE700000000000000;
      if (v38 != 0x7465736E496F6ELL)
        goto LABEL_61;
    }
    goto LABEL_59;
  }
  v38 = 0x65736E4965646977;
  v39 = 0xE900000000000074;
  if (v15)
    goto LABEL_52;
LABEL_56:
  if (v38 != 0x49746C7561666564)
  {
LABEL_61:
    v40 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v40 & 1) == 0)
      return result;
    return v42 ^ v41 ^ 1u;
  }
LABEL_59:
  if (v39 != v23)
    goto LABEL_61;
  swift_bridgeObjectRelease_n();
  return v42 ^ v41 ^ 1u;
}

void _s19HealthVisualization20DiagramConfigurationO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BCAA16CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  __int16 v28;
  char v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __int16 v35;
  char v36;
  _BYTE v37[296];

  if (v14 >= 0x20)
  {
    sub_1BC9E5B8C(v15, v13, v12, a4, a5, v17, v19, a8, a1, v18, a2, v14);
    sub_1BCAA8F48((uint64_t)v37);
    v21 = 0;
  }
  else
  {
    v30 = v16;
    v31 = v8;
    v32 = v11;
    v33 = v10;
    v34 = v9;
    v35 = WORD2(v9);
    v36 = BYTE6(v9);
    v23 = v15;
    v24 = v13;
    v25 = v12;
    v26 = a4;
    v28 = WORD2(a5);
    v27 = a5;
    v29 = BYTE6(a5);
    _s19HealthVisualization20DiagramConfigurationO3BarV2eeoiySbAE_AEtFZ_0((uint64_t)&v30, (uint64_t)&v23);
    v21 = v20;
    sub_1BCAA8F48((uint64_t)v37);
  }
  return v21 & 1;
}

unint64_t sub_1BCAA1EE4()
{
  unint64_t result;

  result = qword_1ED6C6858;
  if (!qword_1ED6C6858)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfigurationKeys, &type metadata for DiagramConfiguration.PointLabelConfigurationKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6858);
  }
  return result;
}

unint64_t sub_1BCAA1F28()
{
  unint64_t result;

  result = qword_1EF47A390;
  if (!qword_1EF47A390)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelAllPointsConfiguration, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EF47A390);
  }
  return result;
}

unint64_t sub_1BCAA1F6C()
{
  unint64_t result;

  result = qword_1ED6C2CE8;
  if (!qword_1ED6C2CE8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxConfiguration, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration);
    atomic_store(result, (unint64_t *)&qword_1ED6C2CE8);
  }
  return result;
}

unint64_t sub_1BCAA1FB0()
{
  unint64_t result;

  result = qword_1EF47A398;
  if (!qword_1EF47A398)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelAllPointsConfiguration, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EF47A398);
  }
  return result;
}

unint64_t sub_1BCAA1FF4()
{
  unint64_t result;

  result = qword_1ED6C6878;
  if (!qword_1ED6C6878)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxConfiguration, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration);
    atomic_store(result, (unint64_t *)&qword_1ED6C6878);
  }
  return result;
}

unint64_t sub_1BCAA2038()
{
  unint64_t result;

  result = qword_1ED6C6860;
  if (!qword_1ED6C6860)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACC044, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6860);
  }
  return result;
}

unint64_t sub_1BCAA207C()
{
  unint64_t result;

  result = qword_1ED6C2D10;
  if (!qword_1ED6C2D10)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1ED6C2D10);
  }
  return result;
}

unint64_t sub_1BCAA20C0()
{
  unint64_t result;

  result = qword_1ED6C6A70;
  if (!qword_1ED6C6A70)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.TextAttributes, &type metadata for DiagramConfiguration.TextAttributes);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A70);
  }
  return result;
}

unint64_t sub_1BCAA2104()
{
  unint64_t result;

  result = qword_1ED6C68D8;
  if (!qword_1ED6C68D8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1ED6C68D8);
  }
  return result;
}

unint64_t sub_1BCAA2148()
{
  unint64_t result;

  result = qword_1ED6C7370;
  if (!qword_1ED6C7370)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.TextAttributes, &type metadata for DiagramConfiguration.TextAttributes);
    atomic_store(result, (unint64_t *)&qword_1ED6C7370);
  }
  return result;
}

unint64_t sub_1BCAA218C()
{
  unint64_t result;

  result = qword_1EF47A3A8;
  if (!qword_1EF47A3A8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBFF4, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A3A8);
  }
  return result;
}

unint64_t sub_1BCAA21D0()
{
  unint64_t result;

  result = qword_1EF47A3B0;
  if (!qword_1EF47A3B0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelAllPointsAttributes, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes);
    atomic_store(result, (unint64_t *)&qword_1EF47A3B0);
  }
  return result;
}

unint64_t sub_1BCAA2214()
{
  unint64_t result;

  result = qword_1EF47A3C0;
  if (!qword_1EF47A3C0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelAllPointsAttributes, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes);
    atomic_store(result, (unint64_t *)&qword_1EF47A3C0);
  }
  return result;
}

unint64_t sub_1BCAA2258()
{
  unint64_t result;

  result = qword_1EF47A3D0;
  if (!qword_1EF47A3D0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBFA4, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A3D0);
  }
  return result;
}

unint64_t sub_1BCAA229C()
{
  unint64_t result;

  result = qword_1ED6C71A0;
  if (!qword_1ED6C71A0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBF54, &type metadata for DiagramConfiguration.Bar.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C71A0);
  }
  return result;
}

unint64_t sub_1BCAA22E0()
{
  unint64_t result;

  result = qword_1ED6C5CC0;
  if (!qword_1ED6C5CC0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.BarWidth, &type metadata for DiagramConfiguration.BarWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C5CC0);
  }
  return result;
}

unint64_t sub_1BCAA2324()
{
  unint64_t result;

  result = qword_1ED6C6AA8;
  if (!qword_1ED6C6AA8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Color, &type metadata for DiagramConfiguration.Color);
    atomic_store(result, (unint64_t *)&qword_1ED6C6AA8);
  }
  return result;
}

unint64_t sub_1BCAA2368()
{
  unint64_t result;

  result = qword_1ED6C5CB0;
  if (!qword_1ED6C5CB0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.CornerSize, &type metadata for DiagramConfiguration.CornerSize);
    atomic_store(result, (unint64_t *)&qword_1ED6C5CB0);
  }
  return result;
}

unint64_t sub_1BCAA23AC()
{
  unint64_t result;

  result = qword_1ED6C6A90;
  if (!qword_1ED6C6A90)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ReferenceAnnotationPosition, &type metadata for DiagramConfiguration.ReferenceAnnotationPosition);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A90);
  }
  return result;
}

unint64_t sub_1BCAA23F0()
{
  unint64_t result;

  result = qword_1ED6C6A98;
  if (!qword_1ED6C6A98)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Axis, &type metadata for DiagramConfiguration.Axis);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A98);
  }
  return result;
}

unint64_t sub_1BCAA2434()
{
  unint64_t result;

  result = qword_1ED6C6AB0;
  if (!qword_1ED6C6AB0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Insets, &type metadata for DiagramConfiguration.Insets);
    atomic_store(result, (unint64_t *)&qword_1ED6C6AB0);
  }
  return result;
}

unint64_t sub_1BCAA2478()
{
  unint64_t result;

  result = qword_1ED6C68E8;
  if (!qword_1ED6C68E8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.BarWidth, &type metadata for DiagramConfiguration.BarWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C68E8);
  }
  return result;
}

unint64_t sub_1BCAA24BC()
{
  unint64_t result;

  result = qword_1ED6C73D0;
  if (!qword_1ED6C73D0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Color, &type metadata for DiagramConfiguration.Color);
    atomic_store(result, (unint64_t *)&qword_1ED6C73D0);
  }
  return result;
}

unint64_t sub_1BCAA2500()
{
  unint64_t result;

  result = qword_1ED6C6880;
  if (!qword_1ED6C6880)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.CornerSize, &type metadata for DiagramConfiguration.CornerSize);
    atomic_store(result, (unint64_t *)&qword_1ED6C6880);
  }
  return result;
}

unint64_t sub_1BCAA2544()
{
  unint64_t result;

  result = qword_1ED6C7390;
  if (!qword_1ED6C7390)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ReferenceAnnotationPosition, &type metadata for DiagramConfiguration.ReferenceAnnotationPosition);
    atomic_store(result, (unint64_t *)&qword_1ED6C7390);
  }
  return result;
}

unint64_t sub_1BCAA2588()
{
  unint64_t result;

  result = qword_1ED6C73B0;
  if (!qword_1ED6C73B0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Axis, &type metadata for DiagramConfiguration.Axis);
    atomic_store(result, (unint64_t *)&qword_1ED6C73B0);
  }
  return result;
}

unint64_t sub_1BCAA25CC()
{
  unint64_t result;

  result = qword_1ED6C73E0;
  if (!qword_1ED6C73E0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Insets, &type metadata for DiagramConfiguration.Insets);
    atomic_store(result, (unint64_t *)&qword_1ED6C73E0);
  }
  return result;
}

unint64_t sub_1BCAA2610()
{
  unint64_t result;

  result = qword_1EF47A3E8;
  if (!qword_1EF47A3E8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBF04, &type metadata for DiagramConfiguration.Banner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A3E8);
  }
  return result;
}

unint64_t sub_1BCAA2654()
{
  unint64_t result;

  result = qword_1EF47A400;
  if (!qword_1EF47A400)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBEB4, &type metadata for DiagramConfiguration.AxisOnly.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A400);
  }
  return result;
}

unint64_t sub_1BCAA2698()
{
  unint64_t result;

  result = qword_1EF47A408;
  if (!qword_1EF47A408)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisInset, &type metadata for DiagramConfiguration.AxisInset);
    atomic_store(result, (unint64_t *)&qword_1EF47A408);
  }
  return result;
}

unint64_t sub_1BCAA26DC()
{
  unint64_t result;

  result = qword_1EF47A418;
  if (!qword_1EF47A418)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisInset, &type metadata for DiagramConfiguration.AxisInset);
    atomic_store(result, (unint64_t *)&qword_1EF47A418);
  }
  return result;
}

unint64_t sub_1BCAA2720()
{
  unint64_t result;

  result = qword_1ED6C7220;
  if (!qword_1ED6C7220)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBE64, &type metadata for DiagramConfiguration.Line.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7220);
  }
  return result;
}

void sub_1BCAA2764()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C7250)
  {
    v0 = sub_1BCAB6060();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C7250);
  }
}

unint64_t sub_1BCAA27B8()
{
  unint64_t result;

  result = qword_1ED6C6A68;
  if (!qword_1ED6C6A68)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineProperties, &type metadata for DiagramConfiguration.LineProperties);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A68);
  }
  return result;
}

unint64_t sub_1BCAA27FC()
{
  unint64_t result;

  result = qword_1ED6C6A78;
  if (!qword_1ED6C6A78)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ValueFormatter, &type metadata for DiagramConfiguration.ValueFormatter);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A78);
  }
  return result;
}

uint64_t sub_1BCAA2840(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1BCAA2764();
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x1BCCFBE84](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BCAA28A4()
{
  unint64_t result;

  result = qword_1ED6C7218;
  if (!qword_1ED6C7218)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineProperties, &type metadata for DiagramConfiguration.LineProperties);
    atomic_store(result, (unint64_t *)&qword_1ED6C7218);
  }
  return result;
}

unint64_t sub_1BCAA28E8()
{
  unint64_t result;

  result = qword_1ED6C7378;
  if (!qword_1ED6C7378)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ValueFormatter, &type metadata for DiagramConfiguration.ValueFormatter);
    atomic_store(result, (unint64_t *)&qword_1ED6C7378);
  }
  return result;
}

unint64_t sub_1BCAA292C()
{
  unint64_t result;

  result = qword_1ED6C7200;
  if (!qword_1ED6C7200)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBE14, &type metadata for DiagramConfiguration.LineProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7200);
  }
  return result;
}

unint64_t sub_1BCAA2970()
{
  unint64_t result;

  result = qword_1ED6C6AC0;
  if (!qword_1ED6C6AC0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineWidth, &type metadata for DiagramConfiguration.LineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C6AC0);
  }
  return result;
}

unint64_t sub_1BCAA29B4()
{
  unint64_t result;

  result = qword_1ED6C6A48;
  if (!qword_1ED6C6A48)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineRadius, &type metadata for DiagramConfiguration.LineRadius);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A48);
  }
  return result;
}

unint64_t sub_1BCAA29F8()
{
  unint64_t result;

  result = qword_1ED6C6A40;
  if (!qword_1ED6C6A40)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfiguration, &type metadata for DiagramConfiguration.PointLabelConfiguration);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A40);
  }
  return result;
}

unint64_t sub_1BCAA2A3C()
{
  unint64_t result;

  result = qword_1ED6C7248;
  if (!qword_1ED6C7248)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineWidth, &type metadata for DiagramConfiguration.LineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C7248);
  }
  return result;
}

unint64_t sub_1BCAA2A80()
{
  unint64_t result;

  result = qword_1ED6C71F8;
  if (!qword_1ED6C71F8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineRadius, &type metadata for DiagramConfiguration.LineRadius);
    atomic_store(result, (unint64_t *)&qword_1ED6C71F8);
  }
  return result;
}

unint64_t sub_1BCAA2AC4()
{
  unint64_t result;

  result = qword_1ED6C72F8;
  if (!qword_1ED6C72F8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfiguration, &type metadata for DiagramConfiguration.PointLabelConfiguration);
    atomic_store(result, (unint64_t *)&qword_1ED6C72F8);
  }
  return result;
}

unint64_t sub_1BCAA2B08()
{
  unint64_t result;

  result = qword_1ED6C6888;
  if (!qword_1ED6C6888)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBDC4, &type metadata for DiagramConfiguration.Distribution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6888);
  }
  return result;
}

unint64_t sub_1BCAA2B4C()
{
  unint64_t result;

  result = qword_1ED6C2CF8;
  if (!qword_1ED6C2CF8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionWidth, &type metadata for DiagramConfiguration.DistributionWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C2CF8);
  }
  return result;
}

unint64_t sub_1BCAA2B90()
{
  unint64_t result;

  result = qword_1ED6C2D08;
  if (!qword_1ED6C2D08)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionPadding, &type metadata for DiagramConfiguration.DistributionPadding);
    atomic_store(result, (unint64_t *)&qword_1ED6C2D08);
  }
  return result;
}

unint64_t sub_1BCAA2BD4()
{
  unint64_t result;

  result = qword_1ED6C2D00;
  if (!qword_1ED6C2D00)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionLimits, &type metadata for DiagramConfiguration.DistributionLimits);
    atomic_store(result, (unint64_t *)&qword_1ED6C2D00);
  }
  return result;
}

unint64_t sub_1BCAA2C18()
{
  unint64_t result;

  result = qword_1ED6C68B0;
  if (!qword_1ED6C68B0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionWidth, &type metadata for DiagramConfiguration.DistributionWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C68B0);
  }
  return result;
}

unint64_t sub_1BCAA2C5C()
{
  unint64_t result;

  result = qword_1ED6C68C8;
  if (!qword_1ED6C68C8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionPadding, &type metadata for DiagramConfiguration.DistributionPadding);
    atomic_store(result, (unint64_t *)&qword_1ED6C68C8);
  }
  return result;
}

unint64_t sub_1BCAA2CA0()
{
  unint64_t result;

  result = qword_1ED6C68B8;
  if (!qword_1ED6C68B8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionLimits, &type metadata for DiagramConfiguration.DistributionLimits);
    atomic_store(result, (unint64_t *)&qword_1ED6C68B8);
  }
  return result;
}

unint64_t sub_1BCAA2CE4()
{
  unint64_t result;

  result = qword_1EF47A428;
  if (!qword_1EF47A428)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBD74, &type metadata for DiagramConfiguration.DistributionLimits.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A428);
  }
  return result;
}

unint64_t sub_1BCAA2D28()
{
  unint64_t result;

  result = qword_1EF47A440;
  if (!qword_1EF47A440)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBD24, &type metadata for DiagramConfiguration.HeartRateRecovery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A440);
  }
  return result;
}

unint64_t sub_1BCAA2D6C()
{
  unint64_t result;

  result = qword_1ED6C7398;
  if (!qword_1ED6C7398)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBCD4, &type metadata for DiagramConfiguration.Axis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7398);
  }
  return result;
}

unint64_t sub_1BCAA2DB0()
{
  unint64_t result;

  result = qword_1ED6C6A58;
  if (!qword_1ED6C6A58)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisProperties, &type metadata for DiagramConfiguration.AxisProperties);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A58);
  }
  return result;
}

unint64_t sub_1BCAA2DF4()
{
  unint64_t result;

  result = qword_1ED6C7340;
  if (!qword_1ED6C7340)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisProperties, &type metadata for DiagramConfiguration.AxisProperties);
    atomic_store(result, (unint64_t *)&qword_1ED6C7340);
  }
  return result;
}

unint64_t sub_1BCAA2E38()
{
  unint64_t result;

  result = qword_1ED6C7328;
  if (!qword_1ED6C7328)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBC84, &type metadata for DiagramConfiguration.AxisProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7328);
  }
  return result;
}

unint64_t sub_1BCAA2E7C()
{
  unint64_t result;

  result = qword_1ED6C6AB8;
  if (!qword_1ED6C6AB8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisType, &type metadata for DiagramConfiguration.AxisType);
    atomic_store(result, (unint64_t *)&qword_1ED6C6AB8);
  }
  return result;
}

unint64_t sub_1BCAA2EC0()
{
  unint64_t result;

  result = qword_1ED6C6A50;
  if (!qword_1ED6C6A50)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisLineWidth, &type metadata for DiagramConfiguration.AxisLineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A50);
  }
  return result;
}

unint64_t sub_1BCAA2F04()
{
  unint64_t result;

  result = qword_1ED6C6A60;
  if (!qword_1ED6C6A60)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisTickLength, &type metadata for DiagramConfiguration.AxisTickLength);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A60);
  }
  return result;
}

unint64_t sub_1BCAA2F48()
{
  unint64_t result;

  result = qword_1ED6C73F0;
  if (!qword_1ED6C73F0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisType, &type metadata for DiagramConfiguration.AxisType);
    atomic_store(result, (unint64_t *)&qword_1ED6C73F0);
  }
  return result;
}

unint64_t sub_1BCAA2F8C()
{
  unint64_t result;

  result = qword_1ED6C7320;
  if (!qword_1ED6C7320)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisLineWidth, &type metadata for DiagramConfiguration.AxisLineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C7320);
  }
  return result;
}

unint64_t sub_1BCAA2FD0()
{
  unint64_t result;

  result = qword_1ED6C7350;
  if (!qword_1ED6C7350)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisTickLength, &type metadata for DiagramConfiguration.AxisTickLength);
    atomic_store(result, (unint64_t *)&qword_1ED6C7350);
  }
  return result;
}

unint64_t sub_1BCAA3014()
{
  unint64_t result;

  result = qword_1ED6C60C8;
  if (!qword_1ED6C60C8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBC34, &type metadata for DiagramConfiguration.ValueFormatter.PercentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60C8);
  }
  return result;
}

unint64_t sub_1BCAA3058()
{
  unint64_t result;

  result = qword_1ED6C60B0;
  if (!qword_1ED6C60B0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBBE4, &type metadata for DiagramConfiguration.ValueFormatter.DecimalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60B0);
  }
  return result;
}

unint64_t sub_1BCAA309C()
{
  unint64_t result;

  result = qword_1ED6C60D8;
  if (!qword_1ED6C60D8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBB94, &type metadata for DiagramConfiguration.ValueFormatter.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60D8);
  }
  return result;
}

unint64_t sub_1BCAA30E0()
{
  unint64_t result;

  result = qword_1ED6C6098;
  if (!qword_1ED6C6098)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBB44, &type metadata for DiagramConfiguration.ValueFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6098);
  }
  return result;
}

void sub_1BCAA3124()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF47A450)
  {
    sub_1BCAA3190();
    sub_1BCAB6504();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF47A450);
  }
}

unint64_t sub_1BCAA3190()
{
  unint64_t result;

  result = qword_1EF47A458;
  if (!qword_1EF47A458)
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF47A458);
  }
  return result;
}

unint64_t sub_1BCAA31CC()
{
  unint64_t result;

  result = qword_1ED6C7300;
  if (!qword_1ED6C7300)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBAF4, &type metadata for DiagramConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7300);
  }
  return result;
}

unint64_t sub_1BCAA3210()
{
  unint64_t result;

  result = qword_1EF47A460;
  if (!qword_1EF47A460)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.HeartRateRecovery, &type metadata for DiagramConfiguration.HeartRateRecovery);
    atomic_store(result, (unint64_t *)&qword_1EF47A460);
  }
  return result;
}

unint64_t sub_1BCAA3254()
{
  unint64_t result;

  result = qword_1ED6C2CF0;
  if (!qword_1ED6C2CF0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Distribution, &type metadata for DiagramConfiguration.Distribution);
    atomic_store(result, (unint64_t *)&qword_1ED6C2CF0);
  }
  return result;
}

unint64_t sub_1BCAA3298()
{
  unint64_t result;

  result = qword_1EF47A468;
  if (!qword_1EF47A468)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisOnly, &type metadata for DiagramConfiguration.AxisOnly);
    atomic_store(result, (unint64_t *)&qword_1EF47A468);
  }
  return result;
}

unint64_t sub_1BCAA32DC()
{
  unint64_t result;

  result = qword_1ED6C6AA0;
  if (!qword_1ED6C6AA0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Line, &type metadata for DiagramConfiguration.Line);
    atomic_store(result, (unint64_t *)&qword_1ED6C6AA0);
  }
  return result;
}

unint64_t sub_1BCAA3320()
{
  unint64_t result;

  result = qword_1EF47A470;
  if (!qword_1EF47A470)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Banner, &type metadata for DiagramConfiguration.Banner);
    atomic_store(result, (unint64_t *)&qword_1EF47A470);
  }
  return result;
}

unint64_t sub_1BCAA3364()
{
  unint64_t result;

  result = qword_1ED6C5CB8;
  if (!qword_1ED6C5CB8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Bar, &type metadata for DiagramConfiguration.Bar);
    atomic_store(result, (unint64_t *)&qword_1ED6C5CB8);
  }
  return result;
}

unint64_t sub_1BCAA33A8()
{
  unint64_t result;

  result = qword_1EF47A478;
  if (!qword_1EF47A478)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.HeartRateRecovery, &type metadata for DiagramConfiguration.HeartRateRecovery);
    atomic_store(result, (unint64_t *)&qword_1EF47A478);
  }
  return result;
}

unint64_t sub_1BCAA33EC()
{
  unint64_t result;

  result = qword_1ED6C68A0;
  if (!qword_1ED6C68A0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Distribution, &type metadata for DiagramConfiguration.Distribution);
    atomic_store(result, (unint64_t *)&qword_1ED6C68A0);
  }
  return result;
}

unint64_t sub_1BCAA3430()
{
  unint64_t result;

  result = qword_1EF47A480;
  if (!qword_1EF47A480)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisOnly, &type metadata for DiagramConfiguration.AxisOnly);
    atomic_store(result, (unint64_t *)&qword_1EF47A480);
  }
  return result;
}

unint64_t sub_1BCAA3474()
{
  unint64_t result;

  result = qword_1ED6C7238;
  if (!qword_1ED6C7238)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Line, &type metadata for DiagramConfiguration.Line);
    atomic_store(result, (unint64_t *)&qword_1ED6C7238);
  }
  return result;
}

unint64_t sub_1BCAA34B8()
{
  unint64_t result;

  result = qword_1EF47A488;
  if (!qword_1EF47A488)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Banner, &type metadata for DiagramConfiguration.Banner);
    atomic_store(result, (unint64_t *)&qword_1EF47A488);
  }
  return result;
}

unint64_t sub_1BCAA34FC()
{
  unint64_t result;

  result = qword_1ED6C68E0;
  if (!qword_1ED6C68E0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Bar, &type metadata for DiagramConfiguration.Bar);
    atomic_store(result, (unint64_t *)&qword_1ED6C68E0);
  }
  return result;
}

unint64_t sub_1BCAA3544()
{
  unint64_t result;

  result = qword_1EF47A490;
  if (!qword_1EF47A490)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfigurationKeys, &type metadata for DiagramConfiguration.PointLabelConfigurationKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A490);
  }
  return result;
}

unint64_t sub_1BCAA358C()
{
  unint64_t result;

  result = qword_1ED6C6850;
  if (!qword_1ED6C6850)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfigurationKeys, &type metadata for DiagramConfiguration.PointLabelConfigurationKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6850);
  }
  return result;
}

unint64_t sub_1BCAA35D4()
{
  unint64_t result;

  result = qword_1ED6C6848;
  if (!qword_1ED6C6848)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelConfigurationKeys, &type metadata for DiagramConfiguration.PointLabelConfigurationKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6848);
  }
  return result;
}

unint64_t sub_1BCAA361C()
{
  unint64_t result;

  result = qword_1ED6C68D0;
  if (!qword_1ED6C68D0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1ED6C68D0);
  }
  return result;
}

unint64_t sub_1BCAA3664()
{
  unint64_t result;

  result = qword_1EF47A498;
  if (!qword_1EF47A498)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1EF47A498);
  }
  return result;
}

unint64_t sub_1BCAA36AC()
{
  unint64_t result;

  result = qword_1ED6C6A80;
  if (!qword_1ED6C6A80)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A80);
  }
  return result;
}

unint64_t sub_1BCAA36F4()
{
  unint64_t result;

  result = qword_1ED6C6A88;
  if (!qword_1ED6C6A88)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.PointLabelMinMaxSet, &type metadata for DiagramConfiguration.PointLabelMinMaxSet);
    atomic_store(result, (unint64_t *)&qword_1ED6C6A88);
  }
  return result;
}

unint64_t sub_1BCAA373C()
{
  unint64_t result;

  result = qword_1EF47A4A0;
  if (!qword_1EF47A4A0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.BarWidth, &type metadata for DiagramConfiguration.BarWidth);
    atomic_store(result, (unint64_t *)&qword_1EF47A4A0);
  }
  return result;
}

unint64_t sub_1BCAA3784()
{
  unint64_t result;

  result = qword_1EF47A4A8;
  if (!qword_1EF47A4A8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineWidth, &type metadata for DiagramConfiguration.LineWidth);
    atomic_store(result, (unint64_t *)&qword_1EF47A4A8);
  }
  return result;
}

unint64_t sub_1BCAA37CC()
{
  unint64_t result;

  result = qword_1EF47A4B0;
  if (!qword_1EF47A4B0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineRadius, &type metadata for DiagramConfiguration.LineRadius);
    atomic_store(result, (unint64_t *)&qword_1EF47A4B0);
  }
  return result;
}

unint64_t sub_1BCAA3814()
{
  unint64_t result;

  result = qword_1EF47A4B8;
  if (!qword_1EF47A4B8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionWidth, &type metadata for DiagramConfiguration.DistributionWidth);
    atomic_store(result, (unint64_t *)&qword_1EF47A4B8);
  }
  return result;
}

unint64_t sub_1BCAA385C()
{
  unint64_t result;

  result = qword_1EF47A4C0;
  if (!qword_1EF47A4C0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionPadding, &type metadata for DiagramConfiguration.DistributionPadding);
    atomic_store(result, (unint64_t *)&qword_1EF47A4C0);
  }
  return result;
}

unint64_t sub_1BCAA38A4()
{
  unint64_t result;

  result = qword_1EF47A4C8;
  if (!qword_1EF47A4C8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisTickLength, &type metadata for DiagramConfiguration.AxisTickLength);
    atomic_store(result, (unint64_t *)&qword_1EF47A4C8);
  }
  return result;
}

unint64_t sub_1BCAA38EC()
{
  unint64_t result;

  result = qword_1EF47A4D0;
  if (!qword_1EF47A4D0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisLineWidth, &type metadata for DiagramConfiguration.AxisLineWidth);
    atomic_store(result, (unint64_t *)&qword_1EF47A4D0);
  }
  return result;
}

unint64_t sub_1BCAA3934()
{
  unint64_t result;

  result = qword_1EF47A4D8;
  if (!qword_1EF47A4D8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisType, &type metadata for DiagramConfiguration.AxisType);
    atomic_store(result, (unint64_t *)&qword_1EF47A4D8);
  }
  return result;
}

unint64_t sub_1BCAA397C()
{
  unint64_t result;

  result = qword_1EF47A4E0;
  if (!qword_1EF47A4E0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.CornerSize, &type metadata for DiagramConfiguration.CornerSize);
    atomic_store(result, (unint64_t *)&qword_1EF47A4E0);
  }
  return result;
}

unint64_t sub_1BCAA39C4()
{
  unint64_t result;

  result = qword_1ED6C71B8;
  if (!qword_1ED6C71B8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Color, &type metadata for DiagramConfiguration.Color);
    atomic_store(result, (unint64_t *)&qword_1ED6C71B8);
  }
  return result;
}

unint64_t sub_1BCAA3A0C()
{
  unint64_t result;

  result = qword_1EF47A4E8;
  if (!qword_1EF47A4E8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisInset, &type metadata for DiagramConfiguration.AxisInset);
    atomic_store(result, (unint64_t *)&qword_1EF47A4E8);
  }
  return result;
}

unint64_t sub_1BCAA3A54()
{
  unint64_t result;

  result = qword_1EF47A4F0;
  if (!qword_1EF47A4F0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Insets, &type metadata for DiagramConfiguration.Insets);
    atomic_store(result, (unint64_t *)&qword_1EF47A4F0);
  }
  return result;
}

unint64_t sub_1BCAA3A9C()
{
  unint64_t result;

  result = qword_1EF47A4F8;
  if (!qword_1EF47A4F8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.TextAttributes, &type metadata for DiagramConfiguration.TextAttributes);
    atomic_store(result, (unint64_t *)&qword_1EF47A4F8);
  }
  return result;
}

unint64_t sub_1BCAA3AE4()
{
  unint64_t result;

  result = qword_1EF47A500;
  if (!qword_1EF47A500)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ReferenceAnnotationPosition, &type metadata for DiagramConfiguration.ReferenceAnnotationPosition);
    atomic_store(result, (unint64_t *)&qword_1EF47A500);
  }
  return result;
}

uint64_t destroy for DiagramConfiguration(uint64_t a1)
{
  return sub_1BCAA3B70(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 88));
}

uint64_t sub_1BCAA3B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12)
{
  int v12;
  uint64_t result;

  v12 = a12 >> 5;
  if (v12 == 1 || v12 == 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for DiagramConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_BYTE *)(a2 + 88);
  sub_1BC9E5B8C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = v15;
  return a1;
}

uint64_t assignWithCopy for DiagramConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a2 + 80);
  v26 = *(_BYTE *)(a2 + 88);
  sub_1BC9E5B8C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 80);
  v22 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_QWORD *)(a1 + 80) = v25;
  *(_BYTE *)(a1 + 88) = v26;
  sub_1BCAA3B70(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t assignWithTake for DiagramConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  unsigned __int8 v15;
  __int128 v16;
  __int128 v17;

  v3 = *(_QWORD *)(a2 + 80);
  v4 = *(_BYTE *)(a2 + 88);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 80);
  v15 = *(_BYTE *)(a1 + 88);
  v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = v3;
  *(_BYTE *)(a1 + 88) = v4;
  sub_1BCAA3B70(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x1FFB && *(_BYTE *)(a1 + 89))
    return (*(_DWORD *)a1 + 8187);
  v3 = ((*(unsigned __int8 *)(a1 + 88) >> 5) | (8
                                              * ((*(_QWORD *)(a1 + 72) >> 58) & 0x3F | (((*(unsigned __int8 *)(a1 + 88) >> 1) & 0xF) << 6)))) ^ 0x1FFF;
  if (v3 >> 1 >= 0xFFD)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x1FFA)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 8187;
    if (a3 >= 0x1FFB)
      *(_BYTE *)(result + 89) = 1;
  }
  else
  {
    if (a3 >= 0x1FFB)
      *(_BYTE *)(result + 89) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0x3FF;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_QWORD *)(result + 64) = 0;
      *(_QWORD *)(result + 72) = v3 << 58;
      *(_QWORD *)(result + 80) = 0;
      *(_BYTE *)(result + 88) = ((v3 - (a2 << 10)) >> 5) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_1BCAA3ED0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 88) >> 5;
}

uint64_t sub_1BCAA3EDC(uint64_t result)
{
  *(_BYTE *)(result + 88) &= 0x1Fu;
  return result;
}

uint64_t sub_1BCAA3EEC(uint64_t result, char a2)
{
  char v2;

  v2 = *(_BYTE *)(result + 88) & 1 | (32 * a2);
  *(_QWORD *)(result + 72) &= 0x3FFFFFFFFFFFFFFuLL;
  *(_BYTE *)(result + 88) = v2;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration()
{
  return &type metadata for DiagramConfiguration;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelConfigurationKeys()
{
  return &type metadata for DiagramConfiguration.PointLabelConfigurationKeys;
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.PointLabelConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x1FFF && *(_BYTE *)(a1 + 11))
    return (*(_DWORD *)a1 + 0x1FFF);
  v3 = ((*(unsigned __int8 *)(a1 + 10) >> 7) | (2
                                              * ((*(unsigned __int16 *)(a1 + 8) >> 10) & 0x38 | (*(_WORD *)(a1 + 8) >> 5) & 0x3F | (((*(unsigned __int8 *)(a1 + 10) >> 1) & 0x3F) << 6)))) ^ 0x1FFF;
  if (v3 >> 1 >= 0xFFF)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.PointLabelConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3;

  if (a2 > 0x1FFE)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 0x1FFF;
    if (a3 >= 0x1FFF)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if (a3 >= 0x1FFF)
      *(_BYTE *)(result + 11) = 0;
    if (a2)
    {
      v3 = ((-a2 >> 1) & 0xFFF) - (a2 << 12);
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 10) = (v3 >> 5) & 0xFE;
      *(_WORD *)(result + 8) = ((_WORD)v3 << 10) & 0xE000 | (32 * (v3 & 7));
    }
  }
  return result;
}

uint64_t sub_1BCAA4034(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 10) >> 7;
}

uint64_t sub_1BCAA4040(uint64_t a1)
{
  uint64_t result;
  int v2;

  v2 = *(unsigned __int16 *)(a1 + 8);
  result = a1 + 8;
  *(_BYTE *)(result + 2) = ((v2 | (*(unsigned __int8 *)(result + 2) << 16)) >> 16) & 0x7F;
  *(_WORD *)result = v2;
  return result;
}

uint64_t sub_1BCAA405C(uint64_t a1, int a2)
{
  uint64_t result;
  int v3;
  int v4;

  v3 = *(unsigned __int16 *)(a1 + 8);
  result = a1 + 8;
  v4 = (v3 | (*(unsigned __int8 *)(result + 2) << 16)) & 0x11F1F | (a2 << 23);
  *(_WORD *)result = v3 & 0x1F1F;
  *(_BYTE *)(result + 2) = BYTE2(v4);
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelConfiguration()
{
  return &type metadata for DiagramConfiguration.PointLabelConfiguration;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelMinMaxSet()
{
  return &type metadata for DiagramConfiguration.PointLabelMinMaxSet;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.PointLabelMinMaxConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 11))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 10);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.PointLabelMinMaxConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 0;
    if (a2)
      *(_BYTE *)(result + 10) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelMinMaxConfiguration()
{
  return &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.PointLabelAllPointsConfiguration(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v6;
  int v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE7)
    goto LABEL_17;
  if (a2 + 65305 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65305 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65305;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65305;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65305;
  }
LABEL_17:
  if (*(unsigned __int8 *)a1 <= 0x19u)
    v6 = 25;
  else
    v6 = *(unsigned __int8 *)a1;
  v7 = v6 - 26;
  if (*(unsigned __int8 *)a1 < 0x19u)
    v8 = -1;
  else
    v8 = v7;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.PointLabelAllPointsConfiguration(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65305 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65305 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE6)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA4250 + 4 * byte_1BCAC90BD[v4]))();
  *a1 = a2 - 231;
  return ((uint64_t (*)(void))((char *)sub_1BCAA4284 + 4 * byte_1BCAC90B8[v4]))();
}

uint64_t sub_1BCAA4284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1BCAA428C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1BCAA4294);
  return result;
}

uint64_t sub_1BCAA42A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA42A8);
  *(_BYTE *)result = a2 + 25;
  return result;
}

uint64_t sub_1BCAA42AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1BCAA42B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelAllPointsConfiguration()
{
  return &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelAllPointsAttributes()
{
  return &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes;
}

__n128 __swift_memcpy39_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 31) = *(_QWORD *)(a2 + 31);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Bar(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 39))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 3);
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Bar(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 38) = 0;
    *(_WORD *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 39) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 39) = 0;
    if (a2)
      *(_BYTE *)(result + 3) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Bar()
{
  return &type metadata for DiagramConfiguration.Bar;
}

uint64_t sub_1BCAA43A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DiagramConfiguration.Banner(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for DiagramConfiguration.Banner(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Banner(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Banner(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Banner()
{
  return &type metadata for DiagramConfiguration.Banner;
}

__n128 __swift_memcpy19_1(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.AxisOnly(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 19))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 18);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.AxisOnly(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 18) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 19) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 19) = 0;
    if (a2)
      *(_BYTE *)(result + 18) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisOnly()
{
  return &type metadata for DiagramConfiguration.AxisOnly;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.BarWidth()
{
  return &type metadata for DiagramConfiguration.BarWidth;
}

uint64_t initializeWithCopy for DiagramConfiguration.Line(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 14) = *(_QWORD *)(a2 + 14);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DiagramConfiguration.Line(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 14) = *(_QWORD *)(a2 + 14);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  return a1;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DiagramConfiguration.Line(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 14) = *(_QWORD *)(a2 + 14);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Line(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 34))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Line(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 34) = 1;
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
    *(_BYTE *)(result + 34) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Line()
{
  return &type metadata for DiagramConfiguration.Line;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.LineProperties(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >> 1 >= 0xFFF && *(_BYTE *)(a1 + 27))
    return (*(_DWORD *)a1 + 8190);
  v3 = *(unsigned __int8 *)(a1 + 26);
  v4 = (*(unsigned __int16 *)(a1 + 24) >> 10) & 0x38 | (*(_WORD *)(a1 + 24) >> 5) & 0x3F | (((v3 >> 1) & 0x3F) << 6);
  v5 = 8190 - (((unsigned __int16)v3 >> 7) | (2 * v4));
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.LineProperties(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >> 1 > 0xFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 26) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 8190;
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 27) = 1;
  }
  else
  {
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 27) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 16) = 0;
      *(_WORD *)(result + 24) = (((unsigned __int16)a2 ^ 0x1FFF) << 9) & 0xE000 | (32 * (((a2 ^ 0x1FFF) >> 1) & 7));
      *(_BYTE *)(result + 26) = ((((a2 ^ 0x1FFF) << 23) | ((a2 ^ 0x1FFF) << 10)) & 0xFE0000) >> 16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.LineProperties()
{
  return &type metadata for DiagramConfiguration.LineProperties;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.LineWidth()
{
  return &type metadata for DiagramConfiguration.LineWidth;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.LineRadius()
{
  return &type metadata for DiagramConfiguration.LineRadius;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Distribution(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >> 1 >= 0xFFF && *(_BYTE *)(a1 + 89))
    return (*(_DWORD *)a1 + 8190);
  v3 = *(unsigned __int8 *)(a1 + 18);
  v4 = (*(unsigned __int16 *)(a1 + 16) >> 10) & 0x38 | (*(_WORD *)(a1 + 16) >> 5) & 0x3F | (((v3 >> 1) & 0x3F) << 6);
  v5 = 8190 - (((unsigned __int16)v3 >> 7) | (2 * v4));
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Distribution(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >> 1 > 0xFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 8190;
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 89) = 1;
  }
  else
  {
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 89) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_WORD *)(result + 16) = (((unsigned __int16)a2 ^ 0x1FFF) << 9) & 0xE000 | (32 * (((a2 ^ 0x1FFF) >> 1) & 7));
      *(_BYTE *)(result + 18) = ((((a2 ^ 0x1FFF) << 23) | ((a2 ^ 0x1FFF) << 10)) & 0xFE0000) >> 16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Distribution()
{
  return &type metadata for DiagramConfiguration.Distribution;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.DistributionWidth()
{
  return &type metadata for DiagramConfiguration.DistributionWidth;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.DistributionPadding()
{
  return &type metadata for DiagramConfiguration.DistributionPadding;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.DistributionLimits(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xDE && a1[41])
    return (*(_DWORD *)a1 + 222);
  v3 = *a1;
  v4 = v3 >= 0x23;
  v5 = v3 - 35;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.DistributionLimits(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xDD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 222;
    if (a3 >= 0xDE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xDE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 34;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.DistributionLimits()
{
  return &type metadata for DiagramConfiguration.DistributionLimits;
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.HeartRateRecovery(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 1);
  v4 = v3 >= 6;
  v5 = v3 - 6;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.HeartRateRecovery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_DWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 4) = 0;
    if (a2)
      *(_BYTE *)(result + 1) = a2 + 5;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.HeartRateRecovery()
{
  return &type metadata for DiagramConfiguration.HeartRateRecovery;
}

_QWORD *__swift_memcpy14_1(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 6) = *(uint64_t *)((char *)a2 + 6);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Axis(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 14))
    return (*(_DWORD *)a1 + 254);
  if (*(unsigned __int8 *)(a1 + 4) <= 2u)
    v3 = 2;
  else
    v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 - 3;
  if (*(unsigned __int8 *)(a1 + 4) < 2u)
    v5 = -1;
  else
    v5 = v4;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Axis(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 14) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 14) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Axis()
{
  return &type metadata for DiagramConfiguration.Axis;
}

_DWORD *__swift_memcpy7_1(_DWORD *result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_DWORD *)((char *)result + 3) = *(int *)((char *)a2 + 3);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.AxisProperties(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 7))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.AxisProperties(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 6) = 0;
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 7) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 7) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisProperties()
{
  return &type metadata for DiagramConfiguration.AxisProperties;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisTickLength()
{
  return &type metadata for DiagramConfiguration.AxisTickLength;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisLineWidth()
{
  return &type metadata for DiagramConfiguration.AxisLineWidth;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.AxisType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.AxisType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA4DA4 + 4 * byte_1BCAC90C7[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_1BCAA4DD8 + 4 * byte_1BCAC90C2[v4]))();
}

uint64_t sub_1BCAA4DD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA4DE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA4DE8);
  return result;
}

uint64_t sub_1BCAA4DF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA4DFCLL);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_1BCAA4E00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA4E08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisType()
{
  return &type metadata for DiagramConfiguration.AxisType;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.SharedConstants()
{
  return &type metadata for DiagramConfiguration.SharedConstants;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.CornerSize()
{
  return &type metadata for DiagramConfiguration.CornerSize;
}

uint64_t getEnumTagSinglePayload for DiagramConfiguration.Color(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDE)
    goto LABEL_17;
  if (a2 + 34 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 34) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 34;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 34;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 34;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x23;
  v8 = v6 - 35;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.Color(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 34 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 34) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDD)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA4F20 + 4 * byte_1BCAC90D1[v4]))();
  *a1 = a2 + 34;
  return ((uint64_t (*)(void))((char *)sub_1BCAA4F54 + 4 * byte_1BCAC90CC[v4]))();
}

uint64_t sub_1BCAA4F54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA4F5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA4F64);
  return result;
}

uint64_t sub_1BCAA4F70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA4F78);
  *(_BYTE *)result = a2 + 34;
  return result;
}

uint64_t sub_1BCAA4F7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA4F84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Color()
{
  return &type metadata for DiagramConfiguration.Color;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisInset()
{
  return &type metadata for DiagramConfiguration.AxisInset;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Insets()
{
  return &type metadata for DiagramConfiguration.Insets;
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.ValueFormatter(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1BCAA4FF0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BCAA500C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ValueFormatter()
{
  return &type metadata for DiagramConfiguration.ValueFormatter;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO14TextAttributesOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE8)
    goto LABEL_17;
  if (a2 + 24 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 24) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 24;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 24;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 24;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x19;
  v8 = v6 - 25;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19HealthVisualization20DiagramConfigurationO14TextAttributesOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5118 + 4 * byte_1BCAC90DB[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_1BCAA514C + 4 * byte_1BCAC90D6[v4]))();
}

uint64_t sub_1BCAA514C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5154(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA515CLL);
  return result;
}

uint64_t sub_1BCAA5168(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA5170);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_1BCAA5174(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA517C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.TextAttributes()
{
  return &type metadata for DiagramConfiguration.TextAttributes;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ReferenceAnnotationPosition()
{
  return &type metadata for DiagramConfiguration.ReferenceAnnotationPosition;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.CodingKeys()
{
  return &type metadata for DiagramConfiguration.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO10CornerSizeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5204 + 4 * byte_1BCAC90E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BCAA5238 + 4 * byte_1BCAC90E0[v4]))();
}

uint64_t sub_1BCAA5238(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5240(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA5248);
  return result;
}

uint64_t sub_1BCAA5254(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA525CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BCAA5260(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5268(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ValueFormatter.CodingKeys()
{
  return &type metadata for DiagramConfiguration.ValueFormatter.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ValueFormatter.StandardCodingKeys()
{
  return &type metadata for DiagramConfiguration.ValueFormatter.StandardCodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ValueFormatter.DecimalCodingKeys()
{
  return &type metadata for DiagramConfiguration.ValueFormatter.DecimalCodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.ValueFormatter.PercentCodingKeys()
{
  return &type metadata for DiagramConfiguration.ValueFormatter.PercentCodingKeys;
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.AxisProperties.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5304 + 4 * byte_1BCAC90EF[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BCAA5338 + 4 * byte_1BCAC90EA[v4]))();
}

uint64_t sub_1BCAA5338(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5340(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA5348);
  return result;
}

uint64_t sub_1BCAA5354(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA535CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BCAA5360(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5368(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisProperties.CodingKeys()
{
  return &type metadata for DiagramConfiguration.AxisProperties.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Axis.CodingKeys()
{
  return &type metadata for DiagramConfiguration.Axis.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.HeartRateRecovery.CodingKeys()
{
  return &type metadata for DiagramConfiguration.HeartRateRecovery.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.DistributionLimits.CodingKeys()
{
  return &type metadata for DiagramConfiguration.DistributionLimits.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Distribution.CodingKeys()
{
  return &type metadata for DiagramConfiguration.Distribution.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for DiagramConfiguration.LineProperties.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5418 + 4 * byte_1BCAC90F9[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_1BCAA544C + 4 * byte_1BCAC90F4[v4]))();
}

uint64_t sub_1BCAA544C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA545CLL);
  return result;
}

uint64_t sub_1BCAA5468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA5470);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_1BCAA5474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA547C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.LineProperties.CodingKeys()
{
  return &type metadata for DiagramConfiguration.LineProperties.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Line.CodingKeys()
{
  return &type metadata for DiagramConfiguration.Line.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO9LineWidthOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAA54F4 + 4 * byte_1BCAC9103[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BCAA5528 + 4 * byte_1BCAC90FE[v4]))();
}

uint64_t sub_1BCAA5528(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5530(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA5538);
  return result;
}

uint64_t sub_1BCAA5544(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA554CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BCAA5550(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5558(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.AxisOnly.CodingKeys()
{
  return &type metadata for DiagramConfiguration.AxisOnly.CodingKeys;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Banner.CodingKeys()
{
  return &type metadata for DiagramConfiguration.Banner.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO12DistributionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19HealthVisualization20DiagramConfigurationO12DistributionV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5660 + 4 * byte_1BCAC910D[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BCAA5694 + 4 * byte_1BCAC9108[v4]))();
}

uint64_t sub_1BCAA5694(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA569C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA56A4);
  return result;
}

uint64_t sub_1BCAA56B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA56B8);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BCAA56BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA56C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.Bar.CodingKeys()
{
  return &type metadata for DiagramConfiguration.Bar.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO14ValueFormatterO17DecimalCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BCAA5720 + 4 * byte_1BCAC9112[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BCAA5740 + 4 * byte_1BCAC9117[v4]))();
}

_BYTE *sub_1BCAA5720(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BCAA5740(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BCAA5748(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BCAA5750(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BCAA5758(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BCAA5760(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys()
{
  return &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO13AxisLineWidthOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAA57C8 + 4 * byte_1BCAC9121[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BCAA57FC + 4 * byte_1BCAC911C[v4]))();
}

uint64_t sub_1BCAA57FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA5804(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA580CLL);
  return result;
}

uint64_t sub_1BCAA5818(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA5820);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BCAA5824(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA582C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys()
{
  return &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys;
}

uint64_t _s19HealthVisualization20DiagramConfigurationO8BarWidthOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAA5894 + 4 * byte_1BCAC912B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BCAA58C8 + 4 * byte_1BCAC9126[v4]))();
}

uint64_t sub_1BCAA58C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA58D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAA58D8);
  return result;
}

uint64_t sub_1BCAA58E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAA58ECLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BCAA58F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAA58F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys()
{
  return &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys;
}

unint64_t sub_1BCAA5918()
{
  unint64_t result;

  result = qword_1EF47A508;
  if (!qword_1EF47A508)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACAF64, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A508);
  }
  return result;
}

unint64_t sub_1BCAA5960()
{
  unint64_t result;

  result = qword_1EF47A510;
  if (!qword_1EF47A510)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB01C, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A510);
  }
  return result;
}

unint64_t sub_1BCAA59A8()
{
  unint64_t result;

  result = qword_1EF47A518;
  if (!qword_1EF47A518)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB0D4, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A518);
  }
  return result;
}

unint64_t sub_1BCAA59F0()
{
  unint64_t result;

  result = qword_1EF47A520;
  if (!qword_1EF47A520)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB18C, &type metadata for DiagramConfiguration.Bar.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A520);
  }
  return result;
}

unint64_t sub_1BCAA5A38()
{
  unint64_t result;

  result = qword_1EF47A528;
  if (!qword_1EF47A528)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB244, &type metadata for DiagramConfiguration.Banner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A528);
  }
  return result;
}

unint64_t sub_1BCAA5A80()
{
  unint64_t result;

  result = qword_1EF47A530;
  if (!qword_1EF47A530)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB2FC, &type metadata for DiagramConfiguration.AxisOnly.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A530);
  }
  return result;
}

unint64_t sub_1BCAA5AC8()
{
  unint64_t result;

  result = qword_1EF47A538;
  if (!qword_1EF47A538)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB3B4, &type metadata for DiagramConfiguration.Line.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A538);
  }
  return result;
}

unint64_t sub_1BCAA5B10()
{
  unint64_t result;

  result = qword_1EF47A540;
  if (!qword_1EF47A540)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB46C, &type metadata for DiagramConfiguration.LineProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A540);
  }
  return result;
}

unint64_t sub_1BCAA5B58()
{
  unint64_t result;

  result = qword_1EF47A548;
  if (!qword_1EF47A548)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB524, &type metadata for DiagramConfiguration.Distribution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A548);
  }
  return result;
}

unint64_t sub_1BCAA5BA0()
{
  unint64_t result;

  result = qword_1EF47A550;
  if (!qword_1EF47A550)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB5DC, &type metadata for DiagramConfiguration.DistributionLimits.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A550);
  }
  return result;
}

unint64_t sub_1BCAA5BE8()
{
  unint64_t result;

  result = qword_1EF47A558;
  if (!qword_1EF47A558)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB694, &type metadata for DiagramConfiguration.HeartRateRecovery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A558);
  }
  return result;
}

unint64_t sub_1BCAA5C30()
{
  unint64_t result;

  result = qword_1EF47A560;
  if (!qword_1EF47A560)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB74C, &type metadata for DiagramConfiguration.Axis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A560);
  }
  return result;
}

unint64_t sub_1BCAA5C78()
{
  unint64_t result;

  result = qword_1EF47A568;
  if (!qword_1EF47A568)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB804, &type metadata for DiagramConfiguration.AxisProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A568);
  }
  return result;
}

unint64_t sub_1BCAA5CC0()
{
  unint64_t result;

  result = qword_1EF47A570;
  if (!qword_1EF47A570)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB90C, &type metadata for DiagramConfiguration.ValueFormatter.DecimalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A570);
  }
  return result;
}

unint64_t sub_1BCAA5D08()
{
  unint64_t result;

  result = qword_1EF47A578;
  if (!qword_1EF47A578)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBA14, &type metadata for DiagramConfiguration.ValueFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A578);
  }
  return result;
}

unint64_t sub_1BCAA5D50()
{
  unint64_t result;

  result = qword_1EF47A580;
  if (!qword_1EF47A580)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBACC, &type metadata for DiagramConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A580);
  }
  return result;
}

unint64_t sub_1BCAA5D98()
{
  unint64_t result;

  result = qword_1ED6C7310;
  if (!qword_1ED6C7310)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBA3C, &type metadata for DiagramConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7310);
  }
  return result;
}

unint64_t sub_1BCAA5DE0()
{
  unint64_t result;

  result = qword_1ED6C7308;
  if (!qword_1ED6C7308)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACBA64, &type metadata for DiagramConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7308);
  }
  return result;
}

unint64_t sub_1BCAA5E28()
{
  unint64_t result;

  result = qword_1ED6C60A8;
  if (!qword_1ED6C60A8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB984, &type metadata for DiagramConfiguration.ValueFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60A8);
  }
  return result;
}

unint64_t sub_1BCAA5E70()
{
  unint64_t result;

  result = qword_1ED6C60A0;
  if (!qword_1ED6C60A0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB9AC, &type metadata for DiagramConfiguration.ValueFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60A0);
  }
  return result;
}

unint64_t sub_1BCAA5EB8()
{
  unint64_t result;

  result = qword_1ED6C60E8;
  if (!qword_1ED6C60E8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB934, &type metadata for DiagramConfiguration.ValueFormatter.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60E8);
  }
  return result;
}

unint64_t sub_1BCAA5F00()
{
  unint64_t result;

  result = qword_1ED6C60E0;
  if (!qword_1ED6C60E0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB95C, &type metadata for DiagramConfiguration.ValueFormatter.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60E0);
  }
  return result;
}

unint64_t sub_1BCAA5F48()
{
  unint64_t result;

  result = qword_1ED6C60C0;
  if (!qword_1ED6C60C0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB87C, &type metadata for DiagramConfiguration.ValueFormatter.DecimalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60C0);
  }
  return result;
}

unint64_t sub_1BCAA5F90()
{
  unint64_t result;

  result = qword_1ED6C60B8;
  if (!qword_1ED6C60B8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB8A4, &type metadata for DiagramConfiguration.ValueFormatter.DecimalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60B8);
  }
  return result;
}

unint64_t sub_1BCAA5FD8()
{
  unint64_t result;

  result = qword_1ED6C6090;
  if (!qword_1ED6C6090)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB82C, &type metadata for DiagramConfiguration.ValueFormatter.PercentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6090);
  }
  return result;
}

unint64_t sub_1BCAA6020()
{
  unint64_t result;

  result = qword_1ED6C60D0;
  if (!qword_1ED6C60D0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB854, &type metadata for DiagramConfiguration.ValueFormatter.PercentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C60D0);
  }
  return result;
}

unint64_t sub_1BCAA6068()
{
  unint64_t result;

  result = qword_1ED6C7338;
  if (!qword_1ED6C7338)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB774, &type metadata for DiagramConfiguration.AxisProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7338);
  }
  return result;
}

unint64_t sub_1BCAA60B0()
{
  unint64_t result;

  result = qword_1ED6C7330;
  if (!qword_1ED6C7330)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB79C, &type metadata for DiagramConfiguration.AxisProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7330);
  }
  return result;
}

unint64_t sub_1BCAA60F8()
{
  unint64_t result;

  result = qword_1ED6C73A8;
  if (!qword_1ED6C73A8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB6BC, &type metadata for DiagramConfiguration.Axis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C73A8);
  }
  return result;
}

unint64_t sub_1BCAA6140()
{
  unint64_t result;

  result = qword_1ED6C73A0;
  if (!qword_1ED6C73A0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB6E4, &type metadata for DiagramConfiguration.Axis.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C73A0);
  }
  return result;
}

unint64_t sub_1BCAA6188()
{
  unint64_t result;

  result = qword_1EF47A588;
  if (!qword_1EF47A588)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB604, &type metadata for DiagramConfiguration.HeartRateRecovery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A588);
  }
  return result;
}

unint64_t sub_1BCAA61D0()
{
  unint64_t result;

  result = qword_1EF47A590;
  if (!qword_1EF47A590)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB62C, &type metadata for DiagramConfiguration.HeartRateRecovery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A590);
  }
  return result;
}

unint64_t sub_1BCAA6218()
{
  unint64_t result;

  result = qword_1EF47A598;
  if (!qword_1EF47A598)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB54C, &type metadata for DiagramConfiguration.DistributionLimits.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A598);
  }
  return result;
}

unint64_t sub_1BCAA6260()
{
  unint64_t result;

  result = qword_1EF47A5A0;
  if (!qword_1EF47A5A0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB574, &type metadata for DiagramConfiguration.DistributionLimits.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5A0);
  }
  return result;
}

unint64_t sub_1BCAA62A8()
{
  unint64_t result;

  result = qword_1ED6C6898;
  if (!qword_1ED6C6898)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB494, &type metadata for DiagramConfiguration.Distribution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6898);
  }
  return result;
}

unint64_t sub_1BCAA62F0()
{
  unint64_t result;

  result = qword_1ED6C6890;
  if (!qword_1ED6C6890)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB4BC, &type metadata for DiagramConfiguration.Distribution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6890);
  }
  return result;
}

unint64_t sub_1BCAA6338()
{
  unint64_t result;

  result = qword_1ED6C7210;
  if (!qword_1ED6C7210)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB3DC, &type metadata for DiagramConfiguration.LineProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7210);
  }
  return result;
}

unint64_t sub_1BCAA6380()
{
  unint64_t result;

  result = qword_1ED6C7208;
  if (!qword_1ED6C7208)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB404, &type metadata for DiagramConfiguration.LineProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7208);
  }
  return result;
}

unint64_t sub_1BCAA63C8()
{
  unint64_t result;

  result = qword_1ED6C7230;
  if (!qword_1ED6C7230)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB324, &type metadata for DiagramConfiguration.Line.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7230);
  }
  return result;
}

unint64_t sub_1BCAA6410()
{
  unint64_t result;

  result = qword_1ED6C7228;
  if (!qword_1ED6C7228)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB34C, &type metadata for DiagramConfiguration.Line.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C7228);
  }
  return result;
}

unint64_t sub_1BCAA6458()
{
  unint64_t result;

  result = qword_1EF47A5A8;
  if (!qword_1EF47A5A8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB26C, &type metadata for DiagramConfiguration.AxisOnly.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5A8);
  }
  return result;
}

unint64_t sub_1BCAA64A0()
{
  unint64_t result;

  result = qword_1EF47A5B0;
  if (!qword_1EF47A5B0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB294, &type metadata for DiagramConfiguration.AxisOnly.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5B0);
  }
  return result;
}

unint64_t sub_1BCAA64E8()
{
  unint64_t result;

  result = qword_1EF47A5B8;
  if (!qword_1EF47A5B8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB1B4, &type metadata for DiagramConfiguration.Banner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5B8);
  }
  return result;
}

unint64_t sub_1BCAA6530()
{
  unint64_t result;

  result = qword_1EF47A5C0;
  if (!qword_1EF47A5C0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB1DC, &type metadata for DiagramConfiguration.Banner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5C0);
  }
  return result;
}

unint64_t sub_1BCAA6578()
{
  unint64_t result;

  result = qword_1ED6C71B0;
  if (!qword_1ED6C71B0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB0FC, &type metadata for DiagramConfiguration.Bar.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C71B0);
  }
  return result;
}

unint64_t sub_1BCAA65C0()
{
  unint64_t result;

  result = qword_1ED6C71A8;
  if (!qword_1ED6C71A8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB124, &type metadata for DiagramConfiguration.Bar.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C71A8);
  }
  return result;
}

unint64_t sub_1BCAA6608()
{
  unint64_t result;

  result = qword_1EF47A5C8;
  if (!qword_1EF47A5C8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB044, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5C8);
  }
  return result;
}

unint64_t sub_1BCAA6650()
{
  unint64_t result;

  result = qword_1EF47A5D0;
  if (!qword_1EF47A5D0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACB06C, &type metadata for DiagramConfiguration.PointLabelAllPointsAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5D0);
  }
  return result;
}

unint64_t sub_1BCAA6698()
{
  unint64_t result;

  result = qword_1EF47A5D8;
  if (!qword_1EF47A5D8)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACAF8C, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5D8);
  }
  return result;
}

unint64_t sub_1BCAA66E0()
{
  unint64_t result;

  result = qword_1EF47A5E0;
  if (!qword_1EF47A5E0)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACAFB4, &type metadata for DiagramConfiguration.PointLabelAllPointsConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF47A5E0);
  }
  return result;
}

unint64_t sub_1BCAA6728()
{
  unint64_t result;

  result = qword_1ED6C6870;
  if (!qword_1ED6C6870)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACAED4, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6870);
  }
  return result;
}

unint64_t sub_1BCAA6770()
{
  unint64_t result;

  result = qword_1ED6C6868;
  if (!qword_1ED6C6868)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACAEFC, &type metadata for DiagramConfiguration.PointLabelMinMaxConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED6C6868);
  }
  return result;
}

uint64_t sub_1BCAA67B4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74704F6C6562616CLL && a2 == 0xEC000000736E6F69;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7474416C6562616CLL && a2 == 0xEF73657475626972 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74744165756C6176 && a2 == 0xEF73657475626972 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x80000001BCAD34A0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_1BCAA69C0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x80000001BCAD34D0 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BCAD34F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1BCAA6AA8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6C6F43706F74 && a2 == 0xE800000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F436D6F74746F62 && a2 == 0xEB00000000726F6CLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x695372656E726F63 && a2 == 0xEA0000000000657ALL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6867696C68676968 && a2 == 0xEE00726F6C6F4374 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656E694C73697861 && a2 == 0xED0000726F6C6F43 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3510 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3530 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3550 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7478655473697861 && a2 == 0xE800000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x756C615665736162 && a2 == 0xE900000000000065 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 1936291937 && a2 == 0xE400000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x736E49726574756FLL && a2 == 0xEB00000000737465)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_1BCAA7048(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x655472656E6E6162 && a2 == 0xEA00000000007478;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x655472656E6E6162 && a2 == 0xEF656C7974537478)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1BCAA7160(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1936291937 && a2 == 0xE400000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BCAD3570 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BCAD3590 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001BCAD35B0 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD35D0 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001BCAD35F0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_1BCAA739C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x706F7250656E696CLL && a2 == 0xEE00736569747265;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1936291937 && a2 == 0xE400000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F4665756C6176 && a2 == 0xEE0072657474616DLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736E49726574756FLL && a2 == 0xEB00000000737465)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_1BCAA75A4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74646957656E696CLL && a2 == 0xE900000000000068;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F6C6F43656E696CLL && a2 == 0xE900000000000072 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3610 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E696F50656E696CLL && a2 == 0xEF73756964615274 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BCAD3630 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3550 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3510 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3650 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3530 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BCAD3670 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x62614C746E696F70 && a2 == 0xEB00000000736C65)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 10;
    else
      return 11;
  }
}

uint64_t sub_1BCAA7A00(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6874646957726162 && a2 == 0xE800000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x43746E65746E6F63 && a2 == 0xEC000000726F6C6FLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6867696C68676968 && a2 == 0xEE00726F6C6F4374 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3510 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3530 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001BCAD3550 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BCAD3670 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x62614C746E696F70 && a2 == 0xEB00000000736C65 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6C61636974726576 && a2 == 0xEE007374696D694CLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 1936291937 && a2 == 0xE400000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x736E49726574756FLL && a2 == 0xEB00000000737465 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x726F4665756C6176 && a2 == 0xEE0072657474616DLL)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_1BCAA7F9C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x80000001BCAD3690 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BCAD36B0 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74696D694C776F6CLL && a2 == 0xE800000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696D694C68676968 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_1BCAA8158(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C6F43746E696F70 && a2 == 0xEA0000000000726FLL;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646152746E696F70 && a2 == 0xEB00000000737569 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x694C6574756E696DLL && a2 == 0xEF726F6C6F43656ELL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x694C6574756E696DLL && a2 == 0xEF6874646957656ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_1BCAA8374(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E6F7A69726F68 && a2 == 0xEA00000000006C61;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61636974726576 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1BCAA8470(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6570795473697861 && a2 == 0xE800000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BCAD36D0 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6F436C6562616CLL && a2 == 0xEA0000000000726FLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656E694C64697267 && a2 == 0xED0000726F6C6F43 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E694C64697267 && a2 == 0xED00006874646957 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x636954726F6A616DLL && a2 == 0xEF6874676E654C6BLL || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x636954726F6E696DLL && a2 == 0xEF6874676E654C6BLL)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_1BCAA87D0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x647261646E617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C616D69636564 && a2 == 0xE700000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E6563726570 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1BCAA8924(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7496034 && a2 == 0xE300000000000000;
  if (v2 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656E6E6162 && a2 == 0xE600000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701734764 && a2 == 0xE400000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x796C6E4F73697861 && a2 == 0xE800000000000000 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7562697274736964 && a2 == 0xEC0000006E6F6974 || (sub_1BCAB67C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BCAD36F0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_1BCAB67C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

unint64_t sub_1BCAA8B90()
{
  unint64_t result;

  result = qword_1ED6C7388;
  if (!qword_1ED6C7388)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.ReferenceAnnotationPosition, &type metadata for DiagramConfiguration.ReferenceAnnotationPosition);
    atomic_store(result, (unint64_t *)&qword_1ED6C7388);
  }
  return result;
}

unint64_t sub_1BCAA8BD4()
{
  unint64_t result;

  result = qword_1ED6C7368;
  if (!qword_1ED6C7368)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.TextAttributes, &type metadata for DiagramConfiguration.TextAttributes);
    atomic_store(result, (unint64_t *)&qword_1ED6C7368);
  }
  return result;
}

unint64_t sub_1BCAA8C18()
{
  unint64_t result;

  result = qword_1ED6C73D8;
  if (!qword_1ED6C73D8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Insets, &type metadata for DiagramConfiguration.Insets);
    atomic_store(result, (unint64_t *)&qword_1ED6C73D8);
  }
  return result;
}

unint64_t sub_1BCAA8C5C()
{
  unint64_t result;

  result = qword_1EF47A5E8;
  if (!qword_1EF47A5E8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisInset, &type metadata for DiagramConfiguration.AxisInset);
    atomic_store(result, (unint64_t *)&qword_1EF47A5E8);
  }
  return result;
}

unint64_t sub_1BCAA8CA0()
{
  unint64_t result;

  result = qword_1ED6C73C8;
  if (!qword_1ED6C73C8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.Color, &type metadata for DiagramConfiguration.Color);
    atomic_store(result, (unint64_t *)&qword_1ED6C73C8);
  }
  return result;
}

unint64_t sub_1BCAA8CE4()
{
  unint64_t result;

  result = qword_1ED6C7198;
  if (!qword_1ED6C7198)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.CornerSize, &type metadata for DiagramConfiguration.CornerSize);
    atomic_store(result, (unint64_t *)&qword_1ED6C7198);
  }
  return result;
}

unint64_t sub_1BCAA8D28()
{
  unint64_t result;

  result = qword_1ED6C73E8;
  if (!qword_1ED6C73E8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisType, &type metadata for DiagramConfiguration.AxisType);
    atomic_store(result, (unint64_t *)&qword_1ED6C73E8);
  }
  return result;
}

unint64_t sub_1BCAA8D6C()
{
  unint64_t result;

  result = qword_1ED6C7318;
  if (!qword_1ED6C7318)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisLineWidth, &type metadata for DiagramConfiguration.AxisLineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C7318);
  }
  return result;
}

unint64_t sub_1BCAA8DB0()
{
  unint64_t result;

  result = qword_1ED6C7348;
  if (!qword_1ED6C7348)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.AxisTickLength, &type metadata for DiagramConfiguration.AxisTickLength);
    atomic_store(result, (unint64_t *)&qword_1ED6C7348);
  }
  return result;
}

unint64_t sub_1BCAA8DF4()
{
  unint64_t result;

  result = qword_1ED6C68C0;
  if (!qword_1ED6C68C0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionPadding, &type metadata for DiagramConfiguration.DistributionPadding);
    atomic_store(result, (unint64_t *)&qword_1ED6C68C0);
  }
  return result;
}

unint64_t sub_1BCAA8E38()
{
  unint64_t result;

  result = qword_1ED6C68A8;
  if (!qword_1ED6C68A8)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.DistributionWidth, &type metadata for DiagramConfiguration.DistributionWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C68A8);
  }
  return result;
}

unint64_t sub_1BCAA8E7C()
{
  unint64_t result;

  result = qword_1ED6C71F0;
  if (!qword_1ED6C71F0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineRadius, &type metadata for DiagramConfiguration.LineRadius);
    atomic_store(result, (unint64_t *)&qword_1ED6C71F0);
  }
  return result;
}

unint64_t sub_1BCAA8EC0()
{
  unint64_t result;

  result = qword_1ED6C7240;
  if (!qword_1ED6C7240)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.LineWidth, &type metadata for DiagramConfiguration.LineWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C7240);
  }
  return result;
}

unint64_t sub_1BCAA8F04()
{
  unint64_t result;

  result = qword_1ED6C71C0;
  if (!qword_1ED6C71C0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramConfiguration.BarWidth, &type metadata for DiagramConfiguration.BarWidth);
    atomic_store(result, (unint64_t *)&qword_1ED6C71C0);
  }
  return result;
}

uint64_t sub_1BCAA8F48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  __int128 v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 104);
  v13 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_QWORD *)(a1 + 144);
  v8 = *(_QWORD *)(a1 + 152);
  v12 = *(_OWORD *)(a1 + 160);
  v9 = *(_QWORD *)(a1 + 176);
  v10 = *(_BYTE *)(a1 + 184);
  sub_1BCAA3B70(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 88));
  sub_1BCAA3B70(v13, v2, v3, v4, v5, v6, v7, v8, v12, *((uint64_t *)&v12 + 1), v9, v10);
  return a1;
}

void sub_1BCAA9018()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C7110)
  {
    type metadata accessor for Key(255);
    sub_1BC9A649C(255, &qword_1ED6C7100);
    sub_1BC99F5A0();
    v0 = sub_1BCAB6618();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C7110);
  }
}

void sub_1BCAA90A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C7108)
  {
    v0 = sub_1BCAB6618();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C7108);
  }
}

uint64_t sub_1BCAA9100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BCA5F1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CoreChartTrendBarSeries.init(dataViewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;

  sub_1BC9964B8(a1, a2, type metadata accessor for CoreChartTrendViewModel);
  v4 = *(unsigned __int8 *)(a1 + 16);
  sub_1BC997208(a1, type metadata accessor for CoreChartTrendViewModel);
  v5 = a2 + *(int *)(type metadata accessor for CoreChartTrendBarSeries() + 20);
  switch(v4)
  {
    case 2:
      v6 = (unsigned int *)MEMORY[0x1E0CB1140];
      break;
    case 5:
      v6 = (unsigned int *)MEMORY[0x1E0CB10F8];
      break;
    default:
      v6 = (unsigned int *)MEMORY[0x1E0CB1130];
      break;
  }
  v7 = *v6;
  v8 = sub_1BCAB4F68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v5, v7, v8);
}

uint64_t type metadata accessor for CoreChartTrendBarSeries()
{
  uint64_t result;

  result = qword_1ED6C3268;
  if (!qword_1ED6C3268)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CoreChartTrendBarSeries.barSeries.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  v1 = type metadata accessor for CoreChartTrendBarSeries();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x1E0C80A78](v1);
  v8[5] = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CoreChartTrendViewModel(0) + 36));
  sub_1BC9964B8(v0, (uint64_t)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CoreChartTrendBarSeries);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_1BCAA9888((uint64_t)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_1BC998AB0(0, &qword_1EF477CB8, type metadata accessor for CoreChartTrendDataElement, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BCAB4E54();
  sub_1BCA0DB2C(0);
  sub_1BC996814();
  v6 = sub_1BCAB5718();
  swift_bridgeObjectRetain();
  v8[1] = v6;
  v8[2] = MEMORY[0x1E0CDF5D0];
  v8[3] = MEMORY[0x1E0C939E0];
  v8[4] = MEMORY[0x1E0CDF598];
  swift_getOpaqueTypeConformance2();
  sub_1BC996948(qword_1EF477CE8, type metadata accessor for CoreChartTrendDataElement, (uint64_t)&protocol conformance descriptor for CoreChartTrendDataElement);
  return sub_1BCAB5DCC();
}

uint64_t sub_1BCAA941C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v13 = a1;
  v15 = a2;
  sub_1BC998A54();
  MEMORY[0x1E0C80A78](v2);
  sub_1BC998AB0(0, &qword_1ED6C7288, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - v4;
  sub_1BC998B08();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1BCAB5718();
  v14 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB5A6C();
  type metadata accessor for CoreChartTrendBarSeries();
  v10 = sub_1BCAB4F74();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = v13;
  sub_1BCAB5628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC998B64((uint64_t)v5);
  sub_1BCAB5A6C();
  v16 = *(_QWORD *)(v11 + *(int *)(type metadata accessor for CoreChartTrendDataElement(0) + 20));
  sub_1BCAB5634();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BCAB4E54();
  sub_1BCAB570C();
  if (qword_1ED6C31B8 != -1)
    swift_once();
  v16 = qword_1ED6D3848;
  sub_1BCAB558C();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v7);
}

uint64_t sub_1BCAA9720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for CoreChartTrendBarSeries();
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));

  v3 = type metadata accessor for CoreChartTrendViewModel(0);
  v4 = v2 + *(int *)(v3 + 28);
  v5 = sub_1BCAB4BD8();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = type metadata accessor for CoreChartTrendLineViewModel(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v2 + *(int *)(v3 + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v8, 1, v7))
  {
    v6(v8, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v9 = v2 + *(int *)(v1 + 20);
  v10 = sub_1BCAB4F68();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject();
}

uint64_t sub_1BCAA9888(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoreChartTrendBarSeries();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCAA98CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CoreChartTrendBarSeries();
  return sub_1BCAA941C(a1, a2);
}

uint64_t getEnumTagSinglePayload for CoreChartTrendBarSeries()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCAA9924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for CoreChartTrendViewModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_1BCAB4F68();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CoreChartTrendBarSeries()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCAA99A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for CoreChartTrendViewModel(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_1BCAB4F68();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_1BCAA9A24(id *a1)
{
  id v1;

  v1 = *a1;
  sub_1BC9F3F44(*a1);
  swift_retain();
  sub_1BCAB507C();
  sub_1BC9B39B4(v1);
  return swift_release();
}

uint64_t sub_1BCAA9AA4()
{
  uint64_t v1;

  swift_retain();
  sub_1BCAB5070();
  swift_release();
  return v1;
}

id sub_1BCAA9AF0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = qword_1ED6C3028;
  v2 = *(void **)(v0 + qword_1ED6C3028);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_1ED6C3028);
  }
  else
  {
    sub_1BCAA9B50(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1BCAA9B50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  id v14;
  void *v15;
  uint64_t Configuration;
  id v17;
  id v18;
  _QWORD v19[3];
  char v20;

  v2 = sub_1BCAB4C74();
  v19[1] = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v19[2] = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BCAB4E54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v19 - v7;
  v9 = (void *)objc_opt_self();
  v10 = a1 + qword_1ED6D3818;
  sub_1BCAB4BC0();
  v11 = (void *)sub_1BCAB4DE8();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  sub_1BCAB4B9C();
  v13 = (void *)sub_1BCAB4DE8();
  v12(v8, v4);
  v14 = objc_msgSend(v9, sel_predicateForSamplesWithStartDate_endDate_options_, v11, v13, 0);

  v15 = *(void **)(a1 + qword_1ED6C3018);
  Configuration = type metadata accessor for ValueHistogramCollectionQueryConfiguration();
  v20 = *(_BYTE *)(v10 + *(int *)(Configuration + 20));
  v17 = v15;
  v18 = v14;
  AnchorDate.date.getter();
  __asm { BR              X10 }
}

id sub_1BCAA9D00()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  if (qword_1ED6C4DD0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED6C4DE8);
  v9 = *(_QWORD *)(v7 - 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 104) + 16))(v9, v8, v2);
  v10 = *(_QWORD *)(v4 + *(int *)(v6 + 28));
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = objc_allocWithZone(MEMORY[0x1E0CB6D88]);
  swift_bridgeObjectRetain();
  v13 = sub_1BCAAABE4(v5, v3, v1, v9, v10, (uint64_t)sub_1BCAAB1C8, v11);
  v14 = objc_msgSend(v0, sel_name);
  objc_msgSend(v13, sel_setDebugIdentifier_, v14);

  v15 = *(_QWORD *)&v0[qword_1ED6D3820];
  v16 = v13;
  objc_msgSend(v16, sel_setQualityOfService_, v15);

  return v16;
}

void sub_1BCAA9F30(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = a4 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x1BCCFC004](v6);
  if (v7)
  {
    v8 = (void *)v7;
    sub_1BCAAA604(a2, a3);

  }
}

uint64_t sub_1BCAA9F9C@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _BYTE v15[24];

  sub_1BC998AB0(0, &qword_1ED6C5F20, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v8 = &v15[-v7];
  v9 = (uint64_t)v1 + qword_1ED6C3030;
  swift_beginAccess();
  sub_1BCA48FB4(v9, (uint64_t)v8);
  v10 = sub_1BCAB54A8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(a1, v8, v10);
  sub_1BCAAB144((uint64_t)v8);
  if (qword_1ED6C7098 != -1)
    swift_once();
  v12 = (id)qword_1ED6C69C0;
  v13 = v1;
  sub_1BCAB549C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v5, a1, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_1BCA49010((uint64_t)v5, v9);
  return swift_endAccess();
}

id ValueHistogramCollectionQueryOperation.__allocating_init(quantityType:configuration:name:queryQualityOfService:healthStore:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  objc_class *v6;
  id v13;
  id v14;

  v13 = objc_allocWithZone(v6);
  v14 = sub_1BCAAAD54(a1, a2, a3, a4, a5, a6);

  return v14;
}

id ValueHistogramCollectionQueryOperation.init(quantityType:configuration:name:queryQualityOfService:healthStore:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;

  v8 = sub_1BCAAAD54(a1, a2, a3, a4, a5, a6);

  return v8;
}

uint64_t sub_1BCAAA214()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  id v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _BYTE v25[16];
  void *v26;
  char v27;

  v1 = v0;
  v2 = sub_1BCAB54A8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BC9A7EA4();
  v6 = (void *)swift_allocError();
  *v7 = 2;
  v26 = v6;
  v27 = 1;
  swift_retain();
  sub_1BCAB507C();

  swift_release();
  v8 = *(void **)&v0[qword_1ED6C3018];
  v9 = objc_msgSend(v8, sel_identifier);
  v10 = sub_1BCAB5F04();
  v12 = v11;

  v13._countAndFlagsBits = 0x676E696E6E7572;
  v13._object = (void *)0xE700000000000000;
  v14._countAndFlagsBits = v10;
  v14._object = v12;
  NSOperation.logLifeCycleEvent(_:withPrivateInfo:)(v13, v14);
  swift_bridgeObjectRelease();
  if (qword_1ED6C7098 != -1)
    swift_once();
  v15 = (id)qword_1ED6C69C0;
  v16 = v1;
  sub_1BCAB549C();
  sub_1BCAB6270();
  sub_1BC9A7EF4();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BCABE680;
  v18 = objc_msgSend(v8, sel_identifier);
  v19 = sub_1BCAB5F04();
  v21 = v20;

  *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v17 + 64) = sub_1BC9A7FA4();
  *(_QWORD *)(v17 + 32) = v19;
  *(_QWORD *)(v17 + 40) = v21;
  sub_1BCAB5484();
  swift_bridgeObjectRelease();
  v22 = *(void **)&v16[qword_1ED6D3810];
  v23 = sub_1BCAA9AF0();
  objc_msgSend(v22, sel_executeQuery_, v23);

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1BCAAA4A8(void *a1)
{
  id v1;

  v1 = a1;
  sub_1BCAAA214();

}

void sub_1BCAAA4DC()
{
  char *v0;
  Swift::String v1;
  Swift::String v2;
  void *v3;
  _BYTE *v4;
  void *v5;
  id v6;

  if (objc_msgSend(v0, sel_isCancelled))
  {
    v1._countAndFlagsBits = 0x656C6C65636E6163;
    v1._object = (void *)0xE900000000000064;
    v2._countAndFlagsBits = 0;
    v2._object = (void *)0xE000000000000000;
    NSOperation.logLifeCycleEvent(_:withPrivateInfo:)(v1, v2);
    sub_1BC9A7EA4();
    v3 = (void *)swift_allocError();
    *v4 = 3;
    MEMORY[0x1E0C80A78](v3);
    swift_retain();
    sub_1BCAB507C();

    swift_release();
  }
  v5 = *(void **)&v0[qword_1ED6D3810];
  v6 = sub_1BCAA9AF0();
  objc_msgSend(v5, sel_stopQuery_, v6);

}

void sub_1BCAAA604(void *a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t *v20;
  id v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;

  v3 = v2;
  v27 = a2;
  v5 = sub_1BCAB54A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = DateInterval.stringWithISO8601Format()();
  sub_1BCAB6264();
  if (qword_1ED6C7098 != -1)
    swift_once();
  sub_1BCAA9F9C((uint64_t)v8);
  sub_1BC9A7EF4();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BCABE680;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1BC9A7FA4();
  *(Swift::String *)(v10 + 32) = v9;
  sub_1BCAB5484();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((objc_msgSend(v3, sel_isCancelled) & 1) != 0
    || (v11 = (uint64_t)objc_msgSend(v3, sel_isFinished), (v11 & 1) != 0))
  {
    v12._object = (void *)0x80000001BCACE790;
    v12._countAndFlagsBits = 0xD00000000000002DLL;
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    NSOperation.logLifeCycleEvent(_:withPrivateInfo:)(v12, v13);
  }
  else
  {
    v14 = a1;
    if (!a1)
    {
      v15 = (void *)v27;
      if (v27)
        v16 = 0xD00000000000002DLL;
      else
        v16 = 0;
      if (v27)
        v17 = 0x80000001BCAD3830;
      else
        v17 = 0;
      if (v27)
        v18 = v27 | 0x8000000000000000;
      else
        v18 = 0xC000000000000000;
      v26 = sub_1BC9A82C4();
      v19 = (void *)swift_allocError();
      *v20 = v16;
      v20[1] = v17;
      v20[2] = v18;
      swift_getErrorValue();
      v21 = v15;
      sub_1BC9A8308(v16, v17, v18);
      v22._countAndFlagsBits = sub_1BCAB6810();
      v23._countAndFlagsBits = 0;
      v23._object = (void *)0xE000000000000000;
      NSOperation.logErrorString(_:withInfo:)(v22, v23);
      swift_bridgeObjectRelease();

      v11 = swift_allocError();
      v14 = (void *)v11;
      *v24 = v16;
      v24[1] = v17;
      v24[2] = v18;
    }
    MEMORY[0x1E0C80A78](v11);
    v25 = a1;
    sub_1BCAB50AC();
    sub_1BC9B39B4(v14);
  }
}

uint64_t sub_1BCAAA920(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;

  sub_1BC9F3F44(a2);
  swift_retain();
  sub_1BCAB507C();
  sub_1BC9B39B4(a2);
  swift_release();
  v4 = objc_msgSend(*(id *)(a1 + qword_1ED6C3018), sel_identifier);
  v5 = sub_1BCAB5F04();
  v7 = v6;

  v8._countAndFlagsBits = 0x64656873696E6966;
  v8._object = (void *)0xE800000000000000;
  v9._countAndFlagsBits = v5;
  v9._object = v7;
  NSOperation.logLifeCycleEvent(_:withPrivateInfo:)(v8, v9);
  return swift_bridgeObjectRelease();
}

id ValueHistogramCollectionQueryOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ValueHistogramCollectionQueryOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BCAAAA4C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BCAAAA78()
{
  uint64_t v0;

  swift_release();

  sub_1BCAAB108(v0 + qword_1ED6D3818);
  return sub_1BCAAB144(v0 + qword_1ED6C3030);
}

id ValueHistogramCollectionQueryOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ValueHistogramCollectionQueryOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BCAAAB18(uint64_t a1)
{
  swift_release();

  sub_1BCAAB108(a1 + qword_1ED6D3818);
  return sub_1BCAAB144(a1 + qword_1ED6C3030);
}

uint64_t sub_1BCAAAB90@<X0>(uint64_t a1@<X8>)
{
  _QWORD **v1;
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(class metadata base offset for ValueHistogramCollectionQueryOperation
                                + (*MEMORY[0x1E0DEEDD8] & **v1)
                                + 80))();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return result;
}

id sub_1BCAAABE4(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v8;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v8 = v7;
  v14 = (void *)sub_1BCAB4DE8();
  v15 = (void *)sub_1BCAB4BF0();
  sub_1BC9A649C(0, &qword_1ED6C30E0);
  v16 = (void *)sub_1BCAB600C();
  swift_bridgeObjectRelease();
  aBlock[4] = a6;
  aBlock[5] = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC9F3B04;
  aBlock[3] = &block_descriptor_17;
  v17 = _Block_copy(aBlock);
  v18 = objc_msgSend(v8, sel_initWithQuantityType_quantitySamplePredicate_anchorDate_intervalComponents_quantityRanges_resultsHandler_, a1, a2, v14, v15, v16, v17);
  _Block_release(v17);

  v19 = sub_1BCAB4C74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a4, v19);
  v20 = sub_1BCAB4E54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a3, v20);
  swift_release();
  return v18;
}

id sub_1BCAAAD54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  char *v6;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  objc_super v24;
  uint64_t v25;
  char v26;

  v12 = qword_1ED6C3020;
  sub_1BC9A7EA4();
  v13 = swift_allocError();
  *v14 = 0;
  v25 = v13;
  v26 = 1;
  sub_1BC998AB0(0, &qword_1ED6C3010, (uint64_t (*)(uint64_t))sub_1BCAAB1D0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2E5C8]);
  swift_allocObject();
  v15 = v6;
  *(_QWORD *)&v6[v12] = sub_1BCAB50A0();
  *(_QWORD *)&v15[qword_1ED6C3028] = 0;
  v16 = &v15[qword_1ED6C3030];
  v17 = sub_1BCAB54A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  *(_QWORD *)&v15[qword_1ED6C3018] = a1;
  sub_1BCAAB25C(a2, (uint64_t)&v15[qword_1ED6D3818]);
  *(_QWORD *)&v15[qword_1ED6D3820] = a5;
  *(_QWORD *)&v15[qword_1ED6D3810] = a6;
  v18 = a1;
  v19 = a6;

  v24.receiver = v15;
  v24.super_class = (Class)type metadata accessor for ValueHistogramCollectionQueryOperation();
  v20 = objc_msgSendSuper2(&v24, sel_init);
  v21 = v20;
  if (a4)
  {
    v22 = (void *)sub_1BCAB5EE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v20, sel_setName_, v22);

  sub_1BCAAB108(a2);
  return v20;
}

uint64_t type metadata accessor for ValueHistogramCollectionQueryOperation()
{
  uint64_t result;

  result = qword_1ED6C3038;
  if (!qword_1ED6C3038)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BCAAAF64@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(class metadata base offset for ValueHistogramCollectionQueryOperation
                                + (*MEMORY[0x1E0DEEDD8] & **a1)
                                + 80))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1BCAAAFBC()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for ValueHistogramCollectionQueryConfiguration();
  if (v0 <= 0x3F)
  {
    sub_1BC998AB0(319, &qword_1ED6C5F20, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t method lookup function for ValueHistogramCollectionQueryOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ValueHistogramCollectionQueryOperation.result.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ValueHistogramCollectionQueryOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 80))();
}

uint64_t dispatch thunk of ValueHistogramCollectionQueryOperation.__allocating_init(quantityType:configuration:name:queryQualityOfService:healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ValueHistogramCollectionQueryOperation + v0 + 152))();
}

uint64_t sub_1BCAAB100()
{
  return type metadata accessor for ValueHistogramCollectionQueryOperation();
}

uint64_t sub_1BCAAB108(uint64_t a1)
{
  uint64_t Configuration;

  Configuration = type metadata accessor for ValueHistogramCollectionQueryConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(Configuration - 8) + 8))(a1, Configuration);
  return a1;
}

uint64_t sub_1BCAAB144(uint64_t a1)
{
  uint64_t v2;

  sub_1BC998AB0(0, &qword_1ED6C5F20, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BCAAB198()
{
  uint64_t v0;

  return sub_1BCAAA920(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1BCAAB1A4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1BCAAB1C8(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;

  sub_1BCAA9F30(a1, a2, a3, v3);
}

void sub_1BCAAB1D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C30F8)
  {
    sub_1BC9A649C(255, &qword_1ED6C30E8);
    sub_1BC9A7F58(255, (unint64_t *)&qword_1ED6C6F70);
    v0 = sub_1BCAB68A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C30F8);
  }
}

uint64_t sub_1BCAAB25C(uint64_t a1, uint64_t a2)
{
  uint64_t Configuration;

  Configuration = type metadata accessor for ValueHistogramCollectionQueryConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Configuration - 8) + 16))(a2, a1, Configuration);
  return a2;
}

id DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy.init(intervalMatchDateComponents:intervalDownsampleFactor:enumerationAlgorithm:useMajorTicksOnly:labelDateFormatter:boundsLabelDateFormatter:prefersRelativeDateFormatting:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char a4@<W3>, void *a5@<X4>, id a6@<X5>, char a7@<W6>, _BYTE *a8@<X8>)
{
  char v15;
  int *v16;
  _BYTE *v17;
  uint64_t v18;
  id result;

  v15 = *a3;
  v16 = (int *)type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  v17 = &a8[v16[5]];
  v18 = sub_1BCAB4C74();
  result = (id)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a1, v18);
  *(_QWORD *)&a8[v16[6]] = a2;
  a8[v16[7]] = a4;
  *(_QWORD *)&a8[v16[8]] = a5;
  if (!a6)
  {
    result = a5;
    a6 = result;
  }
  *(_QWORD *)&a8[v16[9]] = a6;
  *a8 = v15;
  a8[v16[10]] = a7 & 1;
  return result;
}

uint64_t type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
{
  uint64_t result;

  result = qword_1ED6C57D0;
  if (!qword_1ED6C57D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DiagramDateAxisMetricsCalculator.init(boundsLabelsShouldShowDaySpan:customLabelDateFormatter:)(char a1, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t DiagramDateAxisMetricsCalculator.deinit()
{
  uint64_t v0;

  return v0;
}

void sub_1BCAAB3D0(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _QWORD *v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  int v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;

  v10 = sub_1BCAB4E54();
  v56 = *(_QWORD *)(v10 - 8);
  v57 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BCAB4F74();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB4F50();
  sub_1BCAAE22C(a2, (uint64_t)v16, a4, a5);
  v60 = v17;
  if (a1)
  {
    v52 = a3;
    v18 = *(_QWORD *)(a1 + 16);
    if (v18)
    {
      v53 = v16;
      v50 = v14;
      v51 = v13;
      v54 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
      v55 = *(int *)(v54 + 40);
      swift_bridgeObjectRetain();
      v19 = 0;
      do
      {
        sub_1BCAB4D94();
        if (a2[v55] == 1)
        {
          v20 = (void *)sub_1BCAB4DE8();
          sub_1BCAAF1B4();
          v21 = (void *)sub_1BCAB6120();
          v22 = (id)HKRelativeMonthDateYearText();

          if (!v22)
          {
            __break(1u);
            return;
          }
        }
        else
        {
          v23 = *(void **)&a2[*(int *)(v54 + 32)];
          v24 = (void *)sub_1BCAB4DE8();
          v22 = objc_msgSend(v23, sel_stringFromDate_, v24);

        }
        v25 = sub_1BCAB5F04();
        v27 = v26;

        sub_1BCAB4DA0();
        v29 = v28;
        v30 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v30 = sub_1BC9D9B7C(0, v30[2] + 1, 1, v30);
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v30 = sub_1BC9D9B7C((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        ++v19;
        v30[2] = v32 + 1;
        v33 = &v30[5 * v32];
        v33[4] = v25;
        v33[5] = v27;
        v33[6] = v29;
        v33[7] = 1;
        *((_DWORD *)v33 + 16) = 1148846080;
        v60 = v30;
        (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v57);
      }
      while (v18 != v19);
      swift_bridgeObjectRelease();
      v13 = v51;
      v14 = v50;
      v16 = v53;
    }
    sub_1BCAACA74(&v60);
    a3 = v52;
  }
  if ((a2[*(int *)(type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy() + 28)] & 1) == 0)
  {
    v53 = v16;
    v34 = v13;
    sub_1BCAACAE0(a2, (uint64_t)&v61);
    v36 = v61;
    v35 = v62;
    v37 = v63;
    v38 = v64;
    v39 = v65;
    sub_1BCAACAE0(a2, (uint64_t)v58);
    v40 = v58[0];
    v41 = v58[1];
    v42 = v58[2];
    v43 = v58[3];
    v44 = v59;
    v61 = v36;
    v62 = v35;
    v63 = v37;
    v64 = v38;
    v65 = v39;
    swift_bridgeObjectRetain();
    sub_1BCA4B060(0, 0, (uint64_t)&v61);
    swift_bridgeObjectRelease();
    v45 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v45 = sub_1BC9D9B7C(0, v45[2] + 1, 1, v45);
    v47 = v45[2];
    v46 = v45[3];
    if (v47 >= v46 >> 1)
      v45 = sub_1BC9D9B7C((_QWORD *)(v46 > 1), v47 + 1, 1, v45);
    v45[2] = v47 + 1;
    v48 = &v45[5 * v47];
    v48[4] = v40;
    v48[5] = v41;
    v48[6] = v42;
    v48[7] = v43;
    *((_DWORD *)v48 + 16) = v44;
    v60 = v45;
    v13 = v34;
    v16 = v53;
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *(_QWORD *)a3 = v60;
  *(double *)(a3 + 8) = a4;
  *(double *)(a3 + 16) = a5;
}

uint64_t sub_1BCAAB80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  unsigned __int8 *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v17;

  v9 = sub_1BCAB4F74();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB4F50();
  (*(void (**)(char *, uint64_t, uint64_t, _QWORD, double, double))(*(_QWORD *)v4 + 104))(v12, 8, 18, v4[16], a3, a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1BCAAB3D0(a1, v15, a2, a3, a4);
  return sub_1BCAAB924((uint64_t)v15);
}

uint64_t sub_1BCAAB924(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DiagramDateAxisMetricsCalculator.__allocating_init(boundsLabelsShouldShowDaySpan:customLabelDateFormatter:)(char a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t DiagramWeekdayAxisMetricsCalculator.__allocating_init(boundsLabelsShouldShowDaySpan:customLabelDateFormatter:)(char a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1BCAAB9E8(double a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  double v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  _BOOL4 v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_1BCAB4E54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v28 - v11;
  v13 = sub_1BCAADD38(a1, a2, a3);
  v30 = MEMORY[0x1E0DEE9D8];
  result = sub_1BC9BAC94(0, v13 & ~(v13 >> 63), 0);
  if (v13 < 0)
    goto LABEL_30;
  v15 = v30;
  v16 = 0;
  v17 = 0;
  if (!v13)
  {
    v20 = a1;
    goto LABEL_16;
  }
  v18 = a1;
  v29 = v6;
  do
  {
    v19 = v18 <= a2;
    if (a3 > 0.0)
      v19 = v18 >= a2;
    if (v19)
    {
      if (v16 & 1 | (v18 != a2))
        goto LABEL_28;
      v16 = 1;
      v20 = v18;
    }
    else
    {
      v21 = __OFADD__(v17++, 1);
      if (v21)
        goto LABEL_29;
      v20 = a1 + (double)v17 * a3;
    }
    sub_1BCAB4D94();
    v30 = v15;
    v23 = *(_QWORD *)(v15 + 16);
    v22 = *(_QWORD *)(v15 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_1BC9BAC94(v22 > 1, v23 + 1, 1);
      v15 = v30;
    }
    *(_QWORD *)(v15 + 16) = v23 + 1;
    v6 = v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v23, v9, v29);
    v18 = v20;
    --v13;
  }
  while (v13);
  while (1)
  {
LABEL_16:
    v24 = v20 <= a2;
    if (a3 > 0.0)
      v24 = v20 >= a2;
    if (!v24)
      break;
    if ((v20 != a2) | v16 & 1)
      return v15;
    v16 = 1;
    v25 = v20;
LABEL_23:
    sub_1BCAB4D94();
    v30 = v15;
    v27 = *(_QWORD *)(v15 + 16);
    v26 = *(_QWORD *)(v15 + 24);
    if (v27 >= v26 >> 1)
    {
      sub_1BC9BAC94(v26 > 1, v27 + 1, 1);
      v15 = v30;
    }
    *(_QWORD *)(v15 + 16) = v27 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v27, v12, v6);
    v20 = v25;
  }
  v21 = __OFADD__(v17++, 1);
  if (!v21)
  {
    v25 = a1 + (double)v17 * a3;
    goto LABEL_23;
  }
  __break(1u);
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

id sub_1BCAABC98@<X0>(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(unint64_t, char *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id result;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  char *v43;
  char *v44;
  uint64_t v45;

  v42 = a1;
  v5 = sub_1BCAB4BD8();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x1E0C80A78](v5);
  v44 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BCAB4E54();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v43 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v40 - v11;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v40 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v40 - v17;
  v45 = MEMORY[0x1E0DEE9D8];
  sub_1BC9BAC94(0, 2, 0);
  v19 = v45;
  sub_1BCAB4D94();
  v21 = *(_QWORD *)(v19 + 16);
  v20 = *(_QWORD *)(v19 + 24);
  if (v21 >= v20 >> 1)
  {
    sub_1BC9BAC94(v20 > 1, v21 + 1, 1);
    v19 = v45;
  }
  *(_QWORD *)(v19 + 16) = v21 + 1;
  v22 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v23 = *(_QWORD *)(v8 + 72);
  v24 = v19 + v22 + v23 * v21;
  v25 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v25(v24, v18, v7);
  sub_1BCAB4D94();
  v45 = v19;
  v27 = *(_QWORD *)(v19 + 16);
  v26 = *(_QWORD *)(v19 + 24);
  if (v27 >= v26 >> 1)
  {
    sub_1BC9BAC94(v26 > 1, v27 + 1, 1);
    v19 = v45;
  }
  *(_QWORD *)(v19 + 16) = v27 + 1;
  v28 = v19 + v22;
  result = (id)((uint64_t (*)(unint64_t, char *, uint64_t))v25)(v19 + v22 + v27 * v23, v15, v7);
  v30 = *(_QWORD *)(v19 + 16);
  if (!v30)
  {
    __break(1u);
    goto LABEL_13;
  }
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
  result = (id)v31(v12, v28, v7);
  if (v30 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v31(v43, v28 + v23, v7);
  swift_release();
  v32 = v44;
  sub_1BCAB4BA8();
  result = objc_msgSend((id)objc_opt_self(), sel_hk_mediumMonthDayDateIntervalFormatter);
  if (!result)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v33 = result;
  v34 = (void *)sub_1BCAB4B78();
  v35 = objc_msgSend(v33, sel_stringFromDateInterval_, v34);

  if (v35)
  {
    v36 = sub_1BCAB5F04();
    v38 = v37;

    sub_1BCAAE874();
    v35 = (id)swift_allocObject();
    *((_OWORD *)v35 + 1) = xmmword_1BCABE680;
    *((_QWORD *)v35 + 4) = v36;
    *((_QWORD *)v35 + 5) = v38;
    *((double *)v35 + 6) = a2;
    *((_QWORD *)v35 + 7) = 1;
    *((_DWORD *)v35 + 16) = 1144750080;

    result = (id)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v32, v41);
  }
  else
  {

    result = (id)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v32, v41);
    a2 = 0.0;
    a3 = 0.0;
  }
  v39 = v42;
  *(_QWORD *)v42 = v35;
  v39[1] = a2;
  v39[2] = a3;
  return result;
}

uint64_t DiagramDateRangeAxisMetricsCalculator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DiagramDateRangeAxisMetricsCalculator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id sub_1BCAAC004@<X0>(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_1BCAABC98(a1, a2, a3);
}

BOOL static DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm.hash(into:)()
{
  return sub_1BCAB687C();
}

uint64_t DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm.hashValue.getter()
{
  sub_1BCAB6870();
  sub_1BCAB687C();
  return sub_1BCAB6894();
}

id DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy.labelDateFormatter.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + *(int *)(type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
                                    + 32)));
}

void sub_1BCAAC0BC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  double v39;
  char v40;
  void (*v41)(char *, uint64_t);
  char v42;
  double v43;
  uint64_t v44;
  double v45;
  BOOL v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v54;
  void *v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  int *v72;
  uint64_t v73;
  char *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  int *v79;
  _BYTE *v80;
  char *v81;
  _BYTE *v82;
  char *v83;
  id v84;
  char *v85;
  id v86;
  id v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;

  v93 = a2;
  v94 = (_BYTE *)a5;
  v97 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  MEMORY[0x1E0C80A78](v97);
  v90 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v92 = (char *)&v88 - v14;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v88 - v16;
  sub_1BC9AFF04(0, (unint64_t *)&qword_1ED6C7290, (void (*)(uint64_t))MEMORY[0x1E0CB1470]);
  MEMORY[0x1E0C80A78](v18);
  v99 = (char *)&v88 - v19;
  sub_1BC9AFF04(0, &qword_1ED6C7288, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v88 - v21;
  v23 = sub_1BCAB4C74();
  v95 = *(_QWORD *)(v23 - 8);
  v96 = v23;
  MEMORY[0x1E0C80A78](v23);
  v88 = (char *)&v88 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v89 = (char *)&v88 - v26;
  MEMORY[0x1E0C80A78](v27);
  v91 = (char *)&v88 - v28;
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v88 - v30;
  v32 = sub_1BCAB4E54();
  v33 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v35 = (char *)&v88 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36);
  v38 = (char *)&v88 - v37;
  v39 = (double)a3 * 60.0;
  if ((a4 & 1) != 0)
  {
    sub_1BCAB4D94();
    sub_1BCAB4D94();
    v40 = sub_1BCAB4F44();
    v41 = *(void (**)(char *, uint64_t))(v33 + 8);
    v41(v35, v32);
    v41(v38, v32);
    v42 = v40 ^ 1;
  }
  else
  {
    v42 = 0;
  }
  v43 = a7 - a6;
  if (v43 <= v39)
  {
    sub_1BCAADED0(v93, a3, v43);
    v59 = sub_1BCAB4F74();
    v60 = *(_QWORD *)(v59 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v22, a1, v59);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v22, 0, 1, v59);
    v61 = sub_1BCAB4FB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v99, 1, 1, v61);
    sub_1BCAB4C50();
    v62 = *(void **)(v98 + 24);
    if (v62)
    {
      v63 = *(id *)(v98 + 24);
    }
    else
    {
      v63 = (id)HKDateFormatterFromTemplate();
      if (!v63)
      {
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
    }
    v70 = v62;
    if ((v42 & 1) != 0)
      v71 = (id)HKDateFormatterFromTemplate();
    else
      v71 = 0;
    v72 = (int *)v97;
    (*(void (**)(_BYTE *, char *, uint64_t))(v95 + 32))(&v17[*(int *)(v97 + 20)], v31, v96);
    *(_QWORD *)&v17[v72[6]] = 1;
    v17[v72[7]] = 0;
    *(_QWORD *)&v17[v72[8]] = v63;
    if (!v71)
      v71 = v63;
    *(_QWORD *)&v17[v72[9]] = v71;
    *v17 = 0;
    v17[v72[10]] = 0;
    v73 = (uint64_t)v17;
    goto LABEL_52;
  }
  v44 = *MEMORY[0x1E0CB4790];
  if ((unint64_t)(*MEMORY[0x1E0CB4790] - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_54;
  }
  v45 = (double)(8 * v44);
  if (v39 > v45)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (v39 <= v43 && v43 <= v45)
  {
    sub_1BCAADED0(v93, a3, v43 / 60.0);
    v64 = sub_1BCAB4F74();
    v65 = *(_QWORD *)(v64 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v22, a1, v64);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v65 + 56))(v22, 0, 1, v64);
    v66 = sub_1BCAB4FB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v99, 1, 1, v66);
    v67 = v91;
    sub_1BCAB4C50();
    v68 = *(void **)(v98 + 24);
    if (v68)
    {
      v69 = *(id *)(v98 + 24);
LABEL_35:
      v77 = v68;
      if ((v42 & 1) != 0)
        v78 = (id)HKDateFormatterFromTemplate();
      else
        v78 = 0;
      v79 = (int *)v97;
      v80 = v92;
      (*(void (**)(char *, char *, uint64_t))(v95 + 32))(&v92[*(int *)(v97 + 20)], v67, v96);
      *(_QWORD *)&v80[v79[6]] = 1;
      v80[v79[7]] = 0;
      *(_QWORD *)&v80[v79[8]] = v69;
      if (!v78)
        v78 = v69;
      *(_QWORD *)&v80[v79[9]] = v78;
      *v80 = 0;
LABEL_51:
      v80[v79[10]] = 0;
      v73 = (uint64_t)v80;
LABEL_52:
      sub_1BCAAE8C8(v73, (uint64_t)v94);
      return;
    }
    v69 = (id)HKDateFormatterFromTemplate();
    if (v69)
      goto LABEL_35;
    goto LABEL_58;
  }
  v47 = __OFADD__(*MEMORY[0x1E0CB4788], v44);
  v48 = *MEMORY[0x1E0CB4788] + v44;
  if (v47)
    goto LABEL_55;
  v49 = (double)v48;
  if (v45 > (double)v48)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v50 = sub_1BCAB4F74();
  v51 = *(_QWORD *)(v50 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v22, a1, v50);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v22, 0, 1, v50);
  v52 = sub_1BCAB4FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v99, 1, 1, v52);
  if (v43 < v45 || v43 > v49)
  {
    v54 = v88;
    sub_1BCAB4C50();
    v55 = *(void **)(v98 + 24);
    if (v55)
    {
      v99 = *(char **)(v98 + 24);
      v56 = v96;
      v57 = (int *)v97;
      v58 = v95;
    }
    else
    {
      v81 = (char *)(id)HKDateFormatterFromTemplate();
      v57 = (int *)v97;
      if (!v81)
      {
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
      v55 = 0;
      v58 = v95;
      v56 = v96;
      v99 = v81;
    }
    v82 = v94;
    (*(void (**)(_BYTE *, char *, uint64_t))(v58 + 32))(&v94[v57[5]], v54, v56);
    *(_QWORD *)&v82[v57[6]] = 12;
    v82[v57[7]] = 0;
    v83 = v99;
    *(_QWORD *)&v82[v57[8]] = v99;
    *(_QWORD *)&v82[v57[9]] = v83;
    *v82 = 1;
    v82[v57[10]] = 1;
    v84 = v55;
    v85 = v99;
    return;
  }
  v74 = v89;
  sub_1BCAB4C50();
  v75 = *(void **)(v98 + 24);
  if (v75)
  {
    v76 = *(id *)(v98 + 24);
LABEL_45:
    v86 = v75;
    if ((v42 & 1) != 0)
      v87 = (id)HKDateFormatterFromTemplate();
    else
      v87 = 0;
    v79 = (int *)v97;
    v80 = v90;
    (*(void (**)(char *, char *, uint64_t))(v95 + 32))(&v90[*(int *)(v97 + 20)], v74, v96);
    *(_QWORD *)&v80[v79[6]] = 1;
    v80[v79[7]] = 0;
    *(_QWORD *)&v80[v79[8]] = v76;
    if (!v87)
      v87 = v76;
    *(_QWORD *)&v80[v79[9]] = v87;
    *v80 = 1;
    goto LABEL_51;
  }
  v76 = (id)HKDateFormatterFromTemplate();
  if (v76)
    goto LABEL_45;
LABEL_60:
  __break(1u);
}

uint64_t sub_1BCAACA74(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BCAAD328(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_1BCAAD350(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1BCAACAE0@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v4 = sub_1BCAB4E54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB4D94();
  v8 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  if (a1[*(int *)(v8 + 40)] != 1)
    goto LABEL_4;
  v9 = (void *)sub_1BCAB4DE8();
  sub_1BCAAF1B4();
  v10 = (void *)sub_1BCAB6120();
  a1 = (id)HKRelativeMonthDateYearText();

  if (!a1)
  {
    __break(1u);
LABEL_4:
    v11 = *(void **)&a1[*(int *)(v8 + 36)];
    v12 = (void *)sub_1BCAB4DE8();
    a1 = objc_msgSend(v11, sel_stringFromDate_, v12);

  }
  v13 = sub_1BCAB5F04();
  v15 = v14;

  sub_1BCAB4DA0();
  v17 = v16;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v15;
  *(_QWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 24) = 1;
  *(_DWORD *)(a2 + 32) = 1144750080;
  return result;
}

uint64_t sub_1BCAACC54@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v4 = (int *)type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  if (*(_BYTE *)(a1 + v4[7]) != 1)
    goto LABEL_5;
  if (*(_BYTE *)(a1 + v4[10]) != 1)
  {
    v11 = *(void **)(a1 + v4[8]);
    v12 = (void *)sub_1BCAB4DE8();
    v7 = objc_msgSend(v11, sel_stringFromDate_, v12);

    goto LABEL_7;
  }
  v5 = (void *)sub_1BCAB4DE8();
  sub_1BCAAF1B4();
  v6 = (void *)sub_1BCAB6120();
  v7 = (id)HKRelativeMonthDateYearText();

  if (v7)
  {
LABEL_7:
    v8 = sub_1BCAB5F04();
    v9 = v13;

    v10 = 1;
    goto LABEL_8;
  }
  __break(1u);
LABEL_5:
  v8 = 0;
  v9 = 0;
  v10 = 2;
LABEL_8:
  result = sub_1BCAB4DA0();
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v15;
  *(_QWORD *)(a2 + 24) = v10;
  *(_DWORD *)(a2 + 32) = 1144750080;
  return result;
}

uint64_t sub_1BCAACD7C(uint64_t a1, double a2, double a3, uint64_t a4, _BYTE *a5, uint64_t *a6, uint64_t a7, void (*a8)(_QWORD *__return_ptr, char *), uint64_t a9, uint64_t *a10)
{
  int v10;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  _QWORD v35[4];
  int v36;

  v34 = a10;
  sub_1BC9AFF04(0, &qword_1ED6C7280, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v35[-1] - v19;
  v21 = sub_1BCAB4E54();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v35[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9AFC58(a1, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
    return sub_1BC9AFCAC((uint64_t)v20);
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
  sub_1BCAB4DA0();
  if (v26 < a3)
  {
    v27 = *a6 + 1;
    if (__OFADD__(*a6, 1))
    {
      __break(1u);
    }
    else
    {
      *a6 = v27;
      v28 = *(_QWORD *)(a7
                      + *(int *)(type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
                               + 24));
      if (v28)
      {
        if (v27 != 0x8000000000000000 || v28 != -1)
        {
          if (v27 % v28)
            return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
          a8(v35, v24);
          a9 = v35[0];
          a7 = v35[1];
          a3 = *(double *)&v35[2];
          a6 = (uint64_t *)v35[3];
          v10 = v36;
          v29 = v34;
          v27 = *v34;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *v29 = v27;
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
LABEL_10:
            v32 = *(_QWORD *)(v27 + 16);
            v31 = *(_QWORD *)(v27 + 24);
            if (v32 >= v31 >> 1)
            {
              v27 = (uint64_t)sub_1BC9D9B7C((_QWORD *)(v31 > 1), v32 + 1, 1, (_QWORD *)v27);
              *v34 = v27;
            }
            *(_QWORD *)(v27 + 16) = v32 + 1;
            v33 = v27 + 40 * v32;
            *(_QWORD *)(v33 + 32) = a9;
            *(_QWORD *)(v33 + 40) = a7;
            *(double *)(v33 + 48) = a3;
            *(_QWORD *)(v33 + 56) = a6;
            *(_DWORD *)(v33 + 64) = v10;
            return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
          }
LABEL_18:
          v27 = (uint64_t)sub_1BC9D9B7C(0, *(_QWORD *)(v27 + 16) + 1, 1, (_QWORD *)v27);
          *v34 = v27;
          goto LABEL_10;
        }
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
    }
    __break(1u);
    goto LABEL_17;
  }
  result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  *a5 = 1;
  return result;
}

uint64_t DiagramDateAxisMetricsCalculator.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1BCAAD008()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

id sub_1BCAAD030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id result;
  void *v24;
  id v25;
  uint64_t v26;

  sub_1BC9AFF04(0, (unint64_t *)&qword_1ED6C7290, (void (*)(uint64_t))MEMORY[0x1E0CB1470]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v26 - v9;
  sub_1BC9AFF04(0, &qword_1ED6C7288, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v26 - v12;
  v14 = sub_1BCAB4C74();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (int *)type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB4F50();
  v21 = sub_1BCAB4F74();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v13, 0, 1, v21);
  v22 = sub_1BCAB4FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v10, 1, 1, v22);
  sub_1BCAB4C50();
  result = (id)HKDateFormatterFromTemplate();
  if (result)
  {
    v24 = result;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v20[v18[5]], v17, v14);
    *(_QWORD *)&v20[v18[6]] = 1;
    v20[v18[7]] = 1;
    *(_QWORD *)&v20[v18[8]] = v24;
    *(_QWORD *)&v20[v18[9]] = v24;
    *v20 = 1;
    v20[v18[10]] = 0;
    v25 = v24;
    sub_1BCAAB3D0(a1, v20, a2, a3, a4);
    return (id)sub_1BCAAB924((uint64_t)v20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DiagramWeekdayAxisMetricsCalculator.init(boundsLabelsShouldShowDaySpan:customLabelDateFormatter:)(char a1, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t DiagramWeekdayAxisMetricsCalculator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DiagramWeekdayAxisMetricsCalculator.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

_QWORD *sub_1BCAAD328(_QWORD *a1)
{
  return sub_1BC9D9B7C(0, a1[2], 0, a1);
}

char *sub_1BCAAD33C(uint64_t a1)
{
  return sub_1BC9D9DE4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1BCAAD350(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double *__dst;

  v3 = a1[1];
  result = sub_1BCAB678C();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v92 = *a1;
      v93 = -1;
      v94 = 1;
      v95 = *a1;
      do
      {
        v96 = v93;
        v97 = v95;
        do
        {
          v98 = *(double *)(v97 + 56);
          if (v98 >= *(double *)(v97 + 16))
            break;
          if (!v92)
            goto LABEL_141;
          v99 = v97 + 40;
          v100 = *(_QWORD *)(v97 + 64);
          v101 = *(_DWORD *)(v97 + 72);
          v102 = *(_OWORD *)(v97 + 40);
          v103 = *(_OWORD *)(v97 + 16);
          *(_OWORD *)(v97 + 40) = *(_OWORD *)v97;
          *(_OWORD *)(v97 + 56) = v103;
          v104 = *(_QWORD *)(v97 + 32);
          *(_OWORD *)v97 = v102;
          *(double *)(v97 + 16) = v98;
          *(_QWORD *)(v97 + 24) = v100;
          *(_DWORD *)(v97 + 32) = v101;
          v97 -= 40;
          *(_QWORD *)(v99 + 32) = v104;
        }
        while (!__CFADD__(v96++, 1));
        ++v94;
        v95 += 40;
        --v93;
      }
      while (v94 != v3);
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v115 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    __dst = (double *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v12 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_103:
      v106 = v12;
      v118 = v9;
      if (v13 >= 2)
      {
        v107 = *v115;
        do
        {
          v108 = v13 - 2;
          if (v13 < 2)
            goto LABEL_132;
          if (!v107)
            goto LABEL_145;
          v109 = v106;
          v110 = *(_QWORD *)&v106[16 * v108 + 32];
          v111 = *(_QWORD *)&v106[16 * v13 + 24];
          sub_1BCAADA98((double *)(v107 + 40 * v110), (double *)(v107 + 40 * *(_QWORD *)&v106[16 * v13 + 16]), v107 + 40 * v111, __dst);
          if (v1)
            break;
          if (v111 < v110)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v109 = sub_1BCA31BBC((uint64_t)v109);
          if (v108 >= *((_QWORD *)v109 + 2))
            goto LABEL_134;
          v112 = &v109[16 * v108 + 32];
          *(_QWORD *)v112 = v110;
          *((_QWORD *)v112 + 1) = v111;
          v113 = *((_QWORD *)v109 + 2);
          if (v13 > v113)
            goto LABEL_135;
          memmove(&v109[16 * v13 + 16], &v109[16 * v13 + 32], 16 * (v113 - v13));
          v106 = v109;
          *((_QWORD *)v109 + 2) = v113 - 1;
          v13 = v113 - 1;
        }
        while (v113 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v118 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v7 = v5 >> 1;
    v8 = sub_1BCAB6048();
    *(_QWORD *)(v8 + 16) = v7;
    v118 = v8;
    __dst = (double *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v116 = *a1 + 56;
  v117 = *a1 + 16;
  v114 = *a1 - 40;
  v12 = (char *)MEMORY[0x1E0DEE9D8];
  v119 = v6;
  v120 = v3;
  v121 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(double *)(v117 + 40 * v10);
      v16 = *(double *)(v117 + 40 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (double *)(v116 + 40 * v14);
        while (v15 < v16 != v17[5] >= *v17)
        {
          ++v10;
          v17 += 5;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14)
          goto LABEL_138;
        if (v14 < v10)
        {
          v18 = 40 * v10;
          v19 = 40 * v14;
          v20 = v10;
          v21 = v14;
          do
          {
            if (v21 != --v20)
            {
              if (!v11)
                goto LABEL_144;
              v22 = v11 + v19;
              v23 = *(_QWORD *)(v11 + v19 + 16);
              v24 = v11 + v18;
              v25 = *(_QWORD *)(v11 + v19 + 24);
              v26 = *(_DWORD *)(v11 + v19 + 32);
              v27 = *(_OWORD *)(v11 + v19);
              v28 = *(_QWORD *)(v11 + v18 - 8);
              v29 = *(_OWORD *)(v11 + v18 - 24);
              *(_OWORD *)v22 = *(_OWORD *)(v11 + v18 - 40);
              *(_OWORD *)(v22 + 16) = v29;
              *(_QWORD *)(v22 + 32) = v28;
              *(_OWORD *)(v24 - 40) = v27;
              *(_QWORD *)(v24 - 24) = v23;
              *(_QWORD *)(v24 - 16) = v25;
              *(_DWORD *)(v24 - 8) = v26;
            }
            ++v21;
            v18 -= 40;
            v19 += 40;
          }
          while (v21 < v20);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_136;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v30 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_139;
    if (v30 >= v3)
      v30 = v3;
    if (v30 < v14)
      break;
    if (v10 != v30)
    {
      v31 = v114 + 40 * v10;
      do
      {
        v32 = v14;
        v33 = v31;
        do
        {
          v34 = *(double *)(v33 + 56);
          if (v34 >= *(double *)(v33 + 16))
            break;
          if (!v11)
            goto LABEL_142;
          v35 = v33 + 40;
          v36 = *(_QWORD *)(v33 + 64);
          v37 = *(_DWORD *)(v33 + 72);
          v38 = *(_OWORD *)(v33 + 40);
          v39 = *(_OWORD *)(v33 + 16);
          *(_OWORD *)(v33 + 40) = *(_OWORD *)v33;
          *(_OWORD *)(v33 + 56) = v39;
          v40 = *(_QWORD *)(v33 + 32);
          *(_OWORD *)v33 = v38;
          *(double *)(v33 + 16) = v34;
          *(_QWORD *)(v33 + 24) = v36;
          *(_DWORD *)(v33 + 32) = v37;
          v33 -= 40;
          ++v32;
          *(_QWORD *)(v35 + 32) = v40;
        }
        while (v10 != v32);
        ++v10;
        v31 += 40;
      }
      while (v10 != v30);
      v10 = v30;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_1BCA317E4(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v42 = *((_QWORD *)v12 + 2);
    v41 = *((_QWORD *)v12 + 3);
    v13 = v42 + 1;
    v11 = v121;
    if (v42 >= v41 >> 1)
    {
      v91 = sub_1BCA317E4((char *)(v41 > 1), v42 + 1, 1, v12);
      v11 = v121;
      v12 = v91;
    }
    *((_QWORD *)v12 + 2) = v13;
    v43 = v12 + 32;
    v44 = &v12[16 * v42 + 32];
    *(_QWORD *)v44 = v14;
    *((_QWORD *)v44 + 1) = v10;
    if (v42)
    {
      while (1)
      {
        v45 = v13 - 1;
        if (v13 >= 4)
        {
          v50 = &v43[16 * v13];
          v51 = *((_QWORD *)v50 - 8);
          v52 = *((_QWORD *)v50 - 7);
          v56 = __OFSUB__(v52, v51);
          v53 = v52 - v51;
          if (v56)
            goto LABEL_120;
          v55 = *((_QWORD *)v50 - 6);
          v54 = *((_QWORD *)v50 - 5);
          v56 = __OFSUB__(v54, v55);
          v48 = v54 - v55;
          v49 = v56;
          if (v56)
            goto LABEL_121;
          v57 = v13 - 2;
          v58 = &v43[16 * v13 - 32];
          v60 = *(_QWORD *)v58;
          v59 = *((_QWORD *)v58 + 1);
          v56 = __OFSUB__(v59, v60);
          v61 = v59 - v60;
          if (v56)
            goto LABEL_123;
          v56 = __OFADD__(v48, v61);
          v62 = v48 + v61;
          if (v56)
            goto LABEL_126;
          if (v62 >= v53)
          {
            v80 = &v43[16 * v45];
            v82 = *(_QWORD *)v80;
            v81 = *((_QWORD *)v80 + 1);
            v56 = __OFSUB__(v81, v82);
            v83 = v81 - v82;
            if (v56)
              goto LABEL_130;
            v73 = v48 < v83;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v74 = *((_QWORD *)v12 + 4);
            v75 = *((_QWORD *)v12 + 5);
            v56 = __OFSUB__(v75, v74);
            v67 = v75 - v74;
            v68 = v56;
            goto LABEL_77;
          }
          v47 = *((_QWORD *)v12 + 4);
          v46 = *((_QWORD *)v12 + 5);
          v56 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          v49 = v56;
        }
        if ((v49 & 1) != 0)
          goto LABEL_122;
        v57 = v13 - 2;
        v63 = &v43[16 * v13 - 32];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        v66 = __OFSUB__(v64, v65);
        v67 = v64 - v65;
        v68 = v66;
        if (v66)
          goto LABEL_125;
        v69 = &v43[16 * v45];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v56 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v56)
          goto LABEL_128;
        if (__OFADD__(v67, v72))
          goto LABEL_129;
        if (v67 + v72 >= v48)
        {
          v73 = v48 < v72;
LABEL_83:
          if (v73)
            v45 = v57;
          goto LABEL_85;
        }
LABEL_77:
        if ((v68 & 1) != 0)
          goto LABEL_124;
        v76 = &v43[16 * v45];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v56 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v56)
          goto LABEL_127;
        if (v79 < v67)
          goto LABEL_15;
LABEL_85:
        v84 = v45 - 1;
        if (v45 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11)
          goto LABEL_143;
        v85 = v12;
        v86 = &v43[16 * v84];
        v87 = *(_QWORD *)v86;
        v88 = &v43[16 * v45];
        v89 = *((_QWORD *)v88 + 1);
        sub_1BCAADA98((double *)(v11 + 40 * *(_QWORD *)v86), (double *)(v11 + 40 * *(_QWORD *)v88), v11 + 40 * v89, __dst);
        if (v1)
          goto LABEL_93;
        if (v89 < v87)
          goto LABEL_117;
        if (v45 > *((_QWORD *)v85 + 2))
          goto LABEL_118;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v43[16 * v84 + 8] = v89;
        v90 = *((_QWORD *)v85 + 2);
        if (v45 >= v90)
          goto LABEL_119;
        v12 = v85;
        v13 = v90 - 1;
        memmove(&v43[16 * v45], v88 + 16, 16 * (v90 - 1 - v45));
        *((_QWORD *)v85 + 2) = v90 - 1;
        v11 = v121;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v119;
    v3 = v120;
    if (v10 >= v120)
    {
      v9 = v118;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  result = sub_1BCAB65B8();
  __break(1u);
  return result;
}

uint64_t sub_1BCAADA98(double *__src, double *a2, unint64_t a3, double *__dst)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  double *v13;
  double *v14;
  double *v15;
  double *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  double *v20;
  unint64_t v21;
  double *v22;
  double *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t result;
  double *v29;
  double *v30;
  double *v31;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = ((char *)a2 - (char *)__src) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v30 = __dst;
  v31 = __src;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      v19 = 5 * v11;
      if (__dst != a2 || &a2[v19] <= __dst)
        memmove(__dst, a2, 40 * v11);
      v20 = &v4[v19];
      v29 = &v4[v19];
      v31 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        v21 = a3 - 40;
        do
        {
          v22 = (double *)(v21 + 40);
          if (*(v20 - 3) >= *(v6 - 3))
          {
            v29 = v20 - 5;
            if (v22 < v20 || v21 >= (unint64_t)v20 || v22 != v20)
            {
              v26 = *(_OWORD *)(v20 - 5);
              v27 = *(_OWORD *)(v20 - 3);
              *(double *)(v21 + 32) = *(v20 - 1);
              *(_OWORD *)v21 = v26;
              *(_OWORD *)(v21 + 16) = v27;
            }
            v23 = v6;
            v20 -= 5;
            if (v6 <= v7)
              break;
          }
          else
          {
            v23 = v6 - 5;
            if (v22 != v6 || v21 >= (unint64_t)v6)
            {
              v24 = *(_OWORD *)v23;
              v25 = *(_OWORD *)(v6 - 3);
              *(double *)(v21 + 32) = *(v6 - 1);
              *(_OWORD *)v21 = v24;
              *(_OWORD *)(v21 + 16) = v25;
            }
            v31 = v6 - 5;
            if (v23 <= v7)
              break;
          }
          v21 -= 40;
          v6 = v23;
        }
        while (v20 > v4);
      }
LABEL_40:
      sub_1BCA318F0((void **)&v31, (const void **)&v30, &v29);
      return 1;
    }
  }
  else if (v8 >= -39)
  {
    v12 = 5 * v9;
    if (__dst != __src || &__src[v12] <= __dst)
      memmove(__dst, __src, v12 * 8);
    v13 = &v4[v12];
    v29 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      v14 = v4;
      while (1)
      {
        if (v6[2] >= v14[2])
        {
          v4 = v14 + 5;
          v16 = v14;
          v15 = v6;
          if (v7 == v14)
          {
            v14 += 5;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v14 += 5;
          }
        }
        else
        {
          v15 = v6 + 5;
          v16 = v6;
          if (v7 == v6 && v7 < v15)
            goto LABEL_18;
        }
        v17 = *(_OWORD *)v16;
        v18 = *((_OWORD *)v16 + 1);
        v7[4] = v16[4];
        *(_OWORD *)v7 = v17;
        *((_OWORD *)v7 + 1) = v18;
LABEL_18:
        v7 += 5;
        if (v14 < v13)
        {
          v6 = v15;
          if ((unint64_t)v15 < a3)
            continue;
        }
        v30 = v4;
        v31 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = sub_1BCAB6624();
  __break(1u);
  return result;
}

uint64_t sub_1BCAADD38(double a1, double a2, double a3)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  _BOOL4 v8;

  result = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1;
  do
  {
    v8 = v6 <= a2;
    if (a3 > 0.0)
      v8 = v6 >= a2;
    if (v8)
    {
      if ((v6 != a2) | v4 & 1)
        return result;
      v4 = 1;
    }
    else
    {
      v7 = __OFADD__(v5++, 1);
      if (v7)
        goto LABEL_12;
      v6 = a1 + (double)v5 * a3;
    }
    v7 = __OFADD__(result++, 1);
  }
  while (!v7);
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1BCAADDAC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v6)
    {
      if (*(_QWORD *)(a3 + 32) == v5)
      {
LABEL_4:
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
          result = sub_1BC9BAC5C(0, *(_QWORD *)(v7 + 16) + 1, 1);
        v9 = *(_QWORD *)(v7 + 16);
        v8 = *(_QWORD *)(v7 + 24);
        if (v9 >= v8 >> 1)
          result = sub_1BC9BAC5C(v8 > 1, v9 + 1, 1);
        *(_QWORD *)(v7 + 16) = v9 + 1;
        *(_QWORD *)(v7 + 8 * v9 + 32) = v5;
        goto LABEL_14;
      }
      if (v6 != 1)
        break;
    }
LABEL_14:
    if (v5 == a2)
      return v7;
    if (__OFADD__(v5++, 1))
      goto LABEL_20;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    if (*(_QWORD *)(a3 + 8 * v10) == v5)
      goto LABEL_4;
    ++v10;
    if (v11 == v6)
      goto LABEL_14;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

void sub_1BCAADED0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  double v16;
  double v17;
  uint64_t v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v6 = sub_1BCAB5514();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v25 - v11;
  if ((double)a1 > a3)
  {
    sub_1BCAB54D8();
    v13 = sub_1BCAB54FC();
    v14 = sub_1BCAB61BC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1BC989000, v13, v14, "DiagramDateAxisMetricsCalculator asked to compute tick interval for a duration below the lower bound. Returning the smallest configured tick interval.", v15, 2u);
      MEMORY[0x1BCCFBF5C](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return;
  }
  v16 = floor(a3 / (double)a1);
  if (v16 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v17 = ceil(a3 / (double)a2);
  if ((*(_QWORD *)&v16 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v17 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_26;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v19 = (uint64_t)v16;
  if ((uint64_t)v16 < (uint64_t)v17)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v20 = *(_QWORD *)(sub_1BCAADDAC((uint64_t)v17, (uint64_t)v16, (uint64_t)&unk_1E7543DC0) + 16);
  if (v20)
  {
    v21 = floor((double)v20 * 0.5);
    if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) != 0)
    {
      if (v21 > -9.22337204e18)
      {
        if (v21 < 9.22337204e18)
        {
          if (((uint64_t)v21 & 0x8000000000000000) == 0)
          {
            if (v20 > (unint64_t)(uint64_t)v21)
            {
              swift_bridgeObjectRelease();
              return;
            }
            goto LABEL_34;
          }
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
          return;
        }
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  sub_1BCAB54D8();
  v22 = sub_1BCAB54FC();
  v23 = sub_1BCAB61A4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    *(_DWORD *)v24 = 134349312;
    *(double *)v25 = a3;
    sub_1BCAB63A8();
    *(_WORD *)(v24 + 12) = 2050;
    v25[0] = v19;
    sub_1BCAB63A8();
    _os_log_impl(&dword_1BC989000, v22, v23, "DiagramDateAxisMetricsCalculator was unable to compute a desirable tick interval for provided duration (%{public}f). Returning interval upper tick interval (%{public}ld)", (uint8_t *)v24, 0x16u);
    MEMORY[0x1BCCFBF5C](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

void sub_1BCAAE22C(_BYTE *a1, uint64_t a2, double a3, double a4)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  void (*v28)(char *, _BYTE *, int *);
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  __n128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v72 = a2;
  v7 = sub_1BCAB4EF0();
  v73 = *(_QWORD *)(v7 - 8);
  v74 = v7;
  MEMORY[0x1E0C80A78](v7);
  v71 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_1BCAB4EFC();
  v80 = *(_QWORD *)(v70 - 8);
  MEMORY[0x1E0C80A78](v70);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BCAB4EC0();
  v79 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v78 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = (int *)sub_1BCAB4C74();
  v75 = *((_QWORD *)v77 - 1);
  MEMORY[0x1E0C80A78](v77);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_1BCAB4E54();
  v76 = *(_QWORD *)(v69 - 8);
  MEMORY[0x1E0C80A78](v69);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v64 - v22;
  sub_1BCAAF074((uint64_t)a1, (uint64_t)&v64 - v22);
  sub_1BCAAF074((uint64_t)v23, (uint64_t)v20);
  v24 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v25 = swift_allocObject();
  sub_1BCAAE8C8((uint64_t)v23, v25 + v24);
  v26 = MEMORY[0x1E0DEE9D8];
  v82 = MEMORY[0x1E0DEE9D8];
  if ((*a1 & 1) != 0)
  {
    v81 = 0;
    v68 = v16;
    sub_1BCAB4D94();
    v27 = &a1[*(int *)(v17 + 20)];
    v28 = *(void (**)(char *, _BYTE *, int *))(v75 + 16);
    v66 = v14;
    v28(v14, v27, v77);
    v29 = *MEMORY[0x1E0CB0F90];
    v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 104);
    v64 = v25;
    v31 = v30(v78, v29, v11);
    v67 = &v64;
    v32 = MEMORY[0x1E0C80A78](v31);
    *((double *)&v64 - 8) = a3;
    *((double *)&v64 - 7) = a4;
    *(&v64 - 6) = (uint64_t)&v81;
    *(&v64 - 5) = (uint64_t)a1;
    *(&v64 - 4) = (uint64_t)sub_1BCAAF154;
    *(&v64 - 3) = v25;
    *(&v64 - 2) = (uint64_t)&v82;
    v33 = *MEMORY[0x1E0CB1010];
    v65 = v11;
    v34 = v70;
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v80 + 104))(v10, v33, v70, v32);
    v35 = v73;
    v36 = v74;
    v37 = v71;
    (*(void (**)(char *, _QWORD, uint64_t))(v73 + 104))(v71, *MEMORY[0x1E0CB0FD8], v74);
    v38 = v66;
    v39 = (uint64_t)v78;
    sub_1BCAB4ED8();
    swift_release();
    sub_1BCAAB924((uint64_t)v20);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v36);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v10, v34);
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v39, v65);
    (*(void (**)(char *, int *))(v75 + 8))(v38, v77);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v68, v69);
  }
  else
  {
    v40 = v76;
    v77 = (int *)v17;
    v78 = v20;
    v41 = (void *)sub_1BCAB4BF0();
    objc_msgSend(v41, sel_hk_approximateDuration);
    v43 = v42;

    if (v43 == 0.0)
    {
      __break(1u);
LABEL_20:
      __break(1u);
    }
    else
    {
      v44 = sub_1BCAAB9E8(a3, a4, v43);
      v45 = *(_QWORD *)(v44 + 16);
      if (v45)
      {
        v81 = v26;
        swift_retain();
        sub_1BC9BAC78(0, v45, 0);
        v46 = v81;
        v47 = v40;
        v48 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
        v75 = v44;
        v49 = v44 + v48;
        LODWORD(v80) = v78[v77[7]];
        v79 = *(_QWORD *)(v47 + 72);
        do
        {
          if ((_DWORD)v80)
          {
            if (v78[v77[10]] == 1)
            {
              v50 = (void *)sub_1BCAB4DE8();
              sub_1BCAAF1B4();
              v51 = (void *)sub_1BCAB6120();
              v52 = (id)HKRelativeMonthDateYearText();

              if (!v52)
                goto LABEL_20;
            }
            else
            {
              v56 = *(void **)&v78[v77[8]];
              v57 = (void *)sub_1BCAB4DE8();
              v52 = objc_msgSend(v56, sel_stringFromDate_, v57);

            }
            v53 = sub_1BCAB5F04();
            v54 = v58;

            v55 = 1;
          }
          else
          {
            v53 = 0;
            v54 = 0;
            v55 = 2;
          }
          sub_1BCAB4DA0();
          v60 = v59;
          v81 = v46;
          v62 = *(_QWORD *)(v46 + 16);
          v61 = *(_QWORD *)(v46 + 24);
          if (v62 >= v61 >> 1)
          {
            sub_1BC9BAC78(v61 > 1, v62 + 1, 1);
            v46 = v81;
          }
          *(_QWORD *)(v46 + 16) = v62 + 1;
          v63 = v46 + 40 * v62;
          *(_QWORD *)(v63 + 32) = v53;
          *(_QWORD *)(v63 + 40) = v54;
          *(_QWORD *)(v63 + 48) = v60;
          *(_QWORD *)(v63 + 56) = v55;
          *(_DWORD *)(v63 + 64) = 1144750080;
          v49 += v79;
          --v45;
        }
        while (v45);
        swift_bridgeObjectRelease();
        swift_release_n();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
      sub_1BCAAB924((uint64_t)v78);
      swift_bridgeObjectRelease();
    }
  }
}

void sub_1BCAAE874()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C5B68)
  {
    v0 = sub_1BCAB67A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C5B68);
  }
}

uint64_t sub_1BCAAE8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BCAAE910()
{
  unint64_t result;

  result = qword_1EF47A628;
  if (!qword_1EF47A628)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm, &type metadata for DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm);
    atomic_store(result, (unint64_t *)&qword_1EF47A628);
  }
  return result;
}

uint64_t type metadata accessor for DiagramDateRangeAxisMetricsCalculator()
{
  return objc_opt_self();
}

uint64_t method lookup function for DiagramDateRangeAxisMetricsCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DiagramDateRangeAxisMetricsCalculator.axisMetrics(for:customLocations:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
}

uint64_t type metadata accessor for DiagramDateAxisMetricsCalculator()
{
  return objc_opt_self();
}

uint64_t method lookup function for DiagramDateAxisMetricsCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DiagramDateAxisMetricsCalculator.__allocating_init(boundsLabelsShouldShowDaySpan:customLabelDateFormatter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DiagramDateAxisMetricsCalculator.computeTickIntervalStrategy(for:calendar:desiredTickCountRange:boundsLabelFormatterShouldSpanDates:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of DiagramDateAxisMetricsCalculator.axisMetrics(for:customLocations:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DiagramDateAxisMetricsCalculator.computeLabels(with:coordinateRange:calendar:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DiagramDateAxisMetricsCalculator.computeAcceptableTickInterval(for:acceptableTickRange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t storeEnumTagSinglePayload for DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAAEA3C + 4 * byte_1BCACC225[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BCAAEA70 + 4 * byte_1BCACC220[v4]))();
}

uint64_t sub_1BCAAEA70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAAEA78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAAEA80);
  return result;
}

uint64_t sub_1BCAAEA8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAAEA94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BCAAEA98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAAEAA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm()
{
  return &type metadata for DiagramDateAxisMetricsCalculator.IntervalEnumerationAlgorithm;
}

_QWORD *initializeBufferWithCopyOfBuffer for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(_BYTE *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = sub_1BCAB4C74();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    *(_QWORD *)((char *)v4 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
    *((_BYTE *)v4 + v11) = *((_BYTE *)a2 + v11);
    v12 = a3[8];
    v13 = a3[9];
    v14 = *(void **)((char *)a2 + v12);
    *(_QWORD *)((char *)v4 + v12) = v14;
    v15 = *(void **)((char *)a2 + v13);
    *(_QWORD *)((char *)v4 + v13) = v15;
    *((_BYTE *)v4 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    v16 = v14;
    v17 = v15;
  }
  return v4;
}

void destroy for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + a2[5];
  v5 = sub_1BCAB4C74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

_BYTE *initializeWithCopy for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1BCAB4C74();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v10] = a2[v10];
  v11 = a3[8];
  v12 = a3[9];
  v13 = *(void **)&a2[v11];
  *(_QWORD *)&a1[v11] = v13;
  v14 = *(void **)&a2[v12];
  *(_QWORD *)&a1[v12] = v14;
  a1[a3[10]] = a2[a3[10]];
  v15 = v13;
  v16 = v14;
  return a1;
}

_BYTE *assignWithCopy for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1BCAB4C74();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[a3[7]] = a2[a3[7]];
  v10 = a3[8];
  v11 = *(void **)&a2[v10];
  v12 = *(void **)&a1[v10];
  *(_QWORD *)&a1[v10] = v11;
  v13 = v11;

  v14 = a3[9];
  v15 = *(void **)&a2[v14];
  v16 = *(void **)&a1[v14];
  *(_QWORD *)&a1[v14] = v15;
  v17 = v15;

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

_BYTE *initializeWithTake for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1BCAB4C74();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v10] = a2[v10];
  v11 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  a1[a3[10]] = a2[a3[10]];
  return a1;
}

_BYTE *assignWithTake for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1BCAB4C74();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v10] = a2[v10];
  v11 = a3[8];
  v12 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];

  v13 = a3[9];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t getEnumTagSinglePayload for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCAAEEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1BCAB4C74();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCAAEF44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1BCAB4C74();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  return result;
}

uint64_t sub_1BCAAEFC0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BCAB4C74();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for DiagramWeekdayAxisMetricsCalculator()
{
  return objc_opt_self();
}

uint64_t sub_1BCAAF074(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCAAF0B8()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (int *)type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = v3 + v1[5];
  v5 = sub_1BCAB4C74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  return swift_deallocObject();
}

uint64_t sub_1BCAAF154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DiagramDateAxisMetricsCalculator.DateTickIntervalStrategy()
                                      - 8)
                          + 80);
  return sub_1BCAACC54(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_1BCAAF1A0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  return sub_1BCAACD7C(a1, *(double *)(v3 + 16), *(double *)(v3 + 24), a2, a3, *(uint64_t **)(v3 + 32), *(_QWORD *)(v3 + 40), *(void (**)(_QWORD *__return_ptr, char *))(v3 + 48), *(_QWORD *)(v3 + 56), *(uint64_t **)(v3 + 64));
}

unint64_t sub_1BCAAF1B4()
{
  unint64_t result;

  result = qword_1ED6C2EF8;
  if (!qword_1ED6C2EF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6C2EF8);
  }
  return result;
}

BOOL static ChangeDetectorError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChangeDetectorError.hash(into:)()
{
  return sub_1BCAB687C();
}

uint64_t ChangeDetectorError.hashValue.getter()
{
  sub_1BCAB6870();
  sub_1BCAB687C();
  return sub_1BCAB6894();
}

uint64_t sub_1BCAAF270()
{
  return sub_1BCAB50C4();
}

uint64_t sub_1BCAAF290()
{
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  return 0;
}

void sub_1BCAAF330()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = *(_BYTE *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending);
}

id AggregateChangeDetector.__allocating_init(types:highFrequencyTypes:anchor:includeChangeDetails:name:healthStore:deliveryQueue:changesHandler:otherChangePublishers:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6, void *a7, void *a8, __int128 a9, uint64_t a10)
{
  objc_class *v10;
  id v19;
  id v20;

  v19 = objc_allocWithZone(v10);
  v20 = sub_1BCAB3E44(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

id AggregateChangeDetector.init(types:highFrequencyTypes:anchor:includeChangeDetails:name:healthStore:deliveryQueue:changesHandler:otherChangePublishers:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v11;

  v11 = sub_1BCAB3E44(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1BCAAF464(_QWORD *a1, void *a2, uint64_t a3, void *a4, unint64_t a5)
{
  uint64_t v9;
  id v10;
  unsigned __int8 *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  void *v27;
  unsigned __int8 *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t aBlock;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  v10 = objc_allocWithZone(MEMORY[0x1E0CB6F58]);
  sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C71C8);
  swift_bridgeObjectRetain();
  v11 = a2;
  v12 = a4;
  v13 = (void *)sub_1BCAB600C();
  swift_bridgeObjectRelease();
  v40 = sub_1BCAB48DC;
  v41 = (_QWORD *)v9;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1BCAB34F8;
  v39 = &block_descriptor_12_1;
  v14 = _Block_copy(&aBlock);
  v15 = objc_msgSend(v10, sel_initWithTypes_anchor_resultsHandler_, v13, v12, v14);

  _Block_release(v14);
  swift_release();
  objc_msgSend(v15, sel_setIncludeChangeDetails_, v11[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_includeChangeDetails]);
  v16 = *(_QWORD *)&v11[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_name + 8];
  v17 = v15;
  if (v16)
    v18 = (void *)sub_1BCAB5EE0();
  else
    v18 = 0;
  objc_msgSend(v15, sel_setDebugIdentifier_, v18);

  MEMORY[0x1BCCFABF4]();
  if (*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1BCAB6030();
  sub_1BCAB6054();
  sub_1BCAB6024();
  if (!(a5 >> 62))
  {
    v19 = *(_QWORD *)((a5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v19)
      goto LABEL_8;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_1BCAB65DC();
  v19 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_8:
  if (v19 >= 1)
  {
    v21 = 0;
    v34 = a5 & 0xC000000000000001;
    v35 = a5;
    do
    {
      if (v34)
        v22 = (id)MEMORY[0x1BCCFB0D4](v21, a5);
      else
        v22 = *(id *)(a5 + 8 * v21 + 32);
      v23 = v22;
      v24 = swift_allocObject();
      *(_BYTE *)(v24 + 16) = 1;
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = v11;
      v25[3] = v24;
      v25[4] = v23;
      v26 = objc_allocWithZone(MEMORY[0x1E0CB6980]);
      v40 = sub_1BCAB4928;
      v41 = v25;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v38 = sub_1BCAB3600;
      v39 = &block_descriptor_21_1;
      v27 = _Block_copy(&aBlock);
      v28 = v11;
      v29 = v23;
      swift_retain();
      v30 = objc_msgSend(v26, sel_initWithSampleType_predicate_updateHandler_, v29, 0, v27);
      _Block_release(v27);
      swift_release();
      v31 = v30;
      if (v16)
        v32 = (void *)sub_1BCAB5EE0();
      else
        v32 = 0;
      objc_msgSend(v31, sel_setDebugIdentifier_, v32);

      objc_msgSend(v31, sel_setObserveUnfrozenSeries_, 1);
      v33 = swift_release();
      MEMORY[0x1BCCFABF4](v33);
      a5 = v35;
      if (*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1BCAB6030();
      ++v21;
      sub_1BCAB6054();
      sub_1BCAB6024();

    }
    while (v19 != v21);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_1BCAAF874()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint8_t *v15;
  uint64_t v16;
  char *v17;
  id *v18;
  uint64_t ObjectType;
  uint64_t v20;
  id v21;

  v1 = sub_1BCAB5514();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = 0;
  v20 = *(_QWORD *)&v0[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
  v17 = v0;
  v18 = &v21;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  v5 = swift_release();
  if (v21)
  {
    swift_willThrow();
  }
  else
  {
    MEMORY[0x1E0C80A78](v5);
    v14[-2] = v0;
    swift_retain();
    sub_1BCAB507C();
    swift_release();
    sub_1BCAB54B4();
    v6 = v0;
    v7 = sub_1BCAB54FC();
    v8 = sub_1BCAB61BC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v20 = v16;
      v15 = v9;
      *(_DWORD *)v9 = 136446210;
      v14[1] = v9 + 4;
      ObjectType = swift_getObjectType();
      sub_1BCAB4160();
      v10 = sub_1BCAB5F28();
      ObjectType = sub_1BC99BD4C(v10, v11, &v20);
      sub_1BCAB63A8();

      swift_bridgeObjectRelease();
      v12 = v15;
      _os_log_impl(&dword_1BC989000, v7, v8, "%{public}s Started.", v15, 0xCu);
      v13 = v16;
      swift_arrayDestroy();
      MEMORY[0x1BCCFBF5C](v13, -1, -1);
      MEMORY[0x1BCCFBF5C](v12, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  }
}

void sub_1BCAAFB3C(uint64_t a1, void **a2)
{
  int v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;

  v3 = *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state);
  if (v3 == 1)
  {
    sub_1BCA661FC();
    v4 = swift_allocError();
    *v6 = 0;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    sub_1BCA661FC();
    v4 = swift_allocError();
    *v5 = 2;
LABEL_5:
    v7 = *a2;
    *a2 = (void *)v4;

    return;
  }
  *(_BYTE *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) = 1;
  swift_retain();
  sub_1BCAB5070();
  swift_release();
  if (!(v14 >> 62))
  {
    v9 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_8;
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v9 = sub_1BCAB65DC();
  swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_15;
LABEL_8:
  if (v9 >= 1)
  {
    v10 = 0;
    v11 = *(void **)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_healthStore);
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x1BCCFB0D4](v10);
      else
        v12 = *(id *)(v14 + 8 * v10 + 32);
      v13 = v12;
      ++v10;
      objc_msgSend(v11, sel_executeQuery_, v12);

    }
    while (v9 != v10);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_1BCAAFCEC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_1BCAB5070();
  v2 = *(_QWORD *)(v6 + 16);
  if (v2)
  {
    v3 = v6 + 32;
    do
    {
      swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_1BCAB471C();
      sub_1BC996948(&qword_1ED6C7160, (uint64_t (*)(uint64_t))sub_1BCAB471C, MEMORY[0x1E0C95D90]);
      swift_retain();
      sub_1BCAB58E0();
      swift_release();
      v4 = swift_retain();
      MEMORY[0x1BCCFABF4](v4);
      if (*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1BCAB6030();
      sub_1BCAB6054();
      sub_1BCAB6024();
      swift_release();
      swift_release();
      v3 += 8;
      --v2;
    }
    while (v2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCAAFE68()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t ObjectType;
  uint64_t v18;

  v1 = sub_1BCAB5514();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)&v0[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
  v16 = v0;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  sub_1BCAB54B4();
  v5 = v0;
  v6 = sub_1BCAB54FC();
  v7 = sub_1BCAB61BC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v1;
    v10 = v9;
    v18 = v9;
    *(_DWORD *)v8 = 136446210;
    ObjectType = swift_getObjectType();
    sub_1BCAB4160();
    v11 = sub_1BCAB5F28();
    ObjectType = sub_1BC99BD4C(v11, v12, &v18);
    sub_1BCAB63A8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC989000, v6, v7, "%{public}s Stopped.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v10, -1, -1);
    MEMORY[0x1BCCFBF5C](v8, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

void sub_1BCAB00AC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  uint64_t v14;
  uint8_t *v15;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[2];
  uint8_t *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v2 = sub_1BCAB5514();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = 0;
  sub_1BCA66018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_1BCAB54B4();
  v10 = v0;
  v11 = sub_1BCAB54FC();
  v12 = sub_1BCAB61BC();
  v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v32 = v2;
    v14 = swift_slowAlloc();
    v29 = v13;
    v15 = (uint8_t *)v14;
    v30 = swift_slowAlloc();
    v35 = v30;
    v28 = v15;
    *(_DWORD *)v15 = 136446210;
    v27[1] = v15 + 4;
    v16 = v10;
    v31 = v3;
    v17 = v16;
    v18 = v8;
    v19 = objc_msgSend(v16, sel_description);
    v20 = sub_1BCAB5F04();
    v33 = v1;
    v22 = v21;

    v8 = v18;
    v34 = sub_1BC99BD4C(v20, v22, &v35);
    sub_1BCAB63A8();

    swift_bridgeObjectRelease();
    v23 = v28;
    _os_log_impl(&dword_1BC989000, v11, (os_log_type_t)v29, "%{public}s dispatching changes", v28, 0xCu);
    v24 = v30;
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v24, -1, -1);
    MEMORY[0x1BCCFBF5C](v23, -1, -1);

    v25 = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v5, v32);
  }
  else
  {

    v25 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v35 = *(_QWORD *)&v10[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
  MEMORY[0x1E0C80A78](v25);
  v27[-4] = v8;
  v27[-3] = v10;
  v27[-2] = &v36;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  if (v36)
  {
    v26 = v36;
    swift_willThrow();
  }
  else
  {
    sub_1BCAB1624((uint64_t)v8);
  }
  sub_1BC997208((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BCAB41F4);

}

void sub_1BCAB0418(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  char *v26;
  char v27;
  void *v28;
  uint64_t v29;

  sub_1BCA64074();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v29 - v13;
  v15 = OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending;
  if ((*(_BYTE *)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) & 1) == 0)
  {
    v24 = *(unsigned __int8 *)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state);
    if (v24 == 2)
    {
      sub_1BCA661FC();
      v25 = swift_allocError();
      v27 = 2;
    }
    else
    {
      if (v24 == 1)
      {
        sub_1BCAB1FA4(1, (char *)&v29 - v13);
        sub_1BC9FCA74((uint64_t)v14, a1, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
LABEL_10:
        sub_1BCAB14B4(a1, a2);
        return;
      }
      sub_1BCA661FC();
      v25 = swift_allocError();
      v27 = 1;
    }
    *v26 = v27;
    v28 = *a3;
    *a3 = (void *)v25;

    goto LABEL_10;
  }
  sub_1BCA661FC();
  v16 = swift_allocError();
  *v17 = 0;
  v18 = *a3;
  *a3 = (void *)v16;

  sub_1BC9964B8(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  sub_1BCA66018();
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v11, 1, v19);
  sub_1BC997208((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  if (v20 != 1)
  {
    *(_BYTE *)(a2 + v15) = 0;
    v21 = sub_1BCAB5034();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v8, 1, 1, v21);
    v22 = a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet;
    swift_beginAccess();
    sub_1BC9FCA74((uint64_t)v8, v22, (uint64_t (*)(_QWORD))sub_1BCA64074);
    swift_endAccess();
    v23 = *(void **)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError) = 0;

  }
}

uint64_t sub_1BCAB0690(uint64_t a1, uint64_t a2, uint64_t a3, uint8_t *a4, void *a5, uint64_t a6, uint8_t *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint8_t *v24;
  char *v25;
  char *v26;
  id v27;
  uint8_t *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint8_t *v38;
  uint8_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;

  v11 = sub_1BCAB5514();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCA66018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_1BCAB54B4();
  v19 = a5;
  v20 = sub_1BCAB54FC();
  v21 = sub_1BCAB61BC();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v41 = v22;
    v24 = (uint8_t *)v23;
    v42 = swift_slowAlloc();
    v47 = v42;
    v44 = a6;
    *(_DWORD *)v24 = 136446210;
    v38 = v24 + 4;
    v39 = v24;
    v25 = v19;
    v43 = v11;
    v26 = v25;
    v27 = objc_msgSend(v25, sel_description);
    v40 = v12;
    v28 = a4;
    v29 = v27;
    v30 = sub_1BCAB5F04();
    v45 = a7;
    v32 = v31;

    a4 = v28;
    v46 = sub_1BC99BD4C(v30, v32, &v47);
    sub_1BCAB63A8();

    a7 = v45;
    swift_bridgeObjectRelease();
    v33 = v39;
    _os_log_impl(&dword_1BC989000, v20, (os_log_type_t)v41, "%{public}s received Observer changes", v39, 0xCu);
    v34 = v42;
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v34, -1, -1);
    MEMORY[0x1BCCFBF5C](v33, -1, -1);

    v35 = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v14, v43);
  }
  else
  {

    v35 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v47 = *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
  MEMORY[0x1E0C80A78](v35);
  *(&v38 - 6) = (uint8_t *)v19;
  *(&v38 - 5) = v36;
  *(&v38 - 4) = (uint8_t *)v17;
  *(&v38 - 3) = a4;
  *(&v38 - 2) = a7;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  sub_1BCAB1624((uint64_t)v17);
  return sub_1BC997208((uint64_t)v17, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
}

void sub_1BCAB09C8(uint64_t a1, _BYTE *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t inited;
  unint64_t v16;
  _BYTE v17[24];

  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) == 2
    || (swift_beginAccess(), (*a2 & 1) != 0))
  {
    swift_beginAccess();
    *a2 = 0;
  }
  else
  {
    v13 = *(void **)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError);
    *(_QWORD *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError) = a4;
    v14 = a4;

    sub_1BC998AB0(0, &qword_1ED6C47C8, (uint64_t (*)(uint64_t))sub_1BC9BD0E8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BCABE680;
    *(_QWORD *)(inited + 32) = a5;
    *(_QWORD *)(inited + 40) = objc_msgSend((id)objc_opt_self(), sel_sampleTypeChangeWithSampleType_dateInterval_hasUnfrozenSeries_, a5, 0, 0);
    v16 = sub_1BCA928F4(inited);
    sub_1BCAB23C0(v16, 0);
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) == 1)
    {
      sub_1BCAB1FA4(0, v12);
      sub_1BC9FCA74((uint64_t)v12, a3, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
    }
    sub_1BCAB14B4(a3, a1);
  }
}

uint64_t sub_1BCAB0B80(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  id v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v9 = sub_1BCAB5514();
  v48 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCA66018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_1BCAB54B4();
  v16 = a2;
  v17 = a5;
  v18 = v16;
  v19 = (char *)v17;
  v20 = sub_1BCAB54FC();
  v21 = sub_1BCAB61BC();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v46 = a3;
    v24 = v23;
    v45 = swift_slowAlloc();
    v50 = v45;
    *(_DWORD *)v24 = 136446466;
    v41 = v24 + 4;
    v25 = v19;
    v47 = a4;
    v26 = v25;
    v27 = objc_msgSend(v25, sel_description);
    v43 = v22;
    v28 = v27;
    v29 = sub_1BCAB5F04();
    v44 = v9;
    v30 = v29;
    v42 = v18;
    v31 = a2;
    v33 = v32;

    v49 = sub_1BC99BD4C(v30, v33, &v50);
    sub_1BCAB63A8();

    a2 = v31;
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    v49 = (uint64_t)v31;
    sub_1BC9A61D8(0, &qword_1ED6C6E70, &qword_1ED6C6E68, 0x1E0CB6A80, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v34 = v42;
    v35 = sub_1BCAB5F28();
    v49 = sub_1BC99BD4C(v35, v36, &v50);
    sub_1BCAB63A8();

    a4 = v47;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC989000, v20, (os_log_type_t)v43, "%{public}s received DB Changes for anchor %{public}s", (uint8_t *)v24, 0x16u);
    v37 = v45;
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v37, -1, -1);
    v38 = v24;
    a3 = v46;
    MEMORY[0x1BCCFBF5C](v38, -1, -1);

    v39 = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v11, v44);
  }
  else
  {

    v39 = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v11, v9);
  }
  v50 = *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
  MEMORY[0x1E0C80A78](v39);
  *(&v41 - 6) = (uint64_t)v19;
  *(&v41 - 5) = (uint64_t)v14;
  *(&v41 - 4) = a3;
  *(&v41 - 3) = (uint64_t)a2;
  *(&v41 - 2) = a4;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  sub_1BCAB1624((uint64_t)v14);
  return sub_1BC997208((uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
}

void sub_1BCAB0F58(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  id v16;
  uint64_t v17;

  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) != 2)
  {
    if (a3)
    {
      sub_1BCAB23C0(a3, a4);
    }
    else
    {
      v13 = (uint64_t)a5;
      if (!a5)
      {
        sub_1BCA661FC();
        v13 = swift_allocError();
        *v14 = 3;
      }
      v15 = *(void **)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError);
      *(_QWORD *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError) = v13;
      v16 = a5;

    }
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) == 1)
    {
      sub_1BCAB1FA4(0, v12);
      sub_1BC9FCA74((uint64_t)v12, a2, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
    }
    sub_1BCAB14B4(a2, a1);
  }
}

uint64_t sub_1BCAB1080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x1BCCFC004](a2 + 16);
  if (result)
  {
    v8 = (char *)result;
    sub_1BCA66018();
    v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
    v11 = *(_QWORD *)&v8[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock];
    MEMORY[0x1E0C80A78](v10);
    *(&v11 - 4) = (uint64_t)v8;
    *(&v11 - 3) = (uint64_t)v6;
    *(&v11 - 2) = a1;
    sub_1BCAB4FF8();
    sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
    swift_retain();
    sub_1BCAB540C();
    swift_release();
    sub_1BCAB1624((uint64_t)v6);

    return sub_1BC997208((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  }
  return result;
}

void sub_1BCAB11F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  os_log_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  os_log_t v32;
  uint8_t *v33;
  uint8_t *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;

  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BCAB5514();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_BYTE *)a1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) != 2)
  {
    sub_1BCAB54B4();
    v13 = a1;
    v14 = sub_1BCAB54FC();
    v15 = sub_1BCAB61BC();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v37 = a3;
      v17 = swift_slowAlloc();
      v35 = v16;
      v18 = (uint8_t *)v17;
      v36 = swift_slowAlloc();
      v40 = v36;
      v34 = v18;
      *(_DWORD *)v18 = 136446210;
      v33 = v18 + 4;
      v19 = v13;
      v20 = objc_msgSend(v19, sel_description);
      v21 = sub_1BCAB5F04();
      v32 = v14;
      v22 = a2;
      v23 = v21;
      v38 = v8;
      v25 = v24;

      v26 = v23;
      a2 = v22;
      v39 = sub_1BC99BD4C(v26, v25, &v40);
      sub_1BCAB63A8();

      v8 = v38;
      swift_bridgeObjectRelease();
      v27 = v32;
      v28 = v34;
      _os_log_impl(&dword_1BC989000, v32, (os_log_type_t)v35, "%{public}s received Changes for publisher", v34, 0xCu);
      v29 = v36;
      swift_arrayDestroy();
      MEMORY[0x1BCCFBF5C](v29, -1, -1);
      MEMORY[0x1BCCFBF5C](v28, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v30 = sub_1BCAB501C();
    sub_1BCAB23C0(v30, 0);
    swift_bridgeObjectRelease();
    if (*((_BYTE *)v13 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) == 1)
    {
      sub_1BCAB1FA4(0, v8);
      sub_1BC9FCA74((uint64_t)v8, a2, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
    }
    sub_1BCAB14B4(a2, (uint64_t)v13);
  }
}

void sub_1BCAB14B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  sub_1BCA64074();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC9964B8(a1, (uint64_t)v9, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  sub_1BCA66018();
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10);
  sub_1BC997208((uint64_t)v9, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  if ((_DWORD)a1 != 1)
  {
    *(_BYTE *)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) = 0;
    v11 = sub_1BCAB5034();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
    v12 = a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet;
    swift_beginAccess();
    sub_1BC9FCA74((uint64_t)v6, v12, (uint64_t (*)(_QWORD))sub_1BCA64074);
    swift_endAccess();
    v13 = *(void **)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError) = 0;

  }
}

uint64_t sub_1BCAB1624(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  char *v30;
  char *v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD aBlock[6];
  uint64_t v49;

  v46 = a1;
  v2 = sub_1BCAB5514();
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x1E0C80A78](v2);
  v39 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BCAB5E44();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  MEMORY[0x1E0C80A78](v4);
  v43 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_1BCAB5E5C();
  v6 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB41F4(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCA66018();
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v12);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v36 - v18;
  v20 = v1;
  (*(void (**)(__n128))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1B8))(v17);
  sub_1BC9964B8(v46, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) == 1)
    return sub_1BC997208((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCAB41F4);
  v36 = v14;
  v37 = (uint64_t)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v8;
  v46 = v6;
  v22 = v45;
  v23 = sub_1BC9AE330((uint64_t)v11, (uint64_t)v19, (uint64_t (*)(_QWORD))sub_1BCA66018);
  v49 = 0;
  aBlock[0] = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock);
  MEMORY[0x1E0C80A78](v23);
  *(&v36 - 2) = (uint64_t)v1;
  *(&v36 - 1) = (uint64_t)&v49;
  sub_1BCAB4FF8();
  sub_1BC996948(&qword_1ED6C4BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  swift_retain();
  sub_1BCAB540C();
  swift_release();
  v24 = v49;
  if (v49)
  {
    v25 = v37;
    sub_1BC9964B8((uint64_t)v19, v37, (uint64_t (*)(_QWORD))sub_1BCA66018);
    v26 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v20;
    *(_QWORD *)(v27 + 24) = v24;
    sub_1BC9AE330(v25, v27 + v26, (uint64_t (*)(_QWORD))sub_1BCA66018);
    aBlock[4] = sub_1BCAB46A4;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BC9B17C8;
    aBlock[3] = &block_descriptor_18;
    v28 = _Block_copy(aBlock);
    swift_retain_n();
    v29 = v20;
    v30 = v38;
    sub_1BCAB5E50();
    v47 = MEMORY[0x1E0DEE9D8];
    sub_1BC996948(&qword_1ED6C5F28, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BCAB46D4(0);
    sub_1BC996948(&qword_1ED6C5F38, (uint64_t (*)(uint64_t))sub_1BCAB46D4, MEMORY[0x1E0DEAF38]);
    v31 = v43;
    sub_1BCAB63E4();
    MEMORY[0x1BCCFAE34](0, v30, v31, v28);
    _Block_release(v28);
    swift_release();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v22);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v42);
    sub_1BC997208((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1BCA66018);
    swift_release();
  }
  else
  {
    v32 = v39;
    sub_1BCAB54B4();
    v33 = sub_1BCAB54FC();
    v34 = sub_1BCAB61B0();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1BC989000, v33, v34, "AggregateChangeDetector alive without a handler", v35, 2u);
      MEMORY[0x1BCCFBF5C](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v32, v41);
    sub_1BC997208((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1BCA66018);
  }
  return swift_release();
}

uint64_t sub_1BCAB1B14(uint64_t result, _QWORD *a2)
{
  if (*(_BYTE *)(result + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) != 2)
  {
    *a2 = *(_QWORD *)(result + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_changesHandler);
    swift_retain();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BCAB1B68(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint8_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);

  v5 = sub_1BCAB5514();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCAB54B4();
  v9 = a1;
  v10 = sub_1BCAB54FC();
  v11 = sub_1BCAB61BC();
  if (os_log_type_enabled(v10, v11))
  {
    v26 = a3;
    v12 = swift_slowAlloc();
    v25 = v6;
    v13 = (uint8_t *)v12;
    v24 = (void (*)(uint64_t))swift_slowAlloc();
    v28 = v24;
    *(_DWORD *)v13 = 136446210;
    v22 = v13 + 4;
    v14 = v9;
    v15 = objc_msgSend(v14, sel_description);
    v16 = sub_1BCAB5F04();
    v23 = v5;
    v18 = v17;

    v19 = v16;
    a3 = v26;
    v27 = sub_1BC99BD4C(v19, v18, (uint64_t *)&v28);
    sub_1BCAB63A8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC989000, v10, v11, "%{public}s calling handler", v13, 0xCu);
    v20 = v24;
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v20, -1, -1);
    MEMORY[0x1BCCFBF5C](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1BCAB5070();
  v28(a3);
  return swift_release();
}

uint64_t sub_1BCAB1D94()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state) = 2;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_changesHandler) = 0;
  swift_release();
  swift_retain();
  sub_1BCAB5070();
  result = swift_release();
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1BCAB65DC();
    result = swift_bridgeObjectRelease();
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
      goto LABEL_10;
  }
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_21;
  }
  v3 = 0;
  v4 = *(void **)(v0 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_healthStore);
  do
  {
    if ((v9 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x1BCCFB0D4](v3);
    else
      v5 = *(id *)(v9 + 8 * v3 + 32);
    v6 = v5;
    ++v3;
    objc_msgSend(v4, sel_stopQuery_, v5);

  }
  while (v2 != v3);
LABEL_10:
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1BCAB5070();
  result = swift_release();
  if (!(v9 >> 62))
  {
    v7 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_12;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v7 = sub_1BCAB65DC();
  result = swift_bridgeObjectRelease();
  if (!v7)
    return swift_bridgeObjectRelease();
LABEL_12:
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
        MEMORY[0x1BCCFB0D4](i);
      else
        swift_retain();
      sub_1BCAB5820();
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
LABEL_21:
  __break(1u);
  return result;
}

id sub_1BCAB1FA4@<X0>(int a1@<W0>, char *a2@<X8>)
{
  _BYTE *v2;
  _BYTE *v3;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  _BYTE *v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  _BYTE *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;

  v3 = v2;
  v46 = a1;
  v5 = sub_1BCAB5514();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCA64074();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BCAB5034();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)&v2[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError];
  if (v16)
  {
    *(_QWORD *)a2 = v16;
    sub_1BCA66018();
    v18 = v17;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 0, 1, v18);
    return v16;
  }
  v44 = v8;
  v45 = 0;
  v19 = v46;
  v42 = v6;
  v43 = v5;
  v20 = (uint64_t)&v3[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet];
  swift_beginAccess();
  sub_1BC9964B8(v20, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCA64074);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
  {
    v34 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v34(v15, v11, v12);
    v35 = sub_1BCAB501C();
    if ((v35 & 0xC000000000000001) != 0)
      v36 = sub_1BCAB6444();
    else
      v36 = *(_QWORD *)(v35 + 16);
    swift_bridgeObjectRelease();
    if (v36)
    {
      v34(a2, v15, v12);
      sub_1BCA66018();
      v40 = v39;
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(a2, 0, 1, v40);
      v16 = v45;
      return v16;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if ((v19 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  sub_1BC997208((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1BCA64074);
  if ((v19 & 1) != 0)
LABEL_5:
    v3[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending] = 1;
LABEL_6:
  v21 = v44;
  sub_1BCAB54B4();
  v22 = v3;
  v23 = sub_1BCAB54FC();
  v24 = sub_1BCAB61BC();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc();
    v46 = v25;
    v27 = (uint8_t *)v26;
    v28 = swift_slowAlloc();
    v48 = v28;
    *(_DWORD *)v27 = 136446210;
    v41[1] = v27 + 4;
    v29 = v22;
    v30 = objc_msgSend(v29, sel_description);
    v31 = sub_1BCAB5F04();
    v33 = v32;

    v47 = sub_1BC99BD4C(v31, v33, &v48);
    sub_1BCAB63A8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC989000, v23, (os_log_type_t)v46, "%{public}s not creating result. No pending change set.", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCFBF5C](v28, -1, -1);
    MEMORY[0x1BCCFBF5C](v27, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v43);
  v16 = v45;
  sub_1BCA66018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(a2, 1, 1, v37);
  return v16;
}

uint64_t sub_1BCAB23C0(unint64_t a1, void *a2)
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
  uint64_t v48;
  id v49;
  uint64_t result;
  void *v51;
  void (*v52)(char *, uint64_t);
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  int64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  unint64_t v82;
  char v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v92;
  void *v93;
  char *v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  unsigned int (*v97)(uint64_t, uint64_t, uint64_t);
  id v98;
  void *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  void (*v106)(char *, char *, uint64_t);
  char *v107;
  void (*v108)(char *, uint64_t);
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  id v116;
  id v117;
  char v118;
  char v119;
  unint64_t v120;
  uint64_t v121;
  _BOOL8 v122;
  uint64_t v123;
  char v124;
  unint64_t v125;
  char v126;
  _QWORD *v127;
  uint64_t v128;
  uint64_t v129;
  BOOL v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  id v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  char isUniquelyReferenced_nonNull_native;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void (*v148)(char *, char *, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  void (*v153)(char *, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  char *v169;
  char *v170;
  char *v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int64_t v176;
  char *v177;
  unint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;

  v165 = sub_1BCAB4E54();
  v164 = *(_QWORD *)(v165 - 8);
  MEMORY[0x1E0C80A78](v165);
  v163 = (char *)&v147 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v162 = (char *)&v147 - v7;
  MEMORY[0x1E0C80A78](v8);
  v161 = (char *)&v147 - v9;
  MEMORY[0x1E0C80A78](v10);
  v160 = (char *)&v147 - v11;
  MEMORY[0x1E0C80A78](v12);
  v159 = (char *)&v147 - v13;
  MEMORY[0x1E0C80A78](v14);
  v166 = (char *)&v147 - v15;
  v16 = sub_1BCAB4BD8();
  v179 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v167 = (char *)&v147 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v171 = (char *)&v147 - v19;
  MEMORY[0x1E0C80A78](v20);
  v170 = (char *)&v147 - v21;
  sub_1BC9B0190();
  MEMORY[0x1E0C80A78](v22);
  v173 = (uint64_t)&v147 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24);
  v158 = (char *)&v147 - v25;
  MEMORY[0x1E0C80A78](v26);
  v168 = (char *)&v147 - v27;
  MEMORY[0x1E0C80A78](v28);
  v177 = (char *)&v147 - v29;
  MEMORY[0x1E0C80A78](v30);
  v172 = (char *)&v147 - v31;
  MEMORY[0x1E0C80A78](v32);
  v181 = (uint64_t)&v147 - v33;
  sub_1BCA64074();
  MEMORY[0x1E0C80A78](v34);
  v36 = (char *)&v147 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v37);
  v39 = (char *)&v147 - v38;
  v40 = sub_1BCAB5034();
  MEMORY[0x1E0C80A78](v40);
  v42 = (char *)&v147 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v43);
  v45 = (char *)&v147 - v44;
  v46 = v2 + OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet;
  v48 = v47;
  swift_beginAccess();
  sub_1BC9964B8(v46, (uint64_t)v39, (uint64_t (*)(_QWORD))sub_1BCA64074);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v39, 1, v40) == 1)
  {
    sub_1BC997208((uint64_t)v39, (uint64_t (*)(_QWORD))sub_1BCA64074);
    v49 = a2;
    swift_bridgeObjectRetain();
    sub_1BCAB5010();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v36, 0, 1, v40);
    swift_beginAccess();
    sub_1BC9FCA74((uint64_t)v36, v46, (uint64_t (*)(_QWORD))sub_1BCA64074);
    return swift_endAccess();
  }
  v157 = v36;
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v45, v39, v40);
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v42, v45, v40);
  v51 = a2;
  if (!a2)
    v51 = (void *)sub_1BCAB5028();
  v152 = v51;
  v154 = v48;
  v52 = *(void (**)(char *, uint64_t))(v48 + 8);
  v53 = a2;
  v156 = v40;
  v153 = v52;
  v52(v42, v40);
  v185 = sub_1BCAB501C();
  v54 = v179;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v55 = sub_1BCAB6588();
    v178 = 0;
    v56 = 0;
    v57 = 0;
    v58 = v55 | 0x8000000000000000;
  }
  else
  {
    v59 = -1 << *(_BYTE *)(a1 + 32);
    v56 = ~v59;
    v60 = *(_QWORD *)(a1 + 64);
    v178 = a1 + 64;
    v61 = -v59;
    if (v61 < 64)
      v62 = ~(-1 << v61);
    else
      v62 = -1;
    v57 = v62 & v60;
    v58 = a1;
  }
  v151 = v56;
  swift_bridgeObjectRetain();
  v63 = 0;
  v175 = v58 & 0x7FFFFFFFFFFFFFFFLL;
  v176 = (unint64_t)(v56 + 64) >> 6;
  v174 = MEMORY[0x1E0DEE9B0] + 8;
  v155 = v46;
  v182 = v58;
  v169 = v45;
  while (1)
  {
    if ((v58 & 0x8000000000000000) != 0)
    {
      v67 = sub_1BCAB65AC();
      if (!v67)
        goto LABEL_98;
      v69 = v68;
      v184 = v67;
      sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C71C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v70 = v186;
      swift_unknownObjectRelease();
      v184 = v69;
      sub_1BC9A649C(0, &qword_1ED6C6E88);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v71 = v186;
      swift_unknownObjectRelease();
      v66 = v63;
      v183 = v57;
      if (!v70)
        goto LABEL_98;
    }
    else
    {
      if (v57)
      {
        v183 = (v57 - 1) & v57;
        v65 = __clz(__rbit64(v57)) | (v63 << 6);
        v66 = v63;
      }
      else
      {
        v72 = v63 + 1;
        if (__OFADD__(v63, 1))
          goto LABEL_102;
        if (v72 >= v176)
          goto LABEL_98;
        v73 = *(_QWORD *)(v178 + 8 * v72);
        v66 = v63 + 1;
        if (!v73)
        {
          v66 = v63 + 2;
          if (v63 + 2 >= v176)
            goto LABEL_98;
          v73 = *(_QWORD *)(v178 + 8 * v66);
          if (!v73)
          {
            v66 = v63 + 3;
            if (v63 + 3 >= v176)
              goto LABEL_98;
            v73 = *(_QWORD *)(v178 + 8 * v66);
            if (!v73)
            {
              v66 = v63 + 4;
              if (v63 + 4 >= v176)
                goto LABEL_98;
              v73 = *(_QWORD *)(v178 + 8 * v66);
              if (!v73)
              {
                v74 = v63 + 5;
                while (v176 != v74)
                {
                  v73 = *(_QWORD *)(v178 + 8 * v74++);
                  if (v73)
                  {
                    v66 = v74 - 1;
                    v58 = v182;
                    goto LABEL_34;
                  }
                }
LABEL_98:
                sub_1BC9E5BB4();
                v143 = v152;
                swift_bridgeObjectRetain();
                v144 = (uint64_t)v157;
                sub_1BCAB5010();
                v145 = v156;
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v154 + 56))(v144, 0, 1, v156);
                v146 = v155;
                swift_beginAccess();
                sub_1BC9FCA74(v144, v146, (uint64_t (*)(_QWORD))sub_1BCA64074);
                swift_endAccess();

                v153(v45, v145);
                return swift_bridgeObjectRelease();
              }
            }
          }
        }
LABEL_34:
        v183 = (v73 - 1) & v73;
        v65 = __clz(__rbit64(v73)) + (v66 << 6);
      }
      v75 = 8 * v65;
      v76 = *(void **)(*(_QWORD *)(v58 + 56) + v75);
      v70 = *(id *)(*(_QWORD *)(v58 + 48) + v75);
      v71 = v76;
      if (!v70)
        goto LABEL_98;
    }
    v77 = v185;
    if ((v185 & 0xC000000000000001) != 0)
    {
      v78 = v70;
      v79 = sub_1BCAB65A0();
      if (!v79)
      {

        if ((v77 & 0xC000000000000001) == 0)
          goto LABEL_71;
        goto LABEL_49;
      }
      v184 = v79;
      sub_1BC9A649C(0, &qword_1ED6C6E88);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v80 = v186;
      swift_unknownObjectRelease();
    }
    else
    {
      if (!*(_QWORD *)(v185 + 16))
        goto LABEL_48;
      v81 = v70;
      v82 = sub_1BC9A2E50((uint64_t)v81);
      if ((v83 & 1) == 0)
      {

        if ((v77 & 0xC000000000000001) == 0)
          goto LABEL_71;
        goto LABEL_49;
      }
      v80 = *(id *)(*(_QWORD *)(v77 + 56) + 8 * v82);
    }

    if (!v80)
      break;
    if ((objc_msgSend(v80, sel_hasUnfrozenSeries) & 1) != 0)
      v180 = 1;
    else
      v180 = objc_msgSend(v71, sel_hasUnfrozenSeries);
    v88 = objc_msgSend(v80, sel_dateInterval);
    if (v88)
    {
      v89 = v88;
      v90 = (uint64_t)v172;
      sub_1BCAB4B90();

      v91 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
      v91(v90, 0, 1, v16);
    }
    else
    {
      v91 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
      v90 = (uint64_t)v172;
      v91((uint64_t)v172, 1, 1, v16);
    }
    sub_1BC9AE330(v90, v181, (uint64_t (*)(_QWORD))sub_1BC9B0190);
    v92 = objc_msgSend(v71, sel_dateInterval);
    if (v92)
    {
      v93 = v92;
      v94 = v171;
      sub_1BCAB4B90();

      v95 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
      v96 = (uint64_t)v177;
      v95(v177, v94, v16);
      v91(v96, 0, 1, v16);
      v97 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
      if (v97(v96, 1, v16) != 1)
      {
        v95(v170, v177, v16);
        v98 = objc_msgSend(v80, sel_dateInterval);
        if (v98)
        {
          v99 = v98;
          v100 = v171;
          sub_1BCAB4B90();

          v96 = (uint64_t)v168;
          v95(v168, v100, v16);
          v91(v96, 0, 1, v16);
          if (v97(v96, 1, v16) != 1)
          {
            v95(v167, (char *)v96, v16);
            v101 = v159;
            sub_1BCAB4BC0();
            v150 = v16;
            v102 = v160;
            sub_1BCAB4BC0();
            v149 = sub_1BC996948(&qword_1ED6C71E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
            v103 = v165;
            v104 = sub_1BCAB5EB0();
            v105 = v164;
            v106 = *(void (**)(char *, char *, uint64_t))(v164 + 16);
            v148 = v106;
            if ((v104 & 1) != 0)
              v107 = v102;
            else
              v107 = v101;
            v106(v166, v107, v103);
            v108 = *(void (**)(char *, uint64_t))(v105 + 8);
            v108(v102, v103);
            v108(v101, v103);
            v109 = v162;
            sub_1BCAB4B9C();
            v110 = v163;
            sub_1BCAB4B9C();
            if ((sub_1BCAB5EBC() & 1) != 0)
              v111 = v110;
            else
              v111 = v109;
            v148(v161, v111, v103);
            v108(v110, v103);
            v112 = v109;
            v16 = v150;
            v108(v112, v103);
            v113 = (uint64_t)v158;
            sub_1BCAB4BA8();
            v54 = v179;
            v114 = *(void (**)(char *, uint64_t))(v179 + 8);
            v114(v167, v16);
            v114(v170, v16);
            v115 = v181;
            sub_1BC997208(v181, (uint64_t (*)(_QWORD))sub_1BC9B0190);
            v91(v113, 0, 1, v16);
            sub_1BC9AE330(v113, v115, (uint64_t (*)(_QWORD))sub_1BC9B0190);
            goto LABEL_84;
          }
        }
        else
        {
          v96 = (uint64_t)v168;
          v91((uint64_t)v168, 1, 1, v16);
        }
        (*(void (**)(char *, uint64_t))(v179 + 8))(v170, v16);
      }
    }
    else
    {
      v96 = (uint64_t)v177;
      v91((uint64_t)v177, 1, 1, v16);
    }
    v115 = v181;
    sub_1BC997208(v181, (uint64_t (*)(_QWORD))sub_1BC9B0190);
    sub_1BC997208(v96, (uint64_t (*)(_QWORD))sub_1BC9B0190);
    v91(v115, 1, 1, v16);
    v54 = v179;
LABEL_84:
    v133 = v115;
    v134 = v173;
    sub_1BC9964B8(v133, v173, (uint64_t (*)(_QWORD))sub_1BC9B0190);
    v135 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v134, 1, v16);
    v136 = v70;
    v45 = v169;
    if (v135 == 1)
    {
      v137 = 0;
    }
    else
    {
      v137 = (void *)sub_1BCAB4B78();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v134, v16);
    }
    v138 = objc_msgSend((id)objc_opt_self(), sel_sampleTypeChangeWithSampleType_dateInterval_hasUnfrozenSeries_, v136, v137, v180);

    if (v138)
    {
      v139 = v185;
      if ((v185 & 0xC000000000000001) != 0)
      {
        if (v185 >= 0)
          v139 = v185 & 0xFFFFFFFFFFFFFF8;
        v140 = sub_1BCAB6444();
        if (__OFADD__(v140, 1))
          goto LABEL_103;
        v139 = sub_1BCAB36B0(v139, v140 + 1);
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v186 = (void *)v139;
      sub_1BC9A60C4((uint64_t)v138, v136, isUniquelyReferenced_nonNull_native);
      v185 = (uint64_t)v186;

      swift_bridgeObjectRelease();
    }
    else
    {
      v142 = (void *)sub_1BCAB3B48((unint64_t)v136);

    }
    sub_1BC997208(v181, (uint64_t (*)(_QWORD))sub_1BC9B0190);
LABEL_14:
    v63 = v66;
    v58 = v182;
    v57 = v183;
  }
  v77 = v185;
LABEL_48:
  if ((v77 & 0xC000000000000001) == 0)
  {
LABEL_71:
    v116 = v70;
    v117 = v71;
    goto LABEL_72;
  }
LABEL_49:
  if (v77 < 0)
    v84 = v77;
  else
    v84 = v77 & 0xFFFFFFFFFFFFFF8;
  v85 = v70;
  v86 = v71;
  v87 = sub_1BCAB6444();
  if (__OFADD__(v87, 1))
    goto LABEL_100;
  v77 = sub_1BCAB36B0(v84, v87 + 1);
  v185 = v77;
LABEL_72:
  v118 = swift_isUniquelyReferenced_nonNull_native();
  v185 = 0x8000000000000000;
  v186 = (void *)v77;
  v120 = sub_1BC9A2E50((uint64_t)v70);
  v121 = *(_QWORD *)(v77 + 16);
  v122 = (v119 & 1) == 0;
  v123 = v121 + v122;
  if (!__OFADD__(v121, v122))
  {
    v124 = v119;
    if (*(_QWORD *)(v77 + 24) >= v123)
    {
      if ((v118 & 1) != 0)
      {
        v127 = v186;
        if ((v119 & 1) == 0)
          goto LABEL_79;
      }
      else
      {
        sub_1BC9A5994();
        v127 = v186;
        if ((v124 & 1) == 0)
          goto LABEL_79;
      }
    }
    else
    {
      sub_1BC9A4844(v123, v118);
      v125 = sub_1BC9A2E50((uint64_t)v70);
      if ((v124 & 1) != (v126 & 1))
        goto LABEL_104;
      v120 = v125;
      v127 = v186;
      if ((v124 & 1) == 0)
      {
LABEL_79:
        v127[(v120 >> 6) + 8] |= 1 << v120;
        v128 = 8 * v120;
        *(_QWORD *)(v127[6] + v128) = v70;
        *(_QWORD *)(v127[7] + v128) = v71;
        v129 = v127[2];
        v130 = __OFADD__(v129, 1);
        v131 = v129 + 1;
        if (v130)
          goto LABEL_101;
        v127[2] = v131;
        v132 = v70;
        goto LABEL_13;
      }
    }
    v64 = v127[7];

    *(_QWORD *)(v64 + 8 * v120) = v71;
LABEL_13:
    v185 = (uint64_t)v127;

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C71C8);
  result = sub_1BCAB6804();
  __break(1u);
  return result;
}

id AggregateChangeDetector.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AggregateChangeDetector.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AggregateChangeDetector.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AggregateChangeDetector();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BCAB34F8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  void (*v9)(id, void *, uint64_t, void *);
  id v10;
  id v11;
  id v12;

  v6 = a4;
  v9 = *(void (**)(id, void *, uint64_t, void *))(a1 + 32);
  if (a4)
  {
    sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C71C8);
    sub_1BC9A649C(0, &qword_1ED6C6E88);
    sub_1BC9A64D4((unint64_t *)&qword_1ED6C6E60, (unint64_t *)&qword_1ED6C71C8);
    v6 = sub_1BCAB5E74();
  }
  swift_retain();
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v9(v10, a3, v6, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1BCAB3600(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  void (*v6)(id, uint64_t (*)(), uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = *(void (**)(id, uint64_t (*)(), uint64_t, void *))(a1 + 32);
  v7 = _Block_copy(aBlock);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_retain();
  v10 = a2;
  v9 = a4;
  v6(v10, sub_1BCAB4958, v8, a4);
  swift_release();
  swift_release();

}

uint64_t sub_1BCAB36B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    sub_1BC9A5EEC();
    v2 = sub_1BCAB6600();
    v18 = v2;
    sub_1BCAB6588();
    v3 = sub_1BCAB65AC();
    if (v3)
    {
      v4 = v3;
      sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C71C8);
      do
      {
        swift_dynamicCast();
        sub_1BC9A649C(0, &qword_1ED6C6E88);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1BC9A4844(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1BCAB6324();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1BCAB65AC();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1BCAB38FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    sub_1BC9A63E4();
    v2 = sub_1BCAB6600();
    v18 = v2;
    sub_1BCAB6588();
    v3 = sub_1BCAB65AC();
    if (v3)
    {
      v4 = v3;
      sub_1BC9A649C(0, (unint64_t *)&qword_1ED6C7260);
      do
      {
        swift_dynamicCast();
        sub_1BC9A649C(0, &qword_1ED6C6E90);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1BC9A4850(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1BCAB6324();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1BCAB65AC();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1BCAB3B48(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_1BC9A2E50(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1BC9A5994();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_1BCAB65A0();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_1BCAB6444();
  v9 = sub_1BCAB36B0(v5, v8);
  swift_retain();
  a1 = sub_1BC9A2E50((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_1BCAB3C94(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

void sub_1BCAB3C94(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_1BCAB63F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_1BCAB6324();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_1BCAB3E44(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  char *v11;
  char *v12;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  id v27;
  id v28;
  id v29;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v12 = v11;
  v16 = OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_changesHandler;
  *(_QWORD *)&v11[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_changesHandler] = 0;
  v17 = OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_queries;
  v18 = MEMORY[0x1E0DEE9D8];
  sub_1BCAB478C();
  swift_allocObject();
  v19 = v11;
  *(_QWORD *)&v11[v17] = sub_1BCAB50A0();
  v20 = OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_otherChanges;
  v35 = v18;
  sub_1BC998AB0(0, &qword_1ED6C6980, (uint64_t (*)(uint64_t))sub_1BCAB4800, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2E5C8]);
  swift_allocObject();
  *(_QWORD *)&v19[v20] = sub_1BCAB50A0();
  v21 = OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock;
  sub_1BCAB4FF8();
  swift_allocObject();
  *(_QWORD *)&v19[v21] = sub_1BCAB4FEC();
  v22 = &v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingChangeSet];
  v23 = sub_1BCAB5034();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_pendingError] = 0;
  v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_dispatchPending] = 0;
  v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_lock_state] = 0;
  *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_healthStore] = a7;
  v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_includeChangeDetails] = a4;
  v24 = &v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_name];
  *(_QWORD *)v24 = a5;
  *((_QWORD *)v24 + 1) = a6;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = a9;
  *(_QWORD *)(v25 + 24) = a10;
  v36 = v25;
  v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2E5C8];
  sub_1BC998AB0(0, &qword_1ED6C7138, (uint64_t (*)(uint64_t))sub_1BCAB4840, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2E5C8]);
  swift_allocObject();
  v27 = a7;
  swift_retain();
  *(_QWORD *)&v12[v16] = sub_1BCAB50A0();
  swift_release();
  *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_deliveryQueue] = a8;
  v35 = a11;
  sub_1BC998AB0(0, &qword_1ED6C7130, (uint64_t (*)(uint64_t))sub_1BCAB4890, v26);
  swift_allocObject();
  v28 = a8;
  *(_QWORD *)&v19[OBJC_IVAR____TtC19HealthVisualization23AggregateChangeDetector_otherChangePublishers] = sub_1BCAB50A0();

  v34.receiver = v19;
  v34.super_class = (Class)type metadata accessor for AggregateChangeDetector();
  v29 = objc_msgSendSuper2(&v34, sel_init);
  swift_retain();
  sub_1BCAB507C();
  swift_release();

  swift_release();
  return v29;
}

void sub_1BCAB4150()
{
  uint64_t v0;

  sub_1BCAAFB3C(*(_QWORD *)(v0 + 16), *(void ***)(v0 + 24));
}

uint64_t sub_1BCAB4158(_QWORD *a1)
{
  return sub_1BCAAFCEC(a1);
}

unint64_t sub_1BCAB4160()
{
  unint64_t result;

  result = qword_1ED6C6B00;
  if (!qword_1ED6C6B00)
  {
    type metadata accessor for AggregateChangeDetector();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6C6B00);
  }
  return result;
}

uint64_t type metadata accessor for AggregateChangeDetector()
{
  uint64_t result;

  result = qword_1ED6C70A0;
  if (!qword_1ED6C70A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BCAB41D4()
{
  return sub_1BCAB1D94();
}

void sub_1BCAB41F4(uint64_t a1)
{
  sub_1BC998AB0(a1, &qword_1ED6C7178, (uint64_t (*)(uint64_t))sub_1BCA66018, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1BCAB4210()
{
  uint64_t v0;

  sub_1BCAB0418(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

unint64_t sub_1BCAB4220()
{
  unint64_t result;

  result = qword_1EF47A6E0;
  if (!qword_1EF47A6E0)
  {
    result = MEMORY[0x1BCCFBE84](&protocol conformance descriptor for ChangeDetectorError, &type metadata for ChangeDetectorError);
    atomic_store(result, (unint64_t *)&qword_1EF47A6E0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ChangeDetectorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAB42B0 + 4 * byte_1BCACC405[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BCAB42E4 + 4 * byte_1BCACC400[v4]))();
}

uint64_t sub_1BCAB42E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAB42EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAB42F4);
  return result;
}

uint64_t sub_1BCAB4300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAB4308);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BCAB430C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAB4314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChangeDetectorError()
{
  return &type metadata for ChangeDetectorError;
}

uint64_t dispatch thunk of ChangePublisher.publisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SerializableChangePublisher.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SerializableChangePublisher.serializedData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1BCAB4348()
{
  return type metadata accessor for AggregateChangeDetector();
}

void sub_1BCAB4350()
{
  unint64_t v0;

  sub_1BCA64074();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AggregateChangeDetector()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AggregateChangeDetector.dispatchPending.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AggregateChangeDetector.__allocating_init(types:highFrequencyTypes:anchor:includeChangeDetails:name:healthStore:deliveryQueue:changesHandler:otherChangePublishers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of AggregateChangeDetector.start()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AggregateChangeDetector.stop()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AggregateChangeDetector.dispatchChanges()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AggregateChangeDetector.willSend()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t storeEnumTagSinglePayload for AggregateChangeDetector.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCAB4530 + 4 * byte_1BCACC40F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BCAB4564 + 4 * byte_1BCACC40A[v4]))();
}

uint64_t sub_1BCAB4564(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAB456C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCAB4574);
  return result;
}

uint64_t sub_1BCAB4580(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCAB4588);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BCAB458C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCAB4594(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AggregateChangeDetector.State()
{
  return &type metadata for AggregateChangeDetector.State;
}

unint64_t sub_1BCAB45B4()
{
  unint64_t result;

  result = qword_1EF47A720;
  if (!qword_1EF47A720)
  {
    result = MEMORY[0x1BCCFBE84](&unk_1BCACC600, &type metadata for AggregateChangeDetector.State);
    atomic_store(result, (unint64_t *)&qword_1EF47A720);
  }
  return result;
}

uint64_t sub_1BCAB45F8()
{
  uint64_t v0;

  return sub_1BCAB1B14(*(_QWORD *)(v0 + 16), *(_QWORD **)(v0 + 24));
}

uint64_t sub_1BCAB4600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1BCA66018();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;

  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    v4 = sub_1BCAB5034();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  return swift_deallocObject();
}

uint64_t sub_1BCAB46A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1BCA66018();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_1BCAB1B68(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v2 + 32) & ~v2));
}

void sub_1BCAB46D4(uint64_t a1)
{
  sub_1BC998AB0(a1, &qword_1ED6C5F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1BCAB46F0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BCAB4714(uint64_t a1)
{
  uint64_t v1;

  return sub_1BCAB1080(a1, v1);
}

void sub_1BCAB471C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C7168)
  {
    sub_1BCAB5034();
    v0 = sub_1BCAB5814();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C7168);
  }
}

void sub_1BCAB4780()
{
  uint64_t v0;

  sub_1BCAB11F4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_1BCAB478C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6C6988)
  {
    sub_1BC9A61D8(255, &qword_1ED6C6E40, &qword_1ED6C6EB0, 0x1E0CB6A78, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    v0 = sub_1BCAB5088();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6C6988);
  }
}

void sub_1BCAB4800(uint64_t a1)
{
  sub_1BC998AB0(a1, &qword_1ED6C6E00, MEMORY[0x1E0C95E00], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1BCAB481C()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1BCAB4840()
{
  unint64_t result;

  result = qword_1ED6C7180;
  if (!qword_1ED6C7180)
  {
    sub_1BCA66018();
    result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_1ED6C7180);
  }
  return result;
}

void sub_1BCAB4890(uint64_t a1)
{
  sub_1BC998AB0(a1, &qword_1ED6C7170, (uint64_t (*)(uint64_t))sub_1BCAB471C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1BCAB48AC(_QWORD *a1)
{
  uint64_t v1;

  return sub_1BCAAF464(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1BCAB48B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BCAB48DC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1BCAB0B80(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_1BCAB48E4()
{
  return swift_deallocObject();
}

uint64_t sub_1BCAB48F4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCAB4928(uint64_t a1, uint64_t a2, uint64_t a3, uint8_t *a4)
{
  uint64_t v4;

  return sub_1BCAB0690(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24), *(uint8_t **)(v4 + 32));
}

uint64_t sub_1BCAB4934()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1BCAB4958()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_1BCAB4964()
{
  uint64_t v0;

  sub_1BCAB09C8(*(_QWORD *)(v0 + 16), *(_BYTE **)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48));
}

void sub_1BCAB4974()
{
  uint64_t v0;

  sub_1BCAB0F58(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_1BCAB4994()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void boost::math::detail::ibeta_imp<long double,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("ibeta_imp", "beta.hpp", 1009, "(p_derivative == 0) || normalised");
}

void boost::math::detail::ibeta_series<long double,boost::math::lanczos::lanczos13m53,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("ibeta_series", "beta.hpp", 584, "*p_derivative >= 0");
}

{
  __assert_rtn("ibeta_series", "beta.hpp", 552, "(p_derivative == 0) || normalised");
}

void boost::math::detail::ibeta_a_step<long double,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("ibeta_a_step", "beta.hpp", 739, "*p_derivative >= 0");
}

void boost::math::detail::ibeta_fraction2<long double,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("ibeta_fraction2", "beta.hpp", 714, "*p_derivative >= 0");
}

void boost::math::detail::sinpx<long double>()
{
  __assert_rtn("sinpx", "gamma.hpp", 100, "fl >= 0");
}

void boost::math::detail::gamma_incomplete_imp<long double,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("gamma_incomplete_imp", "gamma.hpp", 1221, "(p_derivative == 0) || normalised");
}

void boost::math::detail::hypergeometric_pdf_factorial_imp<long double,boost::math::policies::policy<boost::math::policies::promote_float<false>,boost::math::policies::promote_double<false>,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy,boost::math::policies::default_policy>>()
{
  __assert_rtn("hypergeometric_pdf_factorial_imp", "hypergeometric_pdf.hpp", 395, "N <= boost::math::max_factorial<T>::value");
}

uint64_t sub_1BCAB4B0C()
{
  return MEMORY[0x1E0CADF98]();
}

uint64_t sub_1BCAB4B18()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1BCAB4B24()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1BCAB4B30()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1BCAB4B3C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BCAB4B48()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BCAB4B54()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BCAB4B60()
{
  return MEMORY[0x1E0CAE210]();
}

uint64_t sub_1BCAB4B6C()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1BCAB4B78()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1BCAB4B84()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_1BCAB4B90()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_1BCAB4B9C()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1BCAB4BA8()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1BCAB4BB4()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t sub_1BCAB4BC0()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1BCAB4BCC()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_1BCAB4BD8()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1BCAB4BE4()
{
  return MEMORY[0x1E0CAE940]();
}

uint64_t sub_1BCAB4BF0()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1BCAB4BFC()
{
  return MEMORY[0x1E0CAE9B0]();
}

uint64_t sub_1BCAB4C08()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1BCAB4C14()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1BCAB4C20()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1BCAB4C2C()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1BCAB4C38()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1BCAB4C44()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1BCAB4C50()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1BCAB4C5C()
{
  return MEMORY[0x1E0CAEA88]();
}

uint64_t sub_1BCAB4C68()
{
  return MEMORY[0x1E0CAEA90]();
}

uint64_t sub_1BCAB4C74()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1BCAB4C80()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1BCAB4C8C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1BCAB4C98()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1BCAB4CA4()
{
  return MEMORY[0x1E0CD81B8]();
}

uint64_t sub_1BCAB4CB0()
{
  return MEMORY[0x1E0CD81C8]();
}

uint64_t sub_1BCAB4CBC()
{
  return MEMORY[0x1E0CD81E0]();
}

uint64_t sub_1BCAB4CC8()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_1BCAB4CD4()
{
  return MEMORY[0x1E0D2A7E8]();
}

uint64_t sub_1BCAB4CE0()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1BCAB4CEC()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_1BCAB4CF8()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BCAB4D04()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_1BCAB4D10()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1BCAB4D1C()
{
  return MEMORY[0x1E0CAF8B0]();
}

uint64_t sub_1BCAB4D28()
{
  return MEMORY[0x1E0CAF8B8]();
}

uint64_t sub_1BCAB4D34()
{
  return MEMORY[0x1E0CD81F8]();
}

uint64_t sub_1BCAB4D40()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BCAB4D4C()
{
  return MEMORY[0x1E0CAFB00]();
}

uint64_t sub_1BCAB4D58()
{
  return MEMORY[0x1E0CAFB08]();
}

uint64_t sub_1BCAB4D64()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1BCAB4D70()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1BCAB4D7C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BCAB4D88()
{
  return MEMORY[0x1E0CB02B0]();
}

uint64_t sub_1BCAB4D94()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1BCAB4DA0()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1BCAB4DAC()
{
  return MEMORY[0x1E0CB0598]();
}

uint64_t sub_1BCAB4DB8()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1BCAB4DC4()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1BCAB4DD0()
{
  return MEMORY[0x1E0CB0670]();
}

uint64_t sub_1BCAB4DDC()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1BCAB4DE8()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BCAB4DF4()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1BCAB4E00()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BCAB4E0C()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1BCAB4E18()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1BCAB4E24()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BCAB4E30()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1BCAB4E3C()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t _s19HealthVisualization25PresentationDateProvidingPAAE012presentationD010Foundation0D0VvgZ_0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BCAB4E54()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BCAB4E60()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BCAB4E6C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BCAB4E78()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BCAB4E84()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1BCAB4E90()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1BCAB4E9C()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1BCAB4EA8()
{
  return MEMORY[0x1E0CB0F58]();
}

uint64_t sub_1BCAB4EB4()
{
  return MEMORY[0x1E0CB0F60]();
}

uint64_t sub_1BCAB4EC0()
{
  return MEMORY[0x1E0CB0F98]();
}

uint64_t sub_1BCAB4ECC()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1BCAB4ED8()
{
  return MEMORY[0x1E0CB0FC0]();
}

uint64_t sub_1BCAB4EE4()
{
  return MEMORY[0x1E0CB0FC8]();
}

uint64_t sub_1BCAB4EF0()
{
  return MEMORY[0x1E0CB0FE8]();
}

uint64_t sub_1BCAB4EFC()
{
  return MEMORY[0x1E0CB1018]();
}

uint64_t sub_1BCAB4F08()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1BCAB4F14()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1BCAB4F20()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1BCAB4F2C()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1BCAB4F38()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1BCAB4F44()
{
  return MEMORY[0x1E0CB1098]();
}

uint64_t sub_1BCAB4F50()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1BCAB4F5C()
{
  return MEMORY[0x1E0CB1120]();
}

uint64_t sub_1BCAB4F68()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1BCAB4F74()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1BCAB4F80()
{
  return MEMORY[0x1E0CB1400]();
}

uint64_t sub_1BCAB4F8C()
{
  return MEMORY[0x1E0CB1408]();
}

uint64_t sub_1BCAB4F98()
{
  return MEMORY[0x1E0CB1420]();
}

uint64_t sub_1BCAB4FA4()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1BCAB4FB0()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1BCAB4FBC()
{
  return MEMORY[0x1E0C9B8A8]();
}

uint64_t sub_1BCAB4FC8()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1BCAB4FD4()
{
  return MEMORY[0x1E0D2A808]();
}

uint64_t sub_1BCAB4FE0()
{
  return MEMORY[0x1E0D2A810]();
}

uint64_t sub_1BCAB4FEC()
{
  return MEMORY[0x1E0D2D4A0]();
}

uint64_t sub_1BCAB4FF8()
{
  return MEMORY[0x1E0D2D4A8]();
}

uint64_t sub_1BCAB5004()
{
  return MEMORY[0x1E0D2D8C8]();
}

uint64_t sub_1BCAB5010()
{
  return MEMORY[0x1E0D2DAB8]();
}

uint64_t sub_1BCAB501C()
{
  return MEMORY[0x1E0D2DAC0]();
}

uint64_t sub_1BCAB5028()
{
  return MEMORY[0x1E0D2DAC8]();
}

uint64_t sub_1BCAB5034()
{
  return MEMORY[0x1E0D2DAD0]();
}

uint64_t sub_1BCAB5040()
{
  return MEMORY[0x1E0D2DB50]();
}

uint64_t sub_1BCAB504C()
{
  return MEMORY[0x1E0D2E050]();
}

uint64_t sub_1BCAB5058()
{
  return MEMORY[0x1E0D2E068]();
}

uint64_t sub_1BCAB5064()
{
  return MEMORY[0x1E0D2E3B8]();
}

uint64_t sub_1BCAB5070()
{
  return MEMORY[0x1E0D2E5B8]();
}

uint64_t sub_1BCAB507C()
{
  return MEMORY[0x1E0D2E5C0]();
}

uint64_t sub_1BCAB5088()
{
  return MEMORY[0x1E0D2E5C8]();
}

uint64_t sub_1BCAB5094()
{
  return MEMORY[0x1E0D2E5D8]();
}

uint64_t sub_1BCAB50A0()
{
  return MEMORY[0x1E0D2E5E0]();
}

uint64_t sub_1BCAB50AC()
{
  return MEMORY[0x1E0D29F08]();
}

uint64_t sub_1BCAB50B8()
{
  return MEMORY[0x1E0D29F18]();
}

uint64_t sub_1BCAB50C4()
{
  return MEMORY[0x1E0D2A3D8]();
}

uint64_t sub_1BCAB50D0()
{
  return MEMORY[0x1E0D2A590]();
}

uint64_t sub_1BCAB50DC()
{
  return MEMORY[0x1E0D2A5A0]();
}

uint64_t sub_1BCAB50E8()
{
  return MEMORY[0x1E0D2A8C8]();
}

uint64_t sub_1BCAB50F4()
{
  return MEMORY[0x1E0D2A8D0]();
}

uint64_t sub_1BCAB5100()
{
  return MEMORY[0x1E0D2A8D8]();
}

uint64_t sub_1BCAB510C()
{
  return MEMORY[0x1E0D2A8E0]();
}

uint64_t sub_1BCAB5118()
{
  return MEMORY[0x1E0D2A908]();
}

uint64_t sub_1BCAB5124()
{
  return MEMORY[0x1E0D2A910]();
}

uint64_t sub_1BCAB5130()
{
  return MEMORY[0x1E0D2A918]();
}

uint64_t sub_1BCAB513C()
{
  return MEMORY[0x1E0D2A928]();
}

uint64_t sub_1BCAB5148()
{
  return MEMORY[0x1E0D2A930]();
}

uint64_t sub_1BCAB5154()
{
  return MEMORY[0x1E0D2A938]();
}

uint64_t sub_1BCAB5160()
{
  return MEMORY[0x1E0D2A9F0]();
}

uint64_t sub_1BCAB516C()
{
  return MEMORY[0x1E0D2AA80]();
}

uint64_t sub_1BCAB5178()
{
  return MEMORY[0x1E0D2AA88]();
}

uint64_t sub_1BCAB5184()
{
  return MEMORY[0x1E0D2AAC8]();
}

uint64_t sub_1BCAB5190()
{
  return MEMORY[0x1E0D2AAD0]();
}

uint64_t sub_1BCAB519C()
{
  return MEMORY[0x1E0D2AAD8]();
}

uint64_t sub_1BCAB51A8()
{
  return MEMORY[0x1E0D2AAE0]();
}

uint64_t sub_1BCAB51B4()
{
  return MEMORY[0x1E0D2AB40]();
}

uint64_t sub_1BCAB51C0()
{
  return MEMORY[0x1E0D2AB48]();
}

uint64_t sub_1BCAB51CC()
{
  return MEMORY[0x1E0D2ABF8]();
}

uint64_t sub_1BCAB51D8()
{
  return MEMORY[0x1E0D2AC40]();
}

uint64_t sub_1BCAB51E4()
{
  return MEMORY[0x1E0D2AC48]();
}

uint64_t sub_1BCAB51F0()
{
  return MEMORY[0x1E0D2ACC0]();
}

uint64_t sub_1BCAB51FC()
{
  return MEMORY[0x1E0D2AEC0]();
}

uint64_t sub_1BCAB5208()
{
  return MEMORY[0x1E0D2AED0]();
}

uint64_t sub_1BCAB5214()
{
  return MEMORY[0x1E0D2AED8]();
}

uint64_t sub_1BCAB5220()
{
  return MEMORY[0x1E0D2AEE0]();
}

uint64_t sub_1BCAB522C()
{
  return MEMORY[0x1E0D2AEE8]();
}

uint64_t sub_1BCAB5238()
{
  return MEMORY[0x1E0D2AEF0]();
}

uint64_t sub_1BCAB5244()
{
  return MEMORY[0x1E0D2AF00]();
}

uint64_t sub_1BCAB5250()
{
  return MEMORY[0x1E0D2B030]();
}

uint64_t sub_1BCAB525C()
{
  return MEMORY[0x1E0D2B0A0]();
}

uint64_t sub_1BCAB5268()
{
  return MEMORY[0x1E0D2B0A8]();
}

uint64_t sub_1BCAB5274()
{
  return MEMORY[0x1E0D2B280]();
}

uint64_t sub_1BCAB5280()
{
  return MEMORY[0x1E0D2B2A0]();
}

uint64_t sub_1BCAB528C()
{
  return MEMORY[0x1E0D2B2B0]();
}

uint64_t sub_1BCAB5298()
{
  return MEMORY[0x1E0D2B358]();
}

uint64_t sub_1BCAB52A4()
{
  return MEMORY[0x1E0D2B368]();
}

uint64_t sub_1BCAB52B0()
{
  return MEMORY[0x1E0D2B370]();
}

uint64_t sub_1BCAB52BC()
{
  return MEMORY[0x1E0D2B380]();
}

uint64_t sub_1BCAB52C8()
{
  return MEMORY[0x1E0D2B388]();
}

uint64_t sub_1BCAB52D4()
{
  return MEMORY[0x1E0D2B390]();
}

uint64_t sub_1BCAB52E0()
{
  return MEMORY[0x1E0D2B4E8]();
}

uint64_t sub_1BCAB52EC()
{
  return MEMORY[0x1E0D2B4F0]();
}

uint64_t sub_1BCAB52F8()
{
  return MEMORY[0x1E0D2B578]();
}

uint64_t sub_1BCAB5304()
{
  return MEMORY[0x1E0D2B580]();
}

uint64_t _s19HealthVisualization26ActivitySummarySnidgetViewV13ActionHandlerCfd_0()
{
  return MEMORY[0x1E0D2B590]();
}

uint64_t sub_1BCAB531C()
{
  return MEMORY[0x1E0D2B670]();
}

uint64_t sub_1BCAB5328()
{
  return MEMORY[0x1E0D2B678]();
}

uint64_t sub_1BCAB5334()
{
  return MEMORY[0x1E0D2B680]();
}

uint64_t sub_1BCAB5340()
{
  return MEMORY[0x1E0D2B688]();
}

uint64_t sub_1BCAB534C()
{
  return MEMORY[0x1E0D2B7B0]();
}

uint64_t sub_1BCAB5358()
{
  return MEMORY[0x1E0D2B7B8]();
}

uint64_t sub_1BCAB5364()
{
  return MEMORY[0x1E0D2B7C0]();
}

uint64_t sub_1BCAB5370()
{
  return MEMORY[0x1E0D2B7D0]();
}

uint64_t sub_1BCAB537C()
{
  return MEMORY[0x1E0D2B8D8]();
}

uint64_t sub_1BCAB5388()
{
  return MEMORY[0x1E0D2B8E0]();
}

uint64_t sub_1BCAB5394()
{
  return MEMORY[0x1E0D2B8E8]();
}

uint64_t sub_1BCAB53A0()
{
  return MEMORY[0x1E0D2BA30]();
}

uint64_t sub_1BCAB53AC()
{
  return MEMORY[0x1E0D2BA40]();
}

uint64_t sub_1BCAB53B8()
{
  return MEMORY[0x1E0D2BA58]();
}

uint64_t sub_1BCAB53C4()
{
  return MEMORY[0x1E0D2BA70]();
}

uint64_t sub_1BCAB53D0()
{
  return MEMORY[0x1E0D2BAA0]();
}

uint64_t sub_1BCAB53DC()
{
  return MEMORY[0x1E0D2BAB0]();
}

uint64_t sub_1BCAB53E8()
{
  return MEMORY[0x1E0D2BCD0]();
}

uint64_t sub_1BCAB53F4()
{
  return MEMORY[0x1E0D2BD30]();
}

uint64_t sub_1BCAB5400()
{
  return MEMORY[0x1E0D2BD50]();
}

uint64_t sub_1BCAB540C()
{
  return MEMORY[0x1E0D2BD78]();
}

uint64_t sub_1BCAB5418()
{
  return MEMORY[0x1E0D2BD80]();
}

uint64_t sub_1BCAB5424()
{
  return MEMORY[0x1E0D2BD88]();
}

uint64_t sub_1BCAB5430()
{
  return MEMORY[0x1E0D2BD90]();
}

uint64_t sub_1BCAB543C()
{
  return MEMORY[0x1E0D2BDC0]();
}

uint64_t sub_1BCAB5448()
{
  return MEMORY[0x1E0D2BDC8]();
}

uint64_t sub_1BCAB5454()
{
  return MEMORY[0x1E0D2BE08]();
}

uint64_t sub_1BCAB5460()
{
  return MEMORY[0x1E0D2BE50]();
}

uint64_t sub_1BCAB546C()
{
  return MEMORY[0x1E0D2BE60]();
}

uint64_t sub_1BCAB5478()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BCAB5484()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1BCAB5490()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1BCAB549C()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_1BCAB54A8()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1BCAB54B4()
{
  return MEMORY[0x1E0D2E748]();
}

uint64_t sub_1BCAB54C0()
{
  return MEMORY[0x1E0D2E760]();
}

uint64_t sub_1BCAB54CC()
{
  return MEMORY[0x1E0D2E768]();
}

uint64_t sub_1BCAB54D8()
{
  return MEMORY[0x1E0D2E788]();
}

uint64_t sub_1BCAB54E4()
{
  return MEMORY[0x1E0D2E790]();
}

uint64_t sub_1BCAB54F0()
{
  return MEMORY[0x1E0D2E7B8]();
}

uint64_t sub_1BCAB54FC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BCAB5508()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BCAB5514()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BCAB5520()
{
  return MEMORY[0x1E0DC1A70]();
}

uint64_t sub_1BCAB552C()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_1BCAB5538()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1BCAB5544()
{
  return MEMORY[0x1E0C933C0]();
}

uint64_t sub_1BCAB5550()
{
  return MEMORY[0x1E0C93428]();
}

uint64_t sub_1BCAB555C()
{
  return MEMORY[0x1E0C93490]();
}

uint64_t sub_1BCAB5568()
{
  return MEMORY[0x1E0C934A8]();
}

uint64_t sub_1BCAB5574()
{
  return MEMORY[0x1E0C934D0]();
}

uint64_t sub_1BCAB5580()
{
  return MEMORY[0x1E0C934E0]();
}

uint64_t sub_1BCAB558C()
{
  return MEMORY[0x1E0C93508]();
}

uint64_t sub_1BCAB5598()
{
  return MEMORY[0x1E0C935D0]();
}

uint64_t sub_1BCAB55A4()
{
  return MEMORY[0x1E0C935E8]();
}

uint64_t sub_1BCAB55B0()
{
  return MEMORY[0x1E0C93600]();
}

uint64_t sub_1BCAB55BC()
{
  return MEMORY[0x1E0C93610]();
}

uint64_t sub_1BCAB55C8()
{
  return MEMORY[0x1E0C93648]();
}

uint64_t sub_1BCAB55D4()
{
  return MEMORY[0x1E0C936B0]();
}

uint64_t sub_1BCAB55E0()
{
  return MEMORY[0x1E0C936C8]();
}

uint64_t sub_1BCAB55EC()
{
  return MEMORY[0x1E0C936D0]();
}

uint64_t sub_1BCAB55F8()
{
  return MEMORY[0x1E0C936F0]();
}

uint64_t sub_1BCAB5604()
{
  return MEMORY[0x1E0C936F8]();
}

uint64_t sub_1BCAB5610()
{
  return MEMORY[0x1E0C93718]();
}

uint64_t sub_1BCAB561C()
{
  return MEMORY[0x1E0C93738]();
}

uint64_t sub_1BCAB5628()
{
  return MEMORY[0x1E0C93750]();
}

uint64_t sub_1BCAB5634()
{
  return MEMORY[0x1E0C93758]();
}

uint64_t sub_1BCAB5640()
{
  return MEMORY[0x1E0C93770]();
}

uint64_t sub_1BCAB564C()
{
  return MEMORY[0x1E0C93790]();
}

uint64_t sub_1BCAB5658()
{
  return MEMORY[0x1E0C93798]();
}

uint64_t sub_1BCAB5664()
{
  return MEMORY[0x1E0C937B0]();
}

uint64_t sub_1BCAB5670()
{
  return MEMORY[0x1E0C937C8]();
}

uint64_t sub_1BCAB567C()
{
  return MEMORY[0x1E0C937E8]();
}

uint64_t sub_1BCAB5688()
{
  return MEMORY[0x1E0C937F8]();
}

uint64_t sub_1BCAB5694()
{
  return MEMORY[0x1E0C93820]();
}

uint64_t sub_1BCAB56A0()
{
  return MEMORY[0x1E0C93860]();
}

uint64_t sub_1BCAB56AC()
{
  return MEMORY[0x1E0C93878]();
}

uint64_t sub_1BCAB56B8()
{
  return MEMORY[0x1E0C938B0]();
}

uint64_t sub_1BCAB56C4()
{
  return MEMORY[0x1E0C938D0]();
}

uint64_t sub_1BCAB56D0()
{
  return MEMORY[0x1E0C938E0]();
}

uint64_t sub_1BCAB56DC()
{
  return MEMORY[0x1E0C93930]();
}

uint64_t sub_1BCAB56E8()
{
  return MEMORY[0x1E0C93938]();
}

uint64_t sub_1BCAB56F4()
{
  return MEMORY[0x1E0C93988]();
}

uint64_t sub_1BCAB5700()
{
  return MEMORY[0x1E0C93990]();
}

uint64_t sub_1BCAB570C()
{
  return MEMORY[0x1E0C939C0]();
}

uint64_t sub_1BCAB5718()
{
  return MEMORY[0x1E0C939F0]();
}

uint64_t sub_1BCAB5724()
{
  return MEMORY[0x1E0C93A28]();
}

uint64_t sub_1BCAB5730()
{
  return MEMORY[0x1E0C93A48]();
}

uint64_t sub_1BCAB573C()
{
  return MEMORY[0x1E0C93A58]();
}

uint64_t sub_1BCAB5748()
{
  return MEMORY[0x1E0C93A80]();
}

uint64_t sub_1BCAB5754()
{
  return MEMORY[0x1E0C93AA8]();
}

uint64_t sub_1BCAB5760()
{
  return MEMORY[0x1E0C93AD0]();
}

uint64_t sub_1BCAB576C()
{
  return MEMORY[0x1E0C93AE8]();
}

uint64_t sub_1BCAB5778()
{
  return MEMORY[0x1E0C93B10]();
}

uint64_t sub_1BCAB5784()
{
  return MEMORY[0x1E0C93B20]();
}

uint64_t sub_1BCAB5790()
{
  return MEMORY[0x1E0C93B38]();
}

uint64_t sub_1BCAB579C()
{
  return MEMORY[0x1E0C93B68]();
}

uint64_t sub_1BCAB57A8()
{
  return MEMORY[0x1E0C93B78]();
}

uint64_t sub_1BCAB57B4()
{
  return MEMORY[0x1E0C93B80]();
}

uint64_t sub_1BCAB57C0()
{
  return MEMORY[0x1E0C93BB0]();
}

uint64_t sub_1BCAB57CC()
{
  return MEMORY[0x1E0C93C30]();
}

uint64_t sub_1BCAB57D8()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1BCAB57E4()
{
  return MEMORY[0x1E0C95778]();
}

uint64_t sub_1BCAB57F0()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1BCAB57FC()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t sub_1BCAB5808()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t sub_1BCAB5814()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BCAB5820()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1BCAB582C()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1BCAB5838()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1BCAB5844()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1BCAB5850()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1BCAB585C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1BCAB5868()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1BCAB5874()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1BCAB5880()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1BCAB588C()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1BCAB5898()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1BCAB58A4()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BCAB58B0()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1BCAB58BC()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1BCAB58C8()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1BCAB58D4()
{
  return MEMORY[0x1E0C96360]();
}

uint64_t sub_1BCAB58E0()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BCAB58EC()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1BCAB58F8()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1BCAB5904()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1BCAB5910()
{
  return MEMORY[0x1E0CD88C0]();
}

uint64_t sub_1BCAB591C()
{
  return MEMORY[0x1E0CD89D8]();
}

uint64_t sub_1BCAB5928()
{
  return MEMORY[0x1E0CD8CB0]();
}

uint64_t sub_1BCAB5934()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1BCAB5940()
{
  return MEMORY[0x1E0CD91C0]();
}

uint64_t sub_1BCAB594C()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1BCAB5958()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_1BCAB5964()
{
  return MEMORY[0x1E0CD9AA8]();
}

uint64_t sub_1BCAB5970()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1BCAB597C()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1BCAB5988()
{
  return MEMORY[0x1E0CDA1C8]();
}

uint64_t sub_1BCAB5994()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1BCAB59A0()
{
  return MEMORY[0x1E0CDA458]();
}

uint64_t sub_1BCAB59AC()
{
  return MEMORY[0x1E0CDA478]();
}

uint64_t sub_1BCAB59B8()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1BCAB59C4()
{
  return MEMORY[0x1E0CDA648]();
}

uint64_t sub_1BCAB59D0()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1BCAB59DC()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1BCAB59E8()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_1BCAB59F4()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_1BCAB5A00()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1BCAB5A0C()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1BCAB5A18()
{
  return MEMORY[0x1E0CDAC88]();
}

uint64_t sub_1BCAB5A24()
{
  return MEMORY[0x1E0CDACC0]();
}

uint64_t sub_1BCAB5A30()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1BCAB5A3C()
{
  return MEMORY[0x1E0CDAFB8]();
}

uint64_t sub_1BCAB5A48()
{
  return MEMORY[0x1E0CDAFC8]();
}

uint64_t sub_1BCAB5A54()
{
  return MEMORY[0x1E0CDAFD0]();
}

uint64_t sub_1BCAB5A60()
{
  return MEMORY[0x1E0CDAFE0]();
}

uint64_t sub_1BCAB5A6C()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_1BCAB5A78()
{
  return MEMORY[0x1E0CDB000]();
}

uint64_t sub_1BCAB5A84()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1BCAB5A90()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1BCAB5A9C()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1BCAB5AA8()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1BCAB5AB4()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1BCAB5AC0()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1BCAB5ACC()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1BCAB5AD8()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1BCAB5AE4()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1BCAB5AF0()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1BCAB5AFC()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1BCAB5B08()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1BCAB5B14()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1BCAB5B20()
{
  return MEMORY[0x1E0CDC968]();
}

uint64_t sub_1BCAB5B2C()
{
  return MEMORY[0x1E0CDC988]();
}

uint64_t sub_1BCAB5B38()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_1BCAB5B44()
{
  return MEMORY[0x1E0CDCF68]();
}

uint64_t sub_1BCAB5B50()
{
  return MEMORY[0x1E0CDCFD0]();
}

uint64_t sub_1BCAB5B5C()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1BCAB5B68()
{
  return MEMORY[0x1E0CDD300]();
}

uint64_t sub_1BCAB5B74()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_1BCAB5B80()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1BCAB5B8C()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1BCAB5B98()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1BCAB5BA4()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_1BCAB5BB0()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_1BCAB5BBC()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_1BCAB5BC8()
{
  return MEMORY[0x1E0CDD5E8]();
}

uint64_t sub_1BCAB5BD4()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1BCAB5BE0()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_1BCAB5BEC()
{
  return MEMORY[0x1E0CDD658]();
}

uint64_t sub_1BCAB5BF8()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_1BCAB5C04()
{
  return MEMORY[0x1E0CDD6F8]();
}

uint64_t sub_1BCAB5C10()
{
  return MEMORY[0x1E0CDD740]();
}

uint64_t sub_1BCAB5C1C()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_1BCAB5C28()
{
  return MEMORY[0x1E0CDD7F0]();
}

uint64_t sub_1BCAB5C34()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1BCAB5C40()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1BCAB5C4C()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1BCAB5C58()
{
  return MEMORY[0x1E0CDDDC0]();
}

uint64_t sub_1BCAB5C64()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1BCAB5C70()
{
  return MEMORY[0x1E0C93C50]();
}

uint64_t sub_1BCAB5C7C()
{
  return MEMORY[0x1E0C93C70]();
}

uint64_t sub_1BCAB5C88()
{
  return MEMORY[0x1E0C93CA8]();
}

uint64_t sub_1BCAB5C94()
{
  return MEMORY[0x1E0C93CE0]();
}

uint64_t sub_1BCAB5CA0()
{
  return MEMORY[0x1E0C93D08]();
}

uint64_t sub_1BCAB5CAC()
{
  return MEMORY[0x1E0C93D18]();
}

uint64_t sub_1BCAB5CB8()
{
  return MEMORY[0x1E0C93D58]();
}

uint64_t sub_1BCAB5CC4()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1BCAB5CD0()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1BCAB5CDC()
{
  return MEMORY[0x1E0CDE2A8]();
}

uint64_t sub_1BCAB5CE8()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1BCAB5CF4()
{
  return MEMORY[0x1E0CDE4B8]();
}

uint64_t sub_1BCAB5D00()
{
  return MEMORY[0x1E0CDE788]();
}

uint64_t sub_1BCAB5D0C()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_1BCAB5D18()
{
  return MEMORY[0x1E0CDEC40]();
}

uint64_t sub_1BCAB5D24()
{
  return MEMORY[0x1E0D2BAE0]();
}

uint64_t sub_1BCAB5D30()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1BCAB5D3C()
{
  return MEMORY[0x1E0CDF438]();
}

uint64_t sub_1BCAB5D48()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_1BCAB5D54()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1BCAB5D60()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_1BCAB5D6C()
{
  return MEMORY[0x1E0CDF4E8]();
}

uint64_t sub_1BCAB5D78()
{
  return MEMORY[0x1E0CDF4F8]();
}

uint64_t sub_1BCAB5D84()
{
  return MEMORY[0x1E0CDF508]();
}

uint64_t sub_1BCAB5D90()
{
  return MEMORY[0x1E0CDF610]();
}

uint64_t sub_1BCAB5D9C()
{
  return MEMORY[0x1E0CDFAF0]();
}

uint64_t sub_1BCAB5DA8()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1BCAB5DB4()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1BCAB5DC0()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1BCAB5DCC()
{
  return MEMORY[0x1E0C93D80]();
}

uint64_t sub_1BCAB5DD8()
{
  return MEMORY[0x1E0CDFEC0]();
}

uint64_t sub_1BCAB5DE4()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1BCAB5DF0()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_1BCAB5DFC()
{
  return MEMORY[0x1E0CE0238]();
}

uint64_t sub_1BCAB5E08()
{
  return MEMORY[0x1E0CE03F0]();
}

uint64_t sub_1BCAB5E14()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_1BCAB5E20()
{
  return MEMORY[0x1E0CE0698]();
}

uint64_t sub_1BCAB5E2C()
{
  return MEMORY[0x1E0CE06A0]();
}

uint64_t sub_1BCAB5E38()
{
  return MEMORY[0x1E0CE06B8]();
}

uint64_t sub_1BCAB5E44()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BCAB5E50()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BCAB5E5C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BCAB5E68()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BCAB5E74()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BCAB5E80()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BCAB5E8C()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BCAB5E98()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1BCAB5EA4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BCAB5EB0()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1BCAB5EBC()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1BCAB5EC8()
{
  return MEMORY[0x1E0DEA4B0]();
}

uint64_t sub_1BCAB5ED4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BCAB5EE0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BCAB5EEC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BCAB5EF8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BCAB5F04()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BCAB5F10()
{
  return MEMORY[0x1E0CB19B0]();
}

uint64_t sub_1BCAB5F1C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1BCAB5F28()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BCAB5F34()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1BCAB5F40()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BCAB5F4C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BCAB5F58()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1BCAB5F64()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1BCAB5F70()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BCAB5F7C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BCAB5F88()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1BCAB5F94()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1BCAB5FA0()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1BCAB5FAC()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BCAB5FB8()
{
  return MEMORY[0x1E0D2A620]();
}

uint64_t sub_1BCAB5FC4()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1BCAB5FD0()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1BCAB5FDC()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1BCAB5FE8()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1BCAB5FF4()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1BCAB6000()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BCAB600C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BCAB6018()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BCAB6024()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BCAB6030()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BCAB603C()
{
  return MEMORY[0x1E0D2BAF8]();
}

uint64_t sub_1BCAB6048()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1BCAB6054()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BCAB6060()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BCAB606C()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1BCAB6078()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1BCAB6084()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1BCAB6090()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1BCAB609C()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_1BCAB60A8()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1BCAB60B4()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_1BCAB60C0()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_1BCAB60CC()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1BCAB60D8()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BCAB60E4()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1BCAB60F0()
{
  return MEMORY[0x1E0DEB2B0]();
}

uint64_t sub_1BCAB60FC()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1BCAB6108()
{
  return MEMORY[0x1E0DEB598]();
}

uint64_t sub_1BCAB6114()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1BCAB6120()
{
  return MEMORY[0x1E0D2BB08]();
}

uint64_t sub_1BCAB612C()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1BCAB6138()
{
  return MEMORY[0x1E0C9B8F8]();
}

uint64_t sub_1BCAB6144()
{
  return MEMORY[0x1E0C9B910]();
}

uint64_t sub_1BCAB6150()
{
  return MEMORY[0x1E0C9B928]();
}

uint64_t sub_1BCAB615C()
{
  return MEMORY[0x1E0C9B938]();
}

uint64_t sub_1BCAB6168()
{
  return MEMORY[0x1E0D2BFD8]();
}

uint64_t sub_1BCAB6174()
{
  return MEMORY[0x1E0D2BFE0]();
}

uint64_t sub_1BCAB6180()
{
  return MEMORY[0x1E0D2C078]();
}

uint64_t sub_1BCAB618C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BCAB6198()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BCAB61A4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BCAB61B0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BCAB61BC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BCAB61C8()
{
  return MEMORY[0x1E0CB4540]();
}

uint64_t sub_1BCAB61D4()
{
  return MEMORY[0x1E0D2E8F8]();
}

uint64_t sub_1BCAB61E0()
{
  return MEMORY[0x1E0C9B960]();
}

uint64_t sub_1BCAB61EC()
{
  return MEMORY[0x1E0C9B968]();
}

uint64_t sub_1BCAB61F8()
{
  return MEMORY[0x1E0C9B978]();
}

uint64_t sub_1BCAB6204()
{
  return MEMORY[0x1E0CB4588]();
}

uint64_t sub_1BCAB6210()
{
  return MEMORY[0x1E0CB1E40]();
}

uint64_t sub_1BCAB621C()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1BCAB6228()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BCAB6234()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BCAB6240()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BCAB624C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BCAB6258()
{
  return MEMORY[0x1E0D2A700]();
}

uint64_t sub_1BCAB6264()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1BCAB6270()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1BCAB627C()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1BCAB6288()
{
  return MEMORY[0x1E0D2BC20]();
}

uint64_t sub_1BCAB6294()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1BCAB62A0()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1BCAB62AC()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1BCAB62B8()
{
  return MEMORY[0x1E0DC2D48]();
}

uint64_t sub_1BCAB62C4()
{
  return MEMORY[0x1E0DC2D58]();
}

uint64_t sub_1BCAB62D0()
{
  return MEMORY[0x1E0DC2D60]();
}

uint64_t sub_1BCAB62DC()
{
  return MEMORY[0x1E0CB45E0]();
}

uint64_t sub_1BCAB62E8()
{
  return MEMORY[0x1E0D2BC38]();
}

uint64_t sub_1BCAB62F4()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1BCAB6300()
{
  return MEMORY[0x1E0D2A778]();
}

uint64_t sub_1BCAB630C()
{
  return MEMORY[0x1E0DC2FD8]();
}

uint64_t sub_1BCAB6318()
{
  return MEMORY[0x1E0D2A780]();
}

uint64_t sub_1BCAB6324()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BCAB6330()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BCAB633C()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1BCAB6348()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1BCAB6354()
{
  return MEMORY[0x1E0DF22C0]();
}

uint64_t sub_1BCAB6360()
{
  return MEMORY[0x1E0DF22C8]();
}

uint64_t sub_1BCAB636C()
{
  return MEMORY[0x1E0DF22D8]();
}

uint64_t sub_1BCAB6378()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1BCAB6384()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BCAB6390()
{
  return MEMORY[0x1E0DEBA70]();
}

uint64_t sub_1BCAB639C()
{
  return MEMORY[0x1E0DEBB48]();
}

uint64_t sub_1BCAB63A8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BCAB63B4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BCAB63C0()
{
  return MEMORY[0x1E0CB2478]();
}

uint64_t sub_1BCAB63CC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BCAB63D8()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BCAB63E4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BCAB63F0()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BCAB63FC()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1BCAB6408()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BCAB6414()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BCAB6420()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1BCAB642C()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BCAB6438()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BCAB6444()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BCAB6450()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1BCAB645C()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BCAB6468()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BCAB6474()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1BCAB6480()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1BCAB648C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BCAB6498()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BCAB64A4()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1BCAB64B0()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BCAB64BC()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BCAB64C8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BCAB64D4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BCAB64E0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BCAB64EC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BCAB64F8()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1BCAB6504()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1BCAB6510()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1BCAB651C()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1BCAB6528()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BCAB6534()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BCAB6540()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BCAB654C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BCAB6558()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BCAB6564()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BCAB6570()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1BCAB657C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BCAB6588()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1BCAB6594()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1BCAB65A0()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1BCAB65AC()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1BCAB65B8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BCAB65C4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BCAB65D0()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1BCAB65DC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BCAB65E8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BCAB65F4()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BCAB6600()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1BCAB660C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BCAB6618()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BCAB6624()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BCAB6630()
{
  return MEMORY[0x1E0DECD78]();
}

uint64_t sub_1BCAB663C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BCAB6648()
{
  return MEMORY[0x1E0DECF18]();
}

uint64_t sub_1BCAB6654()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BCAB6660()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1BCAB666C()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1BCAB6678()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1BCAB6684()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1BCAB6690()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1BCAB669C()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1BCAB66A8()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BCAB66B4()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BCAB66C0()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1BCAB66CC()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1BCAB66D8()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BCAB66E4()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BCAB66F0()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1BCAB66FC()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1BCAB6708()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1BCAB6714()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1BCAB6720()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1BCAB672C()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1BCAB6738()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1BCAB6744()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BCAB6750()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1BCAB675C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1BCAB6768()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BCAB6774()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BCAB6780()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1BCAB678C()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1BCAB6798()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BCAB67A4()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BCAB67B0()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1BCAB67BC()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1BCAB67C8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BCAB67D4()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1BCAB67E0()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1BCAB67EC()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1BCAB67F8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BCAB6804()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BCAB6810()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BCAB681C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BCAB6828()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BCAB6834()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BCAB6840()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BCAB684C()
{
  return MEMORY[0x1E0CB2670]();
}

uint64_t sub_1BCAB6858()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1BCAB6864()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BCAB6870()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BCAB687C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BCAB6888()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1BCAB6894()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BCAB68A0()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1BCAB68AC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BCAB68B8()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BCAB68C4()
{
  return MEMORY[0x1E0DEE298]();
}

uint64_t sub_1BCAB68D0()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BCAB68DC()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BCAB68E8()
{
  return MEMORY[0x1E0DEE978]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
  MEMORY[0x1E0C9C350](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x1E0C9C380](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9D520](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t HKAFibBurdenClampedLowerBoundLocalizedString()
{
  return MEMORY[0x1E0D2F3E8]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x1E0D2F400]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x1E0D2F498]();
}

uint64_t HKLocalizedNoDataString()
{
  return MEMORY[0x1E0D2F4A0]();
}

uint64_t HKLocalizedStringWithEnergy()
{
  return MEMORY[0x1E0D2F4B0]();
}

uint64_t HKNumberFormatterFromTemplate()
{
  return MEMORY[0x1E0D2F4C0]();
}

uint64_t HKNumberFormatterWithDecimalPrecision()
{
  return MEMORY[0x1E0D2F4C8]();
}

uint64_t HKRelativeMonthDateYearText()
{
  return MEMORY[0x1E0D2F4D8]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1E0D2F550]();
}

uint64_t HKUILocalizedString()
{
  return MEMORY[0x1E0D2F558]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x1E0D2F590]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HKStatisticOptionsAverageSampleDuration()
{
  return MEMORY[0x1E0CB73C0]();
}

uint64_t _HKStatisticsOptionAttenuateSamples()
{
  return MEMORY[0x1E0CB73C8]();
}

uint64_t _HKStatisticsOptionBaselineRelativeQuantities()
{
  return MEMORY[0x1E0CB73D0]();
}

uint64_t _HKStatisticsOptionPresence()
{
  return MEMORY[0x1E0CB73E0]();
}

uint64_t _HKWorkoutFlooredValueForQuantity()
{
  return MEMORY[0x1E0CB74A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4298](this, a2);
}

void std::domain_error::~domain_error(std::domain_error *this)
{
  MEMORY[0x1E0DE42C0](this);
}

{
  MEMORY[0x1E0DE42C8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4330](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

void std::overflow_error::~overflow_error(std::overflow_error *this)
{
  MEMORY[0x1E0DE4350](this);
}

{
  MEMORY[0x1E0DE4358](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F0]();
}

{
  return MEMORY[0x1E0DE4708]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E7543470(__p);
}

uint64_t operator delete()
{
  return off_1E7543478();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7543480(__sz);
}

uint64_t operator new()
{
  return off_1E7543488();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double asinl(long double a1)
{
  long double result;

  MEMORY[0x1E0C815B8](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double frexp(long double __x, int *__e)
{
  long double result;

  MEMORY[0x1E0C834E8](__e, __x);
  return result;
}

uint64_t health_dispatch_get_current_workloop()
{
  return MEMORY[0x1E0D2A7D8]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log1pl(long double a1)
{
  long double result;

  MEMORY[0x1E0C83BE0](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C850A8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1E0DEEDC0]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
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

